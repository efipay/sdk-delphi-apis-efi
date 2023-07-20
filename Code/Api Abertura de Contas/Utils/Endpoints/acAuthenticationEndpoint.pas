unit acAuthenticationEndpoint;

interface
uses
  Classes, acConnections, IdHTTP, XSuperObject, IdGlobal, Vcl.Dialogs, System.SysUtils, MainAberturaContas;
 procedure OauthToken;

implementation
threadvar
  AccessToken : iSuperObject;
procedure OauthToken;
begin
  try
    AccessToken := acConnections.OauthToken;
    MainAberturaContas.frmAberturaDeContas.MemoResponse.Text := 'Autentica��o Realizada com Sucesso!';
    except
    on E: Exception do
    begin
      MainAberturaContas.frmAberturaDeContas.MemoResponse.Text := 'Erro na Requisi�o de Autentica��o! "GET /OAuth/Token"';
    end;
  end;
end;

end.
