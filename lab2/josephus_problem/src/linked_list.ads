with Node;

package linked_list is

subtype Data_Type is Integer;

function is_Empty return Boolean;

procedure add(Item: Data_Type);

function get (Data : Data_Type) return Node.Node_Access;
function get(Index: Integer) return Node.Node_Access;

procedure delete(Data: Data_Type);

procedure Solve (M : Integer; N : Integer);
procedure print_List;
private
   Head : Node.Node_Access := null;
end linked_list;