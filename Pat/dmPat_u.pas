unit dmPat_u;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TdmPat = class(TDataModule)
    tblUsers: TADOTable;
    qry: TADOQuery;
    conPat: TADOConnection;
    tblRel: TADOTable;
    qry2: TADOQuery;
    tblAss: TADOTable;
    dsInfo: TDataSource;
    qryInfo: TADOQuery;
    qryText: TADOQuery;
    dsText: TDataSource;
    tblInvoice: TADOTable;
    tblReturn: TADOTable;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmPat: TdmPat;

implementation

{$R *.dfm}

end.
