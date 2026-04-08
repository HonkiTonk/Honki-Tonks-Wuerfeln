with Ada.Text_IO; use Ada.Text_IO;

with Zeug;
with Wuerfelgruppen;
with Sprache;

package body DungeonAndDragons is

   procedure DnD
   is begin
      
      Zeug.NeueZeilen;
      
      EingabeSchleife:
      loop
         
         Put_Line ("Dungeon and Dragons");
         Put_Line (Item => "1 = Ability Scores.");
         Put_Line (Item => Sprache.Text (1));
         
         Get_Immediate (Eingabe);
         
         case
           Eingabe
         is
            when '0' =>
               exit EingabeSchleife;
               
            when '1' =>
               Wuerfelgruppen.OhneNiedrigstenWert (SeitenanzahlExtern => 6,
                                                   WürfelanzahlExtern => 4,
                                                   DurchläufeExtern   => 6);
               
            when others =>
               Put_Line (Item => Sprache.Text (TextnummerExtern => 2));
               Zeug.NeueZeilen;
         end case;
         
      end loop EingabeSchleife;
      
      Zeug.NeueZeilen;
      
   end DnD;

end DungeonAndDragons;
