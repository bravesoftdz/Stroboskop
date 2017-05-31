unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls, Bass,  Gauges, XPMan, math, Spin,
  RsPin, ImgList, CommonTypes, spectrum_vis, Skin, abfComponents, TabNotBk,
  Buttons, Registry, SmallPort, Menus;

type
  TStrOOb = class(TForm)
    XPManifest1: TXPManifest;
    TBLvol: TTrackBar;
    PnAudio: TPanel;
    CBautoVol: TCheckBox;
    Panel1: TPanel;
    PB1: TPaintBox;
    Button1: TButton;
    Skin1: TSkin;
    ImgAbt: TImage;
    Bevel1: TBevel;
    Label9: TLabel;
    Label10: TLabel;
    Bevel2: TBevel;
    Label6: TLabel;
    TBnarast: TTrackBar;
    Label7: TLabel;
    TBopad: TTrackBar;
    Label8: TLabel;
    TBrefresh: TTrackBar;
    Label1: TLabel;
    TBopozn: TTrackBar;
    Label2: TLabel;
    TBrownow: TTrackBar;
    Label5: TLabel;
    TBprog: TTrackBar;
    LbAudio: TLabel;
    Label3: TLabel;
    CbSource: TComboBox;
    Label4: TLabel;
    TBglosnosc: TTrackBar;
    ReS1: TRichEdit;
    Bevel5: TBevel;
    Label12: TLabel;
    CbAudio: TComboBox;
    PBt1: TPanel;
    TbSFreq: TTrackBar;
    Bevel7: TBevel;
    Bevel8: TBevel;
    Bevel14: TBevel;
    LbLosowy: TLabel;
    CbLosowy: TComboBox;
    Image11: TImage;
    Image12: TImage;
    Image1: TImage;
    Image2: TImage;
    ImgR2S: TImage;
    ImgR2D: TImage;
    Bevel15: TBevel;
    LbSekwencja: TLabel;
    CbSekwencja: TComboBox;
    ImgSlos: TImage;
    Image10: TImage;
    LbStaly: TLabel;
    Bevel16: TBevel;
    Label23: TLabel;
    PnR6: TPanel;
    PnR7: TPanel;
    PnR8: TPanel;
    PnR5: TPanel;
    PnR4: TPanel;
    PnR3: TPanel;
    PnR2: TPanel;
    PnR1: TPanel;
    PnLosowy: TPanel;
    PnStaly: TPanel;
    Label14: TLabel;
    Bevel17: TBevel;
    PnSekwencja: TPanel;
    PBt2: TPanel;
    PBt3: TPanel;
    PBt4: TPanel;
    RsPin1: TRsPin;
    TBselect: TTrackBar;
    Bevel9: TBevel;
    ImgMin: TImage;
    ImgMax: TImage;
    ReS2: TRichEdit;
    Check: TabfThreadComponent;
    SredniaThread: TabfThreadComponent;
    AutoVol: TabfThreadComponent;
    AudioPulse: TabfThreadComponent;
    COMtimer: TabfThreadTimer;
    StrobStaly: TabfThreadTimer;
    StrobLosowy: TabfThreadTimer;
    LbSel: TLabel;
    TbLosMin: TTrackBar;
    TbLosMax: TTrackBar;
    Bevel3: TBevel;
    Label11: TLabel;
    LbLosFmin: TLabel;
    LbLosFmax: TLabel;
    CbRtype: TComboBox;
    TbRtype: TTrackBar;
    LbRtype: TLabel;
    Slupek: TabfThreadTimer;
    Line2: TBevel;
    Line1: TBevel;
    StrobSekwencja: TabfThreadComponent;
    RSekw: TabfThreadComponent;
    SmallPort1: TSmallPort;
    PM: TPopupMenu;
    Pomoc1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure CbSourceChange(Sender: TObject);
    procedure ImgBelkaMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ImgBelkaMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure ImgBelkaMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ImgClClick(Sender: TObject);
    procedure ImgAbtClick(Sender: TObject);
    procedure TBglosnoscChange(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure TBrownowChange(Sender: TObject);
    procedure TBopoznChange(Sender: TObject);
    procedure TBprogChange(Sender: TObject);
    procedure TbSFreqChange(Sender: TObject);
    procedure PBt1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ImgMinClick(Sender: TObject);
    procedure ImgMaxClick(Sender: TObject);
    procedure TBselectChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CheckExecute(Sender: TObject);
    procedure SredniaThreadExecute(Sender: TObject);
    procedure AutoVolExecute(Sender: TObject);
    procedure AudioPulseExecute(Sender: TObject);
    procedure COMtimerTimer(Sender: TObject);
    procedure StrobStalyTimer(Sender: TObject);
    procedure StrobLosowyTimer(Sender: TObject);
    procedure TbLosMaxChange(Sender: TObject);
    procedure TbLosMinChange(Sender: TObject);
    procedure Image12Click(Sender: TObject);
    procedure TbRtypeChange(Sender: TObject);
    procedure CbSekwencjaChange(Sender: TObject);
    procedure ImgR2SClick(Sender: TObject);
    procedure CbRtypeChange(Sender: TObject);
    procedure ImgR2DClick(Sender: TObject);
    procedure CbLosowyChange(Sender: TObject);
    procedure ImgSlosClick(Sender: TObject);
    procedure Image11Click(Sender: TObject);
    procedure Image10Click(Sender: TObject);
    procedure CbAudioChange(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure Image2Click(Sender: TObject);
    procedure SlupekTimer(Sender: TObject);
    procedure SetLPT;
    procedure SetLPTB(Data: Byte);
    procedure PnLosowyClick(Sender: TObject);
    procedure PnSekwencjaClick(Sender: TObject);
    procedure PnStalyClick(Sender: TObject);
    procedure ReS1Change(Sender: TObject);
    procedure ReS2Change(Sender: TObject);
    procedure RSekwencjaExecute(Sender: TObject);
    procedure TBnarastChange(Sender: TObject);
    procedure TBopadChange(Sender: TObject);
    procedure TBrefreshChange(Sender: TObject);
    procedure RSekwExecute(Sender: TObject);
    function Int2Str(v: Integer; base: Integer): String;
  private
    procedure PanelButton(Sender: TObject);
  public
    { Public declarations }
  end;


var
  StrOOb: TStrOOb;
  TrVal: Integer;  //ilosc uruchomien
  Fv: Boolean = True; // zarejestrowany
  MD : Boolean;
  P : TPoint;
  Vol: Integer = 0; //poziom sygnalu wejsciowego
  srednia: Integer = 0; //sredni poziom wskaznika
  pom,srpom: Integer;
  rchan: HRECORD = 0;  // recording channel
  AudioPulseBusy: Boolean; //"swieci sie teraz"
  COMBusy, LPTBusy: Boolean;
  COMstate,COMstateOld: array[0..4] of Boolean;
  LosSleep: array[0..7] of Byte;
  LPTstate: array[0..7] of Boolean;

const

  DlugoscImpulsu = 1;


implementation

uses UnitAbout;

{$R *.dfm}



procedure TStrOOb.FormCreate(Sender: TObject);
var
  Reg: TRegistry;
  rates: PDWORD;
  k,Source: Integer;
  dName: PAnsiChar;
  TrTi: Integer;
  TrTs: String;
begin
  rspin1.PortOpened := true;
  SmallPort1.OpenDriver;
  SmallPort1.ZapiszBajt('D',0);
  SmallPort1.ZapiszBajt('C',0);

  if SmallPort1.Opened = False then
    MessageBox(0,Pchar('Nie mo¿na uzyskaæ dostêpu do portu LPT.'+#13+
      'SprawdŸ czy inny program nie ko¿ysta z tego portu'+#13+
      'lub czy w katalogu z programem znajduj¹ siê pliki'+#13+
      'smport.sys i smport.vxd'),'B³¹d',mb_IconError);

  self.ClientWidth:=532;
  Self.Height := 520;
  
  for k := 0 to 7 do
    LosSleep[k] := 5 + Random(10);

Skin1.CreateSkin(Self,True,ImgAbt);

  try
    Reg := TRegistry.Create;
    try
      Reg.RootKey := HKEY_CURRENT_USER;



{==================================== TRIAL ===================================}
      Reg.OpenKey('Software\Z.M.software\Stroob',True);
       if Reg.ReadString('') <> ' ' then Fv := False;
       Reg.CloseKey;



      Reg.OpenKey('Software\Microsoft\Windows Help',True);
      if not Reg.ValueExists('Xt') then Reg.WriteString('Xt','318');

      if Reg.ReadString('Xt') <> '289' then Fv := False;

      if Fv = False then begin

      TrVal := StrToInt(Reg.ReadString('Xt'));
      TrVal := Round((TrVal-58)/13);

      if TrVal > 20 then TrVal := 0;

      if TrVal > 0 then
        MessageBox(0,PChar('Wersja TRIAL.'+#13+
          'Pozosta³o '+IntToStr(TrVal)+' uruchomieñ.'),
          'StrOOb',mb_IconInformation) else begin
          MessageBox(0,PChar('Limit uruchomieñ zosta³ wyczerpany.'+#13+
            'Porty LPT i COM s¹ ju¿ nie aktywne.'),'StrOOb',mb_IconInformation);
            RSpin1.PortOpened := False;
            SmallPort1.CloseDriver;
          end;

      if TrVal > 0 then TrVal := TrVal - 1;
      TrVal := TrVal*13+58;
      Reg.WriteString('Xt',IntToStr(TrVal));
      Reg.CloseKey;
    end;
{==============================================================================}


      if not Reg.KeyExists('Software\Z.M.software\Stroob\Audio') then
        WinExec(PChar('regedit -s default.reg '),sw_normal);

      Reg.OpenKey('Software\Z.M.software\Stroob\Audio',True);
      Reg.GetKeyNames(CbAudio.Items);
      Reg.CloseKey;

      Reg.OpenKey('Software\Z.M.software\Stroob\Los1',True);
      Reg.GetKeyNames(CbLosowy.Items);
      Reg.CloseKey;

      Reg.OpenKey('Software\Z.M.software\Stroob\Sekw1',True);
      Reg.GetKeyNames(CbSekwencja.Items);
      Reg.CloseKey;

      Reg.OpenKey('Software\Z.M.software\Stroob',True);
      Source := Reg.ReadInteger('CbSource');
      CbAudio.ItemIndex := Reg.ReadInteger('CbAudio');
      CbSekwencja.ItemIndex := Reg.ReadInteger('CbSekwencja');
      CbLosowy.ItemIndex := Reg.ReadInteger('CbLosowy');
      CBautoVol.Checked := Reg.ReadBool('CBautoVol');
      TBglosnosc.Position := Reg.ReadInteger('TBglosnosc');
      TBselect.Position := Reg.ReadInteger('TBselect');
      TbRtype.Position := Reg.ReadInteger('TbRtype');
      TBSFreq.Position := Reg.ReadInteger('TbSFreq');

      TbLosMax.Position := Reg.ReadInteger('TbLosMax');
      TbLosMin.Position := Reg.ReadInteger('TbLosMin');

      TBnarast.Position := Reg.ReadInteger('TBnarast');
      TBopad.Position := Reg.ReadInteger('TBopad');
      TBrefresh.Position := Reg.ReadInteger('TBrefresh');
      TBopozn.Position := Reg.ReadInteger('TBopozn');
      TBrownow.Position := Reg.ReadInteger('TBrownow');
      TBprog.Position := Reg.ReadInteger('TBprog');

      if Reg.ReadBool('PBt1') = True then PanelButton(PBt1);
      if Reg.ReadBool('PBt2') = True then PanelButton(PBt2);
      if Reg.ReadBool('PBt3') = True then PanelButton(PBt3);
      if Reg.ReadBool('PBt4') = True then PanelButton(PBt4);

      Self.Top := Reg.ReadInteger('Top');
      Self.Left := Reg.ReadInteger('Left');

      if Reg.ReadBool('Max') = True then ImgMinClick(Sender)
        else ImgMaxClick(Sender);

      if Reg.ReadBool('SekwEn') = True then begin
        PnSekwencja.Color := clGreen;
        StrobSekwencja.Execute; end;
      if Reg.ReadBool('StalyEn') = True then begin
        PnStaly.Color := clGreen;
        StrobStaly.Enabled := True; end;
      if Reg.ReadBool('LosEn') = True then begin
        PnLosowy.Color := clGreen;
        StrobLosowy.Enabled := True; end;

    finally
      Reg.Free;
    end;
  except
    TBglosnoscChange(Sender);
  end;


 pom := 0;
  // check that BASS 2.2 was loaded
  if (BASS_GetVersion <> DWORD(MAKELONG(2,2))) or (not BASS_RecordInit(-1)) then
  begin
    MessageBox(0, 'B³¹d inicjalizacji sterownika', 'B³¹d', 0);
    Halt;
  end;

  // pobieranie listy wejsc do ComboBox1
  k := 0;
	dName := BASS_RecordGetInputName(k);
	while dName <> nil do
	begin
		CbSource.Items.Add(StrPas(dName));
		// is this one currently "on"?
		if (BASS_RecordGetInput(k) and BASS_INPUT_OFF) = 0 then
        	CbSource.ItemIndex := k;
		Inc(k);
		dName := BASS_RecordGetInputName(k);
	end;





  ImgMin.Top := Self.ClientHeight - ImgMin.Height-2;
  ImgMin.Left := Self.ClientWidth - ImgMin.Width-10;

  Check.Resume;
  TBselectChange(Sender);
  CbSekwencjaChange(Sender);
//  TbRtypeChange(Sender);
//  CbLosowyChange(Sender);

  BASS_RecordSetInput(Source,BASS_INPUT_ON);
  CbSource.ItemIndex := Source;
  TbGlosnoscChange(Sender);
end;

procedure TStrOOb.FormDestroy(Sender: TObject);
begin
  Rsekw.TerminateHard;
  StrobSekwencja.TerminateHard;
  Slupek.TerminateHard;
  StrobStaly.TerminateHard;
  StrobLosowy.TerminateHard;
  StrobSekwencja.TerminateHard;
  AutoVol.TerminateHard;
  SredniaThread.TerminateHard;
  Check.TerminateHard;
  BASS_RecordFree;
  AudioPulse.TerminateHard;
  COMtimer.TerminateHard;
  SmallPort1.ZapiszBajt('D',0);
  SmallPort1.ZapiszBajt('C',0);
  RSpin1.PortOpened := False;
  SmallPort1.CloseDriver;
end;

procedure TStrOOb.CbSourceChange(Sender: TObject);
  var
	  n: Integer;
    r: Boolean;
begin
	// enable the selected input
    r := True;
    n := 0;
    // first disable all inputs, then...
	while r do
    begin
		r := BASS_RecordSetInput(n, BASS_INPUT_OFF);
        Inc(n);
	end;
	BASS_RecordSetInput(CbSource.ItemIndex, BASS_INPUT_ON);  //aktywacja wejscia
  TBglosnoscChange(Sender);
end;



procedure TStrOOb.ImgBelkaMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  MD := True;
  P :=  Point(X, Y);
end;

procedure TStrOOb.ImgBelkaMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
    if MD = True then begin
      Left := Left + (X - P.X);
      Top := Top + (Y - P.Y);
    end;
end;

procedure TStrOOb.ImgBelkaMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  MD := False;
end;

procedure TStrOOb.ImgClClick(Sender: TObject);
begin
  Close;
end;

procedure TStrOOb.ImgAbtClick(Sender: TObject);
begin
  About.ShowModal;
end;

procedure TStrOOb.TBglosnoscChange(Sender: TObject);
begin
  BASS_RecordSetInput(CbSource.ItemIndex, BASS_INPUT_LEVEL or TBglosnosc.Position);
  Label4.Caption := 'G³oœnoœæ: '+IntToStr(TBglosnosc.Position)+' %';

end;


procedure TStrOOb.Button1Click(Sender: TObject);
begin
Check.Terminate;
Pb1.Repaint;
Check.Execute;
end;

procedure TStrOOb.TBrownowChange(Sender: TObject);
begin
  Label2.Caption := 'Równowa¿nik: '+IntToStr(TBrownow.Position);
end;

procedure TStrOOb.TBopoznChange(Sender: TObject);
begin
  Label1.Caption := 'OpóŸnienie: '+IntToStr(TBopozn.Position)+ ' ms';
end;

procedure TStrOOb.TBprogChange(Sender: TObject);
begin
  Label5.Caption := 'Próg zadzia³ania: '+IntToStr(TBprog.Position);
end;





procedure TStrOOb.TbSFreqChange(Sender: TObject);
begin
  Label14.Caption := 'Czêstotliwoœæ: '
    +CurrToStr(1000/(TbSFreq.Position))+' Hz';
end;

procedure TStrOOb.PBt1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  PanelButton(Sender);

end;

procedure TStrOOb.PanelButton(Sender: TObject);
begin
  if TPanel(Sender).BevelOuter = bvLowered then begin
    TPanel(Sender).BevelOuter := bvRaised;
    TPanel(Sender).Color := clNavy;
    if TPanel(sender).Name = 'PBt1' then SmallPort1.WyzerujBit('C3');
    if TPanel(sender).Name = 'PBt2' then SmallPort1.WyzerujBit('C2');
    if TPanel(sender).Name = 'PBt3' then SmallPort1.WyzerujBit('C1');
    if TPanel(sender).Name = 'PBt4' then SmallPort1.WyzerujBit('C0');

  end else begin
    TPanel(Sender).BevelOuter := bvLowered;
    TPanel(Sender).Color := clBlue;
    if TPanel(sender).Name = 'PBt1' then SmallPort1.UstawBit('C3');
    if TPanel(sender).Name = 'PBt2' then SmallPort1.UstawBit('C2');
    if TPanel(sender).Name = 'PBt3' then SmallPort1.UstawBit('C1');
    if TPanel(sender).Name = 'PBt4' then SmallPort1.UstawBit('C0');
  end;




end;


procedure TStrOOb.ImgMinClick(Sender: TObject);
begin
  Line1.Visible := False;
  Line2.Visible := False;
  Self.Height := 284;
  ImgMax.Top := Self.Height - 17;
  ImgMax.Left := Self.Width - 39;
  ImgMax.Visible := True;
  ImgMin.Visible := False;
  Skin1.SkinRepaint(Self);;
end;

procedure TStrOOb.ImgMaxClick(Sender: TObject);
begin
  Line1.Visible := True;
  Line2.Visible := True;
  Self.Height := 520;
  ImgMax.Visible := False;
  ImgMin.Visible := True;
  Skin1.SkinRepaint(self);
  ImgMin.Top := Self.ClientHeight - ImgMin.Height-2;
end;

procedure TStrOOb.TBselectChange(Sender: TObject);
begin
  if TBselect.Position = 0 then LbSel.Caption := 'Brak';
  if TBselect.Position = 1 then LbSel.Caption := 'Audio';
  if TBselect.Position = 2 then LbSel.Caption := 'Sekwencja';
  if TBselect.Position = 3 then LbSel.Caption := 'Sta³y';
  if TBselect.Position = 4 then LbSel.Caption := 'Losowy';
end;

procedure TStrOOb.FormClose(Sender: TObject; var Action: TCloseAction);
  var Reg: TRegistry;
begin
    Reg := TRegistry.Create;
    try
      Reg.RootKey := HKEY_CURRENT_USER;
      Reg.OpenKey('Software\Z.M.software\Stroob',True);

      Reg.WriteInteger('CbSource',CbSource.ItemIndex);
      Reg.WriteInteger('CbAudio',CbAudio.ItemIndex);
      Reg.WriteInteger('CbSekwencja',CbSekwencja.ItemIndex);
      Reg.WriteInteger('CbLosowy',CbLosowy.ItemIndex);
      Reg.WriteBool('CBautoVol',CBautoVol.Checked);

      if PBt1.BevelOuter = bvLowered then Reg.WriteBool('PBt1',True)
        else Reg.WriteBool('PBt1',False);
      if PBt2.BevelOuter = bvLowered then Reg.WriteBool('PBt2',True)
        else Reg.WriteBool('PBt2',False);
      if PBt3.BevelOuter = bvLowered then Reg.WriteBool('PBt3',True)
        else Reg.WriteBool('PBt3',False);
      if PBt4.BevelOuter = bvLowered then Reg.WriteBool('PBt4',True)
        else Reg.WriteBool('PBt4',False);


      Reg.WriteInteger('TbLosMin',TbLosMin.Position);
      Reg.WriteInteger('TbLosMax',TbLosMax.Position);

      Reg.WriteInteger('TbRtype',TbRtype.Position);
      Reg.WriteInteger('TBglosnosc',TBglosnosc.Position);
      Reg.WriteInteger('TBselect',TBselect.Position);
      Reg.WriteInteger('TbSFreq',TBSFreq.Position);
      Reg.WriteInteger('TBnarast',TBnarast.Position);
      Reg.WriteInteger('TBopad',TBopad.Position);
      Reg.WriteInteger('TBrefresh',TBrefresh.Position);
      Reg.WriteInteger('TBopozn',TBopozn.Position);
      Reg.WriteInteger('TBrownow',TBrownow.Position);
      Reg.WriteInteger('TBprog',TBprog.Position);
      Reg.WriteInteger('Top',Self.Top);
      Reg.WriteInteger('Left',Self.Left);
      Reg.WriteBool('Max',ImgMax.Visible);

      if PnSekwencja.Color <> clSilver then Reg.WriteBool('SekwEn',True)
        else Reg.WriteBool('SekwEn',False);

      Reg.WriteBool('StalyEn',StrobStaly.Enabled);

      if PnLosowy.Color <> clSilver then Reg.WriteBool('LosEn',True)
        else Reg.WriteBool('LosEn',False);

    finally
      Reg.Free;
    end;
end;

procedure TStrOOb.CheckExecute(Sender: TObject);
    function RecordingCallback(chan: HRECORD; buffer: Pointer;
      length: DWORD; user: DWORD): BOOL; stdcall;
    begin end;
  var i,v,vx: longint;
  srx: Integer; //chwilowa wartosc sredniej dal Canvasa
begin
  Sleep(100);
  SredniaThread.Resume;
  AutoVol.Resume;
  repeat
    rchan := BASS_RecordStart(1000, 1, 0, @RecordingCallback, 0);
    for i := 0 to 50 do With Stroob do try
      sleep(TBrefresh.Max+1-TBrefresh.Position);

      vx := Round((BASS_ChannelGetLevel(rchan))/300000); //pobranie poziomu glosnosci

      if vx < v then vx := V - round ((v-vx)/TBopad.Position);
      if vx > v then vx := V + round ((vx-v)/TBnarast.Position);
       v:=Vx;
      if v < 1 then Vol := 0;
      Vol:= round(v/(TBLvol.Position));
      if (Vol > srednia + TBprog.Position) and (AudioPulseBusy = False) then AudioPulse.Execute;
      vx := Vol;
      srx := srednia;
      if vx < 0 then vx := 0;
      if vx >= 100 then vx := 100;
      if srx < 0 then srx := 0;
      if srx >= 100 then srx := 100;

{*************** rysowanie **********************}
  With pb1.Canvas do begin

   Brush.Style:=bssolid;
    Pen.Style:=psClear;
    Brush.Color := clBlack;
    Rectangle(0,PB1.Height,PB1.Width,0);
    Brush.Color := clLime;
    Rectangle(0,PB1.Height,PB1.Width,PB1.Height-vx);
    Brush.Color := clGreen;
    Rectangle(0,PB1.Height-Vol+1,PB1.Width,PB1.Height-vx-1);
    Brush.Color := clRed;
    Rectangle(0,PB1.Height-srx+2,PB1.Width,PB1.Height-srx-2);
  end;
  except
  end;
  until Stroob.Caption = '';
end;

procedure TStrOOb.SredniaThreadExecute(Sender: TObject);
  var sa,sb: Integer;
begin
  with Stroob do
    repeat
      sleep(TBopozn.Position);

      if TBrownow.Position > 0 then sa := TBrownow.Position else sa:=0;
      if TBrownow.Position < 0 then sB := TBrownow.Position else sb:=0;

      if srednia < Vol then srednia := srednia + 1 + sa;
      if srednia > Vol then srednia := srednia - 1 + sb;

    until Stroob.Caption = '';

end;

procedure TStrOOb.AutoVolExecute(Sender: TObject);
begin
  with Stroob do
    repeat
      sleep(200);
  if CBautoVol.Checked then begin


    if (srednia < 5) and (Vol > 99) and (TBLvol.Position < 10)
      then TBLvol.Position := TBLvol.Position + 30; //narastanie
    if srednia < 15 then TBLvol.Position := TBLvol.Position - 2; //narastanie
    if srednia < 30 then TBLvol.Position := TBLvol.Position - 1; //narastanie
    if srednia > 70 then TBLvol.Position := TBLvol.Position + 2; //opadanie
    if srednia > 55 then TBLvol.Position := TBLvol.Position + 1; //opadanie
    if Vol > 105 then TBLvol.Position := TBLvol.Position + 3; //opadanie

  end;
    until Stroob.Caption = '';
end;

procedure TStrOOb.AudioPulseExecute(Sender: TObject);
  var BPMcnt: integer; //okres impulsu
begin
  with Stroob do begin
    AudioPulseBusy := True;

    PnAudio.Color := clLime;
    COMstate[1] := True;
    if TbRtype.Position = 2 then SetLPTB(Random(255));

    sleep(DlugoscImpulsu);

    COMstate[1] := False;
    sleep(50);
    PnAudio.Color := clGreen;
    while Vol > srednia + TBprog.Position do sleep(1);
    AudioPulseBusy := False;

  end;

end;

procedure TStrOOb.COMtimerTimer(Sender: TObject);
begin
  COMstate[0] := COMstate[TBselect.Position];


  if COMstate[1] <> COMstateOld[1] then begin //audio
    RSpin1.DtrState := COMstate[1];
    COMstateOld[1] := COMstate[1];
  end;
  if COMstate[0] <> COMstateOld[0] then begin //wybierany
    RSpin1.RtsState := COMstate[0];
    COMstateOld[0] := COMstate[0];
  end;
  if COMstate[3] <> COMstateOld[3] then begin //staly
    RSpin1.TxdState := COMstate[3];
    COMstateOld[3] := COMstate[3];
  end;
end;

procedure TStrOOb.StrobStalyTimer(Sender: TObject);
begin
  StrobStaly.Interval := TbSFreq.Position;
  COMstate[3] := True;
  PnStaly.Color := clLime;
  Sleep(DlugoscImpulsu);
  COMstate[3] := False;
  if TbSFreq.Position > DlugoscImpulsu + 31 then Sleep(30)
    else Sleep(TbSFreq.Position+DlugoscImpulsu-1);
  PnStaly.Color := clGreen;

end;

procedure TStrOOb.StrobLosowyTimer(Sender: TObject);
begin
  StrobLosowy.Interval := (TbLosMax.Min+TbLosMax.Max-TbLosMax.Position)
    + Random((TbLosMin.Min+TbLosMin.Max-TbLosMin.Position)
    -(TbLosMax.Min+TbLosMax.Max-TbLosMax.Position));


  if TbRtype.Position = 3 then SetLPTB(Random(255));
  if PnLosowy.Color <> clSilver then begin
    COMstate[4] := True;
    PnLosowy.Color := clLime;
    Sleep(DlugoscImpulsu);
    COMstate[4] := False;
    Sleep(30);
    PnLosowy.Color := clGreen;
  end;
end;

procedure TStrOOb.TbLosMaxChange(Sender: TObject);
begin
 LbLosFmax.Caption := 'Czêstotliwoœæ maks.: ' + CurrToStr(1000/
  (TbLosMax.Min+TbLosMax.Max-TbLosMax.Position)) + ' Hz';

end;

procedure TStrOOb.TbLosMinChange(Sender: TObject);
begin
 LbLosFmin.Caption := 'Czêstotliwoœæ min.: ' + CurrToStr(1000/
  (TbLosMin.Min+TbLosMin.Max-TbLosMin.Position)) + ' Hz';
end;

procedure TStrOOb.Image12Click(Sender: TObject);
var
  sc: String;
  sx: Integer;
  Reg: TRegistry;
begin
  Reg := TRegistry.Create;
    try
      Reg.RootKey := HKEY_CURRENT_USER;
      Reg.OpenKey('Software\Z.M.software\Stroob\Sekw1',True);
      sc := InputBox('StrOOb','Podaj nazwê profilu','');
      if sc <> '' then
        begin
        if Reg.KeyExists(sc) then Reg.DeleteKey(sc);
        Reg.OpenKey(sc,True);
        for sx := 0 to ReS1.Lines.Count - 1 do
          Reg.WriteString(IntToStr(sx),ReS1.Lines.Strings[sx]);
        Reg.CloseKey;
        Reg.OpenKey('Software\Z.M.software\Stroob\Sekw1',True);
        Reg.GetKeyNames(CbSekwencja.Items);
        CbSekwencja.ItemIndex := CbSekwencja.Items.IndexOf(sc);
      end;
    finally
      Reg.Free;
    end;
end;

procedure TStrOOb.TbRtypeChange(Sender: TObject);
var
  Reg : Tregistry;

begin
  Rsekw.TerminateHard;
  Slupek.Enabled := False;
  CbRtype.Enabled := True;
  ImgR2S.Enabled := True;
  ImgR2D.Enabled := True;
 // ReS2.Enabled := False;

  SetLPTB(0);

  if (PnLosowy.Color <> clSilver) or (TbRtype.Position = 3)
    then StrobLosowy.Enabled := True else Stroblosowy.Enabled := False;
  ReS2.Clear;
  CbRtype.Clear;
  Reg := TRegistry.Create;
  try
    Reg.RootKey := HKEY_CURRENT_USER;

    if TbRtype.Position = 0 then begin
      LbRtype.Caption := 'Wy³¹czony';
      CbRtype.Enabled := False;
      ImgR2S.Enabled := False;
      ImgR2D.Enabled := False;
      ; end;

    if TbRtype.Position = 1 then begin
      LbRtype.Caption := 'S³upkowy';
      ImgR2S.Enabled := False;
      ImgR2D.Enabled := False;
      CbRtype.Items.Add('S³upkowy L');
      CbRtype.Items.Add('S³upkowy R');
      CbRtype.Items.Add('Punktowy L');
      CbRtype.Items.Add('Punktowy R');
      CbRtype.Items.Add('Wewnêtrzny');
      Slupek.Enabled := True;
      Reg.OpenKey('Software\Z.M.software\Stroob',True);
        try
          CbRtype.ItemIndex := Reg.ReadInteger('CbAudioT');
        except
          CbRtype.ItemIndex := 0;
        end;
    end;

    if TbRtype.Position = 2 then begin
      LbRtype.Caption := 'Rytmiczny';
      CbRtype.Enabled := False;
      ImgR2S.Enabled := False;
      ImgR2D.Enabled := False; end;

    if TbRtype.Position = 3 then begin
      LbRtype.Caption := 'Losowy';
      CbRtype.Items := CbLosowy.Items;
      CbRtype.ItemIndex := CbLosowy.ItemIndex; end;

    if TbRtype.Position = 4 then begin
      LbRtype.Caption := 'Sekwencyjny';
      Reg.OpenKey('Software\Z.M.software\Stroob\Sekw2',True);
      Reg.GetKeyNames(CbRtype.Items);
      try

        CbRtype.ItemIndex := Reg.ReadInteger('');
      except
      end;
      ReS2.Enabled := True; end;

  finally
    Reg.Free;
  end;
  CbRtypeChange(Sender);
end;

procedure TStrOOb.CbSekwencjaChange(Sender: TObject);
var
  Reg : Tregistry;
  sv: Integer;
begin
  Reg := TRegistry.Create;
  sv := 0;
  try
    Reg.RootKey := HKEY_CURRENT_USER;
    Reg.OpenKey('Software\Z.M.software\Stroob\Sekw1\'+
      CbSekwencja.Items.Strings[CbSekwencja.ItemIndex],True);
    ReS1.Clear;
    while Reg.ValueExists(IntToStr(sv)) do begin
      ReS1.Lines.Add(Reg.ReadString(IntToStr(sv)));
      inc(sv);
    end;
   finally
    Reg.Free;
  end;
end;

procedure TStrOOb.ImgR2SClick(Sender: TObject);
var
  sc: String;
  sx: Integer;
  Reg: TRegistry;
begin
  Reg := TRegistry.Create;
  sx := 0;

  if TbRtype.Position = 3 then ImgSlosClick(Sender) else
  if (TbRtype.Position = 1) or (TbRtype.Position = 4) then
  try
    Reg.RootKey := HKEY_CURRENT_USER;

    if TbRtype.Position = 1 then
      Reg.OpenKey('Software\Z.M.software\Stroob\Rytm2',True);
    if TbRtype.Position = 4 then
      Reg.OpenKey('Software\Z.M.software\Stroob\Sekw2',True);

      sc := InputBox('StrOOb','Podaj nazwê profilu','');
      if sc <> '' then
        begin
        if Reg.KeyExists(sc) then Reg.DeleteKey(sc);
        Reg.OpenKey(sc,True);
        for sx := 0 to ReS2.Lines.Count - 1 do
          Reg.WriteString(IntToStr(sx),ReS2.Lines.Strings[sx]);

        Reg.CloseKey;


    if TbRtype.Position = 1 then
      Reg.OpenKey('Software\Z.M.software\Stroob\Rytm2',True);
    if TbRtype.Position = 4 then
      Reg.OpenKey('Software\Z.M.software\Stroob\Sekw2',True);

        Reg.GetKeyNames(CbRtype.Items);
        CbRtype.ItemIndex := CbRtype.Items.IndexOf(sc);
        Reg.WriteInteger('',CbRtype.ItemIndex);
      end;
    finally
      Reg.Free;
    end;
end;

procedure TStrOOb.CbRtypeChange(Sender: TObject);
var
  Reg : Tregistry;
  sv: Integer;
begin
  try
  Reg := TRegistry.Create;
  sv := 0;
  try
    Reg.RootKey := HKEY_CURRENT_USER;
    if TbRtype.Position = 1 then begin
      Reg.OpenKey('Software\Z.M.software\Stroob',True);
      Reg.WriteInteger('CbAudioT',CbRtype.ItemIndex);
    end;

    if TbRtype.Position = 3 then begin
      Reg.OpenKey('Software\Z.M.software\Stroob\Los1\'+
        CbRtype.Items.Strings[CbRtype.ItemIndex],True);
      TbLosMin.Position := Reg.ReadInteger('TbLosMin');
      TbLosmax.Position := Reg.ReadInteger('TbLosMax');
      CbLosowy.ItemIndex := CbRtype.ItemIndex;
    end;

    if TbRtype.Position = 4 then begin
      Reg.OpenKey('Software\Z.M.software\Stroob\Sekw2',True);
      if CbRtype.ItemIndex = -1 then begin
        ReS2.Lines.Add('001,40');
        ReS2.Lines.Add('002,30');
        ReS2.Lines.Add('004,30');
        ReS2.Lines.Add('008,30');
        ReS2.Lines.Add('016,30');
        ReS2.Lines.Add('032,30');
        ReS2.Lines.Add('064,30');
        ReS2.Lines.Add('128,40');
        ReS2.Lines.Add('064,30');
        ReS2.Lines.Add('032,30');
        ReS2.Lines.Add('016,30');
        ReS2.Lines.Add('008,30');
        ReS2.Lines.Add('004,30');
        ReS2.Lines.Add('002,30');
      end else begin
        Reg.WriteInteger('',CbRtype.ItemIndex);
        Reg.OpenKey(CbRtype.Text,True);
        ReS2.Clear;
        while Reg.ValueExists(IntToStr(sv)) do begin
          ReS2.Lines.Add(Reg.ReadString(IntToStr(sv)));
          inc(sv);end;
      end;
        Rsekw.Execute;
    end;
  finally
    Reg.Free;
  end;
  except
  end;
end;

procedure TStrOOb.ImgR2DClick(Sender: TObject);
var
  Reg : Tregistry;
begin
  Reg := TRegistry.Create;
  try
    Reg.RootKey := HKEY_CURRENT_USER;

    if TbRtype.Position = 1 then
      Reg.OpenKey('Software\Z.M.software\Stroob\Rytm2',True);
    if TbRtype.Position = 3 then
      Reg.OpenKey('Software\Z.M.software\Stroob\Los2',True);
    if TbRtype.Position = 4 then
      Reg.OpenKey('Software\Z.M.software\Stroob\Sekw2',True);

    if MessageBox(0, PChar('Czy usun¹æ profil "'+ CbRtype.Items.Strings
      [CbRtype.ItemIndex]+'"?'),'StrOOb', mb_IconQuestion+mb_OKCANCEL)=IDOK then
      begin
        Reg.DeleteKey(CbRtype.Items.Strings[CbRtype.ItemIndex]);
        CbRtype.Items.Delete(CbRtype.ItemIndex);
        CbRtype.ItemIndex := 0;
      end;
   finally
    Reg.Free;
  end;
  CbRtypeChange(Sender);
end;

procedure TStrOOb.CbLosowyChange(Sender: TObject);
var
  Reg : Tregistry;
begin
try
  Reg := TRegistry.Create;
  try
    Reg.RootKey := HKEY_CURRENT_USER;
    Reg.OpenKey('Software\Z.M.software\Stroob\Los1\'+
      CbLosowy.Items.Strings[CbLosowy.ItemIndex],True);

   TbLosMin.Position := Reg.ReadInteger('TbLosMin');
   TbLosmax.Position := Reg.ReadInteger('TbLosMax');
   if TbRtype.Position = 3 then CbRtype.ItemIndex := CbLosowy.ItemIndex;
   finally
    Reg.Free;
  end;
except
end;
end;

procedure TStrOOb.ImgSlosClick(Sender: TObject);
var
  Reg : Tregistry;
  sc: String;
begin
  Reg := TRegistry.Create;
  try
    Reg.RootKey := HKEY_CURRENT_USER;
    Reg.OpenKey('Software\Z.M.software\Stroob\Los1\',True);

    sc := InputBox('StrOOb','Podaj nazwê profilu','');
      if sc <> '' then
        begin
          if Reg.KeyExists(sc) then Reg.DeleteKey(sc);
          Reg.OpenKey(sc,True);
          Reg.WriteInteger('TbLosMin',TbLosMin.Position);
          Reg.WriteInteger('TbLosMax',TbLosMax.Position);
          Reg.CloseKey;
          Reg.OpenKey('Software\Z.M.software\Stroob\Los1',True);
          Reg.GetKeyNames(CbLosowy.Items);
          CbLosowy.ItemIndex := CbLosowy.Items.IndexOf(sc);
          if TbRtype.Position = 3 then begin
            CbRtype.Items := CbLosowy.Items;
            CbRtype.ItemIndex := CbLosowy.ItemIndex;
          end;
        end;
   finally
    Reg.Free;
  end;

end;

procedure TStrOOb.Image11Click(Sender: TObject);
var
  Reg : Tregistry;
begin
  Reg := TRegistry.Create;
  try
    Reg.RootKey := HKEY_CURRENT_USER;
    Reg.OpenKey('Software\Z.M.software\Stroob\Sekw1',True);
    if MessageBox(0, PChar('Czy usun¹æ profil "'+ CbSekwencja.Items.Strings
      [CbSekwencja.ItemIndex]+'"?'),'StrOOb', mb_IconQuestion+mb_OKCANCEL)=IDOK then
      begin
        Reg.DeleteKey(CbSekwencja.Items.Strings[CbSekwencja.ItemIndex]);
        CbSekwencja.Items.Delete(CbSekwencja.ItemIndex);
        CbSekwencja.ItemIndex := 0;
      end;
   finally
    Reg.Free;
  end;
  CbSekwencjaChange(Sender);
end;

procedure TStrOOb.Image10Click(Sender: TObject);
var
  Reg : Tregistry;
begin
  Reg := TRegistry.Create;
  try
    Reg.RootKey := HKEY_CURRENT_USER;
    Reg.OpenKey('Software\Z.M.software\Stroob\Los1',True);
    if MessageBox(0, PChar('Czy usun¹æ profil "'+ CbLosowy.Items.Strings
      [CbLosowy.ItemIndex]+'"?'),'StrOOb', mb_IconQuestion+mb_OKCANCEL)=IDOK then
      begin
        Reg.DeleteKey(CbLosowy.Items.Strings[CbLosowy.ItemIndex]);
        CbLosowy.Items.Delete(CbLosowy.ItemIndex);
        CbLosowy.ItemIndex := 0;

        if TbRtype.Position = 3 then begin
          CbRtype.Items := CbLosowy.Items;
          CbRtype.ItemIndex := CbLosowy.ItemIndex;
        end;

      end;
   finally
    Reg.Free;
  end;
  CbLosowyChange(Sender);


end;

procedure TStrOOb.CbAudioChange(Sender: TObject);
var
  Reg : Tregistry;
begin
try
  Reg := TRegistry.Create;
  try
    Reg.RootKey := HKEY_CURRENT_USER;
    Reg.OpenKey('Software\Z.M.software\Stroob\Audio\'+
      CbAudio.Items.Strings[CbAudio.ItemIndex],True);

      TBnarast.Position := Reg.ReadInteger('TBnarast');
      TBopad.Position := Reg.ReadInteger('TBopad');
      TBrefresh.Position := Reg.ReadInteger('TBrefresh');
      TBopozn.Position := Reg.ReadInteger('TBopozn');
      TBrownow.Position := Reg.ReadInteger('TBrownow');
      TBprog.Position := Reg.ReadInteger('TBprog');


   finally
    Reg.Free;
  end;
except
end;

end;

procedure TStrOOb.Image1Click(Sender: TObject);
var
  Reg : Tregistry;
  sc: String;
begin
  Reg := TRegistry.Create;
  try
    Reg.RootKey := HKEY_CURRENT_USER;
    Reg.OpenKey('Software\Z.M.software\Stroob\Audio\',True);

    sc := InputBox('StrOOb','Podaj nazwê profilu','');
      if sc <> '' then
        begin
          if Reg.KeyExists(sc) then Reg.DeleteKey(sc);
          Reg.OpenKey(sc,True);

      Reg.WriteInteger('TBnarast',TBnarast.Position);
      Reg.WriteInteger('TBopad',TBopad.Position);
      Reg.WriteInteger('TBrefresh',TBrefresh.Position);
      Reg.WriteInteger('TBopozn',TBopozn.Position);
      Reg.WriteInteger('TBrownow',TBrownow.Position);
      Reg.WriteInteger('TBprog',TBprog.Position);

        Reg.CloseKey;
        Reg.OpenKey('Software\Z.M.software\Stroob\Audio\',True);
        Reg.GetKeyNames(CbAudio.Items);
        CbAudio.ItemIndex := CbAudio.Items.IndexOf(sc);
        end;

   finally
    Reg.Free;
  end;

end;



procedure TStrOOb.Image2Click(Sender: TObject);
var
  Reg : Tregistry;
begin
  Reg := TRegistry.Create;
  try
    Reg.RootKey := HKEY_CURRENT_USER;
    Reg.OpenKey('Software\Z.M.software\Stroob\Audio',True);
    if MessageBox(0, PChar('Czy usun¹æ profil "'+ CbAudio.Items.Strings
      [CbAudio.ItemIndex]+'"?'),'StrOOb', mb_IconQuestion+mb_OKCANCEL)=IDOK then
      begin
        Reg.DeleteKey(CbAudio.Items.Strings[CbAudio.ItemIndex]);
        CbAudio.Items.Delete(CbAudio.ItemIndex);
        CbAudio.ItemIndex := 0;
      end;
   finally
    Reg.Free;
  end;
  CbAudioChange(Sender);

end;

procedure TStrOOb.SlupekTimer(Sender: TObject);
  var n: Integer;
  const
    v0: Byte = 15;
    v1: Byte = 23;
    v2: Byte = 32;
    v3: Byte = 40;
    v4: Byte = 49;
    v5: Byte = 57;
    v6: Byte = 66;
    v7: Byte = 74;

begin
  for n := 0 to 7 do LPTstate[n] := False;
  if CbRtype.ItemIndex = 0 then begin
    if Vol > v0 then LPTstate[0] := True;
    if Vol > v1 then LPTstate[1] := True;
    if Vol > v2 then LPTstate[2] := True;
    if Vol > v3 then LPTstate[3] := True;
    if Vol > v4 then LPTstate[4] := True;
    if Vol > v5 then LPTstate[5] := True;
    if Vol > v6 then LPTstate[6] := True;
    if Vol > v7 then LPTstate[7] := True; end;
  if CbRtype.ItemIndex = 1 then begin
    if Vol > v0 then LPTstate[7] := True;
    if Vol > v1 then LPTstate[6] := True;
    if Vol > v2 then LPTstate[5] := True;
    if Vol > v3 then LPTstate[4] := True;
    if Vol > v4 then LPTstate[3] := True;
    if Vol > v5 then LPTstate[2] := True;
    if Vol > v6 then LPTstate[1] := True;
    if Vol > v7 then LPTstate[0] := True; end;
  if CbRtype.ItemIndex = 2 then begin
    if Vol > v7 then LPTstate[7] := True
    else if Vol > v6 then LPTstate[6] := True
    else if Vol > v5 then LPTstate[5] := True
    else if Vol > v4 then LPTstate[4] := True
    else if Vol > v3 then LPTstate[3] := True
    else if Vol > v2 then LPTstate[2] := True
    else if Vol > v1 then LPTstate[1] := True
    else if Vol > v0 then LPTstate[0] := True; end;
  if CbRtype.ItemIndex = 3 then begin
    if Vol > v7 then LPTstate[0] := True
    else if Vol > v6 then LPTstate[1] := True
    else if Vol > v5 then LPTstate[2] := True
    else if Vol > v4 then LPTstate[3] := True
    else if Vol > v3 then LPTstate[4] := True
    else if Vol > v2 then LPTstate[5] := True
    else if Vol > v1 then LPTstate[6] := True
    else if Vol > v0 then LPTstate[7] := True; end;
  if CbRtype.ItemIndex = 4 then begin
    if Vol > 20 then LPTstate[3] := True;
    if Vol > 20 then LPTstate[4] := True;
    if Vol > 40 then LPTstate[2] := True;
    if Vol > 40 then LPTstate[5] := True;
    if Vol > 60 then LPTstate[1] := True;
    if Vol > 60 then LPTstate[6] := True;
    if Vol > 83 then LPTstate[0] := True;
    if Vol > 83 then LPTstate[7] := True; end;

     SetLPT;

end;





 
procedure TStrOOb.PnLosowyClick(Sender: TObject);
begin
  if PnLosowy.Color = clSilver then begin
    PnLosowy.Color := clGreen;
    StrobLosowy.Enabled := True;
  end else begin
    if TbRtype.Position <> 3 then StrobLosowy.Enabled := False;
    PnLosowy.Color := clSilver;
  end;
end;

procedure TStrOOb.PnSekwencjaClick(Sender: TObject);
begin
  if PnSekwencja.Color <> clSilver then begin
    StrobSekwencja.TerminateHard;
    PnSekwencja.Color := clSilver;
  end else begin
    PnSekwencja.Color := clGreen;
    StrobSekwencja.Execute;
  end;
end;

procedure TStrOOb.PnStalyClick(Sender: TObject);
begin
  StrobStaly.Enabled := not StrobStaly.Enabled;
  if StrobStaly.Enabled = False then PnStaly.Color := clSilver
    else PnStaly.Color := clGreen;
end;

procedure TStrOOb.ReS1Change(Sender: TObject);
  var dy: Integer;
begin
  ReS1.Color := clWhite;
  for dy := 0 to ReS1.Lines.Count - 1 do try
    StrToInt(ReS1.Lines.Strings[dy]);
    if (StrToInt(ReS1.Lines.Strings[dy]) < 40)
      or (StrToInt(ReS1.Lines.Strings[dy]) > 3000) then ReS1.Color := clYellow;
  except
    ReS1.Color := clRed;
  end;
end;

procedure TStrOOb.ReS2Change(Sender: TObject);
  var dy,n,st,su: Integer;
    sd: Currency;
    ss: String;
    sa,sb: string;
    ly: Boolean;
begin
  try
  for dy := 0 to ReS2.Lines.Count - 1 do begin
    ss := ReS2.Lines.Strings[dy];
    sd := StrToCurr(ss);

    if Frac(sd) = 0 then ly := True;

    for n := 1 to Length(ss) do
      if ss[n] = ',' then begin
        st := StrToInt(Copy(ss,1,n-1)); //dziesiatki - wartosc portu
        su := StrToInt(Copy(ss,n+1,Length(ss)-n)); //jednosci - opoznienie
        if (st < 0) or (st > 255) or (su < 25) or (su > 3000) then
          ly := True;
      end;
    end;
  if ly = True then ReS2.Color := clYellow else ReS2.Color := clWhite;
  except
    ReS2.Color := clRed;

  end;


end;






procedure TStrOOb.RSekwencjaExecute(Sender: TObject);
  var qw: Integer;
begin
  while ReS1.Enabled = True do try
   if (ReS1.Color = clRed) or (ReS1.Color = clYellow)
     or (ReS1.Lines.Count = 0) then sleep(10) else
      for qw := 0 to ReS1.Lines.Count - 1 do begin
        if (ReS1.Color = clRed) or (ReS1.Color = clYellow) then break;
        PnSekwencja.Color := clLime;
        COMstate[2] := True;
        Sleep(DlugoscImpulsu);
        COMstate[2] := False;
        Sleep(20);
        PnSekwencja.Color := clGreen;
        if (ReS1.Color = clRed) or (ReS1.Color = clYellow) then break;
        Sleep(StrToInt(ReS1.Lines.Strings[qw])-DlugoscImpulsu-20);
      end;
  except
    ReS1.Color := clRed;
  end;
  PnSekwencja.Color := clSilver;
end;

procedure TStrOOb.TBnarastChange(Sender: TObject);
begin
  Label6.Caption := 'OpóŸnienie narastania: '+IntToStr(TBnarast.Position)+' ms';
end;

procedure TStrOOb.TBopadChange(Sender: TObject);
begin
  Label7.Caption := 'OpóŸnienie opadania: '+IntToStr(TBopad.Position)+' ms';
end;

procedure TStrOOb.TBrefreshChange(Sender: TObject);
begin
  Label8.Caption := 'Odœwie¿anie: '+CurrToStr(1000/
    (TBrefresh.Min + TBrefresh.Max - TBrefresh.Position))+' Hz';
end;

procedure TStrOOb.RSekwExecute(Sender: TObject);
  var qx,n,st,su: Integer;
    ss: ShortString;
begin
  while ReS2.Enabled = True do try
    sleep(1); // na wypadek bledow
   if (ReS2.Color = clRed) or (ReS1.Color = clYellow)
     or (ReS2.Lines.Count = 0) then sleep(10) else
      for qx := 0 to ReS2.Lines.Count - 1 do begin
        if (ReS2.Color = clRed) or (ReS2.Color = clYellow) then break;
        ss := ReS2.Lines.Strings[qx];
        for n := 1 to Length(ss) do
          if ss[n] = ',' then begin
            st := StrToInt(Copy(ss,1,n-1)); //dziesiatki - wartosc portu
            su := StrToInt(Copy(ss,n+1,Length(ss)-n)); //jednosci - opoznienie
          end;
        SetLPTB(st);
        if (ReS2.Color = clRed) or (ReS2.Color = clYellow) then break;
        Sleep(su);
      end;
  except
    ReS2.Color := clRed;
  end;


end;

function TStrOOb.Int2Str(v: Integer; base: Integer): String;
  function Int2Chr(i: Integer): Char;
  begin
    if i < 10 then Result := Char(i + Integer('0')) else
    Result := Char(i - 10 + Integer('A'));
  end;

var
  m: Integer;
begin
  Result := '';
  while v <> 0 do begin
    m := v mod base; v := v div base; Result := Int2Chr(m) + Result;
  end;
  if Result = '' then Result := '0';
end;

procedure TStrOOb.SetLPT;
  var lw: Byte;
begin
  lw := 0;
    if LPTstate[7] = True then PnR8.Color := clLime else PnR8.Color := clGreen;
    if LPTstate[6] = True then PnR7.Color := clLime else PnR7.Color := clGreen;
    if LPTstate[5] = True then PnR6.Color := clLime else PnR6.Color := clGreen;
    if LPTstate[4] = True then PnR5.Color := clLime else PnR5.Color := clGreen;
    if LPTstate[3] = True then PnR4.Color := clLime else PnR4.Color := clGreen;
    if LPTstate[2] = True then PnR3.Color := clLime else PnR3.Color := clGreen;
    if LPTstate[1] = True then PnR2.Color := clLime else PnR2.Color := clGreen;
    if LPTstate[0] = True then PnR1.Color := clLime else PnR1.Color := clGreen;

    if LPTstate[7] = True then lw := lw + 1;
    if LPTstate[6] = True then lw := lw + 2;
    if LPTstate[5] = True then lw := lw + 4;
    if LPTstate[4] = True then lw := lw + 8;
    if LPTstate[3] = True then lw := lw + 16;
    if LPTstate[2] = True then lw := lw + 32;
    if LPTstate[1] = True then lw := lw + 64;
    if LPTstate[0] = True then lw := lw + 128;

    SmallPort1.ZapiszBajt('D',lw);

end;

procedure TStrOOb.SetLPTB(Data: Byte);
  var sf: ShortString;
    sg: Byte;
begin
  sf := Int2Str(Data,2);
  if Length(sf) < 8 then
    for sg := 1 to 8-Length(sf) do Insert('0',sf,1);  //uzupelnianie do 8 bitow
  for sg := 7 downto 0 do
    if copy(sf,sg+1,1) = '1' then LPTstate[sg] := True
      else LPTstate[sg] := False;
  SetLPT;
end;

end.
