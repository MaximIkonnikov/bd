connect 'C:/SCLUB' user 'SYSDBA' password 'masterkey';

drop trigger real_price;

create trigger real_price for seasontickets before insert
as
declare variable discid int;
declare variable discval int;
declare variable fprice int;
declare variable rprice float;
begin
select clients.id_discount from clients
    where new.id_client = clients.id_client
    into :discid;
select discounts.discountvalue from discounts, clients where
    clients.id_discount = discounts.id_discount and
    new.id_client = clients.id_client
    into :discval;
select TICKETTYPES.price from tickettypes where
    tickettypes.id_type = new.id_type
    into :fprice;
if (discid=1 or discid=2 or discid=3)  then begin
rprice = fprice - (fprice*discval)/100;
end
else begin
rprice = fprice;
end
new.paid = rprice;
end;

