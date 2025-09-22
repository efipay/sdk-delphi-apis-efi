unit ViewOfCreateAutomaticEnrollment;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  BodyOfAutomaticClass, XSuperJSON, XSuperObject, System.JSON, System.UITypes;

type
  TViewOfCreateAutomaticEnrollment = class(TForm)
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
    GroupBox6: TGroupBox;
    GroupBox8: TGroupBox;
    GroupBox1: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label15: TLabel;
    txtAgencia: TEdit;
    txtConta: TEdit;
    cmbTipoConta: TComboBox;
    txtCodigoBanco: TEdit;
    txtDocumento: TEdit;
    txtNome: TEdit;
    Label9: TLabel;
    txtNomePagador: TEdit;
    Label10: TLabel;
    txtDataExpiracao: TEdit;
    Label12: TLabel;
    txtIDProprio: TEdit;
    Label13: TLabel;
    txtDescricao: TEdit;
    GroupBox2: TGroupBox;
    Label14: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    txtValorMaximo: TEdit;
    txtValorMinimo: TEdit;
    txtValorFixo: TEdit;
    Label18: TLabel;
    cmbIntervalo: TComboBox;
    Label19: TLabel;
    txtDataInicio: TEdit;
    Label20: TLabel;
    boolRetentativa: TComboBox;
    GroupBox4: TGroupBox;
    Label21: TLabel;
    txtData: TEdit;
    Label22: TLabel;
    txtValor: TEdit;
    Label23: TLabel;
    txtInfoPagador: TEdit;
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

procedure TViewOfCreateAutomaticEnrollment.FormCreate(Sender: TObject);
begin
  Self.Position := poScreenCenter;
  InicializarComboBoxes;
end;

function TViewOfCreateAutomaticEnrollment.GetIdemKey: String;
begin
  Result := txtIdemKey.Text;
end;

procedure TViewOfCreateAutomaticEnrollment.InicializarComboBoxes;
begin
  cmbTipoConta.Items.Clear;
  cmbTipoConta.Items.Add('CACC');
  cmbTipoConta.Items.Add('SVGS');
  cmbTipoConta.Items.Add('TRAN');

  cmbIntervalo.Items.Clear;
  cmbIntervalo.Items.Add('SEMANAL');
  cmbIntervalo.Items.Add('MENSAL');
  cmbIntervalo.Items.Add('ANUAL');
  cmbIntervalo.Items.Add('SEMESTRAL');
  cmbIntervalo.Items.Add('TRIMESTRAL');

  boolRetentativa.Items.Clear;
  boolRetentativa.Items.Add('True');
  boolRetentativa.Items.Add('False');
end;

procedure TViewOfCreateAutomaticEnrollment.btnCancelRequestClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TViewOfCreateAutomaticEnrollment.btnConfirmRequestClick(Sender: TObject);
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
  if Trim(txtNomePagador.Text) = '' then
  begin
    MessageDlg('Nome do Pagador é obrigatório!', mtInformation, [mbOK], 0);
    txtCPF.SetFocus;
    Exit;
  end;
  if (cmbTipoConta.ItemIndex = -1) or (Trim(txtAgencia.Text) = '') or (Trim(txtConta.Text) = '')
   or (Trim(txtCodigoBanco.Text) = '') or (Trim(txtDocumento.Text) = '') or (Trim(txtNome.Text) = '') then
  begin
    MessageDlg('Preencha todos os campos da conta bancária!', mtInformation, [mbOK], 0);
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
  if Trim(txtDataExpiracao.Text) = '' then
  begin
    MessageDlg('Data de Expiração é obrigatório!', mtInformation, [mbOK], 0);
    txtDataExpiracao.SetFocus;
    Exit;
  end;

  if (Trim(txtValorFixo.Text) <> '') and ((Trim(txtValorMinimo.Text) <> '') or (Trim(txtValorMaximo.Text) <> '')) then
  begin
    MessageDlg('Preencha apenas um dos campos: Fixo, Mínimo ou Máximo.', mtInformation, [mbOK], 0);
    txtValorFixo.SetFocus;
    Exit;
  end;
  if (Trim(txtValorMinimo.Text) <> '') and ((Trim(txtValorFixo.Text) <> '') or (Trim(txtValorMaximo.Text) <> '')) then
  begin
    MessageDlg('Preencha apenas um dos campos: Fixo, Mínimo ou Máximo.', mtInformation, [mbOK], 0);
    txtValorMinimo.SetFocus;
    Exit;
  end;
  if (Trim(txtValorMaximo.Text) <> '') and ((Trim(txtValorFixo.Text) <> '') or (Trim(txtValorMinimo.Text) <> '')) then
  begin
    MessageDlg('Preencha apenas um dos campos: Fixo, Mínimo ou Máximo.', mtInformation, [mbOK], 0);
    txtValorMaximo.SetFocus;
    Exit;
  end;
  if (Trim(txtValorFixo.Text) = '') and (Trim(txtValorMinimo.Text) = '') and (Trim(txtValorMaximo.Text) = '') then
  begin
    MessageDlg('É obrigatório preencher um dos campos: Fixo, Mínimo ou Máximo.', mtInformation, [mbOK], 0);
    txtValorFixo.SetFocus;
    Exit;
  end;

  if cmbIntervalo.ItemIndex = -1 then
  begin
    MessageDlg('Intervalo é obrigatório!', mtInformation, [mbOK], 0);
    cmbIntervalo.SetFocus;
    Exit;
  end;
  if Trim(txtDataInicio.Text) = '' then
  begin
    MessageDlg('Data de Início é obrigatório!', mtInformation, [mbOK], 0);
    txtDataInicio.SetFocus;
    Exit;
  end;
  if boolRetentativa.ItemIndex = -1 then
  begin
    MessageDlg('Permite Tentativa é obrigatório!', mtInformation, [mbOK], 0);
    boolRetentativa.SetFocus;
    Exit;
  end;

  ModalResult := mrOk;
end;

function TViewOfCreateAutomaticEnrollment.GetBody: String;
var
  AutomaticCharge: TBodyOfAutomatic;
  Pagador: TPagador;
  ContaBanco: TContaBanco;
  Favorecido: TFavorecido;
  PrimeiroPagamento: TPrimeiroPagamento;
  Automatico: TAutomatico;
  Configuracao: TConfiguracao;
  Assinatura: TAssinatura;
  BodyRequest: ISuperObject;
begin
  AutomaticCharge := TBodyOfAutomatic.Create;
  try
    Pagador.idParticipante := Trim(txtIDParticipante.Text);
    Pagador.cpf := Trim(txtCPF.Text);
    Pagador.cnpj := Trim(txtCNPJ.Text);
    Pagador.nome := Trim(txtNomePagador.Text);
    AutomaticCharge.Pagador := Pagador;

    ContaBanco.agencia := Trim(txtAgencia.Text);
    ContaBanco.conta := Trim(txtConta.Text);
    ContaBanco.tipoConta := cmbTipoConta.Text;
    ContaBanco.codigoBanco := Trim(txtCodigoBanco.Text);
    ContaBanco.documento := Trim(txtDocumento.Text);
    ContaBanco.nome := Trim(txtNome.Text);
    Favorecido.contaBanco := ContaBanco;
    AutomaticCharge.Favorecido := Favorecido;

    PrimeiroPagamento.data := Trim(txtData.Text);
    PrimeiroPagamento.valor := Trim(txtValor.Text);
    PrimeiroPagamento.infoPagador := Trim(txtInfoPagador.Text);
    Automatico.primeiroPagamento := PrimeiroPagamento;
    Automatico.valorFixo := Trim(txtValorFixo.Text);
    Automatico.valorMinimo := Trim(txtValorMinimo.Text);
    Automatico.valorMaximo := Trim(txtValorMaximo.Text);
    Automatico.intervalo := cmbIntervalo.Text;
    Automatico.dataInicio := Trim(txtDataInicio.Text);
    Automatico.permiteRetentativa := StrToBool(boolRetentativa.Text);
    Configuracao.automatico := Automatico;
    Assinatura.configuracao := Configuracao;
    Assinatura.expiracao := Trim(txtDataExpiracao.Text);
    Assinatura.descricao := Trim(txtDescricao.Text);
    Assinatura.idProprio := Trim(txtIDProprio.Text);
    AutomaticCharge.Assinatura := Assinatura;

    BodyRequest := SO(AutomaticCharge.AsJSON(False, False));

    BodyRequest.Remove('status');
    BodyRequest.Remove('identificador');
    BodyRequest.Remove('identificadorAdesao');
    BodyRequest.Remove('pagamento');
    BodyRequest.Remove('endToEndId');

    if Trim(txtCNPJ.Text) = '' then
    begin
      if BodyRequest.Check('pagador') and BodyRequest.O['pagador'].Check('cnpj') then
        BodyRequest.O['pagador'].Remove('cnpj');
    end;

    if Trim(txtDescricao.Text) = '' then
    begin
      if BodyRequest.Check('assinatura') and BodyRequest.O['assinatura'].Check('descricao') then
        BodyRequest.O['assinatura'].Remove('descricao');
    end;

    if Trim(txtIdProprio.Text) = '' then
    begin
      if BodyRequest.Check('assinatura') and BodyRequest.O['assinatura'].Check('idProprio') then
        BodyRequest.O['assinatura'].Remove('idProprio');
    end;

    if Trim(txtValorFixo.Text) = '' then
    begin
      if BodyRequest.O['assinatura'].O['configuracao'].O['automatico'].Check('valorFixo') then
        BodyRequest.O['assinatura'].O['configuracao'].O['automatico'].Remove('valorFixo');
    end;

    if Trim(txtValorMinimo.Text) = '' then
    begin
      if BodyRequest.O['assinatura'].O['configuracao'].O['automatico'].Check('valorMinimo') then
        BodyRequest.O['assinatura'].O['configuracao'].O['automatico'].Remove('valorMinimo');
    end;

    if Trim(txtValorMaximo.Text) = '' then
    begin
      if BodyRequest.O['assinatura'].O['configuracao'].O['automatico'].Check('valorMaximo') then
        BodyRequest.O['assinatura'].O['configuracao'].O['automatico'].Remove('valorMaximo');
    end;

    if Trim(txtData.Text) = '' then
    begin
      if BodyRequest.O['assinatura'].O['configuracao'].O['automatico'].O['primeiroPagamento'].Check('data') then
       BodyRequest.O['assinatura'].O['configuracao'].O['automatico'].O['primeiroPagamento'].Remove('data');
    end;

    if Trim(txtValor.Text) = '' then
    begin
      if BodyRequest.O['assinatura'].O['configuracao'].O['automatico'].O['primeiroPagamento'].Check('valor') then
        BodyRequest.O['assinatura'].O['configuracao'].O['automatico'].O['primeiroPagamento'].Remove('valor');
    end;

    if Trim(txtInfoPagador.Text) = '' then
    begin
      if BodyRequest.O['assinatura'].O['configuracao'].O['automatico'].O['primeiroPagamento'].Check('infoPagador') then
        BodyRequest.O['assinatura'].O['configuracao'].O['automatico'].O['primeiroPagamento'].Remove('infoPagador');
    end;

    if BodyRequest.Check('assinatura') and BodyRequest.O['assinatura'].Check('configuracao') and
    BodyRequest.O['assinatura'].O['configuracao'].Check('automatico') and BodyRequest.O['assinatura'].O['configuracao'].O['automatico'].Check('primeiroPagamento') and
    (BodyRequest.O['assinatura'].O['configuracao'].O['automatico'].O['primeiroPagamento'].Count = 0) then
      BodyRequest.O['assinatura'].O['configuracao'].O['automatico'].Remove('primeiroPagamento');

    Result := BodyRequest.AsJSON;
  finally
    AutomaticCharge.Free;
  end;
end;

procedure TViewOfCreateAutomaticEnrollment.ClearRequestFields;
begin
  txtIdemKey.Text := '';
  txtIDParticipante.Text := '';
  txtNomePagador.Text := '';
  txtCPF.Text := '';
  txtCNPJ.Text := '';
  txtAgencia.Text := '';
  txtConta.Text := '';
  txtAgencia.Text := '';
  cmbTipoConta.ItemIndex := -1;
  txtCodigoBanco.Text := '';
  txtDocumento.Text := '';
  txtNome.Text := '';
  txtDataExpiracao.Text := '';
  txtIDProprio.Text := '';
  txtDescricao.Text := '';
  txtValorFixo.Text := '';
  txtValorMinimo.Text := '';
  txtValorMaximo.Text := '';
  cmbIntervalo.ItemIndex := -1;
  txtDataInicio.Text := '';
  boolRetentativa.ItemIndex := -1;
  txtData.Text := '';
  txtValor.Text := '';
  txtInfoPagador.Text := '';
end;

end.


