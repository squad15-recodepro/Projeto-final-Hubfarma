CREATE DATABASE hubfarma;

use hubfarma;

CREATE TABLE `alunos` (
  `cpf_alun` varchar(11) NOT NULL,
  `nome_alun` varchar(50) DEFAULT NULL,
  `data_nasc_alun` date DEFAULT NULL,
  `cnpj_sind_fk` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`cpf_alun`),
  KEY `cnpj_sind_fk` (`cnpj_sind_fk`),
  CONSTRAINT `alunos_ibfk_1` FOREIGN KEY (`cnpj_sind_fk`) REFERENCES `sindicatos` (`cnpj_sind`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `sindicatos` (
  `cnpj_sind` varchar(14) NOT NULL,
  `nome_sind` varchar(50) DEFAULT NULL,
  `endereco_sind` varchar(100) DEFAULT NULL,
  `uf_sind` varchar(2) DEFAULT NULL,
  `cidade_sind` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`cnpj_sind`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `usuarios` (
  `cpf_user` varchar(11) NOT NULL,
  `nome_user` varchar(50) DEFAULT NULL,
  `endereco_user` varchar(150) DEFAULT NULL,
  `email_user` varchar(100) DEFAULT NULL,
  `uf_user` varchar(2) DEFAULT NULL,
  `cidade_user` varchar(50) DEFAULT NULL,
  `formacao_user` varchar(50) DEFAULT NULL,
  `data_nasc_user` date DEFAULT NULL,
  PRIMARY KEY (`cpf_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `voluntarios` (
  `id_voluntario` int NOT NULL AUTO_INCREMENT,
  `periodo` varchar(50) DEFAULT NULL,
  `cpf_user_fk` varchar(11) DEFAULT NULL,
  `cnpj_sind_fk` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`id_voluntario`),
  KEY `cpf_user_fk` (`cpf_user_fk`),
  KEY `cnpj_sind_fk` (`cnpj_sind_fk`),
  CONSTRAINT `voluntarios_ibfk_1` FOREIGN KEY (`cpf_user_fk`) REFERENCES `usuarios` (`cpf_user`),
  CONSTRAINT `voluntarios_ibfk_2` FOREIGN KEY (`cnpj_sind_fk`) REFERENCES `sindicatos` (`cnpj_sind`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

