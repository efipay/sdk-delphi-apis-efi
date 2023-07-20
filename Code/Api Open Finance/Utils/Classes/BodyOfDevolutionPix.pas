unit BodyOfDevolutionPix;

interface
uses xSuperObject, xSuperJSON, System.Generics.Collections, System.SysUtils;
Type
  TBodyOfDevolutionPixClass = class
    private
        FValor   : String;
        procedure SetValor(const Value: String);

      public
        [Alias('valor')]
        property Valor: String read FValor write SetValor;
  end;

implementation

{ TBoodyOfDevolutionPixClass }



{ TBodyOfDevolutionPixClass }

procedure TBodyOfDevolutionPixClass.SetValor(const Value: String);
begin
  FValor := Value;
end;

end.
