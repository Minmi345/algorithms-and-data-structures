with Node;

package linked_list is
type Cursor is private;
subtype Data_Type is Integer;

function is_Empty return Boolean;

procedure add(Item: Data_Type);

--function get (Data : Data_Type) return Node.Node_Access;
function get(Index: Integer) return Node.Node_Access;

procedure delete(index: Integer);

--  procedure Solve_Iterator (M : Integer; N : Integer);
procedure Solve (M : Integer; N : Integer);
procedure print_List;
procedure empty_list;


function First (Container : List) return Cursor;
function Has_Element (Position : Cursor) return Boolean;
function Next (Position : Cursor) return Cursor;
function Element (Position : Cursor) return Integer;


private
   Length: Integer := 0;
   Head : Node.Node_Access := null;
   type Cursor is record
      Current : Node.Node_Access;
   end record;
end linked_list;