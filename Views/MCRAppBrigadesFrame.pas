unit MCRAppBrigadesFrame;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, dxLayoutcxEditAdapters, dxLayoutContainer, cxClasses,
  cxTextEdit, cxMaskEdit, cxButtonEdit, dxLayoutControl, cxStyles, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxNavigator, DB, cxDBData, ImgList,
  dxCustomTileControl, cxGridLevel, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, dxTileControl, cxImage, cxMemo,
  cxGridViewLayoutContainer, cxGridLayoutView, cxGridDBLayoutView,
  cxGridCustomLayoutView, dxLayoutControlAdapters, Menus, StdCtrls, cxButtons,
  dxCore, dxGDIPlusClasses, cxGroupBox, cxImageList, dxUIAClasses, dxDateRanges,
  dxScrollbarAnnotations, System.ImageList, MCRAppBaseFrame, mcrResourcesDM,
  cxScheduler, cxSchedulerStorage, DateUtils, cxSchedulerCustomControls,
  cxSchedulerCustomResourceView, cxSchedulerDayView, cxSchedulerAgendaView,
  cxSchedulerDateNavigator, cxSchedulerHolidays, cxSchedulerTimeGridView,
  cxSchedulerUtils, cxSchedulerWeekView, cxSchedulerYearView,
  cxSchedulerGanttView, cxSchedulerRecurrence, dxBarBuiltInMenu,
  cxSchedulerRibbonStyleEventEditor, cxSchedulerTreeListBrowser, Vcl.ExtCtrls,
  mcrAppMedBrigadesLogClasses, mcrMedBrigadeModel, System.Actions, Vcl.ActnList;

type
  TfraBrigades = class(TfraBase)
    ilEmployees: TcxImageList;
    tcStatus: TdxTileControl;
    dxLayoutItem2: TdxLayoutItem;
    dxTileControl1Group1: TdxTileControlGroup;
    tiAll: TdxTileControlItem;
    tiWorking: TdxTileControlItem;
    tiAvailable: TdxTileControlItem;
    tiPendingCfm: TdxTileControlItem;
    tiOutOfConnection: TdxTileControlItem;
    tiArrived: TdxTileControlItem;
    gvMedicalBrigades: TcxGridLayoutView;
    grBrigadesLevel1: TcxGridLevel;
    grBrigades: TcxGrid;
    dxLayoutItem3: TdxLayoutItem;
    gliDoctor: TcxGridLayoutViewItem;
    gliPicture: TcxGridLayoutViewItem;
    gliComment: TcxGridLayoutViewItem;
    gliPhone: TcxGridLayoutViewItem;
    gliPhone2: TcxGridLayoutViewItem;
    dxLayoutItem1: TdxLayoutItem;
    btnSortAsc: TcxButton;
    dxLayoutItem7: TdxLayoutItem;
    btnSortDesc: TcxButton;
    dxLayoutSeparatorItem2: TdxLayoutSeparatorItem;
    dxLayoutItem8: TdxLayoutItem;
    btnEdit: TcxButton;
    dxLayoutGroup1: TdxLayoutGroup;
    dxLayoutItem4: TdxLayoutItem;
    Scheduler: TcxScheduler;
    pnlControls: TPanel;
    Memo1: TMemo;
    Storage1: TcxSchedulerStorage;
    dxLayoutItem5: TdxLayoutItem;
    btnLoadData: TcxButton;
    dxLayoutSeparatorItem1: TdxLayoutSeparatorItem;
    ActionList1: TActionList;
    acFileLoadData: TAction;
    acEdit: TAction;
    acPrint: TAction;
    gvMedicalBrigadesLayoutItem2: TcxGridLayoutItem;
    gliBrigadeNr: TcxGridLayoutViewItem;
    gvMedicalBrigadesAutoCreatedGroup1: TdxLayoutAutoCreatedGroup;
    gvMedicalBrigadesLayoutItem3: TcxGridLayoutItem;
    gliParamedic: TcxGridLayoutViewItem;
    gvMedicalBrigadesLayoutItem5: TcxGridLayoutItem;
    gliDriver: TcxGridLayoutViewItem;
    gvMedicalBrigadesLayoutItem6: TcxGridLayoutItem;
    gliStatus: TcxGridLayoutViewItem;
    gvMedicalBrigadesAutoCreatedGroup2: TdxLayoutAutoCreatedGroup;
    gvMedicalBrigadesLayoutItem9: TcxGridLayoutItem;
    gliBrigadeID: TcxGridLayoutViewItem;
    gvMedicalBrigadesLayoutItem10: TcxGridLayoutItem;
    gliTEM: TcxGridLayoutViewItem;
    dxLayoutItem6: TdxLayoutItem;
    cxButton1: TcxButton;
    dxLayoutItem9: TdxLayoutItem;
    cxButton2: TcxButton;
    dxLayoutSeparatorItem3: TdxLayoutSeparatorItem;
    dxLayoutSplitterItem1: TdxLayoutSplitterItem;
    asStatusAssign: TAction;
    asRequestCancel: TAction;
    dxLayoutSplitterItem2: TdxLayoutSplitterItem;
    procedure tiStatusFilterClick(Sender: TdxTileControlItem);
    procedure acFileLoadDataExecute(Sender: TObject);
    procedure acFileLoadDataUpdate(Sender: TObject);
    procedure acEditExecute(Sender: TObject);
    procedure acEditUpdate(Sender: TObject);
    procedure gvMedicalBrigadesFocusedRecordChanged(Sender: TcxCustomGridTableView; APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
    procedure btnSortAscClick(Sender: TObject);
    procedure btnSortDescClick(Sender: TObject);
    procedure asStatusAssignExecute(Sender: TObject);
    procedure asStatusAssignUpdate(Sender: TObject);
    procedure asRequestCancelExecute(Sender: TObject);
    procedure asRequestCancelUpdate(Sender: TObject);
    procedure gvMedicalBrigadesDblClick(Sender: TObject);
  private
    FisLoaded: Boolean;
    FCurrentBrigadeID: Integer;
    FMedBrigadesController: TMedBrigadesLogController;
    procedure ApplyStatusFilter(ATag: Integer);
    procedure SortByBrigadeNumber(ASortOrder: TcxGridSortOrder);

    procedure FillOverviewGrid(ATag: integer = 0);
    procedure FillDetailsPanel(ABrigadeID: Integer);
    procedure ClearDetailsPanel;

    procedure ShowLogEntryEditor;

    procedure DoAfterActivate; override;
    procedure RefreshInfo; override;
    procedure Reload;

  public
    procedure Init; override;
    procedure Done; override;
  end;

implementation

uses
  mcrUtils, mcrConverters, mcrBrigadesCallsTimeLineTestData;


{$R *.dfm}

resourcestring
  rsDisplayEntryEditor = 'Отображение редактора данных бригады %s и графика дежурств';

procedure TfraBrigades.Init;
begin
  inherited;
  FisLoaded := False;
  FMedBrigadesController := TMedBrigadesLogController.Create;
end;


procedure TfraBrigades.Done;
begin
  FreeAndNil(FMedBrigadesController);
  inherited;
end;

procedure TfraBrigades.DoAfterActivate;
begin
  inherited DoAfterActivate;
  if ActivatingCount = 1 then
    gvMedicalBrigades.Controller.GoToFirst;
  if tcStatus.Controller.FocusedItem = nil then
    tcStatus.Controller.FocusedItem := tiAll;
end;

procedure TfraBrigades.RefreshInfo;
begin
  inherited;
  if FisLoaded then
  begin
    FMedBrigadesController.RecalculateStatuses;

    tiAll.Text2.Value := FMedBrigadesController.BrigadesStatusCount[tiAll.Tag].ToString;
    tiAvailable.Text2.Value := FMedBrigadesController.BrigadesStatusCount[tiAvailable.Tag].ToString;
    tiPendingCfm.Text2.Value := FMedBrigadesController.BrigadesStatusCount[tiPendingCfm.Tag].ToString;
    tiWorking.Text2.Value := FMedBrigadesController.BrigadesStatusCount[tiWorking.Tag].ToString;
    tiArrived.Text2.Value := FMedBrigadesController.BrigadesStatusCount[tiArrived.Tag].ToString;
    tiOutOfConnection.Text2.Value := FMedBrigadesController.BrigadesStatusCount[tiOutOfConnection.Tag].ToString;
  end;
end;

procedure TfraBrigades.Reload;
begin
  if tcStatus.Controller.FocusedItem <> nil then
    ApplyStatusFilter(tcStatus.Controller.FocusedItem.Tag);
end;

procedure TfraBrigades.ShowLogEntryEditor;
begin
  var brigade := FMedBrigadesController.GetBrigadeById(FCurrentBrigadeID);
  if assigned(brigade) then
  begin
    ShowMessage(Format(rsDisplayEntryEditor, [brigade.BrigadeNumber]));
  end;
end;

procedure TfraBrigades.SortByBrigadeNumber(ASortOrder: TcxGridSortOrder);
begin
  with gvMedicalBrigades.DataController do
  begin
//    ClearSorting(True);
    gliBrigadeId.SortOrder := ASortOrder;
    gliBrigadeId.SortIndex := 0;

    if RecordCount > 0 then
      FocusedRowIndex := 0;
  end;
end;

procedure TfraBrigades.FillOverviewGrid(ATag: integer);
var
  Brigade: TMedicalBrigade;
  r: Integer;
  DxImg: TdxSmartImage;
begin
  with gvMedicalBrigades.DataController do
  try
    gvMedicalBrigades.DataController.RecordCount := 0;

    gvMedicalBrigades.BeginUpdate;
    for Brigade in FMedBrigadesController.BrigadesList do
    begin
      if (ATag > 0) and (Integer(Brigade.Status) <> ATag) then
        Continue;

      r := AppendRecord;

      Values[r, gliBrigadeNr.Index] := Brigade.BrigadeNumber;
      Values[r, gliStatus.Index] := Brigade.GetStatus;

      if FMedBrigadesController.DoctorPictures.TryGetValue(Brigade.Id, DxImg) then
        GridSetImage(gvMedicalBrigades.DataController, r, gliPicture.Index, DxImg)
      else
        Values[r, gliPicture.Index] := Null;

      Values[r, gliDoctor.Index] := Brigade.Doctor;
      Values[r, gliComment.Index] := Brigade.Comment;
      Values[r, gliPhone.Index] := Brigade.CommPhone1;
      Values[r, gliPhone2.Index] := Brigade.CommPhone2;
      Values[r, gliParamedic.Index] := Brigade.Paramedic;
      Values[r, gliDriver.Index] := Brigade.Driver;
      Values[r, gliBrigadeID.Index] := Brigade.ID;
 //     Values[r, gliBrigadeID.Index] := integer(Brigade.TEM);          // Transaction Edit Mode

    end;
  finally
    gvMedicalBrigades.EndUpdate;
  end;

  if gvMedicalBrigades.DataController.RecordCount > 0 then
  begin
    gvMedicalBrigades.DataController.FocusedRowIndex := 0;
  //  gvMedicalBrigades.Controller.FocusedRow.Selected := True;
  end;

  RefreshInfo;
end;

procedure TfraBrigades.gvMedicalBrigadesDblClick(Sender: TObject);
begin
  inherited;
  btnEdit.Click;
end;

procedure TfraBrigades.gvMedicalBrigadesFocusedRecordChanged(Sender: TcxCustomGridTableView; APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
begin
  FCurrentBrigadeID := -1;
  if AFocusedRecord <> nil then
    with (Sender as TcxGridLayoutView).DataController do
      FCurrentBrigadeID := xVarToInt(Values[AFocusedRecord.RecordIndex, gliBrigadeID.Index]);
  FillDetailsPanel(FCurrentBrigadeID);
end;

procedure TfraBrigades.tiStatusFilterClick(Sender: TdxTileControlItem);
begin
  inherited;
  ApplyStatusFilter((Sender as TdxTileControlItem).Tag);
end;

procedure TfraBrigades.acEditExecute(Sender: TObject);
begin
  ShowLogEntryEditor;
end;

procedure TfraBrigades.acEditUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := gvMedicalBrigades.DataController.FocusedRowIndex >= 0;
end;

procedure TfraBrigades.acFileLoadDataExecute(Sender: TObject);
begin
  FisLoaded := FMedBrigadesController.LoadData();
  if FisLoaded then
    FillOverviewGrid;
end;

procedure TfraBrigades.acFileLoadDataUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := not FisLoaded;
end;

procedure TfraBrigades.ApplyStatusFilter(ATag: integer);
begin
  if FisLoaded then
    FillOverviewGrid(ATag);
end;

procedure TfraBrigades.asRequestCancelExecute(Sender: TObject);
begin
     ShowMessage('Отправить сообщение - отмена вызова');
end;

procedure TfraBrigades.asRequestCancelUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := gvMedicalBrigades.DataController.FocusedRowIndex >= 0;
end;

procedure TfraBrigades.asStatusAssignExecute(Sender: TObject);
begin
     ShowMessage('Отправить сообщение и данные - новый вызоов');
end;

procedure TfraBrigades.asStatusAssignUpdate(Sender: TObject);
begin
  inherited;
   //
end;

procedure TfraBrigades.btnSortAscClick(Sender: TObject);
begin
  inherited;
  SortByBrigadeNumber(soAscending);
end;

procedure TfraBrigades.btnSortDescClick(Sender: TObject);
begin
  inherited;
  SortByBrigadeNumber(soDescending);
end;


procedure TfraBrigades.ClearDetailsPanel;
begin
   Storage1.Clear;
end;


procedure TfraBrigades.FillDetailsPanel(ABrigadeID: Integer);
begin
  LoadTimeLineTestData(ABrigadeID, Scheduler);
end;


initialization
  RegisterFrame(IDBrigades, TfraBrigades);

end.

