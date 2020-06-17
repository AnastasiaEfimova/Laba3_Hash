unit UMovieForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, UMovie;

type
  TMovieForm = class(TForm)
    grpInput: TGroupBox;
    edMovieName: TLabeledEdit;
    edProducer: TLabeledEdit;
    edActors: TLabeledEdit;
    edDescription: TLabeledEdit;
    btAdd: TButton;
    btCancel: TButton;
    procedure btAddClick(Sender: TObject);
  private
    { Private declarations }
  public
    movie: TMovie;
    constructor Create(ACaption: string; movie: TMovie = nil; edit:boolean = false);
  end;

var
  MovieForm: TMovieForm;

implementation

{$R *.dfm}

constructor TMovieForm.Create(ACaption: string; movie: TMovie = nil; edit:boolean = false);
begin
  inherited Create(nil);
  Caption:=ACaption;
  self.movie:= movie;
  if not edit then
    begin
      btAdd.visible:=(movie = nil);
      edMovieName.ReadOnly:=(movie <> nil);
      edProducer.ReadOnly:=(movie <> nil);
      edActors.ReadOnly:=(movie <> nil);
      edDescription.ReadOnly:=(movie <> nil);
    end;
  if movie <> nil then
    begin
      edMovieName.Text:= movie.name;
      edProducer.Text:= movie.producer;
      edActors.Text:= movie.actors;
      edDescription.Text:= movie.description;
    end;
end;

procedure TMovieForm.btAddClick(Sender: TObject);
begin
  if Trim(edMovieName.Text)='' then
    begin
      ShowMessage('¬ведите название фильма!');
      edMovieName.SetFocus();
      exit;
    end;
  if Trim(edProducer.Text)='' then
    begin
      ShowMessage('¬ведите продюсера!');
      edProducer.SetFocus();
      exit;
    end;
  if Trim(edActors.Text)='' then
    begin
      ShowMessage('¬ведите актеров!');
      edActors.SetFocus();
      exit;
    end;
  if Trim(edDescription.Text)='' then
    begin
      ShowMessage('¬ведите описание фильма!');
      edDescription.SetFocus();
      exit;
    end;
  movie:= TMovie.Create(edMovieName.Text, edProducer.Text,
                        edActors.Text, edDescription.Text);
  modalResult:= mrOk;
end;

end.
