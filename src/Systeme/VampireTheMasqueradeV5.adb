with Ada.Text_IO; use Ada.Text_IO;

with Zeug;
with Zufallsgenerator;
with Sprache;
with AnzahlFestlegen;

package body VampireTheMasqueradeV5 is

   procedure VTM5
   is begin
      
      Zeug.NeueZeilen;
      
      EingabeSchleife:
      loop
         
         Put_Line ("Vampire - The Masquerade V5");
         Put_Line (Item => "1 = " & Sprache.Text (TextnummerExtern => 5));
         Put_Line (Item => "2 = Frenzy.");
         Put_Line (Item => Sprache.Text (1));
         
         Get_Immediate (Eingabe);
         
         case
           Eingabe
         is
            when '0' =>
               exit EingabeSchleife;
               
            when '1' =>
               ErfolgsmengeKomplex;
               
            when '2' =>
               Frenzy;
               
            when others =>
               Put_Line (Item => Sprache.Text (TextnummerExtern => 2));
               Zeug.NeueZeilen;
         end case;
         
      end loop EingabeSchleife;
      
      Zeug.NeueZeilen;
      
   end VTM5;
   
   
   
   procedure Frenzy
   is begin
      
      Zeug.NeueZeilen;
      
      Humanity := AnzahlFestlegen.AnzahlFestlegen (TextExtern   => Sprache.Text (TextnummerExtern => 18) & " (1 .. 10).",
                                                   AnfangExtern => 1,
                                                   EndeExtern   => 10);
         
      case
        Humanity
      is
         when 0 =>
            null;
               
         when others =>
            Willpower := AnzahlFestlegen.AnzahlFestlegen (TextExtern   => Sprache.Text (TextnummerExtern => 19) & " (0 .. 30).",
                                                          AnfangExtern => 0,
                                                          EndeExtern   => 30);
      
            Humanity := Humanity / 3;
            Gesamtwürfelmenge := Humanity + Willpower;
            
            if
              Gesamtwürfelmenge = 0
            then
               Gesamtwürfelmenge := 1;
               
            else
               null;
            end if;
            
            Erfolgsmenge (WürfelanzahlExtern => Gesamtwürfelmenge);
      end case;
      
      Zeug.NeueZeilen;
      
   end Frenzy;
   
   
      
   procedure Erfolgsmenge
     (WürfelanzahlExtern : in Natural)
   is begin
      
      Erfolge := 0;
      Misserfolge := 0;
      Zehner := 0;
      Einser := 0;
      
      WürfelSchleife:
      for WürfelSchleifenwert in 1 .. WürfelanzahlExtern loop
                        
         GezogeneZahl := Zufallsgenerator.Würfelergebnis (SeitenanzahlExtern => 10);
         
         case
           GezogeneZahl
         is
            when 10 =>
               Zehner := Zehner + 1;
               Erfolge := Erfolge + 1;
               
            when 6 .. 9 =>
               Erfolge := Erfolge + 1;
               
            when 1 =>
               Einser := Einser + 1;
               Misserfolge := Misserfolge + 1;
               
            when others =>
               Misserfolge := Misserfolge + 1;
         end case;
         
         Put (GezogeneZahl'Image);
         
         if
           WürfelSchleifenwert = WürfelanzahlExtern
         then
            null;
               
         else
            Put (Item => ",");
         end if;
         
      end loop WürfelSchleife;
      
      Kritisch := Zehner;
      Gesamterfolge := Erfolge;
      
      KritischerErfolgSchleife:
      while Kritisch >= 2 loop
         
         Gesamterfolge := Gesamterfolge + 2;
         Kritisch := Kritisch - 2;
         
      end loop KritischerErfolgSchleife;
      
      New_Line;
      Put_Line (Item => Sprache.Text (TextnummerExtern => 20) & Erfolge'Image & ",    " & Sprache.Text (TextnummerExtern => 21) & Misserfolge'Image);
      Put_Line (Item => Sprache.Text (TextnummerExtern => 22) & Einser'Image & ",    " & Sprache.Text (TextnummerExtern => 23) & Zehner'Image);
      Put_Line (Item => Sprache.Text (TextnummerExtern => 28) & Gesamterfolge'Image);
      
      Zeug.NeueZeilen;
      
   end Erfolgsmenge;
   
   
   
   procedure ErfolgsmengeKomplex
   is begin
      
      Gesamtwürfelmenge := AnzahlFestlegen.AnzahlFestlegen (TextExtern   => Sprache.Text (TextnummerExtern => 4) & " (1 .. 50).",
                                                             AnfangExtern => 1,
                                                             EndeExtern   => 50);
      
      case
        Gesamtwürfelmenge
      is
         when 0 =>
            Zeug.NeueZeilen;
            return;
         
         when others =>
            Hunger := AnzahlFestlegen.AnzahlFestlegen (TextExtern   => Sprache.Text (TextnummerExtern => 29) & " (0 .. 5).",
                                                       AnfangExtern => 0,
                                                       EndeExtern   => 5);
            New_Line;
            Normalwürfe := (others => 0);
            Hungerwürfe := (others => 0);
      end case;
      
      if
        Hunger >= Gesamtwürfelmenge
      then
         Hunger := Gesamtwürfelmenge;
         Standardwürfel := 0;
         
      else
         Standardwürfel := Gesamtwürfelmenge - Hunger;
         Put_Line (Item => Sprache.Text (TextnummerExtern => 5));
      end if;
      
      Zehner := 0;
      Erfolge := 0;
      Misserfolge := 0;
      Einser := 0;
         
      Hungerzehner := 0;
      Hungererfolge := 0;
      Hungermisserfolge := 0;
      Hungereinser := 0;
                     
      WürfelSchleife:
      for WürfelSchleifenwert in 1 .. Standardwürfel loop
                        
         Normalwürfe (WürfelSchleifenwert) := Zufallsgenerator.Würfelergebnis (SeitenanzahlExtern => 10);
         
         case
           Normalwürfe (WürfelSchleifenwert)
         is
            when 10 =>
               Zehner := Zehner + 1;
               Erfolge := Erfolge + 1;
               
            when 6 .. 9 =>
               Erfolge := Erfolge + 1;
               
            when 1 =>
               Einser := Einser + 1;
               Misserfolge := Misserfolge + 1;
               
            when others =>
               Misserfolge := Misserfolge + 1;
         end case;
         
         Put (Normalwürfe (WürfelSchleifenwert)'Image);
         
         if
           WürfelSchleifenwert = Standardwürfel
         then
            null;
               
         else
            Put (Item => ",");
         end if;
         
      end loop WürfelSchleife;
      
      case
        Hunger
      is
         when 0 =>
            null;
            
         when others =>
            New_Line;
            New_Line;
            Put_Line (Item => Sprache.Text (TextnummerExtern => 30));
      end case;
      
      HungerSchleife:
      for HungerSchleifenwert in 1 .. Hunger loop
         
         Hungerwürfe (HungerSchleifenwert) := Zufallsgenerator.Würfelergebnis (SeitenanzahlExtern => 10);
         
         case
           Hungerwürfe (HungerSchleifenwert)
         is
            when 10 =>
               Hungerzehner := Hungerzehner + 1;
               Hungererfolge := Hungererfolge + 1;
               
            when 6 .. 9 =>
               Hungererfolge := Hungererfolge + 1;
               
            when 1 =>
               Hungereinser := Hungereinser + 1;
               Hungermisserfolge := Hungermisserfolge + 1;
               
            when others =>
               Hungermisserfolge := Hungermisserfolge + 1;
         end case;
         
         Put (Hungerwürfe (HungerSchleifenwert)'Image);
         
         if
           HungerSchleifenwert = Hunger
         then
            null;
               
         else
            Put (Item => ",");
         end if;
         
      end loop HungerSchleife;
      
      Kritisch := Zehner + Hungerzehner;
      Zwischenspeicher := Erfolge;
      
      KritischerErfolgSchleife:
      while Kritisch >= 2 loop
         
         Zwischenspeicher := Zwischenspeicher + 2;
         Kritisch := Kritisch - 2;
         
      end loop KritischerErfolgSchleife;
      
      Gesamterfolge := Zwischenspeicher + Hungererfolge;
      
      Würfelergebnisse (ErfolgeExtern           => Erfolge,
                         MisserfolgeExtern       => Misserfolge,
                         EinserExtern            => Einser,
                         ZehnerExtern            => Zehner,
                         HungererfolgeExtern     => Hungererfolge,
                         HungermisserfolgeExtern => Hungermisserfolge,
                         HungereinserExtern      => Hungereinser,
                         HungerzehnerExtern      => Hungerzehner,
                         GesamterfolgeExtern     => Gesamterfolge);
            
      case
        Standardwürfel
      is
         when 0 =>
            SchwierigkeitsgradFestlegen (GesamterfolgeExtern => Gesamterfolge,
                                         HungereinserExtern  => Hungereinser,
                                         ZehnerExtern        => Zehner,
                                         HungerzehnerExtern  => Hungerzehner);
            return;
            
         when 1 .. 3 =>
            ReRolls := Standardwürfel;
            
         when others =>
            ReRolls := 3;
      end case;
      
      ReRollSchleife:
      loop
         
         New_Line;
         Put_Line (Item => "1 = ReRoll.");
         Put_Line (Item => Sprache.Text (1));
         
         Get_Immediate (Eingabe);
         
         case
           Eingabe
         is
            when '0' =>
               SchwierigkeitsgradFestlegen (GesamterfolgeExtern => Gesamterfolge,
                                            HungereinserExtern  => Hungereinser,
                                            ZehnerExtern        => Zehner,
                                            HungerzehnerExtern  => Hungerzehner);
               return;
               
            when '1' =>
               exit ReRollSchleife;
               
            when others =>
               null;
         end case;
         
      end loop ReRollSchleife;
      
      AnzahlReRolls := AnzahlFestlegen.AnzahlFestlegen (TextExtern   => Sprache.Text (TextnummerExtern => 31) & " (1 .." & ReRolls'Image & ").",
                                                        AnfangExtern => 1,
                                                        EndeExtern   => ReRolls);
      
      case
        AnzahlReRolls
      is
         when 0 =>
            return;
            
         when others =>
            null;
      end case;
      
      case
        Zehner
      is
         when 0 =>
            ReRoll := Misserfolge_Enum;
            
         when others =>
            ZehnerReRollSchleife:
            loop
         
               New_Line;
               Sprache.VTM5ReRoll;
               Put_Line (Item => Sprache.Text (1));
         
               Get_Immediate (Eingabe);
         
               case
                 Eingabe
               is
                  when '0' =>
                     return;
               
                  when '1' =>
                     ReRoll := Misserfolge_Enum;
                     exit ZehnerReRollSchleife;
               
                  when '2' =>
                     ReRoll := Zehner_Enum;
                     exit ZehnerReRollSchleife;
                     
                  when '3' =>
                     ReRoll := Zehner_Misserfolge_Enum;
                     exit ZehnerReRollSchleife;
               
                  when others =>
                     null;
               end case;
               
            end loop ZehnerReRollSchleife;
      end case;
      
      New_Line;
      Put_Line (Item => "ReRolls:");
      
      case
        ReRoll
      is
         when Misserfolge_Enum =>
            if
              Misserfolge < AnzahlReRolls
            then
               Zwischenspeicher := Misserfolge;
               
            else
               Zwischenspeicher := AnzahlReRolls;
            end if;
            
            MisserfolgeSchleife:
            for MisserfolgeSchleifenwert in 1 .. Standardwürfel loop
               
               if
                 Normalwürfe (MisserfolgeSchleifenwert) = 0
               then
                  exit MisserfolgeSchleife;
                  
               elsif
                 Normalwürfe (MisserfolgeSchleifenwert) < 5
               then
                  Normalwürfe (MisserfolgeSchleifenwert) := Zufallsgenerator.Würfelergebnis (SeitenanzahlExtern => 10);
                  Zwischenspeicher := Zwischenspeicher - 1;
                  Put (Normalwürfe (MisserfolgeSchleifenwert)'Image);
                  Put (",");
                  
               else
                  null;
               end if;
               
               case
                 Zwischenspeicher
               is
                  when 0 =>
                     exit MisserfolgeSchleife;
                     
                  when others =>
                     null;
               end case;
               
            end loop MisserfolgeSchleife;
            
         when Zehner_Enum =>
            if
              Zehner < AnzahlReRolls
            then
               Zwischenspeicher := Zehner;
               
            else
               Zwischenspeicher := AnzahlReRolls;
            end if;
            
            ZehnerSchleife:
            for ZehnerSchleifenwert in 1 .. Standardwürfel loop
               
               if
                 Normalwürfe (ZehnerSchleifenwert) = 0
               then
                  exit ZehnerSchleife;
                  
               elsif
                 Normalwürfe (ZehnerSchleifenwert) = 10
               then
                  Normalwürfe (ZehnerSchleifenwert) := Zufallsgenerator.Würfelergebnis (SeitenanzahlExtern => 10);
                  Zwischenspeicher := Zwischenspeicher - 1;
                  Put (Normalwürfe (ZehnerSchleifenwert)'Image);
                  Put (",");
                  
               else
                  null;
               end if;
               
               case
                 Zwischenspeicher
               is
                  when 0 =>
                     exit ZehnerSchleife;
                     
                  when others =>
                     null;
               end case;
               
            end loop ZehnerSchleife;
            
         when Zehner_Misserfolge_Enum =>
            if
              Zehner + Misserfolge < AnzahlReRolls
            then
               Zwischenspeicher := Zehner + Misserfolge;
               
            else
               Zwischenspeicher := AnzahlReRolls;
            end if;
            
            ZehnerMisserfolgeSchleife:
            for ZehnerMisserfolgeSchleifenwert in 1 .. Standardwürfel loop
               
               if
                 Normalwürfe (ZehnerMisserfolgeSchleifenwert) = 0
               then
                  exit ZehnerMisserfolgeSchleife;
                  
               elsif
                 Normalwürfe (ZehnerMisserfolgeSchleifenwert) < 5
                 or
                   Normalwürfe (ZehnerMisserfolgeSchleifenwert) = 10
               then
                  Normalwürfe (ZehnerMisserfolgeSchleifenwert) := Zufallsgenerator.Würfelergebnis (SeitenanzahlExtern => 10);
                  Zwischenspeicher := Zwischenspeicher - 1;
                  Put (Normalwürfe (ZehnerMisserfolgeSchleifenwert)'Image);
                  Put (",");
                  
               else
                  null;
               end if;
               
               case
                 Zwischenspeicher
               is
                  when 0 =>
                     exit ZehnerMisserfolgeSchleife;
                     
                  when others =>
                     null;
               end case;
               
            end loop ZehnerMisserfolgeSchleife;
      end case;
      
      Zehner := 0;
      Erfolge := 0;
      Misserfolge := 0;
      Einser := 0;
            
      New_Line;
      Put_Line (Item => Sprache.Text (TextnummerExtern => 5));
      
      ErneutesZählenSchleife:
      for ErneutesZählenSchleifenwert in 1 .. Standardwürfel loop
        
         case
           Normalwürfe (ErneutesZählenSchleifenwert)
         is
            when 10 =>
               Zehner := Zehner + 1;
               Erfolge := Erfolge + 1;
               
            when 6 .. 9 =>
               Erfolge := Erfolge + 1;
               
            when 1 =>
               Einser := Einser + 1;
               Misserfolge := Misserfolge + 1;
               
            when others =>
               Misserfolge := Misserfolge + 1;
         end case;
         
         Put (Normalwürfe (ErneutesZählenSchleifenwert)'Image);
         
         if
           ErneutesZählenSchleifenwert = Standardwürfel
         then
            null;
               
         else
            Put (Item => ",");
         end if;
      
      end loop ErneutesZählenSchleife;
      
      Kritisch := Zehner + Hungerzehner;
      Zwischenspeicher := Erfolge;
      
      ZweiteKritischerErfolgSchleife:
      while Kritisch >= 2 loop
         
         Zwischenspeicher := Zwischenspeicher + 2;
         Kritisch := Kritisch - 2;
         
      end loop ZweiteKritischerErfolgSchleife;
      
      Gesamterfolge := Zwischenspeicher + Hungererfolge;
      
      case
        Hunger is
         when 0 =>
            null;
            
         when others =>
            New_Line;
            Put_Line (Item => Sprache.Text (TextnummerExtern => 30));
            
            ErneuteHungerSchleife:
            for ErneuteHungerSchleifenwert in 1 .. Hunger loop
                  
               Put (Hungerwürfe (ErneuteHungerSchleifenwert)'Image);
         
               if
                 ErneuteHungerSchleifenwert = Hunger
               then
                  null;
               
               else
                  Put (Item => ",");
               end if;
         
            end loop ErneuteHungerSchleife;
      end case;
      
      Würfelergebnisse (ErfolgeExtern           => Erfolge,
                         MisserfolgeExtern       => Misserfolge,
                         EinserExtern            => Einser,
                         ZehnerExtern            => Zehner,
                         HungererfolgeExtern     => Hungererfolge,
                         HungermisserfolgeExtern => Hungermisserfolge,
                         HungereinserExtern      => Hungereinser,
                         HungerzehnerExtern      => Hungerzehner,
                         GesamterfolgeExtern     => Gesamterfolge);
      
      SchwierigkeitsgradFestlegen (GesamterfolgeExtern => Gesamterfolge,
                                   HungereinserExtern  => Hungereinser,
                                   ZehnerExtern        => Zehner,
                                   HungerzehnerExtern  => Hungerzehner);
      
   end ErfolgsmengeKomplex;
   
   
   
   procedure Würfelergebnisse
     (ErfolgeExtern : in Natural;
      MisserfolgeExtern : in Natural;
      EinserExtern : in Natural;
      ZehnerExtern : in Natural;
      HungererfolgeExtern : in Natural;
      HungermisserfolgeExtern : in Natural;
      HungereinserExtern : in Natural;
      HungerzehnerExtern : in Natural;
      GesamterfolgeExtern : in Natural)
   is begin
      
      New_Line;
      New_Line;
      Put_Line (Item => Sprache.Text (TextnummerExtern => 20) & ErfolgeExtern'Image & ",    " & Sprache.Text (TextnummerExtern => 21) & MisserfolgeExtern'Image);
      Put_Line (Item => Sprache.Text (TextnummerExtern => 22) & EinserExtern'Image & ",    " & Sprache.Text (TextnummerExtern => 23) & ZehnerExtern'Image);
      
      New_Line;
      Put_Line (Item => Sprache.Text (TextnummerExtern => 24) & HungererfolgeExtern'Image & ",    " & Sprache.Text (TextnummerExtern => 25) & HungermisserfolgeExtern'Image);
      Put_Line (Item => Sprache.Text (TextnummerExtern => 26) & HungereinserExtern'Image & ",    " & Sprache.Text (TextnummerExtern => 27) & HungerzehnerExtern'Image);
      New_Line;
      Put_Line (Item => Sprache.Text (TextnummerExtern => 28) & GesamterfolgeExtern'Image);
      
   end Würfelergebnisse;
   
   
   
   procedure SchwierigkeitsgradFestlegen
     (GesamterfolgeExtern : in Natural;
      HungereinserExtern : in Natural;
      ZehnerExtern : in Natural;
      HungerzehnerExtern : in Natural)
   is begin
      
      Schwierigkeitsgrad := AnzahlFestlegen.AnzahlFestlegen (TextExtern   => Sprache.Text (TextnummerExtern => 32) & " (1 .. 100).",
                                                             AnfangExtern => 1,
                                                             EndeExtern   => 100);
      
      if
        Schwierigkeitsgrad = 0
      then
         null;
         
      elsif
        GesamterfolgeExtern < Schwierigkeitsgrad
        and
          HungereinserExtern >= 1
      then
         Put_Line (Item => "Bestial Failure.");
         
      elsif
        GesamterfolgeExtern < Schwierigkeitsgrad
      then
         Put_Line (Item => "Failure.");
         
      elsif
        (ZehnerExtern >= 1
         and
           HungerzehnerExtern >= 1)
        or
          HungerzehnerExtern >= 2
      then
         Put_Line (Item => "Messy Crit.");
         
      elsif
        ZehnerExtern >= 2
      then
         Put_Line (Item => "Critical Success.");
         
      else
         Put_Line (Item => "Success.");
      end if;
      
      Zeug.NeueZeilen;
      
   end SchwierigkeitsgradFestlegen;

end VampireTheMasqueradeV5;
