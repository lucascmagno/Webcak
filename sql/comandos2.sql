select * from bolo;
select * from usuario;
select * from venda;

INSERT INTO venda (idVenda, idusuario, idbolo, data_venda) VALUES (null, 1, 1,  NOW());

#pagina de listagem de todos
SELECT v.idVenda as id, u.nome, b.nomeBolo AS bolo, b.precoBolo, v.data_venda as data
FROM usuario u
INNER JOIN venda v ON u.idusuario = v.idusuario
INNER JOIN bolo b ON v.idbolo = b.idBolo
ORDER BY v.idVenda;
