unit MainAberturaContas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TfrmAberturaDeContas = class(TForm)
    GroupBox1: TGroupBox;
    teste2: TLabel;
    txtClientId: TEdit;
    txtClientSecret: TEdit;
    txtCertFile: TEdit;
    CheckBoxSandbox: TCheckBox;
    Panel1: TPanel;
    btnAuthentication: TButton;
    memoResponse: TMemo;
    selecionaOpenDialog: TOpenDialog;
    dropDownConfiguracao: TPanel;
    optCadastro: TPanel;
    getAccountCredentials: TButton;
    createAccount: TButton;
    getAccountCertificate: TButton;
    dropDownWebhook: TPanel;
    optWebhook: TPanel;
    ofListParticipants: TButton;
    accountDetailWebhook: TButton;
    accountDeleteWebhook: TButton;
    accountListWebhook: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btnAuthenticationClick(Sender: TObject);
    procedure txtCertFileClick(Sender: TObject);
    procedure createAccountClick(Sender: TObject);
    procedure dropDownConfiguracaoClick(Sender: TObject);
    procedure getAccountCredentialsClick(Sender: TObject);
    procedure getAccountCertificateClick(Sender: TObject);
    procedure ofListParticipantsClick(Sender: TObject);
    procedure accountDetailWebhookClick(Sender: TObject);
    procedure dropDownWebhookClick(Sender: TObject);
    procedure accountDeleteWebhookClick(Sender: TObject);
    procedure accountListWebhookClick(Sender: TObject);

  private
    { Private declarations }
    function GetCertFile: String;
    function GetClientID: String;
    function GetClientSecret : String;
    function GetEnviroment : String;
  public
    { Public declarations }
     property ClientID: String read GetClientID;
     property ClientSecret: String read GetClientSecret;
     property Enviroment : String read GetEnviroment;
     property CertFilePem : String read GetCertFile;
  end;

var
  frmAberturaDeContas: TfrmAberturaDeContas;

implementation
uses
  acAuthenticationEndpoint,acCreateAccountEndpoints ;

{$R *.dfm}

{ TForm1 }

procedure TfrmAberturaDeContas.btnAuthenticationClick(Sender: TObject);
begin
  acAuthenticationEndpoint.OauthToken;
end;

procedure TfrmAberturaDeContas.accountDeleteWebhookClick(Sender: TObject);
begin
  acCreateAccountEndpoints.accountDeleteWebhook;
end;

procedure TfrmAberturaDeContas.accountDetailWebhookClick(Sender: TObject);
begin
  acCreateAccountEndpoints.accountDetailWebhook;
end;

procedure TfrmAberturaDeContas.accountListWebhookClick(Sender: TObject);
begin
    acCreateAccountEndpoints.accountListWebhook;
end;

procedure TfrmAberturaDeContas.createAccountClick(Sender: TObject);
begin
  acCreateAccountEndpoints.createAccount;
end;

procedure TfrmAberturaDeContas.dropDownConfiguracaoClick(Sender: TObject);
begin
  optCadastro.Visible := not optCadastro.Visible;
end;

procedure TfrmAberturaDeContas.dropDownWebhookClick(Sender: TObject);
begin
    optWebhook.Visible := not optWebhook.Visible;
end;

procedure TfrmAberturaDeContas.FormCreate(Sender: TObject);
begin
  frmAberturaDeContas.Position := poScreenCenter;
  memoResponse.Text := '';
end;

procedure TfrmAberturaDeContas.getAccountCertificateClick(Sender: TObject);
begin
  acCreateAccountEndpoints.getAccountCertificate;
end;

procedure TfrmAberturaDeContas.getAccountCredentialsClick(Sender: TObject);
begin
  acCreateAccountEndpoints.getAccountCredentials;
end;

function TfrmAberturaDeContas.GetCertFile: String;
begin
  if not FileExists(txtCertFile.Text) then
  begin
    selecionaOpenDialog.Execute;
    txtCertFile.Text := selecionaOpenDialog.FileName;
  end;

  Result := txtCertFile.Text;
end;

function TfrmAberturaDeContas.GetClientID: String;
begin
    Result :=  txtClientId.Text;
end;

function TfrmAberturaDeContas.GetClientSecret: String;
begin
     Result :=  txtClientSecret.Text;
end;

function TfrmAberturaDeContas.GetEnviroment: String;
begin
    if CheckBoxSandbox.Checked then
      Result := ''
    else
      Result := 'https://abrircontas.api.efipay.com.br/v1';
end;

procedure TfrmAberturaDeContas.ofListParticipantsClick(Sender: TObject);
begin
  acCreateAccountEndpoints.accountConfigWebhook;
end;

procedure TfrmAberturaDeContas.txtCertFileClick(Sender: TObject);
begin
      txtCertFile.Text := GetCertFile;
end;

end.
