unit MainForm;

{����� ����� ������� ��������� ���������: �������� ����������, �������, ������ ������,
������� ����������. �� ��������� �������� ������ ����� ��������� ��������.}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, UMovie, UHashTable, Menus;

type
  THashForm = class(TForm)
    grpInput: TGroupBox;
    edMovieName: TLabeledEdit;
    edProducer: TLabeledEdit;
    edActors: TLabeledEdit;
    edDescription: TLabeledEdit;
    btnAdd: TButton;
    btnFind: TButton;
    mmoOutput: TMemo;
    edFindMovie: TLabeledEdit;
    btnRemove: TButton;
    mmMain: TMainMenu;
    mniFile: TMenuItem;
    mniOpen: TMenuItem;
    mniSave: TMenuItem;
    dlgOpen: TOpenDialog;
    dlgSave: TSaveDialog;
    procedure btnAddClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnFindClick(Sender: TObject);
    procedure btnRemoveClick(Sender: TObject);
    procedure mniOpenClick(Sender: TObject);
    procedure mniSaveClick(Sender: TObject);
  private

  public
    { Public declarations }
  end;

var
  HashForm: THashForm;
  table: THashTable;
implementation

{$R *.dfm}

procedure THashForm.btnAddClick(Sender: TObject);
var
  movie : TMovie;
begin
  if edMovieName.Text = ''  then
    ShowMessage('������� �������� ������')
  else if edProducer.Text = '' then
    ShowMessage('������� ���������')
  else if edActors.Text = '' then
    ShowMessage('������� ������ �������')
  else if edDescription.Text = '' then
    ShowMessage('������� ������� ����������');
  movie:= TMovie.Create();
  movie.Name:= edMovieName.Text;
  movie.Producer:= edProducer.Text;
  movie.Actors:= edActors.Text;
  movie.Description:= edDescription.Text;
  table.add(movie.Name, movie);
  ShowMessage('����� ��������');
end;

procedure THashForm.FormCreate(Sender: TObject);
begin
  table := THashTable.Create;
end;

procedure THashForm.btnFindClick(Sender: TObject);
var
  movie: TMovie;
begin
  if edFindMovie.Text = '' then
    ShowMessage('������� �������� ������')
  else
    begin
      movie := table.get(edFindMovie.Text);
      mmoOutput.Clear;
      if (movie = nil) then
        mmoOutput.Lines.Add('����� �� ������!')
      else
        begin
          mmoOutput.Lines.Add('��������: ' + movie.Name);
          mmoOutput.Lines.Add('��������: ' + movie.Producer);
          mmoOutput.Lines.Add('������: ' + movie.Actors);
          mmoOutput.Lines.Add('������� ����������: ' + movie.Description);
        end;
    end;
end;


procedure THashForm.btnRemoveClick(Sender: TObject);
begin
  if edFindMovie.Text = '' then
    ShowMessage('������� �������� ������')
  else
    begin
      if table.remove(edFindMovie.Text) then
        ShowMessage('����� ������!')
      else
        ShowMessage('����� �� ������!');
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
end.
