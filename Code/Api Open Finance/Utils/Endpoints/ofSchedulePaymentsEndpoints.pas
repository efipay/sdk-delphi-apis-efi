unit ofSchedulePaymentsEndpoints;

interface
uses
Vcl.Forms, Classes,ofConnections, IdHTTP, XSuperObject, IdGlobal, Vcl.Dialogs, System.SysUtils,
  MainOpenFinance, ViewOfList, ViewOfCancel, ViewOfCreateScheduleCharge, ViewOfRefundScheduleCharge, System.JSON;

procedure ofCancelSchedulePix;
procedure ofListSchedulePixPayment;
procedure ofStartSchedulePixPayment;
procedure ofDevolutionSchedulePix;

implementation
 threadvar
  HttpClient: TIdHTTP;
  AccessToken, ObjResult : iSuperObject;
  JsonToSend: TMemoryStream;

Procedure ofCancelSchedulePix;
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

        sResponse := HttpClient.Patch( MainOpenFinance.frmOpenFinance.Enviroment  + '/pagamentos-agendados/pix/' + Modal.IDPagamento + '/cancelar', JsonToSend);

        MainOpenFinance.frmOpenFinance.MemoResponse.text := sResponse;

      end;

    except
      on E: Exception do
      begin
        ShowMessage('Erro na Requisição PATCH /v1/pagamentos-agendados/pix/:identificadorPagamento/cancelar '#13#10#13#10 + e.Message);
      end;
    end;
  finally

  end;
end;

Procedure ofListSchedulePixPayment;
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

        sResponse := HttpClient.Get( MainOpenFinance.frmOpenFinance.Enviroment + '/pagamentos-agendados/pix?inicio='+ Modal.StartDate +'&fim=' + Modal.EndDate);

        MainOpenFinance.frmOpenFinance.MemoResponse.text := sResponse;

      end;

    except
      on E: Exception do
      begin
        ShowMessage('Erro na Requisição GET /v1/pagamentos-agendados/pix '#13#10#13#10 + e.Message);
      end;
    end;
  finally

  end;
end;

Procedure ofStartSchedulePixPayment;
var
  sResponse: string;
  Modal    : TViewOfCreateScheduleCharge;
begin
  try
    try
      if not Assigned(Modal) then
        Application.CreateForm(TViewOfCreateScheduleCharge, Modal);

      if Modal.ShowModal = 1 then
      begin
        AccessToken := ofConnections.OauthToken;
        HttpClient := ofConnections.SetupClient;

        HttpClient.Request.CustomHeaders.Values['Authorization']      := ('Bearer '+ AccessToken.S['access_token']);
        HttpClient.Request.CustomHeaders.Values['x-idempotency-key']  := Modal.IdemKey;

        JsonToSend := TMemoryStream.Create;
        WriteStringToStream(JsonToSend, Modal.Body, IndyTextEncoding_UTF8);
        JsonToSend.Position := 0;

        sResponse := HttpClient.Post( MainOpenFinance.frmOpenFinance.Enviroment  + '/pagamentos-agendados/pix', JsonToSend);

        MainOpenFinance.frmOpenFinance.MemoResponse.text := sResponse;

      end;

    except
      on E: Exception do
      begin
        ShowMessage('Erro na Requisição POST /v1/pagamentos-agendados/pix '#13#10#13#10 + e.Message);
      end;
    end;
  finally

  end;
end;

Procedure ofDevolutionSchedulePix;
var
  sResponse: string;
  Modal    : TViewOfRefundScheduleCharge;
begin
  try
    try
      if not Assigned(Modal) then
        Application.CreateForm(TViewOfRefundScheduleCharge, Modal);

      if Modal.ShowModal = 1 then
      begin
        AccessToken := ofConnections.OauthToken;
        HttpClient := ofConnections.SetupClient;

        HttpClient.Request.CustomHeaders.Values['Authorization']      := ('Bearer '+ AccessToken.S['access_token']);
        HttpClient.Request.CustomHeaders.Values['x-idempotency-key']  := Modal.IdemKey;

        JsonToSend := TMemoryStream.Create;
        WriteStringToStream(JsonToSend, Modal.Body, IndyTextEncoding_UTF8);
        JsonToSend.Position := 0;

        sResponse := HttpClient.Post( MainOpenFinance.frmOpenFinance.Enviroment  + '/pagamentos-agendados/pix/' + Modal.IDPagamento + '/devolver', JsonToSend);

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

end.
