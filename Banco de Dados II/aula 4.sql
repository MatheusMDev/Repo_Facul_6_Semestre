select * from pedidos
go


alter function buscarPedCli (@cliente int)
returns @ped table (nr int, data date, total money, funcionario varchar(50))
as 
begin
	declare @pessoa table(nome varchar(50))
	insert into @ped
	select ped_numero, ped_data, ped_valor,
		f.pes_nome
	from pedidos p, pessoas f
	where p.fun_codigo = f.pes_codigo and p.cli_codigo = @cliente

	insert into @pessoa values ('Mioto')
	return
end
go
select * from buscarPedCli(2)