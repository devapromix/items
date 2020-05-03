unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    ListBox1: TListBox;
    ListBox2: TListBox;
    Label1: TLabel;
    Label2: TLabel;
    ListBox3: TListBox;
    Label3: TLabel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    ListBox4: TListBox;
    Label4: TLabel;
    procedure Button5Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    procedure Refresh;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  B: Boolean = True;

implementation

{$R *.dfm}

uses Unit2;

var
  Items: TItems;

procedure TForm1.Button1Click(Sender: TObject);
var
  I, J: Integer;
begin
  if B then
  begin
    // Надеть предмет
    if (ListBox1.ItemIndex < 0) then
      Exit;
    J := 0;
    for I := 0 to Items.Count - 1 do
    begin
      if not Items.GetItem(I).IsEquipped then
      begin
        if J = ListBox1.ItemIndex then
        begin
          Items.GetItem(I).IsEquipped := True;
          Refresh;
          Exit;
        end;
        J := J + 1;
        Continue;
      end;
    end;
  end
  else if (ListBox1.ItemIndex >= 0) then
    if not(ListBox3.Items.Text.Contains(ListBox1.Items[ListBox1.ItemIndex])) then
    begin
      ListBox3.Items.Append(ListBox1.Items[ListBox1.ItemIndex]);
      ListBox1.Items.Delete(ListBox1.ItemIndex);
    end;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  if B then
  begin
    if (ListBox3.ItemIndex < 0) then
      Exit;
    Items.GetItem(ListBox3.ItemIndex).IsEquipped := False;
    Refresh;
  end
  else if (ListBox3.ItemIndex >= 0) then
  begin
    ListBox1.Items.Append(ListBox3.Items[ListBox3.ItemIndex]);
    ListBox3.Items.Delete(ListBox3.ItemIndex);
  end;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  if ListBox2.ItemIndex >= 0 then
  begin
    ListBox1.Items.Append(ListBox2.Items[ListBox2.ItemIndex]);
    ListBox2.Items.Delete(ListBox2.ItemIndex);
  end;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  if ListBox1.ItemIndex >= 0 then
  begin
    ListBox2.Items.Append(ListBox1.Items[ListBox1.ItemIndex]);
    ListBox1.Items.Delete(ListBox1.ItemIndex);
  end;
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
  if B then
  begin
    // Создаем предмет и помещаем в инвентарь
    case ListBox4.ItemIndex of
      0:
        Items.CreateItem(TStaff.Create);
      1:
        Items.CreateItem(TBook.Create);
      2:
        Items.CreateItem(TFlag.Create);
    end;
    Refresh;
  end
  else if ListBox4.ItemIndex >= 0 then
    ListBox2.Items.Append(ListBox4.Items[ListBox4.ItemIndex]);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Items := TItems.Create;
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
  Items.Free;
end;

procedure TForm1.Refresh;
var
  I: Integer;
begin
  // Обновляем список предметов в инвентаре
  ListBox1.Clear;
  ListBox3.Clear;
  for I := 0 to Items.Count - 1 do
    if Items.GetItem(I).IsEquipped then
      ListBox3.Items.Append(Items.GetItem(I).Name)
    else
      ListBox1.Items.Append(Items.GetItem(I).Name);
end;

end.
