package NormaleWuerfel is
   pragma Elaborate_Body;
   
   procedure Standardwürfel;
   procedure NutzerdefinierterWürfel;
   
private
   
   Eingabe : Character;
   
   AnzahlWürfel : Natural;
   Seitenanzahl : Natural;
   
   type StandardwürfelkonstantenArray is array (1 .. 9) of Positive;
   Standardwürfelkonstanten : constant StandardwürfelkonstantenArray := (
                                                                           1 => 2,
                                                                           2 => 4,
                                                                           3 => 6,
                                                                           4 => 8,
                                                                           5 => 10,
                                                                           6 => 12,
                                                                           7 => 20,
                                                                           8 => 100,
                                                                           9 => 1_000
                                                                          );

end NormaleWuerfel;
