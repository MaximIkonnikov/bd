connect 'C:\SCLUB'
user 'SYSDBA' password 'masterkey';

alter table Clients drop ID_TICKET;

alter table SeasonTickets add ID_CLIENT int not null;
alter table SeasonTickets add constraint tickets_to_clients foreign key (ID_CLIENT)
references Clients (ID_CLIENT);

drop table Accounting;

create table TicketsAccounting(
    ID_CLIENT int not null
    ,ID_TICKET int not null
    ,BuyDate date
);

alter table TicketsAccounting add constraint acc_to_client foreign key (ID_CLIENT)
references Clients (ID_CLIENT);
alter table TicketsAccounting add constraint acc_to_stickets foreign key (ID_TICKET)
references SeasonTickets (ID_TICKET);

create table Visits(
    ID_CLIENT int not null
    ,VisitDate date
);
alter table Visits add constraint visits_to_clients foreign key (ID_CLIENT)
references Clients (ID_CLIENT);

create table AddServices(
    ID_SERVICE int primary key
    ,ServiceName varchar(255)
    ,ServPrice int
);

create table ServicesToTypes(
    ID_SERVICE int
    ,ID_TYPE int
);
alter table ServicesToTypes add constraint stt_to_serv foreign key (ID_SERVICE)
references AddServices (ID_SERVICE);
alter table ServicesToTypes add constraint stt_to_types foreign key (ID_TYPE)
references TicketTypes (ID_TYPE);


create table AccountingServices(
    ID_CLIENT int not null
    ,ID_SERVICE int not null
    ,BuyServDate date
);
alter table AccountingServices add constraint accserv_to_clients foreign key (ID_CLIENT)
references Clients(ID_CLIENT);
alter table AccountingServices add constraint accserv_to_services foreign key (ID_SERVICE)
references AddServices(ID_SERVICE);
