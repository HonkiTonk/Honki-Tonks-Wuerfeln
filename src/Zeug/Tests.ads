package Tests is
   pragma Elaborate_Body;

   function ErlaubteZahl
     (EingabeExtern : in String)
      return Integer
     with
       Post => (
                  ErlaubteZahl'Result in -1 .. 999_999_999
               );

end Tests;
