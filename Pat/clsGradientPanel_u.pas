unit clsGradientPanel_u;

interface

uses
 SysUtils, Math, Classes, ExtCtrls, Windows, Graphics, GraphUtil;

type
  TGradientPanel = class(TPanel)
PRIVATE
 fFrom,fTo:TColor;
 fChangeRate,fHue,fSaturation,fLuminous:integer;
PROTECTED
 procedure Paint; override;
PUBLIC
 constructor CreateRGB(AOwner: TComponent;ColorFrom,ColorTo:TColor);
 constructor CreateHSL(AOwner: TComponent;iH,iSa,iL:integer);

 procedure setColor(ColorFrom,ColorTo:TColor);
 procedure ChangeBlue;
 procedure ChangeHue;
 function GetHue:Integer;
 function GetSaturation:Integer;
 function GetLuminous:Integer;
end;

implementation

{ TGradientPanel }
procedure GradVertical(Canvas:TCanvas; Rect:TRect; FromColor, ToColor:TColor) ;
 var
   I,cnt:integer;
   dr,dg,db:Real;
   C1,C2:TColor;
   r1,r2,g1,g2,b1,b2,R,G,B:Byte;
 begin
    C1 := FromColor;
    R1 := GetRValue(C1) ;
    G1 := GetGValue(C1) ;
    B1 := GetBValue(C1) ;

    C2 := ToColor;
    R2 := GetRValue(C2) ;
    G2 := GetGValue(C2) ;
    B2 := GetBValue(C2) ;

    dr := (R2-R1) / Rect.Bottom-Rect.Top;
    dg := (G2-G1) / Rect.Bottom-Rect.Top;
    db := (B2-B1) / Rect.Bottom-Rect.Top;

    cnt := 0;
    for I := Rect.Top to Rect.Bottom-1 do
    begin
       R := R1+Ceil(dr*cnt) ;
       G := G1+Ceil(dg*cnt) ;
       B := B1+Ceil(db*cnt) ;

       Canvas.Pen.Color := RGB(R,G,B) ;
       Canvas.MoveTo(Rect.Left,I) ;
       Canvas.LineTo(Rect.Right,I) ;
       Inc(cnt) ;
    end;
 end;

procedure TGradientPanel.ChangeBlue;
  var
  blue,green,red:Integer;
begin
 blue:=GetBValue(fFrom);
 inc(blue,fChangeRate);
 if blue in [250..255] then
  fChangeRate:=-5;
 if blue in [0..5] then
  fChangeRate:=5;
 red:=GetrValue(fFrom);
 green:=GetgValue(fFrom);
 fFrom:=RGB(red,green,blue);
 paint;
end;

procedure TGradientPanel.ChangeHue;
begin
 inc(fHue,fChangeRate);
 if fHue in [253..255] then
  fChangeRate:=-1;
 if fHue in [0..2] then
  fChangeRate:=1;

 fFrom:=ColorHLSToRGB(fHue,fLuminous,fSaturation);
 fTo:=ColorHLSToRGB((fHue + 50) mod 255, fLuminous,fSaturation);

 Paint;
end;

constructor TGradientPanel.CreateHSL(AOwner: TComponent; iH, iSa, iL: integer);
begin
  inherited Create(AOwner);
  Self.ParentBackground := FALSE;
  fHue:=iH;
  fSaturation:=iSa;
  fLuminous:=iL;
  fFrom:=ColorHLSToRGB(fHue,fLuminous,fSaturation);
  fTo:=ColorHLSToRGB((fHue+50) mod 255,fLuminous,fSaturation);
  fChangeRate:=1;
end;

constructor TGradientPanel.CreateRGB(AOwner: TComponent; ColorFrom,
  ColorTo: TColor);
begin
  inherited Create(AOwner);
  Self.ParentBackground := FALSE;
  fFrom:=ColorFrom;
  fTo:=ColorTo;
  fChangeRate:=5;
  fHue:=0;
  fSaturation:=255;
  fLuminous:=127;
end;

function TGradientPanel.GetHue: Integer;
begin
 Result :=fHue;
end;

function TGradientPanel.GetLuminous: Integer;
begin
 Result :=fLuminous
end;

function TGradientPanel.GetSaturation: Integer;
begin
 Result :=fSaturation;
end;

procedure TGradientPanel.Paint;
var
  rect : TRect;
begin
  rect := GetClientRect;
  GradVertical( Self.Canvas, rect, fFrom, fTo);
end;

procedure TGradientPanel.setColor(ColorFrom, ColorTo: TColor);
begin
 fFrom:=ColorFrom;
 fTo:=ColorTo;
 paint
end;


end.
