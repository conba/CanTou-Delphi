program HanoiTown;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils;

procedure MoveHanoiTown(n: Integer; x, y, z: Char);
  procedure MoveOneDisk(a,b: char);
  var
    Str: string;
  begin
    Str := Format('Move from %s to %s', [a,b]);
    Writeln(Str);
  end;

begin
  if n = 1 then
    MoveOneDisk(x, z)
  else
  begin
    MoveHanoiTown(n-1, x, z, y);
    MoveOneDisk(x, z);
    MoveHanoiTown(n-1, y, x, z);
  end;
end;

var
  i: Integer;
begin
  i := 3;
  MoveHanoiTown(i, 'x', 'y', 'z');
  Readln;
end.
