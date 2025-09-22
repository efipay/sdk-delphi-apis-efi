object ViewOfCreateBiometricEnrollment: TViewOfCreateBiometricEnrollment
  Left = 0
  Top = 0
  Caption = 'Modal da Requisi'#231#227'o'
  ClientHeight = 208
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
    Height = 208
    Align = alClient
    Caption = '*Campos Obrigat'#243'rios'
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 21
      Width = 90
      Height = 13
      Caption = '*Idempotency Key'
    end
    object txtIdemKey: TEdit
      Left = 104
      Top = 18
      Width = 476
      Height = 21
      TabOrder = 0
    end
    object btnConfirmRequest: TButton
      Left = 295
      Top = 172
      Width = 285
      Height = 31
      Caption = 'Confirmar a Requisi'#231#227'o'
      TabOrder = 1
      OnClick = btnConfirmRequestClick
    end
    object btnCancelRequest: TButton
      Left = 4
      Top = 172
      Width = 285
      Height = 32
      Caption = 'Cancelar a Requisi'#231#227'o'
      TabOrder = 2
      OnClick = btnCancelRequestClick
    end
    object GroupBox1: TGroupBox
      Left = 4
      Top = 40
      Width = 576
      Height = 41
      Caption = '*ID do Participante'
      TabOrder = 3
      object txtIDParticipante: TEdit
        Left = 3
        Top = 16
        Width = 570
        Height = 21
        TabOrder = 0
      end
    end
    object GroupBox2: TGroupBox
      Left = 4
      Top = 83
      Width = 576
      Height = 41
      Caption = '*CPF'
      TabOrder = 4
      object txtCPF: TEdit
        Left = 3
        Top = 16
        Width = 570
        Height = 21
        TabOrder = 0
      end
    end
    object GroupBox4: TGroupBox
      Left = 4
      Top = 126
      Width = 576
      Height = 41
      Caption = 'CNPJ'
      TabOrder = 5
      object txtCNPJ: TEdit
        Left = 3
        Top = 16
        Width = 570
        Height = 21
        TabOrder = 0
      end
    end
  end
end
