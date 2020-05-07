unit Unit2;

interface

uses
  Generics.Collections;

type
  TItem = class(TInterfacedObject, IInterface)
  private
    FName: string;
  public
    constructor Create;
    destructor Destroy; override;
    property Name: string read FName write FName;
  end;

type
  IEquipable = interface
    procedure Equip;
  end;

type
  TEquipItem = class(TItem, IEquipable)
  private
    FEquipped: Boolean;
  public
    constructor Create;
    destructor Destroy; override;
    property IsEquipped: Boolean read FEquipped write FEquipped;
    procedure Equip;
  end;

type
  TStaff = class(TEquipItem)
  private

  public
    constructor Create;
    destructor Destroy; override;
  end;

type
  TFlag = class(TEquipItem)
  private

  public
    constructor Create;
    destructor Destroy; override;
  end;

type
  TBook = class(TEquipItem)
  private

  public
    constructor Create;
    destructor Destroy; override;
  end;

type
  IConsumable = interface
    procedure Quaff;
  end;

type
  TConsumItem = class(TItem, IConsumable)
  private

  public
    constructor Create;
    destructor Destroy; override;
    procedure Quaff;
  end;

type
  TElixir = class(TConsumItem)
  private

  public
    constructor Create;
    destructor Destroy; override;
    procedure Quaff;
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
    function GetItem(I: Integer): TItem;
    procedure EquipItem(I: Integer);
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

{ TEquipItem }

constructor TEquipItem.Create;
begin
  FName := 'EquipItem';
  FEquipped := False;
end;

destructor TEquipItem.Destroy;
begin

  inherited;
end;

procedure TEquipItem.Equip;
begin

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

{ TConsumItem }

constructor TConsumItem.Create;
begin
  FName := 'ConsumItem';
end;

destructor TConsumItem.Destroy;
begin

  inherited;
end;

procedure TConsumItem.Quaff;
begin

end;

{ TElixir }

constructor TElixir.Create;
begin
  FName := 'Эликсир';
end;

destructor TElixir.Destroy;
begin

  inherited;
end;

procedure TElixir.Quaff;
begin

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

procedure TItems.EquipItem(I: Integer);
begin
  TEquipItem(FItems[I]).FEquipped := True;
end;

function TItems.GetItem(I: Integer): TItem;
begin
  Result := FItems[I];
end;

end.
