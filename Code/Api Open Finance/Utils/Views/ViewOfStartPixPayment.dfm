object OfStartPixPayment: TOfStartPixPayment
  Left = 0
  Top = 0
  Caption = 'Modal da Requisi'#231#227'o'
  ClientHeight = 586
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
    Height = 582
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
      Caption = '*Id de idempot'#234'ncia ('#250'nico por transa'#231#227'o)'
      ExplicitWidth = 203
    end
    object Label10: TLabel
      Left = 10
      Top = 407
      Width = 30
      Height = 13
      Caption = '*Valor'
    end
    object Label11: TLabel
      Left = 325
      Top = 407
      Width = 69
      Height = 13
      Caption = 'C'#243'digo Cidade'
    end
    object Label12: TLabel
      Left = 10
      Top = 453
      Width = 78
      Height = 13
      Caption = 'Info ao pagador'
    end
    object Label13: TLabel
      Left = 325
      Top = 453
      Width = 47
      Height = 13
      Caption = 'Id Pr'#243'prio'
    end
    object txtIdempotency: TEdit
      AlignWithMargins = True
      Left = 5
      Top = 37
      Width = 619
      Height = 21
      Align = alTop
      TabOrder = 0
    end
    object GroupBox2: TGroupBox
      AlignWithMargins = True
      Left = 5
      Top = 64
      Width = 619
      Height = 161
      Align = alTop
      Caption = '*Pagador'
      TabOrder = 1
      object Label2: TLabel
        AlignWithMargins = True
        Left = 5
        Top = 18
        Width = 609
        Height = 13
        Align = alTop
        Caption = '*Id do participante'
        ExplicitWidth = 91
      end
      object Label3: TLabel
        AlignWithMargins = True
        Left = 5
        Top = 64
        Width = 609
        Height = 13
        Align = alTop
        Caption = '*Cpf'
        ExplicitWidth = 23
      end
      object labelCnpj: TLabel
        AlignWithMargins = True
        Left = 5
        Top = 110
        Width = 609
        Height = 13
        Align = alTop
        Caption = 'Cnpj'
        ExplicitWidth = 22
      end
      object txtIdParticipante: TEdit
        AlignWithMargins = True
        Left = 5
        Top = 37
        Width = 609
        Height = 21
        Align = alTop
        TabOrder = 0
      end
      object txtCpf: TEdit
        AlignWithMargins = True
        Left = 5
        Top = 83
        Width = 609
        Height = 21
        Align = alTop
        TabOrder = 1
      end
      object txtCnpj: TEdit
        AlignWithMargins = True
        Left = 5
        Top = 129
        Width = 609
        Height = 21
        Align = alTop
        TabOrder = 2
      end
    end
    object GroupBox3: TGroupBox
      AlignWithMargins = True
      Left = 5
      Top = 231
      Width = 619
      Height = 170
      Align = alTop
      Caption = '*Favorecido'
      TabOrder = 2
      object Label4: TLabel
        Left = 5
        Top = 16
        Width = 86
        Height = 13
        Caption = '*Codigo do Banco'
      end
      object Label5: TLabel
        Left = 320
        Top = 16
        Width = 44
        Height = 13
        Caption = '*Ag'#234'ncia'
      end
      object Label6: TLabel
        Left = 3
        Top = 62
        Width = 60
        Height = 13
        Caption = '*Documento'
      end
      object Label7: TLabel
        Left = 320
        Top = 62
        Width = 33
        Height = 13
        Caption = '*Nome'
      end
      object Label8: TLabel
        Left = 5
        Top = 108
        Width = 35
        Height = 13
        Caption = '*Conta'
      end
      object Label9: TLabel
        Left = 320
        Top = 108
        Width = 71
        Height = 13
        Caption = '*Tipo de conta'
      end
      object txtCodigoBanco: TEdit
        Left = 5
        Top = 35
        Width = 290
        Height = 21
        TabOrder = 0
      end
      object txtAgencia: TEdit
        Left = 320
        Top = 35
        Width = 290
        Height = 21
        TabOrder = 1
      end
      object txtDocumentoFavorecido: TEdit
        Left = 5
        Top = 81
        Width = 290
        Height = 21
        TabOrder = 2
      end
      object txtNome: TEdit
        Left = 320
        Top = 81
        Width = 290
        Height = 21
        TabOrder = 3
      end
      object txtConta: TEdit
        Left = 5
        Top = 127
        Width = 290
        Height = 21
        TabOrder = 4
      end
      object txtTipoConta: TEdit
        Left = 320
        Top = 127
        Width = 290
        Height = 21
        TabOrder = 5
      end
    end
    object txtValor: TEdit
      Left = 10
      Top = 426
      Width = 290
      Height = 21
      TabOrder = 3
    end
    object txtCodigoCidade: TEdit
      Left = 325
      Top = 426
      Width = 290
      Height = 21
      TabOrder = 4
    end
    object txtInfoPagador: TEdit
      Left = 10
      Top = 472
      Width = 290
      Height = 21
      TabOrder = 5
    end
    object txtIdProprio: TEdit
      Left = 325
      Top = 472
      Width = 290
      Height = 21
      TabOrder = 6
    end
    object btnCancelar: TButton
      Left = 10
      Top = 548
      Width = 265
      Height = 25
      Caption = 'Cancelar'
      TabOrder = 7
      OnClick = btnCancelarClick
    end
    object btnStartPayment: TButton
      Left = 350
      Top = 548
      Width = 265
      Height = 25
      Caption = 'Confirmar'
      TabOrder = 8
      OnClick = btnStartPaymentClick
    end
  end
end
