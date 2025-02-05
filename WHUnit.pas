unit WHUnit;

interface

uses ComObj, SysUtils, Grids, Variants, ShlObj, StrUtils, Dialogs, Classes, Windows, WinSock,
    ADODB, ZColorStringGrid, WinInet, OleDB, ActiveX, Jpeg, Graphics, ExtCtrls, StdCtrls;

const
    MaxPixelCount = 65536;   // or some other arbitrarily large value

type
  EBitmapError = class(Exception);
  TRGBArray    = array[0..MaxPixelCount-1] of TRGBTriple;
  pRGBArray    = ^TRGBArray;

  TArrString97 = Array [0..97] of String;
  TArrString80 = Array [0..80] of String;
  TArrString75 = Array [0..75] of String;
  TArrString55 = Array [0..55] of String;
  TArrString56 = Array [0..56] of String;
  TArrString58 = Array [0..58] of String;
  TArrString45 = Array [0..45] of String;
  TArrString40 = Array [0..40] of String;
  TArrString41 = Array [0..41] of String;
  TArrString31 = Array [0..31] of String;
  TArrString30 = Array [0..30] of String;
  TArrString32 = Array [0..32] of String;
  TArrString33 = Array [0..33] of String;
  TArrString35 = Array [0..35] of String;
  TArrString20 = Array [0..20] of String;
  TArrString21 = Array [0..21] of String;
  TArrString22 = Array [0..22] of String;
  TArrString25 = Array [0..25] of String;
  TArrString27 = Array [0..27] of String;
  TArrString18 = Array [0..18] of String;
  TArrString19 = Array [0..19] of String;
  TArrString17 = Array [0..17] of String;
  TArrString16 = Array [0..16] of String;
  TArrString14 = Array [0..14] of String;
  TArrString11 = Array [0..11] of String;
  TArrString10 = Array [0..10] of String;
  TArrString9 = Array [0..9] of String;
  TArrString8 = Array [0..8] of String;
  TArrString7 = Array [0..7] of String;
  //18 juni 2013 Start
  TArrString5 = Array [0..5] of String;
  //18 Juni 2013 Stop
  TArrString4 = Array [0..4] of String;
  TArrString2 = Array [0..2] of String;
  TArrString1 = Array [0..1] of String;
  TVerticalAlignment = (taAlignTop, taAlignBottom, taVerticalCenter);

  function SaveAsExcelFile(AGrid: TStringGrid; ASheetName, AFileName: string): Boolean;
  function GetMyDocuments: string;
  function ToExcel(StrGrid:TStringGrid;SheetName:String):Boolean;
  function ToString(S:String):String;
  function SToCurr(S:String;Decimal:Integer=0):String;
  function IToCurr(I:Double):String;Overload;
  function IToCurr(I:Int64):String;Overload;
  function IToCurr(I:Integer):String;Overload;
  function SToInt(S:String):Integer;
  function SToInt64(S:String):Int64;
  function SToFloat(S:String):Extended;
  function StrToFloatU( pText : string ): Extended;
  function Encrypt (const s: string; Key: Word) : string;
  function Decrypt (const s: string; Key: Word) : string;
  function scShellDeleteFile(FormHandle : THandle; StrFile : String; BlnSilent : Boolean = False;
           BlnConfirmation : Boolean = True; BlnUndo : Boolean = True) : Boolean;

  function ArrayIndexOf(ArrStr:Array Of TArrString97;S:String;Col:Integer):Integer;Overload;
  function ArrayIndexOf(ArrStr:Array Of TArrString80;S:String;Col:Integer):Integer;Overload;
  function ArrayIndexOf(ArrStr:Array Of TArrString75;S:String;Col:Integer):Integer;Overload;
  function ArrayIndexOf(ArrStr:Array Of TArrString45;S:String;Col:Integer):Integer;Overload;
  function ArrayIndexOf(ArrStr:Array Of TArrString40;S:String;Col:Integer):Integer;Overload;
  function ArrayIndexOf(ArrStr:Array Of TArrString31;S:String;Col:Integer):Integer;Overload;
  function ArrayIndexOf(ArrStr:Array Of TArrString30;S:String;Col:Integer):Integer;Overload;
  function ArrayIndexOf(ArrStr:Array Of TArrString20;S:String;Col:Integer):Integer;Overload;
  function ArrayIndexOf(ArrStr:Array Of TArrString17;S:String;Col:Integer):Integer;Overload;
  function ArrayIndexOf(ArrStr:Array Of TArrString16;S:String;Col:Integer):Integer;Overload;
  function ArrayIndexOf(ArrStr:Array Of TArrString14;S:String;Col:Integer):Integer;Overload;
  function ArrayIndexOf(ArrStr:Array Of TArrString10;S:String;Col:Integer):Integer;Overload;
  function ArrayIndexOf(ArrStr:Array Of TArrString9;S:String;Col:Integer):Integer;Overload;
  function ArrayIndexOf(ArrStr:Array Of TArrString8;S:String;Col:Integer):Integer;Overload;
  function ArrayIndexOf(ArrStr:Array Of TArrString7;S:String;Col:Integer):Integer;Overload;
  function ArrayIndexOf(ArrStr:Array Of TArrString4;S:String;Col:Integer):Integer;Overload;
  function ArrayIndexOf(ArrStr:Array Of TArrString2;S:String;Col:Integer):Integer;Overload;
  function ArrayIndexOf(ArrStr:Array Of TArrString1;S:String;Col:Integer):Integer;Overload;

  function GetImgFile:String;
  function SaveAsExcelFile2(AGrid: TStringGrid; AFileName: string;ConvertToText:Boolean=False): Boolean;
  function ToExcel2(StrGrid:TStringGrid;ConvertToText:Boolean=False):Boolean;

  function GetFileVersion(exeName : string): string;
  function GetFileDate(FileName:String):String;
  function FileVersion(const FileName: TFileName): String;

  function ResolveAddress(HostName: String; out Address: DWORD): Boolean;
  function IsPortOpened(const Host: string; Port: Integer): Boolean;
  procedure GetJPGSize(const sFile: string; var wWidth, wHeight: Word);
  function CaseStr(s: string; a: array of string): Integer;
  function Terbilang(x:integer):string;
  function AmountSaid(x:integer):string;

  //View data string grid 11 juni 2013
  procedure ViewData1(QStr:string; StrGrid:TZColorStringGrid);
  procedure ViewData2(QStr:string; StrGrid:TStringGrid);

  //View data string grid 14 juni 2013
  function DataNilaiHari(): string;
  function DataNilaiBulan(): string;
  function DataNilaiTahun(): string;
  //View data string grid 14 juni 2013 Stop

  //24 Oktober 2013
  function SplitStrings(Str:String;Needle:String):TStringList;

  //21 November 2013
  function GetHostName:String;

  //05 Desember 2013
  function GetIpAddress:String;
  procedure DeleteIECache;

  //12 Maret 2013
  function ToExcel3(StrGrid:TStringGrid):Boolean;
  function ToExcel4(StrGrid:TZColorStringGrid;SheetName:String='';StrGrid2:TZColorStringGrid=nil;SheetName2:String='';StrGrid3:TZColorStringGrid=nil;SheetName3:String='';StrGrid4:TZColorStringGrid=nil;SheetName4:String=''):Boolean;

  //17 April 2014
  function SaveTo(Extention:String='MS Excel File|*.xls'):String;

  //12 November 2014
  function SaveToImage(Extention:String='Image File|*.jpg'):String;

  //27 November 2014
  function ADOConnectionString(ParentHandle: THandle; InitialString: WideString;out NewString: string): Boolean;

  //30 Juni 2015
  function FileTimeToDateTime(FileTime:TFileTime):TDateTime;
  // 20 November 2015
  function GetLocalSettings(LCTYPE: LCTYPE {type of information}): string;

  // 4 May 2016
  procedure RotateImage(Jpg: TJPEGImage; Degree : SmallInt; AdjustSize: Boolean; BkColor: TColor = clNone);Overload;
  procedure RotateImage(Bmp: TBitmap; Degree : SmallInt; AdjustSize: Boolean; BkColor: TColor = clNone);Overload;
  function FlipReverseScanLine(const Bitmap:TBitmap;const Horizontal,Vertical:Boolean):TBitmap;
//  procedure Mirror(MemoTmp:TMemo;Img:TImage;PxPI:Integer);
  procedure Mirror(Text:String;Img:TImage;Fonts:TFont;Height:Integer=25;Width:Integer=150);
  procedure TextToImage(Text:String;Img:TImage;Fonts:TFont;Height:Integer=25;Width:Integer=150);

  // 24 Agustus 2016
  function TitleCase(const s : string) : string;

  // 06 Feb 2017
  function LicensePlate(const s : string) : string;
  function eToll(const s : string) : string;
  function CekNoEToll(StrNoEtoll:string):String;
  function CekNoSJ(StrNoSJ:string):String;
  

implementation

Uses MainU, ShellApi,uNativeXLSExport,zEXMLss,zEXMLssUtils,zsspXML , Math,
  Types;

const
c1 = 52845;
c2 = 22719;

{function ArrayIndexOf - Mencari String di dalam array 2 level }
function ArrayIndexOf(ArrStr:Array Of TArrString97;S:String;Col:Integer):Integer;
var Count:Integer;
    IsTrue:Boolean;
begin
  isTrue:=False;
  Count:=0;
  while (Count<Length(ArrStr)) AND (Not(IsTrue)) do begin
    if (StrPos(PChar(UpperCase(ArrStr[Count][Col])),PChar(UpperCase(S)))<>nil) then IsTrue:=True;
    Inc(Count);
  end;
  if IsTrue then Result:=Count-1 else Result:=-1;
end;

function ArrayIndexOf(ArrStr:Array Of TArrString80;S:String;Col:Integer):Integer;
var Count:Integer;
    IsTrue:Boolean;
begin
  isTrue:=False;
  Count:=0;
  while (Count<Length(ArrStr)) AND (Not(IsTrue)) do begin
    if (StrPos(PChar(UpperCase(ArrStr[Count][Col])),PChar(UpperCase(S)))<>nil) then IsTrue:=True;
    Inc(Count);
  end;
  if IsTrue then Result:=Count-1 else Result:=-1;
end;

function ArrayIndexOf(ArrStr:Array Of TArrString75;S:String;Col:Integer):Integer;
var Count:Integer;
    IsTrue:Boolean;
begin
  isTrue:=False;
  Count:=0;
  while (Count<Length(ArrStr)) AND (Not(IsTrue)) do begin
    if (StrPos(PChar(UpperCase(ArrStr[Count][Col])),PChar(UpperCase(S)))<>nil) then IsTrue:=True;
    Inc(Count);
  end;
  if IsTrue then Result:=Count-1 else Result:=-1;
end;

function ArrayIndexOf(ArrStr:Array Of TArrString45;S:String;Col:Integer):Integer;
var Count:Integer;
    IsTrue:Boolean;
begin
  isTrue:=False;
  Count:=0;
  while (Count<Length(ArrStr)) AND (Not(IsTrue)) do begin
    if (StrPos(PChar(UpperCase(ArrStr[Count][Col])),PChar(UpperCase(S)))<>nil) then IsTrue:=True;
    Inc(Count);
  end;
  if IsTrue then Result:=Count-1 else Result:=-1;
end;

function ArrayIndexOf(ArrStr:Array Of TArrString40;S:String;Col:Integer):Integer;
var Count:Integer;
    IsTrue:Boolean;
begin
  isTrue:=False;
  Count:=0;
  while (Count<Length(ArrStr)) AND (Not(IsTrue)) do begin
    if (StrPos(PChar(UpperCase(ArrStr[Count][Col])),PChar(UpperCase(S)))<>nil) then IsTrue:=True;
    Inc(Count);
  end;
  if IsTrue then Result:=Count-1 else Result:=-1;
end;

function ArrayIndexOf(ArrStr:Array Of TArrString31;S:String;Col:Integer):Integer;
var Count:Integer;
    IsTrue:Boolean;
begin
  isTrue:=False;
  Count:=0;
  while (Count<Length(ArrStr)) AND (Not(IsTrue)) do begin
    if (StrPos(PChar(UpperCase(ArrStr[Count][Col])),PChar(UpperCase(S)))<>nil) then IsTrue:=True;
    Inc(Count);
  end;
  if IsTrue then Result:=Count-1 else Result:=-1;
end;

function ArrayIndexOf(ArrStr:Array Of TArrString30;S:String;Col:Integer):Integer;
var Count:Integer;
    IsTrue:Boolean;
begin
  isTrue:=False;
  Count:=0;
  while (Count<Length(ArrStr)) AND (Not(IsTrue)) do begin
    if (StrPos(PChar(UpperCase(ArrStr[Count][Col])),PChar(UpperCase(S)))<>nil) then IsTrue:=True;
    Inc(Count);
  end;
  if IsTrue then Result:=Count-1 else Result:=-1;
end;

function ArrayIndexOf(ArrStr:Array Of TArrString20;S:String;Col:Integer):Integer;
var Count:Integer;
    IsTrue:Boolean;
begin
  isTrue:=False;
  Count:=0;
  while (Count<Length(ArrStr)) AND (Not(IsTrue)) do begin
    if (StrPos(PChar(UpperCase(ArrStr[Count][Col])),PChar(UpperCase(S)))<>nil) then IsTrue:=True;
    Inc(Count);
  end;
  if IsTrue then Result:=Count-1 else Result:=-1;
end;

function ArrayIndexOf(ArrStr:Array Of TArrString17;S:String;Col:Integer):Integer;
var Count:Integer;
    IsTrue:Boolean;
begin
  isTrue:=False;
  Count:=0;
  while (Count<Length(ArrStr)) AND (Not(IsTrue)) do begin
    if (StrPos(PChar(UpperCase(ArrStr[Count][Col])),PChar(UpperCase(S)))<>nil) then IsTrue:=True;
    Inc(Count);
  end;
  if IsTrue then Result:=Count-1 else Result:=-1;
end;

function ArrayIndexOf(ArrStr:Array Of TArrString16;S:String;Col:Integer):Integer;
var Count:Integer;
    IsTrue:Boolean;
begin
  isTrue:=False;
  Count:=0;
  while (Count<Length(ArrStr)) AND (Not(IsTrue)) do begin
    if (StrPos(PChar(UpperCase(ArrStr[Count][Col])),PChar(UpperCase(S)))<>nil) then IsTrue:=True;
    Inc(Count);
  end;
  if IsTrue then Result:=Count-1 else Result:=-1;
end;

function ArrayIndexOf(ArrStr:Array Of TArrString14;S:String;Col:Integer):Integer;
var Count:Integer;
    IsTrue:Boolean;
begin
  isTrue:=False;
  Count:=0;
  while (Count<Length(ArrStr)) AND (Not(IsTrue)) do begin
    if (StrPos(PChar(UpperCase(ArrStr[Count][Col])),PChar(UpperCase(S)))<>nil) then IsTrue:=True;
    Inc(Count);
  end;
  if IsTrue then Result:=Count-1 else Result:=-1;
end;

function ArrayIndexOf(ArrStr:Array Of TArrString10;S:String;Col:Integer):Integer;
var Count:Integer;
    IsTrue:Boolean;
begin
  isTrue:=False;
  Count:=0;
  while (Count<Length(ArrStr)) AND (Not(IsTrue)) do begin
    if (StrPos(PChar(UpperCase(ArrStr[Count][Col])),PChar(UpperCase(S)))<>nil) then IsTrue:=True;
    Inc(Count);
  end;
  if IsTrue then Result:=Count-1 else Result:=-1;
end;

function ArrayIndexOf(ArrStr:Array Of TArrString9;S:String;Col:Integer):Integer;
var Count:Integer;
    IsTrue:Boolean;
begin
  isTrue:=False;
  Count:=0;
  while (Count<Length(ArrStr)) AND (Not(IsTrue)) do begin
    if (StrPos(PChar(UpperCase(ArrStr[Count][Col])),PChar(UpperCase(S)))<>nil) then IsTrue:=True;
    Inc(Count);
  end;
  if IsTrue then Result:=Count-1 else Result:=-1;
end;

function ArrayIndexOf(ArrStr:Array Of TArrString8;S:String;Col:Integer):Integer;
var Count:Integer;
    IsTrue:Boolean;
begin
  isTrue:=False;
  Count:=0;
  while (Count<Length(ArrStr)) AND (Not(IsTrue)) do begin
    if (StrPos(PChar(UpperCase(ArrStr[Count][Col])),PChar(UpperCase(S)))<>nil) then IsTrue:=True;
    Inc(Count);
  end;
  if IsTrue then Result:=Count-1 else Result:=-1;
end;

function ArrayIndexOf(ArrStr:Array Of TArrString7;S:String;Col:Integer):Integer;
var Count:Integer;
    IsTrue:Boolean;
begin
  isTrue:=False;
  Count:=0;
  while (Count<Length(ArrStr)) AND (Not(IsTrue)) do begin
    if (StrPos(PChar(UpperCase(ArrStr[Count][Col])),PChar(UpperCase(S)))<>nil) then IsTrue:=True;
    Inc(Count);
  end;
  if IsTrue then Result:=Count-1 else Result:=-1;
end;

function ArrayIndexOf(ArrStr:Array Of TArrString4;S:String;Col:Integer):Integer;
var Count:Integer;
    IsTrue:Boolean;
begin
  isTrue:=False;
  Count:=0;
  while (Count<Length(ArrStr)) AND (Not(IsTrue)) do begin
    if (StrPos(PChar(UpperCase(ArrStr[Count][Col])),PChar(UpperCase(S)))<>nil) then IsTrue:=True;
    Inc(Count);
  end;
  if IsTrue then Result:=Count-1 else Result:=-1;
end;

function ArrayIndexOf(ArrStr:Array Of TArrString2;S:String;Col:Integer):Integer;
var Count:Integer;
    IsTrue:Boolean;
begin
  isTrue:=False;
  Count:=0;
  while (Count<Length(ArrStr)) AND (Not(IsTrue)) do begin
    if (StrPos(PChar(UpperCase(ArrStr[Count][Col])),PChar(UpperCase(S)))<>nil) then IsTrue:=True;
    Inc(Count);
  end;
  if IsTrue then Result:=Count-1
  else Result:=-1;
end;

function ArrayIndexOf(ArrStr:Array Of TArrString1;S:String;Col:Integer):Integer;
var Count:Integer;
    IsTrue:Boolean;
begin
  isTrue:=False;
  Count:=0;
  while (Count<Length(ArrStr)) AND (Not(IsTrue)) do begin
    if (StrPos(PChar(UpperCase(ArrStr[Count][Col])),PChar(UpperCase(S)))<>nil) then IsTrue:=True;
    Inc(Count);
  end;
  if IsTrue then Result:=Count-1 else Result:=-1;
end;

function Encrypt (const s: string; Key: Word) : string;
var
  i : byte;
  ResultStr : string;
begin
  Result:=s;
  for i := 0 to (length (s)) do begin
    Result[i] := Char (byte (s[i]) xor (Key shr 8));
    Key := (byte (Result[i]) + Key) * c1 + c2
  end;
end;

function Decrypt (const s: string; Key: Word) : string;
var
  i : byte;
begin
  Result:=s;
  for i := 0 to (length (s)) do begin
    Result[i] := Char (byte (s[i]) xor (Key shr 8));
    Key := (byte (s[i]) + Key) * c1 + c2
  end;
end;

function SToInt(S:String):Integer;
begin
  Result:=StrToInt(ToString(S));
end;

function SToInt64(S:String):Int64;
begin
  Result:=StrToInt64(ToString(S));
end;

function SToFloat(S:String):Extended;
begin
  Result:=StrToFloat(ToString(S));
end;

function ToString(S:String):String;
begin
  Result:=StringReplace(Trim(S),'.','',[rfReplaceAll]);
  if LeftStr(Result,1)='(' then begin
    Result:=StringReplace(StringReplace(Result,'(','-',[rfReplaceAll]),')','',[rfReplaceAll]);
  end;
end;

function SToCurr(S:String;Decimal:Integer=0):String;
begin
  if StrPos(PChar(S),',')<>NIL then begin
    if StrToFloat(S)>=0 then begin
      Case Decimal of
        0:Result:=FormatCurr(',###0' ,StrToFloat(S));
        1:Result:=FormatCurr(',###.0',StrToFloat(S));
        2:Result:=FormatCurr(',###.00',StrToFloat(S));
      end;
    end else begin
      Case Decimal of
        0:Result:=FormatCurr(',###0',StrToFloat(S));
        1:FormatCurr(',###.0',StrToFloat(S));
        2:FormatCurr(',###.00',StrToFloat(S));
      end;
    end;
  end else begin
    if StrToInt(S)>=0 then begin
      Case Decimal of
        0:Result:=FormatCurr(',###0',StrToInt(S));
        1:Result:=FormatCurr(',###.0',StrToInt(S));
        2:Result:=FormatCurr(',###.00',StrToInt(S));
      end;
    end else begin
      Case Decimal of
        0:Result:=FormatCurr(',###0',StrToFloat(S));//S;
        1:Result:=FormatCurr(',###.0',StrToInt(S));
        2:Result:=FormatCurr(',###.00',StrToInt(S));
      end;
   end;
  end
end;

function IToCurr(I:Integer):String;
begin
  if I<>0 then
    Result:=FormatCurr('#.###,',I)
  else
    Result:='0';
end;

function IToCurr(I:Int64):String;
begin
  if I<>0 then
    Result:=FormatCurr('#.###,',I)
  else
    Result:='0';
end;

function IToCurr(I:Double):String;
begin
  if I<>0 then
    Result:=FormatCurr('#.###,',I)
  else
    Result:='0';
end;


function StrToFloatU( pText : string ): Extended;
const
   EUROPEAN_ST = ',';
   AMERICAN_ST = '.';
var
  lformatSettings : TFormatSettings;
  lFinalValue     : string;
  lAmStDecimalPos : integer;
  lIndx           : Byte;
  lIsAmerican     : Boolean;
  lIsEuropean     : Boolean;

begin
  lIsAmerican := False;
  lIsEuropean := False;
  for lIndx := Length( pText ) - 1 downto 0 do
  begin
    if ( pText[ lIndx ] = AMERICAN_ST ) then
    begin
      lIsAmerican := True;
      pText := StringReplace( pText, ',', '', [ rfIgnoreCase, rfReplaceAll ]);  //get rid of thousand incidental separators
      Break;
    end;
    if ( pText[ lIndx ] = EUROPEAN_ST ) then
    begin
      lIsEuropean := True;
      pText := StringReplace( pText, '.', '', [ rfIgnoreCase, rfReplaceAll ]);  //get rid of thousand incidental separators
      Break;
    end;
  end;
  GetLocaleFormatSettings( LOCALE_SYSTEM_DEFAULT, lformatSettings );
  if ( lformatSettings.DecimalSeparator = EUROPEAN_ST ) then
  begin
    if lIsEuropean then
//    if lIsAmerican then
    begin
      lFinalValue := StringReplace( pText, '.', ',', [ rfIgnoreCase, rfReplaceAll ] );
    end;
  end;
  if ( lformatSettings.DecimalSeparator = AMERICAN_ST ) then
  begin
//    if lIsEuropean then
    if lIsAmerican then
    begin
      lFinalValue := StringReplace( pText, ',', '.', [ rfIgnoreCase, rfReplaceAll ] );
    end;
  end;
  pText  := lFinalValue;
  Result := StrToFloat( pText, lformatSettings );
end;


function RefToCell(ARow, ACol: Integer): string;
begin
  Result := Chr(Ord('A') + ACol - 1) + IntToStr(ARow);
end;

function SaveAsExcelFile(AGrid: TStringGrid; ASheetName, AFileName: string): Boolean;
const
  xlWBATWorksheet = -4167;
var
  Row, Col: Integer;
  XLApp, Sheet, Data: OLEVariant;
begin
  // Prepare Data
  Data := VarArrayCreate([1, AGrid.RowCount, 1, AGrid.ColCount], varVariant);
  for Col:=0 to AGrid.ColCount - 1 do
    for Row:=0 to AGrid.RowCount - 1 do
      if ( ( (MidStr(AGrid.Cells[Col,Row],1,1)='0') OR
          (MidStr(AGrid.Cells[Col,Row],1,1)='1') OR
          (MidStr(AGrid.Cells[Col,Row],1,1)='2') OR
          (MidStr(AGrid.Cells[Col,Row],1,1)='3') OR
          (MidStr(AGrid.Cells[Col,Row],1,1)='4') OR
          (MidStr(AGrid.Cells[Col,Row],1,1)='5') OR
          (MidStr(AGrid.Cells[Col,Row],1,1)='6') OR
          (MidStr(AGrid.Cells[Col,Row],1,1)='7') OR
          (MidStr(AGrid.Cells[Col,Row],1,1)='8') OR
          (MidStr(AGrid.Cells[Col,Row],1,1)='9') ) AND (MidStr(AGrid.Cells[Col,Row],3,1)<>'/') )then
          if (AnsiPos('.',AGrid.Cells[Col,Row])>0) then
            Data[Row+1,Col+1]:=ToString(AGrid.Cells[Col,Row])
          else
            Data[Row+1,Col+1]:= Chr(39)+AGrid.Cells[Col,Row]
    else
      if AGrid.Cells[Col,Row]='' then
        Data[Row+1,Col+1]:=' '
      else
        Data[Row+1,Col+1]:=AGrid.Cells[Col,Row];
  // Create Excel-OLE Object
  Result := False;
  XLApp := CreateOleObject('Excel.Application');
  try
    // Hide Excel
    XLApp.Visible := False;
    // Add new Workbook
    XLApp.Workbooks.Add(xlWBatWorkSheet);
    Sheet := XLApp.Workbooks[1].WorkSheets[1];
    Sheet.Name := ASheetName;
    // Fill up the sheet
    Sheet.Range[RefToCell(1, 1), RefToCell(AGrid.RowCount,
      AGrid.ColCount)].Value := Data;
    // Save Excel Worksheet
    try
      XLApp.Workbooks[1].SaveAs(AFileName);
      Result := True;
    except
      // Error ?
    end;
  finally
    // Quit Excel
    if not VarIsEmpty(XLApp) then
    begin
      XLApp.DisplayAlerts := False;
      XLApp.Quit;
      XLAPP := Unassigned;
      Sheet := Unassigned;
    end;
  end;
end;

function GetMyDocuments: string;
var
   r: Boolean;
   path: array[0..200] of Char;
begin
   r := ShGetSpecialFolderPath(0, path, CSIDL_Personal, False) ;
   if not r then raise Exception.Create('Could not find MyDocuments folder location.') ;
   Result := Path;
end;

function ToExcel(StrGrid:TStringGrid;SheetName:String):Boolean;
var
  openDialog : TSaveDialog;
  Res:Boolean;
begin
  openDialog:=TSaveDialog.Create(Main);
  openDialog.InitialDir:=GetMyDocuments;
  openDialog.Options := [ofNoValidate];
  openDialog.Filter :='MS Excel File|*.xls';
  openDialog.FilterIndex:=1;
  openDialog.Execute;
  Filename:=openDialog.FileName;
  if RightStr(Trim(Filename),4)<>'.xls' then Filename:=Filename+'.xls';
  openDialog.Free;
  Res:=SaveAsExcelFile(StrGrid, SheetName, Filename);
  Result:=Res;
end;

function GetImgFile:String;
var
  openDialog : TOpenDialog;
begin
  openDialog:=TOpenDialog.Create(Main);
  openDialog.InitialDir:=GetMyDocuments;
  openDialog.Options := [ofNoValidate];
  openDialog.Filter :='Image File |*.jpg;*.bmp;*.png;*.gif';
  openDialog.FilterIndex:=1;
  openDialog.Execute;
  Result:=openDialog.FileName;
end;

function ToExcel2(StrGrid:TStringGrid;ConvertToText:Boolean=False):Boolean;
var
  openDialog : TSaveDialog;
  Res:Boolean;
begin
  openDialog:=TSaveDialog.Create(Main);
  openDialog.InitialDir:=GetMyDocuments;
  openDialog.Options := [ofNoValidate];
  openDialog.Filter :='MS Excel File|*.xls';
  openDialog.FilterIndex:=1;
  openDialog.Execute;
  Filename:=openDialog.FileName;
  if (Trim(Filename)<>'') then begin
    if RightStr(Trim(Filename),4)<>'.xls' then Filename:=Filename+'.xls';
    openDialog.Free;
    Res:=SaveAsExcelFile2(StrGrid,Filename,ConvertToText);
    Result:=Res;
  end else
    Result:=False;
end;


procedure XlsWriteCellLabel(XlsStream: TStream; const ACol, ARow: Word;
  const AValue: string);
var
  L: Word;
const
  {$J+}
  CXlsLabel: array[0..5] of Word = ($204, 0, 0, 0, 0, 0);
  {$J-}
begin
  L := Length(AValue);
  CXlsLabel[1] := 8 + L;
  CXlsLabel[2] := ARow;
  CXlsLabel[3] := ACol;
  CXlsLabel[5] := L;
  XlsStream.WriteBuffer(CXlsLabel, SizeOf(CXlsLabel));
  XlsStream.WriteBuffer(Pointer(AValue)^, L);
end;

{save excel tanpa keterbatasan column}
function SaveAsExcelFile2(AGrid: TStringGrid; AFileName: string;ConvertToText:Boolean=False): Boolean;
const
  {$J+} CXlsBof: array[0..5] of Word = ($809, 8, 00, $10, 0, 0); {$J-}
  CXlsEof: array[0..1] of Word = ($0A, 00);
var
  FStream: TFileStream;
  Col,Row: Integer;
begin
  Result := False;
  FStream := TFileStream.Create(PChar(AFileName), fmCreate or fmOpenWrite);
  try
    CXlsBof[4] := 0;
    FStream.WriteBuffer(CXlsBof, SizeOf(CXlsBof));
    if ConvertToText=True then begin
      for Col:=0 to AGrid.ColCount - 1 do
        for Row:=0 to AGrid.RowCount - 1 do
          if AGrid.Cells[Col,Row]<>'' then
            if (AGrid.Cells[Col,Row][1]='0') AND ( ( AGrid.Cells[Col,Row][2] in ['0'..'9']) AND ( AGrid.Cells[Col,Row][3]<>'/') )then
              if (AnsiPos('.',AGrid.Cells[Col,Row])>0) then
                XlsWriteCellLabel(FStream,Col,Row,ToString(AGrid.cells[Col,Row]))
              else
                XlsWriteCellLabel(FStream,Col,Row,Chr(39)+AGrid.cells[Col,Row])
            else
              XlsWriteCellLabel(FStream,Col,Row, AGrid.cells[Col,Row])
          else
            XlsWriteCellLabel(FStream,Col,Row, AGrid.cells[Col,Row]);
    end else begin
      for Col:=0 to AGrid.ColCount - 1 do
        for Row:=0 to AGrid.RowCount - 1 do
          XlsWriteCellLabel(FStream,Col,Row, AGrid.cells[Col,Row]);
    end;
    FStream.WriteBuffer(CXlsEof, SizeOf(CXlsEof));
    Result := True;
  finally
    FStream.Free;
  end;
end;

{mengecek host hidup/tidak}
function ResolveAddress(HostName: String; out Address: DWORD): Boolean;
var  lpHost:        PHostEnt;
begin
  // Set default address
  Address := DWORD(INADDR_NONE);
  try
    // Check host name length
    if (Length(HostName) > 0) then begin
      // Try converting the hostname
      Address := inet_addr(PChar(HostName));
      // Check address
      if (DWORD(Address) = DWORD(INADDR_NONE)) then begin
        // Attempt to get host by name
        lpHost := gethostbyname(PChar(HostName));
        // Check host ent structure for valid ip address
        if Assigned(lpHost) and Assigned(lpHost^.h_addr_list^) then
          // Get the address from the list
          Address := u_long(PLongInt(lpHost^.h_addr_list^)^);
      end;// if (DWORD(Address) = DWORD(INADDR_NONE)) then begin
    end;// if (Length(HostName) > 0) then begin
  finally
    // Check result address
    if (DWORD(Address) = DWORD(INADDR_NONE)) then
      // Invalid host specified
      Result:= False
    else
      // Converted correctly
      Result := True;
  end;// try ... finally
end;

{mengecek port tersedia/tidak}
function IsPortOpened(const Host: string; Port: Integer): Boolean;
const
  szSockAddr = SizeOf(TSockAddr);
var
  WinSocketData: TWSAData;
  Socket: TSocket;
  Address: TSockAddr;
  dwAddress: DWORD;
label
  lClean;
begin
  // initialize result
  Result := False;
  // create WinSocketData
  if WinSock.WSAStartup(MakeWord(1, 1), WinSocketData) = 0 then begin
    // set address family
    Address.sin_family := AF_INET;
    // try to translate Host to IP address
    if NOT ResolveAddress(Host, dwAddress) then
      // faild! go to lClean label
      goto lClean;
    // set the address
    Address.sin_addr.S_addr := dwAddress;
    // create a socket
    Socket := WinSock.Socket(AF_INET, SOCK_STREAM, IPPROTO_IP);
    // if faild to create socket
    if Socket = INVALID_SOCKET then
      // go to lClean label
      goto lClean;
    // set the port
    Address.sin_port := WinSock.htons(Port);
    // attempt remote connection to Host on Port
    if WinSock.Connect(Socket, Address, szSockAddr) = 0 then begin
      // if succeded return true
      Result := True;
      // close the socket
      WinSock.closesocket(Socket);
    end;// if WinSock.Connect(Socket, Address, szSockAddr) = 0 then begin
  end;// if WinSock.WSAStartup(MakeWord(1, 1), WinSocketData) = 0 then begin
  // label to which we jump to clean up
  lClean:
    WinSock.WSACleanup;
end;

{mengambil versi file}
//rusak
function GetFileVersion(exeName : string): string;
const
  c_StringInfo = 'StringFileInfo\040904E4\FileVersion';
var
  n, Len : cardinal;
  Buf, Value : PChar;
begin
  Result := '';
  n := GetFileVersionInfoSize(PChar(exeName),n);
  if n > 0 then begin
    Buf := AllocMem(n);
    try
      GetFileVersionInfo(PChar(exeName),0,n,Buf);
      if VerQueryValue(Buf,PChar(c_StringInfo),Pointer(Value),Len) then begin
        Result := Trim(Value);
      end;
    finally
      FreeMem(Buf,n);
    end;
  end;
end;

{mengambil versi file}
function FileVersion(const FileName: TFileName): String;
var
  VerInfoSize: Cardinal;
  VerValueSize: Cardinal;
  Dummy: Cardinal;
  PVerInfo: Pointer;
  PVerValue: PVSFixedFileInfo;
begin
  Result := '';
  VerInfoSize := GetFileVersionInfoSize(PChar(FileName), Dummy);
  GetMem(PVerInfo, VerInfoSize);
  try
    if GetFileVersionInfo(PChar(FileName), 0, VerInfoSize, PVerInfo) then
      if VerQueryValue(PVerInfo, '\', Pointer(PVerValue), VerValueSize) then
        with PVerValue^ do
          Result := Format('%d.%d.%d.%d', [
            HiWord(dwFileVersionMS), //Major
            LoWord(dwFileVersionMS), //Minor
            HiWord(dwFileVersionLS), //Release
            LoWord(dwFileVersionLS)]); //Build
  finally
    FreeMem(PVerInfo, VerInfoSize);
  end;
end;

function scShellDeleteFile(FormHandle : THandle; StrFile : String; BlnSilent : Boolean = False;
  BlnConfirmation : Boolean = True; BlnUndo : Boolean = True) : Boolean;
var
  F : TShFileOpStruct;
begin
  F.Wnd:=FormHandle;
  F.wFunc:=FO_DELETE;
  F.pFrom:=PChar(StrFile+#0);
  if BlnUndo then
    F.fFlags := FOF_ALLOWUNDO;
  if not BlnConfirmation then
    F.fFlags := FOF_NOCONFIRMATION;
  if BlnSilent then
    F.fFlags := F.fFlags or FOF_SILENT;
  if ShFileOperation(F) <> 0 then
    result:=False
  else
    result:=True;
end;

function ReadMWord(F: TFileStream): Word;
type
  TMotorolaWord = record
  case byte of
    0: (Value: Word);
    1: (Byte1, Byte2: Byte);
  end;
var  MW: TMotorolaWord;
begin
  f.Read(MW.Byte2, SizeOf(Byte));
  f.Read(MW.Byte1, SizeOf(Byte));
  Result := MW.Value;
end;

{mengambil ukuran file image JPG}
procedure GetJPGSize(const sFile: string; var wWidth, wHeight: Word);
const
  ValidSig: array[0..1] of Byte = ($FF, $D8);
  Parameterless = [$01, $D0, $D1, $D2, $D3, $D4, $D5, $D6, $D7];
var Sig: array[0..1] of Byte;
    F: TFileStream;
    x: Integer;
    Seg: Byte;
    Dummy: array[0..15] of Byte;
    Len: Word;
    ReadLen: LongInt;

begin
  FillChar(Sig, SizeOf(Sig), #0);
  f := TFileStream.Create(sFile, fmOpenRead);
  try
    ReadLen := F.Read(Sig[0], SizeOf(Sig));
    for x := Low(Sig) to High(Sig) do
    if Sig[x] <> ValidSig[x] then ReadLen := 0;
    if ReadLen > 0 then begin
      ReadLen := f.Read(Seg, 1);
      if Seg <> $FF then begin
        if (Seg = $C0) or (Seg = $C1) then begin
          ReadLen := f.Read(Dummy[0], 3); { don't need these bytes }
          wHeight := ReadMWord(F);
          wWidth := ReadMWord(F);
        end else begin
          if not (Seg in Parameterless) then begin
            Len := ReadMWord(F);
            F.Seek(Len - 2, 1);
            F.Read(Seg, 1);
          end else
            Seg := $FF; { Fake it to keep looping }
        end;
      end;
    end;
  finally
    F.Free;
  end;
end;

{mengambil tanggal file}
function GetFileDate(FileName:String):String;
var fileDate:Integer;
begin
  fileDate := FileAge(FileName);
  if fileDate > -1 then Result:=DateToStr(FileDateToDateTime(fileDate));
end;

function CaseStr(s: string; a: array of string): Integer;
begin
  Result := 0;
  while (Result < Length(a)) and (a[Result] <> s) do
    Inc(Result);
  if a[Result] <> s then
    Result := -1;
end;

{menyebutkan dari angka menjadi huruf terbilang}
function Terbilang(x:integer):string;
const abil : array[0..11] of string[10]=('','satu','dua','tiga','empat','lima','enam','tujuh','delapan','sembilan','sepuluh','sebelas');

begin
  if (x < 12) then Result := ' ' + abil[x]
  else if (x < 20) then Result := Terbilang(x-10) + ' belas'
  else if (x < 100) then Result := Terbilang(x div 10) + ' puluh' + Terbilang(x mod 10)
  else if (x < 200) then Result := ' seratus' + Terbilang(x-100)
  else if (x < 1000) then Result := Terbilang(x div 100) + ' ratus' + Terbilang(x mod 100)
  else if (x < 2000) then Result := ' seribu' + Terbilang(x-1000)
  else if (x < 1000000) then Result := Terbilang(x div 1000) + ' ribu' + Terbilang(x mod 1000)
  else if (x < 1000000000) then Result := Terbilang(x div 1000000) + ' juta' + Terbilang(x mod 1000000);
end;

function AmountSaid(x:integer):string;
const anum : array[0..12] of string[10]=('','one','two','three','four','five','six','seven','eight','nine','ten','eleven','twelve');
      anum10 : array[0..9] of string[15]=('','','twen','thir','for','fif','six','seven','eigh','nin');

begin
  if (x < 13) then Result := ' ' + anum[x]
  else if (x < 20) then Result := AmountSaid(x-10) + 'teen '
  else if (x < 100) then Result := anum10[x div 10] + 'ty ' + AmountSaid(x mod 10)
  else if (x < 200) then Result := 'one hundred ' + AmountSaid(x-100)
  else if (x < 1000) then Result := AmountSaid(x div 100) + ' hundred ' + AmountSaid(x mod 100)
  else if (x < 2000) then Result := ' thousand' + AmountSaid(x-1000)
  else if (x < 1000000) then Result := AmountSaid(x div 1000) + ' thousand ' + AmountSaid(x mod 1000)
  else if (x < 1000000000) then Result := AmountSaid(x div 1000000) + ' million ' + AmountSaid(x mod 1000000);
end;


//11 Juni 2013 start

//View data string grid 11 juni 2013
procedure ViewData1(QStr:string; StrGrid:TZColorStringGrid);
var
  VQuery:TADOQuery;
  StrMsg,StrEMessage:string;
  IsOk:boolean;
  i,j:integer;
begin
  VQuery:=TADOQuery.Create(nil);
  VQuery.Connection:=Main.MyConnection;
  VQuery.CommandTimeout := 3600;
  VQuery.Close;
  VQuery.SQL.Clear;
  VQuery.SQL.Add(QStr);
  try
          VQuery.Open;
  except
    on E:Exception do begin
       StrMsg:='Table Tidak Dapat Dibuka';
       StrEMessage:=E.Message;
       IsOk:=False;
       end
  end;
  VQuery.First;
  for i:= 1 to VQuery.RecordCount do
  begin
     for j:= 0 to VQuery.FieldCount -1 do
     begin
       StrGrid.cells[j,i] :=VQuery.Fields[j].asString;
     end;
     VQuery.Next;
  end;

  StrGrid.RowCount:=i;

  FreeAndNil(VQuery);

end;

procedure ViewData2(QStr:string; StrGrid:TStringGrid);
var
  VQuery:TADOQuery;
  StrMsg,StrEMessage:string;
  IsOk:boolean;
  i,j:integer;
begin
  VQuery:=TADOQuery.Create(nil);
  VQuery.Connection:=Main.MyConnection;
  VQuery.CommandTimeout := 3600;
  VQuery.Close;
  VQuery.SQL.Clear;
  VQuery.SQL.Add(QStr);
  try
          VQuery.Open;
  except
    on E:Exception do begin
       StrMsg:='Table Tidak Dapat Dibuka';
       StrEMessage:=E.Message;
       IsOk:=False;
       end
  end;
  VQuery.First;
  for i:= 1 to VQuery.RecordCount do
  begin
     for j:= 0 to VQuery.FieldCount -1 do
     begin
       StrGrid.cells[j,i] :=VQuery.Fields[j].asString;
     end;
     VQuery.Next;
  end;
  StrGrid.RowCount:=i;
  FreeAndNil(VQuery);
end;
//11 Juni 2013 stop

//05 Sept 2013 Start
procedure qActExecuteMessage(Query,PesanError:string);
var
  qQuery:TADOQuery;
  StrMsg,StrEMessage:String;
  IsOk:Boolean;
begin
  qQuery:=TADOQuery.Create(nil);
  qQuery.Connection:=Main.MyConnection;
  qQuery.CommandTimeout := 3600;
  qQuery.Close;
  qQuery.SQL.Clear;
  qQuery.SQL.Add(Query);

  try
          qQuery.ExecSQL;
  except
    on E:Exception do begin
       StrMsg:=PesanError;
       StrEMessage:=E.Message;
       IsOk:=False;
       end
  end;

 FreeAndNil(qQuery);

end;

procedure SelectData(QStr,PesanError:string);
var
  VQuery:TADOQuery;
  StrMsg,StrEMessage:string;
  IsOk:boolean;
begin
  VQuery:=TADOQuery.Create(nil);
  VQuery.Connection:=Main.MyConnection;
  VQuery.Close;
  VQuery.SQL.Clear;
  VQuery.SQL.Add(QStr);
  try
    VQuery.Open;
  except
    on E:Exception do begin
       StrMsg:=PesanError;
       StrEMessage:=E.Message;
       IsOk:=False;
       end
  end;
  FreeAndNil(VQuery);

end;

function DataNilaiHari(): string;
begin
  Result :='';
  Result:=FormatDateTime('dd',Now);
end;

function DataNilaiBulan(): string;
begin
  Result :='';
  Result:=FormatDateTime('mm',Now);
end;

function DataNilaiTahun(): string;
begin
  Result :='';
  Result:=FormatDateTime('yy',Now);
end;
//05 Sept 2013 Stop


//24 Oktober 2013
function SplitStrings(Str:String;Needle:String):TStringList;
var StrOld,StrNew:String;
    IntPos:Integer;
begin
  StrOld:=Str;
  StrNew:='';
  Result:=TStringList.Create;
  repeat
    if Pos(Needle,StrOld)=0 then IntPos:=Length(StrOld)+1
    else IntPos:=Pos(Needle,StrOld);
    StrNew:=LeftStr(StrOld,IntPos-1);
    Result.Add(StrNew);
    StrOld:=RightStr(StrOld,(Length(StrOld)-(Length(StrNew)+Length(Needle))));
  until Length(StrOld)<=0;
end;

//21 November 2013
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

//05 Desember 2013
procedure DeleteIECache;
var
  lpEntryInfo: PInternetCacheEntryInfo;
  hCacheDir: LongWord;
  dwEntrySize: LongWord;
begin
{ DeleteIECache }
  dwEntrySize := 0;
  FindFirstUrlCacheEntry(nil, TInternetCacheEntryInfo(nil^), dwEntrySize);
  GetMem(lpEntryInfo, dwEntrySize);
  if dwEntrySize>0 then lpEntryInfo^.dwStructSize := dwEntrySize;
  hCacheDir := FindFirstUrlCacheEntry(nil, lpEntryInfo^, dwEntrySize);
  if hCacheDir<>0 then
  begin
    repeat
      DeleteUrlCacheEntry(lpEntryInfo^.lpszSourceUrlName);
      FreeMem(lpEntryInfo, dwEntrySize);
      dwEntrySize := 0;
      FindNextUrlCacheEntry(hCacheDir, TInternetCacheEntryInfo(nil^), dwEntrySize);
      GetMem(lpEntryInfo, dwEntrySize);
      if dwEntrySize>0 then
        lpEntryInfo^.dwStructSize := dwEntrySize;
    until not FindNextUrlCacheEntry(hCacheDir, lpEntryInfo^, dwEntrySize)
  end; { hCacheDir<>0 }
  FreeMem(lpEntryInfo, dwEntrySize);
  FindCloseUrlCache(hCacheDir)
end;
{ DeleteIECache }

Function GetIPAddress:String;
type
  pu_long = ^u_long;
var
  varTWSAData : TWSAData;
  varPHostEnt : PHostEnt;
  varTInAddr : TInAddr;
  StrHostName : String;
  namebuf : Array [0..255] of char;
begin
  If WSAStartup($101,varTWSAData) <> 0 Then
  Result := 'No. IP Address'
  Else Begin
    StrHostName:=GetHostName;
    StrLCopy(namebuf, PChar(StrHostName), High(namebuf));
    varPHostEnt := gethostbyname(namebuf);
    varTInAddr.S_addr := u_long(pu_long(varPHostEnt^.h_addr_list^)^);
    Result := inet_ntoa(varTInAddr);
  End;
  WSACleanup;
end;

//12 Maret 2014
function ToExcel3(StrGrid:TStringGrid):Boolean;
var
  openDialog : TSaveDialog;
  Res:Boolean;
begin
  openDialog:=TSaveDialog.Create(Main);
  openDialog.InitialDir:=GetMyDocuments;
  openDialog.Options := [ofNoValidate];
  openDialog.Filter :='MS Excel File|*.xls';
  openDialog.FilterIndex:=1;
  openDialog.Execute;
  Filename:=openDialog.FileName;
  if (Trim(Filename)<>'') then begin
    if RightStr(Trim(Filename),4)<>'.xls' then Filename:=Filename+'.xls';
    openDialog.Free;
    Result:=True;
    try
      StringGridToXLS(StrGrid,Filename);
    except
      on E:Exception do Result:=False;
    end;
  end else
    Result:=False;
end;

function ToExcel4(StrGrid:TZColorStringGrid;SheetName:String='';StrGrid2:TZColorStringGrid=nil;SheetName2:String='';StrGrid3:TZColorStringGrid=nil;SheetName3:String='';StrGrid4:TZColorStringGrid=nil;SheetName4:String=''):Boolean;
var
  openDialog : TSaveDialog;
  Res,IsOk:Boolean;
  Int,SheetCount: Integer;
  lastCol, lastRow: Integer;
  TextConverter: TAnsiToCPConverter;
  ZEXMLi:TZEXMLSS;
begin
  TextConverter := nil;
  {$IFNDEF FPC}
    {$IF CompilerVersion < 20} // < RAD Studio 2009
  TextConverter := @AnsiToUtf8;
    {$IFEND}
  {$ENDIF}
  openDialog:=TSaveDialog.Create(Main);
  openDialog.InitialDir:=GetMyDocuments;
  openDialog.Options := [ofNoValidate];
  openDialog.Filter :='MS Excel File|*.xls';
  openDialog.FilterIndex:=1;
  openDialog.Execute;
  Filename:=openDialog.FileName;
  SheetCount:=1;
  IsOk:=True;
  if (Trim(Filename)<>'') then begin
    if RightStr(Trim(Filename),4)<>'.xls' then Filename:=Filename+'.xls';
    openDialog.Free;
    ZEXMLi:=TZEXMLSS.Create(nil);
    ZEXMLi.Sheets.Count := 0;
    ZEXMLi.Styles.Clear();
    ZEXMLi.Sheets.Count := 1;
    lastCol := StrGrid.ColCount - 1;
    lastRow := StrGrid.RowCount - 1;
    if SheetName<>'' then ZEXMLi.Sheets.Sheet[0].Title:=SheetName;
//  function GridToXmlSS(var XMLSS: TZEXMLSS; const PageNum: integer; var Grid: TStringGrid; ToCol: integer; ToRow: integer; BCol, BRow, ECol, ERow: integer; ignorebgcolor: boolean; _border: byte): boolean; overload;
//  Copy data from Grid to XMLSS page. XMLSS - Storage. PageNum - page number. Grid - the stringgrid needed to copy data to XMLSS. ToCol - column number for insertion. ToRow - row number for insertion. BCol - grid's left top cell's column. BRow - grid's left top cell's row. ECol - grid's right bottom cell's column. ERow - grid's right bottom cell's row. ignorebgcolor - if true, then ignore cell's background color. _border - specifies how to copy cell's borders (1 - cells with borders, 0 - cells without borders).
    if GridToXmlSS(ZEXMLi,0,StrGrid,0,0,0,0,lastCol,lastRow,false,1) = False then IsOk:=False;
    if StrGrid2<>nil then begin
      ZEXMLi.Sheets.Count := ZEXMLi.Sheets.Count+1;
      if SheetName2<>'' then ZEXMLi.Sheets.Sheet[ZEXMLi.Sheets.Count-1].Title:=SheetName2;
      lastCol := StrGrid2.ColCount - 1;
      lastRow := StrGrid2.RowCount - 1;
      if GridToXmlSS(ZEXMLi,ZEXMLi.Sheets.Count-1,StrGrid2,0,0,0,0,lastCol,lastRow,false,1) = False then IsOk:=False;
    end;
    if StrGrid3<>nil then begin
      ZEXMLi.Sheets.Count := ZEXMLi.Sheets.Count+1;
      if SheetName3<>'' then ZEXMLi.Sheets.Sheet[ZEXMLi.Sheets.Count-1].Title:=SheetName3;
      lastCol := StrGrid3.ColCount - 1;
      lastRow := StrGrid3.RowCount - 1;
      if GridToXmlSS(ZEXMLi,ZEXMLi.Sheets.Count-1,StrGrid3,0,0,0,0,lastCol,lastRow,false,1) = False then IsOk:=False;
    end;
    if StrGrid4<>nil then begin
      ZEXMLi.Sheets.Count := ZEXMLi.Sheets.Count+1;
      if SheetName4<>'' then ZEXMLi.Sheets.Sheet[ZEXMLi.Sheets.Count-1].Title:=SheetName4;
      lastCol := StrGrid4.ColCount - 1;
      lastRow := StrGrid4.RowCount - 1;
      if GridToXmlSS(ZEXMLi,ZEXMLi.Sheets.Count-1,StrGrid4,0,0,0,0,lastCol,lastRow,false,1) = False then IsOk:=False;
    end;

    if IsOk then begin
        if SaveXmlssToEXML(ZEXMLi, Filename, [], [], TextConverter, 'utf8')=0 then Result:=True
        else Result:=False;
    end else
      Result:=False;
  end else
    Result:=False;

end;
//12 Maret 2014


//17 April 2014
function SaveTo(Extention:String='MS Excel File|*.xls'):String;
var
  openDialog : TSaveDialog;
  Res:Boolean;
begin
  openDialog:=TSaveDialog.Create(nil);
  openDialog.InitialDir:=GetMyDocuments;
  openDialog.Options := [ofNoValidate];
  openDialog.Filter :=Extention;
  openDialog.FilterIndex:=1;
  openDialog.Execute;
  Filename:=openDialog.FileName;
  if (Trim(Filename)<>'') then begin
    openDialog.Free;
    Result:=Filename;
  end
end;
//17 April 2014

//12 November 2014
function SaveToImage(Extention:String='Image File|*.jpg'):String;
var
  openDialog : TSaveDialog;
  Res:Boolean;
begin
  openDialog:=TSaveDialog.Create(nil);
  openDialog.InitialDir:=GetMyDocuments;
  openDialog.Options := [ofNoValidate];
  openDialog.Filter :=Extention;
  openDialog.FilterIndex:=1;
  openDialog.Execute;
  Filename:=openDialog.FileName;
  if (Trim(Filename)<>'') then begin
    openDialog.Free;
    if RightStr(Filename,4)<>'.jpg' then
    Filename:=Filename+'.jpg';
    Result:=Filename;
  end
end;
//12 November 2014


// 27 November 2014
function ADOConnectionString(ParentHandle: THandle; InitialString: WideString;
  out NewString: string): Boolean;
var
  DataInit: IDataInitialize;
  DBPrompt: IDBPromptInitialize;
  DataSource: IUnknown;
  InitStr: PWideChar;
begin
  Result   := False;
  DataInit := CreateComObject(CLSID_DataLinks) as IDataInitialize;
  if InitialString <> '' then
    DataInit.GetDataSource(nil, CLSCTX_INPROC_SERVER, PWideChar(InitialString),
      IUnknown, DataSource);
  DBPrompt := CreateComObject(CLSID_DataLinks) as IDBPromptInitialize;
  if Succeeded(DBPrompt.PromptDataSource(nil, ParentHandle,
    DBPROMPTOPTIONS_PROPERTYSHEET, 0, nil, nil, IUnknown, DataSource)) then
  begin
    InitStr := nil;
    DataInit.GetInitializationString(DataSource, True, InitStr);
    NewString := InitStr;
    Result    := True;
  end;
end;


// 30 Juni 2015
function FileTimeToDateTime(FileTime:TFileTime):TDateTime;
var SystemTime, LocalTime: TSystemTime;
    Str:String;
begin
  if not FileTimeToSystemTime(FileTime, SystemTime) then RaiseLastOSError;
  if not SystemTimeToTzSpecificLocalTime(nil, SystemTime, LocalTime) then RaiseLastOSError;
  FileTimeToDateTime:=SystemTimeToDateTime(LocalTime);
end;

// 20 November 2015
function GetLocalSettings(LCTYPE: LCTYPE {type of information}): string;
var
  Buffer : PChar;
  Size : integer;
begin
  Size := GetLocaleInfo (LOCALE_USER_DEFAULT, LCType, nil, 0);
  GetMem(Buffer, Size);
  try
    GetLocaleInfo (LOCALE_USER_DEFAULT, LCTYPE, Buffer, Size);
    Result := string(Buffer);
  finally
    FreeMem(Buffer);
  end;
end;

procedure RotateImage(Jpg:TJPEGImage; Degree: SmallInt; AdjustSize: Boolean;
  BkColor: TColor = clNone);
var
  C: Single;
  S: Single;
  Tmp,Bmp: TBitmap;
  OffsetX: Single;
  OffsetY: Single;
  Points: array[0..2] of TPoint;
  Rads: Single;
begin
  Rads:=DegToRad(Degree);
  C := Cos(Rads);
  S := Sin(Rads);
  Bmp:= TBitmap.Create;
  Bmp.Assign(Jpg);
  Tmp := TBitmap.Create;
  try
    Tmp.TransparentColor :=  Bmp.TransparentColor;
    Tmp.TransparentMode := Bmp.TransparentMode;
    Tmp.Transparent := Bmp.Transparent;
    Tmp.Canvas.Brush.Color := BkColor;
    if AdjustSize then
    begin
      Tmp.Width := Round(Bmp.Width * Abs(C) + Bmp.Height * Abs(S));
      Tmp.Height := Round(Bmp.Width * Abs(S) + Bmp.Height * Abs(C));
      OffsetX := (Tmp.Width - Bmp.Width * C + Bmp.Height * S) / 2;
      OffsetY := (Tmp.Height - Bmp.Width * S - Bmp.Height * C) / 2;
    end
    else
    begin
      Tmp.Width := Bmp.Width;
      Tmp.Height := Bmp.Height;
      OffsetX := (Bmp.Width - Bmp.Width * C + Bmp.Height * S) / 2;
      OffsetY := (Bmp.Height - Bmp.Width * S - Bmp.Height * C) / 2;
    end;
    Points[0].X := Round(OffsetX);
    Points[0].Y := Round(OffsetY);
    Points[1].X := Round(OffsetX + Bmp.Width * C);
    Points[1].Y := Round(OffsetY + Bmp.Width * S);
    Points[2].X := Round(OffsetX - Bmp.Height * S);
    Points[2].Y := Round(OffsetY + Bmp.Height * C);
    PlgBlt(Tmp.Canvas.Handle, Points, Bmp.Canvas.Handle, 0, 0, Bmp.Width,
      Bmp.Height, 0, 0, 0);
    Bmp.Assign(Tmp);
    Jpg.Assign(Bmp);
    Bmp.Free;
  finally
    Tmp.Free;
  end;
end;

procedure RotateImage(Bmp:TBitmap; Degree: SmallInt; AdjustSize: Boolean;
  BkColor: TColor = clNone);
var
  C: Single;
  S: Single;
  Tmp: TBitmap;
  OffsetX: Single;
  OffsetY: Single;
  Points: array[0..2] of TPoint;
  Rads: Single;
begin
  Rads:=DegToRad(Degree);
  C := Cos(Rads);
  S := Sin(Rads);
  Tmp := TBitmap.Create;
  try
    Tmp.TransparentColor :=  Bmp.TransparentColor;
    Tmp.TransparentMode := Bmp.TransparentMode;
    Tmp.Transparent := Bmp.Transparent;
    Tmp.Canvas.Brush.Color := BkColor;
    if AdjustSize then
    begin
      Tmp.Width := Round(Bmp.Width * Abs(C) + Bmp.Height * Abs(S));
      Tmp.Height := Round(Bmp.Width * Abs(S) + Bmp.Height * Abs(C));
      OffsetX := (Tmp.Width - Bmp.Width * C + Bmp.Height * S) / 2;
      OffsetY := (Tmp.Height - Bmp.Width * S - Bmp.Height * C) / 2;
    end
    else
    begin
      Tmp.Width := Bmp.Width;
      Tmp.Height := Bmp.Height;
      OffsetX := (Bmp.Width - Bmp.Width * C + Bmp.Height * S) / 2;
      OffsetY := (Bmp.Height - Bmp.Width * S - Bmp.Height * C) / 2;
    end;
    Points[0].X := Round(OffsetX);
    Points[0].Y := Round(OffsetY);
    Points[1].X := Round(OffsetX + Bmp.Width * C);
    Points[1].Y := Round(OffsetY + Bmp.Width * S);
    Points[2].X := Round(OffsetX - Bmp.Height * S);
    Points[2].Y := Round(OffsetY + Bmp.Height * C);
    PlgBlt(Tmp.Canvas.Handle, Points, Bmp.Canvas.Handle, 0, 0, Bmp.Width,
      Bmp.Height, 0, 0, 0);
    Bmp.Assign(Tmp);
  finally
    Tmp.Free;
  end;
end;

function FlipReverseScanLine(const Bitmap:TBitmap;const Horizontal,Vertical:Boolean):TBitmap;
var i,j:Integer;
    RowIn,RowOut:pRGBArray;
begin
  if Bitmap.PixelFormat <> pf24bit
  then raise EBitmapError.Create('Can Flip/Reverse only 24-bit bitmap');
  Result:= TBitmap.Create;
  Result.Width       := Bitmap.Width;
  Result.Height      := Bitmap.Height;
  Result.PixelFormat := Bitmap.PixelFormat;
  for j := 0 to Bitmap.Height-1 do begin
    RowIn := Bitmap.Scanline[j];
    if Horizontal then RowOut := RESULT.Scanline[Bitmap.Height - 1 - j]
    else RowOut := RESULT.Scanline[j];
    // Optimization technique:  Use two FOR loops so IF is outside of inner loop
    if Vertical then begin
      for i := 0 to Bitmap.Width-1 do RowOut[i] := RowIn[Bitmap.Width-1-i]
    end else begin
      for i := 0 to Bitmap.Width-1 do RowOut[i] := RowIn[i]
    end;
  end;
end;
{
procedure Mirror(MemoTmp:TMemo;Img:TImage;PxPI:Integer);
var
  LineHeight:integer;
  Images:TBitmap;
  TMargin:integer;
  RIn,ROut:Trect;
  TxtMetric:TTextMetric;
begin
  Images:=TBitmap.create;
  Images.Canvas.Font.Assign(MemoTmp.Font);
  GetTextMetrics(Images.Canvas.Handle,TxtMetric);
  Images.Free;
  LineHeight:=TxtMetric.tmHeight;
  Img.Canvas.Font.Assign(MemoTmp.font);
  Img.Canvas.font.Assign(MemoTmp.font);
  Images:=TBitMap.create;
  Images.Height:=25;
  Images.Width:=MemoTmp.Width;
  Images.HandleType:=bmdib;
  Images.Canvas.Font.assign(MemoTmp.font);
  Images.Canvas.Brush.color:=MemoTmp.color;
  Images.Canvas.FillRect(Rect(0,0,MemoTmp.width,25));
  Images.Canvas.Font.Size:=Images.Canvas.Font.Size*Img.Canvas.Font.PixelsPerInch div PxPI;
  LineHeight:=LineHeight*Img.Canvas.font.pixelsperinch div PxPI;
  Images.Canvas.TextOut(0,0,MemoTmp.Lines[0] );
  ROut:=Rect(0,0,MemoTmp.Width-1,25);
  RIn:=rout;
  RIn.left:=ROut.right;
  RIn.right:=ROut.Left;
  Img.Canvas.CopyRect(ROut,Images.Canvas,RIn);
  Images.free;
end;
}

procedure Mirror(Text:String;Img:TImage;Fonts:TFont;Height:Integer=25;Width:Integer=150);
var
  LineHeight:integer;
  Images:TBitmap;
  TMargin:integer;
  RIn,ROut:Trect;
  TxtMetric:TTextMetric;
begin
  Images:=TBitmap.create;
  Images.Canvas.Font:=Fonts;
  Images.Height:=Height;
  Images.Width:=Width;
  Images.HandleType:=bmdib;
  Images.Transparent:=True;
  Images.Canvas.TextOut(2,5,Text);
  ROut:=Rect(0,0,Width,Height);
  RIn:=ROut;
  RIn.Left:=ROut.Right;
  RIn.Right:=ROut.Left;
  Img.Canvas.CopyRect(ROut,Images.Canvas,RIn);
  Images.free;
end;

procedure TextToImage(Text:String;Img:TImage;Fonts:TFont;Height:Integer=25;Width:Integer=150);
var
  LineHeight:integer;
  Images:TBitmap;
  TMargin:integer;
  RIn,ROut:Trect;
  TxtMetric:TTextMetric;
begin
  Images:=TBitmap.create;
  Images.Canvas.Font:=Fonts;
  Images.Height:=Height;
  Images.Width:=Width;
  Images.Transparent:=True;
  Images.HandleType:=bmdib;
  Images.Canvas.TextOut(2,5,Text);
//  ROut:=Rect(0,0,Width,25);
//  RIn:=rout;
//  RIn.Left:=ROut.Left;
//  RIn.Right:=ROut.Right;
//  Img.Canvas.CopyRect(ROut,Images.Canvas,RIn);
  Img.Picture.Assign(Images);
  Images.free;
end;

function TitleCase(const s : string) : string;
var i : integer;
begin
   if s = '' then
     Result := ''
   else begin
     Result := Uppercase(s[1]);

     for i := 2 to Length(s) do
       if s[i - 1] = ' ' then
         Result := Result + Uppercase(s[i])
       else
         Result := Result + Lowercase(s[i]);
   end;
end;

function LicensePlate(const s : string) : string;
begin
    if IsCharAlpha(PChar(Copy(s,2,1))^)=False then
      Result:=Trim(Copy(s,1,1)+' '+Copy(s,2,4)+' '+Trim(Copy(s,6,Length(s)+1)))
    else
      Result:=Trim(Copy(s,1,2)+' '+Copy(s,3,4)+' '+Trim(Copy(s,7,Length(s)+1)));
end;

function eToll(const s : string) : string;
Var
  i:Integer;
  Nomor : String;
begin
  (*
    Nomor := '';
    for i:=1 to Floor(length(s)/4) do begin
      if i<>Floor(length(s)/4) then Nomor:= Nomor + Copy(s,(1+(4*(i-1))),4)+' '
      else Nomor:= Nomor + Copy(s,(1+(4*(i-1))),4);
    end;
    if ((length(s) mod 4) > 0 ) then
      Nomor:= Nomor + ' '+ Copy(s, ((Floor(length(s)/4)) * 4)+1, (length(s) mod 4));
    Result:=Nomor;
    *)
    Result:=S;
end;

function CekNoEToll(StrNoEtoll:string):String;
var Qry:TADOQuery;
    QStr:String;
    Count,IntCount:Integer;
begin
    //StrNoEtoll
    Qry:=TADOQuery.Create(Nil);
    Qry.Connection:=Main.MyConnection;
    StrNoEtoll := StringReplace(Trim(StrNoEtoll),' ','',[rfReplaceAll]);
    if Main.OpenDb then begin
      QStr:='SELECT id, company_id, etoll_number, status, update_time, update_user FROM wh_etoll_number WHERE etoll_number='+QuotedStr(StrNoEtoll);
      Main.WriteLog('SQL :'+QStr,2);
      Qry.SQL.Clear;
      Qry.SQL.Add(QStr);
      Qry.Open;
      if Qry.RecordCount>0 then begin
        Result := Qry.FieldValues['id'];
      end else
        Result := 'x';
      Qry.Close;
      //Main.CloseDb;
    end;

end;

function CekNoSJ(StrNoSJ:string):String;
var Qry:TADOQuery;
    QStr:String;
    Count,IntCount:Integer;
begin
    //StrNoEtoll
    Qry:=TADOQuery.Create(Nil);
    Qry.Connection:=Main.MyConnection;
    if Main.OpenDb then begin
      QStr:='SELECT vhc_trans_id FROM wh_vhc_trans WHERE CANCEL is NULL AND vhc_trans_id='+QuotedStr(StrNoSJ);
      Main.WriteLog('SQL :'+QStr,2);
      Qry.SQL.Clear;
      Qry.SQL.Add(QStr);
      Qry.Open;
      if Qry.RecordCount>0 then begin
        Result := Qry.FieldValues['vhc_trans_id'];
      end else
        Result := 'x';
      Qry.Close;
      //Main.CloseDb;
    end;

end;


end.
