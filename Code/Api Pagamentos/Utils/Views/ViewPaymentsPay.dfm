object ViewPaymentBarcode: TViewPaymentBarcode
  Left = 0
  Top = 0
  Caption = 'Modal da Requisi'#231#227'o'
  ClientHeight = 312
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
    Height = 294
    Align = alTop
    Caption = 'Iniciar Pagamento'
    TabOrder = 0
    object Label1: TLabel
      AlignWithMargins = True
      Left = 5
      Top = 18
      Width = 88
      Height = 13
      Align = alTop
      Caption = '*C'#243'digo de Barras'
      Constraints.MaxWidth = 88
      ExplicitLeft = 16
      ExplicitTop = 24
    end
    object Label2: TLabel
      AlignWithMargins = True
      Left = 5
      Top = 66
      Width = 180
      Height = 13
      Margins.Top = 5
      Align = alTop
      Caption = '*Data do pagamento (AAAA-MM-DD)'
      Constraints.MaxWidth = 180
      ExplicitWidth = 178
    end
    object Label3: TLabel
      AlignWithMargins = True
      Left = 5
      Top = 112
      Width = 145
      Height = 13
      Align = alTop
      Caption = '*Valor (Ex: R$50.00 = 5000)'
      Constraints.MaxWidth = 145
      ExplicitWidth = 139
    end
    object Label4: TLabel
      AlignWithMargins = True
      Left = 5
      Top = 158
      Width = 46
      Height = 13
      Align = alTop
      Caption = 'Descri'#231#227'o'
      Constraints.MaxWidth = 46
      ExplicitLeft = 16
      ExplicitTop = 224
    end
    object txtBarcode: TEdit
      AlignWithMargins = True
      Left = 5
      Top = 37
      Width = 614
      Height = 21
      Align = alTop
      Constraints.MaxWidth = 614
      Constraints.MinWidth = 614
      TabOrder = 0
    end
    object txtDatePayment: TEdit
      AlignWithMargins = True
      Left = 5
      Top = 85
      Width = 614
      Height = 21
      Align = alTop
      Constraints.MaxWidth = 614
      Constraints.MinWidth = 614
      TabOrder = 1
    end
    object txtValue: TEdit
      AlignWithMargins = True
      Left = 5
      Top = 131
      Width = 614
      Height = 21
      Align = alTop
      Constraints.MaxWidth = 614
      TabOrder = 2
    end
    object txtDescription: TEdit
      AlignWithMargins = True
      Left = 5
      Top = 177
      Width = 614
      Height = 60
      Align = alTop
      Constraints.MaxHeight = 60
      Constraints.MaxWidth = 614
      Constraints.MinHeight = 60
      Constraints.MinWidth = 614
      TabOrder = 3
    end
    object btnPagar: TButton
      AlignWithMargins = True
      Left = 354
      Top = 266
      Width = 265
      Height = 25
      Caption = 'Pagar'
      Constraints.MaxHeight = 25
      Constraints.MaxWidth = 265
      Constraints.MinHeight = 25
      Constraints.MinWidth = 265
      TabOrder = 4
      OnClick = btnPagarClick
    end
    object btnCancelar: TButton
      Left = 3
      Top = 266
      Width = 265
      Height = 25
      Caption = 'Cancelar'
      TabOrder = 5
      OnClick = btnCancelarClick
    end
  end
end
