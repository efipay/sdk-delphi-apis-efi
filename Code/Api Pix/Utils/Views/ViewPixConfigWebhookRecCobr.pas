unit ViewPixConfigWebhookRecCobr;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, BodyWebhookClass, XSuperObject,
  System.UITypes;

type
  TViewPixConfigWebhookRecCobr = class(TForm)
    GroupBox3: TGroupBox;
    btnCancelRequest: TButton;
    btnConfirmRequest: TButton;
    gbBody: TGroupBox;
    Label2: TLabel;
    txtWebhookURL: TEdit;
    cbxSkipmtls: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure btnConfirmRequestClick(Sender: TObject);
    procedure btnCancelRequestClick(Sender: TObject);
  private
    function GetBody : String;
    function GetSkipMTLS : String;
  public
    property Body: String read GetBody;
    property SkipMTLS: String read GetSkipMTLS;
    procedure ClearRequestfields;
  end;

implementation

{$R *.dfm}

procedure TViewPixConfigWebhookRecCobr.btnCancelRequestClick(Sender: TObject);
begin
  ModalResult := mrCancel
end;

procedure TViewPixConfigWebhookRecCobr.btnConfirmRequestClick(Sender: TObject);
begin
  if txtWebhookURL.Text = EmptyStr then
  begin
    MessageDlg('É necessário uma URL de notificação!', TMsgDlgType.mtInformation, [TMsgDlgBtn.mbOK], 0);
    txtWebhookURL.SetFocus;
    Exit;
  end;

  ModalResult := mrOk;
end;

procedure TViewPixConfigWebhookRecCobr.ClearRequestfields;
begin
  txtWebhookURL.Text := '';
end;

procedure TViewPixConfigWebhookRecCobr.FormCreate(Sender: TObject);
begin
  Self.Position := poScreenCenter;
end;

function TViewPixConfigWebhookRecCobr.GetSkipMTLS: String;
begin
  if cbxSkipmtls.Checked then
    Result := 'true'
  else
    Result := 'false';
end;

function TViewPixConfigWebhookRecCobr.GetBody: String;
var
  BodyRequest : TBodyWebhookClass;
begin

  BodyRequest := TBodyWebhookClass.Create;

  BodyRequest.WebhookUrl := txtWebhookUrl.Text;

  Result := BodyRequest.AsJSON;
end;

end.
