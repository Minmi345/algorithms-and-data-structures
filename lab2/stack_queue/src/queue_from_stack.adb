with Stack;
with Ada.Text_IO;

package body queue_from_stack is
   package stackk is new Stack;

   procedure Enqueue (Item : Integer) is
   begin
      stackk.Push (Item);
      stackk.Print_Stack;
   end Enqueue;
   --1234567890
   --

   procedure Dequeue is
      Temp : Integer;
   begin

      if stackk.Is_Empty then
         Ada.Text_IO.Put_Line ("Underflow: Queue is empty");
         return;
      end if;
      
      Temp := stackk.pop;
      stackk.Print_Stack;
      if stackk.Is_Empty then 
         return;
      end if;

      Dequeue;

      stackk.push(Temp);
      stackk.Print_Stack;
      return;
   end Dequeue;
end queue_from_stack;
