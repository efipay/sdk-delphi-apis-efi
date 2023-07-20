object OfListParticipants: TOfListParticipants
  Left = 0
  Top = 0
  Caption = 'Modal da Requisi'#231#227'o'
  ClientHeight = 114
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
    Height = 103
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 3
      Top = 3
      Width = 77
      Height = 13
      Caption = 'Nome (opcional)'
    end
    object txtNome: TEdit
      Left = 3
      Top = 22
      Width = 619
      Height = 21
      TabOrder = 0
    end
    object btnConsultar: TButton
      Left = 357
      Top = 75
      Width = 265
      Height = 25
      Caption = 'Consultar'
      TabOrder = 1
      OnClick = btnConsultarClick
    end
    object btnCancelar: TButton
      Left = 3
      Top = 75
      Width = 265
      Height = 25
      Caption = 'Cancelar'
      TabOrder = 2
      OnClick = btnCancelarClick
    end
  end
end
