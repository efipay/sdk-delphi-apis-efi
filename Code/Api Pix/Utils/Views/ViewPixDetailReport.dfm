object PixDetailReport: TPixDetailReport
  Left = 0
  Top = 0
  Caption = 'Modal da Requisi'#231#227'o'
  ClientHeight = 166
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
    Height = 155
    Align = alTop
    Caption = 'Body da Requisi'#231#227'o - *Campos Obrigat'#243'rios'
    TabOrder = 0
    object Label1: TLabel
      AlignWithMargins = True
      Left = 5
      Top = 25
      Width = 619
      Height = 13
      Margins.Top = 10
      Align = alTop
      Caption = '*Id relat'#243'rio'
      ExplicitWidth = 59
    end
    object Button1: TButton
      Left = 5
      Top = 125
      Width = 265
      Height = 25
      Caption = 'Cancelar'
      Constraints.MaxWidth = 265
      Constraints.MinWidth = 265
      TabOrder = 0
    end
    object txtDownload: TButton
      Left = 359
      Top = 125
      Width = 265
      Height = 25
      Caption = 'Baixar'
      TabOrder = 1
      OnClick = txtDownloadClick
    end
    object txtId: TEdit
      AlignWithMargins = True
      Left = 5
      Top = 44
      Width = 619
      Height = 21
      Align = alTop
      TabOrder = 2
    end
  end
end
