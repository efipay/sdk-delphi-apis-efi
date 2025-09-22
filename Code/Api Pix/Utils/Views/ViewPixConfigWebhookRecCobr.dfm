object ViewPixConfigWebhookRecCobr: TViewPixConfigWebhookRecCobr
  Left = 0
  Top = 0
  Caption = 'Modal da Requisi'#231#227'o'
  ClientHeight = 151
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
    Height = 151
    Align = alClient
    Caption = '*Campos Obrigat'#243'rios'
    TabOrder = 0
    object btnCancelRequest: TButton
      Left = 4
      Top = 114
      Width = 280
      Height = 32
      Caption = 'Cancelar a Requisi'#231#227'o'
      TabOrder = 1
      OnClick = btnCancelRequestClick
    end
    object btnConfirmRequest: TButton
      Left = 290
      Top = 114
      Width = 285
      Height = 32
      Caption = 'Confirmar a Requisi'#231#227'o'
      TabOrder = 0
      OnClick = btnConfirmRequestClick
    end
    object cbxSkipmtls: TCheckBox
      Left = 6
      Top = 88
      Width = 211
      Height = 17
      Caption = 'Pular valida'#231#227'o do mTLS'
      TabOrder = 2
    end
  end
  object gbBody: TGroupBox
    Left = 6
    Top = 17
    Width = 569
    Height = 63
    Caption = '*Body da Requisi'#231#227'o'
    TabOrder = 1
    object Label2: TLabel
      Left = 7
      Top = 16
      Width = 238
      Height = 13
      Caption = 'URL Webhook - Ex. https://exemplo-pix/webhook'
    end
    object txtWebhookURL: TEdit
      Left = 7
      Top = 35
      Width = 559
      Height = 21
      TabOrder = 0
    end
  end
end
