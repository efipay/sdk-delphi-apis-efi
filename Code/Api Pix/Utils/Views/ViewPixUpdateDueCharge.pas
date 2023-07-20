unit ViewPixUpdateDueCharge;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, BodyDueChargeClass, xSuperObject, xSuperJSON;

type
  TPixUpdateDueCharge = class(TForm)
    GroupBox1: TGroupBox;
    Label3: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    txtDueDate: TEdit;
    txtValidade: TEdit;
    txtTXID: TEdit;
    GroupBox3: TGroupBox;
    GroupBox4: TGroupBox;
    Label5: TLabel;
    Label4: TLabel;
    txtModAbatimento: TEdit;
    txtPercentAbatimento: TEdit;
    GroupBox5: TGroupBox;
    txtValue: TEdit;
    GroupBox6: TGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    txtModDesconto: TEdit;
    txtPercentDesconto: TEdit;
    GroupBox7: TGroupBox;
    Label8: TLabel;
    Label9: TLabel;
    txtModJuros: TEdit;
    txtPercentJuros: TEdit;
    GroupBox8: TGroupBox;
    Label10: TLabel;
    Label11: TLabel;
    txtModMulta: TEdit;
    txtPercentMulta: TEdit;
    txtChave: TEdit;
    txtNumLocation: TEdit;
    GroupBox9: TGroupBox;
    txtSolicitacaoPagador: TEdit;
    GroupBox10: TGroupBox;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    txtNome: TEdit;
    txtDocumento: TEdit;
    txtEmail: TEdit;
    txtRua: TEdit;
    txtCidade: TEdit;
    txtEstado: TEdit;
    txtCep: TEdit;
    btnCancelar: TButton;
    btnUpdate: TButton;
    procedure FormCreate(Sender: TObject);
    function filter(condicao: Boolean; verdadeiro, falso: variant):variant;
    procedure btnUpdateClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
  private
    { Private declarations }
    function GetBody : String;
  public
    { Public declarations }
    property Body: String read GetBody;
    procedure ClearRequestfields;
  end;

var
  PixUpdateDueCharge: TPixUpdateDueCharge;

implementation

{$R *.dfm}

{ TPixUpdateDueCharge }

procedure TPixUpdateDueCharge.btnCancelarClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TPixUpdateDueCharge.btnUpdateClick(Sender: TObject);
begin
  if txtTXID.Text = EmptyStr then
  begin
    MessageDlg('O txid  não pode ser vazio', TMsgDlgType.mtInformation, [TMsgDlgBtn.mbOK], 0);
    if txtTXID.CanFocus then
       txtTXID.SetFocus;
  end
  else
    ModalResult := mrOk;
end;

procedure TPixUpdateDueCharge.ClearRequestfields;
begin
  txtDueDate.Text := '';
  txtValidade.Text := '';
  txtTXID.Text := '';
  txtModAbatimento.Text := '';
  txtValue.Text := '';
  txtPercentAbatimento.Text := '';
  txtModDesconto.Text := '';
  txtPercentDesconto.Text := '';
  txtModJuros.Text := '';
  txtPercentJuros.Text := '';
  txtModMulta.Text := '';
  txtPercentMulta.Text := '';
  txtChave.Text := '';
  txtNumLocation.Text := '';
  txtSolicitacaoPagador.Text := '';
  txtNome.Text := '';
  txtDocumento.Text := '';
  txtEmail.Text := '';
  txtRua.Text := '';
  txtCidade.Text := '';
  txtEstado.Text := '';
  txtCep.Text := '';
end;

function TPixUpdateDueCharge.filter(condicao: Boolean; verdadeiro,
  falso: variant): variant;
begin
  begin
  if (condicao) then
     result := StrToInt(verdadeiro)
  else
  begin
    result := falso;
  end;
end;
end;

procedure TPixUpdateDueCharge.FormCreate(Sender: TObject);
begin
  Self.Position := poScreenCenter;
end;

function TPixUpdateDueCharge.GetBody: String;
var
  ClassCOBVCreate : TBodyDueChargeClass;
  FCalendar          : TCalendar;
  FDebtor            : TDebtor;
  FValue             : TValue;
  FAbatimento        : TConfiguration;
  FDesconto          : TConfiguration;
  FJuros             : TConfiguration;
  FMulta             : TConfiguration;
  BodyRequest, debtor, value, validity : ISuperObject;

begin
     ClassCOBVCreate := TBodyDueChargeClass.Create;

     FCalendar.dueDate := txtDueDate.Text;
     FCalendar.validade :=filter(txtValidade.Text <> EmptyStr,txtValidade.Text, 0) ;
     FValue.value := txtValue.Text;
     ClassCOBVCreate.Key := txtChave.Text;
     FDebtor.name := txtNome.Text;
     FDebtor.cpf := txtDocumento.Text;
     FDebtor.cnpj := txtDocumento.Text;


    FAbatimento.modalidade := filter((txtModAbatimento.Text <> EmptyStr),txtModAbatimento.Text,0);
    FAbatimento.porcentagem := txtPercentAbatimento.Text;

     FDesconto.modalidade := filter((txtModDesconto.Text <> EmptyStr),txtModDesconto.Text,0);
     FDesconto.porcentagem := txtPercentDesconto.Text;

     FJuros.modalidade := filter((txtModJuros.Text <> EmptyStr),txtModJuros.Text,0);
     FJuros.porcentagem := txtPercentJuros.Text;

     FMulta.modalidade := filter((txtModMulta.Text <> EmptyStr),txtModMulta.Text,0);
     FMulta.porcentagem := txtPercentMulta.Text;

     FValue.abatimento := FAbatimento;
     FValue.desconto := FDesconto;
     FValue.juros := FJuros;
     FValue.multa := FMulta;


     FDebtor.email := txtEmail.Text;
     FDebtor.logradouro := txtRua.Text;
     FDebtor.cidade := txtCidade.Text;
     FDebtor.estado := txtEstado.Text;
     FDebtor.cep := txtCep.Text;


     ClassCOBVCreate.Calendar := FCalendar;
     ClassCOBVCreate.Debtor := FDebtor;
     ClassCOBVCreate.Value := FValue;
     ClassCOBVCreate.PayerRequest := txtSolicitacaoPagador.Text;
     BodyRequest := SO(ClassCOBVCreate.asJson(false, false));

     if ((ClassCOBVCreate.Value.abatimento.modalidade = 0) or (ClassCOBVCreate.Value.abatimento.porcentagem = EmptyStr)) then
        begin
          value := BodyRequest.O['valor'];
          value.Remove('abatimento');
          BodyRequest.SetData('valor',value);
        end;
     if (txtValidade.Text = EmptyStr)  then
        begin
          validity := BodyRequest.O['calendario'];
          validity.Remove('validadeAposVencimento');
          BodyRequest.SetData('calendario',validity);
        end;
  if (ClassCOBVCreate.Calendar.dueDate = EmptyStr)  then
        begin
          BodyRequest.Remove('calendario');
        end;
     if (ClassCOBVCreate.Key = EmptyStr)  then
        begin
          BodyRequest.Remove('chave');

        end;

     if ((ClassCOBVCreate.Value.desconto.modalidade = 0) or (ClassCOBVCreate.Value.desconto.porcentagem = EmptyStr)) then
        begin
          value := BodyRequest.O['valor'];
          value.Remove('desconto');
          BodyRequest.SetData('valor',value);
        end;



     if ((ClassCOBVCreate.Value.juros.modalidade = 0) or (ClassCOBVCreate.Value.juros.porcentagem = EmptyStr))  then
        begin
          value := BodyRequest.O['valor'];
          value.Remove('juros');
          BodyRequest.SetData('valor',value);
        end;



     if ((ClassCOBVCreate.Value.multa.modalidade = 0) or (ClassCOBVCreate.Value.multa.porcentagem = EmptyStr))  then
        begin
          value := BodyRequest.O['valor'];
          value.Remove('multa');
          BodyRequest.SetData('valor',value);
        end;



     if (TEncoding.UTF8.GetByteCount(ClassCOBVCreate.Debtor.cpf)> 11) then
        begin
          debtor := BodyRequest.O['devedor'] ;
          debtor.Remove('cpf');
          BodyRequest.SetData('devedor',debtor);
        end
     else
       begin
            debtor := BodyRequest.O['devedor'];
            debtor.Remove('cnpj');
            BodyRequest.SetData('devedor',debtor);
       end;


    if ClassCOBVCreate.Debtor.email = EmptyStr then
      begin
          debtor := BodyRequest.O['devedor'];
          debtor.Remove('email');
          BodyRequest.SetData('devedor',debtor);
      end;
    if ClassCOBVCreate.Debtor.cidade = EmptyStr then
      begin
          debtor := BodyRequest.O['devedor'];
          debtor.Remove('cidade');
          BodyRequest.SetData('devedor',debtor);
      end;
    if ClassCOBVCreate.Debtor.logradouro = EmptyStr then
      begin
          debtor := BodyRequest.O['devedor'];
          debtor.Remove('logradouro');
          BodyRequest.SetData('devedor',debtor);
      end;
    if ClassCOBVCreate.Debtor.estado = EmptyStr then
      begin
          debtor := BodyRequest.O['devedor'];
          debtor.Remove('uf');
          BodyRequest.SetData('devedor',debtor);
      end;
    if ClassCOBVCreate.Debtor.cep = EmptyStr then
      begin
          debtor := BodyRequest.O['devedor'];
          debtor.Remove('cep');
          BodyRequest.SetData('devedor',debtor);
      end;

   if (ClassCOBVCreate.Debtor.name = EmptyStr) or (txtDocumento.Text = EmptyStr) then
      begin
          BodyRequest.Remove('devedor');
      end;


     if ClassCOBVCreate.PayerRequest = EmptyStr then
      BodyRequest.Remove('solicitacaoPagador');


     if ClassCOBVCreate.Location.id = 0 then
      BodyRequest.Remove('loc');

     if (ClassCOBVCreate.Value.value = EmptyStr)  then
        begin
          BodyRequest.Remove('valor');
        end;



     Result :=  BodyRequest.asJson;



end;

end.
