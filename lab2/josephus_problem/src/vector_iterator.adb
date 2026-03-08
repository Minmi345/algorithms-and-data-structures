with Ada.Containers.Vectors;
with Ada.Containers; use Ada.Containers;
with ada;
with ada.Text_IO;
with Text_IO;

package body vector_iterator is
   package Int_Vectors is new
     Ada.Containers.Vectors (Index_Type => Positive, Element_Type => Integer);
   use Int_Vectors;
   procedure solve (m : Integer; n : Integer) is
      -- n is amount of all people
      -- m is after what amount of ppl potato burns the person away

      --list itself
      list : Vector;

      --ITERATOR!!!
      iterator : Cursor;
   begin
      ada.Text_IO.Put_Line
        ("START OF THE VECTOR WITH ITERATOORRR (m:"
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

      iterator := list.First;

      while Integer (list.Length) > 1 loop

         --we move iterator only when m>0
         for Step in 1 .. m loop

            if not Has_Element (iterator) then
               iterator := list.First;
            end if;

            iterator := Next (iterator);
            Ada.Text_IO.Put (Integer'Image(Element(Iterator)) & " ");
         end loop;
      
      ada.Text_IO.Put_Line ("");
      for I of list loop
         ada.Text_IO.Put (Integer'Image (I) & ", ");
      end loop;
      ada.Text_IO.Put_Line ("");

         declare
            Victim       : Cursor := iterator;
            Next_Starter : Cursor := Next(Victim);
         begin


         Ada.Text_IO.Put_Line
           ("Eliminating: " & Integer'Image (Element (Victim)));
         list.Delete (Victim);
         if Has_Element(Next_Starter) then
               iterator := Next_Starter;
            else
               iterator := list.First;
            end if;
         end;

         if not Has_Element (iterator) then
            iterator := list.First;
         end if;
      end loop;
      Ada.Text_IO.Put_Line ("Winner: " & Integer'Image (list (1)));

      null;
   end solve;
end vector_iterator;
