program HashProject;

uses
  Forms,
  MainForm in 'MainForm.pas' {HashForm},
  UEntries in 'UEntries.pas',
  UHashTable in 'UHashTable.pas',
  ULinkedList in 'ULinkedList.pas',
  UMovie in 'UMovie.pas',
  UMovieForm in 'UMovieForm.pas' {MovieForm},
  UFind in 'UFind.pas' {FindForm};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(THashForm, HashForm);
  Application.CreateForm(TMovieForm, MovieForm);
  Application.CreateForm(TFindForm, FindForm);
  Application.Run;
end.
