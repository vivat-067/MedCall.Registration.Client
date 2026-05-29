unit mcrAppBaseLogClasses;

interface

uses
  System.SysUtils, System.Generics.Collections;

type

  TBaseLogController<T: class> = class
  protected
    FItemsList: TObjectList<T>;
    FStatusesCount: TDictionary<Integer, Integer>;
    property ItemsList: TObjectList<T> read FItemsList;
  public
    property StatusesCount: TDictionary<Integer, Integer> read FStatusesCount;
    procedure RecalculateStatuses; virtual; abstract;
    procedure Clear; virtual;

    function LoadData: Boolean; virtual; abstract;
    function SaveData: Boolean; virtual; abstract;

    constructor Create;
    destructor Destroy; override;
  end;

implementation

{ TBaseLogController<T> }
constructor TBaseLogController<T>.Create;
begin
  inherited Create;
  FItemsList := TObjectList<T>.Create(True);
  FStatusesCount := TDictionary<Integer, Integer>.Create;
end;

destructor TBaseLogController<T>.Destroy;
begin
  FItemsList.Free;
  FStatusesCount.Free;
  inherited;
end;

procedure TBaseLogController<T>.Clear;
begin
  FItemsList.Clear;
  FStatusesCount.Clear;
end;

end.

