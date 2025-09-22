object ViewOfRevokeAutomaticCharge: TViewOfRevokeAutomaticCharge
  Left = 0
  Top = 0
  Caption = 'Modal da Requisi'#231#227'o'
  ClientHeight = 169
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
    Height = 169
    Align = alClient
    Caption = '*Campos Obrigat'#243'rios'
    TabOrder = 0
    ExplicitHeight = 147
    object Label3: TLabel
      Left = 4
      Top = 21
      Width = 90
      Height = 13
      Caption = '*Idempotency Key'
    end
    object btnConfirmRequest: TButton
      Left = 289
      Top = 131
      Width = 291
      Height = 31
      Caption = 'Confirmar a Requisi'#231#227'o'
      TabOrder = 0
      OnClick = btnConfirmRequestClick
    end
    object btnCancelRequest: TButton
      Left = 3
      Top = 131
      Width = 275
      Height = 32
      Caption = 'Cancelar a Requisi'#231#227'o'
      TabOrder = 1
      OnClick = btnCancelRequestClick
    end
    object txtIdemKey: TEdit
      Left = 99
      Top = 18
      Width = 481
      Height = 21
      TabOrder = 2
    end
    object GroupBox1: TGroupBox
      Left = 3
      Top = 41
      Width = 578
      Height = 41
      Caption = '*Identificador da Ades'#227'o'
      Color = 6132468
      ParentBackground = False
      ParentColor = False
      TabOrder = 3
      object txtIDAdesao: TEdit
        Left = 2
        Top = 15
        Width = 573
        Height = 21
        TabOrder = 0
      end
    end
    object GroupBox2: TGroupBox
      Left = 3
      Top = 84
      Width = 578
      Height = 43
      Caption = '*EndToEndID'
      Color = 6132468
      ParentBackground = False
      ParentColor = False
      TabOrder = 4
      object txtE2EID: TEdit
        Left = 2
        Top = 16
        Width = 573
        Height = 21
        TabOrder = 0
      end
    end
  end
end
