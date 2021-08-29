USE Encyclopedia;

/* Criar o administrador */
DROP USER IF EXISTS 'encyadmin'@'localhost';
CREATE USER 'encyadmin'@'localhost' IDENTIFIED BY 'encyadmin';
-- Dar todos os previlégios ao administrador do programa
GRANT ALL PRIVILEGES ON encyclopedia.* TO 'encyadmin'@'localhost';
/* Criar o utilizador que por sua vez é o cliente/utilizador do programa*/

DROP USER IF EXISTS 'utilizador'@'localhost';
CREATE USER 'utilizador'@'localhost' IDENTIFIED BY 'utilizador';
GRANT SELECT ON Encyclopedia.v_visualizar_programas TO 'utilizador'@'localhost';
GRANT SELECT ON Encyclopedia.v_avaliacao_media_programas  TO 'utilizador'@'localhost';
GRANT SELECT ON Encyclopedia.v_num_programas_por_realizador TO 'utilizador'@'localhost';
GRANT SELECT ON Encyclopedia.v_visualizar_todos_servicos  TO 'utilizador'@'localhost';
GRANT SELECT(Nome, Link) ON Encyclopedia.Servicos TO 'utilizador'@'localhost';

-- Garantir entrada de informação
GRANT INSERT, DELETE, UPDATE(Avaliacao, Comentario, IDUtilizador, IDPrograma) ON Encyclopedia.Avaliacoes TO 'utilizador'@'localhost';
GRANT INSERT, DELETE, UPDATE(Telefone, IDUtilizador) ON Encyclopedia.Telefones_Utilizadores TO 'utilizador'@'localhost';

/* DISCLAIMER ,All of the previous code provided was made by Leandro Martins, GitHub: github.com/GoldenLeoPT */