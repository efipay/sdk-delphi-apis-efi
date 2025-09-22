object ViewPixCreateRequestRecurrence: TViewPixCreateRequestRecurrence
  Left = 0
  Top = 0
  Caption = 'Modal da Requisi'#231#227'o'
  ClientHeight = 237
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
    Height = 237
    Align = alClient
    Caption = '*Campos Obrigat'#243'rios'
    TabOrder = 0
    object Label1: TLabel
      Left = 3
      Top = 18
      Width = 100
      Height = 13
      Caption = '*Identificador :idRec'
    end
    object txtIdRec: TEdit
      Left = 109
      Top = 15
      Width = 471
      Height = 21
      TabOrder = 0
    end
    object gbDevedor: TGroupBox
      Left = 3
      Top = 36
      Width = 577
      Height = 113
      Caption = '*Devedor'
      TabOrder = 1
      object Label2: TLabel
        Left = 9
        Top = 17
        Width = 38
        Height = 13
        Caption = 'Ag'#234'ncia'
      end
      object Label3: TLabel
        Left = 9
        Top = 41
        Width = 29
        Height = 13
        Caption = 'Conta'
      end
      object Label5: TLabel
        Left = 11
        Top = 65
        Width = 48
        Height = 13
        Caption = 'CPF/CNPJ'
      end
      object Label6: TLabel
        Left = 11
        Top = 89
        Width = 58
        Height = 13
        Caption = 'C'#243'digo ISPB'
      end
      object txtAgencia: TEdit
        Left = 59
        Top = 14
        Width = 516
        Height = 21
        MaxLength = 4
        TabOrder = 0
      end
      object txtConta: TEdit
        Left = 59
        Top = 38
        Width = 516
        Height = 21
        TabOrder = 1
      end
      object txtDocumento: TEdit
        Left = 79
        Top = 62
        Width = 496
        Height = 21
        TabOrder = 2
      end
      object txtISPB: TEdit
        Left = 79
        Top = 86
        Width = 496
        Height = 21
        TabOrder = 3
      end
    end
    object btnConfirmRequest: TButton
      Left = 289
      Top = 200
      Width = 291
      Height = 32
      Caption = 'Confirmar a Requisi'#231#227'o'
      TabOrder = 2
      OnClick = btnConfirmRequestClick
    end
    object btnCancelRequest: TButton
      Left = 3
      Top = 200
      Width = 280
      Height = 32
      Caption = 'Cancelar a Requisi'#231#227'o'
      TabOrder = 3
      OnClick = btnCancelRequestClick
    end
    object GroupBox1: TGroupBox
      Left = 3
      Top = 153
      Width = 577
      Height = 41
      Caption = '*Calend'#225'rio - Ex.: 2023-12-20T12:17:11.926Z '
      TabOrder = 4
      object Label4: TLabel
        Left = 9
        Top = 17
        Width = 115
        Height = 13
        Caption = 'Expira'#231#227'o da Solicita'#231#227'o'
      end
      object txtDataExpiracao: TEdit
        Left = 136
        Top = 14
        Width = 439
        Height = 21
        TabOrder = 0
      end
    end
  end
end
