object PixSplitLinkCharges: TPixSplitLinkCharges
  Left = 0
  Top = 0
  Caption = 'Modal da Requisi'#231#227'o'
  ClientHeight = 193
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
    Height = 182
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
    object Label2: TLabel
      AlignWithMargins = True
      Left = 5
      Top = 64
      Width = 619
      Height = 13
      Align = alTop
      Caption = '*Id - Identificador da configura'#231#227'o Pix'
      ExplicitWidth = 184
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
    object txtId: TEdit
      AlignWithMargins = True
      Left = 5
      Top = 83
      Width = 619
      Height = 21
      Align = alTop
      TabOrder = 1
    end
    object Button1: TButton
      Left = 3
      Top = 154
      Width = 265
      Height = 25
      Caption = 'Cancelar'
      Constraints.MaxWidth = 265
      Constraints.MinWidth = 265
      TabOrder = 2
    end
    object btnCadastrarSplit: TButton
      Left = 359
      Top = 154
      Width = 265
      Height = 25
      Caption = 'Cadastrar'
      Constraints.MaxWidth = 265
      Constraints.MinWidth = 265
      TabOrder = 3
      OnClick = btnCadastrarSplitClick
    end
    object optTipoCobranca: TCheckBox
      AlignWithMargins = True
      Left = 5
      Top = 110
      Width = 619
      Height = 17
      Align = alTop
      Caption = 'Cobran'#231'a com vencimento (COBV)'
      TabOrder = 4
    end
  end
end
