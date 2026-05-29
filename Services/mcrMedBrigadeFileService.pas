unit mcrMedBrigadeFileService;

interface

uses
  System.SysUtils, System.Classes, System.IOUtils, System.JSON, System.StrUtils,
  System.Generics.Collections, mcrMedBrigadeModel;

type
  TMedicalBrigadeFileClient = class
  private
    FDefaultFileName: string;
  public
    constructor Create(const AFileName: string = '');
    destructor Destroy; override;

    procedure LoadBrigades(var BrigadesList: TObjectList<TMedicalBrigade>; const FileName: string = '');
    function SaveBrigades(BrigadesList: TObjectList<TMedicalBrigade> ; const FileName: string = ''): boolean;
  end;

implementation

resourcestring
  rsFileLoadError = 'Ошибка загрузки данных из файла: ';
  rsBrigadeDataLoadingError = 'Ошибка при загрузке списка бригад: ';

{ TMedicalBrigadeFileClient }

constructor TMedicalBrigadeFileClient.Create(const AFileName: string = '');
begin
  inherited Create;
  FDefaultFileName := IfThen(AFileName = '', 'data\brigades.json', AFileName);
end;

destructor TMedicalBrigadeFileClient.Destroy;
begin
  inherited;
end;

procedure TMedicalBrigadeFileClient.LoadBrigades(var BrigadesList: TObjectList<TMedicalBrigade>; const FileName: string = '');
var
  JSONValue: TJSONValue;
  JSONArray: TJSONArray;
  LoadFile: string;
begin
  BrigadesList.Clear;
  LoadFile := IfThen(FileName = '', FDefaultFileName, FileName);

  try
    if not FileExists(LoadFile) then
      raise Exception.Create(rsFileLoadError + 'Файл не найден: ' + LoadFile);

    JSONValue := TJSONObject.ParseJSONValue(TFile.ReadAllText(LoadFile, TEncoding.UTF8));
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
          BrigadesList.Add(TMedicalBrigade.FromJSON(TJSONObject(JSONArray.Items[i])));
      end;
    finally
      JSONArray.Free;
    end;
  except
    on E: Exception do
      raise Exception.Create(rsBrigadeDataLoadingError + E.Message);
  end;
end;

function TMedicalBrigadeFileClient.SaveBrigades(
  BrigadesList: TObjectList<TMedicalBrigade>; const FileName: string): boolean;
begin
   Result:=True;
end;

end.
