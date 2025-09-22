object ViewOfCancel: TViewOfCancel
  Left = 0
  Top = 0
  Caption = 'Modal da Requisi'#231#227'o'
  ClientHeight = 103
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
    Height = 103
    Align = alClient
    Caption = '*Campos Obrigat'#243'rios'
    TabOrder = 0
    ExplicitHeight = 146
    object Label1: TLabel
      Left = 8
      Top = 25
      Width = 139
      Height = 13
      Caption = '*Identificador de Pagamento'
    end
    object txtIDPagamento: TEdit
      Left = 4
      Top = 41
      Width = 576
      Height = 21
      TabOrder = 0
    end
    object btnConfirmRequest: TButton
      Left = 295
      Top = 68
      Width = 285
      Height = 31
      Caption = 'Confirmar a Requisi'#231#227'o'
      TabOrder = 1
      OnClick = btnConfirmRequestClick
    end
    object btnCancelRequest: TButton
      Left = 4
      Top = 67
      Width = 285
      Height = 32
      Caption = 'Cancelar a Requisi'#231#227'o'
      TabOrder = 2
      OnClick = btnCancelRequestClick
    end
  end
end
