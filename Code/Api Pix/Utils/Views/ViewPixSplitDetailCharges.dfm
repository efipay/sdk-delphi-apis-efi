object PixSplitDetailCharges: TPixSplitDetailCharges
  Left = 0
  Top = 0
  Caption = 'Modal da Requisi'#231#227'o'
  ClientHeight = 140
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
    Height = 134
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
      Caption = '*Txid - Identificador da cobran'#231'a'
      ExplicitWidth = 159
    end
    object txtTxid: TEdit
      AlignWithMargins = True
      Left = 5
      Top = 37
      Width = 619
      Height = 21
      Align = alTop
      TabOrder = 0
    end
    object optTipoCobranca: TCheckBox
      AlignWithMargins = True
      Left = 5
      Top = 64
      Width = 619
      Height = 17
      Align = alTop
      Caption = 'Cobran'#231'a com vencimento (COBV)'
      TabOrder = 1
    end
    object btnCancelar: TButton
      Left = 5
      Top = 104
      Width = 265
      Height = 25
      Caption = 'cancelar'
      Constraints.MaxWidth = 265
      Constraints.MinWidth = 265
      TabOrder = 2
      OnClick = btnCancelarClick
    end
    object btnDetailChargeSplit: TButton
      Left = 359
      Top = 104
      Width = 265
      Height = 25
      Caption = 'Consultar'
      TabOrder = 3
      OnClick = btnDetailChargeSplitClick
    end
  end
end
