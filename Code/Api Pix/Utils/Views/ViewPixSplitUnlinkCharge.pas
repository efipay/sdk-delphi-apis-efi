unit ViewPixSplitUnlinkCharge;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TPixSplitUnlinkCharge = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    txtTxid: TEdit;
    optTipoCobranca: TCheckBox;
    btnCancelar: TButton;
    btnUnlinkChargeSplit: TButton;
    procedure btnUnlinkChargeSplitClick(Sender: TObject);
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
  PixSplitUnlinkCharge: TPixSplitUnlinkCharge;

implementation

{$R *.dfm}

{ TPixSplitUnlinkCharge }

procedure TPixSplitUnlinkCharge.btnCancelarClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TPixSplitUnlinkCharge.btnUnlinkChargeSplitClick(Sender: TObject);
begin
  if txtTxid.Text = EmptyStr then
  begin
    MessageDlg('O campo id não pode ser vazio', TMsgDlgType.mtInformation, [TMsgDlgBtn.mbOK], 0);
    if txtTxid.CanFocus then
       txtTxid.SetFocus;
  end
  else
  ModalResult := mrOk;
end;

procedure TPixSplitUnlinkCharge.ClearRequestfields;
begin
  txtTxid.Text:= '';
end;

procedure TPixSplitUnlinkCharge.FormCreate(Sender: TObject);
begin
  Self.Position := poScreenCenter;
end;

function TPixSplitUnlinkCharge.getTipoCob: String;
begin
    begin
     if optTipoCobranca.Checked then
      Result := 'cobv'
    else
    begin
       Result := 'cob';
    end;
end;
end;

end.
