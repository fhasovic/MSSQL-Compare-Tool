object MainForm: TMainForm
  Left = 0
  Top = 0
  Caption = 'MSSQL Compare Tool'
  ClientHeight = 519
  ClientWidth = 752
  Color = clBtnFace
  DefaultMonitor = dmMainForm
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -10
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 12
  object Label1: TLabel
    Left = 12
    Top = 8
    Width = 71
    Height = 12
    Caption = 'From Database:'
  end
  object Label2: TLabel
    Left = 12
    Top = 31
    Width = 76
    Height = 12
    Caption = 'From UserName:'
  end
  object Label3: TLabel
    Left = 12
    Top = 53
    Width = 74
    Height = 12
    Caption = 'From Password:'
  end
  object Label4: TLabel
    Left = 12
    Top = 76
    Width = 89
    Height = 12
    Caption = 'From Server Name:'
  end
  object Label5: TLabel
    Left = 150
    Top = 107
    Width = 56
    Height = 12
    Caption = 'Table Name:'
  end
  object Label6: TLabel
    Left = 397
    Top = 8
    Width = 59
    Height = 12
    Caption = 'To Database:'
  end
  object Label7: TLabel
    Left = 397
    Top = 31
    Width = 64
    Height = 12
    Caption = 'To UserName:'
  end
  object Label8: TLabel
    Left = 397
    Top = 53
    Width = 62
    Height = 12
    Caption = 'To Password:'
  end
  object Label9: TLabel
    Left = 397
    Top = 76
    Width = 77
    Height = 12
    Caption = 'To Server Name:'
  end
  object Label11: TLabel
    Left = 413
    Top = 107
    Width = 60
    Height = 12
    Caption = 'Unique Field:'
  end
  object Label10: TLabel
    Left = 6
    Top = 113
    Width = 83
    Height = 12
    Caption = 'SQL for from table'
  end
  object JvDBGrid1: TJvDBGrid
    Left = 6
    Top = 174
    Width = 355
    Height = 223
    Hint = 'From Table'
    DataSource = DataForm.FromQuerySource1
    ParentShowHint = False
    ReadOnly = True
    ShowHint = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -10
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    SelectColumnsDialogStrings.Caption = 'Select columns'
    SelectColumnsDialogStrings.OK = '&OK'
    SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
    EditControls = <>
    RowsHeight = 16
    TitleRowHeight = 16
  end
  object FromDatabase: TEdit
    Left = 108
    Top = 6
    Width = 127
    Height = 20
    TabOrder = 1
  end
  object FromUserName: TEdit
    Left = 108
    Top = 29
    Width = 127
    Height = 20
    TabOrder = 2
  end
  object FromPassword: TEdit
    Left = 108
    Top = 51
    Width = 127
    Height = 20
    PasswordChar = '*'
    TabOrder = 3
  end
  object FromServerName: TEdit
    Left = 108
    Top = 74
    Width = 127
    Height = 20
    TabOrder = 4
  end
  object FromTable: TEdit
    Left = 234
    Top = 107
    Width = 127
    Height = 20
    TabOrder = 5
  end
  object JvBitBtn1: TJvBitBtn
    Left = 624
    Top = 151
    Width = 122
    Height = 19
    Caption = 'Connect to servers'
    TabOrder = 7
    OnClick = JvBitBtn1Click
    HotTrackFont.Charset = DEFAULT_CHARSET
    HotTrackFont.Color = clWindowText
    HotTrackFont.Height = -10
    HotTrackFont.Name = 'Tahoma'
    HotTrackFont.Style = []
  end
  object ToDatabase: TEdit
    Left = 493
    Top = 6
    Width = 127
    Height = 20
    TabOrder = 8
  end
  object ToUserName: TEdit
    Left = 493
    Top = 29
    Width = 127
    Height = 20
    TabOrder = 9
  end
  object ToPassword: TEdit
    Left = 493
    Top = 51
    Width = 127
    Height = 20
    PasswordChar = '*'
    TabOrder = 10
  end
  object ToServerName: TEdit
    Left = 493
    Top = 74
    Width = 127
    Height = 20
    TabOrder = 11
  end
  object JvDBGrid2: TJvDBGrid
    Left = 391
    Top = 174
    Width = 355
    Height = 223
    Hint = 'To Table'
    DataSource = DataForm.ToQuerySource1
    ParentShowHint = False
    ReadOnly = True
    ShowHint = True
    TabOrder = 13
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -10
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    SelectColumnsDialogStrings.Caption = 'Select columns'
    SelectColumnsDialogStrings.OK = '&OK'
    SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
    EditControls = <>
    RowsHeight = 16
    TitleRowHeight = 16
  end
  object OutputLog: TJvMemo
    Left = 6
    Top = 400
    Width = 679
    Height = 64
    Lines.Strings = (
      '')
    ScrollBars = ssVertical
    TabOrder = 14
    WordWrap = False
  end
  object JvBitBtn3: TJvBitBtn
    Left = 691
    Top = 488
    Width = 57
    Height = 25
    TabOrder = 15
    Kind = bkClose
    HotTrackFont.Charset = DEFAULT_CHARSET
    HotTrackFont.Color = clWindowText
    HotTrackFont.Height = -10
    HotTrackFont.Name = 'Tahoma'
    HotTrackFont.Style = []
  end
  object JvBitBtn4: TJvBitBtn
    Left = 362
    Top = 240
    Width = 26
    Height = 19
    Hint = 'Compare Right to Left'
    Caption = '>>'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 16
    OnClick = JvBitBtn4Click
    HotTrackFont.Charset = DEFAULT_CHARSET
    HotTrackFont.Color = clWindowText
    HotTrackFont.Height = -10
    HotTrackFont.Name = 'Tahoma'
    HotTrackFont.Style = []
  end
  object FromUniqueField: TEdit
    Left = 493
    Top = 107
    Width = 127
    Height = 20
    TabOrder = 6
  end
  object SQLEdit: TMemo
    Left = 6
    Top = 129
    Width = 614
    Height = 41
    Hint = 
      'SQL for from table the fields in the output must be identicle as' +
      ' the Table.'
    ParentShowHint = False
    ScrollBars = ssVertical
    ShowHint = True
    TabOrder = 12
  end
  object SQL: TMemo
    Left = 6
    Top = 464
    Width = 679
    Height = 51
    ScrollBars = ssVertical
    TabOrder = 17
  end
  object Button1: TButton
    Left = 691
    Top = 439
    Width = 57
    Height = 25
    Caption = 'Save SQL'
    TabOrder = 18
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 691
    Top = 403
    Width = 57
    Height = 25
    Caption = 'Save log'
    TabOrder = 19
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 691
    Top = 463
    Width = 57
    Height = 25
    Caption = 'Run SQL'
    TabOrder = 20
    OnClick = Button3Click
  end
  object MainMenu1: TMainMenu
    Left = 848
    Top = 456
    object File1: TMenuItem
      Caption = 'Help'
      object About1: TMenuItem
        Caption = 'About'
        OnClick = About1Click
      end
    end
  end
  object SaveDialog1: TSaveDialog
    DefaultExt = 'txt'
    Filter = 'txt|*.txt|All Files|*.*'
    Left = 544
    Top = 456
  end
end