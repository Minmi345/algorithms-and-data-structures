with Ada.Containers.Vectors;
with Ada.Containers; use Ada.Containers;
with ada;
with ada.Text_IO;
with Text_IO;

package body vector_only is
   package Int_Vectors is new
     Ada.Containers.Vectors (Index_Type => Positive, Element_Type => Integer);
   use Int_Vectors;
   procedure solve (m : Integer; n : Integer) is
      -- n is amount of all people
      -- m is after what amount of ppl potato burns the person away

      --list itself
      list  : Vector;
      index : Integer := 1;
   begin
      ada.Text_IO.Put_Line
        ("START OF THE VECTOR ONLY (m:"
         & Integer'Image (m)
         & ", n:"
         & Integer'Image (n)
         & ")");

      if n = 1 then
         ada.Text_IO.Put_Line ("There is only 1 person, so... person 1 wins!");
         return;
      end if;
      --instantiate the vector with people
      for I in 1 .. n loop
         list.append (i);
         ada.Text_IO.Put (Integer'Image (i) & ", ");
      end loop;
      ada.Text_IO.Put_Line ("");

      while Integer (list.Length) > 1 loop
         -- magic -1 and +1 cuz it's ada
         index := (index + m - 1) mod Integer (list.Length) + 1;
         --  if index = 0 then index := 1; end if;
         Ada.Text_IO.Put_Line ("Eliminating: " & Integer'Image (list (index)));
         list.Delete (Index);
      end loop;
      Ada.Text_IO.Put_Line ("Winner: " & Integer'Image (list (1)));

      null;
   end solve;
end vector_only;
