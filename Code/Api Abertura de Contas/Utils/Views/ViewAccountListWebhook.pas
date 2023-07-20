unit ViewAccountListWebhook;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TAccountListWebhook = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    txtInicio: TEdit;
    txtFim: TEdit;
    txtPGAtual: TEdit;
    txtPGItens: TEdit;
    btnCancelar: TButton;
    btnListar: TButton;
    procedure btnCancelarClick(Sender: TObject);
    procedure btnListarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    function getFilters: String;
  public
    { Public declarations }
    property Filters: String read getFilters;
  end;

var
  AccountListWebhook: TAccountListWebhook;

implementation

{$R *.dfm}

{ TAccountListWebhook }

procedure TAccountListWebhook.btnCancelarClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TAccountListWebhook.btnListarClick(Sender: TObject);
begin
   if txtInicio.Text = EmptyStr then
  begin
    MessageDlg('O campo Início não pode ser vazio', TMsgDlgType.mtInformation, [TMsgDlgBtn.mbOK], 0);
    if txtInicio.CanFocus then
       txtInicio.SetFocus;
  end
  else if txtFim.Text = EmptyStr then
  begin
    MessageDlg('O campo Fim não pode ser vazio', TMsgDlgType.mtInformation, [TMsgDlgBtn.mbOK], 0);
    if txtFim.CanFocus then
       txtFim.SetFocus;
  end
  else
  ModalResult := mrOk;
end;

procedure TAccountListWebhook.FormCreate(Sender: TObject);
begin
  Self.Position := poScreenCenter;
end;

function TAccountListWebhook.getFilters: String;
var
  Url: String;
begin
  Url := '?inicio=' + txtInicio.Text + '&fim=' + txtFim.Text;


  if (txtPGAtual.Text <> EmptyStr) then
    Url := Url + '&paginacao.paginaAtual=' + txtPGAtual.Text;

  if (txtPGItens.Text <> EmptyStr) then
    Url := Url + '&paginacao.itensPorPagina=' + txtPGItens.Text;



  Result := Url;

end;

end.
