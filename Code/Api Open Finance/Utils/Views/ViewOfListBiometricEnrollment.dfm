object ViewOfListBiometricEnrollment: TViewOfListBiometricEnrollment
  Left = 0
  Top = 0
  Caption = 'Modal da Requisi'#231#227'o'
  ClientHeight = 142
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
    Height = 142
    Align = alClient
    Caption = '*Campos Obrigat'#243'rios'
    TabOrder = 0
    object btnConfirmRequest: TButton
      Left = 295
      Top = 104
      Width = 285
      Height = 31
      Caption = 'Confirmar a Requisi'#231#227'o'
      TabOrder = 0
      OnClick = btnConfirmRequestClick
    end
    object btnCancelRequest: TButton
      Left = 4
      Top = 103
      Width = 285
      Height = 32
      Caption = 'Cancelar a Requisi'#231#227'o'
      TabOrder = 1
      OnClick = btnCancelRequestClick
    end
    object GroupBox2: TGroupBox
      Left = 4
      Top = 15
      Width = 576
      Height = 41
      Caption = '*CPF'
      TabOrder = 2
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
      Top = 58
      Width = 576
      Height = 41
      Caption = 'CNPJ'
      TabOrder = 3
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
