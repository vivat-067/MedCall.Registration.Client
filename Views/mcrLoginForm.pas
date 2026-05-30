unit mcrLoginForm;

interface

uses
  System.Classes,  Vcl.Graphics, Vcl.Forms, Vcl.Controls, Vcl.StdCtrls, Vcl.Dialogs,
  Vcl.Buttons, Vcl.ExtCtrls, Vcl.Imaging.jpeg, cxControls, cxContainer, cxEdit, cxImage, cxLabel,
  cxGraphics,cxFormats, Winapi.Messages, cxDateUtils, Vcl.ComCtrls, Winapi.ShellAPI, Winapi.Windows,
  cxLookAndFeels, cxLookAndFeelPainters, cxClasses, cxMemo, System.SysUtils,
  dxGDIPlusClasses, cxGroupBox, dxCore, System.IOUtils, dxUIAClasses, Vcl.Menus,
  dxCoreGraphics, cxTextEdit, cxMaskEdit, cxButtonEdit, cxButtons;

type
  TfrmLogin = class(TForm)
    panMain: TcxGroupBox;
    imgBackground: TcxImage;
    labVersion: TcxLabel;
    labAPPName: TcxLabel;
    imgSpash: TcxImage;
    labAPPDomain: TcxLabel;
    btnExit: TcxButton;
    labMessage: TcxLabel;
    btnLogin: TcxButton;
    cxGroupBox1: TcxGroupBox;
    fldName: TcxButtonEdit;
    cxGroupBox2: TcxGroupBox;
    fldPassword: TcxTextEdit;
    imgLogo: TcxImage;
    labDescription: TcxLabel;
    labAuthor: TcxLabel;
    procedure FormCreate(Sender: TObject);
  private
  public
    procedure CreateParams(var Params: TCreateParams); override;
  end;


var
  frmLogin: TfrmLogin;

implementation

uses
  mcrAppVersionInfo;

{$R *.DFM}

function ShowModalForm(AForm: TForm): TModalResult;
begin
  AForm.Show;
  EnableWindow(frmLogin.Handle, False);
  try
    while AForm.ModalResult = mrNone do
      Application.ProcessMessages;
  finally
    EnableWindow(frmLogin.Handle, True);
    Result := AForm.ModalResult;
  end;
end;


procedure TfrmLogin.CreateParams(var Params: TCreateParams);
begin
  inherited CreateParams(Params);
end;

procedure TfrmLogin.FormCreate(Sender: TObject);
begin
  labVersion.Caption := Format('Версия: %s (%s)',
    [TAppVersionInfo.ToShortString, TAppVersionInfo.Build]);
end;


end.
