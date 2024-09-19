select * from pedidos

-- funções do tipo Table 
select * from produtos

alter function buscarProd
(
	@preco decimal(10,2)
)
returns table
as
return
(
	select prd_descricao Produto,
			prd_qtd		Estoque,
			prd_valor	Preco
	from produtos
    where prd_valor > @preco
)
go

--Teste--
select * from buscarProd(2)

create view v_produtos
as
select prd_descricao Produto,
			prd_qtd		Estoque,
			prd_valor	Preco
from produtos

-- teste
select * from v_produtos
where preco > 2


--------------
create table mytable
(
	id int not null primary key identity,
	nome varchar(50),
	data datetime default getdate(),
	status int default 0
)
go

insert into mytable(nome) values ('Real Madrid')
select * from mytable

create view v_mt
as
select * from mytable

insert into v_mt(nome) values ('Barcelona')

-----------------
create function getItens(@nr int)
returns table
as
return(
select p.prd_descricao Produto,
ip.itp_qtd QTD, ip.itp_valor Preco_unitario,
ip.itp_qtd * ip.itp_valor Valor
from itens_pedidos ip, produtos p
where ped_numero = @nr and ip.prd_codigo = p.prd_codigo
)
go

select sum(valor) TOtal from getItens(2)
-------------------------------------
select * from mytable

insert into mytable (nome) select produto from v_produtos
insert into mytable (nome, status) select produto, 10 from v_produtos

------------------
select * from getItens(1)

create table mycopy(nome varchar(50), data datetime default getdate(), valor decimal (10,2))

insert into mycopy select Produto, getdate(), valor from getItens(1)

select * from mycopy

------------------------------------------------
declare @prod table (nome varchar(50), preco money)
insert into @prod values ('lapizinho', 10)
insert into @prod select prd_descricao, prd_valor from produtos
select * from @prod
go

alter function buscarProd2 (@preco decimal(10,2)) 
returns @prod table (nome varchar(50), qtd int, preco money)
as
begin
	insert into @prod 
		select prd_descricao, prd_qtd, prd_valor
		from produtos
		where prd_valor > @preco
	--insert into @prod
	--	select 'escrivaninha', 5, 150
	--insert into @prod	
	--	values ('lapis do morais',100, 2)
	return
end
------------teste----------------
select * from buscarProd2(2)