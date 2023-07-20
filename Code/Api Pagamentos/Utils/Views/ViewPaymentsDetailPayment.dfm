object ViewDetailPayment: TViewDetailPayment
  Left = 0
  Top = 0
  Caption = 'Modal da Requisi'#231#227'o'
  ClientHeight = 110
  ClientWidth = 630
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
    Width = 624
    Height = 104
    Align = alTop
    Caption = 'Consultar Pagamento'
    TabOrder = 0
    object Label1: TLabel
      AlignWithMargins = True
      Left = 5
      Top = 18
      Width = 39
      Height = 21
      Align = alLeft
      Alignment = taCenter
      Caption = '*C'#243'digo'
      Constraints.MaxHeight = 21
      Constraints.MaxWidth = 40
      Constraints.MinHeight = 21
      Constraints.MinWidth = 37
      Layout = tlCenter
    end
    object txtIdPayment: TEdit
      AlignWithMargins = True
      Left = 56
      Top = 18
      Width = 563
      Height = 21
      Align = alRight
      Constraints.MaxHeight = 21
      Constraints.MaxWidth = 563
      Constraints.MinWidth = 563
      TabOrder = 0
    end
    object btnConsultar: TButton
      Left = 354
      Top = 76
      Width = 265
      Height = 25
      Caption = 'Consultar'
      TabOrder = 1
      OnClick = btnConsultarClick
    end
    object btnCancelar: TButton
      Left = 5
      Top = 76
      Width = 265
      Height = 25
      Caption = 'Cancelar'
      TabOrder = 2
      OnClick = btnCancelarClick
    end
  end
end
