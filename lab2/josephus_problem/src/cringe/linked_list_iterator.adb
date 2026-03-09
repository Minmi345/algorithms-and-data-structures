with Ada.Text_IO;
with Node;           use Node;
with Ada.Strings.Fixed;
with Ada.Containers; use Ada.Containers;
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
      New_Node : Node_Access := new Node_Record'(Person => Item, Next => null);
   begin

      if Head = null then
         Head := New_Node;
         Length := Length + 1;
         return;
      end if;

      while Current.Next /= null loop
         Current := Current.Next;
      end loop;

      Current.next := New_Node;
      Length := Length + 1;


   end add;


   --  function get (Data : Data_Type) return Node_Access is
   --     Current : Node_Access := Head;
   --  begin
   --     Ada.Text_IO.Put_Line ("Searching for " & Integer'Image(Data));
   --     if not is_Empty then
   --        while Current.Next /= null loop
   --           if Current.Person = Data then
   --              Ada.Text_IO.Put_Line
   --                ("Found it! ("
   --                 & Integer'Image(Current.Person) & ")");
   --              return Current;
   --           end if;
   --           Current := Current.Next;
   --        end loop;
   --     end if;
   --     Ada.Text_IO.Put_Line ("Not found anything.");
   --     return null;
   --  end get;

   function get (Index : Integer) return Node_Access is
      Current : Node_Access := Head;
      Count   : Integer := 1;
   begin
      Ada.Text_IO.Put_Line
        ("Searching for person at the position " & Integer'Image (Index));
      if not is_Empty then
         while (Current.Next /= null) and then (Count <= Index) loop
            --  Ada.Text_IO.Put_Line ("Count: " &Integer'Image(Count));
            --  Ada.Text_IO.Put_Line ("Index: " &Integer'Image(Index));
            if Count = Index then
               Ada.Text_IO.Put_Line
                 ("Found the person! ("
                  & Integer'Image (Current.Person)
                  & ")");
               return Current;
            end if;
            Current := Current.Next;
            Count := Count + 1;
         end loop;
      end if;
      -- Ada.Text_IO.Put_Line ("No person found.");
      return null;
   end get;

   procedure delete (index : Integer) is
      Current : Node_Access := Head;
      Temp    : Node.Node_Access;
      Count   : Integer := 1;
   begin
      -- Ada.Text_IO.Put_Line ("Searching for " & Integer'Image (Index));
      if not is_Empty then

         if index = 1 then
            Ada.Text_IO.Put_Line
              ("Deleting index "
               & Integer'Image (index)
               & ": "
               & Integer'Image (Head.Person));
            Ada.Text_IO.Put_Line ("Deleted the head of the list.");

            Temp := Head;
            Head := Head.Next;
            Free (Temp);
            Length := Length - 1;
            return;
         end if;

         while Current.Next /= null and then (Count < Index - 1) loop
            Current := Current.Next;
            Count := Count + 1;

         end loop;

         --  Ada.Text_IO.Put_Line
         --    ("Deleting index "
         --     & Integer'Image (index)
         --     & ": "
         --     & Integer'Image (Current.Next.Person));

         --connect current with next next one.
         Current.Next := Current.Next.Next;
         Free (Temp);
         -- Ada.Text_IO.Put_Line ("Person deleted succesfully!");
         Length := Length - 1;
         return;

      end if;
      --Ada.Text_IO.Put_Line ("No person found.");
   end delete;

   procedure empty_list is
   begin
      while not is_Empty loop
         delete (1);
      end loop;
   end empty_list;

   procedure print_List is
      Current : Node_Access := Head;
   begin
      if not is_Empty then
         Ada.Text_IO.Put ("Start -> ");
         while Current /= null loop
            Ada.Text_IO.Put (Integer'Image (Current.Person) & " -> ");
            Current := Current.Next;
         end loop;
         Ada.Text_IO.Put_Line (" NULL");
      end if;
   end print_List;

   procedure Solve (M : Integer; N : Integer) is
      index : Integer := 1;
   begin
      Ada.Text_IO.Put_Line
        ("START OF THE LINKED LIST ONLY (m:"
         & Integer'Image (m)
         & ", n:"
         & Integer'Image (n)
         & ")");

      if n = 1 then
         ada.Text_IO.Put_Line ("There is only 1 person, so... person 1 wins!");
         return;
      end if;

      --fill in linkd list
      for I in 1 .. n loop
         add (I);
      end loop;

      --
      loop
         if is_Empty or Head.Next = null then
            exit;
         end if;

         --  print_List;
         -- magic -1 and +1 cuz it's ada
         index := ((index + m - 1) mod Length) + 1;
         delete (index);

      end loop;

      Ada.Text_IO.Put_Line ("Winner: " & Integer'Image (Head.Person));
      empty_list;

   end Solve_Only;


   --  procedure Solve_Iterator (M : Integer; N : Integer) is
   --     iterator : Cursor;
   --     index    : Extended_Index;
   --  begin
   --     Ada.Text_IO.Put_Line
   --       ("START OF THE LINKED LIST WITH iterator (m:"
   --        & Integer'Image (m)
   --        & ", n:"
   --        & Integer'Image (n)
   --        & ")");

   --     if n = 1 then
   --        ada.Text_IO.Put_Line ("There is only 1 person, so... person 1 wins!");
   --        return;
   --     end if;

   --     --fill in linkd list
   --     for I in 1 .. n loop
   --        add (I);
   --     end loop;

   --     --
   --     loop
   --        if is_Empty or Head.Next = null then
   --           exit;
   --        end if;

   --        -- magic -1 and +1 cuz it's ada
   --        --index := ((index + m - 1) mod Length) + 1;
   --        --our iterator is here
   --        for Step in 1 .. m loop

   --           iterator := Next (iterator);

   --           if not Has_Element (iterator) then
   --              iterator := 0;
   --           end if;

   --           Ada.Text_IO.Put (Integer'Image (Element (Iterator)) & " ");
   --        end loop;

   --        ada.Text_IO.Put_Line ("");
   --        for I of list loop
   --           ada.Text_IO.Put (Integer'Image (I) & ", ");
   --        end loop;
   --        ada.Text_IO.Put_Line ("");

   --        index := To_Index (iterator);
   --        Delete (Container => list, Position => iterator);
   --        iterator := To_Cursor (list, index);

   --     end loop;

   --     Ada.Text_IO.Put_Line ("Winner: " & Integer'Image (Head.Person));
   --     empty_list;
   --  end Solve_Iterator;

   function First return Cursor is
   begin
      return (Current => Container.Head);
   end First;

   function Has_Element (Position : Cursor) return Boolean is
   begin
      return Position.Current /= null;
   end Has_Element;

   function Next (Position : Cursor) return Cursor is
   begin
      if Position.Current = null then
         return (Current => null);
      else
         return (Current => Position.Current.Next);
      end if;
   end Next;

   function Element (Position : Cursor) return Integer is
   begin
      return Position.Current.Data;
   end Element;



end linked_list;
