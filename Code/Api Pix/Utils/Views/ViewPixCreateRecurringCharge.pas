unit ViewPixCreateRecurringCharge;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  BodyRecurrenceClass, XSuperJSON, XSuperObject, System.JSON, System.UITypes;

type
  TViewPixCreateRecurringCharge = class(TForm)
    gbVinculo: TGroupBox;
    Label1: TLabel;
    txtContrato: TEdit;
    Label2: TLabel;
    txtObjeto: TEdit;
    gbDevedor: TGroupBox;
    Label3: TLabel;
    txtNome: TEdit;
    Label4: TLabel;
    txtCpf: TEdit;
    Label5: TLabel;
    txtCnpj: TEdit;
    gbCalendario: TGroupBox;
    Label6: TLabel;
    txtDataInicial: TEdit;
    Label7: TLabel;
    txtDataFinal: TEdit;
    Label8: TLabel;
    cbPeriodicidade: TComboBox;
    gbValor: TGroupBox;
    Label9: TLabel;
    txtValor: TEdit;
    gbPolitica: TGroupBox;
    Label10: TLabel;
    cbPoliticaRetentativa: TComboBox;
    gbLoc: TGroupBox;
    Label11: TLabel;
    txtLoc: TEdit;
    gbAtivacao: TGroupBox;
    Label12: TLabel;
    txtTxId: TEdit;
    btnConfirm: TButton;
    btnCancel: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnConfirmClick(Sender: TObject);
  private
    function GetBody: String;
    procedure PopulateCombos;
  public
    property Body: String read GetBody;
    procedure ClearFields;
  end;

implementation

{$R *.dfm}

procedure TViewPixCreateRecurringCharge.FormCreate(Sender: TObject);
begin
  Self.Position := poScreenCenter;
  PopulateCombos;
end;

procedure TViewPixCreateRecurringCharge.PopulateCombos;
begin
  cbPeriodicidade.Items.Clear;
  cbPeriodicidade.Items.Add('MENSAL');
  cbPeriodicidade.Items.Add('ANUAL');
  cbPeriodicidade.Items.Add('SEMANAL');
  cbPeriodicidade.ItemIndex := 0;

  cbPoliticaRetentativa.Items.Clear;
  cbPoliticaRetentativa.Items.Add('NAO_PERMITE');
  cbPoliticaRetentativa.Items.Add('PERMITE');
  cbPoliticaRetentativa.ItemIndex := 0;
end;

procedure TViewPixCreateRecurringCharge.btnCancelClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TViewPixCreateRecurringCharge.btnConfirmClick(Sender: TObject);
begin
  // Valida contrato
  if txtContrato.Text = '' then
  begin
    MessageDlg('Contrato é obrigatório', mtInformation, [mbOK], 0);
    txtContrato.SetFocus;
    Exit;
  end;

  // Valida devedor
  if ((txtNome.Text = '') and ((txtCpf.Text <> '') or (txtCnpj.Text <> ''))) or
     ((txtNome.Text <> '') and (txtCpf.Text = '') and (txtCnpj.Text = '')) then
  begin
    MessageDlg('Devedor deve ter nome e CPF ou CNPJ', mtInformation, [mbOK], 0);
    txtNome.SetFocus;
    Exit;
  end;

  // Valida valor
  if txtValor.Text = '' then
  begin
    MessageDlg('Valor é obrigatório', mtInformation, [mbOK], 0);
    txtValor.SetFocus;
    Exit;
  end;

  // Valida datas
  if txtDataInicial.Text = '' then
  begin
    MessageDlg('Data inicial é obrigatória', mtInformation, [mbOK], 0);
    txtDataInicial.SetFocus;
    Exit;
  end;

  if txtDataFinal.Text = '' then
  begin
    MessageDlg('Data final é obrigatória', mtInformation, [mbOK], 0);
    txtDataFinal.SetFocus;
    Exit;
  end;

  ModalResult := mrOk;
end;

function TViewPixCreateRecurringCharge.GetBody: String;
var
  BodyObj: TBodySubscription;
  Per: TPeriodicidade;
  Pol: TPoliticaRetentativa;
begin
  BodyObj := TBodySubscription.Create;
  try
    // Vinculo
    BodyObj.Vinculo.Contrato := txtContrato.Text;
    BodyObj.Vinculo.Objeto := txtObjeto.Text;
    BodyObj.Vinculo.Devedor.Nome := txtNome.Text;
    BodyObj.Vinculo.Devedor.Cpf := txtCpf.Text;
    BodyObj.Vinculo.Devedor.Cnpj := txtCnpj.Text;

    // Calendário
    BodyObj.Calendario.DataInicial := txtDataInicial.Text;
    BodyObj.Calendario.DataFinal := txtDataFinal.Text;

    case cbPeriodicidade.ItemIndex of
      0: Per := MENSAL;
      1: Per := ANUAL;
      2: Per := SEMANAL;
    end;
    BodyObj.Calendario.Periodicidade := Per;

    // Valor
    BodyObj.Valor.ValorRec := txtValor.Text;

    // Política retentativa
    if cbPoliticaRetentativa.ItemIndex = 0 then
      Pol := NAO_PERMITE
    else
      Pol := PERMITE;
    BodyObj.PoliticaRetentativa := Pol;

    // Loc
    if txtLoc.Text <> '' then
      BodyObj.Loc := StrToIntDef(txtLoc.Text, 0);

    // Ativação
    BodyObj.Ativacao.DadosJornada.TxId := txtTxId.Text;

    Result := TSuperObject.Create(BodyObj.AsJSON(False, False)).AsJSON;
  finally
    BodyObj.Free;
  end;
end;

procedure TViewPixCreateRecurringCharge.ClearFields;
begin
  txtContrato.Text := '';
  txtObjeto.Text := '';
  txtNome.Text := '';
  txtCpf.Text := '';
  txtCnpj.Text := '';
  txtDataInicial.Text := '';
  txtDataFinal.Text := '';
  cbPeriodicidade.ItemIndex := 0;
  txtValor.Text := '';
  cbPoliticaRetentativa.ItemIndex := 0;
  txtLoc.Text := '';
  txtTxId.Text := '';
end;

end.

