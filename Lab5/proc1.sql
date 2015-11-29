connect 'C:/SCLUB' user 'SYSDBA' password 'masterkey';

drop procedure discount_loss;

create procedure discount_loss(min_date date, max_date date)
returns(loss_value int, loss_otn float)
as
declare variable income_without_disc int;
declare variable income_with_disc float;
declare variable disc_val int;
declare variable price_val int;
declare variable all_disc float default 0;
begin
    select SUM(TICKETTYPES.price) from seasontickets, tickettypes where
    tickettypes.id_type = seasontickets.id_type and
    seasontickets.buydate between :min_date and :max_date
    into :income_without_disc;

    for select discounts.discountvalue, tickettypes.price from clients, discounts,
    seasontickets, tickettypes where
    seasontickets.id_client = clients.id_client and
    seasontickets.id_type = tickettypes.id_type and
    seasontickets.buydate between :min_date and :max_date and
    clients.id_discount = discounts.id_discount into :disc_val, :price_val
    do
    begin
    all_disc = all_disc + (disc_val/100)*price_val;
    end
        
    loss_value = all_disc;
    loss_otn = (loss_value/income_without_disc)*100;
    end;


