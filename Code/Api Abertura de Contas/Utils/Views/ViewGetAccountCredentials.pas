unit ViewGetAccountCredentials;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TGetAccountCredentials = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    txtId: TEdit;
    btnCancelar: TButton;
    btnConsulta: TButton;
    procedure btnConsultaClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  GetAccountCredentials: TGetAccountCredentials;

implementation

{$R *.dfm}

procedure TGetAccountCredentials.btnCancelarClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TGetAccountCredentials.btnConsultaClick(Sender: TObject);
begin
 if txtId.Text = EmptyStr then
  begin
    MessageDlg('O campo identificador não pode ser vazio', TMsgDlgType.mtInformation, [TMsgDlgBtn.mbOK], 0);
    if txtId.CanFocus then
       txtId.SetFocus;
  end
  else
  ModalResult:= mrOk;
end;

procedure TGetAccountCredentials.FormCreate(Sender: TObject);
begin
   Self.Position := poScreenCenter;
end;

end.
