with Ada.Text_IO;
with Queue;

package body Stack_From_Queue is
   package Q is new Queue;

   procedure Push (Item : Integer) is
   begin
   Q.Enqueue(Item);
   Q.Print_Queue;
   end Push;

   procedure Pop is 
      Temp : Integer;
   begin 
   
   if Q.Is_Empty then
      Ada.Text_IO.Put_Line ("Undeflow: Stack is empty");
      return;
   end if;

   Temp := Q.Dequeue;
   Q.Print_Queue;

   if Q.Is_Empty then
   return;
   end if;

   Pop;

   Q.Enqueue(Temp);
   Q.Print_Queue;
   return;
   end Pop;
end Stack_From_Queue;
