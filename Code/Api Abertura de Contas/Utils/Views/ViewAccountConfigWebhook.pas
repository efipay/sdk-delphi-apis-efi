unit ViewAccountConfigWebhook;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, BodyWebhook, xSuperObject, xSuperJSON;

type
  TAccountConfigWebhook = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    txtUrl: TEdit;
    btnCancelar: TButton;
    btnCadastro: TButton;
    Label2: TLabel;
    txtChave: TEdit;
    procedure btnCadastroClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    function GetBody : String;
  public
    { Public declarations }
    property Body: String read GetBody;
  end;

var
  AccountConfigWebhook: TAccountConfigWebhook;

implementation

{$R *.dfm}

{ TAccountConfigWebhook }

procedure TAccountConfigWebhook.btnCadastroClick(Sender: TObject);
begin
 if txtUrl.Text = EmptyStr then
  begin
    MessageDlg('O campo Url não pode ser vazio', TMsgDlgType.mtInformation, [TMsgDlgBtn.mbOK], 0);
    if txtUrl.CanFocus then
       txtUrl.SetFocus;
  end
  else
  ModalResult := mrOk;
end;

procedure TAccountConfigWebhook.btnCancelarClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TAccountConfigWebhook.FormCreate(Sender: TObject);
begin
  Self.Position := poScreenCenter;
end;

function TAccountConfigWebhook.GetBody: String;
var
  ClassCreateAccount      : TBodyWebhookClass;
  BodyRequest : ISuperObject;
begin
     ClassCreateAccount :=  TBodyWebhookClass.Create;
     ClassCreateAccount.Url := txtUrl.Text;
     ClassCreateAccount.Chave := txtChave.Text;

     BodyRequest := SO(ClassCreateAccount.AsJSON(false,false) );
     if txtChave.Text = EmptyStr then
         BodyRequest.Remove('chave');

     Result :=  BodyRequest.AsJSON;
end;

end.
