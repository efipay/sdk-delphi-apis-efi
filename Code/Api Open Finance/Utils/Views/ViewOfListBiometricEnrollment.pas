unit ViewOfListBiometricEnrollment;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  BodyOfBiometricClass, XSuperJSON, XSuperObject, System.JSON, System.UITypes;

type
  TViewOfListBiometricEnrollment = class(TForm)
    GroupBox3: TGroupBox;
    btnConfirmRequest: TButton;
    btnCancelRequest: TButton;
    GroupBox2: TGroupBox;
    txtCPF: TEdit;
    GroupBox4: TGroupBox;
    txtCNPJ: TEdit;
    procedure btnConfirmRequestClick(Sender: TObject);
    procedure btnCancelRequestClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    function GetCPF: String;
    function GetCNPJ: String;
  public
    property CPF: String read GetCPF;
    property CNPJ: String read GetCNPJ;
    procedure ClearRequestfields;
  end;

implementation

{$R *.dfm}

procedure TViewOfListBiometricEnrollment.FormCreate(Sender: TObject);
begin
  Self.Position := poScreenCenter;
end;

function TViewOfListBiometricEnrollment.GetCPF: String;
begin
  Result := txtCPF.Text;
end;

function TViewOfListBiometricEnrollment.GetCNPJ: String;
begin
  if txtCNPJ.Text = '' then
    Result := ''
  else
    Result := '&cnpj=' + txtCNPJ.Text
end;

procedure TViewOfListBiometricEnrollment.btnCancelRequestClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TViewOfListBiometricEnrollment.btnConfirmRequestClick(Sender: TObject);
begin
  if txtCPF.Text = '' then
  begin
    MessageDlg('CPF é obrigatório!', TMsgDlgType.mtInformation, [TMsgDlgBtn.mbOK], 0);
    txtCPF.SetFocus;
    Exit;
  end;

  ModalResult := mrOk;
end;

procedure TViewOfListBiometricEnrollment.ClearRequestfields;
begin
  txtCPF.Text   := '';
  txtCNPJ.Text   := '';
end;

end.
