unit ViewOfRefundImmediateCharge;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  BodyOfImmediateClass, XSuperJSON, XSuperObject, System.JSON, System.UITypes;

type
  TViewOfRefundImmediateCharge = class(TForm)
    GroupBox3: TGroupBox;
    txtIdemKey: TEdit;
    Label1: TLabel;
    btnConfirmRequest: TButton;
    btnCancelRequest: TButton;
    GroupBox1: TGroupBox;
    txtValor: TEdit;
    GroupBox2: TGroupBox;
    txtIDPagamento: TEdit;
    procedure btnConfirmRequestClick(Sender: TObject);
    procedure btnCancelRequestClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    function GetBody: String;
    function GetIdemKey: String;
    function GetIDPagamento: String;
  public
    property Body: String read GetBody;
    property IdemKey: String read GetIdemKey;
    property IDPagamento: String read GetIDPagamento;
    procedure ClearRequestfields;
  end;

implementation

{$R *.dfm}

procedure TViewOfRefundImmediateCharge.FormCreate(Sender: TObject);
begin
  Self.Position := poScreenCenter;
end;

function TViewOfRefundImmediateCharge.GetIdemKey: String;
begin
  Result := txtIdemKey.Text;
end;

function TViewOfRefundImmediateCharge.GetIDPagamento: String;
begin
  Result := txtIDPagamento.Text;
end;

procedure TViewOfRefundImmediateCharge.btnCancelRequestClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TViewOfRefundImmediateCharge.btnConfirmRequestClick(Sender: TObject);
begin
  if txtIdemKey.Text = '' then
  begin
    MessageDlg('Idempotency Key é obrigatório!', TMsgDlgType.mtInformation, [TMsgDlgBtn.mbOK], 0);
    txtIdemKey.SetFocus;
    Exit;
  end;
  if txtValor.Text = '' then
  begin
    MessageDlg('Valor é obrigatório!', TMsgDlgType.mtInformation, [TMsgDlgBtn.mbOK], 0);
    txtValor.SetFocus;
    Exit;
  end;
  if txtIDPagamento.Text = '' then
  begin
    MessageDlg('Identificador do Pagamento é obrigatório!', TMsgDlgType.mtInformation, [TMsgDlgBtn.mbOK], 0);
    txtIDPagamento.SetFocus;
    Exit;
  end;

  ModalResult := mrOk;
end;

function TViewOfRefundImmediateCharge.GetBody: String;
var
  ImmediateCharge: TBodyOfImmediate;
  Valor: String;
  BodyRequest: ISuperObject;
begin
  ImmediateCharge := TBodyOfImmediate.Create;
  try
    ImmediateCharge.Valor := Trim(txtValor.Text);

    BodyRequest := SO(ImmediateCharge.AsJSON(False, False));

    BodyRequest.Remove('pagador');
    BodyRequest.Remove('favorecido');
    BodyRequest.Remove('pagamento');

    Result := BodyRequest.AsJSON;
  finally
    ImmediateCharge.Free;
  end;
end;

procedure TViewOfRefundImmediateCharge.ClearRequestfields;
begin
  txtIdemKey.Text := '';
  txtValor.Text   := '';
  txtIDPagamento.Text   := '';
end;

end.
