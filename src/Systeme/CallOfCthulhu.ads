package CallOfCthulhu is
   pragma Elaborate_Body;

   procedure CoC;
   
private
   
   Leerwert : Boolean;
   
   Eingabe : Character;
      
   Skillpunkte : Natural;
   PunkteUnterschied : Natural;
   
   procedure Standardwurf;
   
   
   
   function ErfolgeErmitteln
     (SkillpunkteExtern : in Positive;
      WürfelergebnisExtern : in Positive)
      return Boolean;
   
   function PunkteUnterschiedBerechnen
     (WürfelergebnisExtern : in Positive;
      PunkteAbzugExtern : in Natural)
      return Positive;

end CallOfCthulhu;
