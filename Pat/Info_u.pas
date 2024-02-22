unit Info_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, pngimage, ExtCtrls;

type
  TfrmInfo = class(TForm)
    pnlMain: TPanel;
    pnlOpsoming: TPanel;
    shpBar1: TShape;
    shpBar2: TShape;
    shpBar3: TShape;
    shpBar4: TShape;
    shpBar5: TShape;
    shpStar5: TShape;
    shpStar4: TShape;
    shpStar3: TShape;
    shpStar2: TShape;
    shpStar1: TShape;
    lblPunt: TLabel;
    pnlReview: TPanel;
    lblName: TLabel;
    lblRespond: TLabel;
    imgStar1: TImage;
    imgStar2: TImage;
    imgStar3: TImage;
    imgStar4: TImage;
    imgStar5: TImage;
    mmoReview: TMemo;
    btnCancel: TButton;
    pnlReview2: TPanel;
    pnlPost: TPanel;
    pnlNext: TPanel;
    redtInfo: TRichEdit;
     procedure Refresh();
    procedure btnCancelClick(Sender: TObject);
    procedure pnlPostClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure imgStar1Click(Sender: TObject);
    procedure imgStar2Click(Sender: TObject);
    procedure imgStar3Click(Sender: TObject);
    procedure imgStar4Click(Sender: TObject);
    procedure imgStar5Click(Sender: TObject);
    procedure pnlNextClick(Sender: TObject);
  private
    { Private declarations }
    tFile:TextFile;
    bPostMode:Boolean;
    sPostStar:string;
    iTotal,iNext:Integer;
  public
    { Public declarations }
  end;

var
  frmInfo: TfrmInfo;

implementation

{$R *.dfm}

procedure TfrmInfo.pnlPostClick(Sender: TObject);
var
sName:string;
begin
 if pnlPost.Caption='Post Review'
  then
  begin
   bPostMode:=True;
   sPostStar:='0';
   pnlPost.Caption:='Post';
   imgStar1.Show;
   imgStar2.Show;
   imgStar3.Show;
   imgStar4.Show;
   imgStar5.Show;
   imgStar1.Picture.LoadFromFile('PAT Img/StarGray.png');
   imgStar2.Picture.LoadFromFile('PAT Img/StarGray.png');
   imgStar3.Picture.LoadFromFile('PAT Img/StarGray.png');
   imgStar4.Picture.LoadFromFile('PAT Img/StarGray.png');
   imgStar5.Picture.LoadFromFile('PAT Img/StarGray.png');

   mmoReview.Clear;
   mmoReview.Color:=clWhite;
   mmoReview.ReadOnly:=False;
   mmoReview.SetFocus;

   lblRespond.Caption:='';
   btnCancel.Visible:=True;
  end
 else
  begin
   if sPostStar='0'
    then
    begin
      MessageDlg('Please choose Star rating',mtError,mbOKCancel,0);
      Exit;
    end;

   if mmoReview.Lines[0]=''
    then
    begin
      MessageDlg('Please enter Review',mtError,mbOKCancel,0);
      Exit;
    end;
   sName:=InputBox('Name','Please enter you name and surname','');

   imgStar1.Picture.LoadFromFile('PAT Img/StarYellow.png');
   imgStar2.Picture.LoadFromFile('PAT Img/StarYellow.png');
   imgStar3.Picture.LoadFromFile('PAT Img/StarYellow.png');
   imgStar4.Picture.LoadFromFile('PAT Img/StarYellow.png');
   imgStar5.Picture.LoadFromFile('PAT Img/StarYellow.png');

   mmoReview.Color:=$00B8FF95;
   mmoReview.ReadOnly:=True;

   Append(tFile);
    Writeln(tFile,sPostStar);
    Writeln(tFile,sName);
    Writeln(tFile,DateToStr(date) );
    Writeln(tFile,mmoReview.Lines[0]);
    Writeln(tFile,'');
   CloseFile(tFile);

   pnlPost.Caption:='Post Review';

   frmInfo.Refresh;
   btnCancel.Visible:=False;

  end;

end;

procedure TfrmInfo.Refresh() ;
var
  I,i1,i2,i3,i4,i5: Integer;
  sStar,sName,sDate,sReview,sRespond,sNext:string;
begin
 bPostMode:=False;

 AssignFile(tFile,'Rewies.txt');
 if FileExists('Rewies.txt')=false
  then
  begin
    ShowMessage('');
    Exit;
  end;

  iNext:=1;

  i1:=0;
  i2:=0;
  i3:=0;
  i4:=0;
  i5:=0;
  iTotal:=0;

  Reset(tFile);
    while not Eof(tFile) do
     begin
       Readln(tFile,sStar);
       Readln(tFile,sNext);
       Readln(tFile,sNext);
       Readln(tFile,sNext);
       Readln(tFile,sNext);

       case sStar[1] of
        '1':Inc(i1);
        '2':Inc(i2);
        '3':Inc(i3);
        '4':Inc(i4);
        '5':Inc(i5);
       end;

       Inc(iTotal)
     end;
  CloseFile(tFile);

 lblPunt.Caption:=FloatToStrF((i1*1+i2*2+i3*3+i4*4+i5*5)/iTotal,ffFixed,8,1)+'/5';
 shpStar5.Width:=Trunc(i5/iTotal*150);
 shpStar4.Width:=Trunc(i4/iTotal*150);
 shpStar3.Width:=Trunc(i3/iTotal*150);
 shpStar2.Width:=Trunc(i2/iTotal*150);
 shpStar1.Width:=Trunc(i1/iTotal*150);


 Reset(tFile);

 Readln(tFile,sStar);//2
 Readln(tFile,sName);//Hailey York
 Readln(tFile,sDate);//2020/07/17
 Readln(tFile,sReview);//I forgot my password and now I cannot use my account.
 Readln(tFile,sRespond);//We are working on an update to make it easy to log in when you have you forgot your password.

 if sStar='5'
  then
   begin
    imgStar1.Show;
    imgStar2.Show;
    imgStar3.Show;
    imgStar4.Show;
    imgStar5.Show;
   end;

 if sStar='4'
  then
   begin
    imgStar1.Show;
    imgStar2.Show;
    imgStar3.Show;
    imgStar4.Show;
    imgStar5.Hide;
   end;

 if sStar='3'
  then
   begin
    imgStar1.Show;
    imgStar2.Show;
    imgStar3.Show;
    imgStar4.Hide;
    imgStar5.Hide;
   end;

 if sStar='2'
  then
   begin
    imgStar1.Show;
    imgStar2.Show;
    imgStar3.Hide;
    imgStar4.Hide;
    imgStar5.Hide;
   end;

 if sStar='1'
  then
   begin
    imgStar1.Show;
    imgStar2.Hide;
    imgStar3.Hide;
    imgStar4.Hide;
    imgStar5.Hide;
   end;

 mmoReview.Clear;
 mmoReview.Lines.Add(sReview+' -'+sName);
 mmoReview.Lines.Add(sDate);
 lblRespond.Caption:=sRespond;
end;

procedure TfrmInfo.btnCancelClick(Sender: TObject);
begin
 bPostMode:=False;
 imgStar1.Picture.LoadFromFile('PAT Img/StarYellow.png');
 imgStar2.Picture.LoadFromFile('PAT Img/StarYellow.png');
 imgStar3.Picture.LoadFromFile('PAT Img/StarYellow.png');
 imgStar4.Picture.LoadFromFile('PAT Img/StarYellow.png');
 imgStar5.Picture.LoadFromFile('PAT Img/StarYellow.png');

 mmoReview.Color:=$00B8FF95;
 mmoReview.ReadOnly:=True;

 pnlPost.Caption:='Post Review';

 frmInfo.Refresh;
 btnCancel.Visible:=False;
end;








procedure TfrmInfo.FormActivate(Sender: TObject);
begin
 frmInfo.Refresh;

 redtInfo.Clear;
 redtInfo.Lines.LoadFromFile('Info.txt')
end;

procedure TfrmInfo.imgStar1Click(Sender: TObject);
begin
 if bPostMode
  then
  begin
   imgStar1.Picture.LoadFromFile('PAT Img/StarYellow.png');
   imgStar2.Picture.LoadFromFile('PAT Img/StarGray.png');
   imgStar3.Picture.LoadFromFile('PAT Img/StarGray.png');
   imgStar4.Picture.LoadFromFile('PAT Img/StarGray.png');
   imgStar5.Picture.LoadFromFile('PAT Img/StarGray.png');

   sPostStar:='1';
  end;
end;

procedure TfrmInfo.imgStar2Click(Sender: TObject);
begin
 if bPostMode
  then
  begin
   imgStar1.Picture.LoadFromFile('PAT Img/StarYellow.png');
   imgStar2.Picture.LoadFromFile('PAT Img/StarYellow.png');
   imgStar3.Picture.LoadFromFile('PAT Img/StarGray.png');
   imgStar4.Picture.LoadFromFile('PAT Img/StarGray.png');
   imgStar5.Picture.LoadFromFile('PAT Img/StarGray.png');

   sPostStar:='2';
  end;
end;

procedure TfrmInfo.imgStar3Click(Sender: TObject);
begin
 if bPostMode
  then
  begin
   imgStar1.Picture.LoadFromFile('PAT Img/StarYellow.png');
   imgStar2.Picture.LoadFromFile('PAT Img/StarYellow.png');
   imgStar3.Picture.LoadFromFile('PAT Img/StarYellow.png');
   imgStar4.Picture.LoadFromFile('PAT Img/StarGray.png');
   imgStar5.Picture.LoadFromFile('PAT Img/StarGray.png');

   sPostStar:='3';
  end;
end;

procedure TfrmInfo.imgStar4Click(Sender: TObject);
begin
 if bPostMode
  then
  begin
   imgStar1.Picture.LoadFromFile('PAT Img/StarYellow.png');
   imgStar2.Picture.LoadFromFile('PAT Img/StarYellow.png');
   imgStar3.Picture.LoadFromFile('PAT Img/StarYellow.png');
   imgStar4.Picture.LoadFromFile('PAT Img/StarYellow.png');
   imgStar5.Picture.LoadFromFile('PAT Img/StarGray.png');

   sPostStar:='4';
  end;
end;

procedure TfrmInfo.imgStar5Click(Sender: TObject);
begin
 if bPostMode
  then
  begin
   imgStar1.Picture.LoadFromFile('PAT Img/StarYellow.png');
   imgStar2.Picture.LoadFromFile('PAT Img/StarYellow.png');
   imgStar3.Picture.LoadFromFile('PAT Img/StarYellow.png');
   imgStar4.Picture.LoadFromFile('PAT Img/StarYellow.png');
   imgStar5.Picture.LoadFromFile('PAT Img/StarYellow.png');

   sPostStar:='5';
  end;
end;

procedure TfrmInfo.pnlNextClick(Sender: TObject);
var
  sStar,sName,sDate,sReview,sRespond,sNext:string;
  I: Integer;
begin
 if bPostMode=False then
  begin
if iTotal=iNext then
    begin
     Reset(tfile);;
     ShowMessage('You have read all the reviews');
     iNext:=0;//0 omdat dit aan einde next na 1

    end;

  for I := 1 to 29 do
   begin
     pnlReview.Left:=pnlReview.Left-20;
     pnlReview2.Left:=pnlReview2.Left-20;
     Sleep(1);
     if I=29 then pnlReview2.Left:=10;

   end;

   Readln(tFile,sStar);//2
   Readln(tFile,sName);//Hailey York
   Readln(tFile,sDate);//2020/07/17
   Readln(tFile,sReview);//I forgot my password and now I cannot use my account.
   Readln(tFile,sRespond);//We are working on an update to make it easy to log in when you have you forgot your password.

   if sStar='5'
    then
     begin
      imgStar1.Show;
      imgStar2.Show;
      imgStar3.Show;
      imgStar4.Show;
      imgStar5.Show;
     end;

   if sStar='4'
    then
     begin
      imgStar1.Show;
      imgStar2.Show;
      imgStar3.Show;
      imgStar4.Show;
      imgStar5.Hide;
     end;

   if sStar='3'
    then
     begin
      imgStar1.Show;
      imgStar2.Show;
      imgStar3.Show;
      imgStar4.Hide;
      imgStar5.Hide;
     end;

   if sStar='2'
    then
     begin
      imgStar1.Show;
      imgStar2.Show;
      imgStar3.Hide;
      imgStar4.Hide;
      imgStar5.Hide;
     end;

   if sStar='1'
    then
     begin
      imgStar1.Show;
      imgStar2.Hide;
      imgStar3.Hide;
      imgStar4.Hide;
      imgStar5.Hide;
     end;
   mmoReview.Clear;
   mmoReview.Lines.Add(sReview+' -'+sName);
   mmoReview.Lines.Add(sDate);
   lblRespond.Caption:=sRespond;

   pnlReview.left:=10;
   pnlReview2.Left:=580;

   Inc(iNext);
  end;

end;



end.
