unit RsPin;

{Komponent TRsPin s³u¿y do kontroli pinów portu szeregowego.
Zastosowanie - elektronika amatorska : sterowania, programatory itp.
Autor : Jerzy Szczesiul jerzy.szczesiul@ep.com.pl
Kod Open Source do swobodnego wykorzystywania }

interface

uses
  Windows,Classes;

type

  TRsPin = class(TComponent)
  private
    { Private declarations }
    FPortOpened:Boolean; // otwieranie i zamykanie portu, kontrola otwarcia
    FComNumber:Integer;  // numer portu ( 1-4 )
    FTrackInput:Boolean; // œledzenie stanu pinów wejœciowych

    FRtsStart:Boolean; // stan RTS po otwarciu portu
    FDtrStart:Boolean; // stan DTR po otwarciu portu
    FTxdStart:Boolean; // stan TxD po otwarciu portu

    FRtsState:Boolean; // poziom na pinie wyjœciowym RTS ( True=+12V )
    FDtrState:Boolean; // poziom na pinie wyjœciowym DTR ( True=+12V )
    FTxdState:Boolean; // poziom na pinie wyjœciowym TxD ( True=+12V )

    ComHandle:THandle;

    { dla z³¹cza DB-9 piny s¹ nastêpuj¹ce : ( DB-25 w nawiasie )
      1 - DCD (8)
      2 - RxD (3)
      3 - TxD (2)
      4 - DTR (20)
      5 - GND (7)
      6 - DSR (6)
      7 - RTS (4)
      8 - CTS (5)
      9 - RI  (22)
      }

    FOnComError:TNotifyEvent;
    FOnOpenCom:TNotifyEvent;
    FOnCloseCom:TNotifyEvent;
    FOnCtsUp:TNotifyEvent;
    FOnCtsDown:TNotifyEvent;
    FOnDsrUp:TNotifyEvent;
    FOnDsrDown:TNotifyEvent;
    FOnDcdUp:TNotifyEvent;
    FOnDcdDown:TNotifyEvent;
    FOnRiUp:TNotifyEvent;
    FOnRiDown:TNotifyEvent;

    procedure StartTrack;
    procedure StopTrack;
    procedure NilThread(Sender:TObject);

  protected
    { Protected declarations }
    destructor Destroy;override;

    procedure SetPortOpened(Value:Boolean);
    procedure SetComNumber(Value:Integer);
    procedure SetRtsState(Value:Boolean);
    procedure SetDtrState(Value:Boolean);
    procedure SetTxdState(Value:Boolean);

    procedure SetTrackInput(Value:Boolean);

    function GetCtsState:Boolean;
    function GetDsrState:Boolean;
    function GetDcdState:Boolean;
    function GetRiState:Boolean;

  public
    { Public declarations }

    constructor Create(AOwner:TComponent);override;

    property PortOpened:Boolean read FPortOpened write SetPortOpened;
    property RtsState:Boolean read FRtsState write SetRtsState;
    property DtrState:Boolean read FDtrState write SetDtrState;
    property TxdState:Boolean read FTxdState write SetTxdState;

    property CtsState:Boolean read GetCtsState;
    property DsrState:Boolean read GetDsrState;
    property DcdState:Boolean read GetDcdState;
    property RiState:Boolean read GetRiState;

  published
    { Published declarations }
    property ComNumber:Integer read FComNumber write SetComNumber;
    property RtsStart:Boolean read FRtsStart write FRtsStart;
    property DtrStart:Boolean read FDtrStart write FDtrStart;
    property TxdStart:Boolean read FTxdStart write FTxdStart;
    property TrackInput:Boolean read FTrackInput write SetTrackInput;

    property OnComError:TNotifyEvent read FOnComError write FOnComError;

    property OnOpenCom:TNotifyEvent read FOnOpenCom write FOnOpenCom;
    property OnCloseCom:TNotifyEvent read FOnCloseCom write FOnCloseCom;

    property OnCtsUp:TNotifyEvent read FOnCtsUp write FOnCtsUp;
    property OnCtsDown:TNotifyEvent read FOnCtsDown write FOnCtsDown;

    property OnDsrUp:TNotifyEvent read FOnDsrUp write FOnDsrUp;
    property OnDsrDown:TNotifyEvent read FOnDsrDown write FOnDsrDown;

    property OnDcdUp:TNotifyEvent read FOnDcdUp write FOnDcdUp;
    property OnDcdDown:TNotifyEvent read FOnDcdDown write FOnDcdDown;

    property OnRiUp:TNotifyEvent read FOnRiUp write FOnRiUp;
    property OnRiDown:TNotifyEvent read FOnRiDown write FOnRiDown;

  end;

procedure Register;

implementation

uses PinThread;

var
   TrackThread:TTrackThread;

constructor TRsPin.Create;
begin
     inherited Create(AOwner);
     ComNumber:=1;
end;

destructor TRsPin.Destroy;
begin
     PortOpened:=False;
     inherited Destroy;
end;

procedure TRsPin.NilThread(Sender:TObject);
begin
     TrackThread:=nil;
end;

procedure TRsPin.SetTrackInput(Value:Boolean);
begin
     if Value <> FTrackInput then begin
      FTrackInput:=Value;
      if FTrackInput then begin
         if PortOpened then StartTrack
         end else begin
         if PortOpened then StopTrack
         end;
      end;
end;

procedure TRsPin.StartTrack;
begin
     if Assigned(TrackThread) then Exit;
     TrackThread:=TTrackThread.Create(True);
     with TrackThread do begin
          FreeOnTerminate:=True;
          SetupThread(Self,ComHandle);
          OnTerminate:=NilThread;
          Resume;
          end;
end;

procedure TRsPin.StopTrack;
begin
     if Assigned(TrackThread) then TrackThread.Terminate;
end;

function TRsPin.GetCtsState:Boolean;
var
   ModemStat:DWORD;
begin
     if not FPortOpened then begin Result:=False;Exit;end;
     GetCommModemStatus(ComHandle,ModemStat);
     Result:=(ModemStat and MS_CTS_ON)<>0;
end;

function TRsPin.GetDsrState:Boolean;
var
   ModemStat:DWORD;
begin
     if not FPortOpened then begin Result:=False;Exit;end;
     GetCommModemStatus(ComHandle,ModemStat);
     Result:=(ModemStat and MS_DSR_ON)<>0;
end;

function TRsPin.GetDcdState:Boolean;
var
   ModemStat:DWORD;
begin
     if not FPortOpened then begin Result:=False;Exit;end;
     GetCommModemStatus(ComHandle,ModemStat);
     Result:=(ModemStat and MS_RLSD_ON)<>0;
end;

function TRsPin.GetRiState:Boolean;
var
   ModemStat:DWORD;
begin
     if not FPortOpened then begin Result:=False;Exit;end;
     GetCommModemStatus(ComHandle,ModemStat);
     Result:=(ModemStat and MS_RING_ON)<>0;
end;

procedure TRsPin.SetRtsState(Value:Boolean);
begin
     if not FPortOpened then Exit;
     if Value=FRtsState then Exit;
     if Value then EscapeCommFunction(ComHandle,SETRTS) else
        EscapeCommFunction(ComHandle,CLRRTS);
     FRtsState:=Value;
end;

procedure TRsPin.SetDtrState(Value:Boolean);
begin
     if not FPortOpened then Exit;
     if Value=FDtrState then Exit;
     if Value then EscapeCommFunction(ComHandle,SETDTR) else
        EscapeCommFunction(ComHandle,CLRDTR);
     FDtrState:=Value;
end;

procedure TRsPin.SetTxdState(Value:Boolean);
begin
     if not FPortOpened then Exit;
     if Value=FTxdState then Exit;
     if Value then SetCommBreak(ComHandle) else ClearCommBreak(ComHandle);
     FTxdState:=Value;
end;

procedure TRsPin.SetPortOpened(Value:Boolean);
var
   PortName:String;
   TmpHandle:THandle;
begin
     if Value=FPortOpened then Exit;
     if Value then begin
        case FComNumber of
        1: PortName:='COM1';
        2: PortName:='COM2';
        3: PortName:='COM3';
        4: PortName:='COM4';
        end; //case
        TmpHandle:=CreateFile(PChar(PortName),GENERIC_READ or GENERIC_WRITE,
        0,nil,OPEN_EXISTING,0,0);
        if TmpHandle = INVALID_HANDLE_VALUE then begin
             CloseHandle(TmpHandle);
             if Assigned(OnComError) then FOnComError(Self);
             end else begin
             ComHandle:=TmpHandle;
             FPortOpened:=True;
             if FTrackInput then StartTrack;
             if FRtsStart then EscapeCommFunction(ComHandle,SETRTS) else
                EscapeCommFunction(ComHandle,CLRRTS);
                RtsState:=FRtsStart;
             if FDtrStart then EscapeCommFunction(ComHandle,SETDTR) else
                EscapeCommFunction(ComHandle,CLRDTR);
                DtrState:=FDtrStart;
             if FTxdStart then SetCommBreak(ComHandle);
                TxdState:=FTxdStart;
             if Assigned(OnOpenCom) then FOnOpenCom(Self);
             end;

     end else begin
     if FTrackInput then StopTrack;
     ClearCommBreak(ComHandle);
     FTxdState:=False;
     EscapeCommFunction(ComHandle,CLRDTR);
     FDtrState:=False;
     EscapeCommFunction(ComHandle,CLRRTS);
     FRtsState:=False;
     if Assigned(OnCloseCom) then FOnCloseCom(Self);
     CloseHandle(ComHandle);
     ComHandle:=0;
     FPortOpened:=False;
     end;
end;

procedure TRsPin.SetComNumber(Value:Integer);
begin
     if Value=FComNumber then Exit;
     if FPortOpened then Exit;     // przy porcie otwartym nie mo¿na zmieniæ numeru
     FComNumber:=Value;
     if Value < 1 then FComNumber:=1;
     if Value > 4 then FComNumber:=4;
end;

procedure Register;
begin
  RegisterComponents('System', [TRsPin]);
end;

initialization
  TrackThread:=nil;

end.
