object ViewOfListAutomaticCharge: TViewOfListAutomaticCharge
  Left = 0
  Top = 0
  Caption = 'Modal da Requisi'#231#227'o'
  ClientHeight = 147
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
    Height = 147
    Align = alClient
    Caption = '*Campos Obrigat'#243'rios'
    TabOrder = 0
    object Label1: TLabel
      Left = 5
      Top = 23
      Width = 121
      Height = 13
      Caption = '*Identificador da Ades'#227'o'
    end
    object Label2: TLabel
      Left = 7
      Top = 67
      Width = 59
      Height = 13
      Caption = 'EndToEndID'
    end
    object txtIDAdesao: TEdit
      Left = 4
      Top = 41
      Width = 576
      Height = 21
      TabOrder = 0
    end
    object txtE2EID: TEdit
      Left = 4
      Top = 83
      Width = 576
      Height = 21
      TabOrder = 1
    end
    object btnConfirmRequest: TButton
      Left = 289
      Top = 110
      Width = 291
      Height = 31
      Caption = 'Confirmar a Requisi'#231#227'o'
      TabOrder = 2
      OnClick = btnConfirmRequestClick
    end
    object btnCancelRequest: TButton
      Left = 4
      Top = 110
      Width = 275
      Height = 32
      Caption = 'Cancelar a Requisi'#231#227'o'
      TabOrder = 3
      OnClick = btnCancelRequestClick
    end
  end
end
