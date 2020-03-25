object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 299
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PaintBox: TPaintBox
    Left = 0
    Top = 0
    Width = 465
    Height = 297
    OnPaint = PaintBoxPaint
  end
  object Label1: TLabel
    Left = 496
    Top = 32
    Width = 60
    Height = 13
    Caption = #36873#25321#20989#25968#65306
  end
  object ComboBox: TComboBox
    Left = 496
    Top = 64
    Width = 97
    Height = 21
    TabOrder = 0
    Text = 'sin'
    OnSelect = ComboBoxSelect
    Items.Strings = (
      'sin'
      'cos')
  end
end
