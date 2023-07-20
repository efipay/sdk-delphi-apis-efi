unit BodyDueChargeClass;

interface
uses xSuperObject, xSuperJSON, System.Generics.Collections, System.SysUtils;
Type
  TCalendar = record
    [Alias('dataDeVencimento')]
    dueDate: string;
    [Alias('validadeAposVencimento')]
    validade: Integer;
  end;
  TDebtor = record
    [Alias('cpf')]  cpf: String;
    [Alias('cnpj')]  cnpj: string;
    [Alias('nome')] name: string;
    [Alias('email')] email: string;
    [Alias('logradouro')] logradouro: string;
    [Alias('cidade')] cidade: string;
    [Alias('uf')] estado: string;
    [Alias('cep')] cep: string;
  end;
  TConfiguration = record
      [Alias('modalidade')] modalidade: Integer;
      [Alias('valorPerc')] porcentagem: string;
  end;
  TValue = record
    [Alias('original')] value: String;
    [Alias('abatimento')] abatimento: TConfiguration;
    [Alias('desconto')] desconto: TConfiguration;
    [Alias('juros')] juros: TConfiguration;
    [Alias('multa')] multa: TConfiguration;
  end;
  TLocation = record
     [Alias('id')] id: Integer;
  end;

  TBodyDueChargeClass = class
    private
    FCalendar    : TCalendar;
    FDebtor      : TDebtor;
    FValue       : TValue;
    FLocation    : TLocation;
    FKey         : String;
    FPayerRequest: String;

    procedure SetCalendar(const Value: TCalendar);
    procedure SetDebtor(const Value: TDebtor);
    procedure SetValue(const Value: TValue);
    procedure SetKey(const Value: String);
    procedure SetPayerRequest(const Value: String);
    procedure SetLocation(const Value: TLocation);

    public
    [Alias('chave')]
    property Key: String read FKey write SetKey;
    [Alias('calendario')]
    property Calendar: TCalendar read FCalendar write SetCalendar;
    [Alias('devedor')]
    property Debtor: TDebtor read FDebtor write SetDebtor;
    [Alias('valor')]
    property Value: TValue read FValue write SetValue;
    [Alias('solicitacaoPagador')]
    property PayerRequest: String read FPayerRequest write SetPayerRequest;
    constructor Create;
    [Alias('loc')]
    property Location: TLocation read FLocation write SetLocation;


  end;
implementation

{TBodyDueCharge(create)}
constructor TBodyDueChargeClass.Create;
begin
  inherited;
end;

procedure TBodyDueChargeClass.SetCalendar(const Value: TCalendar);
begin
  FCalendar := Value;
end;

procedure TBodyDueChargeClass.SetDebtor(const Value: TDebtor);
begin
    FDebtor := Value
end;

procedure TBodyDueChargeClass.SetKey(const Value: String);
begin
        FKey := Value;
end;

procedure TBodyDueChargeClass.setLocation(const Value: TLocation);
begin
    FLocation := Value;
end;

procedure TBodyDueChargeClass.SetPayerRequest(const Value: String);
begin
    FPayerRequest := Value;
end;

procedure TBodyDueChargeClass.SetValue(const Value: TValue);
begin
     fValue := Value;
end;

end.
