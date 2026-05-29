unit mcrConverters;

interface

uses
  System.SysUtils, System.DateUtils, System.TimeSpan, System.Variants, System.StrUtils,
  System.JSON, Math;


const
   CRLF = #10#13;

function GetJsonDate(const ISOStr: string): TDateTime;
function GetJsonDateTime(const ISOStr: string): TDateTime;
function GetJsonTime(const TimeStr: string): TDateTime;
function GetJsonTimeSpan(const TimeStr: string): TTimeSpan;
function TimeSpanToValue(const TS: TTimeSpan): string;

function ToJSONDate(Value: TDateTime): TJSONValue;
function ToJSONTime(Value: TDateTime): TJSONValue;
function ToJSONDateTime(Value: TDateTime): TJSONValue;
function ToJSONTimeSpan(Value: TTimeSpan): TJSONValue;
function ToJSONStringOrNull(Value: string): TJSONValue;
function ToJSONFloatOrNull(Value: Double; Decimals: Integer = 2): TJSONValue;

function JSONObjectToJSONString(AObject: TJSONObject; const DefaultValue: string = ''): string;

function XVarToDate(AValue : variant) : TDateTime;
function XVarToDateTime(AValue : variant) : TDateTime;
function XVarToString(AValue : variant) : string;
function XVarToInt(AValue : variant; ADef : integer = -1) : integer;
function XVarToBool(AValue : variant) : boolean;
function XVarTimeToInt(AValue : variant) : integer;
function XVarToDouble(AValue : variant; ADef : integer = 0) : Double;

function XStrToDate(str : string):TDateTime;
function XStrToDateTime(S: string): TDateTime;

function XFormatTime(const Value: TDateTime): string; overload;
function XFormatTime(const Value: TTimeSpan): string; overload;

implementation

// "2026-05-12..." -> 12.05.2026 00:00:00
function GetJsonDate(const ISOStr: string): TDateTime;
begin
  Result := DateOf(GetJsonDateTime(ISOStr));
end;

// "2026-05-12T15:27:00+03:00" -> 12.05.2026 15:27:00 (без секунд)
function GetJsonDateTime(const ISOStr: string): TDateTime;
begin
  if (ISOStr.Length >= 16) and TryISO8601ToDate(ISOStr.Substring(0, 16), Result) then
    Exit
  else
    Result := 0.0;
end;

function GetJsonTime(const TimeStr: string): TDateTime;
var
  Parts: TArray<string>;
  H, M, S: Word;
begin
  Result := 0;
  if TimeStr.IsEmpty then Exit;

  Parts := TimeStr.Split([':']);
  if Length(Parts) >= 2 then
  begin
    H := StrToIntDef(Parts[0], 0);
    M := StrToIntDef(Parts[1], 0);
    if Length(Parts) >= 3 then
      S := StrToIntDef(Parts[2], 0)
    else
      S := 0;
    Result := EncodeTime(H, M, S, 0);
  end;
end;

// "15:19:00" -> TTimeSpan (15 часов, 19 минут, 0 секунд)
function GetJsonTimeSpan(const TimeStr: string): TTimeSpan;
begin
  if (TimeStr.Length >= 5) and TTimeSpan.TryParse(TimeStr.Substring(0, 5), Result) then
    Exit
  else
    Result := TTimeSpan.Zero;
end;

// TTimeSpan в строку "HH:MM"
function TimeSpanToValue(const TS: TTimeSpan): string;
begin
  // Format -> нули для часов и минут (например, "01:48")
  Result := Format('%.2d:%.2d', [Trunc(TS.TotalHours), TS.Minutes]);
end;



function ToJSONDate(Value: TDateTime): TJSONValue;
begin
  if Value = 0 then Exit(TJSONNull.Create);
  Result := TJSONString.Create(DateToISO8601(Value));
end;

function ToJSONTime(Value: TDateTime): TJSONValue;
begin
  if Value = 0 then Exit(TJSONNull.Create);
  Result := TJSONString.Create(FormatDateTime('HH:nn:ss', Value));
end;

function ToJSONDateTime(Value: TDateTime): TJSONValue;
begin
  if Value = 0 then Exit(TJSONNull.Create);
  Result := TJSONString.Create(DateToISO8601(Value));
end;

function ToJSONTimeSpan(Value: TTimeSpan): TJSONValue;
begin
  if Value = TTimeSpan.Zero then Exit(TJSONNull.Create);
  Result := TJSONString.Create(TimeSpanToValue(Value));
end;

function ToJSONStringOrNull(Value: string): TJSONValue;
begin
  if Value = '' then Exit(TJSONNull.Create);
  Result := TJSONString.Create(Value);
end;

function ToJSONFloatOrNull(Value: Double; Decimals: Integer = 2): TJSONValue;
begin
  if Value = 0 then Exit(TJSONNull.Create);
  Result := TJSONNumber.Create(RoundTo(Value, -Decimals));
end;


function JSONObjectToJSONString(AObject: TJSONObject; const DefaultValue: string = ''): string;
var
  JSONObject: TJSONObject;
  JsonString: string;
begin
  Result := DefaultValue;

  if not Assigned(AObject) then
     Exit;

  try
    JSONObject := AObject;
    try
      JsonString := JSONObject.ToString;
      Result := JsonString;
    finally
      JSONObject.Free;
    end;
  except
    on E: Exception do
    begin
      Result := Format('JSON conversion error: %s | Object: %s',
      [E.Message, AObject.ClassName]);
    end;
  end;
end;


function XVarToDate(AValue : variant) : TDateTime;
begin
  Result := XStrToDate(XVarToString(AValue));
end;

function XVarToDateTime(AValue : variant) : TDateTime;
begin
  if not (VarIsNull(AValue) or VarIsEmpty(AValue) or VarIsClear(AValue)) then
     Result := VarToDateTime(AValue)
  else
    Result :=0
end;


function XVarToString(AValue : variant) : string;
begin
  if not (VarIsNull(AValue) or VarIsEmpty(AValue) or VarIsClear(AValue)) then
    result := VarAsType(AValue,varString)
  else
    Result := '';
end;

function XVarToInt64(AValue: variant; ADef: int64 = -1): int64;
begin
  Result := StrToInt64Def(XVarToString(AValue),ADef);
end;

function XVarToInt(AValue : variant;ADef : integer=-1) : integer;
begin
  Result := StrToIntDef(XVarToString(AValue), ADef);
end;

function XVarToBool(AValue : variant) : boolean;
begin
  if not (VarIsNull(AValue) or VarIsEmpty(AValue) or VarIsClear(AValue)) then
    result := VarAsType(AValue, varBoolean)
  else
    Result := False;
end;

function XVarTimeToInt(AValue : variant) : integer;
var
  i : integer;
  s : string;
begin
  try
    s := XVarToString(AValue);
    i := Pos(':',s);
    if i > 0 then
      delete(s,i,1);
    Result := StrToIntDef(s, -1);
  except
    Result := -1;
  end;
end;

function XVarToDouble(AValue : variant; ADef : integer = 0) : Double;
begin
  Result := StrToFloatDef(XVarToString(AValue), ADef);

end;

function XStrToDate(str: string): TDateTime;
begin
  if str = '' then Exit(0.0);
  var Formats := TFormatSettings.Create;
  Formats.DateSeparator := '-';
  Formats.ShortDateFormat := 'yyyy-mm-dd';
  if TryStrToDate(str, Result, Formats) then
    Exit;
  if not TryStrToDate(str, Result) then
    Result := 0.0;
end;
function XStrToDateTime(S: string): TDateTime;
begin
  if S = '' then Exit(0.0);
  if TryStrToDateTime(S, Result) then
    Exit;
  var Formats := TFormatSettings.Create;
  Formats.DateSeparator := '-';
  Formats.TimeSeparator := ':';
  Formats.ShortDateFormat := 'yyyy-mm-dd';
  Formats.LongTimeFormat := 'HH:nn';
  if not TryStrToDateTime(S, Result, Formats) then
    Result := 0.0;
end;


function XFormatTime(const Value: TDateTime): string; overload;
begin
  if Value = 0 then Exit('');
  Result := FormatDateTime('HH:nn', Value);
end;

function XFormatTime(const Value: TTimeSpan): string; overload;
begin
  if Value = TTimeSpan.Zero then Exit('');
  Result := Format('%02d:%02d', [Value.Hours, Value.Minutes]);
end;

end.

