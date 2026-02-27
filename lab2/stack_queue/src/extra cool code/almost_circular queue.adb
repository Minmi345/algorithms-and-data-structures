with Ada.Text_IO;

package body Queue is
   -- Capacity : constant Integer := 10;
   --   Data : array(1..Capacity) of Integer;
   -- Tail : Integer := 0;
   --  Head : Integer := 0;

   procedure Enqueue (Item : Integer) is
   begin

      if not Is_Full then

         if tail < Capacity then
            tail := tail + 1;
         else
            tail := 1; --circular queue
         end if;
         Ada.Text_IO.Put_Line ("");
         Ada.Text_IO.Put ("Head: ");
         Ada.Text_IO.Put (Integer'Image (Head) & ", Tail: ");
         Ada.Text_IO.Put (Integer'Image (Tail) & " ");
         Data (Tail) := Item;
         Ada.Text_IO.Put_Line ("    Item Succesfuly added to the queue");

      else
         Ada.Text_IO.Put_Line ("Overflow: idk what, but smth happened");
      end if;
      Print_Queue;
   end Enqueue;

   procedure Dequeue is
   begin
      Ada.Text_IO.Put_Line ("    Dequeueing last element...");

      --  Ada.Text_IO.Put_Line ("");
      --  Ada.Text_IO.Put ("Head: ");
      --  Ada.Text_IO.Put (Integer'Image (Head) & ", Tail: ");
      --  Ada.Text_IO.Put (Integer'Image (Tail) & " ");

      if Is_Empty then
         Ada.Text_IO.Put_Line ("Underflow: nothing to delete.");
      else
         Data (head) := 0; --popping dude away
         if Head < Capacity then
            Head := Head + 1;
         else
            Head := 0; --circular queue
         end if;
         Ada.Text_IO.Put_Line ("    Dequeued!");

      end if;
      Print_Queue;
   end Dequeue;

   function Is_Empty return Boolean is
   begin
      return Head - Tail = 0;
   end Is_Empty;

   function Is_Full return Boolean is
   begin
      --  return Tail = Capacity;
      return ((Tail mod Capacity) + 1) = Head;
   end Is_Full;

   procedure Print_Queue is
   begin
      Ada.Text_IO.Put ("    Current Queue: [");
      for I in 1 .. Capacity loop


         if (head <= tail and (I <= head or I > tail)) --usual queue
         then
            Ada.Text_IO.Put ("- ");
         elsif (head > tail and (I >= head or I < tail)) -- circular queue
         then
            Ada.Text_IO.Put (Integer'Image (Data (I)) & " ");
         elsif (head > tail) and (I < head or I > tail) then
            Ada.Text_IO.Put (Integer'Image (Data (I)) & " ");

         else
            Ada.Text_IO.Put (Integer'Image (Data (I)) & " ");
         end if;

      end loop;
      Ada.Text_IO.Put_Line ("]");
   end Print_Queue;


end Queue;
