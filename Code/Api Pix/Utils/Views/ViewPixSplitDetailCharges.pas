unit ViewPixSplitDetailCharges;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TPixSplitDetailCharges = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    txtTxid: TEdit;
    optTipoCobranca: TCheckBox;
    btnCancelar: TButton;
    btnDetailChargeSplit: TButton;
    procedure btnDetailChargeSplitClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
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
  PixSplitDetailCharges: TPixSplitDetailCharges;

implementation

{$R *.dfm}

procedure TPixSplitDetailCharges.btnCancelarClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TPixSplitDetailCharges.btnDetailChargeSplitClick(Sender: TObject);
begin
  if txtTxid.Text = EmptyStr then
  begin
    MessageDlg('O campo Txid  não pode ser vazio', TMsgDlgType.mtInformation, [TMsgDlgBtn.mbOK], 0);
    if txtTxid.CanFocus then
       txtTxid.SetFocus;
  end
  else
  ModalResult := mrOk;
end;

procedure TPixSplitDetailCharges.ClearRequestfields;
begin
    txtTxid.Text :='';
end;

procedure TPixSplitDetailCharges.FormCreate(Sender: TObject);
begin
  Self.Position := poScreenCenter;
end;

function TPixSplitDetailCharges.getTipoCob: String;
begin
     if optTipoCobranca.Checked then
      Result := 'cobv'
    else
    begin
       Result := 'cob';
    end;
end;

end.
