program ApisEFI;

uses
  Forms,
  DelphiZXIngQRCode in 'Code\External\DelphiZXIngQRCode.pas',
  XSuperJSON in 'Code\External\XSuperJSON.pas',
  XSuperObject in 'Code\External\XSuperObject.pas',
  AccountEndpoints in 'Code\Api Pix\Utils\EndPoints\AccountEndpoints.pas',
  AuthenticationEndpoints in 'Code\Api Pix\Utils\EndPoints\AuthenticationEndpoints.pas',
  ChargesEndpoints in 'Code\Api Pix\Utils\EndPoints\ChargesEndpoints.pas',
  Connections in 'Code\Api Pix\Utils\EndPoints\Connections.pas',
  KeyPixEndpoints in 'Code\Api Pix\Utils\EndPoints\KeyPixEndpoints.pas',
  LocEndpoints in 'Code\Api Pix\Utils\EndPoints\LocEndpoints.pas',
  PixEndpoints in 'Code\Api Pix\Utils\EndPoints\PixEndpoints.pas',
  WebhookEndpoints in 'Code\Api Pix\Utils\EndPoints\WebhookEndpoints.pas',
  BodyAccountClass in 'Code\Api Pix\Utils\Classes\BodyAccountClass.pas',
  BodyChargesClass in 'Code\Api Pix\Utils\Classes\BodyChargesClass.pas',
  BodyPixClass in 'Code\Api Pix\Utils\Classes\BodyPixClass.pas',
  BodyWebhookClass in 'Code\Api Pix\Utils\Classes\BodyWebhookClass.pas',
  uChargeClasses in 'Code\Api Boletos\Utils\Classes\uChargeClasses.pas',
  uCommonTypes in 'Code\Api Boletos\Utils\Classes\uCommonTypes.pas',
  uConnections in 'Code\Api Boletos\Utils\Classes\uConnections.pas',
  uAuthenticationEndpoints in 'Code\Api Boletos\Utils\Endpoints\uAuthenticationEndpoints.pas',
  uChargesEndpoints in 'Code\Api Boletos\Utils\Endpoints\uChargesEndpoints.pas',
  MainCode in 'Code\MainCode.pas' {MainCode},
  MainEmissions in 'Code\Api Boletos\Utils\MainEmissions.pas' {MainEmissions: Users\luiz.campos\OneDrive - Gerencianet S.A\Documentos\Embarcadero\Studio\Projects\gn-api-sdk-delphi-pix\Code\Api Boletos\Utils\MainEmissions.pas},
  MainPix in 'Code\Api Pix\Utils\MainPix.pas' {MainPix},
  uBaseCustomerTransactionClasses in 'Code\Api Boletos\Utils\Classes\uBaseCustomerTransactionClasses.pas',
  uCustomerClasses in 'Code\Api Boletos\Utils\Classes\uCustomerClasses.pas',
  uPaymentClasses in 'Code\Api Boletos\Utils\Classes\uPaymentClasses.pas',
  uCarnetClasses in 'Code\Api Boletos\Utils\Classes\uCarnetClasses.pas',
  uCarnetEndpoints in 'Code\Api Boletos\Utils\Endpoints\uCarnetEndpoints.pas',
  uPlansEndpoints in 'Code\Api Boletos\Utils\Endpoints\uPlansEndpoints.pas',
  uPaymentTokenClasses in 'Code\Api Boletos\Utils\Classes\uPaymentTokenClasses.pas',
  PrivateKey in 'Code\External\PrivateKey.pas',
  Rsa in 'Code\External\Rsa.pas',
  uOthersEndpoints in 'Code\Api Boletos\Utils\Endpoints\uOthersEndpoints.pas',
  ViewCreateCharge in 'Code\Api Boletos\Utils\Views\Charges\ViewCreateCharge.pas' {ViewCreateCharge},
  ViewCreateLinkCharge in 'Code\Api Boletos\Utils\Views\Charges\ViewCreateLinkCharge.pas' {ViewCreateLinkCharge},
  ViewCreateChargeHistory in 'Code\Api Boletos\Utils\Views\Charges\ViewCreateChargeHistory.pas' {ViewCreateChargeHistory},
  ViewDetailBillet in 'Code\Api Boletos\Utils\Views\Charges\ViewDetailBillet.pas' {ViewDetailBillet},
  ViewUpdateMetadataCharge in 'Code\Api Boletos\Utils\Views\Charges\ViewUpdateMetadataCharge.pas' {ViewUpdateMetadataCharge},
  ViewPayChargeBillet in 'Code\Api Boletos\Utils\Views\Charges\ViewPayChargeBillet.pas' {ViewPayChargeBillet},
  ViewPayCreditCard in 'Code\Api Boletos\Utils\Views\Charges\ViewPayCreditCard.pas' {ViewPayCreditCard},
  ViewUpdateLinkCharge in 'Code\Api Boletos\Utils\Views\Charges\ViewUpdateLinkCharge.pas' {ViewUpdateLinkCharge},
  ViewResendBillet in 'Code\Api Boletos\Utils\Views\Charges\ViewResendBillet.pas' {ViewResendBillet},
  ViewPixAccountConfig in 'Code\Api Pix\Utils\Views\ViewPixAccountConfig.pas' {ViewAccountConfig},
  ViewPixConfigWebhook in 'Code\Api Pix\Utils\Views\ViewPixConfigWebhook.pas' {ViewConfigWebhook},
  ViewPixCreateCharge in 'Code\Api Pix\Utils\Views\ViewPixCreateCharge.pas' {ViewPixCreateCharge},
  ViewPixCreateImmediateCharge in 'Code\Api Pix\Utils\Views\ViewPixCreateImmediateCharge.pas' {ViewCreateImmediateCharge},
  ViewPixDetail in 'Code\Api Pix\Utils\Views\ViewPixDetail.pas' {ViewDetail},
  ViewPixDetailDevolution in 'Code\Api Pix\Utils\Views\ViewPixDetailDevolution.pas' {ViewPixDetailDevolution},
  ViewPixDevolution in 'Code\Api Pix\Utils\Views\ViewPixDevolution.pas' {ViewPixDevolution},
  ViewPixList in 'Code\Api Pix\Utils\Views\ViewPixList.pas' {ViewList},
  ViewPixSend in 'Code\Api Pix\Utils\Views\ViewPixSend.pas' {ViewPixSend},
  ViewPixUpdateCharge in 'Code\Api Pix\Utils\Views\ViewPixUpdateCharge.pas' {ViewUpdateCharge},
  ViewCancelParcel in 'Code\Api Boletos\Utils\Views\Carnet\ViewCancelParcel.pas' {ViewCancelParcel},
  ViewCreateCarnet in 'Code\Api Boletos\Utils\Views\Carnet\ViewCreateCarnet.pas' {ViewCreateCarnet},
  ViewDetailCarnet in 'Code\Api Boletos\Utils\Views\Carnet\ViewDetailCarnet.pas' {ViewDetailCarnet},
  ViewUpdateParcel in 'Code\Api Boletos\Utils\Views\Carnet\ViewUpdateParcel.pas' {ViewUpdateParcel},
  ViewUpdateMetadataCarnet in 'Code\Api Boletos\Utils\Views\Carnet\ViewUpdateMetadataCarnet.pas' {ViewUpdateMetadataCarnet},
  ViewResendParcel in 'Code\Api Boletos\Utils\Views\Carnet\ViewResendParcel.pas' {ViewResendParcel},
  ViewResendCarnet in 'Code\Api Boletos\Utils\Views\Carnet\ViewResendCarnet.pas' {ViewResendCarnet},
  ViewCreateCarnetHistory in 'Code\Api Boletos\Utils\Views\Carnet\ViewCreateCarnetHistory.pas' {ViewCreateCarnetHistory},
  ViewSettleCarnetParcel in 'Code\Api Boletos\Utils\Views\Carnet\ViewSettleCarnetParcel.pas' {ViewSettleCarnetParcel},
  ViewCreatePlan in 'Code\Api Boletos\Utils\Views\Plans\ViewCreatePlan.pas' {ViewCreatePlan},
  ViewGetPlan in 'Code\Api Boletos\Utils\Views\Plans\ViewGetPlan.pas' {ViewGetPlan},
  ViewUpdatePlan in 'Code\Api Boletos\Utils\Views\Plans\ViewUpdatePlan.pas' {ViewUpdatePlan},
  ViewCreateSubscription in 'Code\Api Boletos\Utils\Views\Plans\ViewCreateSubscription.pas' {ViewCreateSubscription},
  ViewCreatePlanHistory in 'Code\Api Boletos\Utils\Views\Plans\ViewCreatePlanHistory.pas' {ViewCreatePlanHistory},
  ViewDetailPlan in 'Code\Api Boletos\Utils\Views\Plans\ViewDetailPlan.pas' {ViewDetailPlan},
  ViewUpdateMetadataPlan in 'Code\Api Boletos\Utils\Views\Plans\ViewUpdateMetadataPlan.pas' {ViewUpdateMetadataPlan},
  ViewDetailOthers in 'Code\Api Boletos\Utils\Views\Others\ViewDetailOthers.pas' {ViewDetailOthers},
  ViewPayPlan in 'Code\Api Boletos\Utils\Views\Plans\ViewPayPlan.pas' {ViewPayPlan},
  ViewPayPlanCreditCard in 'Code\Api Boletos\Utils\Views\Plans\ViewPayPlanCreditCard.pas' {ViewPayPlanCreditCard},
  ViewPixIdDetail in 'Code\Api Pix\Utils\Views\ViewPixIdDetail.pas' {ViewPixIdDetail},
  ViewPixKeyDetail in 'Code\Api Pix\Utils\Views\ViewPixKeyDetail.pas' {ViewPixKeyDetail},
  ViewPixE2eidDetail in 'Code\Api Pix\Utils\Views\ViewPixE2eidDetail.pas' {ViewPixE2eidDetail},
  ViewPayChargeBilletOneStep in 'Code\Api Boletos\Utils\Views\Charges\ViewPayChargeBilletOneStep.pas' {ViewPayChargeBilletOneStep},
  ViewPayCreditCardOneStep in 'Code\Api Boletos\Utils\Views\Charges\ViewPayCreditCardOneStep.pas' {ViewPayCreditCardOneStep},
  MainPayments in 'Code\Api Pagamentos\Utils\MainPayments.pas' {MainPayment},
  pConnections in 'Code\Api Pagamentos\Utils\Classes\pConnections.pas',
  BasicAuthentication in 'Code\Api Pagamentos\Utils\Classes\BasicAuthentication.pas',
  ViewPaymentsDetailBarcode in 'Code\Api Pagamentos\Utils\Views\ViewPaymentsDetailBarcode.pas' {TViewDetailBarcode},
  ViewPaymentsDetailPayment in 'Code\Api Pagamentos\Utils\Views\ViewPaymentsDetailPayment.pas' {Form2},
  ViewPaymentsList in 'Code\Api Pagamentos\Utils\Views\ViewPaymentsList.pas' {Form3},
  ViewPaymentsPay in 'Code\Api Pagamentos\Utils\Views\ViewPaymentsPay.pas' {ViewPaymentBarcode},
  ChargesPaymentsEndpoints in 'Code\Api Pagamentos\Utils\Endpoints\ChargesPaymentsEndpoints.pas',
  BodyChargesPaymentsClass in 'Code\Api Pagamentos\Utils\Classes\BodyChargesPaymentsClass.pas',
  ViewPixCreateDueCharge in 'Code\Api Pix\Utils\Views\ViewPixCreateDueCharge.pas' {CreateDueCharge},
  ViewPixDetailDueCharge in 'Code\Api Pix\Utils\Views\ViewPixDetailDueCharge.pas' {DetailDueCharge},
  BodyDueChargeClass in 'Code\Api Pix\Utils\Classes\BodyDueChargeClass.pas',
  DueChargesEndpoints in 'Code\Api Pix\Utils\EndPoints\DueChargesEndpoints.pas',
  ViewPixListDueCharges in 'Code\Api Pix\Utils\Views\ViewPixListDueCharges.pas' {PixListDueCharges},
  ViewPixUpdateDueCharge in 'Code\Api Pix\Utils\Views\ViewPixUpdateDueCharge.pas' {PixUpdateDueCharge},
  ViewPixCreateReport in 'Code\Api Pix\Utils\Views\ViewPixCreateReport.pas' {PixCreateReport},
  ReportEndpoints in 'Code\Api Pix\Utils\EndPoints\ReportEndpoints.pas',
  BodyReportClass in 'Code\Api Pix\Utils\Classes\BodyReportClass.pas',
  ViewPixDetailReport in 'Code\Api Pix\Utils\Views\ViewPixDetailReport.pas' {PixDetailReport},
  ViewPixSplitConfig in 'Code\Api Pix\Utils\Views\ViewPixSplitConfig.pas' {PixSplitConfig},
  ViewPixSplitConfigId in 'Code\Api Pix\Utils\Views\ViewPixSplitConfigId.pas' {PixSplitConfigId},
  ViewPixSplitDetailConfig in 'Code\Api Pix\Utils\Views\ViewPixSplitDetailConfig.pas' {PixSplitDetailConfig},
  SplitPixEndpoints in 'Code\Api Pix\Utils\EndPoints\SplitPixEndpoints.pas',
  BodySplitPixClass in 'Code\Api Pix\Utils\Classes\BodySplitPixClass.pas',
  ViewPixSplitLinkCharges in 'Code\Api Pix\Utils\Views\ViewPixSplitLinkCharges.pas' {PixSplitLinkCharges},
  ViewPixSplitDetailCharges in 'Code\Api Pix\Utils\Views\ViewPixSplitDetailCharges.pas' {PixSplitDetailCharges},
  ViewPixSplitUnlinkCharge in 'Code\Api Pix\Utils\Views\ViewPixSplitUnlinkCharge.pas' {PixSplitUnlinkCharge},
  MainOpenFinance in 'Code\Api Open Finance\Utils\MainOpenFinance.pas' {frmOpenFinance},
  ofConnections in 'Code\Api Open Finance\Utils\Endpoints\ofConnections.pas',
  ofAuthenticationEndpoint in 'Code\Api Open Finance\Utils\Endpoints\ofAuthenticationEndpoint.pas',
  ofConfigEndpoints in 'Code\Api Open Finance\Utils\Endpoints\ofConfigEndpoints.pas',
  ViewOfConfigUpdate in 'Code\Api Open Finance\Utils\Views\ViewOfConfigUpdate.pas' {OfConfigUpdate},
  BodyOfConfigUpdate in 'Code\Api Open Finance\Utils\Classes\BodyOfConfigUpdate.pas',
  ViewOfListParticipants in 'Code\Api Open Finance\Utils\Views\ViewOfListParticipants.pas' {OfListParticipants},
  ofParticipantsEndpoints in 'Code\Api Open Finance\Utils\Endpoints\ofParticipantsEndpoints.pas',
  BodyOFImmediateClass in 'Code\Api Open Finance\Utils\Classes\BodyOFImmediateClass.pas',
  ofImmediatePaymentsEndpoints in 'Code\Api Open Finance\Utils\Endpoints\ofImmediatePaymentsEndpoints.pas',
  BodyOfDevolutionPix in 'Code\Api Open Finance\Utils\Classes\BodyOfDevolutionPix.pas',
  MainAberturaContas in 'Code\Api Abertura de Contas\Utils\MainAberturaContas.pas' {frmAberturaDeContas},
  ViewCreateAccount in 'Code\Api Abertura de Contas\Utils\Views\ViewCreateAccount.pas' {CreateAccount},
  acConnections in 'Code\Api Abertura de Contas\Utils\Endpoints\acConnections.pas',
  acAuthenticationEndpoint in 'Code\Api Abertura de Contas\Utils\Endpoints\acAuthenticationEndpoint.pas',
  BodyCreateAccount in 'Code\Api Abertura de Contas\Utils\Classes\BodyCreateAccount.pas',
  acCreateAccountEndpoints in 'Code\Api Abertura de Contas\Utils\Endpoints\acCreateAccountEndpoints.pas',
  ViewGetAccountCredentials in 'Code\Api Abertura de Contas\Utils\Views\ViewGetAccountCredentials.pas' {GetAccountCredentials},
  ViewGetAccountCertificate in 'Code\Api Abertura de Contas\Utils\Views\ViewGetAccountCertificate.pas' {GetAccountCertificate},
  BodyWebhook in 'Code\Api Abertura de Contas\Utils\Classes\BodyWebhook.pas',
  ViewAccountConfigWebhook in 'Code\Api Abertura de Contas\Utils\Views\ViewAccountConfigWebhook.pas' {AccountConfigWebhook},
  ViewAccountDetailWebhook in 'Code\Api Abertura de Contas\Utils\Views\ViewAccountDetailWebhook.pas' {AccountDetailWebhook},
  ViewAccountDeleteWebhook in 'Code\Api Abertura de Contas\Utils\Views\ViewAccountDeleteWebhook.pas' {AccountDeleteWebhook},
  ViewAccountListWebhook in 'Code\Api Abertura de Contas\Utils\Views\ViewAccountListWebhook.pas' {AccountListWebhook},
  AutomaticPixEndpoints in 'Code\Api Pix\Utils\EndPoints\AutomaticPixEndpoints.pas',
  ViewPixIdRecDetail in 'Code\Api Pix\Utils\Views\ViewPixIdRecDetail.pas' {ViewPixIdRecDetail},
  BodyRecurrenceClass in 'Code\Api Pix\Utils\Classes\BodyRecurrenceClass.pas',
  ViewPixCreateRecurrence in 'Code\Api Pix\Utils\Views\ViewPixCreateRecurrence.pas' {ViewPixCreateRecurrence},
  ViewPixUpdateRecurrence in 'Code\Api Pix\Utils\Views\ViewPixUpdateRecurrence.pas' {ViewPixUpdateRecurrence},
  BodyRequestRecurrenceClass in 'Code\Api Pix\Utils\Classes\BodyRequestRecurrenceClass.pas',
  ViewPixCreateRequestRecurrence in 'Code\Api Pix\Utils\Views\ViewPixCreateRequestRecurrence.pas' {ViewPixCreateRequestRecurrence},
  ViewPixIdSolicRecDetail in 'Code\Api Pix\Utils\Views\ViewPixIdSolicRecDetail.pas' {ViewPixIdSolicRecDetail},
  ViewPixUpdateRequestRecurrence in 'Code\Api Pix\Utils\Views\ViewPixUpdateRequestRecurrence.pas' {ViewPixUpdateRequestRecurrence},
  BodyAutomaticChargeClass in 'Code\Api Pix\Utils\Classes\BodyAutomaticChargeClass.pas',
  ViewPixCreateAutomaticChargeTxid in 'Code\Api Pix\Utils\Views\ViewPixCreateAutomaticChargeTxid.pas' {ViewPixCreateAutomaticChargeTxid},
  ViewPixCreateAutomaticCharge in 'Code\Api Pix\Utils\Views\ViewPixCreateAutomaticCharge.pas' {ViewPixCreateAutomaticCharge},
  ViewPixUpdateAutomaticCharge in 'Code\Api Pix\Utils\Views\ViewPixUpdateAutomaticCharge.pas' {ViewPixUpdateAutomaticCharge},
  ViewPixRetryAutomaticCharge in 'Code\Api Pix\Utils\Views\ViewPixRetryAutomaticCharge.pas' {ViewPixRetryAutomaticCharge},
  ViewPixConfigWebhookRecCobr in 'Code\Api Pix\Utils\Views\ViewPixConfigWebhookRecCobr.pas' {ViewPixConfigWebhookRecCobr},
  ofSchedulePaymentsEndpoints in 'Code\Api Open Finance\Utils\Endpoints\ofSchedulePaymentsEndpoints.pas',
  ofRecurrencyPaymentsEndpoints in 'Code\Api Open Finance\Utils\Endpoints\ofRecurrencyPaymentsEndpoints.pas',
  ofAutomaticPaymentsEndpoints in 'Code\Api Open Finance\Utils\Endpoints\ofAutomaticPaymentsEndpoints.pas',
  ofBiometricPaymentsEndpoints in 'Code\Api Open Finance\Utils\Endpoints\ofBiometricPaymentsEndpoints.pas',
  ViewOfCreateImmediateCharge in 'Code\Api Open Finance\Utils\Views\ViewOfCreateImmediateCharge.pas' {ViewOfCreateImmediateCharge},
  ViewOfList in 'Code\Api Open Finance\Utils\Views\ViewOfList.pas' {ViewOfList},
  ViewOfRefundImmediateCharge in 'Code\Api Open Finance\Utils\Views\ViewOfRefundImmediateCharge.pas' {ViewOfRefundImmediateCharge},
  BodyOfScheduleClass in 'Code\Api Open Finance\Utils\Classes\BodyOfScheduleClass.pas',
  ViewOfCreateScheduleCharge in 'Code\Api Open Finance\Utils\Views\ViewOfCreateScheduleCharge.pas' {ViewOfCreateScheduleCharge},
  ViewOfRefundScheduleCharge in 'Code\Api Open Finance\Utils\Views\ViewOfRefundScheduleCharge.pas' {ViewOfRefundScheduleCharge},
  ViewOfCancel in 'Code\Api Open Finance\Utils\Views\ViewOfCancel.pas' {ViewOfCancel},
  BodyOfRecurrencyClass in 'Code\Api Open Finance\Utils\Classes\BodyOfRecurrencyClass.pas',
  ViewOfCreateRecurrencyCharge in 'Code\Api Open Finance\Utils\Views\ViewOfCreateRecurrencyCharge.pas' {ViewOfCreateRecurrencyCharge},
  ViewOfRefundRecurrencyCharge in 'Code\Api Open Finance\Utils\Views\ViewOfRefundRecurrencyCharge.pas' {ViewOfRefundRecurrencyCharge},
  ViewOfCreateBiometricEnrollment in 'Code\Api Open Finance\Utils\Views\ViewOfCreateBiometricEnrollment.pas' {Form1},
  BodyOfBiometricClass in 'Code\Api Open Finance\Utils\Classes\BodyOfBiometricClass.pas',
  ViewOfListBiometricEnrollment in 'Code\Api Open Finance\Utils\Views\ViewOfListBiometricEnrollment.pas' {ViewOfListBiometricEnrollment},
  ViewOfRevokeBiometricEnrollment in 'Code\Api Open Finance\Utils\Views\ViewOfRevokeBiometricEnrollment.pas' {ViewOfRevokeBiometricEnrollment},
  ViewOfCreateBiometricCharge in 'Code\Api Open Finance\Utils\Views\ViewOfCreateBiometricCharge.pas' {ViewOfCreateBiometricCharge},
  BodyOfAutomaticClass in 'Code\Api Open Finance\Utils\Classes\BodyOfAutomaticClass.pas',
  ViewOfCreateAutomaticEnrollment in 'Code\Api Open Finance\Utils\Views\ViewOfCreateAutomaticEnrollment.pas' {ViewOfCreateAutomaticEnrollment},
  ViewOfListAutomaticEnrollment in 'Code\Api Open Finance\Utils\Views\ViewOfListAutomaticEnrollment.pas' {ViewOfListAutomaticEnrollment},
  ViewOfUpdateAutomaticEnrollment in 'Code\Api Open Finance\Utils\Views\ViewOfUpdateAutomaticEnrollment.pas' {ViewOfUpdateAutomaticEnrollment},
  ViewOfCreateAutomaticCharge in 'Code\Api Open Finance\Utils\Views\ViewOfCreateAutomaticCharge.pas' {ViewOfCreateAutomaticCharge},
  ViewOfListAutomaticCharge in 'Code\Api Open Finance\Utils\Views\ViewOfListAutomaticCharge.pas' {ViewOfListAutomaticCharge},
  ViewOfRevokeAutomaticCharge in 'Code\Api Open Finance\Utils\Views\ViewOfRevokeAutomaticCharge.pas' {ViewOfRevokeAutomaticCharge};

{$R *.res}

begin
  Application.Initialize;
  {$IFDEF UNICODE}
  Application.MainFormOnTaskbar := True;
  {$ENDIF}
  Application.CreateForm(MainCode.TMainCode, frmCode);
  Application.Run;
end.

Application.CreateForm(TForm1, Form1);

Application.CreateForm(TForm1, Form1);

Application.CreateForm(TForm2, Form2);

Application.CreateForm(TForm3, Form3);

Application.CreateForm(TForm4, Form4);

Application.CreateForm(TForm1, Form1);

Application.CreateForm(TForm4, Form4);

Application.CreateForm(TForm1, Form1);

Application.CreateForm(TForm1, Form1);

Application.CreateForm(TForm1, Form1);

Application.CreateForm(TForm1, Form1);

Application.CreateForm(TForm1, Form1);

Application.CreateForm(TForm1, Form1);

Application.CreateForm(TForm1, Form1);

Application.CreateForm(TForm1, Form1);

Application.CreateForm(TForm1, Form1);

Application.CreateForm(TForm1, Form1);

Application.CreateForm(TForm1, Form1);

Application.CreateForm(TForm1, Form1);

Application.CreateForm(TForm1, Form1);

Application.CreateForm(TForm1, Form1);

Application.CreateForm(TForm1, Form1);

Application.CreateForm(TForm1, Form1);

Application.CreateForm(TForm1, Form1);

Application.CreateForm(TForm1, Form1);

Application.CreateForm(TForm1, Form1);

Application.CreateForm(TForm1, Form1);

Application.CreateForm(TForm1, Form1);

Application.CreateForm(TForm1, Form1);

Application.CreateForm(TForm1, Form1);

Application.CreateForm(TForm1, Form1);

Application.CreateForm(TForm1, Form1);

Application.CreateForm(TForm1, Form1);

Application.CreateForm(TForm1, Form1);

Application.CreateForm(TDataModule1, DataModule1);

Application.CreateForm(TForm4, Form4);

Application.CreateForm(TDataModule2, DataModule2);

Application.CreateForm(TForm4, Form4);

Application.CreateForm(TForm4, Form4);

Application.CreateForm(TForm4, Form4);

Application.CreateForm(TForm4, Form4);

Application.CreateForm(TForm4, Form4);

Application.CreateForm(TForm1, Form1);

Application.CreateForm(TForm4, Form4);

Application.CreateForm(TForm5, Form5);

Application.CreateForm(TForm6, Form6);

Application.CreateForm(TForm1, Form1);

Application.CreateForm(TForm1, Form1);

Application.CreateForm(TForm1, Form1);

Application.CreateForm(TForm4, Form4);

Application.CreateForm(TForm4, Form4);

Application.CreateForm(TForm1, Form1);

Application.CreateForm(TForm1, Form1);

Application.CreateForm(TForm1, Form1);

Application.CreateForm(TForm1, Form1);

Application.CreateForm(TForm1, Form1);

Application.CreateForm(TForm4, Form4);

Application.CreateForm(TForm5, Form5);

Application.CreateForm(TForm1, Form1);

Application.CreateForm(TForm4, Form4);

Application.CreateForm(TForm5, Form5);

Application.CreateForm(TForm1, Form1);

Application.CreateForm(TForm1, Form1);

Application.CreateForm(TForm4, Form4);

Application.CreateForm(TForm5, Form5);

Application.CreateForm(TForm6, Form6);

Application.CreateForm(TForm4, Form4);

Application.CreateForm(TForm4, Form4);

Application.CreateForm(TForm4, Form4);

Application.CreateForm(TForm5, Form5);

Application.CreateForm(TForm6, Form6);

Application.CreateForm(TForm4, Form4);

Application.CreateForm(TForm4, Form4);

