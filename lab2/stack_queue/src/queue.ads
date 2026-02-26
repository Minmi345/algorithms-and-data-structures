package Queue is
   procedure Enqueue (Item : Integer);
   procedure Dequeue;
   function Is_Empty return Boolean;
   function Is_Full return Boolean;
   procedure Print_Queue;
private
   Capacity : constant Integer := 10;
   Data     : array (0 .. Capacity) of Integer := (others => 0);
   Tail     : Integer := 0;
   Head     : Integer := 0;
end Queue;
