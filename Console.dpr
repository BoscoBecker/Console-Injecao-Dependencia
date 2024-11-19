program Console;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  System.TimeSpan,
  UCarRental in 'Entities\UCarRental.pas',
  UVehicle in 'Entities\UVehicle.pas',
  UInvoice in 'Entities\UInvoice.pas',
  UITaxService in 'Services\Interfaces\UITaxService.pas',
  UBrazilTaxService in 'Services\UBrazilTaxService.pas',
  URentalService in 'Services\URentalService.pas';

begin
  ReportMemoryLeaksOnShutdown:=True;
  try
    Writeln('Enter rental data ');
    Write('Car Model: ');
    var Model: string;
    Readln(Model);
    Write('Enter pickup (dd/mm/yyyy hh:mm) : ');
    var Start: TDateTime;
    var StartStr: String;
    Readln(StartStr);
    Start:= StrToDateTime(StartStr);
    Write('Return (dd/mm/yyyy hh:mm) : ');
    var Finish: TDateTime;
    var FinishStr: String;
    Readln(FinishStr);
    Finish:= StrToDateTime(FinishStr);
    Write('Enter price per hour: ');
    var PerHour: Double;
    Readln(PerHour);
    Write('Enter price per day: ');
    var perDay: Double;
    Readln(perDay);

    var NewVehicle:= Vehicle.Create(Model);
    var NewCarRental:= CarRental.Create(Start,Finish, NewVehicle);
    var NewBrazilTaxService:= BrazilTaxService.Create();
    var NewRental:= RentalService.Create(PerHour,perDay,NewBrazilTaxService);
        NewRental.ProcessInvoice(NewCarRental);

    Writeln(NewCarRental.Invoice.ToString());

//   No Close the Window...
//   var pause: string;
//   Readln(pause);

   NewVehicle.Free;
   NewCarRental.Free;
   NewBrazilTaxService.FreeInstance;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
