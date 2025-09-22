unit ViewOfRefundScheduleCharge;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  BodyOfScheduleClass, XSuperJSON, XSuperObject, System.JSON, System.UITypes;

type
  TViewOfRefundScheduleCharge = class(TForm)
    GroupBox3: TGroupBox;
    txtIdemKey: TEdit;
    Label1: TLabel;
    btnConfirmRequest: TButton;
    btnCancelRequest: TButton;
    GroupBox1: TGroupBox;
    txtValor: TEdit;
    GroupBox2: TGroupBox;
    txtIDPagamento: TEdit;
    GroupBox4: TGroupBox;
    txtE2EID: TEdit;
    procedure btnConfirmRequestClick(Sender: TObject);
    procedure btnCancelRequestClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    function GetBody: String;
    function GetIdemKey: String;
    function GetIDPagamento: String;
    function GetEndToEndID: String;
  public
    property Body: String read GetBody;
    property IdemKey: String read GetIdemKey;
    property IDPagamento: String read GetIDPagamento;
    property endToEndID: String read GetEndToEndID;
    procedure ClearRequestfields;
  end;

implementation

{$R *.dfm}

procedure TViewOfRefundScheduleCharge.FormCreate(Sender: TObject);
begin
  Self.Position := poScreenCenter;
end;

function TViewOfRefundScheduleCharge.GetIdemKey: String;
begin
  Result := txtIdemKey.Text;
end;

function TViewOfRefundScheduleCharge.GetIDPagamento: String;
begin
  Result := txtIDPagamento.Text;
end;

function TViewOfRefundScheduleCharge.GetEndToEndID: String;
begin
  Result := txtE2EID.Text;
end;

procedure TViewOfRefundScheduleCharge.btnCancelRequestClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TViewOfRefundScheduleCharge.btnConfirmRequestClick(Sender: TObject);
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
  if txtE2EID.Text = '' then
  begin
    MessageDlg('EndToEndID é obrigatório!', TMsgDlgType.mtInformation, [TMsgDlgBtn.mbOK], 0);
    txtIDPagamento.SetFocus;
    Exit;
  end;

  ModalResult := mrOk;
end;

function TViewOfRefundScheduleCharge.GetBody: String;
var
  ScheduleCharge: TBodyOfSchedule;
  Valor: String;
  BodyRequest: ISuperObject;
begin
  ScheduleCharge := TBodyOfSchedule.Create;
  try
    ScheduleCharge.Valor := Trim(txtValor.Text);
    ScheduleCharge.endToEndId := Trim(txtE2EID.Text);

    BodyRequest := SO(ScheduleCharge.AsJSON(False, False));

    BodyRequest.Remove('pagador');
    BodyRequest.Remove('favorecido');
    BodyRequest.Remove('pagamento');

    Result := BodyRequest.AsJSON;
  finally
    ScheduleCharge.Free;
  end;
end;

procedure TViewOfRefundScheduleCharge.ClearRequestfields;
begin
  txtIdemKey.Text := '';
  txtValor.Text   := '';
  txtIDPagamento.Text   := '';
end;

end.
