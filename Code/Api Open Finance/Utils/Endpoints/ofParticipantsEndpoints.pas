unit ofParticipantsEndpoints;

interface
uses
Vcl.Forms, Classes,ofConnections, IdHTTP, XSuperObject, IdGlobal, Vcl.Dialogs, System.SysUtils,
  MainOpenFinance,ViewOfListParticipants, System.JSON;

procedure ofListParticipants;


implementation
 threadvar
  HttpClient: TIdHTTP;
  AccessToken, ObjResult : iSuperObject;
  JsonToSend: TMemoryStream;

procedure ofListParticipants;
var
  sResponse: string;
  Modal: TOfListParticipants;
begin
    try
      try
        if not Assigned(Modal) then
          Application.CreateForm(TOfListParticipants, Modal);
        if Modal.ShowModal = 1 then
          begin

            AccessToken := ofConnections.OauthToken;
            HttpClient := ofConnections.SetupClient;

            HttpClient.Request.CustomHeaders.Values['Authorization'] := ('Bearer '+ AccessToken.S['access_token']);

            sResponse := HttpClient.Get(MainOpenFinance.frmOpenFinance.Enviroment + '/participantes'+ Modal.NomeParticipante );

            MainOpenFinance.frmOpenFinance.MemoResponse.text := sresponse;

          end;
          except
             on E: Exception do
              begin
                ShowMessage('Erro na Requisição GET /v1/participantes/:nome'#13#10#13#10 + e.Message);
              end;
       end;
      finally

    end;
end;


end.
