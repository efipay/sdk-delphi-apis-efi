unit ViewOfList;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, System.UITypes;

type
  TViewOfList = class(TForm)
    GroupBox3: TGroupBox;
    txtStartDate: TEdit;
    txtEndDate: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    btnConfirmRequest: TButton;
    btnCancelRequest: TButton;
    procedure btnConfirmRequestClick(Sender: TObject);
    procedure btnCancelRequestClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    function GetStartDate: String;
    function GetEndDate: String;
  public
    property StartDate: String read GetStartDate;
    property EndDate:    String read GetEndDate;
    procedure ClearRequestfields;
  end;

implementation

{$R *.dfm}

procedure TViewOfList.FormCreate(Sender: TObject);
begin
  Self.Position := poScreenCenter;
end;

function TViewOfList.GetStartDate: String;
begin
  Result := txtStartDate.Text;
end;

function TViewOfList.GetEndDate: String;
begin
  Result := txtEndDate.Text;
end;

procedure TViewOfList.btnCancelRequestClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TViewOfList.btnConfirmRequestClick(Sender: TObject);
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

  ModalResult := mrOk;
end;

procedure TViewOfList.ClearRequestfields;
begin
  txtStartDate.Text := '';
  txtEndDate.Text   := '';
end;

end.
