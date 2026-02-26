with Ada.Text_IO;

package body Queue is
  -- Capacity : constant Integer := 10;
--   Data : array(1..Capacity) of Integer;
  -- Tail : Integer := 0;
 --  Head : Integer := 0;

   procedure Enqueue (Item : Integer) is
   begin
      if not Is_Full then
         tail := tail + 1;
         Data(Tail) := Item;
         Ada.Text_IO.Put_Line ("Item Succesfuly added to the queue");

      else
            Ada.Text_IO.Put_Line ("Overflow: idk what, but smth happened");
      end if;
      Print_Queue;
   end Enqueue;

   procedure Dequeue is
   begin
        Ada.Text_IO.Put_Line ("Dequeueing last element...");

         Ada.Text_IO.Put_Line ("");
      Ada.Text_IO.Put ("Head: ");
      Ada.Text_IO.Put (Integer'Image (Head) & ", Tail: ");
      Ada.Text_IO.Put (Integer'Image (Tail) & " ");

      if Is_Empty then
         Ada.Text_IO.Put_Line ("Underflow: nothing to delete.");
      else
         Data(head) := 0; --popping dude away
         Head := Head + 1;
        Ada.Text_IO.Put_Line ("    Dequeued!");

      end if;
      Print_Queue;
   end Dequeue;

   function Is_Empty return Boolean is
   begin
      --  Ada.Text_IO.Put_Line ("");
      --  Ada.Text_IO.Put ("Head: ");
      --  Ada.Text_IO.Put (Integer'Image (Head) & ", Tail: ");
      --  Ada.Text_IO.Put (Integer'Image (Tail) & " ");

      return Head - Tail = 0;
   end Is_Empty;

   function Is_Full return Boolean is
   begin
      return Tail = Capacity;
   end Is_Full;

   procedure Print_Queue is
   begin
        --if Is_Empty then
 --           Ada.Text_IO.Put_Line ("    Queue is empty.");
   --     else
            Ada.Text_IO.Put ("    Current Queue: [");
            for I in 1 .. Capacity loop
                
               if I <= head or I > tail then
                  Ada.Text_IO.Put("- ");                
               else
                  Ada.Text_IO.Put (Integer'Image (Data (I)) & " ");
               end if;



            end loop;
            Ada.Text_IO.Put_Line ("]");
      --  end if;
   end Print_Queue;


end Queue;
