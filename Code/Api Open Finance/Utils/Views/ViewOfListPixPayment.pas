unit ViewOfListPixPayment;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TOfListPixPayment = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    txtInicio: TEdit;
    txtFim: TEdit;
    txtStatus: TEdit;
    txtIdentificador: TEdit;
    txtPGAtual: TEdit;
    txtPGItens: TEdit;
    btnCancelar: TButton;
    btnListar: TButton;
    procedure btnListarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
     procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    function getFilters: String;
  public
    { Public declarations }
    property Filters: String read getFilters;
    procedure ClearRequestfields;
  end;

var
  OfListPixPayment: TOfListPixPayment;

implementation

{$R *.dfm}

{ TOfListPixPayment }

procedure TOfListPixPayment.btnCancelarClick(Sender: TObject);
begin
    ModalResult := mrCancel;
end;

procedure TOfListPixPayment.btnListarClick(Sender: TObject);
begin
  if txtInicio.Text = EmptyStr then
  begin
    MessageDlg('A data de iníco  não pode ser vazia', TMsgDlgType.mtInformation, [TMsgDlgBtn.mbOK], 0);
    if txtInicio.CanFocus then
       txtInicio.SetFocus;
  end

  else if txtFim.Text = EmptyStr then
  begin
    MessageDlg('A data de fim  não pode ser vazia', TMsgDlgType.mtInformation, [TMsgDlgBtn.mbOK], 0);
    if txtFim.CanFocus then
       txtFim.SetFocus;
  end
  else
    ModalResult := mrOk;
end;

procedure TOfListPixPayment.ClearRequestfields;
begin
  txtInicio.Text := '';
  txtFim.Text := '';
  txtStatus.Text := '';
  txtIdentificador.Text := '';
  txtPGAtual.Text := '';
  txtPGItens.Text := '';
end;

procedure TOfListPixPayment.FormCreate(Sender: TObject);
begin
    Self.Position := poScreenCenter;
end;

function TOfListPixPayment.getFilters: String;
var
  Url: String;
begin
  Url := '?inicio=' + txtInicio.Text + '&fim=' + txtFim.Text;


  if (txtStatus.Text <> EmptyStr) then
    Url := Url + '&status=' + txtStatus.Text;

  if (txtIdentificador.Text <> EmptyStr) then
    Url := Url + '&identificador=' + txtIdentificador.Text;

  if (txtPGAtual.Text <> EmptyStr) then
    Url := Url + '&pagina=' + txtPGAtual.Text;

  if (txtPGItens.Text <> EmptyStr) then
    Url := Url + '&quantidade=' + txtPGItens.Text;


  Result := Url;

end;

end.
