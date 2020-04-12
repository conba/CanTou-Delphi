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

  // 创建新表
  function Create(): PMyList;
  // 追加元素
  procedure Add(List: PMyList; Data: Pointer);
  // 插入元素
  procedure Insert(List: PMyList; Data: Pointer; Index: Integer);
  // 删除指定位置元素
  procedure Delete(List: PMyList; Index: Integer);
  // 在表中查找指定元素
  function Search(List: PMyList; Data: Pointer; SearchFunc: TSearchFunc): Integer;
  // 清空表
  procedure Clear(List: TMyList);
  // 释放表
  procedure Destroy(List: TMyList);

implementation

  // 创建新表
function Create(): PMyList;
begin
  New(Result);
  Result^.Count := 0;
  Result^.Node := nil;
end;

  // 追加元素
procedure Add(List: PMyList; Data: Pointer);
var
  MyNode, TempNode: PMyNode;
begin
  // 先不考虑Data=nil和List=nil的情况
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

  // 插入元素
procedure Insert(List: PMyList; Data: Pointer; Index: Integer);
begin
  //

end;

  // 删除指定位置元素
procedure Delete(List: PMyList; Index: Integer);
begin

end;

  // 在表中查找指定元素
function Search(List: PMyList; Data: Pointer; SearchFunc: TSearchFunc): Integer;
begin

end;

  // 清空表
procedure Clear(List: TMyList);
begin

end;

  // 释放表
procedure Destroy(List: TMyList);
begin

end;

end.
