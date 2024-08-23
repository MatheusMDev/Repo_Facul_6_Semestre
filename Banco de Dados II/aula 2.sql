create function reajustar
(
	@valor decimal(10,2),
	@taxa  decimal(10,2)
)
returns decimal(10,2)
as
begin
	return(@valor * (1 + @taxa/100))
end
go
-- teste--
select dbo.reajustar(200, -7.5) Resultado

select * from produtos

select prd_descricao Produto,
	   prd_valor	Preco_Atual, 
	   dbo.reajustar(prd_valor, 10) Aumento,
	   dbo.reajustar(prd_valor, -15) Desconto
from produtos


select * from produtos

update produtos set
	prd_valor = dbo.reajustar(prd_valor,5)
where prd_codigo in (1,3,5)


-- Tabela com coluna calculada --
create table simulacao
(
	id int not null primary key identity,
	valor decimal(10,2),
	taxa decimal(10,2),
	valor_final as dbo.reajustar(valor, taxa)
)

-- teste --
insert into simulacao(valor, taxa) values (1000, 20)
insert into simulacao(valor, taxa) values (1000, -10)
insert into simulacao(valor, taxa) values (51.47, 27.69)

select * from simulacao



__________________________________________----

select * from itens_pedidos
go

create function calcTotal(@nr int)
returns money
as
begin 
	return
	(
			select sum(itp_qtd * itp_valor)
			from itens_pedidos
			where ped_numero = @nr
	)
end

-- teste --
select dbo.calcTotal(3) Total
select dbo.calcTotal(6) Total // quando não existe retorna null

update pedidos set
	ped_valor = dbo.calcTotal(ped_numero)


------------------------------

select * from pedidos

create function buscaPedCli(@cliente int)
returns int
as 
begin
	return (select count(*) from pedidos
	where cli_codigo = @cliente)
end
go
----------------teste
select dbo.buscaPedCli(2) Qtd


--------------------------

create function calcEstoqueMedio(@produto int)
returns int
as 
begin
	return
	(
	select AVG(itp_qtd)
	from itens_pedidos
	where prd_codigo = @produto
	)
end
go

--Teste --
select dbo.calcEstoqueMedio(3) Estoque
