object AccountConfigWebhook: TAccountConfigWebhook
  Left = 0
  Top = 0
  Caption = 'Modal da Requisi'#231#227'o'
  ClientHeight = 196
  ClientWidth = 635
  Color = 6001140
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 629
    Height = 174
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
      Caption = '*Url do Webhook'
      ExplicitWidth = 82
    end
    object Label2: TLabel
      AlignWithMargins = True
      Left = 5
      Top = 64
      Width = 619
      Height = 13
      Align = alTop
      Caption = 'Chave'
      ExplicitWidth = 31
    end
    object txtUrl: TEdit
      AlignWithMargins = True
      Left = 5
      Top = 37
      Width = 619
      Height = 21
      Align = alTop
      TabOrder = 0
    end
    object btnCancelar: TButton
      Left = 5
      Top = 146
      Width = 265
      Height = 25
      Caption = 'Cancelar'
      TabOrder = 1
      OnClick = btnCancelarClick
    end
    object btnCadastro: TButton
      Left = 361
      Top = 146
      Width = 265
      Height = 25
      Caption = 'Cadastrar'
      TabOrder = 2
      OnClick = btnCadastroClick
    end
    object txtChave: TEdit
      AlignWithMargins = True
      Left = 5
      Top = 83
      Width = 619
      Height = 21
      Align = alTop
      CharCase = ecUpperCase
      TabOrder = 3
    end
  end
end
