unit MainOpenFinance;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TfrmOpenFinance = class(TForm)
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
    dropDownParticipantes: TPanel;
    dropDownPagamentos: TPanel;
    optConfiguracao: TPanel;
    ofConfigDetail: TButton;
    ofConfigUpdate: TButton;
    optParticipantes: TPanel;
    ofListParticipants: TButton;
    optPagamentos: TPanel;
    ofStartPixPayment: TButton;
    ofListPixPayment: TButton;
    procedure txtCertFileClick(Sender: TObject);
    procedure btnAuthenticationClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ofConfigUpdateClick(Sender: TObject);
    procedure dropDownConfiguracaoClick(Sender: TObject);
    procedure ofConfigDetailClick(Sender: TObject);
    procedure ofListParticipantsClick(Sender: TObject);
    procedure ofStartPixPaymentClick(Sender: TObject);
    procedure ofListPixPaymentClick(Sender: TObject);
    procedure dropDownParticipantesClick(Sender: TObject);
    procedure dropDownPagamentosClick(Sender: TObject);


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
  frmOpenFinance: TfrmOpenFinance;

implementation
uses
  ofAuthenticationEndpoint, ofConfigEndpoints, ofParticipantsEndpoints, ofPaymentPixEndpoints;

{$R *.dfm}

{ TMainOpenFinances }

procedure TfrmOpenFinance.btnAuthenticationClick(Sender: TObject);
begin
  ofAuthenticationEndpoint.OauthToken;
end;

function TfrmOpenFinance.GetCertFile: String;
begin
  if not FileExists(txtCertFile.Text) then
  begin
    selecionaOpenDialog.Execute;
    txtCertFile.Text := selecionaOpenDialog.FileName;
  end;

  Result := txtCertFile.Text;
end;

function TfrmOpenFinance.GetClientID: String;
begin
      Result :=  txtClientId.Text;
end;

function TfrmOpenFinance.GetClientSecret: String;
begin
     Result :=  txtClientSecret.Text;
end;

function TfrmOpenFinance.GetEnviroment: String;
begin
    if CheckBoxSandbox.Checked then
    Result := 'https://openfinance-h.api.efipay.com.br/v1'
  else
    Result := 'https://openfinance.api.efipay.com.br/v1';
end;

procedure TfrmOpenFinance.ofConfigDetailClick(Sender: TObject);
begin
     ofConfigEndpoints.ofConfigDetail;
end;

procedure TfrmOpenFinance.ofConfigUpdateClick(Sender: TObject);
begin
    ofConfigEndpoints.ofConfigUpdate;
end;

procedure TfrmOpenFinance.ofListParticipantsClick(Sender: TObject);
begin
      ofParticipantsEndpoints.ofListParticipants;
end;

procedure TfrmOpenFinance.ofListPixPaymentClick(Sender: TObject);
begin
  ofPaymentPixEndpoints.ofListPixPayment;
end;

procedure TfrmOpenFinance.ofStartPixPaymentClick(Sender: TObject);
begin
  ofPaymentPixEndpoints.ofStartPixPayment
end;

procedure TfrmOpenFinance.dropDownConfiguracaoClick(Sender: TObject);
begin
    optConfiguracao.Visible := not optConfiguracao.Visible;
end;

procedure TfrmOpenFinance.dropDownPagamentosClick(Sender: TObject);
begin
      optPagamentos.Visible := not optPagamentos.Visible;
end;

procedure TfrmOpenFinance.dropDownParticipantesClick(Sender: TObject);
begin
    optParticipantes.Visible :=  not optParticipantes.Visible;
end;

procedure TfrmOpenFinance.FormCreate(Sender: TObject);
begin
  frmOpenFinance.Position := poScreenCenter;
  memoResponse.Text := '';
end;




procedure TfrmOpenFinance.txtCertFileClick(Sender: TObject);
begin
    txtCertFile.Text := GetCertFile;
end;

end.
