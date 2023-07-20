unit DueChargesEndpoints;

interface
uses
  Vcl.Forms, Classes, Connections, IdHTTP, XSuperObject, IdGlobal, Vcl.Dialogs, System.SysUtils,
  MainPix, System.JSON, ViewPixCreateDueCharge, ViewPixDetailDueCharge, ViewPixListDueCharges, ViewPixUpdateDueCharge;

procedure pixCreateDueCharge;
procedure pixDetailDueCharge;
procedure pixListDueCharges;
procedure pixUpdateDueCharge;

implementation
threadvar
  HttpClient: TIdHTTP;
  AccessToken, ObjResult : iSuperObject;
  JsonToSend: TMemoryStream;
procedure pixCreateDueCharge;
var
  sResponse: string;
  Modal    : TCreateDueCharge;
begin
  try
    try
      if not Assigned(Modal) then
        Application.CreateForm(TCreateDueCharge, Modal);

      if Modal.ShowModal = 1 then
      begin
        AccessToken := Connections.OauthToken;
        HttpClient := Connections.SetupClient;

        HttpClient.Request.CustomHeaders.Values['Authorization'] := ('Bearer '+ AccessToken.S['access_token']);

        JsonToSend := TMemoryStream.Create;
        WriteStringToStream(JsonToSend, Modal.Body, IndyTextEncoding_UTF8);
        JsonToSend.Position := 0;

        sResponse := HttpClient.Put( MainPix.frmPix.Enviroment  + '/v2/cobv/' + Modal.txtTXID.text, JsonToSend);

        MainPix.frmPix.MemoResponse.text := sresponse;

      end;

    except
      on E: Exception do
      begin
        ShowMessage('Erro na Requisição PUT /v2/cobv/ '#13#10#13#10 + e.Message);
      end;
    end;
  finally
    Modal.ClearRequestfields;
  end;
end;
procedure pixDetailDueCharge;
var
  sResponse: string;
  Modal    : TDetailDueCharge;
begin
  try
      try
        if not Assigned(Modal) then
          Application.CreateForm(TDetailDueCharge, Modal);

        if Modal.ShowModal = 1 then
        begin
          AccessToken := Connections.OauthToken;
          HttpClient := Connections.SetupClient;

          HttpClient.Request.CustomHeaders.Values['Authorization'] := ('Bearer '+ AccessToken.S['access_token']);

          sResponse := HttpClient.Get(MainPix.frmPix.Enviroment + '/v2/cobv/' + Modal.Filters );

          MainPix.frmPix.MemoResponse.text := sresponse;

        end;

      except
        on E: Exception do
        begin
          ShowMessage('Erro na Requisição GET /v2/cobv/:txid '#13#10#13#10 + e.Message);
        end;
      end;
    finally
     Modal.ClearRequestfields;
  end;
end;
procedure pixListDueCharges;
var
  sResponse: string;
  Modal    : TPixListDueCharges;
begin
  try
      try
        if not Assigned(Modal) then
          Application.CreateForm(TPixListDueCharges, Modal);

        if Modal.ShowModal = 1 then
        begin
          AccessToken := Connections.OauthToken;
          HttpClient := Connections.SetupClient;

          HttpClient.Request.CustomHeaders.Values['Authorization'] := ('Bearer '+ AccessToken.S['access_token']);

          sResponse := HttpClient.Get(MainPix.frmPix.Enviroment + '/v2/cobv' + Modal.Filters);

          MainPix.frmPix.MemoResponse.text := sresponse;

        end;

      except
        on E: Exception do
        begin
          ShowMessage('Erro na Requisição GET /v2/cobv '#13#10#13#10 + e.Message);
        end;
      end;
    finally
     Modal.ClearRequestfields;
  end;
end;
procedure pixUpdateDueCharge;
var
  sResponse: string;
  Modal    : TPixUpdateDueCharge;
begin
  try
    try
      if not Assigned(Modal) then
        Application.CreateForm(TPixUpdateDueCharge, Modal);

      if Modal.ShowModal = 1 then
      begin
        AccessToken := Connections.OauthToken;
        HttpClient := Connections.SetupClient;

        HttpClient.Request.CustomHeaders.Values['Authorization'] := ('Bearer '+ AccessToken.S['access_token']);

        JsonToSend := TMemoryStream.Create;
        WriteStringToStream(JsonToSend, Modal.Body, IndyTextEncoding_UTF8);
        JsonToSend.Position := 0;

        sResponse := HttpClient.Patch( MainPix.frmPix.Enviroment  + '/v2/cobv/' + Modal.txtTXID.text, JsonToSend);

        MainPix.frmPix.MemoResponse.text := sresponse;

      end;

    except
      on E: Exception do
      begin
        ShowMessage('Erro na Requisição PATCH /v2/cobv/ '#13#10#13#10 + e.Message);
      end;
    end;
  finally
    Modal.ClearRequestfields;
  end;
end;
end.
