unit ViewPaymentsList;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TviewListPayments = class(TForm)
    GroupBox1: TGroupBox;
    txtDetailInitDate: TEdit;
    Label2: TLabel;
    Label1: TLabel;
    txtDetailEndDate: TEdit;
    btnListar: TButton;
    btnCancelar: TButton;
    procedure btnListarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure ClearRequestfields;
  end;

var
  viewListPayments: TviewListPayments;

implementation

{$R *.dfm}

procedure TviewListPayments.btnCancelarClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TviewListPayments.btnListarClick(Sender: TObject);
begin
  if txtDetailInitDate.Text = EmptyStr then
  begin
    MessageDlg('A data de início  não pode ser vazia', TMsgDlgType.mtInformation, [TMsgDlgBtn.mbOK], 0);
    if txtDetailInitDate.CanFocus then
       txtDetailInitDate.SetFocus;
  end
  else if txtDetailEndDate.Text = EmptyStr then
  begin
    MessageDlg('A data de fim  não pode ser vazia', TMsgDlgType.mtInformation, [TMsgDlgBtn.mbOK], 0);
    if txtDetailEndDate.CanFocus then
       txtDetailEndDate.SetFocus;
  end
  else
    ModalResult := mrOk;
end;

procedure TviewListPayments.ClearRequestfields;
begin
      txtDetailInitDate.Text := '' ;
      txtDetailEndDate.Text := '';
end;

procedure TviewListPayments.FormCreate(Sender: TObject);
begin
     Self.Position := poScreenCenter;
end;

end.
