unit BodyRequestRecurrenceClass;

interface

uses
  xSuperObject, xSuperJSON, System.SysUtils;

type
  TCalendar = record
    [Alias('dataExpiracaoSolicitacao')]
    expirationDateRequest: string;
  end;

  TRecipient = record
    [Alias('agencia')] agency: string;
    [Alias('conta')] account: string;
    [Alias('cpf')] cpf: string;
    [Alias('cnpj')] cnpj: string;
    [Alias('ispbParticipante')] participantISPB: string;
  end;

  TBodyRequestRecurrence = class
  private
    FIdRec: string;
    FCalendar: TCalendar;
    FRecipient: TRecipient;
    FStatus: string;

    procedure SetIdRec(const Value: string);
    procedure SetCalendar(const Value: TCalendar);
    procedure SetRecipient(const Value: TRecipient);
    procedure SetStatus(const Value: string);

  public
    [Alias('idRec')]
    property idRec: string read FIdRec write SetIdRec;

    [Alias('calendario')]
    property calendar: TCalendar read FCalendar write SetCalendar;

    [Alias('destinatario')]
    property recipient: TRecipient read FRecipient write SetRecipient;

    [Alias('status')]
    property status: string read FStatus write SetStatus;

    constructor Create;
  end;

implementation

{ TBodyRequestRecurrence }

constructor TBodyRequestRecurrence.Create;
begin
  inherited;
end;

procedure TBodyRequestRecurrence.SetIdRec(const Value: string);
begin
  FIdRec := Value;
end;

procedure TBodyRequestRecurrence.SetCalendar(const Value: TCalendar);
begin
  FCalendar := Value;
end;

procedure TBodyRequestRecurrence.SetRecipient(const Value: TRecipient);
begin
  FRecipient := Value;
end;

procedure TBodyRequestRecurrence.SetStatus(const Value: string);
begin
  FStatus := Value;
end;

end.

