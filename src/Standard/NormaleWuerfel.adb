with Ada.Text_IO; use Ada.Text_IO;

with Zufallsgenerator;
with Zeug;
with Sprache;
with AnzahlFestlegen;

package body NormaleWuerfel is
   
   procedure Standardwürfel
   is begin
      
      Zeug.NeueZeilen;
      
      EingabeSchleife:
      loop
         
         Put_Line (Item => "1 = D2");
         Put_Line (Item => "2 = D4");
         Put_Line (Item => "3 = D6");
         Put_Line (Item => "4 = D8");
         Put_Line (Item => "5 = D10");
         Put_Line (Item => "6 = D12");
         Put_Line (Item => "7 = D20");
         Put_Line (Item => "8 = D100");
         Put_Line (Item => "9 = D1000");
         Put_Line (Item => Sprache.Text (TextnummerExtern => 1));
         
         Get_Immediate (Eingabe);
         
         case
           Eingabe
         is
            when '1' .. '9' =>
               AnzahlWürfel := AnzahlFestlegen.WürfelAnzahl;
               
               if
                 AnzahlWürfel = 0
               then
                  exit EingabeSchleife;
                  
               else
                  Zufallsgenerator.Würfel (SeitenanzahlExtern => Standardwürfelkonstanten (Character'Pos (Eingabe) - Character'Pos ('0')),
                                            WürfelanzahlExtern => AnzahlWürfel);
               end if;
                  
            when '0' =>
               exit EingabeSchleife;
         
            when others =>
               Zeug.NeueZeilen;
         end case;
         
      end loop EingabeSchleife;
      
      Zeug.NeueZeilen;
      
   end Standardwürfel;
   
   
   
   procedure NutzerdefinierterWürfel
   is begin
      
      Zeug.NeueZeilen;
      
      EingabeSchleife:
      loop
         
         Seitenanzahl := AnzahlFestlegen.SeitenanzahlFestlegen;
      
         case
           Seitenanzahl
         is
            when 0 =>
               exit EingabeSchleife;
            
            when others =>
               AnzahlWürfel := AnzahlFestlegen.WürfelAnzahl;
         end case;
       
         case
           AnzahlWürfel
         is
            when 0 =>
               exit EingabeSchleife;
                  
            when others =>
               Zufallsgenerator.Würfel (SeitenanzahlExtern => Seitenanzahl,
                                         WürfelanzahlExtern => AnzahlWürfel);
         end case;
         
      end loop EingabeSchleife;
      
      Zeug.NeueZeilen;
      
   end NutzerdefinierterWürfel;

end NormaleWuerfel;
