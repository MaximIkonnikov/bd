connect 'C:\SCLUB' user 'SYSDBA' password 'masterkey';
create view unpopular10sections as select first 10 SECTIONS.sectionname as Name,
    COUNT(SEASONTICKETS.ID_TICKET) as Tickets from SECTIONS, SEASONTICKETS
   ,tickettypes, tickettypestosections where SEASONTICKETS.id_type = TICKETTYPES.id_type
   and  SECTIONS.ID_SECTION in (select TICKETTYPESTOSECTIONS.id_section from TICKETTYPESTOSECTIONS
   where tickettypestosections.id_type = tickettypes.id_type) group by SECTIONS.sectionname order by Tickets asc;

