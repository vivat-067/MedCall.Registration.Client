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
  BasePath: string;

  procedure TryAddIcon(AStatus: TBrigadeStatus; const AFileName: string);
  var
    DataUrl: string;
  begin
    DataUrl := FileToDataUrl(BasePath + AFileName);
    if DataUrl <> '' then
      FStatusIcons.Add(AStatus, DataUrl);
  end;

begin
  inherited Create;
  FApiKey := AApiKey;

  FStatusIcons := TDictionary<TBrigadeStatus, string>.Create;
  BasePath := ExtractFilePath(ParamStr(0)) + IconsFolder;

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
  Stream: TMemoryStream;
  Bytes: TBytes;
begin
  Result := '';
  if not FileExists(AFilePath) then Exit;

  Stream := TMemoryStream.Create;
  try
    Stream.LoadFromFile(AFilePath);
    SetLength(Bytes, Stream.Size);
    Stream.Position := 0;
    Stream.ReadBuffer(Bytes, Stream.Size);

    Result := 'data:image/png;base64,' +
              TNetEncoding.Base64.EncodeBytesToString(Bytes)
              .Replace(#13, '', [rfReplaceAll])
              .Replace(#10, '', [rfReplaceAll]);
  finally
    Stream.Free;
  end;
end;

function TMapController.GetIconForStatus(AStatus: TBrigadeStatus): string;
begin
  if not FStatusIcons.TryGetValue(AStatus, Result) then
    Result := '';
end;

function TMapController.GetMapHtmlContent: string;
var
  LPath: string;
begin
  LPath := ExtractFilePath(ParamStr(0)) + MapTemplateFile;
  if FileExists(LPath) then
    Result := TFile.ReadAllText(LPath, TEncoding.UTF8).Replace('%YANDEX_API_KEY%', FApiKey)
  else
    Result := '<html><body><h3>Ошибка МИС</h3>Шаблон карты не найден: ' + LPath + '</body></html>';
end;

function TMapController.GetUpdateMarkersJS: string;
var
  LFormat: TFormatSettings;
  Brigade: TMedicalBrigade;
  JSCodeBuilder: TStringBuilder;
  IconUrl: string;
  EscapedLabel: string;
begin
  LFormat := TFormatSettings.Create('en-US');
  JSCodeBuilder := TStringBuilder.Create;
  try
    JSCodeBuilder.Append('clearMap(); ');
    if LoadData then
    begin
      for Brigade in BrigadesList do
      begin
        IconUrl := GetIconForStatus(Brigade.Status);

        // Формируем текст и безопасно экранируем двойные кавычки для JS-контекста
        EscapedLabel := Format('Бригада %s | %s (%s)', [
          Brigade.BrigadeNumber,
          Brigade.Doctor,
          Brigade.GetStatus
        ]).Replace('"', '\"', [rfReplaceAll]);

        // Передаем строки в двойных кавычках ("%s"), координаты — как числа (%s) без кавычек
        JSCodeBuilder.Append(Format(
          'addBrigade("%d", %s, %s, "%s", "%s"); ',
          [
            Brigade.Id,
            FloatToStr(Brigade.Lat, LFormat),
            FloatToStr(Brigade.Lon, LFormat),
            EscapedLabel,
            IconUrl
          ]
        ));
      end;
    end;
    Result := JSCodeBuilder.ToString;
  finally
    JSCodeBuilder.Free;
  end;
end;

end.

