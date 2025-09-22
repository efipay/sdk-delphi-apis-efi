object ViewOfCreateAutomaticCharge: TViewOfCreateAutomaticCharge
  Left = 0
  Top = 0
  Caption = 'Modal da Requisi'#231#227'o'
  ClientHeight = 193
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
    Height = 193
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
      Top = 157
      Width = 285
      Height = 32
      Caption = 'Confirmar a Requisi'#231#227'o'
      TabOrder = 0
      OnClick = btnConfirmRequestClick
    end
    object btnCancelRequest: TButton
      Left = 4
      Top = 157
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
      Height = 69
      Caption = 'Pagamento'
      TabOrder = 3
      object Label2: TLabel
        Left = 3
        Top = 21
        Width = 118
        Height = 13
        Caption = '*Data - Ex.: 2024-06-08'
      end
      object Label3: TLabel
        Left = 271
        Top = 21
        Width = 85
        Height = 13
        Caption = '*Valor - Ex.: 9.99'
      end
      object Label4: TLabel
        Left = 3
        Top = 45
        Width = 59
        Height = 13
        Caption = 'C'#243'digo IBGE'
      end
      object Label5: TLabel
        Left = 271
        Top = 45
        Width = 113
        Height = 13
        Caption = 'Informa'#231#227'o do Pagador'
      end
      object txtData: TEdit
        Left = 127
        Top = 18
        Width = 138
        Height = 21
        TabOrder = 0
      end
      object txtValor: TEdit
        Left = 362
        Top = 18
        Width = 211
        Height = 21
        TabOrder = 1
      end
      object txtIBGE: TEdit
        Left = 68
        Top = 42
        Width = 197
        Height = 21
        TabOrder = 2
      end
      object txtInfoPagador: TEdit
        Left = 390
        Top = 42
        Width = 183
        Height = 21
        TabOrder = 3
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
