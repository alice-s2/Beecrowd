create table doctors(
	id integer primary key, 
	name varchar(50)
);

create table work_shifts(
	id integer primary key,
	name varchar(50),
	bonus numeric
);

create table attendances(
	id integer primary key,
	id_doctor integer references doctors(id),
	hours integer,
	id_work_shifts integer references work_shifts(id)
);

select * from doctors;

insert into doctors (id, name) values(1, 'Arlino'), (2, 'Tiago'), (3, 'Amanda'), (4, 'Wellington');
insert into work_shifts (id, name, bonus) values(1, 'nocturnal', 15), (2, 'afternoon', 2), (3, 'day', 1);
insert into attendances (id, id_doctor, hours, id_work_shift) 
values(1, 1, 5, 1), (2, 3, 2, 1), (3, 3, 3, 2), (4, 2, 2, 3), (5, 1, 5, 3), (6, 4, 1, 3), (7, 4, 2, 1), (8, 3, 2, 2), (9, 2, 4, 2);

select doctors.name, round(sum(((attendances.hours*150)*(1 + work_shifts.bonus/100))), 1) as salary
from attendances join doctors on doctors.id = attendances.id_doctor
				 join work_shifts on work_shifts.id = attendances.id_work_shift
group by doctors.name
order by salary desc;
