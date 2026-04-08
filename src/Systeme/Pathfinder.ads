package Pathfinder is
   pragma Elaborate_Body;

   procedure Pathfinder;
   
private
   
   Eingabe : Character;
   
   Würfelvorrat : Natural;
   NochZuWürfeln : Natural;
   Würfelmenge : Natural;
   MaximaleWürfelmenge : Natural;
   
   procedure Würfelpool;

end Pathfinder;
