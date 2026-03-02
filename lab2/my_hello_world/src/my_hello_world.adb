with Ada.Text_IO; -- import library
with Ada.Command_Line;

-- to run write "alr run" in my_hello_world folder
procedure My_Hello_World is
-- where variables go: in between is and begin
begin
   Ada.Text_IO.Put_Line ("Hi");
    for Next in reverse 1 .. Ada.Command_Line.Argument_Count loop --u can use reverse to reverse. or not reverse by removing reverse..
      Ada.Text_IO.Put_Line (Ada.Command_Line.Argument (Next));
   end loop;
   null;

end My_Hello_World;
