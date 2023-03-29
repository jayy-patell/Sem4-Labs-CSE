set serveroutput on
declare
	issue_date DATE;
	return_date DATE;
	fine number(5);
	diff number(5);
begin
	issue_date:= '&d1';
	return_date:= '&d2';
	diff:= return_date - issue_date;
	
	IF diff>=0 and diff<=7 then
		fine:= 0;
		dbms_output.put_line('Your fine is '||fine);
	ELSIF diff>=8 and diff<=15 then
		fine:= 1*diff;
		dbms_output.put_line('Your fine is '||fine);
	ELSIF diff>=16 and diff<=30 then
		fine:= 2*diff;
		dbms_output.put_line('Your fine is '||fine);
	ELSIF diff>30 then
		fine:= 5*diff;
		dbms_output.put_line('Your fine is '||fine);
	END IF;
end;
/
		
	
