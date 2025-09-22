unit ViewOfUpdateAutomaticEnrollment;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  BodyOfAutomaticClass, XSuperJSON, XSuperObject, System.JSON, System.UITypes;

type
  TViewOfUpdateAutomaticEnrollment = class(TForm)
    GroupBox3: TGroupBox;
    btnConfirmRequest: TButton;
    btnCancelRequest: TButton;
    GroupBox2: TGroupBox;
    txtIDAdesao: TEdit;
    GroupBox4: TGroupBox;
    Label1: TLabel;
    txtIdemKey: TEdit;
    cmbStatus: TComboBox;
    procedure btnConfirmRequestClick(Sender: TObject);
    procedure btnCancelRequestClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    procedure InicializarComboBoxes;
    function GetBody: String;
    function GetIdemKey: String;
  public
    property Body: String read GetBody;
    property IdemKey: String read GetIdemKey;
    procedure ClearRequestfields;
  end;

implementation

{$R *.dfm}

procedure TViewOfUpdateAutomaticEnrollment.FormCreate(Sender: TObject);
begin
  Self.Position := poScreenCenter;
  InicializarComboBoxes;
end;

function TViewOfUpdateAutomaticEnrollment.GetIdemKey: String;
begin
  Result := txtIdemKey.Text;
end;

procedure TViewOfUpdateAutomaticEnrollment.InicializarComboBoxes;
begin
  cmbStatus.Items.Clear;
  cmbStatus.Items.Add('revogado');
end;

procedure TViewOfUpdateAutomaticEnrollment.btnCancelRequestClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TViewOfUpdateAutomaticEnrollment.btnConfirmRequestClick(Sender: TObject);
begin
  if txtIdemKey.Text = '' then
  begin
    MessageDlg('Idempotency Key é obrigatório!', TMsgDlgType.mtInformation, [TMsgDlgBtn.mbOK], 0);
    txtIdemKey.SetFocus;
    Exit;
  end;
  if txtIDAdesao.Text = '' then
  begin
    MessageDlg('Identificador do Vínculo é obrigatório!', TMsgDlgType.mtInformation, [TMsgDlgBtn.mbOK], 0);
    txtIdemKey.SetFocus;
    Exit;
  end;
  if cmbStatus.ItemIndex = -1 then
  begin
    MessageDlg('Status é obrigatório!', TMsgDlgType.mtInformation, [TMsgDlgBtn.mbOK], 0);
    txtIdemKey.SetFocus;
    Exit;
  end;

  ModalResult := mrOk;
end;

function TViewOfUpdateAutomaticEnrollment.GetBody: String;
var
  AutomaticCharge: TBodyOfAutomatic;
  BodyRequest: ISuperObject;
begin
  AutomaticCharge := TBodyOfAutomatic.Create;
  try
    AutomaticCharge.Identificador := Trim(txtIDAdesao.Text);
    AutomaticCharge.Status := cmbStatus.Text;

    BodyRequest := SO(AutomaticCharge.AsJSON(False, False));

    BodyRequest.Remove('pagador');
    BodyRequest.Remove('favorecido');
    BodyRequest.Remove('assinatura');
    BodyRequest.Remove('identificadorAdesao');
    BodyRequest.Remove('pagamento');
    BodyRequest.Remove('endToEndId');

    Result := BodyRequest.AsJSON;
  finally
    AutomaticCharge.Free;
  end;
end;

procedure TViewOfUpdateAutomaticEnrollment.ClearRequestfields;
begin
  txtIdemKey.Text := '';
  txtIDAdesao.Text := '';
  cmbStatus.ItemIndex := -1;
end;

end.
