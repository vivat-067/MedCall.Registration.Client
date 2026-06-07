unit mcrAppMapClasses;

interface

uses
  System.SysUtils, System.IOUtils;

type
  TMapController = class
  private
     FApiKey: string;
  public
    function GetMapHtmlContent: string;      // Возвращает готовый HTML-код страницы со встроенными данными
    function GetUpdateMarkersJS: string;      // Возвращает JS-код для динамического обновления (при получении новых координат)
    constructor Create(const AApiKey: string);
  end;

implementation

{ TMapController }

constructor TMapController.Create(const AApiKey: string);
begin
  inherited Create;
  FApiKey := AApiKey;
end;

function TMapController.GetMapHtmlContent: string;
var
  LTemplatePath: string;
  LHtml: string;
begin
  LTemplatePath := TPath.Combine(ExtractFilePath(ParamStr(0)), 'html\yandex_map.html');

  if TFile.Exists(LTemplatePath) then
  begin
    LHtml := TFile.ReadAllText(LTemplatePath);
    Result := LHtml.Replace('%YANDEX_API_KEY%', FApiKey);
  end
  else
  begin
    Result := '<html><body style="font-family:sans-serif;padding:20px;">' +
              '<h3>Ошибка МИС</h3>Шаблон карты не найден по пути:<br>' +
              LTemplatePath + '</body></html>';
  end;
end;

function TMapController.GetUpdateMarkersJS: string;
var
  FS: TFormatSettings;
begin
  FS := TFormatSettings.Create('en-US');
  Result := 'clearMap(); ' +
            Format('addBrigade("%s", %s, %s, "%s"); ', ['B1', FloatToStr(55.7558, FS), FloatToStr(37.6173, FS), 'Бригада 101 (Реанимация)']) +
            Format('addBrigade("%s", %s, %s, "%s"); ', ['B2', FloatToStr(55.7650, FS), FloatToStr(37.6320, FS), 'Бригада 102 (Линейная)']) +
            Format('addBrigade("%s", %s, %s, "%s"); ', ['B3', FloatToStr(55.7420, FS), FloatToStr(37.5810, FS), 'Бригада 103 (Педиатрия)']);
end;

end.

