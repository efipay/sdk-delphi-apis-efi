object CreateAccount: TCreateAccount
  Left = 0
  Top = 0
  Caption = 'Modal da Requisi'#231#227'o'
  ClientHeight = 683
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
    Height = 672
    Align = alTop
    Caption = 'Body da Requisi'#231#227'o - *Campos Obrigat'#243'rios'
    TabOrder = 0
    object Label14: TLabel
      AlignWithMargins = True
      Left = 5
      Top = 479
      Width = 120
      Height = 13
      Caption = '*Meios de Comunica'#231#227'o:'
      Constraints.MaxWidth = 120
      Constraints.MinWidth = 120
    end
    object Label15: TLabel
      Left = 5
      Top = 521
      Width = 45
      Height = 13
      Caption = '*Escopos'
      Constraints.MaxWidth = 45
      Constraints.MinWidth = 45
    end
    object GroupBox2: TGroupBox
      AlignWithMargins = True
      Left = 5
      Top = 18
      Width = 619
      Height = 455
      Align = alTop
      Caption = '*Cliente Final'
      TabOrder = 0
      object Label1: TLabel
        Left = 3
        Top = 18
        Width = 33
        Height = 13
        Caption = '*Nome'
        Constraints.MaxWidth = 33
      end
      object Label2: TLabel
        Left = 320
        Top = 18
        Width = 23
        Height = 13
        Caption = '*Cpf'
      end
      object Label3: TLabel
        Left = 10
        Top = 64
        Width = 102
        Height = 13
        Caption = '*Data de Nascimento'
        Constraints.MaxWidth = 102
        Constraints.MinWidth = 102
      end
      object Label4: TLabel
        Left = 320
        Top = 64
        Width = 65
        Height = 13
        Caption = 'Nome da m'#227'e'
      end
      object Label5: TLabel
        AlignWithMargins = True
        Left = 10
        Top = 110
        Width = 39
        Height = 13
        Caption = '*Celular'
        Constraints.MaxWidth = 39
        Constraints.MinWidth = 39
      end
      object Label6: TLabel
        Left = 320
        Top = 110
        Width = 34
        Height = 13
        Caption = '*E-mail'
      end
      object lbRazaoSocial: TLabel
        AlignWithMargins = True
        Left = 10
        Top = 179
        Width = 66
        Height = 13
        Caption = '*Raz'#227'o Social'
        Constraints.MaxWidth = 66
        Constraints.MinWidth = 66
        Visible = False
      end
      object lbCnpj: TLabel
        Left = 320
        Top = 179
        Width = 28
        Height = 13
        Caption = '*Cnpj'
        Visible = False
      end
      object txtNome: TEdit
        AlignWithMargins = True
        Left = 5
        Top = 37
        Width = 265
        Height = 21
        Constraints.MaxWidth = 265
        Constraints.MinWidth = 265
        TabOrder = 0
      end
      object txtCpf: TEdit
        Left = 320
        Top = 37
        Width = 265
        Height = 21
        TabOrder = 1
      end
      object txtDataNascimento: TEdit
        AlignWithMargins = True
        Left = 5
        Top = 83
        Width = 265
        Height = 21
        Constraints.MaxWidth = 265
        Constraints.MinWidth = 265
        TabOrder = 2
      end
      object txtNomeMae: TEdit
        Left = 320
        Top = 83
        Width = 265
        Height = 21
        TabOrder = 3
      end
      object txtCelular: TEdit
        AlignWithMargins = True
        Left = 5
        Top = 129
        Width = 265
        Height = 21
        Constraints.MaxWidth = 265
        Constraints.MinWidth = 265
        TabOrder = 4
      end
      object txtEmail: TEdit
        Left = 320
        Top = 129
        Width = 265
        Height = 21
        TabOrder = 5
      end
      object optPessoaJuridica: TCheckBox
        AlignWithMargins = True
        Left = 5
        Top = 156
        Width = 609
        Height = 17
        Caption = 'Pessoa Jur'#237'dica'
        Constraints.MaxWidth = 609
        Constraints.MinWidth = 89
        TabOrder = 6
        OnClick = optPessoaJuridicaClick
      end
      object txtRazaoSocial: TEdit
        AlignWithMargins = True
        Left = 5
        Top = 198
        Width = 265
        Height = 21
        Constraints.MaxWidth = 265
        Constraints.MinWidth = 265
        TabOrder = 7
        Visible = False
      end
      object txtCnpj: TEdit
        Left = 320
        Top = 198
        Width = 265
        Height = 21
        TabOrder = 8
        Visible = False
      end
      object GroupBox3: TGroupBox
        AlignWithMargins = True
        Left = 5
        Top = 225
        Width = 609
        Height = 208
        Caption = '*Endere'#231'o'
        TabOrder = 9
        object Label7: TLabel
          AlignWithMargins = True
          Left = 3
          Top = 18
          Width = 102
          Height = 13
          Caption = '*Logradouro'
          Constraints.MaxWidth = 102
          Constraints.MinWidth = 102
        end
        object Label8: TLabel
          Left = 315
          Top = 18
          Width = 25
          Height = 13
          Caption = '*Cep'
        end
        object Label9: TLabel
          AlignWithMargins = True
          Left = 5
          Top = 64
          Width = 39
          Height = 13
          Caption = '*Estado'
          Constraints.MaxWidth = 39
          Constraints.MinWidth = 39
        end
        object Label10: TLabel
          Left = 315
          Top = 64
          Width = 39
          Height = 13
          Caption = '*Cidade'
        end
        object Label11: TLabel
          AlignWithMargins = True
          Left = 5
          Top = 110
          Width = 39
          Height = 13
          Caption = '*Bairro'
          Constraints.MaxWidth = 39
          Constraints.MinWidth = 39
        end
        object Label12: TLabel
          Left = 315
          Top = 110
          Width = 43
          Height = 13
          Caption = '*N'#250'mero'
        end
        object Label13: TLabel
          AlignWithMargins = True
          Left = 5
          Top = 156
          Width = 75
          Height = 13
          Caption = 'Complemento'
          Constraints.MaxWidth = 75
          Constraints.MinWidth = 75
        end
        object txtLogradouro: TEdit
          AlignWithMargins = True
          Left = 5
          Top = 37
          Width = 265
          Height = 21
          Constraints.MaxWidth = 265
          Constraints.MinWidth = 265
          TabOrder = 0
        end
        object txtCep: TEdit
          Left = 315
          Top = 37
          Width = 265
          Height = 21
          TabOrder = 1
        end
        object txtEstado: TEdit
          AlignWithMargins = True
          Left = 5
          Top = 83
          Width = 265
          Height = 21
          Constraints.MaxWidth = 265
          Constraints.MinWidth = 265
          TabOrder = 2
        end
        object txtCidade: TEdit
          Left = 315
          Top = 83
          Width = 265
          Height = 21
          TabOrder = 3
        end
        object txtBairro: TEdit
          AlignWithMargins = True
          Left = 5
          Top = 129
          Width = 265
          Height = 21
          Constraints.MaxWidth = 265
          Constraints.MinWidth = 265
          TabOrder = 4
        end
        object txtNumero: TEdit
          Left = 315
          Top = 129
          Width = 265
          Height = 21
          TabOrder = 5
        end
        object txtComplemento: TEdit
          AlignWithMargins = True
          Left = 5
          Top = 175
          Width = 265
          Height = 21
          Constraints.MaxWidth = 265
          Constraints.MinWidth = 265
          TabOrder = 6
        end
      end
    end
    object optSms: TCheckBox
      Left = 5
      Top = 498
      Width = 45
      Height = 17
      Caption = 'SMS'
      Constraints.MaxWidth = 619
      TabOrder = 1
    end
    object optWhatsApp: TCheckBox
      Left = 56
      Top = 498
      Width = 97
      Height = 17
      Caption = 'Whatsapp'
      TabOrder = 2
    end
    object txtEscopos: TEdit
      Left = 7
      Top = 540
      Width = 619
      Height = 21
      TabOrder = 3
    end
    object btnCancelar: TButton
      Left = 3
      Top = 644
      Width = 265
      Height = 25
      Caption = 'Cancelar'
      Constraints.MaxWidth = 265
      Constraints.MinWidth = 265
      TabOrder = 4
      OnClick = btnCancelarClick
    end
    object btnCriar: TButton
      Left = 359
      Top = 644
      Width = 265
      Height = 25
      Caption = 'Criar'
      TabOrder = 5
      OnClick = btnCriarClick
    end
  end
end
