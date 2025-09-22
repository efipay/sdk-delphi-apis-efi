object OfConfigUpdate: TOfConfigUpdate
  Left = 0
  Top = 0
  Caption = 'Modal da Requisi'#231#227'o'
  ClientHeight = 251
  ClientWidth = 635
  Color = 6001140
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OnCreate = FormCreate
  TextHeight = 13
  object GroupBox1: TGroupBox
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 629
    Height = 240
    Align = alTop
    Caption = 'Body da Requisi'#231#227'o - *Campos Obrigat'#243'rios'
    TabOrder = 0
    object Label1: TLabel
      AlignWithMargins = True
      Left = 5
      Top = 18
      Width = 619
      Height = 13
      Align = alTop
      Caption = '*Url de redirecionamento'
      ExplicitWidth = 120
    end
    object Label2: TLabel
      AlignWithMargins = True
      Left = 5
      Top = 64
      Width = 619
      Height = 13
      Align = alTop
      Caption = '*Url do Webhook'
      ExplicitWidth = 82
    end
    object Label3: TLabel
      AlignWithMargins = True
      Left = 5
      Top = 110
      Width = 619
      Height = 13
      Align = alTop
      Caption = 'Configura'#231#227'o de seguran'#231'a do Webhook (Padr'#227'o = mTLS):'
      ExplicitWidth = 283
    end
    object labelHash: TLabel
      AlignWithMargins = True
      Left = 5
      Top = 152
      Width = 619
      Height = 13
      Align = alTop
      Caption = 'Digite o Hash'
      Visible = False
      ExplicitWidth = 63
    end
    object txtRedirectUrl: TEdit
      AlignWithMargins = True
      Left = 5
      Top = 37
      Width = 619
      Height = 21
      Align = alTop
      TabOrder = 0
    end
    object txtWebhook: TEdit
      AlignWithMargins = True
      Left = 5
      Top = 83
      Width = 619
      Height = 21
      Align = alTop
      TabOrder = 1
    end
    object optHash: TCheckBox
      AlignWithMargins = True
      Left = 5
      Top = 129
      Width = 619
      Height = 17
      Align = alTop
      Caption = 'Usar Hash'
      TabOrder = 2
      OnClick = optHashClick
    end
    object txtHash: TEdit
      AlignWithMargins = True
      Left = 5
      Top = 171
      Width = 619
      Height = 21
      TabOrder = 3
      Visible = False
    end
    object btnCancelar: TButton
      Left = 5
      Top = 210
      Width = 265
      Height = 25
      Caption = 'Cancelar'
      TabOrder = 4
      OnClick = btnCancelarClick
    end
    object btnUpdateConfig: TButton
      Left = 359
      Top = 210
      Width = 265
      Height = 25
      Caption = 'Confirmar'
      TabOrder = 5
      OnClick = btnUpdateConfigClick
    end
  end
end
