unit ufrmPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, Grids, DBGrids, ExtCtrls, DBCtrls, Buttons;

type
  TfrmPrincipal = class(TForm)
    dbgListas: TDBGrid;
    dtsListas: TDataSource;
    dbgTarefas: TDBGrid;
    dtsTarefas: TDataSource;
    pnFundo: TPanel;
    pnListas: TPanel;
    pnTarefas: TPanel;
    Panel1: TPanel;
    btnIncluirLista: TSpeedButton;
    btnAlterarLista: TSpeedButton;
    btnExcluirLista: TSpeedButton;
    btnSalvarLista: TSpeedButton;
    procedure btnIncluirListaClick(Sender: TObject);
    procedure btnAlterarListaClick(Sender: TObject);
    procedure btnSalvarListaClick(Sender: TObject);
    procedure btnExcluirListaClick(Sender: TObject);
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

procedure TfrmPrincipal.btnIncluirListaClick(Sender: TObject);
begin
  dtsListas.DataSet.Append;
end;

procedure TfrmPrincipal.btnAlterarListaClick(Sender: TObject);
begin
  dtsListas.DataSet.Edit;
end;

procedure TfrmPrincipal.btnSalvarListaClick(Sender: TObject);
begin
  dtsListas.DataSet.Post;
end;

procedure TfrmPrincipal.btnExcluirListaClick(Sender: TObject);
begin
  dtsListas.DataSet.Delete;
end;

end.
