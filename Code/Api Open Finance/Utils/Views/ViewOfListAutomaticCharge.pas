unit ViewOfListAutomaticCharge;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  BodyOfAutomaticClass, XSuperJSON, XSuperObject, System.JSON, System.UITypes;

type
  TViewOfListAutomaticCharge = class(TForm)
    GroupBox3: TGroupBox;
    txtIDAdesao: TEdit;
    txtE2EID: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    btnConfirmRequest: TButton;
    btnCancelRequest: TButton;
    procedure btnConfirmRequestClick(Sender: TObject);
    procedure btnCancelRequestClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    function GetIdentificadorAdesao: String;
    function GetE2EID: String;
  public
    property IdentificadorAdesao: String read GetIdentificadorAdesao;
    property E2EID: String read GetE2EID;
    procedure ClearRequestfields;
  end;

implementation

{$R *.dfm}

procedure TViewOfListAutomaticCharge.FormCreate(Sender: TObject);
begin
  Self.Position := poScreenCenter;
end;

function TViewOfListAutomaticCharge.GetIdentificadorAdesao: String;
begin
  Result := txtIDAdesao.Text;
end;

function TViewOfListAutomaticCharge.GetE2EID: String;
begin
  if txtE2EID.Text = '' then
    Result := '&endToEndId=' + txtE2EID.Text
  else
    Result := '';
end;

procedure TViewOfListAutomaticCharge.btnCancelRequestClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TViewOfListAutomaticCharge.btnConfirmRequestClick(Sender: TObject);
begin
  if txtIDAdesao.Text = EmptyStr then
  begin
    MessageDlg('Identificador de Adesão não pode ser vazia!', TMsgDlgType.mtInformation, [TMsgDlgBtn.mbOK], 0);
    txtIDAdesao.SetFocus;
    Exit;
  end;

  ModalResult := mrOk;
end;

procedure TViewOfListAutomaticCharge.ClearRequestfields;
begin
  txtIDAdesao.Text := '';
  txtE2EID.Text   := '';
end;

end.
