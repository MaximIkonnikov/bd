connect 'C:/SCLUB' user 'SYSDBA' password 'masterkey';
create exception errror 'Error deleting ticket type';
drop trigger check_cel;

create trigger check_cel for tickettypes before delete or update
as
begin
 if (OLD.id_type in (select seasontickets.id_type from seasontickets)) then
 exception errror;
end;
