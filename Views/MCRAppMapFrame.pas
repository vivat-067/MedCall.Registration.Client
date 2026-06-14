unit MCRAppMapFrame;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  MCRAppBaseFrame, cxGraphics, dxUIAClasses, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, cxGroupBox, dxLayoutContainer,
  cxClasses, dxLayoutControl, dxLayoutcxEditAdapters, Winapi.WebView2,
  Winapi.ActiveX, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxNavigator, dxDateRanges, dxScrollbarAnnotations, Data.DB, cxDBData,
  cxTextEdit, cxMemo, cxGridLevel, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, Vcl.Edge, dxNavBarBase,
  dxNavBarCollns, dxNavBar, mcrAppMapClasses, mcrMedBrigadeModel, System.Actions,
  Vcl.ActnList, dxLayoutControlAdapters, Vcl.Menus, Vcl.StdCtrls, cxButtons,
  dxNavBarGroupItems, Vcl.ExtCtrls, dxCheckGroupBox, cxCheckGroup, cxCheckBox;

type
  TfraMap = class(TfraBase)
    webBrowser: TEdgeBrowser;
    liWebBrowser: TdxLayoutItem;
    glNotifications: TcxGridLevel;
    grNotifications: TcxGrid;
    liNotifications: TdxLayoutItem;
    memChat: TcxMemo;
    liChat: TdxLayoutItem;
    nbMain: TdxNavBar;
    liNavBar: TdxLayoutItem;
    nbgSMP: TdxNavBarGroup;
    nbgPND: TdxNavBarGroup;
    dxLayoutGroup1: TdxLayoutGroup;
    gvNotifications: TcxGridTableView;
    gvNotificationsColumn1: TcxGridColumn;
    gvNotificationsColumn2: TcxGridColumn;
    gvNotificationsColumn3: TcxGridColumn;
    gvNotificationsColumn4: TcxGridColumn;
    nbiCommunication: TdxNavBarItem;
    nbiLocateOnMap: TdxNavBarItem;
    ActionList1: TActionList;
    acFileLoadData: TAction;
    acEdit: TAction;
    acPrint: TAction;
    asStatusAssign: TAction;
    asRequestCancel: TAction;
    dxLayoutItem1: TdxLayoutItem;
    btnLoadData: TcxButton;
    nbgSettings: TdxNavBarGroup;
    lgBottom: TdxLayoutGroup;
    dxLayoutGroup5: TdxLayoutGroup;
    edBrigadeNumber: TcxTextEdit;
    dxLayoutItem3: TdxLayoutItem;
    liBrigadeStatus: TdxLayoutItem;
    edBrigadeStatus: TcxTextEdit;
    liBrigadeDoctor: TdxLayoutItem;
    edBrigadeDoctor: TcxTextEdit;
    liBrigadeParaMedic: TdxLayoutItem;
    edBrigadeParaMedic: TcxTextEdit;
    liBrigadeDriver: TdxLayoutItem;
    edBrigadeDriver: TcxTextEdit;
    dxLayoutSplitterItem1: TdxLayoutSplitterItem;
    nbiOptions: TdxNavBarItem;
    nbgFilter: TdxNavBarGroup;
    nbgFilterControl: TdxNavBarGroupControl;
    dxLayoutControl3Group_Root: TdxLayoutGroup;
    dxLayoutControl3: TdxLayoutControl;
    chkNoConnection: TcxCheckBox;
    dxLayoutItem2: TdxLayoutItem;
    dxLayoutItem4: TdxLayoutItem;
    chkWorking: TcxCheckBox;
    dxLayoutItem5: TdxLayoutItem;
    chkArrived: TcxCheckBox;
    dxLayoutItem6: TdxLayoutItem;
    chkConfirming: TcxCheckBox;
    dxLayoutItem7: TdxLayoutItem;
    chkAvailable: TcxCheckBox;
    dxLayoutLabeledItem1: TdxLayoutLabeledItem;
    procedure webBrowserCreateWebViewCompleted(Sender: TCustomEdgeBrowser; AResult: HRESULT);
    procedure webBrowserNavigationCompleted(Sender: TCustomEdgeBrowser; IsSuccess: Boolean; WebErrorStatus: TOleEnum);
    procedure webBrowserWebMessageReceived(Sender: TCustomEdgeBrowser; Args: TWebMessageReceivedEventArgs);
    procedure acFileLoadDataExecute(Sender: TObject);
    procedure acFileLoadDataUpdate(Sender: TObject);
    procedure nbiOptionsClick(Sender: TObject);
    procedure chkStatusFilterClick(Sender: TObject);
    procedure nbiCommunicationClick(Sender: TObject);
    procedure nbiLocateOnMapClick(Sender: TObject);
  private
    { Private declarations }
    FisLoaded: boolean;
    FIsMapInitialized: Boolean;
    FMapController: TMapController;
    FCurrentBrigadeId: Integer;

    procedure DoAfterActivate; override;
    procedure Reload;

    procedure UpdateMarkers;
    procedure FillBrigadeDetails(ABrigade: TMedicalBrigade);
    procedure СlearBrigadeDetails;

  public
    procedure Init; override;
    procedure Done; override;
  end;

var
  fraMap: TfraMap;

implementation

{$R *.dfm}

uses
  mcrResourcesDM, mcrUtils;

{ TfraMap }

procedure TfraMap.Init;
begin
  inherited;
  FMapController := TMapController.Create(WebMapAPIKey);
  FIsMapInitialized := False;
  FisLoaded := false;
  FCurrentBrigadeId := 0;
end;

procedure TfraMap.Done;
begin
  inherited;
  FreeAndNil(FMapController);
end;

procedure TfraMap.acFileLoadDataExecute(Sender: TObject);
begin
  inherited;
  Reload;
  FisLoaded := true;
end;

procedure TfraMap.acFileLoadDataUpdate(Sender: TObject);
begin
  inherited;
  (Sender as TAction).Enabled := FIsMapInitialized and (not FisLoaded);
end;

procedure TfraMap.nbiOptionsClick(Sender: TObject);
begin
  inherited;
  ShowMessage('Параметры карты')
end;

procedure TfraMap.nbiCommunicationClick(Sender: TObject);
begin
  inherited;
  ShowMessage('Связь с бригадой')
end;

procedure TfraMap.nbiLocateOnMapClick(Sender: TObject);
begin
  inherited;
  ShowMessage('Найти бригаду на карте')
end;

procedure TfraMap.chkStatusFilterClick(Sender: TObject);
begin
  var clickedStatus := TBrigadeStatus(TcxCheckBox(Sender).Tag);

  FMapController.ToggleStatusFilter(clickedStatus, TcxCheckBox(Sender).Checked);

  UpdateMarkers;

  if (FCurrentBrigadeId > 0) and (not TcxCheckBox(Sender).Checked) then  begin
    var currentBrigade := FMapController.GetBrigadeById(FCurrentBrigadeId);
    if Assigned(currentBrigade) and (currentBrigade.Status = clickedStatus) then
      СlearBrigadeDetails;
  end;
end;

procedure TfraMap.DoAfterActivate;
begin
  inherited;
  if not FIsMapInitialized then
     webBrowser.ReinitializeWebView;
end;


procedure TfraMap.webBrowserCreateWebViewCompleted(Sender: TCustomEdgeBrowser; AResult: HRESULT);
begin
  if Succeeded(AResult) then
  begin
    FIsMapInitialized := True;
    webBrowser.NavigateToString(FMapController.GetMapHtmlContent);

  end;
end;

procedure TfraMap.webBrowserNavigationCompleted(Sender: TCustomEdgeBrowser; IsSuccess: Boolean; WebErrorStatus: TOleEnum);
begin
  inherited;
   //
end;

procedure TfraMap.Reload;
begin
  if FIsMapInitialized then
    FMapController.LoadData;

  СlearBrigadeDetails;

  UpdateMarkers;
end;

procedure TfraMap.UpdateMarkers;
begin
  if FIsMapInitialized and (webBrowser.DefaultInterface <> nil) then
     webBrowser.ExecuteScript(FMapController.GetUpdateBrigadeMarkersJS);
end;

procedure TfraMap.webBrowserWebMessageReceived(Sender: TCustomEdgeBrowser; Args: TWebMessageReceivedEventArgs);
var
  jsonID: PWideChar;
  targetID: Integer;
  brigade: TMedicalBrigade;
begin
  inherited;
  if Succeeded(Args.ArgsInterface.Get_webMessageAsJson(jsonID)) then
  try
    targetID := StrToIntDef(string(jsonID).DeQuotedString('"'), 0);
    brigade := FMapController.GetBrigadeById(targetID);
    if Assigned(brigade) then
    begin
      FillBrigadeDetails(brigade);
      memChat.Lines.Add(Format('[%s] Врач: %s (%s)', [brigade.BrigadeNumber, brigade.Doctor, brigade.GetStatus]));
    end
    else
      СlearBrigadeDetails;
  finally
    CoTaskMemFree(jsonID);
  end;
end;

procedure TfraMap.FillBrigadeDetails(ABrigade: TMedicalBrigade);
begin
  if Assigned(ABrigade) then
  begin
    FCurrentBrigadeId := ABrigade.Id;
     edBrigadeNumber.Text := ABrigade.BrigadeNumber;
     edBrigadeStatus.Text := ABrigade.GetStatus;
     edBrigadeDoctor.Text := ABrigade.Doctor;
     edBrigadeParaMedic.Text := ABrigade.Paramedic;
     edBrigadeDriver.Text := ABrigade.Driver;
  end
  else
    СlearBrigadeDetails;
end;

procedure TfraMap.СlearBrigadeDetails;
begin
  FCurrentBrigadeId := 0;
   edBrigadeNumber.Clear;
   edBrigadeStatus.Clear;
   edBrigadeDoctor.Clear;
   edBrigadeParaMedic.Clear;
   edBrigadeDriver.Clear;
end;

initialization
  RegisterFrame(IDMap, TfraMap);

end.

