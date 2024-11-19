unit UBrazilTaxService;

interface

uses UITaxService;

type
  BrazilTaxService = class(TInterfacedObject,ITaxService)
    public function Tax(amount:Double):double;
    public constructor Create;
    public destructor Destroy; override;
  end;


implementation

{ BrazilTaxService }

constructor BrazilTaxService.Create;
begin

end;

destructor BrazilTaxService.Destroy;
begin

  inherited;
end;

function BrazilTaxService.Tax(amount: Double): double;
begin
  if amount <= 100  then
    result:= amount * 0.2
  else
    result:= amount * 0.15;
end;

end.
