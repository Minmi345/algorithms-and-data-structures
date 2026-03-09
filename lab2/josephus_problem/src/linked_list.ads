with Node;

package linked_list is

   subtype Data_Type is Integer;

   type LinkedList is tagged record
      Length : Integer := 0;
      Head   : Node.Node_Access := null;
   end record;

   type Cursor is record
      Current : Node.Node_Access := null;
      Index : Integer := 0;
   end record;

   -- Primitive operations must be declared immediately after the tagged type
   function is_Empty (Self : in LinkedList) return Boolean;
   procedure add (Self : in out LinkedList; Item : Data_Type);
   function get
     (Self : in LinkedList; Index : Integer) return Node.Node_Access;
   procedure delete (Self : in out LinkedList; index : Integer);
   procedure print_List (Self : in LinkedList);
   procedure ClearList (Self : in out LinkedList);

   procedure Solve (M : Integer; N : Integer);
   procedure Solve_Iterator (M : Integer; N : Integer);

   -- Iterator operations
   function First (Self : in LinkedList) return Cursor;
   procedure Next (Position : in out Cursor);
   function Has_Element (Position : in Cursor) return Boolean;
   function Element (Position : in Cursor) return Data_Type;
   --  function Position_Of (Self : in LinkedList; Item : Data_Type) return Cursor;
   --  function To_Cursor (node_item: in Node.Node_Access; node_index: in Integer) return Cursor;
   procedure Delete_And_Next
     (Self : in out LinkedList; Position : in out Cursor);

   -- Convenience functions
   --  function Iterate (Self : in LinkedList) return Cursor;

   -- Iteration patterns (will be implemented in the body)
   --  generic
   --     with procedure Process (Item : Data_Type; Continue : out Boolean);
   --  procedure For_Each (Self : in LinkedList);

   --  generic
   --     with function Predicate (Item : Data_Type) return Boolean;
   --  function Find_First (Self : in LinkedList) return Cursor;
end linked_list;
