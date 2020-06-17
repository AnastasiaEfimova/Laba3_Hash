unit MainForm;

{Задан набор записей следующей структуры: название кинофильма, режиссёр, список актёров,
краткое содержание. По заданному названию фильма найти остальные сведения.}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, UMovie, UHashTable, Menus, UMovieForm, UFind,
  Grids;

type
  THashForm = class(TForm)
    mmMain: TMainMenu;
    mniFile: TMenuItem;
    mniOpen: TMenuItem;
    mniSave: TMenuItem;
    dlgOpen: TOpenDialog;
    dlgSave: TSaveDialog;
    sgMain: TStringGrid;
    btAdd: TButton;
    btEdit: TButton;
    btRemove: TButton;
    btFind: TButton;
    procedure FormCreate(Sender: TObject);
    procedure mniOpenClick(Sender: TObject);
    procedure mniSaveClick(Sender: TObject);
    procedure btAddClick(Sender: TObject);
    procedure btEditClick(Sender: TObject);
    procedure btRemoveClick(Sender: TObject);
    procedure btFindClick(Sender: TObject);
  private

  public
    { Public declarations }
  end;

var
  HashForm: THashForm;
  table: THashTable;
implementation

{$R *.dfm}


procedure THashForm.FormCreate(Sender: TObject);
begin
  table := THashTable.Create;
  with sgMain do
    begin
      ColCount:=4;
      RowCount:=2;
      FixedRows:=1;
      Rows[1].Clear;
      Cells[0,0]:='Название фильма';
      Cells[1,0]:='Продюсер';
      Cells[2,0]:='Актеры';
      Cells[3,0]:='Описание';
    end;
end;

procedure THashForm.mniOpenClick(Sender: TObject);
var
  loadedCount: integer;
begin
  if dlgOpen.Execute then
    begin
      loadedCount := table.loadFromFile(dlgOpen.FileName);
      if loadedCount > 0 then
        ShowMessage('Loaded '+IntToStr(loadedCount)+' movies')
      else
        ShowMessage('Empty file');
      table.LoadToSG(sgMain);
    end;
end;

procedure THashForm.mniSaveClick(Sender: TObject);
begin
  if dlgSave.Execute then
    begin
      table.saveToFile(dlgSave.FileName);
      ShowMessage('Data is saved!');
    end;
end;
procedure THashForm.btAddClick(Sender: TObject);
var
  movie: TMovie;
  MovieForm: TMovieForm;
begin
  MovieForm:=TMovieForm.Create('Добавить фильм');
  if MovieForm.ShowModal=mrOk then
    begin
      movie:= MovieForm.movie;
      if table.get(movie.name) <> nil then
        ShowMessage('Фильм с таким названием уже существует')
      else
        begin
          table.add(movie.name, movie);
          ShowMessage('Фильм добавлен');
        end;
    end;
  table.LoadToSG(sgMain);
  MovieForm.Free;
end;

procedure THashForm.btEditClick(Sender: TObject);
var
  movie: TMovie;
  MovieForm: TMovieForm;
  FindForm: TFindForm;
begin
  FindForm:= TFindForm.Create(false);
  if FindForm.ShowModal = mrOk then
    begin
      movie:= table.get(FindForm.name);
      if (movie = nil) then
        ShowMessage('Фильма с таким названием нет')
      else
        begin
          MovieForm:=TMovieForm.Create('Изменить фильм', movie, true);
          if MovieForm.ShowModal=mrOk then
            begin
              table.remove(FindForm.name);
              table.add(MovieForm.movie.name, MovieForm.movie);
              ShowMessage('Фильм изменен');
            end;
          MovieForm.Free;
        end;
    end;
  table.LoadToSG(sgMain);
  FindForm.free;
end;

procedure THashForm.btRemoveClick(Sender: TObject);
var
  movie: TMovie;
  FindForm: TFindForm;
begin
  FindForm:= TFindForm.Create(true);
  if FindForm.ShowModal = mrOk then
    begin
      movie:= table.get(FindForm.name);
      if (movie = nil) then
        ShowMessage('Фильма с таким названием нет')
      else
        begin
          table.remove(movie.name);
          ShowMessage('Фильм удален');
        end;
    end;
  table.LoadToSG(sgMain);
  FindForm.free;
end;

procedure THashForm.btFindClick(Sender: TObject);
var
  movie: TMovie;
  MovieForm: TMovieForm;
  FindForm: TFindForm;
begin
  FindForm:= TFindForm.Create(false);
  if FindForm.ShowModal = mrOk then
    begin
      movie:= table.get(FindForm.name);
      if (movie = nil) then
        ShowMessage('Фильма с таким названием нет')
      else
        begin
          MovieForm:=TMovieForm.Create('Фильм ' + FindForm.Name, movie);
          MovieForm.ShowModal;
          MovieForm.Free;
        end;
    end;
  FindForm.free;
end;

end.
