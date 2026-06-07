unit mcrResourcesDM;

interface

uses
  System.SysUtils, System.Classes, System.ImageList, Vcl.ImgList, Vcl.Controls,
  cxImageList, cxGraphics, cxStyles, dxLayoutLookAndFeels, cxClasses, dxCore, dxSkinMetropolisDark,
  Generics.Defaults, Generics.Collections, cxContainer, cxEdit;


type
  TdmResources = class(TDataModule)
    cxEditStyleController1: TcxEditStyleController;
    dxLayoutLookAndFeelList1: TdxLayoutLookAndFeelList;
    dxLayoutStandardLookAndFeel1: TdxLayoutStandardLookAndFeel;
    dxLayoutCxLookAndFeel1: TdxLayoutCxLookAndFeel;
    dxLayoutCxLookAndFeelMetropolisDark: TdxLayoutCxLookAndFeel;
    dxLayoutCxLookAndFeelNavy: TdxLayoutCxLookAndFeel;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    cxStyle4: TcxStyle;
    cxStyle5: TcxStyle;
    stEmplCaption: TcxStyle;
    stEmplContent: TcxStyle;
    ilMainNavigation: TcxImageList;
    ilButtons: TcxImageList;
    ilPriority: TcxImageList;
    ilNavBar24: TcxImageList;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
     procedure SetLookAndFeelNativeStyle(AEnabled: Boolean);
  public
    { Public declarations }
  end;

var
  dmResources: TdmResources;


implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TdmResources }

procedure TdmResources.DataModuleCreate(Sender: TObject);
begin
  SetLookAndFeelNativeStyle(False);
end;

procedure TdmResources.SetLookAndFeelNativeStyle(AEnabled: Boolean);
begin
  dxLayoutCxLookAndFeel1.LookAndFeel.NativeStyle := AEnabled;
  dxLayoutCxLookAndFeelMetropolisDark.LookAndFeel.NativeStyle := AEnabled;
  dxLayoutCxLookAndFeelNavy.LookAndFeel.NativeStyle := AEnabled;
end;

end.
