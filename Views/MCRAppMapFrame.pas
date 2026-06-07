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
  cxGrid, Vcl.Edge, dxNavBarBase, dxNavBarCollns, dxNavBar,  mcrAppMapClasses;

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
    procedure webBrowserCreateWebViewCompleted(Sender: TCustomEdgeBrowser;
      AResult: HRESULT);
    procedure webBrowserNavigationCompleted(Sender: TCustomEdgeBrowser;
      IsSuccess: Boolean; WebErrorStatus: TOleEnum);
    procedure webBrowserWebMessageReceived(Sender: TCustomEdgeBrowser;
      Args: TWebMessageReceivedEventArgs);
  private
    { Private declarations }
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
   mcrResourcesDM;

{ TfraMap }

procedure TfraMap.Init;
begin
  inherited;
   FMapController := TMapController.Create('YANDEX_MAPS_API_KEY');
   FIsMapInitialized := False;

  webBrowser.Navigate('about:blank');
 end;


procedure TfraMap.Done;
begin
  inherited;
  FreeAndNil(FMapController);
end;


procedure TfraMap.DoAfterActivate;
begin
  inherited;
  nbMain.OptionsBehavior.NavigationPane.Collapsed := True;
end;


procedure TfraMap.RefreshInfo;
begin
  inherited;
end;


procedure TfraMap.webBrowserCreateWebViewCompleted(Sender: TCustomEdgeBrowser;
  AResult: HRESULT);
begin
    FIsMapInitialized := True;
    webBrowser.NavigateToString(FMapController.GetMapHtmlContent);
end;

procedure TfraMap.webBrowserNavigationCompleted(Sender: TCustomEdgeBrowser;
  IsSuccess: Boolean; WebErrorStatus: TOleEnum);
begin
  inherited;
  if IsSuccess then
      Reload;
end;

procedure TfraMap.Reload;
begin
  if FIsMapInitialized and (webBrowser.DefaultInterface <> nil) then
    webBrowser.ExecuteScript(FMapController.GetUpdateMarkersJS);
end;

procedure TfraMap.webBrowserWebMessageReceived(Sender: TCustomEdgeBrowser;
  Args: TWebMessageReceivedEventArgs);
begin
  inherited;
    //
end;

initialization
  RegisterFrame(IDMap, TfraMap);


end.
