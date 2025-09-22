unit ViewOfCreateBiometricEnrollment;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  BodyOfBiometricClass, XSuperJSON, XSuperObject, System.JSON, System.UITypes;

type
  TViewOfCreateBiometricEnrollment = class(TForm)
    GroupBox3: TGroupBox;
    txtIdemKey: TEdit;
    Label1: TLabel;
    btnConfirmRequest: TButton;
    btnCancelRequest: TButton;
    GroupBox1: TGroupBox;
    txtIDParticipante: TEdit;
    GroupBox2: TGroupBox;
    txtCPF: TEdit;
    GroupBox4: TGroupBox;
    txtCNPJ: TEdit;
    procedure btnConfirmRequestClick(Sender: TObject);
    procedure btnCancelRequestClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    function GetBody: String;
    function GetIdemKey: String;
  public
    property Body: String read GetBody;
    property IdemKey: String read GetIdemKey;
    procedure ClearRequestfields;
  end;

implementation

{$R *.dfm}

procedure TViewOfCreateBiometricEnrollment.FormCreate(Sender: TObject);
begin
  Self.Position := poScreenCenter;
end;

function TViewOfCreateBiometricEnrollment.GetIdemKey: String;
begin
  Result := txtIdemKey.Text;
end;

procedure TViewOfCreateBiometricEnrollment.btnCancelRequestClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TViewOfCreateBiometricEnrollment.btnConfirmRequestClick(Sender: TObject);
begin
  if txtIdemKey.Text = '' then
  begin
    MessageDlg('Idempotency Key é obrigatório!', TMsgDlgType.mtInformation, [TMsgDlgBtn.mbOK], 0);
    txtIdemKey.SetFocus;
    Exit;
  end;
  if txtIDParticipante.Text = '' then
  begin
    MessageDlg('ID do Participante é obrigatório!', TMsgDlgType.mtInformation, [TMsgDlgBtn.mbOK], 0);
    txtIDParticipante.SetFocus;
    Exit;
  end;
  if txtCPF.Text = '' then
  begin
    MessageDlg('CPF é obrigatório!', TMsgDlgType.mtInformation, [TMsgDlgBtn.mbOK], 0);
    txtCPF.SetFocus;
    Exit;
  end;

  ModalResult := mrOk;
end;

function TViewOfCreateBiometricEnrollment.GetBody: String;
var
  BiometricCharge: TBodyOfBiometric;
  Pagador: TPagador;
  BodyRequest: ISuperObject;
begin
  BiometricCharge := TBodyOfBiometric.Create;
  try
    Pagador.idParticipante := Trim(txtIDParticipante.Text);
    Pagador.cpf := Trim(txtCPF.Text);
    Pagador.cpf := Trim(txtCNPJ.Text);
    BiometricCharge.Pagador := Pagador;

    BodyRequest := SO(BiometricCharge.AsJSON(False, False));

    if Trim(txtCNPJ.Text) = '' then
    begin
      if BodyRequest.Check('pagador') and BodyRequest.O['pagador'].Check('cnpj') then
        BodyRequest.O['pagador'].Remove('cnpj');
    end;

    BodyRequest.Remove('favorecido');
    BodyRequest.Remove('pagamento');
    BodyRequest.Remove('identificadorVinculo');
    BodyRequest.Remove('motivo');

    Result := BodyRequest.AsJSON;
  finally
    BiometricCharge.Free;
  end;
end;

procedure TViewOfCreateBiometricEnrollment.ClearRequestfields;
begin
  txtIdemKey.Text := '';
  txtIDParticipante.Text   := '';
  txtCPF.Text   := '';
  txtCNPJ.Text   := '';
end;

end.
