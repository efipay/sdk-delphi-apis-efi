unit ViewPixIdDetail;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, System.UITypes;

type
  TViewPixIdDetail = class(TForm)
    GroupBox3: TGroupBox;
    Label1: TLabel;
    txtIdent: TEdit;
    btnCancelRequest: TButton;
    btnConfirmRequest: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btnConfirmRequestClick(Sender: TObject);
    procedure btnCancelRequestClick(Sender: TObject);
  private
    function GetIdent: String;
  public
    property Identifier: String read GetIdent;
    procedure ClearRequestfields;
  end;

implementation

{$R *.dfm}

procedure TViewPixIdDetail.btnCancelRequestClick(Sender: TObject);
begin
  ModalResult := mrCancel
end;

procedure TViewPixIdDetail.btnConfirmRequestClick(Sender: TObject);
begin

  if txtIdent.Text = EmptyStr then
  begin
    MessageDlg('O identificador n�o pode ser vazia!', TMsgDlgType.mtInformation, [TMsgDlgBtn.mbOK], 0);
    if txtIdent.CanFocus then
      txtIdent.SetFocus;
  end
  else
    ModalResult := mrOk;
end;

procedure TViewPixIdDetail.ClearRequestfields;
begin
  txtIdent.Text := '';
end;

procedure TViewPixIdDetail.FormCreate(Sender: TObject);
begin
  Self.Position := poScreenCenter;
end;

function TViewPixIdDetail.GetIdent: String;
begin
  Result := txtIdent.Text;
end;


end.
