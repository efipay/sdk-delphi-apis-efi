unit BasicAuthentication;

interface
 uses
  Classes, pConnections, IdHTTP, XSuperObject, IdGlobal, Vcl.Dialogs, System.SysUtils, MainPayments;

  procedure OauthToken;
implementation
threadvar
  AccessToken : iSuperObject;

procedure OauthToken;
begin
  try
    AccessToken := pConnections.OauthToken;
    MainPayments.fmrPayments.MemoResponse.Text := 'Autenticação Realizada com Sucesso!';
    except
    on E: Exception do
    begin
      MainPayments.fmrPayments.MemoResponse.Text := 'Erro na Requisião de Autenticação! "GET /OAuth/Token"' + e.Message;
    end;
  end;
end;

end.
