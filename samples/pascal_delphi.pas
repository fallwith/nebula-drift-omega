program NebulaDriftRosetteSample;

{$APPTYPE CONSOLE}

uses
  SysUtils, StrUtils;

type
  TPaletteEntry = record
    Name: string;
    Hex: string;
    Enabled: Boolean;
  end;

procedure PrintEntry(const Entry: TPaletteEntry);
begin
  Writeln(Format('%s = %s (%s)', [
    Entry.Name,
    Entry.Hex,
    IfThen(Entry.Enabled, 'on', 'off')
  ]));
end;

var
  Entry: TPaletteEntry;
  Entries: array[0..2] of TPaletteEntry;
  I: Integer;
begin
  try
    Entry.Name := 'VioletFlame';
    Entry.Hex := '#A06DC8';
    Entry.Enabled := True;
    PrintEntry(Entry);

    Entries[0].Name := 'StellarRed';
    Entries[0].Hex := '#C43030';
    Entries[0].Enabled := True;
    Entries[1].Name := 'CelestialBlue';
    Entries[1].Hex := '#8AB4E8';
    Entries[1].Enabled := True;
    Entries[2].Name := 'Stardust';
    Entries[2].Hex := '#4A3A6A';
    Entries[2].Enabled := False;

    for I := Low(Entries) to High(Entries) do
    begin
      case Entries[I].Enabled of
        True: Writeln('Enabled -> ', Entries[I].Name);
        False: Writeln('Disabled -> ', Entries[I].Name);
      end;
      PrintEntry(Entries[I]);
    end;
  except
    on E: Exception do
      Writeln('Error: ', E.Message);
  end;
end.
