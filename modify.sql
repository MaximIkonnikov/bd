connect 'C:\SCLUB'
user 'SYSDBA' password 'masterkey';

alter table Clients drop ID_TICKET;

alter table Accounting add ID_TICKET int not null;
alter table Accounting add constraint acc_to_tickets foreign key (ID_TICKET)
references SeasonTickets (ID_TICKET);

create table Visits(
    ID_CLIENT int not null
    ,NumberOfVisits int
);
alter table Visits add constraint visits_to_clients foreign key (ID_CLIENT)
references Clients (ID_CLIENT);

create table AddServices(
    ID_SERVICE int primary key
    ,ID_TYPE int
    ,ServiceName varchar(255)
);
alter table AddServices add constraint services_to_types foreign key (ID_TYPE)
references TicketTypes (ID_TYPE);

create table AccountingServices(
    ID_CLIENT int not null
    ,ID_SERVICE int not null
);
alter table AccountingServices add constraint accserv_to_clients foreign key (ID_CLIENT)
references Clients(ID_CLIENT);
alter table AccountingServices add constraint accserv_to_services foreign key (ID_SERVICE)
references AddServices(ID_SERVICE);
