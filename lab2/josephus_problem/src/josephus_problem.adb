with ada.Text_IO;
with vector_only;
with vector_iterator;
procedure Josephus_Problem is
begin
   --probably gona use 100.000 ()
   vector_only.solve(3,10);
   --  vector_only.solve(0,5);
   --  vector_only.solve(1,5);
   --  vector_only.solve(1,1);

-- given up for now
   --  vector_iterator.solve(3,10);
   --  ada.Text_IO.Put_line("(Winner is 5)");
   --  --  vector_iterator.solve(0,5);
   --  --  ada.Text_IO.Put_line("(Winner is 5)");
   --  vector_iterator.solve(1,5);
   --  ada.Text_IO.Put_line("(Winner is 3)");
   --  vector_iterator.solve(1,1);



end Josephus_Problem;
