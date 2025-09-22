object ViewOfUpdateAutomaticEnrollment: TViewOfUpdateAutomaticEnrollment
  Left = 0
  Top = 0
  Caption = 'Modal da Requisi'#231#227'o'
  ClientHeight = 165
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
    Height = 165
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
    object btnConfirmRequest: TButton
      Left = 295
      Top = 127
      Width = 285
      Height = 32
      Caption = 'Confirmar a Requisi'#231#227'o'
      TabOrder = 0
      OnClick = btnConfirmRequestClick
    end
    object btnCancelRequest: TButton
      Left = 4
      Top = 127
      Width = 285
      Height = 32
      Caption = 'Cancelar a Requisi'#231#227'o'
      TabOrder = 1
      OnClick = btnCancelRequestClick
    end
    object GroupBox2: TGroupBox
      Left = 4
      Top = 40
      Width = 576
      Height = 41
      Caption = '*Identificador da Ades'#227'o'
      Color = 6263796
      ParentBackground = False
      ParentColor = False
      TabOrder = 2
      object txtIDAdesao: TEdit
        Left = 3
        Top = 16
        Width = 570
        Height = 21
        TabOrder = 0
      end
    end
    object GroupBox4: TGroupBox
      Left = 4
      Top = 82
      Width = 576
      Height = 41
      Caption = '*Status'
      TabOrder = 3
      object cmbStatus: TComboBox
        Left = 3
        Top = 16
        Width = 570
        Height = 21
        TabOrder = 0
      end
    end
    object txtIdemKey: TEdit
      Left = 104
      Top = 18
      Width = 476
      Height = 21
      TabOrder = 4
    end
  end
end
