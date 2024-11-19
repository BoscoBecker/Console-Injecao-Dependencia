unit UCarRental;

interface

uses UVehicle, UInvoice;

type
  CarRental= class
    private FStart: TDateTime;
    private FFinish: TDateTime;
    private FVehicle: Vehicle;
    private procedure SetStart(const Value: TDateTime);
    private procedure SetFinish(const Value: TDateTime);
    private
    FInvoice: Invoice; procedure SetVehicle(const Value: Vehicle);
    procedure SetInvoice(const Value: Invoice);
    public property Start: TDateTime read FStart write SetStart;
    public property Finish: TDateTime read FFinish write SetFinish;
    public property Vehicle: Vehicle read FVehicle write SetVehicle;
    public property Invoice: Invoice read FInvoice write SetInvoice;
    public constructor Create(start,finish :TDateTime; vehicle: Vehicle);
    public destructor Destroy; override;
  end;

implementation

constructor CarRental.Create(start, finish: TDateTime; vehicle: Vehicle);
begin
  SetStart(start);
  SetFinish(finish);
  SetVehicle(vehicle);
end;

destructor CarRental.Destroy;
begin

end;

procedure CarRental.SetFinish(const Value: TDateTime);
begin
  FFinish := Value;
end;

procedure CarRental.SetInvoice(const Value: Invoice);
begin
  FInvoice := Value;
end;

procedure CarRental.SetStart(const Value: TDateTime);
begin
  FStart := Value;
end;

procedure CarRental.SetVehicle(const Value: Vehicle);
begin
  FVehicle := Value;
end;

end.
