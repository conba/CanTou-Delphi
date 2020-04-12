unit Table;

interface

type
  PMyNode = ^TMyNode;
  TMyNode = record
    Data: Pointer;
    Next: PMyNode;
  end;

  PMyList = ^TMyList;
  TMyList = record
    Count: Integer;
    Node: PMyNode;
  end;

  TSearchFunc = function(Where, What: Pointer): Boolean;

  // �����±�
  function Create(): PMyList;
  // ׷��Ԫ��
  procedure Add(List: PMyList; Data: Pointer);
  // ����Ԫ��
  procedure Insert(List: PMyList; Data: Pointer; Index: Integer);
  // ɾ��ָ��λ��Ԫ��
  procedure Delete(List: PMyList; Index: Integer);
  // �ڱ��в���ָ��Ԫ��
  function Search(List: PMyList; Data: Pointer; SearchFunc: TSearchFunc): Integer;
  // ��ձ�
  procedure Clear(List: TMyList);
  // �ͷű�
  procedure Destroy(List: TMyList);

implementation

  // �����±�
function Create(): PMyList;
begin
  New(Result);
  Result^.Count := 0;
  Result^.Node := nil;
end;

  // ׷��Ԫ��
procedure Add(List: PMyList; Data: Pointer);
var
  MyNode, TempNode: PMyNode;
begin
  // �Ȳ�����Data=nil��List=nil�����
  New(MyNode);
  MyNode^.Data := Pointer;
  MyNode.Data := nil;
  if List^.Node = nil then
  begin
    List^.Node := MyNode;
    List^.Count := List^.Count + 1;
  end
  else
  begin
    TempNode := List^.Node;
    while TempNode^.Next <> nil do
    begin
      TempNode := TempNode^.Next;
    end;
    TempNode^.Next := MyNode;
    List^.Count := List^.Count + 1;
  end;
end;

  // ����Ԫ��
procedure Insert(List: PMyList; Data: Pointer; Index: Integer);
begin
  //

end;

  // ɾ��ָ��λ��Ԫ��
procedure Delete(List: PMyList; Index: Integer);
begin

end;

  // �ڱ��в���ָ��Ԫ��
function Search(List: PMyList; Data: Pointer; SearchFunc: TSearchFunc): Integer;
begin

end;

  // ��ձ�
procedure Clear(List: TMyList);
begin

end;

  // �ͷű�
procedure Destroy(List: TMyList);
begin

end;

end.
