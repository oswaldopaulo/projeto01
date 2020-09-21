-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Tempo de geração: 20/09/2020 às 23:12
-- Versão do servidor: 10.3.23-MariaDB-0+deb10u1
-- Versão do PHP: 7.3.19-1~deb10u1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `ifsp`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `clientes`
--

CREATE TABLE `clientes` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) DEFAULT NULL,
  `sobrenome` varchar(100) DEFAULT NULL,
  `endereco` varchar(100) DEFAULT NULL,
  `telefone` varchar(100) DEFAULT NULL,
  `cep` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Despejando dados para a tabela `clientes`
--

INSERT INTO `clientes` (`id`, `nome`, `sobrenome`, `endereco`, `telefone`, `cep`) VALUES
(1, 'teste', '2teste', 'este', 'teste', 'teste'),
(2, 'trtrtrtrt', 'trtrtrt', 'rtrtrtrt', 'rtrtrtrt', 'SADFAFDAS');

-- --------------------------------------------------------

--
-- Estrutura para tabela `produtos`
--

CREATE TABLE `produtos` (
  `id` int(11) NOT NULL,
  `descricao` varchar(100) NOT NULL,
  `preco` double NOT NULL,
  `ficha` longtext NOT NULL,
  `ativo` varchar(1) NOT NULL DEFAULT 'S'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Despejando dados para a tabela `produtos`
--

INSERT INTO `produtos` (`id`, `descricao`, `preco`, `ficha`, `ativo`) VALUES
(10, 'teste5', 1, 'asdadas', 'S'),
(11, 'teste6', 2, 'asdasdas', 'S'),
(12, 'teste9', 3, 'asdfadfasfas', 'S'),
(13, 'asdada', 1, 'sdfsdfsfdsd', 'S'),
(14, 'asdad', 1, 'adfasfdafddas', 'S');

-- --------------------------------------------------------

--
-- Estrutura para tabela `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `username` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Despejando dados para a tabela `users`
--

INSERT INTO `users` (`id`, `name`, `username`, `email`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Oswaldo Paulo', 'oswaldopaulo', 'oswaldopaulo@ebras.com.br', '$2y$10$ic/8njDcxOLekfVup6EcW.r17C.ZHtilHEYbG2HqyK5VOurOOZJl6', 'PJ42kBMmf5Uy1Z8mC81SIJNv2dX1tPr4VPf1H5NBHzcMZ6GBnouOgwHHvYIe', '2017-06-21 00:20:06', '2017-06-21 00:20:06'),
(4, 'Administrador', 'admin', 'oswaldo.paulo@gmail.com', '$2y$10$Q7/5sVn.QuVjs0O5OIb8Yu3s6dAZYMe40AHp3.VAZ1RJJqOMviEcS', 'k13K5JorZRhYaPKZEFQ4iOPHv0TbLr2slI3tg4VlyIBUvUQfQxCXqb0JzYk7', '2019-03-29 02:30:46', '2019-03-29 02:30:46'),
(10, 'Pamela Karole', 'pamela', '1600973@aluno.univesp.br', '$2y$10$NDw.6zoa8KGhuQWO5nwG7.k9EW/AIuRSqLbtQPW4RuxTeTPsspUIy', NULL, '2019-10-28 09:51:55', '2019-10-28 09:51:55'),
(11, 'Cléris Maria', 'cleris', '1601123@aluno.univesp.br', '$2y$10$SdA5sQYIvjekZgTT.63.Tu14V/EmJLg8FuPhecX7B.4GrRiTelDm2', NULL, '2019-10-28 09:52:50', '2019-10-28 09:52:50'),
(12, 'Juliana Aparecida', 'juliana', '1600949@aluno.univesp.br', '$2y$10$aNc.7NfHB/rMEu2ucjfRVOYgA6Ia0IsiIpO05ttFImBD25Vx76LEC', NULL, '2019-10-28 09:53:41', '2019-10-28 09:53:41'),
(13, 'Tiago Paques', 'tiago', '1600961@aluno.univesp.br', '$2y$10$xF5hwqEO12c8fXaUBFr9Kutsvq/Lm0zz6LalAqfLvA74ifCzzjrUG', NULL, '2019-10-28 09:54:37', '2019-10-28 09:54:37'),
(14, 'Matheus', 'matheus', '1600912@aluno.univesp.br', '$2y$10$7cr6ddrV1Kj6sldK7ihpg.2i7RfTmc0f7d.f5bH0TDwakl2n5/one', NULL, '2019-10-28 09:56:27', '2019-10-28 09:56:27');

--
-- Índices de tabelas apagadas
--

--
-- Índices de tabela `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `produtos`
--
ALTER TABLE `produtos`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT de tabelas apagadas
--

--
-- AUTO_INCREMENT de tabela `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `produtos`
--
ALTER TABLE `produtos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
