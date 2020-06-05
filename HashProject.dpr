program HashProject;

uses
  Forms,
  MainForm in 'MainForm.pas' {HashForm},
  UEntries in 'UEntries.pas',
  UHashTable in 'UHashTable.pas',
  ULinkedList in 'ULinkedList.pas',
  UMovie in 'UMovie.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(THashForm, HashForm);
  Application.Run;
end.
