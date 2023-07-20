unit ofConfigEndpoints;

interface
uses
Vcl.Forms, Classes,ofConnections, IdHTTP, XSuperObject, IdGlobal, Vcl.Dialogs, System.SysUtils,
  MainOpenFinance, ViewOfConfigUpdate, System.JSON;

procedure ofConfigUpdate;
procedure ofConfigDetail;

implementation
 threadvar
  HttpClient: TIdHTTP;
  AccessToken, ObjResult : iSuperObject;
  JsonToSend: TMemoryStream;



procedure ofConfigUpdate;
var
  sResponse: string;
  Modal    : TOfConfigUpdate;
begin
  try
    try
      if not Assigned(Modal) then
        Application.CreateForm(TOfConfigUpdate, Modal);

      if Modal.ShowModal = 1 then
      begin
        AccessToken := ofConnections.OauthToken;
        HttpClient := ofConnections.SetupClient;

        HttpClient.Request.CustomHeaders.Values['Authorization'] := ('Bearer '+ AccessToken.S['access_token']);

        JsonToSend := TMemoryStream.Create;
        WriteStringToStream(JsonToSend, Modal.Body, IndyTextEncoding_UTF8);
        JsonToSend.Position := 0;

        sResponse := HttpClient.Put(   MainOpenFinance.frmOpenFinance.Enviroment  + '/config', JsonToSend);

        MainOpenFinance.frmOpenFinance.MemoResponse.text := sResponse;

      end;

    except
      on E: Exception do
      begin
        ShowMessage('Erro na Requisição Put /v1/config/ '#13#10#13#10 + e.Message);
      end;
    end;
  finally

  end;
end;
procedure ofConfigDetail;
var
  sResponse: string;
begin
  try
    try


        AccessToken := ofConnections.OauthToken;
        HttpClient := ofConnections.SetupClient;

        HttpClient.Request.CustomHeaders.Values['Authorization'] := ('Bearer '+ AccessToken.S['access_token']);


        sResponse := HttpClient.Get(MainOpenFinance.frmOpenFinance.Enviroment +'/config');

        MainOpenFinance.frmOpenFinance.MemoResponse.text := sResponse;



    except
      on E: Exception do
      begin
        ShowMessage('Erro na Requisição Get /v1/config '#13#10#13#10 + e.Message);
      end;
    end;
  finally

  end;
end;
end.
