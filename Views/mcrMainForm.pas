//--------------------------------------------------------------------
//            МедВызов: регистрация заявок вызова СМП
// -------------------------------------------------------------------
// Демо-версия ПРОТОТИПА МЕДИЦИНСКОЙ информационной системы
// Клиент RAD Delphi / DevExpress
// Vit Vatkov   vivat-067@mail.ru

unit mcrMainForm;

interface

uses
  Types, Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls,
  Forms, StdCtrls, Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, dxCustomTileControl, cxClasses, dxTileBar,
  dxTileControl, dxSkinsForm, dxSkinsDefaultPainters, dxSkinHybridApp,
  cxContainer, cxEdit, cxGroupBox, dxForms, dxCalloutPopup, ExtCtrls, cxTextEdit,
  cxMaskEdit, cxButtonEdit, dxCore, dxUIAClasses, dxGDIPlusClasses, cxImage,
  mcrResourcesDM, MCRAppBaseFrame;

type
  TfrmMain = class(TForm)
    tbMain: TdxTileBar;
    tmMainLogGroup: TdxTileControlGroup;
    tbMainReportsGroup: TdxTileControlGroup;
    tbHiddenItemsGroup: TdxTileControlGroup;
    tbMainSetupGroup: TdxTileControlGroup;
    tbiCallsLog: TdxTileBarItem;
    tbiTasksPrint: TdxTileBarItem;
    tbiBrigades: TdxTileBarItem;
    tbiBrigadeEdit: TdxTileBarItem;
    tbiRepordDesigner: TdxTileBarItem;
    tbiReportEdit: TdxTileBarItem;
    tbiReportPartners: TdxTileBarItem;
    tbiCallsLogEdit: TdxTileBarItem;
    tbiReportsPriceLists: TdxTileBarItem;
    tbiSaleView: TdxTileBarItem;
    tbiSalesPrint: TdxTileBarItem;
    tbiSystemSetup: TdxTileBarItem;
    ptcBrigadesView: TdxTileControl;
    ptcBrigadesRegisterGroup: TdxTileControlGroup;
    ptiBrigadesCards: TdxTileControlItem;
    ptiBrigadesWorkLoad: TdxTileControlItem;
    ptiRemoteControl: TdxTileControlItem;
    ptcSystemSetup: TdxTileControl;
    ptcSystemSetupGroup: TdxTileControlGroup;
    ptiSetupUsers: TdxTileControlItem;
    ptiSetupHospitals: TdxTileControlItem;
    ptiSetupCustomers: TdxTileControlItem;
    ptiSetupAssistanceCategories: TdxTileControlItem;
    gbTop: TcxGroupBox;
    dxSkinController1: TdxSkinController;
    tbiMAP: TdxTileBarItem; // Наша добавленная плитка карты
    procedure FormCreate(Sender: TObject);
    procedure ptiSubMenuClick(Sender: TdxTileControlItem);
    procedure ptiSetupClick(Sender: TdxTileControlItem);
    procedure tbiMainTileBarActivateDetail(Sender: TdxTileControlItem); // Универсальное имя
    procedure tbiMainTileBarItemClick(Sender: TdxTileControlItem);      // Универсальное имя
    procedure tbiCallsLogEditDeactivatingDetail(Sender: TdxCustomTileControl; AItem: TdxTileControlItem; var AAllow: Boolean);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    FClickedItem: TdxTileControlItem;
    procedure ClearClickedItem;
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation
{$R *.dfm}

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  dxSkinController1.NativeStyle := False;
  tbMain.Controller.FocusedItem := tbiCallsLog;
end;

procedure TfrmMain.FormShow(Sender: TObject);
begin
 //
end;

procedure TfrmMain.ptiSetupClick(Sender: TdxTileControlItem);
begin
  tbMain.HidePopupWindow;
end;

procedure TfrmMain.ptiSubMenuClick(Sender: TdxTileControlItem);
begin
  tbMain.HidePopupWindow;
end;


procedure TfrmMain.tbiMainTileBarActivateDetail(Sender: TdxTileControlItem);
begin
  Screen.Cursor := crHourGlass;
  try
    if Sender.DetailOptions.DetailControl = nil then
      Sender.DetailOptions.DetailControl := GetDetailControlClass(Sender.Tag).Create(Self);

    SendMessage(Sender.DetailOptions.DetailControl.Handle, UM_BEFOREACTIVATE, 0, 0);
    PostMessage(Sender.DetailOptions.DetailControl.Handle, UM_AFTERACTIVATE, 0, 0);

    ClearClickedItem;
  finally
    Screen.Cursor := crDefault;
  end;
end;


procedure TfrmMain.tbiCallsLogEditDeactivatingDetail(Sender: TdxCustomTileControl; AItem: TdxTileControlItem; var AAllow: Boolean);
var
  ADetailControl: TWinControl;
begin
  ADetailControl := AItem.DetailOptions.DetailControl;
  AAllow := (ADetailControl = nil) or ((ADetailControl is TfraBase) and (FClickedItem <> TfraBase(ADetailControl).ParentFrameTileItem));

  if AAllow and (ADetailControl <> nil) and (ADetailControl is TfraBase) then
    AAllow := TfraBase(ADetailControl).CanDeactivate;
  if not AAllow then
    tbMain.Controller.FocusedItem := TfraBase(ADetailControl).ParentFrameTileItem;

  ClearClickedItem;
end;

procedure TfrmMain.tbiMainTileBarItemClick(Sender: TdxTileControlItem);
begin
  FClickedItem := Sender;
end;

procedure TfrmMain.ClearClickedItem;
begin
  FClickedItem := nil;
end;

initialization
  UseLatestCommonDialogs := False;
  TdxVisualRefinements.LightBorders := True;

end.

