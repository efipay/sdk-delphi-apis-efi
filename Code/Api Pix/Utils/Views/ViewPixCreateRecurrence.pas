unit ViewPixCreateRecurrence;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  BodyRecurrenceClass, XSuperJSON, XSuperObject, System.JSON, System.UITypes;

type
  TViewPixCreateRecurrence = class(TForm)
    GroupBox3: TGroupBox;
    gbDevedor: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    txtContrato: TEdit;
    txtObjeto: TEdit;
    GroupBox1: TGroupBox;
    Label4: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    txtDataInicial: TEdit;
    txtDataFinal: TEdit;
    cmbPeriodicidade: TComboBox;
    gbValor: TGroupBox;
    Label5: TLabel;
    Label9: TLabel;
    txtValorRec: TEdit;
    txtValorMinimo: TEdit;
    GroupBox2: TGroupBox;
    cmbRetentativa: TComboBox;
    GroupBox4: TGroupBox;
    Label11: TLabel;
    txtTXID: TEdit;
    btnConfirmRequest: TButton;
    btnCancelRequest: TButton;
    GroupBox5: TGroupBox;
    Label1: TLabel;
    Label6: TLabel;
    txtNome: TEdit;
    txtDocumento: TEdit;
    GroupBox6: TGroupBox;
    Label10: TLabel;
    txtLoc: TEdit;
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
  FormPixCreateRecurrence: TViewPixCreateRecurrence;

implementation

{$R *.dfm}

procedure TViewPixCreateRecurrence.FormCreate(Sender: TObject);
begin
  Self.Position := poScreenCenter;
  InicializarComboBoxes;
end;

procedure TViewPixCreateRecurrence.InicializarComboBoxes;
begin
  // Preencher periodicidade
  cmbPeriodicidade.Items.Clear;
  cmbPeriodicidade.Items.Add('SEMANAL');
  cmbPeriodicidade.Items.Add('MENSAL');
  cmbPeriodicidade.Items.Add('TRIMESTRAL');
  cmbPeriodicidade.Items.Add('SEMESTRAL');
  cmbPeriodicidade.Items.Add('ANUAL');

  // Preencher politica de retentativa
  cmbRetentativa.Items.Clear;
  cmbRetentativa.Items.Add('NAO_PERMITE');
  cmbRetentativa.Items.Add('PERMITE_3R_7D');
end;

procedure TViewPixCreateRecurrence.btnCancelRequestClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TViewPixCreateRecurrence.btnConfirmRequestClick(Sender: TObject);
var
  DocLen: Integer;
begin
  if Trim(txtContrato.Text) = '' then
  begin
    MessageDlg('Contrato é obrigatório', mtInformation, [mbOK], 0);
    txtContrato.SetFocus;
    Exit;
  end;

  if Trim(txtNome.Text) = '' then
  begin
    MessageDlg('Nome do devedor é obrigatório', mtInformation, [mbOK], 0);
    txtNome.SetFocus;
    Exit;
  end;

  if Trim(txtDocumento.Text) = '' then
  begin
    MessageDlg('CPF ou CNPJ do devedor é obrigatório', mtInformation, [mbOK], 0);
    txtDocumento.SetFocus;
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

  if Trim(txtDataInicial.Text) = '' then
  begin
    MessageDlg('Data Inicial é obrigatória', mtInformation, [mbOK], 0);
    txtDataInicial.SetFocus;
    Exit;
  end;

  if (Trim(txtValorRec.Text) = '') and (Trim(txtValorMinimo.Text) = '')  then
  begin
    MessageDlg('Valor Recorrência ou Valor Mínimo é obrigatório', mtInformation, [mbOK], 0);
    txtDataInicial.SetFocus;
    Exit;
  end;

  if cmbPeriodicidade.ItemIndex = -1 then
  begin
    MessageDlg('Periodicidade deve ser selecionada', mtInformation, [mbOK], 0);
    cmbPeriodicidade.SetFocus;
    Exit;
  end;

  if cmbRetentativa.ItemIndex = -1 then
  begin
    MessageDlg('Política de Retentativa deve ser selecionada', mtInformation, [mbOK], 0);
    cmbRetentativa.SetFocus;
    Exit;
  end;

  ModalResult := mrOk;
end;

function TViewPixCreateRecurrence.GetBody: String;
var
  Recurrence: TBodyRecurrence;
  Vinculo: TLink;
  Devedor: TDebtor;
  Calendario: TCalendar;
  Valor: TValue;
  Ativacao: TActivation;
  BodyRequest: ISuperObject;
  DocLen: Integer;
begin
  Recurrence := TBodyRecurrence.Create;
  try
    Devedor.name := Trim(txtNome.Text);
    DocLen := Length(Trim(txtDocumento.Text));
    if DocLen = 11 then
    begin
      Devedor.cpf := Trim(txtDocumento.Text);
      Devedor.cnpj := '';
    end
    else if DocLen = 14 then
    begin
      Devedor.cnpj := Trim(txtDocumento.Text);
      Devedor.cpf := '';
    end;

    Vinculo.contract := Trim(txtContrato.Text);
    Vinculo.objectItem := Trim(txtObjeto.Text);
    Vinculo.debtor := Devedor;
    Recurrence.link := Vinculo;

    Calendario.startDate := Trim(txtDataInicial.Text);
    Calendario.endDate := Trim(txtDataFinal.Text);
    Calendario.frequency := cmbPeriodicidade.Text;
    Recurrence.calendar := Calendario;

    Valor.recValue := Trim(txtValorRec.Text);
    Valor.minimumReceiverValue := Trim(txtValorMinimo.Text);
    Recurrence.value := Valor;

    Recurrence.retryPolicy := cmbRetentativa.Text;

    Recurrence.Loc := StrToIntDef(Trim(txtLoc.Text), 0);

    Ativacao.journeyData.txid := Trim(txtTXID.Text);
    Recurrence.activation := Ativacao;

    BodyRequest := SO(Recurrence.AsJSON(False, False));

    BodyRequest.Remove('status');

    if Trim(txtObjeto.Text) = '' then
      BodyRequest.O['vinculo'].Remove('objeto');

    if Trim(txtDataFinal.Text) = '' then
      BodyRequest.O['calendario'].Remove('dataFinal');

    if Trim(txtValorRec.Text) = '' then
      BodyRequest.O['valor'].Remove('valorRec');

    if Trim(txtValorMinimo.Text) = '' then
      BodyRequest.O['valor'].Remove('valorMinimoRecebedor');

    if BodyRequest.Check('valor') and (BodyRequest.O['valor'].Count = 0) then
      BodyRequest.Remove('valor');

    if Trim(txtLoc.Text) = '' then
      BodyRequest.Remove('loc');

    if Trim(txtTXID.Text) = '' then
      if BodyRequest.Check('ativacao') and BodyRequest.O['ativacao'].Check('dadosJornada') then
        BodyRequest.O['ativacao'].O['dadosJornada'].Remove('txid');

    if BodyRequest.Check('ativacao') and BodyRequest.O['ativacao'].Check('dadosJornada') and (BodyRequest.O['ativacao'].O['dadosJornada'].Count = 0) then
      BodyRequest.O['ativacao'].Remove('dadosJornada');

    if BodyRequest.Check('ativacao') and (BodyRequest.O['ativacao'].Count = 0) then
      BodyRequest.Remove('ativacao');

    if BodyRequest.O['vinculo'].O['devedor'].S['cpf'] = '' then
      BodyRequest.O['vinculo'].O['devedor'].Remove('cpf');

    if BodyRequest.O['vinculo'].O['devedor'].S['cnpj'] = '' then
      BodyRequest.O['vinculo'].O['devedor'].Remove('cnpj');

    Result := BodyRequest.AsJSON;
  finally
    Recurrence.Free;
  end;
end;

procedure TViewPixCreateRecurrence.ClearRequestFields;
begin
  txtContrato.Text := '';
  txtObjeto.Text := '';
  txtNome.Text := '';
  txtDocumento.Text := '';
  txtDataInicial.Text := '';
  txtDataFinal.Text := '';
  cmbPeriodicidade.ItemIndex := -1;
  txtValorRec.Text := '';
  txtValorMinimo.Text := '';
  cmbRetentativa.ItemIndex := -1;
  txtTXID.Text := '';
  txtLoc.Text := '';
end;

end.


