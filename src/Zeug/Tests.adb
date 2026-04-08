package body Tests is
   
   function ErlaubteZahl
     (EingabeExtern : in String)
      return Integer
   is begin
      
      case
        EingabeExtern'Length
      is
         when 1 .. 9 =>
            null;
            
         when others =>
            return -1;
      end case;
      
      TestSchleife:
      for TestSchleifenwert in EingabeExtern'Range loop
                                 
         case
           EingabeExtern (TestSchleifenwert)
         is
            when '0' | '1' | '2' | '3' | '4' | '5' | '6' | '7' | '8' | '9' =>
               null;
               
            when others =>
               return -1;
         end case;
                                 
      end loop TestSchleife;
      
      return Integer'Value (EingabeExtern);
      
   end ErlaubteZahl;

end Tests;
