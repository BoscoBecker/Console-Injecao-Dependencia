unit UInvoice;

interface

uses System.SysUtils;

type
  Invoice = class
    private FBasicPayment: double;
    private FTax: Double;
    private procedure SetBasicPayment(const Value: double);
    private procedure SetTax(const Value: Double);
    public function TotalPaymet(): Double;
    public function ToString():string; override ;
    public property BasicPayment: Double read FBasicPayment write SetBasicPayment;
    public property Tax: Double read FTax write SetTax;
    public constructor Create(basicPayment, tax :Double);
    public destructor Destroy; override;
  end;

implementation


constructor Invoice.Create(basicPayment, tax: Double);
begin
  SetBasicPayment(basicPayment);
  SetTax(Tax);
end;

destructor Invoice.Destroy;
begin

end;

procedure Invoice.SetBasicPayment(const Value: double);
begin
  FBasicPayment := Value;
end;

procedure Invoice.SetTax(const Value: Double);
begin
  FTax := Value;
end;

function Invoice.ToString(): string;
begin
    result := '=============INVOICE=============' +
              'Basic payment:' + FBasicPayment.ToString( )+
              'Tax: ' + Tax.ToString() +
              'Total payment: ' + TotalPaymet.ToString()  +
              '=============INVOICE=============';
end;

function Invoice.TotalPaymet: Double;
begin
  result:= FBasicPayment + FTax;
end;

end.
