unit mcrUtils;

interface

uses
  System.Classes, cxGridCustomTableView, cxGridDBTableView,
  cxGridDBBandedTableView, Vcl.Menus, cxGridBandedTableView, System.Variants,
  System.SysUtils, cxFilterControlDialog, cxGridTableView, cxGridStdPopupMenu,
  cxGridCustomView, Vcl.Controls, cxEdit, cxCustomData, cxGridLevel, dxBar,
  cxSpinEdit, cxMaskEdit, dxPrnPg, Vcl.Graphics, cxDataStorage, cxCheckComboBox,
  cxLookAndFeelPainters, cxGridDBLayoutView, dxGDIPlusClasses, System.IOUtils,
  System.NetEncoding, cxScheduler, cxSchedulerStorage;

procedure GridSetImage(ADataController: TcxCustomDataController; ARecordIndex, AItemIndex: Integer; ASmartImage: TdxSmartImage);

procedure PutFocusedRowInView(AGridView: TcxGridTableView; AResetSelection: Boolean = True); overload;

procedure PutFocusedRowInView(AGridView: TcxGridDBLayoutView; AResetSelection: Boolean = True); overload;

procedure CreateSchedulerEvent(AStorage: TcxCustomSchedulerStorage; AResourceID: Integer;
  const ACaption: string; AStart, AEnd: TDateTime; AColor: TColor);


procedure ScrollToFirstEvent(Scheduler: TcxScheduler);

function WebMapAPIKey:string;

function FileToDataUrl(const AFilePath: string): string;


implementation


{ Утилиты для работы с изображениями в cxGrid }
procedure GridSetImage(ADataController: TcxCustomDataController; ARecordIndex, AItemIndex: Integer; ASmartImage: TdxSmartImage);
var
  Stream: TBytesStream;
begin
  if (ADataController <> nil) and (ASmartImage <> nil) then
  begin
    Stream := TBytesStream.Create;
    try
      ASmartImage.SaveToStream(Stream);
      ADataController.Values[ARecordIndex, AItemIndex] := Stream.Bytes;
    finally
      Stream.Free;
    end;
  end
  else if ADataController <> nil then
  begin
    ADataController.Values[ARecordIndex, AItemIndex] := Null;
  end;
end;


{ Процедуры позиционирования сфокусированной строки }
procedure PutFocusedRowInView(AGridView: TcxGridTableView; AResetSelection: Boolean = True);
var
  wDelta: Integer;
begin
  if AGridView.DataController.FocusedRecordIndex < 0 then
    Exit;
  wDelta := AGridView.ViewInfo.VisibleRecordCount div 2;
  AGridView.Controller.TopRowIndex := AGridView.Controller.FocusedRowIndex - wDelta;
  if AResetSelection then
    AGridView.DataController.CheckFocusedSelected;
end;

procedure PutFocusedRowInView(AGridView: TcxGridDBLayoutView; AResetSelection: Boolean = True);
begin
  if AGridView.DataController.FocusedRecordIndex < 0 then
    Exit;
  AGridView.Controller.FocusedItemIndex := AGridView.DataController.FocusedRecordIndex;
  AGridView.Controller.TopRecordIndex := AGridView.DataController.FocusedRecordIndex;
  if AResetSelection then
    AGridView.DataController.CheckFocusedSelected;
end;


procedure CreateSchedulerEvent(AStorage: TcxCustomSchedulerStorage; AResourceID: Integer;
  const ACaption: string; AStart, AEnd: TDateTime; AColor: TColor);
var
  Event: TcxSchedulerEvent;
begin
  Event := AStorage.CreateEvent;
  Event.Caption := ACaption;
  Event.Start := AStart;
  Event.Finish := AEnd;
  Event.LabelColor := AColor;
  if AResourceID > 0 then
    Event.ResourceID := AResourceID;
  Event.Post;
end;

procedure ScrollToFirstEvent(Scheduler: TcxScheduler);
var
  TargetDate: TDateTime;
begin
  if (Scheduler.Storage <> nil) and (Scheduler.Storage.EventCount > 0) then
    TargetDate := VarToDateTime(Scheduler.Storage.Events[0].Start)
  else
    TargetDate := Date;
  Scheduler.GoToDate(TargetDate);
end;

function WebMapAPIKey:string;
var
  LPath: string;
begin
  Result :='';

  LPath := ExtractFilePath(ParamStr(0)) + 'WebMapAPI.key';

  if FileExists(LPath) then
    Result := TFile.ReadAllText(LPath);

end;


function FileToDataUrl(const AFilePath: string): string;
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


end.

