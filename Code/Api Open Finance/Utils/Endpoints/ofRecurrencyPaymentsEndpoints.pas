unit ofRecurrencyPaymentsEndpoints;

interface
uses
Vcl.Forms, Classes,ofConnections, IdHTTP, XSuperObject, IdGlobal, Vcl.Dialogs, System.SysUtils,
  MainOpenFinance, ViewOfList, ViewOfCancel, ViewOfCreateRecurrencyCharge, ViewOfRefundRecurrencyCharge, System.JSON;

procedure ofStartRecurrencyPixPayment;
procedure ofListRecurrencyPixPayment;
procedure ofCancelRecurrencyPix;
procedure ofDevolutionRecurrencyPix;
procedure ofReplaceRecurrencyPixParcel;

implementation
 threadvar
  HttpClient: TIdHTTP;
  AccessToken, ObjResult : iSuperObject;
  JsonToSend: TMemoryStream;

Procedure ofStartRecurrencyPixPayment;
var
  sResponse: string;
  Modal    : TViewOfCreateRecurrencyCharge;
begin
  try
    try
      if not Assigned(Modal) then
        Application.CreateForm(TViewOfCreateRecurrencyCharge, Modal);

      if Modal.ShowModal = 1 then
      begin
        AccessToken := ofConnections.OauthToken;
        HttpClient := ofConnections.SetupClient;

        HttpClient.Request.CustomHeaders.Values['Authorization']      := ('Bearer '+ AccessToken.S['access_token']);
        HttpClient.Request.CustomHeaders.Values['x-idempotency-key']  := Modal.IdemKey;

        JsonToSend := TMemoryStream.Create;
        WriteStringToStream(JsonToSend, Modal.Body, IndyTextEncoding_UTF8);
        JsonToSend.Position := 0;

        sResponse := HttpClient.Post( MainOpenFinance.frmOpenFinance.Enviroment  + '/pagamentos-recorrentes/pix', JsonToSend);

        MainOpenFinance.frmOpenFinance.MemoResponse.text := sResponse;

      end;

    except
      on E: Exception do
      begin
        ShowMessage('Erro na Requisição POST /v1/pagamentos-recorrentes/pix '#13#10#13#10 + e.Message);
      end;
    end;
  finally

  end;
end;

Procedure ofListRecurrencyPixPayment;
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

        sResponse := HttpClient.Get( MainOpenFinance.frmOpenFinance.Enviroment + '/pagamentos-recorrentes/pix?inicio='+ Modal.StartDate +'&fim=' + Modal.EndDate);

        MainOpenFinance.frmOpenFinance.MemoResponse.text := sResponse;

      end;

    except
      on E: Exception do
      begin
        ShowMessage('Erro na Requisição GET /v1/pagamentos-recorrentes/pix '#13#10#13#10 + e.Message);
      end;
    end;
  finally

  end;
end;

Procedure ofCancelRecurrencyPix;
var
  sResponse: string;
  Modal    : TViewOfCancel;
begin
  try
    try
      if not Assigned(Modal) then
        Application.CreateForm(TViewOfCancel, Modal);

      if Modal.ShowModal = 1 then
      begin
        AccessToken := ofConnections.OauthToken;
        HttpClient := ofConnections.SetupClient;

        HttpClient.Request.CustomHeaders.Values['Authorization']      := ('Bearer '+ AccessToken.S['access_token']);

        JsonToSend := TMemoryStream.Create;
        WriteStringToStream(JsonToSend, '{}', IndyTextEncoding_UTF8);
        JsonToSend.Position := 0;

        sResponse := HttpClient.Patch( MainOpenFinance.frmOpenFinance.Enviroment  + '/pagamentos-recorrentes/pix/' + Modal.IDPagamento + '/cancelar', JsonToSend);

        MainOpenFinance.frmOpenFinance.MemoResponse.text := sResponse;

      end;

    except
      on E: Exception do
      begin
        ShowMessage('Erro na Requisição PATCH /v1/pagamentos-recorrentes/pix/:identificadorPagamento/cancelar '#13#10#13#10 + e.Message);
      end;
    end;
  finally

  end;
end;

Procedure ofDevolutionRecurrencyPix;
var
  sResponse: string;
  Modal    : TViewOfRefundRecurrencyCharge;
begin
  try
    try
      if not Assigned(Modal) then
        Application.CreateForm(TViewOfRefundRecurrencyCharge, Modal);

      if Modal.ShowModal = 1 then
      begin
        AccessToken := ofConnections.OauthToken;
        HttpClient := ofConnections.SetupClient;

        HttpClient.Request.CustomHeaders.Values['Authorization']      := ('Bearer '+ AccessToken.S['access_token']);
        HttpClient.Request.CustomHeaders.Values['x-idempotency-key']  := Modal.IdemKey;

        JsonToSend := TMemoryStream.Create;
        WriteStringToStream(JsonToSend, Modal.Body, IndyTextEncoding_UTF8);
        JsonToSend.Position := 0;

        sResponse := HttpClient.Post( MainOpenFinance.frmOpenFinance.Enviroment  + '/pagamentos-recorrentes/pix/' + Modal.IDPagamento + '/devolver', JsonToSend);

        MainOpenFinance.frmOpenFinance.MemoResponse.text := sResponse;

      end;

    except
      on E: Exception do
      begin
        ShowMessage('Erro na Requisição POST /v1/pagamentos-agendados/pix/:identificadorPagamento/devolver '#13#10#13#10 + e.Message);
      end;
    end;
  finally

  end;
end;

Procedure ofReplaceRecurrencyPixParcel;
var
  sResponse: string;
  Modal    : TViewOfRefundRecurrencyCharge;
begin
  try
    try
      if not Assigned(Modal) then
        Application.CreateForm(TViewOfRefundRecurrencyCharge, Modal);

      if Modal.ShowModal = 1 then
      begin
        AccessToken := ofConnections.OauthToken;
        HttpClient := ofConnections.SetupClient;

        HttpClient.Request.CustomHeaders.Values['Authorization']      := ('Bearer '+ AccessToken.S['access_token']);
        HttpClient.Request.CustomHeaders.Values['x-idempotency-key']  := Modal.IdemKey;

        JsonToSend := TMemoryStream.Create;
        WriteStringToStream(JsonToSend, Modal.Valor, IndyTextEncoding_UTF8);
        JsonToSend.Position := 0;

        sResponse := HttpClient.Patch( MainOpenFinance.frmOpenFinance.Enviroment  + '/pagamentos-recorrentes/pix/' + Modal.IDPagamento + '/substituir/' + Modal.endToEndID, JsonToSend);

        MainOpenFinance.frmOpenFinance.MemoResponse.text := sResponse;

      end;

    except
      on E: Exception do
      begin
        ShowMessage('Erro na Requisição PATCH /v1/pagamentos-recorrentes/pix/:identificadorPagamento/substituir/:endToEndId '#13#10#13#10 + e.Message);
      end;
    end;
  finally

  end;
end;

end.
