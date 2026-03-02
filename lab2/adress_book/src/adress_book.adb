with linked_list;
with Node;

procedure Adress_Book is
   type Test_Data_Array is array (1 .. 5) of Node.Info;
   People : constant Test_Data_Array :=
     ((Person  => "Alice" & (6 .. 50 => ' '),
       Address => "123 Lane" & (9 .. 70 => ' ')),
      (Person  => "Bob" & (4 .. 50 => ' '),
       Address => "456 Road" & (9 .. 70 => ' ')),
      (Person  => "Charlie" & (8 .. 50 => ' '),
       Address => "789 Blvd" & (9 .. 70 => ' ')),
      (Person  => "Diana" & (6 .. 50 => ' '),
       Address => "101 Court" & (10 .. 70 => ' ')),
      (Person  => "Edward" & (7 .. 50 => ' '),
       Address => "202 Way" & (8 .. 70 => ' ')));

   get_Node : Node.Node_Access;
begin
   linked_list.print_List;
   get_Node := linked_list.get (People (2));

   for I in 1 .. 5 loop
      linked_list.Add (People (I));
   end loop;

   linked_list.print_List;
   get_Node := linked_list.get (People (2));
   get_Node := linked_list.get (People (5));

   get_Node := linked_list.get (2);
   get_Node := linked_list.get (6);

   linked_list.delete (People(2));
   linked_list.print_List;
   linked_list.delete (People(1));
   linked_list.print_List;

end Adress_Book;
