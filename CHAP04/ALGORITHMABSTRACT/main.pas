unit main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

const
  PI = 3.1415;
  PI2 = 3.1415 * 2;
  GRANULARITY = 3000;

type
  TRealPoint = record
    X, Y: Real;
  end;

  TRenderFunc = function(const X: Real): Real;

  TForm1 = class(TForm)
    PaintBox: TPaintBox;
    Label1: TLabel;
    ComboBox: TComboBox;
    procedure ComboBoxSelect(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure PaintBoxPaint(Sender: TObject);
  private
    { Private declarations }
    FRenderFunc: TRenderFunc;
    FPoints: array of TRealPoint;
    function GetRealPoint(RenderFunc: TRenderFunc): Boolean;
    procedure Render(Rect: TRect);
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

function MySin(const X: Real): Real;
begin
  Result := Sin(x);
end;

function MyCos(const X: Real): Real;
begin
  Result := Cos(X);
end;

procedure TForm1.ComboBoxSelect(Sender: TObject);
begin
  case ComboBox.ItemIndex of
    0: FRenderFunc := MySin;
    1: FRenderFunc := MyCos;
  end;
  PaintBox.Invalidate;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  FRenderFunc := MySin;
end;

function TForm1.GetRealPoint(RenderFunc: TRenderFunc): Boolean;
var
  I: Integer;
begin
  Result := False;
  if not Assigned(RenderFunc) then Exit;
  SetLength(FPoints, GRANULARITY);
  if not Assigned(FPoints) then Exit;

  for I := Low(FPoints) to High(FPoints) do
  begin
    FPoints[i].X := PI2 / GRANULARITY * i;
    FPoints[i].Y := RenderFunc(FPoints[i].X);
  end;
  Result := True;
end;

procedure TForm1.PaintBoxPaint(Sender: TObject);
var
  Rect: TRect;
begin
  if not GetRealPoint(FRenderFunc) then
    Exit;
  Rect.Left := Trunc(0.05 * PaintBox.Width);
  Rect.Right := Trunc(0.95 * PaintBox.Width);
  Rect.Top := Trunc(0.05 * PaintBox.Height);
  Rect.Bottom := Trunc(0.95 * PaintBox.Height);
  Render(Rect);
end;

procedure TForm1.Render(Rect: TRect);
  function MinY(): Real;
  var
    I: Integer;
  begin
    Result := FPoints[Low(FPoints)].Y;
    for I := Low(FPoints) + 1 to High(FPoints) do
    begin
      if FPoints[i].Y < Result then
        Result := FPoints[i].Y;
    end;
  end;

  function MaxY(): Real;
  var
    I: Integer;
  begin
    Result := FPoints[Low(FPoints)].Y;
    for I := Low(FPoints) + 1 to High(FPoints) do
    begin
      if FPoints[i].Y > Result then
        Result := FPoints[i].Y;
    end;
  end;

var
  Max, Min, ScaleX, ScaleY: Real;
  NextPoint: TPoint;
  i, PaintHeight, PaintWidth: Integer;
begin
  Max := MaxY();
  Min := MinY();
  PaintHeight := Rect.Bottom - Rect.Top;
  PaintWidth := Rect.Right - Rect.Left;
  ScaleX := PaintWidth / PI2;
  ScaleY := PaintHeight / (Max - Min);
  NextPoint.X := Trunc(FPoints[Low(FPoints)].X * ScaleX);
  NextPoint.Y := Trunc((Max - FPoints[Low(FPoints)].Y) * ScaleY);
  // 以上代码的逻辑全部在逻辑区，没有到绘画区
  PaintBox.Canvas.MoveTo(Rect.Left + NextPoint.X, Rect.Top + NextPoint.Y);
  for I := Low(FPoints) + 1 to High(FPoints) do
  begin
    NextPoint.X := Trunc(FPoints[i].X * ScaleX);
    NextPoint.Y := Trunc((Max - FPoints[i].Y) * ScaleY);
    PaintBox.Canvas.LineTo(Rect.Left + NextPoint.X, Rect.Top + NextPoint.Y);
  end;
end;
//begin
//  if not Assigned(FRenderFunc) then exit;
//  Min := MinY();
//  Max := MaxY();
//  PaintHeight := Rect.Bottom - Rect.Top;
//  PaintWidth := Rect.Right - Rect.Left;
//  ScaleX := PaintWidth / PI2;
//  ScaleY := PaintHeight / (Max - Min);
//  NextPoint.X := Trunc(FPoints[Low(FPoints)].X * ScaleX);
//  NextPoint.Y := Trunc((Max - FPoints[Low(FPoints)].Y) * ScaleY);
//  Self.PaintBox.Canvas.MoveTo(Rect.Left + NextPoint.X, Rect.Top + NextPoint.Y);
//  for I := Low(FPoints)+1 to High(FPoints) do
//  begin
//    NextPoint.X := Trunc(FPoints[I].X * ScaleX);
//    NextPoint.Y := Trunc((Max - FPoints[I].Y) * ScaleY);
//    Self.PaintBox.Canvas.LineTo(Rect.Left + NextPoint.X, Rect.Top + NextPoint.Y);
//  end;
//end;

end.
