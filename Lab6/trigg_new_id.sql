connect 'C:/SCLUB' user 'SYSDBA' password 'masterkey';
--create generator increment;
--set generator increment to TRAINERS.id_trainer;

drop trigger auto_fill;

create trigger auto_fill for TRAINERS before insert
as
begin
 new.id_trainer = gen_id(increment,1);
 end;


