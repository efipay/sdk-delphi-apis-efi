unit BodyOFImmediateClass;

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

   TPagamento = record
     [Alias('valor')] valor: String;
     [Alias('infoPagador')] infoPagador: String;
     [Alias('idProprio')] idProprio: String;
     [Alias('qrcode')] qrcode: String;
     [Alias('identificadorTransacao')] identificadorTransacao: String;
     [Alias('codigoCidadeIBGE')] codigoCidadeIBGE: String;
   end;

   TBodyOfImmediate = class
    private
    FPagador     : TPagador;
    FFavorecido  : TFavorecido;
    FPagamento   : TPagamento;
    FValor       : String;

    procedure SetPagador(const Value: TPagador);
    procedure SetFavorecido(const Value: TFavorecido);
    procedure SetPagamento(const Value: TPagamento);
    procedure SetValor(const Value: String);

  public
    [Alias('pagador')]
    property Pagador: TPagador read FPagador write SetPagador;
    [Alias('favorecido')]
    property Favorecido: TFavorecido read FFavorecido write SetFavorecido;
    [Alias('pagamento')]
    property Pagamento: TPagamento read FPagamento write SetPagamento;
    [Alias('valor')]
    property Valor: String read FValor write SetValor;

    constructor Create;
    end;

implementation

{ TBodyOfImmediate }

constructor TBodyOfImmediate.Create;
begin
    inherited;
end;

procedure TBodyOfImmediate.SetPagador(const Value: TPagador);
begin
       FPagador := Value;
end;

procedure TBodyOfImmediate.SetFavorecido(const Value: TFavorecido);
begin
     FFavorecido := Value;
end;

procedure TBodyOfImmediate.SetPagamento(const Value: TPagamento);
begin
     FPagamento := Value;
end;

procedure TBodyOfImmediate.SetValor(const Value: String);
begin
     FValor := Value;
end;

end.
