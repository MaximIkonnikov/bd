connect 'C:/SCLUB' user 'SYSDBA' password 'masterkey';
create view unpopular10sectionsver2 as
select
first 10 sectionname as Name,
count (id_ticket) as Tickets
from SECTIONS s
 join tickettypestosections t on s.id_section = t.id_section
 join tickettypes tt on tt.id_type = t.id_type
 join seasontickets ss on ss.id_type = tt.id_type
group by sectionname order by Tickets asc
                    

