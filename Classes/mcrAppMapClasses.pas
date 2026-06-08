unit mcrAppMapClasses;

interface

uses
  System.SysUtils, System.IOUtils, System.Classes,
  mcrMedBrigadeModel, mcrAppMedBrigadesLogClasses;

const
   MapTemplateFile='data\html\map.html';

type

  TMapController = class(TMedBrigadesLogController)
  private
    FApiKey: string;
  public
    constructor Create(const AApiKey: string);

    function GetMapHtmlContent: string;
    function GetUpdateMarkersJS: string;
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
  LPath := ExtractFilePath(ParamStr(0)) + MapTemplateFile;
  if FileExists(LPath) then
    Result := TFile.ReadAllText(LPath, TEncoding.UTF8).Replace('%YANDEX_API_KEY%', FApiKey)
  else
    Result := '<html><body><h3>Ошибка МИС</h3>Шаблон карты не найден по пути: ' + LPath + '</body></html>';
end;

function TMapController.GetUpdateMarkersJS: string;
var
  LFormat: TFormatSettings;
  Brigade: TMedicalBrigade;
  JSCodeBuilder: TStringBuilder;
begin
  LFormat := TFormatSettings.Create('en-US');
  JSCodeBuilder := TStringBuilder.Create;
  try
    JSCodeBuilder.Append('clearMap(); ');

    if LoadData then
    begin
      for Brigade in BrigadesList do
      begin
        JSCodeBuilder.Append(Format('addBrigade("%d", %s, %s, "Бригада %s | %s (%s)"); ', [
          Brigade.Id,
          FloatToStr(Brigade.Lat, LFormat),
          FloatToStr(Brigade.Lon, LFormat),
          Brigade.BrigadeNumber,
          Brigade.Doctor,
          Brigade.GetStatus
        ]));
      end;
    end;

    Result := JSCodeBuilder.ToString;
  finally
    JSCodeBuilder.Free;
  end;
end;


end.

