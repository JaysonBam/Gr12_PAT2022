unit dmData_u;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TdmData = class(TDataModule)
    Qry: TADOQuery;
    tblUsers: TADOTable;
    ADOConnection1: TADOConnection;
    tblAss: TADOTable;
    tblRel: TADOTable;
    qry2: TADOQuery;
    dsQry3: TDataSource;
    qry3: TADOQuery;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmData: TdmData;

implementation

{$R *.dfm}

end.
