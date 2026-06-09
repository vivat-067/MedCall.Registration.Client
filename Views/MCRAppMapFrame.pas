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
end;

procedure TfraMap.acFileLoadDataUpdate(Sender: TObject);
begin
  inherited;
    (Sender as TAction).Enabled := not FisLoaded;
end;

procedure TfraMap.DoAfterActivate;
begin
  inherited;
  nbMain.OptionsBehavior.NavigationPane.Collapsed := True;

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
     webBrowser.ExecuteScript(FMapController.GetUpdateMarkersJS);
     FisLoaded:=true;
  end;
end;



procedure TfraMap.webBrowserWebMessageReceived(Sender: TCustomEdgeBrowser;
  Args: TWebMessageReceivedEventArgs);
var
  LJsonID: PWideChar;
begin
  inherited;
  if Succeeded(Args.ArgsInterface.Get_webMessageAsJson(LJsonID)) then
  try
    var LTargetID := StrToIntDef(string(LJsonID).DeQuotedString('"'), 0);
    var LBrigade := FMapController.GetBrigadeById(LTargetID);
    if Assigned(LBrigade) then
      memChat.Lines.Add(Format('[%s] Врач: %s (%s)', [LBrigade.BrigadeNumber, LBrigade.Doctor, LBrigade.GetStatus]));
  finally
    CoTaskMemFree(LJsonID);
  end;
end;



initialization
  RegisterFrame(IDMap, TfraMap);


end.
