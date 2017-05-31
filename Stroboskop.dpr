program Stroboskop;

uses
  Forms,
  Unit1 in 'Unit1.pas' {StrOOb},
  Bass in '..\Bass.pas',
  UnitAbout in 'UnitAbout.pas' {About};

begin
  Application.Initialize;
  Application.Title := 'Stroob';
  Application.CreateForm(TStrOOb, StrOOb);
  Application.CreateForm(TAbout, About);
  Application.Run;
end.
