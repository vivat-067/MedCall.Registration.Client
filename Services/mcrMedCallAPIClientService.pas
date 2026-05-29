unit mcrMedCallAPIClientService;

interface

uses
  System.SysUtils, System.Classes, System.Net.HttpClient, System.JSON,
  System.Generics.Collections, mcrMedCallModel;


const

  API_BASE_URL = 'http://localhost:5285';
  API_ENDPOINT_CALLS = '/api/MedicalAssistanceCalls';
  HTTP_REQUEST_TIMEOUT = 30000; // 30 секунд

type
  TMedicalCallAPIClient = class
  private
    FBaseURL: string;
    FHTTPClient: THTTPClient;
  public
    constructor Create;
    destructor Destroy; override;

    procedure GetCalls(var CallsList: TObjectList<TMedicalAssistanceCall>);

    function Post(call: TMedicalAssistanceCall): string;
    function Put(call: TMedicalAssistanceCall): string;
    function Delete(call: TMedicalAssistanceCall): string;
  end;

implementation

resourcestring
  rsHTTPError = 'Ошибка загрузки данных: HTTP ';
  rsHTTPSendError = 'Ошибка отправки данных: HTTP ';
  rsCallRegisterDataLoadingError = 'Ошибка при загрузке журнала регистрации вызовов: ';

{ TMedicalCallAPIClient }
constructor TMedicalCallAPIClient.Create;
begin
  inherited Create;
  FBaseURL := API_BASE_URL;
    FHTTPClient := THTTPClient.Create;
    FHTTPClient.ResponseTimeout := HTTP_REQUEST_TIMEOUT;
    FHTTPClient.ConnectionTimeout := HTTP_REQUEST_TIMEOUT;
    FHTTPClient.ContentType := 'application/json';
end;

destructor TMedicalCallAPIClient.Destroy;
begin
  FreeAndNil(FHTTPClient);
  inherited;
end;

procedure TMedicalCallAPIClient.GetCalls(var CallsList: TObjectList<TMedicalAssistanceCall>);
var
  Response: IHTTPResponse;
  JSONValue: TJSONValue;
  JSONArray: TJSONArray;
begin
  CallsList.Clear;
  try
    Response := FHTTPClient.Get(FBaseURL + API_ENDPOINT_CALLS);

    if Response.StatusCode <> 200 then
      raise Exception.Create(rsHTTPError + IntToStr(Response.StatusCode) + ' - ' + Response.StatusText);

    JSONValue := TJSONObject.ParseJSONValue(Response.ContentAsString);
    if not (JSONValue is TJSONArray) then
    begin
      JSONValue.Free;
      Exit;
    end;
    JSONArray := TJSONArray(JSONValue);
    try
      for var i := 0 to JSONArray.Count - 1 do
      begin
        if JSONArray.Items[i] is TJSONObject then
          CallsList.Add(TMedicalAssistanceCall.FromJSON(TJSONObject(JSONArray.Items[i])));
      end;
    finally
      JSONArray.Free;
    end;
  except
    on E: Exception do
      raise Exception.Create(rsCallRegisterDataLoadingError + E.Message);
  end;
end;


// temCreate
function TMedicalCallAPIClient.Post(call: TMedicalAssistanceCall): string;
var
  Response: IHTTPResponse;
  JSONContent: TStringStream;
begin
  Result := '';
  JSONContent := TStringStream.Create(call.ToJSON, TEncoding.UTF8);
  try
    JSONContent.Position := 0;
    Response := FHTTPClient.Post(FBaseURL + API_ENDPOINT_CALLS, JSONContent);
    if Response.StatusCode <> 201 then  // 201 = Created
      Result := rsHTTPError + IntToStr(Response.StatusCode) + ' - ' + Response.StatusText;
  finally
    JSONContent.Free;
  end;
end;

// temUpdate
function TMedicalCallAPIClient.Put(call: TMedicalAssistanceCall): string;
var
  Response: IHTTPResponse;
  JSONContent: TStringStream;
  URL: string;
begin
  Result := '';
  JSONContent := TStringStream.Create(call.ToJSON, TEncoding.UTF8);
  try
    JSONContent.Position := 0;
    URL := FBaseURL + API_ENDPOINT_CALLS + '/' + call.Id.ToString;
    Response := FHTTPClient.Put(URL, JSONContent);
    if Response.StatusCode <> 200 then  // 200 = OK
      Result := rsHTTPError + IntToStr(Response.StatusCode) + ' - ' + Response.StatusText;
  finally
    JSONContent.Free;
  end;
end;

 //temDelete
function TMedicalCallAPIClient.Delete(call: TMedicalAssistanceCall): string;
var
  Response: IHTTPResponse;
  URL: string;
begin
  Result := '';
  try
    URL := FBaseURL + API_ENDPOINT_CALLS + '/' + call.Id.ToString;
    Response := FHTTPClient.Delete(URL);
    if Response.StatusCode <> 204 then  // 204 = No Content
      Result := rsHTTPError + IntToStr(Response.StatusCode) + ' - ' + Response.StatusText;
  except
    on E: Exception do
      Result := E.Message;
  end;
end;



end.

