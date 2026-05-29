unit mcrExceptionLogging;

interface

uses
  System.SysUtils, System.Classes, System.Generics.Collections;

type
  TExInfo = record
    Timestamp: TDateTime;
    Id: Integer;
    Text: string;
    Msg: string;
    DebugInfo: string;
  end;

  TExceptionLogger = class
  private
    FLogList: TList<TExInfo>;
    FIsSaveDBGInfoToFile: Boolean;
    FBaseLogPath: string;

    function GetItem(Index: Integer): TExInfo;
    function GetCount: Integer;
    procedure SaveEntryToFile(const Entry: TExInfo);
  public
    constructor Create(ABasePath: string = '');
    destructor Destroy; override;

    procedure AddEntry(AId: Integer; const AText, AMsg: string; ADebugInfo: string = '');
    procedure Clear;
    procedure DeleteItem(Index: Integer);

    property Count: Integer read GetCount;
    property Items[Index: Integer]: TExInfo read GetItem; default;
  end;

implementation

{ TExceptionLogger }

constructor TExceptionLogger.Create(ABasePath: string = '');
begin
  inherited Create;
  FLogList := TList<TExInfo>.Create;

  FBaseLogPath := ABasePath;
  FIsSaveDBGInfoToFile := (FBaseLogPath <> '');

  if FIsSaveDBGInfoToFile then
  begin
    try
      if not DirectoryExists(FBaseLogPath) then
        ForceDirectories(FBaseLogPath);
    except
      FIsSaveDBGInfoToFile := False;
    end;
  end;
end;

destructor TExceptionLogger.Destroy;
begin
  FLogList.Free;
  inherited;
end;

procedure TExceptionLogger.SaveEntryToFile(const Entry: TExInfo);
var
  StringList: TStringList;
  FileName: string;
begin
  if (Entry.DebugInfo = '') then
    Exit;

  try
    FileName := Format('%s%s_%s.err', [IncludeTrailingPathDelimiter(FBaseLogPath), FormatDateTime('yyyymmdd_hhnnss', Entry.Timestamp), IntToStr(Entry.Id)]);

    StringList := TStringList.Create;
    try
      with StringList do
      begin
        Add('Timestamp: ' + FormatDateTime('dd.mm.yyyy hh:nn:ss.zzz', Entry.Timestamp));
        Add('ID: ' + IntToStr(Entry.Id));
        Add('Error: ' + Entry.Msg);
        Add('----------------------------------------');
        Add(Entry.DebugInfo);
        Add('========================================');
      end;

      StringList.SaveToFile(FileName, TEncoding.UTF8);
    finally
      StringList.Free;
    end;
  except
    on E: Exception do
      Writeln('Error saving debug info to file: ' + E.Message);
  end;
end;

procedure TExceptionLogger.AddEntry(AId: Integer; const AText, AMsg: string; ADebugInfo: string = '');
var
  Entry: TExInfo;
begin
  Entry.Timestamp := Now;
  Entry.Id := AId;
  Entry.Text := AText;
  Entry.Msg := AMsg;
  Entry.DebugInfo := ADebugInfo;

  FLogList.Add(Entry);

  if FIsSaveDBGInfoToFile then
    SaveEntryToFile(Entry);
end;

procedure TExceptionLogger.Clear;
begin
  FLogList.Clear;
end;

function TExceptionLogger.GetCount: Integer;
begin
  Result := FLogList.Count;
end;

function TExceptionLogger.GetItem(Index: Integer): TExInfo;
begin
  if (Index < 0) or (Index >= FLogList.Count) then
    raise EArgumentOutOfRangeException.Create('Err Log Index out of bounds');
  Result := FLogList[Index];
end;

procedure TExceptionLogger.DeleteItem(Index: Integer);
begin
  if (Index >= 0) and (Index < FLogList.Count) then
    FLogList.Delete(Index);
end;

end.

