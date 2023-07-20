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
  PixEndpoints, AccountEndpoints, KeyPixEndpoints, AuthenticationEndpoints, DueChargesEndpoints, ReportEndpoints, SplitPixEndpoints;

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

//Encapsulando Credenciais
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
