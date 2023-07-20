unit ViewPixCreateDueCharge;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, BodyDueChargeClass, xSuperObject, xSuperJSON;

type
  TCreateDueCharge = class(TForm)
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    txtDueDate: TEdit;
    Label2: TLabel;
    txtValidade: TEdit;
    Label3: TLabel;
    txtTXID: TEdit;
    GroupBox3: TGroupBox;
    GroupBox4: TGroupBox;
    Label5: TLabel;
    txtModAbatimento: TEdit;
    GroupBox5: TGroupBox;
    txtValue: TEdit;
    Label4: TLabel;
    txtPercentAbatimento: TEdit;
    GroupBox6: TGroupBox;
    Label6: TLabel;
    txtModDesconto: TEdit;
    Label7: TLabel;
    txtPercentDesconto: TEdit;
    GroupBox7: TGroupBox;
    Label8: TLabel;
    txtModJuros: TEdit;
    Label9: TLabel;
    txtPercentJuros: TEdit;
    GroupBox8: TGroupBox;
    Label10: TLabel;
    txtModMulta: TEdit;
    Label11: TLabel;
    txtPercentMulta: TEdit;
    Label12: TLabel;
    txtChave: TEdit;
    Label13: TLabel;
    txtNumLocation: TEdit;
    GroupBox9: TGroupBox;
    txtSolicitacaoPagador: TEdit;
    GroupBox10: TGroupBox;
    Label14: TLabel;
    txtNome: TEdit;
    Label15: TLabel;
    txtDocumento: TEdit;
    Label16: TLabel;
    txtEmail: TEdit;
    Label17: TLabel;
    txtRua: TEdit;
    Label18: TLabel;
    txtCidade: TEdit;
    Label19: TLabel;
    txtEstado: TEdit;
    Label20: TLabel;
    txtCep: TEdit;
    btnCancelar: TButton;
    btnCreate: TButton;
    procedure btnCreateClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    function filter(condicao: Boolean; verdadeiro, falso: variant):variant;
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
  CreateDueCharge: TCreateDueCharge;

implementation

{$R *.dfm}

procedure TCreateDueCharge.btnCancelarClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TCreateDueCharge.btnCreateClick(Sender: TObject);
begin
  if txtTXID.Text = EmptyStr then
  begin
    MessageDlg('O txid  não pode ser vazio', TMsgDlgType.mtInformation, [TMsgDlgBtn.mbOK], 0);
    if txtTXID.CanFocus then
       txtTXID.SetFocus;
  end
  else if txtChave.Text = EmptyStr then
  begin
    MessageDlg('A chave não pode ser vazia', TMsgDlgType.mtInformation, [TMsgDlgBtn.mbOK], 0);
    if txtChave.CanFocus then
       txtChave.SetFocus;
  end
  else if txtValue.Text = EmptyStr then
  begin
    MessageDlg('O valor não pode ser vazio', TMsgDlgType.mtInformation, [TMsgDlgBtn.mbOK], 0);
    if txtValue.CanFocus then
       txtValue.SetFocus;
  end
  else if txtValue.Text = EmptyStr then
  begin
    MessageDlg('O valor não pode ser vazio', TMsgDlgType.mtInformation, [TMsgDlgBtn.mbOK], 0);
    if txtValue.CanFocus then
       txtValue.SetFocus;
  end
  else if txtDueDate.Text = EmptyStr then
  begin
    MessageDlg('O vencimento  não pode ser vazio', TMsgDlgType.mtInformation, [TMsgDlgBtn.mbOK], 0);
    if txtDueDate.CanFocus then
       txtDueDate.SetFocus;
  end
  else if txtNome.Text = EmptyStr then
  begin
    MessageDlg('O nome  não pode ser vazio', TMsgDlgType.mtInformation, [TMsgDlgBtn.mbOK], 0);
    if txtNome.CanFocus then
       txtNome.SetFocus;
  end
  else if txtDocumento.Text = EmptyStr then
  begin
    MessageDlg('O documento  não pode ser vazio', TMsgDlgType.mtInformation, [TMsgDlgBtn.mbOK], 0);
    if txtDocumento.CanFocus then
       txtDocumento.SetFocus;
  end
  else
    ModalResult := mrOk;
end;

procedure TCreateDueCharge.ClearRequestfields;
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

function TCreateDueCharge.filter(condicao: Boolean; verdadeiro,
  falso: variant):variant;
begin
  if (condicao) then
     result := StrToInt(verdadeiro)
  else
  begin
    result := falso;
  end;
end;

procedure TCreateDueCharge.FormCreate(Sender: TObject);
begin
    Self.Position := poScreenCenter;
end;

function TCreateDueCharge.GetBody: String;
var
  ClassCOBVCreate : TBodyDueChargeClass;
  FCalendar          : TCalendar;
  FDebtor            : TDebtor;
  FValue             : TValue;
  FAbatimento        : TConfiguration;
  FDesconto          : TConfiguration;
  FJuros             : TConfiguration;
  FMulta             : TConfiguration;
  BodyRequest, debtor, value : ISuperObject;

begin
     ClassCOBVCreate := TBodyDueChargeClass.Create;

     FCalendar.dueDate := txtDueDate.Text;
     FCalendar.validade := StrToInt(txtValidade.Text) ;
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


     if ClassCOBVCreate.PayerRequest = EmptyStr then
      BodyRequest.Remove('solicitacaoPagador');


     if ClassCOBVCreate.Location.id = 0 then
      BodyRequest.Remove('loc');



     Result :=  BodyRequest.asJson;




end;

end.
