connect 'C:\SCLUB' user 'SYSDBA' password 'masterkey';

insert into TICKETTYPES (ID_TYPE, TYPENAME, PRICE) values (1, 'UNLIM', 10000);
insert into TICKETTYPES (ID_TYPE, TYPENAME, PRICE) values (2, 'FOOTBALL', 2000);
insert into TICKETTYPES (ID_TYPE, TYPENAME, PRICE) values (3, 'BASKETBALL', 2000);
insert into TICKETTYPES (ID_TYPE, TYPENAME, PRICE) values (4, 'POWERLIFTING', 2000);
insert into TICKETTYPES (ID_TYPE, TYPENAME, PRICE) values (5, 'BODYBUILDING', 2000);
insert into TICKETTYPES (ID_TYPE, TYPENAME, PRICE) values (6, 'FOOTBAL+GYM', 3500);
insert into TICKETTYPES (ID_TYPE, TYPENAME, PRICE) values (7, 'TENNIS', 5000);

insert into SEASONTICKETS (ID_TICKET, ID_TYPE, PERIOD) values (1, 1, '2015-12-12');
insert into SEASONTICKETS (ID_TICKET, ID_TYPE, PERIOD) values (2, 1, '2015-10-05'); commit;
insert into SEASONTICKETS (ID_TICKET, ID_TYPE, PERIOD) values (3, 2, '2015-09-10'); commit;
insert into SEASONTICKETS (ID_TICKET, ID_TYPE, PERIOD) values (4, 3, '2015-09-30'); commit;
insert into SEASONTICKETS (ID_TICKET, ID_TYPE, PERIOD) values (5, 4, '2015-08-11'); commit;

insert into CLIENTS (ID_CLIENT, CLIENTNAME, TELNUMBER, NUMOFCLASSES, ID_DISCOUNT)
        values(1, 'Ilya Bulatov', 666666, 5, null);
insert into CLIENTS (ID_CLIENT, CLIENTNAME, TELNUMBER, NUMOFCLASSES, ID_DISCOUNT)
        values(2, 'Vladimir Putin', 777777, 7, 1);
insert into CLIENTS (ID_CLIENT, CLIENTNAME, TELNUMBER, NUMOFCLASSES, ID_DISCOUNT)
        values(3, 'Artem Dzyuba', 123456, 50, 1);
insert into CLIENTS (ID_CLIENT, CLIENTNAME, TELNUMBER, NUMOFCLASSES, ID_DISCOUNT)
        values(4, 'Megan Fox', 321321, 2, null);

insert into ROOMS (ID_ROOM, ROOMNAME) values (1, 'FOOTBALLROOM');
insert into ROOMS (ID_ROOM, ROOMNAME) values (2, 'TENNISCOURT');
insert into ROOMS (ID_ROOM, ROOMNAME) values (3, 'GYM');
insert into ROOMS (ID_ROOM, ROOMNAME) values (4, 'BASKETBALLROOM');

insert into SECTIONS (ID_SECTION, SECTIONNAME, ID_ROOM) values (1, 'FOOTBALL', 1);
insert into SECTIONS (ID_SECTION, SECTIONNAME, ID_ROOM) values (2, 'TENNIS', 2);
insert into SECTIONS (ID_SECTION, SECTIONNAME, ID_ROOM) values (3, 'BASKETBALL', 4);
insert into SECTIONS (ID_SECTION, SECTIONNAME, ID_ROOM) values (4, 'POWERLIFTING', 3);
insert into SECTIONS (ID_SECTION, SECTIONNAME, ID_ROOM) values (5, 'BODYBUILDING', 3);

insert into DISCOUNTS (ID_DISCOUNT, DISCOUNTNAME, DISCOUNTVALUE)
    values (1, 'Students', 10);
insert into DISCOUNTS (ID_DISCOUNT, DISCOUNTNAME, DISCOUNTVALUE)
    values (2, 'Pensioners', 10);
insert into DISCOUNTS (ID_DISCOUNT, DISCOUNTNAME, DISCOUNTVALUE)
    values (3, 'VIP', 25);

insert into ACCOUNTING (ID_CLIENT, ID_DISCOUNT, PAID, ID_TICKET) values (1, 2, 10000, 1);
insert into ACCOUNTING (ID_CLIENT, ID_DISCOUNT, PAID, ID_TICKET) values (2, 1, 10000, 2);
insert into ACCOUNTING (ID_CLIENT, ID_DISCOUNT, PAID, ID_TICKET) values (3, 3, 10000, 3);
insert into ACCOUNTING (ID_CLIENT, ID_DISCOUNT, PAID, ID_TICKET) values (4, 3, 10000, 4);

insert into TRAINERS (ID_TRAINER, TRAINERNAME, TRAINEREXP, ID_SECTION)
    values (1, 'Leonid Slutsky', 9, 1);
insert into TRAINERS (ID_TRAINER, TRAINERNAME, TRAINEREXP, ID_SECTION)
    values (2, 'Maria Sharapova', 10, 2);
insert into TRAINERS (ID_TRAINER, TRAINERNAME, TRAINEREXP, ID_SECTION)
    values (3, 'Ivan Ivanov', 9, 3);
insert into TRAINERS (ID_TRAINER, TRAINERNAME, TRAINEREXP, ID_SECTION)
    values (4, 'Maxim Ikonnikov', 20, 4);
insert into TRAINERS (ID_TRAINER, TRAINERNAME, TRAINEREXP, ID_SECTION)
    values (5, 'Misha Skalyga', 2, 4);
insert into TRAINERS (ID_TRAINER, TRAINERNAME, TRAINEREXP, ID_SECTION)
    values (6, 'Jay Cutler', 5, 5);

insert into TICKETTYPESTOSECTIONS (ID_TYPE, ID_SECTION) values (2, 1);
insert into TICKETTYPESTOSECTIONS (ID_TYPE, ID_SECTION) values (7, 2);
insert into TICKETTYPESTOSECTIONS (ID_TYPE, ID_SECTION) values (3, 3);
insert into TICKETTYPESTOSECTIONS (ID_TYPE, ID_SECTION) values (4, 4);
insert into TICKETTYPESTOSECTIONS (ID_TYPE, ID_SECTION) values (5, 5);




