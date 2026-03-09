with ada.Text_IO;
with vector_only;
with vector_iterator;
with Ada.Real_Time; use Ada.Real_Time;
with linked_list;

procedure Josephus_Problem is
   Start_Time : Time;
   End_Time   : Time;
   Elapsed    : Time_Span;
begin

   --  -- 1. Start the clock
   --  Start_Time := Clock;

   --  -- 2. Run the procedure
   --  vector_iterator.solve(3, 10000);

   --  -- 3. Stop the clock
   --  End_Time := Clock;

   --  -- 4. Calculate the difference
   --  Elapsed := End_Time - Start_Time;

   --  -- 5. Display the result
   --  -- To_Duration converts the Time_Span into a standard decimal seconds format
   --  Ada.Text_IO.Put_Line ("Execution took: " & Duration'Image(To_Duration(Elapsed)) & " seconds");

   --probably gona use 100.000 ()
   --  vector_only.solve(3,10);
   --  vector_only.solve(0,5);
   --  vector_only.solve(1,5);
   --  vector_only.solve(1,1);

   -- given up for now
   --  vector_iterator.solve(3,10);
   --  ada.Text_IO.Put_line("(Winner is 5)");
   --  vector_iterator.solve(0,5);
   --  ada.Text_IO.Put_line("(Winner is 5)");
   --  vector_iterator.solve(1,5);
   --  ada.Text_IO.Put_line("(Winner is 3)");
   --  vector_iterator.solve(1,1);

   --  linked_list.Solve(3,10);
   --  linked_list.Solve(0,5);
   --  linked_list.Solve(1,5);
   --  linked_list.Solve(1,1);

   linked_list.Solve_Iterator(3,10);
   linked_list.Solve_Iterator(0,5);
   linked_list.Solve_Iterator(1,5);
   linked_list.Solve_Iterator(1,1);

end Josephus_Problem;
