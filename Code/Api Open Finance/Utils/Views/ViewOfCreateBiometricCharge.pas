unit ViewOfCreateBiometricCharge;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  BodyOfBiometricClass, XSuperJSON, XSuperObject, System.JSON, System.UITypes;

type
  TViewOfCreateBiometricCharge = class(TForm)
    GroupBox3: TGroupBox;
    btnConfirmRequest: TButton;
    btnCancelRequest: TButton;
    GroupBox5: TGroupBox;
    txtIdParticipante: TEdit;
    Label2: TLabel;
    txtIdemKey: TEdit;
    txtCPF: TEdit;
    Label11: TLabel;
    Label1: TLabel;
    Label3: TLabel;
    txtCNPJ: TEdit;
    GroupBox7: TGroupBox;
    GroupBox1: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    txtAgencia: TEdit;
    txtConta: TEdit;
    cmbTipoConta: TComboBox;
    Label7: TLabel;
    txtCodigoBanco: TEdit;
    Label8: TLabel;
    txtDocumento: TEdit;
    GroupBox2: TGroupBox;
    txtChave: TEdit;
    GroupBox4: TGroupBox;
    txtQRCode: TEdit;
    GroupBox6: TGroupBox;
    Label9: TLabel;
    Label10: TLabel;
    txtValor: TEdit;
    txtInfoPagador: TEdit;
    Label12: TLabel;
    txtIBGE: TEdit;
    Label13: TLabel;
    txtIDProprio: TEdit;
    Label14: TLabel;
    txtTXID: TEdit;
    Label15: TLabel;
    txtNome: TEdit;
    GroupBox8: TGroupBox;
    txtIDVinculo: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure btnCancelRequestClick(Sender: TObject);
    procedure btnConfirmRequestClick(Sender: TObject);
  private
    procedure InicializarComboBoxes;
    function GetBody: String;
    function GetIdemKey: String;
  public
    procedure ClearRequestFields;
    property Body: String read GetBody;
    property IdemKey: String read GetIdemKey;
  end;

implementation

{$R *.dfm}

procedure TViewOfCreateBiometricCharge.FormCreate(Sender: TObject);
begin
  Self.Position := poScreenCenter;
  InicializarComboBoxes;
end;

function TViewOfCreateBiometricCharge.GetIdemKey: String;
begin
  Result := txtIdemKey.Text;
end;

procedure TViewOfCreateBiometricCharge.InicializarComboBoxes;
begin
  cmbTipoConta.Items.Clear;
  cmbTipoConta.Items.Add('CACC');
  cmbTipoConta.Items.Add('SVGS');
  cmbTipoConta.Items.Add('TRAN');
end;

procedure TViewOfCreateBiometricCharge.btnCancelRequestClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TViewOfCreateBiometricCharge.btnConfirmRequestClick(Sender: TObject);
var
  DocLen: Integer;
begin
  if Trim(txtIdemKey.Text) = '' then
  begin
    MessageDlg('Idempotency Key é obrigatório!', mtInformation, [mbOK], 0);
    txtIdemKey.SetFocus;
    Exit;
  end;
  if Trim(txtIDParticipante.Text) = '' then
  begin
    MessageDlg('ID do Participante é obrigatório!', mtInformation, [mbOK], 0);
    txtIDParticipante.SetFocus;
    Exit;
  end;
  if Trim(txtCPF.Text) = '' then
  begin
    MessageDlg('CPF é obrigatório!', mtInformation, [mbOK], 0);
    txtCPF.SetFocus;
    Exit;
  end;
  if Trim(txtValor.Text) = '' then
  begin
    MessageDlg('Valor é obrigatório!', mtInformation, [mbOK], 0);
    txtValor.SetFocus;
    Exit;
  end;
  if Trim(txtIDVinculo.Text) = '' then
  begin
    MessageDlg('Identificador do Vinculo é obrigatório!', mtInformation, [mbOK], 0);
    txtIDVinculo.SetFocus;
    Exit;
  end;

  if (Trim(txtAgencia.Text) <> '') or (Trim(txtConta.Text) <> '') or
  (cmbTipoConta.ItemIndex <> -1) or (Trim(txtCodigoBanco.Text) <> '') or
  (Trim(txtDocumento.Text) <> '') or (Trim(txtNome.Text) <> '') then
  begin
    // Conta Bancária está preenchida
    if (Trim(txtChave.Text) <> '') or (Trim(txtQRCode.Text) <> '') then
    begin
      MessageDlg('Se a Conta Bancária está preenchida, a Chave Pix e o QR Code devem estar vazios.', mtWarning, [mbOK], 0);
      Exit;
    end;
    if (Trim(txtAgencia.Text) = '') or (Trim(txtConta.Text) = '') or
    (cmbTipoConta.ItemIndex = -1) or(Trim(txtCodigoBanco.Text) = '') or
    (Trim(txtDocumento.Text) = '') or (Trim(txtNome.Text) <> '') then
    begin
      MessageDlg('Se for usar dados bancários, todos os campos devem estar preenchidos.', mtWarning, [mbOK], 0);
      Exit;
    end;
    if (Pos('.', txtDocumento.Text) > 0) or (Pos('-', txtDocumento.Text) > 0) then
    begin
      MessageDlg('Utilize apenas números no CPF/CNPJ.', mtError, [mbOK], 0);
      txtDocumento.SetFocus;
      Exit;
    end;
    DocLen := Length(Trim(txtDocumento.Text));
    if (DocLen <> 11) and (DocLen <> 14) then
    begin
      MessageDlg('Documento inválido. Deve conter 11 (CPF) ou 14 (CNPJ) números.', mtError, [mbOK], 0);
      txtDocumento.SetFocus;
      Exit;
    end;
  end
  else if Trim(txtChave.Text) <> '' then
  begin
    // Chave Pix está preenchida
    if (Trim(txtAgencia.Text) <> '') or (Trim(txtConta.Text) <> '') or
      (cmbTipoConta.ItemIndex <> -1) or (Trim(txtCodigoBanco.Text) <> '') or
      (Trim(txtDocumento.Text) <> '') or (Trim(txtNome.Text) <> '') or (Trim(txtQRCode.Text) <> '') then
    begin
      MessageDlg('Se a Chave Pix está preenchida, a Conta Bancária e o QR Code devem estar vazios.', mtWarning, [mbOK], 0);
      Exit;
    end;
  end
  else if Trim(txtQRCode.Text) <> '' then
  begin
    // QR Code está preenchido
    if (Trim(txtAgencia.Text) <> '') or (Trim(txtConta.Text) <> '') or
      (cmbTipoConta.ItemIndex <> -1) or (Trim(txtCodigoBanco.Text) <> '') or
      (Trim(txtDocumento.Text) <> '') or (Trim(txtNome.Text) <> '') or (Trim(txtChave.Text) <> '') then
    begin
      MessageDlg('Se o QR Code está preenchido, a Conta Bancária e a Chave Pix devem estar vazios.', mtWarning, [mbOK], 0);
      Exit;
    end;
  end
  else
  begin
    MessageDlg('Você deve preencher uma das três opções: Conta Bancária, Chave Pix ou QR Code.', mtInformation, [mbOK], 0);
    Exit;
  end;

  ModalResult := mrOk;
end;

function TViewOfCreateBiometricCharge.GetBody: String;
var
  BiometricCharge: TBodyOfBiometric;
  Pagador: TPagador;
  Favorecido: TFavorecido;
  Pagamento: TPagamento;
  ContaBanco: TContaBanco;
  BodyRequest: ISuperObject;
begin
  BiometricCharge := TBodyOfBiometric.Create;
  try
    Pagador.idParticipante := Trim(txtIDParticipante.Text);
    Pagador.cpf := Trim(txtCPF.Text);
    Pagador.cnpj := Trim(txtCNPJ.Text);
    BiometricCharge.Pagador := Pagador;

    ContaBanco.codigoBanco := Trim(txtCodigoBanco.Text);
    ContaBanco.agencia := Trim(txtAgencia.Text);
    ContaBanco.documento := Trim(txtDocumento.Text);
    ContaBanco.nome := Trim(txtNome.Text);
    ContaBanco.tipoConta := cmbTipoConta.Text;
    Favorecido.contaBanco := ContaBanco;
    Favorecido.chave := Trim(txtChave.Text);
    BiometricCharge.Favorecido := Favorecido;

    Pagamento.valor := Trim(txtValor.Text);
    Pagamento.infoPagador := Trim(txtInfoPagador.Text);
    Pagamento.idProprio := Trim(txtIdProprio.Text);
    Pagamento.qrcode := Trim(txtQRCode.Text);
    Pagamento.identificadorTransacao := Trim(txtTXID.Text);
    Pagamento.codigoCidadeIBGE := Trim(txtIBGE.Text);
    BiometricCharge.Pagamento := Pagamento;

    BiometricCharge.IDVinculo := Trim(txtIDVinculo.Text);

    BodyRequest := SO(BiometricCharge.AsJSON(False, False));

    BodyRequest.Remove('motivo');

    if Trim(txtCNPJ.Text) = '' then
    begin
      if BodyRequest.Check('pagador') and BodyRequest.O['pagador'].Check('cnpj') then
        BodyRequest.O['pagador'].Remove('cnpj');
    end;

    // Remove 'contaBanco' se os campos estiverem vazios
    if (Trim(txtAgencia.Text) = '') and
      (Trim(txtConta.Text) = '') and
      (cmbTipoConta.ItemIndex = -1) and
      (Trim(txtCodigoBanco.Text) = '') and
      (Trim(txtDocumento.Text) = '') and
      (Trim(txtNome.Text) = '') then
    begin
      if BodyRequest.Check('favorecido') and BodyRequest.O['favorecido'].Check('contaBanco') then
        BodyRequest.O['favorecido'].Remove('contaBanco');
    end;

    // Remove 'chave' se estiver vazia
    if Trim(txtChave.Text) = '' then
    begin
      if BodyRequest.Check('favorecido') and BodyRequest.O['favorecido'].Check('chave') then
      BodyRequest.O['favorecido'].Remove('chave');
    end;

    // Remove 'qrCode' se estiver vazio
    if Trim(txtQRCode.Text) = '' then
    begin
      if BodyRequest.Check('pagamento') and BodyRequest.O['pagamento'].Check('qrCode') then
        BodyRequest.O['pagamento'].Remove('qrCode');
    end;

    // Remove 'favorecido' se estiver vazio
    if BodyRequest.Check('favorecido') and (BodyRequest.O['favorecido'].Count = 0) then
      BodyRequest.Remove('favorecido');

    if Trim(txtInfoPagador.Text) = '' then
    begin
      if BodyRequest.Check('pagamento') and BodyRequest.O['pagamento'].Check('infoPagador') then
        BodyRequest.O['pagamento'].Remove('infoPagador');
    end;

    if Trim(txtIdProprio.Text) = '' then
    begin
      if BodyRequest.Check('pagamento') and BodyRequest.O['pagamento'].Check('idProprio') then
        BodyRequest.O['pagamento'].Remove('idProprio');
    end;

    if Trim(txtTXID.Text) = '' then
    begin
      if BodyRequest.Check('pagamento') and BodyRequest.O['pagamento'].Check('identificadorTransacao') then
        BodyRequest.O['pagamento'].Remove('identificadorTransacao');
    end;

    if Trim(txtIBGE.Text) = '' then
    begin
      if BodyRequest.Check('pagamento') and BodyRequest.O['pagamento'].Check('codigoCidadeIBGE') then
        BodyRequest.O['pagamento'].Remove('codigoCidadeIBGE');
    end;

    Result := BodyRequest.AsJSON;
  finally
    BiometricCharge.Free;
  end;
end;

procedure TViewOfCreateBiometricCharge.ClearRequestFields;
begin
  txtIdemKey.Text := '';
  txtIDParticipante.Text := '';
  txtCPF.Text := '';
  txtCNPJ.Text := '';
  txtAgencia.Text := '';
  txtConta.Text := '';
  txtAgencia.Text := '';
  cmbTipoConta.ItemIndex := -1;
  txtCodigoBanco.Text := '';
  txtDocumento.Text := '';
  txtChave.Text := '';
  txtQRCode.Text := '';
  txtValor.Text := '';
  txtIBGE.Text := '';
  txtInfoPagador.Text := '';
  txtIDProprio.Text := '';
  txtTXID.Text := '';
end;

end.


