unit ofBiometricPaymentsEndpoints;

interface
uses
Vcl.Forms, Classes,ofConnections, IdHTTP, XSuperObject, IdGlobal, Vcl.Dialogs, System.SysUtils,
  MainOpenFinance, ViewOfCreateBiometricEnrollment, ViewOfListBiometricEnrollment,
  ViewOfRevokeBiometricEnrollment, ViewOfCreateBiometricCharge, ViewOfList, System.JSON;

procedure ofCreateBiometricEnrollment;
procedure ofListBiometricEnrollment;
procedure ofRevokeBiometricEnrollment;
procedure ofCreateBiometricPixPayment;
procedure ofListBiometricPixPayment;

implementation
 threadvar
  HttpClient: TIdHTTP;
  AccessToken, ObjResult : iSuperObject;
  JsonToSend: TMemoryStream;

Procedure ofCreateBiometricEnrollment;
var
  sResponse: string;
  Modal    : TViewOfCreateBiometricEnrollment;
begin
  try
    try
      if not Assigned(Modal) then
        Application.CreateForm(TViewOfCreateBiometricEnrollment, Modal);

      if Modal.ShowModal = 1 then
      begin
        AccessToken := ofConnections.OauthToken;
        HttpClient := ofConnections.SetupClient;

        HttpClient.Request.CustomHeaders.Values['Authorization']      := ('Bearer '+ AccessToken.S['access_token']);
        HttpClient.Request.CustomHeaders.Values['x-idempotency-key']  := Modal.IdemKey;

        JsonToSend := TMemoryStream.Create;
        WriteStringToStream(JsonToSend, Modal.Body, IndyTextEncoding_UTF8);
        JsonToSend.Position := 0;

        sResponse := HttpClient.Post( MainOpenFinance.frmOpenFinance.Enviroment  + '/pagamentos-biometria/vinculos', JsonToSend);

        MainOpenFinance.frmOpenFinance.MemoResponse.text := sResponse;

      end;

    except
      on E: Exception do
      begin
        ShowMessage('Erro na Requisição POST /v1/pagamentos-biometria/vinculos '#13#10#13#10 + e.Message);
      end;
    end;
  finally

  end;
end;

Procedure ofListBiometricEnrollment;
var
  sResponse: string;
  Modal    : TViewOfListBiometricEnrollment;
begin
  try
    try
      if not Assigned(Modal) then
        Application.CreateForm(TViewOfListBiometricEnrollment, Modal);

      if Modal.ShowModal = 1 then
      begin
        AccessToken := ofConnections.OauthToken;
        HttpClient := ofConnections.SetupClient;

        HttpClient.Request.CustomHeaders.Values['Authorization']      := ('Bearer '+ AccessToken.S['access_token']);

        sResponse := HttpClient.Get( MainOpenFinance.frmOpenFinance.Enviroment + '/pagamentos-biometria/vinculos?cpf=' + Modal.CPF + Modal.CNPJ);

        MainOpenFinance.frmOpenFinance.MemoResponse.text := sResponse;

      end;

    except
      on E: Exception do
      begin
        ShowMessage('Erro na Requisição GET /v1/pagamentos-biometria/vinculos '#13#10#13#10 + e.Message);
      end;
    end;
  finally

  end;
end;

Procedure ofRevokeBiometricEnrollment;
var
  sResponse: string;
  Modal    : TViewOfRevokeBiometricEnrollment;
begin
  try
    try
      if not Assigned(Modal) then
        Application.CreateForm(TViewOfRevokeBiometricEnrollment, Modal);

      if Modal.ShowModal = 1 then
      begin
        AccessToken := ofConnections.OauthToken;
        HttpClient := ofConnections.SetupClient;

        HttpClient.Request.CustomHeaders.Values['Authorization']      := ('Bearer '+ AccessToken.S['access_token']);
        HttpClient.Request.CustomHeaders.Values['x-idempotency-key']  := Modal.IdemKey;

        JsonToSend := TMemoryStream.Create;
        WriteStringToStream(JsonToSend, Modal.Body, IndyTextEncoding_UTF8);
        JsonToSend.Position := 0;

        sResponse := HttpClient.Patch( MainOpenFinance.frmOpenFinance.Enviroment  + '/pagamentos-biometria/vinculos', JsonToSend);

        MainOpenFinance.frmOpenFinance.MemoResponse.text := sResponse;

      end;

    except
      on E: Exception do
      begin
        ShowMessage('Erro na Requisição PATCH /v1/pagamentos-biometria/vinculos '#13#10#13#10 + e.Message);
      end;
    end;
  finally

  end;
end;

Procedure ofCreateBiometricPixPayment;
var
  sResponse: string;
  Modal    : TViewOfCreateBiometricCharge;
begin
  try
    try
      if not Assigned(Modal) then
        Application.CreateForm(TViewOfCreateBiometricCharge, Modal);

      if Modal.ShowModal = 1 then
      begin
        AccessToken := ofConnections.OauthToken;
        HttpClient := ofConnections.SetupClient;

        HttpClient.Request.CustomHeaders.Values['Authorization']      := ('Bearer '+ AccessToken.S['access_token']);
        HttpClient.Request.CustomHeaders.Values['x-idempotency-key']  := Modal.IdemKey;

        JsonToSend := TMemoryStream.Create;
        WriteStringToStream(JsonToSend, Modal.Body, IndyTextEncoding_UTF8);
        JsonToSend.Position := 0;

        sResponse := HttpClient.Post( MainOpenFinance.frmOpenFinance.Enviroment  + '/pagamentos-biometria/pix', JsonToSend);

        MainOpenFinance.frmOpenFinance.MemoResponse.text := sResponse;

      end;

    except
      on E: Exception do
      begin
        ShowMessage('Erro na Requisição POST /v1/pagamentos-biometria/pix '#13#10#13#10 + e.Message);
      end;
    end;
  finally

  end;
end;

Procedure ofListBiometricPixPayment;
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

        sResponse := HttpClient.Get( MainOpenFinance.frmOpenFinance.Enviroment + '/pagamentos-biometria/pix?inicio='+ Modal.StartDate +'&fim=' + Modal.EndDate);

        MainOpenFinance.frmOpenFinance.MemoResponse.text := sResponse;

      end;

    except
      on E: Exception do
      begin
        ShowMessage('Erro na Requisição GET /v1/pagamentos-biometria/pix '#13#10#13#10 + e.Message);
      end;
    end;
  finally

  end;
end;

end.
