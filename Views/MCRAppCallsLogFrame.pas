unit MCRAppCallsLogFrame;

{$I cxVer.inc}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, MCRAppBaseFrame, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxLayoutcxEditAdapters, ImgList,
  dxLayoutContainer, cxClasses, dxGDIPlusClasses, cxImage, cxTextEdit,
  cxMaskEdit, cxButtonEdit, dxLayoutControl, dxCustomTileControl, dxTileControl,
  cxGridLevel, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxNavigator, DB, cxDBData, cxDBLookupComboBox, cxImageComboBox,
  cxProgressBar, dxLayoutControlAdapters, Menus, StdCtrls, cxButtons, cxGroupBox,
  cxImageList, dxCore, dxDateRanges, dxMessageDialog, dxUIAClasses,
  dxScrollbarAnnotations, System.ImageList, Vcl.AppEvnts, System.StrUtils,
  System.Actions, Vcl.ActnList, cxGridBandedTableView, mcrAppCallsLogClasses,
  cxMemo, cxCustomListBox, cxListBox, mcrResourcesDM, mcrAppShared;

type
  TfraCallsLog = class(TfraBase)
    ilTasks: TcxImageList;
    tcCallsLogStatus: TdxTileControl;
    liTileFilter: TdxLayoutItem;
    tcTasksStateGroup: TdxTileControlGroup;
    tiAllCalls: TdxTileControlItem;
    tiInWork: TdxTileControlItem;
    tiPending: TdxTileControlItem;
    tiCompleted: TdxTileControlItem;
    tiNew: TdxTileControlItem;
    tiCancelled: TdxTileControlItem;
    tiFromInsurance: TdxTileControlItem;
    tiNeedAssist: TdxTileControlItem;
    liCallsOverview: TdxLayoutItem;
    grCallsLog: TcxGrid;
    gvCallsLog: TcxGridBandedTableView;
    lvCallsLog: TcxGridLevel;
    dxLayoutItem1: TdxLayoutItem;
    btnEdit: TcxButton;
    dxLayoutItem7: TdxLayoutItem;
    btnDelete: TcxButton;
    dxLayoutSeparatorItem2: TdxLayoutSeparatorItem;
    dxLayoutItem8: TdxLayoutItem;
    btnPrint: TcxButton;
    dxLayoutItem4: TdxLayoutItem;
    btnAdd: TcxButton;
    ApplicationEvents1: TApplicationEvents;
    btnAPIDownload: TcxButton;
    dxLayoutItem5: TdxLayoutItem;
    dxLayoutSeparatorItem1: TdxLayoutSeparatorItem;
    ActionList1: TActionList;
    acAPIDownloadData: TAction;
    acEdit: TAction;
    acDelete: TAction;
    acPrint: TAction;
    clCallDate: TcxGridBandedColumn;
    clCallStatus: TcxGridBandedColumn;
    clCallPatientName: TcxGridBandedColumn;
    clCallId: TcxGridBandedColumn;
    clCallPatientBirthDate: TcxGridBandedColumn;
    clCallAge: TcxGridBandedColumn;
    clCallContactInfo: TcxGridBandedColumn;
    clCallComplaints: TcxGridBandedColumn;
    clCallDiagnosis: TcxGridBandedColumn;
    clCallConclusion: TcxGridBandedColumn;
    clCallNote: TcxGridBandedColumn;
    clCallComment: TcxGridBandedColumn;
    clCallAddressStreet: TcxGridBandedColumn;
    clCallAddressDetails: TcxGridBandedColumn;
    clCallMkadDistance: TcxGridBandedColumn;
    clCallReceptionTime: TcxGridBandedColumn;
    clCallTransferTime: TcxGridBandedColumn;
    clCallDepartureTime: TcxGridBandedColumn;
    clCallArrivalTime: TcxGridBandedColumn;
    clCallCompletionTime: TcxGridBandedColumn;
    clCallWorkDuration: TcxGridBandedColumn;
    clCallBrigadeNumber: TcxGridBandedColumn;
    clCallDoctor: TcxGridBandedColumn;
    clCallParamedic: TcxGridBandedColumn;
    clCallDriver: TcxGridBandedColumn;
    clCallDispatcher1: TcxGridBandedColumn;
    clCallDispatcher2: TcxGridBandedColumn;
    clCallPaymentType: TcxGridBandedColumn;
    clCallInsuranceNumber: TcxGridBandedColumn;
    clCallCustomer: TcxGridBandedColumn;
    clCallCustomerRepresentative: TcxGridBandedColumn;
    clCallCost: TcxGridBandedColumn;
    clCallIsWaiting: TcxGridBandedColumn;
    clCallStatusID: TcxGridBandedColumn;
    clCallNumber: TcxGridBandedColumn;
    lgRight: TdxLayoutGroup;
    lgDetails: TdxLayoutGroup;
    lgDetailsPatient: TdxLayoutGroup;
    edCallDetailsPatient: TcxTextEdit;
    liCallDetailsPatient: TdxLayoutItem;
    lgDetailTimeAndDiagnosis: TdxLayoutGroup;
    lgDetailsBrigade: TdxLayoutGroup;
    liDetailsAddress: TdxLayoutItem;
    edDetailsAddress: TcxTextEdit;
    liDetailsContact: TdxLayoutItem;
    edDetailsContact: TcxTextEdit;
    liDetailsInsuranceNumber: TdxLayoutItem;
    edDetailsInsuranceNumber: TcxTextEdit;
    liDetailsReceptionTime: TdxLayoutItem;
    edDetailsReceptionTime: TcxTextEdit;
    liDetailsDepartureTime: TdxLayoutItem;
    edDetailsDepartureTime: TcxTextEdit;
    liDetailsArrivalTime: TdxLayoutItem;
    edDetailsArrivalTime: TcxTextEdit;
    liDetailsCompletionTime: TdxLayoutItem;
    edDetailsCompletionTime: TcxTextEdit;
    liDetailsWorkDuration: TdxLayoutItem;
    edDetailsWorkDuration: TcxTextEdit;
    lgDetailsTime: TdxLayoutGroup;
    edDetailsDiagnosis: TcxMemo;
    liDetailsDiagonosis: TdxLayoutItem;
    edDetailsConclusion: TcxMemo;
    liDetailsConclusion: TdxLayoutItem;
    edDetailsBrigade: TcxTextEdit;
    liDetailsBrigade: TdxLayoutItem;
    liDetailsDoctor: TdxLayoutItem;
    edDetailsDoctor: TcxTextEdit;
    lgDetailsAuditLog: TdxLayoutGroup;
    lbDetailsActionsAuditLog: TcxListBox;
    liDetailsActionsAudit: TdxLayoutItem;
    dxLayoutItem2: TdxLayoutItem;
    btnAPIUpload: TcxButton;
    acAPIUploadData: TAction;
    clTEM: TcxGridBandedColumn;
    procedure acAPIDownloadDataUpdate(Sender: TObject);
    procedure acAPIDownloadDataExecute(Sender: TObject);
    procedure acEditExecute(Sender: TObject);
    procedure acDeleteExecute(Sender: TObject);
    procedure acEditUpdate(Sender: TObject);
    procedure tiStatusFilterClick(Sender: TdxTileControlItem);
    procedure gvCallsLogFocusedRecordChanged(Sender: TcxCustomGridTableView; APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
    procedure gvCallsLogDblClick(Sender: TObject);
    procedure acAPIUploadDataExecute(Sender: TObject);
    procedure acAPIUploadDataUpdate(Sender: TObject);
    procedure gvCallsLogCustomDrawCell(Sender: TcxCustomGridTableView; ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
  private
    FisLoaded: boolean;
    FCurrentCallID: integer;
    FCallsLogController: TCallsLogController;

    procedure DoAfterActivate; override;
    procedure RefreshInfo; override;
    procedure Reload;

    procedure ApplyStatusFilter(ATag: integer);
    procedure FillOverviewGrid(ATag: integer = 0);
    procedure FillDetailsPanel(ACallID: Integer);
    procedure ClearDetailsPanel;

    procedure ShowEntryEditor;

  public
    procedure Init; override;
    procedure Done; override;
  end;

implementation

{$R *.dfm}

uses
  System.UITypes, dxBarStrs, mcrMedCallModel, mcrConverters, mcrUtils,
  mcrCallsLogEditForm;

procedure TfraCallsLog.Init;
begin
  inherited;
  FisLoaded := False;
  FCallsLogController := TCallsLogController.Create;
end;

procedure TfraCallsLog.Done;
begin
  inherited;
  FreeAndNil(FCallsLogController);
end;

procedure TfraCallsLog.acAPIDownloadDataExecute(Sender: TObject);
begin
  inherited;
  FisLoaded := FCallsLogController.LoadData;
  if FisLoaded then
    FillOverviewGrid;
end;

procedure TfraCallsLog.acAPIDownloadDataUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := not FisLoaded;
end;

procedure TfraCallsLog.acAPIUploadDataExecute(Sender: TObject);
begin
  inherited;
  if FCallsLogController.SaveData then
  begin
    FCallsLogController.ResetDataModified;
    Reload;
    FisLoaded := false;
    ShowMessage('Данные отправлены на сервер');
  end;
end;

procedure TfraCallsLog.acAPIUploadDataUpdate(Sender: TObject);
begin
  inherited;
  (Sender as TAction).Enabled := FCallsLogController.isDataModified;
end;

procedure TfraCallsLog.DoAfterActivate;
begin
  inherited DoAfterActivate;
  if ActivatingCount = 1 then
    gvCallsLog.Controller.GoToFirst;
  if tcCallsLogStatus.Controller.FocusedItem = nil then
    tcCallsLogStatus.Controller.FocusedItem := tiAllCalls;
end;

procedure TfraCallsLog.RefreshInfo;
begin

  if FisLoaded then
  begin

    FCallsLogController.RecalculateStatuses;

    tiAllCalls.Text2.Value := FCallsLogController.CallsStatusCount[tiAllCalls.Tag].ToString;
    tiNew.Text2.Value := FCallsLogController.CallsStatusCount[tiNew.Tag].ToString;
    tiPending.Text2.Value := FCallsLogController.CallsStatusCount[tiPending.Tag].ToString;
    tiInWork.Text2.Value := FCallsLogController.CallsStatusCount[tiInWork.Tag].ToString;
    tiCompleted.Text2.Value := FCallsLogController.CallsStatusCount[tiCompleted.Tag].ToString;
    tiFromInsurance.Text2.Value := FCallsLogController.CallsStatusCount[tiFromInsurance.Tag].ToString;
    tiCancelled.Text2.Value := FCallsLogController.CallsStatusCount[tiCancelled.Tag].ToString;

  end;

end;

procedure TfraCallsLog.Reload;
begin
  if tcCallsLogStatus.Controller.FocusedItem <> nil then
    ApplyStatusFilter(tcCallsLogStatus.Controller.FocusedItem.Tag);
end;

procedure TfraCallsLog.ShowEntryEditor;
begin

  var frmCallsLogEdit := TfrmCallsLogEdit.Create(Self);
  try
    var call := FCallsLogController.GetCallById(FCurrentCallID);
    if assigned(call) then
    begin

      frmCallsLogEdit.SetData(call);

      if frmCallsLogEdit.ShowModal = mrOK then
      begin

        if frmCallsLogEdit.GetData then
          FCallsLogController.SetCallModified(call);

        var prvKeepRow := gvCallsLog.DataController.FocusedRecordIndex;
        Reload;
        if prvKeepRow >= 0 then
        try
          gvCallsLog.DataController.FocusedRowIndex := prvKeepRow;
          PutFocusedRowInView(gvCallsLog);
        except
        end;

      end;
    end;
  finally
    FreeAndNil(frmCallsLogEdit);
  end;
end;

procedure TfraCallsLog.tiStatusFilterClick(Sender: TdxTileControlItem);
begin
  inherited;
  ApplyStatusFilter((Sender as TdxTileControlItem).Tag);
end;

procedure TfraCallsLog.ApplyStatusFilter(ATag: integer);
begin
  if FisLoaded then
    FillOverviewGrid(ATag);
end;

procedure TfraCallsLog.ClearDetailsPanel;
begin
  edCallDetailsPatient.EditValue := Null;
  edDetailsAddress.EditValue := Null;
  edDetailsContact.EditValue := Null;
  edDetailsInsuranceNumber.EditValue := Null;

  edDetailsReceptionTime.EditValue := Null;
  edDetailsDepartureTime.EditValue := Null;
  edDetailsArrivalTime.EditValue := Null;
  edDetailsCompletionTime.EditValue := Null;
  edDetailsWorkDuration.EditValue := Null;

  edDetailsBrigade.EditValue := Null;
  edDetailsDoctor.EditValue := Null;

  edDetailsDiagnosis.EditValue := Null;
  edDetailsConclusion.EditValue := Null;

  lbDetailsActionsAuditLog.Clear;
end;

procedure TfraCallsLog.acDeleteExecute(Sender: TObject);
var
  prvCallNumber: integer;
begin
  inherited;

  gvCallsLog.DataController.FocusedRecordIndex;

  prvCallNumber := XVarToInt(gvCallsLog.DataController.Values[gvCallsLog.DataController.FocusedRecordIndex, clCallNumber.Index]);

  if dxMessageDlg(Format('Удалить запись регистрации заявки N %d вызова СМП?', [prvCallNumber]), mtConfirmation, [mbYes, mbNo], 0) = IDYES then
  begin
    var call := FCallsLogController.GetCallById(FCurrentCallID);
    if assigned(call) then
      FCallsLogController.SetCallDeleted(call);
    gvCallsLog.Controller.DeleteSelection;
    RefreshInfo;
  end;

end;

procedure TfraCallsLog.acEditExecute(Sender: TObject);
begin
  if FCurrentCallID >= 0 then
  begin
    ShowEntryEditor;                         //Вариант редактора с использованием form
  // ShowEditPage(frmMain.tbiCallsLogEdit);  //Вариант редактора с использованием frame
  end;
end;

procedure TfraCallsLog.acEditUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := gvCallsLog.DataController.FocusedRowIndex >= 0;
end;

procedure TfraCallsLog.FillOverviewGrid(ATag: integer);
var
  r: Integer;
  call: TMedicalAssistanceCall;
begin

  with gvCallsLog.DataController do
  try
    gvCallsLog.DataController.RecordCount := 0;

    gvCallsLog.BeginUpdate;
    for call in FCallsLogController.CallsList do
    begin
      if (call.TEM = temDelete) or ((ATag > 0) and (Integer(call.StatusId) <> ATag)) then
        Continue;    //skip row adding if it was deleted or not in a view filter

      r := AppendRecord;

      {$REGION 'ВЫЗОВ'}
      Values[r, clCallID.Index] := call.Id;
      Values[r, clCallNumber.Index] := call.Number;
      Values[r, clCallStatusID.Index] := integer(call.StatusID);
      Values[r, clCallStatus.Index] := call.Status;
      {$ENDREGION}

      {$REGION 'ПАЦИЕНТ'}
      Values[r, clCallPatientName.Index] := call.PatientName;
      Values[r, clCallPatientBirthDate.Index] := call.DateOfBirth;
      Values[r, clCallAge.Index] := call.Age;
      Values[r, clCallContactInfo.Index] := call.ContactInfo;
      {$ENDREGION}

      {$REGION 'ДИАГНОЗ И ПОМОЩЬ'}
      Values[r, clCallComplaints.Index] := call.Complaints;
      Values[r, clCallDiagnosis.Index] := call.Diagnosis;
      Values[r, clCallConclusion.Index] := call.Conclusion;
      Values[r, clCallNote.Index] := call.Note;
      Values[r, clCallComment.Index] := call.Comment;
      {$ENDREGION}

      {$REGION 'АДРЕС'}
      Values[r, clCallAddressStreet.Index] := call.AddressStreet;
      Values[r, clCallAddressDetails.Index] := call.AddressDetails;
      Values[r, clCallMkadDistance.Index] := call.MkadDistance;
      {$ENDREGION}

      {$REGION 'ВРЕМЯ'}
      Values[r, clCallDate.Index] := call.CallDate;

      Values[r, clCallReceptionTime.Index] := XFormatTime(call.ReceptionTime);
      Values[r, clCallTransferTime.Index] := XFormatTime(call.TransferTime);

      Values[r, clCallDepartureTime.Index] := XFormatTime(call.DepartureTime);
      Values[r, clCallArrivalTime.Index] := XFormatTime(call.ArrivalTime);
      Values[r, clCallCompletionTime.Index] := XFormatTime(call.CompletionTime);

      Values[r, clCallWorkDuration.Index] := call.WorkDuration.ToString;
      {$ENDREGION}

      {$REGION 'БРИГАДА'}
      Values[r, clCallBrigadeNumber.Index] := call.BrigadeNumber;
      Values[r, clCallDoctor.Index] := call.Doctor;
      Values[r, clCallParamedic.Index] := call.Paramedic;
      Values[r, clCallDriver.Index] := call.Driver;
      Values[r, clCallDispatcher1.Index] := call.Dispatcher1;
      Values[r, clCallDispatcher2.Index] := call.Dispatcher2;
      {$ENDREGION}

      {$REGION 'ОПЛАТА И СТРАХОВКА'}
      Values[r, clCallPaymentType.Index] := call.PaymentType;
      Values[r, clCallInsuranceNumber.Index] := call.InsuranceNumber;
      Values[r, clCallCustomer.Index] := call.Customer;
      Values[r, clCallCustomerRepresentative.Index] := call.CustomerRepresentative;
      Values[r, clCallCost.Index] := IfThen(call.Cost > 0, FloatToStrF(call.Cost, ffCurrency, 15, 2), '');
      {$ENDREGION}

      {$REGION 'ПРОЧЕЕ'}
      Values[r, clCallIsWaiting.Index] := call.IsWaiting;
      Values[r, clTEM.Index] := integer(call.TEM);          // Transaction Edit Mode
      {$ENDREGION}
    end;
  finally
    gvCallsLog.EndUpdate;
  end;

  if gvCallsLog.DataController.RecordCount > 0 then
  begin
    gvCallsLog.DataController.FocusedRowIndex := 0;
    gvCallsLog.Controller.FocusedRow.Selected := True;
  end;

  RefreshInfo;
end;

procedure TfraCallsLog.gvCallsLogCustomDrawCell(Sender: TcxCustomGridTableView; ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  inherited;
  if AViewInfo.GridRecord.IsData and (not AViewInfo.Selected) then
  begin
    if XVarToInt(gvCallsLog.DataController.Values[AViewInfo.GridRecord.RecordIndex, clTEM.Index]) = ord(temUpdate) then
    begin
      ACanvas.Canvas.Font.Color := clBlue;
    end;
  end;

end;

procedure TfraCallsLog.gvCallsLogDblClick(Sender: TObject);
begin
  inherited;
  btnEdit.Click;
end;

procedure TfraCallsLog.gvCallsLogFocusedRecordChanged(Sender: TcxCustomGridTableView; APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
begin
  inherited;
  FCurrentCallID := -1;
  if AFocusedRecord <> nil then
    with (Sender as TcxGridBandedTableView).DataController do
      FCurrentCallID := xVarToInt(Values[AFocusedRecord.RecordIndex, clCallID.Index]);
  FillDetailsPanel(FCurrentCallID);
end;

procedure TfraCallsLog.FillDetailsPanel(ACallID: Integer);
var
  call: TMedicalAssistanceCall;
begin
  if ACallID >= 0 then
  begin
    call := FCallsLogController.GetCallById(ACallID);
    if Assigned(call) then
    begin
      {$REGION 'ПАЦИЕНТ'}
      edCallDetailsPatient.EditValue := call.PatientName;
      {$ENDREGION}

      {$REGION 'АДРЕС И КОНТАКТ'}
      edDetailsAddress.EditValue := call.AddressStreet;
      if call.AddressDetails <> '' then
        edDetailsAddress.EditValue := edDetailsAddress.EditValue + ', ' + call.AddressDetails;
      edDetailsContact.EditValue := call.ContactInfo;
      {$ENDREGION}

      {$REGION 'СТРАХОВКА И ОПЛАТА'}
      edDetailsInsuranceNumber.EditValue := call.InsuranceNumber;
      {$ENDREGION}

      {$REGION 'ВРЕМЯ'}
      edDetailsReceptionTime.EditValue := XFormatTime(call.ReceptionTime);
      edDetailsDepartureTime.EditValue := XFormatTime(call.DepartureTime);
      edDetailsArrivalTime.EditValue := XFormatTime(call.ArrivalTime);
      edDetailsCompletionTime.EditValue := XFormatTime(call.CompletionTime);
      edDetailsWorkDuration.EditValue := XFormatTime(call.WorkDuration);
      {$ENDREGION}

      {$REGION 'ДИАГНОЗ И ПОМОЩЬ'}
      edDetailsDiagnosis.EditValue := call.Diagnosis;
      edDetailsConclusion.EditValue := call.Conclusion;
      {$ENDREGION}

      {$REGION 'БРИГАДА'}
      edDetailsBrigade.EditValue := call.BrigadeNumber;
      edDetailsDoctor.EditValue := call.Doctor;
      {$ENDREGION}

      lbDetailsActionsAuditLog.Clear;
    end
    else
      ClearDetailsPanel;
  end
  else
    ClearDetailsPanel;
end;

initialization
  RegisterFrame(IDCalls, TfraCallsLog);

end.

