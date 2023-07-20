unit ViewPixCreateReport;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, BodyReportClass, xSuperObject, xSuperJSON;

type
  TPixCreateReport = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    txtData: TEdit;
    pixRecebidos: TCheckBox;
    Label2: TLabel;
    pixEnviadoChave: TCheckBox;
    pixEnviadoDados: TCheckBox;
    estornoPixEnviado: TCheckBox;
    pixDevolucaoEnviada: TCheckBox;
    pixDevolucaoRecebida: TCheckBox;
    tarifaPixEnviado: TCheckBox;
    tarifaPixRecebido: TCheckBox;
    estornoTarifaPixEnviado: TCheckBox;
    saldoDiaAnterior: TCheckBox;
    saldoDia: TCheckBox;
    transferenciaEnviada: TCheckBox;
    transferenciaRecebida: TCheckBox;
    estornoTransferenciaEnviada: TCheckBox;
    tarifaTransferenciaEnviada: TCheckBox;
    estornoTarifaPixaRecebido: TCheckBox;
    estornoTarifaTransferenciaEnviada: TCheckBox;
    btnCancelar: TButton;
    btnRequest: TButton;
    procedure btnRequestClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    function GetBody : String;
    function filterEmptyValues(obj: ISuperObject; classFilters:TBodyReportClass):String;

  public
    { Public declarations }
    property Body: String read GetBody;
    procedure ClearRequestfields;
  end;

var
  PixCreateReport: TPixCreateReport;

implementation

{$R *.dfm}

{ TPixCreateReport }

procedure TPixCreateReport.btnCancelarClick(Sender: TObject);
begin
     ModalResult := mrCancel;
end;

procedure TPixCreateReport.btnRequestClick(Sender: TObject);
begin
  if txtData.Text = EmptyStr then
  begin
    MessageDlg('A data  não pode ser vazia', TMsgDlgType.mtInformation, [TMsgDlgBtn.mbOK], 0);
    if txtData.CanFocus then
       txtData.SetFocus;
  end
  else
    ModalResult := mrOk;
end;

procedure TPixCreateReport.ClearRequestfields;
begin
    txtData.Text := '';
end;

function TPixCreateReport.filterEmptyValues(obj: ISuperObject; classFilters:TBodyReportClass ): String;
var
  FiltersReport : ISuperObject;
begin
    FiltersReport := obj.O['tipoRegistros'];

    if not  classFilters.Filters.pixRecebido then
        FiltersReport.Remove('pixRecebido');

    if not  classFilters.Filters.pixEnviadoChave then
        FiltersReport.Remove('pixEnviadoChave');

    if not  classFilters.Filters.pixEnviadoDadosBancarios then
        FiltersReport.Remove('pixEnviadoDadosBancarios');

    if not  classFilters.Filters.estornoPixEnviado then
        FiltersReport.Remove('estornoPixEnviado');

    if not  classFilters.Filters.pixDevolucaoEnviada then
        FiltersReport.Remove('pixDevolucaoEnviada');

    if not  classFilters.Filters.pixDevolucaoRecebida then
        FiltersReport.Remove('pixDevolucaoRecebida');

    if not  classFilters.Filters.tarifaPixEnviado then
        FiltersReport.Remove('tarifaPixEnviado');

    if not  classFilters.Filters.tarifaPixRecebido then
        FiltersReport.Remove('tarifaPixRecebido');

    if not  classFilters.Filters.estornoTarifaPixEnviado then
        FiltersReport.Remove('estornoTarifaPixEnviado');

    if not  classFilters.Filters.saldoDiaAnterior then
        FiltersReport.Remove('saldoDiaAnterior');

    if not  classFilters.Filters.saldoDia then
        FiltersReport.Remove('saldoDia');

    if not  classFilters.Filters.transferenciaEnviada then
        FiltersReport.Remove('transferenciaEnviada');

    if not  classFilters.Filters.transferenciaRecebida then
        FiltersReport.Remove('transferenciaRecebida');

    if not  classFilters.Filters.estornoTransferenciaEnviada then
        FiltersReport.Remove('estornoTransferenciaEnviada');

    if not  classFilters.Filters.tarifaTransferenciaEnviada then
        FiltersReport.Remove('tarifaTransferenciaEnviada');

    if not  classFilters.Filters.estornoTarifaTransferenciaEnviada then
        FiltersReport.Remove('estornoTarifaTransferenciaEnviada');

    if not  classFilters.Filters.estornoTarifaPixRecebido then
        FiltersReport.Remove('estornoTarifaPixRecebido');

    obj.SetData('tipoRegistros', FiltersReport) ;


    Result := obj.asJson;
end;

procedure TPixCreateReport.FormCreate(Sender: TObject);
begin
   Self.Position := poScreenCenter;
end;

function TPixCreateReport.GetBody: String;
var
  ClassCreateReport : TBodyReportClass;
  FFiltersReport    : TFiltersReport;
  BodyRequest       : ISuperObject;
begin
      ClassCreateReport :=     TBodyReportClass.Create;
      ClassCreateReport.DateReport := txtData.Text;

      FFiltersReport.pixRecebido                       :=  pixRecebidos.Checked;
      FFiltersReport.pixEnviadoChave                   :=  pixEnviadoChave.Checked;
      FFiltersReport.pixEnviadoDadosBancarios          :=  pixEnviadoDados.Checked;
      FFiltersReport.estornoPixEnviado                 :=  estornoPixEnviado.Checked;
      FFiltersReport.pixDevolucaoEnviada               :=  pixDevolucaoEnviada.Checked;
      FFiltersReport.pixDevolucaoRecebida              :=  pixDevolucaoRecebida.Checked;
      FFiltersReport.tarifaPixEnviado                  :=  tarifaPixEnviado.Checked;
      FFiltersReport.tarifaPixRecebido                 :=  tarifaPixRecebido.Checked;
      FFiltersReport.estornoTarifaPixEnviado           :=  estornoTarifaPixEnviado.Checked;
      FFiltersReport.saldoDiaAnterior                  :=  saldoDiaAnterior.Checked;
      FFiltersReport.saldoDia                          :=  saldoDia.Checked;
      FFiltersReport.transferenciaEnviada              :=  transferenciaEnviada.Checked;
      FFiltersReport.transferenciaRecebida             :=  transferenciaRecebida.Checked;
      FFiltersReport.estornoTransferenciaEnviada       :=  estornoTransferenciaEnviada.Checked;
      FFiltersReport.tarifaTransferenciaEnviada        :=  tarifaTransferenciaEnviada.Checked;
      FFiltersReport.estornoTarifaTransferenciaEnviada :=  estornoTarifaTransferenciaEnviada.Checked;
      FFiltersReport.estornoTarifaPixRecebido          :=  estornoTarifaPixaRecebido.Checked;

      ClassCreateReport.Filters := FFiltersReport;

      BodyRequest := SO(ClassCreateReport.asJson(false, false));



      Result :=  filterEmptyValues(BodyRequest, ClassCreateReport);
end;

end.
