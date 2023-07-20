unit acCreateAccountEndpoints;

interface
uses
Vcl.Forms, Classes,acConnections, IdHTTP, XSuperObject, IdGlobal, Vcl.Dialogs, System.SysUtils,
  MainAberturaContas, ViewCreateAccount,ViewGetAccountCredentials,ViewGetAccountCertificate,
  ViewAccountConfigWebhook,ViewAccountDetailWebhook, ViewAccountDeleteWebhook, ViewAccountListWebhook,System.JSON;

procedure createAccount;
procedure getAccountCredentials;
procedure getAccountCertificate;
procedure accountConfigWebhook;
procedure accountDetailWebhook;
procedure accountDeleteWebhook;
procedure accountListWebhook;


implementation
 threadvar
  HttpClient: TIdHTTP;
  AccessToken, ObjResult : iSuperObject;
  JsonToSend: TMemoryStream;

procedure createAccount;
var
  sResponse: string;
  Modal    : TCreateAccount;
begin
  try
    try
      if not Assigned(Modal) then
        Application.CreateForm(TCreateAccount, Modal);

      if Modal.ShowModal = 1 then
      begin
        AccessToken := acConnections.OauthToken;
        HttpClient := acConnections.SetupClient;

        HttpClient.Request.CustomHeaders.Values['Authorization'] := ('Bearer '+ AccessToken.S['access_token']);

        JsonToSend := TMemoryStream.Create;
        WriteStringToStream(JsonToSend, Modal.Body, IndyTextEncoding_UTF8);
        JsonToSend.Position := 0;

        sResponse := HttpClient.Post( MainAberturaContas.frmAberturaDeContas.Enviroment  + '/conta-simplificada', JsonToSend);

        MainAberturaContas.frmAberturaDeContas.MemoResponse.text := sResponse;

      end;

    except
      on E: Exception do
      begin
        ShowMessage('Erro na Requisição POST /cadastro/conta-simplificada '#13#10#13#10 + e.Message);
      end;
    end;
  finally

  end;
end;

procedure getAccountCredentials;
var
  sResponse: string;
  Modal: TGetAccountCredentials;
begin
       try
         try
           if not Assigned(Modal) then
           Application.CreateForm(TGetAccountCredentials, Modal);
           if Modal.ShowModal = 1 then
            begin

              AccessToken := acConnections.OauthToken;
              HttpClient := acConnections.SetupClient;

              HttpClient.Request.CustomHeaders.Values['Authorization'] := ('Bearer '+ AccessToken.S['access_token']);
              sResponse := HttpClient.Get( MainAberturaContas.frmAberturaDeContas.Enviroment + '/conta-simplificada/'+Modal.txtId.Text+'/credenciais');

               MainAberturaContas.frmAberturaDeContas.MemoResponse.text := sresponse;

            end;
            except
              on E: Exception do
              begin
                ShowMessage('Erro na Requisição GET /cadastro/conta-simplificada/:identificador/credenciais '#13#10#13#10 + e.Message);
              end;
         end;
       finally

       end;
end;

procedure getAccountCertificate;
var
  sResponse: string;
  Modal: TGetAccountCertificate;
begin
       try
         try
           if not Assigned(Modal) then
           Application.CreateForm(TGetAccountCertificate, Modal);
           if Modal.ShowModal = 1 then
            begin

              AccessToken := acConnections.OauthToken;
              HttpClient := acConnections.SetupClient;

              HttpClient.Request.CustomHeaders.Values['Authorization'] := ('Bearer '+ AccessToken.S['access_token']);
              sResponse := HttpClient.Get( MainAberturaContas.frmAberturaDeContas.Enviroment + '/conta-simplificada/'+Modal.txtId.Text+'/certificado');

               MainAberturaContas.frmAberturaDeContas.MemoResponse.text := sresponse;

            end;
            except
              on E: Exception do
              begin
                ShowMessage('Erro na Requisição GET /cadastro/conta-simplificada/:identificador/certificado '#13#10#13#10 + e.Message);
              end;
         end;
       finally

       end;
end;

procedure accountConfigWebhook;
var
  sResponse: string;
  Modal    : TAccountConfigWebhook;
begin
  try
    try
      if not Assigned(Modal) then
        Application.CreateForm(TAccountConfigWebhook, Modal);

      if Modal.ShowModal = 1 then
      begin
        AccessToken := acConnections.OauthToken;
        HttpClient := acConnections.SetupClient;

        HttpClient.Request.CustomHeaders.Values['Authorization'] := ('Bearer '+ AccessToken.S['access_token']);

        JsonToSend := TMemoryStream.Create;
        WriteStringToStream(JsonToSend, Modal.Body, IndyTextEncoding_UTF8);
        JsonToSend.Position := 0;

        sResponse := HttpClient.Post( MainAberturaContas.frmAberturaDeContas.Enviroment  + '/webhook', JsonToSend);

        MainAberturaContas.frmAberturaDeContas.MemoResponse.text := sResponse;

      end;

    except
      on E: Exception do
      begin
        ShowMessage('Erro na Requisição POST /cadastro/webhook '#13#10#13#10 + e.Message);
      end;
    end;
  finally

  end;
end;

procedure accountDetailWebhook;
var
  sResponse: string;
  Modal: TAccountDetailWebhook;
begin
       try
         try
           if not Assigned(Modal) then
           Application.CreateForm(TAccountDetailWebhook, Modal);
           if Modal.ShowModal = 1 then
            begin

              AccessToken := acConnections.OauthToken;
              HttpClient := acConnections.SetupClient;

              HttpClient.Request.CustomHeaders.Values['Authorization'] := ('Bearer '+ AccessToken.S['access_token']);
              sResponse := HttpClient.Get( MainAberturaContas.frmAberturaDeContas.Enviroment + '/webhook/'+Modal.txtId.Text);

               MainAberturaContas.frmAberturaDeContas.MemoResponse.text := sresponse;

            end;
            except
              on E: Exception do
              begin
                ShowMessage('Erro na Requisição GET /cadastro/conta-simplificada/:identificador/credenciais '#13#10#13#10 + e.Message);
              end;
         end;
       finally

       end;
end;

procedure accountDeleteWebhook;
var
  sResponse: string;
  Modal: TAccountDeleteWebhook;
begin
       try
         try
           if not Assigned(Modal) then
           Application.CreateForm(TAccountDeleteWebhook, Modal);
           if Modal.ShowModal = 1 then
            begin

              AccessToken := acConnections.OauthToken;
              HttpClient := acConnections.SetupClient;

              HttpClient.Request.CustomHeaders.Values['Authorization'] := ('Bearer '+ AccessToken.S['access_token']);
              sResponse := HttpClient.Delete( MainAberturaContas.frmAberturaDeContas.Enviroment + '/webhook/'+Modal.txtId.Text);

               MainAberturaContas.frmAberturaDeContas.MemoResponse.text := sresponse;

            end;
            except
              on E: Exception do
              begin
                ShowMessage('Erro na Requisição GET /cadastro/conta-simplificada/:identificador/credenciais '#13#10#13#10 + e.Message);
              end;
         end;
       finally

       end;
end;

procedure accountListWebhook;
var
  sResponse: string;
  Modal: TAccountListWebhook;
begin
       try
         try
           if not Assigned(Modal) then
           Application.CreateForm(TAccountListWebhook, Modal);
           if Modal.ShowModal = 1 then
            begin

              AccessToken := acConnections.OauthToken;
              HttpClient := acConnections.SetupClient;

              HttpClient.Request.CustomHeaders.Values['Authorization'] := ('Bearer '+ AccessToken.S['access_token']);
              sResponse := HttpClient.Get( MainAberturaContas.frmAberturaDeContas.Enviroment + '/webhooks'+Modal.Filters);

               MainAberturaContas.frmAberturaDeContas.MemoResponse.text := sresponse;

            end;
            except
              on E: Exception do
              begin
                ShowMessage('Erro na Requisição GET /cadastro/conta-simplificada/:identificador/credenciais '#13#10#13#10 + e.Message);
              end;
         end;
       finally

       end;
end;
end.
