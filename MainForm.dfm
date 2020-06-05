object HashForm: THashForm
  Left = 815
  Top = 224
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'MainForm'
  ClientHeight = 257
  ClientWidth = 474
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
  object grpInput: TGroupBox
    Left = 8
    Top = 8
    Width = 249
    Height = 241
    Caption = #1042#1074#1086#1076' '#1092#1080#1083#1100#1084#1072
    TabOrder = 0
    object edMovieName: TLabeledEdit
      Left = 8
      Top = 32
      Width = 225
      Height = 21
      EditLabel.Width = 89
      EditLabel.Height = 13
      EditLabel.Caption = #1053#1072#1079#1074#1072#1085#1080#1077' '#1092#1080#1083#1100#1084#1072
      TabOrder = 0
    end
    object edProducer: TLabeledEdit
      Left = 8
      Top = 72
      Width = 225
      Height = 21
      EditLabel.Width = 48
      EditLabel.Height = 13
      EditLabel.Caption = #1056#1077#1078#1080#1089#1089#1077#1088
      TabOrder = 1
    end
    object edActors: TLabeledEdit
      Left = 8
      Top = 112
      Width = 225
      Height = 21
      EditLabel.Width = 81
      EditLabel.Height = 13
      EditLabel.Caption = #1057#1087#1080#1089#1086#1082' '#1072#1082#1090#1077#1088#1086#1074
      TabOrder = 2
    end
    object edDescription: TLabeledEdit
      Left = 8
      Top = 152
      Width = 225
      Height = 21
      EditLabel.Width = 108
      EditLabel.Height = 13
      EditLabel.Caption = #1050#1088#1072#1090#1082#1086#1077' '#1089#1086#1076#1077#1088#1078#1072#1085#1080#1077
      TabOrder = 3
    end
    object btnAdd: TButton
      Left = 64
      Top = 192
      Width = 113
      Height = 41
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      TabOrder = 4
      OnClick = btnAddClick
    end
  end
  object btnFind: TButton
    Left = 264
    Top = 48
    Width = 97
    Height = 33
    Caption = #1053#1072#1081#1090#1080
    TabOrder = 1
    OnClick = btnFindClick
  end
  object mmoOutput: TMemo
    Left = 264
    Top = 104
    Width = 201
    Height = 145
    Enabled = False
    TabOrder = 2
  end
  object edFindMovie: TLabeledEdit
    Left = 264
    Top = 16
    Width = 201
    Height = 21
    EditLabel.Width = 134
    EditLabel.Height = 13
    EditLabel.Caption = #1053#1072#1081#1090#1080' '#1092#1080#1083#1100#1084' '#1087#1086' '#1085#1072#1079#1074#1072#1085#1080#1102
    TabOrder = 3
  end
  object btnRemove: TButton
    Left = 376
    Top = 48
    Width = 91
    Height = 33
    Caption = #1059#1076#1072#1083#1080#1090#1100
    TabOrder = 4
    OnClick = btnRemoveClick
  end
  object mmMain: TMainMenu
    Left = 88
    Top = 256
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
    Left = 8
    Top = 256
  end
  object dlgSave: TSaveDialog
    Filter = 'Binary files|*.bin'
    Left = 48
    Top = 256
  end
end