// ************************************************************************ //
// The types declared in this file were generated from data read from the
// WSDL File described below:
// WSDL     : http://www.whitehorse.co.id/WebServices/JadeService.asmx?wsdl
// Encoding : utf-8
// Version  : 1.0
// (16/05/2017 17:29:58 - 1.33.2.5)
// ************************************************************************ //

unit IntersysAPI_New;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, Dialogs;

const
 UrlApi = 'https://www.whitehorse.co.id/';
 UrlApi2 = 'http://dev.whitehorse.co.id/';

type

  // ************************************************************************ //
  // The following types, referred to in the WSDL document are not being represented
  // in this file. They are either aliases[@] of other types represented or were referred
  // to but never[!] declared in the document. The types from the latter category
  // typically map to predefined/known XML or Borland types; however, they could also 
  // indicate incorrect WSDL documents that failed to declare or import a schema type.
  // ************************************************************************ //
  // !:string          - "http://www.w3.org/2001/XMLSchema"

  ServiceResponse      = class;                 { "http://www.whitehorse.co.id/" }
  VehicleInfoModel     = class;                 { "http://www.whitehorse.co.id/" }

  { "http://www.whitehorse.co.id/" }
  ResponseStatus = (Success, Error);



  // ************************************************************************ //
  // Namespace : http://www.whitehorse.co.id/
  // ************************************************************************ //
  ServiceResponse = class(TRemotable)
  private
    FPropertyMessage: WideString;
    FMessage: WideString;
    FResult: WideString;
    FStatus: WideString;
  published
    property PropertyMessage: WideString read FPropertyMessage write FPropertyMessage;
    property Message: WideString read FMessage write FMessage;
    property Result: WideString read FResult write FResult;
    property Status: WideString read FStatus write FStatus;
  end;


  // ************************************************************************ //
  // Namespace : http://www.whitehorse.co.id/
  // ************************************************************************ //
  VehicleInfoModel = class(TRemotable)
  private
    FWehaReservedCode: WideString;
    FStatus: WideString;
    FDriverName: WideString;
    FDriverPhone: WideString;
    FVehiclePlateNo: WideString;
    FWorkOrderNo: WideString;
    FStandByTimeStr: WideString;
  public
    destructor Destroy; override;
  published
    property WehaReservedCode: WideString read FWehaReservedCode write FWehaReservedCode;
    property Status: WideString read FStatus write FStatus;
    property DriverName: WideString read FDriverName write FDriverName;
    property DriverPhone: WideString read FDriverPhone write FDriverPhone;
    property VehiclePlateNo: WideString read FVehiclePlateNo write FVehiclePlateNo;
    property WorkOrderNo: WideString read FWorkOrderNo write FWorkOrderNo;
    property StandByTimeStr: WideString read FStandByTimeStr write FStandByTimeStr;
  end;


  // ************************************************************************ //
  // Namespace : http://www.whitehorse.co.id/
  // soapAction: http://www.whitehorse.co.id/%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // binding   : JadeServiceSoap
  // service   : JadeService
  // port      : JadeServiceSoap
  // URL       : http://www.whitehorse.co.id/WebServices/JadeService.asmx
  // ************************************************************************ //
  JadeServiceSoap = interface(IInvokable)
  ['{4528759A-CFFD-1520-5519-8B293EF6D48B}']
    function  TestConnection: ServiceResponse; stdcall;
    function  TestNotif(const orderId: Int64): ServiceResponse; stdcall;
    function  ChangeVehicleInfo(const info: VehicleInfoModel): ServiceResponse; stdcall;
    function  ChangeVehicleReservedCode(const orderNo: WideString; const jsonReservedCodes: WideString; const isFixed: Boolean): ServiceResponse; stdcall;
    function  UpdateOrderWaitingList(const orderNo: WideString; const reservedIdNo: WideString; const jsonReservedCodes: WideString): ServiceResponse; stdcall;
  end;

function GetJadeServiceSoap(UseWSDL: Boolean=System.False; Addr: string=''; HTTPRIO: THTTPRIO = nil; Url_API:String='http://www.whitehorse.co.id/online/WebServices/JadeService.asmx';url_webservice:String='http://www.whitehorse.co.id/'): JadeServiceSoap;

var
  url_service : string;


implementation

uses SysUtils, MainU;

function GetJadeServiceSoap(UseWSDL: Boolean; Addr: string; HTTPRIO: THTTPRIO; Url_API:String; url_webservice:String): JadeServiceSoap;
const
  defSvc  = 'JadeService';
  defPrt  = 'JadeServiceSoap';
var
  RIO: THTTPRIO;
  defWSDL, defURL : String;
begin
//  Url_API  := 'http://dev.whitehorse.co.id/WebServices/JadeService.asmx?wsdl';
//  url_webservice:= 'http://dev.whitehorse.co.id/WebServices/JadeService.asmx';
  url_service := url_webservice;
  defWSDL := Url_API;
  defURL  := 'http://dev.whitehorse.co.id/WebServices/JadeService.asmx?wsdl';//StringReplace(Url_API, '?wsdl', '',[rfReplaceAll]);
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
    Result := (RIO as JadeServiceSoap);
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

destructor VehicleInfoModel.Destroy;
begin
{
  if Assigned(FStandbyTime) then
    FStandbyTime.Free;
  inherited Destroy;
}  
end;

initialization

  InvRegistry.RegisterInterface(TypeInfo(JadeServiceSoap), UrlApi, 'utf-8'); {'http://www.whitehorse.co.id/'}
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(JadeServiceSoap), UrlApi+'%operationName%');
  InvRegistry.RegisterInvokeOptions(TypeInfo(JadeServiceSoap), ioDocument);
  InvRegistry.RegisterInvokeOptions(TypeInfo(ResponseStatus), ioDocument);

  RemClassRegistry.RegisterXSInfo(TypeInfo(ResponseStatus), UrlApi, 'ResponseStatus');
  RemClassRegistry.RegisterXSClass(VehicleInfoModel, UrlApi, 'VehicleInfoModel');
  RemClassRegistry.RegisterXSClass(ServiceResponse, UrlApi, 'ServiceResponse');

end.
