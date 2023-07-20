unit ViewOfListParticipants;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TOfListParticipants = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    txtNome: TEdit;
    btnConsultar: TButton;
    btnCancelar: TButton;
    procedure btnConsultarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
  private
    { Private declarations }
     function getNomeParticipante():String;
  public
    { Public declarations }
    property NomeParticipante : String read getNomeParticipante;
    procedure ClearRequestfields;

  end;

var
  OfListParticipants: TOfListParticipants;

implementation

{$R *.dfm}

procedure TOfListParticipants.btnCancelarClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TOfListParticipants.btnConsultarClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;



procedure TOfListParticipants.ClearRequestfields;
begin
  txtNome.Text := '';
end;

procedure TOfListParticipants.FormCreate(Sender: TObject);
begin
  Self.Position := poScreenCenter;
end;

function TOfListParticipants.getNomeParticipante: String;
begin
    if txtnome.Text <> EmptyStr then
       Result:= '?nome='+txtnome.Text
    else
        Result:= '';
end;

end.
