unit ViewPixDetailDueCharge;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TDetailDueCharge = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    txtTXID: TEdit;
    Label2: TLabel;
    txtRevisao: TEdit;
    btnDetail: TButton;
    btnCancelar: TButton;
    procedure btnDetailClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
  private
    { Private declarations }
    function getFilters: String;
  public
    { Public declarations }
    property Filters : String read getFilters;
    procedure ClearRequestfields;
  end;

var
  DetailDueCharge: TDetailDueCharge;

implementation

{$R *.dfm}

{ TDetailDueCharge }

procedure TDetailDueCharge.btnCancelarClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TDetailDueCharge.btnDetailClick(Sender: TObject);
begin
  if txtTXID.Text = EmptyStr then
  begin
    MessageDlg('O txid  não pode ser vazio', TMsgDlgType.mtInformation, [TMsgDlgBtn.mbOK], 0);
    if txtTXID.CanFocus then
       txtTXID.SetFocus;
  end
  else
    ModalResult := mrOk;
end;

procedure TDetailDueCharge.ClearRequestfields;
begin
    txtTXID.Text := '';
    txtRevisao.Text := '';
end;

procedure TDetailDueCharge.FormCreate(Sender: TObject);
begin
  Self.Position := poScreenCenter;
end;

function TDetailDueCharge.getFilters: String;
begin
  if (txtRevisao.Text = EmptyStr) then
     Result := txtTXID.Text
  else
    Result := txtTXID.Text + '?revisao=' + txtRevisao.Text;
end;

end.
