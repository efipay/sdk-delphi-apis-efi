unit BodyRecurrenceClass;

interface

uses
  xSuperObject, xSuperJSON, System.Generics.Collections, System.SysUtils;

type
  TDebtor = record
    [Alias('cpf')] cpf: string;
    [Alias('cnpj')] cnpj: string;
    [Alias('nome')] name: string;
  end;

  TLink = record
    [Alias('contrato')] contract: string;
    [Alias('devedor')] debtor: TDebtor;
    [Alias('objeto')] objectItem: string;
  end;

  TCalendar = record
    [Alias('dataFinal')] endDate: string;
    [Alias('dataInicial')] startDate: string;
    [Alias('periodicidade')] frequency: string;
  end;

  TValue = record
    [Alias('valorRec')] recValue: string;
    [Alias('valorMinimoRecebedor')] minimumReceiverValue: string;
  end;

  TJourneyData = record
    [Alias('txid')] txid: string;
  end;

  TActivation = record
    [Alias('dadosJornada')] journeyData: TJourneyData;
  end;

  TBodyRecurrence = class
  private
    FLink: TLink;
    FCalendar: TCalendar;
    FValue: TValue;
    FRetryPolicy: string;
    FLoc: Integer;
    FActivation: TActivation;
    FStatus: string;

    procedure SetLink(const Value: TLink);
    procedure SetCalendar(const Value: TCalendar);
    procedure SetValue(const Value: TValue);
    procedure SetRetryPolicy(const Value: string);
    procedure SetLoc(const Value: Integer);
    procedure SetActivation(const Value: TActivation);
    procedure SetStatus(const Value: string);

  public
    [Alias('vinculo')]
    property link: TLink read FLink write SetLink;

    [Alias('calendario')]
    property calendar: TCalendar read FCalendar write SetCalendar;

    [Alias('valor')]
    property value: TValue read FValue write SetValue;

    [Alias('politicaRetentativa')]
    property retryPolicy: string read FRetryPolicy write SetRetryPolicy;

    [Alias('loc')]
    property loc: Integer read FLoc write SetLoc;

    [Alias('ativacao')]
    property activation: TActivation read FActivation write SetActivation;

    [Alias('status')]
    property status: string read FStatus write SetStatus;

    constructor Create;
  end;

implementation

{ TBodyRecurrence }

constructor TBodyRecurrence.Create;
begin
  inherited;
end;

procedure TBodyRecurrence.SetLink(const Value: TLink);
begin
  FLink := Value;
end;

procedure TBodyRecurrence.SetCalendar(const Value: TCalendar);
begin
  FCalendar := Value;
end;

procedure TBodyRecurrence.SetValue(const Value: TValue);
begin
  FValue := Value;
end;

procedure TBodyRecurrence.SetRetryPolicy(const Value: string);
begin
  FRetryPolicy := Value;
end;

procedure TBodyRecurrence.SetLoc(const Value: Integer);
begin
  FLoc := Value;
end;

procedure TBodyRecurrence.SetActivation(const Value: TActivation);
begin
  FActivation := Value;
end;

procedure TBodyRecurrence.SetStatus(const Value: string);
begin
  FStatus := Value;
end;

end.

