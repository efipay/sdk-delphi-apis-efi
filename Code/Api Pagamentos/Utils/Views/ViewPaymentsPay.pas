unit ViewPaymentsPay;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, XSuperObject,System.UITypes, BodyChargesPaymentsClass;

type
  TViewPaymentBarcode = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    txtBarcode: TEdit;
    Label2: TLabel;
    txtDatePayment: TEdit;
    Label3: TLabel;
    txtValue: TEdit;
    Label4: TLabel;
    txtDescription: TEdit;
    btnPagar: TButton;
    btnCancelar: TButton;
    procedure btnPagarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
  private
    { Private declarations }
    function GetBody: String;
  public
    { Public declarations }
    property Body: string read GetBody;
    procedure ClearRequestfields;
  end;



implementation

{$R *.dfm}

procedure TViewPaymentBarcode.btnCancelarClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TViewPaymentBarcode.btnPagarClick(Sender: TObject);
begin
  if txtBarcode.Text = EmptyStr then
  begin
    MessageDlg('O código de barras não pode ser vazio', TMsgDlgType.mtInformation, [TMsgDlgBtn.mbOK], 0);
    if txtBarcode.CanFocus then
       txtBarcode.SetFocus;
  end

  else if txtDatePayment.Text = EmptyStr then
  begin
    MessageDlg('A data de pagamento não pode ser vazia', TMsgDlgType.mtInformation, [TMsgDlgBtn.mbOK], 0);
    if txtDatePayment.CanFocus then
       txtDatePayment.SetFocus;
  end

  else if txtValue.Text = EmptyStr then
  begin
    MessageDlg('Valornão pode ser vazio', TMsgDlgType.mtInformation, [TMsgDlgBtn.mbOK], 0);
    if txtValue.CanFocus then
       txtValue.SetFocus;
  end
  else
    ModalResult := mrOk;
end;

procedure TViewPaymentBarcode.ClearRequestfields;
begin
     txtBarcode.Text := '';
     txtDatePayment.Text := '';
     txtValue.Text := '';
     txtDescription.Text := '';
end;

procedure TViewPaymentBarcode.FormCreate(Sender: TObject);
begin
  Self.Position := poScreenCenter;
end;


function TViewPaymentBarcode.GetBody: String;
var
  ClassPaymentBarcode : TBodyCharcesPaymentsClass;
  BodyRequest        : ISuperObject;
begin
 ClassPaymentBarcode := TBodyCharcesPaymentsClass.Create;
 ClassPaymentBarcode.Value := StrToInt(txtValue.Text);
 ClassPaymentBarcode.Description := txtDescription.Text;
 ClassPaymentBarcode.DatePayment :=  txtDatePayment.Text;

 BodyRequest := SO(ClassPaymentBarcode.AsJSON(False, False));
 if (ClassPaymentBarcode.Description = EmptyStr) then
  BodyRequest.Remove('descricao');
  ShowMessage('Data pagamento: '#13#10#13#10 + ClassPaymentBarcode.DatePayment);

  Result := BodyRequest.AsJSON;

end;

end.
