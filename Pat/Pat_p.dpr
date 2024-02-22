program Pat_p;

uses
  Forms,
  Pat_u in 'Pat_u.pas' {Form2},
  clsGradientPanel_u in 'clsGradientPanel_u.pas',
  Review_u in 'Review_u.pas' {frmInfo},
  dmPat_u in 'dmPat_u.pas' {dmPat: TDataModule},
  clsInfoPAnel in 'clsInfoPAnel.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TfrmInfo, frmInfo);
  Application.CreateForm(TdmPat, dmPat);
  Application.Run;
end.
