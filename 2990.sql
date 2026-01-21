create table empregados(
	cpf varchar(15) primary key,
	enome varchar(60),
	salario float,
	cpf_supervisor varchar(15),
	dnumero integer
);

create table departamentos(
	dnumero integer primary key,
	dnome varchar(60),
	cpf_gerente varchar(15) references empregados(cpf)
);

create table trabalha(
	cpf_emp varchar(15) references empregados(cpf),
	pnumero integer
);

create table projetos(
	pnumero integer primary key,
	pnome varchar(45),
	dnumero integer references departamentos(dnumero)
);

insert into empregados(cpf, enome, salario, cpf_supervisor, dnumero) values
(049382234322, 'João Silva', 2350, 2434332222, 1010), (586733922290, 'Mario Silveira', 3500, 2434332222, 1010),
(2434332222, 'Aline Barros', 2350, null, 1010), (1733332162, 'Tulio Vidal', 8350, null, 1020),
(4244435272, 'Juliana Rodrigues', 3310, null, 1020), (1014332672, 'Natalia Marques', 2900, null, 1010);

insert into departamentos(dnumero, dnome, cpf_gerente) values(1010, 'Pesquisa', 049382234322), (1020, 'Ensino', 2434332222);

insert into trabalha(cpf_emp, pnumero) values
(49382234322, 2010), (586733922290, 2020), (49382234322, 2020);

insert into projetos(pnumero, pnome, dnumero) values(2010, 'Alpha', 1010), (2020, 'Beta', 1020);

select empregados.cpf, empregados.enome, departamentos.dnome
from empregados join departamentos on empregados.dnumero = departamentos.dnumero
				left join trabalha on trabalha.cpf_emp = empregados.cpf
where trabalha.cpf_emp is null
order by empregados.cpf
