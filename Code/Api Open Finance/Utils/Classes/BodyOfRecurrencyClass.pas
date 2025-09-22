unit BodyOfRecurrencyClass;

interface
uses xSuperObject, xSuperJSON, System.Generics.Collections, System.SysUtils;
Type
   TPagador = record
      [Alias('idParticipante')] idParticipante: String;
      [Alias('cpf')] cpf: String;
      [Alias('cnpj')] cnpj: String;
   end;

   TContaBanco = record
         [Alias('codigoBanco')] codigoBanco: String;
         [Alias('agencia')] agencia: String;
         [Alias('documento')] documento: String;
         [Alias('nome')] nome: String;
         [Alias('conta')] conta: String;
         [Alias('tipoConta')] tipoConta: String;
   end;

   TFavorecido = record
     [Alias('contaBanco')] contaBanco: TContaBanco;
     [Alias('chave')] chave: String;
   end;

   TRecorrencia = record
     [Alias('tipo')] tipo: String;
     [Alias('dataInicio')] dataInicio: String;
     [Alias('quantidade')] quantidade: String;
     [Alias('diaDaSemana')] diaDaSemana: String;
     [Alias('diaDoMes')] diaDoMes: String;
     [Alias('datas')] datas: TArray<String>;
     [Alias('descricao')] descricao: String;
   end;

   TPagamento = record
     [Alias('valor')] valor: String;
     [Alias('infoPagador')] infoPagador: String;
     [Alias('idProprio')] idProprio: String;
     [Alias('recorrencia')] recorrencia: TRecorrencia;
     [Alias('qrcode')] qrcode: String;
     [Alias('identificadorTransacao')] identificadorTransacao: String;
     [Alias('dataAgendamento')] dataAgendamento: String;
     [Alias('codigoCidadeIBGE')] codigoCidadeIBGE: String;
   end;

   TDevolucao = record
     [Alias('endToEndId')] endToEndId: String;
     [Alias('valor')] valor: String;
   end;

   TBodyOfRecurrency = class
    private
    FPagador     : TPagador;
    FFavorecido  : TFavorecido;
    FPagamento   : TPagamento;
    FDevolucao   : TDevolucao;

    procedure SetPagador(const Value: TPagador);
    procedure SetFavorecido(const Value: TFavorecido);
    procedure SetPagamento(const Value: TPagamento);
    procedure SetDevolucao(const Value: TDevolucao);

  public
    [Alias('pagador')]
    property Pagador: TPagador read FPagador write SetPagador;
    [Alias('favorecido')]
    property Favorecido: TFavorecido read FFavorecido write SetFavorecido;
    [Alias('pagamento')]
    property Pagamento: TPagamento read FPagamento write SetPagamento;
    [Alias('devolucoes')]
    property Devolucao: TDevolucao read FDevolucao write SetDevolucao;

    constructor Create;
    end;

implementation

{ TBodyOfRecurrency }

constructor TBodyOfRecurrency.Create;
begin
    inherited;
end;

procedure TBodyOfRecurrency.SetPagador(const Value: TPagador);
begin
       FPagador := Value;
end;

procedure TBodyOfRecurrency.SetFavorecido(const Value: TFavorecido);
begin
     FFavorecido := Value;
end;

procedure TBodyOfRecurrency.SetPagamento(const Value: TPagamento);
begin
     FPagamento := Value;
end;

procedure TBodyOfRecurrency.SetDevolucao(const Value: TDevolucao);
begin
     FDevolucao := Value;
end;

end.
