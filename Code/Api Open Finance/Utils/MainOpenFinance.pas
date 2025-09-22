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
    MConfigParticipants: TPanel;
    MImmediate: TPanel;
    MSchedule: TPanel;
    SConfigParticipants: TPanel;
    ofConfigDetail: TButton;
    ofConfigUpdate: TButton;
    SSchedule: TPanel;
    SImmediate: TPanel;
    ofStartPixPayment: TButton;
    ofListPixPayment: TButton;
    ofListParticipants: TButton;
    ofDevolutionPix: TButton;
    ofCancelSchedulePix: TButton;
    ofListSchedulePixPayment: TButton;
    ofStartSchedulePixPayment: TButton;
    ofDevolutionSchedulePix: TButton;
    MBiometric: TPanel;
    SBiometric: TPanel;
    ofCreateBiometricEnrollment: TButton;
    ofListBiometricEnrollment: TButton;
    ofRevokeBiometricEnrollment: TButton;
    ofCreateBiometricPixPayment: TButton;
    ofListBiometricPixPayment: TButton;
    MRecurrency: TPanel;
    SRecurrency: TPanel;
    ofCancelRecurrencyPix: TButton;
    ofListRecurrencyPixPayment: TButton;
    ofStartRecurrencyPixPayment: TButton;
    ofDevolutionRecurrencyPix: TButton;
    ofReplaceRecurrencyPixParcel: TButton;
    MAutomatic: TPanel;
    SAutomatic: TPanel;
    ofCreateAutomaticEnrollment: TButton;
    ofListAutomaticEnrollment: TButton;
    ofUpdateAutomaticEnrollment: TButton;
    ofCreateAutomaticPixPayment: TButton;
    ofListAutomaticPixPayment: TButton;
    ofCancelAutomaticPixPayment: TButton;
    procedure txtCertFileClick(Sender: TObject);
    procedure btnAuthenticationClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ofConfigUpdateClick(Sender: TObject);
    procedure MConfigParticipantsClick(Sender: TObject);
    procedure ofConfigDetailClick(Sender: TObject);
    procedure ofListParticipantsClick(Sender: TObject);
    procedure ofStartPixPaymentClick(Sender: TObject);
    procedure ofListPixPaymentClick(Sender: TObject);
    procedure ofDevolutionPixClick(Sender: TObject);
    procedure ofCancelSchedulePixClick(Sender: TObject);
    procedure ofListSchedulePixPaymentClick(Sender: TObject);
    procedure ofStartSchedulePixPaymentClick(Sender: TObject);
    procedure ofDevolutionSchedulePixClick(Sender: TObject);
    procedure ofStartRecurrencyPixPaymentClick(Sender: TObject);
    procedure ofListRecurrencyPixPaymentClick(Sender: TObject);
    procedure ofCancelRecurrencyPixClick(Sender: TObject);
    procedure ofDevolutionRecurrencyPixClick(Sender: TObject);
    procedure ofReplaceRecurrencyPixParcelClick(Sender: TObject);
    procedure ofCreateBiometricEnrollmentClick(Sender: TObject);
    procedure ofListBiometricEnrollmentClick(Sender: TObject);
    procedure ofRevokeBiometricEnrollmentClick(Sender: TObject);
    procedure ofCreateBiometricPixPaymentClick(Sender: TObject);
    procedure ofListBiometricPixPaymentClick(Sender: TObject);
    procedure ofCreateAutomaticEnrollmentClick(Sender: TObject);
    procedure ofListAutomaticEnrollmentClick(Sender: TObject);
    procedure ofUpdateAutomaticEnrollmentClick(Sender: TObject);
    procedure ofCreateAutomaticPixPaymentClick(Sender: TObject);
    procedure ofListAutomaticPixPaymentClick(Sender: TObject);
    procedure ofCancelAutomaticPixPaymentClick(Sender: TObject);
    procedure MImmediateClick(Sender: TObject);
    procedure MScheduleClick(Sender: TObject);
    procedure MRecurrencyClick(Sender: TObject);
    procedure MBiometricClick(Sender: TObject);
    procedure MAutomaticClick(Sender: TObject);
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
  ofAuthenticationEndpoint, ofConfigEndpoints, ofParticipantsEndpoints, ofImmediatePaymentsEndpoints,
  ofSchedulePaymentsEndpoints, ofRecurrencyPaymentsEndpoints, ofBiometricPaymentsEndpoints, ofAutomaticPaymentsEndpoints;

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

/// Configurações e Participantes
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

/// Pagamentos Imediatos
procedure TfrmOpenFinance.ofListPixPaymentClick(Sender: TObject);
begin
      ofImmediatePaymentsEndpoints.ofListPixPayment;
end;

procedure TfrmOpenFinance.ofStartPixPaymentClick(Sender: TObject);
begin
      ofImmediatePaymentsEndpoints.ofStartPixPayment;
end;

procedure TfrmOpenFinance.ofDevolutionPixClick(Sender: TObject);
begin
      ofImmediatePaymentsEndpoints.ofDevolutionPix;
end;

/// Pagamentos Agendados
procedure TfrmOpenFinance.ofCancelSchedulePixClick(Sender: TObject);
begin
      ofSchedulePaymentsEndpoints.ofCancelSchedulePix;
end;

procedure TfrmOpenFinance.ofListSchedulePixPaymentClick(Sender: TObject);
begin
      ofSchedulePaymentsEndpoints.ofListSchedulePixPayment;
end;

procedure TfrmOpenFinance.ofStartSchedulePixPaymentClick(Sender: TObject);
begin
      ofSchedulePaymentsEndpoints.ofStartSchedulePixPayment;
end;

procedure TfrmOpenFinance.ofDevolutionSchedulePixClick(Sender: TObject);
begin
      ofSchedulePaymentsEndpoints.ofDevolutionSchedulePix;
end;

/// Pagamentos Recorrentes
procedure TfrmOpenFinance.ofStartRecurrencyPixPaymentClick(Sender: TObject);
begin
      ofRecurrencyPaymentsEndpoints.ofStartRecurrencyPixPayment;
end;

procedure TfrmOpenFinance.ofListRecurrencyPixPaymentClick(Sender: TObject);
begin
      ofRecurrencyPaymentsEndpoints.ofListRecurrencyPixPayment;
end;

procedure TfrmOpenFinance.ofCancelRecurrencyPixClick(Sender: TObject);
begin
      ofRecurrencyPaymentsEndpoints.ofCancelRecurrencyPix;
end;

procedure TfrmOpenFinance.ofDevolutionRecurrencyPixClick(Sender: TObject);
begin
      ofRecurrencyPaymentsEndpoints.ofDevolutionRecurrencyPix;
end;

procedure TfrmOpenFinance.ofReplaceRecurrencyPixParcelClick(Sender: TObject);
begin
      ofRecurrencyPaymentsEndpoints.ofReplaceRecurrencyPixParcel;
end;

/// Pagamentos Biométricos
procedure TfrmOpenFinance.ofCreateBiometricEnrollmentClick(Sender: TObject);
begin
      ofBiometricPaymentsEndpoints.ofCreateBiometricEnrollment;
end;

procedure TfrmOpenFinance.ofListBiometricEnrollmentClick(Sender: TObject);
begin
      ofBiometricPaymentsEndpoints.ofListBiometricEnrollment;
end;

procedure TfrmOpenFinance.ofRevokeBiometricEnrollmentClick(Sender: TObject);
begin
      ofBiometricPaymentsEndpoints.ofRevokeBiometricEnrollment;
end;

procedure TfrmOpenFinance.ofCreateBiometricPixPaymentClick(Sender: TObject);
begin
      ofBiometricPaymentsEndpoints.ofCreateBiometricPixPayment;
end;

procedure TfrmOpenFinance.ofListBiometricPixPaymentClick(Sender: TObject);
begin
      ofBiometricPaymentsEndpoints.ofListBiometricPixPayment;
end;

/// Pagamentos Automáticos
procedure TfrmOpenFinance.ofCreateAutomaticEnrollmentClick(Sender: TObject);
begin
      ofAutomaticPaymentsEndpoints.ofCreateAutomaticEnrollment;
end;

procedure TfrmOpenFinance.ofListAutomaticEnrollmentClick(Sender: TObject);
begin
      ofAutomaticPaymentsEndpoints.ofListAutomaticEnrollment;
end;

procedure TfrmOpenFinance.ofUpdateAutomaticEnrollmentClick(Sender: TObject);
begin
      ofAutomaticPaymentsEndpoints.ofUpdateAutomaticEnrollment;
end;

procedure TfrmOpenFinance.ofCreateAutomaticPixPaymentClick(Sender: TObject);
begin
      ofAutomaticPaymentsEndpoints.ofCreateAutomaticPixPayment;
end;

procedure TfrmOpenFinance.ofListAutomaticPixPaymentClick(Sender: TObject);
begin
      ofAutomaticPaymentsEndpoints.ofListAutomaticPixPayment;
end;

procedure TfrmOpenFinance.ofCancelAutomaticPixPaymentClick(Sender: TObject);
begin
      ofAutomaticPaymentsEndpoints.ofCancelAutomaticPixPayment;
end;

///

procedure TfrmOpenFinance.MConfigParticipantsClick(Sender: TObject);
begin
    SConfigParticipants.Visible := not SConfigParticipants.Visible;
end;

procedure TfrmOpenFinance.MImmediateClick(Sender: TObject);
begin
    SImmediate.Visible :=  not SImmediate.Visible;
end;

procedure TfrmOpenFinance.MScheduleClick(Sender: TObject);
begin
      SSchedule.Visible := not SSchedule.Visible;
end;

procedure TfrmOpenFinance.MRecurrencyClick(Sender: TObject);
begin
      SRecurrency.Visible := not SRecurrency.Visible;
end;

procedure TfrmOpenFinance.MBiometricClick(Sender: TObject);
begin
      SBiometric.Visible := not SBiometric.Visible;
end;

procedure TfrmOpenFinance.MAutomaticClick(Sender: TObject);
begin
      SAutomatic.Visible := not SAutomatic.Visible;
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
