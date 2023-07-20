unit BodyOfStartPixPayment;

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
   end;


   TBodyOfStartPixPayment = class
    private
    FPagador     : TPagador;
    FFavorecido  : TFavorecido;
    FValor : String;
    FCodigoCidade : String;
    FInfoPagador : String;
    FIdProprio : String;


    procedure SetPagador(const Value: TPagador);
    procedure SetFavorecido(const Value: TFavorecido);
    procedure SetValor(const Value: String);
    procedure SetCodigoCidade(const Value: String);
    procedure SetInfoPagador(const Value: String);
    procedure SetIdProprio(const Value: String);


  public
    [Alias('pagador')]
    property Pagador: TPagador read FPagador write SetPagador;
    [Alias('favorecido')]
    property Favorecido: TFavorecido read FFavorecido write SetFavorecido;
    [Alias('valor')]
    property Valor: String read FValor write SetValor;
    [Alias('codigoCidadeIBGE')]
    property CodigoCidade: String read FCodigoCidade write SetCodigoCidade;
    [Alias('infoPagador')]
    property InfoPagador: String read FInfoPagador write SetInfoPagador;
    [Alias('idProprio')]
    property IdProprio: String read FIdProprio write SetIdProprio;


    constructor Create;
    end;



implementation

{ TBodyOfStartPixPayment }


constructor TBodyOfStartPixPayment.Create;
begin
    inherited;
end;

procedure TBodyOfStartPixPayment.SetCodigoCidade(const Value: String);
begin
     FCodigoCidade := Value;
end;

procedure TBodyOfStartPixPayment.SetFavorecido(const Value: TFavorecido);
begin
     FFavorecido := Value;
end;

procedure TBodyOfStartPixPayment.SetIdProprio(const Value: String);
begin
        FIdProprio := Value;
end;

procedure TBodyOfStartPixPayment.SetInfoPagador(const Value: String);
begin
      FInfoPagador := Value;
end;

procedure TBodyOfStartPixPayment.SetPagador(const Value: TPagador);
begin
       FPagador := Value;
end;

procedure TBodyOfStartPixPayment.SetValor(const Value: String);
begin
    FValor := Value;
end;

end.
