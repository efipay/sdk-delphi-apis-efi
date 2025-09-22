unit ViewOfListAutomaticEnrollment;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, System.UITypes;

type
  TViewOfListAutomaticEnrollment = class(TForm)
    GroupBox3: TGroupBox;
    txtStartDate: TEdit;
    txtEndDate: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    btnConfirmRequest: TButton;
    btnCancelRequest: TButton;
    Label3: TLabel;
    cmbStatus: TComboBox;
    procedure btnConfirmRequestClick(Sender: TObject);
    procedure btnCancelRequestClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    procedure InicializarComboBoxes;
    function GetStartDate: String;
    function GetEndDate: String;
    function GetStatus: String;
  public
    property StartDate: String read GetStartDate;
    property EndDate: String read GetEndDate;
    property Status: String read GetStatus;
    procedure ClearRequestfields;
  end;

implementation

{$R *.dfm}

procedure TViewOfListAutomaticEnrollment.FormCreate(Sender: TObject);
begin
  Self.Position := poScreenCenter;
  InicializarComboBoxes;
end;

function TViewOfListAutomaticEnrollment.GetStartDate: String;
begin
  Result := txtStartDate.Text;
end;

function TViewOfListAutomaticEnrollment.GetEndDate: String;
begin
  Result := txtEndDate.Text;
end;

function TViewOfListAutomaticEnrollment.GetStatus: String;
begin
  Result := cmbStatus.Text;
end;

procedure TViewOfListAutomaticEnrollment.InicializarComboBoxes;
begin
  cmbStatus.Items.Clear;
  cmbStatus.Items.Add('autorizado');
  cmbStatus.Items.Add('pendente');
  cmbStatus.Items.Add('revogado');
  cmbStatus.Items.Add('finalizado');
  cmbStatus.Items.Add('rejeitado');
end;

procedure TViewOfListAutomaticEnrollment.btnCancelRequestClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TViewOfListAutomaticEnrollment.btnConfirmRequestClick(Sender: TObject);
begin
  if txtStartDate.Text = EmptyStr then
  begin
    MessageDlg('A data de início não pode ser vazia!', TMsgDlgType.mtInformation, [TMsgDlgBtn.mbOK], 0);
    txtStartDate.SetFocus;
    Exit;
  end;
  if txtEndDate.Text = EmptyStr then
  begin
    MessageDlg('A data de fim não pode ser vazia!', TMsgDlgType.mtInformation, [TMsgDlgBtn.mbOK], 0);
    txtEndDate.SetFocus;
    Exit;
  end;
  if cmbStatus.ItemIndex = -1 then
  begin
    MessageDlg('Status é obrigatório!', mtInformation, [mbOK], 0);
    cmbStatus.SetFocus;
    Exit;
  end;

  ModalResult := mrOk;
end;

procedure TViewOfListAutomaticEnrollment.ClearRequestfields;
begin
  txtStartDate.Text := '';
  txtEndDate.Text   := '';
  cmbStatus.ItemIndex := -1;
end;

end.
