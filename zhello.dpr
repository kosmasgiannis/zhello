program zhello;

uses
  Forms,
  main in 'main.pas' {Form1},
  zoom in 'zoom.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
