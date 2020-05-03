unit Unit2;

interface

uses
  Generics.Collections;

type
  TItem = class(TObject)
  private
    FName: string;
  public
    constructor Create;
    destructor Destroy; override;
    property Name: string read FName write FName;
  end;

type
  TStaff = class(TItem)
  private

  public
    constructor Create;
    destructor Destroy; override;
  end;

type
  TFlag = class(TItem)
  private

  public
    constructor Create;
    destructor Destroy; override;
  end;

type
  TBook = class(TItem)
  private

  public
    constructor Create;
    destructor Destroy; override;
  end;

type
  TItems = class(TObject)
  private
    FItems: TObjectList<TItem>;
  public
    constructor Create;
    destructor Destroy; override;
    procedure CreateItem(AItem: TItem);
    function Count: Integer;
  end;

implementation

{ TItem }

constructor TItem.Create;
begin
  FName := 'Item';
end;

destructor TItem.Destroy;
begin

  inherited;
end;

{ TStaff }

constructor TStaff.Create;
begin
  FName := 'Посох';
end;

destructor TStaff.Destroy;
begin

  inherited;
end;

{ TFlag }

constructor TFlag.Create;
begin
  FName := 'Знамя';
end;

destructor TFlag.Destroy;
begin

  inherited;
end;

{ TBook }

constructor TBook.Create;
begin
  FName := 'Книга';
end;

destructor TBook.Destroy;
begin

  inherited;
end;

{ TItems }

function TItems.Count: Integer;
begin
  Result := FItems.Count;
end;

constructor TItems.Create;
begin
  FItems := TObjectList<TItem>.Create();
  FItems.OwnsObjects := True;

end;

procedure TItems.CreateItem(AItem: TItem);
begin
  FItems.Add(AItem);
end;

destructor TItems.Destroy;
begin
  FItems.Free;
  inherited;
end;

end.
