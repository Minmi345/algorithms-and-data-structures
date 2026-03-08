package Node is

type Node_Record;

   --pointer to next one
   type Node_Access is access Node_Record;

   type Node_Record is record
      Person : Integer;
      Next : Node_Access;
   end record;

end Node;
