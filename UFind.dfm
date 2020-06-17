object FindForm: TFindForm
  Left = 191
  Top = 125
  Width = 239
  Height = 140
  Caption = #1055#1086#1080#1089#1082
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object btOk: TButton
    Left = 8
    Top = 56
    Width = 97
    Height = 33
    Caption = #1053#1072#1081#1090#1080
    ModalResult = 1
    TabOrder = 0
    OnClick = btOkClick
  end
  object edFindMovie: TLabeledEdit
    Left = 10
    Top = 24
    Width = 201
    Height = 21
    EditLabel.Width = 136
    EditLabel.Height = 13
    EditLabel.Caption = #1042#1074#1077#1076#1080#1090#1077' '#1085#1072#1079#1074#1072#1085#1080#1077' '#1092#1080#1083#1100#1084#1072
    TabOrder = 1
  end
  object btCancel: TButton
    Left = 120
    Top = 56
    Width = 91
    Height = 33
    Caption = #1054#1090#1084#1077#1085#1072
    ModalResult = 2
    TabOrder = 2
  end
end
