-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: 24-Mar-2020 às 22:16
-- Versão do servidor: 5.7.26
-- versão do PHP: 7.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `blendtour`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `categoria`
--

DROP TABLE IF EXISTS `categoria`;
CREATE TABLE IF NOT EXISTS `categoria` (
  `id_categoria` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `categoria`
--

INSERT INTO `categoria` (`id_categoria`, `nome`) VALUES
(1, 'Aventura'),
(2, 'Cidades'),
(3, 'Gastronomia'),
(4, 'Histórico Cultural'),
(5, 'Natureza'),
(6, 'Vida Noturna');

-- --------------------------------------------------------

--
-- Estrutura da tabela `cupom_descontos`
--

DROP TABLE IF EXISTS `cupom_descontos`;
CREATE TABLE IF NOT EXISTS `cupom_descontos` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `localizador` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `desconto` decimal(6,2) NOT NULL DEFAULT '0.00',
  `modo_desconto` enum('valor','porc') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'porc',
  `limite` decimal(6,2) NOT NULL DEFAULT '0.00',
  `modo_limite` enum('valor','qtd') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'qtd',
  `dthr_validade` datetime NOT NULL,
  `ativo` enum('S','N') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'S',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cupom_descontos_localizador_unique` (`localizador`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `experiencias`
--

DROP TABLE IF EXISTS `experiencias`;
CREATE TABLE IF NOT EXISTS `experiencias` (
  `id_experiencia` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(150) NOT NULL,
  `descricao` varchar(300) DEFAULT NULL,
  `preco` float DEFAULT NULL,
  `local` varchar(300) DEFAULT NULL,
  `imagem` varchar(500) DEFAULT NULL,
  `fk_categoria` int(11) NOT NULL,
  `ativo` enum('S','N') NOT NULL DEFAULT 'S',
  PRIMARY KEY (`id_experiencia`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `experiencias`
--

INSERT INTO `experiencias` (`id_experiencia`, `nome`, `descricao`, `preco`, `local`, `imagem`, `fk_categoria`, `ativo`) VALUES
(1, 'Rafting', 'Corredeiras, alta velocidade, adrenalina e aquele banho te esperam em Brotas-SP. Experimente esse circuito de rafting imperdível', 178, 'Brotas-SP', '/Galeria/imageDB/Aventura/expadv2.png', 1, 'S'),
(2, 'Mountain Bike', 'Curta essa trilha off-road de Mountain Bike pelo Cerrado Brasileiro', 195.5, 'Goiás', '/Galeria/imageDB/Aventura/expadv1.png', 1, 'S'),
(3, 'Paraglider', 'Passeios de paraglider do alto da Pedra Grande, em Atibaia - São Paulo', 250, 'Atibaia - SP', '/Galeria/imageDB/Aventura/expadv3.png', 1, 'S'),
(4, 'Balonismo', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry', 319, 'Boituva-SP', '/Galeria/imageDB/Aventura/expadv3.png', 1, 'S'),
(5, 'Asa Delta', 'Planar entre o céu azul e o mar transparente, faz da paisagem do Rio uma experiência emocionante', 599.99, 'Pedra da Gávea - Rio de Janeiro', '/Galeria/imageDB/Aventura/asadelta.jpg', 1, 'S'),
(6, 'Rio de Janeiro', 'Praias, samba, calor, venha conhecer todos os encantos da cidade maravilhosa e tudo o que ela tem a oferecer', 150, 'Ponto de Enconto:', '/Galeria/imageDB/Cidades/expcid1.png', 2, 'S'),
(7, 'São Paulo', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry', 150, 'Ponto de Enconto:', '/Galeria/imageDB/Cidades/saopaulo.jpg', 2, 'S'),
(8, 'Curitiba', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry', 150, 'Ponto de Enconto:', '/Galeria/imageDB/Cidades/curitiba.jpg', 2, 'S'),
(9, 'Salvador', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry', 150, 'Ponto de Enconto:', '/Galeria/imageDB/Cidades/salvador.png', 2, 'S'),
(10, 'Recife', 'Não perca essa oportunidade de se aventurar pelas praias do Nordeste brasileiro e conhecer a \"Veneza brasileira\"', 150, 'Ponto de Enconto:', '/Galeria/imageDB/Cidades/expcid2.png', 2, 'S'),
(11, 'Florianópolis', 'Um dos destinos de mais alto luxo no Brasil te espera de braços abertos', 150, 'Ponto de Enconto:', '/Galeria/imageDB/Cidades/expcid3.png', 2, 'S'),
(12, 'Natal', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry', 150, 'Ponto de Enconto:', '/Galeria/imageDB/Cidades/expcid3.png', 2, 'S'),
(13, 'Fortaleza', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry', 150, 'Ponto de Enconto:', '/Galeria/imageDB/Cidades/expcid3.png', 2, 'S'),
(14, 'Culinária Típica', 'Que tal experimentar este prato que tem a cara do Brasil e é apreciado por milhões de pessoas no páis inteiro ?', 150, 'Ponto de Enconto:', '/Galeria/imageDB/Gastronomia/feijoada.jpg', 3, 'S'),
(15, 'Doces Típicos', 'Para aqueles loucos por doces, que tal experimentar a sobremesa preferida dos brasileiros, o brigadeiro!', 150, 'Ponto de Enconto:', '/Galeria/imageDB/Gastronomia/expgast2.png', 3, 'S'),
(16, 'Mercado Municipal São Paulo', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry', 150, 'Ponto de Enconto:', '/Galeria/imageDB/Gastronomia/expgast2.png', 3, 'S'),
(17, 'Mercado Ver o Peso - Belém', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry', 150, 'Ponto de Enconto:', '/Galeria/imageDB/Gastronomia/expgast1.png', 3, 'S'),
(18, 'Salgados', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry', 150, 'Ponto de Enconto:', '/Galeria/imageDB/Gastronomia/expgast3.png', 3, 'S'),
(19, 'Bebidas', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry', 150, 'Ponto de Enconto:', '/Galeria/imageDB/Vida Noturna/expnot1.png', 3, 'S'),
(20, 'Carnaval de Rua São Paulo', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry', 80, 'Bairro da Vila Madelena - São Paulo', '/Galeria/imageDB/Vida Noturna/expnot1.png', 4, 'S'),
(21, 'Carnaval Rio de Janeiro', 'Caia no samba na Marquês de Sapucaí e viva esta festa de perto, aproveitando cada momento com toda alegria e descontração que esse evento pode oferecer', 800, 'Marquês de Sapucaí - Rio de Janeiro', '/Galeria/imageDB/Historico Cultural/expcult1.png', 4, 'S'),
(22, 'Festa Junina Nordeste', 'Se divirta com brincadeiras, música típicas e muita comida boa, nessa que é uma das festas mais populares do Brasil', 400, 'Campina Grande - PB', '/Galeria/imageDB/Historico Cultural/expcult2.png', 4, 'S'),
(23, 'Museus São Paulo', 'Conheça um pouco da história e cultura da maior metrópole da América Latina', 250, 'Ponto de Enconto: Av. Paulista, 1578 - Vão Livre', '/Galeria/imageDB/Historico Cultural/teatro_municipal_SP_interno.jpg', 4, 'S'),
(24, 'Museus Rio de Janeiro', 'Moderníssimo museu inaugurado para os Jogos Olímpicos do Rio de Janeiro, trazendo uma experiência sensorial, a começar pelo seu belíssimo design', 250, 'Ponto de Enconto:', '/Galeria/imageDB/Historico Cultural/relacionadosprod.png', 4, 'S'),
(25, 'Museu Inhotim - Belo Horizonte', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry', 250, 'Ponto de Enconto: Rua B, 20 Fazenda Inhotim, Brumadinho', '/Galeria/imageDB/Historico Cultural/expcult3.png', 4, 'S'),
(26, 'Foz do Iguaçú', 'Conheça as famosas Cataratas do Iguaçú, na tríplice fronteira entre Brasil, Argentina e Paraguai.', 350, 'Ponto de Enconto: BR 469, KM 18 - Em frente ao Parque das Cataratas', '/Galeria/imageDB/Natureza/expnat1.png', 5, 'S'),
(27, 'Floresta Amazônica', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry', 950, 'Ponto de Enconto:', '/Galeria/imageDB/Natureza/expnat2.png', 5, 'S'),
(28, 'Cachoeiras', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry', 650, 'Ponto de Enconto:', '/Galeria/imageDB/Natureza/expnat3.png', 5, 'S'),
(29, 'Trilhas', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry', 200, 'Ponto de Enconto:', '/Galeria/imageDB/Natureza/expnat3.png', 5, 'S'),
(30, 'Bares e Casas Noturnas', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry', 300, 'Ponto de Enconto:', '/Galeria/imageDB/Vida Noturna/expnot1.png', 6, 'S'),
(31, 'Vida Noturna São Paulo', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry', 300, 'Ponto de Enconto: Rua Augusta x Avenida Paulista', '/Galeria/imageDB/Vida Noturna/expnot3.png', 6, 'S'),
(32, 'Vida Noturna Rio de Janeiro', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry', 300, 'Ponto de Enconto:', '/Galeria/imageDB/Vida Noturna/expnot2.png', 6, 'S');

-- --------------------------------------------------------

--
-- Estrutura da tabela `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2017_01_29_210306_create_cupom_descontos_table', 1),
(4, '2017_01_30_234710_create_pedidos_table', 1),
(5, '2017_01_30_235200_create_pedido_produtos_table', 1),
(6, '2020_03_24_190742_create_experiencias_table', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`),
  KEY `password_resets_token_index` (`token`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pedidos`
--

DROP TABLE IF EXISTS `pedidos`;
CREATE TABLE IF NOT EXISTS `pedidos` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(10) UNSIGNED NOT NULL,
  `status` enum('RE','PA','CA') COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pedidos_user_id_foreign` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pedido_produtos`
--

DROP TABLE IF EXISTS `pedido_produtos`;
CREATE TABLE IF NOT EXISTS `pedido_produtos` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `pedido_id` int(10) UNSIGNED NOT NULL,
  `produto_id` int(10) UNSIGNED NOT NULL,
  `status` enum('RE','PA','CA') COLLATE utf8_unicode_ci NOT NULL,
  `valor` decimal(6,2) NOT NULL DEFAULT '0.00',
  `desconto` decimal(6,2) NOT NULL DEFAULT '0.00',
  `cupom_desconto_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pedido_produtos_pedido_id_foreign` (`pedido_id`),
  KEY `pedido_produtos_produto_id_foreign` (`produto_id`),
  KEY `pedido_produtos_cupom_desconto_id_foreign` (`cupom_desconto_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Wagner', 'wagner@gmail.com', '$2y$10$WQYy/eiq0pEtngSv4F1egOCQKXIoimUX9A8SiEMS9TF04WDbLLaWS', NULL, '2020-03-24 22:23:39', '2020-03-24 22:23:39');

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario`
--

DROP TABLE IF EXISTS `usuario`;
CREATE TABLE IF NOT EXISTS `usuario` (
  `id_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(145) DEFAULT NULL,
  `email` varchar(145) DEFAULT NULL,
  `senha` varchar(200) DEFAULT NULL,
  `cpf` varchar(11) DEFAULT NULL,
  `dtnasc` date DEFAULT NULL,
  `sexo` varchar(10) DEFAULT NULL,
  `telefoneUm` varchar(11) DEFAULT NULL,
  `telefoneDois` varchar(11) DEFAULT NULL,
  `aventura` tinyint(1) DEFAULT NULL,
  `cidades` tinyint(1) DEFAULT NULL,
  `gastronomia` tinyint(1) DEFAULT NULL,
  `historico` tinyint(1) DEFAULT NULL,
  `natureza` tinyint(1) DEFAULT NULL,
  `noturna` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id_usuario`),
  UNIQUE KEY `email` (`email`,`cpf`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `usuario`
--

INSERT INTO `usuario` (`id_usuario`, `nome`, `email`, `senha`, `cpf`, `dtnasc`, `sexo`, `telefoneUm`, `telefoneDois`, `aventura`, `cidades`, `gastronomia`, `historico`, `natureza`, `noturna`) VALUES
(1, 'douglas', 'douglas@mail.com', '123123', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, 'diego', 'diego@mail.com', '123123', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3, 'dirceu', 'dirceu@mail.com', '123123', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4, 'mario', 'mario@mail.com', '123123', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(5, 'carina', 'carina@mail.com', '123123', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(6, 'wagner', 'wagner@mail.com', '123123', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
