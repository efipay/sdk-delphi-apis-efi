unit ViewPixUpdateRecurrence;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  BodyRecurrenceClass, XSuperJSON, XSuperObject, System.JSON, System.UITypes;

type
  TViewPixUpdateRecurrence = class(TForm)
    GroupBox3: TGroupBox;
    GroupBox1: TGroupBox;
    Label4: TLabel;
    txtDataInicial: TEdit;
    GroupBox2: TGroupBox;
    GroupBox4: TGroupBox;
    Label11: TLabel;
    txtTXID: TEdit;
    btnConfirmRequest: TButton;
    btnCancelRequest: TButton;
    GroupBox5: TGroupBox;
    Label1: TLabel;
    txtNome: TEdit;
    GroupBox6: TGroupBox;
    Label10: TLabel;
    txtLoc: TEdit;
    Label2: TLabel;
    txtIdRec: TEdit;
    boolStatus: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure btnCancelRequestClick(Sender: TObject);
    procedure btnConfirmRequestClick(Sender: TObject);
  private
    function GetIdent: String;
    function GetBody: String;
  public
    procedure ClearRequestFields;
    property Identifier: String read GetIdent;
    property Body: String read GetBody;
  end;

var
  FormPixUpdateRecurrence: TViewPixUpdateRecurrence;

implementation

{$R *.dfm}

procedure TViewPixUpdateRecurrence.FormCreate(Sender: TObject);
begin
  Self.Position := poScreenCenter;
end;

function TViewPixUpdateRecurrence.GetIdent: String;
begin
  Result := txtIdRec.Text;
end;

procedure TViewPixUpdateRecurrence.btnCancelRequestClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TViewPixUpdateRecurrence.btnConfirmRequestClick(Sender: TObject);
var
  DocLen: Integer;
begin
  if Trim(txtIdRec.Text) = '' then
  begin
    MessageDlg('idRec é obrigatório', mtInformation, [mbOK], 0);
    txtIdRec.SetFocus;
    Exit;
  end;

  ModalResult := mrOk;
end;

function TViewPixUpdateRecurrence.GetBody: String;
var
  Subscription: TBodyRecurrence;
  Vinculo: TLink;
  Devedor: TDebtor;
  Calendario: TCalendar;
  Ativacao: TActivation;
  BodyRequest: ISuperObject;
begin
  Subscription := TBodyRecurrence.Create;
  try

    Devedor.name := Trim(txtNome.Text);
    Vinculo.debtor := Devedor;
    Subscription.link := Vinculo;

    Calendario.startDate := Trim(txtDataInicial.Text);
    Subscription.Calendar := Calendario;

    if boolStatus.Checked = True then
      Subscription.Status := 'CANCELADA';

    Subscription.Loc := StrToIntDef(Trim(txtLoc.Text), 0);

    Ativacao.journeyData.txid := Trim(txtTXID.Text);
    Subscription.activation := Ativacao;

    BodyRequest := SO(Subscription.AsJSON(False, False));

    BodyRequest.O['vinculo'].Remove('contrato');
    BodyRequest.O['vinculo'].Remove('objeto');

    if Trim(txtNome.Text) = '' then
      BodyRequest.Remove('vinculo')
    else
    begin
      BodyRequest.O['vinculo'].O['devedor'].Remove('cpf');
      BodyRequest.O['vinculo'].O['devedor'].Remove('cnpj');
    end;

    if Trim(txtDataInicial.Text) = '' then
      BodyRequest.O['calendario'].Remove('dataInicial');

    BodyRequest.O['calendario'].Remove('dataFinal');
    BodyRequest.O['calendario'].Remove('periodicidade');

    if BodyRequest.Check('calendario') and (BodyRequest.O['calendario'].Count = 0) then
      BodyRequest.Remove('calendario');

    BodyRequest.Remove('valor');
    BodyRequest.Remove('politicaRetentativa');

    if Trim(txtLoc.Text) = '' then
      BodyRequest.Remove('loc');

    if boolStatus.Checked = False then
      BodyRequest.Remove('status');

    if Trim(txtTXID.Text) = '' then
      if BodyRequest.Check('ativacao') and BodyRequest.O['ativacao'].Check('dadosJornada') then
        BodyRequest.O['ativacao'].O['dadosJornada'].Remove('txid');

    if BodyRequest.Check('ativacao') and BodyRequest.O['ativacao'].Check('dadosJornada') and (BodyRequest.O['ativacao'].O['dadosJornada'].Count = 0) then
      BodyRequest.O['ativacao'].Remove('dadosJornada');

    if BodyRequest.Check('ativacao') and (BodyRequest.O['ativacao'].Count = 0) then
      BodyRequest.Remove('ativacao');

    Result := BodyRequest.AsJSON;
  finally
    Subscription.Free;
  end;
end;

procedure TViewPixUpdateRecurrence.ClearRequestFields;
begin
  txtIdRec.Text := '';
  txtNome.Text := '';
  txtDataInicial.Text := '';
  boolStatus.Enabled := False;
  txtTXID.Text := '';
  txtLoc.Text := '';
end;

end.


