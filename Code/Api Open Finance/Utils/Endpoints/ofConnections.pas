unit ofConnections;

interface
Uses Classes, XSuperObject, IdHTTP, Vcl.Controls,Vcl.ExtDlgs, System.SysUtils,
IdServerIOHandler, IdSSL, IdSSLOpenSSL, IdIOHandler, IdIOHandlerSocket,
IdIOHandlerStack, idLogFile, IdGlobal, MainOpenFinance;

function OauthToken: iSuperObject;
function SetupClient: TIdHTTP;

implementation
threadvar
  HttpClient: TIdHTTP;
  {$IFDEF DEBUG}
  HttpLog: TIdLogFile;
  {$ENDIF}
  JsonToSend: TMemoryStream;

function OauthToken : iSuperObject ;
Const
  Body = '{"grant_type": "client_credentials"}';
var
  sResponse : String;
begin

  HttpClient := SetupClient;

  HttpClient.Request.Username := MainOpenFinance.frmOpenFinance.ClientID;
  HttpClient.Request.Password := MainOpenFinance.frmOpenFinance.ClientSecret;

  HttpClient.Request.BasicAuthentication := True;

  JsonToSend := TMemoryStream.Create;
  WriteStringToStream(JsonToSend, Body, IndyTextEncoding_UTF8);
  JsonToSend.Position := 0;

  sResponse := HttpClient.Post(MainOpenFinance.frmOpenFinance.Enviroment +'/oauth/token',JsonToSend);

  Result := SO(sResponse);

end;
 function SetupClient: TIdHTTP;
begin
  Result := TIdHTTP.Create( nil );
  Result.ConnectTimeout := 20000;
  Result.IOHandler := TIdSSLIOHandlerSocketOpenSSL.Create(nil);

  with TIdSSLIOHandlerSocketOpenSSL(Result.IOHandler).SSLOptions do
  begin
    CertFile := MainOpenFinance.frmOpenFinance.CertFilePem;
    KeyFile  := MainOpenFinance.frmOpenFinance.CertFilePem;

    Mode := sslmUnassigned;
    SSLVersions := [sslvTLSv1_2];
  end;

  with Result do
  begin
    Request.CustomHeaders.Values['Content-Type'] := 'application/json; application/x-www-form-urlencoded;';
    Request.ContentType := 'application/json';
    Request.CharSet     := 'utf-8';
    Request.UserAgent := 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:12.0) Gecko/20100101 Firefox/12.0';
    HandleRedirects := True;
    HTTPOptions := [hoKeepOrigProtocol, hoInProcessAuth];
  end;

  {$IFDEF DEBUG}
    Result.Intercept := HttpLog;
  {$ENDIF}
end;
end.
