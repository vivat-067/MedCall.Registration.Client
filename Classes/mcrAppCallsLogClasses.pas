unit mcrAppCallsLogClasses;

interface

uses
  System.SysUtils, System.Classes, System.Generics.Collections, system.StrUtils,
  Vcl.Dialogs, mcrAppShared, mcrAppBaseLogClasses, mcrMedCallAPIClientService,
  mcrMedCallModel, mcrExceptionLogging;

type

  TCallsLogController = class(TBaseLogController<TMedicalAssistanceCall>)
  private
    FAPIClient: TMedicalCallAPIClient;
    FExceptionLogger: TExceptionLogger;
    FisDataModified: Boolean;
    function UploadData: Boolean;
  public
    property CallsList: TObjectList<TMedicalAssistanceCall> read FItemsList;
    property CallsStatusCount: TDictionary<Integer, Integer> read FStatusesCount;
    property isDataModified: Boolean read FisDataModified;

    function GetCallByIndex(Index: Integer): TMedicalAssistanceCall;
    function GetCallById(ID: Integer): TMedicalAssistanceCall;

    procedure SetCallModified(ACall: TMedicalAssistanceCall);
    procedure SetCallDeleted(ACall: TMedicalAssistanceCall);
    procedure ResetDataModified;

    procedure Clear; override;
    procedure RecalculateStatuses; override;

    function LoadData: Boolean; override;
    function SaveData: Boolean; override;

    constructor Create;
    destructor Destroy; override;
  end;

implementation



{ TCallsLogController }

constructor TCallsLogController.Create;
begin
  inherited Create;
  FAPIClient := TMedicalCallAPIClient.Create;
  FExceptionLogger := TExceptionLogger.Create(IfThen(True, 'W:\zwrk\apidbg\', ''));
  FisDataModified := False;
end;

destructor TCallsLogController.Destroy;
begin
  FAPIClient.Free;
  FExceptionLogger.Free;
  inherited;
end;

procedure TCallsLogController.Clear;
begin
  inherited Clear;
  ResetDataModified;
end;

function TCallsLogController.GetCallById(ID: Integer): TMedicalAssistanceCall;
begin
  Result := nil;
  for var Call in FItemsList do
    if Call.Id = ID then
      Exit(Call);
end;

function TCallsLogController.GetCallByIndex(Index: Integer): TMedicalAssistanceCall;
begin
  Result := nil;
  if (Index >= 0) and (Index < FItemsList.Count) then
    Result := FItemsList[Index];
end;

procedure TCallsLogController.RecalculateStatuses;
begin
  FStatusesCount.Clear;
  for var AStatus := Low(TCallStatus) to High(TCallStatus) do
    FStatusesCount.Add(Integer(AStatus), 0);
  FStatusesCount.AddOrSetValue(0, FItemsList.Count);
  for var Call in FItemsList do
  begin
    var StatusId := Integer(Call.StatusId);
    var CurrentCount := 0;
    if FStatusesCount.TryGetValue(StatusId, CurrentCount) then
      FStatusesCount.AddOrSetValue(StatusId, CurrentCount + 1);
  end;
end;

procedure TCallsLogController.ResetDataModified;
begin
  FisDataModified := False;
end;

procedure TCallsLogController.SetCallDeleted(ACall: TMedicalAssistanceCall);
begin
  ACall.TEM := temDelete;
  FisDataModified := True;
end;

procedure TCallsLogController.SetCallModified(ACall: TMedicalAssistanceCall);
begin
  if not (ACall.TEM in [temCreate, temDelete]) then
  begin
    ACall.TEM := temUpdate;
    FisDataModified := True;
  end;
end;

function TCallsLogController.LoadData: Boolean;
begin
  Clear;
  FAPIClient.GetCalls(FItemsList);
  RecalculateStatuses;
  Result := FItemsList.Count > 0;
end;

function TCallsLogController.SaveData: Boolean;
begin
  Result := UploadData;
  if Result then
    ResetDataModified;
end;

function TCallsLogController.UploadData: Boolean;
var
  errStatus: string;
begin
  Result := True;
  for var call in FItemsList do
  begin
    case call.TEM of
      temCreate:
        errStatus := FAPIClient.Post(call);
      temUpdate:
        errStatus := FAPIClient.Put(call);
      temDelete:
        errStatus := FAPIClient.Delete(call);
      temNone:
        Continue;
    end;
    if errStatus <> '' then
    begin
      Result := False;
      FExceptionLogger.AddEntry(call.Id, Format('Upload Error (%s)', [ConvertTEM2APIMethodName(call.TEM)]), errStatus, call.ToJSON);
    end
    else
      call.TEM := temNone;
  end;
  if not Result then
    ShowMessage('Ошибки загрузки данных на сервер. Ошибок: ' + FExceptionLogger.Count.ToString);
end;

end.

