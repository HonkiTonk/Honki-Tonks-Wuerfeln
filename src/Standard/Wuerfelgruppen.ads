package Wuerfelgruppen is
   pragma Elaborate_Body;
   
   procedure OhneNiedrigstenWert
     (SeitenanzahlExtern : in Positive;
      WürfelanzahlExtern : in Positive;
      DurchläufeExtern : in Positive);
   
   procedure AlleWerte
     (SeitenanzahlExtern : in Positive;
      WürfelanzahlExtern : in Positive;
      DurchläufeExtern : in Positive;
      ZusatzwertExtern : in Natural);
   
   procedure NurHöchstwerte
     (SeitenanzahlExtern : in Positive;
      WürfelanzahlExtern : in Positive;
      DurchläufeExtern : in Positive;
      WievieleHöchstwerteExtern : in Positive);
   
private
   
   Getauscht : Boolean;
   
   LeererWert : constant Positive := 1;
   EndeZahlenarray : constant Positive := 15;
   GezogeneZahl : Positive;
   AnzahlHöchstwerte : Positive;
   
   Zwischenspeicher : Natural;
   Summe : Natural;
   
   type GezogeneZahlenArray is array (1 .. EndeZahlenarray + LeererWert) of Natural;
   GezogeneZahlen : GezogeneZahlenArray;
   ZahlenSortieren : GezogeneZahlenArray;
   SortierteZahlen : GezogeneZahlenArray;
   
   
   
   function SummeOhneNiedrigstenWert
     (ZahlenExtern : in GezogeneZahlenArray)
      return Positive;
   
   function SummeHöchsteWerte
     (ZahlenExtern : in GezogeneZahlenArray;
      WievieleHöchstwerteExtern : in Positive)
      return Positive;
   
   function Sortieren
     (ZahlenExtern : in GezogeneZahlenArray)
      return GezogeneZahlenArray;

end Wuerfelgruppen;
