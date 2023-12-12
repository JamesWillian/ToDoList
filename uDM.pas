unit uDM;

interface

uses
  SysUtils, Classes, DBXpress, FMTBcd, DB, SqlExpr, Provider, DBClient;

type
  TDM = class(TDataModule)
    SQLConn: TSQLConnection;
    qryListas: TSQLQuery;
    cdsListas: TClientDataSet;
    cdsListasID_LISTA: TFMTBCDField;
    cdsListasNOME_LISTA: TStringField;
    dspListas: TDataSetProvider;
    qryTarefas: TSQLQuery;
    cdsTarefas: TClientDataSet;
    dspTarefas: TDataSetProvider;
    qryTarefasID_LISTA: TFMTBCDField;
    qryTarefasID_TAREFA: TFMTBCDField;
    qryTarefasTITULO: TStringField;
    qryTarefasDESCRICAO: TStringField;
    qryTarefasCONCLUIDA_EM: TDateField;
    qryListasID_LISTA: TFMTBCDField;
    qryListasNOME_LISTA: TStringField;
    cdsTarefasID_LISTA: TFMTBCDField;
    cdsTarefasID_TAREFA: TFMTBCDField;
    cdsTarefasTITULO: TStringField;
    cdsTarefasDESCRICAO: TStringField;
    cdsTarefasCONCLUIDA_EM: TDateField;
    dtsRelac: TDataSource;
    cdsListasqryTarefas: TDataSetField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{$R *.dfm}

end.
