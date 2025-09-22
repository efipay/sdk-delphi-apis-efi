object ViewPixUpdateRecurrence: TViewPixUpdateRecurrence
  Left = 0
  Top = 0
  Caption = 'Modal da Requisi'#231#227'o'
  ClientHeight = 270
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
    Height = 270
    Align = alClient
    Caption = '*Campos Obrigat'#243'rios'
    TabOrder = 0
    object Label2: TLabel
      Left = 4
      Top = 21
      Width = 100
      Height = 13
      Caption = '*Identificador :idRec'
    end
    object GroupBox1: TGroupBox
      Left = 3
      Top = 88
      Width = 578
      Height = 45
      Caption = 'Calend'#225'rio - "AAAA-MM-DD"'
      TabOrder = 0
      object Label4: TLabel
        Left = 7
        Top = 18
        Width = 53
        Height = 13
        Caption = 'Data Inicial'
      end
      object txtDataInicial: TEdit
        Left = 70
        Top = 15
        Width = 505
        Height = 21
        TabOrder = 0
      end
    end
    object GroupBox2: TGroupBox
      Left = 3
      Top = 136
      Width = 86
      Height = 43
      Caption = 'Status'
      TabOrder = 1
      object boolStatus: TCheckBox
        Left = 7
        Top = 19
        Width = 106
        Height = 17
        Caption = 'Cancelada'
        Color = 6132468
        ParentColor = False
        TabOrder = 0
      end
    end
    object GroupBox4: TGroupBox
      Left = 4
      Top = 182
      Width = 577
      Height = 43
      Caption = 'Dados da Jornada'
      TabOrder = 2
      object Label11: TLabel
        Left = 6
        Top = 20
        Width = 23
        Height = 13
        Caption = 'TXID'
      end
      object txtTXID: TEdit
        Left = 35
        Top = 17
        Width = 539
        Height = 21
        TabOrder = 0
      end
    end
    object btnConfirmRequest: TButton
      Left = 290
      Top = 231
      Width = 291
      Height = 32
      Caption = 'Confirmar a Requisi'#231#227'o'
      TabOrder = 3
      OnClick = btnConfirmRequestClick
    end
    object btnCancelRequest: TButton
      Left = 3
      Top = 231
      Width = 280
      Height = 32
      Caption = 'Cancelar a Requisi'#231#227'o'
      TabOrder = 4
      OnClick = btnCancelRequestClick
    end
    object GroupBox5: TGroupBox
      Left = 3
      Top = 40
      Width = 577
      Height = 45
      Caption = 'Devedor'
      TabOrder = 5
      object Label1: TLabel
        Left = 7
        Top = 17
        Width = 27
        Height = 13
        Caption = 'Nome'
      end
      object txtNome: TEdit
        Left = 40
        Top = 14
        Width = 534
        Height = 21
        TabOrder = 0
      end
    end
    object GroupBox6: TGroupBox
      Left = 95
      Top = 136
      Width = 485
      Height = 43
      Caption = 'Location'
      TabOrder = 6
      object Label10: TLabel
        Left = 7
        Top = 20
        Width = 11
        Height = 13
        Caption = 'ID'
      end
      object txtLoc: TEdit
        Left = 24
        Top = 17
        Width = 458
        Height = 21
        TabOrder = 0
      end
    end
    object txtIdRec: TEdit
      Left = 110
      Top = 18
      Width = 470
      Height = 21
      TabOrder = 7
    end
  end
end
