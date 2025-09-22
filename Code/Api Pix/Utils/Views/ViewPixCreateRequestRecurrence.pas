unit ViewPixCreateRequestRecurrence;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, BodyRequestRecurrenceClass, XSuperJSON, XSuperObject, System.JSON,
  System.UITypes;

type
  TViewPixCreateRequestRecurrence = class(TForm)
    GroupBox3: TGroupBox;
    txtIdRec: TEdit;
    Label1: TLabel;
    gbDevedor: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    txtAgencia: TEdit;
    txtConta: TEdit;
    btnConfirmRequest: TButton;
    btnCancelRequest: TButton;
    txtDocumento: TEdit;
    txtISPB: TEdit;
    Label5: TLabel;
    Label6: TLabel;
    GroupBox1: TGroupBox;
    Label4: TLabel;
    txtDataExpiracao: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure btnCancelRequestClick(Sender: TObject);
    procedure btnConfirmRequestClick(Sender: TObject);
  private
    function GetIdent: String;
    function GetBody : String;
  public
    property Identifier: String read GetIdent;
    property Body: String read GetBody;
    procedure ClearRequestfields;
  end;

implementation

{$R *.dfm}

procedure TViewPixCreateRequestRecurrence.btnCancelRequestClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TViewPixCreateRequestRecurrence.btnConfirmRequestClick(Sender: TObject);
var
  DocLen: Integer;
begin
  if txtIdRec.Text = EmptyStr then
  begin
    MessageDlg('idRec é obrigatório', TMsgDlgType.mtInformation, [TMsgDlgBtn.mbOK], 0);
    txtIdRec.SetFocus;
    Exit;
  end;

  if txtAgencia.Text = EmptyStr then
  begin
    MessageDlg('Agência é obrigatório', TMsgDlgType.mtInformation, [TMsgDlgBtn.mbOK], 0);
    txtAgencia.SetFocus;
    Exit;
  end;

  if txtConta.Text = EmptyStr then
  begin
    MessageDlg('Conta é obrigatório', TMsgDlgType.mtInformation, [TMsgDlgBtn.mbOK], 0);
    txtConta.SetFocus;
    Exit;
  end;

  if txtDocumento.Text = EmptyStr then
  begin
    MessageDlg('CPF/CNPJ é obrigatório', TMsgDlgType.mtInformation, [TMsgDlgBtn.mbOK], 0);
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

  if txtISPB.Text = EmptyStr then
  begin
    MessageDlg('ISPB é obrigatório', TMsgDlgType.mtInformation, [TMsgDlgBtn.mbOK], 0);
    txtISPB.SetFocus;
    Exit;
  end;

  if txtDataExpiracao.Text = EmptyStr then
  begin
    MessageDlg('Data de Expiração é obrigatório', TMsgDlgType.mtInformation, [TMsgDlgBtn.mbOK], 0);
    txtDataExpiracao.SetFocus;
    Exit;
  end;

  ModalResult := mrOk;
end;

procedure TViewPixCreateRequestRecurrence.FormCreate(Sender: TObject);
begin
  Self.Position := poScreenCenter;
end;

function TViewPixCreateRequestRecurrence.GetIdent: String;
begin
  Result := txtIdRec.Text;
end;

function TViewPixCreateRequestRecurrence.GetBody: String;
var
  ClassRequestRecurrence        : TBodyRequestRecurrence;
  Calendario                    : TCalendar;
  Destinatario                  : TRecipient;
  BodyRequest                   : ISuperObject;
  DocLen                        : Integer;
begin
  ClassRequestRecurrence := TBodyRequestRecurrence.Create;
  try
    ClassRequestRecurrence.IdRec := Trim(txtIdRec.Text);

    Destinatario.agency := Trim(txtAgencia.Text);
    Destinatario.account := Trim(txtConta.Text);
    DocLen := Length(Trim(txtDocumento.Text));
    if DocLen = 11 then
    begin
      Destinatario.cpf := Trim(txtDocumento.Text);
      Destinatario.cnpj := '';
    end
    else if DocLen = 14 then
    begin
      Destinatario.cnpj := Trim(txtDocumento.Text);
      Destinatario.cpf := '';
    end;
    Destinatario.participantISPB := Trim(txtISPB.Text);
    ClassRequestRecurrence.Recipient := Destinatario;

    BodyRequest := SO(ClassRequestRecurrence.AsJSON(False, False));

    BodyRequest.Remove('status');

    if BodyRequest.O['destinatario'].S['cpf'] = '' then
      BodyRequest.O['destinatario'].Remove('cpf');

    if BodyRequest.O['destinatario'].S['cnpj'] = '' then
      BodyRequest.O['destinatario'].Remove('cnpj');

    BodyRequest.O['calendario'].S['dataExpiracaoSolicitacao'] := txtDataExpiracao.Text;

  finally
    Result := BodyRequest.AsJSON;
  end;
end;

procedure TViewPixCreateRequestRecurrence.ClearRequestfields;
begin
  txtIdRec.Text := '';
  txtAgencia.Text := '';
  txtConta.Text := '';
  txtDocumento.Text := '';
  txtISPB.Text := '';
  txtDataExpiracao.Text := '';
end;

end.
