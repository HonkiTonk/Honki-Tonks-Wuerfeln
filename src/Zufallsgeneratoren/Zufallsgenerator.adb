with Ada.Text_IO; use Ada.Text_IO;

with Zeug;

package body Zufallsgenerator is
   
   function Würfelergebnis
     (SeitenanzahlExtern : in Positive)
      return Positive
   is begin
      
      Zahlenbereich.Reset (Gen => GewählteZahl);
      
      return Zahlenbereich.Random (Gen   => GewählteZahl,
                                   First => 1,
                                   Last  => SeitenanzahlExtern);
                              
   end Würfelergebnis;
   
   

   procedure Würfel
     (SeitenanzahlExtern : in Positive;
      WürfelanzahlExtern : in Positive)
   is begin
      
      WürfelSchleife:
      for WürfelSchleifenwert in 1 .. WürfelanzahlExtern loop
         
         Put (Würfelergebnis (SeitenanzahlExtern => SeitenanzahlExtern)'Image);
         
         if
           WürfelSchleifenwert = WürfelanzahlExtern
         then
            Zeug.NeueZeilen;
               
         else
            Put (Item => ",");
         end if;
         
      end loop WürfelSchleife;
      
   end Würfel;

end Zufallsgenerator;
