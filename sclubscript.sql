connect 'C:\SCLUB'
user 'SYSDBA' password 'masterkey';  

create table SeasonTickets(
    ID_TICKET int primary key
    ,ID_TYPE int not null
    ,Period date
);

create table Clients(
    ID_CLIENT int primary key
    ,ClientName varchar(255)
    ,TelNumber int
    ,ID_TICKET int not null
    ,NumOfClasses int
    ,ID_DISCOUNT int
);

create table TicketTypes(
    ID_TYPE int primary key
    ,TypeName varchar(255)
    ,Price int
);

create table Accounting(
    ID_CLIENT int not null
    ,Paid int
);
create table Discounts(
    ID_DISCOUNT int primary key
    ,DiscountName varchar(255)
    ,DiscountValue int
);

create table Rooms(
    ID_ROOM int primary key
    ,RoomName varchar(255)
);

create table Sections(
    ID_SECTION int primary key
    ,SectionName varchar(255)
    ,ID_ROOM int not null
);

create table Trainers(
    ID_TRAINER int primary key
    ,TrainerName varchar(255)
    ,TrainerExp int
    ,ID_SECTION int not null
);

create table TicketTypesToSections(
    ID_TYPE int not null
    ,ID_SECTION int not null
);

alter table  SeasonTickets add constraint tickets_to_types foreign key (ID_TYPE)
references TicketTypes(ID_TYPE);

alter table Clients add constraint clients_to_tickets foreign key (ID_TICKET)
references SeasonTickets(ID_TICKET);

alter table Accounting add constraint accounting_to_clients foreign key (ID_CLIENT)
references Clients(ID_CLIENT);

alter table Sections add constraint sections_to_rooms foreign key (ID_ROOM)
references Rooms(ID_ROOM);

alter table Trainers add constraint trainers_to_sections foreign key (ID_SECTION)
references Sections(ID_SECTION);

alter table TicketTypesToSections add constraint ttts_to_types foreign key (ID_TYPE)
references TicketTypes(ID_TYPE);

alter table TicketTypesToSections add constraint ttts_to_sections foreign key (ID_SECTION)
references Sections(ID_SECTION);
