delimiter $$
create procedure vender_ingresso(
    in id_sessao_param int,
    in nome_cliente_param varchar(100),
    in valor_pago_param decimal(6,2)
)
BEGIN
    declare ingressos_vendidos int;
    declare ingressos_disponiveis int;

    ingressos_disponiveis = (select capacidade_maxima from sessao where id_sessao = id_sessao_param) - (select count(*) from ingresso where id_sessao = id_sessao_param);
    if ingressos_disponiveis = 0 then
        signal sqlstate '45000' set message_text = 'Sessão lotada!';
    end if;
    else insert into ingressos(id_sessao, nome_cliente, valor_pago) values 
    (id_sessao_param, nome_cliente_param, valor_pago_param);
end $$
delimter ;
