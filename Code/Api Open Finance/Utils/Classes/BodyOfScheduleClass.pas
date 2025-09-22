unit BodyOfScheduleClass;

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
     [Alias('dataAgendamento')] dataAgendamento: String;
     [Alias('codigoCidadeIBGE')] codigoCidadeIBGE: String;
   end;

   TBodyOfSchedule = class
    private
    FPagador     : TPagador;
    FFavorecido  : TFavorecido;
    FPagamento   : TPagamento;
    FValor       : String;
    Fe2eID       : String;

    procedure SetPagador(const Value: TPagador);
    procedure SetFavorecido(const Value: TFavorecido);
    procedure SetPagamento(const Value: TPagamento);
    procedure SetValor(const Value: String);
    procedure Sete2eID(const Value: String);

  public
    [Alias('pagador')]
    property Pagador: TPagador read FPagador write SetPagador;
    [Alias('favorecido')]
    property Favorecido: TFavorecido read FFavorecido write SetFavorecido;
    [Alias('pagamento')]
    property Pagamento: TPagamento read FPagamento write SetPagamento;
    [Alias('valor')]
    property Valor: String read FValor write SetValor;
    [Alias('endToEndId')]
    property endToEndId: String read Fe2eID write Sete2eID;

    constructor Create;
    end;

implementation

{ TBodyOfSchedule }

constructor TBodyOfSchedule.Create;
begin
    inherited;
end;

procedure TBodyOfSchedule.SetPagador(const Value: TPagador);
begin
       FPagador := Value;
end;

procedure TBodyOfSchedule.SetFavorecido(const Value: TFavorecido);
begin
     FFavorecido := Value;
end;

procedure TBodyOfSchedule.SetPagamento(const Value: TPagamento);
begin
     FPagamento := Value;
end;

procedure TBodyOfSchedule.SetValor(const Value: String);
begin
     FValor := Value;
end;

procedure TBodyOfSchedule.Sete2eID(const Value: String);
begin
     Fe2eID := Value;
end;

end.
