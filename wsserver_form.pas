// ************************************************************************ //
// The types declared in this file were generated from data read from the
// WSDL File described below:
// WSDL     : http://192.168.10.214/ws/wsserver_form.php?wsdl
// Encoding : ISO-8859-1
// Version  : 1.0
// (16/04/2016 11:04:54 - 1.33.2.5)
// ************************************************************************ //

unit wsserver_form;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns;

type

  // ************************************************************************ //
  // The following types, referred to in the WSDL document are not being represented
  // in this file. They are either aliases[@] of other types represented or were referred
  // to but never[!] declared in the document. The types from the latter category
  // typically map to predefined/known XML or Borland types; however, they could also 
  // indicate incorrect WSDL documents that failed to declare or import a schema type.
  // ************************************************************************ //
  // !:string          - "http://www.w3.org/2001/XMLSchema"
  // !:boolean         - "http://www.w3.org/2001/XMLSchema"
  // !:int             - "http://www.w3.org/2001/XMLSchema"

  array_form_php       = class;                 { "urn:DataRegistrasi" }



  // ************************************************************************ //
  // Namespace : urn:DataRegistrasi
  // ************************************************************************ //
  array_form_php = class(TRemotable)
  private
    Fmitra_id: WideString;
    Fname: WideString;
    Fsex: WideString;
    Fmobilephone: WideString;
    Fimei: WideString;
    Femail: WideString;
    Fidentity_card: WideString;
    Fexp_identity_card: WideString;
    Fdriver_license: WideString;
    Fexp_driver_license: WideString;
    Fplace_of_birth: WideString;
    Fdate_of_birth: WideString;
    Faddress: WideString;
    Faddress_info: WideString;
    Fstatus_of_residence: WideString;
    Fphone: WideString;
    Fmarital_status: WideString;
    Fchildren: WideString;
    Fisownvehicle: WideString;
    Fownvehiclename: WideString;
    Fownvehicleaddress: WideString;
    Fownvehicletype: WideString;
    Fownvehicleproduction: WideString;
    Fgeneric_id: WideString;
    Flast_update: WideString;
    Flanguage: WideString;
    Fbasic_technique_certificate: WideString;
    Fcity_knowledge_certificate: WideString;
    Fsafety_driving_certificate: WideString;
    Ffamily_name: WideString;
    Ffamily_relation_id: WideString;
    Ffamily_status: WideString;
    Ffamily_date_of_birth: WideString;
    Ffamily_work: WideString;
    Ffamily_phone: WideString;
    Frelation_name: WideString;
    Frelation: WideString;
    Frelation_phone: WideString;
  published
    property mitra_id: WideString read Fmitra_id write Fmitra_id;
    property name: WideString read Fname write Fname;
    property sex: WideString read Fsex write Fsex;
    property mobilephone: WideString read Fmobilephone write Fmobilephone;
    property imei: WideString read Fimei write Fimei;
    property email: WideString read Femail write Femail;
    property identity_card: WideString read Fidentity_card write Fidentity_card;
    property exp_identity_card: WideString read Fexp_identity_card write Fexp_identity_card;
    property driver_license: WideString read Fdriver_license write Fdriver_license;
    property exp_driver_license: WideString read Fexp_driver_license write Fexp_driver_license;
    property place_of_birth: WideString read Fplace_of_birth write Fplace_of_birth;
    property date_of_birth: WideString read Fdate_of_birth write Fdate_of_birth;
    property address: WideString read Faddress write Faddress;
    property address_info: WideString read Faddress_info write Faddress_info;
    property status_of_residence: WideString read Fstatus_of_residence write Fstatus_of_residence;
    property phone: WideString read Fphone write Fphone;
    property marital_status: WideString read Fmarital_status write Fmarital_status;
    property children: WideString read Fchildren write Fchildren;
    property isownvehicle: WideString read Fisownvehicle write Fisownvehicle;
    property ownvehiclename: WideString read Fownvehiclename write Fownvehiclename;
    property ownvehicleaddress: WideString read Fownvehicleaddress write Fownvehicleaddress;
    property ownvehicletype: WideString read Fownvehicletype write Fownvehicletype;
    property ownvehicleproduction: WideString read Fownvehicleproduction write Fownvehicleproduction;
    property generic_id: WideString read Fgeneric_id write Fgeneric_id;
    property last_update: WideString read Flast_update write Flast_update;
    property language: WideString read Flanguage write Flanguage;
    property basic_technique_certificate: WideString read Fbasic_technique_certificate write Fbasic_technique_certificate;
    property city_knowledge_certificate: WideString read Fcity_knowledge_certificate write Fcity_knowledge_certificate;
    property safety_driving_certificate: WideString read Fsafety_driving_certificate write Fsafety_driving_certificate;
    property family_name: WideString read Ffamily_name write Ffamily_name;
    property family_relation_id: WideString read Ffamily_relation_id write Ffamily_relation_id;
    property family_status: WideString read Ffamily_status write Ffamily_status;
    property family_date_of_birth: WideString read Ffamily_date_of_birth write Ffamily_date_of_birth;
    property family_work: WideString read Ffamily_work write Ffamily_work;
    property family_phone: WideString read Ffamily_phone write Ffamily_phone;
    property relation_name: WideString read Frelation_name write Frelation_name;
    property relation: WideString read Frelation write Frelation;
    property relation_phone: WideString read Frelation_phone write Frelation_phone;
  end;

  return_arrayform_php = array of array_form_php;   { "urn:DataRegistrasi" }

  // ************************************************************************ //
  // Name      : PHP Web Services return arrayPortType
  // Namespace : urn:DataRegistrasi
  // soapAction: urn:DataRegistrasi#%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : PHP Web Services return arrayBinding
  // service   : PHP Web Services return array
  // port      : PHP Web Services return arrayPort
  // URL       : http://192.168.10.214/ws/wsserver_form.php
  // ************************************************************************ //
  PHP_Web_Services_return_arrayPortType = interface(IInvokable)
  ['{1DFA0E90-64B1-CB2C-C7D1-C6F517F24D28}']
    function  update_data(const id: WideString): Boolean; stdcall;
    function  get_data(const company_id: Integer): return_arrayform_php; stdcall;
  end;

function GetPHP_Web_Services_return_arrayPortType(UseWSDL: Boolean=System.False; Addr: string=''; HTTPRIO: THTTPRIO = nil): PHP_Web_Services_return_arrayPortType;


implementation

function GetPHP_Web_Services_return_arrayPortType(UseWSDL: Boolean; Addr: string; HTTPRIO: THTTPRIO): PHP_Web_Services_return_arrayPortType;
const
  defWSDL = 'http://192.168.10.214/ws/wsserver_form.php?wsdl';
  defURL  = 'http://192.168.10.214/ws/wsserver_form.php';
  defSvc  = 'PHP Web Services return array';
  defPrt  = 'PHP Web Services return arrayPort';
var
  RIO: THTTPRIO;
begin
  Result := nil;
  if (Addr = '') then
  begin
    if UseWSDL then
      Addr := defWSDL
    else
      Addr := defURL;
  end;
  if HTTPRIO = nil then
    RIO := THTTPRIO.Create(nil)
  else
    RIO := HTTPRIO;
  try
    Result := (RIO as PHP_Web_Services_return_arrayPortType);
    if UseWSDL then
    begin
      RIO.WSDLLocation := Addr;
      RIO.Service := defSvc;
      RIO.Port := defPrt;
    end else
      RIO.URL := Addr;
  finally
    if (Result = nil) and (HTTPRIO = nil) then
      RIO.Free;
  end;
end;


initialization
  InvRegistry.RegisterInterface(TypeInfo(PHP_Web_Services_return_arrayPortType), 'urn:DataRegistrasi', 'ISO-8859-1', '', 'PHP Web Services return arrayPortType');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(PHP_Web_Services_return_arrayPortType), 'urn:DataRegistrasi#%operationName%');
  RemClassRegistry.RegisterXSClass(array_form_php, 'urn:DataRegistrasi', 'array_form_php');
  RemClassRegistry.RegisterXSInfo(TypeInfo(return_arrayform_php), 'urn:DataRegistrasi', 'return_arrayform_php');

end. 