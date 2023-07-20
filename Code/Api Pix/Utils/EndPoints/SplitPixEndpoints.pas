unit SplitPixEndpoints;

interface
uses
  Vcl.Forms, Connections, IdHTTP, XSuperObject, IdGlobal, Vcl.Dialogs, System.SysUtils,
  MainPix, System.JSON, System.Classes, ViewPixSplitConfig,
   ViewPixSplitConfigId, ViewPixSplitDetailConfig, ViewPixSplitLinkCharges, ViewPixSplitDetailCharges, ViewPixSplitUnlinkCharge;

procedure pixSplitConfig;
procedure pixSplitConfigId;
procedure pixSplitDetailConfig;
procedure pixSplitLinkCharges;
procedure pixSplitDetailCharges;
procedure pixSplitUnlinkCharges;

implementation
threadvar
  HttpClient: TIdHTTP;
  AccessToken, ObjResult : iSuperObject;
  JsonToSend: TMemoryStream;

procedure pixSplitConfig;
var
  sResponse: string;
  Modal    : TPixSplitConfig;
begin
  try
    try
      if not Assigned(Modal) then
        Application.CreateForm(TPixSplitConfig, Modal);

      if Modal.ShowModal = 1 then
      begin
        AccessToken := Connections.OauthToken;
        HttpClient := Connections.SetupClient;

        HttpClient.Request.CustomHeaders.Values['Authorization'] := ('Bearer '+ AccessToken.S['access_token']);

        JsonToSend := TMemoryStream.Create;
        WriteStringToStream(JsonToSend, Modal.Body, IndyTextEncoding_UTF8);
        JsonToSend.Position := 0;

        sResponse := HttpClient.Post( MainPix.frmPix.Enviroment  + '/v2/gn/split/config', JsonToSend);

        MainPix.frmPix.MemoResponse.text := sResponse;

      end;

    except
      on E: Exception do
      begin
        ShowMessage('Erro na Requisição POST /v2/gn/split/config '#13#10#13#10 + e.Message);
      end;
    end;
  finally

  end;
end;

procedure pixSplitConfigId;
var
  sResponse: string;
  Modal    : TPixSplitConfigId;
begin
  try
    try
      if not Assigned(Modal) then
        Application.CreateForm(TPixSplitConfigId, Modal);

      if Modal.ShowModal = 1 then
      begin
        AccessToken := Connections.OauthToken;
        HttpClient := Connections.SetupClient;

        HttpClient.Request.CustomHeaders.Values['Authorization'] := ('Bearer '+ AccessToken.S['access_token']);

        JsonToSend := TMemoryStream.Create;
        WriteStringToStream(JsonToSend, Modal.Body, IndyTextEncoding_UTF8);
        JsonToSend.Position := 0;

        sResponse := HttpClient.Put( MainPix.frmPix.Enviroment  + '/v2/gn/split/config/' + Modal.txtId.Text, JsonToSend);

        MainPix.frmPix.MemoResponse.text := sResponse;

      end;

    except
      on E: Exception do
      begin
        ShowMessage('Erro na Requisição Put /v2/gn/split/config/:Id '#13#10#13#10 + e.Message);
      end;
    end;
  finally

  end;
end;

procedure  pixSplitDetailConfig;
var
  sResponse: string;
  Modal    : TPixSplitDetailConfig;
begin
  try
    try
      if not Assigned(Modal) then
        Application.CreateForm(TPixSplitDetailConfig, Modal);

      if Modal.ShowModal = 1 then
      begin
        AccessToken := Connections.OauthToken;
        HttpClient := Connections.SetupClient;

        HttpClient.Request.CustomHeaders.Values['Authorization'] := ('Bearer '+ AccessToken.S['access_token']);


        sResponse := HttpClient.Get( MainPix.frmPix.Enviroment  + '/v2/gn/split/config/' + Modal.txtId.Text);

        MainPix.frmPix.MemoResponse.text := sResponse;

      end;

    except
      on E: Exception do
      begin
        ShowMessage('Erro na Requisição Put /v2/gn/split/config/:Id '#13#10#13#10 + e.Message);
      end;
    end;
  finally

  end;
end;

procedure pixSplitLinkCharges;
var
   sResponse: string;
   Modal    : TPixSplitLinkCharges;
begin
  try
    try
      if not Assigned(Modal) then
        Application.CreateForm(TPixSplitLinkCharges, Modal);

      if Modal.ShowModal = 1 then
      begin
        AccessToken := Connections.OauthToken;
        HttpClient := Connections.SetupClient;

        HttpClient.Request.CustomHeaders.Values['Authorization'] := ('Bearer '+ AccessToken.S['access_token']);

      

        sResponse := HttpClient.Put(MainPix.frmPix.Enviroment  + '/v2/gn/split/'+ Modal.TipoCob+'/'+Modal.txtTxid.Text+'/vinculo/'+Modal.txtId.Text, TMemoryStream.Create);

        MainPix.frmPix.MemoResponse.text := 'Sucesso';

      end;

    except
      on E: Exception do
      begin
        ShowMessage('Erro na Requisição Put /v2/gn/split/:txid/vinculo/:splitConfigId '#13#10#13#10 + e.Message);
      end;
    end;
  finally

  end;
end;

procedure pixSplitDetailCharges;
var
  sResponse: string;
  Modal    : TPixSplitDetailCharges;
begin
  try
    try
      if not Assigned(Modal) then
        Application.CreateForm(TPixSplitDetailCharges, Modal);

      if Modal.ShowModal = 1 then
      begin
        AccessToken := Connections.OauthToken;
        HttpClient := Connections.SetupClient;

        HttpClient.Request.CustomHeaders.Values['Authorization'] := ('Bearer '+ AccessToken.S['access_token']);


        sResponse := HttpClient.Get( MainPix.frmPix.Enviroment  + '/v2/gn/split/'+Modal.TipoCob+'/'+Modal.txtTxid.Text);

        MainPix.frmPix.MemoResponse.text := sResponse;

      end;

    except
      on E: Exception do
      begin
        ShowMessage('Erro na Requisição Get /v2/gn/split/'+Modal.TipoCob+'/:txid '#13#10#13#10 + e.Message);
      end;
    end;
  finally

  end;
end;

procedure pixSplitUnlinkCharges;
var
  sResponse: string;
  Modal    : TPixSplitUnlinkCharge;
begin
  try
    try
      if not Assigned(Modal) then
        Application.CreateForm(TPixSplitUnlinkCharge, Modal);

      if Modal.ShowModal = 1 then
      begin
        AccessToken := Connections.OauthToken;
        HttpClient := Connections.SetupClient;

        HttpClient.Request.CustomHeaders.Values['Authorization'] := ('Bearer '+ AccessToken.S['access_token']);
        sResponse := HttpClient.Delete(MainPix.frmPix.Enviroment + '/v2/gn/split/'+Modal.TipoCob+'/'+Modal.txtTxid.Text+'/vinculo');

        MainPix.frmPix.MemoResponse.text := 'Sucesso';
      end;

    except
      on E: Exception do
      begin
        ShowMessage('Erro na requisição DELETE /v2/gn/split/cob/:txid/vinculo '#13#10#13#10 + e.Message);
      end;
    end;
  finally
  end;
end;

end.
