package queue_from_two_stacks is
   procedure Enqueue (Item : Integer);
   procedure Dequeue;
   function Is_Empty return Boolean;
   function Is_Full return Boolean;
   procedure Print_Queue;
private
   Capacity : constant Integer := 10;
   Stack1     : array (0 .. Capacity) of Integer := (others => 0);
   Stack2     : array (0 .. Capacity) of Integer := (others => 0);
   Top      : Integer := 0;
end queue_from_two_stacks;