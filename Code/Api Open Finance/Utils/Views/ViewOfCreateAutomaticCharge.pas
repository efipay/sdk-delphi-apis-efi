unit ViewOfCreateAutomaticCharge;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  BodyOfAutomaticClass, XSuperJSON, XSuperObject, System.JSON, System.UITypes;

type
  TViewOfCreateAutomaticCharge = class(TForm)
    GroupBox3: TGroupBox;
    btnConfirmRequest: TButton;
    btnCancelRequest: TButton;
    GroupBox2: TGroupBox;
    txtIDAdesao: TEdit;
    GroupBox4: TGroupBox;
    Label1: TLabel;
    txtIdemKey: TEdit;
    Label2: TLabel;
    txtData: TEdit;
    Label3: TLabel;
    txtValor: TEdit;
    Label4: TLabel;
    txtIBGE: TEdit;
    Label5: TLabel;
    txtInfoPagador: TEdit;
    procedure btnConfirmRequestClick(Sender: TObject);
    procedure btnCancelRequestClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    function GetBody: String;
    function GetIdemKey: String;
  public
    property Body: String read GetBody;
    property IdemKey: String read GetIdemKey;
    procedure ClearRequestfields;
  end;

implementation

{$R *.dfm}

procedure TViewOfCreateAutomaticCharge.FormCreate(Sender: TObject);
begin
  Self.Position := poScreenCenter;
end;

function TViewOfCreateAutomaticCharge.GetIdemKey: String;
begin
  Result := txtIdemKey.Text;
end;

procedure TViewOfCreateAutomaticCharge.btnCancelRequestClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TViewOfCreateAutomaticCharge.btnConfirmRequestClick(Sender: TObject);
begin
  if txtIdemKey.Text = '' then
  begin
    MessageDlg('Idempotency Key é obrigatório!', TMsgDlgType.mtInformation, [TMsgDlgBtn.mbOK], 0);
    txtIdemKey.SetFocus;
    Exit;
  end;
  if txtIDAdesao.Text = '' then
  begin
    MessageDlg('Identificador da Adesão é obrigatório!', TMsgDlgType.mtInformation, [TMsgDlgBtn.mbOK], 0);
    txtIdemKey.SetFocus;
    Exit;
  end;
  if txtData.Text = '' then
  begin
    MessageDlg('Data é obrigatória!', TMsgDlgType.mtInformation, [TMsgDlgBtn.mbOK], 0);
    txtData.SetFocus;
    Exit;
  end;
  if txtValor.Text = '' then
  begin
    MessageDlg('Valor é obrigatório!', TMsgDlgType.mtInformation, [TMsgDlgBtn.mbOK], 0);
    txtValor.SetFocus;
    Exit;
  end;

  ModalResult := mrOk;
end;

function TViewOfCreateAutomaticCharge.GetBody: String;
var
  AutomaticCharge: TBodyOfAutomatic;
  Pagamento: TPagamento;
  BodyRequest: ISuperObject;
begin
  AutomaticCharge := TBodyOfAutomatic.Create;
  try
    AutomaticCharge.IdentificadorAdesao := Trim(txtIDAdesao.Text);
    Pagamento.data := Trim(txtData.Text);
    Pagamento.valor := Trim(txtValor.Text);
    Pagamento.codigoCidadeIBGE := Trim(txtIBGE.Text);
    Pagamento.infoPagador := Trim(txtInfoPagador.Text);
    AutomaticCharge.Pagamento := Pagamento;

    BodyRequest := SO(AutomaticCharge.AsJSON(False, False));

    BodyRequest.Remove('pagador');
    BodyRequest.Remove('favorecido');
    BodyRequest.Remove('assinatura');
    BodyRequest.Remove('identificador');
    BodyRequest.Remove('status');
    BodyRequest.Remove('endToEndId');

    if Trim(txtIBGE.Text) = '' then
    begin
      if BodyRequest.Check('pagamento') and BodyRequest.O['pagamento'].Check('codigoCidadeIBGE') then
        BodyRequest.O['pagamento'].Remove('codigoCidadeIBGE');
    end;

    if Trim(txtInfoPagador.Text) = '' then
    begin
      if BodyRequest.Check('pagamento') and BodyRequest.O['pagamento'].Check('infoPagador') then
        BodyRequest.O['pagamento'].Remove('infoPagador');
    end;

    Result := BodyRequest.AsJSON;
  finally
    AutomaticCharge.Free;
  end;
end;

procedure TViewOfCreateAutomaticCharge.ClearRequestfields;
begin
  txtIdemKey.Text := '';
  txtIDAdesao.Text := '';
  txtValor.Text := '';
  txtData.Text := '';
  txtIBGE.Text := '';
  txtInfoPagador.Text := '';
end;

end.
