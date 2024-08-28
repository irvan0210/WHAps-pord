// ************************************************************************ //
// The types declared in this file were generated from data read from the
// WSDL File described below:
// WSDL     : http://localhost/webservice/live/wsserver.php?wsdl
// Encoding : ISO-8859-1
// Version  : 1.0
// (23/02/2016 15:23:49 - 1.33.2.5)
// ************************************************************************ //

unit wsserver;

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

  array_php            = class;                 { "urn:DataOrder" }



  // ************************************************************************ //
  // Namespace : urn:DataOrder
  // ************************************************************************ //
  array_php = class(TRemotable)
  private
    Fid: WideString;
    FFormId: WideString;
    FSubmissionId: WideString;
    FFieldName: WideString;
    FFieldValue: WideString;
    FDateSubmitted: WideString;
  published
    property id: WideString read Fid write Fid;
    property FormId: WideString read FFormId write FFormId;
    property SubmissionId: WideString read FSubmissionId write FSubmissionId;
    property FieldName: WideString read FFieldName write FFieldName;
    property FieldValue: WideString read FFieldValue write FFieldValue;
    property DateSubmitted: WideString read FDateSubmitted write FDateSubmitted;
  end;

  return_array_php = array of array_php;        { "urn:DataOrder" }

  // ************************************************************************ //
  // Name      : PHP Web Services return arrayPortType
  // Namespace : urn:DataOrder
  // soapAction: urn:DataOrder#%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : PHP Web Services return arrayBinding
  // service   : PHP Web Services return array
  // port      : PHP Web Services return arrayPort
  // URL       : http://localhost/webservice/live/wsserver.php
  // ************************************************************************ //
  PHP_Web_Services_return_arrayPortType = interface(IInvokable)
  ['{FBDD2611-32A9-404D-C453-D9FA05068CD0}']
    function  update_data(const id: WideString): Boolean; stdcall;
    function  get_data(const company_id: Integer): return_array_php; stdcall;
  end;

function GetPHP_Web_Services_return_arrayPortType(UseWSDL: Boolean=System.False; Addr: string=''; HTTPRIO: THTTPRIO = nil): PHP_Web_Services_return_arrayPortType;


implementation

function GetPHP_Web_Services_return_arrayPortType(UseWSDL: Boolean; Addr: string; HTTPRIO: THTTPRIO): PHP_Web_Services_return_arrayPortType;
const
  defWSDL = 'http://localhost/webservice/live/wsserver.php?wsdl';
  defURL  = 'http://localhost/webservice/live/wsserver.php';
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
  InvRegistry.RegisterInterface(TypeInfo(PHP_Web_Services_return_arrayPortType), 'urn:DataOrder', 'ISO-8859-1', '', 'PHP Web Services return arrayPortType');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(PHP_Web_Services_return_arrayPortType), 'urn:DataOrder#%operationName%');
  RemClassRegistry.RegisterXSClass(array_php, 'urn:DataOrder', 'array_php');
  RemClassRegistry.RegisterXSInfo(TypeInfo(return_array_php), 'urn:DataOrder', 'return_array_php');

end. 