unit MainCode;

interface

uses
  Winapi.Windows, Winapi.Messages, System.Variants, System.Classes, System.SysUtils,
  Vcl.StdCtrls, Vcl.Controls, Vcl.ExtCtrls, Vcl.Forms, XSuperObject, Vcl.Dialogs,
  MainPix, MainEmissions,MainPayments,MainOpenFinance,MainAberturaContas, Vcl.Graphics, Vcl.Imaging.pngimage;

type
  TMainCode = class(TForm)
    mainFrmApiBoletos: TPanel;
    mainFrmApiPix: TPanel;
    Image1: TImage;
    Image2: TImage;
    mainFormApiPagamentos: TPanel;
    mainFrmApiOpenFinance: TPanel;
    imgPayments: TImage;
    imgOf: TImage;
    Panel1: TPanel;
    imgAC: TImage;
    procedure mainFrmApiBoletosClick(Sender: TObject);
    procedure mainFrmApiPixClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure mainFormApiPagamentosClick(Sender: TObject);
    procedure mainFrmApiOpenFinanceClick(Sender: TObject);
    procedure imgPaymentsClick(Sender: TObject);
    procedure imgOfClick(Sender: TObject);
    procedure Panel1Click(Sender: TObject);
    procedure imgACClick(Sender: TObject);
  private

  public

  end;

  var
    frmCode : TMainCode;

implementation

{$R *.dfm}

procedure TMainCode.FormCreate(Sender: TObject);
begin
  frmCode.Position := poScreenCenter;
end;

procedure TMainCode.imgACClick(Sender: TObject);
begin
    Application.CreateForm(TfrmAberturaDeContas,frmAberturaDeContas );
    frmAberturaDeContas.Visible := False;
    frmAberturaDeContas.ShowModal;
end;

procedure TMainCode.imgOfClick(Sender: TObject);
begin
    Application.CreateForm(TfrmOpenFinance, frmOpenFinance);
    frmOpenFinance.Visible := False;
    frmOpenFinance.ShowModal;
end;

procedure TMainCode.imgPaymentsClick(Sender: TObject);
begin
  Application.CreateForm(TMainPayment, fmrPayments);
  fmrPayments.Visible := False;
  fmrPayments.ShowModal;
end;

procedure TMainCode.mainFormApiPagamentosClick(Sender: TObject);
begin
  Application.CreateForm(TMainPayment, fmrPayments);
  fmrPayments.Visible := False;
  fmrPayments.ShowModal;
end;

procedure TMainCode.mainFrmApiBoletosClick(Sender: TObject);
begin
  Application.CreateForm(TMainEmissions, frmBoletos);
  frmBoletos.Visible := False;
  frmBoletos.ShowModal;
end;

procedure TMainCode.mainFrmApiOpenFinanceClick(Sender: TObject);
begin
  Application.CreateForm(TfrmOpenFinance, frmOpenFinance);
  frmOpenFinance.Visible := False;
  frmOpenFinance.ShowModal;
end;

procedure TMainCode.mainFrmApiPixClick(Sender: TObject);
begin
  Application.CreateForm(TMainPix, frmPix);
  frmPix.Visible := False;
  frmPix.ShowModal;
end;

procedure TMainCode.Panel1Click(Sender: TObject);
begin
      Application.CreateForm(TfrmAberturaDeContas,frmAberturaDeContas );
    frmAberturaDeContas.Visible := False;
    frmAberturaDeContas.ShowModal;
end;

end.
