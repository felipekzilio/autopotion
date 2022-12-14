unit Unit1;

interface

uses
  winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,shellapi, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Imaging.pngimage;

type
  TMURAIZ = class(TForm)
    Timer1: TTimer;
    Panel1: TPanel;
    AUTOCTRL: TCheckBox;
    CheckBox2: TCheckBox;
    Image1: TImage;
    Minimizer: TLabel;
    close: TImage;
    minimize: TImage;
    SITE: TImage;
    Timer2: TTimer;
    Timer3: TTimer;
    Timer4: TTimer;
    procedure AUTOCTRLClick(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure closeClick(Sender: TObject);
    procedure minimizeClick(Sender: TObject);
    procedure SITEClick(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure Timer3Timer(Sender: TObject);
    procedure Timer4Timer(Sender: TObject);


  private
  procedure FormKeyDown(Sender: TObject; var Key: Word;  Shift: TShiftState);
//          procedure FormKeyDown(Sender: TObject; var Key: Word;Shift: TShiftState);
 // function IsKeyPress(const Key: integer): boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MURAIZ: TMURAIZ;

implementation

{$R *.dfm}

function IsKeyPress(const Key: integer): boolean;
begin
   Result := GetASyncKeyState(Key) <> 0;
end;

procedure TMURAIZ.FormKeyDown(Sender: TObject; var Key: Word;Shift: TShiftState);
begin
   if isKeyPress(17) then begin
      showMessage('telcla Ctrl pressionada');
   end;

end;

function tbKeyIsDown(const Key: integer): boolean;
begin
  Result := GetKeyState(Key) and 128 > 0;
end;

procedure TMURAIZ.AUTOCTRLClick(Sender: TObject);
begin
if AUTOCTRL.Checked = true then
keybd_event(VK_CONTROL, 0, KEYEVENTF_EXTENDEDKEY or 0, 0);

if AUTOCTRL.checked = false then
keybd_event(VK_CONTROL, $45, KEYEVENTF_EXTENDEDKEY or KEYEVENTF_KEYUP, 0);

end;

procedure TMURAIZ.CheckBox2Click(Sender: TObject);
begin
 if CheckBox2.Checked = true then
 Timer2.enabled:=true;


  if CheckBox2.Checked = false then
 Timer2.enabled:=false;
 {
if CheckBox2.Checked = true then
keybd_event(Ord('Q'), 0, 0, 0); //pressiona tecla [A]
keybd_event(Ord('W'), 0, 0, 0); //pressiona tecla [A]
keybd_event(Ord('E'), 0, 0, 0); //pressiona tecla [A]
Sleep(10);
keybd_event(Ord('Q'), 0, KEYEVENTF_KEYUP, 0); //libera tecla [A]
keybd_event(Ord('W'), 0, KEYEVENTF_KEYUP, 0); //libera tecla [A]
keybd_event(Ord('E'), 0, KEYEVENTF_KEYUP, 0); //libera tecla [A]                         }
end;


procedure TMURAIZ.closeClick(Sender: TObject);
begin
Application.terminate;
end;

procedure TMURAIZ.minimizeClick(Sender: TObject);
begin
Application.minimize;
end;

procedure TMURAIZ.SITEClick(Sender: TObject);
begin
shellexecute(handle,'open','https://muraiz97d.com',
nil,nil,sw_show);
end;

procedure TMURAIZ.Timer1Timer(Sender: TObject);
begin
  if CheckBox2.Checked = true then
  begin
  keybd_event(Ord('Q'), 0, 0, 0); //pressiona tecla [A]
  Sleep(2);
  keybd_event(Ord('Q'), 0, KEYEVENTF_KEYUP, 0); //libera tecla [A]
  end;

  if tbKeyIsDown(VK_F2) then
  begin
  { Tecla F2 pressionada }
   if CheckBox2.Checked = false then
   begin
    CheckBox2.Checked := true;
   end;
  end;


    if tbKeyIsDown(VK_F3) then
  begin
  { Tecla F3 pressionada }

   if CheckBox2.Checked = true then
   begin
    CheckBox2.Checked := false;
   end;
  end;

end;

procedure TMURAIZ.Timer2Timer(Sender: TObject);
begin

//if tbKeyIsDown(C?digo da tecla) then

 keybd_event(Ord('Q'), 0, WM_KEYDOWN, 0); //pressiona tecla [A]
 Sleep(1);
  keybd_event(Ord('W'), 0, WM_KEYDOWN, 0); //pressiona tecla [A]
 Sleep(1);
  keybd_event(Ord('E'), 0, WM_KEYDOWN, 0); //pressiona tecla [A]
  Timer3.ENABLED:=TRUE;

end;

procedure TMURAIZ.Timer3Timer(Sender: TObject);
begin

  keybd_event(Ord('Q'), 0, KEYEVENTF_KEYUP, 0); //libera tecla [A]
 Sleep(1);
  keybd_event(Ord('W'), 0, KEYEVENTF_KEYUP, 0); //libera tecla [A]
 Sleep(1);
  keybd_event(Ord('E'), 0, KEYEVENTF_KEYUP, 0); //libera tecla [A]

  Timer3.ENABLED:=FALSE;
end;

procedure TMURAIZ.Timer4Timer(Sender: TObject);
begin
 Timer2.enabled:=true;

 Sleep(5);
  Timer2.enabled:=false;
end;

end.
