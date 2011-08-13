object Form1: TForm1
  Left = 192
  Top = 107
  Width = 650
  Height = 485
  Caption = 'ZHello'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 16
    Width = 48
    Height = 13
    Caption = 'Hostname'
  end
  object Label2: TLabel
    Left = 336
    Top = 16
    Width = 19
    Height = 13
    Caption = 'Port'
  end
  object Label3: TLabel
    Left = 432
    Top = 16
    Width = 72
    Height = 13
    Caption = 'Databasename'
  end
  object Label4: TLabel
    Left = 24
    Top = 48
    Width = 34
    Height = 13
    Caption = 'Search'
  end
  object Label5: TLabel
    Left = 64
    Top = 80
    Width = 189
    Height = 13
    Caption = 'Search example : @attr 1=4 "computer"'
  end
  object Edit1: TEdit
    Left = 64
    Top = 16
    Width = 265
    Height = 21
    TabOrder = 0
  end
  object Edit2: TEdit
    Left = 360
    Top = 16
    Width = 65
    Height = 21
    TabOrder = 1
    Text = '210'
  end
  object Edit3: TEdit
    Left = 512
    Top = 16
    Width = 121
    Height = 21
    TabOrder = 2
  end
  object Memo1: TMemo
    Left = 8
    Top = 104
    Width = 633
    Height = 345
    TabStop = False
    ScrollBars = ssBoth
    TabOrder = 4
  end
  object Edit4: TEdit
    Left = 64
    Top = 48
    Width = 569
    Height = 21
    TabOrder = 3
  end
  object Button1: TButton
    Left = 560
    Top = 72
    Width = 75
    Height = 25
    Caption = 'Search'
    TabOrder = 5
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 472
    Top = 72
    Width = 75
    Height = 25
    Caption = 'Scan'
    TabOrder = 6
    OnClick = Button2Click
  end
end
