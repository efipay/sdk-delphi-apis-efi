unit ViewPixIdRecDetail;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, System.UITypes;

type
  TViewPixIdRecDetail = class(TForm)
    GroupBox3: TGroupBox;
    Label1: TLabel;
    txtIdent: TEdit;
    btnCancelRequest: TButton;
    btnConfirmRequest: TButton;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    txtTXID: TEdit;
    boolJornada: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure btnConfirmRequestClick(Sender: TObject);
    procedure btnCancelRequestClick(Sender: TObject);
  private
    function GetIdent: String;
    function GetQueryParam: String;
  public
    property Identifier: String read GetIdent;
    property QueryParam: String read GetQueryParam;
    procedure ClearRequestfields;
  end;

implementation

{$R *.dfm}

procedure TViewPixIdRecDetail.btnCancelRequestClick(Sender: TObject);
begin
  ModalResult := mrCancel
end;

procedure TViewPixIdRecDetail.btnConfirmRequestClick(Sender: TObject);
begin
  if txtIdent.Text = EmptyStr then
  begin
    MessageDlg('O idRec não pode ser vazia!', TMsgDlgType.mtInformation, [TMsgDlgBtn.mbOK], 0);
    txtIdent.SetFocus;
    Exit;
  end;
  if (boolJornada.Checked = True) and (txtTXID.Text = EmptyStr) then
  begin
    MessageDlg('TXID é obrigatório para jornada 3 ou 4!', TMsgDlgType.mtInformation, [TMsgDlgBtn.mbOK], 0);
    txtTXID.SetFocus;
    Exit;
  end;

  ModalResult := mrOk;
end;

procedure TViewPixIdRecDetail.ClearRequestfields;
begin
  txtIdent.Text := '';
end;

procedure TViewPixIdRecDetail.FormCreate(Sender: TObject);
begin
  Self.Position := poScreenCenter;
end;

function TViewPixIdRecDetail.GetIdent: String;
begin
  Result := txtIdent.Text;
end;

function TViewPixIdRecDetail.GetQueryParam: String;
begin
  if boolJornada.Checked = True then
    Result := '?txid=' + txtTXID.Text
  else
    Result := '';
end;

end.
