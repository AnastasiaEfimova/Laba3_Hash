object HashForm: THashForm
  Left = 815
  Top = 224
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'MainForm'
  ClientHeight = 380
  ClientWidth = 735
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = mmMain
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object sgMain: TStringGrid
    Left = 1
    Top = 35
    Width = 728
    Height = 342
    ColCount = 4
    DefaultColWidth = 150
    FixedCols = 0
    TabOrder = 0
    ColWidths = (
      125
      169
      279
      150)
  end
  object btAdd: TButton
    Left = 0
    Top = 0
    Width = 89
    Height = 33
    Caption = #1044#1086#1073#1072#1074#1080#1090#1100
    TabOrder = 1
    OnClick = btAddClick
  end
  object btEdit: TButton
    Left = 104
    Top = 0
    Width = 89
    Height = 33
    Caption = #1048#1079#1084#1077#1085#1080#1090#1100
    TabOrder = 2
    OnClick = btEditClick
  end
  object btRemove: TButton
    Left = 208
    Top = 0
    Width = 89
    Height = 33
    Caption = #1059#1076#1072#1083#1080#1090#1100
    TabOrder = 3
    OnClick = btRemoveClick
  end
  object btFind: TButton
    Left = 312
    Top = 0
    Width = 89
    Height = 33
    Caption = #1053#1072#1081#1090#1080
    TabOrder = 4
    OnClick = btFindClick
  end
  object mmMain: TMainMenu
    Left = 680
    Top = 320
    object mniFile: TMenuItem
      Caption = 'File'
      object mniOpen: TMenuItem
        Caption = 'Open'
        OnClick = mniOpenClick
      end
      object mniSave: TMenuItem
        Caption = 'Save'
        OnClick = mniSaveClick
      end
    end
  end
  object dlgOpen: TOpenDialog
    Filter = 'Binary files|*.bin'
    Left = 616
    Top = 320
  end
  object dlgSave: TSaveDialog
    Filter = 'Binary files|*.bin'
    Left = 648
    Top = 320
  end
end
