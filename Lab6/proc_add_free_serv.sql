connect 'C:/SCLUB' user 'SYSDBA' password 'masterkey';
drop procedure add_free_serv;
create procedure add_free_serv(clientid int, bdate date)

as
declare variable popular_id int;
declare variable counterr int;
begin
select  first 1 addservices.id_service,
count(accountingservices.id_service) as Counter from addservices, accountingservices
 where addservices.id_service = accountingservices.id_service
 group by addservices.id_service order by Counter desc into :popular_id, :counterr;
insert into ACCOUNTINGSERVICES  values (:clientid, :popular_id, :bdate);

end;


    
