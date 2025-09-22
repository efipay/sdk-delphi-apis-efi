unit ViewPixRetryAutomaticCharge;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, System.UITypes;

type
  TViewPixRetryAutomaticCharge = class(TForm)
    GroupBox3: TGroupBox;
    Label1: TLabel;
    txtTXID: TEdit;
    btnCancelRequest: TButton;
    btnConfirmRequest: TButton;
    Label2: TLabel;
    txtData: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure btnConfirmRequestClick(Sender: TObject);
    procedure btnCancelRequestClick(Sender: TObject);
  private
    function GetIdent: String;
    function GetDate: String;
  public
    property Identifier: String read GetIdent;
    property Date: String read GetDate;
    procedure ClearRequestfields;
  end;

implementation

{$R *.dfm}

procedure TViewPixRetryAutomaticCharge.btnCancelRequestClick(Sender: TObject);
begin
  ModalResult := mrCancel
end;

procedure TViewPixRetryAutomaticCharge.btnConfirmRequestClick(Sender: TObject);
begin

  if txtTXID.Text = EmptyStr then
  begin
    MessageDlg('O txid não pode ser vazio!', TMsgDlgType.mtInformation, [TMsgDlgBtn.mbOK], 0);
    txtTXID.SetFocus;
    Exit;
  end
  else if txtData.Text = EmptyStr then
  begin
    MessageDlg('A data é obrigatória!', TMsgDlgType.mtInformation, [TMsgDlgBtn.mbOK], 0);
    txtData.SetFocus;
    Exit;
  end;

  ModalResult := mrOk;
end;

procedure TViewPixRetryAutomaticCharge.ClearRequestfields;
begin
  txtTXID.Text := '';
  txtData.Text := '';
end;

procedure TViewPixRetryAutomaticCharge.FormCreate(Sender: TObject);
begin
  Self.Position := poScreenCenter;
end;

function TViewPixRetryAutomaticCharge.GetIdent: String;
begin
  Result := txtTXID.Text;
end;

function TViewPixRetryAutomaticCharge.GetDate: String;
begin
  Result := txtData.Text;
end;

end.
