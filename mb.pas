(*
**************[ custom MsgBox & StatusBox Unit v1.4ßeta 25.05.02 ]**************

 Copyright (c) Jørn Blåsberg 2002
 eraser@sunndal.frisurf.no


New additions to v1.4ßeta:
-------------------------

mb_ExcludeEditInEditBox     : Global Bool variable that gives possibility to use
                              caption in editbox without adding editbox(es), that
                              is if user only
                              wants to use checkboxes. Default value is False.
                              If value is changed, it is strongly reccomended
                              to immediately resets its value when closing used
                              editbox,
                              preventing abnormal behaviour in other boxes
                              affected by this value.


mb_CreateNotOwned           : Global Bool variable used if user vants forms created
                              with this unit NOT to be owned by any other form
                              when created. Default value is False.
                              This setting affects all boxes createt within mb.
                              This variable was added by author for bypassing
                              problems like : modal Box were occasional hiding
                              under subforms that were on top in application and
                              desktop, bypassing problems with hidden forms
                              appearing when calling boxes in mb directly from
                              that form (including taskbar).
                              If value is changed, it is strongly reccomended
                              to immediately resets its value when closing used
                              box,
                              preventing abnormal behaviour in other boxes
                              affected by this value.

mb_AlphaBlend                 Global Bool variable used to set boxes transparency.
                              Default value is false. (Only Delphi 6 and above)
                              This setting affects all boxes createt within mb.

mb_AlphaBlendValue            Global Byte variable used to set boxes transparency
                              value. Default value is 255, no transparency.
                              (Only Delphi 6 and above)
                              This setting affects all boxes createt within mb.

mb_TransparentColor           Global Bool variable used to set boxes transparency
                              color. Default value is false.
                              (Only Delphi 6 and above)
                              This setting affects all boxes createt within mb.

mb_TransparentColorValue      Global TColor variable used to set boxes transparency
                              color Value. Default value is clBlack.
                              (Only Delphi 6 and above)
                              This setting affects all boxes createt within mb.

Note:
When mb is used with a project using Windows XP Theme Manager or other
theme-aware components, boxes used with mb will automaticly follow application's
appearance/Looks for component used! (Take a look at my Zdoom Manager project,
all forms/boxes but the mainform was made with mb, source available by request).


To do in next versions:
----------------------

-Totally restructure the mb-unit, for a bettet more efficient buildup.
-Add support for userdefined uTypes in msgboxe's, without the need of MsgBoxEX.
-Add Support for Manual adjustment of boxitems's columns (buttons, editboxes,
  Checkboxes, etc), and positions.
-Add support for background pictures and custom shapes of boxes and boxitems.
-Add support for more itemtypes/components in boxes.
-Add support for manually mounting of components in boxes.



the mb unit consist of these functions :

MsgBoxS     -more stylish edition of the showmessage Function
MsgBox      -custom edition of the windows messagebox function
MsgBoxpos   -custom edition of the windows messagebox function
MsgBoxEX    -Advanced custom edition of the windows messagebox function
StatusBox   -Simple Status Window
StatusBoxEX -Custom Status Window
EditBox     -Custom Inputbox widt support for several edit's & checkboxes
QBox        -more stylish edition of the inputbox function
PasswordBox -custom edition of the passworddialog function with string result

In addition it includes these control functions :

CloseStatusBox        -Close StatusWindow created with StatusBox or statusBoxEX

UpdateStatusBoxGauge  -Updates ProgressBar in Status Window if used

SetStatusBoxGauge     -Sets ProgressBar progress in Status Window if used

StopSound (procedure) -call this to stop playing any started sound



Explanation/use :
-----------------

the MsgBox function creates, displays, and operates a message box.
The message box contains an application-defined message and title,
plus any combination of predefined icons and push buttons.

 int MsgBox(
    STR  Msg,     // address of text in message box
    STR  Caption, // address of title of message box
    BOOL Silent   // determine muted sound
    INT  uType    // style of message box
   );

 Parameters

 Msg
   Points to a string containing the message to be displayed.

 Caption
   Points to a string used for the dialog box title. If this parameter is NULL,
   the ownerform caption is used, if any.

 Silent
   Specify if the message box should generate a MessageBeep,
   set to true or false.

 uType
  Specifies a set of bit flags that determine the contents and
  behavior of the dialog box. This parameter can be a combination
  of flags from the following groups of flags.
  Specify one of the following flags to indicate the buttons contained
  in the message box:

 Flag                  Meaning
 MB_ABORTRETRYIGNORE   The message box contains three push buttons: Abort,
                        Retry, and Ignore.
 MB_OK                 The message box contains one push button: OK.
                        This is the default.
 MB_OKCANCEL	       The message box contains two push buttons:
                        OK and Cancel.
 MB_RETRYCANCEL        The message box contains two push buttons:
                        Retry and Cancel.
 MB_YESNO              The message box contains two push buttons:
                        Yes and No.
 MB_YESNOCANCEL        The message box contains three push buttons:
                        Yes, No, and Cancel.

 Specify one of the following flags to display an icon in the message box:

 Flag                  Meaning
 MB_ICONEXCLAMATION,
 MB_ICONWARNING        An exclamation-point icon appears in the message box.
 MB_ICONINFORMATION,
 MB_ICONASTERISK       An icon consisting of a lowercase letter i in a circle
                       appears in the message box.
 MB_ICONQUESTION       A question-mark icon appears in the message box.
 MB_ICONSTOP,
 MB_ICONERROR,
 MB_ICONHAND           A stop-sign icon appears in the message box.

 Specify one of the following flags to indicate the default button:

 Flag                  Meaning
 MB_DEFBUTTON1         The first button is the default button.
                       MB_DEFBUTTON1 is the default unless MB_DEFBUTTON2,
                       MB_DEFBUTTON3, or MB_DEFBUTTON4 is specified.
 MB_DEFBUTTON2         The second button is the default button.
 MB_DEFBUTTON3         The third button is the default button.
 MB_DEFBUTTON4         The fourth button is the default button.

 In addition, you can specify the following flag:
 MB_SETFOREGROUND      The MsgBox becomes the foreground window.

 The MsgBox have Glyphs on the buttons, and the Default caption for the
 buttons is definable/Predefined:
 Button          StringVar         Constant used if not defined by user in StringVar
 Yes             mb_BtnYes         _Btn_Yes
 No              mb_BtnNo          _Btn_No
 Cancel          mb_BtnCancel      _Btn_Cancel
 Ok              mb_BtnOk,         _Btn_Ok
 Retry           mb_BtnRetry       _Btn_Retry
 Abort           mb_BtnAbort       _Btn_Abort
 Ignore          mb_BtnIgnore      _Btn_Ignore

 The MsgBox position is in the Owner Form Center.

 The size of the button can be adjusted with the following IntVariables
 mb_BtnHeight    Sets the height of the buttons. If value is NULL, default
                 is used.
 mb_BtnWidth     Sets the Width of the buttons. If value is NULL, default
                 is used.
 These settings affect all MsgBoxes and Statusboxes.

 The MsgBox fonts can be cadjusted with the following TfontVar
 mb_BtnFont      Sets the buttons font. If the value is NULL, default is used.
 mb_MsgFont      Sets the MsgBox Message font. If the value is NULL, default
                 is used.
 These settings affect all MsgBoxes and Statusboxes.

Return Values
 If the function succeeds, the return value is one of the following menu-item
 values returned by the dialog box:

 Value           Meaning
 IDABORT         Abort button was selected.
 IDCANCEL        Cancel button was selected.
 IDIGNORE        Ignore button was selected.
 IDNO            No button was selected.
 IDOK            OK button was selected.
 IDRETRY         Retry button was selected.
 IDYES           Yes button was selected.

The MsgBoxPos function in addition includes the TpointVar Position parameter
that can be one of the following values :
 poDefault               places the message box at the topleft screen position
 poScreenCenter          placet the message box at the screen center
 poDesktopCenter         places the message box at the screen desktop center
 poMainFormCenter        places the message box at the application mainform center
 poOwnerFormCenter       places the message box at the application ownerform center


 The MsgBoxEX function it a advanced custom edition of the MsgBox function.

 int MsgBox(
    STR     Msg,          // address of text in message box
    STR     Caption,      // address of title of message box
    TPIC    MsgPic        // address of icon to show in the message box
    TIMGLST GlyphList     // address of imagelist to representing button glyphs
    TPOS    Position      // position of message box
    STR     Buttons       // adress of ButtonCaptions
    STR     Sound         // adress of sound to play when opening the message box
    BOOL    StayOnTop     // formstyle of message box
    BOOL    SetForeGround // determine if message box becomes the foreground
                             window.
    TCOLOR  Color         // set the color of the message box
    BYTE    DefaultButton // sets the default button in the message box
   );

 Parameters

 Msg
   Points to a string containing the message to be displayed.

 Caption
   Points to a string used for the dialog box title. If this parameter is NULL,
   the ownerform caption is used, if any.

 MsgPic
   Points to a picture representing the messagebox icon.
   If this value is NULL, no icon is displayed.

 GlyphList
   Points to a imagelist representing the buttonglyphs.
   the first button uses the first image in the imagelist,
   the following buttons uses the following images in the
   imagelist. If this value is NULL, no buttonglyphs is displayed.

 Position
   This parameter has the same function as mentioned in the MsgBoxPos parameter.

 Buttons
  Points to a string containing the names of the buttons to be created.
  each button is to be separated with a "|" character.
  example. defining "&Yes|&No|&Donno|&Perhaps" in the Buttons parameter
  creates 4 buttons with the captions : "Yes", "No", "Donno" & "Perhaps".
  you can define up to 254 Buttons!

 Sound
  Points to a string defining the resourcesound/messagebeep/audiofile to be
  played.
  "MB_ICONINFORMATION" plays messagebeep MB_ICONINFORMATION,
  "MB_ICONEXCLAMATION" plays messagebeep MB_ICONEXCLAMATION,
  "MB_ICONQUESTION" plays messagebeep MB_ICONQUESTION,
  "MB_ICONERROR" plays the messagebeep MB_ICONERROR,
  "BEEP" plays the default system messagebeep.
  a full path to an audiofile plays the file,
  any other name is treated as an audioresource.
  If this parameter is NULL, no sound is played.

 StayOnTop
  Specify if the message box shold stay on top,
  set to true or false.

 SetForeGround
  determine if message box becomes the foreground window,
  set to true or false.

 Color
  Points to a Tcolor defining the color of the message box.
  clBtnFace is usually the standard color of messageboxes.

 DefaultButton
  Points to a int value defining witch button is to be default.
  If this parameter is NULL, button1 is set to default.


 Return Values
  If the function succeeds, the return value is an integer value
  representing the number of button selected added with 10.



the StatusBox function creates and displays a status window.
The statuswindow contains an application-defined message and title.

 BOOL StatusBox(
    STR  Msg,     // address of text in status window
    STR  Caption, // address of title of status window
   );

 Parameters

 Msg
   Points to a string containing the message to be displayed.
   The message font can be adjusted with the FONTvar mb_MsgFont.

 Caption
   Points to a string used for the status window title. If this parameter is NULL,
   the ownerform caption is used, if any.

 Return Values
  If the function succeeds, the return value is true.

 BOOL StatusBoxEX(
    STR  BoxMsg,          // address of text in status window
    STR  BoxCaption,      // address of title of status window
    STR     Sound         // address of sound to play when opening the status window
    TPIC    MsgPic        // address of icon/picture to show in the status window
    TPOS    BoxPosition   // position of status window
    BOOL    StayOnTop     // formstyle of status window
    TCOLOR  BoxColor      // set the color of the status window
    INT     BoxHeight     // set the height of the status window
    INT     BoxWidth      // set the width of the status window
    INT     GaugeMinValue // set the status window progressbar minimum value
    INT     GaugeMaxValue // set the status window progressbar maximum value
    INT     MsgReceiver   // address of window handle to receive cancel message
                             message
    BOOL    ShowGauge     // determine if a gauge is visible in the status window
    BOOL    CancelButton  // determine if a cancel button is visible in the
                             status window
   );

 Parameters

 Msg
   Points to a string containing the status message to be displayed.
   The message font can be adjusted with the FONTvar mb_MsgFont.

 Caption
   Points to a string used for the status window title.
   If this parameter is NULL, the ownerform caption is used.

 Sound
  Points to a string defining the resourcesound/messagebeep/audiofile to be
  played.
  "MB_ICONINFORMATION" plays messagebeep MB_ICONINFORMATION,
  "MB_ICONEXCLAMATION" plays messagebeep MB_ICONEXCLAMATION,
  "MB_ICONQUESTION" plays messagebeep MB_ICONQUESTION,
  "MB_ICONERROR" plays the messagebeep MB_ICONERROR,
  "BEEP" plays the default system messagebeep.
  a full path to an audiofile plays the file,
  any other name is treated as an audioresource.
  If this parameter is NULL, no sound is played.

 MsgPic
   Points to a picture representing the status window icon/picture.
   If this value is NULL, no icon/picture is displayed.

 BoxPosition
   pionts to the status windows position that can be one of the following values:
   poDefault          places the message box at the topleft screen position
   poScreenCenter     placet the message box at the screen center
   poDesktopCenter    places the message box at the screen desktop center
   poMainFormCenter   places the message box at the application mainform center
   poOwnerFormCenter  places the message box at the application ownerform center

 StayOnTop
   Specify if the status windows shold stay on top,
   set to true or false.

 BoxColor
   Points to a color value defining the color of the message box.
   clBtnFace is usually the standard color of messageboxes.

 BoxHeight
   Pionts to a int value defining the height of the status window.
   If this parameter is NULL, the height is autoadjusted.


 BoxWidth
   Points to a int value defining the width of the status window.
   If this parameter is NULL, the width is autoadjusted.

 GaugeMinValue
   Points to a int value defining the status window progressbar(gauge)
   minimum value. This have no affect if showgauge is set to false.

 GaugeMaxValue
   Points to a int value defining the status window progressbar(gauge)
   maximum value. This have no affect if showgauge is set to false.

 MsgReceiver
   Points to a handle defining the window to receive the cancel message.
   This have no affect if cancelbutton is set to false, or value
   is set to NULL.

 ShowGauge
   Determine if the status window should have a progressbar (gauge).
   Set to true or false.

   You can set the gauge height with the intvar mb_GaugeHeight, if this
   value is NULL, default is used.
   You can set the gauge width with the intvar mb_GaugeWidth, if this
   value is NULL, the gauge width is autoadjusted.

 CancelButton
   Determine if the statuswindow should have a cancel button.
   Set to true or false.
   This button can be controlled by the STR mb_BtnCancel,
   INT  mb_BtnHeight, INT mb_BtnWidth ant font mb_BtnFont.
   The default message sent by this button is defined in the
   const _MSG_Cancel. (set to WM_USER + 6 by author)


 Return Values
  If the function succeeds, the return value is true.

 In addition, the progressbar (gauge) foreground color can be adjusted
 with the mb_GaugeForeColor, progressbar (gauge) backgroundcolor can
 be adjusted with the mb_GaugeBackColor variables.


The CloseStatusBox function closes the status window created with
StatusBox or statusBoxEX function.

 BOOL CloseStatusBox(   -no parameters required
  );

 Return Values
  If the function succeeds, the return value is true.


The UpdateStatusBoxGauge function updates the status window progressbar value
if used.

 BOOL UpdateStatusBoxGauge(
   INT Increment  // Points to a value defining the status window progressbar
                    increment of the progress.
  );

 Return Values
  If the function succeeds, the return value is true.

The SetStatusBoxGauge function sets the status window progressbar value if used.

 BOOL SetStatusBoxValue(
    INT  Progress  // Points to a value defining the status window progressbar
                     progress.
  );

 Return Values
  If the function succeeds, the return value is true.


The EditBox function creates, displays, and operates a inputbox.
The EditBox can contain several application-defined prompts and checkboxes,
a title, a predefined picture and play a sound.

 str EditBox(
  STR  Prompt,       //Points to a string containing the prompt for the edit field.
                       separate several editfields with the "|" char.
  STR  Caption,      //Points to a string used for the editbox title.
  STR  Default,      //Points to a string defining the default value in edit field.
                       separate editvalues with the "|" char.
                       example. "||something" places the value "something" in the
                       second editfield. If this value is NULL, editvalue(s) are empty
  CHAR PassChar,     //Points to a char defining the password character to be shown
                       in the editfield. If this value is NULL, editvalues are not hidden.
  STR  CheckBox,     //Points to a string containing the caption for checkbox(es).
                       separate checkboxes with the "|" char. If the  #1 char is
                       the first char in any checkbox caption, that checkbox is checked
                       as default.
  STR  Sound,        //Points to a string defining the resourcesound/messagebeep/
                       audiofile to be played.
  TPIC Pic,          //Points to a picture representing the status window icon/picture.
                       If this value is NULL, no icon/picture is displayed.
  COLOR BoxColor,    //Points to a color value defining the color of the editbox.
  COLOR EditColor,   //Points to a color value defining the backgroundcolor of the
                       editfield.
  TPOS Position,     //Points to a Tpos value defining the position of the editbox.
  BOOL StayOnTop,    //Defining the editbox formstyle. Set to true or false.
  FONT EditFont,     //Points to a Tfont defining the font of the editfield.
                      If this value is null, default font is used.
  FONT CheckBoxFont, //Points to a Tfont defining the font of the editfield.
                      If this value is null, default font is used.
  INT EditWidth;     //Points to a Integer value defining the width of the editfield.
                       If this value is NULL, default is used.
   );

 Returnvalues
  if the function did not succeed the return value is char #1 else
  if cancel button was pushed the returnvalue is char #0 else
  if the function succeed the returnvalue is a string containing
  the editvalue in editfield. If several fields is used, fields
  is separated with the #10 line feed char in resultstring. If in addition checkboxes is used,
  the #13 character is used to separate editfields from following checkbox values in
  resultstring. The checkboxstate(s) are '1' for checked and '0' fon unchecked boxes.
  You migth want to use the mb.StringToStringList function to separate stringresult
  into a stringlist.



Example on how to display a message box with red fonts in message,
yesnobuttons, yesbutton's caption = 'Yeah', display a questionicon,
and default button is 2:

 Var ReturnValue : Integer;

 Procedure Sample1;
 begin
   mb_BtnYes := '&Yeah';
   mb_MsgFont := Tfont.Create;
   mb_MsgFont.Color  := clRed;
   ReturnValue := MsgBox( 'This is the red message', '', False,
    MB_YESNO or MB_DEFBUTTON2 or MB_ICONQUESTION);
   mb_MsgFont.Free;
 end;


Example on how to display a simple message box asking for a value
from 1 to 10 represented by buttons 1 to 10, playing the soundfile
"c:\woww.wav", where default button is 5:

 Var ReturnValue : Integer;

 Procedure sample2;
 begin
   ReturnValue := MsgBoxEX('Select a value from 1 to 10', '', nil, nil,
   poOwnerFormCenter, '1|2|3|4|5|6|7|8|9|10', 'c:\woww.wav', False, False,
   clBtnFace, 5);
 end;


********************************************************************************

*)

unit mb;

interface

 uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
   StdCtrls, Buttons, ExtCtrls, mmsystem, Gauges;

 const
   _Btn_Yes = '&Ja';
   _Btn_No = '&Nei';
   _Btn_Cancel = '&Avbryt';
   _Btn_Ok = '&OK';
   _Btn_Retry = '&Nytt forsøk';
   _Btn_Abort = '&Avbryt';
   _Btn_Ignore = 'Ignorere';
   _MSG_Cancel = WM_USER + 6;

 var

  mb_GaugeForeColor,    mb_GaugeBackColor               : Tcolor;

  mb_GaugeHeight,       mb_GaugeWidth,
  mb_BtnHeight ,        mb_BtnWidth                     : Integer;

  mb_BtnYes,    mb_BtnNo,    mb_BtnCancel,     mb_BtnOk,
  mb_BtnRetry,    mb_BtnAbort,    mb_BtnIgnore          : String;

  mb_BtnFont,        mb_MsgFont                         : Tfont;

  mb_CheckBoxWidth                                      : Integer = 0;

  mb_ForceBoxUp                                         : Boolean = False;

  mb_ExcludeEditInEditBox                               : Boolean = False;

  mb_CreateNotOwned                                     : Boolean = False;

  mb_AlphaBlend                                         : Boolean = False;

  mb_AlphaBlendValue                                    : Byte    = 255;

  mb_TransparentColor                                   : Boolean = False;

  mb_TransparentColorValue                              : Tcolor  = clBlack;

 function MsgBox(msg, caption : string; Silent : Boolean; uType : Cardinal)
  : Cardinal;

 function MsgBoxPos(msg, caption : string; Silent : Boolean; Position :
  Tposition; uType : Cardinal) : Cardinal;

 function MsgBoxEX( msg, caption  :String; MsgPic : TPicture;
  GlyphList : TimageList; position : Tposition;
  Buttons, Sound : String; StayOnTop, SetForeground : Boolean;
  Color : Tcolor; DefaultButton : Byte) : Cardinal;

 function EditBox( Prompt, Caption, Default, PassChar, CheckBox, Sound : String;
  Pic : Tpicture;
  BoxColor, EditColor : Tcolor; Position : Tposition; StayOnTop : Boolean;
  EditFont, CheckBoxFont : Tfont; EditWidth : Integer ) : String;

 function QBox( const Prompt, Caption, Default : String) : String;

 function PasswordBox( Prompt1, Prompt2, Caption, Default : String) : String;

 function StatusBoxEX( BoxMsg, BoxCaption, Sound : String;
  MsgPic : TPicture; Boxposition : Tposition; StayOnTop : Boolean;
   BoxColor : Tcolor; BoxHeight, BoxWidth,
   GaugeMinValue, GaugeMaxValue :
    Integer; MsgReceiver : Thandle; ShowGauge, CancelButton : Boolean)
     : Boolean;

 function StatusBox( msg, Caption : String) : Boolean;

 function StringToStringList( ResultString : String; TargetStringList
  : TStringList) : Boolean;

 function UpdateStatusBoxGauge( Increment : Integer) : Boolean;

 function SetStatusBoxGauge( Progress : Integer) : Boolean;

 function CloseStatusBox : Boolean;

 function MsgBoxS(Const msg : String) : Boolean;

 Procedure StopSound;


  implementation


var
    frm, sfrm : Tform;
    Gauge1    : Tgauge;
    StbV      : Boolean = False;
    Gauged    : Boolean;
    RH        : Thandle;


Procedure StopSound;
begin
 playsound( Nil, hInstance, snd_ASync);
end;


function HasParent__ : Boolean; // FUCK, now i understand my unnessesary rewriting...
begin                           // ...Well, its done...FUCK!
 Result := Screen.ActiveForm <> nil;
end;

procedure playsnd( sound : String);
var fdws : Cardinal;
begin
 if sound = '' then exit else
 if uppercase(sound) = 'MB_ICONINFORMATION' then messagebeep(MB_ICONINFORMATION) else
 if uppercase(sound) = 'MB_ICONEXCLAMATION' then messagebeep(MB_ICONEXCLAMATION) else
 if uppercase(sound) = 'MB_ICONQUESTION' then messagebeep(MB_ICONQUESTION) else
 if uppercase(sound) = 'MB_ICONERROR' then messagebeep(MB_ICONERROR) else
 if (uppercase(sound) = 'BEEP') or (sound = '0') then messagebeep(0) else
 if sound = '65535' then messagebeep(65535) else
 begin
  if pos('\', sound) > 0 then fdws := SND_Async else
   fdws := SND_RESOURCE or SND_Async;
  playsound( pchar(sound), hInstance, fdws);
 end;
end;

function ShowForm( Msg, FCaption, LYD : String; const uType : Cardinal; Glyph :
 TPicture; BtnList : TstringList; BtnImagez : TimageList; NoSnd : Boolean;
 Location : Tposition; StayOnTop, Foreground : Boolean;
  Fcolor : Tcolor; DefButton : Byte): Cardinal;
var  ico          : Ticon;
     ok, custb    : Boolean;
     it, ih, il, ll, fw,
     lw, i, bCount,
     btnval, by3  : Integer;
     defbtn, fact : Byte;
     bh           : Thandle;
     btns         : String;

begin
 Result := 0;
 if BtnList <> nil then
 begin
  custb := True;
  bCount := BtnList.Count;
  defbtn := DefButton;
  if glyph <> nil then i := 1 else i := 0;
 end else
 begin
  custb := False;
  btnval := uType;
  if btnval - MB_SETFOREGROUND >= 0 then
  begin
   btnval := btnval - MB_SETFOREGROUND;
   Foreground := True;
  end;
  if btnval - MB_DEFBUTTON4 >= 0 then defbtn := 4 else
  if btnval - MB_DEFBUTTON3 >= 0 then defbtn := 3 else
  if btnval - MB_DEFBUTTON2 >= 0 then defbtn := 2 else
  defbtn := 1;
  case defbtn of
   2 : btnval := btnval - MB_DEFBUTTON2;
   3 : btnval := btnval - MB_DEFBUTTON3;
   4 : btnval := btnval - MB_DEFBUTTON4;
  end;
  if btnval - MB_ICONINFORMATION >= 0 then i := MB_ICONINFORMATION else
  if btnval - MB_ICONEXCLAMATION >= 0 then i := MB_ICONEXCLAMATION else
  if btnval - MB_ICONQUESTION >= 0 then i := MB_ICONQUESTION else
  if btnval - MB_ICONERROR >= 0 then i := MB_ICONERROR else i := 0;
  btnval := btnval - i;
  case btnval of
   MB_OK : btns := 'o';
   MB_OKCANCEL : btns := 'oc';
   MB_ABORTRETRYIGNORE : btns := 'ari';
   MB_YESNOCANCEL : btns := 'ync';
   MB_YESNO : btns := 'yn';
   MB_RETRYCANCEL : btns := 'rc';
  end;
  if btns = '' then exit;
 end;
 if not custb then
 begin
  bCount := length(btns);
  if mb_BtnYes = '' then mb_BtnYes := _Btn_Yes;
  if mb_BtnNo = '' then mb_BtnNo := _Btn_No;
  if mb_BtnCancel = '' then mb_BtnCancel := _Btn_Cancel;
  if mb_BtnOk = '' then mb_BtnOk := _Btn_Ok;
  if mb_BtnRetry = '' then mb_BtnRetry := _Btn_Retry;
  if mb_BtnAbort = '' then mb_BtnAbort := _Btn_Abort;
  if mb_BtnIgnore = '' then mb_BtnIgnore := _Btn_Ignore;
 end;
 try
  if mb_CreateNotOwned then frm := Tform.Create( nil) else
   frm := Tform.Create( screen.activeform);
  try
   with frm do
   begin
    Alphablend := mb_Alphablend;
    AlphaBlendValue := mb_AlphablendValue;
    TransparentColor := mb_TransparentColor;
    TransparentColorValue := mb_TransparentColorValue;
    color := Fcolor;
    BorderStyle := bsSingle;
    BorderIcons := [biSystemMenu];
    Position := Location;
    WindowState := wsNormal;
    if mb_CreateNotOwned then FormStyle := fsStayOnTop else
    begin
     if StayOnTop then FormStyle := fsStayOnTop else FormStyle := fsNormal;
    end;
    Caption := FCaption;
    bh := GetSystemMenu(Handle, False);
    EnableMenuItem( bh, SC_CLOSE, MF_BYCOMMAND or MF_DISABLED or MF_GRAYED);
    DeleteMenu( bh, SC_MAXIMIZE, MF_BYCOMMAND);
    DeleteMenu( bh, SC_MINIMIZE, MF_BYCOMMAND);
    DeleteMenu( bh, SC_SIZE, MF_BYCOMMAND);
    DeleteMenu( bh, SC_RESTORE, MF_BYCOMMAND);
    DeleteMenu( bh, SC_CLOSE, MF_BYCOMMAND);
    DeleteMenu( bh, 1, MF_BYPOSITION);
    DrawMenuBar(Handle); //Jic...
    bh := 0;
   end;
   if not custb then
   begin
    if not nosnd and ( i = 0) then messagebeep( 0);
   end else playsnd( LYD);
   if i > 0 then
   begin
    if not custb then
    begin
     if not NoSnd then messagebeep(i);
     ico := Ticon.Create;
    end;
    try
     if not custb then
     case i of
      MB_ICONINFORMATION : ico.Handle := LoadIcon( 0, IDI_INFORMATION);
      MB_ICONEXCLAMATION : ico.Handle := LoadIcon( 0, IDI_EXCLAMATION);
      MB_ICONQUESTION    : ico.Handle := LoadIcon( 0, IDI_QUESTION);
      MB_ICONERROR       : ico.Handle := LoadIcon( 0, IDI_ERROR);
     end;
     with timage.Create( frm) do
     begin
      parent := frm;
      transparent := True;
      if custb then
      begin
       height := glyph.Height;
       width := Glyph.Width;
      end else
      begin
       height := ico.Height;
       width := ico.Width;
      end;
      ih := height;
      top := Height div 2 + 2;
      it := Top;
      left := Width div 2 + 2;
      il := Left + width + width div 2;
      if width <= 16 then
      begin
       il := il + 16;
       left := left + 8;
      end;
      if height <= 16 then
      begin
       it := it + 8;
       top := top + 8;
      end;
      if custb then picture := Glyph else canvas.Draw( 0, 0, ico);
     end;
    finally
    end;
    if not custb then ico.Free;
   end else
   begin
    ih := 32;
    it := 18;
    il := 18;
   end;
   with Tlabel.Create( frm) do
   begin
    parent := frm;
    if  mb_MsgFont <> nil then Font := mb_MsgFont;
    caption := msg;
    left := il;
    if Height >= ih then top := it else
     Top := it + ih div 2 - height div 2;
    it := top + height;
    lw := Width + il;
   end;
   fact := 0;
   by3 := 0;
   if bCount > 9 then by3 := -1;
   fw := 0;
   for i := 1 to bCount do
   begin
    with Tbitbtn.Create(frm) do
    begin
     Parent := frm;
     if i = 1 then bh := Handle;
     if mb_BtnFont <> nil then font := mb_BtnFont;
     if custb then
     begin
      modalresult := i + 10;
      Caption := BtnList.Strings[i - 1];
      if BtnImagez <> nil then BtnImagez.GetBitmap( i - 1, Glyph);
     end else
     case btns[i] of
      'a' : begin
             Kind := bkAbort;
             Caption := mb_BtnAbort;
            end;
      'c' : begin
             Kind := bkCancel;
             Caption := mb_BtnCancel;
            end;
      'i' : begin
             Kind := bkIgnore;
             Caption := mb_BtnIgnore;
            end;
      'n' : begin
             Kind := bkNo;
             Caption := mb_btnNo;
            end;
      'o' : begin
             Kind := bkOk;
             Caption := mb_BtnOk;
            end;
      'r' : begin
             Kind := bkRetry;
             Caption := mb_BtnRetry;
            end;
      'y' : begin
             Kind := bkYes;
             Caption := mb_BtnYes;
            end;
     end;
     if fact = 0 then fact := height div 2;
     if mb_BtnHeight <> 0 then Height := mb_BtnHeight;
     if mb_BtnWidth <> 0 then Width := mb_BtnWidth;
     if i = 1 then
     begin
      it := it + fact;
      case bCount of
       10..255 : if (width * 4 + fact * 4) < lw
                  then il := (il + lw - (width * 4) - (fact * 4)) div 2;
       3, 5..9 : if (width * 3 + fact * 3) < lw
                  then il := (il + lw - (width * 3) - (fact * 3)) div 2;
       2, 4 : if (width * 2 + fact * 2) < lw
                then il := (il + lw - width * 2 - fact) div 2;// - endaen;
       1 : if (width + fact) < lw then il := (il + lw - width) div 2;// - endaen;
      end;
      ll := il;
     end;
     left := il;
     top := it;
     if (bCount = 4) and (i = 2) then by3 := 3 else inc(by3);
     if by3 > 2 then
     begin
      it := it + height + fact;
      by3 := 0;
      if bCount > 9 then by3 := -1;
      il := ll;
     end else
     begin
      il := il + width + fact;
      if (i = bCount) and (by3 <> 3) then it := it + height + fact;
     end;
     if fw < il then fw := il;
     if (i = bCount) and (bcount > 2) and (bcount <> 4) then fw := fw + width + fact * 2;//BUGBYPASS
     if (i = bCount) and (fw < (lw + fact)) then fw := lw + fact * 2;
    end;
   end;
   frm.ClientWidth := fw;
   frm.ClientHeight := it;
   with Tbevel.Create (frm) do
   begin
    Parent :=  frm;
    Shape := bsFrame;
    Style := bsLowered;
    Top := 3;
    Left := 3;
    height := frm.ClientHeight - 6;
    width := frm.ClientWidth - 6;
   end;
   if defbtn > 1 then for defbtn := defbtn downto 2 do
   begin  { ...DONT ASK...  ...it does the job :-)... }
    postmessage( bh, WM_KEYDOWN, 9, 0);
    postmessage( bh, WM_KEYUP, 9, 0);
   end;
   if Foreground then
   begin
    if isiconic(getparent(frm.handle)) then
     showwindow(getparent(frm.handle), SW_RESTORE);
    if GetForegroundWindow <> getparent(frm.handle) then
    begin
     SetForegroundWindow(getparent(frm.handle));
     if mb_ForceBoxUp then
     begin    { ...avoid minimize other... }
      showwindow(getparent(frm.handle), SW_MINIMIZE);
      showwindow(getparent(frm.handle), SW_RESTORE);
     end;
    end;
   end;
   frm.ShowModal;
   frm.Release;
   Result := frm.ModalResult;
   frm.Free; //..?..
   Ok := True;
  except
   Ok := False;
  end;
 except
  Ok := False;
 end;
 if not ok then Result := 0;
end;


procedure CancelBtnClk;
begin
 if RH > 100 then postmessage( RH, _MSG_Cancel, 0, 0);
end;

function StatusBoxEX( BoxMsg, BoxCaption, Sound : String;
 MsgPic : TPicture; Boxposition : Tposition; StayOnTop : Boolean;
  BoxColor : Tcolor; BoxHeight, BoxWidth,
  GaugeMinValue, GaugeMaxValue : Integer; MsgReceiver : Thandle; ShowGauge, CancelButton : Boolean)
    : Boolean;
var WW, TTop : Integer;
begin
 Result := False;
 if StbV then Exit;
 WW := 20;
 Gauged := ShowGauge;
 playsnd( Sound);
 if not hasparent__ then
 begin
  if (BoxPosition <> poDeskTopCenter) or (BoxPosition <> poScreenCenter) then
  BoxPosition := poDesktopCenter;
 end else if BoxCaption = '' then BoxCaption := Screen.ActiveForm.Caption;
 if mb_CreateNotOwned then Sfrm := Tform.Create( nil) else
  Sfrm := Tform.Create( Screen.ActiveForm);
 try
  with Sfrm do
  begin
   Alphablend := mb_Alphablend;
   AlphaBlendValue := mb_AlphablendValue;
   TransparentColor := mb_TransparentColor;
   TransparentColorValue := mb_TransparentColorValue;
   color := BoxColor;
   //BorderStyle := bsToolWindow;
   //BorderIcons := [];
   BorderStyle := bsSingle;
   BorderIcons := [biSystemMenu];
   Position := BoxPosition;
   WindowState := wsNormal;
   if mb_CreateNotOwned then FormStyle := fsStayOnTop else
   begin
    if StayOnTop then FormStyle := fsStayOnTop else FormStyle := fsNormal;
   end;
   Caption := BoxCaption;
   TTop := GetSystemMenu(Handle, False);
   EnableMenuItem( TTop, SC_CLOSE, MF_BYCOMMAND or MF_DISABLED or MF_GRAYED);
   DeleteMenu( TTop, SC_MAXIMIZE, MF_BYCOMMAND);
   DeleteMenu( TTop, SC_MINIMIZE, MF_BYCOMMAND);
   DeleteMenu( TTop, SC_SIZE, MF_BYCOMMAND);
   DeleteMenu( TTop, SC_RESTORE, MF_BYCOMMAND);
   DeleteMenu( TTop, SC_CLOSE, MF_BYCOMMAND);
   DeleteMenu( TTop, 1, MF_BYPOSITION);
   DrawMenuBar(Handle); //Jic...
  end;
  TTop := 20;
  if msgpic <> nil then
  with timage.Create( Sfrm) do
  begin
    parent := Sfrm;
    transparent := True;
    height := MsgPic.Height;
    width := MsgPic.Width;
    top := TTop;
    left := 20;
    picture := MsgPic;
    TTop := TTop + Height + 20;
    WW := width;
  end;
  with Tlabel.Create( Sfrm) do
  begin
   parent := Sfrm;
   if  mb_MsgFont <> nil then Font := mb_MsgFont;
   caption := BoxMsg;
   Top := TTop;
   Left := 20;
   TTop := TTop + height + 20;
   if WW < width then WW := Width;
  end;
  if ShowGauge then
  begin
   Gauge1 := Tgauge.Create(Sfrm);
   with Gauge1 do
   begin
    parent := Sfrm;
    left := 20;
    top := TTop;
    if mb_GaugeWidth <> 0 then Width := mb_gaugeWidth else
    width := WW;
    if mb_GaugeHeight <> 0 then Height := mb_GaugeHeight else Height := 20;
    ForeColor := mb_GaugeForeColor;
    if mb_GaugeBackColor <> clBlack then BackColor := mb_GaugeBackColor else
     BackColor := BoxColor;
    MinValue := GaugeMinValue;
    MaxValue := GaugeMaxValue;
    Progress := MinValue;
    TTop := TTop + Height + 20;
    if width > WW then WW := Width;
   end;
  end;
  if CancelButton then
  with TBitBtn.Create(Sfrm) do
  begin
   RH := MsgReceiver;
   Parent := Sfrm;
   top := TTop;
   Kind := bkCancel;
   if mb_BtnFont <> nil then font := mb_BtnFont;
   if mb_BtnCancel = '' then mb_BtnCancel := _Btn_Cancel;
   Caption := mb_BtnCancel;
   ModalResult := mrNone;
   @OnClick := @CancelBtnClk;
   if mb_BtnHeight <> 0 then Height := mb_BtnHeight;
   if mb_BtnWidth <> 0 then Width := mb_BtnWidth;
   if WW > Width then Left := (ww + 40) div 2 - width div 2 else
   begin
    WW := Width;
    Left := 20;
   end;
   TTop := TTop + Height + 20;
  end;
  if BoxHeight > 0 then Sfrm.ClientHeight := Boxheight
   else Sfrm.ClientHeight := TTop;
  if BoxWidth > 0 then Sfrm.ClientWidth := BoxWidth
   else Sfrm.ClientWidth := WW + 40;
  with Tbevel.Create (Sfrm) do
  begin
   Parent :=  Sfrm;
   Shape := bsFrame;
   Style := bsLowered;
   Top := 3;
   Left := 3;
   height := Sfrm.ClientHeight - 6;
   width := Sfrm.ClientWidth - 6;
  end;
  Sfrm.Show;
  StbV := True;
  result := True;
 finally
 end;
end;

function StatusBox( msg, Caption : String) : Boolean;
begin
 if HasParent__ then
 begin
  if Caption = '' then Caption := Screen.ActiveForm.Caption;
  Result := StatusBoxEX( msg, caption, '', nil, poOwnerFormCenter,
  True, screen.ActiveForm.Color, 0, 0, 0, 0, 0, False, False);
 end else result :=
 StatusBoxEX( msg, caption, '', nil, poDeskTopCenter, True, clBtnface, 0, 0,
  0, 0, 0, False, False);
end;

function SetStatusBoxGauge( Progress : Integer) : Boolean;
begin
 if StbV and Gauged then
 begin
  Gauge1.Progress := Progress;
  Result := True;
 end else Result := False;
end;

function UpdateStatusBoxGauge( Increment : Integer) : Boolean;
begin
 if StbV and Gauged then
 begin
  Gauge1.Progress := Gauge1.Progress + Increment;
  Result := True;
 end else Result := False;
end;

function CloseStatusBox : Boolean;
begin
 if StbV then
  try
   if Gauged Then Gauge1.Free;
   Sfrm.Release;
   sfrm.Free;
   StbV := False;
   Result := True;
  finally
  end else Result := False;
end;

function MsgBoxPos(msg, caption : string; Silent : Boolean;Position
 : Tposition; uType : Cardinal) : Cardinal;
begin
 if HasParent__ then
 begin
  if caption = '' then caption := Screen.Activeform.Caption;
  Result := ShowForm( msg, Caption, '', uType, nil, nil, nil, Silent,
   Position, False, False, Screen.ActiveForm.Color, 0)
 end else Result :=
    ShowForm( msg, caption, '', uType, nil, nil, nil, Silent, poDesktopCenter,
     False, False, clBtnFace, 0);
end;

function MsgBox(msg, caption : string; Silent : Boolean; uType : Cardinal)
  : Cardinal;
begin
 if HasParent__ then
 begin
  if caption = '' then caption := Screen.Activeform.Caption;
  Result := ShowForm( Msg, Caption, '', uType, nil, nil, nil, silent,
   poOwnerFormCenter, False, False, Screen.ActiveForm.Color, 0);
 end else Result :=
    ShowForm( msg, Caption, '', uType, nil, nil, nil, Silent, poDesktopCenter,
     false, False, clBtnFace, 0);
end;

function MsgBoxS(Const msg : String) : Boolean;
begin
 Result := MsgBox(msg, '', True, MB_OK or MB_ICONINFORMATION) > 0;
end;

function MsgBoxEX( msg, caption  :String; MsgPic : TPicture;
 GlyphList : TimageList; position : Tposition;
 Buttons, Sound : String; StayOnTop, SetForeground : Boolean;
  Color : Tcolor; DefaultButton : Byte) : Cardinal;
var i, t : integer;
    NList : TstringList;
begin
 Result := 0;
 if buttons = '' then exit;
 NList := TStringList.Create;
 t := 1;
 if buttons[1] = '|' then delete( buttons, 1, 1);
 if buttons[length(buttons)] <> '|' then buttons := buttons + '|';
 for i := 1 to length( buttons) do if buttons[i] = '|' then
 begin
  Nlist.Add( copy( buttons, t, i - t));
  t := i + 1;
 end;
 if nlist.count > 0 then
 begin
  if HasParent__ then
  begin
   if Caption = '' then Caption := Screen.Activeform.Caption;
   Result := ShowForm(msg, caption, Sound, 0, MsgPic,
   NList,GlyphList, False, Position, StayOnTop, SetForeground, Color,
   DefaultButton);
  end else Result := ShowForm(msg, caption, Sound, 0, MsgPic,
   NList, GlyphList, False, poDesktopCenter, StayOnTop, False, Color,
    DefaultButton);
 end;
 NList.Free;
end;

function EditBox( Prompt, Caption, Default, PassChar, CheckBox, Sound : String;
 Pic : Tpicture;
 BoxColor, EditColor : Tcolor; Position : Tposition; StayOnTop : Boolean;
  EditFont, CheckBoxFont : Tfont; EditWidth : Integer ) : String;
var  form              : Tform;
     ww, Ttop, i       : Integer;
     p                 : Array[0..255] of char;
     hList, el, dl, cb : TstringList;

begin
 Result := '';
 if ( Prompt = '') and ( CheckBox = '') then exit;
 hList := TstringList.Create;
 el := TstringList.Create;
 dl := TstringList.Create;
 cb := TstringList.Create;
 Ttop := 1;
 if Prompt <> '' then
 begin
  if Prompt[1] = '|' then delete( Prompt, 1, 1);
  if Prompt[length(Prompt)] <> '|' then Prompt := Prompt + '|';
  for ww := 1 to length( Prompt) do if Prompt[ww] = '|' then
  begin
   el.Add( copy( Prompt, Ttop, ww - Ttop));
   Ttop := ww + 1;
  end;
 end;
 if el.Count > 1 then if pos('|', Default) > 0 then
 begin
  Ttop := 1;
  if Default[1] = '|' then delete( Default, 1, 1);
  if Default[length(Default)] <> '|' then Default := Default + '|';
  for ww := 1 to length( Default) do if Default[ww] = '|' then
  begin
   dl.Add( copy( Default, Ttop, ww - Ttop));
   Ttop := ww + 1;
  end;
 end;
 if CheckBox <> '' then
 begin
  Ttop := 1;
  if CheckBox[1] = '|' then delete( CheckBox, 1, 1);
  if CheckBox[length(CheckBox)] <> '|' then CheckBox := CheckBox + '|';
  for ww := 1 to length( CheckBox) do if CheckBox[ww] = '|' then
  begin
   cb.Add( copy( CheckBox, Ttop, ww - Ttop));
   Ttop := ww + 1;
  end;
 end;
 WW := 20;
 playsnd( Sound);
 if not hasparent__ then
 begin
  if (Position <> poDeskTopCenter) or (Position <> poScreenCenter) then
  Position := poDesktopCenter;
 end else if Caption = '' then Caption := Screen.ActiveForm.Caption;
 if mb_CreateNotOwned then form := Tform.Create( nil) else
 form := Tform.Create( Screen.ActiveForm);
 try
  with form do
  begin
   Alphablend := mb_Alphablend;
   AlphaBlendValue := mb_AlphablendValue;
   TransparentColor := mb_TransparentColor;
   TransparentColorValue := mb_TransparentColorValue;
   Color := BoxColor;
   BorderStyle := bsSingle;
   BorderIcons := [biSystemMenu];
   WindowState := wsNormal;
   if mb_CreateNotOwned then FormStyle := fsStayOnTop else
   begin
    if StayOnTop then FormStyle := fsStayOnTop else FormStyle := fsNormal;
   end;
  end;
  form.Position := Position;
  form.Caption := Caption;
  TTop := GetSystemMenu(form.Handle, False);
  EnableMenuItem( TTop, SC_CLOSE, MF_BYCOMMAND or MF_DISABLED or MF_GRAYED);
  DeleteMenu( TTop, SC_MAXIMIZE, MF_BYCOMMAND);
  DeleteMenu( TTop, SC_MINIMIZE, MF_BYCOMMAND);
  DeleteMenu( TTop, SC_SIZE, MF_BYCOMMAND);
  DeleteMenu( TTop, SC_RESTORE, MF_BYCOMMAND);
  DeleteMenu( TTop, SC_CLOSE, MF_BYCOMMAND);
  DeleteMenu( TTop, 1, MF_BYPOSITION);
  DrawMenuBar(form.Handle);
  TTop := 20;
  if pic <> nil then
  with timage.Create( form) do
  begin
   parent := form;
   transparent := True;
   height := Pic.Height;
   width := Pic.Width;
   top := TTop;
   left := 20;
   picture := Pic;
   TTop := TTop + Height + 20;
   WW := width;
  end;
  if el.Count > 0 then
  for i := 0 to el.Count - 1 do
  begin
   with Tlabel.Create( form) do
   begin
    parent := form;
    if  mb_MsgFont <> nil then Font := mb_MsgFont;
    caption := el.Strings[i];
    Top := TTop;
    Left := 20;
    //Ttop := Ttop + height + trunc(height / 4);
    Ttop := Ttop + Height + 8;
    if WW < width then WW := Width;
   end;
   if not mb_ExcludeEditInEditBox then
   with Tedit.Create( form) do
   begin
    parent := form;
    left := 20;
    top := ttop;
    if EditWidth > 0 then Width := EditWidth;
    if dl.Count > i then Text := dl.Strings[i]
     else if dl.Count = 0 then Text := Default;
    Ttop := Ttop + trunc(height * 1.6);
    Color := EditColor;
    MaxLength := 255;
    if EditFont <> nil then Font := EditFont;
    if length(PassChar) = 1 then passwordchar := PassChar[1];
    if WW < width then WW := Width;
    hList.Add(inttostr(Handle));
   end;
  end;
  el.Clear;
  dl.Clear;
  if cb.Count > 0 then for i := 0 to cb.Count - 1 do
  begin
   with TCheckbox.Create(form) do
   begin
    parent := form;
    top := ttop;
    ttop := ttop + height + 8;
    left := 20;
    if  CheckBoxFont <> nil then Font := CheckBoxfont;
    if mb_CheckBoxWidth > 0 then Width := mb_CheckBoxWidth;
    if cb.Strings[i][1] = #1 then
    begin
     Checked := True;
     cb.Strings[i] := copy(cb.Strings[i], 2, Length(cb.Strings[i]) - 1);
    end;
    Caption := cb.Strings[i];
    if WW < width then WW := Width;
    el.Add(InttoStr(handle));
   end;
  end;
  Ttop := Ttop + 10;
  with TBitBtn.Create(form) do
  begin
   Parent := form;
   top := TTop;
   Kind := bkOk;
   Default := True;
   if mb_BtnFont <> nil then font := mb_BtnFont;
   if mb_BtnOk = '' then mb_BtnOk := _Btn_Ok;
   Caption := mb_BtnOk;
   if mb_BtnHeight <> 0 then Height := mb_BtnHeight;
   if mb_BtnWidth <> 0 then Width := mb_BtnWidth;
   Left := 20;
   i := Left * 2 + Width;
  end;
  with TBitBtn.Create(form) do
  begin
   Parent := form;
   top := TTop;
   Kind := bkCancel;
   Default := False;
   if mb_BtnFont <> nil then font := mb_BtnFont;
   if mb_BtnCancel = '' then mb_BtnCancel := _Btn_Cancel;
   Caption := mb_BtnCancel;
   if mb_BtnHeight <> 0 then Height := mb_BtnHeight;
   if mb_BtnWidth <> 0 then Width := mb_BtnWidth;
   Left := i;
   if Left + Width - 20 > ww then ww := Left + Width - 20;
   TTop := TTop + Height + 20;
  end;
  form.ClientHeight := TTop;
  form.ClientWidth := WW + 40;
  with Tbevel.Create (form) do
  begin
   Parent :=  form;
   Shape := bsFrame;
   Style := bsLowered;
   Top := 3;
   Left := 3;
   height := form.ClientHeight - 6;
   width := form.ClientWidth - 6;
  end;
  form.ShowModal;
  if form.ModalResult = mrOK then
  begin
   if hList.Count > 0 then for i := 0 to hList.Count - 1 do
   begin
    fillchar(p, sizeof(p), #0);
    getwindowtext(StrToInt(hList.Strings[i]), p, sizeof(p));
    if i > 0 then Result := result + #10;
    result := result + strpas(p);
   end;
   if el.Count > 0 then
   begin
    if Result <> '' then Result := result + #13;
    for i := 0 to el.Count - 1 do Result := Result + inttostr( SendMessage(
     StrToInt( el.Strings[i]), BM_GETCHECK, 0, 0));
   end;
  end else result := #0;
  form.release;
  form.free;
 except
  Result := #1;
 end;
 hList.Free;
 el.Free;
 dl.Free;
 cb.Free;
end;

function QBox( const Prompt, Caption, Default : String) : String;
Var pic : Tpicture;
    sot : Boolean;
begin
 mb_ExcludeEditInEditBox := False;
 if hasparent__ then
  sot := Screen.ActiveForm.FormStyle = fsStayOnTop else sot := False;
 Pic := Tpicture.Create;
 //Pic.Icon.Handle := LoadIcon( 0, IDI_WINLOGO);
 Pic.Icon.Handle := LoadIcon( 0, IDI_QUESTION);
 Result := EditBox( Prompt, Caption, Default, '', '', '', Pic,
  clBtnFace, clInfobk, poOwnerFormCenter, sot, nil, nil, 170);
 Pic.Free;
end;

function PasswordBox( Prompt1, Prompt2, Caption, Default : String)
 : String;
Var pic : Tpicture;
    sot : Boolean;
begin
 mb_ExcludeEditInEditBox := False;
 if hasparent__ then
  sot := Screen.ActiveForm.FormStyle = fsStayOnTop else sot := False;
 if Prompt1 = '' then Prompt1 := 'Anngi Passord :';
 Pic := Tpicture.Create;
 Pic.Icon.Handle := LoadIcon( 0, IDI_EXCLAMATION);
 Result := EditBox( Prompt1 + '|' + Prompt2, Caption, Default, '*', '',
 'MB_ICONEXCLAMATION', pic, clBtnFace, clInfobk, poOwnerFormCenter, sot, nil,
  nil, 0);
 Pic.Free;
end;

function StringToStringList( ResultString : String; TargetStringList
 : TStringList) : Boolean;
var i, t : Integer;
    c    : Boolean;
begin
 Result := False;
 if (TargetStringList = nil) or (ResultString = #1) then exit;
 t := 1;
 c := false;
 try
  if ResultString <> '' then
  begin
   if ResultString[length(ResultString)] <> #10 then ResultString := ResultString + #10;
   for i := 1 to length(ResultString) do
   if ResultString[i] in [#10, #13] then
   begin
     TargetstringList.Add( copy( ResultString, t, i - t));
      t := i + 1;
     if ResultString[i] = #13 then
     begin
      c := true;
      Break;
      end;
   end;
   if c then for i := i + 1 to length(ResultString) - 1 do
    TargetStringList.Add(ResultString[i]);
  end;
  Result := True;
 finally
 end;
end;

end.
