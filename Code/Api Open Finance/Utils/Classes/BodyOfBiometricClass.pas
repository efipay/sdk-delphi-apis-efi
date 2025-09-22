unit BodyOfBiometricClass;

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

   TBodyOfBiometric = class
    private
    FPagador     : TPagador;
    FFavorecido  : TFavorecido;
    FPagamento   : TPagamento;
    FIDVinculo   : String;
    FMotivo      : String;

    procedure SetPagador(const Value: TPagador);
    procedure SetFavorecido(const Value: TFavorecido);
    procedure SetPagamento(const Value: TPagamento);
    procedure SetIDVinculo(const Value: String);
    procedure SetMotivo(const Value: String);

  public
    [Alias('pagador')]
    property Pagador: TPagador read FPagador write SetPagador;
    [Alias('favorecido')]
    property Favorecido: TFavorecido read FFavorecido write SetFavorecido;
    [Alias('pagamento')]
    property Pagamento: TPagamento read FPagamento write SetPagamento;
    [Alias('identificadorVinculo')]
    property IDVinculo: String read FIDVinculo write SetIDVinculo;
    [Alias('motivo')]
    property Motivo: String read FMotivo write SetMotivo;

    constructor Create;
    end;

implementation

{ TBodyOfBiometric }

constructor TBodyOfBiometric.Create;
begin
    inherited;
end;

procedure TBodyOfBiometric.SetPagador(const Value: TPagador);
begin
       FPagador := Value;
end;

procedure TBodyOfBiometric.SetFavorecido(const Value: TFavorecido);
begin
     FFavorecido := Value;
end;

procedure TBodyOfBiometric.SetPagamento(const Value: TPagamento);
begin
     FPagamento := Value;
end;

procedure TBodyOfBiometric.SetIDVinculo(const Value: String);
begin
     FIDVinculo := Value;
end;

procedure TBodyOfBiometric.SetMotivo(const Value: String);
begin
     FMotivo := Value;
end;

end.
