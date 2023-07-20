unit ViewPixSplitDetailConfig;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TPixSplitDetailConfig = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    txtId: TEdit;
    btnCancelar: TButton;
    btnGetConfig: TButton;
    procedure btnGetConfigClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure ClearRequestfields;
  end;

var
  PixSplitDetailConfig: TPixSplitDetailConfig;

implementation

{$R *.dfm}

procedure TPixSplitDetailConfig.btnCancelarClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TPixSplitDetailConfig.btnGetConfigClick(Sender: TObject);
begin
  if txtId.Text = EmptyStr then
  begin
    MessageDlg('O campo id não pode ser vazio', TMsgDlgType.mtInformation, [TMsgDlgBtn.mbOK], 0);
    if txtId.CanFocus then
       txtId.SetFocus;
  end
  else
  ModalResult := mrOk;
end;

procedure TPixSplitDetailConfig.ClearRequestfields;
begin
  txtId.Text:='';
end;

procedure TPixSplitDetailConfig.FormCreate(Sender: TObject);
begin
  Self.Position := poScreenCenter;
end;

end.
