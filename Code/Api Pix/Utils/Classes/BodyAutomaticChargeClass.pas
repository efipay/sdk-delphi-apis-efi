unit BodyAutomaticChargeClass;

interface

uses
  xSuperObject, xSuperJSON, System.SysUtils;

type
  TDebtor = record
    [Alias('cep')] zipCode: string;
    [Alias('cidade')] city: string;
    [Alias('email')] email: string;
    [Alias('logradouro')] address: string;
    [Alias('uf')] state: string;
  end;

  TReceiver = record
    [Alias('agencia')] agency: string;
    [Alias('conta')] account: string;
    [Alias('tipoConta')] accountType: string;
  end;

  TCalendar = record
    [Alias('dataDeVencimento')] dueDate: string;
  end;

  TValue = record
    [Alias('original')] original: string;
  end;

  TBodyAutomaticCharge = class
  private
    FIdRec: string;
    FAdditionalInfo: string;
    FCalendar: TCalendar;
    FValue: TValue;
    FBusinessDayAdjustment: Boolean;
    FDebtor: TDebtor;
    FReceiver: TReceiver;
    FStatus: string;

    procedure SetIdRec(const Value: string);
    procedure SetAdditionalInfo(const Value: string);
    procedure SetCalendar(const Value: TCalendar);
    procedure SetValue(const Value: TValue);
    procedure SetBusinessDayAdjustment(const Value: Boolean);
    procedure SetDebtor(const Value: TDebtor);
    procedure SetReceiver(const Value: TReceiver);
    procedure SetStatus(const Value: string);
  public
    [Alias('idRec')]
    property idRec: string read FIdRec write SetIdRec;

    [Alias('infoAdicional')]
    property additionalInfo: string read FAdditionalInfo write SetAdditionalInfo;

    [Alias('calendario')]
    property calendar: TCalendar read FCalendar write SetCalendar;

    [Alias('valor')]
    property value: TValue read FValue write SetValue;

    [Alias('ajusteDiaUtil')]
    property businessDayAdjustment: Boolean read FBusinessDayAdjustment write SetBusinessDayAdjustment;

    [Alias('devedor')]
    property debtor: TDebtor read FDebtor write SetDebtor;

    [Alias('recebedor')]
    property receiver: TReceiver read FReceiver write SetReceiver;

    [Alias('status')]
    property status: string read FStatus write SetStatus;

    constructor Create;
  end;

implementation

constructor TBodyAutomaticCharge.Create;
begin
  inherited;
end;

procedure TBodyAutomaticCharge.SetIdRec(const Value: string);
begin
  FIdRec := Value;
end;

procedure TBodyAutomaticCharge.SetAdditionalInfo(const Value: string);
begin
  FAdditionalInfo := Value;
end;

procedure TBodyAutomaticCharge.SetCalendar(const Value: TCalendar);
begin
  FCalendar := Value;
end;

procedure TBodyAutomaticCharge.SetValue(const Value: TValue);
begin
  FValue := Value;
end;

procedure TBodyAutomaticCharge.SetBusinessDayAdjustment(const Value: Boolean);
begin
  FBusinessDayAdjustment := Value;
end;

procedure TBodyAutomaticCharge.SetDebtor(const Value: TDebtor);
begin
  FDebtor := Value;
end;

procedure TBodyAutomaticCharge.SetReceiver(const Value: TReceiver);
begin
  FReceiver := Value;
end;

procedure TBodyAutomaticCharge.SetStatus(const Value: string);
begin
  FStatus := Value;
end;

end.

