with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

package Sprache is
   pragma Elaborate_Body;
   
   procedure SpracheFestlegen;
   procedure Wuerfeln;
   procedure VTM5ReRoll;
   procedure Pathfinder;
   
   
   
   function Text
     (TextnummerExtern : in Positive)
      return String
     with
       Post => (
                  Text'Result'Length > 0
               );
   
private

   DeutschEnglisch : Boolean;
   
   Eingabe : Character;
   
   type TextlisteArray is array (1 .. 35, Boolean'Range) of Unbounded_String;
   Textliste : constant TextlisteArray := (
                                           1  => (
                                                  True  => To_Unbounded_String (Source => "0 = Zurueck."),
                                                  False => To_Unbounded_String (Source => "0 = Back.")
                                                 ),
                                           
                                           2  => (
                                                  True  => To_Unbounded_String (Source => "Keine erlaubte Eingabe."),
                                                  False => To_Unbounded_String (Source => "Invalid input.")
                                                 ),
                                           
                                           3  => (
                                                  True  => To_Unbounded_String (Source => "Seitenanzahl festlegen"),
                                                  False => To_Unbounded_String (Source => "Set number of sides")
                                                 ),
                                           
                                           4  => (
                                                  True  => To_Unbounded_String (Source => "Wuerfelanzahl festlegen"),
                                                  False => To_Unbounded_String (Source => "Set number of dices")
                                                 ),
                                           
                                           5  => (
                                                  True  => To_Unbounded_String (Source => "Standardwurf."),
                                                  False => To_Unbounded_String (Source => "Standard roll.")
                                                 ),
                                           
                                           6  => (
                                                  True  => To_Unbounded_String (Source => "Skillpunkte angeben"),
                                                  False => To_Unbounded_String (Source => "Enter skill points")
                                                 ),
                                           
                                           7  => (
                                                  True  => To_Unbounded_String (Source => "Erneut Wuerfeln."),
                                                  False => To_Unbounded_String (Source => "Re-Roll.")
                                                 ),
                                           
                                           8  => (
                                                  True  => To_Unbounded_String (Source => "Ergebnis:"),
                                                  False => To_Unbounded_String (Source => "Result:")
                                                 ),
                                           
                                           9  => (
                                                  True  => To_Unbounded_String (Source => "Kritischer Erfolg."),
                                                  False => To_Unbounded_String (Source => "Critical success.")
                                                 ),
                                           
                                           10 => (
                                                  True  => To_Unbounded_String (Source => "Kritischer Fehlschlag."),
                                                  False => To_Unbounded_String (Source => "Critical failure.")
                                                 ),
                                           
                                           11 => (
                                                  True  => To_Unbounded_String (Source => "Extremer Erfolg."),
                                                  False => To_Unbounded_String (Source => "Extreme success.")
                                                 ),
                                           
                                           12 => (
                                                  True  => To_Unbounded_String (Source => "Schwerer Erfolg."),
                                                  False => To_Unbounded_String (Source => "Hard success.")
                                                 ),
                                           
                                           13 => (
                                                  True  => To_Unbounded_String (Source => "Erfolg."),
                                                  False => To_Unbounded_String (Source => "Success.")
                                                 ),
                                           
                                           14 => (
                                                  True  => To_Unbounded_String (Source => "Fehlschlag."),
                                                  False => To_Unbounded_String (Source => "Failure.")
                                                 ),
                                           
                                           15 => (
                                                  True  => To_Unbounded_String (Source => "Punkteunterschied zum Erfolg:"),
                                                  False => To_Unbounded_String (Source => "Points needed for success:")
                                                 ),
                                           
                                           16 => (
                                                  True  => To_Unbounded_String (Source => "Punkteunterschied zum schweren Erfolg:"),
                                                  False => To_Unbounded_String (Source => "Points needed for hard success:")
                                                 ),
                                           
                                           17 => (
                                                  True  => To_Unbounded_String (Source => "Punkteunterschied zum extremen Erfolg:"),
                                                  False => To_Unbounded_String (Source => "Points needed for extreme success:")
                                                 ),
                                           
                                           18 => (
                                                  True  => To_Unbounded_String (Source => "Humanity angeben"),
                                                  False => To_Unbounded_String (Source => "Enter Humanity")
                                                 ),
                                           
                                           19 => (
                                                  True  => To_Unbounded_String (Source => "Vorhandene Willpower angeben"),
                                                  False => To_Unbounded_String (Source => "Enter available Willpower")
                                                 ),
                                           
                                           20 => (
                                                  True  => To_Unbounded_String (Source => "Erfolge:"),
                                                  False => To_Unbounded_String (Source => "Successes:")
                                                 ),
                                           
                                           21 => (
                                                  True  => To_Unbounded_String (Source => "Misserfolge:"),
                                                  False => To_Unbounded_String (Source => "Failures:")
                                                 ),
                                           
                                           22 => (
                                                  True  => To_Unbounded_String (Source => "Einser:"),
                                                  False => To_Unbounded_String (Source => "Ones:")
                                                 ),
                                           
                                           23 => (
                                                  True  => To_Unbounded_String (Source => "Zehner:"),
                                                  False => To_Unbounded_String (Source => "Tens:")
                                                 ),
                                           
                                           24 => (
                                                  True  => To_Unbounded_String (Source => "Hungererfolge:"),
                                                  False => To_Unbounded_String (Source => "Hunger successes:")
                                                 ),
                                           
                                           25 => (
                                                  True  => To_Unbounded_String (Source => "Hungermisserfolge:"),
                                                  False => To_Unbounded_String (Source => "Hunger failures:")
                                                 ),
                                           
                                           26 => (
                                                  True  => To_Unbounded_String (Source => "Hungereinser:"),
                                                  False => To_Unbounded_String (Source => "Hugner ones:")
                                                 ),
                                           
                                           27 => (
                                                  True  => To_Unbounded_String (Source => "Hungerzehner:"),
                                                  False => To_Unbounded_String (Source => "Hunger tens:")
                                                 ),
                                           
                                           28 => (
                                                  True  => To_Unbounded_String (Source => "Gesamterfolge:"),
                                                  False => To_Unbounded_String (Source => "Total successes:")
                                                 ),
                                           
                                           29 => (
                                                  True  => To_Unbounded_String (Source => "Hunger festlegen"),
                                                  False => To_Unbounded_String (Source => "Set Hunger dices")
                                                 ),
                                           
                                           30 => (
                                                  True  => To_Unbounded_String (Source => "Hungerwurf:"),
                                                  False => To_Unbounded_String (Source => "Hunger roll:")
                                                 ),
                                           
                                           31 => (
                                                  True  => To_Unbounded_String (Source => "ReRoll festlegen"),
                                                  False => To_Unbounded_String (Source => "Set Re-roll")
                                                 ),
                                           
                                           32 => (
                                                  True  => To_Unbounded_String (Source => "Schwierigkeitsgrad festlegen"),
                                                  False => To_Unbounded_String (Source => "Set difficulty")
                                                 ),
                                           
                                           33 => (
                                                  True  => To_Unbounded_String (Source => "Wuerfelvorrat festlegen"),
                                                  False => To_Unbounded_String (Source => "Set dice pool")
                                                 ),
                                           
                                           34 => (
                                                  True  => To_Unbounded_String (Source => "Wuerfelvorrat:"),
                                                  False => To_Unbounded_String (Source => "Dice pool:")
                                                 ),
                                           
                                           35 => (
                                                  True  => To_Unbounded_String (Source => "Noch zu wuerfelnde Attribute:"),
                                                  False => To_Unbounded_String (Source => "Dice pool")
                                                 )
                                           
                                           -- others => (others => To_Unbounded_String (Source => "Leer"))
                                          );
   
   procedure Programmname;

end Sprache;
