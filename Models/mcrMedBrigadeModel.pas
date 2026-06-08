unit mcrMedBrigadeModel;

interface

uses
  System.SysUtils, System.Classes, System.JSON, System.IOUtils,
  Vcl.Graphics, Vcl.Imaging.pngimage;

type
  TBrigadeStatus = (bsAvailable=1, bsConfirming, bsArrived, bsWorking, bsNoConnection);

  TMedicalBrigade = class
  private
    FId: Integer;
    FBrigadeNumber: string;
    FDoctor: string;
    FParamedic: string;
    FDriver: string;
    FStatus: TBrigadeStatus;
    FComment: string;
    FDoctorPhotoPath: string;
    FCommPhone1: string;
    FCommPhone2: string;
    FLat: Double;
    FLon: Double;
    procedure SetBrigadeNumber(const Value: string);
    procedure SetDoctorPhotoPath(const Value: string);
    procedure SetCommPhone1(const Value: string);
    procedure SetCommPhone2(const Value: string);
  published
    property Id: Integer read FId write FId;
    property BrigadeNumber: string read FBrigadeNumber write SetBrigadeNumber;

    property Doctor: string read FDoctor write FDoctor;
    property Paramedic: string read FParamedic write FParamedic;
    property Driver: string read FDriver write FDriver;
    property Status: TBrigadeStatus read FStatus write FStatus;
    property Comment: string read FComment write FComment;
    property DoctorPhotoPath: string read FDoctorPhotoPath write SetDoctorPhotoPath;
    property CommPhone1: string read FCommPhone1 write SetCommPhone1;
    property CommPhone2: string read FCommPhone2 write SetCommPhone2;

    property Lat: Double read FLat write FLat;
    property Lon: Double read FLon write FLon;
  public
    procedure LoadDoctorPhoto(const AFilePath: string);
    procedure AssignPhotoToPicture(APicture: TPicture);
    function GetStatus: string;

    class function FromJSON(const JSONObject: TJSONObject): TMedicalBrigade;
    function ToJSON: string;

    constructor Create;
  end;

implementation

uses
  mcrConverters;

const
  BrigadeStatusStrings: array[TBrigadeStatus] of string = ('Свободна',
    'Подтверждение вызова',
    'Прибыла',
    'В работе',
    'Без связи'
    );


constructor TMedicalBrigade.Create;
begin
  inherited;
  FId := 0;
  FStatus := bsAvailable;
  FLat := 0.0;
  FLon := 0.0;
end;

procedure TMedicalBrigade.SetBrigadeNumber(const Value: string);
begin
  FBrigadeNumber := Value;
end;

procedure TMedicalBrigade.SetDoctorPhotoPath(const Value: string);
begin
  FDoctorPhotoPath := Value;
end;

procedure TMedicalBrigade.SetCommPhone1(const Value: string);
begin
  FCommPhone1 := Value;
end;

procedure TMedicalBrigade.SetCommPhone2(const Value: string);
begin
  FCommPhone2 := Value;
end;

procedure TMedicalBrigade.LoadDoctorPhoto(const AFilePath: string);
begin
  if FileExists(AFilePath) then
    FDoctorPhotoPath := AFilePath
  else
    FDoctorPhotoPath := '';
end;

procedure TMedicalBrigade.AssignPhotoToPicture(APicture: TPicture);
begin
  if not Assigned(APicture) then Exit;

  APicture.Graphic := nil;
  if (FDoctorPhotoPath <> '') and FileExists(FDoctorPhotoPath) then
  begin
    try
      APicture.LoadFromFile(FDoctorPhotoPath);
    except
      APicture.Graphic := nil;
    end;
  end;
end;

function TMedicalBrigade.ToJSON: string;
var
  JSONObject: TJSONObject;
begin
  JSONObject := TJSONObject.Create;
  try
    {$REGION 'ОСНОВНЫЕ ПОЛЯ'}
    JSONObject.AddPair('id', TJSONNumber.Create(FId));
    JSONObject.AddPair('status', TJSONNumber.Create(Ord(FStatus)));
    {$ENDREGION}

    {$REGION 'СОСТАВ БРИГАДЫ'}
    JSONObject.AddPair('brigadeNumber', FBrigadeNumber);
    JSONObject.AddPair('doctor', ToJSONStringOrNull(FDoctor));
    JSONObject.AddPair('paramedic', ToJSONStringOrNull(FParamedic));
    JSONObject.AddPair('driver', ToJSONStringOrNull(FDriver));
    {$ENDREGION}

    {$REGION 'КОНТАКТЫ'}
    JSONObject.AddPair('commPhone1', ToJSONStringOrNull(FCommPhone1));
    JSONObject.AddPair('commPhone2', ToJSONStringOrNull(FCommPhone2));
    {$ENDREGION}

    {$REGION 'ФОТО ДОКТОРА'}
    JSONObject.AddPair('doctorPhotoPath', ToJSONStringOrNull(FDoctorPhotoPath));
    {$ENDREGION}

    {$REGION 'ДОПОЛНИТЕЛЬНО'}
    JSONObject.AddPair('comment', ToJSONStringOrNull(FComment));
    {$ENDREGION}

    {$REGION 'ГЕО-КООРДИНАТЫ КАРТЫ'}
    JSONObject.AddPair('lat', TJSONNumber.Create(FLat));
    JSONObject.AddPair('lon', TJSONNumber.Create(FLon));
    {$ENDREGION}

    Result := JSONObject.ToJSON;
  finally
    JSONObject.Free;
  end;
end;

class function TMedicalBrigade.FromJSON(const JSONObject: TJSONObject): TMedicalBrigade;
begin
  Result := TMedicalBrigade.Create;
  if JSONObject = nil then Exit;

  try
    {$REGION 'ОСНОВНЫЕ ПОЛЯ'}
    Result.FId := StrToIntDef(JSONObject.GetValue<string>('id', '0'), 0);
    Result.FStatus := TBrigadeStatus(StrToIntDef(JSONObject.GetValue<string>('status', '0'), 0));
    {$ENDREGION}

    {$REGION 'СОСТАВ БРИГАДЫ'}
    Result.FBrigadeNumber := JSONObject.GetValue<string>('brigadeNumber', '');
    Result.FDoctor := JSONObject.GetValue<string>('doctor', '');
    Result.FParamedic := JSONObject.GetValue<string>('paramedic', '');
    Result.FDriver := JSONObject.GetValue<string>('driver', '');
    {$ENDREGION}

    {$REGION 'КОНТАКТЫ'}
    Result.FCommPhone1 := JSONObject.GetValue<string>('commPhone1', '');
    Result.FCommPhone2 := JSONObject.GetValue<string>('commPhone2', '');
    {$ENDREGION}

    {$REGION 'ФОТО ДОКТОРА'}
    Result.FDoctorPhotoPath := JSONObject.GetValue<string>('doctorPhotoPath', '');
    {$ENDREGION}

    {$REGION 'ДОПОЛНИТЕЛЬНО'}
    Result.FComment := JSONObject.GetValue<string>('comment', '');
    {$ENDREGION}

    {$REGION 'ГЕО-КООРДИНАТЫ КАРТЫ'}

    Result.FLat := JSONObject.GetValue<Double>('lat', 0.0);
    Result.FLon := JSONObject.GetValue<Double>('lon', 0.0);
    {$ENDREGION}
  except
    Result.Free;
    raise;
  end;
end;

function TMedicalBrigade.GetStatus: string;
begin
    Result := BrigadeStatusStrings[FStatus];
end;

end.

