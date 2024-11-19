unit UVehicle;

interface


type
  Vehicle = class
    private FModel: string;
    public procedure SetModel(const Value: string);
    public property Model: string  read FModel write SetModel;
    public constructor Create(model :string);
    public destructor Destroy;
  end;


implementation

constructor Vehicle.Create(model: string);
begin
  SetModel(model);
end;

destructor Vehicle.Destroy;
begin

end;

procedure Vehicle.SetModel(const Value: string);
begin
  FModel := Value;
end;

end.
