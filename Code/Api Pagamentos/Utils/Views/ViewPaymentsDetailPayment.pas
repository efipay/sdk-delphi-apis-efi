unit ViewPaymentsDetailPayment;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TViewDetailPayment = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    txtIdPayment: TEdit;
    btnConsultar: TButton;
    btnCancelar: TButton;
    procedure btnConsultarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
     procedure ClearRequestfields;
  end;

var
  ViewDetailPayment: TViewDetailPayment;

implementation

{$R *.dfm}

procedure TViewDetailPayment.btnCancelarClick(Sender: TObject);
begin
    ModalResult := mrCancel;
end;

procedure TViewDetailPayment.btnConsultarClick(Sender: TObject);
begin
  if txtIdPayment.Text = EmptyStr then
  begin
    MessageDlg('O identificador não pode ser vazio', TMsgDlgType.mtInformation, [TMsgDlgBtn.mbOK], 0);
    if txtIdPayment.CanFocus then
       txtIdPayment.SetFocus;
  end
  else
  ModalResult := mrOk;
end;

procedure TViewDetailPayment.ClearRequestfields;
begin
    txtIdPayment.Text := '';
end;

procedure TViewDetailPayment.FormCreate(Sender: TObject);
begin
  Self.Position := poScreenCenter;
end;

end.
