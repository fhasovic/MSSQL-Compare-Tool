object DataForm: TDataForm
  OldCreateOrder = False
  Height = 570
  Width = 808
  object FromConnection: TADConnection
    Params.Strings = (
      'DriverID=MSSQL2005')
    Left = 56
    Top = 40
  end
  object ToConnection: TADConnection
    Params.Strings = (
      'DriverID=MSSQL2005')
    Left = 512
    Top = 40
  end
  object ADPhysMSSQLDriverLink1: TADPhysMSSQLDriverLink
    Left = 440
    Top = 504
  end
  object ADGUIxWaitCursor1: TADGUIxWaitCursor
    Left = 584
    Top = 504
  end
  object FromQuery1: TADQuery
    Connection = FromConnection
    SQL.Strings = (
      'select * from tblBatch')
    Left = 56
    Top = 112
  end
  object FromQuerySource1: TDataSource
    DataSet = FromQuery1
    Left = 152
    Top = 112
  end
  object ToQuery1: TADQuery
    Connection = ToConnection
    Left = 512
    Top = 112
  end
  object ToQuerySource1: TDataSource
    DataSet = ToQuery1
    Left = 592
    Top = 112
  end
  object ToQuery2: TADQuery
    Connection = ToConnection
    Left = 512
    Top = 168
  end
  object AnydacMonitor: TADMoniRemoteClientLink
    Left = 304
    Top = 248
  end
end