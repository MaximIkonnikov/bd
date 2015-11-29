connect 'C:/SCLUB' user 'SYSDBA' password 'masterkey';

drop procedure inc_clients;

create procedure inc_clients(min_date date, max_date date)
returns (new_clients int, new_clients_proc float)
as
declare variable all_clients int;

begin
    select COUNT(CLIENTS.id_client) from CLIENTS,SEASONTICKETS where
    seasontickets.buydate < :min_date and
    seasontickets.id_client = clients.id_client
     into :all_clients;

    select COUNT(CLIENTS.id_client) from CLIENTS, SEASONTICKETS where
    seasontickets.buydate between :min_date and :max_date and
    seasontickets.id_client = clients.id_client
    into new_clients;

    new_clients_proc = (new_clients/all_clients)*100;
    end;
