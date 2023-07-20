object OfDevolutionPix: TOfDevolutionPix
  Left = 0
  Top = 0
  Caption = 'Modal da Requisi'#231#227'o'
  ClientHeight = 149
  ClientWidth = 635
  Color = 6001140
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 629
    Height = 142
    Align = alTop
    Caption = 'Body da Requisi'#231#227'o - *Campos Obrigat'#243'rios'
    TabOrder = 0
    object Label1: TLabel
      Left = 2
      Top = 15
      Width = 625
      Height = 13
      Align = alTop
      Caption = '*Id do pagamento '
      ExplicitWidth = 91
    end
    object Label2: TLabel
      AlignWithMargins = True
      Left = 5
      Top = 58
      Width = 619
      Height = 13
      Align = alTop
      Caption = '*Valor'
      ExplicitWidth = 30
    end
    object txtId: TEdit
      AlignWithMargins = True
      Left = 5
      Top = 31
      Width = 619
      Height = 21
      Align = alTop
      TabOrder = 0
    end
    object txtValor: TEdit
      AlignWithMargins = True
      Left = 5
      Top = 77
      Width = 619
      Height = 21
      Align = alTop
      TabOrder = 1
    end
    object btnCancelar: TButton
      Left = 5
      Top = 114
      Width = 265
      Height = 25
      Caption = 'Cancelar'
      TabOrder = 2
      OnClick = btnCancelarClick
    end
    object btnDevolution: TButton
      Left = 362
      Top = 114
      Width = 265
      Height = 25
      Caption = 'Confirmar'
      TabOrder = 3
      OnClick = btnDevolutionClick
    end
  end
end
