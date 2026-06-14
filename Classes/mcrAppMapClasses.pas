unit mcrAppMapClasses;

interface

uses
  System.SysUtils, System.IOUtils, System.Classes,
  System.Generics.Collections, mcrMedBrigadeModel, mcrAppMedBrigadesLogClasses;

const
  MapTemplateFile = 'data\html\map.html';
  IconsFolder = 'data\icons\';

type
  TMapController = class(TMedBrigadesLogController)
  private
    FApiKey: string;
    FStatusIcons: TDictionary<TBrigadeStatus, string>;
    FStatusFilter: TBrigadeStatuses;
    function GetIconForStatus(AStatus: TBrigadeStatus): string;

  public
    procedure ToggleStatusFilter(AStatus: TBrigadeStatus; AVisible: Boolean);

    function GetMapHtmlContent: string;
    function GetUpdateBrigadeMarkersJS: string;
    function GetUpdateStationMarkersJS: string;

    constructor Create(const AApiKey: string);
    destructor Destroy; override;
  end;

implementation

{ TMapController }

uses
  mcrUtils;


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

  //Значки маркеров по состояниям
  TryAddIcon(bsAvailable, '01.png');
  TryAddIcon(bsConfirming, '02.png');
  TryAddIcon(bsArrived, '03.png');
  TryAddIcon(bsWorking, '04.png');
  TryAddIcon(bsNoConnection, '05.png');

   FStatusFilter := [];
   for var status := Low(TBrigadeStatus) to High(TBrigadeStatus) do
    Include(FStatusFilter, status)

end;

destructor TMapController.Destroy;
begin
  FStatusIcons.Free;
  inherited;
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

function TMapController.GetUpdateBrigadeMarkersJS: string;
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
    jsCodeBuilder.Append('clearBrigades();');

    if Assigned(BrigadesList) then
    begin
      for brigade in BrigadesList do
      begin
        if not (brigade.Status in FStatusFilter) then  //Filter by Status
           Continue;

        iconUrl := GetIconForStatus(brigade.Status);
        escapedLabel := Format('Бригада %s | %s (%s)', [brigade.BrigadeNumber, brigade.Doctor, brigade.GetStatus]).Replace('"', '\"', [rfReplaceAll]);
        jsCodeBuilder.Append(Format('addBrigade("%d", %s, %s, "%s", "%s"); ',
                            [brigade.Id,
                             FloatToStr(brigade.Lat, formatSettings),
                             FloatToStr(brigade.Lon, formatSettings),
                             escapedLabel,
                             iconUrl]));
      end;
    end;
    Result := jsCodeBuilder.ToString;
  finally
    jsCodeBuilder.Free;
  end;
end;

function TMapController.GetUpdateStationMarkersJS: string;
var
  formatSettings: TFormatSettings;
  jsCodeBuilder: TStringBuilder;
  escapedLabel: string;
  stationIconUrl: string;
begin
  formatSettings := TFormatSettings.Create('en-US');
  jsCodeBuilder := TStringBuilder.Create;
  try
    jsCodeBuilder.Append('clearStations(); ');
    escapedLabel := 'Подстанция СМП №24'.Replace('"', '\"', [rfReplaceAll]);

    jsCodeBuilder.Append(Format('addStation(%d, %s, %s, "%s", "%s"); ',
      [
        1,                                            // ID станции
        FloatToStr(55.7900, formatSettings),          // Широта
        FloatToStr(37.5200, formatSettings),          // Долгота
        escapedLabel,                                 // Название
        stationIconUrl                                // Иконка (data:URL)
      ]));

    Result := jsCodeBuilder.ToString;
  finally
    jsCodeBuilder.Free;
  end;
end;
procedure TMapController.ToggleStatusFilter(AStatus: TBrigadeStatus; AVisible: Boolean);
begin
  if AVisible then
    Include(FStatusFilter, AStatus)
  else
    Exclude(FStatusFilter, AStatus);
end;

end.

