with Ada.Text_IO; use Ada.Text_IO;

with CallOfCthulhu;
with Zeug;
with DungeonAndDragons;
with VampireTheMasqueradeV5;
with Sprache;
with Pathfinder;

package body Systemauswahl is

   procedure Systemauswahl
   is begin
      
      Zeug.NeueZeilen;
      
      EingabeSchleife:
      loop
         
         Put_Line (Item => "1 = Dungeons and Dragon.");
         Put_Line (Item => "2 = Vampire - The Masquerade V5.");
         Put_Line (Item => "3 = Call of Cthulhu.");
         Put_Line (Item => "4 = Pathfinder.");
         Put_Line (Item => Sprache.Text (TextnummerExtern => 1));
         
         Get_Immediate (Eingabe);
         
         case
           Eingabe
         is
            when '0' =>
               exit EingabeSchleife;
               
            when '1' =>
               DungeonAndDragons.DnD;
               
            when '2' =>
               VampireTheMasqueradeV5.VTM5;
               
            when '3' =>
               CallOfCthulhu.CoC;
               
            when '4' =>
               Pathfinder.Pathfinder;
               
            when others =>
               Put_Line (Item => Sprache.Text (TextnummerExtern => 2));
               Zeug.NeueZeilen;
         end case;
         
      end loop EingabeSchleife;
      
      Zeug.NeueZeilen;
      
   end Systemauswahl;

end Systemauswahl;
