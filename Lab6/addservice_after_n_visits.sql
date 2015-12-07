connect 'C:/SCLUB' user 'SYSDBA' password 'masterkey';

drop trigger free_addserv;

create trigger free_addserv for accountingservices after insert
as
declare variable n_sum int;
declare variable t_sum_serv int default 0;
declare variable t_sum_tick float default 0.0;
declare variable t_sum int default 0;
begin
n_sum = 4000;

select SUM(addservices.servprice) from addservices,accountingservices
    where accountingservices.id_client = new.id_client and
    accountingservices.buyservdate between '2015-11-01' and '2015-11-03' and
    accountingservices.id_service = addservices.id_service
    into :t_sum_serv;

select SUM(seasontickets.paid) from seasontickets
    where seasontickets.id_client = new.id_client and
    seasontickets.buydate between '2015-11-01' and '2015-11-03'
    into :t_sum_tick;
if (t_sum_serv is null) then
begin
t_sum_serv = 0;
end
if (t_sum_tick is null) then
begin
t_sum_tick = 0;
end

t_sum = t_sum_tick + t_sum_serv;
if (t_sum > n_sum) then begin
execute procedure add_free_serv(new.id_client,new.buyservdate);
end
end;
