unit URentalService;

interface

uses UCarRental, System.TimeSpan, Math,DateUtils,UITaxService,UInvoice;

type
  RentalService = class
    private FiTaxService: ITaxService;
    private FInvoice: Invoice;
    private FPricePerHour: double;
    private FPriceByDay: Double;
    private procedure SetPricePerHour(const Value: double);
    private procedure SetPriceByDay(const Value: Double);
    public procedure ProcessInvoice(carRental: CarRental);
    public property PricePerHour: Double read FPricePerHour write SetPricePerHour;
    public property PriceByDay: Double read FPriceByDay write SetPriceByDay;
    public constructor Create(pricePerHour, priceByDay :Double; iTaxService: ITaxService);
    public destructor Destroy; override;
  end;

implementation

constructor RentalService.Create(pricePerHour, priceByDay: Double; iTaxService: ITaxService);
begin
  SetPricePerHour(pricePerHour);
  SetPriceByDay(priceByDay);
  FiTaxService := iTaxService;
end;

destructor RentalService.Destroy;
begin
end;

procedure RentalService.ProcessInvoice(carRental: CarRental);
begin
  var basicPayment : Double;
  var duration:= TTimeSpan.Subtract(carRental.Finish, carRental.Start);

  if duration.TotalHours <= 12.0  then
    basicPayment:=  FPricePerHour *  Math.Ceil(duration.TotalHours)
  else
    basicPayment:=  FPricePerHour *  Math.Ceil(duration.TotalHours);
  var Tax := FiTaxService.Tax(basicPayment);
  FInvoice:= Invoice.Create(basicPayment,Tax);
  carRental.Invoice := FInvoice;
end;

procedure RentalService.SetPriceByDay(const Value: Double);
begin
  FPriceByDay := Value;
end;

procedure RentalService.SetPricePerHour(const Value: double);
begin
  FPricePerHour := Value;
end;

end.
