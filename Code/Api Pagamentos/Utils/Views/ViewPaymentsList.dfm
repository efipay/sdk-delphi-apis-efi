object viewListPayments: TviewListPayments
  Left = 0
  Top = 0
  Caption = 'Modal da Requisi'#231#227'o'
  ClientHeight = 198
  ClientWidth = 632
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
    Width = 626
    Height = 190
    Align = alTop
    Caption = 'Liustar Pagamentos'
    TabOrder = 0
    object Label2: TLabel
      AlignWithMargins = True
      Left = 7
      Top = 20
      Width = 180
      Height = 21
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 0
      Align = alTop
      Caption = '*Inicio - Ex. 2021-06-01'
      Constraints.MaxHeight = 21
      Constraints.MaxWidth = 180
      Constraints.MinHeight = 21
      Constraints.MinWidth = 180
      Layout = tlCenter
    end
    object Label1: TLabel
      AlignWithMargins = True
      Left = 7
      Top = 70
      Width = 180
      Height = 21
      Margins.Left = 5
      Margins.Top = 5
      Margins.Bottom = 0
      Align = alTop
      Caption = '*Fim - Ex. 2021-06-01'
      Constraints.MaxHeight = 21
      Constraints.MaxWidth = 180
      Constraints.MinHeight = 21
      Constraints.MinWidth = 180
      Layout = tlCenter
      ExplicitLeft = 5
      ExplicitTop = 68
    end
    object txtDetailInitDate: TEdit
      AlignWithMargins = True
      Left = 7
      Top = 41
      Width = 614
      Height = 21
      Margins.Left = 5
      Margins.Top = 0
      Align = alTop
      Constraints.MaxWidth = 614
      Constraints.MinWidth = 614
      TabOrder = 0
    end
    object txtDetailEndDate: TEdit
      AlignWithMargins = True
      Left = 7
      Top = 91
      Width = 614
      Height = 21
      Margins.Left = 5
      Margins.Top = 0
      Align = alTop
      Constraints.MaxWidth = 614
      Constraints.MinWidth = 614
      TabOrder = 1
    end
    object btnListar: TButton
      AlignWithMargins = True
      Left = 356
      Top = 155
      Width = 265
      Height = 25
      Margins.Left = 5
      Caption = 'Listar'
      Constraints.MaxHeight = 25
      Constraints.MaxWidth = 265
      Constraints.MinHeight = 25
      Constraints.MinWidth = 265
      TabOrder = 2
      OnClick = btnListarClick
    end
    object btnCancelar: TButton
      Left = 7
      Top = 155
      Width = 265
      Height = 25
      Caption = 'Cancelar'
      TabOrder = 3
      OnClick = btnCancelarClick
    end
  end
end
