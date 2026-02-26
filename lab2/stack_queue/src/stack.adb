with Ada.Text_IO; -- import library

package body Stack is
    function Is_Empty return Boolean is
        -- true/false
    begin
        return Top = 0;
    end Is_Empty;

    function Is_Full return Boolean is
        --motsats to isEmpty()
    begin
        return Top = Capacity;
    end Is_Full;

    procedure Push (Item : Integer) is
    begin
        if not Is_Full then
            Top := Top + 1;
            Data (Top) := Item;
            Ada.Text_IO.Put_Line ("Item Succesfuly added to the stack");
        else
            Ada.Text_IO.Put_Line ("Overflow: Stack is full; nothing is added");
        end if;
        Print_Stack;

    end Push;

    procedure Pop is
    begin
        Ada.Text_IO.Put_Line ("Popping last element...");

        if Is_Empty then
            Ada.Text_IO.Put_Line ("Underflow: Stack is empty.");
        -- Item :=    -1; --"dummy" value

        else
            --Item := Data (Top);
            Top := Top - 1;
        end if;
        Print_Stack;

    end Pop;

    procedure Print_Stack is
    begin
        --if Is_Empty then
        --    Ada.Text_IO.Put_Line ("    Stack is empty.");
        --else
            Ada.Text_IO.Put ("    Current Stack: [");
            for I in 1 .. Capacity loop
                if I > Top then
                    Ada.Text_IO.Put ("-  ");
                else
                    -- Integer'Image to convert the number to text
                    Ada.Text_IO.Put (Integer'Image (Data (I)) & " ");
                end if;

            end loop;
            Ada.Text_IO.Put_Line ("]");
--        end if;
    end Print_Stack;

end Stack;
