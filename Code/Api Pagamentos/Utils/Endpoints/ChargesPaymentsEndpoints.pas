unit ChargesPaymentsEndpoints;

interface
uses
Vcl.Forms, Classes,pConnections, IdHTTP, XSuperObject, IdGlobal, Vcl.Dialogs, System.SysUtils,
  MainPayments,ViewPaymentsDetailBarcode,ViewPaymentsDetailPayment,ViewPaymentsList,ViewPaymentsPay, System.JSON;

procedure payDetailBarCode;
procedure payRequestBarCode;
procedure payDetailPayment;
procedure payListPayments;

implementation
threadvar
  HttpClient: TIdHTTP;
  AccessToken, ObjResult : iSuperObject;
  JsonToSend: TMemoryStream;

procedure  payDetailBarCode;
var
  sResponse: string;
  Modal: TViewDetailBarcode;
begin
       try
         try
           if not Assigned(Modal) then
           Application.CreateForm(TViewDetailBarcode, Modal);
           if Modal.ShowModal = 1 then
            begin

              AccessToken := pConnections.OauthToken;
              HttpClient := pConnections.SetupClient;

              HttpClient.Request.CustomHeaders.Values['Authorization'] := ('Bearer '+ AccessToken.S['access_token']);
              sResponse := HttpClient.Get(MainPayments.fmrPayments.Enviroment + '/codBarras/'+ Modal.txtBarcode.Text );

              MainPayments.fmrPayments.MemoResponse.text := sresponse;

            end;
            except
              on E: Exception do
              begin
                ShowMessage('Erro na Requisição GET /pagamento/codBarras '#13#10#13#10 + e.Message);
              end;
         end;
       finally
        Modal.ClearRequestfields;
       end;
end;
procedure payRequestBarCode;

var
    sResponse: string;
  Modal: TViewPaymentBarcode;
begin
    try
         try
           if not Assigned(Modal) then
           Application.CreateForm(TViewPaymentBarcode, Modal);
             if Modal.ShowModal = 1 then
            begin

              AccessToken := pConnections.OauthToken;
              HttpClient := pConnections.SetupClient;

              HttpClient.Request.CustomHeaders.Values['Authorization'] := ('Bearer '+ AccessToken.S['access_token']);

              JsonToSend := TMemoryStream.Create;
              WriteStringToStream(JsonToSend, Modal.Body, IndyTextEncoding_UTF8);
              JsonToSend.Position := 0;
              sResponse := HttpClient.Post(MainPayments.fmrPayments.Enviroment + '/codBarras/'+ Modal.txtBarcode.Text,JsonToSend );

              MainPayments.fmrPayments.MemoResponse.text := sresponse;

            end;
            except
              on E: Exception do
              begin
                ShowMessage('Erro na Requisição POST /pagamento/codBarras '#13#10#13#10 + e.Message);
              end;
         end;
       finally
        Modal.ClearRequestfields;
       end;
end;
procedure payDetailPayment;
var
  sResponse: string;
  Modal: TViewDetailPayment;
begin
     try
         try
           if not Assigned(Modal) then
           Application.CreateForm(TViewDetailPayment, Modal);
           if Modal.ShowModal = 1 then
            begin

              AccessToken := pConnections.OauthToken;
              HttpClient := pConnections.SetupClient;

              HttpClient.Request.CustomHeaders.Values['Authorization'] := ('Bearer '+ AccessToken.S['access_token']);
              sResponse := HttpClient.Get(MainPayments.fmrPayments.Enviroment + '/'+ Modal.txtIdPayment.Text );

              MainPayments.fmrPayments.MemoResponse.text := sresponse;

            end;
            except
              on E: Exception do
              begin
                ShowMessage('Erro na Requisição GET /pagamento/codBarras '#13#10#13#10 + e.Message);
              end;
         end;
       finally
        Modal.ClearRequestfields;
       end;
end;
procedure payListPayments;
var
  sResponse: string;
  Modal: TviewListPayments;
begin
       try
         try
           if not Assigned(Modal) then
            Application.CreateForm(TviewListPayments, Modal);
           if Modal.ShowModal = 1 then
            begin

              AccessToken := pConnections.OauthToken;
              HttpClient := pConnections.SetupClient;

              HttpClient.Request.CustomHeaders.Values['Authorization'] := ('Bearer '+ AccessToken.S['access_token']);
              sResponse := HttpClient.Get(MainPayments.fmrPayments.Enviroment + '/resumo/?dataInicio='+ Modal.txtDetailInitDate.Text + '&dataFim=' + Modal.txtDetailEndDate.Text );

              MainPayments.fmrPayments.MemoResponse.text := sresponse;

            end;
            except
              on E: Exception do
              begin
                ShowMessage('Erro na Requisição GET /pagamento/codBarras '#13#10#13#10 + e.Message);
              end;
         end;
       finally
         Modal.ClearRequestfields;
       end;
end;
end.
