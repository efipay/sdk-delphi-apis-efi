unit ViewOfRevokeAutomaticCharge;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  BodyOfAutomaticClass, XSuperJSON, XSuperObject, System.JSON, System.UITypes;

type
  TViewOfRevokeAutomaticCharge = class(TForm)
    GroupBox3: TGroupBox;
    btnConfirmRequest: TButton;
    btnCancelRequest: TButton;
    Label3: TLabel;
    txtIdemKey: TEdit;
    GroupBox1: TGroupBox;
    txtIDAdesao: TEdit;
    GroupBox2: TGroupBox;
    txtE2EID: TEdit;
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

procedure TViewOfRevokeAutomaticCharge.FormCreate(Sender: TObject);
begin
  Self.Position := poScreenCenter;
end;

function TViewOfRevokeAutomaticCharge.GetIdemKey: String;
begin
  Result := txtIDAdesao.Text;
end;

procedure TViewOfRevokeAutomaticCharge.btnCancelRequestClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TViewOfRevokeAutomaticCharge.btnConfirmRequestClick(Sender: TObject);
begin
  if txtIdemKey.Text = EmptyStr then
  begin
    MessageDlg('Idempotency Key não pode ser vazia!', TMsgDlgType.mtInformation, [TMsgDlgBtn.mbOK], 0);
    txtIdemKey.SetFocus;
    Exit;
  end;
  if txtIDAdesao.Text = EmptyStr then
  begin
    MessageDlg('Identificador de Adesão não pode ser vazia!', TMsgDlgType.mtInformation, [TMsgDlgBtn.mbOK], 0);
    txtIDAdesao.SetFocus;
    Exit;
  end;
  if txtE2EID.Text = EmptyStr then
  begin
    MessageDlg('EndToEndID não pode ser vazio!', TMsgDlgType.mtInformation, [TMsgDlgBtn.mbOK], 0);
    txtE2EID.SetFocus;
    Exit;
  end;

  ModalResult := mrOk;
end;

function TViewOfRevokeAutomaticCharge.GetBody: String;
var
  AutomaticCharge: TBodyOfAutomatic;
  BodyRequest: ISuperObject;
begin
  AutomaticCharge := TBodyOfAutomatic.Create;
  try
    AutomaticCharge.IdentificadorAdesao := Trim(txtIDAdesao.Text);
    AutomaticCharge.EndToEndID := Trim(txtE2EID.Text);

    BodyRequest := SO(AutomaticCharge.AsJSON(False, False));

    BodyRequest.Remove('pagador');
    BodyRequest.Remove('favorecido');
    BodyRequest.Remove('assinatura');
    BodyRequest.Remove('pagamento');
    BodyRequest.Remove('identificador');
    BodyRequest.Remove('status');

    if Trim(txtE2EID.Text) = '' then
      BodyRequest.Remove('endToEndId');

    Result := BodyRequest.AsJSON;
  finally
    AutomaticCharge.Free;
  end;
end;

procedure TViewOfRevokeAutomaticCharge.ClearRequestfields;
begin
  txtIDAdesao.Text := '';
  txtE2EID.Text   := '';
end;

end.
