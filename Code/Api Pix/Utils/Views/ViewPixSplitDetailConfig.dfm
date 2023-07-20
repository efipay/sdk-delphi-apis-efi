object PixSplitDetailConfig: TPixSplitDetailConfig
  Left = 0
  Top = 0
  Caption = 'Modal da Requisi'#231#227'o'
  ClientHeight = 122
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
    Height = 110
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
      Caption = '*Id - Identificador da configura'#231#227'o Pix'
      ExplicitWidth = 184
    end
    object txtId: TEdit
      AlignWithMargins = True
      Left = 5
      Top = 37
      Width = 619
      Height = 21
      Align = alTop
      TabOrder = 0
    end
    object btnCancelar: TButton
      AlignWithMargins = True
      Left = 5
      Top = 80
      Width = 265
      Height = 25
      BiDiMode = bdRightToLeftNoAlign
      Caption = 'Cancelar'
      Constraints.MaxHeight = 25
      Constraints.MaxWidth = 265
      Constraints.MinHeight = 25
      Constraints.MinWidth = 265
      ParentBiDiMode = False
      TabOrder = 1
      OnClick = btnCancelarClick
    end
    object btnGetConfig: TButton
      Left = 359
      Top = 80
      Width = 265
      Height = 25
      Caption = 'Confirmar'
      TabOrder = 2
      OnClick = btnGetConfigClick
    end
  end
end
