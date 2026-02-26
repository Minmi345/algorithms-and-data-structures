package Stack is
   procedure Push (Item : Integer);
   procedure Pop;
   function Is_Empty return Boolean;
   function Is_Full return Boolean;
   procedure Print_Stack;
private
   Capacity : constant Integer := 10;
   Data     : array (0 .. Capacity) of Integer := (others => 0);
   Top      : Integer := 0;
end Stack;
