with Ada.Text_IO;
with Node; use Node;
with Ada.Strings.Fixed;
with Ada.Strings;
with Ada.Unchecked_Deallocation;

package body linked_list is
   procedure Free is new Ada.Unchecked_Deallocation (Node_Record, Node_Access);
   function is_Empty return Boolean is
   begin
      if Head = null then
         Ada.Text_IO.Put_Line ("Linked list is empty");
         return True;
      else
         return False;
      end if;
   end is_Empty;

   procedure add (Item : Data_Type) is
      Current  : Node_Access := Head;
      New_Node : Node_Access := new Node_Record'(Data => Item, Next => null);
   begin

      if Head = null then
         Head := New_Node;
         return;
      end if;

      while Current.Next /= null loop
         Current := Current.Next;
      end loop;

      Current.next := New_Node;

   end add;


   function get (Data : Data_Type) return Node_Access is
      Current : Node_Access := Head;
   begin
      Ada.Text_IO.Put_Line ("Searching for " & Data.Person);
      if not is_Empty then
         while Current.Next /= null loop
            if Current.Data = Data then
               Ada.Text_IO.Put_Line
                 ("Found the person! ("
                  & Ada.Strings.Fixed.Trim
                      (Current.Data.Person, Ada.Strings.Right)
                  & ":"
                  & Ada.Strings.Fixed.Trim
                      (Current.Data.Address, Ada.Strings.Right)
                  & ")");
               return Current;
            end if;
            Current := Current.Next;
         end loop;
      end if;
      Ada.Text_IO.Put_Line ("No person found.");
      return null;
   end get;

   function get (Index : Integer) return Node_Access is
      Current : Node_Access := Head;
      Count   : Integer := 1;
   begin
      Ada.Text_IO.Put_Line
        ("Searching for person at the position " & Integer'Image (Index));
      if not is_Empty then
         while (Current.Next /= null) and (Count <= Index) loop
            --  Ada.Text_IO.Put_Line ("Count: " &Integer'Image(Count));
            --  Ada.Text_IO.Put_Line ("Index: " &Integer'Image(Index));
            if Count = Index then
               Ada.Text_IO.Put_Line
                 ("Found the person! ("
                  & Ada.Strings.Fixed.Trim
                      (Current.Data.Person, Ada.Strings.Right)
                  & ":"
                  & Ada.Strings.Fixed.Trim
                      (Current.Data.Address, Ada.Strings.Right)
                  & ")");
               return Current;
            end if;
            Current := Current.Next;
            Count := Count + 1;
         end loop;
      end if;
      Ada.Text_IO.Put_Line ("No person found.");
      return null;
   end get;

   procedure delete (Data : Data_Type) is
      Current : Node_Access := Head;
      Temp    : Node.Node_Access;
   begin
      Ada.Text_IO.Put_Line ("Searching for " & Data.Person);
      if not is_Empty then

      if Head.Data.Person = Data.Person then
         Temp := Head;
         Head := Head.Next;
         Free(Temp);
         Ada.Text_IO.Put_Line("Deleted the head of the list.");
         return;
      end if;

         while Current.Next /= null loop

            if Current.Next.Data = Data then
               Ada.Text_IO.Put_Line
                 ("Deleting this person: "
                  & Ada.Strings.Fixed.Trim
                      (Current.Next.Data.Person, Ada.Strings.Right)
                  & ":"
                  & Ada.Strings.Fixed.Trim
                      (Current.Next.Data.Address, Ada.Strings.Right));

               --connect current with next next one.
               Current.Next := Current.Next.Next;
               Free (Temp);
               Ada.Text_IO.Put_Line ("Person deleted succesfully!");
               return;
            end if;

            Current := Current.Next;

         end loop;
      end if;
      Ada.Text_IO.Put_Line ("No person found.");
   end delete;

   procedure print_List is
      Current : Node_Access := Head;
   begin
      if not is_Empty then
         Ada.Text_IO.Put ("Start -> ");
         while Current /= null loop
            Ada.Text_IO.Put
              (Ada.Strings.Fixed.Trim (Current.Data.Person, Ada.Strings.Right)
               & ":"
               & Ada.Strings.Fixed.Trim
                   (Current.Data.Address, Ada.Strings.Right)
               & " -> ");
            Current := Current.Next;
         end loop;
         Ada.Text_IO.Put_Line (" NULL");
      end if;
   end print_List;

procedure Solve (M : Integer; N : Integer) is
begin
null;
end Solve;
end linked_list;
