unit ReportEndpoints;

interface
uses
  Vcl.Forms, Connections, IdHTTP, XSuperObject, IdGlobal, Vcl.Dialogs, System.SysUtils,
  MainPix, System.JSON, ViewPixCreateReport, ViewPixDetailReport, System.Classes;

procedure createReport;
procedure detailReport;

implementation
threadvar
  HttpClient: TIdHTTP;
  AccessToken, ObjResult : iSuperObject;
  JsonToSend: TMemoryStream;


procedure createReport;
var
  sResponse: string;
  Modal    : TPixCreateReport ;
begin
  try
      try
        if not Assigned(Modal) then
          Application.CreateForm(TPixCreateReport, Modal);

        if Modal.ShowModal = 1 then
        begin
          AccessToken := Connections.OauthToken;
          HttpClient := Connections.SetupClient;

          HttpClient.Request.CustomHeaders.Values['Authorization'] := ('Bearer '+ AccessToken.S['access_token']);
          JsonToSend := TMemoryStream.Create;
          WriteStringToStream(JsonToSend, Modal.Body, IndyTextEncoding_UTF8);
          JsonToSend.Position := 0;

          sResponse := HttpClient.Post(MainPix.frmPix.Enviroment + '/v2/gn/relatorios/extrato-conciliacao', JsonToSend);

          MainPix.frmPix.MemoResponse.text := sresponse;

        end;

      except
        on E: Exception do
        begin
          ShowMessage('Erro na Requisição POST /v2/gn/relatorios/extrato-conciliacao'#13#10#13#10 + e.Message);
        end;
      end;
    finally
     Modal.ClearRequestfields;
  end;
end;
procedure detailReport;
var
  sResponse: string;
  Modal    : TPixDetailReport;
begin
  try
      try
        if not Assigned(Modal) then
          Application.CreateForm(TPixDetailReport, Modal);

        if Modal.ShowModal = 1 then
        begin
          AccessToken := Connections.OauthToken;
          HttpClient := Connections.SetupClient;

          HttpClient.Request.CustomHeaders.Values['Authorization'] := ('Bearer '+ AccessToken.S['access_token']);

         sResponse := HttpClient.Get(MainPix.frmPix.Enviroment+'/v2/gn/relatorios/'+Modal.txtId.Text);

          MainPix.frmPix.MemoResponse.text := sresponse;

        end;

      except
        on E: Exception do
        begin
          ShowMessage('Erro na Requisição GET /v2/gn/relatorios/:id'#13#10#13#10 + e.Message);
        end;
      end;
    finally
      Modal.ClearRequestfields;
  end;
end;
end.
