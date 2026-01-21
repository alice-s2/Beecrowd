create table products (
	id numeric,
	name varchar(50),
	type char,
	price numeric
);

insert into products(id, name, type, price) values
(1, 'Monitor', 'B', 0),
(2, 'Headset', 'A', 0),
(3, 'PC Case', 'A', 0),
(4, 'Computer Desk', 'C', 0),
(5, 'Gaming Chair', 'C', 0),
(6, 'Mouse', 'A', 0);

select * from products;

select name, 
    case
        when type = 'A' then 20.0
        when type = 'B' then 70.0
        when type = 'C' then 530.5
    end as price
from products
order by type, id desc;
