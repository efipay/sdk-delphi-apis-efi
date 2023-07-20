unit BodySplitPixClass;

interface
uses xSuperObject, xSuperJSON, System.Generics.Collections, System.SysUtils;
Type
    TLancamento = record
    [Alias('imediato')] imediato: Boolean;
    end;

    TFavorecido = class
      private
      FConta : String;

      procedure setConta(const Value: String);

      public
      [Alias('conta')]
      property Conta: String read FConta write setConta;


    end;
    TFavorecidoPessoaFisica = class(TFavorecido)
      private
      FCpf : String;

      procedure setCpf(const Value: String);

      public
      [Alias('cpf')]
      property Cpf: String read FCpf write setCpf;
    end;

    TFavorecidoPessoaJuridica = class(TFavorecido)
      private
      FCnpj: String;

      procedure setCnpj(const Value: String);

      public
      [Alias('cnpj')]
      property Cnpj: String read FCnpj write setCnpj;

    end;

    TConfigDivisaoIntegrador = record
         [Alias('tipo')] tipo: String;
         [Alias('valor')] valor: String;
    end;
    TConfigDivisaoRecebedores = class
         [Alias('tipo')] tipo: String;
         [Alias('valor')] valor: String;
         [Alias('favorecido')] favorecido: TFavorecido ;
    end;

    TSplit = record
         [Alias('divisaoTarifa')] divisaoTarifa: String;
         [Alias('minhaParte')] minhaParte: TConfigDivisaoIntegrador;
         [Alias('repasses')] repasses: TObjectList<TConfigDivisaoRecebedores>;
    end;

    TBodySplitClass = class
    private
    FDescricao   : String;
    FLancamento  : TLancamento;
    FSplitConfig : TSplit;


    procedure SetDescricao(const Value: String);
    procedure SetLancamento(const Value: TLancamento);
    procedure SetSplitConfig(const Value: TSplit);


  public
    [Alias('descricao')]
    property Descricao: String read FDescricao write SetDescricao;
    [Alias('lancamento')]
    property Lancamento: TLancamento read FLancamento write SetLancamento;
    [Alias('split')]
    property SplitConfig: TSplit read FSplitConfig write SetSplitConfig;

    procedure AddItem(const Value: TConfigDivisaoRecebedores);
    constructor Create;
    end;

implementation

{ TBodySplitClass }

procedure TBodySplitClass.AddItem(const Value: TConfigDivisaoRecebedores);
begin
     FSplitConfig.repasses.Add(TConfigDivisaoRecebedores.Create);
     FSplitConfig.repasses[0].tipo := Value.tipo;
     FSplitConfig.repasses[0].valor := Value.valor;
     FSplitConfig.repasses[0].favorecido := Value.favorecido;

end;

constructor TBodySplitClass.Create;
begin
      inherited;
end;

procedure TBodySplitClass.SetDescricao(const Value: String);
begin
   FDescricao := Value;
end;

procedure TBodySplitClass.SetLancamento(const Value: TLancamento);
begin
     FLancamento := Value;
end;

procedure TBodySplitClass.SetSplitConfig(const Value: TSplit);
begin
    FSplitConfig := Value;
end;

{ TFavorecido }

procedure TFavorecido.setConta(const Value: String);
begin
    FConta := Value;
end;

{ TFavorecidoPessoaFisica }

procedure TFavorecidoPessoaFisica.setCpf(const Value: String);
begin
  FCpf:= Value
end;

{ TFavorecidoPessoaJuridica }

procedure TFavorecidoPessoaJuridica.setCnpj(const Value: String);
begin
  FCnpj:= Value;
end;

end.
