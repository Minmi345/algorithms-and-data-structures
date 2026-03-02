package Node is

type Info is record
   Person  : String(1..50);
   Address : String(1..70);
end record;

type Node_Record;

   --pointer to next one
   type Node_Access is access Node_Record;

   type Node_Record is record
      Data : Info;
      Next : Node_Access;
   end record;

end Node;
