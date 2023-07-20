unit ViewPixListDueCharges;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TPixListDueCharges = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    txtInicio: TEdit;
    Label2: TLabel;
    txtFim: TEdit;
    Label3: TLabel;
    txtCPF: TEdit;
    Label4: TLabel;
    txtCNPJ: TEdit;
    Label5: TLabel;
    txtStatus: TEdit;
    Label6: TLabel;
    txtIdLote: TEdit;
    Label7: TLabel;
    txtPGAtual: TEdit;
    Label8: TLabel;
    txtPGItens: TEdit;
    txtLocation: TCheckBox;
    Button1: TButton;
    btnListar: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btnListarClick(Sender: TObject);
  private
    { Private declarations }
    function getFilters: String;
  public
    { Public declarations }
    property Filters: String read getFilters;
    procedure ClearRequestfields;
  end;

var
  PixListDueCharges: TPixListDueCharges;

implementation

{$R *.dfm}

{ TPixListDueCharges }

procedure TPixListDueCharges.btnListarClick(Sender: TObject);
begin
  if txtInicio.Text = EmptyStr then
  begin
    MessageDlg('A data de início não pode ser vazia', TMsgDlgType.mtInformation, [TMsgDlgBtn.mbOK], 0);
    if txtInicio.CanFocus then
       txtInicio.SetFocus;
  end

  else if txtFim.Text = EmptyStr then
  begin
    MessageDlg('A data de fim não pode ser vazia', TMsgDlgType.mtInformation, [TMsgDlgBtn.mbOK], 0);
    if txtFim.CanFocus then
       txtFim.SetFocus;
  end
  else
     ModalResult := mrOk;
end;

procedure TPixListDueCharges.ClearRequestfields;
begin
    txtInicio.Text := '';
    txtFim.Text := '';
    txtCPF.Text := '';
    txtCNPJ.Text := '';
    txtStatus.Text := '';
    txtIdLote.Text := '';
    txtPGAtual.Text := '';
    txtPGItens.Text := '';


end;

procedure TPixListDueCharges.FormCreate(Sender: TObject);
begin
    Self.Position := poScreenCenter;
end;

function TPixListDueCharges.getFilters: String;
var
  Url: String;
begin
  Url := '?inicio=' + txtInicio.Text + '&fim=' + txtFim.Text;
  if (txtCPF.Text <> EmptyStr) then
    Url := Url + '&cpf=' + txtCPF.Text;

  if (txtCNPJ.Text <> EmptyStr) then
    Url := Url + '&cnpj=' + txtCNPJ.Text;

  if (txtStatus.Text <> EmptyStr) then
    Url := Url + '&status=' + txtStatus.Text;

  if (txtIdLote.Text <> EmptyStr) then
    Url := Url + '&loteCobVId=' + txtIdLote.Text;

  if (txtPGAtual.Text <> EmptyStr) then
    Url := Url + '&paginacao.paginaAtual=' + txtPGAtual.Text;

  if (txtPGItens.Text <> EmptyStr) then
    Url := Url + '&paginacao.itensPorPagina=' + txtPGItens.Text;

  if ( txtLocation.Checked) then
    Url := Url + '&locationPresente=true';

  Result := Url;

end;

end.
