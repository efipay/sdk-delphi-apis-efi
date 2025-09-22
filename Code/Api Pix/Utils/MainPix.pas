unit MainPix;

interface

uses
  Winapi.Windows, Winapi.Messages, System.Variants, System.Classes, System.SysUtils,
  Vcl.StdCtrls, Vcl.Controls, Vcl.ExtCtrls, Vcl.Forms, XSuperObject, Vcl.Dialogs,
  Vcl.Menus;

type
  TMainPix = class(TForm)
    MWebHook: TPanel;
    SWebHook: TPanel;
    pixConfigWebhook: TButton;
    pixListWebhook: TButton;
    MCharges: TPanel;
    SCharges: TPanel;
    pixListCharges: TButton;
    pixCreateImmediateCharge: TButton;
    pixUpdateCharge: TButton;
    MPix: TPanel;
    SPix: TPanel;
    MLoc: TPanel;
    SLoc: TPanel;
    SGetv2Loc_id_QrCode: TButton;
    SGetv2Loc_id: TButton;
    pixListLocation: TButton;
    imgPanel: TPanel;
    QrCodeImg: TImage;
    pixCreateCharge: TButton;
    pixDetailCharge: TButton;
    pixCreateLocation: TButton;
    SDelv2Loc_id_txid: TButton;
    pixGetWebhook: TButton;
    pixDeleteWebhook: TButton;
    pixListReceived: TButton;
    pixSend: TButton;
    pixDetail: TButton;
    pixDevolutionGet: TButton;
    pixDevolution: TButton;
    MKeyPix: TPanel;
    MAccount: TPanel;
    SKeyPix: TPanel;
    SAccount: TPanel;
    MemoResponse: TMemo;
    SGetV2GnConfig: TButton;
    SGetV2GnSaldo: TButton;
    SPutV2GnConfig: TButton;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    txtClientId: TEdit;
    txtClientSecret: TEdit;
    SPostOauthToken: TButton;
    MOAuth: TPanel;
    Label2: TLabel;
    CheckBoxSandbox: TCheckBox;
    Label3: TLabel;
    txtCertFile: TEdit;
    selecionaOpenDialog: TOpenDialog;
    btnCleanQRCode: TButton;
    subMenuCobv: TPanel;
    menuCobv: TButton;
    Button2: TButton;
    pixDetailDueCharge: TButton;
    pixUpdateDueCharge: TButton;
    pixCreateDueCharge: TButton;
    Button1: TButton;
    subMenuExtrato: TPanel;
    createReport: TButton;
    Button3: TButton;
    gnListEvp: TButton;
    gnCreateEvp: TButton;
    gnDeleteEvp: TButton;
    pixSplitConfig: TButton;
    pixSplitConfigId: TButton;
    pixSplitDetailConfig: TButton;
    pixSplitDetailCharges: TButton;
    pixSplitLinkCharges: TButton;
    pixSplitUnlinkCharges: TButton;
    MAutoPix: TPanel;
    SAutoPix: TPanel;
    menuRec: TButton;
    menuSoliRec: TButton;
    menuCobr: TButton;
    menuWebhooks: TButton;
    menuLocations: TButton;
    subMenuRec: TPanel;
    pixDetailRecurrenceAutomatic: TButton;
    pixUpdateRecurrenceAutomatic: TButton;
    pixListRecurrenceAutomatic: TButton;
    pixCreateRecurrenceAutomatic: TButton;
    subMenuSolicRec: TPanel;
    pixCreateRequestRecurrenceAutomatic: TButton;
    pixDetailRequestRecurrenceAutomatic: TButton;
    pixUpdateRequestRecurrenceAutomatic: TButton;
    subMenuCobr: TPanel;
    pixCreateAutomaticChargeTxid: TButton;
    pixUpdateAutomaticCharge: TButton;
    pixDetailAutomaticCharge: TButton;
    pixCreateAutomaticCharge: TButton;
    pixListAutomaticCharge: TButton;
    pixRetryRequestAutomatic: TButton;
    subMenuWebhook: TPanel;
    menuWebRec: TButton;
    menuWebCobr: TButton;
    subMenuWebRec: TPanel;
    pixListWebhookRecurrenceAutomatic: TButton;
    pixDeleteWebhookRecurrenceAutomatic: TButton;
    pixConfigWebhookRecurrenceAutomatic: TButton;
    subMenuWebCobr: TPanel;
    pixListWebhookAutomaticCharge: TButton;
    pixDeleteWebhookAutomaticCharge: TButton;
    pixConfigWebhookAutomaticCharge: TButton;
    subMenuLoc: TPanel;
    pixCreateLocationRecurrenceAutomatic: TButton;
    pixListLocationRecurrenceAutomatic: TButton;
    pixDetailLocationRecurrenceAutomatic: TButton;
    pixUnlinkLocationRecurrenceAutomatic: TButton;
    procedure pixListChargesClick(Sender: TObject);
    procedure pixCreateImmediateChargeClick(Sender: TObject);
    procedure pixUpdateChargeClick(Sender: TObject);
    procedure SPostOauthTokenClick(Sender: TObject);
    procedure SPostOauthTokenMouseLeave(Sender: TObject);
    procedure MWebHookClick(Sender: TObject);
    procedure SWebHookMouseLeave(Sender: TObject);
    procedure MChargesClick(Sender: TObject);
    procedure SChargesMouseLeave(Sender: TObject);
    procedure pixListWebhookClick(Sender: TObject);
    procedure SPixMouseLeave(Sender: TObject);
    procedure pixSendClick(Sender: TObject);
    procedure SLocMouseLeave(Sender: TObject);
    procedure SGetv2Loc_id_QrCodeClick(Sender: TObject);
    procedure MLocClick(Sender: TObject);
    procedure MPixClick(Sender: TObject);
    procedure MAutoPixClick(Sender: TObject);
    procedure SGetv2Loc_idClick(Sender: TObject);
    procedure pixListLocationClick(Sender: TObject);
    procedure pixCreateChargeClick(Sender: TObject);
    procedure pixDetailChargeClick(Sender: TObject);
    procedure pixCreateLocationClick(Sender: TObject);
    procedure SDelv2Loc_id_txidClick(Sender: TObject);
    procedure pixConfigWebhookClick(Sender: TObject);
    procedure pixGetWebhookClick(Sender: TObject);
    procedure pixDeleteWebhookClick(Sender: TObject);
    procedure pixListReceivedClick(Sender: TObject);
    procedure pixDetailClick(Sender: TObject);
    procedure pixDevolutionGetClick(Sender: TObject);
    procedure pixDevolutionClick(Sender: TObject);
    procedure MKeyPixClick(Sender: TObject);
    procedure SKeyPixMouseLeave(Sender: TObject);
    procedure MAccountClick(Sender: TObject);
    procedure SAccountMouseLeave(Sender: TObject);
    procedure SGetV2GnConfigClick(Sender: TObject);
    procedure SGetV2GnSaldoClick(Sender: TObject);
    procedure SPutV2GnConfigClick(Sender: TObject);
    procedure gnListEvpClick(Sender: TObject);
    procedure gnCreateEvpClick(Sender: TObject);
    procedure gnDeleteEvpClick(Sender: TObject);
    procedure txtCertFileDblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnCleanQRCodeClick(Sender: TObject);
    procedure txtCertFileClick(Sender: TObject);
    procedure menuCobvClick(Sender: TObject);
    procedure menuCobvMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure subMenuCobvMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure subMenuCobvMouseLeave(Sender: TObject);
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure pixCreateDueChargeClick(Sender: TObject);
    procedure pixDetailDueChargeClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure pixUpdateDueChargeClick(Sender: TObject);
    procedure menuExtratoMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure createReportClick(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure pixSplitConfigClick(Sender: TObject);
    procedure pixSplitConfigIdClick(Sender: TObject);
    procedure pixSplitDetailConfigClick(Sender: TObject);
    procedure pixSplitLinkChargesClick(Sender: TObject);
    procedure pixSplitUnlinkChargesClick(Sender: TObject);
    procedure pixSplitDetailChargesClick(Sender: TObject);
    procedure menuRecMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure pixDetailRecurrenceAutomaticClick(Sender: TObject);
    procedure pixUpdateRecurrenceAutomaticClick(Sender: TObject);
    procedure pixListRecurrenceAutomaticClick(Sender: TObject);
    procedure pixCreateRecurrenceAutomaticClick(Sender: TObject);
    procedure menuSolicRecMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure pixCreateRequestRecurrenceAutomaticClick(Sender: TObject);
    procedure pixDetailRequestRecurrenceAutomaticClick(Sender: TObject);
    procedure pixUpdateRequestRecurrenceAutomaticClick(Sender: TObject);
    procedure menuCobrMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure pixCreateAutomaticChargeTxidClick(Sender: TObject);
    procedure pixUpdateAutomaticChargeClick(Sender: TObject);
    procedure pixDetailAutomaticChargeClick(Sender: TObject);
    procedure pixCreateAutomaticChargeClick(Sender: TObject);
    procedure pixListAutomaticChargeClick(Sender: TObject);
    procedure pixRetryRequestAutomaticClick(Sender: TObject);
    procedure menuWebhookMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure menuWebRecMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure pixConfigWebhookRecurrenceAutomaticClick(Sender: TObject);
    procedure pixListWebhookRecurrenceAutomaticClick(Sender: TObject);
    procedure pixDeleteWebhookRecurrenceAutomaticClick(Sender: TObject);
    procedure menuWebCobrMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure pixConfigWebhookAutomaticChargeClick(Sender: TObject);
    procedure pixListWebhookAutomaticChargeClick(Sender: TObject);
    procedure pixDeleteWebhookAutomaticChargeClick(Sender: TObject);
    procedure menuLocMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure pixCreateLocationRecurrenceAutomaticClick(Sender: TObject);
    procedure pixListLocationRecurrenceAutomaticClick(Sender: TObject);
    procedure pixDetailLocationRecurrenceAutomaticClick(Sender: TObject);
    procedure pixUnlinkLocationRecurrenceAutomaticClick(Sender: TObject);
  private
    function GetClientID: String;
    function GetClientSecret: String;
    function GetEnviroment: String;
    function GetCertFile: String;
  public
    property ClientID: String read GetClientID;
    property ClientSecret: String read GetClientSecret;
    property Enviroment : String read GetEnviroment;
    property CertFilePem : String read GetCertFile;
    procedure CleanQrCodeImage;
  end;

var
  frmPix : TMainPix;

implementation

{$R *.dfm}

uses
  Connections, IdHTTP, ChargesEndpoints, LocEndpoints, WebhookEndpoints,
  PixEndpoints, AccountEndpoints, KeyPixEndpoints, AuthenticationEndpoints, DueChargesEndpoints, ReportEndpoints, SplitPixEndpoints, AutomaticPixEndpoints;

procedure TMainPix.MKeyPixClick(Sender: TObject);
begin
  SKeyPix.Visible := not SKeyPix.Visible;
end;

procedure TMainPix.MChargesClick(Sender: TObject);
begin
  SCharges.Visible := not SCharges.Visible;
end;

procedure TMainPix.menuCobvClick(Sender: TObject);
begin
  subMenuCobv.Visible := True;
end;

procedure TMainPix.menuCobvMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
     subMenuCobv.Visible := True;
end;

procedure TMainPix.menuExtratoMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
      subMenuExtrato.Visible := True;
end;

procedure TMainPix.MAccountClick(Sender: TObject);
begin
  SAccount.Visible := not SAccount.Visible;
end;

procedure TMainPix.MLocClick(Sender: TObject);
begin
  SLoc.Visible := not SLoc.Visible;
end;

procedure TMainPix.MPixClick(Sender: TObject);
begin
  SPix.Visible := not SPix.Visible;
end;

procedure TMainPix.MAutoPixClick(Sender: TObject);
begin
  SAutoPix.Visible := not SAutoPix.Visible;
end;

procedure TMainPix.menuRecMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
      subMenuRec.Visible := True;
      subMenuSolicRec.Visible := False;
      subMenuCobr.Visible := False;
      subMenuWebhook.Visible := False;
      subMenuWebRec.Visible := False;
      subMenuWebCobr.Visible := False;
      subMenuLoc.Visible := False;
end;

procedure TMainPix.menuSolicRecMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
      subMenuSolicRec.Visible := True;
      subMenuRec.Visible := False;
      subMenuCobr.Visible := False;
      subMenuWebhook.Visible := False;
      subMenuWebRec.Visible := False;
      subMenuWebCobr.Visible := False;
      subMenuLoc.Visible := False;
end;

procedure TMainPix.menuCobrMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
      subMenuCobr.Visible := True;
      subMenuRec.Visible := False;
      subMenuSolicRec.Visible := False;
      subMenuWebhook.Visible := False;
      subMenuWebRec.Visible := False;
      subMenuWebCobr.Visible := False;
      subMenuLoc.Visible := False;
end;

procedure TMainPix.menuWebhookMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
      subMenuWebhook.Visible := True;
      subMenuCobr.Visible := False;
      subMenuRec.Visible := False;
      subMenuSolicRec.Visible := False;
      subMenuLoc.Visible := False;
end;

procedure TMainPix.menuWebRecMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
      subMenuWebRec.Visible := True;
      subMenuWebCobr.Visible := False;
end;

procedure TMainPix.menuWebCobrMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
      subMenuWebRec.Visible := False;
      subMenuWebCobr.Visible := True;
end;

procedure TMainPix.menuLocMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
      subMenuLoc.Visible := True;
      subMenuWebRec.Visible := False;
      subMenuWebCobr.Visible := False;
      subMenuWebhook.Visible := False;
      subMenuCobr.Visible := False;
      subMenuRec.Visible := False;
      subMenuSolicRec.Visible := False;
end;

procedure TMainPix.MWebHookClick(Sender: TObject);
begin
  SWebHook.Visible := not SWebHook.Visible;
end;

procedure TMainPix.SPostOauthTokenMouseLeave(Sender: TObject);
begin
  SPostOauthToken.Visible := False;
end;

procedure TMainPix.SKeyPixMouseLeave(Sender: TObject);
begin
  SKeyPix.Visible := False;
end;

procedure TMainPix.SChargesMouseLeave(Sender: TObject);
begin
  SCharges.Visible := False;
end;

procedure TMainPix.SAccountMouseLeave(Sender: TObject);
begin
  SAccount.Visible := False;
end;

procedure TMainPix.SWebHookMouseLeave(Sender: TObject);
begin
  SWebHook.Visible := False;
end;

procedure TMainPix.txtCertFileClick(Sender: TObject);
begin
  txtCertFile.Text := GetCertFile;
end;

procedure TMainPix.txtCertFileDblClick(Sender: TObject);
begin
  txtCertFile.Text := GetCertFile;
end;

procedure TMainPix.SPixMouseLeave(Sender: TObject);
begin
  SPix.Visible := False;
end;

procedure TMainPix.SLocMouseLeave(Sender: TObject);
begin
  SLoc.Visible := False;
end;

///EndPoints OAuth
procedure TMainPix.SPostOauthTokenClick(Sender: TObject);
begin
  AuthenticationEndpoints.OauthToken;
end;

///Endpoints Cobranças
procedure TMainPix.pixListChargesClick(Sender: TObject);
begin
  ChargesEndpoints.PixListCharges;
end;

procedure TMainPix.pixDetailChargeClick(Sender: TObject);
begin
  ChargesEndpoints.PixDetailCharge;
end;

procedure TMainPix.pixCreateChargeClick(Sender: TObject);
begin
  ChargesEndpoints.PixCreateCharge;
end;

procedure TMainPix.pixCreateDueChargeClick(Sender: TObject);
begin
  DueChargesEndpoints.pixCreateDueCharge;
end;

procedure TMainPix.pixUpdateChargeClick(Sender: TObject);
begin
  ChargesEndpoints.PixUpdateCharge;
end;

procedure TMainPix.pixUpdateDueChargeClick(Sender: TObject);
begin
  DueChargesEndpoints.pixUpdateDueCharge;
end;

procedure TMainPix.pixCreateImmediateChargeClick(Sender: TObject);
begin
  ChargesEndpoints.PixCreateImmediateCharge;
end;

///EndPoints Conta
procedure TMainPix.SGetV2GnConfigClick(Sender: TObject);
begin
  AccountEndpoints.GNDetailSettings;
end;

procedure TMainPix.SGetV2GnSaldoClick(Sender: TObject);
begin
  AccountEndpoints.GnDetailBalance;
end;

procedure TMainPix.SPutV2GnConfigClick(Sender: TObject);
begin
  AccountEndpoints.GnUpdateSettings;
end;

procedure TMainPix.subMenuCobvMouseLeave(Sender: TObject);
begin
  subMenuCobv.Visible := False;
end;

procedure TMainPix.subMenuCobvMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  SCharges.Visible := True;
end;

//// Endpoints ChavePix
procedure TMainPix.gnListEvpClick(Sender: TObject);
begin
  KeyPixEndpoints.GnListEvp;
end;

procedure TMainPix.gnCreateEvpClick(Sender: TObject);
begin
  KeyPixEndpoints.GnCreateEvp;
end;

procedure TMainPix.gnDeleteEvpClick(Sender: TObject);
begin
  KeyPixEndpoints.GnDeleteEvp;
end;

///Endpoints Pix
procedure TMainPix.pixListReceivedClick(Sender: TObject);
begin
  PixEndpoints.PixListReceived;
end;

procedure TMainPix.pixDetailClick(Sender: TObject);
begin
  PixEndpoints.PixDetail;
end;

procedure TMainPix.pixDevolutionGetClick(Sender: TObject);
begin
  PixEndpoints.PixDevolutionGet;
end;

procedure TMainPix.pixDevolutionClick(Sender: TObject);
begin
  PixEndpoints.PixDevolution;
end;

procedure TMainPix.pixSendClick(Sender: TObject);
begin
  PixEndpoints.PixSend;
end;

procedure TMainPix.pixSplitConfigClick(Sender: TObject);
begin
  SplitPixEndpoints.pixSplitConfig;
end;

procedure TMainPix.pixSplitConfigIdClick(Sender: TObject);
begin
  SplitPixEndpoints.pixSplitConfigId;
end;

procedure TMainPix.pixSplitDetailChargesClick(Sender: TObject);
begin
  SplitPixEndpoints.pixSplitDetailCharges;
end;

procedure TMainPix.pixSplitDetailConfigClick(Sender: TObject);
begin
    SplitPixEndpoints.pixSplitDetailConfig;
end;

procedure TMainPix.pixSplitLinkChargesClick(Sender: TObject);
begin
  SplitPixEndpoints.pixSplitLinkCharges;
end;

procedure TMainPix.pixSplitUnlinkChargesClick(Sender: TObject);
begin
    SplitPixEndpoints.pixSplitUnlinkCharges;
end;

///Endpoints Webhook
procedure TMainPix.pixListWebhookClick(Sender: TObject);
begin
  WebhookEndpoints.PixListWebhook;
end;

procedure TMainPix.pixGetWebhookClick(Sender: TObject);
begin
  WebhookEndpoints.PixGetWebhook;
end;

procedure TMainPix.pixConfigWebhookClick(Sender: TObject);
begin
  WebhookEndpoints.PixConfigWebhook;
end;

procedure TMainPix.pixDeleteWebhookClick(Sender: TObject);
begin
  WebhookEndpoints.PixDeleteWebhook;
end;

///Endpoints Loc
procedure TMainPix.pixListLocationClick(Sender: TObject);
begin
  LocEndpoints.PixListLocation;
end;

procedure TMainPix.SGetv2Loc_idClick(Sender: TObject);
begin
  LocEndpoints.PixDetailLocation;
end;

procedure TMainPix.SGetv2Loc_id_QrCodeClick(Sender: TObject);
begin
  LocEndpoints.PixGenerateQRCode;
end;

procedure TMainPix.pixCreateLocationClick(Sender: TObject);
begin
  LocEndpoints.PixCreateLocation;
end;

procedure TMainPix.SDelv2Loc_id_txidClick(Sender: TObject);
begin
  LocEndpoints.PixUnsetTxid;
end;

/// Endpoints Pix Automático

/// Recorrências

procedure TMainPix.pixDetailRecurrenceAutomaticClick(Sender: TObject);
begin
  AutomaticPixEndpoints.pixDetailRecurrenceAutomatic;
end;

procedure TMainPix.pixUpdateRecurrenceAutomaticClick(Sender: TObject);
begin
  AutomaticPixEndpoints.pixUpdateRecurrenceAutomatic;
end;

procedure TMainPix.pixListRecurrenceAutomaticClick(Sender: TObject);
begin
  AutomaticPixEndpoints.pixListRecurrenceAutomatic;
end;

procedure TMainPix.pixCreateRecurrenceAutomaticClick(Sender: TObject);
begin
  AutomaticPixEndpoints.pixCreateRecurrenceAutomatic;
end;

/// Solicitação Recorrência

procedure TMainPix.pixCreateRequestRecurrenceAutomaticClick(Sender: TObject);
begin
  AutomaticPixEndpoints.pixCreateRequestRecurrenceAutomatic;
end;

procedure TMainPix.pixDetailRequestRecurrenceAutomaticClick(Sender: TObject);
begin
  AutomaticPixEndpoints.pixDetailRequestRecurrenceAutomatic;
end;

procedure TMainPix.pixUpdateRequestRecurrenceAutomaticClick(Sender: TObject);
begin
  AutomaticPixEndpoints.pixUpdateRequestRecurrenceAutomatic;
end;

/// Cobranças Recorrentes

procedure TMainPix.pixCreateAutomaticChargeTxidClick(Sender: TObject);
begin
  AutomaticPixEndpoints.pixCreateAutomaticChargeTxid;
end;

procedure TMainPix.pixUpdateAutomaticChargeClick(Sender: TObject);
begin
  AutomaticPixEndpoints.pixUpdateAutomaticCharge;
end;

procedure TMainPix.pixDetailAutomaticChargeClick(Sender: TObject);
begin
  AutomaticPixEndpoints.pixDetailAutomaticCharge;
end;

procedure TMainPix.pixCreateAutomaticChargeClick(Sender: TObject);
begin
  AutomaticPixEndpoints.pixCreateAutomaticCharge;
end;

procedure TMainPix.pixListAutomaticChargeClick(Sender: TObject);
begin
  AutomaticPixEndpoints.pixListAutomaticCharge;
end;

procedure TMainPix.pixRetryRequestAutomaticClick(Sender: TObject);
begin
  AutomaticPixEndpoints.pixRetryRequestAutomatic;
end;

/// Webhook - Recorrência

procedure TMainPix.pixConfigWebhookRecurrenceAutomaticClick(Sender: TObject);
begin
  WebhookEndpoints.pixConfigWebhookRecurrenceAutomatic;
end;

procedure TMainPix.pixListWebhookRecurrenceAutomaticClick(Sender: TObject);
begin
  WebhookEndpoints.pixListWebhookRecurrenceAutomatic;
end;

procedure TMainPix.pixDeleteWebhookRecurrenceAutomaticClick(Sender: TObject);
begin
  WebhookEndpoints.pixDeleteWebhookRecurrenceAutomatic;
end;

/// Webhook - Cobranças Recorrentes

procedure TMainPix.pixConfigWebhookAutomaticChargeClick(Sender: TObject);
begin
  WebhookEndpoints.pixConfigWebhookAutomaticCharge;
end;

procedure TMainPix.pixListWebhookAutomaticChargeClick(Sender: TObject);
begin
  WebhookEndpoints.pixListWebhookAutomaticCharge;
end;

procedure TMainPix.pixDeleteWebhookAutomaticChargeClick(Sender: TObject);
begin
  WebhookEndpoints.pixDeleteWebhookAutomaticCharge;
end;

/// Payload Locations

procedure TMainPix.pixCreateLocationRecurrenceAutomaticClick(Sender: TObject);
begin
  LocEndpoints.pixCreateLocationRecurrenceAutomatic;
end;

procedure TMainPix.pixListLocationRecurrenceAutomaticClick(Sender: TObject);
begin
  LocEndpoints.pixListLocationRecurrenceAutomatic;
end;

procedure TMainPix.pixDetailLocationRecurrenceAutomaticClick(Sender: TObject);
begin
  LocEndpoints.pixDetailLocationRecurrenceAutomatic;
end;

procedure TMainPix.pixUnlinkLocationRecurrenceAutomaticClick(Sender: TObject);
begin
  LocEndpoints.pixUnlinkLocationRecurrenceAutomatic;
end;

/// Encapsulando Credenciais
function TMainPix.GetClientSecret: String;
begin
  Result := txtClientSecret.Text;
end;

function TMainPix.GetClientID: String;
begin
  Result := txtClientID.Text;
end;

function TMainPix.GetEnviroment: String;
begin
  if CheckBoxSandbox.Checked then
    Result := 'https://pix-h.api.efipay.com.br'
  else
    Result := 'https://pix.api.efipay.com.br';
end;

procedure TMainPix.btnCleanQRCodeClick(Sender: TObject);
begin
  CleanQrCodeImage;
end;

procedure TMainPix.pixDetailDueChargeClick(Sender: TObject);
begin
      DueChargesEndpoints.pixDetailDueCharge;
end;

procedure TMainPix.Button2Click(Sender: TObject);
begin
      DueChargesEndpoints.pixListDueCharges;
end;

procedure TMainPix.Button3Click(Sender: TObject);
begin
      ReportEndpoints.detailReport;
end;

procedure TMainPix.CleanQrCodeImage;
begin
  QrCodeImg.Picture := nil;
end;

procedure TMainPix.createReportClick(Sender: TObject);
begin
    ReportEndpoints.createReport;
end;

procedure TMainPix.FormCreate(Sender: TObject);
begin
  frmPix.Position := poScreenCenter;
  MemoResponse.Text := '';
end;

procedure TMainPix.FormMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  subMenuCobv.Visible := False;
  subMenuExtrato.Visible := False;
  subMenuRec.Visible := False;
  subMenuSolicRec.Visible := False;
  subMenuCobr.Visible := False;
  subMenuWebhook.Visible := False;
  subMenuWebRec.Visible := False;
  subMenuWebCobr.Visible := False;
  subMenuLoc.Visible := False;
end;

function TMainPix.GetCertFile: String;
begin
  if not FileExists(txtCertFile.Text) then
  begin
    selecionaOpenDialog.Execute;
    txtCertFile.Text := selecionaOpenDialog.FileName;
  end;

  Result := txtCertFile.Text;

end;

end.
