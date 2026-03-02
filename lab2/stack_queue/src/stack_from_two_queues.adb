with Ada.Text_IO;
with queue;

package body Stack_From_Two_Queues is
   package MainQ is new Queue;
   package TempQ is new Queue;
   procedure Push (Item : Integer) is
   begin
      if MainQ.Is_Full then
         Ada.Text_IO.Put_Line ("Overflow: no space");
         return;
      end if;
      MainQ.Enqueue (Item);
      MainQ.Print_Queue;
      TempQ.Print_Queue;
   end Push;

   function Pop return Integer is
      Temp : Integer;
   begin
      if MainQ.Is_Empty then
         Ada.Text_IO.Put_Line ("Underflow: nothing is stored");
         return -1;
      end if;

      while not MainQ.Is_Empty loop
         Temp := MainQ.Dequeue;
         if MainQ.Is_Empty then
            exit;
         end if;
         TempQ.Enqueue (Temp);

      MainQ.Print_Queue;
      TempQ.Print_Queue;
      end loop;
      --move everything back to main
      while not TempQ.Is_Empty loop
         MainQ.Enqueue(TempQ.Dequeue);
      end loop;
      MainQ.Print_Queue;
      TempQ.Print_Queue;
      return Temp;
   end Pop;
end Stack_From_Two_Queues;
