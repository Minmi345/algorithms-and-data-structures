with Stack;
with Ada.Text_IO;

package body queue_from_two_stacks is
   package Inbox is new Stack;
   package Outbox is new Stack;

   procedure Enqueue (Item : Integer) is
   begin
      Inbox.Push (Item);

      Inbox.Print_Stack;
      Outbox.Print_Stack;
   end Enqueue;
   --1234567890
   --

   procedure Dequeue is
      Temp : Integer;
   begin

      if Outbox.Is_Empty then
         while not Inbox.Is_Empty loop
            Outbox.Push (Inbox.Pop);
         end loop;
      end if;

      if not Outbox.Is_Empty then
         Temp := Outbox.Pop;
      else
         Ada.Text_IO.Put_Line ("Underflow: Queue is empty");
      end if;
      Inbox.Print_Stack;
      Outbox.Print_Stack;
   end Dequeue;
   --1234567890
   --098765432.

   --
   --654321

   --234567890
   --

end queue_from_two_stacks;
