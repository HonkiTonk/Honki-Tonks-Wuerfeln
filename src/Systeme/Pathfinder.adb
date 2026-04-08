with Ada.Text_IO; use Ada.Text_IO;

with Zeug;
with Sprache;
with Wuerfelgruppen;
with AnzahlFestlegen;

package body Pathfinder is

   procedure Pathfinder
   is begin
      
      Zeug.NeueZeilen;
      
      EingabeSchleife:
      loop
         
         Put_Line ("Pathfinder");
         Sprache.Pathfinder;
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
               
            when '2' =>
               Wuerfelgruppen.AlleWerte (SeitenanzahlExtern => 6,
                                         WürfelanzahlExtern => 3,
                                         DurchläufeExtern   => 6,
                                         ZusatzwertExtern   => 0);
               
            when '3' =>
               Wuerfelgruppen.AlleWerte (SeitenanzahlExtern => 6,
                                         WürfelanzahlExtern => 2,
                                         DurchläufeExtern   => 6,
                                         ZusatzwertExtern   => 6);
               
            when '4' =>
               Würfelpool;
               
            when others =>
               Put_Line (Item => Sprache.Text (TextnummerExtern => 2));
               Zeug.NeueZeilen;
         end case;
         
      end loop EingabeSchleife;
      
      Zeug.NeueZeilen;
      
   end Pathfinder;
   
   
   
   procedure Würfelpool
   is begin
      
      Würfelvorrat := AnzahlFestlegen.AnzahlFestlegen (TextExtern   => Sprache.Text (33) & " (24 .. 28).",
                                                        AnfangExtern => 24,
                                                        EndeExtern   => 28);
      
      case
        Würfelvorrat
      is
         when 0 =>
            null;
            
         when others =>
            NochZuWürfeln := 6;
      end case;
      
      WürfelvorratSchleife:
      while Würfelvorrat > 0 loop
         
         Put_Line (Sprache.Text (34) & Würfelvorrat'Image);
         Put_Line (Sprache.Text (35) & NochZuWürfeln'Image);
         
         MaximaleWürfelmenge := Würfelvorrat - (NochZuWürfeln - 1) * 3;
         
         if
           NochZuWürfeln > 1
         then
            Würfelmenge := AnzahlFestlegen.AnzahlFestlegen (TextExtern   => Sprache.Text (4) & " (3 .." & MaximaleWürfelmenge'Image & ").",
                                                             AnfangExtern => 3,
                                                             EndeExtern   => MaximaleWürfelmenge);
            
         else
            Würfelmenge := Würfelvorrat;
         end if;
         
         case
           Würfelmenge
         is
            when 0 =>
               exit WürfelvorratSchleife;
               
            when others =>
               Wuerfelgruppen.NurHöchstwerte (SeitenanzahlExtern        => 6,
                                              WürfelanzahlExtern        => Würfelmenge,
                                              DurchläufeExtern          => 1,
                                              WievieleHöchstwerteExtern => 3);
               
               NochZuWürfeln := NochZuWürfeln - 1;
         end case;
         
         case
           NochZuWürfeln
         is
            when 0 =>
               exit WürfelvorratSchleife;
               
            when others =>
               Würfelvorrat := Würfelvorrat - Würfelmenge;
         end case;
         
      end loop WürfelvorratSchleife;
      
      Zeug.NeueZeilen;
      
   end Würfelpool;

end Pathfinder;
