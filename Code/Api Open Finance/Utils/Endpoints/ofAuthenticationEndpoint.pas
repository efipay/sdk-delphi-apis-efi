unit ofAuthenticationEndpoint;

interface
uses
  Classes, ofConnections, IdHTTP, XSuperObject, IdGlobal, Vcl.Dialogs, System.SysUtils, MainOpenFinance;

  procedure OauthToken;

implementation
threadvar
  AccessToken : iSuperObject;

procedure OauthToken;
begin
  try
    AccessToken := ofConnections.OauthToken;
    MainOpenFinance.frmOpenFinance.MemoResponse.Text := 'Autenticação Realizada com Sucesso!';
    except
    on E: Exception do
    begin
      MainOpenFinance.frmOpenFinance.MemoResponse.Text := 'Erro na Requisião de Autenticação! "GET /OAuth/Token"' + e.Message;
    end;
  end;
end;

end.
