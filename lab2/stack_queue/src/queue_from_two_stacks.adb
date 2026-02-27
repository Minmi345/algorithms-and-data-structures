with Stack;

package queue_from_two_stacks is
   package Inbox is new Stack; 
   package Outbox is new Stack;

   procedure Enqueue (Item : Integer) is
   begin
      Inbox.Push(Item);
   end Enqueue;
--1234567890
--

   procedure Dequeue is begin
   end Dequeue;
   function Is_Empty return Boolean is begin 
   end Is_Empty;
--1234567890
--098765432.

--234567890
--

   function Is_Full return Boolean is begin
   end Is_Full;

   procedure Print_Stack is begin
   end Print_Stack;

end queue_from_two_stacks;