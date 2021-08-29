USE Encyclopedia;
/* Consulta todos os programas na base de dados*/

CREATE OR REPLACE VIEW v_visualizar_programas AS
SELECT
p.Nome,
p.AnoEstreia AS "Ano de Estreia",
e.Nome AS Estudio,
pessoa.Nome AS Realizador
FROM Programas p
JOIN Estudios e ON p.IDEstudio = e.IDEstudio
JOIN Realizadores r ON p.IDRealizador = r.IDRealizador
JOIN Pessoas pessoa ON r.IDRealizador = pessoa.ID
ORDER BY 2;

/*1, Mostrar o número de sedes de estúdios por país*/

CREATE OR REPLACE VIEW v_numero_de_estudios_por_pais AS
SELECT 
Sede AS País,
count(*) AS "Número de estúdios presentes"
FROM Estudios
GROUP BY Sede
ORDER BY 2 DESC;

/*2, Mostrar a avaliação média dos programas*/

CREATE OR REPLACE VIEW v_avaliacao_media_programas AS
SELECT
p.Nome,
ifnull(ROUND(AVG(Avaliacao),1), "Sem avalição") AS "Avaliação Média"
FROM Avaliacoes a RIGHT JOIN Programas p ON a.IDPrograma = p.IDPrograma
GROUP BY p.Nome
ORDER BY 2 DESC;

/*3, Mostrar apenas os realizadores que tem algum programa associado e o número de filmes, séries e documentários associados*/

CREATE OR REPLACE VIEW v_num_programas_por_realizador AS
SELECT
pessoa.Nome AS Realizador,
count(p.Nome) AS Programa
FROM Realizadores r 
JOIN Pessoas pessoa ON pessoa.ID  = r.IDRealizador
JOIN Programas p ON p.IDRealizador = r.IDRealizador
GROUP BY pessoa.Nome
ORDER BY 2;

/* Sub-consultas- 1, Mostrar as avaliações de um programa*/

CREATE OR REPLACE VIEW v_visualizar_avaliacoes_do_programa AS
SELECT
pessoa.Nome AS Utilizador,
p.Nome AS Programa,
concat(a.Avaliacao, " Estrelas ") AS Avaliacao,
ifnull(a.Comentario, "  (Vazio)  ") AS Comentario
FROM Avaliacoes a
JOIN Pessoas pessoa ON pessoa.ID = a.IDUtilizador
JOIN Programas p ON p.IDPrograma = a.IDPrograma
WHERE a.IDPrograma IN (SELECT IDPrograma FROM Programas WHERE Nome = "The Sunderring");

/*2, Mostrar todas as avaliações de um utilizador*/

CREATE OR REPLACE VIEW v_visualizar_todas_avaliacoes_do_utilizador AS
SELECT
pessoa.Nome AS Utilizador,
p.Nome AS Programa,
concat(a.Avaliacao, " Estrelas ") AS Avaliacao,
ifnull(a.Comentario, "  (Vazio)  ") AS Comentario
FROM Avaliacoes a
JOIN Pessoas pessoa ON pessoa.ID = a.IDUtilizador
JOIN Programas p ON p.IDPrograma = a.IDPrograma
INNER JOIN Utilizadores u ON u.IDUtilizador = a.IDUtilizador
WHERE u.IDUtilizador IN (SELECT ID FROM Pessoas WHERE Nome = "Fathima Larsen");
/*JOIN + WHERE + ORDER BY + Formatar por exemplo: CONCAT, ROUND, IF, CASE,por aí adiante))*/

/*3, Mostrar todos os realizadores que ja faleceram*/

CREATE OR REPLACE VIEW v_realizadores_falecidos AS
SELECT
pessoa.Nome AS Realizador,
date_format(pessoa.DtaNasc, "%d/%m/%Y") AS "Data de Nascimento",
ifnull(date_format(r.DtaMorte, "%d/%m/%Y"), "Atualmente vivo") AS "Data de Falecimento",
concat(timestampdiff(YEAR, pessoa.DtaNasc, r.DtaMorte), " Idade quando faleceu ") AS Idade
FROM Realizadores r 
JOIN Pessoas pessoa ON pessoa.ID = r.IDRealizador
WHERE r.DtaMorte IS NOT NULL
ORDER BY 2;

/*4, Mostrar todos os atores que ja faleceram*/

CREATE OR REPLACE VIEW v_atores_falecidos AS
SELECT
pessoa.Nome AS Ator,
date_format(pessoa.DtaNasc, "%d/%m/%Y") AS "Data de Nascimento",
ifnull(date_format(a.DtaMorte, "%d/%m/%Y"), "Atualmente vivo") AS "Data de Falecimento",
concat(timestampdiff(YEAR, pessoa.DtaNasc, a.DtaMorte), " Idade quando faleceu ") AS Idade
FROM Atores a 
JOIN Pessoas pessoa ON pessoa.ID = a.IDAtor
WHERE a.DtaMorte IS NOT NULL
ORDER BY 2;

/*4, Mostrar todos os utilizadores com idade superior a 55 anos de idade*/

CREATE OR REPLACE VIEW v_visualizar_utilizadores_com_mais_55 AS
SELECT
pessoa.Nome AS Nome,
u.NIF AS "Número de Identificação Fiscal",
date_format(pessoa.DtaNasc, "%d/%m/%Y") AS "Data de Nascimento",
CONCAT(TIMESTAMPDIFF(YEAR, pessoa.DtaNasc, CURDATE()), " Anos de vida ") AS Idade
FROM Utilizadores u 
JOIN Pessoas pessoa ON pessoa.ID = u.IDUtilizador
WHERE TIMESTAMPDIFF(YEAR, pessoa.DtaNasc, CURDATE()) > 55
ORDER BY 1;

/*5, Mostrar todos os programas estreados depois de 2010*/

CREATE OR REPLACE VIEW v_programas_estreados_depois_2010 AS
SELECT
concat("O programa, ", p.Nome, " do estúdio ", e.Nome, " realizado por ", pessoa.Nome, " estreou em ", p.AnoEstreia) AS "Programas estreados depois de 2010"
FROM Programas p
JOIN Estudios e ON p.IDEstudio = e.IDEstudio
JOIN Realizadores r ON p.IDRealizador = r.IDRealizador
JOIN Pessoas pessoa on r.IDRealizador = pessoa.ID
WHERE p.AnoEstreia > 2010
ORDER BY p.AnoEstreia DESC;

/*6, Mostrar a dispobilidade dos programas num serviço escolhido ao acaso*/

CREATE OR REPLACE VIEW v_visualizar_todos_servicos AS
SELECT
concat("Disponibilidade de programas ", s.Nome ,":  ", p.Nome) AS "Serviços",
ps.Link AS "Hyperlink"
FROM Programas_Servicos ps JOIN Programas p ON ps.IDPrograma = p.IDPrograma
JOIN Servicos s on ps.IDServico = s.IDServico
WHERE s.Nome = "MegaFlixTuga"
ORDER BY 2;

/*6, Selecionar os programas disponiveis com o ator selecionado e um  servico escolhido também*/

CREATE OR REPLACE VIEW v_selecionar_todos_programas_com_Ator_no_servico AS
SELECT
pessoa.Nome AS "Ator",
p.Nome AS Nome,
concat(s.Nome," Hyperlink: ",ps.Link) AS "Nome do Serviço"
FROM Programas_Servicos ps JOIN Programas p ON ps.IDPrograma = p.IDPrograma
JOIN Servicos s on ps.IDServico = s.IDServico
INNER JOIN Atores ator JOIN Pessoas pessoa on ator.IDAtor = pessoa.ID
WHERE s.Nome = "BBC" AND pessoa.Nome = "Adriana Foreman"
ORDER BY 1;

/*7, Mostrar o número de programas por genero*/

CREATE OR REPLACE VIEW v_numero_de_programas_por_genero AS
SELECT
g.Nome AS Genero,
count(pg.IDPrograma) AS Programa
FROM Generos g 
JOIN Programas_Generos pg ON g.IDGenero = pg.IDGenero
GROUP BY g.Nome
ORDER BY 1;

/* DISCLAIMER ,All of the previous code provided was made by Leandro Martins, GitHub: github.com/GoldenLeoPT */