with Ada.Text_IO; use Ada.Text_IO;

with Zufallsgenerator;
with Zeug;

package body Wuerfelgruppen is
   
   -- Funktioniert aktuell nur mit maximal 15 Würfeln.
   procedure OhneNiedrigstenWert
     (SeitenanzahlExtern : in Positive;
      WürfelanzahlExtern : in Positive;
      DurchläufeExtern : in Positive)
   is begin
      
      DurchläufeSchleife:
      for DurchläufeSchleifenwert in 1 .. DurchläufeExtern loop
         
         GezogeneZahlen := (others => 0);
      
         WürfelSchleife:
         for WürfelSchleifenwert in 1 .. WürfelanzahlExtern loop
               
            GezogeneZahlen (WürfelSchleifenwert) := Zufallsgenerator.Würfelergebnis (SeitenanzahlExtern => SeitenanzahlExtern);
         
            Put (GezogeneZahlen (WürfelSchleifenwert)'Image);
         
            if
              WürfelSchleifenwert = WürfelanzahlExtern
            then
               Put_Line (Item => "    Ability Score:" & SummeOhneNiedrigstenWert (ZahlenExtern => GezogeneZahlen)'Image);
               
            else
               Put (",");
            end if;
         
         end loop WürfelSchleife;
      end loop DurchläufeSchleife;
      
      Zeug.NeueZeilen;
      
   end OhneNiedrigstenWert;
   
   
   
   function SummeOhneNiedrigstenWert
     (ZahlenExtern : in GezogeneZahlenArray)
      return Positive
   is begin
      
      SortierteZahlen := Sortieren (ZahlenExtern => ZahlenExtern);
      
      Summe := 0;
      
      ZusammenzählenSchleife:
      for ZusammenzählenSchleifenwert in SortierteZahlen'Range loop
         
         if
           (ZusammenzählenSchleifenwert > SortierteZahlen'First
            and
              SortierteZahlen (ZusammenzählenSchleifenwert) > 0)
           and then
             SortierteZahlen (ZusammenzählenSchleifenwert - 1) = 0
         then
            null;
            
         else
            Summe := Summe + SortierteZahlen (ZusammenzählenSchleifenwert);
         end if;
         
      end loop ZusammenzählenSchleife;
      
      return Summe;
      
   end SummeOhneNiedrigstenWert;
   
   
   
   procedure AlleWerte
     (SeitenanzahlExtern : in Positive;
      WürfelanzahlExtern : in Positive;
      DurchläufeExtern : in Positive;
      ZusatzwertExtern : in Natural)
   is begin
      
      DurchläufeSchleife:
      for DurchläufeSchleifenwert in 1 .. DurchläufeExtern loop
         
         Summe := ZusatzwertExtern;
      
         WürfelSchleife:
         for WürfelSchleifenwert in 1 .. WürfelanzahlExtern loop
               
            GezogeneZahl := Zufallsgenerator.Würfelergebnis (SeitenanzahlExtern => SeitenanzahlExtern);
         
            Put (GezogeneZahl'Image);
            Summe := Summe + GezogeneZahl;
         
            if
              WürfelSchleifenwert = WürfelanzahlExtern
            then
               Put_Line (Item => "    Ability Score:" & Summe'Image);
               
            else
               Put (",");
            end if;
         
         end loop WürfelSchleife;
      end loop DurchläufeSchleife;
      
      Zeug.NeueZeilen;
      
   end AlleWerte;
   
   
   
   -- Funktioniert aktuell nur mit maximal 15 Würfeln.
   procedure NurHöchstwerte
     (SeitenanzahlExtern : in Positive;
      WürfelanzahlExtern : in Positive;
      DurchläufeExtern : in Positive;
      WievieleHöchstwerteExtern : in Positive)
   is begin
      
      if
        WievieleHöchstwerteExtern > WürfelanzahlExtern
      then
         AnzahlHöchstwerte := WürfelanzahlExtern;
         
      else
         AnzahlHöchstwerte := WievieleHöchstwerteExtern;
      end if;
      
      DurchläufeSchleife:
      for DurchläufeSchleifenwert in 1 .. DurchläufeExtern loop
         
         GezogeneZahlen := (others => 0);
      
         WürfelSchleife:
         for WürfelSchleifenwert in 1 .. WürfelanzahlExtern loop
               
            GezogeneZahlen (WürfelSchleifenwert) := Zufallsgenerator.Würfelergebnis (SeitenanzahlExtern => SeitenanzahlExtern);
         
            Put (GezogeneZahlen (WürfelSchleifenwert)'Image);
         
            if
              WürfelSchleifenwert = WürfelanzahlExtern
            then
               Put_Line (Item => "    Ability Score:" & SummeHöchsteWerte (ZahlenExtern               => GezogeneZahlen,
                                                                            WievieleHöchstwerteExtern => WievieleHöchstwerteExtern)'Image);
               
            else
               Put (",");
            end if;
         
         end loop WürfelSchleife;
      end loop DurchläufeSchleife;
                         
   end NurHöchstwerte;
   
   
   
   function SummeHöchsteWerte
     (ZahlenExtern : in GezogeneZahlenArray;
      WievieleHöchstwerteExtern : in Positive)
      return Positive
   is begin
      
      SortierteZahlen := Sortieren (ZahlenExtern => ZahlenExtern);
      
      Summe := 0;
      
      ZusammenzählenSchleife:
      for ZusammenzählenSchleifenwert in reverse SortierteZahlen'Last - WievieleHöchstwerteExtern + 1 .. SortierteZahlen'Last loop
         
         if
           (ZusammenzählenSchleifenwert > SortierteZahlen'First
            and
              SortierteZahlen (ZusammenzählenSchleifenwert) > 0)
           and then
             SortierteZahlen (ZusammenzählenSchleifenwert - 1) = 0
         then
            null;
            
         else
            Summe := Summe + SortierteZahlen (ZusammenzählenSchleifenwert);
         end if;
         
      end loop ZusammenzählenSchleife;
      
      return Summe;
      
   end SummeHöchsteWerte;
   
   
   
   function Sortieren
     (ZahlenExtern : in GezogeneZahlenArray)
      return GezogeneZahlenArray
   is begin
      
      ZahlenSortieren := ZahlenExtern;
      
      ÄußereSchleife:
      for ÄußereSchleifenwert in ZahlenSortieren'Range loop
         
         Getauscht := False;
         
         InnereSchleife:
         for InnereSchleifenwert in ZahlenSortieren'First .. ZahlenSortieren'Last - ÄußereSchleifenwert loop
         
            if
              ZahlenSortieren (InnereSchleifenwert) > ZahlenSortieren (InnereSchleifenwert + 1)
            then
               Zwischenspeicher := ZahlenSortieren (InnereSchleifenwert);
               ZahlenSortieren (InnereSchleifenwert) := ZahlenSortieren (InnereSchleifenwert + 1);
               ZahlenSortieren (InnereSchleifenwert + 1) := Zwischenspeicher;
               Getauscht := True;
               
            else
               null;
            end if;
         
         end loop InnereSchleife;
         
         case
           Getauscht
         is
            when True =>
               null;
               
            when False =>
               exit ÄußereSchleife;
         end case;
         
      end loop ÄußereSchleife;
      
      return ZahlenSortieren;
      
   end Sortieren;

end Wuerfelgruppen;
