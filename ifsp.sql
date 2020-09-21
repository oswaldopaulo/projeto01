-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Tempo de geração: 21/09/2020 às 19:23
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
(15, 'Boné Aba Curva Nike Featherlight Run - Strapback - Adulto', 29.9, 'asdadas', 'S'),
(16, 'Boné Aba Curva Nike Aerobill Legacy91 - Snapback - Adulto', 49.99, 'Boné Aba Curva Nike Aerobill Legacy91 - Snapback - Adulto', 'S');

-- --------------------------------------------------------

--
-- Estrutura para tabela `transacoes`
--

CREATE TABLE `transacoes` (
  `id_trans` int(11) NOT NULL,
  `finger_print` varchar(100) NOT NULL,
  `type_contact` varchar(2) NOT NULL,
  `number_contact` varchar(100) NOT NULL,
  `type_address` varchar(1) NOT NULL,
  `postal_code` varchar(20) NOT NULL,
  `street` varchar(50) NOT NULL,
  `number` varchar(8) NOT NULL,
  `neighborhood` varchar(40) NOT NULL,
  `city` varchar(40) NOT NULL,
  `state` varchar(2) NOT NULL,
  `id_contact` int(11) DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `cpf` varchar(15) NOT NULL,
  `email` varchar(255) NOT NULL,
  `formpgto` varchar(1) NOT NULL,
  `payment_id` varchar(100) DEFAULT NULL,
  `paypal_toke` varchar(50) DEFAULT NULL,
  `paypal_payerid` varchar(50) DEFAULT NULL,
  `total` decimal(10,2) DEFAULT NULL,
  `status` varchar(1) DEFAULT NULL,
  `data_trans` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Despejando dados para a tabela `transacoes`
--

INSERT INTO `transacoes` (`id_trans`, `finger_print`, `type_contact`, `number_contact`, `type_address`, `postal_code`, `street`, `number`, `neighborhood`, `city`, `state`, `id_contact`, `name`, `cpf`, `email`, `formpgto`, `payment_id`, `paypal_toke`, `paypal_payerid`, `total`, `status`, `data_trans`) VALUES
(1, '0b606de74bc5baa9e1a599422ff1fb0b0310839a', 'M', '15997188222', 'B', '18209245', 'Av Flavio Soares Hungria', '3485', 'VILA REIS', 'Itapetininga', 'SP', 1, 'Oswaldo Paulo', '29632664809', 'oswaldopaulo@ebras.com.br', '2', NULL, NULL, NULL, '100.27', NULL, '2020-06-29 14:37:21'),
(2, '0b606de74bc5baa9e1a599422ff1fb0b0310839a', 'M', '15997188222', 'B', '18209245', 'Av Flavio Soares Hungria', '3485', 'VILA REIS', 'Itapetininga', 'SP', 1, 'Oswaldo Paulo', '29632664809', 'oswaldopaulo@ebras.com.br', '2', 'PAYID-L35B54I34X65740NM158034R', 'EC-3V180596HY488384D', '3LQU2LYS7USW8', '100.27', 'P', '2020-06-29 17:03:43'),
(3, '376ff8176d95da7ee0c6f1748ce67403f181cb3b', 'M', '15997188222', 'B', '18209245', 'Av Flavio Soares Hungria', '3485', 'VILA REIS', 'Itapetininga', 'SP', 1, 'Oswaldo Paulo', '26918238817', 'oswaldopaulo@ebras.com.br', '2', 'PAYID-L36NSLY44J49061FS878580G', NULL, NULL, '10.37', NULL, '2020-07-01 18:42:53'),
(4, '682e74c8eb4ee14914008b2e73cb1f1950fd226e', 'M', '15997188222', 'B', '18209245', 'Av Flavio Soares Hungria', '3485', 'VILA REIS', 'Itapetininga', 'SP', 1, 'Oswaldo Paulo', '26918238817', 'oswaldopaulo@ebras.com.br', '2', 'PAYID-L4ILXDY1XN9245896665081N', NULL, NULL, '10.37', NULL, '2020-07-16 20:41:49');

-- --------------------------------------------------------

--
-- Estrutura para tabela `transacoes_itens`
--

CREATE TABLE `transacoes_itens` (
  `id` int(11) NOT NULL,
  `id_trans` int(11) NOT NULL,
  `id_produto` int(11) DEFAULT NULL,
  `description` varchar(100) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price_unit` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Despejando dados para a tabela `transacoes_itens`
--

INSERT INTO `transacoes_itens` (`id`, `id_trans`, `id_produto`, `description`, `quantity`, `price_unit`) VALUES
(1, 1, 3, 'Ori and the Blind Forest', 1, '89.90'),
(2, 1, 2, 'Resident Evil 3 Remaster', 1, '10.37'),
(3, 2, 2, 'Resident Evil 3 Remaster', 1, '10.37'),
(4, 2, 3, 'Ori and the Blind Forest', 1, '89.90'),
(5, 3, 2, 'Resident Evil 3 Remaster', 1, '10.37'),
(6, 4, 2, 'Resident Evil 3 Remaster', 1, '10.37');

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
  `admin` varchar(1) COLLATE utf8_unicode_ci DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Despejando dados para a tabela `users`
--

INSERT INTO `users` (`id`, `name`, `username`, `email`, `password`, `remember_token`, `admin`, `created_at`, `updated_at`) VALUES
(1, 'Oswaldo Paulo', 'oswaldopaulo', 'oswaldopaulo@ebras.com.br', 'e10adc3949ba59abbe56e057f20f883e', 'PJ42kBMmf5Uy1Z8mC81SIJNv2dX1tPr4VPf1H5NBHzcMZ6GBnouOgwHHvYIe', '1', '2017-06-21 00:20:06', '2017-06-21 00:20:06'),
(15, 'OSWALDO P SILVA', NULL, 'oswaldo.paulo@gmail.com', '81b073de9370ea873f548e31b8adc081', NULL, '0', NULL, NULL);

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
-- Índices de tabela `transacoes`
--
ALTER TABLE `transacoes`
  ADD PRIMARY KEY (`id_trans`);

--
-- Índices de tabela `transacoes_itens`
--
ALTER TABLE `transacoes_itens`
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de tabela `transacoes`
--
ALTER TABLE `transacoes`
  MODIFY `id_trans` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `transacoes_itens`
--
ALTER TABLE `transacoes_itens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
