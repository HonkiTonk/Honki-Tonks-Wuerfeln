with Ada.Text_IO; use Ada.Text_IO;

with NormaleWuerfel;
with Systemauswahl;
with Sprache;
with Zeug;

procedure HonkiTonksWuerfeln
is

   Eingabe : Character;

begin

   Sprache.SpracheFestlegen;

   EingabeSchleife:
   loop

      Sprache.Wuerfeln;

      Get_Immediate (Eingabe);

      case
        Eingabe
      is
         when '1' =>
            NormaleWuerfel.Standardwürfel;

         when '2' =>
            NormaleWuerfel.NutzerdefinierterWürfel;

         when '3' =>
            Systemauswahl.Systemauswahl;

         when '0' =>
            exit EingabeSchleife;

         when others =>
            Put_Line (Item => Sprache.Text (TextnummerExtern => 2));
            Zeug.NeueZeilen;
      end case;

   end loop EingabeSchleife;

end HonkiTonksWuerfeln;
