unit Pat_u;


interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, pngimage, ExtCtrls,clsGradientPanel_u, GIFImg,
  Grids, DBGrids, Spin,Review_u, Buttons,clsUsers_u, dmPat_u, DB, ADODB,ComObj,clsAssignment_u,clsInfoPAnel,ShellAPI;

type
 TIcons = class
   PRIVATE
    fUnfilled,fFilled,fText:string;
    fImage:TImage;
    fLabel:TLabel;
    fTabsheet:TTabSheet;
    fOrder:integer;
   PUBLIC
   constructor create(iType,iOrder:integer);
   procedure Click;
   procedure Fill;
   procedure Unfill;

 end;

type
  TForm2 = class(TForm)
    pnlTaskBar: TPanel;
    imgIcon1: TImage;
    lblIcon1: TLabel;
    imgIcon2: TImage;
    lblIcon2: TLabel;
    lblIcon3: TLabel;
    lblIcon4: TLabel;
    imgIcon3: TImage;
    imgIcon4: TImage;
    pnlSelect: TPanel;
    pgcMain: TPageControl;
    tsSignIn: TTabSheet;
    imgSIBLogo: TImage;
    imgSIBback: TImage;
    edtSIB: TEdit;
    btnEnter: TButton;
    lblSIBtitle: TLabel;
    lblSIBor: TLabel;
    lblSIBNext: TLabel;
    tsInfo: TTabSheet;
    tsAss: TTabSheet;
    pnlAssignment: TPanel;
    tsUnlock: TTabSheet;
    pnlPersonalInfo: TPanel;
    imgStatic1: TImage;
    shpstatic1: TShape;
    imgStatic2: TImage;
    lblStstic1: TLabel;
    lblPersonalInfo: TLabel;
    lblName: TLabel;
    lblSurname: TLabel;
    lblEmail: TLabel;
    lblSchoolInfo: TLabel;
    lblSchoolName: TLabel;
    lblGrade: TLabel;
    lblSubject: TLabel;
    edtName: TEdit;
    edtSurname: TEdit;
    edtEmail: TEdit;
    edtSchoolName: TEdit;
    edtSubject: TEdit;
    sedtGrade: TSpinEdit;
    dbgInfoBlad: TDBGrid;
    btnSave: TButton;
    tsMarks: TTabSheet;
    pnlMarks: TPanel;
    dbgMarks: TDBGrid;
    shppurple: TShape;
    imgmark: TImage;
    pnl3: TPanel;
    imglock: TImage;
    imgLock2: TImage;
    lblLock: TLabel;
    lblLock2: TLabel;
    pnl4: TPanel;
    lblAssigned: TLabel;
    pnl5: TPanel;
    lblCompleted: TLabel;
    pnlAssignSelect: TPanel;
    pnlCompleteSelect: TPanel;
    pgc1: TPageControl;
    tsLogIn: TTabSheet;
    tsUser: TTabSheet;
    pgc2: TPageControl;
    pnlexit: TPanel;
    imgInfo: TImage;
    imgClose: TImage;
    scrlbxAssigned: TScrollBox;
    scrlbxCompleted: TScrollBox;
    tsAssView: TTabSheet;
    pnlAssView: TPanel;
    imgAssBack: TImage;
    lblAssName: TLabel;
    lblAssDue: TLabel;
    lblTitel1: TLabel;
    lblTitel2: TLabel;
    lblTitel3: TLabel;
    mmoInstruction: TMemo;
    pnlHandIn: TPanel;
    btnReference: TButton;
    btnMyWork: TButton;
    edtReference: TEdit;
    edtMyWork: TEdit;
    lstSQL: TListBox;
    pnlBo: TPanel;
    pnlOnder: TPanel;
    lblPremuim: TLabel;
    imgPremuim: TImage;
    edtCardNum: TEdit;
    edtNameonCard: TEdit;
    edtCVV: TEdit;
    edtPay: TButton;
    imgGif: TImage;
    lblCap: TLabel;
    shpSirkel: TShape;
    lblCardNumbr: TLabel;
    lblNOC: TLabel;
    lblCVV: TLabel;
    redtPremuim: TRichEdit;
    btnReset: TButton;
    imgLogOut: TImage;
    Button2: TButton;
    procedure FormActivate(Sender: TObject);
    procedure pnlSignInBoxMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure pnl1MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure imgIcon1Click(Sender: TObject);
    procedure imgIcon2Click(Sender: TObject);
    procedure imgIcon3Click(Sender: TObject);
    procedure imgIcon4Click(Sender: TObject);
    procedure imgReviewClick(Sender: TObject);
    procedure imgIcon2MouseEnter(Sender: TObject);
    procedure imgIcon1MouseEnter(Sender: TObject);
    procedure imgIcon1MouseLeave(Sender: TObject);
    procedure imgIcon2MouseLeave(Sender: TObject);
    procedure imgIcon3MouseEnter(Sender: TObject);
    procedure imgIcon3MouseLeave(Sender: TObject);
    procedure imgIcon4MouseEnter(Sender: TObject);
    procedure imgIcon4MouseLeave(Sender: TObject);
    procedure pnl4Click(Sender: TObject);
    procedure pnl5Click(Sender: TObject);
    procedure imgInfoClick(Sender: TObject);
    procedure imgCloseClick(Sender: TObject);
    procedure btnReferenceClick(Sender: TObject);
    procedure btnMyWorkClick(Sender: TObject);
    procedure lstSQLClick(Sender: TObject);
    procedure btnResetClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure imgLogOutClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure edtPayClick(Sender: TObject);
    procedure pnlHandInClick(Sender: TObject);
  private
    { Private declarations }
    MySignInGradient1:TGradientPanel;
    MySignInGradient2:TGradientPanel;
    MySignInGradient3:TGradientPanel;
    Icon1,Icon2,Icon3,Icon4:TIcons;
    iIcon:integer;
    objUser : TUser;

    iAssingment:Integer;
    arrAssPanel : array[1..200] of TAssInfoPanel;

    myPanel : tpANEL;
    MyImage : TImage;
  public
    { Public declarations }
    arrSql : array[1..5,0..5,0..5,0..1] of string ;
    arrPos : array[0..3] of Integer;
    Level,A,B,C:integer;
    bSkip:boolean;
    iAss:integer;

    function FindFile: string;
    function MyMessageDlg(CONST Msg: string; DlgTypt: TmsgDlgType; button: TMsgDlgButtons;Caption: ARRAY OF string; dlgcaption: string): Integer;
    function RecordExits(sString,sField:string;Table :TADOTable) : boolean;

    procedure ShowSignIn(Sender: TObject);
    procedure ShowEnterPass(Sender: TObject);
    procedure ShowChangePass(Sender: TObject);
    procedure ShowSignUp(Sender: TObject);
    procedure ShowStudentForm(Sender: TObject);
    procedure RoundCornerOf(Control: TWinControl; iRound: integer);
    procedure GreyOut;
    procedure PremuimLock;
    procedure SendMail(sTo,sSubject,sBody:string);
    procedure InfoPanelClick(Sender:TObject);
    procedure ChangePassClick(Sender:TObject);

    procedure RunSQL;

  end;
var
  Form2: TForm2;

const
   tiProfile = 0;
   tiAssignment = 1;
   tiAnalytics = 2;
   tiPremuim = 3;
   tiClear = 4;
   tiSql = 5;


implementation

{$R *.dfm}

procedure TForm2.FormActivate(Sender: TObject);
var
Profile : TIcons;
begin
 tsSignIn.Show;//Konstrueer die gradient panel
 MySignInGradient1:=TGradientPanel.CreateHSL(tsLogIn,100,255,195);
 MySignInGradient1.Parent:=tsLogIn;
 MySignInGradient1.Align:=alClient;
 MySignInGradient1.OnMouseMove:=pnlSignInBoxMouseMove;

 pnlexit.Parent:=MySignInGradient1;//Wys eerste blad op inteken
 pgc2.Parent:=MySignInGradient1;
 ShowSignIn(Sender);
 RoundCornerOf(pgc2,50);
 RoundCornerOf(pnlexit,20);

 MySignInGradient3:=TGradientPanel.CreateRGB(tsUser,$00FF8000,clblack);//Konstrueer die gradient panel
 MySignInGradient3.Parent:=tsUser;
 MySignInGradient3.Align:=alClient;
 pgcMain.Parent:=MySignInGradient3;

 bSkip:=false;
end;

{$REGION 'Rounded conner procedure'}
procedure TForm2.RoundCornerOf(Control: TWinControl; iRound: integer);
 var
   R: TRect;
   Rgn: HRGN;
begin
   with Control do
   begin
     R := ClientRect;
     rgn := CreateRoundRectRgn(R.Left, R.Top, R.Right, R.Bottom, iRound, iRound );
     Perform(EM_GETRECT, 0, lParam(@r)) ;
     InflateRect(r, - 4, - 4) ;
     Perform(EM_SETRECTNP, 0, lParam(@r)) ;
     SetWindowRgn(Handle, rgn, True) ;
     Invalidate;
   end;
end;

{$ENDREGION}

{$REGION 'Custom meaage dialog function'}
function TForm2.MyMessageDlg(CONST Msg: string; DlgTypt: TmsgDlgType; button: TMsgDlgButtons;
  Caption: ARRAY OF string; dlgcaption: string): Integer;
var
  aMsgdlg: TForm;
  i: Integer;
  Dlgbutton: Tbutton;
  Captionindex: Integer;
begin
  aMsgdlg := createMessageDialog(Msg, DlgTypt, button);
  aMsgdlg.Caption := dlgcaption;
  aMsgdlg.BiDiMode := bdRightToLeft;
  Captionindex := 0;
  for i := 0 to aMsgdlg.componentcount - 1 Do
  begin
    if (aMsgdlg.components[i] is Tbutton) then
    Begin
      Dlgbutton := Tbutton(aMsgdlg.components[i]);
      if Captionindex <= High(Caption) then
        Dlgbutton.Caption := Caption[Captionindex];
      inc(Captionindex);
    end;
  end;
  Result := aMsgdlg.Showmodal;
end;
{$ENDREGION}

{$REGION 'Find file function'}
function TForm2.FindFile: string;
  var
  dlg:TOpenDialog;
begin
Result:='';
dlg:=TOpenDialog.Create(nil);
try
  dlg.InitialDir:='C:\';
  dlg.FileName:='';
  dlg.Filter:='All files (*.*)|*.*';
  if dlg.Execute then
   Result:=dlg.FileName;
finally
   dlg.Free
end;
end;
{$ENDREGION}

{$REGION 'Send Mail procedure'}
procedure TForm2.SendMail(sTo, sSubject, sBody: string);
var
  Outlook: OLEVariant;
  MailItem: Variant;
begin
 try
  //Kry outlook uit RAM
   Outlook:=GetActiveOleObject('Outlook.Application') ;
 except
  //Anders sit outlook in RAM
   Outlook:=CreateOleObject('Outlook.Application') ;
 end;
  try
   //Maak dinamiese Variant
    MailItem := Outlook.CreateItem(0) ;
     MailItem.Subject := sSubject;
     MailItem.Recipients.Add(sTo);
     MailItem.Body :=sBody;
     MailItem.Send;
  finally
   //Haal Outlook uit RAM
    Outlook := Unassigned;
  end;
end;
{$ENDREGION}

procedure TForm2.imgReviewClick(Sender: TObject);
begin
 frmInfo.Show;  //Wys review blad
end;


{$REGION 'Sign in'}
function TForm2.RecordExits(sString,sField:string;Table :TADOTable) : boolean; //kyk of record in veld bestaan
begin
 Result:=false;
 table.Open;
 table.First;
   while (not Table.eof) and (Result=false) do
   begin
     if table[sField]=sString then
      Result:=True;
     Table.Next
   end;
end;

procedure TForm2.ShowSignIn(Sender: TObject);
begin
edtSIB.Clear;
edtSIB.PasswordChar:=#0;
//Display info
 lblSIBNext.Visible:=true;
 lblSIBNext.Visible:=true;
 imgSIBback.Visible:=false;
 lblSIBtitle.Caption:='Log in with Email';
 lblSIBNext.Caption:='Don''t have an acount? Click here';
 edtSIB.SetFocus;
 lblSIBor.Width:=400;
 lblSIBNext.Width:=400;
 lblSIBor.Alignment:=taCenter;
 lblSIBNext.Alignment:=taCenter;
//Set OnClick
 btnEnter.OnClick:=ShowEnterPass;
 lblSIBNext.OnClick:=ShowSignUp;
end;

procedure TForm2.ShowSignUp(Sender: TObject);
var
sEmail,sPass:string;
bPass,bSpecialNumber,bCap:boolean;
  I: Integer;
begin
 repeat
  bPass:=true; //Vlag vir email valideer
  sEmail:=InputBox('Sign Up','Enter Email'+#13+'Enter "CANCEL" to cancel','');
  if sEmail='CANCEL' then exit;

  if sEmail='' then                                                      //Valideer email
   begin
    MessageDlg('Please enter your email',mtError,[mbOK],0) ;
    bPass:=false;
   end;
  if pos('@',sEmail)=0 then
   begin
    MessageDlg('Not valid email',mtError,[mbOK],0) ;
    bPass:=false;
   end;
  if RecordExits(sEmail,'Email',dmPat.tblUsers) then
   begin
    MessageDlg('Email already exits',mtError,[mbOK],0) ;
    bPass:=false;
   end;
 until bPass;

 begin
 repeat
  bPass:=true;//Vlag vir password valideer
  sPass:=InputBox('Create password','Password must have these following :'+#13+'8 characters long'+#13+'Speacial characters or Number'+#13+'Capital letter'+#13#13+'Enter "CANCEL" to cancel','');
  if sPass='CANCEL' then exit;

  if sPass='' then
   begin
    MessageDlg('Please password',mtError,[mbOK],0) ;                     //valideer password
    bPass:=false;
   end;
  if length(sPass)<8 then
   begin
    MessageDlg('Password to short',mtError,[mbOK],0) ;
    bPass:=false;
   end;

  bCap:=false;
  bSpecialNumber:=false;
 for I := 1 to length(sPass) do
  begin
  if sPass[I] in ['A'..'Z'] then bCap:=true;
  if not ((sPass[I] in ['A'..'Z']) or (sPass[I] in ['a'..'z'])) then bSpecialNumber:=true;
  end;

  if not bCap then
   begin
    MessageDlg('No captital characters',mtError,[mbOK],0) ;
    bPass:=false;
   end;

    if not bSpecialNumber then
   begin
    MessageDlg('No spesial characters or number',mtError,[mbOK],0) ;
    bPass:=false;
   end;
 until bPass;
 end;

 with dmPat do
 begin
  tblUsers.Open;
  tblUsers.Last;                                                    //Lees nuwe gebruiker in
  tblUsers.Insert;
    tblUsers['Email']:=sEmail;
    tblUsers['Password']:=sPass;
    tblUsers['Premium']:=false;
    tblUsers['Name']:='';
    tblUsers['Surname']:='';
    tblUsers['Grade']:=0;
    tblUsers['Subject']:='';
    tblUsers['School']:='';
    case InputBox('User Type','Enter T for teacher'+#13+'   or S for Student','')[1] of
    'T':tblUsers['Profile_Type']:='Teacher';
    'S':tblUsers['Profile_Type']:='Student';
    end;
    tblUsers['Profile_Hue']:=random(254)+1;
  tblUsers.Post;

  objUser:=TUser.LogIn(sEmail);
   bSkip:=true;
  ShowStudentForm(self);
 end;

end;

procedure TForm2.ShowEnterPass(Sender: TObject);
var
iMessage:integer;
begin
 objUser:=TUser.LogIn(edtSIB.Text);
//Display info
 if edtSIB.Text='' then
 begin
  MessageDlg('Please enter email adres',mtError,[mbYes,mbNo],0);
  exit
 end                                                            //Valideer wagwoord
 else
 if objUser.GetStatus = 'EDNE' then
 begin
  if MyMessageDlg('Email addres is incorrect or does not exist',mtError,[mbYes,mbNo],['Try again','New account'],'Tick it off') = mrNo
  then ShowSignUp(self);
  exit;
 end;
 imgSIBback.Visible:=True;
 lblSIBtitle.Caption:='Enter Password';
 lblSIBNext.Caption:='Forgot Password? Click here';
 edtSIB.SetFocus;
 lblSIBNext.Visible:=true;
 lblSIBor.Visible:=true;
 lblSIBor.Width:=400;
 lblSIBNext.Width:=400;
 lblSIBor.Alignment:=taCenter;
 lblSIBNext.Alignment:=taCenter;
//Set OnClick
 btnEnter.OnClick:=ShowStudentForm;
 lblSIBNext.OnClick:=ShowChangePass;
 imgSIBback.OnClick:=ShowSignIn;

edtSIB.Clear;
edtSIB.PasswordChar:='*';
end;

procedure TForm2.ShowChangePass(Sender: TObject); //Wys die Wagwoord inlees form
var
sCode:string;
  I: Integer;
begin
edtSIB.PasswordChar:='*';
edtSIB.Clear;
for I := 0 to 5 do
 sCode:=sCode+ inttostr(Random(10));

SendMail(objUser.GetEmail,'Reset password for Tick it off',sCode);

if inputbox('Reset Password','Enter the code send to '+objUser.GetEmail,'')=sCode then
begin
//Display info
 imgSIBback.Visible:=True;
 lblSIBtitle.Caption:='Enter new password';
 lblSIBNext.Visible:=false;
 lblSIBor.Visible:=false;
 edtSIB.SetFocus;
//Set OnClick
 btnEnter.OnClick:=ChangePassClick;
 imgSIBback.OnClick:=ShowSignIn;


end;
end;

procedure TForm2.ShowStudentForm(Sender: TObject);
var
ParentScroll:TWinControl;

  I,K,J,L,P1,P2,P3: Integer;
  tFile:TextFile;
  sTitel,sSQL,sLyn:string;
begin
if not bSkip then
begin
objUser.LogInPass(edtSIB.Text);
 if edtSIB.Text='' then
 begin
   MessageDlg('Please enter password',mtError,mbOKCancel,0);
   exit
 end
 else
 if objUser.GetStatus = 'PI' then
 begin
  if MyMessageDlg('Password incorrect' + #9 + 'If you forgot your password you can reset it',mtError,[mbYes,mbNo],['Try again','New Password'],'Tick it off') = mrNo
  then ShowChangePass(self);
   exit;
 end;
end;

 //ShowMessage('Form');
 pgcMain.Left:=20;

 if objUser.GetUserTipe='Student' then //wys icons vir Studente
 begin
  {$REGION 'Icon 1'}
 Icon1:=TIcons.create(tiProfile,1);
 edtName.Text:=objUser.GetName;
 edtSurname.Text:=objUser.GetSurname;
 edtEmail.Text:=objUser.GetEmail;
 edtSchoolName.Text:=objUser.GetSchool;
 sedtGrade.Value:=objUser.GetGrade;
 edtSubject.Visible:=false;
 lblSubject.Visible:=false;
 with dmPat do
 begin
  qryInfo.Active:=false;
  qryInfo.sql.text:='Select Name & " " & Surname as [Name and Surname],Subject,Email' +
                    ' From tblUsers U,tblRelationship R '+
                    ' Where Teacher_ID = User_ID and Student_ID = ' +IntToStr(objUser.GetID) ;
  qryInfo.Active:=true;
  dbgInfoBlad.Columns[0].Width:=120;
 end;
{$ENDREGION}
  {$REGION 'Icon 2'}
 Icon2:=TIcons.create(tiAssignment,2);
  for I := 1 to objUser.GetTotalAss do
 begin
  if objUser.farrAss[I].GetStatus = 'Incomplete' then
   ParentScroll:=scrlbxAssigned
  else
   ParentScroll:=scrlbxCompleted;

   arrAssPanel[I]:=TAssInfoPanel.Create(ParentScroll,objUser.farrAss[I],true);
   with arrAssPanel[I] do
   begin
     Parent:=ParentScroll;
     Align:=alTop;
   end;
   TPanel(arrAssPanel[I]).Name:='Info'+IntToStr(I);
   TPanel(arrAssPanel[I]).Caption:='';
   arrAssPanel[I].OnClick:=InfoPanelClick;
   RoundCornerOf(arrAssPanel[I],25);
   RoundCornerOf(arrAssPanel[I].myIcon,50);
   scrlbxAssigned.Visible:=true;
   scrlbxCompleted.Visible:=false;
   RoundCornerOf(pnlHandIn,25);
  pnlHandIn.Caption:='Hand in';

 end;
{$ENDREGION}
  {$REGION 'Icon 3'}
 Icon3:=TIcons.create(tiClear,3);
{$ENDREGION}
  {$REGION 'Icon 4'}
 Icon4:=TIcons.create(tiClear,4);
{$ENDREGION}
 end;
 if objUser.GetUserTipe='Teacher' then //wys icons vir Teachers
 begin
  {$REGION 'Icon 1'}
 Icon1:=TIcons.create(tiProfile,1);
 edtName.Text:=objUser.GetName;
 edtSurname.Text:=objUser.GetSurname;
 edtEmail.Text:=objUser.GetEmail;
 edtSchoolName.Text:=objUser.GetSchool;
 sedtGrade.Value:=objUser.GetGrade;
 edtSubject.Visible:=false;
 lblSubject.Visible:=false;
 with dmPat do
 begin
  qryInfo.Active:=false;
  qryInfo.sql.text:='Select Name & " " & Surname as [Name and Surname],Email' +
                    ' From tblUsers U,tblRelationship R '+
                    ' Where Student_ID = User_ID and Teacher_ID = ' +IntToStr(objUser.GetID) +
                    ' ORDER BY Surname' ;
  qryInfo.Active:=true;
  dbgInfoBlad.Columns[0].Width:=120;
 end;
{$ENDREGION}
  {$REGION 'Icon 2'}
 Icon2:=TIcons.create(tiAssignment,2);
 //ShowMessage(inttostr(objUser.GetTotalAss));
  for I := 1 to objUser.GetTotalReturns do
 begin
 //ShowMessage(inttostr(I)+#13+inttostr(objUser.farrAss[I].GetReturnID))
  if objUser.farrAss[I].GetStatus = 'Marked' then
   ParentScroll:=scrlbxCompleted
  else
    ParentScroll:=scrlbxAssigned;

   arrAssPanel[I]:=TAssInfoPanel.Create(ParentScroll,objUser.farrAss[I],false);
   with arrAssPanel[I] do
   begin
     Parent:=ParentScroll;
     Align:=alTop;
   end;
   TPanel(arrAssPanel[I]).Name:='Info'+IntToStr(I);
   TPanel(arrAssPanel[I]).Caption:='';
   arrAssPanel[I].OnClick:=InfoPanelClick;
   RoundCornerOf(arrAssPanel[I],25);
   RoundCornerOf(arrAssPanel[I].myIcon,50);
   scrlbxAssigned.Visible:=true;
   scrlbxCompleted.Visible:=false;
   RoundCornerOf(pnlHandIn,25);
   pnlHandIn.Caption:='Grade';
 end;
 begin
  end;
  {$ENDREGION}
  {$REGION 'Icon 3'}
  Icon3:=TIcons.create(tiAnalytics,3);
  //T_ID:='9';
  AssignFile(tFile,'ArraySQL.txt');
  Reset(tFile);
  while not eof(tFile) do
  begin
   Readln(tFile,sLyn);
   P1:=StrToInt(sLyn[1]);
   P2:=StrToInt(sLyn[3]);
   P3:=StrToInt(sLyn[5]);
   sTitel:=Copy(sLyn,7,pos('#',sLyn)-7);
   sSQL:=Copy(sLyn,pos('#',sLyn)+1,length(sLyn));
   arrSql[P1,P2,P3,0]:=sTitel;
   arrSql[P1,P2,P3,1]:=sSQL;
  end;
 CloseFile(tFile);
 Level:=0;
 A:=0;
 B:=0;
 C:=0;

 for I := 0 to 3 do
 arrPos[I]:=0;

 if not objUser.GetPremuim then  PremuimLock;

  {$ENDREGION}
  {$REGION 'Icon 4'}
   Icon4:=TIcons.create(tiPremuim,4);
   (ImgGif.Picture.Graphic as TGIFImage).Animate := True;
   lblPremuim.Width:=992;
  {$ENDREGION}
  end;
 if objUser.GetUserTipe='Admin' then  //wys icons vir Admin
 begin
  {$REGION 'Icon 4'}
   Icon1:=TIcons.create(tiProfile,1);
  {$ENDREGION}
  {$REGION 'Icon 4'}
   Icon2:=TIcons.create(tiSql,2);
  {$ENDREGION}
  {$REGION 'Icon 4'}
   Icon3:=TIcons.create(tiClear,3);
  {$ENDREGION}
  {$REGION 'Icon 4'}
   Icon4:=TIcons.create(tiClear,4);
  {$ENDREGION}
 end;


 Icon1.click;
end;
procedure TForm2.ChangePassClick(Sender: TObject); //Laat ons inkom na wagwoord verander
begin
 objUser.SetPassword(edtSIB.text);
 ShowStudentForm(self);
end;
{$ENDREGION}

{$REGION 'Assingment Info Blad'}
procedure TForm2.btnMyWorkClick(Sender: TObject);
var
sFile:string;
sName:String;
begin
 if btnMyWork.Caption='Add File' then   //As veld leeg is lees ler in
 begin
   sName:=inputbox('Enter file name','Enter name of file ( and extension)','');
   CopyFile(PChar(FindFile),PChar('D:\Pat 2022\Main prog 7 ND\Attachment\'+sName),true) ;
   edtMyWork.Text:=sName;
   btnMyWork.Caption:='Open';
 end
 else
 begin            //anders maak ler oop
  if FileExists('D:\Pat 2022\Main prog 7 ND\Attachment\'+edtMyWork.Text) then

  ShellExecute(0, 'Open', PChar('D:\Pat 2022\Main prog 7 ND\Attachment\'+edtMyWork.Text), PChar(''), PChar(''),
  SW_SHOWNORMAL)
  else
  MessageDlg('This file does not exists in our systym',mtError,[mbOK],0)
 end;
end;

procedure TForm2.btnReferenceClick(Sender: TObject);  //Maak ler oop
begin
if FileExists('D:\Pat 2022\Main prog 7 ND\Attachment\'+edtReference.Text) then

ShellExecute(0, 'Open', PChar('D:\Pat 2022\Main prog 7 ND\Attachment\'+edtReference.Text), PChar(''), PChar(''),
SW_SHOWNORMAL)
else
MessageDlg('This file does not exists in our systym',mtError,[mbOK],0)
end;

procedure TForm2.InfoPanelClick( Sender: TObject);
var

Assignment:TAssignment;//Vertoon Assessering informasie
begin
 iAss:=StrToInt(copy(TPanel(Sender).Name,5,length(TPanel(Sender).Name)));
 Assignment:=objUser.farrAss[iass];
 tsAssView.Show;
 lblAssName.Caption:=Assignment.GetAssName;
 lblAssDue.Caption:=FormatDateTime('dddddd hh:mm',Assignment.GetDueDate);
 lblAssName.Width:=993;
 lblAssDue.Width:=993;
 mmoInstruction.Clear;
 mmoInstruction.Lines.Add(Assignment.GetInstruction);
 if Assignment.GetA_Attach='' then //as daar niks is nie vertoon niks
  btnReference.Enabled:=false
 else
 begin
  btnReference.Enabled:=true;
  edtReference.Text:=Assignment.GetA_Attach;
 end;

 if Assignment.GetS_Attach='' then
 Begin                             //as daar niks is nie vertoon niks
  btnMyWork.Caption:='Add File';
  edtMyWork.Text:='';
 End
 else
 begin                          //anders vertoon Open
  btnMyWork.Caption:='Open';
  edtMyWork.Text:=Assignment.GetS_Attach;
 end;

end;

procedure TForm2.pnl4Click(Sender: TObject);
begin
 pnlAssignSelect.Visible:=true;           //Wys die een blad
 pnlCompleteSelect.Visible:=false;
 lblAssigned.Font.Color:=$00FF8000;
 lblCompleted.Font.Color:=clSilver;
 scrlbxCompleted.Visible:=false;
 scrlbxAssigned.Visible:=true;
end;

procedure TForm2.pnl5Click(Sender: TObject);   //Wys die ander blad
begin
 pnlCompleteSelect.Visible:=true;
 pnlAssignSelect.Visible:=false;
 lblCompleted.Font.Color:=$00FF8000;
 lblAssigned.Font.Color:=clSilver;
 scrlbxCompleted.Visible:=true;
 scrlbxAssigned.Visible:=false;
end;
procedure TForm2.pnlHandInClick(Sender: TObject);
var
iMark,iPos:integer;
begin
 if pnlHandIn.Caption='Hand in' then        //as dit n student is lees die assering info in
 begin
   with dmPat do
   begin
     tblReturn.Open;
     tblReturn.First;
     while not tblReturn.Eof do
       if (tblReturn['Assignment_ID']=objUser.farrAss[iAss].GetReturnID)  then
       begin
        tblReturn.edit;                             //Lees voltooide data in
        tblReturn['Status']:='Complete';
        tblReturn['Attachment']:=edtMyWork.Text;
        tblReturn['Date_Completed']:=date;
        tblReturn.post;
       end;
     tblReturn.next;
   end;
 end
 else
   with dmPat do                                    //anders gee die juffriu n punt
   begin
     repeat
     Val(InputBox('Grade','Mark achievied',''),iMark,iPos); //valideer getal
     until iPos=0 ;

     tblReturn.Open;
     tblReturn.First;
     while not tblReturn.Eof do
     begin
       if tblReturn['Return_ID']=objUser.farrAss[iAss].GetReturnID then
       begin
        tblReturn.edit;
        tblReturn['Status']:='Marked';
        tblReturn['Marks_achieved']:=iMark;            //Lees gemerkte info in
        tblReturn['Date_Marked']:=date;
        tblReturn.post;
       end;
     tblReturn.next;
     end;
   end;
end;

{$ENDREGION}

{$REGION 'Gradient panel'}
procedure TForm2.pnl1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
 MySignInGradient1.ChangeHue;
end;

procedure TForm2.pnlSignInBoxMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
 MySignInGradient1.ChangeHue;
end;
{$ENDREGION}

procedure TForm2.PremuimLock;         //Maak analitic toe
begin
 pnl3.Parent:=pnlMarks;
 pnl3.Align:=alClient;
 pnl3.Visible:=true;
end;


{$REGION 'Icons'}
procedure TForm2.GreyOut;
begin
Icon1.Unfill;
Icon2.Unfill;             //Maak almel grys
Icon3.Unfill;
Icon4.Unfill;
end;

procedure TForm2.imgIcon4Click(Sender: TObject);
begin
 Icon4.Click;              //stel sy onclick
end;

procedure TForm2.imgIcon4MouseEnter(Sender: TObject);
begin
 Icon4.Fill                  //Maak dit blou
end;

procedure TForm2.imgIcon4MouseLeave(Sender: TObject);
begin
 Icon4.Unfill                //Maak dit grys
end;

procedure TForm2.imgInfoClick(Sender: TObject);
begin
 frmInfo.show
end;

procedure TForm2.imgIcon2Click(Sender: TObject);
begin
 Icon2.Click;                //stel sy onclick
end;

procedure TForm2.imgIcon2MouseEnter(Sender: TObject);
begin
 Icon2.Fill;                  //Maak dit blou
end;

procedure TForm2.imgIcon2MouseLeave(Sender: TObject);
begin
 Icon2.Unfill;                  //Maak dit blou
end;

procedure TForm2.imgIcon3Click(Sender: TObject);
begin
 Icon3.Click;                //stel sy onclick
end;

procedure TForm2.imgIcon3MouseEnter(Sender: TObject);
begin
 Icon3.Fill                     //Maak dit blou
end;

procedure TForm2.imgIcon3MouseLeave(Sender: TObject);
begin
 Icon3.Unfill                   //Maak dit grys
end;

procedure TForm2.imgCloseClick(Sender: TObject);
begin
 close
end;

procedure TForm2.imgIcon1Click(Sender: TObject);
begin                            //stel sy onclick
 Icon1.click
end;

procedure TForm2.imgIcon1MouseEnter(Sender: TObject);
begin
 Icon1.Fill;
end;                             //Maak dit blou

procedure TForm2.imgIcon1MouseLeave(Sender: TObject);
begin
 Icon1.Unfill;                    //Maak dit grys
end;
{ TIcons }

procedure TIcons.click;
begin
if fText='' then exit  ;  //Run code nie as icon nie bestaan

 Form2.iIcon:=fOrder;
 Form2.GreyOut;
 fTabsheet.Show;
 fImage.Picture.LoadFromFile(fFilled);
 fLabel.Font.Color:=$00FF8000;
 fLabel.Width:=75;
 Form2.pnlSelect.Top := 70*fOrder-60;
end;

constructor TIcons.create(iType, iOrder: integer);
begin
 case iType of
  tiProfile :                               //lees regte image in
   begin
    fUnfilled:='PAT Img/ProfileU.png';
    fFilled:='PAT Img/ProfileF.png';
    fTabsheet:=Form2.tsInfo;
    fText:='Profile'
   end;
  tiAssignment :
   begin
    fUnfilled:='PAT Img/AssignmentU.png';
    fFilled:='PAT Img/AssignmentF.png';
    fTabsheet:=Form2.tsAss;
    fText:='Assignment'
   end;
  tiAnalytics :
   begin
    fUnfilled:='PAT Img/AnalyticsU.png';
    fFilled:='PAT Img/AnalyticsF.png';
    fTabsheet:=Form2.tsMarks;
    fText:='Analytics'
   end;
  tiPremuim :
   begin
    fUnfilled:='PAT Img/PremiumU.png';
    fFilled:='PAT Img/PremiumF.png';
    fTabsheet:=Form2.tsUnlock;
    fText:='Premium'
   end;
  tiClear :
   begin
    fUnfilled:='PAT Img/black.png';
    fFilled:='PAT Img/black.png';
    fText:=''
   end;
  tiSql :
   begin
    fUnfilled:='PAT Img/SqlU.png';
    fFilled:='PAT Img/SqlF.png';
    fTabsheet:=Form2.tsUnlock;
    fText:='SQL'
   end;

 end;
 case iOrder of                             //sit dit in regte volgorde
  1:
   begin
     fImage:=Form2.imgIcon1;
     fLabel:=Form2.lblIcon1;
   end;
  2:
   begin
     fImage:=Form2.imgIcon2;
     fLabel:=Form2.lblIcon2;
   end;
  3:
   begin
     fImage:=Form2.imgIcon3;
     fLabel:=Form2.lblIcon3;
   end;
  4:
   begin
     fImage:=Form2.imgIcon4;
     fLabel:=Form2.lblIcon4;
   end;
 end;
 fOrder:=iOrder;
 fImage.Picture.LoadFromFile(fUnfilled);
 fLabel.Caption:=fText;
 fLabel.Width:=75;
end;

procedure TIcons.Fill;
begin
 fImage.Picture.LoadFromFile(fFilled);       //maak dit blou
 fLabel.Font.Color:=$00FF8000;
 fLabel.Width:=75;
end;

procedure TIcons.Unfill;
begin
 if fOrder<>Form2.iIcon then
 begin                                           //maak dit grys
  fImage.Picture.LoadFromFile(fUnfilled);
  fLabel.Font.Color:=$00818181;
  fLabel.Width:=75;
 end;
end;
{$ENDREGION}

{$REGION 'Text SQL'}
procedure TForm2.RunSQL;
var
sSQL,Parameter1,Parameter2,sParameter:string;
iParameter:integer;
begin
 sSQL:=arrSql[arrPos[1],arrPos[2],arrPos[3],1];  //Kry sql
 if sSQL<>'' then
 begin
   sSQL:=StringReplace(sSQL,'<T_ID>',IntToStr(objUser.GetID),[rfReplaceAll]); //Vervang parameter

   iParameter:=1;
   while pos('<p'+inttostr(iParameter),sSQL)<>0 do      //vervang verdere parameters
   begin
    sParameter:=sSQL;
    delete(sParameter,1,pos('<p'+inttostr(iParameter),sParameter)-1);
    sParameter:=copy(sParameter,1,pos('p'+inttostr(iParameter)+'>',sParameter)+2);
    sSQL:=stringreplace(sSQL,sParameter,(InputBox('Enter the appropriate response',copy(sParameter,4,length(sParameter)-6),'')),[rfReplaceAll]);
    inc(iParameter)
   end;

 with dmPat do           //run die sql
  begin
  qrytext.Active:=false;
  qrytext.SQL.Text:=sSQL;
   if arrPos[1]<=2 then
  qrytext.Active:=true
  else
  qryText.ExecSQL;
  end;

  dbgMarks.Columns[0].Width:=150;
 end;
end;


procedure TForm2.lstSQLClick(Sender: TObject);
var
I:Integer;
begin
 arrPos[Level]:=lstSQL.ItemIndex+1;
 lstSQL.Clear;
  for I := 1 to 5 do
  case Level of
   0: if arrSQL[I,0,0,0]<>'' then lstSQL.Items.Add(arrSQL[I,0,0,0]);  //lees items in op eerste level
   1: if arrSQL[arrPos[1],I,0,0]<>'' then lstSQL.Items.Add(arrSQL[arrPos[1],I,0,0]); //lees items in op Tweede level
   2: if arrSQL[arrPos[1],arrPos[2],I,0]<>'' then lstSQL.Items.Add(arrSQL[arrPos[1],arrPos[2],I,0]); //lees items in op derde level
  end;
 if Level=3 then   //herstel na eerste level
  begin
    RunSQL;
    Level:=0;
    lstSQL.OnClick(self);
  end
   else inc(Level) //gaan een level op
end;

procedure TForm2.btnResetClick(Sender: TObject);//herstel as dit breek
Var
I:Integer;
begin
 Level:=0;
 A:=0;
 B:=0;
 C:=0;

 for I := 0 to 3 do
 arrPos[I]:=0;

 lstSQL.Clear;
 lstSQL.Items.Add('Click here to start')

end;

{$ENDREGION}

procedure TForm2.btnSaveClick(Sender: TObject);
begin
 if btnSave.Caption='Edit' then    //Maak sodat jy kan verandr
 begin
   edtName.Enabled:=true;
   edtSurname.Enabled:=true;
   edtEmail.Enabled:=true;
   edtSchoolName.Enabled:=true;
   edtSubject.Enabled:=true;
   sedtGrade.Enabled:=true;
   btnSave.Caption:='Save';
 end
 else
 begin
   edtName.Enabled:=false;      //Maak sodat jy nie kan verander
   edtSurname.Enabled:=false;
   edtEmail.Enabled:=false;
   edtSchoolName.Enabled:=false;
   edtSubject.Enabled:=false;
   sedtGrade.Enabled:=false;
   btnSave.Caption:='Edit';

   with dmPat do
   begin                               //Verander Date
     tblUsers.Open;
     tblUsers.First;
     while not tblUsers.eof do
     begin
       if tblUsers['User_ID']=objUser.GetID then
       begin
         tblUsers.Edit;
         tblUsers['Name']:=edtName.Text;
         tblUsers['Surname']:=edtSurname.Text;
         tblUsers['Email']:=edtEmail.Text;
         tblUsers['School']:=edtSchoolName.Text;
         tblUsers['Subject']:=edtSurname.Text;
         tblUsers['Grade']:=sedtGrade.value;
         tblUsers.Post;
       end;
      tblUsers.next
     end;
   end;
 end;

end;

procedure TForm2.edtPayClick(Sender: TObject);
var
sCardNom,sCVV,sName:string;
bValid:boolean;
  I: Integer;
begin
 sCardNom:=edtCardNum.Text;
 sCVV:=edtCVV.Text;
 sName:=edtNameonCard.Text;

 bValid:=true;
 for I := 1 to Length(sCardNom) do                 //Valideer kaard nommer
  if not(sCardNom[I] in ['0'..'9']) then bValid:=false;
 if (bValid = false) or (Length(sCardNom)<>16) then
 begin
   ShowMessage('Card number not valid');
   exit
 end;

 bValid:=true;
 for I := 1 to Length(sCVV) do                    //Valideer CvV
  if not(sCVV[I] in ['0'..'9']) then bValid:=false;
 if (bValid = false) or (Length(sCVV)<>3) then
 begin
   ShowMessage('CVV not valid');
   exit
 end;

 MessageDlg('Payment Sucsesful',mtInformation,[mbOK],0);

 with dmPat do
 begin
   tblInvoice.open;                             //Sit betaanling in databasis
   tblInvoice.Last;
   tblInvoice.Insert;
     tblInvoice['DOP']:=date;
     tblInvoice['Ammount']:=300;
     tblInvoice['User_ID']:=objUser.GetID;
   tblInvoice.post;

   tblUsers.Open;
   tblUsers.First;
   while not tblUsers.eof do
   begin                                          //maak hulle premuim
     if tblUsers['User_ID']= objUser.GetID then
     begin
       tblUsers.Edit;
       tblUsers['Premium'] :=true;
       tblUsers.Post;
     end;
    tblUsers.Next;
    pnl3.Left:=1000;
    pnl3.Align:=alCustom;
   end;
 end;

end;

procedure TForm2.Button2Click(Sender: TObject);//Delete n assessering
var
iAssID:integer;
begin
 iAssID:=StrToInt(InputBox('Assignment ID','What Assingment ID do you want to remove','')) ;
 with dmPat do
 begin
  tblRel.Open;
  tblRel.First;
  while not tblRel.Eof do
  begin
    if tblRel['Assignment_ID']=iAssID then
     tblRel.Delete
    else
     tblRel.Next
  end;

  tblAss.Open;
  tblAss.First;
  while not tblAss.Eof do
  begin
    if tblAss['Assignment_ID']=iAssID then
     tblAss.Delete
    else
     tblAss.Next
  end;
 end;
end;

procedure TForm2.imgLogOutClick(Sender: TObject);  //Raak ontslaar van dinamiese panel as huul uitlog
var
  I: Integer;
begin
 for I := 1 to objUser.GetTotalReturns do
 begin
  arrAssPanel[I].Free;
  arrAssPanel[I]:=nil;
 end;
tsLogIn.Show;
ShowSignIn(self)
end;
end.

