unit clsInfoPAnel;

interface

uses
SysUtils, Classes, ExtCtrls, StdCtrls, pngimage,clsAssignment_u, Graphics,Controls,Types,GraphUtil
,Windows, Messages, Variants, Forms,
  Dialogs, ComCtrls,clsGradientPanel_u, GIFImg,
  Grids, DBGrids, Spin,Review_u, Buttons,clsUsers_u, dmPat_u, DB, ADODB,ComObj;

type
  TAssInfoPanel = class(TPanel)
PRIVATE
 procedure RoundCornerOf(Control: TWinControl; iRound: integer);
PUBLIC
 myIcon : TPanel;
 MyLabelNaam,MyLabelInfo,MyLabelPoints:TLabel;
 constructor Create(AOwner: TComponent;Assingment:TAssignment;bType:boolean);

end;

implementation

{ TAssInfoPanel }
{$REGION 'Rounded conner procedure'}
procedure RoundCornerOf(Control: TWinControl; iRound: integer);
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

function Intitials(sLyn: string): string;
var
  p: Integer;
  Name,Surname : string;
begin
  Name:=copy(sLyn,1,pos(' ',sLyn)-1);
  p:=LastDelimiter(' ',sLyn);
  Surname:=Copy(sLyn,p+1,length(sLyn)-p);
  if Name = '' then
   result:=Upcase(Surname[1])
  else
  if Name = '' then
   result:=Upcase(Surname[1])
  else
   Result:=uppercase(Name[1]+surname[1])
end;

constructor TAssInfoPanel.Create(AOwner: TComponent; Assingment: TAssignment;bType:boolean);
begin
 inherited Create(AOwner);

 Width:=920;
 Height:=70;
 ParentBackground:=false;
 color:=$00FF8000;
 myIcon:=Tpanel.Create(self);



 with myIcon do
 begin
 ParentBackground:=false;
 Parent:=SELF;
   Height:=50;
   Width:=50;
   Top:=10;
   Left:=10;
   if bType then
   begin
   Color:=ColorHLSToRGB(Assingment.GetHue,200,255);
   Caption:=Intitials(Assingment.GetSubject);
   end
   else
   begin
   Color:=ColorHLSToRGB(Assingment.GetsHue,200,255);
   Caption:=Assingment.GetSName[1]+Assingment.GetSSurname[1];
   end;
   with font do
   begin
     Size:=20;
     Style:=[fsBold];
     if bType then
      ColorHLSToRGB(Assingment.GetHue,130,130)
      else
      ColorHLSToRGB(Assingment.GetSHue,130,130)
   end;
 end;
 RoundCornerOf(myIcon,50);

 MyLabelNaam:=TLabel.Create(self);
 with MyLabelNaam do
 begin
   Parent:=self;
   Font.Size:=12;
   Font.Color:=clWhite;
   Left:=80;
   Top:=15;
   Caption:=Assingment.GetAssName;
 end;

 MyLabelInfo:=TLabel.Create(self);
 with MyLabelInfo do
 begin
   Parent:=self;
   Font.Size:=12;
   Font.Color:=clWhite;
   Left:=80;
   Top:=40;
   if bType then
   begin
     if Assingment.GetStatus = 'Incomplete' then
    Caption:='Grade '+IntToStr(Assingment.GetGrade)+' '+Assingment.GetSubject+' - Due '+FormatDateTime('dddddd',Assingment.GetDueDate)
   else
    Caption:='Grade '+IntToStr(Assingment.GetGrade)+' '+Assingment.GetSubject;
   end
   else
   begin
   if Assingment.GetStatus = 'Marked' then
    Caption:='Grade '+IntToStr(Assingment.GetGrade)+' '+Assingment.GetSName+' '+Assingment.GetSSurname
   else
    Caption:='Grade '+IntToStr(Assingment.GetGrade)+' '+Assingment.GetSName+' '+Assingment.GetSSurname+' - Completed '+FormatDateTime('dddddd',Assingment.GetDateComp);
   end;
 end;

 MyLabelPoints:=TLabel.Create(self);
 with MyLabelPoints do
 begin
   Parent:=self;
   Font.Size:=12;
   Font.Color:=clWhite;
   Left:=800;
   Top:=15;
   if bType then
   begin
   if Assingment.GetStatus = 'Incomplete' then
    Caption:=IntToStr(Assingment.GetTotalMark)+' points'
   else
    Caption:=IntToStr(Assingment.GetAchievMark)+'/'+IntToStr(Assingment.GetTotalMark)+' points'
   end
   else
   begin
   if Assingment.GetStatus <> 'Marked' then
    Caption:=IntToStr(Assingment.GetTotalMark)+' points'
   else
    Caption:=IntToStr(Assingment.GetAchievMark)+'/'+IntToStr(Assingment.GetTotalMark)+' points'
   end;
end;
end;

procedure TAssInfoPanel.RoundCornerOf(Control: TWinControl; iRound: integer);
begin

end;

end.
