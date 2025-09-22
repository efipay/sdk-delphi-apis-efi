unit BodyOfAutomaticClass;

interface
uses xSuperObject, xSuperJSON, System.Generics.Collections, System.SysUtils;
Type
   TPagador = record
      [Alias('cpf')] cpf: String;
      [Alias('cnpj')] cnpj: String;
      [Alias('nome')] nome: String;
      [Alias('idParticipante')] idParticipante: String;
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
   end;

   TPrimeiroPagamento = record
      [Alias('data')] data: String;
      [Alias('valor')] valor: String;
      [Alias('infoPagador')] infoPagador: String;
   end;

   TAutomatico = record
      [Alias('valorFixo')] valorFixo: String;
      [Alias('valorMinimo')] valorMinimo: String;
      [Alias('valorMaximo')] valorMaximo: String;
      [Alias('intervalo')] intervalo: String;
      [Alias('dataInicio')] dataInicio: String;
      [Alias('permiteRetentativa')] permiteRetentativa: Boolean;
      [Alias('primeiroPagamento')] primeiroPagamento: TPrimeiroPagamento;
   end;

   TConfiguracao = record
      [Alias('automatico')] automatico: TAutomatico;
   end;

   TAssinatura = record
      [Alias('expiracao')] expiracao: String;
      [Alias('descricao')] descricao: String;
      [Alias('idProprio')] idProprio: String;
      [Alias('configuracao')] configuracao: TConfiguracao;
   end;

   TPagamento = record
      [Alias('valor')] valor: String;
      [Alias('data')] data: String;
      [Alias('codigoCidadeIBGE')] codigoCidadeIBGE: String;
      [Alias('infoPagador')] infoPagador: String;
   end;

   TBodyOfAutomatic = class
    private
    FPagador     : TPagador;
    FFavorecido  : TFavorecido;
    FAssinatura  : TAssinatura;
    FPagamento   : TPagamento;
    FStatus      : String;
    FIdentificador: String;
    FIdentificadorAdesao: String;
    FEndToEndID  : String;

    procedure SetPagador(const Value: TPagador);
    procedure SetFavorecido(const Value: TFavorecido);
    procedure SetAssinatura(const Value: TAssinatura);
    procedure SetPagamento(const Value: TPagamento);
    procedure SetStatus(const Value: String);
    procedure SetIdentificador(const Value: String);
    procedure SetIdentificadorAdesao(const Value: String);
    procedure SetEndToEndID(const Value: String);
  public
    [Alias('pagador')]
    property Pagador: TPagador read FPagador write SetPagador;
    [Alias('favorecido')]
    property Favorecido: TFavorecido read FFavorecido write SetFavorecido;
    [Alias('assinatura')]
    property Assinatura: TAssinatura read FAssinatura write SetAssinatura;
    [Alias('pagamento')]
    property Pagamento: TPagamento read FPagamento write SetPagamento;
    [Alias('status')]
    property Status: String read FStatus write SetStatus;
    [Alias('identificador')]
    property Identificador: String read FIdentificador write SetIdentificador;
    [Alias('identificadorAdesao')]
    property IdentificadorAdesao: String read FIdentificadorAdesao write SetIdentificadorAdesao;
    [Alias('endToEndId')]
    property EndToEndID: String read FEndToEndID write SetEndToEndID;

    constructor Create;
    end;

implementation

{ TBodyOfAutomatic }

constructor TBodyOfAutomatic.Create;
begin
    inherited;
end;

procedure TBodyOfAutomatic.SetPagador(const Value: TPagador);
begin
       FPagador := Value;
end;

procedure TBodyOfAutomatic.SetFavorecido(const Value: TFavorecido);
begin
     FFavorecido := Value;
end;

procedure TBodyOfAutomatic.SetAssinatura(const Value: TAssinatura);
begin
     FAssinatura := Value;
end;

procedure TBodyOfAutomatic.SetPagamento(const Value: TPagamento);
begin
     FPagamento := Value;
end;

procedure TBodyOfAutomatic.SetStatus(const Value: String);
begin
     FStatus := Value;
end;

procedure TBodyOfAutomatic.SetIdentificador(const Value: String);
begin
     FIdentificador := Value;
end;

procedure TBodyOfAutomatic.SetIdentificadorAdesao(const Value: String);
begin
     FIdentificadorAdesao := Value;
end;

procedure TBodyOfAutomatic.SetEndToEndID(const Value: String);
begin
     FEndToEndID := Value;
end;


end.
