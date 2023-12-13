unit uDM;

interface

uses
  SysUtils, Classes, DBXpress, FMTBcd, DB, SqlExpr, Provider, DBClient,
  Messages, Dialogs;

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
    cdsTarefasMAX_ID_TAREFA: TAggregateField;
    procedure cdsTarefasNewRecord(DataSet: TDataSet);
    procedure cdsTarefasAfterPost(DataSet: TDataSet);
    procedure cdsTarefasBeforePost(DataSet: TDataSet);
    procedure cdsListasBeforeDelete(DataSet: TDataSet);
    procedure cdsListasAfterPost(DataSet: TDataSet);
    procedure cdsListasNewRecord(DataSet: TDataSet);
    procedure cdsListasBeforePost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure ExcluirLista;
    procedure SalvarLista;                     

  end;

var
  DM: TDM;

implementation

uses Math, Variants;

{$R *.dfm}

procedure TDM.cdsTarefasNewRecord(DataSet: TDataSet);
begin
  cdsTarefasID_LISTA.AsInteger := cdsListasID_LISTA.AsInteger;

  if VarIsNull(cdsTarefasMAX_ID_TAREFA.Value) then
    cdsTarefasID_TAREFA.AsInteger := 1
  else
    cdsTarefasID_TAREFA.AsInteger := cdsTarefasMAX_ID_TAREFA.Value + 1;
end;

procedure TDM.ExcluirLista;
begin
  cdsListas.Delete;

  if cdsListas.ChangeCount > 0 then
    cdsListas.ApplyUpdates(0);
end;

procedure TDM.SalvarLista;
var
  vTrans: TTransactionDesc;
begin
  try
    
    if cdsListas.State <> dsBrowse then
      cdsListas.Post;

    vTrans.TransactionID := 1;
    vTrans.IsolationLevel := xilREADCOMMITTED;

    SQLConn.StartTransaction(vTrans);

    if (cdsListas.ApplyUpdates(0) = 0) then
      SQLConn.Commit(vTrans)
    else
      SQLConn.Rollback(vTrans);

    cdsListas.Refresh;  
  except
    on E:Exception do begin
      ShowMessage(E.Message);
      Abort;
    end;
  end;
end;

procedure TDM.cdsTarefasAfterPost(DataSet: TDataSet);
begin
  cdsListas.Post;
end;

procedure TDM.cdsTarefasBeforePost(DataSet: TDataSet);
begin
  try
    if cdsTarefasTITULO.AsString = '' then
      raise Exception.Create('Informe o Título da Tarefa');

    if cdsTarefasDESCRICAO.AsString = '' then
      raise Exception.Create('Informe a Descrição da Tarefa');
  except
    on E:Exception do begin
      ShowMessage(E.Message);
      Abort;
    end;
  end;
end;

procedure TDM.cdsListasBeforeDelete(DataSet: TDataSet);
begin
  try
    if not cdsTarefas.IsEmpty then
      raise Exception.Create('Não é possível excluir esta lista. Ela contêm tarefas.');
  except
    on E:Exception do begin
      ShowMessage(E.Message);
      Abort;
    end;
  end;
end;

procedure TDM.cdsListasAfterPost(DataSet: TDataSet);
begin
  if (cdsListas.ChangeCount > 0) then
    SalvarLista;
end;

procedure TDM.cdsListasNewRecord(DataSet: TDataSet);
begin
  cdsListasID_LISTA.AsInteger := -1;
end;

procedure TDM.cdsListasBeforePost(DataSet: TDataSet);
begin
  try
    if cdsListasNOME_LISTA.AsString = '' then
      raise Exception.Create('Informe o nome da lista.');
  except
    on E:Exception do begin
      ShowMessage(E.Message);
      Abort;
    end;
  end;
end;

end.
