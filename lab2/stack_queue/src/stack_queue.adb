with Ada.Text_IO;
with Stack;
with Queue;
with queue_from_two_stacks;
with queue_from_stack;
with Stack_From_Two_Queues;
with Stack_From_Queue;

procedure Stack_Queue is
   Temp : Integer;
   package stackk is new Stack;
   package q is new Queue;
begin

   -- SUCCESFUL TEST FOR OVERFLOW/UNDERFLOW
   Ada.Text_IO.Put_Line ("---------------------------------------------------------------");
   Ada.Text_IO.Put_Line ("                             STACK");
   
   stackk.Push (10);
   Temp := Stackk.Pop;
   Temp := Stackk.Pop;
   
   for I in 1 .. 14 loop
      Stackk.Push (I);
   end loop;
   Temp := Stackk.Pop;

   Ada.Text_IO.Put_Line ("---------------------------------------------------------------");
   Ada.Text_IO.Put_Line ("                             QUEUE");

   q.Enqueue (10);
   q.Enqueue (10);
   q.Enqueue (10);
   Temp := q.Dequeue;
   Temp := q.Dequeue;
   Temp := q.Dequeue;
   Temp := q.Dequeue;
   for I in 1 .. 14 loop
      q.Enqueue (I);
   end loop;
   Temp := q.Dequeue;
   Temp := q.Dequeue;
   Temp := q.Dequeue;

   Ada.Text_IO.Put_Line ("---------------------------------------------------------------");
   Ada.Text_IO.Put_Line ("                        QUEUE FROM TWO STACKS");

   queue_from_two_stacks.Enqueue (10);
   queue_from_two_stacks.Enqueue (10);
   queue_from_two_stacks.Enqueue (10);
   queue_from_two_stacks.Dequeue;
   queue_from_two_stacks.Dequeue;
   queue_from_two_stacks.Dequeue;
   queue_from_two_stacks.Dequeue;
   for I in 1 .. 14 loop
      queue_from_two_stacks.Enqueue (I);
   end loop;
   queue_from_two_stacks.Dequeue;
   queue_from_two_stacks.Dequeue;
   queue_from_two_stacks.Dequeue;

   Ada.Text_IO.Put_Line ("---------------------------------------------------------------");
   Ada.Text_IO.Put_Line ("                        QUEUE FROM ONE STACK!");

   queue_from_stack.Enqueue (10);
   queue_from_stack.Enqueue (10);
   queue_from_stack.Enqueue (10);
   queue_from_stack.Dequeue;
   queue_from_stack.Dequeue;
   queue_from_stack.Dequeue;
   queue_from_stack.Dequeue;
   for I in 1 .. 14 loop
      queue_from_stack.Enqueue (I);
   end loop;
   queue_from_stack.Dequeue;
   queue_from_stack.Dequeue;
   queue_from_stack.Dequeue;

      Ada.Text_IO.Put_Line ("---------------------------------------------------------------");
   Ada.Text_IO.Put_Line ("                             STACK IMPLEMENTED WITH 2 QUEUES");
   
   Stack_From_Two_Queues.Push (10);
   Temp := Stack_From_Two_Queues.Pop;
   Temp := Stack_From_Two_Queues.Pop;
   
   for I in 1 .. 14 loop
      Stack_From_Two_Queues.Push (I);
   end loop;
   Temp := Stack_From_Two_Queues.Pop;

      Ada.Text_IO.Put_Line ("---------------------------------------------------------------");
   Ada.Text_IO.Put_Line ("                             STACK IMPLEMENTED WITH 1 QUEUE");
   
   Stack_From_Queue.Push (10);
   Stack_From_Queue.Pop;
   Stack_From_Queue.Pop;
   
   for I in 1 .. 10 loop
      Stack_From_Queue.Push (I);
   end loop;
   Stack_From_Queue.Pop;

end Stack_Queue;
