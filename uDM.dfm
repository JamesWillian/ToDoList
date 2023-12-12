object DM: TDM
  OldCreateOrder = False
  Left = 343
  Top = 786
  Height = 240
  Width = 274
  object SQLConn: TSQLConnection
    ConnectionName = 'IBConnection'
    DriverName = 'Interbase'
    GetDriverFunc = 'getSQLDriverINTERBASE'
    LibraryName = 'dbexpint.dll'
    LoginPrompt = False
    Params.Strings = (
      'DriverName=Interbase'
      'Database=C:\To-do List\DB.fdb'
      'RoleName=RoleName'
      'User_Name=SYSDBA'
      'Password=masterkey'
      'ServerCharSet='
      'SQLDialect=3'
      'ErrorResourceFile='
      'LocaleCode=0000'
      'BlobSize=-1'
      'CommitRetain=False'
      'WaitOnLocks=True'
      'Interbase TransIsolation=ReadCommited'
      'Trim Char=False')
    VendorLib = 'gds32.dll'
    Connected = True
    Left = 32
    Top = 8
  end
  object qryListas: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select'
      '    L.ID_LISTA, l.NOME_LISTA'
      'from LISTAS L')
    SQLConnection = SQLConn
    Left = 32
    Top = 56
    object qryListasID_LISTA: TFMTBCDField
      FieldName = 'ID_LISTA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Precision = 15
      Size = 0
    end
    object qryListasNOME_LISTA: TStringField
      FieldName = 'NOME_LISTA'
      Required = True
      Size = 50
    end
  end
  object cdsListas: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    ProviderName = 'dspListas'
    Left = 144
    Top = 56
    object cdsListasID_LISTA: TFMTBCDField
      DisplayLabel = 'C'#243'digo'
      DisplayWidth = 10
      FieldName = 'ID_LISTA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Precision = 15
      Size = 0
    end
    object cdsListasNOME_LISTA: TStringField
      DisplayLabel = 'Lista'
      DisplayWidth = 30
      FieldName = 'NOME_LISTA'
      Required = True
      Size = 50
    end
    object cdsListasqryTarefas: TDataSetField
      FieldName = 'qryTarefas'
      Visible = False
    end
  end
  object dspListas: TDataSetProvider
    DataSet = qryListas
    Left = 88
    Top = 56
  end
  object qryTarefas: TSQLQuery
    DataSource = dtsRelac
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select'
      
        '    T.ID_LISTA, T.ID_TAREFA, T.TITULO, T.DESCRICAO, T.CONCLUIDA_' +
        'EM'
      'from TAREFAS T')
    SQLConnection = SQLConn
    Left = 32
    Top = 120
    object qryTarefasID_LISTA: TFMTBCDField
      FieldName = 'ID_LISTA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Precision = 15
      Size = 0
    end
    object qryTarefasID_TAREFA: TFMTBCDField
      FieldName = 'ID_TAREFA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Precision = 15
      Size = 0
    end
    object qryTarefasTITULO: TStringField
      FieldName = 'TITULO'
      Required = True
      Size = 25
    end
    object qryTarefasDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Required = True
      Size = 100
    end
    object qryTarefasCONCLUIDA_EM: TDateField
      FieldName = 'CONCLUIDA_EM'
    end
  end
  object cdsTarefas: TClientDataSet
    Active = True
    Aggregates = <>
    DataSetField = cdsListasqryTarefas
    Params = <>
    Left = 144
    Top = 120
    object cdsTarefasID_LISTA: TFMTBCDField
      DisplayLabel = 'C'#243'd. Lista'
      DisplayWidth = 10
      FieldName = 'ID_LISTA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Precision = 15
      Size = 0
    end
    object cdsTarefasID_TAREFA: TFMTBCDField
      DisplayLabel = 'C'#243'd. Tarefa'
      DisplayWidth = 10
      FieldName = 'ID_TAREFA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Precision = 15
      Size = 0
    end
    object cdsTarefasTITULO: TStringField
      DisplayLabel = 'T'#237'tulo'
      FieldName = 'TITULO'
      Required = True
      Size = 25
    end
    object cdsTarefasDESCRICAO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      DisplayWidth = 60
      FieldName = 'DESCRICAO'
      Required = True
      Size = 100
    end
    object cdsTarefasCONCLUIDA_EM: TDateField
      DisplayLabel = 'Conclu'#237'da Em'
      FieldName = 'CONCLUIDA_EM'
    end
  end
  object dspTarefas: TDataSetProvider
    DataSet = qryTarefas
    Left = 88
    Top = 120
  end
  object dtsRelac: TDataSource
    DataSet = qryListas
    Left = 208
    Top = 56
  end
end
