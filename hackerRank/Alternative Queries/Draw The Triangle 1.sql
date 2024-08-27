BEGIN 
    for i in REVERSE 1..5 loop
        for j in 1..i loop
            dbms_output.put_line('*');
        end loop;
        dbms_output.put_line('\n')
    end loop;
end;