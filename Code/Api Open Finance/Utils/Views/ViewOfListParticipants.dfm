object OfListParticipants: TOfListParticipants
  Left = 0
  Top = 0
  Caption = 'Modal da Requisi'#231#227'o'
  ClientHeight = 93
  ClientWidth = 635
  Color = 6001140
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OnCreate = FormCreate
  TextHeight = 13
  object GroupBox1: TGroupBox
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 629
    Height = 88
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 9
      Top = 6
      Width = 303
      Height = 13
      Caption = 'Nome - Obs.: Deixe vazio para retornar todos os participantes.'
    end
    object txtNome: TEdit
      Left = 7
      Top = 22
      Width = 615
      Height = 21
      TabOrder = 0
    end
    object btnConsultar: TButton
      Left = 322
      Top = 51
      Width = 300
      Height = 32
      Caption = 'Consultar'
      TabOrder = 1
      OnClick = btnConsultarClick
    end
    object btnCancelar: TButton
      Left = 7
      Top = 51
      Width = 300
      Height = 32
      Caption = 'Cancelar'
      TabOrder = 2
      OnClick = btnCancelarClick
    end
  end
end
