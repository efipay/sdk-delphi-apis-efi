unit ViewPaymentsDetailBarcode;

interface

uses
   Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, xSuperObject, xSuperJSON,
  System.RTTI, System.UITypes;
type
  TViewDetailBarcode = class(TForm)
    GroupBox1: TGroupBox;
    txtBarcode: TEdit;
    Label1: TLabel;
    btnConsultar: TButton;
    btnCancelar: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btnConsultarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);

    { Private declarations }
  public
    procedure ClearRequestfields;

  end;


implementation

{$R *.dfm}

procedure TViewDetailBarcode.btnCancelarClick(Sender: TObject);
begin
    ModalResult := mrCancel;
end;

procedure TViewDetailBarcode.btnConsultarClick(Sender: TObject);
begin
  if txtBarcode.Text = EmptyStr then
  begin
    MessageDlg('O código de barras não pode ser vazio', TMsgDlgType.mtInformation, [TMsgDlgBtn.mbOK], 0);
    if txtBarcode.CanFocus then
       txtBarcode.SetFocus;
  end
  else
    ModalResult := mrOk;
end;



procedure TViewDetailBarcode.ClearRequestfields;
begin
      txtBarcode.Text := '';
end;

procedure TViewDetailBarcode.FormCreate(Sender: TObject);
begin
  Self.Position := poScreenCenter;
end;

end.
