unit BodyChargesPaymentsClass;

interface
uses xSuperObject, xSuperJSON, System.Generics.Collections, System.SysUtils;
Type

TBodyCharcesPaymentsClass = class
private
  FValue: Integer;
  FDescription: string;
  FDatePayment: string;

  procedure setValue(const Value: Integer);
  procedure setDescription(const Value: string);
  procedure setDatePayment(const Value: string);


public

[Alias('valor')]
property Value: Integer read FValue write setValue;

[Alias('dataPagamento')]
property DatePayment: string read FDatePayment write setDatePayment;

[Alias('descricao')]
property Description: string read FDescription write setDescription;

constructor Create;
end;

implementation
constructor TBodyCharcesPaymentsClass.Create;
begin
    inherited;
end;


procedure TBodyCharcesPaymentsClass.setDatePayment(const Value: string);
begin
   FDatePayment := Value;
end;

procedure TBodyCharcesPaymentsClass.setDescription(const Value: string);
begin
    FDescription := Value;
end;

procedure TBodyCharcesPaymentsClass.setValue(const Value: Integer);
begin
    FValue := Value;
end;

end.
