unit ofAutomaticPaymentsEndpoints;

interface
uses
Vcl.Forms, Classes,ofConnections, IdHTTP, XSuperObject, IdGlobal, Vcl.Dialogs, System.SysUtils,
  MainOpenFinance, ViewOfCreateAutomaticEnrollment, ViewOfListAutomaticEnrollment,
  ViewOfUpdateAutomaticEnrollment, ViewOfCreateAutomaticCharge, ViewOfListAutomaticCharge,
  ViewOfRevokeAutomaticCharge, System.JSON;

procedure ofCreateAutomaticEnrollment;
procedure ofListAutomaticEnrollment;
procedure ofUpdateAutomaticEnrollment;
procedure ofCreateAutomaticPixPayment;
procedure ofListAutomaticPixPayment;
procedure ofCancelAutomaticPixPayment;

implementation
 threadvar
  HttpClient: TIdHTTP;
  AccessToken, ObjResult : iSuperObject;
  JsonToSend: TMemoryStream;

Procedure ofCreateAutomaticEnrollment;
var
  sResponse: string;
  Modal    : TViewOfCreateAutomaticEnrollment;
begin
  try
    try
      if not Assigned(Modal) then
        Application.CreateForm(TViewOfCreateAutomaticEnrollment, Modal);

      if Modal.ShowModal = 1 then
      begin
        AccessToken := ofConnections.OauthToken;
        HttpClient := ofConnections.SetupClient;

        HttpClient.Request.CustomHeaders.Values['Authorization']      := ('Bearer '+ AccessToken.S['access_token']);
        HttpClient.Request.CustomHeaders.Values['x-idempotency-key']  := Modal.IdemKey;

        JsonToSend := TMemoryStream.Create;
        WriteStringToStream(JsonToSend, Modal.Body, IndyTextEncoding_UTF8);
        JsonToSend.Position := 0;

        sResponse := HttpClient.Post( MainOpenFinance.frmOpenFinance.Enviroment  + '/pagamentos-automaticos/adesao', JsonToSend);

        MainOpenFinance.frmOpenFinance.MemoResponse.text := sResponse;

      end;

    except
      on E: Exception do
      begin
        ShowMessage('Erro na Requisição POST /v1/pagamentos-automaticos/adesao '#13#10#13#10 + e.Message);
      end;
    end;
  finally

  end;
end;

Procedure ofListAutomaticEnrollment;
var
  sResponse: string;
  Modal    : TViewOfListAutomaticEnrollment;
begin
  try
    try
      if not Assigned(Modal) then
        Application.CreateForm(TViewOfListAutomaticEnrollment, Modal);

      if Modal.ShowModal = 1 then
      begin
        AccessToken := ofConnections.OauthToken;
        HttpClient := ofConnections.SetupClient;

        HttpClient.Request.CustomHeaders.Values['Authorization']      := ('Bearer '+ AccessToken.S['access_token']);

        sResponse := HttpClient.Get( MainOpenFinance.frmOpenFinance.Enviroment + '/pagamentos-automaticos/adesao?inicio=' + Modal.StartDate + '&fim=' + Modal.EndDate + '&status=' + Modal.Status);

        MainOpenFinance.frmOpenFinance.MemoResponse.text := sResponse;

      end;

    except
      on E: Exception do
      begin
        ShowMessage('Erro na Requisição GET /v1/pagamentos-automaticos/adesao '#13#10#13#10 + e.Message);
      end;
    end;
  finally

  end;
end;

Procedure ofUpdateAutomaticEnrollment;
var
  sResponse: string;
  Modal    : TViewOfUpdateAutomaticEnrollment;
begin
  try
    try
      if not Assigned(Modal) then
        Application.CreateForm(TViewOfUpdateAutomaticEnrollment, Modal);

      if Modal.ShowModal = 1 then
      begin
        AccessToken := ofConnections.OauthToken;
        HttpClient := ofConnections.SetupClient;

        HttpClient.Request.CustomHeaders.Values['Authorization']      := ('Bearer '+ AccessToken.S['access_token']);
        HttpClient.Request.CustomHeaders.Values['x-idempotency-key']  := Modal.IdemKey;

        JsonToSend := TMemoryStream.Create;
        WriteStringToStream(JsonToSend, Modal.Body, IndyTextEncoding_UTF8);
        JsonToSend.Position := 0;

        sResponse := HttpClient.Patch( MainOpenFinance.frmOpenFinance.Enviroment  + '/pagamentos-automaticos/adesao', JsonToSend);

        MainOpenFinance.frmOpenFinance.MemoResponse.text := sResponse;

      end;

    except
      on E: Exception do
      begin
        ShowMessage('Erro na Requisição PATCH /v1/pagamentos-automaticos/adesao '#13#10#13#10 + e.Message);
      end;
    end;
  finally

  end;
end;

Procedure ofCreateAutomaticPixPayment;
var
  sResponse: string;
  Modal    : TViewOfCreateAutomaticCharge;
begin
  try
    try
      if not Assigned(Modal) then
        Application.CreateForm(TViewOfCreateAutomaticCharge, Modal);

      if Modal.ShowModal = 1 then
      begin
        AccessToken := ofConnections.OauthToken;
        HttpClient := ofConnections.SetupClient;

        HttpClient.Request.CustomHeaders.Values['Authorization']      := ('Bearer '+ AccessToken.S['access_token']);
        HttpClient.Request.CustomHeaders.Values['x-idempotency-key']  := Modal.IdemKey;

        JsonToSend := TMemoryStream.Create;
        WriteStringToStream(JsonToSend, Modal.Body, IndyTextEncoding_UTF8);
        JsonToSend.Position := 0;

        sResponse := HttpClient.Post( MainOpenFinance.frmOpenFinance.Enviroment  + '/pagamentos-automaticos/pix', JsonToSend);

        MainOpenFinance.frmOpenFinance.MemoResponse.text := sResponse;

      end;

    except
      on E: Exception do
      begin
        ShowMessage('Erro na Requisição POST /v1/pagamentos-automaticos/pix '#13#10#13#10 + e.Message);
      end;
    end;
  finally

  end;
end;

Procedure ofListAutomaticPixPayment;
var
  sResponse: string;
  Modal    : TViewOfListAutomaticCharge;
begin
  try
    try
      if not Assigned(Modal) then
        Application.CreateForm(TViewOfListAutomaticCharge, Modal);

      if Modal.ShowModal = 1 then
      begin
        AccessToken := ofConnections.OauthToken;
        HttpClient := ofConnections.SetupClient;

        HttpClient.Request.CustomHeaders.Values['Authorization']      := ('Bearer '+ AccessToken.S['access_token']);

        sResponse := HttpClient.Get( MainOpenFinance.frmOpenFinance.Enviroment + '/pagamentos-automaticos/pix?identificadorAdesao=' + Modal.IdentificadorAdesao + Modal.E2EID);

        MainOpenFinance.frmOpenFinance.MemoResponse.text := sResponse;

      end;

    except
      on E: Exception do
      begin
        ShowMessage('Erro na Requisição GET /v1/pagamentos-automaticos/pix '#13#10#13#10 + e.Message);
      end;
    end;
  finally

  end;
end;

Procedure ofCancelAutomaticPixPayment;
var
  sResponse: string;
  Modal    : TViewOfRevokeAutomaticCharge;
begin
  try
    try
      if not Assigned(Modal) then
        Application.CreateForm(TViewOfRevokeAutomaticCharge, Modal);

      if Modal.ShowModal = 1 then
      begin
        AccessToken := ofConnections.OauthToken;
        HttpClient := ofConnections.SetupClient;

        HttpClient.Request.CustomHeaders.Values['Authorization']      := ('Bearer '+ AccessToken.S['access_token']);
        HttpClient.Request.CustomHeaders.Values['x-idempotency-key']  := Modal.IdemKey;

        JsonToSend := TMemoryStream.Create;
        WriteStringToStream(JsonToSend, Modal.Body, IndyTextEncoding_UTF8);
        JsonToSend.Position := 0;

        sResponse := HttpClient.Patch( MainOpenFinance.frmOpenFinance.Enviroment  + '/pagamentos-automaticos/pix', JsonToSend);

        MainOpenFinance.frmOpenFinance.MemoResponse.text := sResponse;

      end;

    except
      on E: Exception do
      begin
        ShowMessage('Erro na Requisição PATCH /v1/pagamentos-automaticos/pix '#13#10#13#10 + e.Message);
      end;
    end;
  finally

  end;
end;

end.
