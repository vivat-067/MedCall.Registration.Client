unit mcrAppMapClasses;

interface

uses
  System.SysUtils, System.IOUtils, Dialogs;

type
  TMapController = class
  private
     FApiKey: string;
  public
    function GetMapHtmlContent: string;
    function GetUpdateMarkersJS: string;

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
  LPath: string;
begin
  LPath := ExtractFilePath(ParamStr(0)) + 'data\html\map.html';

  if FileExists(LPath) then
    Result := TFile.ReadAllText(LPath, TEncoding.UTF8).Replace('%YANDEX_API_KEY%', FApiKey)
  else
    Result := '<html><body><h3>Ошибка МИС</h3>Шаблон карты не найден.</body></html>';
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

