object OfListPixPayment: TOfListPixPayment
  Left = 0
  Top = 0
  Caption = 'Modal da Requisi'#231#227'o'
  ClientHeight = 389
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
    Height = 382
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
      Caption = '*Inicio - Ex. 2021-06-01T23:01:35Z'
      ExplicitWidth = 172
    end
    object Label2: TLabel
      AlignWithMargins = True
      Left = 5
      Top = 64
      Width = 619
      Height = 13
      Align = alTop
      Caption = '*Fim - Ex. 2021-06-01T23:01:35Z'
      ExplicitWidth = 163
    end
    object Label5: TLabel
      AlignWithMargins = True
      Left = 5
      Top = 110
      Width = 619
      Height = 13
      Align = alTop
      Caption = 'Status'
      ExplicitWidth = 31
    end
    object Label6: TLabel
      AlignWithMargins = True
      Left = 5
      Top = 156
      Width = 619
      Height = 13
      Align = alTop
      Caption = 'Identificador (Identificador do pagamento)'
      ExplicitWidth = 205
    end
    object Label7: TLabel
      AlignWithMargins = True
      Left = 5
      Top = 202
      Width = 619
      Height = 13
      Align = alTop
      Caption = 'Pagina'#231#227'o - P'#225'gina Atual'
      ExplicitWidth = 119
    end
    object Label8: TLabel
      AlignWithMargins = True
      Left = 5
      Top = 248
      Width = 619
      Height = 13
      Align = alTop
      Caption = 'Pagina'#231#227'o - Itens Por P'#225'gina'
      ExplicitWidth = 138
    end
    object txtInicio: TEdit
      AlignWithMargins = True
      Left = 5
      Top = 37
      Width = 619
      Height = 21
      Align = alTop
      TabOrder = 0
    end
    object txtFim: TEdit
      AlignWithMargins = True
      Left = 5
      Top = 83
      Width = 619
      Height = 21
      Align = alTop
      TabOrder = 1
    end
    object txtStatus: TEdit
      AlignWithMargins = True
      Left = 5
      Top = 129
      Width = 619
      Height = 21
      Align = alTop
      TabOrder = 2
    end
    object txtIdentificador: TEdit
      AlignWithMargins = True
      Left = 5
      Top = 175
      Width = 619
      Height = 21
      Align = alTop
      TabOrder = 3
    end
    object txtPGAtual: TEdit
      AlignWithMargins = True
      Left = 5
      Top = 221
      Width = 619
      Height = 21
      Align = alTop
      TabOrder = 4
    end
    object txtPGItens: TEdit
      AlignWithMargins = True
      Left = 5
      Top = 267
      Width = 619
      Height = 21
      Align = alTop
      TabOrder = 5
    end
    object btnCancelar: TButton
      Left = 5
      Top = 344
      Width = 265
      Height = 25
      Caption = 'Cancelar'
      Constraints.MaxWidth = 265
      Constraints.MinWidth = 265
      TabOrder = 6
      OnClick = btnCancelarClick
    end
    object btnListar: TButton
      Left = 359
      Top = 344
      Width = 265
      Height = 25
      Caption = 'Listar'
      TabOrder = 7
      OnClick = btnListarClick
    end
  end
end
