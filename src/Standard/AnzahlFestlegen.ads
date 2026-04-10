package AnzahlFestlegen is
   pragma Elaborate_Body;
   
   function Würfelanzahl
     return Natural;
   
   function SeitenanzahlFestlegen
     return Natural;
   
   function AnzahlFestlegen
     (TextExtern : in String;
      AnfangExtern : in Natural;
      EndeExtern : in Positive)
      return Natural
     with
       Pre => (
                 TextExtern'Length > 0
               and
                 AnfangExtern <= EndeExtern
              );
   
private
   
   Eingabe : Character;
   
   Testergebnis : Integer;

end AnzahlFestlegen;
