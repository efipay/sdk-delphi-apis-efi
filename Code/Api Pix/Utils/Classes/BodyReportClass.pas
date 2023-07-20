unit BodyReportClass;

interface
uses xSuperObject, xSuperJSON, System.Generics.Collections, System.SysUtils;
Type
  TFiltersReport = record
      [Alias('pixRecebido')] pixRecebido: Boolean;
      [Alias('pixEnviadoChave')] pixEnviadoChave: Boolean;
      [Alias('pixEnviadoDadosBancarios')] pixEnviadoDadosBancarios: Boolean;
      [Alias('estornoPixEnviado')] estornoPixEnviado: Boolean;
      [Alias('pixDevolucaoEnviada')] pixDevolucaoEnviada: Boolean;
      [Alias('pixDevolucaoRecebida')] pixDevolucaoRecebida: Boolean;
      [Alias('tarifaPixEnviado')] tarifaPixEnviado: Boolean;
      [Alias('tarifaPixRecebido')] tarifaPixRecebido: Boolean;
      [Alias('estornoTarifaPixEnviado')] estornoTarifaPixEnviado: Boolean;
      [Alias('saldoDiaAnterior')] saldoDiaAnterior: Boolean;
      [Alias('saldoDia')] saldoDia: Boolean;
      [Alias('transferenciaEnviada')] transferenciaEnviada: Boolean;
      [Alias('transferenciaRecebida')] transferenciaRecebida: Boolean;
      [Alias('estornoTransferenciaEnviada')] estornoTransferenciaEnviada: Boolean;
      [Alias('tarifaTransferenciaEnviada')] tarifaTransferenciaEnviada: Boolean;
      [Alias('estornoTarifaTransferenciaEnviada')] estornoTarifaTransferenciaEnviada: Boolean;
      [Alias('estornoTarifaPixRecebido')] estornoTarifaPixRecebido: Boolean;
  end;

  TBodyReportClass = class
    private
    FFiltersReport : TFiltersReport;
    FDate          : String;

    procedure SetFiltersReport (const Value: TFiltersReport);
    procedure SetDateReport(const Value: String);

    public
    [Alias('tipoRegistros')]
    property Filters: TFiltersReport read FFiltersReport write SetFiltersReport;
     [Alias('dataMovimento')]
    property DateReport: String read FDate write SetDateReport;

    constructor Create;
  end;

implementation

{ TBodyReportClass }

constructor TBodyReportClass.Create;
begin
    inherited;
end;

procedure TBodyReportClass.SetDateReport(const Value: String);
begin
        FDate := Value;
end;

procedure TBodyReportClass.SetFiltersReport(const Value: TFiltersReport);
begin
        FFiltersReport := Value;
end;

end.
