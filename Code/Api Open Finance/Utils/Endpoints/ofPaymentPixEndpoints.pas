unit ofPaymentPixEndpoints;

interface
uses
Vcl.Forms, Classes,ofConnections, IdHTTP, XSuperObject, IdGlobal, Vcl.Dialogs, System.SysUtils,
  MainOpenFinance, ViewOfStartPixPayment, ViewOfListPixPayment, System.JSON;

procedure ofStartPixPayment;
procedure ofListPixPayment;


implementation
 threadvar
  HttpClient: TIdHTTP;
  AccessToken, ObjResult : iSuperObject;
  JsonToSend: TMemoryStream;

Procedure ofStartPixPayment;
var
  sResponse: string;
  Modal    : TOfStartPixPayment;
begin
  try
    try
      if not Assigned(Modal) then
        Application.CreateForm(TOfStartPixPayment, Modal);

      if Modal.ShowModal = 1 then
      begin
        AccessToken := ofConnections.OauthToken;
        HttpClient := ofConnections.SetupClient;

        HttpClient.Request.CustomHeaders.Values['Authorization']      := ('Bearer '+ AccessToken.S['access_token']);
        HttpClient.Request.CustomHeaders.Values['x-idempotency-key']  := Modal.txtIdempotency.Text;

        JsonToSend := TMemoryStream.Create;
        WriteStringToStream(JsonToSend, Modal.Body, IndyTextEncoding_UTF8);
        JsonToSend.Position := 0;

        sResponse := HttpClient.Post( MainOpenFinance.frmOpenFinance.Enviroment  + '/pagamentos/pix', JsonToSend);

        MainOpenFinance.frmOpenFinance.MemoResponse.text := sResponse;

      end;

    except
      on E: Exception do
      begin
        ShowMessage('Erro na Requisição POST /open-finance/pagamentos/pix '#13#10#13#10 + e.Message);
      end;
    end;
  finally

  end;
end;

Procedure ofListPixPayment;
var
  sResponse: string;
  Modal    : TOfListPixPayment;
begin
  try
    try
      if not Assigned(Modal) then
        Application.CreateForm(TOfListPixPayment, Modal);

      if Modal.ShowModal = 1 then
      begin
        AccessToken := ofConnections.OauthToken;
        HttpClient := ofConnections.SetupClient;

        HttpClient.Request.CustomHeaders.Values['Authorization']      := ('Bearer '+ AccessToken.S['access_token']);


        
        sResponse := HttpClient.Get( MainOpenFinance.frmOpenFinance.Enviroment  + '/pagamentos/pix'+Modal.Filters);

        MainOpenFinance.frmOpenFinance.MemoResponse.text := sResponse;

      end;

    except
      on E: Exception do
      begin
        ShowMessage('Erro na Requisição GET /open-finance/pagamentos/pix '#13#10#13#10 + e.Message);
      end;
    end;
  finally

  end;
end;

end.
