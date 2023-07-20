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
    MainOpenFinance.frmOpenFinance.MemoResponse.Text := 'Autentica��o Realizada com Sucesso!';
    except
    on E: Exception do
    begin
      MainOpenFinance.frmOpenFinance.MemoResponse.Text := 'Erro na Requisi�o de Autentica��o! "GET /OAuth/Token"' + e.Message;
    end;
  end;
end;

end.
