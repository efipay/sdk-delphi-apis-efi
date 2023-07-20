unit ViewPixSplitConfig;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,System.Generics.Collections, Vcl.ExtCtrls, BodySplitPixClass, xSuperObject, xSuperJSON;

type
  TPixSplitConfig = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    txtDescricao: TEdit;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    Label2: TLabel;
    txtTipoDivisaoTitular: TEdit;
    Label3: TLabel;
    txtValorTitular: TEdit;
    GroupBox4: TGroupBox;
    Label4: TLabel;
    txtTipoDivisaoContas: TEdit;
    Label5: TLabel;
    txtValorContas: TEdit;
    GroupBox5: TGroupBox;
    Label6: TLabel;
    txtConta: TEdit;
    Label7: TLabel;
    txtDocumento: TEdit;
    optLancamentoImediato: TCheckBox;
    optDivisaoTarifa: TCheckBox;
    btnCancelar: TButton;
    btnCreateConfig: TButton;
    procedure btnCreateConfigClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    function GetBody : String;
  public
    { Public declarations }
     property Body: String read GetBody;
     procedure ClearRequestfields;
  end;

var
  PixSplitConfig: TPixSplitConfig;

implementation

{$R *.dfm}

procedure TPixSplitConfig.btnCancelarClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TPixSplitConfig.btnCreateConfigClick(Sender: TObject);
begin
  if txtTipoDivisaoTitular.Text = EmptyStr then
  begin
    MessageDlg('O campo tipo do titular  não pode ser vazio', TMsgDlgType.mtInformation, [TMsgDlgBtn.mbOK], 0);
    if txtTipoDivisaoTitular.CanFocus then
       txtTipoDivisaoTitular.SetFocus;
  end
  else if txtValorTitular.Text = EmptyStr then
  begin
    MessageDlg('O campo valor do titular  não pode ser vazio', TMsgDlgType.mtInformation, [TMsgDlgBtn.mbOK], 0);
    if txtValorTitular.CanFocus then
       txtValorTitular.SetFocus;
  end
  else if txtTipoDivisaoContas.Text = EmptyStr then
  begin
    MessageDlg('O campo tipo do favorecido  não pode ser vazio', TMsgDlgType.mtInformation, [TMsgDlgBtn.mbOK], 0);
    if txtTipoDivisaoContas.CanFocus then
       txtTipoDivisaoContas.SetFocus;
  end
  else if txtValorContas.Text = EmptyStr then
  begin
    MessageDlg('O campo valor do favorecido  não pode ser vazio', TMsgDlgType.mtInformation, [TMsgDlgBtn.mbOK], 0);
    if txtValorContas.CanFocus then
       txtValorContas.SetFocus;
  end
  else if txtConta.Text = EmptyStr then
  begin
    MessageDlg('O campo conta do favorecido  não pode ser vazio', TMsgDlgType.mtInformation, [TMsgDlgBtn.mbOK], 0);
    if txtConta.CanFocus then
       txtConta.SetFocus;
  end
 else if txtDocumento.Text = EmptyStr then
  begin
    MessageDlg('O campo Cpf/Cnpj do favorecido  não pode ser vazio', TMsgDlgType.mtInformation, [TMsgDlgBtn.mbOK], 0);
    if txtDocumento.CanFocus then
       txtDocumento.SetFocus;
  end
  else
   ModalResult := mrOk;
end;

procedure TPixSplitConfig.ClearRequestfields;
begin
  txtDescricao.Text := '';
  txtTipoDivisaoTitular.Text := '';
  txtValorTitular.Text := '';
  txtTipoDivisaoContas.Text := '';
  txtValorContas.Text := '';
  txtConta.Text := '';
  txtDocumento.Text := '';
end;

procedure TPixSplitConfig.FormCreate(Sender: TObject);
begin
  Self.Position := poScreenCenter;
end;

function TPixSplitConfig.GetBody: String;
var
  ClassCreateSplitConfig    : TBodySplitClass;
  FLancamento               : TLancamento;
  FFavorecidoPessoaFisica   : TFavorecidoPessoaFisica;
  FFavorecidoPessoaJuridica : TFavorecidoPessoaJuridica;
  FConfigDivisaoIntegrador  : TConfigDivisaoIntegrador;
  FConfigDivisaoRecebedores : TConfigDivisaoRecebedores;
  FSplitConfig              : TSplit;
  BodyRequest: ISuperObject;
begin
     ClassCreateSplitConfig          := TBodySplitClass.Create;
     FConfigDivisaoRecebedores       :=  TConfigDivisaoRecebedores.Create;
     FConfigDivisaoRecebedores.tipo  :=  txtTipoDivisaoContas.Text;
     FConfigDivisaoRecebedores.valor :=  txtValorContas.Text;


     FConfigDivisaoIntegrador.tipo  := txtTipoDivisaoTitular.Text;
     FConfigDivisaoIntegrador.valor := txtValorTitular.Text;



     FLancamento.imediato := optLancamentoImediato.Checked;

     if optDivisaoTarifa.Checked then
        FSplitConfig.divisaoTarifa := 'assumir_total'
     else
        FSplitConfig.divisaoTarifa := 'proporcional';

     FSplitConfig.minhaParte:= FConfigDivisaoIntegrador;

     if (TEncoding.UTF8.GetByteCount(txtDocumento.Text)> 11)  then
        begin

          FFavorecidoPessoaJuridica := TFavorecidoPessoaJuridica.Create;
          FFavorecidoPessoaJuridica.Cnpj := txtDocumento.Text;
          FFavorecidoPessoaJuridica.Conta := txtConta.Text;
          FConfigDivisaoRecebedores.favorecido := FFavorecidoPessoaJuridica;

        end
     else
       begin
              FFavorecidoPessoaFisica := TFavorecidoPessoaFisica.Create;
              FFavorecidoPessoaFisica.Cpf := txtDocumento.Text;
              FFavorecidoPessoaFisica.Conta := txtConta.Text;
              FConfigDivisaoRecebedores.favorecido := FFavorecidoPessoaFisica;
       end;



     FSplitConfig.repasses := TObjectList<TConfigDivisaoRecebedores>.Create;
     FSplitConfig.repasses.Add(FConfigDivisaoRecebedores);


     ClassCreateSplitConfig.SplitConfig :=  FSplitConfig;
     ClassCreateSplitConfig.Lancamento := FLancamento;
     ClassCreateSplitConfig.Descricao := txtDescricao.Text;



     BodyRequest := SO(ClassCreateSplitConfig.asJson(false, false));

     

     Result := BodyRequest.AsJSON;



end;

end.
