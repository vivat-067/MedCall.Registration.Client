unit MCRAppMapFrame;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, MCRAppBaseFrame, cxGraphics,
  dxUIAClasses, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer,
  cxEdit, cxGroupBox, dxLayoutContainer, cxClasses, dxLayoutControl,
  dxLayoutcxEditAdapters, Winapi.WebView2, Winapi.ActiveX, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxNavigator, dxDateRanges,
  dxScrollbarAnnotations, Data.DB, cxDBData, cxTextEdit, cxMemo, cxGridLevel,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, Vcl.Edge, dxNavBarBase, dxNavBarCollns, dxNavBar,  mcrAppMapClasses,
  mcrMedBrigadeModel, System.Actions, Vcl.ActnList, dxLayoutControlAdapters,
  Vcl.Menus, Vcl.StdCtrls, cxButtons, dxNavBarGroupItems, Vcl.ExtCtrls;

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
    nbMainGroup1: TdxNavBarGroup;
    nbMainGroup2: TdxNavBarGroup;
    dxLayoutGroup1: TdxLayoutGroup;
    gvNotifications: TcxGridTableView;
    gvNotificationsColumn1: TcxGridColumn;
    gvNotificationsColumn2: TcxGridColumn;
    gvNotificationsColumn3: TcxGridColumn;
    gvNotificationsColumn4: TcxGridColumn;
    nbMainItem1: TdxNavBarItem;
    nbMainItem2: TdxNavBarItem;
    ActionList1: TActionList;
    acFileLoadData: TAction;
    acEdit: TAction;
    acPrint: TAction;
    asStatusAssign: TAction;
    asRequestCancel: TAction;
    dxLayoutItem1: TdxLayoutItem;
    btnLoadData: TcxButton;
    nbMainGroup3: TdxNavBarGroup;
    nbMainGroup3Control: TdxNavBarGroupControl;
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
    procedure webBrowserCreateWebViewCompleted(Sender: TCustomEdgeBrowser;
      AResult: HRESULT);
    procedure webBrowserNavigationCompleted(Sender: TCustomEdgeBrowser;
      IsSuccess: Boolean; WebErrorStatus: TOleEnum);
    procedure webBrowserWebMessageReceived(Sender: TCustomEdgeBrowser;
      Args: TWebMessageReceivedEventArgs);
    procedure acFileLoadDataExecute(Sender: TObject);
    procedure acFileLoadDataUpdate(Sender: TObject);
  private
    { Private declarations }
    FisLoaded :boolean;
    FIsMapInitialized: Boolean;
    FMapController: TMapController;

    procedure DoAfterActivate; override;

    procedure RefreshInfo; override;
    procedure Reload;

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
  FisLoaded:=true;
end;

procedure TfraMap.acFileLoadDataUpdate(Sender: TObject);
begin
  inherited;
    (Sender as TAction).Enabled := FIsMapInitialized and (not FisLoaded);
end;

procedure TfraMap.DoAfterActivate;
begin
  inherited;
  if not FIsMapInitialized then
     webBrowser.ReinitializeWebView;
end;


procedure TfraMap.RefreshInfo;
begin
  inherited;
end;


procedure TfraMap.webBrowserCreateWebViewCompleted(Sender: TCustomEdgeBrowser;
  AResult: HRESULT);
begin
 if Succeeded(AResult) then
  begin
    FIsMapInitialized := True;
    webBrowser.NavigateToString(FMapController.GetMapHtmlContent);
  end;
end;

procedure TfraMap.webBrowserNavigationCompleted(Sender: TCustomEdgeBrowser;
  IsSuccess: Boolean; WebErrorStatus: TOleEnum);
begin
  inherited;
   //
end;


procedure TfraMap.Reload;
begin
  if FIsMapInitialized and (webBrowser.DefaultInterface <> nil) then begin
     СlearBrigadeDetails;
     webBrowser.ExecuteScript(FMapController.GetUpdateMarkersJS);
  end;
end;



procedure TfraMap.webBrowserWebMessageReceived(Sender: TCustomEdgeBrowser;
  Args: TWebMessageReceivedEventArgs);
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
    edBrigadeNumber.Text := ABrigade.BrigadeNumber;
    edBrigadeStatus.Text := ABrigade.GetStatus;
    edBrigadeDoctor.Text := ABrigade.Doctor;
    edBrigadeParaMedic.Text := ABrigade.Paramedic;
    edBrigadeDriver.Text := ABrigade.Driver;
  end else
    СlearBrigadeDetails;
end;


procedure TfraMap.СlearBrigadeDetails;
begin
  edBrigadeNumber.Clear;
  edBrigadeStatus.Clear;
  edBrigadeDoctor.Clear;
  edBrigadeParaMedic.Clear;
  edBrigadeDriver.Clear;
end;

initialization
  RegisterFrame(IDMap, TfraMap);


end.
