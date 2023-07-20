unit BodyCreateAccount;

interface
uses  xSuperObject, xSuperJSON, System.Generics.Collections, System.SysUtils, System.Classes;
Type
      TEndereco = record
        [Alias('cep')] cep: String;
        [Alias('estado')] estado: String;
        [Alias('cidade')] cidade: String;
        [Alias('bairro')] bairro: String;
        [Alias('logradouro')] logradouro: String;
        [Alias('numero')] numero: String;
        [Alias('complemento')] complemento: String;
      end;
    TClientePessoaFisica = class
      private
      FCpf : String;
      FNome : String;
      FDataNascimento : String;
      FNomeMae : String;
      FCelular : String;
      FEmail : String;
      FEndereco: TEndereco;

      procedure setCpf(const Value: String);
      procedure setNome(const Value: String);
      procedure setDataNascimento(const Value: String);
      procedure setNomeMae(const Value: String);
      procedure setCelular(const Value: String);
      procedure setEmail(const Value: String);
      procedure setEndereco(const Value: TEndereco);


      public
       [Alias('cpf')]
      property Cpf: String read FCpf write setCpf;
       [Alias('nomeCompleto')]
      property NomeCompleto: String read FNome write setNome;
       [Alias('dataNascimento')]
      property DataNascimento: String read FDataNascimento write setDataNascimento;
       [Alias('nomeMae')]
      property NomeMae: String read FNomeMae write setNomeMae;
       [Alias('celular')]
      property Celular: String read FCelular write setCelular;
       [Alias('email')]
      property Email: String read FEmail write setEmail;
       [Alias('endereco')]
      property Endereco: TEndereco read FEndereco write setEndereco;

    end;
    TClientePessoaJuridica = class (TClientePessoaFisica)
        private
         FCnpj : String;
         FRazaoSocial : String;
         procedure setCnpj(const Value: String);
         procedure setRazaoSocial(const Value: String);


        public
         [Alias('cnpj')]
         property Cnpj: String read FCnpj write setCnpj;
         [Alias('razaoSocial')]
         property RazaoSocial: String read FRazaoSocial write setRazaoSocial;
    end;
    TBodyCreateAccount = class
      private
        FCliente:TClientePessoaFisica;
     

        procedure SetCliente(const Value: TClientePessoaFisica);
      public
      [Alias('clienteFinal')]
      property Cliente: TClientePessoaFisica read FCliente write SetCliente;
   


      constructor Create;

    end;

implementation

{ TClientePessoaFisica }

procedure TClientePessoaFisica.setCelular(const Value: String);
begin
     FCelular := Value;
end;

procedure TClientePessoaFisica.setCpf(const Value: String);
begin
        FCpf := Value;
end;

procedure TClientePessoaFisica.setDataNascimento(const Value: String);
begin
           FDataNascimento := Value;
end;

procedure TClientePessoaFisica.setEmail(const Value: String);
begin
         FEmail := Value;
end;

procedure TClientePessoaFisica.setEndereco(const Value: TEndereco);
begin
           FEndereco := Value;
end;

procedure TClientePessoaFisica.setNome(const Value: String);
begin
         FNome := Value;
end;

procedure TClientePessoaFisica.setNomeMae(const Value: String);
begin
       FNomeMae := Value;
end;

{ TClientePessoaJuridica }

procedure TClientePessoaJuridica.setCnpj(const Value: String);
begin
      FCnpj := Value;
end;

procedure TClientePessoaJuridica.setRazaoSocial(const Value: String);
begin
         FRazaoSocial := Value;
end;

{ TBodyCreateAccount }



constructor TBodyCreateAccount.Create;
begin

  inherited;
end;

procedure TBodyCreateAccount.SetCliente(const Value: TClientePessoaFisica);
begin
  FCliente := Value;
end;

end.
