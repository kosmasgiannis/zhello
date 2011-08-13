unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  qt,zoom, Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    Edit1: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Edit2: TEdit;
    Edit3: TEdit;
    Memo1: TMemo;
    Edit4: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    Button1: TButton;
    Button2: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure zoomtest(hostname : string; portnum: word; databasename: string; searchstr : string; lines: Tstrings);
var ZOOM_options, ZOOM_rec, ZOOM_connection, r : Pvariant;
    Rlen, errcode, i, rssize : integer;
    q, type_spec,key,value : string;
    zraw_record, addinfo,errmsg : PChar;
    raw_record: string;
    PRlen : Pinteger;
begin
  lines.Clear;
  type_spec:='raw';
  ZOOM_options := ZOOM_options_create();
  ZOOM_connection := ZOOM_connection_create(ZOOM_options);
  key:='databaseName'; value:=databasename;
  ZOOM_connection_option_set(ZOOM_connection,PChar(key),PChar(value));
  key:='preferredRecordSyntax'; value:='USMARC';
  ZOOM_connection_option_set(ZOOM_connection,PChar(key),PChar(value));
  key:='elementSetName'; value:='F';
  ZOOM_connection_option_set(ZOOM_connection,PChar(key),PChar(value));

  ZOOM_connection_connect(ZOOM_connection,Pchar(hostname),portnum);
  errcode := ZOOM_connection_errcode(ZOOM_connection);
  if (errcode = 0) then
  begin
   q:=searchstr;
   r := ZOOM_connection_search_pqf(ZOOM_connection,PChar(q));

   rssize := ZOOM_resultset_size(r);
   lines.Add('Hits :'+inttostr(rssize));
   if rssize > 0 then
   begin
    if rssize > 3 then rssize:=3;
    lines.Add('up to 3 are displayed here');
   end;
   for i:=0 to rssize-1 do
   begin
    ZOOM_Rec := ZOOM_resultset_record(r,i);
    PRlen := @Rlen;
    zraw_record:=ZOOM_record_get(ZOOM_Rec,PChar(type_spec),PRlen);
    raw_record:=zraw_record;
    setlength(raw_record,Rlen);
    lines.Add('>'+raw_record);
   end;
   ZOOM_resultset_destroy(r);
   ZOOM_connection_destroy(ZOOM_connection);
  end
  else
  begin
   errmsg := ZOOM_connection_errmsg(ZOOM_connection);
   addinfo := ZOOM_connection_addinfo(ZOOM_connection);
   lines.add('Error ('+inttostr(errcode)+'): '+errmsg+' Additional Info:"'+addinfo+'"');
  end;
end;

procedure Scantest(hostname : string; portnum: word; databasename:
string; searchstr : string; lines: TStrings);
var ZOOM_options, ZOOM_connection : Pvariant;
    len, errcode, i, rssize : integer;
    q,key,value : string;
    Scan_record: String;
    occ:Integer;
    Scan_Result:PVariant;
    PRlen,PROcc : Pinteger;
begin
  lines.Clear;
  ZOOM_options := ZOOM_options_create();
  ZOOM_connection := ZOOM_connection_create(ZOOM_options);
  key:='databaseName'; value:=databasename;
  ZOOM_connection_option_set(ZOOM_connection,PChar(key),PChar(value));
  key:='preferredRecordSyntax';
  value:='USMARC';
  ZOOM_connection_option_set(ZOOM_connection,PChar(key),PChar(value));
  key:='elementSetName';
  value:='F';
  ZOOM_connection_option_set(ZOOM_connection,PChar(key),PChar(value));
  ZOOM_connection_connect(ZOOM_connection,Pchar(hostname),portnum);
  errcode := ZOOM_connection_errcode(ZOOM_connection);
  if (errcode = 0) then
  begin
   q:=searchstr;
   Scan_Result:=ZOOM_connection_scan(ZOOM_connection, PChar(q));
   rssize := ZOOM_scanset_size(Scan_Result);
   lines.Add('Hits :'+inttostr(rssize));
   for i:=0 to rssize-1 do
   begin
    PRlen := @len;
    PROcc := @Occ;
    scan_Record:=ZOOM_scanset_display_term(Scan_Result,i,PROcc, PRlen);
    SetLength(scan_Record,Len);
    lines.Add('>'+scan_record+' ('+inttostr(occ)+')');
   end;
   ZOOM_connection_destroy(ZOOM_connection);
  end
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
 initzoom;
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
 zoomterminate;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
zoomtest(edit1.Text, strtointdef(edit2.text,0), edit3.Text,edit4.Text, memo1.lines);
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
scantest(edit1.Text, strtointdef(edit2.text,0), edit3.Text,edit4.Text, memo1.lines);
end;

end.
