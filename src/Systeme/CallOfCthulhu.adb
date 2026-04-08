with Ada.Text_IO; use Ada.Text_IO;

with Zeug;
with Zufallsgenerator;
with Sprache;
with AnzahlFestlegen;

package body CallOfCthulhu is

   procedure CoC
   is begin
      
      Zeug.NeueZeilen;
      
      EingabeSchleife:
      loop
         
         Put_Line ("Call of Cthulhu");
         Put_Line (Item => "1 = " & Sprache.Text (TextnummerExtern => 5));
         Put_Line (Item => Sprache.Text (1));
         
         Get_Immediate (Eingabe);
         
         case
           Eingabe
         is
            when '0' =>
               exit EingabeSchleife;
               
            when '1' =>
               Standardwurf;
               
            when others =>
               Put_Line (Item => Sprache.Text (TextnummerExtern => 2));
               Zeug.NeueZeilen;
         end case;
         
      end loop EingabeSchleife;
      
      Zeug.NeueZeilen;
      
   end CoC;
   
   
   
   procedure Standardwurf
   is begin
      
      Skillpunkte := AnzahlFestlegen.AnzahlFestlegen (TextExtern   => Sprache.Text (TextnummerExtern => 6) & " (1 .. 99).",
                                                      AnfangExtern => 1,
                                                      EndeExtern   => 99);
      
      if
        Skillpunkte = 0
      then
         Zeug.NeueZeilen;
         return;
         
      elsif
        True = ErfolgeErmitteln (SkillpunkteExtern    => Skillpunkte,
                                 WürfelergebnisExtern => Zufallsgenerator.Würfelergebnis (SeitenanzahlExtern => 100))
      then
         return;
            
      else
         null;
      end if;
      
      ErneutWürfelnSchleife:
      loop
         
         Put_Line (Item => "1 = " & Sprache.Text (TextnummerExtern => 7));
         Put_Line (Item => Sprache.Text (1));
         
         Get_Immediate (Eingabe);
         
         case
           Eingabe
         is
            when '0' =>
               return;
               
            when '1' =>
               exit ErneutWürfelnSchleife;
               
            when others =>
               Put_Line (Item => Sprache.Text (TextnummerExtern => 2));
               Zeug.NeueZeilen;
         end case;
         
      end loop ErneutWürfelnSchleife;
      
      Leerwert := ErfolgeErmitteln (SkillpunkteExtern    => Skillpunkte,
                                    WürfelergebnisExtern => Zufallsgenerator.Würfelergebnis (SeitenanzahlExtern => 100));
      
      Zeug.NeueZeilen;
      
   end Standardwurf;
   
   
   
   function ErfolgeErmitteln
     (SkillpunkteExtern : in Positive;
      WürfelergebnisExtern : in Positive)
      return Boolean
   is begin
      
      New_Line;
      Put_Line (Item => Sprache.Text (TextnummerExtern => 8) & WürfelergebnisExtern'Image);
      
      if
        WürfelergebnisExtern = 1
      then
         Put_Line (Item => Sprache.Text (TextnummerExtern => 9));
         New_Line;
         return True;
         
      elsif
        WürfelergebnisExtern = 100
        or
          (WürfelergebnisExtern >= 96
           and
             SkillpunkteExtern < 50)
      then
         Put_Line (Item => Sprache.Text (TextnummerExtern => 10));
         New_Line;
         return True;
         
      elsif
        WürfelergebnisExtern <= SkillpunkteExtern / 5
      then
         Put_Line (Item => Sprache.Text (TextnummerExtern => 11));
         
      elsif
        WürfelergebnisExtern <= SkillpunkteExtern / 2
      then
         Put_Line (Item => Sprache.Text (TextnummerExtern => 12));
         
         PunkteUnterschied := PunkteUnterschiedBerechnen (WürfelergebnisExtern => WürfelergebnisExtern,
                                                          PunkteAbzugExtern    => SkillpunkteExtern / 5);
         Put_Line (Item => Sprache.Text (TextnummerExtern => 17) & PunkteUnterschied'Image);
         
      elsif
        WürfelergebnisExtern <= SkillpunkteExtern
      then
         Put_Line (Item => Sprache.Text (TextnummerExtern => 13));
         
         PunkteUnterschied := PunkteUnterschiedBerechnen (WürfelergebnisExtern => WürfelergebnisExtern,
                                                          PunkteAbzugExtern    => SkillpunkteExtern / 2);
         Put_Line (Item => Sprache.Text (TextnummerExtern => 16) & PunkteUnterschied'Image);
         
         PunkteUnterschied := PunkteUnterschiedBerechnen (WürfelergebnisExtern => WürfelergebnisExtern,
                                                          PunkteAbzugExtern    => SkillpunkteExtern / 5);
         Put_Line (Item => Sprache.Text (TextnummerExtern => 17) & PunkteUnterschied'Image);
         
      else
         Put_Line (Item => Sprache.Text (TextnummerExtern => 14));
         
         PunkteUnterschied := WürfelergebnisExtern - SkillpunkteExtern;
         Put_Line (Item => Sprache.Text (TextnummerExtern => 15) & PunkteUnterschied'Image);
         
         PunkteUnterschied := PunkteUnterschiedBerechnen (WürfelergebnisExtern => WürfelergebnisExtern,
                                                          PunkteAbzugExtern    => SkillpunkteExtern / 2);
         Put_Line (Item => Sprache.Text (TextnummerExtern => 16) & PunkteUnterschied'Image);
         
         PunkteUnterschied := PunkteUnterschiedBerechnen (WürfelergebnisExtern => WürfelergebnisExtern,
                                                          PunkteAbzugExtern    => SkillpunkteExtern / 5);
         Put_Line (Item => Sprache.Text (TextnummerExtern => 17) & PunkteUnterschied'Image);
      end if;
      
      New_Line;
      
      return False;
      
   end ErfolgeErmitteln;
   
   
   
   function PunkteUnterschiedBerechnen
     (WürfelergebnisExtern : in Positive;
      PunkteAbzugExtern : in Natural)
      return Positive
   is begin
      
      case
        PunkteAbzugExtern
      is
         when 0 =>
            return WürfelergebnisExtern - 1;
            
         when others =>
            return WürfelergebnisExtern - PunkteAbzugExtern;
      end case;
      
   end PunkteUnterschiedBerechnen;

end CallOfCthulhu;
