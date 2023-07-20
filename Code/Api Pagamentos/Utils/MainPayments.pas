unit MainPayments;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, XSuperObject;

type
  TMainPayment = class(TForm)
    GroupBox1: TGroupBox;
    txtClientId: TEdit;
    txtClientSecret: TEdit;
    txtCertFile: TEdit;
    CheckBoxSandbox: TCheckBox;
    Panel1: TPanel;
    Button1: TButton;
    optGetCharges: TPanel;
    payDetailIdPayment: TButton;
    payListPayments: TButton;
    dropDownChargePayment: TPanel;
    optInitCharges: TPanel;
    payBarcode: TButton;
    memoResponse: TMemo;
    selecionaOpenDialog: TOpenDialog;
    dropDownChargesDetails: TPanel;
    teste2: TLabel;
    payDetailBarCode: TButton;
    procedure FormCreate(Sender: TObject);
    procedure txtCertFileClick(Sender: TObject);
    procedure dropDownChargesDetailsClick(Sender: TObject);
    procedure dropDownChargePaymentClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure payDetailBarCodeClick(Sender: TObject);
    procedure payBarcodeClick(Sender: TObject);
    procedure payDetailIdPaymentClick(Sender: TObject);
    procedure payListPaymentsClick(Sender: TObject);


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
  fmrPayments: TMainPayment;

implementation

{$R *.dfm}
uses
  BasicAuthentication, ChargesPaymentsEndpoints;

procedure TMainPayment.Button1Click(Sender: TObject);
begin
  BasicAuthentication.OauthToken;
end;

procedure TMainPayment.payBarcodeClick(Sender: TObject);
begin
    ChargesPaymentsEndpoints.payRequestBarCode;
end;

procedure TMainPayment.dropDownChargePaymentClick(Sender: TObject);
begin
           optInitCharges.Visible  := not optInitCharges.Visible;
end;

procedure TMainPayment.dropDownChargesDetailsClick(Sender: TObject);
begin
       optGetCharges.Visible :=  not optGetCharges.Visible;
end;

procedure TMainPayment.FormCreate(Sender: TObject);
begin
  fmrPayments.Position := poScreenCenter;
  memoResponse.Text := '';
end;





procedure TMainPayment.txtCertFileClick(Sender: TObject);
begin
txtCertFile.Text := GetCertFile;
end;

function TMainPayment.GetCertFile: String;
begin
  if not FileExists(txtCertFile.Text) then
  begin
    selecionaOpenDialog.Execute;
    txtCertFile.Text := selecionaOpenDialog.FileName;
  end;

  Result := txtCertFile.Text;

end;

function TMainPayment.GetClientID: String;
begin
  Result :=  txtClientId.Text;
end;

function TMainPayment.GetClientSecret: String;
begin
  Result := txtClientSecret.Text;
end;

function TMainPayment.GetEnviroment: String;
begin
  if CheckBoxSandbox.Checked then
    Result := ''
  else
    Result := 'https://pagarcontas.api.efipay.com.br/v1';
end;

procedure TMainPayment.payDetailBarCodeClick(Sender: TObject);
begin
  ChargesPaymentsEndpoints.payDetailBarCode;
end;



procedure TMainPayment.payDetailIdPaymentClick(Sender: TObject);
begin
        ChargesPaymentsEndpoints.payDetailPayment;
end;

procedure TMainPayment.payListPaymentsClick(Sender: TObject);
begin
          ChargesPaymentsEndpoints.payListPayments;
end;

end.
