unit ViewOfDevolutionPix;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, xSuperObject, xSuperJSON, BodyOfDevolutionPix;

type
  TOfDevolutionPix = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    txtId: TEdit;
    Label2: TLabel;
    txtValor: TEdit;
    btnCancelar: TButton;
    btnDevolution: TButton;
    procedure btnDevolutionClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    function GetBody : String;
  public
    { Public declarations }
    property Body: String read GetBody;
    procedure ClearRequestfields;
  end;

var
  OfDevolutionPix: TOfDevolutionPix;

implementation

{$R *.dfm}

procedure TOfDevolutionPix.btnCancelarClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TOfDevolutionPix.btnDevolutionClick(Sender: TObject);
begin
  if txtId.Text = EmptyStr then
  begin
    MessageDlg('O campo identificador não pode ser vazio', TMsgDlgType.mtInformation, [TMsgDlgBtn.mbOK], 0);
    if txtId.CanFocus then
       txtId.SetFocus;
  end
  else if txtValor.Text = EmptyStr then
  begin
    MessageDlg('O campo valor não pode ser vazio', TMsgDlgType.mtInformation, [TMsgDlgBtn.mbOK], 0);
    if txtValor.CanFocus then
       txtValor.SetFocus;
  end
  else
    ModalResult := mrOk;

end;

procedure TOfDevolutionPix.ClearRequestfields;
begin
  txtId.Text := '';
  txtValor.Text := '';
end;

procedure TOfDevolutionPix.FormCreate(Sender: TObject);
begin
    Self.Position := poScreenCenter;
end;

function TOfDevolutionPix.GetBody: String;
var
    ClassOfDevolutionPix  : TBodyOfDevolutionPixClass;
    BodyRequest : ISuperObject;
begin
       ClassOfDevolutionPix := TBodyOfDevolutionPixClass.Create;
       ClassOfDevolutionPix.Valor := txtValor.Text;
       BodyRequest := SO(ClassOfDevolutionPix.AsJSON(false,false));

       Result:= BodyRequest.AsJSON;
end;

end.
