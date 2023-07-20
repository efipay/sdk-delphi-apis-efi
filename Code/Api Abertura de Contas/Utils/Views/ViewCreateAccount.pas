unit ViewCreateAccount;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, BodyCreateAccount,xSuperObject, xSuperJSON, System.UITypes;

type
  TCreateAccount = class(TForm)
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    txtNome: TEdit;
    Label2: TLabel;
    txtCpf: TEdit;
    Label3: TLabel;
    txtDataNascimento: TEdit;
    Label4: TLabel;
    txtNomeMae: TEdit;
    Label5: TLabel;
    txtCelular: TEdit;
    Label6: TLabel;
    txtEmail: TEdit;
    optPessoaJuridica: TCheckBox;
    lbRazaoSocial: TLabel;
    txtRazaoSocial: TEdit;
    lbCnpj: TLabel;
    txtCnpj: TEdit;
    GroupBox3: TGroupBox;
    Label7: TLabel;
    txtLogradouro: TEdit;
    Label8: TLabel;
    txtCep: TEdit;
    Label9: TLabel;
    txtEstado: TEdit;
    Label10: TLabel;
    txtCidade: TEdit;
    Label11: TLabel;
    txtBairro: TEdit;
    Label12: TLabel;
    txtNumero: TEdit;
    Label13: TLabel;
    txtComplemento: TEdit;
    Label14: TLabel;
    optSms: TCheckBox;
    optWhatsApp: TCheckBox;
    Label15: TLabel;
    txtEscopos: TEdit;
    btnCancelar: TButton;
    btnCriar: TButton;
    procedure btnCriarClick(Sender: TObject);
    procedure optPessoaJuridicaClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    function GetBody : String;
  public
    { Public declarations }
    property Body: String read GetBody;
  end;

var
  CreateAccount: TCreateAccount;

implementation

{$R *.dfm}

procedure TCreateAccount.btnCancelarClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TCreateAccount.btnCriarClick(Sender: TObject);
begin
  if txtNome.Text = EmptyStr then
  begin
    MessageDlg('O campo nome não pode ser vazio', TMsgDlgType.mtInformation, [TMsgDlgBtn.mbOK], 0);
    if txtNome.CanFocus then
       txtNome.SetFocus;
  end
  else if txtCpf.Text = EmptyStr then
  begin
    MessageDlg('O campo cpf não pode ser vazio', TMsgDlgType.mtInformation, [TMsgDlgBtn.mbOK], 0);
    if txtCpf.CanFocus then
       txtCpf.SetFocus;
  end
  else if txtDataNascimento.Text = EmptyStr then
  begin
    MessageDlg('O campo data de nascimento não pode ser vazio', TMsgDlgType.mtInformation, [TMsgDlgBtn.mbOK], 0);
    if txtDataNascimento.CanFocus then
       txtDataNascimento.SetFocus;
  end
  else if txtCelular.Text = EmptyStr then
  begin
    MessageDlg('O campo celular não pode ser vazio', TMsgDlgType.mtInformation, [TMsgDlgBtn.mbOK], 0);
    if txtCelular.CanFocus then
       txtCelular.SetFocus;
  end
  else if txtEmail.Text = EmptyStr then
  begin
    MessageDlg('O campo e-mail não pode ser vazio', TMsgDlgType.mtInformation, [TMsgDlgBtn.mbOK], 0);
    if txtEmail.CanFocus then
       txtEmail.SetFocus;
  end
  else if txtLogradouro.Text = EmptyStr then
  begin
    MessageDlg('O campo logradouro não pode ser vazio', TMsgDlgType.mtInformation, [TMsgDlgBtn.mbOK], 0);
    if txtLogradouro.CanFocus then
       txtLogradouro.SetFocus;
  end
  else if txtCep.Text = EmptyStr then
  begin
    MessageDlg('O campo cep não pode ser vazio', TMsgDlgType.mtInformation, [TMsgDlgBtn.mbOK], 0);
    if txtCep.CanFocus then
       txtCep.SetFocus;
  end
  else if txtEstado.Text = EmptyStr then
  begin
    MessageDlg('O campo estado não pode ser vazio', TMsgDlgType.mtInformation, [TMsgDlgBtn.mbOK], 0);
    if txtEstado.CanFocus then
       txtEstado.SetFocus;
  end
 else if txtCidade.Text = EmptyStr then
  begin
    MessageDlg('O campo cidade não pode ser vazio', TMsgDlgType.mtInformation, [TMsgDlgBtn.mbOK], 0);
    if txtCidade.CanFocus then
       txtCidade.SetFocus;
  end
 else if txtBairro.Text = EmptyStr then
  begin
    MessageDlg('O campo bairro não pode ser vazio', TMsgDlgType.mtInformation, [TMsgDlgBtn.mbOK], 0);
    if txtBairro.CanFocus then
       txtBairro.SetFocus;
  end
 else if txtNumero.Text = EmptyStr then
  begin
    MessageDlg('O campo número não pode ser vazio', TMsgDlgType.mtInformation, [TMsgDlgBtn.mbOK], 0);
    if txtNumero.CanFocus then
       txtNumero.SetFocus;
  end
  else if txtEscopos.Text = EmptyStr then
  begin
    MessageDlg('O campo escopos  não pode ser vazio', TMsgDlgType.mtInformation, [TMsgDlgBtn.mbOK], 0);
    if txtEscopos.CanFocus then
       txtEscopos.SetFocus;
  end
  else if optPessoaJuridica.Checked then
  begin
    if txtRazaoSocial.Text = EmptyStr then
    begin
       MessageDlg('O campo razão social  não pode ser vazio', TMsgDlgType.mtInformation, [TMsgDlgBtn.mbOK], 0);

      if txtRazaoSocial.CanFocus then
         txtRazaoSocial.SetFocus;
    end
    else if txtCnpj.Text = EmptyStr then
    begin
      MessageDlg('O campo cnpj  não pode ser vazio', TMsgDlgType.mtInformation, [TMsgDlgBtn.mbOK], 0);
      if txtCnpj.CanFocus then
         txtCnpj.SetFocus;
    end
    else
      ModalResult := mrOk;
  end
  else
  ModalResult := mrOk;
end;

procedure TCreateAccount.FormCreate(Sender: TObject);
begin
    Self.Position := poScreenCenter;
end;

function TCreateAccount.GetBody: String;
var
  ClassCreateAccount      : TBodyCreateAccount;
  FEndereco               : TEndereco;
  FClientePessoaFisica    : TClientePessoaFisica;
  FClientePessoaJuridica  : TClientePessoaJuridica;
  BodyRequest, Cliente, Endereco : ISuperObject;

begin
    ClassCreateAccount:= TBodyCreateAccount.Create;
      FEndereco.cep:= txtCep.Text;
      FEndereco.estado:= txtEstado.Text;
      FEndereco.cidade:= txtCidade.Text;
      FEndereco.bairro:= txtBairro.Text;
      FEndereco.logradouro:= txtLogradouro.Text;
      FEndereco.numero:= txtNumero.Text;
      FEndereco.complemento:= txtComplemento.Text;



     if optPessoaJuridica.Checked then
     begin
        FClientePessoaJuridica:= TClientePessoaJuridica.Create;
        FClientePessoaJuridica.Cpf := txtCpf.Text;
        FClientePessoaJuridica.NomeCompleto := txtNome.Text;
        FClientePessoaJuridica.DataNascimento := txtDataNascimento.Text;
        FClientePessoaJuridica.NomeMae := txtNomeMae.Text;
        FClientePessoaJuridica.Celular := txtCelular.Text;
        FClientePessoaJuridica.Email := txtEmail.Text;
        FClientePessoaJuridica.Cnpj := txtCnpj.Text;
        FClientePessoaJuridica.RazaoSocial := txtRazaoSocial.Text;
        FClientePessoaJuridica.Endereco := FEndereco;
        ClassCreateAccount.Cliente :=  FClientePessoaJuridica;
     end
     else
     begin
        FClientePessoaFisica:= TClientePessoaFisica.Create;
        FClientePessoaFisica.Cpf := txtCpf.Text;
        FClientePessoaFisica.NomeCompleto := txtNome.Text;
        FClientePessoaFisica.DataNascimento := txtDataNascimento.Text;
        FClientePessoaFisica.NomeMae := txtNomeMae.Text;
        FClientePessoaFisica.Celular := txtCelular.Text;
        FClientePessoaFisica.Email := txtEmail.Text;
        FClientePessoaFisica.Endereco := FEndereco;
        ClassCreateAccount.Cliente :=  FClientePessoaFisica;
     end;
     BodyRequest := SO(ClassCreateAccount.AsJSON(false,false));
     with BodyRequest.A['meioDeNotificacao']do
     begin
       if optSms.Checked then
         Add('sms');
       if optWhatsApp.Checked then
        Add('whatsapp');
     end;

     with BodyRequest.A['escoposIntegrados']do
     begin
        Add(txtEscopos.Text);
     end;

     if txtNomeMae.Text = EmptyStr then
     begin
          Cliente := BodyRequest.O['clienteFinal'];
          Cliente.Remove('nomeMae');
          BodyRequest.SetData('clienteFinal',Cliente );
     end;
     if txtComplemento.Text = EmptyStr then
     begin
          Cliente := BodyRequest.O['clienteFinal'];
          Endereco := Cliente.O['endereco'];
          Endereco.Remove('complemento');
          Cliente.SetData('endereco',Endereco);
          BodyRequest.SetData('clienteFinal',Cliente );
     end;

     Result := BodyRequest.AsJSON;

end;

procedure TCreateAccount.optPessoaJuridicaClick(Sender: TObject);
begin
    lbRazaoSocial.Visible := optPessoaJuridica.Checked;
    lbCnpj.Visible := optPessoaJuridica.Checked;
    txtRazaoSocial.Visible := optPessoaJuridica.Checked;
    txtCnpj.Visible := optPessoaJuridica.Checked;

end;

end.
