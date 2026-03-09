with Ada.Text_IO;
with Node;           use Node;
with Ada.Strings.Fixed;
with Ada.Containers; use Ada.Containers;
with Ada.Strings;
with Ada.Unchecked_Deallocation;

package body linked_list is
   procedure Free is new Ada.Unchecked_Deallocation (Node_Record, Node_Access);

   function is_Empty (Self : in LinkedList) return Boolean is
   begin
      if Self.Head = null then
         --  Ada.Text_IO.Put_Line ("Linked list is empty");
         return True;
      else
         return False;
      end if;
   end is_Empty;

   procedure add (Self : in out LinkedList; Item : Data_Type) is
      Current  : Node_Access := Self.Head;
      New_Node : Node_Access := new Node_Record'(Person => Item, Next => null);
   begin
      if Self.Head = null then
         Self.Head := New_Node;
         Self.Length := Self.Length + 1;
         return;
      end if;

      while Current.Next /= null loop
         Current := Current.Next;
      end loop;

      Current.next := New_Node;
      Self.Length := Self.Length + 1;
   end add;

   function get (Self : in LinkedList; Index : Integer) return Node.Node_Access
   is
      Current : Node_Access := Self.Head;
      Count   : Integer := 1;
   begin
      --  Ada.Text_IO.Put_Line
      --    ("Searching for person at the position " & Integer'Image (Index));
      if not is_Empty (Self) then
         while (Current.Next /= null) and then (Count <= Index) loop
            if Count = Index then
               --  Ada.Text_IO.Put_Line
               --    ("Found the person! ("
               --     & Integer'Image (Current.Person)
               --     & ")");
               return Current;
            end if;
            Current := Current.Next;
            Count := Count + 1;
         end loop;
      end if;
      return null;
   end get;

   procedure delete (Self : in out LinkedList; index : Integer) is
      Current : Node_Access := Self.Head;
      Temp    : Node.Node_Access;
      Count   : Integer := 1;
   begin
      if not is_Empty (Self) then
         if index = 1 then
            --  Ada.Text_IO.Put_Line
            --    ("Deleting index "
            --     & Integer'Image (index)
            --     & ": "
            --     & Integer'Image (Self.Head.Person));
            --  Ada.Text_IO.Put_Line ("Deleted the head of the list.");

            Temp := Self.Head;
            Self.Head := Self.Head.Next;
            Free (Temp);
            Self.Length := Self.Length - 1;
            return;
         end if;

         while Current.Next /= null and then (Count < Index - 1) loop
            Current := Current.Next;
            Count := Count + 1;
         end loop;

         Temp := Current.Next;
         Current.Next := Current.Next.Next;
         Free (Temp);
         Self.Length := Self.Length - 1;
         return;
      end if;
   end delete;

   procedure empty_list (Self : in out LinkedList) is
   begin
      while not is_Empty (Self) loop
         delete (Self, 1);
      end loop;
   end empty_list;

   procedure print_List (Self : in LinkedList) is
      Current : Node_Access := Self.Head;
   begin
      if not is_Empty (Self) then
         Ada.Text_IO.Put ("Start -> ");
         while Current /= null loop
            Ada.Text_IO.Put (Integer'Image (Current.Person) & " -> ");
            Current := Current.Next;
         end loop;
         Ada.Text_IO.Put_Line (" NULL");
      end if;
   end print_List;

   procedure ClearList (Self : in out LinkedList) is
   begin
      empty_list (Self);
   end ClearList;

   procedure Solve (M : Integer; N : Integer) is
      List  : LinkedList;  -- Create a local LinkedList instance
      index : Integer := 1;
   begin
      Ada.Text_IO.Put_Line
        ("START OF THE LINKED LIST ONLY (m:"
         & Integer'Image (M)
         & ", n:"
         & Integer'Image (N)
         & ")");

      if N = 1 then
         Ada.Text_IO.Put_Line ("There is only 1 person, so... person 1 wins!");
         return;
      end if;

      -- Fill in linked list with numbers 1..N
      for I in 1 .. N loop
         add (List, I);  -- Add to the local list
      end loop;

      -- Solve the Josephus problem
      loop
         exit when is_Empty (List) or List.Head.Next = null;

         -- Calculate next index to delete (Josephus logic)
         index := ((index + M - 1) mod List.Length) + 1;
         delete (List, index);
      end loop;

      -- Print the winner
      if not is_Empty (List) then
         Ada.Text_IO.Put_Line ("Winner: " & Integer'Image (List.Head.Person));
      end if;
   end Solve;

   procedure Solve_Iterator (m : Integer; n : Integer) is
      -- n is amount of all people
      -- m is after what amount of ppl potato burns the person away

      --list itself
      list : LinkedList;

      --ITERATOR!!!
      iterator : linked_list.Cursor;
   begin
      ada.Text_IO.Put_Line
        ("START OF THE LINKED LIST WITH ITERATOORRR (m:"
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
         list.add (i);
         -- ada.Text_IO.Put (Integer'Image (i) & ", ");
      end loop;
      --ada.Text_IO.Put_Line ("");

      iterator := list.First;

      while Integer (list.Length) > 1 loop

         --we move iterator only when m>0
         for Step in 1 .. m loop

            Next (iterator);

            if not Has_Element (iterator) then
               iterator := list.First;
            end if;

            --           Ada.Text_IO.Put (Integer'Image (Element (Iterator)) & " ");
         end loop;

         -- print whole list
         --  ada.Text_IO.Put_Line ("");
         --  for I of list loop
         --     ada.Text_IO.Put (Integer'Image (I) & ", ");
         --  end loop;
         --  ada.Text_IO.Put_Line ("");

         Delete_And_Next (list, iterator);
      end loop;

      Ada.Text_IO.Put_Line ("Winner: " & Integer'Image (list.get (1).Person));
   end Solve_Iterator;


   -- Iterator implementations

function First (Self : in LinkedList) return Cursor is
begin
   return (Index => 1, Current => Self.Head);
end First;

procedure Next (Position : in out Cursor) is
begin
   if Position.Current /= null then
      Position := (Index => Position.Index + 1, Current => Position.Current.Next);
   else
      Position := (Index => 0, Current => null);
   end if;
end Next;

function Has_Element (Position : in Cursor) return Boolean is
begin
   return Position.Current /= null;
end Has_Element;

function Element (Position : in Cursor) return Data_Type is
begin
   if Position.Current = null then
      raise Constraint_Error with "Cursor has no element";
   end if;
   return Position.Current.Person;
end Element;

function Index_Of (Position : in Cursor) return Integer is
begin
   return Position.Index;
end Index_Of;

function To_Cursor
  (node_item : in Node.Node_Access; item_index : in Integer) return Cursor is
   cursor_item : Cursor;
begin
   cursor_item.Index := item_index;
   cursor_item.Current := node_item;
   return cursor_item;
end To_Cursor;

procedure Delete_And_Next 
  (Self : in out LinkedList; Position : in out Cursor) is
   old_index: Integer;
begin
   -- Check if cursor is valid
   if not Has_Element (Position) then
      return;
   end if;
   
   old_index := Position.Index;
   
   -- Use the existing delete procedure by index
   delete (Self, old_index);
   
   -- Update the cursor to point to the next node
   if old_index <= Self.Length then
      Position.Index := old_index;
      Position.Current := Self.get (old_index);
   else
      Position.Index := 0;
      Position.Current := null;
   end if;

end Delete_And_Next;

end linked_list;
