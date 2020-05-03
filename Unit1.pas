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
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses Unit2;

var
  Items: TItems;

procedure TForm1.Button1Click(Sender: TObject);
begin
  if (ListBox1.ItemIndex >= 0) then
    if not(ListBox3.Items.Text.Contains(ListBox1.Items[ListBox1.ItemIndex])) then
    begin
      ListBox3.Items.Append(ListBox1.Items[ListBox1.ItemIndex]);
      ListBox1.Items.Delete(ListBox1.ItemIndex);
    end;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  if (ListBox3.ItemIndex >= 0) then
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
  if ListBox4.ItemIndex >= 0 then
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

end.
