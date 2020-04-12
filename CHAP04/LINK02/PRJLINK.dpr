program PRJLINK;

uses
  Vcl.Forms,
  Link in 'Link.pas' {Form1},
  Point in 'Point.pas',
  Table in 'Table.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
