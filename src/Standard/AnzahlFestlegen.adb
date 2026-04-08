with Ada.Text_IO; use Ada.Text_IO;

with Sprache;
with Tests;
with Zeug;

package body AnzahlFestlegen is
   
   function SeitenanzahlFestlegen
     return Natural
   is begin
      
      return AnzahlFestlegen (TextExtern   => Sprache.Text (TextnummerExtern => 3) & " (1 .. 999_999_999).",
                              AnfangExtern => 1,
                              EndeExtern   => 999_999_999);
      
   end SeitenanzahlFestlegen;
   
   
   
   function Würfelanzahl
     return Natural
   is begin
      
      return AnzahlFestlegen (TextExtern   => Sprache.Text (TextnummerExtern => 4) & " (1 .. 999_999_999).",
                              AnfangExtern => 1,
                              EndeExtern   => 999_999_999);
      
   end Würfelanzahl;
   
   
   
   function AnzahlFestlegen
     (TextExtern : in String;
      AnfangExtern : in Natural;
      EndeExtern : in Positive)
      return Natural
   is begin
      
      New_Line;
      
      EingabeSchleife:
      loop
         
         Put_Line (Item => TextExtern);
         
         case
           AnfangExtern
         is
            when 0 =>
               null;
               
            when others =>
               Put_Line (Item => Sprache.Text (TextnummerExtern => 1));
         end case;
         
         Testergebnis := Tests.ErlaubteZahl (EingabeExtern => Get_Line);
         
         if
           Testergebnis = 0
           or
             Testergebnis in AnfangExtern .. EndeExtern
         then
            return Testergebnis;
              
         else
            Put_Line (Item => Sprache.Text (TextnummerExtern => 2));
            Zeug.NeueZeilen;
         end if;
         
      end loop EingabeSchleife;
      
   end AnzahlFestlegen;

end AnzahlFestlegen;
