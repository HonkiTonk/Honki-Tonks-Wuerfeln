private with Ada.Numerics.Discrete_Random;

package Zufallsgenerator is
   pragma Elaborate_Body;

   procedure Würfel
     (SeitenanzahlExtern : in Positive;
      WürfelanzahlExtern : in Positive);
   
   
   
   function Würfelergebnis
     (SeitenanzahlExtern : in Positive)
      return Positive;
   
private
   
   
   package Zahlenbereich is new Ada.Numerics.Discrete_Random (Result_Subtype => Integer);
   
   GewählteZahl : Zahlenbereich.Generator;

end Zufallsgenerator;
