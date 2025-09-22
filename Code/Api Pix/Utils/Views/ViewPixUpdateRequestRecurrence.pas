unit ViewPixUpdateRequestRecurrence;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  BodyRequestRecurrenceClass, XSuperJSON, XSuperObject, System.JSON, System.UITypes;

type
  TViewPixUpdateRequestRecurrence = class(TForm)
    GroupBox3: TGroupBox;
    GroupBox2: TGroupBox;
    btnConfirmRequest: TButton;
    btnCancelRequest: TButton;
    Label2: TLabel;
    txtIdSolicRec: TEdit;
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
  FormPixUpdateRequestRecurrence: TViewPixUpdateRequestRecurrence;

implementation

{$R *.dfm}

procedure TViewPixUpdateRequestRecurrence.FormCreate(Sender: TObject);
begin
  Self.Position := poScreenCenter;
end;

function TViewPixUpdateRequestRecurrence.GetIdent: String;
begin
  Result := txtIdSolicRec.Text;
end;

procedure TViewPixUpdateRequestRecurrence.btnCancelRequestClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TViewPixUpdateRequestRecurrence.btnConfirmRequestClick(Sender: TObject);
var
  DocLen: Integer;
begin
  if Trim(txtIdSolicRec.Text) = '' then
  begin
    MessageDlg('idSolicRec é obrigatório', TMsgDlgType.mtInformation, [TMsgDlgBtn.mbOK], 0);
    txtIdSolicRec.SetFocus;
    Exit;
  end
  else if boolStatus.Enabled = False then
  begin
    MessageDlg('Status é obrigatório', TMsgDlgType.mtInformation, [TMsgDlgBtn.mbOK], 0);
    boolStatus.SetFocus;
    Exit;
  end;

  ModalResult := mrOk;
end;

function TViewPixUpdateRequestRecurrence.GetBody: String;
var
  ClassRequestRecurrence: TBodyRequestRecurrence;
  BodyRequest: ISuperObject;
begin
  ClassRequestRecurrence := TBodyRequestRecurrence.Create;
  try
    if boolStatus.Checked = True then
      ClassRequestRecurrence.Status := 'CANCELADA';

    BodyRequest := SO(ClassRequestRecurrence.AsJSON(False, False));

    BodyRequest.Remove('idRec');
    BodyRequest.Remove('calendario');
    BodyRequest.Remove('destinatario');

    Result := BodyRequest.AsJSON;
  finally
    ClassRequestRecurrence.Free;
  end;
end;

procedure TViewPixUpdateRequestRecurrence.ClearRequestFields;
begin
  txtIdSolicRec.Text := '';
  boolStatus.Enabled := False;
end;

end.


