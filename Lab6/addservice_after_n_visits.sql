connect 'C:/SCLUB' user 'SYSDBA' password 'masterkey';

drop trigger free_addserv;

create trigger free_addserv for visits after insert
as
declare variable n_visits int;
declare variable t_visits int;
begin
n_visits = 1;

select COUNT(visits.id_client) from visits
    where visits.id_client = new.id_client and
    visits.visitdate between '2015-11-01' and '2015-11-21'
    into :t_visits;
if (t_visits = n_visits) then
execute procedure add_free_serv(new.id_client,new.visitdate);
end;
