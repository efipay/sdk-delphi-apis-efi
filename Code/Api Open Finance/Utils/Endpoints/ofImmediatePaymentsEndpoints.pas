unit ofImmediatePaymentsEndpoints;

interface
uses
Vcl.Forms, Classes,ofConnections, IdHTTP, XSuperObject, IdGlobal, Vcl.Dialogs, System.SysUtils,
  MainOpenFinance, ViewOfCreateImmediateCharge, ViewOfRefundImmediateCharge, ViewOfList, System.JSON;

procedure ofStartPixPayment;
procedure ofListPixPayment;
procedure ofDevolutionPix;

implementation
 threadvar
  HttpClient: TIdHTTP;
  AccessToken, ObjResult : iSuperObject;
  JsonToSend: TMemoryStream;

Procedure ofStartPixPayment;
var
  sResponse: string;
  Modal    : TViewOfCreateImmediateCharge;
begin
  try
    try
      if not Assigned(Modal) then
        Application.CreateForm(TViewOfCreateImmediateCharge, Modal);

      if Modal.ShowModal = 1 then
      begin
        AccessToken := ofConnections.OauthToken;
        HttpClient := ofConnections.SetupClient;

        HttpClient.Request.CustomHeaders.Values['Authorization']      := ('Bearer '+ AccessToken.S['access_token']);
        HttpClient.Request.CustomHeaders.Values['x-idempotency-key']  := Modal.IdemKey;

        JsonToSend := TMemoryStream.Create;
        WriteStringToStream(JsonToSend, Modal.Body, IndyTextEncoding_UTF8);
        JsonToSend.Position := 0;

        sResponse := HttpClient.Post( MainOpenFinance.frmOpenFinance.Enviroment  + '/pagamentos/pix', JsonToSend);

        MainOpenFinance.frmOpenFinance.MemoResponse.text := sResponse;

      end;

    except
      on E: Exception do
      begin
        ShowMessage('Erro na Requisição POST /v1/pagamentos/pix '#13#10#13#10 + e.Message);
      end;
    end;
  finally

  end;
end;

Procedure ofListPixPayment;
var
  sResponse: string;
  Modal    : TViewOfList;
begin
  try
    try
      if not Assigned(Modal) then
        Application.CreateForm(TViewOfList, Modal);

      if Modal.ShowModal = 1 then
      begin
        AccessToken := ofConnections.OauthToken;
        HttpClient := ofConnections.SetupClient;

        HttpClient.Request.CustomHeaders.Values['Authorization']      := ('Bearer '+ AccessToken.S['access_token']);

        sResponse := HttpClient.Get( MainOpenFinance.frmOpenFinance.Enviroment  + '/pagamentos/pix?inicio='+ Modal.StartDate +'&fim=' + Modal.EndDate );

        MainOpenFinance.frmOpenFinance.MemoResponse.text := sResponse;
      end;

    except
      on E: Exception do
      begin
        ShowMessage('Erro na Requisição GET /v1/pagamentos/pix '#13#10#13#10 + e.Message);
      end;
    end;
  finally

  end;
end;

Procedure ofDevolutionPix;
var
  sResponse: string;
  Modal    : TViewOfRefundImmediateCharge;
begin
  try
    try
      if not Assigned(Modal) then
        Application.CreateForm(TViewOfRefundImmediateCharge, Modal);

      if Modal.ShowModal = 1 then
      begin
        AccessToken := ofConnections.OauthToken;
        HttpClient := ofConnections.SetupClient;

        HttpClient.Request.CustomHeaders.Values['Authorization']      := ('Bearer '+ AccessToken.S['access_token']);
        HttpClient.Request.CustomHeaders.Values['x-idempotency-key']  := Modal.IdemKey;

        JsonToSend := TMemoryStream.Create;
        WriteStringToStream(JsonToSend, Modal.Body, IndyTextEncoding_UTF8);
        JsonToSend.Position := 0;

        sResponse := HttpClient.Post( MainOpenFinance.frmOpenFinance.Enviroment  + '/pagamentos/pix/' + Modal.IDPagamento + '/devolver', JsonToSend);

        MainOpenFinance.frmOpenFinance.MemoResponse.text := sResponse;

      end;

    except
      on E: Exception do
      begin
        ShowMessage('Erro na Requisição POST /v1/pagamentos/pix/:identificadorPagamento/devolver '#13#10#13#10 + e.Message);
      end;
    end;
  finally

  end;
end;

end.
