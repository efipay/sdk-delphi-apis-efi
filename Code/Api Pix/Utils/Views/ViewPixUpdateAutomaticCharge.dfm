object ViewPixUpdateAutomaticCharge: TViewPixUpdateAutomaticCharge
  Left = 0
  Top = 0
  Caption = 'Modal da Requisi'#231#227'o'
  ClientHeight = 127
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
    Height = 127
    Align = alClient
    Caption = '*Campos Obrigat'#243'rios'
    TabOrder = 0
    object Label2: TLabel
      Left = 10
      Top = 21
      Width = 92
      Height = 13
      Caption = '*Identificador :txid'
    end
    object GroupBox2: TGroupBox
      Left = 3
      Top = 40
      Width = 578
      Height = 43
      Caption = 'Status'
      TabOrder = 0
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
    object btnConfirmRequest: TButton
      Left = 289
      Top = 89
      Width = 291
      Height = 32
      Caption = 'Confirmar a Requisi'#231#227'o'
      TabOrder = 1
      OnClick = btnConfirmRequestClick
    end
    object btnCancelRequest: TButton
      Left = 3
      Top = 89
      Width = 280
      Height = 32
      Caption = 'Cancelar a Requisi'#231#227'o'
      TabOrder = 2
      OnClick = btnCancelRequestClick
    end
    object txtTXID: TEdit
      Left = 112
      Top = 18
      Width = 468
      Height = 21
      TabOrder = 3
    end
  end
end
