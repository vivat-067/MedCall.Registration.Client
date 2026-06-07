program MedCallRegistrationApp;

uses
  Vcl.Forms,
  System.UITypes,
  System.SysUtils,
  mcrMainForm in 'Views\mcrMainForm.pas' {frmMain},
  mcrResourcesDM in 'Resources\mcrResourcesDM.pas' {dmResources: TDataModule},
  MCRAppBaseFrame in 'Views\MCRAppBaseFrame.pas' {fraBase: TFrame},
  MCRAppCallsLogFrame in 'Views\MCRAppCallsLogFrame.pas' {fraCallsLog: TFrame},
  dxSkinHybridApp in 'Resources\dxSkinHybridApp.pas',
  MCRAppBrigadesFrame in 'Views\MCRAppBrigadesFrame.pas' {fraBrigades: TFrame},
  mcrMedCallModel in 'Models\mcrMedCallModel.pas',
  mcrMedCallAPIClientService in 'Services\mcrMedCallAPIClientService.pas',
  mcrLoginForm in 'Views\mcrLoginForm.pas' {frmLogin},
  mcrAppCallsLogClasses in 'Classes\mcrAppCallsLogClasses.pas',
  mcrConverters in 'Helpers\mcrConverters.pas',
  mcrCallsLogEditForm in 'Views\mcrCallsLogEditForm.pas' {frmCallsLogEdit: TdxForm},
  mcrUtils in 'Helpers\mcrUtils.pas',
  mcrExceptionLogging in 'Helpers\mcrExceptionLogging.pas',
  mcrMedBrigadeModel in 'Models\mcrMedBrigadeModel.pas',
  mcrAppMedBrigadesLogClasses in 'Classes\mcrAppMedBrigadesLogClasses.pas',
  mcrMedBrigadeFileService in 'Services\mcrMedBrigadeFileService.pas',
  mcrAppBaseLogClasses in 'Classes\mcrAppBaseLogClasses.pas',
  mcrAppShared in 'Classes\mcrAppShared.pas',
  mcrBrigadesCallsTimeLineTestData in 'TestData\MedBrigades\mcrBrigadesCallsTimeLineTestData.pas',
  mcrAppVersionInfo in 'Helpers\mcrAppVersionInfo.pas',
  MCRAppMapFrame in 'Views\MCRAppMapFrame.pas' {fraMap: TFrame},
  mcrAppMapClasses in 'Classes\mcrAppMapClasses.pas';

{$R *.res}


begin
  Application.Initialize;
  Application.MainFormOnTaskbar := False;

  frmLogin := TfrmLogin.Create(nil);
  try
    if frmLogin.ShowModal = mrOk then
    begin
      Application.MainFormOnTaskbar := true;
      Application.Title := 'МедВызов';
  Application.CreateForm(TdmResources, dmResources);
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
    end
    else
      Application.Terminate;
  finally
    FreeAndNil(frmLogin);
  end;


end.
