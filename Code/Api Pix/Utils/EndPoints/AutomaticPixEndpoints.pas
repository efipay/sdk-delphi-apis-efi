unit AutomaticPixEndpoints;

interface

uses
  Vcl.Forms, Classes, Connections, IdHTTP, XSuperObject, IdGlobal, Vcl.Dialogs, System.SysUtils,
  MainPix, ViewPixList, ViewPixDetail, System.JSON,
  ViewPixIdRecDetail, ViewPixCreateRecurrence, ViewPixUpdateRecurrence, ViewPixCreateRequestRecurrence, ViewPixIdSolicRecDetail,
  ViewPixUpdateRequestRecurrence, ViewPixCreateAutomaticChargeTxid, ViewPixCreateAutomaticCharge,
  ViewPixUpdateAutomaticCharge, ViewPixRetryAutomaticCharge;

procedure pixCreateRecurrenceAutomatic;
procedure pixDetailRecurrenceAutomatic;
procedure pixUpdateRecurrenceAutomatic;
procedure pixListRecurrenceAutomatic;

procedure pixCreateRequestRecurrenceAutomatic;
procedure pixDetailRequestRecurrenceAutomatic;
procedure pixUpdateRequestRecurrenceAutomatic;

procedure pixCreateAutomaticCharge;
procedure pixCreateAutomaticChargeTxid;
procedure pixUpdateAutomaticCharge;
procedure pixDetailAutomaticCharge;
procedure pixListAutomaticCharge;
procedure pixRetryRequestAutomatic;

implementation

threadvar
  HttpClient: TIdHTTP;
  AccessToken, ObjResult : iSuperObject;
  JsonToSend: TMemoryStream;

/// Recorrências
procedure pixCreateRecurrenceAutomatic;
var
  sResponse: String;
  Modal    : TViewPixCreateRecurrence;
begin
  try
    try
      if not Assigned(Modal) then
        Application.CreateForm(TViewPixCreateRecurrence, Modal);

      if Modal.ShowModal = 1 then
      begin
        AccessToken := Connections.OauthToken;
        HttpClient := Connections.SetupClient;

        HttpClient.Request.CustomHeaders.Values['Authorization'] := ('Bearer '+ AccessToken.S['access_token']);

        JsonToSend := TMemoryStream.Create;
        WriteStringToStream(JsonToSend, Modal.Body, IndyTextEncoding_UTF8);
        JsonToSend.Position := 0;

        sResponse := HttpClient.Post( MainPix.frmPix.Enviroment +'/v2/rec', JsonToSend);

        MainPix.frmPix.MemoResponse.text := sresponse;

      end;
    except
      on E: Exception do
      begin
        ShowMessage('Erro na Requisição POST /v2/rec '#13#10#13#10 + e.Message);
      end;
    end;
  finally
    Modal.ClearRequestfields;
  end;
end;

procedure pixDetailRecurrenceAutomatic;
var
  sResponse: string;
  Modal    : TViewPixIdRecDetail;
begin
  try
    try
      if not Assigned(Modal) then
        Application.CreateForm(TViewPixIdRecDetail, Modal);

      if Modal.ShowModal = 1 then
      begin
        AccessToken := Connections.OauthToken;
        HttpClient := Connections.SetupClient;

        HttpClient.Request.CustomHeaders.Values['Authorization'] := ('Bearer '+ AccessToken.S['access_token']);

        sResponse := HttpClient.Get(MainPix.frmPix.Enviroment + '/v2/rec/' + Modal.Identifier + Modal.QueryParam);

        MainPix.frmPix.MemoResponse.text := sresponse;
      end;

    except
      on E: Exception do
      begin
        ShowMessage('Erro na Requisição GET /v2/rec/:idRec '#13#10#13#10 + e.Message);
      end;
    end;
  finally
    Modal.ClearRequestfields;
  end;
end;

procedure pixUpdateRecurrenceAutomatic;
var
  sResponse: string;
  Modal : TViewPixUpdateRecurrence;
begin
  try
    try

      if not Assigned(Modal) then
        Application.CreateForm(TViewPixUpdateRecurrence, Modal);

      if Modal.ShowModal = 1 then
      begin
        AccessToken := Connections.OauthToken;
        HttpClient := Connections.SetupClient;

        HttpClient.Request.CustomHeaders.Values['Authorization'] := ('Bearer '+ AccessToken.S['access_token']);

        JsonToSend := TMemoryStream.Create;
        WriteStringToStream(JsonToSend, Modal.Body, IndyTextEncoding_UTF8);
        JsonToSend.Position := 0;

        sResponse := HttpClient.Patch( MainPix.frmPix.Enviroment +'/v2/rec/'+ Modal.Identifier, JsonToSend);

        MainPix.frmPix.MemoResponse.text := sresponse;

      end;

    except
      on E: Exception do
      begin
        ShowMessage('Erro na Requisição PACTH /v2/rec/:idRec '#13#10#13#10 + e.Message);
        end;
    end;
  finally
    Modal.ClearRequestfields;
  end;
end;

procedure pixListRecurrenceAutomatic;
var
  sResponse: string;
  Modal    : TViewList;
begin
  try
    try

      if not Assigned(Modal) then
        Application.CreateForm(TViewList, Modal);

      if Modal.ShowModal = 1 then
      begin

        AccessToken := Connections.OauthToken;
        HttpClient := Connections.SetupClient;

        HttpClient.Request.CustomHeaders.Values['Authorization'] := ('Bearer '+ AccessToken.S['access_token']);
        sResponse := HttpClient.Get(MainPix.frmPix.Enviroment + '/v2/rec?inicio='+ Modal.StartDate +
                                   '&fim=' + Modal.EndDate );

        MainPix.frmPix.MemoResponse.text := sresponse;

      end;
    except
      on E: Exception do
      begin
        ShowMessage('Erro na Requisição GET /v2/rec '#13#10#13#10 + e.Message);
      end;
    end;
  finally
    Modal.ClearRequestfields;
  end;
end;

/// Solicitações de Recorrências
procedure pixCreateRequestRecurrenceAutomatic;
var
  sResponse: String;
  Modal    : TViewPixCreateRequestRecurrence;
begin
  try
    try
      if not Assigned(Modal) then
        Application.CreateForm(TViewPixCreateRequestRecurrence, Modal);

      if Modal.ShowModal = 1 then
      begin
        AccessToken := Connections.OauthToken;
        HttpClient := Connections.SetupClient;

        HttpClient.Request.CustomHeaders.Values['Authorization'] := ('Bearer '+ AccessToken.S['access_token']);

        JsonToSend := TMemoryStream.Create;
        WriteStringToStream(JsonToSend, Modal.Body, IndyTextEncoding_UTF8);
        JsonToSend.Position := 0;

        sResponse := HttpClient.Post( MainPix.frmPix.Enviroment +'/v2/solicrec', JsonToSend);

        MainPix.frmPix.MemoResponse.text := sresponse;

      end;
    except
      on E: Exception do
      begin
        ShowMessage('Erro na Requisição POST /v2/solicrec '#13#10#13#10 + e.Message);
      end;
    end;
  finally
    Modal.ClearRequestfields;
  end;
end;

procedure pixDetailRequestRecurrenceAutomatic;
var
  sResponse: string;
  Modal    : TViewPixIdSolicRecDetail;
begin
  try
    try
      if not Assigned(Modal) then
        Application.CreateForm(TViewPixIdSolicRecDetail, Modal);

      if Modal.ShowModal = 1 then
      begin
        AccessToken := Connections.OauthToken;
        HttpClient := Connections.SetupClient;

        HttpClient.Request.CustomHeaders.Values['Authorization'] := ('Bearer '+ AccessToken.S['access_token']);

        sResponse := HttpClient.Get(MainPix.frmPix.Enviroment + '/v2/solicrec/' + Modal.Identifier);

        MainPix.frmPix.MemoResponse.text := sresponse;
      end;

    except
      on E: Exception do
      begin
        ShowMessage('Erro na Requisição GET /v2/solicrec/:idSolicRec '#13#10#13#10 + e.Message);
      end;
    end;
  finally
    Modal.ClearRequestfields;
  end;
end;

procedure pixUpdateRequestRecurrenceAutomatic;
var
  sResponse: string;
  Modal : TViewPixUpdateRequestRecurrence;
begin
  try
    try

      if not Assigned(Modal) then
        Application.CreateForm(TViewPixUpdateRequestRecurrence, Modal);

      if Modal.ShowModal = 1 then
      begin
        AccessToken := Connections.OauthToken;
        HttpClient := Connections.SetupClient;

        HttpClient.Request.CustomHeaders.Values['Authorization'] := ('Bearer '+ AccessToken.S['access_token']);

        JsonToSend := TMemoryStream.Create;
        WriteStringToStream(JsonToSend, Modal.Body, IndyTextEncoding_UTF8);
        JsonToSend.Position := 0;

        sResponse := HttpClient.Patch( MainPix.frmPix.Enviroment +'/v2/solicrec/'+ Modal.Identifier, JsonToSend);

        MainPix.frmPix.MemoResponse.text := sresponse;

      end;

    except
      on E: Exception do
      begin
        ShowMessage('Erro na Requisição PATCH /v2/solicrec/:idSolicRec '#13#10#13#10 + e.Message);
        end;
    end;
  finally
    Modal.ClearRequestfields;
  end;
end;

/// Cobranças Recorrentes
procedure pixCreateAutomaticCharge;
var
  sResponse: String;
  Modal    : TViewPixCreateAutomaticCharge;
begin
  try
    try
      if not Assigned(Modal) then
        Application.CreateForm(TViewPixCreateAutomaticCharge, Modal);

      if Modal.ShowModal = 1 then
      begin
        AccessToken := Connections.OauthToken;
        HttpClient := Connections.SetupClient;

        HttpClient.Request.CustomHeaders.Values['Authorization'] := ('Bearer '+ AccessToken.S['access_token']);

        JsonToSend := TMemoryStream.Create;
        WriteStringToStream(JsonToSend, Modal.Body, IndyTextEncoding_UTF8);
        JsonToSend.Position := 0;

        sResponse := HttpClient.Post( MainPix.frmPix.Enviroment +'/v2/cobr', JsonToSend);

        MainPix.frmPix.MemoResponse.text := sresponse;

      end;
    except
      on E: Exception do
      begin
        ShowMessage('Erro na Requisição POST /v2/cobr '#13#10#13#10 + e.Message);
      end;
    end;
  finally
    Modal.ClearRequestfields;
  end;
end;

procedure pixCreateAutomaticChargeTxid;
var
  sResponse: string;
  Modal : TViewPixCreateAutomaticChargeTxid;
begin
  try
    try

      if not Assigned(Modal) then
        Application.CreateForm(TViewPixCreateAutomaticChargeTxid, Modal);

      if Modal.ShowModal = 1 then
      begin
        AccessToken := Connections.OauthToken;
        HttpClient := Connections.SetupClient;

        HttpClient.Request.CustomHeaders.Values['Authorization'] := ('Bearer '+ AccessToken.S['access_token']);

        JsonToSend := TMemoryStream.Create;
        WriteStringToStream(JsonToSend, Modal.Body, IndyTextEncoding_UTF8);
        JsonToSend.Position := 0;

        sResponse := HttpClient.Put(MainPix.frmPix.Enviroment +'/v2/cobr/'+ Modal.Identifier, JsonToSend);

        MainPix.frmPix.MemoResponse.text := sresponse;

      end;

    except
      on E: Exception do
      begin
        ShowMessage('Erro na Requisição PUT /v2/cobr/:txid '#13#10#13#10 + e.Message);
        end;
    end;
  finally
    Modal.ClearRequestfields;
  end;
end;

procedure pixUpdateAutomaticCharge;
var
  sResponse: string;
  Modal : TViewPixUpdateAutomaticCharge;
begin
  try
    try

      if not Assigned(Modal) then
        Application.CreateForm(TViewPixUpdateAutomaticCharge, Modal);

      if Modal.ShowModal = 1 then
      begin
        AccessToken := Connections.OauthToken;
        HttpClient := Connections.SetupClient;

        HttpClient.Request.CustomHeaders.Values['Authorization'] := ('Bearer '+ AccessToken.S['access_token']);

        JsonToSend := TMemoryStream.Create;
        WriteStringToStream(JsonToSend, Modal.Body, IndyTextEncoding_UTF8);
        JsonToSend.Position := 0;

        sResponse := HttpClient.Patch( MainPix.frmPix.Enviroment +'/v2/cobr/'+ Modal.Identifier, JsonToSend);

        MainPix.frmPix.MemoResponse.text := sresponse;

      end;

    except
      on E: Exception do
      begin
        ShowMessage('Erro na Requisição PATCH /v2/cobr/:txid '#13#10#13#10 + e.Message);
        end;
    end;
  finally
    Modal.ClearRequestfields;
  end;
end;

procedure pixDetailAutomaticCharge;
var
  sResponse: string;
  Modal    : TViewDetail;
begin
  try
    try
      if not Assigned(Modal) then
        Application.CreateForm(TViewDetail, Modal);

      if Modal.ShowModal = 1 then
      begin
        AccessToken := Connections.OauthToken;
        HttpClient := Connections.SetupClient;

        HttpClient.Request.CustomHeaders.Values['Authorization'] := ('Bearer '+ AccessToken.S['access_token']);

        sResponse := HttpClient.Get(MainPix.frmPix.Enviroment + '/v2/cobr/' + Modal.Identifier);

        MainPix.frmPix.MemoResponse.text := sresponse;
      end;

    except
      on E: Exception do
      begin
        ShowMessage('Erro na Requisição GET /v2/cobr/:txid '#13#10#13#10 + e.Message);
      end;
    end;
  finally
    Modal.ClearRequestfields;
  end;
end;

procedure pixListAutomaticCharge;
var
  sResponse: string;
  Modal    : TViewList;
begin
  try
    try

      if not Assigned(Modal) then
        Application.CreateForm(TViewList, Modal);

      if Modal.ShowModal = 1 then
      begin

        AccessToken := Connections.OauthToken;
        HttpClient := Connections.SetupClient;

        HttpClient.Request.CustomHeaders.Values['Authorization'] := ('Bearer '+ AccessToken.S['access_token']);
        sResponse := HttpClient.Get(MainPix.frmPix.Enviroment + '/v2/cobr?inicio='+ Modal.StartDate +
                                   '&fim=' + Modal.EndDate );

        MainPix.frmPix.MemoResponse.text := sresponse;

      end;
    except
      on E: Exception do
      begin
        ShowMessage('Erro na Requisição GET /v2/cobr '#13#10#13#10 + e.Message);
      end;
    end;
  finally
    Modal.ClearRequestfields;
  end;
end;

procedure pixRetryRequestAutomatic;
var
  sResponse: String;
  Modal    : TViewPixRetryAutomaticCharge;
begin
  try
    try
      if not Assigned(Modal) then
        Application.CreateForm(TViewPixRetryAutomaticCharge, Modal);

      if Modal.ShowModal = 1 then
      begin
        AccessToken := Connections.OauthToken;
        HttpClient := Connections.SetupClient;

        HttpClient.Request.CustomHeaders.Values['Authorization'] := ('Bearer '+ AccessToken.S['access_token']);

        JsonToSend := TMemoryStream.Create;
        WriteStringToStream(JsonToSend, '{}', IndyTextEncoding_UTF8);
        JsonToSend.Position := 0;

        sResponse := HttpClient.Post(MainPix.frmPix.Enviroment + '/v2/cobr/' + Modal.Identifier + '/retentativa/' + Modal.Date, JsonToSend);

        MainPix.frmPix.MemoResponse.text := sresponse;

      end;
    except
      on E: Exception do
      begin
        ShowMessage('Erro na Requisição POST /v2/cobr/:txid/retentativa/:data '#13#10#13#10 + e.Message);
      end;
    end;
  finally
    Modal.ClearRequestfields;
  end;
end;

end.
