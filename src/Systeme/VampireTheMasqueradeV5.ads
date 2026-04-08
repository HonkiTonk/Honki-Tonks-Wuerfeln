package VampireTheMasqueradeV5 is
   pragma Elaborate_Body;

   procedure VTM5;
   
private
   
   Eingabe : Character;
   
   GezogeneZahl : Positive;
   
   Gesamtwürfelmenge : Natural;
   Standardwürfel : Natural;
   Hunger : Natural;
   
   Zahleneingabe : Natural;
   Humanity : Natural;
   Willpower : Natural;
   
   Gesamterfolge : Natural;
   Erfolge : Natural;
   Misserfolge : Natural;
   Zehner : Natural;
   Einser : Natural;
   
   Hungerzehner : Natural;
   Hungererfolge : Natural;
   Hungermisserfolge : Natural;
   Hungereinser : Natural;
     
   Kritisch : Natural;
   Zwischenspeicher : Natural;
   
   ReRolls : Natural;
   AnzahlReRolls : Natural;
   
   Schwierigkeitsgrad : Natural;
   
   type ReRoll_Enum is (Misserfolge_Enum, Zehner_Enum, Zehner_Misserfolge_Enum);
   ReRoll : ReRoll_Enum;
      
   -- type Erfolgsart_Enum is (Normaler_Erfolg_Enum, Kritischer_Erfolg_Enum, Messy_Kritischer_Erfogl_Enum, Bestial_failure_Enum);
   
   -- type ErfolgswerteRecod is record
      
   --   Erfolge : Natural;
   --   Misserfolge : Natural;
   --   Einser : Natural;
   --   Zehner : Natural;
      
   -- end record;
   
   -- Standarderfolge : ErfolgswerteRecod;
   
   type NormalwürfeArray is array (1 .. 50) of Natural;
   Normalwürfe : NormalwürfeArray;
   
   type HungerwürfeArray is array (1 .. 5) of Natural;
   Hungerwürfe : HungerwürfeArray;
   
   procedure Frenzy;
   
   procedure Erfolgsmenge
     (WürfelanzahlExtern : in Natural);
   
   procedure ErfolgsmengeKomplex;
   
   procedure Würfelergebnisse
     (ErfolgeExtern : in Natural;
      MisserfolgeExtern : in Natural;
      EinserExtern : in Natural;
      ZehnerExtern : in Natural;
      HungererfolgeExtern : in Natural;
      HungermisserfolgeExtern : in Natural;
      HungereinserExtern : in Natural;
      HungerzehnerExtern : in Natural;
      GesamterfolgeExtern : in Natural);
   
   procedure SchwierigkeitsgradFestlegen
     (GesamterfolgeExtern : in Natural;
      HungereinserExtern : in Natural;
      ZehnerExtern : in Natural;
      HungerzehnerExtern : in Natural);

end VampireTheMasqueradeV5;
