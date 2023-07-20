object PixSplitConfigId: TPixSplitConfigId
  Left = 0
  Top = 0
  Caption = 'Modal da Requisi'#231#227'o'
  ClientHeight = 500
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
    Height = 489
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
      Caption = '*Id da configura'#231#227'o'
      ExplicitWidth = 96
    end
    object Label2: TLabel
      AlignWithMargins = True
      Left = 5
      Top = 383
      Width = 619
      Height = 13
      Align = alTop
      Caption = 'Descri'#231#227'o'
      ExplicitWidth = 46
    end
    object txtId: TEdit
      AlignWithMargins = True
      Left = 5
      Top = 37
      Width = 619
      Height = 21
      Align = alTop
      TabOrder = 0
    end
    object txtDescricao: TEdit
      AlignWithMargins = True
      Left = 5
      Top = 402
      Width = 609
      Height = 21
      TabOrder = 1
    end
    object GroupBox2: TGroupBox
      AlignWithMargins = True
      Left = 5
      Top = 64
      Width = 619
      Height = 313
      Align = alTop
      Caption = 'Configura'#231#227'o Split'
      TabOrder = 2
      object GroupBox3: TGroupBox
        AlignWithMargins = True
        Left = 5
        Top = 18
        Width = 265
        Height = 111
        Caption = '*Minha Parte'
        Constraints.MaxWidth = 265
        Constraints.MinWidth = 265
        TabOrder = 0
        object Label3: TLabel
          AlignWithMargins = True
          Left = 5
          Top = 18
          Width = 255
          Height = 13
          Caption = '*Tipo - Ex: porcentagem'
          Constraints.MaxWidth = 255
          Constraints.MinWidth = 255
        end
        object Label4: TLabel
          AlignWithMargins = True
          Left = 5
          Top = 64
          Width = 255
          Height = 13
          Caption = '*Valor - Ex: 60.00(60%)'
          Constraints.MaxWidth = 255
          Constraints.MinWidth = 255
        end
        object txtTipoDivisaoTitular: TEdit
          AlignWithMargins = True
          Left = 5
          Top = 37
          Width = 255
          Height = 21
          Constraints.MaxWidth = 255
          Constraints.MinWidth = 255
          TabOrder = 0
        end
        object txtValorTitular: TEdit
          AlignWithMargins = True
          Left = 5
          Top = 83
          Width = 255
          Height = 21
          Constraints.MaxWidth = 255
          Constraints.MinWidth = 255
          TabOrder = 1
        end
      end
      object GroupBox4: TGroupBox
        AlignWithMargins = True
        Left = 333
        Top = 18
        Width = 265
        Height = 111
        Caption = '*Repasse'
        Constraints.MaxWidth = 265
        Constraints.MinWidth = 265
        TabOrder = 1
        object Label5: TLabel
          Left = 5
          Top = 15
          Width = 255
          Height = 13
          Caption = '*Tipo - Ex: porcentagem'
          Constraints.MaxWidth = 255
          Constraints.MinWidth = 255
        end
        object Label6: TLabel
          Left = 5
          Top = 58
          Width = 255
          Height = 13
          Caption = '*Valor - Ex: 60.00(60%)'
          Constraints.MaxWidth = 255
          Constraints.MinWidth = 255
        end
        object txtTipoDivisaoContas: TEdit
          Left = 5
          Top = 34
          Width = 255
          Height = 21
          Constraints.MaxWidth = 255
          Constraints.MinWidth = 255
          TabOrder = 0
        end
        object txtValorContas: TEdit
          Left = 5
          Top = 77
          Width = 255
          Height = 21
          Constraints.MaxWidth = 255
          Constraints.MinWidth = 255
          TabOrder = 1
        end
      end
      object GroupBox5: TGroupBox
        Left = 5
        Top = 135
        Width = 609
        Height = 122
        Caption = '*Favorecido'
        Constraints.MaxHeight = 122
        Constraints.MaxWidth = 609
        Constraints.MinHeight = 122
        Constraints.MinWidth = 609
        TabOrder = 2
        object Label7: TLabel
          Left = 5
          Top = 18
          Width = 599
          Height = 13
          Caption = '*Conta (Todos os n'#250'meros, incluindo o digito final, sem o h'#237'fen)'
          Constraints.MaxWidth = 599
          Constraints.MinWidth = 599
        end
        object Label8: TLabel
          Left = 5
          Top = 64
          Width = 599
          Height = 13
          Caption = '*CPF/CNPJ (Sem m'#225'scara)'
          Constraints.MaxWidth = 599
          Constraints.MinWidth = 599
        end
        object txtConta: TEdit
          AlignWithMargins = True
          Left = 5
          Top = 37
          Width = 599
          Height = 21
          Constraints.MaxWidth = 599
          Constraints.MinWidth = 599
          TabOrder = 0
        end
        object txtDocumento: TEdit
          Left = 5
          Top = 83
          Width = 599
          Height = 21
          Constraints.MaxWidth = 599
          Constraints.MinWidth = 599
          TabOrder = 1
        end
      end
      object optLancamentoImediato: TCheckBox
        Left = 5
        Top = 263
        Width = 609
        Height = 17
        Caption = 'Lan'#231'amento Imediado'
        Constraints.MaxWidth = 609
        Constraints.MinWidth = 129
        TabOrder = 3
      end
      object optDivisaoTarifa: TCheckBox
        Left = 5
        Top = 286
        Width = 609
        Height = 17
        Caption = 'Assumir valor total da tarifa'#231#227'o'
        TabOrder = 4
      end
    end
    object Button1: TButton
      AlignWithMargins = True
      Left = 3
      Top = 459
      Width = 265
      Height = 25
      Caption = 'Cancelar'
      Constraints.MaxWidth = 265
      Constraints.MinWidth = 265
      TabOrder = 3
    end
    object btnCreateConfig: TButton
      Left = 354
      Top = 459
      Width = 265
      Height = 25
      Caption = 'Confirmar'
      TabOrder = 4
      OnClick = btnCreateConfigClick
    end
  end
end
