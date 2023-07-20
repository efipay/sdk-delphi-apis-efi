unit ViewPixDetailReport;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TPixDetailReport = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Button1: TButton;
    txtDownload: TButton;
    txtId: TEdit;
    procedure txtDownloadClick(Sender: TObject);
     procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
     procedure ClearRequestfields;
  end;

var
  PixDetailReport: TPixDetailReport;

implementation

{$R *.dfm}

procedure TPixDetailReport.ClearRequestfields;
begin
    txtId.Text := '';
end;

procedure TPixDetailReport.FormCreate(Sender: TObject);
begin
  Self.Position := poScreenCenter;
end;

procedure TPixDetailReport.txtDownloadClick(Sender: TObject);
begin
  if txtId.Text = EmptyStr then
  begin
    MessageDlg('O identificador não pode ser vazio', TMsgDlgType.mtInformation, [TMsgDlgBtn.mbOK], 0);
    if txtId.CanFocus then
       txtId.SetFocus;
  end
  else
    ModalResult := mrOk;
end;

end.
