unit ViewOfCreateRecurrencyCharge;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  BodyOfRecurrencyClass, XSuperJSON, XSuperObject, System.JSON, System.UITypes;

type
  TViewOfCreateRecurrencyCharge = class(TForm)
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
    Label16: TLabel;
    cmbTipo: TComboBox;
    Label17: TLabel;
    txtDiaSemana: TEdit;
    Label18: TLabel;
    txtDiaMes: TEdit;
    Label19: TLabel;
    txtDataInicio: TEdit;
    Label20: TLabel;
    txtDatas: TEdit;
    Label21: TLabel;
    txtDescricao: TEdit;
    Label22: TLabel;
    txtQuantidade: TEdit;
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

procedure TViewOfCreateRecurrencyCharge.FormCreate(Sender: TObject);
begin
  Self.Position := poScreenCenter;
  InicializarComboBoxes;
end;

function TViewOfCreateRecurrencyCharge.GetIdemKey: String;
begin
  Result := txtIdemKey.Text;
end;

procedure TViewOfCreateRecurrencyCharge.InicializarComboBoxes;
begin
  cmbTipoConta.Items.Clear;
  cmbTipoConta.Items.Add('CACC');
  cmbTipoConta.Items.Add('SLRY');
  cmbTipoConta.Items.Add('SVGS');
  cmbTipoConta.Items.Add('TRAN');

  cmbTipo.Items.Clear;
  cmbTipo.Items.Add('diaria');
  cmbTipo.Items.Add('semanal');
  cmbTipo.Items.Add('mensal');
  cmbTipo.Items.Add('personalizada');
end;

procedure TViewOfCreateRecurrencyCharge.btnCancelRequestClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TViewOfCreateRecurrencyCharge.btnConfirmRequestClick(Sender: TObject);
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
  if cmbTipo.ItemIndex = -1 then
  begin
    MessageDlg('Tipo de Recorrência é obrigatório!', mtInformation, [mbOK], 0);
    txtValor.SetFocus;
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

  if (cmbTipo.Text = 'personalizada') and (txtDatas.Text = '') then
  begin
    MessageDlg('Datas é requerido para os pagamentos recorrentes do tipo personalizada!', mtInformation, [mbOK], 0);
    txtDatas.SetFocus;
    Exit;
  end;
  if (cmbTipo.Text = 'mensal') then
  begin
    if (Trim(txtDataInicio.Text) = '') or (Trim(txtDiaMes.Text) = '') or (Trim(txtQuantidade.Text) = '') then
    begin
      MessageDlg('Data Inicio, Dia do Mês e Quantidade são requeridos para os pagamentos recorrentes do tipo mensal!', mtInformation, [mbOK], 0);
      Exit;
    end;
  end;
  if (cmbTipo.Text = 'semanal') then
  begin
    if (Trim(txtDataInicio.Text) = '') or (Trim(txtDiaSemana.Text) = '') or (Trim(txtQuantidade.Text) = '') then
    begin
      MessageDlg('Data Inicio, Dia da Semana e Quantidade são requeridos para os pagamentos recorrentes do tipo semanal!', mtInformation, [mbOK], 0);
      Exit;
    end;
  end;
  if (cmbTipo.Text = 'diaria') then
  begin
    if (Trim(txtDataInicio.Text) = '') or (Trim(txtQuantidade.Text) = '') then
    begin
      MessageDlg('Data Inicio e Quantidade são requeridos para os pagamentos recorrentes do tipo diário!', mtInformation, [mbOK], 0);
      Exit;
    end;
  end;

  ModalResult := mrOk;
end;

function TViewOfCreateRecurrencyCharge.GetBody: String;
var
  RecurrencyCharge: TBodyOfRecurrency;
  Pagador: TPagador;
  Favorecido: TFavorecido;
  Recorrencia: TRecorrencia;
  Pagamento: TPagamento;
  ContaBanco: TContaBanco;
  i: Integer;
  DatasStr: String;
  DatasList: TArray<String>;
  BodyRequest: ISuperObject;
begin
  RecurrencyCharge := TBodyOfRecurrency.Create;
  try
    Pagador.idParticipante := Trim(txtIDParticipante.Text);
    Pagador.cpf := Trim(txtCPF.Text);
    Pagador.cnpj := Trim(txtCNPJ.Text);
    RecurrencyCharge.Pagador := Pagador;

    ContaBanco.codigoBanco := Trim(txtCodigoBanco.Text);
    ContaBanco.agencia := Trim(txtAgencia.Text);
    ContaBanco.documento := Trim(txtDocumento.Text);
    ContaBanco.nome := Trim(txtNome.Text);
    ContaBanco.tipoConta := cmbTipoConta.Text;
    Favorecido.contaBanco := ContaBanco;
    Favorecido.chave := Trim(txtChave.Text);
    RecurrencyCharge.Favorecido := Favorecido;

    Recorrencia.tipo := cmbTipo.Text;
    Recorrencia.dataInicio := Trim(txtDataInicio.Text);
    Recorrencia.quantidade := Trim(txtQuantidade.Text);
    Recorrencia.diaDaSemana := Trim(txtDiaMes.Text);
    Recorrencia.diaDoMes := Trim(txtDiaMes.Text);

    DatasStr := Trim(txtDatas.Text);
    if DatasStr <> '' then
      DatasList := DatasStr.Split([','])
    else
      SetLength(DatasList, 0);
    Recorrencia.datas := DatasList;

    Recorrencia.descricao := Trim(txtDescricao.Text);

    Pagamento.valor := Trim(txtValor.Text);
    Pagamento.infoPagador := Trim(txtInfoPagador.Text);
    Pagamento.idProprio := Trim(txtIdProprio.Text);
    Pagamento.recorrencia := Recorrencia;
    Pagamento.qrcode := Trim(txtQRCode.Text);
    Pagamento.identificadorTransacao := Trim(txtTXID.Text);
    Pagamento.codigoCidadeIBGE := Trim(txtIBGE.Text);
    RecurrencyCharge.Pagamento := Pagamento;

    BodyRequest := SO(RecurrencyCharge.AsJSON(False, False));

    BodyRequest.Remove('devolucoes');

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

    if Trim(txtDataInicio.Text) = '' then
    begin
      if BodyRequest.Check('pagamento') and BodyRequest.O['pagamento'].Check('recorrencia') then
        BodyRequest.O['pagamento'].O['recorrencia'].Remove('dataInicio');
    end;

    if Trim(txtQuantidade.Text) = '' then
    begin
      if BodyRequest.Check('pagamento') and BodyRequest.O['pagamento'].Check('recorrencia') then
        BodyRequest.O['pagamento'].O['recorrencia'].Remove('quantidade');
    end;

    if Trim(txtDiaSemana.Text) = '' then
    begin
      if BodyRequest.Check('pagamento') and BodyRequest.O['pagamento'].Check('recorrencia') then
        BodyRequest.O['pagamento'].O['recorrencia'].Remove('diaDaSemana');
    end;

    if Trim(txtDiaMes.Text) = '' then
    begin
      if BodyRequest.Check('pagamento') and BodyRequest.O['pagamento'].Check('recorrencia') then
        BodyRequest.O['pagamento'].O['recorrencia'].Remove('diaDoMes');
    end;

    if Trim(txtDatas.Text) = '' then
    begin
      if BodyRequest.Check('pagamento') and BodyRequest.O['pagamento'].Check('recorrencia') then
        BodyRequest.O['pagamento'].O['recorrencia'].Remove('datas');
    end;

    if Trim(txtDescricao.Text) = '' then
    begin
      if BodyRequest.Check('pagamento') and BodyRequest.O['pagamento'].Check('recorrencia') then
        BodyRequest.O['pagamento'].O['recorrencia'].Remove('descricao');
    end;

    Result := BodyRequest.AsJSON;
  finally
    RecurrencyCharge.Free;
  end;
end;

procedure TViewOfCreateRecurrencyCharge.ClearRequestFields;
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
  cmbTipo.ItemIndex := -1;
  txtDataInicio.Text := '';
  txtQuantidade.Text := '';
  txtDiaSemana.Text := '';
  txtDiaMes.Text := '';
  txtDatas.Text := '';
  txtDescricao.Text := '';
end;

end.


