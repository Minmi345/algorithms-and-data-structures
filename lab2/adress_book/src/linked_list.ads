with Node;

package linked_list is

subtype Data_Type is Node.Info;

function is_Empty return Boolean;

procedure add(Item: Data_Type);

function get (Data : Data_Type) return Node.Node_Access;
function get(Index: Integer) return Node.Node_Access;

procedure delete(Data: Data_Type);

procedure print_List;
private
   Head : Node.Node_Access := null;
end linked_list;