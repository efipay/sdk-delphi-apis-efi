unit BodyWebhook;

interface
uses  xSuperObject, xSuperJSON, System.Generics.Collections, System.SysUtils, System.Classes;
Type
  TBodyWebhookClass = class
    private
    FUrl : String;
    FChave: String;
         procedure setUrl(const Value: String);
         procedure setChave(const Value: String);
    public
         [Alias('webhookUrl')]
         property Url: String read FUrl write setUrl;
         [Alias('chave')]
         property Chave: String read FChave write setChave;
  end;

implementation

{ TBodyWebhookClass }

procedure TBodyWebhookClass.setChave(const Value: String);
begin
  FChave := Value;
end;

procedure TBodyWebhookClass.setUrl(const Value: String);
begin
    FUrl:= Value;
end;

end.
