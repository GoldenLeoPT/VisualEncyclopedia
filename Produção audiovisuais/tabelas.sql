/* Criação da base de dados e as respetivas tabelas */
DROP DATABASE IF EXISTS Encyclopedia;
CREATE DATABASE Encyclopedia;
USE Encyclopedia;

/* CRIAR TABELAS */
CREATE TABLE Pessoas (
	ID INT UNSIGNED NOT NULL AUTO_INCREMENT,
	Nome varchar(100) NOT NULL,
	DtaNasc DATE NOT NULL,
    Idade INT UNSIGNED NOT NULL,
	PRIMARY KEY (ID)
) ENGINE=InnoDB;

CREATE TABLE Utilizadores (
	IDUtilizador INT UNSIGNED NOT NULL AUTO_INCREMENT,
    NIF INT(9) UNSIGNED NOT NULL,
    Telefone INT(9) UNSIGNED NOT NULL,
	Morada varchar(100),
    PRIMARY KEY (IDUtilizador),
    FOREIGN KEY (IDUtilizador) REFERENCES Pessoas(ID)
) ENGINE=INNODB;

CREATE TABLE Realizadores (
	IDRealizador INT UNSIGNED NOT NULL AUTO_INCREMENT,
    DtaMorte DATE,
    Foto BLOB,
    NumFilmesRealizados INT UNSIGNED,
    PRIMARY KEY (IDRealizador),
    FOREIGN KEY (IDRealizador) REFERENCES Pessoas(ID)
) ENGINE=InnoDB;

CREATE TABLE Atores (
	IDAtor INT UNSIGNED NOT NULL AUTO_INCREMENT,
    DtaMorte DATE,
    Foto BLOB,
    PRIMARY KEY (IDAtor),
    FOREIGN KEY (IDAtor) REFERENCES Pessoas(ID)
) ENGINE=InnoDB;

CREATE TABLE Generos (
	IDGenero INT UNSIGNED NOT NULL AUTO_INCREMENT,
    Nome VARCHAR(18) NOT NULL,
    Descricao VARCHAR(240),
	PRIMARY KEY (IDGenero)
) ENGINE=InnoDB;

CREATE TABLE Estudios (
	IDEstudio INT UNSIGNED NOT NULL AUTO_INCREMENT,
    Nome VARCHAR(150) NOT NULL,
    Sede VARCHAR(60) NOT NULL,
    PRIMARY KEY (IDEstudio)
) ENGINE=InnoDB;

CREATE TABLE Programas (
	IDPrograma INT UNSIGNED NOT NULL AUTO_INCREMENT,
    Nome varchar(60) NOT NULL,
    AnoEstreia INT NOT NULL,
    AvaliacaoMedia INT NOT NULL,
    IDEstudio INT UNSIGNED NOT NULL,
    IDRealizador INT UNSIGNED NOT NULL,
    PRIMARY KEY (IDPrograma),
    FOREIGN KEY (IDEstudio) REFERENCES Estudios(IDEstudio),
    FOREIGN KEY (IDRealizador) REFERENCES Realizadores(IDRealizador)
) ENGINE=InnoDB;

CREATE TABLE Filmes (
	IDFilme INT UNSIGNED NOT NULL AUTO_INCREMENT,
    Country_birth varchar(60) NOT NULL,
    Descri_g varchar(60) NOT NULL,
    Descri varchar(240),	
    PRIMARY KEY (IDFilme),
    FOREIGN KEY (IDFilme) REFERENCES Programas(IDPrograma)
) ENGINE=InnoDB;

CREATE TABLE Series (
	IDSerie INT UNSIGNED NOT NULL AUTO_INCREMENT,
    Country_birth varchar(60) NOT NULL,
    Descri_g varchar(60) NOT NULL,
    Descri varchar(240),	
    PRIMARY KEY (IDSerie),
    FOREIGN KEY (IDSerie) REFERENCES Programas(IDPrograma)
) ENGINE=InnoDB;

CREATE TABLE Documentarios (
	IDDocumentario INT UNSIGNED NOT NULL AUTO_INCREMENT,
    Country_birth varchar(60) NOT NULL,
    Descri_g varchar(60) NOT NULL,
    Descri varchar(240),	
    PRIMARY KEY (IDDocumentario),
    FOREIGN KEY (IDDocumentario) REFERENCES Programas(IDPrograma)
) ENGINE=InnoDB;


CREATE TABLE Avaliacoes (
	IDAvaliacao INT UNSIGNED NOT NULL AUTO_INCREMENT,
    Avaliacao INT NOT NULL,
    Comentario VARCHAR(240),
    IDUtilizador INT UNSIGNED NOT NULL,
    IDPrograma INT UNSIGNED NOT NULL,
    PRIMARY KEY (IDAvaliacao),
    FOREIGN KEY (IDUtilizador) REFERENCES Utilizadores(IDUtilizador),
    FOREIGN KEY (IDPrograma) REFERENCES Programas(IDPrograma)
) ENGINE=InnoDB;

CREATE TABLE Servicos (
	IDServico INT UNSIGNED NOT NULL AUTO_INCREMENT,
    Nome VARCHAR(75) NOT NULL,
    Link VARCHAR(500) NOT NULL,
	PRIMARY KEY (IDServico)
) ENGINE=InnoDB;

CREATE TABLE Programas_Servicos (
	IDPrograma INT UNSIGNED NOT NUll,
    IDServico INT UNSIGNED NOT NULL,
    Link VARCHAR(500) NOT NULL,
	PRIMARY KEY (IDPrograma, IDServico),
    FOREIGN KEY (IDPrograma) REFERENCES Programas(IDPrograma),
    FOREIGN KEY (IDServico) REFERENCES Servicos(IDServico)
) ENGINE=InnoDB;

CREATE TABLE Programas_Generos (
	IDPrograma INT UNSIGNED NOT NULL,
    IDGenero INT UNSIGNED NOT NULL,
    PRIMARY KEY (IDPrograma, IDGenero),
    FOREIGN KEY (IDPrograma) REFERENCES Programas(IDPrograma),
    FOREIGN KEY (IDGenero) REFERENCES Generos(IDGenero)
) ENGINE=InnoDB;

CREATE TABLE Programas_Atores (
	IDPrograma INT UNSIGNED NOT NULL,
    IDAtor INT UNSIGNED NOT NULL,
    PRIMARY KEY (IDPrograma, IDAtor),
    FOREIGN KEY (IDPrograma) REFERENCES Programas(IDPrograma),
    FOREIGN KEY (IDAtor) REFERENCES Atores(IDAtor)
) ENGINE=InnoDB;

CREATE TABLE Telefones_Utilizadores (
	IDUtilizador INT UNSIGNED NOT NULL,
    Telefone INT(9) UNSIGNED NOT NULL,
    PRIMARY KEY (IDUtilizador, Telefone),
    FOREIGN KEY (IDUtilizador) REFERENCES Utilizadores(IDUtilizador)
) ENGINE=InnoDB;

/* DISCLAIMER ,All of the previous code provided was made by Leandro Martins, GitHub: github.com/GoldenLeoPT */