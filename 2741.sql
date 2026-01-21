create table students(
	id integer primary key,
	name varchar,
	grade numeric
);

insert into students(id, name, grade) values
(1, 'Terry B. Padillla', 7.3), (2, 'William S. Ray', 0.6), (3, 'Barbara A. Gongora', 5.2), (4, 'Julie B. Manzer', 6.7), (5, 'Teresa J. Axtell', 4.6), (6, 'Ben M. Dantzler', 9.6);

select 'Approved: '|| name as name, grade
from students
where grade >= 7
order by grade desc
