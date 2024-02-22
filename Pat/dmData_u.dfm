object dmData: TdmData
  Height = 219
  Width = 367
  object Qry: TADOQuery
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM tblUsers')
    Left = 232
    Top = 8
  end
  object tblUsers: TADOTable
    Connection = ADOConnection1
    CursorType = ctStatic
    TableName = 'tblUsers'
    Left = 96
    Top = 32
  end
  object ADOConnection1: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;User ID=Admin;Data Source=D:\Pa' +
      't 2022\dbData.mdb;Mode=ReadWrite;Persist Security Info=False;Jet' +
      ' OLEDB:System database="";Jet OLEDB:Registry Path="";Jet OLEDB:D' +
      'atabase Password="";Jet OLEDB:Engine Type=5;Jet OLEDB:Database L' +
      'ocking Mode=1;Jet OLEDB:Global Partial Bulk Ops=2;Jet OLEDB:Glob' +
      'al Bulk Transactions=1;Jet OLEDB:New Database Password="";Jet OL' +
      'EDB:Create System Database=False;Jet OLEDB:Encrypt Database=Fals' +
      'e;Jet OLEDB:Don'#39't Copy Locale on Compact=False;Jet OLEDB:Compact' +
      ' Without Replica Repair=False;Jet OLEDB:SFP=False'
    LoginPrompt = False
    Mode = cmReadWrite
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 24
    Top = 96
  end
  object tblAss: TADOTable
    Connection = ADOConnection1
    TableName = 'tblAssignment'
    Left = 96
    Top = 88
  end
  object tblRel: TADOTable
    Connection = ADOConnection1
    TableName = 'tblRelationship'
    Left = 96
    Top = 144
  end
  object qry2: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 232
    Top = 64
  end
  object dsQry3: TDataSource
    DataSet = qry3
    Left = 296
    Top = 8
  end
  object qry3: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 232
    Top = 128
  end
end
