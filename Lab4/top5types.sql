connect 'C:\SCLUB' user 'SYSDBA' password 'masterkey';
create view top5types as select first 5 TICKETTYPES.typename, TICKETTYPES.typename as Name,
    COUNT(SEASONTICKETS.ID_TYPE) as Sell from TICKETTYPES, SEASONTICKETS
    where SEASONTICKETS.ID_TYPE = tickettypes.ID_TYPE group by
    TICKETTYPES.TYPENAME order by Sell desc;

