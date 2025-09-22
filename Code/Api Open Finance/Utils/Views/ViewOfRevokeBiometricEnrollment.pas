unit ViewOfRevokeBiometricEnrollment;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  BodyOfBiometricClass, XSuperJSON, XSuperObject, System.JSON, System.UITypes;

type
  TViewOfRevokeBiometricEnrollment = class(TForm)
    GroupBox3: TGroupBox;
    btnConfirmRequest: TButton;
    btnCancelRequest: TButton;
    GroupBox2: TGroupBox;
    txtIDVinculo: TEdit;
    GroupBox4: TGroupBox;
    txtMotivo: TEdit;
    Label1: TLabel;
    txtIdemKey: TEdit;
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

procedure TViewOfRevokeBiometricEnrollment.FormCreate(Sender: TObject);
begin
  Self.Position := poScreenCenter;
end;

function TViewOfRevokeBiometricEnrollment.GetIdemKey: String;
begin
  Result := txtIdemKey.Text;
end;

procedure TViewOfRevokeBiometricEnrollment.btnCancelRequestClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TViewOfRevokeBiometricEnrollment.btnConfirmRequestClick(Sender: TObject);
begin
  if txtIdemKey.Text = '' then
  begin
    MessageDlg('Idempotency Key é obrigatório!', TMsgDlgType.mtInformation, [TMsgDlgBtn.mbOK], 0);
    txtIdemKey.SetFocus;
    Exit;
  end;
  if txtIDVinculo.Text = '' then
  begin
    MessageDlg('Identificador do Vínculo é obrigatório!', TMsgDlgType.mtInformation, [TMsgDlgBtn.mbOK], 0);
    txtIdemKey.SetFocus;
    Exit;
  end;
  if txtMotivo.Text = '' then
  begin
    MessageDlg('Motivo é obrigatório!', TMsgDlgType.mtInformation, [TMsgDlgBtn.mbOK], 0);
    txtIdemKey.SetFocus;
    Exit;
  end;

  ModalResult := mrOk;
end;

function TViewOfRevokeBiometricEnrollment.GetBody: String;
var
  BiometricCharge: TBodyOfBiometric;
  Pagador: TPagador;
  BodyRequest: ISuperObject;
begin
  BiometricCharge := TBodyOfBiometric.Create;
  try
    BiometricCharge.IDVinculo := Trim(txtIDVinculo.Text);
    BiometricCharge.Motivo := Trim(txtMotivo.Text);

    BodyRequest := SO(BiometricCharge.AsJSON(False, False));

    BodyRequest.Remove('pagador');
    BodyRequest.Remove('favorecido');
    BodyRequest.Remove('pagamento');

    Result := BodyRequest.AsJSON;
  finally
    BiometricCharge.Free;
  end;
end;

procedure TViewOfRevokeBiometricEnrollment.ClearRequestfields;
begin
  txtIdemKey.Text   := '';
  txtIDVinculo.Text   := '';
  txtMotivo.Text   := '';
end;

end.
