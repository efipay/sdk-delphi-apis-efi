unit ViewOfConfigUpdate;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, BodyOfConfigUpdate, xSuperObject, xSuperJSON;

type
  TOfConfigUpdate = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    txtRedirectUrl: TEdit;
    Label2: TLabel;
    txtWebhook: TEdit;
    Label3: TLabel;
    optHash: TCheckBox;
    labelHash: TLabel;
    txtHash: TEdit;
    btnCancelar: TButton;
    btnUpdateConfig: TButton;
    procedure optHashClick(Sender: TObject);
    procedure btnUpdateConfigClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
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
  OfConfigUpdate: TOfConfigUpdate;

implementation

{$R *.dfm}

procedure TOfConfigUpdate.btnCancelarClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TOfConfigUpdate.btnUpdateConfigClick(Sender: TObject);
begin
  if txtRedirectUrl.Text = EmptyStr then
  begin
    MessageDlg('A URL de redirecionamento não pode ser vazia', TMsgDlgType.mtInformation, [TMsgDlgBtn.mbOK], 0);
    if txtRedirectUrl.CanFocus then
       txtRedirectUrl.SetFocus;
  end
  else if txtWebhook.Text = EmptyStr then
  begin
    MessageDlg('A URL de Webhook não pode ser vazia', TMsgDlgType.mtInformation, [TMsgDlgBtn.mbOK], 0);
    if txtWebhook.CanFocus then
       txtWebhook.SetFocus;
  end
  else
    ModalResult := mrOk;
end;

procedure TOfConfigUpdate.ClearRequestfields;
begin
    txtRedirectUrl.Text := '';
    txtWebhook.Text := '';
    if optHash.Checked then
      optHash.Checked := false;

end;

procedure TOfConfigUpdate.FormCreate(Sender: TObject);
begin
    Self.Position := poScreenCenter;
end;

function TOfConfigUpdate.GetBody: String;
var
  ClassUpdateConfigOF       : TBodyOfConfigUpdateClass;
  FConfigWebhook            : TWebhookSecurity;
  BodyRequest               : ISuperObject;
begin
     ClassUpdateConfigOF :=  TBodyOfConfigUpdateClass.Create;
     ClassUpdateConfigOF.RedirectURL := txtRedirectUrl.Text;
     ClassUpdateConfigOF.WebhookURL := txtWebhook.Text;
     if optHash.Checked then
     begin
         FConfigWebhook.typeSecurity:= 'hmac';
         FConfigWebhook.hash := txtHash.Text;
     end;

     ClassUpdateConfigOF.Security := FConfigWebhook;
     BodyRequest := SO(ClassUpdateConfigOF.AsJSON(false,false));
     if (not optHash.Checked)  then
        BodyRequest.Remove('webhookSecurity');

     Result:= BodyRequest.AsJSON;



end;

procedure TOfConfigUpdate.optHashClick(Sender: TObject);
begin
  labelHash.Visible := optHash.Checked;
  txtHash.Visible := optHash.Checked;
end;

end.
