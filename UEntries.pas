unit UEntries;

interface
uses UMovie;
type

  TKey = string;
  TValue = TMovie;

  TFile = TextFile;
  
  THashEntry = class
    key:TKey;
    value: TValue;
    constructor Create(key: TKey; value:TValue);
  end;

  //LinkedList
  TBase = THashEntry;
  TListEntry = class
		data:TBase;
		next:TListEntry;
    constructor Create(data: TBase; next:TListEntry);
	end;

implementation
constructor THashEntry.Create(key: TKey; value:TValue);
begin
  inherited Create;
  self.key := key;
  self.value := value;
end;

constructor TListEntry.Create(data: TBase; next:TListEntry);
begin
  inherited Create;
  self.data := data;
  self.next := next;
end;
end.
