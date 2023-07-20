unit ViewAccountDeleteWebhook;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TAccountDeleteWebhook = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    txtId: TEdit;
    btnCancelar: TButton;
    btnDelete: TButton;
    procedure btnDeleteClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AccountDeleteWebhook: TAccountDeleteWebhook;

implementation

{$R *.dfm}

procedure TAccountDeleteWebhook.btnCancelarClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TAccountDeleteWebhook.btnDeleteClick(Sender: TObject);
begin
   if txtId.Text = EmptyStr then
  begin
    MessageDlg('O campo Identificador não pode ser vazio', TMsgDlgType.mtInformation, [TMsgDlgBtn.mbOK], 0);
    if txtId.CanFocus then
       txtId.SetFocus;
  end
  else
  ModalResult := mrOk;
end;

procedure TAccountDeleteWebhook.FormCreate(Sender: TObject);
begin
  Self.Position := poScreenCenter;
end;

end.
