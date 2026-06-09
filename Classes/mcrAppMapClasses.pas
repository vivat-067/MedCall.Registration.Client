unit mcrAppMapClasses;

interface

uses
  System.SysUtils, System.IOUtils, System.Classes, System.NetEncoding,
  System.Generics.Collections, mcrMedBrigadeModel, mcrAppMedBrigadesLogClasses;

const
  MapTemplateFile = 'data\html\map.html';
  IconsFolder = 'data\icons\';

type
  TMapController = class(TMedBrigadesLogController)
  private
    FApiKey: string;
    FStatusIcons: TDictionary<TBrigadeStatus, string>;
    function FileToDataUrl(const AFilePath: string): string;
    function GetIconForStatus(AStatus: TBrigadeStatus): string;
  public
    constructor Create(const AApiKey: string);
    destructor Destroy; override;
    function GetMapHtmlContent: string;
    function GetUpdateMarkersJS: string;
  end;

implementation

{ TMapController }

constructor TMapController.Create(const AApiKey: string);
var
  basePath: string;

  procedure TryAddIcon(AStatus: TBrigadeStatus; const AFileName: string);
  var
    dataUrl: string;
  begin
    dataUrl := FileToDataUrl(basePath + AFileName);
    if dataUrl <> '' then
      FStatusIcons.Add(AStatus, dataUrl);
  end;

begin
  inherited Create;
  FApiKey := AApiKey;
  FStatusIcons := TDictionary<TBrigadeStatus, string>.Create;
  basePath := ExtractFilePath(ParamStr(0)) + IconsFolder;
  TryAddIcon(bsAvailable, '01.png');
  TryAddIcon(bsConfirming, '02.png');
  TryAddIcon(bsArrived, '03.png');
  TryAddIcon(bsWorking, '04.png');
  TryAddIcon(bsNoConnection, '05.png');
end;

destructor TMapController.Destroy;
begin
  FStatusIcons.Free;
  inherited;
end;

function TMapController.FileToDataUrl(const AFilePath: string): string;
var
  stream: TMemoryStream;
  bytes: TBytes;
begin
  Result := '';
  if not FileExists(AFilePath) then
    Exit;
  stream := TMemoryStream.Create;
  try
    stream.LoadFromFile(AFilePath);
    SetLength(bytes, stream.Size);
    stream.Position := 0;
    stream.ReadBuffer(bytes, stream.Size);
    Result := 'data:image/png;base64,' + TNetEncoding.Base64.EncodeBytesToString(bytes).Replace(#13, '', [rfReplaceAll]).Replace(#10, '', [rfReplaceAll]);
  finally
    stream.Free;
  end;
end;

function TMapController.GetIconForStatus(AStatus: TBrigadeStatus): string;
begin
  if not FStatusIcons.TryGetValue(AStatus, Result) then
    Result := '';
end;

function TMapController.GetMapHtmlContent: string;
var
  mapPath: string;
begin
  mapPath := ExtractFilePath(ParamStr(0)) + MapTemplateFile;
  if FileExists(mapPath) then
    Result := TFile.ReadAllText(mapPath, TEncoding.UTF8).Replace('%YANDEX_API_KEY%', FApiKey)
  else
    Result := '<html><body><h3>Ошибка МИС</h3>Шаблон карты не найден: ' + mapPath + '</body></html>';
end;

function TMapController.GetUpdateMarkersJS: string;
var
  formatSettings: TFormatSettings;
  brigade: TMedicalBrigade;
  jsCodeBuilder: TStringBuilder;
  iconUrl: string;
  escapedLabel: string;
begin
  formatSettings := TFormatSettings.Create('en-US');
  jsCodeBuilder := TStringBuilder.Create;
  try
    jsCodeBuilder.Append('clearMap(); ');
    if LoadData then
    begin
      for brigade in BrigadesList do
      begin
        iconUrl := GetIconForStatus(brigade.Status);
         escapedLabel := Format('Бригада %s | %s (%s)', [brigade.BrigadeNumber, brigade.Doctor, brigade.GetStatus]).Replace('"', '\"', [rfReplaceAll]);
        jsCodeBuilder.Append(Format('addBrigade("%d", %s, %s, "%s", "%s"); ', [brigade.Id, FloatToStr(brigade.Lat, formatSettings), FloatToStr(brigade.Lon, formatSettings), escapedLabel, iconUrl]));
      end;
    end;
    Result := jsCodeBuilder.ToString;
  finally
    jsCodeBuilder.Free;
  end;
end;

end.

