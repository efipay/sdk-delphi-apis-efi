unit BodyOfConfigUpdate;

interface
uses xSuperObject, xSuperJSON, System.Generics.Collections, System.SysUtils;
Type
      TWebhookSecurity = record
        [Alias('type')] typeSecurity: String;
        [Alias('hash')] hash        : String;
      end;

      TBodyOfConfigUpdateClass = class
      private
        FRedirect   : String;
        FWebhook    : String;
        FSecurity   : TWebhookSecurity;


        procedure SetRedirect(const Value: String);
        procedure SetWebhook  (const Value: String);
        procedure SetSecurity(const Value: TWebhookSecurity);


      public
        [Alias('redirectURL')]
        property RedirectURL: String read FRedirect write SetRedirect;
        [Alias('webhookURL')]
        property WebhookURL: String read FWebhook write SetWebhook;
        [Alias('webhookSecurity')]
        property Security: TWebhookSecurity read FSecurity write SetSecurity;

        constructor Create;
        end;

implementation
      { TBodyOfConfigUpdateClass }

constructor TBodyOfConfigUpdateClass.Create;
begin
     inherited;
end;

procedure TBodyOfConfigUpdateClass.SetRedirect(const Value: String);
begin
     FRedirect := Value;
end;

procedure TBodyOfConfigUpdateClass.SetSecurity(const Value: TWebhookSecurity);
begin
      FSecurity := Value;
end;

procedure TBodyOfConfigUpdateClass.SetWebhook(const Value: String);
begin
    FWebhook := Value;
end;




end.
