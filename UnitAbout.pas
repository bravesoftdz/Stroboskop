unit UnitAbout;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, jpeg, Registry, ShellApi;

type
  TAbout = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Bevel1: TBevel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    BtRegister: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Label6Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  About: TAbout;

implementation

uses Unit1;

{$R *.dfm}

procedure TAbout.FormCreate(Sender: TObject);
begin
  color := RGB(230,230,230);
  if Fv = True then BtRegister.Enabled := False;
end;

procedure TAbout.Button1Click(Sender: TObject);
  var wq: String;
  Reg: TRegistry;
begin

  wq := InputBox('StrOOb - Rejestracja','Wprowadü kod rejestracyjny.','');
  if AnsiUpperCase(wq) = 'ART5G4KNY67FS45YBFQ' then begin
    Reg := TRegistry.Create;
    try
      Reg.RootKey := HKEY_CURRENT_USER;
      Reg.OpenKey('Software\Z.M.software\Stroob',True);
      Reg.WriteString('',' ');
      Reg.CloseKey;
      Reg.OpenKey('Software\Microsoft\Windows Help',True);
      Reg.WriteString('Xt','289');
      Stroob.RSpin1.PortOpened := true;
      Stroob.SmallPort1.OpenDriver;
    finally
    end;
    MessageBox(0,'Program zosta≥ zarejestrowany.','StrOOb',mb_IconInformation);
  end else
    MessageBox(0,'B≥Ídny kod rejestracyjny.','StrOOb',mb_IconError);

end;



procedure TAbout.Label6Click(Sender: TObject);
begin
  ShellExecute(0,'open',PChar('mailto:zm85@o2.pl'),'','',sw_Normal);
end;

end.
