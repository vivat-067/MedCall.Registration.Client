unit mcrCallsLogEditForm;

{$I cxVer.inc}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxClasses, dxLayoutContainer, dxLayoutControl,
  cxContainer, cxEdit, Menus, dxLayoutcxEditAdapters, dxLayoutControlAdapters, StdCtrls, cxButtons,
  cxDropDownEdit, cxCalendar, cxDBEdit, cxMaskEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, cxTextEdit,
  cxMemo, cxRichEdit, cxDBRichEdit, cxImageComboBox, cxTrackBar, cxDBTrackBar, DB, dxForms, dxCore,
  dxUIAClasses, System.Actions, Vcl.ActnList, cxCustomListBox, cxListBox, Vcl.ComCtrls, cxDateUtils, dxCoreGraphics,
  cxButtonEdit, cxCurrencyEdit, cxSpinEdit, mcrMedCallModel;

type
  TfrmCallsLogEdit = class(TdxForm)
    dxLayoutControl1: TdxLayoutControl;
    btnSave: TcxButton;
    btnCancel: TcxButton;
    dxLayoutItem8: TdxLayoutItem;
    dxLayoutItem10: TdxLayoutItem;
    lgBottom: TdxLayoutGroup;
    dxLayoutGroup1: TdxLayoutGroup;
    dxLayoutItem1: TdxLayoutItem;
    btnClose: TcxButton;
    ActionList1: TActionList;
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
    edDetailsBrigade: TcxButtonEdit;
    liDetailsBrigade: TdxLayoutItem;
    liDetailsDoctor: TdxLayoutItem;
    edDetailsDoctor: TcxTextEdit;
    acSave: TAction;
    acCancel: TAction;
    lgTopSection: TdxLayoutGroup;
    lgTopRight: TdxLayoutGroup;
    dxLayoutAutoCreatedGroup1: TdxLayoutAutoCreatedGroup;
    dxLayoutAutoCreatedGroup3: TdxLayoutAutoCreatedGroup;
    dxLayoutGroup2: TdxLayoutGroup;
    dxLayoutItem2: TdxLayoutItem;
    edCallNumber: TcxTextEdit;
    dtCallDate: TcxDateEdit;
    liCallDate: TdxLayoutItem;
    cmbCallStatus: TcxComboBox;
    liCallStatus: TdxLayoutItem;
    dxLayoutItem4: TdxLayoutItem;
    edDriver: TcxTextEdit;
    dxLayoutItem5: TdxLayoutItem;
    edParamedic: TcxTextEdit;
    liDetailsAddress2: TdxLayoutItem;
    edAddress2: TcxTextEdit;
    dxLayoutAutoCreatedGroup2: TdxLayoutAutoCreatedGroup;
    edCustomer: TcxButtonEdit;
    dxLayoutItem7: TdxLayoutItem;
    dxLayoutSeparatorItem1: TdxLayoutSeparatorItem;
    edCost: TcxCurrencyEdit;
    dxLayoutItem9: TdxLayoutItem;
    edBirthDate: TcxDateEdit;
    liBirthDate: TdxLayoutItem;
    edAge: TcxSpinEdit;
    liAge: TdxLayoutItem;
    dxLayoutAutoCreatedGroup5: TdxLayoutAutoCreatedGroup;
    cmbPaymentType: TcxComboBox;
    dxLayoutItem13: TdxLayoutItem;
    dxLayoutAutoCreatedGroup6: TdxLayoutAutoCreatedGroup;
    dxLayoutItem3: TdxLayoutItem;
    procedure acSaveExecute(Sender: TObject);
    procedure acSaveUpdate(Sender: TObject);
    procedure acCancelUpdate(Sender: TObject);
    procedure dxFormCreate(Sender: TObject);
    procedure dxFormShow(Sender: TObject);
    procedure edCallDetailsEditing(Sender: TObject;
      var CanEdit: Boolean);
    procedure edDetailsBrigadePropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
  private
    FisModified:Boolean;
    FCall: TMedicalAssistanceCall;
  public
    procedure SetData(ACall: TMedicalAssistanceCall);
    function GetData:boolean;
  end;

implementation

{$R *.dfm}

uses
 mcrResourcesDM, System.UITypes, mcrConverters;


procedure TfrmCallsLogEdit.dxFormCreate(Sender: TObject);
begin
  FisModified:=false;
end;


procedure TfrmCallsLogEdit.dxFormShow(Sender: TObject);
begin
    btnClose.SetFocus();
end;

procedure TfrmCallsLogEdit.edCallDetailsEditing(Sender: TObject;
  var CanEdit: Boolean);
begin
  FisModified:=true;
end;

procedure TfrmCallsLogEdit.edDetailsBrigadePropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
begin
     ShowMessage('Назначить бригаду на вызов выбрав из списка свободных бригад')
end;

procedure TfrmCallsLogEdit.SetData(ACall: TMedicalAssistanceCall);
begin

    FCall:=ACall;

    edCallDetailsPatient.EditValue := FCall.PatientName;
    edBirthDate.EditValue:= FCall.DateOfBirth;
    edAge.EditText := FCall.Age.ToString;

    edDetailsAddress.EditValue := FCall.AddressStreet;
    edAddress2.EditValue := FCall.AddressDetails;
    edDetailsContact.EditValue := FCall.ContactInfo;

    dtCallDate.EditValue := FCall.CallDate;
    edCallNumber.EditValue := FCall.Number;

    cmbCallStatus.Text:=FCall.Status;
    edCustomer.EditValue := FCall.Customer;
    edDetailsInsuranceNumber.EditValue := FCall.InsuranceNumber;
    if FCall.Cost>0 then
       edCost.EditValue:=FCall.Cost;

    edDetailsReceptionTime.EditValue := XFormatTime(FCall.ReceptionTime);
    edDetailsDepartureTime.EditValue := XFormatTime(FCall.DepartureTime);
    edDetailsArrivalTime.EditValue := XFormatTime(FCall.ArrivalTime);
    edDetailsCompletionTime.EditValue := XFormatTime(FCall.CompletionTime);
    edDetailsWorkDuration.EditValue := XFormatTime(FCall.WorkDuration);

    edDetailsDiagnosis.EditValue := FCall.Diagnosis;
    edDetailsConclusion.EditValue := FCall.Conclusion;

    edDetailsBrigade.EditValue := FCall.BrigadeNumber;
    edDetailsDoctor.EditValue := FCall.Doctor;
    edParamedic.EditValue := FCall.Paramedic;
    edDriver.EditValue := FCall.Driver;

    FisModified:=false;
end;

function TfrmCallsLogEdit.GetData: boolean;
begin
  with FCall do
  begin

    PatientName := edCallDetailsPatient.EditValue;
    DateOfBirth := edBirthDate.EditValue;
    AddressStreet := edDetailsAddress.EditValue;
    AddressDetails := edAddress2.EditValue;
    ContactInfo := edDetailsContact.EditValue;

    CallDate:=dtCallDate.EditValue;
    Customer:=edCustomer.EditValue;
    InsuranceNumber := edDetailsInsuranceNumber.EditValue;

    Diagnosis := edDetailsDiagnosis.EditValue;
    Conclusion := edDetailsConclusion.EditValue;

    BrigadeNumber := edDetailsBrigade.EditValue;
    Doctor := edDetailsDoctor.EditValue;
    Paramedic:=edParamedic.EditValue;
    Driver:=edDriver.EditValue;

  end;

  Result := True;
end;

procedure TfrmCallsLogEdit.acCancelUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled:=FisModified;
end;

procedure TfrmCallsLogEdit.acSaveExecute(Sender: TObject);
begin
  //
end;

procedure TfrmCallsLogEdit.acSaveUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled:=FisModified;
end;



initialization
 //

end.
