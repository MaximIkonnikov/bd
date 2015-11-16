connect 'C:\SCLUB' user 'SYSDBA' password 'masterkey';
create procedure del_types as
begin
    delete from TICKETTYPES where ID_TYPE not in (select ID_TYPE from SEASONTICKETS);
end;


