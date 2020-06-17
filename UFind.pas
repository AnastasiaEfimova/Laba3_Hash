unit UFind;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TFindForm = class(TForm)
    btOk: TButton;
    edFindMovie: TLabeledEdit;
    btCancel: TButton;
    procedure btOkClick(Sender: TObject);
  private
    { Private declarations }
  public
    Name: string;
    constructor Create(isDelete: boolean);
  end;

var
  FindForm: TFindForm;

implementation

{$R *.dfm}

procedure TFindForm.btOkClick(Sender: TObject);
begin
  if Trim(edFindMovie.Text) <> '' then
    begin
      name:= Trim(edFindMovie.Text);
      modalResult:= mrOk;
    end
  else
    ShowMessage('Введите название фильма');
end;

constructor TFindForm.Create(isDelete: boolean);
begin
  inherited Create(nil);
  if (isDelete) then
    btOk.Caption:= 'Удалить'
  else
    btOk.Caption:= 'Найти';
end;

end.
