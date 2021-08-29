USE Encyclopedia;
SET FOREIGN_KEY_CHECKS=0;
/* Criação dos registos */

INSERT INTO Pessoas
(ID, Nome, DtaNasc, Idade)
VALUES
(1, "Keenan Barnett", "1971/11/02", 50),	-- realizador
(2, "Ahyan Cantu", "1972/10/03", 49),		-- realizador
(3, "Karl Ashley", "1973/09/04", 48),		-- realizador
(4, "Fathima Larsen", "1964/08/05", 57),	-- utilizador
(5, "Jesse Sanderson", "1965/07/06", 56),	-- ator
(6, "Clement Bernard", "1966/06/07", 55),	-- ator
(7, "Adriana Foreman", "1967/05/08", 54),	-- ator
(8, "Jean Manuel", "1971/01/02", 50),		-- utilizador
(9, "George Biden", "2000/07/20", 21);		-- utilizador

INSERT INTO Realizadores
(IDRealizador, foto, dtaMorte)
VALUES
(1, null, "2020/05/08"),
(2, null, "2019/02/02"),
(3, null, null);

INSERT INTO Atores
(IDAtor, foto, dtaMorte)
VALUES
(5, null, "2020/05/05"),
(6, null, null),
(7, null, null);

INSERT INTO Utilizadores
(IDUtilizador, NIF, Telefone, Morada)
VALUES
(4, 123456789, 927654321, "Av. Da Nossa Senhora"),
(6, 987654321, 927361311, null),
(7, 123789456, 93128800, "Av. Hugo Macau"),
(8, 456789123, 911654321, "Rua de Taiwan");

INSERT INTO Estudios
(IDEstudio, Nome, Sede)
VALUES
(1, "Thunder Filmworks", "EUA"),
(2, "Chronowood Cinema", "Inglaterra"),
(3, "Bad Lantern Studios", "Estónia"),
(4, "Morício Filmes", "Portugal"),
(5, "BadClock Interactive", "EUA"),
(6, "Cinema Lights", "EUA"),
(7, "Kamelor Studios", "Estónia"),
(8, "Clockline Film Company", "Suécia"),
(9, "British Broadcasting Corporation", "Inglaterra");

INSERT INTO Programas
(IDPrograma, Nome, AnoEstreia, AvaliacaoMedia, IDEstudio, IDRealizador)
VALUES
(1, "Prince of the Seas", 2007, 2, 1, 1),
(2, "Ruler of the Old Kingdom", 2011, 8, 2, 2),
(3, "The Sundering", 2012, 1, 3, 3),
(4, "Nature's Vengeance", 2013, 9, 4, 1),
(5, "Statue of Everywhere", 2019, 3, 1, 2),
(6, "With Wings", 2009, 4, 2, 1),
(7, "Shield's Aligned", 2011, 5, 3, 1),
(8, "BxMxC", 2010, 10, 6, 1),
(9, "Maria e os rapazes", 1974, 3, 4, 1),
(10, "A vida na Madeira", 1998, 5, 4, 3);

INSERT INTO Filmes
(IDFilme, Country_birth, Descri_g, Descri)
Values
(1,"EUA","Animação","Um pirata com muitos amigos numa grande aventura nos oceanos"),
(2,"Suécia","Ação", null),
(3,"Estónia","Drama","Um sucessor de um rei de cor negra gera controversia"),
(4,"Inglaterra","Ação",null),
(5,"EUA","History",null),
(6,"Inglaterra","Syfy","No ano 2066 um homem descrobre uma maneira interessante do homem voar"),
(7,"Estónia","Syfy",null),
(8,"EUA","Comedy","Uma esquadra militar cheio de piada");

INSERT INTO Series
(IDSerie, Country_birth, Descri_g, Descri)
Values
(9,"Portugal","Drama","Novela de uma menina que gosta de brincar");

INSERT INTO Documentarios
(IDDocumentario, Country_birth, Descri_g, Descri)
Values
(10,"Inglaterra","Vida Selvagem","A Madeira uma ilha no Oceano Atlântico");

INSERT INTO Servicos
(IDServico, Nome, Link)
VALUES
(1, "MegaFlixTuga", "www.megaflix.com"),
(2, "Dellari Movies", "www.dellarimovies.com"),
(3, "MilkyWay", "www.milkymovies.es"),
(4, "Crony, Movies and Series", "www.crony.com/movies"),
(5, "GodzillaMovies", "www.godzillamv.uk"),
(6, "Series and Movies Planet", "www.SMPlanet.com/Series"),
(7, "MegaPlanet", "www.megaplanet.com/documentarios"),
(8, "BBC", "BBC.com");

INSERT INTO Avaliacoes
(IDAvaliacao, Avaliacao, Comentario, IDUtilizador, IDPrograma)
VALUES
(1, 2, "To much boring", 9, 1),
(2, 7, "Cool music, otherwise pretty average and non-sense", 4, 2),
(3, 10, "Pretty good, solid story and true romance", 9, 5),
(4, 8, "Beautiful songs" , 8, 4),
(5, 1, "Masterpiece of an awful movie, don't watch it's a waste of money and time", 8, 5),
(6, 9, null, 4, 4),
(7, 2, "The Sundering more like The Sundying...", 4, 7),
(8, 3, null, 8, 6),
(9, 1, "TO much borrying almost felt asleep", 4, 3),
(10, 10,null, 9, 9);

INSERT INTO Generos
(IDGenero, Nome, Descricao)
VALUES
(1, "Comédia", "Fazer rir o ser humano é um dos objetivos deste genero..."),
(2, "Ação", null),
(3, "Hístoria", "Filmes com extrema importância na história e nos detalhes de séculos ou anos atrás"),
(4, "Romântico", "Uma boa história normalmente com  um final feliz"),
(5, "Sci-Fi", null),
(6, "Drama", null),
(7, "Fantasia", null),
(8, "Terror", "Nós não recomendamos á assitir este filme a noite");

INSERT INTO Programas_Servicos
(IDPrograma, IDServico, Link)
VALUES
(1, 4, "www.crony.com/movies/PrinceoftheSeas"),
(2, 3, "www.milkymovies.es/ruleroftheoldkingdom"),
(3, 2, "www.dellarimovies.com/sundering"),
(4, 1, "www.megaflixtuga.com/movies/Naturesvengance"),
(8, 4, "www.crony.com/movies/BxMxC"),
(7, 3, "www.milkymovies.es/shieldsaligned"),
(6, 2, "www.dellarimovies.com/WithWings"),
(9, 1, "www.megaflixtuga.com/series/AMaria&Rapazes"),
(5, 1, "www.megaflixtuga.com/movies/Statueofeverywhere"),
(10, 8,"BBC.uk/show/documentaries");

INSERT INTO Programas_Generos
(IDPrograma, IDGenero)
VALUES
(1, 4),
(2, 3),
(3, 2),
(4, 1),
(5, 5),
(6, 7),
(7, 2),
(8, 5),
(9, 6),
(10, 3);

INSERT INTO  Programas_Atores
(IDPrograma, IDAtor)
VALUES
(1, 6),
(2, 6),
(3, 5),
(4, 7),
(6, 6),
(8, 7);

INSERT INTO Telefones_Utilizadores
(IDUtilizador, Telefone)
VALUES
(4, 927654321),
(6, 927361311),
(7, 93128800),
(8, 911654321);

/* DISCLAIMER ,All of the previous code provided was made by Leandro Martins, GitHub: github.com/GoldenLeoPT */