unit clsAssignment_u;

interface
 uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,dmPat_u;

type
  TAssignment = class(TObject)
  PRIVATE
    { Private declarations }
    fReturnID,fTeacherID,fAssID,fTMarks,fAMarks,fWeigh,fStudentID:integer;
    fInstruction,fA_Attachment,fS_Attachment,fAName,fFeedback,fStatus:string;
    fDueDate,fDateComp:TDateTime;
  PUBLIC
    { Public declarations }
    constructor Create(iStudentID,iAssID: integer);
    function GetAssName:string;
    function GetSubject :string;
    function GetHue: integer;
    function GetStatus : string;
    function GetDueDate : TDateTime;
    function GetGrade : Integer;
    function GetTotalMark : Integer;
    function GetAchievMark : Integer;
    function GetInstruction :string;
    function GetA_Attach : string;
    function GetS_Attach : string;
    function GetReturnID: Integer;
    function GetSName : String;
    function GetSSurname : String;
    function GetSHue : integer;
    function GetDateComp : TDateTime;
  end;

type
  TFeedback = class(TObject)
  PRIVATE
    { Private declarations }
    fReturnID,fTeacherID,fAssID,fTMarks,fAMarks,fWeigh:integer;
    fInstruction,fA_Attachment,fS_Attachment,fAName,fFeedback:string;
    fDueDate,fDateComp:TDateTime;
  PUBLIC
    { Public declarations }
    function GetName:string;
  end;

implementation

{ TAssignment }

constructor TAssignment.Create(iStudentID,iAssID: integer);
begin
with dmPat do
begin
 //ShowMessage(IntToStr(iStudentID));
 //ShowMessage(IntToStr(iAssID));
 qry2.Active:=false;
 qry2.SQL.Text:='SELECT *'+
                ' from tblReturn R,tblAssignment A'+
                ' where A.Assignment_ID = R.Assignment_ID  and Student_ID = '+IntToStr(iStudentID) +' and R.Assignment_ID = '+IntToStr(iAssID);
 qry2.Active:=true;
 qry2.Open;
 qry2.First;

 if qry2['Status']='Incomplete' then
 begin
   fS_Attachment:='';
 end
 else
 begin
  fS_Attachment:=qry2['R.Attachment'];
  if qry2['Status']<>'Complete' then
  fAMarks:=qry2['Marks_achieved'];
  fDateComp:=qry2['Date_Completed'];
 end;
  fStudentID:=qry2['Student_ID'];
  fReturnID:=qry2['Return_ID'];
  fStatus:=qry2['Status'];
  fTeacherID:=qry2['Teacher_ID'];
  fTMarks:=qry2['Total_marks'];
  fInstruction:=qry2['Instructions'];
  fA_Attachment:=qry2['A.Attachment'];
  fAName:=qry2['Assignment_Name'];
  fAssID:=qry2['A.Assignment_ID'];
  fDueDate:=qry2['DateTime_Due'];
  //ShowMessage('');
end;
end;

function TAssignment.GetAchievMark: Integer;
begin
Result:=fAMarks
end;

function TAssignment.GetAssName: string;
begin
Result:=fAName
end;

function TAssignment.GetA_Attach: string;
begin
 Result:=fA_Attachment
end;

function TAssignment.GetDateComp: TDateTime;
begin
Result:=fDateComp
end;

function TAssignment.GetDueDate: TDateTime;
begin
 Result:=fDueDate;
end;

function TAssignment.GetGrade: Integer;
begin
 Result:=12;
end;

function TAssignment.GetHue: integer;
begin
with dmPat do
begin
 qry2.Active:=false;
 qry2.SQL.Text:='SELECT Profile_Hue from tblUsers where User_ID = '+inttostr(fTeacherID);
 qry2.Active:=true;
 qry2.Open;
 qry2.First;
 result:=qry2['Profile_Hue']
end;
end;

function TAssignment.GetInstruction: String;
begin
Result:=fInstruction;
end;

function TAssignment.GetReturnID: Integer;
begin
Result:=fReturnID
end;

function TAssignment.GetSHue: integer;
begin
with dmPat do
begin
 qry2.Active:=false;
 qry2.SQL.Text:='SELECT Profile_Hue from tblUsers where User_ID = '+ inttostr(fStudentID);
 qry2.Active:=true;
 qry2.Open;
 qry2.First;
 result:=qry2['Profile_Hue']
end;
end;

function TAssignment.GetSName: String;
begin
with dmPat do
begin
 qry2.Active:=false;
 qry2.SQL.Text:='SELECT Name as Name from tblUsers where User_ID = '+ inttostr(fStudentID);
 qry2.Active:=true;
 qry2.Open;
 qry2.First;
 result:=qry2['Name']
end;
end;

function TAssignment.GetSSurname: String;
begin
with dmPat do
begin
 qry2.Active:=false;
 qry2.SQL.Text:='SELECT Surname from tblUsers where User_ID = '+ inttostr(fStudentID);
 qry2.Active:=true;
 qry2.Open;
 qry2.First;
 result:=qry2['Surname']
end;
end;

function TAssignment.GetStatus: string;
begin
 Result:=fStatus;
end;

function TAssignment.GetSubject: string;
begin
with dmPat do
begin
 qry2.Active:=false;
 qry2.SQL.Text:='SELECT Subject from tblUsers where User_ID = '+inttostr(fTeacherID);
 qry2.Active:=true;
 qry2.Open;
 qry2.First;
 result:=qry2['Subject']
end;
end;

function TAssignment.GetS_Attach: string;
begin
 Result:=fS_Attachment;
end;

function TAssignment.GetTotalMark: Integer;
begin
 Result:=fTMarks;
end;

{ TFeedback }



function TFeedback.GetName: string;
begin
 //
end;

end.
