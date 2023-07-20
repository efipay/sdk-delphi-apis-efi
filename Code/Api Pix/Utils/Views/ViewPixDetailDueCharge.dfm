object DetailDueCharge: TDetailDueCharge
  Left = 0
  Top = 0
  Caption = 'Modal da Requisi'#231#227'o'
  ClientHeight = 172
  ClientWidth = 584
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
    Width = 578
    Height = 166
    Align = alTop
    Caption = 'Body da Requisi'#231#227'o - *Campos Obrigat'#243'rios'
    TabOrder = 0
    object Label1: TLabel
      AlignWithMargins = True
      Left = 5
      Top = 18
      Width = 160
      Height = 13
      Align = alTop
      Caption = '*Identificador :txid da Cobran'#231'a:'
      Constraints.MaxWidth = 160
      Constraints.MinWidth = 160
      ExplicitLeft = 64
      ExplicitTop = 40
    end
    object Label2: TLabel
      AlignWithMargins = True
      Left = 5
      Top = 64
      Width = 568
      Height = 13
      Align = alTop
      Caption = 'Revis'#227'o - (Padr'#227'o = 0)'
      ExplicitWidth = 110
    end
    object txtTXID: TEdit
      AlignWithMargins = True
      Left = 5
      Top = 37
      Width = 568
      Height = 21
      Align = alTop
      TabOrder = 0
    end
    object txtRevisao: TEdit
      AlignWithMargins = True
      Left = 5
      Top = 83
      Width = 568
      Height = 21
      Align = alTop
      TabOrder = 1
    end
    object btnDetail: TButton
      Left = 308
      Top = 138
      Width = 265
      Height = 25
      Caption = 'Consultar'
      TabOrder = 2
      OnClick = btnDetailClick
    end
    object btnCancelar: TButton
      Left = 5
      Top = 138
      Width = 265
      Height = 25
      Caption = 'Cancelar'
      TabOrder = 3
      OnClick = btnCancelarClick
    end
  end
end
