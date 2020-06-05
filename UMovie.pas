unit UMovie;

interface

type
  TMovie = class
    Name : string;
    Producer : string;
    Actors: string;
    Description: string;

    constructor Create();  overload;
    constructor Create(AName, AProducer, AActors, ADescription: string); overload;
  end;

implementation
constructor TMovie.Create();
begin
  Name := '';
  Producer := '';
  Actors := '';
  Description := '';
end;

constructor TMovie.Create(AName, AProducer, AActors, ADescription: string);
begin
  inherited Create;
  Name:= AName;
  Producer:= AProducer;
  Actors:= AActors;
  Description:= ADescription;
end;

end.
