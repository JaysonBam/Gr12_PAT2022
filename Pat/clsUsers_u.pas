unit clsUsers_u;

interface
 uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,clsAssignment_u,dmPat_u;

type
  TUser = class(TObject)
  PRIVATE
    { Private declarations }
    fEmail,fNaam,fSurname,fPassword,fStatus,fUserTipe,fSchool,fSubject:string;
    fID,fGrade,fTUsers,fTAss,fTReturns:integer;
    fPremuim:boolean;
    farrUsers:array[1..200] of integer;
    procedure LoadAss;
    procedure LoadUsers;
  PUBLIC
    { Public declarations }
    farrAss:array[1..200] of TAssignment;
    constructor LogIn(sEmail:string);

    function GetStatus : string;
    function GetUserTipe : string;
    function GetEmail :string;
    function GetName : string;
    function GetSurname : string;
    function GetSchool : string;
    function GetGrade : integer;
    function GetPremuim : boolean;
    function GetID : Integer;
    function GetTotalAss : Integer;
    function GetTotalUser : Integer;
    function GetTotalReturns : Integer;
    procedure SetCorrectPass;
    procedure SetPassword(sPassword:string);

    procedure LogInPass(sPassword:string);
    function ToString : string;



  end;
implementation

{ TUser }

{$REGION 'Get functions'}
function TUser.GetEmail: string;
begin
Result:=fEmail;
end;

function TUser.GetGrade: integer;
begin
Result:=fGrade
end;

function TUser.GetID: Integer;
begin
Result:=fID
end;

function TUser.GetName: string;
begin
Result:=fNaam
end;

function TUser.GetPremuim: boolean;
begin
 Result:=fPremuim;
end;

function TUser.GetSchool: string;
begin
Result:=fSchool
end;

function TUser.GetStatus: string;
begin
Result:=fStatus;
end;

function TUser.GetSurname: string;
begin
Result:=fSurname
end;

function TUser.GetTotalAss: Integer;
begin
Result:=fTAss;
end;

function TUser.GetTotalReturns: Integer;
begin
Result:=fTReturns
end;

function TUser.GetTotalUser: Integer;
begin
Result:=fTUsers;
end;

function TUser.GetUserTipe: string;
begin
Result:=fUserTipe;
end;
{$ENDREGION}

procedure TUser.LoadAss;
var
  I: Integer;
  sWhere:string;
begin
fTAss:=0;
if fNaam='' then exit;

if fUserTipe='Student' then
 begin
  for I := 0 to fTUsers do
  if I=1 then
   sWhere:='Teacher_ID = '+IntToStr(farrUsers[I])
  else
   sWhere:=sWhere + ' OR Teacher_ID = '+IntToStr(farrUsers[I]);
  with dmPat do
  begin
   Qry.Active:=false;
   Qry.SQL.Text:='SELECT Assignment_ID FROM tblAssignment WHERE '+sWhere;
   Qry.Active:=true;

   Qry.Open;
   qry.First;
   while not Qry.Eof do
   begin
     inc(fTAss);
     farrAss[fTAss]:=TAssignment.Create(fID,Qry['Assignment_ID']);
     Qry.Next
   end;
  end;
 end;
fTReturns:=0;
 if fUserTipe='Teacher' then
  with dmPat do
  begin
   Qry.Active:=false;
   Qry.SQL.Text:='SELECT Assignment_ID FROM tblAssignment WHERE Teacher_ID = '+ IntToStr(fID);
   Qry.Active:=true;

   Qry.Open;
   qry.First;
   while not Qry.Eof do
   begin
     for I := 1 to fTUsers do
     begin
     inc(fTReturns);
   //  ShowMessage('RID'+IntToStr(fTReturns)+#13+'A'+IntToStr(Qry['Assignment_ID'])+#13+'s'+IntToStr(farrUsers[I]));
     farrAss[fTReturns]:=TAssignment.Create(farrUsers[I],Qry['Assignment_ID']);
     end;
     Qry.Next
   end;
  end;

end;

procedure TUser.LoadUsers;
begin
fTUsers:=0;
if fUserTipe='Student' then
with dmPat do
begin
 tblRel.Open;
 tblRel.First;
 while not tblRel.eof do
 begin
   if tblRel['Student_ID']=fID then
    begin
      inc(fTUsers);
      farrUsers[fTUsers]:=tblRel['Teacher_ID'];
    end;
   tblRel.Next
 end;
end;

if fUserTipe='Teacher' then
with dmPat do
begin
 tblRel.Open;
 tblRel.First;
 while not tblRel.eof do
 begin
   if tblRel['Teacher_ID']=fID then
    begin
      inc(fTUsers);
      farrUsers[fTUsers]:=tblRel['Student_ID'];
    end;
   tblRel.Next
 end;
end
end;

constructor TUser.LogIn(sEmail: string);
begin
 fEmail:=sEmail;
 fStatus:='EDNE';//Email does not excits
 //dmpat
 //dmPat.tblUsers.Open;
 with dmPat do
 begin
  tblUsers.Open;
  tblUsers.first;
  while (not tblUsers.Eof) and (fStatus='EDNE') do
  begin
   if UpperCase(tblUsers['Email'])=Uppercase(fEmail) then
   begin
    fStatus:='EDE';//Email does excits
    fPassword:=tblUsers['Password'];
    fID:=tblUsers['User_ID'];
    fNaam:=tblUsers['Name'];
    fSurname:=tblUsers['Surname'];
    fUserTipe:=tblUsers['Profile_Type'];
    if fUserTipe = 'Admin' then exit  ;
    fSchool:=tblUsers['School'];
    if  tblUsers['Subject'] <> null then

    fSubject:=tblUsers['Subject'];
    fPremuim:=tblUsers['Premium'];
    fGrade:=tblUsers['Grade'];
    LoadUsers;
    LoadAss;
   end;
   tblUsers.Next
  end;
 end;

end;

procedure TUser.LogInPass(sPassword: string);
begin
 if fStatus<>'EDNE' then
 begin
  if sPassword=fPassword then
   fStatus:='PC'//Password Coprrect
  else
  fStatus:='PI';//Password Incorrect

 end;
end;

procedure TUser.SetCorrectPass;
begin
 fStatus:='PC'
end;

procedure TUser.SetPassword(sPassword: string);
begin
fPassword:=sPassword;
end;

function TUser.ToString;
var
  I: Integer;
begin
 for I := 1 to fTUsers do
  result:=result+inttostr(farrUsers[I])+#13
end;

end.
