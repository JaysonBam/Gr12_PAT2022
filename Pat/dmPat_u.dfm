object dmPat: TdmPat
  Height = 336
  Width = 390
  object tblUsers: TADOTable
    Connection = conPat
    CursorType = ctStatic
    TableName = 'tblUsers'
    Left = 112
    Top = 32
  end
  object qry: TADOQuery
    Connection = conPat
    Parameters = <>
    Left = 272
    Top = 24
  end
  object conPat: TADOConnection
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=E:\Pat 2022\dbData.' +
      'mdb;Mode=ReadWrite;Persist Security Info=False'
    LoginPrompt = False
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 8
    Top = 120
  end
  object tblRel: TADOTable
    Connection = conPat
    TableName = 'tblRelationship'
    Left = 112
    Top = 88
  end
  object qry2: TADOQuery
    Connection = conPat
    Parameters = <>
    Left = 272
    Top = 80
  end
  object tblAss: TADOTable
    Connection = conPat
    Left = 112
    Top = 144
  end
  object dsInfo: TDataSource
    DataSet = qryInfo
    Left = 320
    Top = 152
  end
  object qryInfo: TADOQuery
    Connection = conPat
    Parameters = <>
    Left = 272
    Top = 144
  end
  object qryText: TADOQuery
    Connection = conPat
    Parameters = <>
    Left = 272
    Top = 208
  end
  object dsText: TDataSource
    DataSet = qryText
    Left = 320
    Top = 208
  end
  object tblInvoice: TADOTable
    Connection = conPat
    CursorType = ctStatic
    TableName = 'tblInvoice'
    Left = 112
    Top = 208
  end
  object tblReturn: TADOTable
    Connection = conPat
    CursorType = ctStatic
    TableName = 'tblReturn'
    Left = 112
    Top = 280
  end
end
