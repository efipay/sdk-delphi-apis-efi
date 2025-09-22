object ViewPixRetryAutomaticCharge: TViewPixRetryAutomaticCharge
  Left = 0
  Top = 0
  Caption = 'Modal da Requisi'#231#227'o'
  ClientHeight = 153
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
    Height = 153
    Align = alClient
    Caption = '*Campos Obrigat'#243'rios'
    TabOrder = 0
    ExplicitHeight = 103
    object Label1: TLabel
      Left = 6
      Top = 22
      Width = 92
      Height = 13
      Caption = '*Identificador :txid'
    end
    object Label2: TLabel
      Left = 6
      Top = 69
      Width = 113
      Height = 13
      Caption = '*Data - "AAAA-MM-DD"'
    end
    object txtTXID: TEdit
      Left = 6
      Top = 41
      Width = 571
      Height = 21
      TabOrder = 0
    end
    object btnCancelRequest: TButton
      Left = 6
      Top = 114
      Width = 280
      Height = 32
      Caption = 'Cancelar a Requisi'#231#227'o'
      TabOrder = 2
      OnClick = btnCancelRequestClick
    end
    object btnConfirmRequest: TButton
      Left = 292
      Top = 114
      Width = 285
      Height = 32
      Caption = 'Confirmar a Requisi'#231#227'o'
      TabOrder = 1
      OnClick = btnConfirmRequestClick
    end
    object txtData: TEdit
      Left = 6
      Top = 87
      Width = 571
      Height = 21
      TabOrder = 3
    end
  end
end
