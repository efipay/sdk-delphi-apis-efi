unit ViewPixCreateAutomaticCharge;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  BodyAutomaticChargeClass, XSuperJSON, XSuperObject, System.JSON, System.UITypes;

type
  TViewPixCreateAutomaticCharge = class(TForm)
    GroupBox3: TGroupBox;
    GroupBox1: TGroupBox;
    Label4: TLabel;
    txtDataVencimento: TEdit;
    gbValor: TGroupBox;
    Label5: TLabel;
    txtValor: TEdit;
    GroupBox2: TGroupBox;
    btnConfirmRequest: TButton;
    btnCancelRequest: TButton;
    GroupBox5: TGroupBox;
    Label1: TLabel;
    Label6: TLabel;
    txtCEP: TEdit;
    txtCidade: TEdit;
    GroupBox6: TGroupBox;
    Label2: TLabel;
    txtIdRec: TEdit;
    txtEmail: TEdit;
    txtLogradouro: TEdit;
    txtUF: TEdit;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    GroupBox7: TGroupBox;
    txtAgencia: TEdit;
    Label7: TLabel;
    Label8: TLabel;
    txtConta: TEdit;
    Label9: TLabel;
    cmbTipoConta: TComboBox;
    txtInfoAdicional: TEdit;
    cmbDiaUtil: TComboBox;
    procedure FormCreate(Sender: TObject);
    procedure btnCancelRequestClick(Sender: TObject);
    procedure btnConfirmRequestClick(Sender: TObject);
  private
    procedure InicializarComboBoxes;
    function GetBody: String;
  public
    procedure ClearRequestFields;
    property Body: String read GetBody;
  end;

var
  FormPixCreateAutomaticCharge: TViewPixCreateAutomaticCharge;

implementation

{$R *.dfm}

procedure TViewPixCreateAutomaticCharge.FormCreate(Sender: TObject);
begin
  Self.Position := poScreenCenter;
  InicializarComboBoxes;
end;

procedure TViewPixCreateAutomaticCharge.InicializarComboBoxes;
begin
  cmbTipoConta.Items.Clear;
  cmbTipoConta.Items.Add('CORRENTE');
  cmbTipoConta.Items.Add('POUPANÇA');
  cmbTipoConta.Items.Add('PAGAMENTO');

  cmbDiaUtil.Items.Clear;
  cmbDiaUtil.Items.Add('True');
  cmbDiaUtil.Items.Add('False');
end;

procedure TViewPixCreateAutomaticCharge.btnCancelRequestClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TViewPixCreateAutomaticCharge.btnConfirmRequestClick(Sender: TObject);
var
  DocLen: Integer;
begin
  if Trim(txtIdRec.Text) = '' then
  begin
    MessageDlg('idRec é obrigatório!', mtInformation, [mbOK], 0);
    txtIdRec.SetFocus;
    Exit;
  end;
  if Trim(txtAgencia.Text) = '' then
  begin
    MessageDlg('Agência é obrigatório!', mtInformation, [mbOK], 0);
    txtAgencia.SetFocus;
    Exit;
  end;
  if Trim(txtConta.Text) = '' then
  begin
    MessageDlg('Conta é obrigatório!', mtInformation, [mbOK], 0);
    txtConta.SetFocus;
    Exit;
  end;
  if cmbTipoConta.ItemIndex = -1 then
  begin
    MessageDlg('Tipo da Conta deve ser selecionado!', mtInformation, [mbOK], 0);
    cmbTipoConta.SetFocus;
    Exit;
  end;
  if Trim(txtDataVencimento.Text) = '' then
  begin
    MessageDlg('Data de Vencimento é obrigatório!', mtInformation, [mbOK], 0);
    txtDataVencimento.SetFocus;
    Exit;
  end;
  if Trim(txtValor.Text) = '' then
  begin
    MessageDlg('Valor Original é obrigatório!', mtInformation, [mbOK], 0);
    txtValor.SetFocus;
    Exit;
  end;
  if cmbDiaUtil.ItemIndex = -1 then
  begin
    MessageDlg('Ajuste de Dia Útil deve ser selecionado!', mtInformation, [mbOK], 0);
    cmbDiaUtil.SetFocus;
    Exit;
  end;

  ModalResult := mrOk;
end;

function TViewPixCreateAutomaticCharge.GetBody: String;
var
  ClassAutomaticCharge: TBodyAutomaticCharge;
  Devedor: TDebtor;
  Calendario: TCalendar;
  Valor: TValue;
  Recebedor: TReceiver;
  BodyRequest: ISuperObject;
begin
  ClassAutomaticCharge := TBodyAutomaticCharge.Create;
  try
    ClassAutomaticCharge.idRec := Trim(txtIdRec.Text);

    Devedor.zipCode := Trim(txtCEP.Text);
    Devedor.city := Trim(txtCidade.Text);
    Devedor.email := Trim(txtEmail.Text);
    Devedor.address := Trim(txtLogradouro.Text);
    Devedor.state := Trim(txtUF.Text);
    ClassAutomaticCharge.debtor := Devedor;

    Recebedor.agency := Trim(txtAgencia.Text);
    Recebedor.account := Trim(txtConta.Text);
    Recebedor.accountType := cmbTipoConta.Text;
    ClassAutomaticCharge.receiver := Recebedor;

    Calendario.dueDate := Trim(txtDataVencimento.Text);
    ClassAutomaticCharge.calendar := Calendario;

    Valor.original := Trim(txtValor.Text);
    ClassAutomaticCharge.value := Valor;

    ClassAutomaticCharge.businessDayAdjustment := StrToBool(cmbDiaUtil.Text);

    ClassAutomaticCharge.additionalInfo := Trim(txtInfoAdicional.Text);

    BodyRequest := SO(ClassAutomaticCharge.AsJSON(False, False));

    BodyRequest.Remove('status');

    if Trim(txtCEP.Text) = '' then
      BodyRequest.O['devedor'].Remove('cep');

    if Trim(txtCidade.Text) = '' then
      BodyRequest.O['devedor'].Remove('cidade');

    if Trim(txtEmail.Text) = '' then
      BodyRequest.O['devedor'].Remove('email');

    if Trim(txtLogradouro.Text) = '' then
      BodyRequest.O['devedor'].Remove('logradouro');

    if Trim(txtUF.Text) = '' then
      BodyRequest.O['devedor'].Remove('uf');

    if BodyRequest.Check('devedor') and (BodyRequest.O['devedor'].Count = 0) then
      BodyRequest.Remove('devedor');

    if Trim(txtInfoAdicional.Text) = '' then
      BodyRequest.Remove('infoAdicional');

    Result := BodyRequest.AsJSON;
  finally
    ClassAutomaticCharge.Free;
  end;
end;

procedure TViewPixCreateAutomaticCharge.ClearRequestFields;
begin
  txtIdRec.Text := '';
  txtCep.Text := '';
  txtCidade.Text := '';
  txtEmail.Text := '';
  txtLogradouro.Text := '';
  txtAgencia.Text := '';
  txtConta.Text := '';
  cmbTipoConta.ItemIndex := -1;
  txtDataVencimento.Text := '';
  txtValor.Text := '';
  cmbDiaUtil.ItemIndex := -1;
  txtInfoAdicional.Text := '';
end;

end.


