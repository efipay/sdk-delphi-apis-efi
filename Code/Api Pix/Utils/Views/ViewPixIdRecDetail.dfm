object ViewPixIdRecDetail: TViewPixIdRecDetail
  Left = 0
  Top = 0
  Caption = 'Modal da Requisi'#231#227'o'
  ClientHeight = 155
  ClientWidth = 584
  Color = 6001140
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OnCreate = FormCreate
  TextHeight = 13
  object GroupBox3: TGroupBox
    Left = 0
    Top = 0
    Width = 584
    Height = 155
    Align = alClient
    Caption = '*Campos Obrigat'#243'rios'
    TabOrder = 0
    ExplicitHeight = 103
    object Label1: TLabel
      Left = 6
      Top = 24
      Width = 100
      Height = 13
      Caption = '*Identificador :idRec'
    end
    object txtIdent: TEdit
      Left = 6
      Top = 41
      Width = 572
      Height = 21
      TabOrder = 0
    end
    object btnCancelRequest: TButton
      Left = 3
      Top = 120
      Width = 285
      Height = 32
      Caption = 'Cancelar a Requisi'#231#227'o'
      TabOrder = 2
      OnClick = btnCancelRequestClick
    end
    object btnConfirmRequest: TButton
      Left = 296
      Top = 120
      Width = 285
      Height = 32
      Caption = 'Confirmar a Requisi'#231#227'o'
      TabOrder = 1
      OnClick = btnConfirmRequestClick
    end
    object GroupBox1: TGroupBox
      Left = 3
      Top = 68
      Width = 578
      Height = 46
      Caption = 'Query Param'
      TabOrder = 3
      object Label2: TLabel
        Left = 163
        Top = 20
        Width = 23
        Height = 13
        Caption = 'TXID'
      end
      object txtTXID: TEdit
        Left = 192
        Top = 17
        Width = 383
        Height = 21
        TabOrder = 0
      end
      object boolJornada: TCheckBox
        Left = 6
        Top = 19
        Width = 139
        Height = 17
        Caption = 'Jornada 3 ou Jornada 4'
        Color = 6132468
        ParentColor = False
        TabOrder = 1
      end
    end
  end
end
