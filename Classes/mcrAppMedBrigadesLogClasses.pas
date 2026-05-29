unit mcrAppMedBrigadesLogClasses;

interface

uses
  System.SysUtils, System.Classes, System.Generics.Collections, dxGDIPlusClasses,
  mcrAppBaseLogClasses, mcrMedBrigadeFileService, mcrMedBrigadeModel;

const
  DefaultDataFilePath = 'data\brigades.json';

type

  TMedBrigadesLogController = class(TBaseLogController<TMedicalBrigade>)
  private
    FFileClient: TMedicalBrigadeFileClient;
    FDoctorPictures: TObjectDictionary<Integer, TdxSmartImage>;
    procedure CacheDoctorPictures;
  public
    property BrigadesList: TObjectList<TMedicalBrigade> read FItemsList;
    property BrigadesStatusCount: TDictionary<Integer, Integer> read FStatusesCount;
    property DoctorPictures: TObjectDictionary<Integer, TdxSmartImage> read FDoctorPictures;

    function GetBrigadeById(ID: Integer): TMedicalBrigade;
    function GetBrigadeByNumber(const Number: string): TMedicalBrigade;

    procedure Clear; override;
    procedure RecalculateStatuses; override;

    function LoadData: Boolean; override;
    function SaveData: Boolean; override;

    constructor Create;
    destructor Destroy; override;
  end;

implementation

{ TMedBrigadesLogController }

constructor TMedBrigadesLogController.Create;
begin
  inherited Create;
  FFileClient := TMedicalBrigadeFileClient.Create(DefaultDataFilePath);
  FDoctorPictures := TObjectDictionary<Integer, TdxSmartImage>.Create([doOwnsValues]);
end;

destructor TMedBrigadesLogController.Destroy;
begin
  FFileClient.Free;
  FDoctorPictures.Free;
  inherited;
end;

procedure TMedBrigadesLogController.Clear;
begin
  inherited Clear;
  FDoctorPictures.Clear;
end;

procedure TMedBrigadesLogController.CacheDoctorPictures;
begin
  FDoctorPictures.Clear;
  for var B in FItemsList do
  begin
    if (B.DoctorPhotoPath = '') or not FileExists(B.DoctorPhotoPath) then
      Continue;
    var DxImg := TdxSmartImage.Create;
    try
      DxImg.LoadFromFile(B.DoctorPhotoPath);
      DxImg.HandleNeeded;
      FDoctorPictures.Add(B.Id, DxImg);
    except
      DxImg.Free;
    end;
  end;
end;

procedure TMedBrigadesLogController.RecalculateStatuses;
begin
  FStatusesCount.Clear;
  for var AStatus := Low(TBrigadeStatus) to High(TBrigadeStatus) do
    FStatusesCount.AddOrSetValue(Integer(AStatus), 0);
  FStatusesCount.AddOrSetValue(0, FItemsList.Count);
  for var B in FItemsList do
  begin
    var StatusId := Integer(B.Status);
    var CurrentCount := 0;
    if FStatusesCount.TryGetValue(StatusId, CurrentCount) then
      FStatusesCount.AddOrSetValue(StatusId, CurrentCount + 1);
  end;
end;

function TMedBrigadesLogController.GetBrigadeById(ID: Integer): TMedicalBrigade;
begin
  Result := nil;
  for var B in FItemsList do
    if B.Id = ID then
      Exit(B);
end;

function TMedBrigadesLogController.GetBrigadeByNumber(const Number: string): TMedicalBrigade;
begin
  Result := nil;
  for var B in FItemsList do
    if SameText(B.BrigadeNumber, Number) then
      Exit(B);
end;

function TMedBrigadesLogController.LoadData: Boolean;
begin
  Clear;
  try
    FFileClient.LoadBrigades(FItemsList, '');
    RecalculateStatuses;
    CacheDoctorPictures;
    Result := FItemsList.Count > 0;
  except
    Result := False;
  end;
end;

function TMedBrigadesLogController.SaveData: Boolean;
begin
  try
    FFileClient.SaveBrigades(FItemsList, '');
    Result := True;
  except
    Result := False;
  end;
end;

end.

