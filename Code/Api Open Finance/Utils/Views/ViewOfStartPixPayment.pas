unit ViewOfStartPixPayment;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, BodyOfStartPixPayment, xSuperObject, xSuperJSON;

type
  TOfStartPixPayment = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    txtIdempotency: TEdit;
    GroupBox2: TGroupBox;
    Label2: TLabel;
    txtIdParticipante: TEdit;
    Label3: TLabel;
    txtCpf: TEdit;
    labelCnpj: TLabel;
    txtCnpj: TEdit;
    GroupBox3: TGroupBox;
    Label4: TLabel;
    txtCodigoBanco: TEdit;
    Label5: TLabel;
    txtAgencia: TEdit;
    Label6: TLabel;
    txtDocumentoFavorecido: TEdit;
    Label7: TLabel;
    txtNome: TEdit;
    Label8: TLabel;
    txtConta: TEdit;
    Label9: TLabel;
    txtTipoConta: TEdit;
    Label10: TLabel;
    txtValor: TEdit;
    Label11: TLabel;
    txtCodigoCidade: TEdit;
    Label12: TLabel;
    txtInfoPagador: TEdit;
    Label13: TLabel;
    txtIdProprio: TEdit;
    btnCancelar: TButton;
    btnStartPayment: TButton;
    procedure btnStartPaymentClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    function GetBody : String;
  public
    { Public declarations }
    property Body: String read GetBody;
     procedure ClearRequestfields;
  end;

var
  OfStartPixPayment: TOfStartPixPayment;

implementation

{$R *.dfm}

{ TOfStartPixPayment }

procedure TOfStartPixPayment.btnCancelarClick(Sender: TObject);
begin
      ModalResult := mrCancel;
end;

procedure TOfStartPixPayment.btnStartPaymentClick(Sender: TObject);
begin
  if txtIdempotency.Text = EmptyStr then
  begin
    MessageDlg('O identificador de idempotência não pode ser vazio', TMsgDlgType.mtInformation, [TMsgDlgBtn.mbOK], 0);
    if txtIdempotency.CanFocus then
       txtIdempotency.SetFocus;
  end

  else if txtIdParticipante.Text = EmptyStr then
  begin
    MessageDlg('O identificador do banco participante não pode ser vazio', TMsgDlgType.mtInformation, [TMsgDlgBtn.mbOK], 0);
    if txtIdParticipante.CanFocus then
       txtIdParticipante.SetFocus;
  end

  else if txtCpf.Text = EmptyStr then
  begin
    MessageDlg('O cpf  não pode ser vazio', TMsgDlgType.mtInformation, [TMsgDlgBtn.mbOK], 0);
    if txtCpf.CanFocus then
       txtCpf.SetFocus;
  end

  else if txtCodigoBanco.Text = EmptyStr then
  begin
    MessageDlg('O código do banco não pode ser vazio', TMsgDlgType.mtInformation, [TMsgDlgBtn.mbOK], 0);
    if txtCodigoBanco.CanFocus then
       txtCodigoBanco.SetFocus;
  end

  else if txtAgencia.Text = EmptyStr then
  begin
    MessageDlg('A agência do banco não pode ser vazia', TMsgDlgType.mtInformation, [TMsgDlgBtn.mbOK], 0);
    if txtAgencia.CanFocus then
       txtAgencia.SetFocus;
  end

  else if txtDocumentoFavorecido.Text = EmptyStr then
  begin
    MessageDlg('O documento do favorecido não pode ser vazio', TMsgDlgType.mtInformation, [TMsgDlgBtn.mbOK], 0);
    if txtDocumentoFavorecido.CanFocus then
       txtDocumentoFavorecido.SetFocus;
  end

  else if txtNome.Text = EmptyStr then
  begin
    MessageDlg('O nome  do favorecido não pode ser vazio', TMsgDlgType.mtInformation, [TMsgDlgBtn.mbOK], 0);
    if txtNome.CanFocus then
       txtNome.SetFocus;
  end

  else if txtConta.Text = EmptyStr then
  begin
    MessageDlg('A conta do favorecido não pode ser vazia', TMsgDlgType.mtInformation, [TMsgDlgBtn.mbOK], 0);
    if txtConta.CanFocus then
       txtConta.SetFocus;
  end

  else if txtTipoConta.Text = EmptyStr then
  begin
    MessageDlg('O tipo de conta do favorecido não pode ser vazia', TMsgDlgType.mtInformation, [TMsgDlgBtn.mbOK], 0);
    if txtTipoConta.CanFocus then
       txtTipoConta.SetFocus;
  end

  else if txtValor.Text = EmptyStr then
  begin
    MessageDlg('O valor de transferência não pode ser vazio', TMsgDlgType.mtInformation, [TMsgDlgBtn.mbOK], 0);
    if txtValor.CanFocus then
       txtValor.SetFocus;
  end
  else
    ModalResult := mrOk;
end;

procedure TOfStartPixPayment.ClearRequestfields;
begin
    txtIdempotency.Text := '';
    txtIdParticipante.Text := '';
    txtCpf.Text := '';
    txtCnpj.Text := '';
    txtCodigoBanco.Text := '';
    txtAgencia.Text := '';
    txtDocumentoFavorecido.Text := '';
    txtNome.Text := '';
    txtConta.Text := '';
    txtTipoConta.Text := '';
    txtValor.Text := '';
    txtCodigoCidade.Text := '';
    txtInfoPagador.Text := '';
    txtIdProprio.Text := '';

end;

procedure TOfStartPixPayment.FormCreate(Sender: TObject);
begin
    Self.Position := poScreenCenter;
end;

function TOfStartPixPayment.GetBody: String;
var
  ClassStartPixPayment      : TBodyOfStartPixPayment;
  FPagador                  : TPagador;
  FFavorecido               : TFavorecido;
  FContaBanco               : TContaBanco;
  BodyRequest, Pagador               : ISuperObject;
begin
      ClassStartPixPayment := TBodyOfStartPixPayment.Create;
      FPagador.idParticipante:= txtIdParticipante.Text;
      FPagador.cpf := txtCpf.Text;
      FPagador.cnpj := txtCnpj.Text;

      FContaBanco.codigoBanco := txtCodigoBanco.Text;
      FContaBanco.agencia := txtAgencia.Text;
      FContaBanco.documento := txtDocumentoFavorecido.Text;
      FContaBanco.nome := txtNome.Text;
      FContaBanco.tipoConta := txtTipoConta.Text;

      FFavorecido.contaBanco := FContaBanco;
      ClassStartPixPayment.Pagador := FPagador;
      ClassStartPixPayment.Favorecido := FFavorecido;
      ClassStartPixPayment.Valor := txtValor.Text;
      ClassStartPixPayment.CodigoCidade:= txtCodigoCidade.Text;
      ClassStartPixPayment.InfoPagador:= txtInfoPagador.Text;
      ClassStartPixPayment.IdProprio := txtIdProprio.Text;

      BodyRequest := SO(ClassStartPixPayment.AsJSON(false,false));

      if txtCnpj.Text = EmptyStr  then
      begin
          Pagador :=  BodyRequest.O['pagador'];
          Pagador.Remove('cnpj');
          BodyRequest.SetData('pagador',Pagador);
      end;

      if txtCodigoCidade.Text = EmptyStr then
      begin
            BodyRequest.Remove('codigoCidadeIBGE');
      end;

      if txtInfoPagador.Text = EmptyStr then
      begin
            BodyRequest.Remove('infoPagador');
      end;

      if txtIdProprio.Text = EmptyStr then
      begin
            BodyRequest.Remove('idProprio');
      end;

      Result:= BodyRequest.AsJSON;




end;

end.
