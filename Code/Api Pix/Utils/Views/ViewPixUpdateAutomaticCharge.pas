unit ViewPixUpdateAutomaticCharge;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  BodyAutomaticChargeClass, XSuperJSON, XSuperObject, System.JSON, System.UITypes;

type
  TViewPixUpdateAutomaticCharge = class(TForm)
    GroupBox3: TGroupBox;
    GroupBox2: TGroupBox;
    btnConfirmRequest: TButton;
    btnCancelRequest: TButton;
    Label2: TLabel;
    txtTXID: TEdit;
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
  FormPixUpdateAutomaticCharge: TViewPixUpdateAutomaticCharge;

implementation

{$R *.dfm}

procedure TViewPixUpdateAutomaticCharge.FormCreate(Sender: TObject);
begin
  Self.Position := poScreenCenter;
end;

function TViewPixUpdateAutomaticCharge.GetIdent: String;
begin
  Result := txtTXID.Text;
end;

procedure TViewPixUpdateAutomaticCharge.btnCancelRequestClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TViewPixUpdateAutomaticCharge.btnConfirmRequestClick(Sender: TObject);
var
  DocLen: Integer;
begin
  if Trim(txtTXID.Text) = '' then
  begin
    MessageDlg('TXID é obrigatório', TMsgDlgType.mtInformation, [TMsgDlgBtn.mbOK], 0);
    txtTXID.SetFocus;
    Exit;
  end
  else if boolStatus.Enabled = False then
  begin
    MessageDlg('Status é obrigatório', TMsgDlgType.mtInformation, [TMsgDlgBtn.mbOK], 0);
    boolStatus.SetFocus;
    Exit;
  end;

  showMessage(Body);
  ModalResult := mrOk;
end;

function TViewPixUpdateAutomaticCharge.GetBody: String;
var
  ClassAutomaticCharge: TBodyAutomaticCharge;
  BodyRequest: ISuperObject;
begin
  ClassAutomaticCharge := TBodyAutomaticCharge.Create;
  try
    if boolStatus.Checked = True then
      ClassAutomaticCharge.Status := 'CANCELADA';

    BodyRequest := SO(ClassAutomaticCharge.AsJSON(False, False));

    BodyRequest.Remove('idRec');
    BodyRequest.Remove('infoAdicional');
    BodyRequest.Remove('calendario');
    BodyRequest.Remove('valor');
    BodyRequest.Remove('ajusteDiaUtil');
    BodyRequest.Remove('devedor');
    BodyRequest.Remove('recebedor');

    Result := BodyRequest.AsJSON;
  finally
    ClassAutomaticCharge.Free;
  end;
end;

procedure TViewPixUpdateAutomaticCharge.ClearRequestFields;
begin
  txtTXID.Text := '';
  boolStatus.Enabled := False;
end;

end.


