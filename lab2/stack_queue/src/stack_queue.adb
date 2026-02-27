with Ada.Text_IO;
with Stack;
with Queue;

procedure Stack_Queue is
begin

   -- SUCCESFUL TEST FOR OVERFLOW/UNDERFLOW
   Stack.Push (10);
   Stack.Pop;
   Stack.Pop;

   for I in 1 .. 14 loop
      Stack.Push (I);
   end loop;

   Stack.Pop;

   Ada.Text_IO.Put_Line ("---------------------------------------------------------------");
   Ada.Text_IO.Put_Line ("                             QUEUE");

   Queue.Enqueue (10);
   Queue.Enqueue (10);
   Queue.Enqueue (10);
   Queue.Dequeue;
   Queue.Dequeue;
   Queue.Dequeue;
   Queue.Dequeue;
   for I in 1 .. 14 loop
      Queue.Enqueue (I);
   end loop;
   Queue.Dequeue;
   Queue.Dequeue;
   Queue.Dequeue;


end Stack_Queue;
