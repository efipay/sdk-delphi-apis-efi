unit ViewPixSplitLinkCharges;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TPixSplitLinkCharges = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    txtTxid: TEdit;
    Label2: TLabel;
    txtId: TEdit;
    Button1: TButton;
    btnCadastrarSplit: TButton;
    optTipoCobranca: TCheckBox;
    procedure btnCadastrarSplitClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    function getTipoCob: String;
  public
    { Public declarations }
    property TipoCob : String read getTipoCob;
    procedure ClearRequestfields;
  end;

var
  PixSplitLinkCharges: TPixSplitLinkCharges;

implementation

{$R *.dfm}

procedure TPixSplitLinkCharges.btnCadastrarSplitClick(Sender: TObject);
begin
 if txtTxid.Text = EmptyStr then
  begin
    MessageDlg('O campo txid  não pode ser vazio', TMsgDlgType.mtInformation, [TMsgDlgBtn.mbOK], 0);
    if txtTxid.CanFocus then
       txtTxid.SetFocus;
  end
  else if txtId.Text = EmptyStr then
  begin
    MessageDlg('O campo id  não pode ser vazio', TMsgDlgType.mtInformation, [TMsgDlgBtn.mbOK], 0);
    if txtId.CanFocus then
       txtId.SetFocus;
  end
  else
  ModalResult := mrOk;
end;

procedure TPixSplitLinkCharges.ClearRequestfields;
begin
  txtTxid.Text := '';
  txtId.Text := '';
end;

procedure TPixSplitLinkCharges.FormCreate(Sender: TObject);
begin
   Self.Position := poScreenCenter;
end;

function TPixSplitLinkCharges.getTipoCob: String;
begin
    if optTipoCobranca.Checked then
      Result := 'cobv'
    else
    begin
       Result := 'cob';
    end;
end;

end.
