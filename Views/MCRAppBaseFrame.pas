unit MCRAppBaseFrame;

{$I cxVer.inc}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, DB, Types,
  dxCustomTileControl, dxTileBar, mcrResourcesDM, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, dxLayoutcxEditAdapters, dxLayoutContainer, cxTextEdit, cxMaskEdit, cxButtonEdit, cxClasses,
  dxLayoutControl, dxGDIPlusClasses, cxImage, cxGridTableView, cxGroupBox, cxCustomData, cxGridCustomTableView,
  dxCore, dxUIAClasses;

const
  IDFirst = 0;

  IDCalls = IDFirst + 1;
  IDCallsEdit = IDFirst + 2;

  IDBrigades = IDFirst + 3;
  IDMap = IDFirst + 4;

  IDLast = IDMap;

  UM_AFTERACTIVATE = WM_USER + 1;
  UM_BEFOREACTIVATE = WM_USER + 2;

type

  { TfraBase }

  TfraBase = class(TFrame)
    dxLayoutControl1Group_Root: TdxLayoutGroup;
    dxLayoutControl1: TdxLayoutControl;
    dxLayoutGroup2: TdxLayoutGroup;
    cxGroupBox1: TcxGroupBox;
    dxLayoutControl2Group_Root: TdxLayoutGroup;
    dxLayoutControl2: TdxLayoutControl;
    dxLayoutGroup4: TdxLayoutGroup;
    lgBackButton: TdxLayoutGroup;
    liiBackButton: TdxLayoutImageItem;
    procedure dxLayoutControl1Click(Sender: TObject);
  private
    FActivatingCount: Integer;

    procedure AfterActivate(var Message: TWMSize); message UM_AFTERACTIVATE;
    procedure BeforeActivate(var Message: TWMSize); message UM_BEFOREACTIVATE;
    procedure Translate;
    procedure TranslationChanged;
  protected
    procedure AssignGridFilterBoxFont(Sender: TcxCustomGridTableItem; AValueList: TcxDataFilterValueList); virtual;

    procedure DoAfterActivate; virtual;
    procedure DoAfterDeactivate; virtual;
    procedure DoBeforeActivate; virtual;
    procedure DoOnBackButtonClick; virtual;

    function GetParentFrameTileItem: TdxTileControlItem; virtual;

    procedure ReturnToParentFrame;
    procedure ShowEditPage(AItem: TdxTileBarItem); virtual;

    property ActivatingCount: Integer read FActivatingCount;

    function CanCloseQuery: Boolean; virtual;
    function IsDataChanged: Boolean; virtual;
    procedure RefreshInfo; virtual;
    procedure SaveData; virtual;

  public
    procedure AfterConstruction; override;
    procedure BeforeDestruction; override;

    function CanDeactivate: Boolean; virtual;

    property ParentFrameTileItem: TdxTileControlItem read GetParentFrameTileItem;

    procedure Init; virtual;
    procedure Done;  virtual;

  end;

  TfraBaseClass = class of TfraBase;

function GetDetailControlClass(ATag: Integer): TfraBaseClass;
procedure RegisterFrame(AID: Integer; AFrameClass: TfraBaseClass);

implementation

{$R *.dfm}

uses
  System.UITypes, cxGeometry, dxFilterPopupWindow, dxFilterValueContainer, mcrMainForm;

type
  TdxCustomFilterValueContainerAcccess = class(TdxCustomFilterValueContainer);
  TdxTileBarItemAccess = class(TdxTileBarItem);
  TdxTileControlDetailSiteAccess = class(TdxTileControlDetailSite);
  TFilterPopupAccess = class(TdxFilterPopupWindow);

var
  MCRAppFrameClasses: array [IDFirst..IDLast] of TfraBaseClass;

{ TfrmBase }

procedure TfraBase.AfterActivate(var Message: TWMSize);
begin
  DoAfterActivate;
end;

procedure TfraBase.BeforeActivate(var Message: TWMSize);
begin
  DoBeforeActivate;
end;

procedure TfraBase.AssignGridFilterBoxFont(Sender: TcxCustomGridTableItem; AValueList: TcxDataFilterValueList);
var
  AStyle: TcxContainerStyle;
  AFilterPopup: TFilterPopupAccess;
  AViewParams: TcxViewParams;
begin
  Sender.Styles.GetContentParams(nil, AViewParams);
  AFilterPopup := TFilterPopupAccess(Sender.GridView.Controller.FilterPopup);
  AStyle := TdxCustomFilterValueContainerAcccess(AFilterPopup.FilterValueContainer).Style;
  AStyle.Font := AViewParams.Font;
  AStyle.Font.Color := AViewParams.TextColor;
end;

function TfraBase.CanCloseQuery: Boolean;
begin
  Result := not IsDataChanged;
  if not Result then
  begin
    Result := MessageDlg('Сохранить измения?', mtConfirmation, [mbOk, mbCancel], 0) = IDOK;
    //if Result then
      //DataSet.Cancel;
  end;
end;

procedure TfraBase.AfterConstruction;
begin
   Init();
end;

procedure TfraBase.BeforeDestruction;
begin
  Done();
end;

function TfraBase.CanDeactivate: Boolean;
begin
  Result := not IsDataChanged or CanCloseQuery;
end;

procedure TfraBase.DoAfterActivate;
begin
  Inc(FActivatingCount);
  Screen.Cursor := crHourGlass;
  try
    RefreshInfo;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfraBase.DoAfterDeactivate;
begin
//
end;

procedure TfraBase.DoBeforeActivate;
begin
//
end;

procedure TfraBase.Done;
begin
 //
end;

procedure TfraBase.DoOnBackButtonClick;
begin
//
end;

procedure TfraBase.dxLayoutControl1Click(Sender: TObject);
begin
  if (Sender = dxLayoutControl1) and lgBackButton.Visible and
      cxRectPtIn(liiBackButton.ViewInfo.Bounds, dxLayoutControl1.ScreenToClient(GetMouseCursorPos)) then
    DoOnBackButtonClick;
end;


function TfraBase.GetParentFrameTileItem: TdxTileControlItem;
begin
  Result := nil;
end;

procedure TfraBase.Init;
begin

end;

function TfraBase.IsDataChanged: Boolean;
begin
//  Result := (DataSet <> nil) and (DataSet.State = dsEdit);
   Result := true; //TMP - TO-DO
end;

procedure TfraBase.ReturnToParentFrame;
begin
   TdxTileControlDetailSiteAccess(frmMain.tbMain.ActiveDetail).DoDeactivate;
end;

procedure TfraBase.SaveData;
begin
//  if IsDataChanged then
//     DataSet.Post;
end;

procedure TfraBase.ShowEditPage(AItem: TdxTileBarItem);
var
  ATileBarItem: TdxTileBarItemAccess;
begin
  ATileBarItem := TdxTileBarItemAccess(AItem);
  if ATileBarItem.IsEnabled then    // the MainForm.tbMain remains same focused item
    ATileBarItem.DoClick;
end;

procedure TfraBase.Translate;
begin
// do nothing
end;

procedure TfraBase.RefreshInfo;
begin
// do nothing
end;

procedure TfraBase.TranslationChanged;
begin
  Translate;
end;

function GetDetailControlClass(ATag: Integer): TfraBaseClass;
begin
  Result := MCRAppFrameClasses[ATag];
end;

procedure RegisterFrame(AID: Integer; AFrameClass: TfraBaseClass);
begin
   MCRAppFrameClasses[AID] := AFrameClass;
end;

end.
