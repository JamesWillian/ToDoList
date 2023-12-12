unit ufrmPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, Grids, DBGrids, ExtCtrls, DBCtrls;

type
  TfrmPrincipal = class(TForm)
    dbgListas: TDBGrid;
    dtsListas: TDataSource;
    dbgTarefas: TDBGrid;
    dtsTarefas: TDataSource;
    pnFundo: TPanel;
    pnListas: TPanel;
    pnTarefas: TPanel;
    DBNavigator1: TDBNavigator;
    DBNavigator2: TDBNavigator;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

uses
  uDM;

end.
