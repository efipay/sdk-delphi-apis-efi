object ViewOfListAutomaticEnrollment: TViewOfListAutomaticEnrollment
  Left = 0
  Top = 0
  Caption = 'Modal da Requisi'#231#227'o'
  ClientHeight = 187
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
    Height = 187
    Align = alClient
    Caption = '*Campos Obrigat'#243'rios'
    TabOrder = 0
    ExplicitHeight = 146
    object Label1: TLabel
      Left = 8
      Top = 25
      Width = 172
      Height = 13
      Caption = '*Inicio - Ex. 2021-06-01T23:01:35Z'
    end
    object Label2: TLabel
      Left = 8
      Top = 68
      Width = 163
      Height = 13
      Caption = '*Fim - Ex. 2021-06-01T23:01:35Z'
    end
    object Label3: TLabel
      Left = 8
      Top = 108
      Width = 37
      Height = 13
      Caption = '*Status'
    end
    object txtStartDate: TEdit
      Left = 4
      Top = 41
      Width = 576
      Height = 21
      TabOrder = 0
    end
    object txtEndDate: TEdit
      Left = 4
      Top = 83
      Width = 576
      Height = 21
      TabOrder = 1
    end
    object btnConfirmRequest: TButton
      Left = 289
      Top = 151
      Width = 291
      Height = 31
      Caption = 'Confirmar a Requisi'#231#227'o'
      TabOrder = 2
      OnClick = btnConfirmRequestClick
    end
    object btnCancelRequest: TButton
      Left = 4
      Top = 150
      Width = 275
      Height = 32
      Caption = 'Cancelar a Requisi'#231#227'o'
      TabOrder = 3
      OnClick = btnCancelRequestClick
    end
    object cmbStatus: TComboBox
      Left = 4
      Top = 123
      Width = 576
      Height = 21
      TabOrder = 4
    end
  end
end
