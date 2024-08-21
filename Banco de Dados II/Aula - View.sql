create view ped_total
as
select ped_numero Pedido, sum(itp_qtd * itp_valor) Valor_Item
from itens_pedidos
group by ped_numero

--- teste ----
select * from ped_total

-------------------------

Select * from pedidos
update pedidos set ped_status = 2
where ped_numero = 2 or ped_numero = 4
go

create view ped_info
as
select p.ped_numero Pedido,
	p.ped_data Data,
	case ped_status
		when 1 then 'Ativo'
		when 2 then 'Pendente'
		when 3 then 'Cancelado'
	end Situação,
	cli.pes_nome Cliente, 
	fun.pes_nome Funcionario,
	est.pes_nome Estagiario
from pedidos p, pessoas cli, pessoas fun, pessoas est
where p.cli_codigo = cli.pes_codigo and 
	p.fun_codigo = fun.pes_codigo and
	p.est_codigo = est.pes_codigo
go

--- Teste -----
select * from ped_info
-----------------------

select * from ped_info
select * from ped_total

create view ped_detalhes
as
select pt.Pedido Pedido,
	pin.Data Data,
	pt.Valor_Item Total,
	pin.Cliente Cliente,
	pin.Funcionario Funcionario,
	pin.Estagiario Estagiario,
	pin.Situação Situação
from ped_total pt, ped_info pin 
where pt.Pedido = pin.Pedido


---- teste ---
select * from ped_detalhes
--------------------------

create view v_prods
as
select p.prd_codigo Codigo,
	p.prd_descricao Produto,
	p.prd_qtd	Estoque,
	p.prd_valor	Preço,
	case prd_status
	when 1 then 'Ativo'
	else 'Inativo'
	end Situação,
	case 
	when prd_qtd <= 5 then 'Estoque Baixo'
	else 'Normal'
	end Situação_Estoque
from produtos p

select * from v_prods

update produtos set prd_qtd = 3 where prd_codigo in(2,4)



---- Acesso a outro banco possível ---
use master 
select * from Vendas_CCO.dbo.ped_total

-----------------------------

