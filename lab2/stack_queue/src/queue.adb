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
         Data (Tail) := Item;
         Ada.Text_IO.Put_Line ("    Item Succesfuly added to the queue");

      else
         Ada.Text_IO.Put_Line ("Overflow: no space");
      end if;
      --  Print_Queue;
   end Enqueue;

   function Dequeue return Integer is
   Temp: Integer;
   begin
      Ada.Text_IO.Put_Line ("    Dequeueing last element...");

      --  Ada.Text_IO.Put_Line ("");
      --  Ada.Text_IO.Put ("Head: ");
      --  Ada.Text_IO.Put (Integer'Image (Head) & ", Tail: ");
      --  Ada.Text_IO.Put (Integer'Image (Tail) & " ");

      if Is_Empty then
         Ada.Text_IO.Put_Line ("Underflow: nothing to delete.");
         Temp := -1;
      else
         Temp := Data (head);
         --Data (head) := 0; --popping dude away
         Head := Head + 1;
         Ada.Text_IO.Put_Line ("    Dequeued!");

      end if;
      --  Print_Queue;
      return Temp;
   end Dequeue;

   function Is_Empty return Boolean is
   begin
      return Head - Tail = 0;
   end Is_Empty;

   function Is_Full return Boolean is
   begin
      --  return Tail = Capacity;
      return Tail = Capacity;
   end Is_Full;

   procedure Print_Queue is
   begin
      Ada.Text_IO.Put ("    Current Queue: [");
      for I in 1 .. Capacity loop


         if (head <= tail and (I <= head or I > tail)) --usual queue
         then
            Ada.Text_IO.Put ("- ");
         else
            Ada.Text_IO.Put (Integer'Image (Data (I)) & " ");
         end if;

      end loop;
      Ada.Text_IO.Put_Line ("]");
   end Print_Queue;


end Queue;
