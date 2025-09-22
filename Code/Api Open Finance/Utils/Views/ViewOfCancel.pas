unit ViewOfCancel;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, System.UITypes;

type
  TViewOfCancel = class(TForm)
    GroupBox3: TGroupBox;
    txtIDPagamento: TEdit;
    Label1: TLabel;
    btnConfirmRequest: TButton;
    btnCancelRequest: TButton;
    procedure btnConfirmRequestClick(Sender: TObject);
    procedure btnCancelRequestClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    function GetIDPagamento: String;
  public
    property IDPagamento: String read GetIDPagamento;
    procedure ClearRequestfields;
  end;

implementation

{$R *.dfm}

procedure TViewOfCancel.FormCreate(Sender: TObject);
begin
  Self.Position := poScreenCenter;
end;

function TViewOfCancel.GetIDPagamento: String;
begin
  Result := txtIDPagamento.Text;
end;

procedure TViewOfCancel.btnCancelRequestClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TViewOfCancel.btnConfirmRequestClick(Sender: TObject);
begin
  if txtIDPagamento.Text = EmptyStr then
  begin
    MessageDlg('Identificador de Pagamento é obrigatório!', TMsgDlgType.mtInformation, [TMsgDlgBtn.mbOK], 0);
    txtIDPagamento.SetFocus;
    Exit;
  end;

  ModalResult := mrOk;
end;

procedure TViewOfCancel.ClearRequestfields;
begin
  txtIDPagamento.Text := '';
end;

end.
