object frmPrincipal: TfrmPrincipal
  Left = 631
  Top = 125
  Width = 1305
  Height = 675
  VertScrollBar.Smooth = True
  VertScrollBar.Style = ssFlat
  Caption = 'To-Do List'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object pnFundo: TPanel
    Left = 0
    Top = 0
    Width = 1289
    Height = 636
    Align = alClient
    TabOrder = 0
    object pnListas: TPanel
      Left = 1
      Top = 1
      Width = 312
      Height = 634
      Align = alLeft
      TabOrder = 0
      object dbgListas: TDBGrid
        Left = 1
        Top = 1
        Width = 310
        Height = 575
        Align = alClient
        DataSource = dtsListas
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
      end
      object Panel1: TPanel
        Left = 1
        Top = 576
        Width = 310
        Height = 57
        Align = alBottom
        TabOrder = 1
        object btnIncluirLista: TSpeedButton
          Left = 7
          Top = 7
          Width = 66
          Height = 43
          Caption = 'Incluir'
          OnClick = btnIncluirListaClick
        end
        object btnAlterarLista: TSpeedButton
          Left = 79
          Top = 6
          Width = 66
          Height = 43
          Caption = 'Alterar'
          OnClick = btnAlterarListaClick
        end
        object btnExcluirLista: TSpeedButton
          Left = 159
          Top = 6
          Width = 66
          Height = 43
          Caption = 'Excluir'
          OnClick = btnExcluirListaClick
        end
        object btnSalvarLista: TSpeedButton
          Left = 231
          Top = 6
          Width = 66
          Height = 43
          Caption = 'Salvar'
          OnClick = btnSalvarListaClick
        end
      end
    end
    object pnTarefas: TPanel
      Left = 313
      Top = 1
      Width = 975
      Height = 634
      Align = alClient
      Caption = 'pnTarefas'
      TabOrder = 1
      object dbgTarefas: TDBGrid
        Left = 1
        Top = 1
        Width = 973
        Height = 632
        Align = alClient
        DataSource = dtsTarefas
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
      end
    end
  end
  object dtsListas: TDataSource
    DataSet = DM.cdsListas
    Left = 256
    Top = 24
  end
  object dtsTarefas: TDataSource
    DataSet = DM.cdsTarefas
    Left = 1152
    Top = 32
  end
end
