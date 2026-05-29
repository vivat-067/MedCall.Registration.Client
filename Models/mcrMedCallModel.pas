unit mcrMedCallModel;

interface

uses
  System.SysUtils, System.Classes, System.DateUtils, System.JSON,
  System.TimeSpan, mcrAppShared;

type
  TCallType = (ctDoctorAtHome, ctAmbulance);

  TCallStatus = (csNew = 1, csPending, csFromInsurance, csInWork, csCancelled, csCompleted);

  TMedicalAssistanceCall = class
  private
    FCost: Currency;
    FTypeOfCall: TCallType;
    FMkadDistance: Double;
    FBrigadeNumber: string;
    FAge: Integer;
    FCustomerRepresentative: string;
    FDriver: string;
    FComment: string;
    FInsuranceNumber: string;
    FDepartureTime: TDateTime;
    FWorkDuration: TTimeSpan;
    FCustomer: string;
    FDispatcher2: string;
    FReceptionTime: TDateTime;
    FDispatcher1: string;
    FParamedic: string;
    FContactInfo: string;
    FDateOfBirth: TDateTime;
    FId: Integer;
    FNumber: Integer;
    FIsWaiting: Boolean;
    FDoctor: string;
    FPatientName: string;
    FNote: string;
    FStatusId: TCallStatus;
    FComplaints: string;
    FCompletionTime: TDateTime;
    FArrivalTime: TDateTime;
    FAddressDetails: string;
    FTransferTime: TDateTime;
    FConclusion: string;
    FCallDate: TDateTime;
    FDiagnosis: string;
    FAddressStreet: string;
    FPaymentType: string;
    FTEM: TTransactionEditMode;
    procedure SetAddressStreet(const Value: string);
    procedure SetBrigadeNumber(const Value: string);
    procedure SetPatientName(const Value: string);
    function GetStatus: string;
    procedure SetTEM(const Value: TTransactionEditMode);
  published
    property Id: Integer read FId write FId;
    property Number: Integer read FNumber write FNumber;
    property TypeOfCall: TCallType read FTypeOfCall write FTypeOfCall;
    property StatusId: TCallStatus read FStatusId write FStatusId;
    property Status: string read GetStatus;
    property PatientName: string read FPatientName write SetPatientName;
    property DateOfBirth: TDateTime read FDateOfBirth write FDateOfBirth;
    property Age: Integer read FAge write FAge;
    property AddressStreet: string read FAddressStreet write SetAddressStreet;
    property AddressDetails: string read FAddressDetails write FAddressDetails;
    property ContactInfo: string read FContactInfo write FContactInfo;
    property Complaints: string read FComplaints write FComplaints;
    property Comment: string read FComment write FComment;
    property Diagnosis: string read FDiagnosis write FDiagnosis;
    property Conclusion: string read FConclusion write FConclusion;
    property Note: string read FNote write FNote;
    property CallDate: TDateTime read FCallDate write FCallDate;
    property ReceptionTime: TDateTime read FReceptionTime write FReceptionTime;
    property TransferTime: TDateTime read FTransferTime write FTransferTime;
    property DepartureTime: TDateTime read FDepartureTime write FDepartureTime;
    property ArrivalTime: TDateTime read FArrivalTime write FArrivalTime;
    property CompletionTime: TDateTime read FCompletionTime write FCompletionTime;
    property WorkDuration: TTimeSpan read FWorkDuration write FWorkDuration;
    property BrigadeNumber: string read FBrigadeNumber write SetBrigadeNumber;
    property Doctor: string read FDoctor write FDoctor;
    property Paramedic: string read FParamedic write FParamedic;
    property Driver: string read FDriver write FDriver;
    property Dispatcher1: string read FDispatcher1 write FDispatcher1;
    property Dispatcher2: string read FDispatcher2 write FDispatcher2;
    property PaymentType: string read FPaymentType write FPaymentType;
    property InsuranceNumber: string read FInsuranceNumber write FInsuranceNumber;
    property Customer: string read FCustomer write FCustomer;
    property CustomerRepresentative: string read FCustomerRepresentative write FCustomerRepresentative;
    property Cost: Currency read FCost write FCost;
    property MkadDistance: Double read FMkadDistance write FMkadDistance;
    property IsWaiting: Boolean read FIsWaiting write FIsWaiting;

    property TEM: TTransactionEditMode read FTEM write SetTEM;
  public
    class function FromJSON(const JSONObject: TJSONObject): TMedicalAssistanceCall;
    function ToJSON: string;

    constructor Create;
  end;

function ConvertTEM2APIMethodName(TEM: TTransactionEditMode): string;

implementation

uses
  mcrConverters;

const
  CallStatusStrings: array[TCallStatus] of string = ('Новая заявка',          // csNew
    'На согласовании',       // csPending
    'Заявка от страховой',   // csFromInsurance
    'Взята в работу бригадой', // csInWork
    'Отменена',              // csCancelled
    'Завершена'              // csCompleted
    );

function ConvertTEM2APIMethodName(TEM: TTransactionEditMode): string;
begin
  case TEM of
    temCreate:
      Result := 'POST';
    temUpdate:
      Result := 'PUT';
    temDelete:
      Result := 'DELETE';
  else
    Result := 'UNKNOWN';
  end;
end;


{ TMedicalAssistanceCall }

constructor TMedicalAssistanceCall.Create;
begin
  inherited;
  FDateOfBirth := 0;
  FAge := 0;
  FMkadDistance := 0.0;
  FCost := 0.00;
  FIsWaiting := False;
  FReceptionTime := 0;
  FTransferTime := 0;
  FWorkDuration := TTimeSpan.Zero;
  FStatusId := csNew;
  FTEM := temNone;
end;

procedure TMedicalAssistanceCall.SetAddressStreet(const Value: string);
begin
  FAddressStreet := Value;
end;

procedure TMedicalAssistanceCall.SetBrigadeNumber(const Value: string);
begin
  FBrigadeNumber := Value;
end;

procedure TMedicalAssistanceCall.SetPatientName(const Value: string);
begin
  FPatientName := Value;
end;

procedure TMedicalAssistanceCall.SetTEM(const Value: TTransactionEditMode);
begin
  FTEM := Value;
end;

function TMedicalAssistanceCall.GetStatus: string;
begin
  Result := CallStatusStrings[FStatusID];
end;

function TMedicalAssistanceCall.ToJSON: string;
var
  JSONObject: TJSONObject;
begin
  JSONObject := TJSONObject.Create;
  try
    {$REGION 'ВЫЗОВ'}
    JSONObject.AddPair('id', TJSONNumber.Create(FId));
    JSONObject.AddPair('typeOfCall', TJSONNumber.Create(Ord(FTypeOfCall)));  // ✅ enum как число
    JSONObject.AddPair('number', TJSONNumber.Create(FNumber));
    JSONObject.AddPair('statusId', TJSONNumber.Create(Ord(FStatusId)));      // ✅ enum как число
    JSONObject.AddPair('status', Status);  // строка — оставляем как есть
   {$ENDREGION}

    {$REGION 'ПАЦИЕНТ'}
    JSONObject.AddPair('patientName', FPatientName);
    JSONObject.AddPair('dateOfBirth', ToJSONDate(FDateOfBirth));
    JSONObject.AddPair('age', TJSONNumber.Create(FAge));
    JSONObject.AddPair('contactInfo', FContactInfo);
    {$ENDREGION}

    {$REGION 'ДИАГНОЗ И ПОМОЩЬ'}
    JSONObject.AddPair('complaints', FComplaints);
    JSONObject.AddPair('diagnosis', ToJSONStringOrNull(FDiagnosis));
    JSONObject.AddPair('conclusion', ToJSONStringOrNull(FConclusion));
    JSONObject.AddPair('note', ToJSONStringOrNull(FNote));
    JSONObject.AddPair('comment', ToJSONStringOrNull(FComment));
    {$ENDREGION}

    {$REGION 'АДРЕС'}
    JSONObject.AddPair('addressStreet', FAddressStreet);
    JSONObject.AddPair('addressDetails', FAddressDetails);
    {$ENDREGION}

    {$REGION 'ВРЕМЯ'}
    JSONObject.AddPair('callDate', ToJSONDate(FCallDate));

    JSONObject.AddPair('receptionTime', ToJSONDateTime(FReceptionTime));
    JSONObject.AddPair('transferTime', ToJSONDateTime(FTransferTime));
    JSONObject.AddPair('departureTime', ToJSONDateTime(FDepartureTime));
    JSONObject.AddPair('arrivalTime', ToJSONDateTime(FArrivalTime));
    JSONObject.AddPair('completionTime', ToJSONDateTime(FCompletionTime));

    JSONObject.AddPair('workDuration', ToJSONTimeSpan(FWorkDuration));
    {$ENDREGION}

    {$REGION 'БРИГАДА'}
    JSONObject.AddPair('brigadeNumber', FBrigadeNumber);
    JSONObject.AddPair('doctor', FDoctor);
    JSONObject.AddPair('paramedic', FParamedic);
    JSONObject.AddPair('driver', FDriver);
    JSONObject.AddPair('dispatcher1', FDispatcher1);
    JSONObject.AddPair('dispatcher2', FDispatcher2);
    {$ENDREGION}

    {$REGION 'ОПЛАТА И СТРАХОВКА'}
    JSONObject.AddPair('paymentType', FPaymentType);
    JSONObject.AddPair('insuranceNumber', FInsuranceNumber);
    JSONObject.AddPair('customer', FCustomer);
    JSONObject.AddPair('customerRepresentative', FCustomerRepresentative);
    JSONObject.AddPair('cost', ToJSONFloatOrNull(FCost));
    {$ENDREGION}

    {$REGION 'ДОПОЛНИТЕЛЬНЫЕ ПОЛЯ'}
    JSONObject.AddPair('mkadDistance', ToJSONFloatOrNull(FMkadDistance));
    JSONObject.AddPair('isWaiting', TJSONBool.Create(FIsWaiting));
    {$ENDREGION}

    Result := JSONObject.ToJSON;
  finally
    JSONObject.Free;
  end;
end;

class function TMedicalAssistanceCall.FromJSON(const JSONObject: TJSONObject): TMedicalAssistanceCall;
begin
  Result := TMedicalAssistanceCall.Create;
  if JSONObject = nil then
    Exit;

  try
   {$REGION 'ОСНОВНЫЕ ПОЛЯ'}
    Result.FId := StrToIntDef(JSONObject.GetValue<string>('id', '0'), 0);
    Result.FNumber := StrToIntDef(JSONObject.GetValue<string>('number', '0'), 0);
    Result.FStatusId := TCallStatus(StrToIntDef(JSONObject.GetValue<string>('statusId', '1'), 1));
    Result.FTypeOfCall := TCallType(StrToIntDef(JSONObject.GetValue<string>('typeOfCall', '0'), Ord(ctDoctorAtHome)));
   {$ENDREGION}

    {$REGION 'ПАЦИЕНТ'}
    Result.FPatientName := JSONObject.GetValue<string>('patientName', '');
    Result.FDateOfBirth := GetJsonDate(JSONObject.GetValue<string>('dateOfBirth', ''));
    Result.FAge := StrToIntDef(JSONObject.GetValue<string>('age', '0'), 0);
    Result.FContactInfo := JSONObject.GetValue<string>('contactInfo', '');
    {$ENDREGION}

    {$REGION 'ДИАГНОЗ И ПОМОЩЬ'}
    Result.FComplaints := JSONObject.GetValue<string>('complaints', '');
    Result.FDiagnosis := JSONObject.GetValue<string>('diagnosis', '');
    Result.FConclusion := JSONObject.GetValue<string>('conclusion', '');
    Result.FNote := JSONObject.GetValue<string>('note', '');
    Result.FComment := JSONObject.GetValue<string>('comment', '');
    {$ENDREGION}

    {$REGION 'АДРЕС'}
    Result.FAddressStreet := JSONObject.GetValue<string>('addressStreet', '');
    Result.FAddressDetails := JSONObject.GetValue<string>('addressDetails', '');
    {$ENDREGION}

    {$REGION 'ВРЕМЯ'}
    Result.FCallDate := GetJsonDate(JSONObject.GetValue<string>('callDate', ''));
    Result.FDepartureTime := GetJsonDateTime(JSONObject.GetValue<string>('departureTime', ''));
    Result.FArrivalTime := GetJsonDateTime(JSONObject.GetValue<string>('arrivalTime', ''));
    Result.FCompletionTime := GetJsonDateTime(JSONObject.GetValue<string>('completionTime', ''));

    Result.FReceptionTime := GetJsonTime(JSONObject.GetValue<string>('receptionTime', ''));
    Result.FTransferTime := GetJsonTime(JSONObject.GetValue<string>('transferTime', ''));
    Result.FWorkDuration := GetJsonTimeSpan(JSONObject.GetValue<string>('workDuration', ''));
    {$ENDREGION}

    {$REGION 'БРИГАДА'}
    Result.FBrigadeNumber := JSONObject.GetValue<string>('brigadeNumber', '');
    Result.FDoctor := JSONObject.GetValue<string>('doctor', '');
    Result.FParamedic := JSONObject.GetValue<string>('paramedic', '');
    Result.FDriver := JSONObject.GetValue<string>('driver', '');
    Result.FDispatcher1 := JSONObject.GetValue<string>('dispatcher1', '');
    Result.FDispatcher2 := JSONObject.GetValue<string>('dispatcher2', '');
    {$ENDREGION}

    {$REGION 'ОПЛАТА И СТРАХОВКА'}
    Result.FPaymentType := JSONObject.GetValue<string>('paymentType', '');
    Result.FInsuranceNumber := JSONObject.GetValue<string>('insuranceNumber', '');
    Result.FCustomer := JSONObject.GetValue<string>('customer', '');
    Result.FCustomerRepresentative := JSONObject.GetValue<string>('customerRepresentative', '');
    Result.FCost := StrToCurrDef(JSONObject.GetValue<string>('cost', '0.00'), 0.00);
    {$ENDREGION}

    {$REGION 'ПРОЧЕЕ'}
    Result.FMkadDistance := StrToFloatDef(JSONObject.GetValue<string>('mkadDistance', '0.0'), 0.0);
    Result.FIsWaiting := StrToBoolDef(JSONObject.GetValue<string>('isWaiting', 'false'), False);
    {$ENDREGION}
  except
    Result.Free;
    raise;
  end;
end;

end.

