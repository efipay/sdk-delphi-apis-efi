object ViewCreateImmediateCharge: TViewCreateImmediateCharge
  Left = 0
  Top = 0
  Caption = 'Modal da Requisi'#231#227'o'
  ClientHeight = 261
  ClientWidth = 584
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
  object GroupBox3: TGroupBox
    Left = 0
    Top = 0
    Width = 584
    Height = 261
    Align = alClient
    Caption = 'Body da Requisi'#231#227'o - *Campos Obrigat'#243'rios'
    TabOrder = 0
    object btnConfirmRequest: TButton
      Left = 290
      Top = 222
      Width = 291
      Height = 32
      Caption = 'Confirmar a Requisi'#231#227'o'
      TabOrder = 5
      OnClick = btnConfirmRequestClick
    end
    object btnCancelRequest: TButton
      Left = 7
      Top = 222
      Width = 280
      Height = 32
      Caption = 'Cancelar a Requisi'#231#227'o'
      TabOrder = 6
      OnClick = btnCancelRequestClick
    end
    object gbDevedor: TGroupBox
      Left = 7
      Top = 16
      Width = 574
      Height = 73
      Caption = 'Devedor'
      TabOrder = 0
      object Label1: TLabel
        Left = 16
        Top = 17
        Width = 27
        Height = 13
        Caption = 'Nome'
      end
      object Label2: TLabel
        Left = 16
        Top = 45
        Width = 19
        Height = 13
        Caption = 'CPF'
      end
      object txtName: TEdit
        Left = 56
        Top = 14
        Width = 512
        Height = 21
        TabOrder = 0
      end
      object txtCpf: TEdit
        Left = 56
        Top = 42
        Width = 512
        Height = 21
        TabOrder = 1
      end
    end
    object GroupBox1: TGroupBox
      Left = 7
      Top = 90
      Width = 280
      Height = 43
      Caption = '*Calend'#225'rio - Ex. 3600 (1 hora)'
      TabOrder = 1
      object Label4: TLabel
        Left = 5
        Top = 17
        Width = 47
        Height = 13
        Caption = 'Expira'#231#227'o'
      end
      object txtExpiration: TEdit
        Left = 56
        Top = 15
        Width = 219
        Height = 21
        TabOrder = 0
        Text = '3600'
      end
    end
    object gbValor: TGroupBox
      Left = 290
      Top = 90
      Width = 291
      Height = 43
      Caption = '*Valor - Ex. 5.00'
      TabOrder = 2
      object Label3: TLabel
        Left = 13
        Top = 18
        Width = 36
        Height = 13
        Caption = 'Original'
      end
      object txtValue: TEdit
        Left = 54
        Top = 15
        Width = 231
        Height = 21
        TabOrder = 0
      end
    end
    object GroupBox2: TGroupBox
      Left = 7
      Top = 134
      Width = 574
      Height = 43
      Caption = '*Chave Pix - Ex. a1f4102e-a446-4a57-bcce-6fa48899c1d1'
      TabOrder = 3
      object txtKey: TEdit
        Left = 5
        Top = 16
        Width = 563
        Height = 21
        TabOrder = 0
      end
    end
    object GroupBox4: TGroupBox
      Left = 7
      Top = 177
      Width = 574
      Height = 43
      Caption = 
        'Solicita'#231#227'o do Pagador - Ex. Informe o n'#250'mero ou identificador d' +
        'o pedido.'
      TabOrder = 4
      object txtPayerRequest: TEdit
        Left = 5
        Top = 17
        Width = 563
        Height = 21
        TabOrder = 0
      end
    end
  end
end
