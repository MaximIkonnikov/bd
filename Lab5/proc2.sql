connect 'C:/SCLUB' user 'SYSDBA' password 'masterkey';

drop procedure inc_clients;

create procedure inc_clients(min_date date, max_date date)
returns (new_clients int, new_clients_proc float)
as
declare variable all_clients int default 0;
declare variable cur_client int default 0;
declare variable cur_count int;
declare variable cur_old int default 0;
declare variable all_clients_period int;

begin
    for select CLIENTS.id_client from CLIENTS,SEASONTICKETS where
    seasontickets.buydate < :min_date and
    seasontickets.id_client = clients.id_client group by clients.id_client
     into :cur_client
     do begin
     all_clients = all_clients+1;

    select COUNT(SEASONTICKETS.id_ticket) from  SEASONTICKETS where
    seasontickets.buydate between :min_date and :max_date and
    seasontickets.id_client = :cur_client
    into cur_count;
    if (cur_count!=0) then begin
    cur_old = cur_old+1;
     end
     end

    select COUNT(CLIENTS.id_client) from CLIENTS, SEASONTICKETS where
    seasontickets.buydate between :min_date and :max_date and
    seasontickets.id_client = clients.id_client
    into :all_clients_period;

    new_clients = all_clients_period - cur_old;

    new_clients_proc = (new_clients/all_clients)*100;
    end;
