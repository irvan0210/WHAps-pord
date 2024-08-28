unit WHUnitChat;


interface

uses Windows;

  function CaseStr(s: string; a: array of string): Integer;
  function GetHostName:String;


implementation

function CaseStr(s: string; a: array of string): Integer;
begin
  Result := 0;
  while (Result < Length(a)) and (a[Result] <> s) do
    Inc(Result);
  if a[Result] <> s then
    Result := -1;
end;

function GetHostName:String;
var
  buffer: array[0..255] of char;
  size: dword;
begin
  size := 256;
  if GetComputerName(buffer, size) then
    Result := buffer
  else
    Result := ''
end;


end.
 