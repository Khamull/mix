-- phpMyAdmin SQL Dump
-- version 3.3.3
-- http://www.phpmyadmin.net
--
-- Servidor: mysql14.uni5.net
-- Tempo de Geração: Nov 25, 2014 as 08:30 PM
-- Versão do Servidor: 5.5.39
-- Versão do PHP: 5.2.17

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Banco de Dados: `fortesystem16`
--
CREATE DATABASE `fortesystem16` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `fortesystem16`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `acesso`
--

CREATE TABLE IF NOT EXISTS `acesso` (
  `acessoID` int(11) NOT NULL AUTO_INCREMENT,
  `acessoUsuario` varchar(50) NOT NULL,
  `acessoIP` varchar(15) NOT NULL,
  `acessoData` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`acessoID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Extraindo dados da tabela `acesso`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `caixa`
--

CREATE TABLE IF NOT EXISTS `caixa` (
  `caixaID` int(11) NOT NULL AUTO_INCREMENT,
  `usuario` varchar(50) NOT NULL,
  `funcionario` varchar(100) NOT NULL,
  `valorInicial` float(10,2) NOT NULL,
  `valorFinal` float(10,2) NOT NULL,
  `vendaInicial` int(11) NOT NULL,
  `vendaFinal` int(11) NOT NULL,
  `servicoInicial` int(11) NOT NULL,
  `servicoFinal` int(11) NOT NULL,
  `lancamentoInicial` int(11) NOT NULL,
  `lancamentoFinal` int(11) NOT NULL,
  `retiradaInicial` int(11) NOT NULL,
  `retiradaFinal` int(11) NOT NULL,
  `data` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `dataInicio` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `status` varchar(1) NOT NULL DEFAULT 'A',
  PRIMARY KEY (`caixaID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=79 ;

--
-- Extraindo dados da tabela `caixa`
--

INSERT INTO `caixa` (`caixaID`, `usuario`, `funcionario`, `valorInicial`, `valorFinal`, `vendaInicial`, `vendaFinal`, `servicoInicial`, `servicoFinal`, `lancamentoInicial`, `lancamentoFinal`, `retiradaInicial`, `retiradaFinal`, `data`, `dataInicio`, `status`) VALUES
(48, 'patricia', '8', 66.00, 51.00, 1, 1, 1, 3, 1, 98, 1, 4, '2014-11-11 12:43:09', '2014-11-11 08:40:23', 'F'),
(49, 'gabriela ', '16', 66.00, 66.00, 1, 1, 1, 3, 1, 98, 1, 4, '2014-11-11 12:43:56', '2014-11-11 08:46:00', 'F'),
(50, 'gabriela', '16', 241.00, 241.00, 1, 1, 4, 17, 98, 103, 4, 6, '2014-11-11 16:42:31', '2014-11-11 12:56:36', 'F'),
(51, 'patricia', '8', 241.00, 49.00, 1, 1, 1, 17, 98, 103, 4, 6, '2014-11-11 16:38:44', '2014-11-11 12:56:54', 'F'),
(52, 'gabriela ', '16', 930.00, 930.00, 1, 1, 11, 20, 103, 106, 6, 6, '2014-11-11 18:35:23', '2014-11-11 16:59:42', 'F'),
(53, 'patricia', '8', 110.00, -580.00, 1, 1, 18, 31, 106, 117, 6, 8, '2014-11-12 16:39:07', '2014-11-12 08:08:31', 'F'),
(54, 'gabriela ', '16', 70.00, 70.00, 1, 1, 21, 31, 106, 117, 7, 8, '2014-11-12 16:36:03', '2014-11-12 08:21:37', 'F'),
(55, 'patricia', '8', 10.00, 10.00, 1, 1, 30, 31, 117, 117, 8, 8, '2014-11-12 17:06:44', '2014-11-12 17:05:29', 'F'),
(56, 'gabriela ', '16', 233.00, 233.00, 1, 1, 32, 32, 117, 118, 8, 8, '2014-11-12 18:07:37', '2014-11-12 17:07:37', 'F'),
(57, 'gabriela ', '16', 75.00, 75.00, 1, 1, 33, 38, 118, 122, 8, 11, '2014-11-13 16:47:34', '2014-11-13 08:10:18', 'F'),
(58, 'patricia', '8', 1305.00, -1415.00, 1, 1, 30, 38, 118, 122, 8, 11, '2014-11-13 16:56:55', '2014-11-13 10:51:21', 'F'),
(59, 'gabriela ', '16', 166.00, 171.00, 1, 1, 39, 40, 122, 125, 11, 11, '2014-11-13 18:10:12', '2014-11-13 17:03:39', 'F'),
(60, 'patricia', '8', 166.00, -3844.00, 1, 1, 38, 53, 125, 143, 11, 16, '2014-11-14 16:58:26', '2014-11-14 08:04:00', 'F'),
(61, 'gabriela ', '16', 116.00, 166.00, 1, 1, 41, 53, 125, 143, 13, 15, '2014-11-14 16:40:05', '2014-11-14 08:26:47', 'F'),
(62, 'patricia', '8', 46.00, -6.62, 1, 1, 49, 73, 143, 166, 16, 23, '2014-11-18 08:29:02', '2014-11-17 08:53:01', 'F'),
(63, 'gabriela ', '16', 26.00, -524.00, 1, 1, 54, 71, 143, 164, 17, 22, '2014-11-17 16:45:35', '2014-11-17 08:53:35', 'F'),
(64, 'gabriela ', '16', 50.00, -516.00, 1, 1, 72, 90, 164, 182, 22, 24, '2014-11-18 18:47:54', '2014-11-18 08:19:39', 'F'),
(65, 'patricia', '8', 30.00, 30.00, 1, 1, 66, 96, 166, 188, 23, 24, '2014-11-19 10:36:28', '2014-11-18 08:31:10', 'F'),
(66, 'gabriela ', '16', 62.00, -76.50, 1, 1, 91, 102, 182, 194, 24, 30, '2014-11-19 17:45:47', '2014-11-19 08:14:14', 'F'),
(67, 'patricia', '8', 42.00, 22.00, 1, 1, 83, 102, 188, 195, 24, 30, '2014-11-19 17:54:01', '2014-11-19 10:36:42', 'F'),
(68, 'gabriela ', '16', 64.00, -1377.50, 1, 1, 105, 126, 196, 204, 30, 33, '2014-11-20 18:26:44', '2014-11-20 09:45:31', 'F'),
(69, 'patricia', '8', 494.00, 494.00, 1, 1, 98, 126, 196, 204, 31, 31, '2014-11-20 18:18:20', '2014-11-20 10:06:36', 'F'),
(70, 'gabriela ', '16', 82.00, 546.00, 1, 1, 127, 150, 204, 225, 33, 39, '2014-11-21 17:51:00', '2014-11-21 08:36:18', 'F'),
(71, 'patricia', '8', 102.00, -212.00, 1, 1, 134, 150, 217, 225, 33, 39, '2014-11-21 17:57:53', '2014-11-21 09:51:55', 'F'),
(72, 'patricia', '8', 104.00, 84.00, 1, 1, 151, 152, 225, 230, 39, 40, '2014-11-22 12:57:00', '2014-11-22 09:37:18', 'F'),
(73, 'patricia', '8', 158.00, 58.00, 1, 1, 153, 153, 230, 231, 40, 41, '2014-11-22 13:00:14', '2014-11-22 12:58:09', 'F'),
(74, 'patricia', '8', 78.00, -1069.77, 1, 1, 154, 163, 231, 239, 41, 45, '2014-11-24 16:49:53', '2014-11-24 07:50:29', 'F'),
(75, 'gabriela ', '16', 82.00, -297.50, 1, 1, 150, 163, 231, 240, 41, 46, '2014-11-24 17:00:05', '2014-11-24 08:30:11', 'F'),
(76, 'gabriela ', '16', 80.00, 80.00, 1, 1, 165, 165, 242, 242, 46, 46, '2014-11-24 18:22:25', '2014-11-24 17:41:59', 'F'),
(77, 'gabriela ', '16', 100.00, -381.00, 1, 1, 166, 180, 242, 263, 46, 51, '2014-11-25 17:03:26', '2014-11-25 08:44:22', 'F'),
(78, 'patricia', '8', 100.00, 88.50, 1, 1, 163, 180, 242, 263, 46, 50, '2014-11-25 16:59:57', '2014-11-25 08:46:32', 'F');

-- --------------------------------------------------------

--
-- Estrutura da tabela `cargo`
--

CREATE TABLE IF NOT EXISTS `cargo` (
  `cargoID` int(11) NOT NULL AUTO_INCREMENT,
  `cargoTitulo` varchar(40) NOT NULL,
  `cargoDescricao` text NOT NULL,
  `cargoData` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `cargoAtivo` varchar(1) NOT NULL DEFAULT 'S',
  PRIMARY KEY (`cargoID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Extraindo dados da tabela `cargo`
--

INSERT INTO `cargo` (`cargoID`, `cargoTitulo`, `cargoDescricao`, `cargoData`, `cargoAtivo`) VALUES
(3, 'Gerencial', 'Gerencial', '2014-09-07 19:43:54', 'S'),
(4, 'Arte Final', 'Arte Finalista', '2014-09-14 23:12:08', 'S'),
(5, 'Impressão', 'Impressão', '2014-09-07 19:44:34', 'S'),
(6, 'Acabamento', 'Acabamento', '2014-09-07 19:45:22', 'S'),
(7, 'Instalação', 'Instalação', '2014-09-07 19:45:34', 'S'),
(8, 'Atendimento', 'Atendimento', '2014-09-07 19:46:11', 'S'),
(9, 'Vendas', 'Vendas, responsável por cadastra Orçamentos no sistema.', '2014-10-24 05:17:28', 'S'),
(10, 'Produç&#227;o/ Montagem', '', '2014-10-29 16:38:15', 'S');

-- --------------------------------------------------------

--
-- Estrutura da tabela `cheques`
--

CREATE TABLE IF NOT EXISTS `cheques` (
  `chequeID` int(11) NOT NULL AUTO_INCREMENT,
  `receberID` int(11) NOT NULL,
  `clienteID` int(11) NOT NULL,
  `valorCheque` float(10,2) NOT NULL,
  `numeroCheque` varchar(30) NOT NULL,
  `vencimentoCheque` date NOT NULL,
  `observacoes` text NOT NULL,
  `empresaID` int(11) NOT NULL,
  PRIMARY KEY (`chequeID`),
  KEY `empresaID` (`empresaID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Extraindo dados da tabela `cheques`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `cliente`
--

CREATE TABLE IF NOT EXISTS `cliente` (
  `clienteID` int(11) NOT NULL AUTO_INCREMENT,
  `tipoPessoa` varchar(1) DEFAULT NULL,
  `clienteNomeFantasia` varchar(40) NOT NULL,
  `clienteRazaoSocial` varchar(40) DEFAULT NULL,
  `clienteCnpj` varchar(20) DEFAULT NULL,
  `clienteInscEstadual` varchar(20) DEFAULT NULL,
  `clienteInscMunicipal` varchar(20) DEFAULT NULL,
  `clienteEndereco` varchar(40) DEFAULT NULL,
  `clienteNumero` varchar(6) DEFAULT NULL,
  `clienteBairro` varchar(50) DEFAULT NULL,
  `clienteCep` varchar(10) DEFAULT NULL,
  `clienteCidade` varchar(20) DEFAULT NULL,
  `clienteUf` varchar(2) DEFAULT NULL,
  `clienteComplemento` text,
  `clienteContato` varchar(30) DEFAULT NULL,
  `clienteTelefone` varchar(14) DEFAULT NULL,
  `clienteFax` varchar(14) DEFAULT NULL,
  `clienteRadio` varchar(15) DEFAULT NULL,
  `clienteCelular` varchar(15) DEFAULT NULL,
  `operadoraCelular` varchar(20) DEFAULT NULL,
  `clienteEmail` varchar(100) DEFAULT NULL,
  `clienteSite` varchar(100) DEFAULT NULL,
  `clienteAtivo` varchar(1) DEFAULT 'S',
  `clienteData` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `clienteUsuario` varchar(40) DEFAULT NULL,
  `limiteCredito` float(16,4) DEFAULT NULL,
  PRIMARY KEY (`clienteID`),
  KEY `idx_1` (`clienteAtivo`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=242 ;

--
-- Extraindo dados da tabela `cliente`
--

INSERT INTO `cliente` (`clienteID`, `tipoPessoa`, `clienteNomeFantasia`, `clienteRazaoSocial`, `clienteCnpj`, `clienteInscEstadual`, `clienteInscMunicipal`, `clienteEndereco`, `clienteNumero`, `clienteBairro`, `clienteCep`, `clienteCidade`, `clienteUf`, `clienteComplemento`, `clienteContato`, `clienteTelefone`, `clienteFax`, `clienteRadio`, `clienteCelular`, `operadoraCelular`, `clienteEmail`, `clienteSite`, `clienteAtivo`, `clienteData`, `clienteUsuario`, `limiteCredito`) VALUES
(1, '0', 'Gesse', '', '', '', '', '', '', '', '', '', 'SP', '', '', '', '', '', '', '', '', 'http://', 'S', '2014-09-14 22:49:09', 'cadastro.Usuario@73c74402', 0.0000),
(2, '0', 'thiago henrique dos santos ', '', '220.107.968-45', '', '', 'rua dos passaros ', '450', 'jarinu', '', 'jarinu ', 'SP', '', '', '(11) 0000-0000', '', '', '(11) 9721-30634', 'VIVO', '', 'http://', 'S', '2014-10-14 10:10:20', 'cadastro.Usuario@5efc804c', 0.0000),
(3, '0', 'BRUNO GREGIO ', '', '427.342.418-54', '', '', 'AVENIDA BERTIOGA', '1002', 'VILA TUPI ', 'SÃO JOSE', 'VARZEA PAULISTA', 'SP', '', '', '(11) 0000-0000', '', '', '(11) 9725-56615', '', '', '', 'S', '2014-10-14 10:30:37', 'cadastro.Usuario@2ac6c31b', 0.0000),
(4, '0', 'maria de lourdes guerra  ', '', '029.752.868-80', '', '', 'rua raquel simonsen', '152', 'vila progresso ', '13202274', 'jundiai ', 'SP', '', '', '(11) 0000-0000', '', '', '(11) 9735-30094', '', '', 'http://', 'S', '2014-10-15 10:54:03', 'cadastro.Usuario@5bc1c963', 0.0000),
(5, '0', 'RAFAEL REVENDA ', '', '372.402.038-40', '', '', 'RUA SAO JOSE DO RIO PARDO ', '745', 'JARDIM PAULISTA', 'SÃO JOSE', 'VARZEA PAULISTA', 'SP', '', '', '(11) 0000-0000', '', '', '(11) 9970-57524', '', '', 'http://', 'S', '2014-10-15 11:53:20', 'cadastro.Usuario@2d817cba', 0.0000),
(6, '1', 'Maravilhas do LAr', 'Centerlar Com. de Util. Ltda', '05.951.362.0001-81', '407413128112', '', 'Barão de Jundiai', '1009', 'Centro', '13201010', 'Várzea Paulista', 'SP', '', 'Mariza/ Bruno', '(00) 0000-0000', '1145235455', '', '(00) 0000-00000', 'VIVO', 'marketing@maravilhasdolar.combr', 'http://', 'S', '2014-10-15 14:11:46', 'cadastro.Usuario@601d4ab0', 0.0000),
(7, '0', 'JUCELINO - SKR FERRAMENTAS ', '', '215.563.148-09', '', '', 'AVENIDA BERTIOGA', '1732', 'JARDIM BERTIOGA ', '', 'VARZEA PAULISTA', 'SP', '', '', '(11) 0000-0000', '', '', '(11) 9732-90534', '', 'JUCELINOMATOS@BOL.COM.BR', 'http://', 'S', '2014-10-16 09:55:38', 'cadastro.Usuario@9e6032d', 0.0000),
(8, '1', 'escola infantil luz do sol ', '', '59.029.413.0001-41', '', '', 'doutor cavalcanti ', '516', 'centro ', '', 'jundiai ', 'SP', '', 'renata ', '(11) 4587-2678', '', '', '', '', 'direcao@colegiointegracaojd.com.br', 'http://', 'S', '2014-10-16 10:41:08', 'cadastro.Usuario@26760307', 0.0000),
(9, '0', 'ana paula ramos forti ', '', '180.599.588-01', '', '', 'rua belgica ', '34', 'jardim santa lucia ', 'SÃO JOSE', 'VARZEA PAULISTA', 'SP', '', '', '(11) 0000-0000', '', '', '(11) 9721-24913', '', 'paula.rforti@gmail.com', 'http://', 'S', '2014-10-16 10:43:22', 'cadastro.Usuario@294c9881', 0.0000),
(10, '0', 'RENATO VIRGILIO RIBEIRO ', '', '359.893.038-07', '', '', 'RUA CARNAUBA', '418', 'JARDIM DAS PALMEIRAS ', 'SÃO JOSE', 'VARZEA PAULISTA', 'SP', '', '', '', '', '', '(11) 9992-76473', '', 'RENATO.RIBEIRO86@YAHOO.COM.BR', 'http://', 'S', '2014-10-16 15:59:31', 'cadastro.Usuario@1d02b2d8', 0.0000),
(13, '0', 'ana paula teti', '', '', '', '', 'via alemanha ', '527', 'nova essen', '', 'campo limpo paulista', 'SP', '', '', '', '', '', '(11) 9990-05170', '', 'anapteti@uol.com.br', 'http://', 'S', '2014-10-17 09:38:59', 'cadastro.Usuario@378f2bbf', 0.0000),
(17, '1', 'cobel esquadrias ', '', '', '', '', 'rua ADELINO MARTINS ', '221', 'JARDIM TULIPAS ', 'avenida ', 'JUNDIAI', 'SP', '', '', '(11) 4492-4427', '', '', '(11) 9726-36231', '', 'EDISON@COBELESQUADRIAS.COM.BR', 'http://', 'S', '2014-10-20 08:45:42', 'cadastro.Usuario@3efd9758', 0.0000),
(18, '0', 'PAULO CESAR PEREIRA ', '', '', '', '', 'RUA TIMBO', '99', 'JARDIM AMERICA 1', 'SÃO JOSE', 'VARZEA PAULISTA', 'SP', '', '', '(11) 4595-7341', '', '', '', '', '', 'http://', 'S', '2014-10-20 13:25:46', 'cadastro.Usuario@1438e342', 0.0000),
(19, '0', 'Edmilson Borim Saiagua', '', '', '', '', 'RUA JOAO CHIARAMONTE ', '23', 'JARDIM CAXAMBU ', 'avenida ', 'JUNDIAI', 'SP', '', '', '(11) 4584-0900', '', '', '(11) 9720-58012', '', 'edmilson@saiagua.com.br', 'http://', 'S', '2014-10-20 13:59:25', 'cadastro.Usuario@222d9cfe', 0.0000),
(21, '0', 'FABIO HENRIQUE CALDERONI ', '', '', '', '', 'Rua Agenor Carlos da Silveira ap 13', '89', 'VILA ARGOS ', '', 'JUNDIAI', 'SP', '', '', '', '', '', '(11) 9961-58845', '', 'fhca@terra.com.br', 'http://', 'S', '2014-10-21 10:44:51', 'cadastro.Usuario@75474266', 0.0000),
(22, '0', 'laercio da silva armelin', '', '', '', '', 'rua arnoud gut junior ', '515', 'mursa ', 'SÃO JOSE', 'VARZEA PAULISTA', 'SP', '', '', '', '', '', '(11) 9410-94609', '', '', 'http://', 'S', '2014-10-21 10:53:05', 'cadastro.Usuario@5db425f9', 0.0000),
(23, '0', 'ROSEMARI BELLIERO DE CASTRO ', '', '', '', '', 'ESTRADA DO MURSA', '3151', 'MURSA ', 'SÃO JOSE', 'VARZEA PAULISTA', 'SP', '', '', '', '', '', '(11) 9958-78785', '', 'ROSEMARIBC@GMAIL.COM', 'http://', 'S', '2014-10-22 15:03:41', 'cadastro.Usuario@8ccd00f', 0.0000),
(24, '1', 'Rick Kelly Eventos Teatrais Ltda Me', '', '08.598.519.0001-25', '', '', 'Rua eugenio biliero ', '106', 'chacara santa martha ', 'SÃO JOSE', 'VARZEA PAULISTA', 'SP', '', '', '(11) 4595-3600', '', '', '(11) 9730-98859', '', '', 'http://', 'S', '2014-10-27 09:15:09', 'cadastro.Usuario@2919c2af', 0.0000),
(25, '0', 'JOSE RIBEIRO DE LIMA ', '', '', '', '', 'RUA ITAPEVI ', '105', 'JARDIM AMERICA 2', 'SÃO JOSE', 'VARZEA PAULISTA', 'SP', '', '', '(11) 4595-2683', '', '', '(11) 9722-57447', 'VIVO', 'JRIBEIRO.LM@GMAIL.COM', 'http://', 'S', '2014-10-27 09:29:08', 'cadastro.Usuario@4eb24759', 0.0000),
(26, '0', 'EDINALDO RIBEIRO DA SILVA ', '', '', '', '', 'RUA MESTRE GELI ', '301', 'SANTA MARIA ', '', 'CAMPO LIMPO PAULISTA', 'SP', '', '', '(11) 4812-3399', '', '', '(09) 6474-0267', '', 'NALDINHO_RIBEIRO@HOTMAIL.COM', 'http://', 'S', '2014-10-27 10:46:28', 'cadastro.Usuario@4019ea9a', 0.0000),
(27, '0', 'benedita batista miranda', '', '', '', '', 'rua canedos ', '346', 'santa maria ', '', 'campo limpo paulista', 'SP', '', '', '', '', '', '', '', '', 'http://', 'S', '2014-10-28 10:10:59', 'cadastro.Usuario@7af4e544', 0.0000),
(28, '0', 'FELIPE GABRIEL ', '', '', '', '', 'AVENIDA BERTIOGA', '1011', 'VILA TUPI ', '', 'VARZEA PAULISTA', 'SP', '', '', '', '', '', '(11) 4493-2844', '', 'CONTATO@FEMLAJESEMATERIAIS.COM.BR', 'http://', 'S', '2014-10-28 10:38:28', 'cadastro.Usuario@7d0da887', 0.0000),
(29, '1', 'CHAVEIRO BRASIL - ERANDIR ', '', '19.932.472/0001-00', '', '', 'AV FERNÃO DIAS PAES LEME', '391', 'CENTRO', '13220005', 'VARZEA PAULISTA', 'SP', 'RUSSI VILA ARENS', '', '', '', '', '', '', '', 'http://', 'S', '2014-10-29 10:48:07', 'patricia', 0.0000),
(30, '0', 'LUCILA ALVES MARTINS ', '', '', '', '', 'AVENIDA JOSE MEZALIRA ', '6400', 'IVOTURUCAIA ', 'avenida ', 'JUNDIAI', 'SP', '', '', '(09) 7501-5698', '', '', '(09) 5460-0612', '', '', 'http://', 'S', '2014-10-29 12:26:26', 'cadastro.Usuario@4a6cef0f', 0.0000),
(31, '1', 'MB PINTURAS ', '', '10.664.524/0001-30', '', '', 'RUA ANTONIO BELTRAME', '295', 'PARQUE VITORIA ', '', 'FRANCO DA ROCHA ', 'SP', '', '', '(11) 7758-3688', '', '', '(11) 7758-0074', '', '', 'http://', 'S', '2014-10-29 14:08:33', 'cadastro.Usuario@1cf8338b', 0.0000),
(32, '0', 'BRUNO DOTTA ', '', '', '', '', '', '', '', '', '', 'SP', '', '', '', '', '', '(11) 9472-89189', '', '', 'http://', 'S', '2014-10-29 14:36:07', 'cadastro.Usuario@78a6dc8c', 0.0000),
(33, '0', 'aLEX RICHARD ', '', '', '', '', 'RUA AFONSO ROBERI ', '59', 'VILA RAMI ', '', 'JUNDIAI ', 'SP', '', '', '(11) 2709-6492', '', '', '(11) 9960-27101', '', 'ALEXCIBELE4@GMAIL.COM', 'http://', 'S', '2014-10-29 14:54:05', 'cadastro.Usuario@43f79045', 0.0000),
(34, '0', 'MARLI NUNES ', '', '', '', '', '', '', '', '', '', 'SP', '', '', '', '', '', '(11) 9742-29123', '', 'MARLLYNDS@YAHOO.COM.BR', 'http://', 'S', '2014-10-29 15:03:34', 'cadastro.Usuario@1c978d3d', 0.0000),
(35, '0', 'gilberto donizete de moraes ', '', '', '', '', 'rua antonio tessari ', '133', 'jardim maria de fatima ', 'SÃO JOSE', 'VARZEA PAULISTA', 'SP', '', '', '', '', '', '(11) 9986-30098', '', 'gibamovel@hotmail.com', 'http://', 'S', '2014-10-29 16:03:27', 'cadastro.Usuario@1ef0848c', 0.0000),
(36, '0', 'JORGE VIANA ', '', '', '', '', 'RUA TAPEROA ', '143', 'JARDIM AMERICA 2', 'SÃO JOSE', 'VARZEA PAULISTA', 'SP', '', '', '', '', '', '(11) 9983-83867', '', '', 'http://', 'S', '2014-10-29 16:41:52', 'cadastro.Usuario@42f92dbc', 0.0000),
(37, '0', 'Marcelino Wilson Rodrigues Catanzaro', '', '', '', '', 'RUA ARAPUA', '8', 'SÃO JOSE ', 'SÃO JOSE', 'VARZEA PAULISTA', 'SP', '', '', '(11) 4596-0264', '', '', '(11) 9962-24424', '', '', 'http://', 'S', '2014-10-31 09:15:33', 'cadastro.Usuario@394df741', 0.0000),
(38, '0', 'Alexandre Morato de Sales', '', '', '', '', 'AMAMBAI', '53', 'VILA JERIVA ', 'SÃO JOSE', 'VARZEA PAULISTA', 'SP', '', '', '(11) 4595-6657', '', '', '(09) 7412-0454', '', 'alexandremorato1@hotmail.com', 'http://', 'S', '2014-10-31 09:21:43', 'cadastro.Usuario@5d3892b3', 0.0000),
(39, '0', 'ROGERIO CARVALHO GUEDES ', '', '', '', '', 'RUA TAPUIA ', '11', 'JARDIM AMERICA 2', '', 'VARZEA PAULISTA', 'SP', '', '', '', '', '', '(09) 9521-3219', '', 'rogerio.c.guedes@hotmail.com', 'http://', 'S', '2014-10-31 10:04:24', 'cadastro.Usuario@7b3aa36a', 0.0000),
(40, '0', 'thiago antunes ', '', '', '', '', 'rua agapantos ', '531', 'jardim bertioga ', 'SÃO JOSE', 'VARZEA PAULISTA', 'SP', '', '', '(09) 7114-7135', '', '', '(09) 9851-5843', '', 'pretinmmnegro@gmail.com', 'http://', 'S', '2014-10-31 11:00:31', 'cadastro.Usuario@6aa86249', 0.0000),
(41, '0', 'VERA LUCIA MARQUES ', '', '', '', '', 'RUA GUAPORE ', '81', 'JARDIM AMERICA 1', 'SÃO JOSE', 'VARZEA PAULISTA', 'SP', '', '', '(11) 4595-4150', '', '', '(09) 9886-3445', '', '', 'http://', 'S', '2014-10-31 13:55:06', 'cadastro.Usuario@696598c5', 0.0000),
(42, '0', 'Mariana Ferreira de Araujo', '', '', '', '', 'LAERTE MONTEIRO DE OLIVEIRA ', '420', 'SÃO CONRRADO ', '', 'CAMPO LIMPO LIMPO', 'SP', '', '', '', '', '', '(09) 7433-6580', '', '', 'http://', 'S', '2014-10-31 14:08:08', 'cadastro.Usuario@512190b1', 0.0000),
(43, '0', 'CLAUDINEI GONCALVES DE OLIVEIRA  ', '', '', '', '', 'RUA 5', '81', 'TERRA DE SANTA CRUZ ', 'avenida ', 'JUNDIAI', 'SP', '', '', '', '', '', '(09) 7411-7629', '', '', 'http://', 'S', '2014-10-31 16:12:16', 'cadastro.Usuario@391c5c5c', 0.0000),
(44, '0', 'LJ GUINDASTE', '', '', '', '', '', '', '', '', '', 'SP', '', '', '', '', '', '', '', '', 'http://', 'S', '2014-11-03 09:58:45', 'cadastro.Usuario@7ecf0ef0', 0.0000),
(45, '0', 'marcio senciareli de souza ', '', '', '', '', 'avenida casa branca ', '2390', 'vila constanca', 'RUA MANO', 'CAMPO LIMPO PAULISTA', 'SP', '', '', '', '', '', '(09) 8426-4161', '', '', 'http://', 'S', '2014-11-03 11:43:25', 'cadastro.Usuario@17c71aa1', 0.0000),
(46, '0', 'murilo castro de oliveira ', '', '', '', '', 'rua vitoria regia ', 'RUA MA', 'parque internacional ', 'RUA MANO', 'CAMPO LIMPO PAULISTA', 'SP', '', '', '(09) 8821-7831', '', '', '(09) 7293-2156', '', 'muriloerose@gmail.com', 'http://', 'S', '2014-11-03 12:49:09', 'cadastro.Usuario@24d0bcec', 0.0000),
(47, '0', 'pastor marcio estevam ', '', '', '', '', 'rua peri ', '60', 'jardim guanabara ', 'avenida ', 'JUNDIAI', 'SP', '', '', '', '', '', '', '', 'pastormarciomoria@hotmail.com', 'http://', 'S', '2014-11-03 15:53:14', 'cadastro.Usuario@18948fd9', 0.0000),
(48, '0', 'MARCO ANTONIO MOMENTE', '', '', '', '', 'RUA XAVANTES ', '229', 'JARDIM CONTINENTE', 'SÃO JOSE', 'VARZEA PAULISTA', 'SP', '', '', '', '', '', '(09) 9503-2392', '', 'marcomomente@gmail.com', 'http://', 'S', '2014-11-03 17:14:26', 'cadastro.Usuario@25149b95', 0.0000),
(49, '0', 'gordo  - chacara paraiso ', '', '', '', '', 'rua fernando de noronha ', '190', 'agapeama ', 'avenida ', 'JUNDIAI', 'SP', '', '', '(11) 4587-8895', '', '', '(11) 7864-3682', '', 'cesarbarbati@ig.com.br', 'http://', 'S', '2014-11-04 09:59:56', 'cadastro.Usuario@2aad0659', 0.0000),
(50, '0', 'henrique de campos ', '', '', '', '', 'rua laurindo da silva pinto ', '334', 'sao jose 1 ', 'RUA MANO', 'CAMPO LIMPO PAULISTA', 'SP', '', '', '', '', '', '(09) 6908-1116', '', 'henriquedecampos@hotmail.com.br', 'http://', 'S', '2014-11-04 11:17:08', 'cadastro.Usuario@35b57d0b', 0.0000),
(51, '0', 'LUCAS FREITAS ', '', '', '', '', '', '', '', '', '', 'SP', '', '', '', '', '', '(11) 4525-2122', '', 'lucas.freitas@korper.com.br', 'http://', 'S', '2014-11-04 16:06:24', 'cadastro.Usuario@7073931b', 0.0000),
(52, '0', 'solução baterias ', '', '', '', '', 'Rua segundo gregorio bellodi ', '369', 'jardim paraiso ', 'SÃO JOSE', 'VARZEA PAULISTA', 'SP', '', '', '(11) 2709-0365', '', '', '', '', 'solucaobateria@bol.com.br', 'http://', 'S', '2014-11-05 09:09:07', 'cadastro.Usuario@6a3e3449', 0.0000),
(53, '0', 'claudinei neizão ', '', '', '', '', 'rua sabias ', '18', 'polvilho ', '', 'cajamar ', 'SP', '', '', '(11) 4448-1571', '', '', '(09) 9899-1824', '', 'produtorazap@gmail.com', 'http://', 'S', '2014-11-05 09:38:11', 'cadastro.Usuario@7df01c0f', 0.0000),
(54, '0', 'rafael de paula (vale verde) ', '', '', '', '', 'rua maranhão ', '588', 'vila popular ', 'SÃO JOSE', 'VARZEA PAULISTA', 'SP', '', '', '', '', '', '(09) 9292-9617', '', 'produtorazap@gmail.com', 'http://', 'S', '2014-11-05 09:47:03', 'cadastro.Usuario@5862b30', 0.0000),
(55, '0', 'Piruli Comercio de Roupas e Calçados Inf', '', '', '', '', 'rua engenheiro monlevade ', '29', 'centro ', '', 'JUNDIAI ', 'SP', '', '', '', '', '', '(09) 7152-6237', '', 'lrcamargo.21@gmail.com', 'http://', 'S', '2014-11-05 10:02:04', 'cadastro.Usuario@237f8764', 0.0000),
(56, '0', 'Fabiano de Souza', '', '', '', '', 'Ricardo Aizza', '534', 'Cidade Nova II', '13220000', 'Varzea Paulista', 'SP', '', '', '(11) 4596-2649', '', '', '(14) 9976-05331', 'VIVO', '', 'http://', 'S', '2014-11-05 10:46:48', 'cadastro.Usuario@1ee12d38', 0.0000),
(57, '0', 'JOSE BENEDITO FERRO ', '', '', '', '', 'RUA GUAREI ', '454', 'JARDIM AMERICA 1', 'SÃO JOSE', 'VARZEA PAULISTA', 'SP', '', '', '', '', '', '(09) 9943-6962', '', '', 'http://', 'S', '2014-11-05 11:10:00', 'cadastro.Usuario@350bce5d', 0.0000),
(58, '0', 'MARILENE FERREIRA DOS SANTOS ', '', '', '', '', 'RUA ITAPEVI ', '245', 'JARDIM AMERICA 2', 'SÃO JOSE', 'VARZEA PAULISTA', 'SP', '', '', '(11) 4595-7087', '', '', '(09) 9577-7177', '', 'MARILENEFSOLIVEIRA@HOTMAIL.COM', 'http://', 'S', '2014-11-05 11:42:50', 'cadastro.Usuario@42f8502f', 0.0000),
(59, '0', 'ADAIR FALCAO ', '', '', '', '', 'SARGENTO MAURICIO VICENTE DA SILVA ', '586', 'JARDIM MARAMBAIA ', '', 'JUNDIAI ', 'SP', '', '', '', '', '', '(09) 6849-1849', '', '', 'http://', 'S', '2014-11-05 11:58:35', 'cadastro.Usuario@28bedd32', 0.0000),
(60, '0', 'EVA NUNES ', '', '', '', '', 'RUA PARMA ', '250', 'JARDIM ITALIA ', 'SÃO JOSE', 'VARZEA PAULISTA', 'SP', '', '', '(11) 4596-7532', '', '', '(09) 8216-7084', '', '', 'http://', 'S', '2014-11-05 17:53:28', 'cadastro.Usuario@7fa67b59', 0.0000),
(61, '0', 'carla decol - bar da gente ', '', '', '', '', 'rua jacama ', '296', 'JARDIM AMERICA 2', '', 'VARZEA PAULISTA', 'SP', '', '', '', '', '', '(09) 9823-7241', '', ' carladecol@outlook.com', 'http://', 'S', '2014-11-06 09:11:15', 'cadastro.Usuario@762c1c9a', 0.0000),
(62, '0', 'joão de carvalho filho ', '', '', '', '', 'rua florença ', '82', 'jardim italia ', 'SÃO JOSE', 'VARZEA PAULISTA', 'SP', '', '', '(11) 9957-7238', '', '', '(99) 5772-386', '', '', 'http://', 'S', '2014-11-06 09:49:06', 'cadastro.Usuario@6930ae6a', 0.0000),
(63, '0', 'GILMARIO CAMPILLO ', '', '', '', '', 'AV FERNAO DIAS PAES LEME ', '970', 'CENTRO ', 'SÃO JOSE', 'VARZEA PAULISTA', 'SP', '', '', '(11) 4595-5704', '', '', '(11) 9954-98833', '', '', 'http://', 'S', '2014-11-06 10:07:09', 'cadastro.Usuario@6711871f', 0.0000),
(65, '0', 'claudecir dias da cruz', '', '', '', '', 'rua das alocacias ', '499', 'JARDIM BERTIOGA ', '', 'VARZEA PAULISTA', 'SP', '', '', '(11) 4596-6469', '', '', '(11) 9966-05855', '', '', 'http://', 'S', '2014-11-06 13:47:23', 'cadastro.Usuario@17decc82', 0.0000),
(66, '0', 'VANIA - CNA VARZEA PAULISTA ', '', '', '', '', 'AVENIDA FERNÃO DIAS PAES LEME ', '1796', 'CENTRO ', 'SÃO JOSE', 'VARZEA PAULISTA', 'SP', '', '', '(11) 4595-1511', '', '', '', '', 'vaniamoraes.vendas@terra.com.br', 'http://', 'S', '2014-11-06 14:09:10', 'cadastro.Usuario@2209f744', 0.0000),
(67, '0', 'vanderson brito silva ', '', '', '', '', '', '', '', '', '', 'SP', '', '', '', '', '', '(11) 9750-35159', '', '', 'http://', 'S', '2014-11-06 14:43:30', 'cadastro.Usuario@4cc6129c', 0.0000),
(68, '0', 'ROGERIO DOS SANTOS ', '', '', '', '', 'AVENIDA PACAEMBU ', '2907', 'JARDIM PAULISTA ', 'SÃO JOSE', 'VARZEA PAULISTA', 'SP', '', '', '(11) 4595-5191', '', '', '(11) 9945-32677', '', '', 'http://', 'S', '2014-11-06 16:21:49', 'cadastro.Usuario@77a334ae', 0.0000),
(69, '0', 'ELIANA GRYNBERG ', '', '', '', '', 'RUA LINDORIO ROCHA ', 'SÃO JO', 'JARDIM LUZIA ', 'SÃO JOSE', 'VARZEA PAULISTA', 'SP', '', '', '', '', '', '(11) 9853-68148', '', 'LICAGRYN@HOTMAIL.COM', 'http://', 'S', '2014-11-06 16:49:53', 'cadastro.Usuario@5dd427f8', 0.0000),
(70, '0', 'pastor jean ', '', '', '', '', 'RUa gramado ', '140', 'Vila gauchinha ', 'SÃO JOSE', 'VARZEA PAULISTA', 'SP', '', '', '', '', '', '(11) 9738-72643', '', '', 'http://', 'S', '2014-11-07 09:00:52', 'cadastro.Usuario@42fe7055', 0.0000),
(71, '0', 'thiago fernandes ', '', '', '', '', 'rua igurupi', '211', 'cruz alta ', 'SÃO JOSE', 'VARZEA PAULISTA', 'SP', '', '', '', '', '', '(11) 9998-93512', '', 'thiago_fernandes_tfs@hotmail.com ', 'http://', 'S', '2014-11-07 09:18:36', 'cadastro.Usuario@21c07871', 0.0000),
(72, '0', 'JOSE CARLOS SIQUEIRA ', '', '', '', '', 'RUA GUAREI ', '501', 'JARDIM AMERICA 1', 'SÃO JOSE', 'VARZEA PAULISTA', 'SP', '', '', '(11) 4596-1416', '', '', '(11) 9758-89249', '', '', 'http://', 'S', '2014-11-07 13:41:11', 'cadastro.Usuario@7837a744', 0.0000),
(73, '0', 'daniela sensiarelli ', '', '', '', '', 'avenida brasil ', '2285', 'botujuru ', '', 'campo limpo paulista', 'SP', '', '', '', '', '', '(11) 9638-06429', '', '', 'http://', 'S', '2014-11-07 14:21:01', 'cadastro.Usuario@21234e21', 0.0000),
(74, '0', 'ARLINDO PEREIRA DA SILVA ', '', '', '', '', 'IDALINA GONCALVES DIAS ', '85', 'JARDIM TARUMA ', '', 'JUNDIAI ', 'SP', '', '', '(11) 4587-1055', '', '', '', '', 'clauelindoca@hotmail.com', 'http://', 'S', '2014-11-07 14:48:03', 'cadastro.Usuario@dd3ea2d', 0.0000),
(79, '0', 'MARCO ANTONIO DA SILVA ', '', '', '', '', 'RUA ADRIANO PIRANI ', '189', 'JARDIM COPACABANA ', '', 'JUNDIAI ', 'SP', '', '9 5306-6994', '', '', '', '', '', '', 'http://', 'S', '2014-11-10 09:27:26', 'cadastro.Usuario@3906173b', 0.0000),
(80, '0', 'JEANE SILVA ARAUJO ', '', '', '', '', 'RUA DA LAGUNA ', '399', 'SANTA TEREZINHA', 'SÃO JOSE', 'VARZEA PAULISTA', 'SP', '', '', '', '', '', '9 7241-1039', '', '', 'http://', 'S', '2014-11-10 09:49:08', 'cadastro.Usuario@6c614255', 0.0000),
(81, '0', 'SIDINEI SOARES ', '', '', '', '', 'AVENIDA DO RIO JUNDIAI ', '1255', 'DISTRITO INDUSTRIAL ', 'SÃO JOSE', 'VARZEA PAULISTA', 'SP', '', '', '11 4606-0258', '', '', '9 6845-9967', '', '', 'http://', 'S', '2014-11-10 10:09:08', 'cadastro.Usuario@28170a64', 0.0000),
(82, '0', 'ALEXANDRE BENEDITO SOUZA ', '', '', '', '', 'AVENIDA PACAEMBU ', '833', 'JARDIM PAULISTA ', '', 'VARZEA PAULISTA', 'SP', '', '', '', '', '', '9 9572-2667', '', '', 'http://', 'S', '2014-11-10 12:20:10', 'cadastro.Usuario@1779e93', 0.0000),
(83, '0', 'teste', '', '', '', '', '', '', '', '13220000', '', 'SP', '', '', '11997864520', '', '', '', '', '', 'http://', 'S', '2014-11-10 13:56:58', 'cadastro.Usuario@1ca14537', 0.0000),
(84, '0', 'LAERTE - CLENIR ', '', '', '', '', 'RUA DOS EUCALIPTOS ', '109', 'LEIRI ', 'SÃO JOSE', 'VARZEA PAULISTA', 'SP', '', '', '11 4526-2490', '', '', '9 9344-8786', '', '', 'http://', 'S', '2014-11-10 15:24:34', 'cadastro.Usuario@57f1a90a', 0.0000),
(85, '0', 'marcos paulo ribeiro ', '', '', '', '', 'rua jose carlos lumes ', '189', 'jardim novo mundo ', 'SÃO JOSE', 'VARZEA PAULISTA', 'SP', '', '', '', '', '', '9 7129-3920', '', '', 'http://', 'S', '2014-11-10 16:32:19', 'cadastro.Usuario@78b1de2d', 0.0000),
(86, '0', 'elcio doulgas ', '', '', '', '', 'rua taquari ', '276', 'america 3', 'SÃO JOSE', 'VARZEA PAULISTA', 'SP', '', '', '', '', '', '9 9931-1935', '', '', 'http://', 'S', '2014-11-10 17:14:14', 'cadastro.Usuario@3e87b91a', 0.0000),
(87, '0', 'Gabriela Rc Loja de Alimentos Ltda Me', '', '', '', '', 'RUA SÃO BERNADO DO CAMPO ', '530', 'SETOR INDUSTRIAL ', 'SÃO JOSE', 'VARZEA PAULISTA', 'SP', '', '', '11 4606-0606', '', '', '9 9426-6996', '', 'gabriela@romanato.ind.br', 'http://', 'S', '2014-11-11 08:51:50', 'cadastro.Usuario@58c0897c', 0.0000),
(88, '0', 'EDNA GONÇALVES DOS SANTOS ', '', '', '', '', 'RUA GUAREI ', '426', 'JARDIM AMERICA 1', '', 'VARZEA PAULISTA', 'SP', '', '', '', '', '', '9 9986-5730', '', 'EDNA.GONCALVESSL@HOTMAIL.COM', 'http://', 'S', '2014-11-11 09:01:00', 'cadastro.Usuario@73cae249', 0.0000),
(89, '0', 'ROBERTO PINTO - BATATA CHIC ', '', '', '', '', 'AVENIDA FERNAO DIAS PAES LEME ', '', 'CENTRO ', '', 'VARZEA PAULISTA', 'SP', '', '', '', '', '', '9 6484-8384', '', '', 'http://', 'S', '2014-11-11 09:51:44', 'cadastro.Usuario@37f8fda6', 0.0000),
(90, '1', 'PREFEITURA DO MUNICÍPIO DE JUNDIAÍ ', '', '45.780.103.0001-50', '', '', 'AVENIDA LIBERDADE ', '', 'VILA BANDEIRANTES ', '', 'JUNDIAI ', 'SP', '', '', '11 4589-8400', '', '', '11 4589-8965', '', 'nfeletronica@jundiai.sp.gov.br', 'http://', 'S', '2014-11-11 10:17:57', 'cadastro.Usuario@9124b88', 0.0000),
(91, '1', 'Prefeitura Municipal Itupeva', '', '45.780.061.0001-57', '', '', 'EDUARDO ANIBAL LOURENÇON ', '15', 'PARQUE DAS VINHAS ', 'alameda ', 'ITUPEVA', 'SP', '', '', '11 4591-8100', '', '', '', '', 'cassio.gusson@gmail.com', 'http://', 'S', '2014-11-11 10:33:24', 'cadastro.Usuario@12e6ca10', 0.0000),
(92, '0', 'STHEINER GEORGE DOS SANTOS ', '', '', '', '', '', '', '', '', '', 'SP', '', '', '11 4588-5364', '', '', '', '', 'sgsantos@jundiai.sp.gov.br', 'http://', 'S', '2014-11-11 11:00:56', 'cadastro.Usuario@1a91782f', 0.0000),
(93, '0', 'JOSE CARLOS - RANCHO DO ZEZE ', '', '', '', '', 'RUA ARAPOA ', '390', 'SÃO JOSE ', '', 'VARZEA PAULISTA', 'SP', '', '', '13*23983', '', '', '7759-4306', '', '', 'http://', 'S', '2014-11-11 11:21:17', 'cadastro.Usuario@1c7d030d', 0.0000),
(94, '0', 'lucimar fernandes da silva', '', '', '', '', 'rua rouxinol', '190', 'santa lucia', '', 'CAMPO LIMPO PTA', 'SP', '', '', '40395013', '982256523', '', '975639719', '', '', 'http://', 'S', '2014-11-11 11:39:46', 'cadastro.Usuario@3003a3a3', 0.0000),
(95, '0', 'MARCELO COSTA DOMINGUES ', '', '', '', '', 'ESTRADA MUNICIPAL ATILIO SQUIZATO', '4900', 'JARDIM ROSEIRAL', '', 'JARINU', 'SP', '', '', '11 4017-5452', '', '', '9 4765-8321', '', 'MAC_ROSEIRAL@YAHOO.COM.BR', 'http://', 'N', '2014-11-11 11:42:43', 'cadastro.Usuario@22c9762d', 0.0000),
(96, '0', 'celso porto', '', '', '', '', 'rua avignon', '120', 'sant james 2', '', 'CAMPO LIMPO PTA', 'SP', '', 'celso', '40380529', '77178461', '', '7*5137', '', '', 'http://', 'S', '2014-11-11 11:50:31', 'cadastro.Usuario@30edd5f4', 0.0000),
(97, '0', 'MICKELY TATIANE ', '', '', '', '', 'RUA SIRIEMA ', '585', 'CIDADE NOVA 2', 'SÃO JOSE', 'VARZEA PAULISTA', 'SP', '', '', '', '', '', '9 7197-8074', '', '', 'http://', 'S', '2014-11-11 12:01:14', 'cadastro.Usuario@5f00498c', 0.0000),
(98, '0', 'Custodio Tavaza da Silva', '', '', '', '', 'Rua Padua', '200', 'Jd. Italia', '13224719', 'Várzea Paulista', 'SP', '', '', '1145957592', '', '', '11997004647', 'VIVO', 'custodiosilva727@terra.com.br', 'http://', 'S', '2014-11-11 12:30:18', 'cadastro.Usuario@6b70cd6', 0.0000),
(99, '0', 'Jeferson Bianqui dos Santos', '', '216.533.558-24', '', '', 'Rua Guara', '413', 'Jd. América III', '', 'Várzea Paulista', 'SP', '', '', '(96) 9163-677', '', '', '', '', '', 'http://', 'S', '2014-11-11 12:57:20', 'patricia', 0.0000),
(100, '0', 'RONI DA COSTA E SILVA ', '', '', '', '', 'AVENIDA EDUARDO DE CASTRO ', '549', 'VILA SAO JOSE', 'SÃO JOSE', 'VARZEA PAULISTA', 'SP', '', '', '', '', '', '9 8565-3448', '', '', 'http://', 'S', '2014-11-11 15:30:41', 'cadastro.Usuario@7659bf1', 0.0000),
(101, '0', 'Mariana Ferreira de Araujo', '', '345.862.818-55', '', '', 'Rua Laerte Monteiro de Oliveira', '420', 'São Conrrado', '13200000', 'Campo limpo', 'SP', '', '', '', '', '', '(11) 9743-36580', 'VIVO', '', 'http://', 'S', '2014-11-11 15:44:39', 'patricia', 0.0000),
(102, '0', 'Gesse', '', '', '', '', '', '', '', '', '', 'SP', '', '', '', '', '', '', '', '', 'http://', 'S', '2014-11-11 15:46:45', 'cadastro.Usuario@42690926', 0.0000),
(103, '0', 'Marcelo Space Car', 'Marcelo Space Car', '', '', '', 'Av. Fernão Dias Paes Leme', '341', 'Centro', '13220005', 'Várzea Paulista', 'SP', '', '', '1144931649', '', '', '', '', '', 'http://', 'S', '2014-11-11 16:00:11', 'cadastro.Usuario@764e2ed9', 0.0000),
(104, '0', 'ELCIO - EU QUERO SORVETES ', '', '', '', '', 'RUA GUARUJA ', '132', 'JARDIM AMERICA 1', '', 'VARZEA PAULISTA', 'SP', '', '', '11 4595-7876', '', '', '9  7189-1303', '', '', 'http://', 'S', '2014-11-11 16:11:30', 'cadastro.Usuario@61a8a328', 0.0000),
(105, '0', 'GUILHERME FONSECA GIMENE ', '', '', '', '', 'RUA DUQUE DE CAIXIAS ', '49', 'CENTRO ', 'SÃO JOSE', 'VARZEA PAULISTA', 'SP', '', '', '11 4595-4176', '', '', '9 9948-7376', '', 'eng_guilherme@hotmail.com', 'http://', 'S', '2014-11-11 16:35:01', 'cadastro.Usuario@57c6fb4f', 0.0000),
(106, '0', 'SIDINEI GRACIANO PERONI ', '', '', '', '', 'aVENIDA CESAR COSIN', '586', 'IVOTURUCAIA ', '', 'JUNDIAI ', 'SP', '', '', '', '', '', '9 9570-2965', '', '', 'http://', 'S', '2014-11-11 17:00:46', 'cadastro.Usuario@5090b636', 0.0000),
(107, '0', 'JULIANO OLIVEIRA GRACIANO ', '', '', '', '', 'RUA JOSE NAPOLEAO MAZZARI ', '170', 'JARDIM ESPLANADA ', '', 'JUNDIAI ', 'SP', '', '', '', '', '', '9 7091-1200', '', '', 'http://', 'S', '2014-11-11 17:13:04', 'cadastro.Usuario@129dc9b8', 0.0000),
(108, '0', 'LUIZ ANTONIO CORDEIRO ', '', '', '', '', 'RUA GUAPORE ', '101', 'JARDIM AMERICA 1', '', 'VARZEA PAULISTA', 'SP', '', '', '', '', '', '', '', '', 'http://', 'S', '2014-11-11 17:20:18', 'cadastro.Usuario@8e006c3', 0.0000),
(109, '0', 'DIVA SILVA ', '', '', '', '', 'RUA GUAPORE ', '131', 'JARDIM AMERICA 1', '', 'VARZEA PAULISTA', 'SP', '', '', '11 4595-1525', '', '', '', '', '', 'http://', 'S', '2014-11-12 08:20:58', 'cadastro.Usuario@43dc9903', 0.0000),
(110, '0', 'maria isabel santana', '', '', '', '', 'doutor lopes de oliveira ', '669', 'vila progresso ', '', 'jundiai ', 'SP', '', '', '', '', '', '9 9659-0775', '', '', 'http://', 'S', '2014-11-12 09:43:21', 'cadastro.Usuario@4df10347', 0.0000),
(111, '0', 'MARIA DALVA', '', '', '', '', 'RUA JEQUITIBA', '269', 'SAO GUIDO', '', 'VARZEA PAULISTA', 'SP', '', '', '981859433', '', '', '995201465', 'VIVO', '', 'http://', 'S', '2014-11-12 10:17:12', 'cadastro.Usuario@271a95f8', 0.0000),
(112, '0', 'Claudinei Paulo', '', '', '', '', 'R das Acacias', '259', 'Jd Bertioga', '13220000', 'Várzea Paulista', 'SP', '', '', '94*34158', '', '', '11974602067', 'VIVO', '', 'http://', 'S', '2014-11-12 11:18:57', 'cadastro.Usuario@38a439e8', 0.0000),
(113, '0', 'jose claudio alves da silva', '', '', '', '', 'rua joão felipe ', '71', 'jardim promeca ', 'SÃO JOSE', 'VARZEA PAULISTA', 'SP', '', '', '11 4606-4350', '', '', '9 9743-5760', '', '', 'http://', 'S', '2014-11-12 11:21:09', 'cadastro.Usuario@278e55d1', 0.0000),
(114, '0', 'VALTER DESIDERIO DA SILVA ', '', '', '', '', 'RUA MACAJUBA ', '220', 'JARDIM AMERICA 3', 'SÃO JOSE', 'VARZEA PAULISTA', 'SP', '', '', '', '', '', '9 9998-2434', '', '', 'http://', 'S', '2014-11-12 12:21:40', 'cadastro.Usuario@27335902', 0.0000),
(115, '1', 'PAROQUIA SENHOR BOM JESUS - RENÊ ', '', '50.982.214.0025-56', '', '', 'LUIZ UNGARO ', '', 'CAXAMBU ', '', 'JUNDIAI ', 'SP', '', '', '4584-1534', '', '', '9 7332-8869', '', 'paroquiasbjcaxambu@ig.com.br', 'http://', 'S', '2014-11-12 13:36:54', 'cadastro.Usuario@1d6f9042', 0.0000),
(116, '0', 'José Sousa Neto', '', '', '', '', 'Rua Maraba', '50', 'Jd. América I', '13221330', 'Várzea Paulista', 'SP', '', '', '11996819752', '', '', '', '', '', 'http://', 'S', '2014-11-12 15:17:55', 'cadastro.Usuario@29d06704', 0.0000),
(117, '0', 'DJALMA SANTOS MOREIRA ', '', '', '', '', 'RUA JAGUARIUNA ', '810', 'JARDIM AMERICA 1', '', 'VARZEA PAULISTA', 'SP', '', '', '11 4595-1036 ', '', '', '', '', '', 'http://', 'S', '2014-11-12 15:43:03', 'cadastro.Usuario@47ce8bf4', 0.0000),
(118, '0', 'PEDRO ONIVAL FARIA ', '', '', '', '', 'RUA AFONSO PENA ', '130', 'JARDIM GUANCIALLI ', 'RUA MANO', 'CAMPO LIMPO PAULISTA', 'SP', '', '', '4038-3715', '', '', '97566-1351', '', '', 'http://', 'S', '2014-11-12 15:45:46', 'cadastro.Usuario@1512df87', 0.0000),
(119, '0', 'FLAVIANA GONCALVES ', '', '', '', '', 'RUA VOTUPORANGA', '68', 'JARDIM AMERICA 1', '', 'VARZEA PAULISTA', 'SP', '', '', '', '', '', '9 6493-1836', '', '', 'http://', 'S', '2014-11-12 15:59:42', 'cadastro.Usuario@40f11c96', 0.0000),
(120, '0', 'ANA PAULA DA SILVA ', '', '', '', '', 'RUA IZIDORIO CANTIDIO DO NASCIMENTO ', '62', 'JARDIM BURITI ', '', 'VARZEA PAULISTA', 'SP', '', '', '', '', '', '9 9542-6399', '', '', 'http://', 'S', '2014-11-12 16:45:05', 'cadastro.Usuario@7c181f79', 0.0000),
(123, '0', 'KLEITON SOUZA', '', '', '', '', 'AVENIDA DA SAUDADE ', '39', 'JARDIM GUANCIALLI ', '', 'CAMPO LIMPO PAULISTA', 'SP', '', '', '', '', '', '9 4101-5103', '', 'kleitoncarvalho.camaravp@hotmail.com', 'http://', 'S', '2014-11-12 16:59:48', 'cadastro.Usuario@2e38a04d', 0.0000),
(124, '0', 'MARCOS ROGERIO BETIN ', '', '', '', '', 'AVENIDA ANTONIO FREDERICO OZANAM ', '4200', 'PONTE SÃO JOÃO ', '', 'JUNDIAI ', 'SP', '', '', '', '', '', '9 9955-4175', '', 'sac@betinesantos.com.br', 'http://', 'S', '2014-11-13 08:32:02', 'cadastro.Usuario@35efeb57', 0.0000),
(125, '0', 'VALDIR PEREREIRA DE SOUZA', '', '', '', '', 'RUA 2 ', '128', 'GAUCHINHA', '', 'VARZEA PAULISTA', 'SP', 'VALDEIR', '', '45962710', '', '', '973025402', '', '', 'http://', 'S', '2014-11-13 09:04:11', 'cadastro.Usuario@64a87019', 0.0000),
(126, '0', 'ALCEU EDER MASSUCATO ', '', '', '', '', 'RUA VEREADOR JOSE POLI ', '03', 'CENTRO', 'alameda ', 'ITUPEVA', 'SP', '', '', '', '', '', '9 9919-3845', '', 'edermassucato@uol.com.br', 'http://', 'S', '2014-11-13 10:09:13', 'cadastro.Usuario@58eb20eb', 0.0000),
(127, '0', 'ANTONIO CARLOS ZONHO ', '', '', '', '', '', '', '', '', '', 'SP', '', '', '4587-7393', '', '', '9 9994-4776', '', '', 'http://', 'S', '2014-11-13 10:57:22', 'cadastro.Usuario@661358a0', 0.0000),
(128, '0', 'Jordano ', '', '', '', '', 'Rua Benedito Pereira de Mesquita', '108', 'Jordanesia', '', 'Cajamar', 'SP', '', '', '1144474085', '', '', '', '', '', 'http://', 'S', '2014-11-13 10:57:47', 'cadastro.Usuario@3121dd9c', 0.0000),
(129, '0', 'FERNANDA CHECCHINATO ', '', '', '', '', 'RUA DO ROSARIO ', '118', 'CENTRO ', '', 'JUNDIAI ', 'SP', '', '', '9 8117-9436', '', '', '9 4725-7707', '', 'fdchecchinato@gmail.com', 'http://', 'S', '2014-11-13 11:36:31', 'cadastro.Usuario@2a63f2a3', 0.0000),
(130, '0', 'EDIVALDO PEDRO DE OLIVEIRA ', '', '', '', '', 'RUA MORUMBI', '', 'JARDIM AMERICA 2', '', 'VARZEA PAULISTA', 'SP', '', '', '', '', '', '9 9915-0649', '', '', 'http://', 'S', '2014-11-13 11:48:12', 'cadastro.Usuario@7be759f', 0.0000),
(131, '1', 'ELETRONICA BAHIA ', '', '11.235.312.0001-09', '', '', 'FERNÃO DIAS PAES LEME ', '579', 'CENTRO ', 'SÃO JOSE', 'VARZEA PAULISTA', 'SP', '', '', '4606-2002', '', '', '4596-1258', '', 'eletronicabahia01@hotmail.com', 'http://', 'S', '2014-11-13 12:04:44', 'cadastro.Usuario@70667469', 0.0000),
(132, '0', 'ANTONIO MULTI MODAS LAVA CAR ', '', '', '', '', 'AVENIDA ANTONIO FREDERICO OZANAM ', '3200', 'PONTE SÃO JOÃO ', '', 'JUNDIAI ', 'SP', '', '', '4807-0530', '', '', '', '', '', 'http://', 'S', '2014-11-13 12:31:51', 'cadastro.Usuario@659418e5', 0.0000),
(133, '1', 'PAPELARIA APOGEU', 'PAPELARIA APOGEU LTDA', '56.788.813/0001-42', '712.010.689.113', '', 'AV FERNÃO DIAS PAES LEME', '651', 'CENTRO ', '13220005', 'VARZEA PAULISTA ', 'SP', '', 'ANDREIA/ TUTA', '1146061768', '', '', '14*584739', '', '', 'http://', 'S', '2014-11-13 13:40:38', 'cadastro.Usuario@152ac6e9', 0.0000),
(134, '0', 'DARLI DOS SANTOS ', '', '', '', '', 'RUA MOGI DAS CRUZES ', '367', 'JARDIM AMERICA 1', '', 'VARZEA PAULISTA', 'SP', '', '', '', '', '', '9 7089-1367', '', '', 'http://', 'S', '2014-11-13 14:27:02', 'cadastro.Usuario@3193d28d', 0.0000),
(135, '0', 'JULIO CESAR MORAES SILVA ', '', '', '', '', 'AV PRESIDENTE WASHINTON LUIS ', '489', 'VILA TAVARES ', 'RUA MANO', 'CAMPO LIMPO PAULISTA', 'SP', '', '', '', '', '', '9 8038-3198', '', 'julio_jcms@ig.com.br', 'http://', 'S', '2014-11-13 16:21:16', 'cadastro.Usuario@38ffba2d', 0.0000),
(136, '0', 'PIOLHO ', '', '', '', '', '', '', '', '', '', 'SP', '', '', '', '', '', '9 7247-8736', '', '', 'http://', 'S', '2014-11-13 17:47:58', 'cadastro.Usuario@60aa7b6f', 0.0000),
(137, '1', 'MARCELO PONTE EVENTOS ', '', '15.199.926.0001-25', '', '', 'ruA ANTONIO LUIZ SUTTI ', '137', 'JARDIM MARIA DE FATIMA ', '', 'VARZEA PAULISTA', 'SP', '', '', '89*3156', '', '', '9 9848-2766', '', 'ponte.eventos@gmail.com', 'http://', 'S', '2014-11-14 10:11:35', 'cadastro.Usuario@6913ee93', 0.0000),
(138, '0', 'ROSINALDO JOSE SANTANA', '', '', '', '', 'RUA SABARA ', '188', 'JARDIM AMERICA 1', '', 'VARZEA PAULISTA', 'SP', '', '', '4596-4722', '', '', '9 9881-0376', '', '', 'http://', 'S', '2014-11-14 10:53:22', 'cadastro.Usuario@261ff84e', 0.0000),
(139, '0', 'JOÃO LUIZ ZANIOLLI JUNIOR', '', '', '', '', 'R. JOSE FONTEBASSO', '538', 'CAXAMBU', '1320000', 'JUNDIAÍ', 'SP', '', '', '1146012429', '', '', '975271552', '', 'ZANIOLLI@HOTMAIL.COM', 'http://', 'S', '2014-11-14 10:57:13', 'cadastro.Usuario@43a33836', 0.0000),
(140, '0', 'PAULO SILVA ', '', '', '', '', 'RUA ARARE', '690', 'PARQUE GUARANI ', '', 'VARZEA PAULISTA', 'SP', '', '', '', '', '', '9 7494-9898', '', '', 'http://', 'S', '2014-11-14 10:59:20', 'cadastro.Usuario@505ce3a6', 0.0000),
(141, '0', 'RINALDO GONÇALEZ', '', '', '', '', 'TV. DUILIO FONTE BASSO', '99', 'ROSEIRA', '13200000', 'JUNDIAI', 'SP', '', '', '999580636', '', '', '', '', 'vendas@correiasuniversal.com.br', 'http://', 'S', '2014-11-14 11:36:29', 'cadastro.Usuario@5fb2e450', 0.0000),
(142, '0', 'KLEITON CALDAS TEIXEIRA ', '', '', '', '', 'RUA ALFREDO VAZ DE CAMPOS ', '57', 'JARDIM TAMOIO', '', 'JUNDIAI ', 'SP', '', '', '4491-1087', '', '', '9 7508-8806', '', '', 'http://', 'S', '2014-11-14 11:47:17', 'cadastro.Usuario@4d06026b', 0.0000),
(143, '1', 'CIRINEIS IGREJA QUANDRANGULAR ', 'IGREJA DO EVANGELHO QUANDRANGULAR ', '62.955.505.4123-50', '', '', 'RUA PIQUERI ', '523', 'JARDIM AMERICA 3', '', 'VARZEA PAULISTA', 'SP', '', '', '9 7175-9535', '', '', '9 6914-9908', '', 'shekinah2012@hotmail.com', 'http://', 'S', '2014-11-14 12:05:58', 'cadastro.Usuario@27c12731', 0.0000),
(144, '0', 'RENATO DOS SANTOS ', '', '', '', '', 'Rua segundo gregorio bellodi ', '806', 'jardim paraiso ', '', 'VARZEA PAULISTA', 'SP', '', '', '', '', '', '9 9590-2089', '', '', 'http://', 'S', '2014-11-14 12:16:43', 'cadastro.Usuario@27d5e961', 0.0000),
(145, '0', 'ALCIONO CARVALHO DE MEDEIROS', '', '034.740.934-28', '', '', 'FIORINDO PASTRO', '136', 'JD MARIA DE FATIMA', '13220530', 'VARZEA PAULISTA', 'SP', '', '', '(11) 4809-3027', '', '', '', '', '', 'http://', 'S', '2014-11-14 13:04:37', 'patricia', 0.0000),
(146, '0', 'TADEU TIBIRY ', '', '', '', '', 'AVENIDA BERTIOGA', '150', 'VILA TUPI ', '', 'VARZEA PAULISTA', 'SP', '', '', '3446-7489', '9 9966-7978', '', '9 9801-2096', '', 'academiatibiry@hotmail.com', 'http://', 'S', '2014-11-14 13:44:22', 'cadastro.Usuario@647fce18', 0.0000),
(147, '0', 'DANIEL MURARI', '', '', '', '', 'RUA ANTONIO BENACHI ', '11', 'IVOTURUCAIA', 'avenida ', 'JUNDIAI', 'SP', '', '', '', '', '', '9 4319-4028', '', '', 'http://', 'S', '2014-11-14 14:38:09', 'cadastro.Usuario@720f81b', 0.0000),
(148, '0', 'SOL SERVIÇOS ODONTOLOGICOS', '', '', '', '', 'FERNÃO DIAS PAES LEME ', '1512', 'CENTRO', '', 'VARZEA PAULISTA', 'SP', '', '', '4595-3400', '', '', '4596-0388', '', 'jorgeihb@hotmail.com', 'http://', 'S', '2014-11-14 14:50:11', 'cadastro.Usuario@552be604', 0.0000),
(149, '0', 'VERA LUCIA - COND. PASARGADA', '', '', '', '', 'RUA DO RETIRO ', '2072', 'JARDIM DAS HORTENCIAS ', '', 'JUNDIAI ', 'SP', '', '', '', '', '', '9 9898-9835', '', '', 'http://', 'S', '2014-11-14 14:51:47', 'cadastro.Usuario@4e476310', 0.0000),
(150, '0', 'MARCIA APARECIDA PEDRO ', '', '', '', '', 'RUA VIGARIO AFONSO NIKRAKC', '278', 'JARDIM CRUZ ALTA ', 'SÃO JOSE', 'VARZEA PAULISTA', 'SP', '', '', '', '', '', '9 7386-6919 ', '', 'marciapedro53@gmail.com', 'http://', 'S', '2014-11-14 15:02:09', 'cadastro.Usuario@26da6efd', 0.0000),
(151, '0', 'ELAINE VIRGILIO', '', '', '', '', 'RUA DOS ANGICOS ', '205', 'JARDIM AMERICA 3', 'SÃO JOSE', 'VARZEA PAULISTA', 'SP', '', '', '', '', '', '9 4240-9954', '', '', 'http://', 'S', '2014-11-14 15:36:11', 'cadastro.Usuario@3557251', 0.0000),
(153, '0', 'DALILA ALVES MARTINS ', '', '', '', '', 'RUA MERCURIO ', '644', 'JARDIM SATELITE ', '', 'VARZEA PAULISTA', 'SP', '', '', '2434-1271', '', '', '9 7522-9282', '', '', 'http://', 'S', '2014-11-17 09:03:53', 'cadastro.Usuario@3f1f571b', 0.0000),
(154, '0', 'ROGERIO SANTOS ', '', '', '', '', 'RUA VICTORIO SPINUCCI ', '606', 'JARDIM PROMECA ', '', 'VARZEA PAULISTA', 'SP', '', '', '', '', '', '9 6498-4664 ', '', '', 'http://', 'S', '2014-11-17 09:51:05', 'cadastro.Usuario@1c7d5add', 0.0000),
(155, '0', 'EDER ARAUJO SANTOS ', '', '', '', '', 'RUA PINDARE ', '480', 'VILA INDAIA ', '', 'VARZEA PAULISTA', 'SP', '', '', '4809-0534', '', '', '9 7555-7601', '', 'EDINHOSANTOSCABELEIREIRO@OUTLOOK.COM', 'http://', 'S', '2014-11-17 10:07:41', 'cadastro.Usuario@54753ccd', 0.0000),
(156, '1', 'L&T EMPREEDIMENTOS E CONSTRUÇÕES LTDA ', '', '64.174.857.0001-00', '', '', 'FERNÃO DIAS PAES LEME ', '1310', 'CENTRO ', '', 'VARZEA PAULISTA', 'SP', '', '', '4595-4600', '', '', '4493-2032', '', 'lt.administracao@uol.com.br', 'http://', 'S', '2014-11-17 10:38:49', 'cadastro.Usuario@9dadfe7', 0.0000),
(157, '0', 'HELENA TANIGAWA', '', '', '', '', 'RODOVIA ANHANGUERA KM 46,5', '', 'CAJAMRA', '', 'CAJAMAR', 'SP', 'LOTE D 21', '', '99698-1790', '', '', '99698-1790', 'VIVO', '', 'http://', 'S', '2014-11-17 11:26:15', 'cadastro.Usuario@4de54e15', 0.0000),
(159, '0', 'INIMA ', '', '', '', '', 'ESTRADA DA BRAGANTINA ', '1300', 'VILA SÃO JOSE ', 'SÃO JOSE', 'VARZEA PAULISTA', 'SP', '', '', '4038-4522', '', '', '4039-2122', '', 'inima@drogafenix.com.br', 'http://', 'S', '2014-11-17 11:42:51', 'cadastro.Usuario@3b72fd3c', 0.0000),
(160, '0', 'VANDERLEI RODLINGUE DE SOUZA ', '', '', '', '', 'RUA EUVECIO PAULINIO ', '158', 'SÃO JOSE 1 ', 'SÃO JOSE', 'VARZEA PAULISTA', 'SP', '', '', '11 2517-0121', '', '', '', '', '', 'http://', 'S', '2014-11-17 11:45:48', 'cadastro.Usuario@7257dbe8', 0.0000),
(161, '0', 'JAIR FERNANDES MENDONÇA', '', '', '', '', 'RUA ANEZIO CORDEIRO FILHO ', '221', 'COLINA ', '', 'BOTUJURU', 'SP', '', '', '', '', '', '9 5200-4225', '', '', 'http://', 'S', '2014-11-17 11:51:44', 'cadastro.Usuario@612a1975', 0.0000),
(162, '0', 'WALTER SIMOES NEVES ', '', '', '', '', 'AVENIDA 9 DE JULHO ', '2640', 'ANHANGABAU ', '', 'JUNDIAI ', 'SP', '', '', '', '', '', '9 9738-1776 ', '', '', 'http://', 'S', '2014-11-17 12:14:44', 'cadastro.Usuario@3d761546', 0.0000),
(163, '0', 'WANESSA ROMA', '', '', '', '', 'RUA JOSE RABELO PORTELA', '957', 'VILA TUPI', '13220000', 'VARZEA PAULISTA', 'SP', '', '', '1145954645', '', '', '11998636628', 'VIVO', 'wanessa_totalfreios@hotmail.com', 'http://', 'S', '2014-11-17 12:55:32', 'cadastro.Usuario@3be1cfd9', 0.0000),
(164, '0', 'KARINA MARIA DA SILVA GOMES ', '', '', '', '', 'LUIZ PRENHOLATO ', '40', 'JARDIM PROMECA ', '', 'VARZEA PAULISTA', 'SP', '', '', '4595-3235', '', '', '9 9600-2697', '', '', 'http://', 'S', '2014-11-17 13:31:12', 'cadastro.Usuario@5cf1e7ef', 0.0000),
(165, '0', 'PAULO NIC ', '', '', '', '', 'RUA CAMARIO ', '34', 'JARDIM SANTA LUCIA ', 'RUA MANO', 'CAMPO LIMPO PAULISTA', 'SP', '', '', '4039-2228', '', '', '9 9202-9977', '', 'paulonic@uol.com.br', 'http://', 'S', '2014-11-17 13:46:07', 'cadastro.Usuario@53bd4ed1', 0.0000),
(166, '0', 'NEUZA DE MOURA LOPES ', '', '', '', '', 'JOÃO CARBONARI JUNIOR ', '75', 'JUNDIAINOPOLIS ', 'avenida ', 'JUNDIAI', 'SP', '', '', '', '', '', '9 7479-8641', '', 'neuzaluna@hotmail.com', 'http://', 'S', '2014-11-17 14:02:33', 'cadastro.Usuario@17f1e8f7', 0.0000),
(167, '0', 'MARIA MARTA DE ASSIS MARTINS ', '', '', '', '', 'RUA ANTONIO BENEDITO DE SOUZA ', '83', 'SÃO JOSE 1', 'RUA MANO', 'CAMPO LIMPO PAULISTA', 'SP', '', '', '4039-3902', '', '', '9 7580-7656', '', '', 'http://', 'S', '2014-11-17 14:25:58', 'cadastro.Usuario@293ec9f2', 0.0000),
(168, '1', 'FEMES FERRAMENTARIA E MAQUINAS ESPECIAIS', '', '66.940.792.0001-92', '', '', 'AVENIDA PACAEMBU ', '1240', 'JARDIM PAULISTA ', '', 'VARZEA PAULISTA', 'SP', '', '', '4606-3015', '', '', '9 8451-4091', '', '', 'http://', 'S', '2014-11-17 14:49:51', 'cadastro.Usuario@138eb4b0', 0.0000),
(169, '1', 'GRAFICA JEDATA ', '', '', '', '', 'RUA ROMA ', '273', 'JARDIM ITALIA ', '', 'VARZEA PAULISTA', 'SP', '', '', '4606-2404', '', '', '', '', 'graficajedata@hotmail.com', 'http://', 'S', '2014-11-17 15:16:32', 'cadastro.Usuario@7e760420', 0.0000),
(170, '0', 'ERIVANIA DA SILVA TEIXEIRA ', '', '', '', '', 'RUA DIORAMA', '51', 'JARDIM AMERICA 4', '', 'VARZEA PAULISTA', 'SP', '', '', '', '', '', '9 9886-8149', '', 'ERIVANIA_TEIXEIRA97@HOTMAIL.COM.BR', 'http://', 'S', '2014-11-17 15:24:27', 'cadastro.Usuario@673ae928', 0.0000),
(171, '1', 'AUTO ELÉTRICA R&S ', '', '', '', '', 'RUA SALVADOR PEDROSO ', '272', 'JARDIM PROMECA ', 'SÃO JOSE', 'VARZEA PAULISTA', 'SP', '', '', '4493-1121', '', '', '9 7588-9142', '', 'autoeletrica.rs@gmail.com', 'http://', 'S', '2014-11-17 15:40:24', 'cadastro.Usuario@49a74c2', 0.0000),
(172, '0', 'GRAZIELE APARECIDA MAZIERO ', '', '', '', '', 'ITAIUPU ', '71', 'PARQUE GUARANI ', '', 'VARZEA PAULISTA', 'SP', '', '', '4493-0621', '', '', '98562-3915', '', 'mAZZAEMBALAGENSEFESTAS@HOTMAIL.COM', 'http://', 'S', '2014-11-17 16:11:32', 'cadastro.Usuario@41b4badb', 0.0000),
(173, '0', 'EVERTON PEREIRA DA SILVA ', '', '', '', '', 'AVENIDA BERTIOGA ', '1682', 'VILA TUPI ', 'SÃO JOSE', 'VARZEA PAULISTA', 'SP', '', '', '', '', '', '9 7364-2217', '', 'eVERTON.NATURA29@HOTMAIL.COM', 'http://', 'S', '2014-11-17 16:30:47', 'cadastro.Usuario@1ffbe958', 0.0000),
(174, '1', 'Cartorio de Registro Civil - Varzea PTA', '', '', '', '', 'rUA MARIA ESTELA ', '53', 'SANTA TEREZINHA', '', 'VARZEA PAULISTA', 'SP', '', '', '4606-1340', '', '', '', '', '', 'http://', 'S', '2014-11-17 16:43:05', 'cadastro.Usuario@7430f34', 0.0000),
(175, '0', 'RODOLFO BELOSO ', '', '', '', '', 'AV FERNAO DIAS PAES LEME ', '525', 'CENTRO', '', 'VARZEA PAULISTA', 'SP', '', '', '', '', '', '97128-5405', '', 'camilav.design@gmail.com', 'http://', 'S', '2014-11-18 09:40:45', 'cadastro.Usuario@1a5de3b', 0.0000),
(176, '0', 'AISLAN FARIAS ', '', '', '', '', 'AVENIDA DO PINHEIRINHO ', '189', 'JARDIM SATELITE ', '', 'VARZEA PAULISTA', 'SP', '', '', '', '', '', '9 9800-0022', '', '', 'http://', 'S', '2014-11-18 10:38:28', 'cadastro.Usuario@6e2885', 0.0000),
(177, '0', 'ANGELICA DUTRA ', '', '', '', '', '', '', '', '', '', 'SP', '', '', '', '', '', '', '', 'angelica.dutra@uol.com.br', 'http://', 'S', '2014-11-18 10:57:10', 'cadastro.Usuario@4cf08286', 0.0000),
(178, '0', 'LUIZ CARLOS SPONCHIADO ', '', '', '', '', 'RUA MOREIRA CESAR', '67', 'VILA ARENS ', '', 'JUNDIAI ', 'SP', '', '', '4587-2182', '', '', '7896-8271', '', 'luiz@lcsponchiado.com.br', 'http://', 'S', '2014-11-18 11:43:17', 'cadastro.Usuario@6540c68b', 0.0000),
(179, '0', 'JAIR BENEDITO MANOEL', '', '068.426.928-73', '', '', 'EST. DO LAGO', '9', 'FIGUEIRA BRANCA', '13230000', 'CAMPO LIMPO PAULISTA', 'SP', '', '', '1140380655', '', '', '11997040661', 'VIVO', '', 'http://', 'S', '2014-11-18 13:02:18', 'cadastro.Usuario@7dd0ae5c', 0.0000),
(180, '0', 'DALVA ADELITA DE MELO', '', '127.830.978-00', '', '', 'RUA ACACIAS MIMOSAS', '335', 'JD BERTIOGA', '13220000', 'VARZEA PAULISTA', 'SP', '', '', '', '', '', '11974873191', 'VIVO', '', 'http://', 'S', '2014-11-18 13:15:05', 'cadastro.Usuario@537eb02a', 0.0000),
(181, '0', 'RENAN FONSECA DA SILVA ', '', '', '', '', 'RUA BIAGIO MARCHETTI ', '61', 'SANTA CATARINA', '', 'CAMPO LIMPO PAULISTA', 'SP', '', '', '', '', '', '9 8213-4634', '', '', 'http://', 'S', '2014-11-18 13:58:30', 'cadastro.Usuario@4df6f6c9', 0.0000),
(182, '0', 'JOANA CARDOSO DE OLIVEIRA ', '', '', '', '', 'RUA VIGARIO AFONSO ', '482', 'CRUZ ALTA ', 'SÃO JOSE', 'VARZEA PAULISTA', 'SP', '', '', '4606-1065', '', '', '', '', '', 'http://', 'S', '2014-11-18 14:10:52', 'cadastro.Usuario@312f0afc', 0.0000),
(183, '0', 'ADENILSON / FABI ', '', '', '', '', 'RUA PIRAJU ', '426', 'JARDIM AMERICA 3', '', 'VARZEA PAULISTA', 'SP', '', '', '9 6486-9756', '97342-1383', '', '4596-2180', '', '', 'http://', 'S', '2014-11-18 14:30:56', 'cadastro.Usuario@472b0241', 0.0000),
(184, '0', 'MADRISAT CLRO ', '', '', '', '', 'AVENIDA FERNÃO DIAS PAES LEME ', 'SÃO JO', 'CENTRO ', 'SÃO JOSE', 'VARZEA PAULISTA', 'SP', '', '', '', '', '', '4595-2256', '', 'ana.paula@madrisat.com.br', 'http://', 'S', '2014-11-18 15:08:22', 'cadastro.Usuario@aca6a3b', 0.0000),
(185, '0', 'AUTO PEÇAS MARQUES', '', '', '', '', 'RUA SEIKE SAITO', '669', 'JD LACERDA', '', 'JUNDIAI', 'SP', '', 'regiane', '4596-9066', '46061844', '', '', '', '', 'http://', 'S', '2014-11-18 15:29:38', 'cadastro.Usuario@7e0552e1', 0.0000),
(186, '0', 'CLEONICE BARBOSA TOME ', '', '', '', '', 'RUA SABARA ', '146', 'JARDIM AMERICA 1', '', 'VARZEA PAULISTA', 'SP', '', '', '4596-1229', '', '', '9 7578-0986', '', '', 'http://', 'S', '2014-11-18 16:04:02', 'cadastro.Usuario@36c1559e', 0.0000),
(187, '0', 'SEBASTIÃO DE SOUZA ', '', '', '', '', 'AVENIDA BARRETOS  ', '615', 'JARDIM AMERICA 3', '', 'VARZEA PAULISTA', 'SP', '', '', '4595-0286', '', '', '9 9677-4765', '', '', 'http://', 'S', '2014-11-18 16:59:48', 'cadastro.Usuario@37f09b11', 0.0000),
(188, '0', 'DIVINO NERI ', '', '', '', '', 'ROSA MARIA FRANCO AMADI ', '156', 'IVOTURUCAIA ', '', 'JUNDIAI', 'SP', '', '', '9 7464-9848', '', '', '965*7006', '', '', 'http://', 'S', '2014-11-18 17:18:18', 'cadastro.Usuario@59546b8d', 0.0000),
(189, '0', 'DJALMA DONIZETTI CLARIANO DA SILVA', '', '', '', '', 'RUA PINTASSILGO', '67', 'JARDIM SANTA LÚCIA', '', 'CAMPO LIMPO PAULISTA', 'SP', '', '', '4038-1765', '', '', '9 9201-6465', '', 'djalmaarcca@msn.com', 'http://', 'S', '2014-11-19 08:38:00', 'cadastro.Usuario@7d48d5b5', 0.0000),
(190, '0', 'MARCELO BELEM -  POSTO DE MOLAS ', '', '', '', '', 'AVENIDA MACAUBA ', '11', 'JARDIM MIRANTE ', '', 'VARZEA PAULISTA', 'SP', '', '', '4595-1427', '', '', '7764-2087', '', 'MGBPOSTODEMOLAS@GMAIL.COM', 'http://', 'S', '2014-11-19 09:39:46', 'cadastro.Usuario@3fb07c7f', 0.0000),
(191, '0', 'LEONEL MIX CREAM', '', '', '', '', 'RUA FLORINDO ZAMBOM ', '1476', 'CIDADE NOVA I', '', 'JUNDIAI', 'SP', '', '', '4533-0667', '', '', '97478-4206', 'VIVO', '', 'http://', 'S', '2014-11-19 09:44:57', 'cadastro.Usuario@2317b41e', 0.0000),
(192, '0', 'ISAIAS SANTOS FERREIRA ', '', '', '', '', 'RUA CIRIEMA ', '585', 'CIDADE NOVA 2', '', 'VARZEA PAULISTA', 'SP', '', '', '4596-3496', '', '', '9 7572-3672', '', '', 'http://', 'S', '2014-11-19 10:17:50', 'cadastro.Usuario@658f211f', 0.0000),
(193, '0', 'RIVALDO SANTANA SILVA', '', '', '', '', 'RUA PARA', '326', 'VILA POPULAR', '13220000', 'VARZEA PAULISTA', 'SP', '', '', '1134469748', '', '', '11974094414', '', '', 'http://', 'S', '2014-11-19 13:16:06', 'cadastro.Usuario@1dc41bf0', 0.0000),
(194, '0', 'JOSEFA SANTOS SILVA ', '', '', '', '', 'RUA CARIOBA ', '235', 'JARDIM MIRANTE ', 'SÃO JOSE', 'VARZEA PAULISTA', 'SP', '', '', '4595-1795', '', '', '9 9782-7448', '', '', 'http://', 'S', '2014-11-19 13:52:34', 'cadastro.Usuario@611b6787', 0.0000),
(195, '0', 'ANDERSON CELESTINO ', '', '', '', '', 'RUA ITAIUPU', '26', 'PARQUE GUARANI', 'SÃO JOSE', 'VARZEA PAULISTA', 'SP', '', '', '4493-2382', '', '', '9 7333-3757', '', 'ander.celestino@gmail.com', 'http://', 'S', '2014-11-19 14:47:13', 'cadastro.Usuario@142da694', 0.0000),
(196, '0', 'VALMIR VAZ DOS SANTOS ', '', '', '', '', 'RUA SERGIPE ', '91', 'VILA POPULAR ', 'SÃO JOSE', 'VARZEA PAULISTA', 'SP', '', '', '4596-1928', '', '', '9 7256-3633', '', '', 'http://', 'S', '2014-11-20 09:35:28', 'cadastro.Usuario@6f23fb39', 0.0000),
(197, '0', 'EMERSON CEGOBIA ', '', '', '', '', '', '', '', '', '', 'SP', '', '', '4587-9971', '', '', '', '', 'emersonumsoideal@hotmail.com', 'http://', 'S', '2014-11-20 10:12:29', 'cadastro.Usuario@6a3330a9', 0.0000),
(198, '0', 'ELZA MARIA GOMES ', '', '', '', '', 'RUA FRANCISCO JOSE SANTANA', '114', 'JARDIM AMERICA 5', '', 'VARZEA PAULISTA', 'SP', '', '', '4606-4548', '', '', '', '', '', 'http://', 'S', '2014-11-20 10:32:42', 'cadastro.Usuario@22dab126', 0.0000),
(199, '0', 'CARLOS DONIZETTI DE SOUZA ', '', '', '', '', 'RUA VOTUPORANGA ', '174', 'JARDIM AMERICA 1', '', 'VARZEA PAULISTA', 'SP', '', '', '9 7588-0345', '', '', '', '', '', 'http://', 'S', '2014-11-20 10:47:11', 'cadastro.Usuario@6daa7da2', 0.0000),
(200, '1', ' LILUKA COMERCIO DE PRESENTES LTDA ME', '', '09.088.624/0001-87', '', '', 'Rua Pintassilgo', '67', 'JARDIM SANTA LÚCIA', '', 'CAMPO LIMPO PAULISTA', 'SP', '', '', '4038-1765', '', '', '9.9201-6465', '', 'djalmaarcca@msn.com', 'http://', 'S', '2014-11-20 11:18:09', 'cadastro.Usuario@50c74fd3', 0.0000),
(201, '0', 'FABIOLA MIRANDA DE OLIVEIRA ', '', '', '', '', 'RUA DAS GAIVOTAS ', '282', 'CIDADE NOVA 2', '', 'VARZEA PAULISTA', 'SP', '', '', '', '', '', '9 9599-9119', '', '', 'http://', 'S', '2014-11-20 11:38:44', 'cadastro.Usuario@1231f8cb', 0.0000),
(202, '0', 'JAQUELINE- POR DO SOL', '', '', '', '', 'ESTRADA DO GRILLO', '376', 'MURSA', '13222000', 'VARZEA PAULISTA', 'SP', '', '', '1146064643', '', '', '1146062791', '', '', 'http://', 'S', '2014-11-20 12:02:17', 'cadastro.Usuario@2fc7f922', 0.0000);
INSERT INTO `cliente` (`clienteID`, `tipoPessoa`, `clienteNomeFantasia`, `clienteRazaoSocial`, `clienteCnpj`, `clienteInscEstadual`, `clienteInscMunicipal`, `clienteEndereco`, `clienteNumero`, `clienteBairro`, `clienteCep`, `clienteCidade`, `clienteUf`, `clienteComplemento`, `clienteContato`, `clienteTelefone`, `clienteFax`, `clienteRadio`, `clienteCelular`, `operadoraCelular`, `clienteEmail`, `clienteSite`, `clienteAtivo`, `clienteData`, `clienteUsuario`, `limiteCredito`) VALUES
(203, '0', 'ENEIAS BARBOSA DA SILVA ', '', '', '', '', 'RUA TIMBO', '37', 'JARDIM AMERICA 1', '', 'VARZEA PAULISTA', 'SP', '', '', '', '', '', '9 8073-6977', '', '', 'http://', 'S', '2014-11-20 13:16:58', 'cadastro.Usuario@4e35c7aa', 0.0000),
(204, '0', 'ROGERIO ANTONIO DA SILVA ', '', '', '', '', 'RUA 24 DE OUTUBRO ', '34', 'VILA MUNICIPAL ', '', 'JUNDIAI ', 'SP', '', '', '', '', '', '7843-4532', '', '', 'http://', 'S', '2014-11-20 13:51:17', 'cadastro.Usuario@150e60a0', 0.0000),
(205, '0', 'JONAS BELIO ORTIZ ', '', '', '', '', 'RUA DAS CINERARIAS ', '38', 'JARDIM BERTIOGA ', '', 'VARZEA PAULISTA', 'SP', '', '', '', '', '', '9 7665-6465', '', 'JONAS.ORTIZ83@GMAIL.COM', 'http://', 'S', '2014-11-20 14:37:30', 'cadastro.Usuario@358ab168', 0.0000),
(206, '1', 'ADV PADOK COMERCIO LTDA ', '', '07.108.626.0001-65', '', '', 'rUA MARIA ESTELA ', '40', 'VILA SANTA TEREZINHA', '', 'VARZEA PAULISTA', 'SP', '', '', '4586-4115', '', '', '', '', '', 'http://', 'S', '2014-11-20 16:34:56', 'cadastro.Usuario@4eaf590', 0.0000),
(208, '0', 'AUTO POSTO 5 M - POSTO CENTENÁRIO ', '', '', '', '', 'RODOVIA DOM GABRIEL PAULINO COUTO', '63', 'DISTRITO INDUSTRIAL ', '', 'JUNDIAI', 'SP', '', '', '4582-8233', '', '', '9 4764-7384 ', '', '', 'http://', 'S', '2014-11-20 16:54:41', 'cadastro.Usuario@77927eea', 0.0000),
(209, '0', 'DE VELLIS MOVEIS ', '', '', '', '', 'AV OLAVO GUIMARAES ', '189', 'VILA ARENS ', 'avenida ', 'JUNDIAI', 'SP', '', '', '4816-2038', '', '', '9 7287-4083', '', 'DEVELLISMOVEIS@GMAIL.COM', 'http://', 'S', '2014-11-21 08:35:41', 'cadastro.Usuario@3aded6c8', 0.0000),
(210, '0', 'BRUNO MAGRINI ', '', '', '', '', 'RUA CAVIUNA ', '206', 'PORTAL DAS PAINEIRAS ', 'SÃO JOSE', 'VARZEA PAULISTA', 'SP', '', '', '4493-1375', '', '', '9 5474-5363 ', '', '', 'http://', 'S', '2014-11-21 08:41:29', 'cadastro.Usuario@3224c01e', 0.0000),
(211, '0', 'CRISTIANO ANTONIO DA SILVA ', '', '', '', '', 'RUA ITAIM ', '212', 'VILA POPULAR ', '', 'VARZEA PAULISTA', 'SP', '', '', '', '', '', '9 7178-7045', '', '', 'http://', 'S', '2014-11-21 09:00:39', 'cadastro.Usuario@343ce3d4', 0.0000),
(212, '0', 'IGREJA ASSEMBLEIA  DE DEUS PERUS ', '', '', '', '', 'VALDOMIRO LOPES DE ALMEIDA ', '137', 'JARDIM SOLANGE ', '', 'CAMPO LIMPO LIMPO', 'SP', '', '', '4038-4264', '', '', '9 7359-3543', '', 'janeteramospimpinella@yahoo.com.br', 'http://', 'S', '2014-11-21 10:39:46', 'cadastro.Usuario@102b9c79', 0.0000),
(213, '0', 'EMERSON BARS  FORTI ', '', '', '', '', 'RUA BELGICA ', '34', 'JARDIM SANTA LUCIA ', '', 'CAMPO LIMPO LIMPO', 'SP', '', '', '', '', '', '9 7386-1873', '', '', 'http://', 'S', '2014-11-21 12:06:50', 'cadastro.Usuario@7834f3d0', 0.0000),
(214, '0', 'VALDOMIRO VIEIRA DOS SANTOS ', '', '', '', '', 'RUA RISCALA CHACUR ', '218', 'JARDIM PROMECA ', '', 'VARZEA PAULISTA', 'SP', '', '', '4596-5365', '', '', '', '', '', 'http://', 'S', '2014-11-21 14:00:37', 'cadastro.Usuario@1e7d033c', 0.0000),
(215, '0', 'PATRICIA OTICA FAMILIA ', '', '', '', '', 'AVENIDA FERNÃO DIAS PAES LEME ', '', 'CENTRO ', '', 'VARZEA PAULISTA', 'SP', '', '', '4595-5281', '', '', '', '', '', 'http://', 'S', '2014-11-21 14:56:43', 'cadastro.Usuario@72fa003', 0.0000),
(216, '0', 'KLEBER RICARDO MARTINS - CYRUS ', '', '', '', '', 'RUA DO RETIRO ', '819', 'ANHANGABAU ', '', 'JUNDIAI ', 'SP', '', '', '2449-4974', '', '', '9 4289-7513', '', '', 'http://', 'S', '2014-11-21 16:27:55', 'cadastro.Usuario@6a8f1cb3', 0.0000),
(217, '0', 'FABIANA CASAMASSA DE LIMA ', '', '', '', '', 'RUA MARIA PAVANELLO BONAMIGO', '12', 'JARDIM VITORIA  ', '', 'CAMPO LIMPO PAULISTA', 'SP', '', '', '4039-4375', '', '', '9 7387-5188', '', 'ALEXEFABIANALIMA@BOL.COM.BR', 'http://', 'S', '2014-11-21 16:48:58', 'cadastro.Usuario@74757bd6', 0.0000),
(218, '0', 'SILVANA SUPER JET ', '', '', '', '', 'RUA PARNAIBA ', '36', 'VILA SÃO PAULO', '', 'JUNDIAI ', 'SP', '', '', '', '', '', '9 8634-2909', '', 'silhpaz@yahoo.com.br', 'http://', 'S', '2014-11-21 17:18:38', 'cadastro.Usuario@44201e2f', 0.0000),
(219, '0', 'EVIO DE AGUIAR PEREIRA', '', '044.329.865-30', '', '', 'RUA GUAPORE', '230', 'JD AMERICA I', '13222000', 'VARZEA PAULISTA', 'SP', '', '', '(11) 2434-2660', '', '', '(11) 9720-91994', '', 'EVIOAGUIAR@GMAIL.COM', 'http://', 'S', '2014-11-22 10:23:16', 'patricia', 0.0000),
(220, '0', 'ALEX - AG SEG SERVICE ', '', '', '', '', '', '', '', '', '', 'SP', '', '', '9 4318-5990', '', '', '97*127847', '', '', 'http://', 'S', '2014-11-24 09:59:47', 'cadastro.Usuario@1a4e869e', 0.0000),
(221, '0', 'PAROQUIA NOSSA SENHORA DE LOURDES ', '', '', '', '', 'RUA JOSE RABELO PORTELA ', '2240', 'VILA POPULAR ', '', 'VARZEA PAULISTA', 'SP', '', '', '4606-2569', '', '', '', '', '', 'http://', 'S', '2014-11-24 12:20:12', 'cadastro.Usuario@56a0cf81', 0.0000),
(222, '0', 'MANOEL SANTOS FILHO', '', '', '', '', 'RUA POTIGUARA', '294', 'VILA TUPI', '13220000', 'VARZEA PAULISTA', 'SP', '', '', '11961885855', '', '', '', '', '', 'http://', 'S', '2014-11-24 12:51:02', 'cadastro.Usuario@48c01cee', 0.0000),
(223, '0', 'GENI SOUZA DA SILVA ', '', '', '', '', 'RUA DAS GAIVOTAS ', '282', 'CIDADE NOVA 2', '', 'VARZEA PAULISTA', 'SP', '', '', '', '', '', '9 7234-2326', '', '', 'http://', 'S', '2014-11-24 15:05:56', 'cadastro.Usuario@34ef1081', 0.0000),
(224, '0', 'LUIZ ANTONIO GOBBO ', '', '', '', '', 'AVENIDA ANTONIO DIGOIA', '1091', 'RESIDENCIAL CALIFORNIA ', '', 'CAMPO LIMPO LIMPO', 'SP', '', '', '', '', '', '9 7299-5232 ', '', '', 'http://', 'S', '2014-11-24 15:17:05', 'cadastro.Usuario@49d6fdce', 0.0000),
(225, '1', 'SOLECAR AUTO POSTO LTDA ', '', '07.357.026/0001-30', '', '', 'AVENIDA MARGINAL DO RIO JUNDIAI ', '2411', 'PONTE SECA ', '', 'VARZEA PAULISTA', 'SP', '', '', '7747-0437 ', '', '', '4521-5891', '', '', 'http://', 'S', '2014-11-24 15:57:18', 'cadastro.Usuario@52efb9ff', 0.0000),
(226, '0', 'PAULA GIMENEZ', '', '', '', '', 'RUA IGARAPES', '163', 'PQ IRAMAIA', '13233211', 'CAMPO LIMPO PAULISTA', 'SP', '', 'PAULA/FRANCISCO', '1140380449', '', '', '', '', '', 'http://', 'S', '2014-11-24 16:18:44', 'cadastro.Usuario@53ee21cf', 0.0000),
(227, '1', 'PREFEITURA  DE BRAGANÇA PAULISTA ', '', '46.352.746/0001-65', '', '', 'AVENIDA ANTONIO PIRES PIMENTEL ', '2015', 'CENTRO', '', 'BRAGANÇA PAULISTA ', 'SP', '', '', '4481-9099', '', '', '', '', ' financeiro.semads@braganca.sp.gov.br', 'http://', 'S', '2014-11-24 16:45:11', 'cadastro.Usuario@3c06d3d9', 0.0000),
(228, '0', 'REGINALDO FRANCISCO DA SILVA', '', '', '', '', 'RUA JOSE PINTO DE TOLEDO ', '610', 'JARDIM PROMECA ', '', 'VARZEA PAULISTA', 'SP', '', '', '2434-4046', '4606-1201', '', '9 9601-6059', '', '', 'http://', 'S', '2014-11-24 18:00:32', 'cadastro.Usuario@5f80c423', 0.0000),
(229, '0', 'PAULINHO BATERIAS ', '', '', '', '', 'AVENIDA DUQUE DE CAXIAS ', '81', 'CENTRO', '', 'VARZEA PAULISTA', 'SP', '', '', '4596-5940', '', '', '89*19051', '', '', 'http://', 'S', '2014-11-25 09:23:07', 'cadastro.Usuario@78a6fc28', 0.0000),
(230, '1', 'GABETTA', 'Empresa Funerária Fausto Caetano LtdaEPP', '49.596.935.0001-71', '', '', 'Rua João Pinheiro', '128', 'Centro', '13280000', 'Vinhedo', 'SP', '', 'Kenner', '(19) 3826-6868', '', '', '', '', 'kenner.almeida@hotmail.com', 'http://', 'S', '2014-11-25 10:04:41', 'patricia', 0.0000),
(231, '0', 'GILMAR RIBEIRO DA SILVA', '', '', '', '', 'RUA GERALDO GUTIERREZ ', '187', 'JARDIM SÃO PAULO ', '', 'VARZEA PAULISTA', 'SP', '', '', '4596-6814', '', '', '9 7231-5881', '', '', 'http://', 'S', '2014-11-25 12:00:29', 'cadastro.Usuario@4c3ee549', 0.0000),
(232, '0', 'LAUDELINO DE SOUZA ', '', '', '', '', 'RUA VICTORIO SPINUCCI ', '304', 'JARDIM PROMECA ', '', 'VARZEA PAULISTA', 'SP', '', '', '4595-1781', '', '', '9 9653-0610', '', '', 'http://', 'S', '2014-11-25 12:20:59', 'cadastro.Usuario@56a15b24', 0.0000),
(233, '1', 'OLIVER MARTINS COLCHOES LTDA ', '', '02.968.321.0001-00', '', '', 'AVENIDA FERNÃO DIAS PAES LEME ', '597', 'CENTRO ', '', 'VARZEA PAULISTA', 'SP', '', '', '4596-1922', '', '', '7006-2114', '', 'preguicacolchoes@gmail.com', 'http://', 'S', '2014-11-25 13:35:45', 'cadastro.Usuario@4a8635af', 0.0000),
(234, '0', 'ROSELI ANSELMO SAVIO', '', '', '', '', 'RUA MOACIR AGERETA ', '221', 'DAS HORTENCIAS', '', 'ITUPEVA', 'SP', '', '', '', '', '', '9 7352-2790', '', '', 'http://', 'S', '2014-11-25 13:37:13', 'cadastro.Usuario@74416925', 0.0000),
(235, '0', 'SHIRLEY ZANETTA ', '', '', '', '', 'RUA CAÇAPAVA ', '269', 'JARDIM AMERICA 2', '', 'VARZEA PAULISTA', 'SP', '', '', '', '', '', '9 6196-5111', '', 'zanauto14@hotmail.com', 'http://', 'S', '2014-11-25 15:31:12', 'cadastro.Usuario@8ecf839', 0.0000),
(236, '0', 'EDITORA JULIA LARISSA ', '', '', '', '', 'rUA ANTENOR AZONIO ', '50', 'MATO DENTRO ', '', 'JUNDIAI ', 'SP', '', '', '', '', '', '9 76878-3849', '', 'edsonfranca@editorajulialarissa.com.br', 'http://', 'S', '2014-11-25 16:24:04', 'cadastro.Usuario@7c420162', 0.0000),
(237, '0', 'RICARDO INOVAK ', '', '', '', '', '', '', '', '', '', 'SP', '', '', '', '', '', '', '', '', 'http://', 'S', '2014-11-25 16:58:10', 'cadastro.Usuario@5c92d17c', 0.0000),
(239, '1', 'PAROQUIA SÃO FRANCISCO DE ASSIS ', '', '50.982.214.0052-29', '', '', 'RUA SÃO JOSE DO RIO PARDO ', '990', 'JARDIM PAULISTA ', '', 'VARZEA PAULISTA', 'SP', '', '', '4596-4977', '', '', '9 7149-1380', '', 'p.j.kim@hotmail.com', 'http://', 'S', '2014-11-25 17:44:33', 'cadastro.Usuario@22917b54', 0.0000),
(240, '1', 'Torrao- Associação Torrao Combate de Esp', '', '17.245.947.0001-65', '', '', 'RUA TANABI ', '676', 'JARDIM AMERICA 3', '', 'VARZEA PAULISTA', 'SP', '', '', '', '', '', '9 701', '', '', 'http://', 'S', '2014-11-25 17:46:11', 'cadastro.Usuario@7d4c7d65', 0.0000);

-- --------------------------------------------------------

--
-- Estrutura da tabela `compras`
--

CREATE TABLE IF NOT EXISTS `compras` (
  `compraID` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `quantidade` int(11) NOT NULL,
  `data` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `compraAtiva` varchar(1) NOT NULL DEFAULT 'S',
  PRIMARY KEY (`compraID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Extraindo dados da tabela `compras`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `contapagar`
--

CREATE TABLE IF NOT EXISTS `contapagar` (
  `contapagarID` int(11) NOT NULL AUTO_INCREMENT,
  `formPagID` int(11) NOT NULL,
  `favorecido` text NOT NULL,
  `valor` float(10,2) NOT NULL,
  `vezes` int(11) NOT NULL,
  `intervalo` int(11) NOT NULL,
  `data` date NOT NULL,
  `usuario` varchar(100) NOT NULL,
  `empresaID` int(11) NOT NULL,
  PRIMARY KEY (`contapagarID`),
  KEY `empresaID` (`empresaID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=24 ;

--
-- Extraindo dados da tabela `contapagar`
--

INSERT INTO `contapagar` (`contapagarID`, `formPagID`, `favorecido`, `valor`, `vezes`, `intervalo`, `data`, `usuario`, `empresaID`) VALUES
(5, 1, 'ALBATROZ', 38.28, 1, 30, '2014-11-10', 'PATRICIA', 1),
(6, 1, 'FAV', 1060.00, 1, 0, '2014-11-17', 'patricia', 1),
(7, 1, 'PROSILK', 1261.20, 1, 0, '2014-11-17', 'patricia', 1),
(8, 1, 'ARTE NOBRE', 4171.00, 2, 30, '2014-11-14', 'patricia', 1),
(9, 1, 'CBA', 777.84, 1, 0, '2014-11-17', 'patricia', 1),
(10, 1, 'SERILON', 2974.80, 1, 0, '2014-11-17', 'patricia', 1),
(11, 4, 'VITRINE', 2000.00, 1, 0, '2014-11-21', 'patricia', 1),
(12, 1, 'DAY BRASIL', 959.99, 1, 0, '2014-11-17', 'patricia', 1),
(13, 1, 'CAMILO VIDROS', 120.00, 2, 22, '2014-11-17', 'patricia', 1),
(14, 1, 'SABESP', 121.58, 1, 0, '2014-12-04', 'patricia', 1),
(15, 4, 'S&#195;O JORGE - BB JC MATAVELLI', 3203.60, 1, 0, '2014-12-18', 'patricia', 1),
(16, 1, 'SERILON', 1235.00, 1, 0, '2014-11-19', 'patricia', 1),
(17, 1, 'TINTAS VÁRZEA', 150.00, 1, 0, '2014-11-12', 'patricia', 1),
(18, 4, 'VALPAR', 1100.00, 1, 0, '2014-11-25', 'patricia', 1),
(19, 1, 'RONDI', 32.90, 1, 0, '2014-11-25', 'patricia', 1),
(20, 3, 'ALBATROZ', 118.80, 1, 0, '2014-11-25', 'patricia', 1),
(21, 3, 'RONDI', 146.36, 1, 0, '2014-11-25', 'patricia', 1),
(22, 3, 'FAV', 1859.05, 1, 0, '2014-11-25', 'patricia', 1),
(23, 3, 'GATTERA', 126.00, 1, 0, '2004-11-25', 'patricia', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `empresa`
--

CREATE TABLE IF NOT EXISTS `empresa` (
  `empresaID` int(11) NOT NULL AUTO_INCREMENT,
  `unidade` varchar(50) NOT NULL,
  `nomeFantasia` varchar(50) NOT NULL,
  `razaoSocial` varchar(80) NOT NULL,
  `ramo` varchar(30) NOT NULL,
  `cnpj` varchar(20) NOT NULL,
  `inscEstadual` varchar(20) NOT NULL,
  `inscMunicipal` varchar(20) NOT NULL,
  `cep` varchar(20) NOT NULL,
  `rua` varchar(50) NOT NULL,
  `numero` varchar(10) NOT NULL,
  `bairro` varchar(30) NOT NULL,
  `cidade` varchar(30) NOT NULL,
  `uf` varchar(2) NOT NULL,
  `complemento` varchar(200) NOT NULL,
  `responsavel` varchar(50) NOT NULL,
  `telefone` varchar(20) NOT NULL,
  `fax` varchar(20) NOT NULL,
  `celular` varchar(20) NOT NULL,
  `operadora` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  `site` varchar(100) NOT NULL,
  `data` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `empresaAtiva` varchar(1) NOT NULL DEFAULT 'S',
  PRIMARY KEY (`empresaID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Extraindo dados da tabela `empresa`
--

INSERT INTO `empresa` (`empresaID`, `unidade`, `nomeFantasia`, `razaoSocial`, `ramo`, `cnpj`, `inscEstadual`, `inscMunicipal`, `cep`, `rua`, `numero`, `bairro`, `cidade`, `uf`, `complemento`, `responsavel`, `telefone`, `fax`, `celular`, `operadora`, `email`, `site`, `data`, `empresaAtiva`) VALUES
(1, 'Mix', 'Mix Publicidade', 'F. R. MATAVELLI - ME', 'Comunicação Visual', '15.346.757/0001-09', '712.051.144.11', '', '13220005', 'RUA SOROCABA', '59', 'SETOR INDUSTRIAL', 'VÁRZEA PAULISTA', 'SP', '', 'ROGERIO MATAVELLI', '(11) 4595-3451', '', '', '', 'mixcomunicacaovisual@hotmail.com', '', '2014-11-11 00:47:35', 'S');

-- --------------------------------------------------------

--
-- Estrutura da tabela `estoque`
--

CREATE TABLE IF NOT EXISTS `estoque` (
  `estoqueID` int(11) NOT NULL AUTO_INCREMENT,
  `fornecedorID` int(11) NOT NULL,
  `produtoID` int(11) NOT NULL,
  `quantidade` float(10,2) NOT NULL,
  `precoCusto` float(10,2) NOT NULL,
  `preco` float(10,2) NOT NULL,
  `lucro` varchar(10) NOT NULL,
  `unidade` varchar(2) NOT NULL,
  `data` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `usuario` varchar(50) NOT NULL,
  `empresaID` int(11) NOT NULL,
  PRIMARY KEY (`estoqueID`),
  KEY `empresaID` (`empresaID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Extraindo dados da tabela `estoque`
--

INSERT INTO `estoque` (`estoqueID`, `fornecedorID`, `produtoID`, `quantidade`, `precoCusto`, `preco`, `lucro`, `unidade`, `data`, `usuario`, `empresaID`) VALUES
(1, 1, 13, 208.00, 4.35, 9.00, '106.90', 'MT', '2014-09-15 14:50:03', 'gerencial', 1),
(2, 1, 16, 162.50, 9.90, 9.90, '0.00', 'MT', '2014-10-10 15:30:22', 'gerencial', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `estoquesobra`
--

CREATE TABLE IF NOT EXISTS `estoquesobra` (
  `estoquesobraID` int(11) NOT NULL AUTO_INCREMENT,
  `produtoID` int(11) NOT NULL,
  `quantidade` float(10,2) NOT NULL,
  `uso` varchar(100) NOT NULL DEFAULT ' ',
  `data` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`estoquesobraID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Extraindo dados da tabela `estoquesobra`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `formapagamento`
--

CREATE TABLE IF NOT EXISTS `formapagamento` (
  `formID` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(50) NOT NULL,
  `formAtivo` varchar(1) NOT NULL DEFAULT 'S',
  PRIMARY KEY (`formID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Extraindo dados da tabela `formapagamento`
--

INSERT INTO `formapagamento` (`formID`, `descricao`, `formAtivo`) VALUES
(1, 'Dinheiro', 'S'),
(2, 'Cartão (Crédito)', 'S'),
(3, 'Cartão (Débito)', 'S'),
(4, 'Cheque (com entrada)', 'S'),
(5, 'Cheque (sem entrada)', 'S'),
(6, 'Boleto', 'S'),
(7, 'Venda Vale', 'S');

-- --------------------------------------------------------

--
-- Estrutura da tabela `fornecedor`
--

CREATE TABLE IF NOT EXISTS `fornecedor` (
  `fornecedorID` int(11) NOT NULL AUTO_INCREMENT,
  `fornNomeFantasia` varchar(40) NOT NULL,
  `fornRazaoSocial` varchar(40) NOT NULL,
  `fornCnpj` varchar(20) NOT NULL,
  `fornInscEstadual` varchar(20) NOT NULL,
  `fornInscMunicipal` varchar(20) NOT NULL,
  `fornEndereco` varchar(40) NOT NULL,
  `fornNumero` varchar(6) NOT NULL,
  `fornBairro` varchar(50) NOT NULL,
  `fornCep` varchar(12) NOT NULL,
  `fornCidade` varchar(20) NOT NULL,
  `fornUf` varchar(2) NOT NULL,
  `fornComplemento` text NOT NULL,
  `fornContato` varchar(30) NOT NULL,
  `fornTelefone` varchar(14) NOT NULL,
  `fornFax` varchar(14) NOT NULL,
  `fornRadio` varchar(15) NOT NULL,
  `fornCelular` varchar(15) NOT NULL,
  `operadoraCelular` varchar(20) NOT NULL,
  `fornEmail` varchar(100) NOT NULL,
  `fornSite` varchar(100) NOT NULL,
  `fornAtivo` varchar(1) NOT NULL DEFAULT 'S',
  `fornData` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fornUsuario` varchar(40) NOT NULL,
  `empresaID` int(11) NOT NULL,
  PRIMARY KEY (`fornecedorID`),
  KEY `empresaID` (`empresaID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Extraindo dados da tabela `fornecedor`
--

INSERT INTO `fornecedor` (`fornecedorID`, `fornNomeFantasia`, `fornRazaoSocial`, `fornCnpj`, `fornInscEstadual`, `fornInscMunicipal`, `fornEndereco`, `fornNumero`, `fornBairro`, `fornCep`, `fornCidade`, `fornUf`, `fornComplemento`, `fornContato`, `fornTelefone`, `fornFax`, `fornRadio`, `fornCelular`, `operadoraCelular`, `fornEmail`, `fornSite`, `fornAtivo`, `fornData`, `fornUsuario`, `empresaID`) VALUES
(1, 'Serilon ', 'Serilon Brasil Ltda', '04.143.008/0034-26', '', '', 'Rua Venancio Gomes dos Reis', '35', 'Jardim Trevo', '13040018', 'Campinas', 'SP', '', 'Alessandro', '(19) 3306-0800', '', '', '', '', 'campinas01@serilon.com.br', 'http://', 'S', '2014-09-13 02:46:24', 'gerencial', 1),
(2, 'VITRINE', 'THEREZINHA FOGLIETTO DA COSTA', '00.011.879/0001-77', '114.026.806.114', '', 'AV DEP. EMÍLIO CARLOS', '1755', 'LIMÃO', '02721100', 'SÃO PAULOS', 'SP', '', 'ALEX/ LUCIA', '(11) 3935-1025', '1139341055', '', '(11) 9851-81822', 'TIM', '', 'http://', 'S', '2014-10-21 10:37:14', 'cadastro.Usuario@3c91c599', 1),
(3, 'ALBATROZ', 'ALBATROZ MATERIAIS TECNICOS TDA', '58.525.999/0001-72', '407.113.018.118', '348733', 'GRACILIANO RAMOS', '575', 'Jd. RIO BRANCO', '13215472', 'JUNDIAI', 'SP', '', 'RITA', '(11) 4522-2195', '', '', '', '', '', 'http://', 'S', '2014-11-14 15:49:06', 'cadastro.Usuario@397ca37c', 1),
(4, 'FAV', 'FAV- FERRO E AÇO', '50.942.622/0001-07', '407.003.072.118', '', 'AV DAS INDUSTRIAS', '755', 'DIST INDUSTRIAL', '13213100', 'JUNDIAÍ', 'SP', '', 'ALEXANDRE', '(11) 4523-5833', '', '', '(11) 4523-5830', '', 'alexandre@favcomercial.com.br', 'http://', 'S', '2014-11-17 12:08:12', 'cadastro.Usuario@20cc279e', 1),
(5, 'DAY BRASIL', 'Day Brasil S/A', '49.327.943/0014-37', ' 206.109.326.11', '', 'AV DR HUMBERTO GIANNELLA', '937', 'JARDIM BELVAL', '06422130', 'BARUERI', 'SP', '', 'TAYNARA', '1136137744', '', '', '', '', '', 'http://', 'S', '2014-11-17 12:11:07', 'cadastro.Usuario@1a0760b0', 1),
(6, 'PROSILK', 'PRO SILK DISTRIBUIDORA DE PRODUTOS SERIG', '05.726.972/0001-81', '244.940.162.117', '', 'RUA MADRE MARIANA DE JESUS SOUSA LEITE', '277', ' JARDIM DOM VIEIRA', '13036270', 'CAMPINAS', 'SP', '', 'RAFAEL', '(19) 2511-5854', '', '', '(11) 2697-02', '', 'rafael@prosilk.com.br', 'http://', 'S', '2014-11-17 12:17:03', 'cadastro.Usuario@4a61378d', 1),
(7, 'ARTE NOBRE', 'ARTE NOBRE IND. COM. E SERV. COM. VIS. ', '03.534.706/0001-21', '298.115.373.116', '', 'EST. SÃO MARCOS', '669', 'JD SÃO MARCOS', '06814010', 'EMBU DAS ARTES', 'SP', '', 'FERNANDA', '(11) 4783-4865', '', '', '', '', 'FERNANDA@ARTENOBRE.COM', 'http://', 'S', '2014-11-17 12:21:38', 'cadastro.Usuario@7d5f9515', 1),
(8, 'CBA', 'COROA INDÚSTRIA E COMERCIO S/A', '08.269.454/0005-06', '407.317.147.115', '', 'ROD. ANHANGUERA', '51', 'TERRA NOVA', '13205700', 'JUNDIAI', 'SP', '', 'VANDERLEIA', '(11) 2136-1316', '', '', '(11) 2136-1346', '', '', 'http://', 'S', '2014-11-17 15:28:22', 'cadastro.Usuario@6528fffc', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `funcionario`
--

CREATE TABLE IF NOT EXISTS `funcionario` (
  `funcionarioID` int(11) NOT NULL AUTO_INCREMENT,
  `cargoID` int(11) NOT NULL,
  `funcionarioNome` varchar(50) NOT NULL,
  `funcionarioNascimento` date NOT NULL,
  `funcionarioRg` varchar(20) NOT NULL,
  `funcionarioCpf` varchar(20) NOT NULL,
  `funcionarioEndereco` varchar(50) NOT NULL,
  `funcionarioNumero` varchar(10) NOT NULL,
  `funcionarioBairro` varchar(50) NOT NULL,
  `funcionarioCep` varchar(15) NOT NULL,
  `funcionarioCidade` varchar(40) NOT NULL,
  `funcionarioUf` varchar(2) NOT NULL,
  `funcionarioComplemento` varchar(100) NOT NULL,
  `funcionarioTelefone` varchar(15) NOT NULL,
  `funcionarioCelular` varchar(15) NOT NULL,
  `operadoraCelular` varchar(30) NOT NULL,
  `funcionarioEmail` varchar(100) NOT NULL,
  `funcionarioData` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `funcionarioUsuario` varchar(40) NOT NULL,
  `funcionarioAtivo` varchar(1) NOT NULL DEFAULT 'S',
  `empresaID` int(11) NOT NULL,
  PRIMARY KEY (`funcionarioID`),
  KEY `cargoID` (`cargoID`),
  KEY `empresaID` (`empresaID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=26 ;

--
-- Extraindo dados da tabela `funcionario`
--

INSERT INTO `funcionario` (`funcionarioID`, `cargoID`, `funcionarioNome`, `funcionarioNascimento`, `funcionarioRg`, `funcionarioCpf`, `funcionarioEndereco`, `funcionarioNumero`, `funcionarioBairro`, `funcionarioCep`, `funcionarioCidade`, `funcionarioUf`, `funcionarioComplemento`, `funcionarioTelefone`, `funcionarioCelular`, `operadoraCelular`, `funcionarioEmail`, `funcionarioData`, `funcionarioUsuario`, `funcionarioAtivo`, `empresaID`) VALUES
(8, 3, 'Patricia Santana', '1986-04-19', '43.257.532-7', '341.228.278-25', 'Rua Tulipas', '105', 'Portal das Hortencias', '13224450', 'VÁRZEA PAULISTA', 'SP', '', '(11) 4595-7790', '(11) 9976-74530', 'VIVO', '', '2014-09-14 23:18:52', 'adm', 'S', 1),
(10, 4, 'Carina Mei Asada', '1991-04-04', '37431157', '394.942.318-48', 'Av Attilio Gobbo', '3955', 'Sta Clara', '13210473', 'Jundiaí', 'SP', '', '(11) 4599-9379', '(11) 9746-48932', 'VIVO', 'asa.mei0404@gmail.com', '2014-10-11 12:37:52', 'patricia', 'S', 1),
(11, 4, 'Felipe César Ferraz', '1991-05-06', '344664272', '409.965.758-20', 'Al. Argentina', '10', 'Vila Didi', '13203390', 'Jundiaí', 'SP', 'cs 11 fundos', '(11) 4526-4579', '(11) 9415-13268', 'VIVO', 'felipe._.ferraz@hotmail.com', '2014-10-11 12:44:47', 'patricia', 'S', 1),
(12, 4, 'Priscila Fernandes Schumacher', '1986-10-17', '43534335x', '350.575.098-02', 'R. Prudente de Moraes', '300', 'Jd. Acacias', '13223400', 'VÁRZEA PAULISTA', 'SP', 'bl2', '(11) 9812-8011', '(11) 9731-12873', 'VIVO', 'tsu.priscila@gmail.com', '2014-10-11 12:47:58', 'patricia', 'S', 1),
(13, 6, 'ALAN DOS SANTOS', '1996-04-01', '49.874.220-9', '458.026.518-14', 'TV GRILLO', '315', 'GUT', '13220000', 'VÁRZEA PAULISTA', 'SP', '', '(11) 4595-3451', '(11) 9733-31384', 'VIVO', '', '2014-10-13 07:07:15', 'patricia', 'S', 1),
(14, 5, 'uilian Saldanha Lima', '1997-07-21', '53.629.587-6', '438.468.368-50', 'TV Grillo', '300', 'Mursa', '13220000', 'Várzea Paulista', 'SP', '', '(11) 4595-3451', '(11) 9975-06050', 'VIVO', '', '2014-10-13 07:35:09', 'patricia', 'S', 1),
(15, 6, 'Marcelo Soares Correia', '1994-12-16', '44.868.879-7', '441.436.888-08', 'Rua Mambai', '241', 'Jd. América III', '13222250', 'Várzea Paulista', 'SP', '', '(11) 4596-4726', '(11) 9415-11505', 'VIVO', '', '2014-10-13 07:55:06', 'patricia', 'S', 1),
(16, 8, 'Gabriela Cristina Silva', '1985-09-04', '44.859.554-0', '329.864.658-03', 'Rua Paracambi', '78', 'Jd. America III', '13220000', 'Várzea Paulista', 'SP', '', '(11) 4606-5293', '(11) 9958-18621', 'VIVO', '', '2014-10-13 11:09:28', 'patricia', 'S', 1),
(17, 9, 'CLEBER DAVID DE BARROS VIEIRA', '1980-06-19', '330026823', '290.060.768-05', 'Orquideas', '76', 'PORTAL DAS HORTENCIAS', '13224450', 'VARZEA PAULISTA', 'SP', '', '(11) 4595-4678', '(11) 9989-77851', 'VIVO', '', '2014-10-27 10:28:58', 'patricia', 'S', 1),
(18, 7, 'Edison Perpetuo Rodrigues', '1980-05-13', '344665926', '298.194.488-67', 'Rua Guara', '137', 'Jd America ', '13222240', 'Várzea Paulista', 'SP', '', '(11) 4595-3451', '(11) 9735-17392', 'VIVO', '', '2014-10-27 11:23:14', 'patricia', 'S', 1),
(19, 10, 'DIEGO FELIPE MAINARDI', '1994-01-14', '412586411', '444.772.068-01', 'Rua das Gaivotas', '167', 'Ciidade Nova II', '13220000', 'Várzea Paulista', 'SP', '', '(11) 4596-4376', '', '', '', '2014-10-29 17:15:23', 'patricia', 'S', 1),
(20, 3, 'Rogerio Matavelli', '1981-05-27', '353724816', '220.311.478-97', 'Rua Manoel Lopes', '33', 'Jardim do Lar', '13220225', 'Várzea Paulista', 'SP', '', '(11) 4595-4532', '(11) 9950-40013', 'VIVO', 'romatavelli@gmail.com', '2014-11-03 14:34:45', 'patricia', 'S', 1),
(21, 6, 'Felipe Souza do Carmo', '1991-05-16', '47406088', '398.193.488-11', 'Rua Tucuna', '512', 'Vila Tupi', '13220000', 'VARZEA PAULISTA', 'SP', '', '(11) 0000-0000', '(11) 9968-15529', 'VIVO', '', '2014-11-05 13:35:48', 'patricia', 'S', 1),
(22, 6, 'José Claudio Pereira Gomes', '1981-02-25', '33443381', '283.332.158-90', 'Rua Jarbas de Azevedo', '41', 'Jd. Vassouras', '13220000', 'Francisco Morato', 'SP', '', '(11) 4881-0881', '(11) 9732-44994', 'VIVO', 'claudio_2011_claudio@hotmail.com', '2014-11-05 15:19:27', 'patricia', 'S', 1),
(23, 10, 'André Luiz Pereira Godoy', '1975-03-09', '24210793x', '261.323.268-47', 'Rua Mercúrio', '522', 'Jd Satélite', '13222000', 'VARZEA PAULISTA', 'SP', '', '(11) 6375-2133', '(11) 9957-50985', '', '', '2014-11-05 15:44:22', 'patricia', 'S', 1),
(24, 10, 'José Nilson de Oliveira', '1969-08-20', '222030720', '102.696.368-03', 'R Botucatu', '108', 'Jd America III', '13222221', 'VARZEA PAULISTA', 'SP', '', '(11) 4606-2148', '(11) 9427-04836', 'VIVO', '', '2014-11-05 16:08:07', 'patricia', 'S', 1),
(25, 7, 'JOABES DE OLIVEIRA CERQUEIRA', '1993-08-17', '408631296', '418.395.578-50', 'Rua Guaiba', '165', 'Jd América I', '13221270', 'Várzea Paulista', 'SP', '', '(11) 4596-4148', '(11) 9686-60240', 'VIVO', '', '2014-11-07 15:30:22', 'patricia', 'S', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `lancamentos`
--

CREATE TABLE IF NOT EXISTS `lancamentos` (
  `lancamentoID` int(11) NOT NULL AUTO_INCREMENT,
  `receberID` int(11) DEFAULT NULL,
  `pagarID` int(11) DEFAULT NULL,
  `vendaID` int(11) DEFAULT NULL,
  `transferenciaID` int(11) DEFAULT NULL,
  `contaPagarID` int(11) DEFAULT NULL,
  `livroID` int(11) NOT NULL,
  `formID` int(11) NOT NULL,
  `valor` float(10,2) NOT NULL,
  `desconto` float(10,2) DEFAULT NULL,
  `acrescimo` float(10,2) DEFAULT NULL,
  `data` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `favorecido` text,
  `observacao` text,
  `tipo` varchar(1) NOT NULL COMMENT 'Ou ''R'' de Recebido Ou ''P'' de Pago Ou ''D'' de Deposito Ou ''T'' de Transferencia Ou ''C'' de Cheque sem Fundo Ou ''S'' de Servico',
  `usuario` varchar(50) NOT NULL,
  `empresaID` int(11) NOT NULL,
  PRIMARY KEY (`lancamentoID`),
  KEY `empresaID` (`empresaID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=267 ;

--
-- Extraindo dados da tabela `lancamentos`
--

INSERT INTO `lancamentos` (`lancamentoID`, `receberID`, `pagarID`, `vendaID`, `transferenciaID`, `contaPagarID`, `livroID`, `formID`, `valor`, `desconto`, `acrescimo`, `data`, `favorecido`, `observacao`, `tipo`, `usuario`, `empresaID`) VALUES
(95, 137, NULL, 233, NULL, NULL, 1, 1, 70.00, NULL, NULL, '2014-11-11 11:23:32', NULL, NULL, 'S', 'gabriela ', 1),
(96, 138, NULL, 234, NULL, NULL, 1, 1, 100.00, NULL, NULL, '2014-11-11 11:50:11', NULL, NULL, 'S', 'gabriela ', 1),
(97, 139, NULL, 235, NULL, NULL, 1, 1, 20.00, NULL, NULL, '2014-11-11 12:02:24', NULL, NULL, 'S', 'gabriela ', 1),
(98, 140, NULL, 238, NULL, NULL, 1, 1, 30.00, NULL, NULL, '2014-11-11 13:03:18', NULL, NULL, 'S', 'patricia', 1),
(99, 141, NULL, 237, NULL, NULL, 1, 1, 117.00, NULL, NULL, '2014-11-11 13:09:10', NULL, NULL, 'S', 'patricia', 1),
(100, 147, NULL, 242, NULL, NULL, 1, 1, 20.00, NULL, NULL, '2014-11-11 15:39:28', NULL, NULL, 'S', 'gabriela ', 1),
(101, 149, NULL, 243, NULL, NULL, 1, 1, 50.00, NULL, NULL, '2014-11-11 15:54:38', NULL, NULL, 'S', 'patricia', 1),
(102, 150, NULL, 245, NULL, NULL, 1, 1, 150.00, NULL, NULL, '2014-11-11 16:09:09', NULL, NULL, 'S', 'patricia', 1),
(103, 155, NULL, 250, NULL, NULL, 1, 1, 10.00, NULL, NULL, '2014-11-11 17:04:58', NULL, NULL, 'S', 'gabriela ', 1),
(104, 157, NULL, 251, NULL, NULL, 1, 1, 17.00, NULL, NULL, '2014-11-11 17:18:58', NULL, NULL, 'S', 'gabriela ', 1),
(105, 158, NULL, 252, NULL, NULL, 1, 1, 20.00, NULL, NULL, '2014-11-11 17:23:16', NULL, NULL, 'S', 'gabriela ', 1),
(106, 160, NULL, 254, NULL, NULL, 1, 1, 15.00, NULL, NULL, '2014-11-12 08:22:42', NULL, NULL, 'S', 'gabriela ', 1),
(107, 161, NULL, 257, NULL, NULL, 1, 1, 70.00, NULL, NULL, '2014-11-12 09:44:36', NULL, NULL, 'S', 'gabriela ', 1),
(108, 162, NULL, 260, NULL, NULL, 1, 1, 30.00, NULL, NULL, '2014-11-12 11:23:37', NULL, NULL, 'S', 'gabriela ', 1),
(109, 163, NULL, 259, NULL, NULL, 1, 1, 20.00, NULL, NULL, '2014-11-12 11:36:06', NULL, NULL, 'S', 'gabriela ', 1),
(110, 165, NULL, 262, NULL, NULL, 1, 1, 20.00, NULL, NULL, '2014-11-12 13:23:25', NULL, NULL, 'S', 'patricia', 1),
(111, 167, NULL, 246, NULL, NULL, 1, 1, 225.00, NULL, NULL, '2014-11-12 15:12:43', NULL, NULL, 'S', 'gabriela ', 1),
(112, 168, NULL, 229, NULL, NULL, 1, 1, 126.00, NULL, NULL, '2014-11-12 15:13:59', NULL, NULL, 'S', 'gabriela ', 1),
(113, 169, NULL, 264, NULL, NULL, 1, 1, 100.00, NULL, NULL, '2014-11-12 15:28:57', NULL, NULL, 'S', 'patricia', 1),
(114, 170, NULL, 258, NULL, NULL, 1, 1, 65.00, NULL, NULL, '2014-11-12 15:41:40', NULL, NULL, 'S', 'patricia', 1),
(115, 171, NULL, 266, NULL, NULL, 1, 1, 30.00, NULL, NULL, '2014-11-12 16:01:01', NULL, NULL, 'S', 'gabriela ', 1),
(116, 172, NULL, 268, NULL, NULL, 1, 1, 78.00, NULL, NULL, '2014-11-12 16:30:11', NULL, NULL, 'S', 'gabriela ', 1),
(117, 173, NULL, 269, NULL, NULL, 1, 1, 50.00, NULL, NULL, '2014-11-12 17:10:37', NULL, NULL, 'S', 'gabriela ', 1),
(118, 176, NULL, 276, NULL, NULL, 1, 1, 35.00, NULL, NULL, '2014-11-13 11:50:50', NULL, NULL, 'S', 'gabriela ', 1),
(119, 177, NULL, 274, NULL, NULL, 1, 1, 320.00, NULL, NULL, '2014-11-13 13:13:41', NULL, NULL, 'S', 'patricia', 1),
(120, 180, NULL, 280, NULL, NULL, 1, 1, 1500.00, NULL, NULL, '2014-11-13 13:45:57', NULL, NULL, 'S', 'patricia', 1),
(121, 182, NULL, 281, NULL, NULL, 1, 1, 25.00, NULL, NULL, '2014-11-13 15:40:42', NULL, NULL, 'S', 'gabriela ', 1),
(122, 159, NULL, 252, NULL, NULL, 1, 7, 5.00, 0.00, 0.00, '2014-11-13 17:04:25', NULL, '', 'R', 'gabriela ', 1),
(123, 183, NULL, 288, NULL, NULL, 1, 1, 80.00, NULL, NULL, '2014-11-13 17:55:17', NULL, NULL, 'S', 'gabriela ', 1),
(124, 184, NULL, 288, NULL, NULL, 1, 1, 80.00, NULL, NULL, '2014-11-13 18:00:26', NULL, NULL, 'S', 'gabriela ', 1),
(125, 185, NULL, 269, NULL, NULL, 1, 1, 90.00, NULL, NULL, '2014-11-14 10:47:15', NULL, NULL, 'S', 'gabriela ', 1),
(126, 174, NULL, 269, NULL, NULL, 1, 7, 40.00, 0.00, 0.00, '2014-11-14 10:48:24', NULL, '', 'R', 'gabriela ', 1),
(127, 186, NULL, 290, NULL, NULL, 1, 1, 160.00, NULL, NULL, '2014-11-14 10:56:13', NULL, NULL, 'S', 'gabriela ', 1),
(128, 187, NULL, 291, NULL, NULL, 1, 1, 1060.00, NULL, NULL, '2014-11-14 11:01:00', NULL, NULL, 'S', 'patricia', 1),
(129, 189, NULL, 295, NULL, NULL, 6, 7, 10000.00, 0.00, 0.00, '2014-11-14 12:05:40', NULL, '', 'R', 'patricia', 1),
(130, 190, NULL, 295, NULL, NULL, 1, 1, 2620.00, NULL, NULL, '2014-11-14 12:06:50', NULL, NULL, 'S', 'patricia', 1),
(131, 192, NULL, 297, NULL, NULL, 1, 1, 17.00, NULL, NULL, '2014-11-14 12:18:35', NULL, NULL, 'S', 'gabriela ', 1),
(132, 193, NULL, 297, NULL, NULL, 1, 1, 17.00, NULL, NULL, '2014-11-14 12:21:11', NULL, NULL, 'S', 'gabriela ', 1),
(133, 188, NULL, 291, NULL, NULL, 1, 4, 0.00, 0.00, 0.00, '2014-11-14 12:46:58', NULL, '', 'S', 'patricia', 1),
(134, 194, NULL, 299, NULL, NULL, 1, 1, 70.00, NULL, NULL, '2014-11-14 12:49:16', NULL, NULL, 'S', 'patricia', 1),
(135, 164, NULL, 259, NULL, NULL, 1, 7, 20.00, 0.00, 0.00, '2014-11-14 12:50:35', NULL, '', 'R', 'patricia', 1),
(136, 195, NULL, 302, NULL, NULL, 1, 1, 225.00, NULL, NULL, '2014-11-14 14:02:12', NULL, NULL, 'S', 'gabriela ', 1),
(137, 197, NULL, 306, NULL, NULL, 1, 1, 80.00, NULL, NULL, '2014-11-14 15:05:22', NULL, NULL, 'S', 'gabriela ', 1),
(138, 198, NULL, 303, NULL, NULL, 1, 1, 80.00, NULL, NULL, '2014-11-14 15:21:56', NULL, NULL, 'S', 'gabriela ', 1),
(139, 199, NULL, 307, NULL, NULL, 1, 1, 50.00, NULL, NULL, '2014-11-14 15:38:24', NULL, NULL, 'S', 'gabriela ', 1),
(140, NULL, 16, NULL, NULL, 5, 1, 1, 38.28, 0.00, 0.00, '2014-11-14 15:52:28', 'ALBATROZ', '', 'P', 'PATRICIA', 1),
(141, 166, NULL, 262, NULL, NULL, 1, 7, 10.00, 0.00, 0.00, '2014-11-14 16:25:28', NULL, '', 'R', 'gabriela ', 1),
(142, 200, NULL, 277, NULL, NULL, 1, 1, 30.00, NULL, NULL, '2014-11-14 16:33:15', NULL, NULL, 'S', 'gabriela ', 1),
(143, 201, NULL, 310, NULL, NULL, 1, 1, 50.00, NULL, NULL, '2014-11-17 09:55:47', NULL, NULL, 'S', 'gabriela ', 1),
(144, 203, NULL, 312, NULL, NULL, 1, 1, 70.00, NULL, NULL, '2014-11-17 10:18:18', NULL, NULL, 'S', 'gabriela ', 1),
(145, 204, NULL, 311, NULL, NULL, 1, 1, 20.00, NULL, NULL, '2014-11-17 10:54:12', NULL, NULL, 'S', 'gabriela ', 1),
(146, 206, NULL, 278, NULL, NULL, 1, 1, 131.00, NULL, NULL, '2014-11-17 11:09:06', NULL, NULL, 'S', 'gabriela ', 1),
(147, 207, NULL, 287, NULL, NULL, 1, 1, 80.00, NULL, NULL, '2014-11-17 11:10:25', NULL, NULL, 'S', 'gabriela ', 1),
(148, 212, NULL, 314, NULL, NULL, 1, 1, 120.00, NULL, NULL, '2014-11-17 11:48:46', NULL, NULL, 'S', 'gabriela ', 1),
(149, 214, NULL, 315, NULL, NULL, 1, 1, 50.00, NULL, NULL, '2014-11-17 11:54:09', NULL, NULL, 'S', 'gabriela ', 1),
(150, 216, NULL, 317, NULL, NULL, 1, 1, 30.00, NULL, NULL, '2014-11-17 12:57:32', NULL, NULL, 'S', 'patricia', 1),
(151, NULL, 19, NULL, NULL, 8, 6, 1, 1000.00, 0.00, 0.00, '2014-11-17 13:00:32', 'ARTE NOBRE', 'pago dia 14/11', 'P', 'patricia', 1),
(152, NULL, 17, NULL, NULL, 6, 6, 1, 1060.00, 0.00, 0.00, '2014-11-17 13:00:50', 'FAV', 'transferencia', 'P', 'patricia', 1),
(153, NULL, 18, NULL, NULL, 7, 6, 1, 1261.20, 0.00, 0.00, '2014-11-17 13:01:15', 'PROSILK', 'Transferencia', 'P', 'patricia', 1),
(154, 217, NULL, 321, NULL, NULL, 1, 1, 45.00, NULL, NULL, '2014-11-17 14:27:16', NULL, NULL, 'S', 'gabriela ', 1),
(155, 218, NULL, 326, NULL, NULL, 1, 1, 90.00, NULL, NULL, '2014-11-17 15:28:18', NULL, NULL, 'S', 'gabriela ', 1),
(156, 220, NULL, 327, NULL, NULL, 1, 1, 30.00, NULL, NULL, '2014-11-17 15:45:58', NULL, NULL, 'S', 'gabriela ', 1),
(157, 221, NULL, 328, NULL, NULL, 1, 1, 300.00, NULL, NULL, '2014-11-17 16:13:44', NULL, NULL, 'S', 'gabriela ', 1),
(158, NULL, 25, NULL, NULL, 13, 1, 1, 100.00, 0.00, 0.00, '2014-11-17 16:37:34', 'CAMILO VIDROS', 'PAINEL VIDRO', 'P', 'patricia', 1),
(159, 223, NULL, 329, NULL, NULL, 1, 1, 25.00, NULL, NULL, '2014-11-17 16:37:46', NULL, NULL, 'S', 'gabriela ', 1),
(160, NULL, 21, NULL, NULL, 9, 6, 1, 777.84, 0.00, 0.00, '2014-11-17 16:38:10', 'CBA', '', 'P', 'patricia', 1),
(161, NULL, 22, NULL, NULL, 10, 6, 1, 2974.80, 0.00, 0.00, '2014-11-17 16:38:17', 'SERILON', '', 'P', 'patricia', 1),
(162, NULL, 24, NULL, NULL, 12, 6, 1, 959.99, 0.00, 0.00, '2014-11-17 16:38:29', 'DAY BRASIL', '', 'P', 'patricia', 1),
(163, 225, NULL, 330, NULL, NULL, 1, 1, 530.00, NULL, NULL, '2014-11-17 16:44:00', NULL, NULL, 'S', 'gabriela ', 1),
(164, 227, NULL, 309, NULL, NULL, 1, 1, 17.00, NULL, NULL, '2014-11-18 08:23:59', NULL, NULL, 'S', 'gabriela ', 1),
(165, 228, NULL, 286, NULL, NULL, 1, 1, 68.00, NULL, NULL, '2014-11-18 08:24:22', NULL, NULL, 'S', 'gabriela ', 1),
(166, 231, NULL, 332, NULL, NULL, 1, 1, 1000.00, NULL, NULL, '2014-11-18 09:06:30', NULL, NULL, 'S', 'gabriela ', 1),
(167, 233, NULL, 279, NULL, NULL, 1, 1, 30.00, NULL, NULL, '2014-11-18 10:32:32', NULL, NULL, 'S', 'gabriela ', 1),
(168, 234, NULL, 279, NULL, NULL, 1, 1, 300.00, NULL, NULL, '2014-11-18 10:33:39', NULL, NULL, 'S', 'gabriela ', 1),
(169, 236, NULL, 334, NULL, NULL, 1, 1, 17.00, NULL, NULL, '2014-11-18 10:40:40', NULL, NULL, 'S', 'gabriela ', 1),
(170, 237, NULL, 338, NULL, NULL, 1, 1, 70.00, NULL, NULL, '2014-11-18 11:47:37', NULL, NULL, 'S', 'gabriela ', 1),
(171, 238, NULL, 339, NULL, NULL, 1, 1, 20.00, NULL, NULL, '2014-11-18 13:03:54', NULL, NULL, 'S', 'patricia', 1),
(172, 239, NULL, 340, NULL, NULL, 1, 1, 10.00, NULL, NULL, '2014-11-18 13:17:06', NULL, NULL, 'S', 'patricia', 1),
(173, 241, NULL, 341, NULL, NULL, 1, 1, 200.00, NULL, NULL, '2014-11-18 14:09:58', NULL, NULL, 'S', 'gabriela ', 1),
(174, 242, NULL, 304, NULL, NULL, 1, 1, 34.00, NULL, NULL, '2014-11-18 14:25:14', NULL, NULL, 'S', 'gabriela ', 1),
(175, 243, NULL, 346, NULL, NULL, 1, 1, 150.00, NULL, NULL, '2014-11-18 15:19:42', NULL, NULL, 'S', 'gabriela ', 1),
(176, 244, NULL, 346, NULL, NULL, 1, 7, 134.00, 0.00, 0.00, '2014-11-18 15:19:56', NULL, '', 'R', 'gabriela ', 1),
(177, 245, NULL, 347, NULL, NULL, 1, 1, 40.00, NULL, NULL, '2014-11-18 15:50:45', NULL, NULL, 'S', 'gabriela ', 1),
(178, 247, NULL, 272, NULL, NULL, 1, 1, 95.00, NULL, NULL, '2014-11-18 16:00:11', NULL, NULL, 'S', 'gabriela ', 1),
(179, 250, NULL, 335, NULL, NULL, 1, 1, 45.00, NULL, NULL, '2014-11-18 16:26:09', NULL, NULL, 'S', 'gabriela ', 1),
(180, 251, NULL, 350, NULL, NULL, 1, 1, 150.00, NULL, NULL, '2014-11-18 17:05:24', NULL, NULL, 'S', 'gabriela ', 1),
(181, 202, NULL, 310, NULL, NULL, 1, 7, 120.00, 0.00, 0.00, '2014-11-18 18:02:31', NULL, '', 'R', 'gabriela ', 1),
(182, 253, NULL, 352, NULL, NULL, 1, 1, 20.00, NULL, NULL, '2014-11-19 08:58:18', NULL, NULL, 'S', 'gabriela ', 1),
(183, 254, NULL, 316, NULL, NULL, 1, 1, 140.00, NULL, NULL, '2014-11-19 09:03:37', NULL, NULL, 'S', 'gabriela ', 1),
(184, 256, NULL, 353, NULL, NULL, 1, 1, 100.00, NULL, NULL, '2014-11-19 09:27:38', NULL, NULL, 'S', 'gabriela ', 1),
(185, 258, NULL, 354, NULL, NULL, 1, 1, 160.00, NULL, NULL, '2014-11-19 09:42:15', NULL, NULL, 'S', 'gabriela ', 1),
(186, 260, NULL, 316, NULL, NULL, 1, 1, 140.00, NULL, NULL, '2014-11-19 10:08:15', NULL, NULL, 'S', 'gabriela ', 1),
(187, 261, NULL, 355, NULL, NULL, 1, 1, 20.00, NULL, NULL, '2014-11-19 10:20:17', NULL, NULL, 'S', 'gabriela ', 1),
(188, 215, NULL, 315, NULL, NULL, 1, 7, 43.00, 0.00, 0.00, '2014-11-19 10:43:56', NULL, '', 'R', 'gabriela ', 1),
(189, 263, NULL, 359, NULL, NULL, 1, 1, 40.00, NULL, NULL, '2014-11-19 13:41:06', NULL, NULL, 'S', 'patricia', 1),
(190, 264, NULL, 360, NULL, NULL, 1, 1, 240.00, NULL, NULL, '2014-11-19 13:55:16', NULL, NULL, 'S', 'gabriela ', 1),
(191, 205, NULL, 311, NULL, NULL, 1, 7, 10.00, 0.00, 0.00, '2014-11-19 14:06:44', NULL, '', 'R', 'gabriela ', 1),
(192, 267, NULL, 361, NULL, NULL, 1, 1, 30.00, NULL, NULL, '2014-11-19 14:49:38', NULL, NULL, 'S', 'gabriela ', 1),
(193, 268, NULL, 361, NULL, NULL, 1, 1, 30.00, NULL, NULL, '2014-11-19 14:50:04', NULL, NULL, 'S', 'gabriela ', 1),
(194, NULL, 29, NULL, NULL, 16, 6, 1, 1235.00, 0.00, 0.00, '2014-11-19 17:52:34', 'SERILON', 'PAGAMENTO CONTA DA MARK', 'P', 'patricia', 1),
(195, 270, NULL, 318, NULL, NULL, 1, 1, 150.00, NULL, NULL, '2014-11-20 09:11:23', NULL, NULL, 'S', 'gabriela ', 1),
(196, 272, NULL, 366, NULL, NULL, 1, 1, 200.00, NULL, NULL, '2014-11-20 10:36:58', NULL, NULL, 'S', 'gabriela ', 1),
(197, 274, NULL, 367, NULL, NULL, 1, 1, 180.00, NULL, NULL, '2014-11-20 10:49:47', NULL, NULL, 'S', 'gabriela ', 1),
(198, 275, NULL, 273, NULL, NULL, 1, 1, 90.00, NULL, NULL, '2014-11-20 11:02:27', NULL, NULL, 'S', 'gabriela ', 1),
(199, 278, NULL, 369, NULL, NULL, 1, 1, 60.00, NULL, NULL, '2014-11-20 13:41:16', NULL, NULL, 'S', 'gabriela ', 1),
(200, 279, NULL, 371, NULL, NULL, 1, 1, 15.00, NULL, NULL, '2014-11-20 13:47:34', NULL, NULL, 'S', 'gabriela ', 1),
(201, 280, NULL, 373, NULL, NULL, 1, 1, 15.00, NULL, NULL, '2014-11-20 13:52:41', NULL, NULL, 'S', 'gabriela ', 1),
(202, 281, NULL, 374, NULL, NULL, 1, 1, 30.00, NULL, NULL, '2014-11-20 14:42:23', NULL, NULL, 'S', 'gabriela ', 1),
(203, 283, NULL, 376, NULL, NULL, 1, 1, 560.00, NULL, NULL, '2014-11-20 16:50:49', NULL, NULL, 'S', 'gabriela ', 1),
(204, 300, NULL, 380, NULL, NULL, 1, 1, 60.00, NULL, NULL, '2014-11-21 09:10:02', NULL, NULL, 'S', 'gabriela ', 1),
(205, 297, NULL, 378, NULL, NULL, 1, 7, 68.00, 0.00, 0.00, '2014-11-21 09:18:55', NULL, '', 'R', 'gabriela ', 1),
(206, 296, NULL, 379, NULL, NULL, 1, 7, 51.00, 0.00, 0.00, '2014-11-21 09:29:35', NULL, '', 'R', 'gabriela ', 1),
(207, 302, NULL, 380, NULL, NULL, 1, 1, 60.00, NULL, NULL, '2014-11-21 09:31:38', NULL, NULL, 'S', 'gabriela ', 1),
(208, 304, NULL, 380, NULL, NULL, 1, 1, 60.00, NULL, NULL, '2014-11-21 09:44:46', NULL, NULL, 'S', 'patricia', 1),
(209, 213, NULL, 314, NULL, NULL, 6, 3, 0.00, 0.00, 0.00, '2014-11-21 09:46:20', NULL, '', 'S', 'patricia', 1),
(210, 224, NULL, 329, NULL, NULL, 6, 3, 20.00, 0.00, 0.00, '2014-11-21 09:47:16', NULL, '', 'S', 'patricia', 1),
(211, 191, NULL, 295, NULL, NULL, 6, 4, 7380.00, 0.00, 0.00, '2014-11-21 09:48:00', NULL, 'DÉBITO E CREDITO', 'S', 'patricia', 1),
(212, 276, NULL, 273, NULL, NULL, 6, 3, 0.00, 0.00, 0.00, '2014-11-21 09:48:14', NULL, '', 'S', 'patricia', 1),
(213, 301, NULL, 380, NULL, NULL, 6, 3, 0.00, 0.00, 0.00, '2014-11-21 09:48:56', NULL, '', 'S', 'patricia', 1),
(214, 303, NULL, 380, NULL, NULL, 6, 3, 0.00, 0.00, 0.00, '2014-11-21 09:49:07', NULL, '', 'S', 'patricia', 1),
(215, 196, NULL, 302, NULL, NULL, 1, 2, 0.00, 0.00, 0.00, '2014-11-21 09:51:01', NULL, '', 'S', 'patricia', 1),
(216, 271, NULL, 318, NULL, NULL, 1, 5, 0.00, 0.00, 0.00, '2014-11-21 09:51:33', NULL, '', 'S', 'patricia', 1),
(217, 314, NULL, 383, NULL, NULL, 1, 1, 30.00, NULL, NULL, '2014-11-21 12:22:49', NULL, NULL, 'S', 'gabriela ', 1),
(218, 311, NULL, 383, NULL, NULL, 1, 7, 30.00, 0.00, 0.00, '2014-11-21 12:23:39', NULL, '', 'R', 'gabriela ', 1),
(219, 315, NULL, 386, NULL, NULL, 1, 7, 100.00, 0.00, 0.00, '2014-11-21 14:03:48', NULL, '', 'R', 'gabriela ', 1),
(220, 317, NULL, 384, NULL, NULL, 1, 1, 7.00, NULL, NULL, '2014-11-21 14:27:43', NULL, NULL, 'S', 'gabriela ', 1),
(221, 312, NULL, 382, NULL, NULL, 1, 7, 30.00, 0.00, 0.00, '2014-11-21 16:21:20', NULL, '', 'R', 'gabriela ', 1),
(222, 319, NULL, 391, NULL, NULL, 1, 7, 185.00, 0.00, 0.00, '2014-11-21 16:38:55', NULL, '', 'R', 'gabriela ', 1),
(223, 320, NULL, 392, NULL, NULL, 6, 7, 1700.00, 0.00, 0.00, '2014-11-21 17:31:44', NULL, '', 'R', 'gabriela ', 1),
(224, 321, NULL, 388, NULL, NULL, 1, 1, 302.00, NULL, NULL, '2014-11-21 17:47:30', NULL, NULL, 'S', 'PATRICIA', 1),
(225, 331, NULL, 395, NULL, NULL, 1, 1, 20.00, NULL, NULL, '2014-11-22 10:14:53', NULL, NULL, 'S', 'patricia', 1),
(226, NULL, 23, NULL, NULL, 11, 6, 4, 2000.00, 0.00, 0.00, '2014-11-22 10:16:31', 'VITRINE', '', 'P', 'patricia', 1),
(227, NULL, 30, NULL, NULL, 17, 6, 1, 150.00, 0.00, 0.00, '2014-11-22 10:16:40', 'TINTAS VÁRZEA', '', 'P', 'patricia', 1),
(228, 332, NULL, 396, NULL, NULL, 1, 1, 20.00, NULL, NULL, '2014-11-22 10:32:14', NULL, NULL, 'S', 'patricia', 1),
(229, 316, NULL, 333, NULL, NULL, 1, 7, 40.00, 0.00, 0.00, '2014-11-22 10:50:06', NULL, '', 'S', 'patricia', 1),
(230, 335, NULL, 333, NULL, NULL, 1, 1, 40.00, NULL, NULL, '2014-11-22 12:59:02', NULL, NULL, 'S', 'patricia', 1),
(231, 337, NULL, 398, NULL, NULL, 1, 1, 10.00, NULL, NULL, '2014-11-24 10:42:23', NULL, NULL, 'S', 'gabriela ', 1),
(232, 339, NULL, 404, NULL, NULL, 1, 1, 25.00, NULL, NULL, '2014-11-24 12:52:20', NULL, NULL, 'S', 'patricia', 1),
(233, 257, NULL, 353, NULL, NULL, 1, 7, 57.00, 0.00, 0.00, '2014-11-24 14:12:27', NULL, '', 'R', 'gabriela ', 1),
(234, 284, NULL, 375, NULL, NULL, 1, 7, 243.00, 0.00, 0.00, '2014-11-24 14:38:17', NULL, '', 'R', 'gabriela ', 1),
(235, 341, NULL, 406, NULL, NULL, 1, 7, 68.00, 0.00, 0.00, '2014-11-24 15:18:42', NULL, '', 'R', 'gabriela ', 1),
(236, 342, NULL, 319, NULL, NULL, 1, 1, 25.00, NULL, NULL, '2014-11-24 15:22:49', NULL, NULL, 'S', 'patricia', 1),
(237, 343, NULL, 407, NULL, NULL, 1, 1, 302.50, NULL, NULL, '2014-11-24 16:02:23', NULL, NULL, 'S', 'gabriela ', 1),
(238, 288, NULL, 365, NULL, NULL, 6, 7, 324.00, 0.00, 0.00, '2014-11-24 16:36:52', NULL, '', 'R', 'gabriela ', 1),
(239, 340, NULL, 345, NULL, NULL, 1, 7, 4.00, 0.00, 0.00, '2014-11-24 16:50:57', NULL, '', 'R', 'gabriela ', 1),
(240, 350, NULL, 407, NULL, NULL, 1, 1, 312.50, NULL, NULL, '2014-11-24 17:05:55', NULL, NULL, 'S', 'gabriela ', 1),
(241, 240, NULL, 340, NULL, NULL, 1, 7, 20.00, 0.00, 0.00, '2014-11-24 17:41:06', NULL, '', 'R', 'gabriela ', 1),
(242, NULL, 31, NULL, NULL, 18, 6, 4, 1100.00, 0.00, 0.00, '2014-11-25 11:09:06', 'VALPAR', 'CHEQUES DE CLIENTES', 'P', 'patricia', 1),
(243, 355, NULL, 372, NULL, NULL, 1, 1, 576.00, NULL, NULL, '2014-11-25 12:07:23', NULL, NULL, 'S', 'gabriela ', 1),
(244, 357, NULL, 416, NULL, NULL, 1, 7, 10.00, 0.00, 0.00, '2014-11-25 12:26:32', NULL, '', 'R', 'gabriela ', 1),
(245, 359, NULL, 417, NULL, NULL, 1, 7, 35.00, 0.00, 0.00, '2014-11-25 13:41:21', NULL, '', 'R', 'gabriela ', 1),
(246, 361, NULL, 351, NULL, NULL, 1, 7, 460.00, 0.00, 0.00, '2014-11-25 15:24:38', NULL, '', 'R', 'gabriela ', 1),
(247, 290, NULL, 362, NULL, NULL, 6, 7, 276.00, 0.00, 0.00, '2014-11-25 15:37:34', NULL, 'PAGO ', 'S', 'patricia', 1),
(248, 287, NULL, 372, NULL, NULL, 6, 7, 660.00, 0.00, 0.00, '2014-11-25 15:38:21', NULL, 'DEBITO', 'S', 'patricia', 1),
(249, 366, NULL, 412, NULL, NULL, 1, 1, 1000.00, NULL, NULL, '2014-11-25 15:42:51', NULL, NULL, 'S', 'patricia', 1),
(250, 353, NULL, 325, NULL, NULL, 1, 7, 45.00, 0.00, 0.00, '2014-11-25 15:46:41', NULL, '', 'R', 'gabriela ', 1),
(251, 363, NULL, 420, NULL, NULL, 6, 7, 8.50, 0.00, 0.00, '2014-11-25 15:59:13', NULL, '', 'R', 'gabriela ', 1),
(252, 364, NULL, 420, NULL, NULL, 6, 7, 8.50, 0.00, 0.00, '2014-11-25 15:59:18', NULL, '', 'R', 'gabriela ', 1),
(253, 259, NULL, 354, NULL, NULL, 1, 5, 150.00, 0.00, 0.00, '2014-11-25 16:14:51', NULL, 'PAGO CHEQUE BRADESCO(237) AG: 1962 CONTA 034470 ', 'S', 'patricia', 1),
(254, 369, NULL, 423, NULL, NULL, 1, 7, 17.00, 0.00, 0.00, '2014-11-25 16:33:11', NULL, '', 'R', 'gabriela ', 1),
(255, NULL, 32, NULL, NULL, 19, 1, 1, 32.90, 0.00, 0.00, '2014-11-25 16:37:36', 'RONDI', '', 'P', 'patricia', 1),
(256, NULL, 33, NULL, NULL, 20, 6, 3, 118.80, 0.00, 0.00, '2014-11-25 16:41:36', 'ALBATROZ', '', 'P', 'patricia', 1),
(257, NULL, 34, NULL, NULL, 21, 6, 3, 146.36, 0.00, 0.00, '2014-11-25 16:46:54', 'RONDI', '', 'P', 'patricia', 1),
(258, NULL, 35, NULL, NULL, 22, 6, 3, 1859.05, 0.00, 0.00, '2014-11-25 16:47:03', 'FAV', '', 'P', 'patricia', 1),
(259, 370, NULL, 391, NULL, NULL, 1, 1, 100.00, NULL, NULL, '2014-11-25 16:50:24', NULL, NULL, 'S', 'patricia', 1),
(260, 371, NULL, 391, NULL, NULL, 1, 7, 42.50, 0.00, 0.00, '2014-11-25 16:53:00', NULL, '', 'R', 'gabriela ', 1),
(261, 372, NULL, 391, NULL, NULL, 1, 7, 42.50, 0.00, 0.00, '2014-11-25 16:53:05', NULL, '', 'R', 'gabriela ', 1),
(262, 373, NULL, 424, NULL, NULL, 1, 7, 80.00, 0.00, 0.00, '2014-11-25 16:59:37', NULL, '', 'R', 'gabriela ', 1),
(263, 156, NULL, 250, NULL, NULL, 1, 7, 7.00, 0.00, 0.00, '2014-11-25 17:11:48', NULL, '', 'R', 'gabriela ', 1),
(264, 307, NULL, 249, NULL, NULL, 1, 7, 300.00, 0.00, 0.00, '2014-11-25 17:26:28', NULL, '', 'R', 'gabriela ', 1),
(265, 333, NULL, 396, NULL, NULL, 1, 7, 7.00, 0.00, 0.00, '2014-11-25 17:46:44', NULL, '', 'R', 'gabriela ', 1),
(266, 334, NULL, 396, NULL, NULL, 1, 7, 7.00, 0.00, 0.00, '2014-11-25 17:46:49', NULL, '', 'R', 'gabriela ', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `livrocaixa`
--

CREATE TABLE IF NOT EXISTS `livrocaixa` (
  `livroID` int(11) NOT NULL AUTO_INCREMENT,
  `banco` varchar(50) NOT NULL,
  `descricao` text NOT NULL,
  `valorInicial` float(10,2) NOT NULL,
  `dataInicio` date NOT NULL,
  `ultimoLancamento` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `saldo` float(14,2) NOT NULL,
  `status` varchar(1) NOT NULL DEFAULT 'S',
  PRIMARY KEY (`livroID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Extraindo dados da tabela `livrocaixa`
--

INSERT INTO `livrocaixa` (`livroID`, `banco`, `descricao`, `valorInicial`, `dataInicio`, `ultimoLancamento`, `saldo`, `status`) VALUES
(1, 'Loja', '', 0.00, '2014-09-14', '2014-11-25 17:46:49', 19543.32, 'S'),
(5, 'Santander', '', 0.00, '2014-11-11', '2014-11-11 13:29:52', 0.00, 'S'),
(6, 'Banco Brasil', '', 0.00, '2014-11-11', '2014-11-25 16:47:03', 5733.96, 'S');

-- --------------------------------------------------------

--
-- Estrutura da tabela `nivelusuario`
--

CREATE TABLE IF NOT EXISTS `nivelusuario` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `status` varchar(1) NOT NULL,
  `IDUsuario` int(11) NOT NULL,
  `servicoID` int(11) NOT NULL,
  `ano` year(4) NOT NULL,
  `dataAlteracao` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `nivelUsuario` int(11) NOT NULL,
  `passo` varchar(255) NOT NULL DEFAULT 'NOVO',
  `dataAgendamento` varchar(20) DEFAULT '0',
  `obsAgendamento` varchar(255) DEFAULT NULL,
  `obsOrcamento` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `idx_1` (`servicoID`,`status`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COMMENT='TAbela para controle de ordem de serviços' AUTO_INCREMENT=2161 ;

--
-- Extraindo dados da tabela `nivelusuario`
--

INSERT INTO `nivelusuario` (`ID`, `status`, `IDUsuario`, `servicoID`, `ano`, `dataAlteracao`, `nivelUsuario`, `passo`, `dataAgendamento`, `obsAgendamento`, `obsOrcamento`) VALUES
(948, 'V', 12, 230, 2014, '2014-11-11 10:05:33', 3, 'NOVO', '0', NULL, NULL),
(949, 'F', 12, 230, 2014, '2014-11-11 10:08:11', 3, 'IMPRESSAO', '0', NULL, NULL),
(950, 'V', 13, 226, 2014, '2014-11-11 10:23:18', 3, 'NOVO', '0', NULL, NULL),
(951, 'F', 13, 226, 2014, '2014-11-11 10:45:40', 3, 'IMPRESSAO', '0', NULL, NULL),
(952, 'V', 11, 226, 2014, '2014-11-11 11:01:59', 4, 'NOVO', '0', NULL, NULL),
(953, 'V', 11, 230, 2014, '2014-11-11 11:02:28', 4, 'NOVO', '0', NULL, NULL),
(954, 'F', 11, 226, 2014, '2014-11-11 11:04:15', 4, 'ACABAMENTO', '0', NULL, NULL),
(955, 'V', 13, 232, 2014, '2014-11-11 11:12:58', 3, 'NOVO', '0', NULL, NULL),
(956, 'V', 13, 229, 2014, '2014-11-11 11:13:33', 3, 'NOVO', '0', NULL, NULL),
(957, 'V', 13, 228, 2014, '2014-11-11 11:13:39', 3, 'NOVO', '0', NULL, NULL),
(958, 'F', 13, 232, 2014, '2014-11-11 11:16:57', 3, 'IMPRESSAO', '0', NULL, NULL),
(959, 'V', 12, 231, 2014, '2014-11-11 11:20:55', 3, 'NOVO', '0', NULL, NULL),
(960, 'V', 12, 233, 2014, '2014-11-11 11:25:43', 3, 'NOVO', '0', NULL, NULL),
(961, 'F', 12, 233, 2014, '2014-11-11 11:26:44', 3, 'IMPRESSAO', '0', NULL, NULL),
(962, 'V', 11, 233, 2014, '2014-11-11 11:39:59', 4, 'NOVO', '0', NULL, NULL),
(963, 'F', 11, 233, 2014, '2014-11-11 11:41:20', 4, 'ACABAMENTO', '0', NULL, NULL),
(964, 'V', 15, 235, 2014, '2014-11-11 12:27:56', 3, 'NOVO', '0', NULL, NULL),
(965, 'F', 15, 235, 2014, '2014-11-11 12:30:40', 3, 'IMPRESSAO', '0', NULL, NULL),
(966, 'V', 15, 234, 2014, '2014-11-11 12:30:43', 3, 'NOVO', '0', NULL, NULL),
(967, 'F', 15, 234, 2014, '2014-11-11 12:31:57', 3, 'IMPRESSAO', '0', NULL, NULL),
(968, 'F', 15, 231, 2014, '2014-11-11 12:34:16', 3, 'IMPRESSAO', '0', NULL, NULL),
(969, 'V', 13, 238, 2014, '2014-11-11 13:03:27', 3, 'NOVO', '0', NULL, NULL),
(970, 'F', 13, 238, 2014, '2014-11-11 13:04:26', 3, 'IMPRESSAO', '0', NULL, NULL),
(971, 'V', 11, 235, 2014, '2014-11-11 13:08:14', 4, 'NOVO', '0', NULL, NULL),
(972, 'V', 11, 234, 2014, '2014-11-11 13:09:50', 4, 'NOVO', '0', NULL, NULL),
(973, 'F', 11, 234, 2014, '2014-11-11 13:32:36', 4, 'ACABAMENTO', '0', NULL, NULL),
(974, 'F', 11, 235, 2014, '2014-11-11 13:32:40', 4, 'ACABAMENTO', '0', NULL, NULL),
(975, 'V', 11, 238, 2014, '2014-11-11 13:32:43', 4, 'NOVO', '0', NULL, NULL),
(976, 'V', 12, 237, 2014, '2014-11-11 13:39:53', 3, 'NOVO', '0', NULL, NULL),
(977, 'F', 12, 237, 2014, '2014-11-11 13:40:03', 3, 'PRD/IMPRESSAO', '0', NULL, NULL),
(978, 'V', 12, 236, 2014, '2014-11-11 13:40:06', 3, 'NOVO', '0', NULL, NULL),
(979, 'F', 12, 236, 2014, '2014-11-11 13:40:34', 3, 'PRD/IMPRESSAO', '0', NULL, NULL),
(980, 'F', 11, 238, 2014, '2014-11-11 13:41:52', 4, 'ACABAMENTO', '0', NULL, NULL),
(981, 'V', 11, 237, 2014, '2014-11-11 13:41:56', 4, 'NOVO', '0', NULL, NULL),
(982, 'V', 11, 236, 2014, '2014-11-11 13:42:02', 4, 'NOVO', '0', NULL, NULL),
(983, 'V', 11, 232, 2014, '2014-11-11 13:42:09', 4, 'NOVO', '0', NULL, NULL),
(984, 'F', 11, 232, 2014, '2014-11-11 15:01:54', 4, 'ACABAMENTO', '0', NULL, NULL),
(985, 'V', 11, 231, 2014, '2014-11-11 15:02:09', 4, 'NOVO', '0', NULL, NULL),
(986, 'V', 17, 238, 2014, '2014-11-11 15:04:00', 5, 'NOVO', '0', NULL, NULL),
(987, 'V', 17, 235, 2014, '2014-11-11 15:04:14', 5, 'NOVO', '0', NULL, NULL),
(988, 'V', 17, 234, 2014, '2014-11-11 15:04:20', 5, 'NOVO', '0', NULL, NULL),
(989, 'V', 17, 233, 2014, '2014-11-11 15:04:32', 5, 'NOVO', '0', NULL, NULL),
(990, 'V', 17, 232, 2014, '2014-11-11 15:04:42', 5, 'NOVO', '0', NULL, NULL),
(991, 'V', 17, 232, 2014, '2014-11-11 15:05:01', 5, 'NOVO', '0', NULL, NULL),
(992, 'V', 17, 226, 2014, '2014-11-11 15:05:08', 5, 'NOVO', '0', NULL, NULL),
(993, 'F', 13, 229, 2014, '2014-11-11 15:19:30', 3, 'IMPRESSAO', '0', NULL, NULL),
(994, 'V', 12, 241, 2014, '2014-11-11 15:22:10', 3, 'NOVO', '0', NULL, NULL),
(995, 'F', 12, 241, 2014, '2014-11-11 15:23:43', 3, 'IMPRESSAO', '0', NULL, NULL),
(996, 'V', 12, 240, 2014, '2014-11-11 15:29:10', 3, 'NOVO', '0', NULL, NULL),
(997, 'F', 12, 240, 2014, '2014-11-11 15:30:18', 3, 'IMPRESSAO', '0', NULL, NULL),
(998, 'V', 13, 242, 2014, '2014-11-11 15:38:24', 3, 'NOVO', '0', NULL, NULL),
(999, 'F', 13, 242, 2014, '2014-11-11 15:42:58', 3, 'IMPRESSAO', '0', NULL, NULL),
(1000, 'V', 8, 243, 2014, '2014-11-11 15:53:59', 1, 'NOVO', '0', NULL, NULL),
(1001, 'F', 17, 238, 2014, '2014-11-11 15:56:05', 5, 'FINALIZADO', '0', NULL, NULL),
(1002, 'V', 11, 240, 2014, '2014-11-11 15:56:12', 4, 'NOVO', '0', NULL, NULL),
(1003, 'F', 17, 235, 2014, '2014-11-11 15:56:25', 5, 'FINALIZADO', '0', NULL, NULL),
(1004, 'F', 17, 234, 2014, '2014-11-11 15:57:57', 5, 'FINALIZADO', '0', NULL, NULL),
(1005, 'F', 17, 233, 2014, '2014-11-11 15:58:28', 5, 'FINALIZADO', '0', NULL, NULL),
(1006, 'F', 17, 226, 2014, '2014-11-11 15:59:01', 5, 'FINALIZADO', '0', NULL, NULL),
(1007, 'F', 12, 243, 2014, '2014-11-11 16:15:45', 3, 'IMPRESSAO', '0', NULL, NULL),
(1008, 'V', 12, 245, 2014, '2014-11-11 16:15:54', 3, 'NOVO', '0', NULL, NULL),
(1009, 'F', 12, 245, 2014, '2014-11-11 16:16:04', 3, 'IMPRESSAO', '0', NULL, NULL),
(1010, 'V', 12, 244, 2014, '2014-11-11 16:16:11', 3, 'NOVO', '0', NULL, NULL),
(1011, 'V', 12, 244, 2014, '2014-11-11 16:16:15', 3, 'NOVO', '0', NULL, NULL),
(1012, 'F', 12, 244, 2014, '2014-11-11 16:16:23', 3, 'IMPRESSAO', '0', NULL, NULL),
(1013, 'V', 12, 246, 2014, '2014-11-11 16:16:41', 3, 'NOVO', '0', NULL, NULL),
(1014, 'V', 12, 246, 2014, '2014-11-11 16:17:06', 3, 'NOVO', '0', NULL, NULL),
(1015, 'V', 11, 245, 2014, '2014-11-11 16:17:14', 4, 'NOVO', '0', NULL, NULL),
(1016, 'F', 12, 246, 2014, '2014-11-11 16:17:15', 3, 'IMPRESSAO', '0', NULL, NULL),
(1017, 'V', 11, 244, 2014, '2014-11-11 16:17:22', 4, 'NOVO', '0', NULL, NULL),
(1018, 'V', 11, 243, 2014, '2014-11-11 16:17:28', 4, 'NOVO', '0', NULL, NULL),
(1019, 'F', 11, 245, 2014, '2014-11-11 16:17:33', 4, 'ACABAMENTO', '0', NULL, NULL),
(1020, 'F', 11, 244, 2014, '2014-11-11 16:17:38', 4, 'ACABAMENTO', '0', NULL, NULL),
(1021, 'F', 11, 243, 2014, '2014-11-11 16:17:41', 4, 'ACABAMENTO', '0', NULL, NULL),
(1022, 'V', 17, 245, 2014, '2014-11-11 16:17:58', 5, 'NOVO', '0', NULL, NULL),
(1023, 'V', 17, 244, 2014, '2014-11-11 16:18:02', 5, 'NOVO', '0', NULL, NULL),
(1024, 'V', 17, 243, 2014, '2014-11-11 16:18:07', 5, 'NOVO', '0', NULL, NULL),
(1025, 'F', 17, 245, 2014, '2014-11-11 16:18:11', 5, 'FINALIZADO', '0', NULL, NULL),
(1026, 'F', 17, 244, 2014, '2014-11-11 16:18:13', 5, 'FINALIZADO', '0', NULL, NULL),
(1027, 'F', 17, 243, 2014, '2014-11-11 16:18:16', 5, 'FINALIZADO', '0', NULL, NULL),
(1028, 'V', 8, 245, 2014, '2014-11-11 16:18:38', 1, 'NOVO', '0', NULL, NULL),
(1029, 'F', 8, 245, 2014, '2014-11-11 16:18:46', 1, 'FINALIZADO', '0', NULL, NULL),
(1030, 'V', 8, 244, 2014, '2014-11-11 16:18:52', 1, 'NOVO', '0', NULL, NULL),
(1031, 'F', 8, 244, 2014, '2014-11-11 16:19:01', 1, 'FINALIZADO', '0', NULL, NULL),
(1032, 'V', 8, 243, 2014, '2014-11-11 16:19:59', 1, 'NOVO', '0', NULL, NULL),
(1033, 'F', 8, 243, 2014, '2014-11-11 16:20:09', 1, 'FINALIZADO', '0', NULL, NULL),
(1034, 'V', 13, 248, 2014, '2014-11-11 16:32:48', 3, 'NOVO', '0', NULL, NULL),
(1035, 'F', 13, 248, 2014, '2014-11-11 16:38:11', 3, 'IMPRESSAO', '0', NULL, NULL),
(1036, 'V', 13, 249, 2014, '2014-11-11 16:38:15', 3, 'NOVO', '0', NULL, NULL),
(1037, 'V', 11, 229, 2014, '2014-11-11 16:51:56', 4, 'NOVO', '0', NULL, NULL),
(1038, 'V', 11, 228, 2014, '2014-11-11 16:53:21', 4, 'NOVO', '0', NULL, NULL),
(1039, 'V', 11, 246, 2014, '2014-11-11 16:54:09', 4, 'NOVO', '0', NULL, NULL),
(1040, 'F', 13, 249, 2014, '2014-11-11 17:02:45', 3, 'IMPRESSAO', '0', NULL, NULL),
(1041, 'V', 13, 250, 2014, '2014-11-11 17:03:00', 3, 'NOVO', '0', NULL, NULL),
(1042, 'V', 12, 247, 2014, '2014-11-11 17:14:17', 3, 'NOVO', '0', NULL, NULL),
(1043, 'V', 12, 251, 2014, '2014-11-11 17:18:05', 3, 'NOVO', '0', NULL, NULL),
(1044, 'F', 12, 251, 2014, '2014-11-11 17:18:48', 3, 'IMPRESSAO', '0', NULL, NULL),
(1045, 'F', 13, 250, 2014, '2014-11-11 17:20:08', 3, 'IMPRESSAO', '0', NULL, NULL),
(1046, 'V', 13, 252, 2014, '2014-11-11 17:25:53', 3, 'NOVO', '0', NULL, NULL),
(1047, 'F', 13, 252, 2014, '2014-11-11 17:36:57', 3, 'IMPRESSAO', '0', NULL, NULL),
(1048, 'V', 13, 239, 2014, '2014-11-11 17:37:24', 3, 'NOVO', '0', NULL, NULL),
(1049, 'F', 11, 229, 2014, '2014-11-11 17:44:26', 4, 'ACABAMENTO', '0', NULL, NULL),
(1050, 'F', 11, 228, 2014, '2014-11-11 17:44:30', 4, 'ACABAMENTO', '0', NULL, NULL),
(1051, 'V', 11, 241, 2014, '2014-11-11 17:44:58', 4, 'NOVO', '0', NULL, NULL),
(1052, 'V', 11, 242, 2014, '2014-11-11 17:45:14', 4, 'NOVO', '0', NULL, NULL),
(1053, 'V', 11, 248, 2014, '2014-11-11 17:45:26', 4, 'NOVO', '0', NULL, NULL),
(1054, 'V', 11, 250, 2014, '2014-11-11 17:45:37', 4, 'NOVO', '0', NULL, NULL),
(1055, 'V', 11, 252, 2014, '2014-11-11 17:45:47', 4, 'NOVO', '0', NULL, NULL),
(1056, 'V', 17, 229, 2014, '2014-11-12 08:12:59', 5, 'NOVO', '0', NULL, NULL),
(1057, 'V', 17, 228, 2014, '2014-11-12 08:13:10', 5, 'NOVO', '0', NULL, NULL),
(1058, 'F', 17, 232, 2014, '2014-11-12 08:13:28', 5, 'FINALIZADO', '0', NULL, NULL),
(1059, 'F', 15, 247, 2014, '2014-11-12 08:33:39', 3, 'PRD/IMPRESSAO', '0', NULL, NULL),
(1060, 'V', 15, 254, 2014, '2014-11-12 08:45:17', 3, 'NOVO', '0', NULL, NULL),
(1061, 'F', 15, 254, 2014, '2014-11-12 08:45:22', 3, 'IMPRESSAO', '0', NULL, NULL),
(1062, 'V', 15, 254, 2014, '2014-11-12 08:46:12', 3, 'NOVO', '0', NULL, NULL),
(1063, 'V', 12, 255, 2014, '2014-11-12 09:05:54', 3, 'NOVO', '0', NULL, NULL),
(1064, 'F', 13, 239, 2014, '2014-11-12 09:06:50', 3, 'IMPRESSAO', '0', NULL, NULL),
(1065, 'V', 13, 227, 2014, '2014-11-12 09:06:55', 3, 'NOVO', '0', NULL, NULL),
(1066, 'V', 13, 253, 2014, '2014-11-12 09:07:05', 3, 'NOVO', '0', NULL, NULL),
(1067, 'F', 12, 255, 2014, '2014-11-12 09:07:17', 3, 'IMPRESSAO', '0', NULL, NULL),
(1068, 'F', 13, 253, 2014, '2014-11-12 09:07:39', 3, 'IMPRESSAO', '0', NULL, NULL),
(1069, 'V', 11, 255, 2014, '2014-11-12 09:07:40', 4, 'NOVO', '0', NULL, NULL),
(1070, 'V', 11, 253, 2014, '2014-11-12 09:25:43', 4, 'NOVO', '0', NULL, NULL),
(1071, 'V', 11, 251, 2014, '2014-11-12 09:25:54', 4, 'NOVO', '0', NULL, NULL),
(1072, 'V', 11, 239, 2014, '2014-11-12 09:27:42', 4, 'NOVO', '0', NULL, NULL),
(1073, 'V', 11, 247, 2014, '2014-11-12 09:28:07', 4, 'NOVO', '0', NULL, NULL),
(1074, 'V', 12, 258, 2014, '2014-11-12 09:53:40', 3, 'NOVO', '0', NULL, NULL),
(1075, 'F', 12, 258, 2014, '2014-11-12 09:53:46', 3, 'IMPRESSAO', '0', NULL, NULL),
(1076, 'V', 12, 256, 2014, '2014-11-12 09:53:49', 3, 'NOVO', '0', NULL, NULL),
(1077, 'F', 12, 256, 2014, '2014-11-12 09:53:57', 3, 'IMPRESSAO', '0', NULL, NULL),
(1078, 'V', 11, 256, 2014, '2014-11-12 10:25:45', 4, 'NOVO', '0', NULL, NULL),
(1079, 'V', 11, 258, 2014, '2014-11-12 10:26:02', 4, 'NOVO', '0', NULL, NULL),
(1080, 'F', 11, 246, 2014, '2014-11-12 10:27:22', 4, 'ACABAMENTO', '0', NULL, NULL),
(1081, 'F', 11, 254, 2014, '2014-11-12 10:27:34', 4, 'ACABAMENTO', '0', NULL, NULL),
(1082, 'F', 11, 252, 2014, '2014-11-12 10:28:02', 4, 'ACABAMENTO', '0', NULL, NULL),
(1083, 'F', 11, 251, 2014, '2014-11-12 10:28:29', 4, 'ACABAMENTO', '0', NULL, NULL),
(1084, 'F', 11, 250, 2014, '2014-11-12 10:28:40', 4, 'ACABAMENTO', '0', NULL, NULL),
(1085, 'F', 11, 248, 2014, '2014-11-12 10:28:51', 4, 'ACABAMENTO', '0', NULL, NULL),
(1086, 'F', 17, 229, 2014, '2014-11-12 10:30:52', 5, 'FINALIZADO', '0', NULL, NULL),
(1087, 'F', 17, 228, 2014, '2014-11-12 10:30:56', 5, 'FINALIZADO', '0', NULL, NULL),
(1088, 'V', 17, 254, 2014, '2014-11-12 10:30:59', 5, 'NOVO', '0', NULL, NULL),
(1089, 'V', 17, 252, 2014, '2014-11-12 10:31:05', 5, 'NOVO', '0', NULL, NULL),
(1090, 'V', 17, 251, 2014, '2014-11-12 10:31:18', 5, 'NOVO', '0', NULL, NULL),
(1091, 'V', 17, 250, 2014, '2014-11-12 10:31:23', 5, 'NOVO', '0', NULL, NULL),
(1092, 'V', 17, 248, 2014, '2014-11-12 10:31:28', 5, 'NOVO', '0', NULL, NULL),
(1093, 'V', 17, 246, 2014, '2014-11-12 10:31:33', 5, 'NOVO', '0', NULL, NULL),
(1094, 'V', 12, 260, 2014, '2014-11-12 11:24:29', 3, 'NOVO', '0', NULL, NULL),
(1095, 'F', 12, 260, 2014, '2014-11-12 11:25:04', 3, 'IMPRESSAO', '0', NULL, NULL),
(1096, 'V', 13, 259, 2014, '2014-11-12 11:39:01', 3, 'NOVO', '0', NULL, NULL),
(1097, 'F', 13, 259, 2014, '2014-11-12 11:42:33', 3, 'IMPRESSAO', '0', NULL, NULL),
(1098, 'V', 12, 257, 2014, '2014-11-12 11:54:19', 3, 'NOVO', '0', NULL, NULL),
(1099, 'F', 12, 257, 2014, '2014-11-12 11:58:43', 3, 'IMPRESSAO', '0', NULL, NULL),
(1100, 'V', 11, 260, 2014, '2014-11-12 12:08:13', 4, 'NOVO', '0', NULL, NULL),
(1101, 'F', 11, 258, 2014, '2014-11-12 12:08:51', 4, 'ACABAMENTO', '0', NULL, NULL),
(1102, 'V', 15, 262, 2014, '2014-11-12 13:30:56', 3, 'NOVO', '0', NULL, NULL),
(1103, 'F', 15, 262, 2014, '2014-11-12 13:31:17', 3, 'IMPRESSAO', '0', NULL, NULL),
(1104, 'V', 11, 262, 2014, '2014-11-12 13:39:48', 4, 'NOVO', '0', NULL, NULL),
(1105, 'V', 15, 263, 2014, '2014-11-12 14:06:02', 3, 'NOVO', '0', NULL, NULL),
(1106, 'V', 17, 258, 2014, '2014-11-12 14:32:58', 5, 'NOVO', '0', NULL, NULL),
(1107, 'F', 17, 254, 2014, '2014-11-12 14:33:26', 5, 'FINALIZADO', '0', NULL, NULL),
(1108, 'F', 17, 252, 2014, '2014-11-12 14:34:14', 5, 'FINALIZADO', '0', NULL, NULL),
(1109, 'F', 17, 251, 2014, '2014-11-12 14:35:44', 5, 'FINALIZADO', '0', NULL, NULL),
(1110, 'V', 11, 259, 2014, '2014-11-12 14:36:01', 4, 'NOVO', '0', NULL, NULL),
(1111, 'F', 17, 250, 2014, '2014-11-12 14:36:24', 5, 'FINALIZADO', '0', NULL, NULL),
(1112, 'F', 17, 248, 2014, '2014-11-12 14:37:10', 5, 'FINALIZADO', '0', NULL, NULL),
(1113, 'F', 11, 259, 2014, '2014-11-12 14:40:13', 4, 'ACABAMENTO', '0', NULL, NULL),
(1114, 'F', 11, 260, 2014, '2014-11-12 14:40:20', 4, 'ACABAMENTO', '0', NULL, NULL),
(1115, 'F', 11, 242, 2014, '2014-11-12 14:40:35', 4, 'ACABAMENTO', '0', NULL, NULL),
(1116, 'V', 11, 257, 2014, '2014-11-12 14:45:23', 4, 'NOVO', '0', NULL, NULL),
(1117, 'F', 11, 256, 2014, '2014-11-12 14:45:45', 4, 'ACABAMENTO', '0', NULL, NULL),
(1118, 'F', 11, 253, 2014, '2014-11-12 14:46:25', 4, 'ACABAMENTO', '0', NULL, NULL),
(1119, 'F', 11, 239, 2014, '2014-11-12 14:46:59', 4, 'ACABAMENTO', '0', NULL, NULL),
(1120, 'F', 35, 246, 2014, '2014-11-12 14:49:57', 5, 'FINALIZADO', '0', NULL, NULL),
(1121, 'V', 35, 256, 2014, '2014-11-12 14:50:00', 5, 'NOVO', '0', NULL, NULL),
(1122, 'F', 35, 258, 2014, '2014-11-12 14:51:48', 5, 'FINALIZADO', '0', NULL, NULL),
(1123, 'F', 35, 256, 2014, '2014-11-12 14:51:52', 5, 'FINALIZADO', '0', NULL, NULL),
(1124, 'V', 35, 260, 2014, '2014-11-12 14:52:12', 5, 'NOVO', '0', NULL, NULL),
(1125, 'V', 35, 259, 2014, '2014-11-12 14:52:18', 5, 'NOVO', '0', NULL, NULL),
(1126, 'V', 35, 253, 2014, '2014-11-12 14:52:25', 5, 'NOVO', '0', NULL, NULL),
(1127, 'V', 35, 242, 2014, '2014-11-12 14:52:33', 5, 'NOVO', '0', NULL, NULL),
(1128, 'V', 35, 239, 2014, '2014-11-12 14:52:40', 5, 'NOVO', '0', NULL, NULL),
(1129, 'V', 14, 246, 2014, '2014-11-12 15:13:18', 2, 'NOVO', '0', NULL, NULL),
(1130, 'F', 14, 246, 2014, '2014-11-12 15:13:28', 2, 'FINALIZADO', '0', NULL, NULL),
(1131, 'V', 14, 229, 2014, '2014-11-12 15:14:09', 2, 'NOVO', '0', NULL, NULL),
(1132, 'F', 14, 229, 2014, '2014-11-12 15:14:14', 2, 'FINALIZADO', '0', NULL, NULL),
(1133, 'V', 14, 233, 2014, '2014-11-12 15:16:14', 2, 'NOVO', '0', NULL, NULL),
(1134, 'V', 8, 258, 2014, '2014-11-12 15:41:54', 1, 'NOVO', '0', NULL, NULL),
(1135, 'F', 8, 258, 2014, '2014-11-12 15:42:05', 1, 'FINALIZADO', '0', NULL, NULL),
(1136, 'V', 8, 264, 2014, '2014-11-12 15:42:14', 1, 'NOVO', '0', NULL, NULL),
(1137, 'V', 13, 266, 2014, '2014-11-12 16:06:44', 3, 'NOVO', '0', NULL, NULL),
(1138, 'V', 13, 265, 2014, '2014-11-12 16:09:16', 3, 'NOVO', '0', NULL, NULL),
(1139, 'F', 13, 265, 2014, '2014-11-12 16:10:05', 3, 'IMPRESSAO', '0', NULL, NULL),
(1140, 'F', 13, 266, 2014, '2014-11-12 16:24:49', 3, 'IMPRESSAO', '0', NULL, NULL),
(1141, 'V', 13, 268, 2014, '2014-11-12 16:33:08', 3, 'NOVO', '0', NULL, NULL),
(1142, 'F', 13, 268, 2014, '2014-11-12 16:33:33', 3, 'IMPRESSAO', '0', NULL, NULL),
(1143, 'V', 11, 268, 2014, '2014-11-12 16:44:01', 4, 'NOVO', '0', NULL, NULL),
(1144, 'F', 11, 268, 2014, '2014-11-12 16:44:22', 4, 'ACABAMENTO', '0', NULL, NULL),
(1145, 'V', 11, 265, 2014, '2014-11-12 16:44:27', 4, 'NOVO', '0', NULL, NULL),
(1146, 'V', 17, 268, 2014, '2014-11-12 16:48:10', 5, 'NOVO', '0', NULL, NULL),
(1147, 'F', 17, 268, 2014, '2014-11-12 16:48:30', 5, 'FINALIZADO', '0', NULL, NULL),
(1148, 'V', 11, 249, 2014, '2014-11-12 16:49:15', 4, 'NOVO', '0', NULL, NULL),
(1149, 'F', 11, 249, 2014, '2014-11-12 16:49:22', 4, 'ACABAMENTO', '0', NULL, NULL),
(1150, 'F', 11, 231, 2014, '2014-11-12 16:49:46', 4, 'ACABAMENTO', '0', NULL, NULL),
(1151, 'F', 17, 242, 2014, '2014-11-12 16:49:56', 5, 'FINALIZADO', '0', NULL, NULL),
(1152, 'V', 17, 231, 2014, '2014-11-12 16:50:04', 5, 'NOVO', '0', NULL, NULL),
(1153, 'V', 17, 249, 2014, '2014-11-12 16:50:16', 5, 'NOVO', '0', NULL, NULL),
(1154, 'V', 11, 266, 2014, '2014-11-12 16:50:19', 4, 'NOVO', '0', NULL, NULL),
(1155, 'V', 17, 249, 2014, '2014-11-12 16:50:27', 5, 'NOVO', '0', NULL, NULL),
(1156, 'F', 17, 239, 2014, '2014-11-12 16:51:19', 5, 'FINALIZADO', '0', NULL, NULL),
(1157, 'F', 11, 266, 2014, '2014-11-12 16:54:08', 4, 'ACABAMENTO', '0', NULL, NULL),
(1158, 'F', 17, 231, 2014, '2014-11-12 17:09:56', 5, 'FINALIZADO', '0', NULL, NULL),
(1159, 'V', 17, 266, 2014, '2014-11-12 17:09:58', 5, 'NOVO', '0', NULL, NULL),
(1160, 'V', 13, 269, 2014, '2014-11-12 17:14:36', 3, 'NOVO', '0', NULL, NULL),
(1161, 'V', 13, 269, 2014, '2014-11-12 17:19:47', 3, 'NOVO', '0', NULL, NULL),
(1162, 'F', 13, 269, 2014, '2014-11-12 17:19:51', 3, 'IMPRESSAO', '0', NULL, NULL),
(1163, 'V', 12, 261, 2014, '2014-11-12 17:52:28', 3, 'NOVO', '0', NULL, NULL),
(1164, 'V', 11, 269, 2014, '2014-11-13 08:05:11', 4, 'NOVO', '0', NULL, NULL),
(1165, 'V', 13, 270, 2014, '2014-11-13 08:37:23', 3, 'NOVO', '0', NULL, NULL),
(1166, 'F', 13, 270, 2014, '2014-11-13 08:38:09', 3, 'IMPRESSAO', '0', NULL, NULL),
(1167, 'F', 17, 266, 2014, '2014-11-13 08:40:10', 5, 'FINALIZADO', '0', NULL, NULL),
(1168, 'F', 17, 253, 2014, '2014-11-13 08:42:23', 5, 'FINALIZADO', '0', NULL, NULL),
(1169, 'V', 12, 271, 2014, '2014-11-13 09:14:57', 3, 'NOVO', '0', NULL, NULL),
(1170, 'F', 12, 271, 2014, '2014-11-13 09:15:33', 3, 'IMPRESSAO', '0', NULL, NULL),
(1171, 'F', 35, 249, 2014, '2014-11-13 09:19:01', 5, 'FINALIZADO', '0', NULL, NULL),
(1172, 'F', 35, 259, 2014, '2014-11-13 09:19:19', 5, 'FINALIZADO', '0', NULL, NULL),
(1173, 'V', 12, 273, 2014, '2014-11-13 11:02:57', 3, 'NOVO', '0', NULL, NULL),
(1174, 'F', 12, 273, 2014, '2014-11-13 11:04:12', 3, 'IMPRESSAO', '0', NULL, NULL),
(1175, 'V', 13, 276, 2014, '2014-11-13 11:55:22', 3, 'NOVO', '0', NULL, NULL),
(1176, 'F', 13, 276, 2014, '2014-11-13 11:55:55', 3, 'IMPRESSAO', '0', NULL, NULL),
(1177, 'V', 13, 277, 2014, '2014-11-13 11:57:13', 3, 'NOVO', '0', NULL, NULL),
(1178, 'F', 13, 277, 2014, '2014-11-13 11:57:55', 3, 'IMPRESSAO', '0', NULL, NULL),
(1179, 'V', 8, 274, 2014, '2014-11-13 13:13:17', 1, 'NOVO', '0', NULL, NULL),
(1180, 'V', 13, 278, 2014, '2014-11-13 14:31:48', 3, 'NOVO', '0', NULL, NULL),
(1181, 'F', 13, 278, 2014, '2014-11-13 14:35:29', 3, 'IMPRESSAO', '0', NULL, NULL),
(1182, 'V', 12, 279, 2014, '2014-11-13 14:54:40', 3, 'NOVO', '0', NULL, NULL),
(1183, 'F', 12, 279, 2014, '2014-11-13 15:05:25', 3, 'IMPRESSAO', '0', NULL, NULL),
(1184, 'V', 12, 280, 2014, '2014-11-13 15:06:06', 3, 'NOVO', '0', NULL, NULL),
(1185, 'V', 13, 281, 2014, '2014-11-13 15:42:18', 3, 'NOVO', '0', NULL, NULL),
(1186, 'F', 13, 281, 2014, '2014-11-13 15:42:51', 3, 'IMPRESSAO', '0', NULL, NULL),
(1187, 'F', 12, 280, 2014, '2014-11-13 15:55:52', 3, 'PRD/IMPRESSAO', '0', NULL, NULL),
(1188, 'V', 14, 235, 2014, '2014-11-13 16:11:20', 2, 'NOVO', '0', NULL, NULL),
(1189, 'F', 14, 235, 2014, '2014-11-13 16:11:28', 2, 'FINALIZADO', '0', NULL, NULL),
(1190, 'V', 14, 238, 2014, '2014-11-13 16:12:13', 2, 'NOVO', '0', NULL, NULL),
(1191, 'F', 14, 238, 2014, '2014-11-13 16:12:19', 2, 'FINALIZADO', '0', NULL, NULL),
(1192, 'V', 14, 251, 2014, '2014-11-13 16:12:31', 2, 'NOVO', '0', NULL, NULL),
(1193, 'F', 14, 251, 2014, '2014-11-13 16:12:38', 2, 'FINALIZADO', '0', NULL, NULL),
(1194, 'F', 12, 261, 2014, '2014-11-13 16:17:13', 3, 'IMPRESSAO', '0', NULL, NULL),
(1195, 'V', 12, 285, 2014, '2014-11-13 16:19:19', 3, 'NOVO', '0', NULL, NULL),
(1196, 'F', 12, 285, 2014, '2014-11-13 16:20:42', 3, 'IMPRESSAO', '0', NULL, NULL),
(1197, 'V', 13, 286, 2014, '2014-11-13 16:25:42', 3, 'NOVO', '0', NULL, NULL),
(1198, 'F', 13, 286, 2014, '2014-11-13 16:28:37', 3, 'IMPRESSAO', '0', NULL, NULL),
(1199, 'V', 14, 253, 2014, '2014-11-13 16:29:51', 2, 'NOVO', '0', NULL, NULL),
(1200, 'V', 14, 268, 2014, '2014-11-13 16:39:25', 2, 'NOVO', '0', NULL, NULL),
(1201, 'F', 14, 268, 2014, '2014-11-13 16:39:29', 2, 'FINALIZADO', '0', NULL, NULL),
(1202, 'V', 14, 242, 2014, '2014-11-13 16:39:48', 2, 'NOVO', '0', NULL, NULL),
(1203, 'F', 14, 242, 2014, '2014-11-13 16:39:55', 2, 'FINALIZADO', '0', NULL, NULL),
(1204, 'V', 14, 248, 2014, '2014-11-13 16:40:39', 2, 'NOVO', '0', NULL, NULL),
(1205, 'V', 13, 287, 2014, '2014-11-13 17:52:14', 3, 'NOVO', '0', NULL, NULL),
(1206, 'F', 13, 287, 2014, '2014-11-13 17:52:52', 3, 'IMPRESSAO', '0', NULL, NULL),
(1207, 'V', 14, 288, 2014, '2014-11-13 18:00:35', 2, 'NOVO', '0', NULL, NULL),
(1208, 'V', 11, 287, 2014, '2014-11-14 08:08:35', 4, 'NOVO', '0', NULL, NULL),
(1209, 'F', 11, 287, 2014, '2014-11-14 08:08:43', 4, 'ACABAMENTO', '0', NULL, NULL),
(1210, 'V', 11, 285, 2014, '2014-11-14 08:13:52', 4, 'NOVO', '0', NULL, NULL),
(1211, 'V', 33, 287, 2014, '2014-11-14 08:15:59', 5, 'NOVO', '0', NULL, NULL),
(1212, 'F', 17, 287, 2014, '2014-11-14 09:00:28', 5, 'FINALIZADO', '0', NULL, NULL),
(1213, 'V', 36, 284, 2014, '2014-11-14 10:03:18', 8, 'NOVO', '0', NULL, NULL),
(1214, 'V', 36, 247, 2014, '2014-11-14 10:05:21', 8, 'NOVO', '0', NULL, NULL),
(1215, 'V', 36, 283, 2014, '2014-11-14 10:05:30', 8, 'NOVO', '0', NULL, NULL),
(1216, 'F', 11, 285, 2014, '2014-11-14 10:16:38', 4, 'ACABAMENTO', '0', NULL, NULL),
(1217, 'F', 11, 257, 2014, '2014-11-14 10:16:51', 4, 'ACABAMENTO', '0', NULL, NULL),
(1218, 'V', 11, 270, 2014, '2014-11-14 10:17:09', 4, 'NOVO', '0', NULL, NULL),
(1219, 'F', 11, 270, 2014, '2014-11-14 10:17:23', 4, 'ACABAMENTO', '0', NULL, NULL),
(1220, 'V', 11, 277, 2014, '2014-11-14 10:17:40', 4, 'NOVO', '0', NULL, NULL),
(1221, 'F', 11, 265, 2014, '2014-11-14 10:18:33', 4, 'ACABAMENTO', '0', NULL, NULL),
(1222, 'V', 11, 261, 2014, '2014-11-14 10:18:39', 4, 'NOVO', '0', NULL, NULL),
(1223, 'F', 11, 261, 2014, '2014-11-14 10:18:52', 4, 'ACABAMENTO', '0', NULL, NULL),
(1224, 'F', 11, 255, 2014, '2014-11-14 10:19:09', 4, 'ACABAMENTO', '0', NULL, NULL),
(1225, 'V', 11, 271, 2014, '2014-11-14 10:19:59', 4, 'NOVO', '0', NULL, NULL),
(1226, 'V', 11, 286, 2014, '2014-11-14 10:20:17', 4, 'NOVO', '0', NULL, NULL),
(1227, 'V', 11, 280, 2014, '2014-11-14 10:20:26', 4, 'NOVO', '0', NULL, NULL),
(1228, 'V', 11, 279, 2014, '2014-11-14 10:20:40', 4, 'NOVO', '0', NULL, NULL),
(1229, 'V', 11, 281, 2014, '2014-11-14 10:21:09', 4, 'NOVO', '0', NULL, NULL),
(1230, 'V', 12, 289, 2014, '2014-11-14 10:21:24', 3, 'NOVO', '0', NULL, NULL),
(1231, 'F', 12, 289, 2014, '2014-11-14 10:23:33', 3, 'IMPRESSAO', '0', NULL, NULL),
(1232, 'V', 17, 270, 2014, '2014-11-14 10:27:48', 5, 'NOVO', '0', NULL, NULL),
(1233, 'V', 17, 265, 2014, '2014-11-14 10:27:56', 5, 'NOVO', '0', NULL, NULL),
(1234, 'V', 17, 257, 2014, '2014-11-14 10:28:06', 5, 'NOVO', '0', NULL, NULL),
(1235, 'V', 17, 261, 2014, '2014-11-14 10:28:30', 5, 'NOVO', '0', NULL, NULL),
(1236, 'V', 17, 255, 2014, '2014-11-14 10:28:47', 5, 'NOVO', '0', NULL, NULL),
(1237, 'V', 17, 285, 2014, '2014-11-14 10:28:59', 5, 'NOVO', '0', NULL, NULL),
(1238, 'F', 17, 257, 2014, '2014-11-14 10:29:10', 5, 'FINALIZADO', '0', NULL, NULL),
(1239, 'F', 17, 270, 2014, '2014-11-14 10:29:16', 5, 'FINALIZADO', '0', NULL, NULL),
(1240, 'V', 11, 278, 2014, '2014-11-14 11:09:49', 4, 'NOVO', '0', NULL, NULL),
(1241, 'V', 12, 292, 2014, '2014-11-14 11:12:04', 3, 'NOVO', '0', NULL, NULL),
(1242, 'F', 11, 262, 2014, '2014-11-14 11:16:09', 4, 'ACABAMENTO', '0', NULL, NULL),
(1243, 'F', 11, 269, 2014, '2014-11-14 11:16:18', 4, 'ACABAMENTO', '0', NULL, NULL),
(1244, 'F', 11, 277, 2014, '2014-11-14 11:16:38', 4, 'ACABAMENTO', '0', NULL, NULL),
(1245, 'V', 11, 289, 2014, '2014-11-14 11:16:44', 4, 'NOVO', '0', NULL, NULL),
(1246, 'V', 12, 292, 2014, '2014-11-14 11:30:10', 3, 'NOVO', '0', NULL, NULL),
(1247, 'V', 13, 293, 2014, '2014-11-14 11:44:51', 3, 'NOVO', '0', NULL, NULL),
(1248, 'V', 14, 290, 2014, '2014-11-14 11:44:59', 2, 'NOVO', '0', NULL, NULL),
(1249, 'V', 14, 257, 2014, '2014-11-14 11:45:43', 2, 'NOVO', '0', NULL, NULL),
(1250, 'F', 14, 257, 2014, '2014-11-14 11:45:49', 2, 'FINALIZADO', '0', NULL, NULL),
(1251, 'F', 13, 293, 2014, '2014-11-14 11:47:43', 3, 'IMPRESSAO', '0', NULL, NULL),
(1252, 'V', 13, 272, 2014, '2014-11-14 11:49:31', 3, 'NOVO', '0', NULL, NULL),
(1253, 'F', 13, 272, 2014, '2014-11-14 11:57:19', 3, 'IMPRESSAO', '0', NULL, NULL),
(1254, 'V', 12, 294, 2014, '2014-11-14 12:16:03', 3, 'NOVO', '0', NULL, NULL),
(1255, 'F', 12, 294, 2014, '2014-11-14 12:17:11', 3, 'IMPRESSAO', '0', NULL, NULL),
(1256, 'V', 12, 298, 2014, '2014-11-14 12:28:44', 3, 'NOVO', '0', NULL, NULL),
(1257, 'F', 12, 298, 2014, '2014-11-14 12:29:23', 3, 'IMPRESSAO', '0', NULL, NULL),
(1258, 'V', 12, 297, 2014, '2014-11-14 12:29:25', 3, 'NOVO', '0', NULL, NULL),
(1259, 'F', 12, 297, 2014, '2014-11-14 12:30:53', 3, 'IMPRESSAO', '0', NULL, NULL),
(1260, 'V', 17, 277, 2014, '2014-11-14 13:21:59', 5, 'NOVO', '0', NULL, NULL),
(1261, 'V', 17, 269, 2014, '2014-11-14 13:22:34', 5, 'NOVO', '0', NULL, NULL),
(1262, 'V', 17, 262, 2014, '2014-11-14 13:22:39', 5, 'NOVO', '0', NULL, NULL),
(1263, 'V', 14, 254, 2014, '2014-11-14 13:37:39', 2, 'NOVO', '0', NULL, NULL),
(1264, 'F', 14, 254, 2014, '2014-11-14 13:37:44', 2, 'FINALIZADO', '0', NULL, NULL),
(1265, 'V', 14, 234, 2014, '2014-11-14 13:38:05', 2, 'NOVO', '0', NULL, NULL),
(1266, 'F', 14, 234, 2014, '2014-11-14 13:38:18', 2, 'FINALIZADO', '0', NULL, NULL),
(1267, 'F', 17, 277, 2014, '2014-11-14 13:45:03', 5, 'FINALIZADO', '0', NULL, NULL),
(1268, 'F', 17, 269, 2014, '2014-11-14 13:45:09', 5, 'FINALIZADO', '0', NULL, NULL),
(1269, 'F', 17, 262, 2014, '2014-11-14 14:03:20', 5, 'FINALIZADO', '0', NULL, NULL),
(1270, 'V', 15, 302, 2014, '2014-11-14 14:34:45', 3, 'NOVO', '0', NULL, NULL),
(1271, 'F', 15, 302, 2014, '2014-11-14 14:34:59', 3, 'IMPRESSAO', '0', NULL, NULL),
(1272, 'V', 11, 272, 2014, '2014-11-14 14:45:59', 4, 'NOVO', '0', NULL, NULL),
(1273, 'V', 11, 276, 2014, '2014-11-14 14:46:54', 4, 'NOVO', '0', NULL, NULL),
(1274, 'V', 13, 304, 2014, '2014-11-14 14:54:17', 3, 'NOVO', '0', NULL, NULL),
(1275, 'F', 13, 304, 2014, '2014-11-14 14:56:01', 3, 'IMPRESSAO', '0', NULL, NULL),
(1276, 'F', 11, 276, 2014, '2014-11-14 14:59:37', 4, 'ACABAMENTO', '0', NULL, NULL),
(1277, 'F', 11, 272, 2014, '2014-11-14 15:00:37', 4, 'ACABAMENTO', '0', NULL, NULL),
(1278, 'F', 11, 278, 2014, '2014-11-14 15:00:42', 4, 'ACABAMENTO', '0', NULL, NULL),
(1279, 'F', 11, 271, 2014, '2014-11-14 15:00:52', 4, 'ACABAMENTO', '0', NULL, NULL),
(1280, 'V', 12, 306, 2014, '2014-11-14 15:08:09', 3, 'NOVO', '0', NULL, NULL),
(1281, 'F', 12, 306, 2014, '2014-11-14 15:08:44', 3, 'IMPRESSAO', '0', NULL, NULL),
(1282, 'V', 12, 305, 2014, '2014-11-14 15:08:47', 3, 'NOVO', '0', NULL, NULL),
(1283, 'F', 12, 305, 2014, '2014-11-14 15:17:38', 3, 'IMPRESSAO', '0', NULL, NULL),
(1284, 'V', 33, 276, 2014, '2014-11-14 15:32:55', 5, 'NOVO', '0', NULL, NULL),
(1285, 'V', 17, 278, 2014, '2014-11-14 15:37:59', 5, 'NOVO', '0', NULL, NULL),
(1286, 'V', 17, 272, 2014, '2014-11-14 15:38:13', 5, 'NOVO', '0', NULL, NULL),
(1287, 'F', 17, 265, 2014, '2014-11-14 15:38:35', 5, 'FINALIZADO', '0', NULL, NULL),
(1288, 'F', 17, 255, 2014, '2014-11-14 15:38:43', 5, 'FINALIZADO', '0', NULL, NULL),
(1289, 'F', 17, 261, 2014, '2014-11-14 15:38:47', 5, 'FINALIZADO', '0', NULL, NULL),
(1290, 'V', 17, 271, 2014, '2014-11-14 15:38:49', 5, 'NOVO', '0', NULL, NULL),
(1291, 'V', 17, 271, 2014, '2014-11-14 15:39:00', 5, 'NOVO', '0', NULL, NULL),
(1292, 'V', 11, 297, 2014, '2014-11-14 15:39:39', 4, 'NOVO', '0', NULL, NULL),
(1293, 'V', 11, 304, 2014, '2014-11-14 15:40:08', 4, 'NOVO', '0', NULL, NULL),
(1294, 'V', 11, 306, 2014, '2014-11-14 15:42:57', 4, 'NOVO', '0', NULL, NULL),
(1295, 'F', 11, 304, 2014, '2014-11-14 15:43:17', 4, 'ACABAMENTO', '0', NULL, NULL),
(1296, 'F', 11, 297, 2014, '2014-11-14 15:43:31', 4, 'ACABAMENTO', '0', NULL, NULL),
(1297, 'F', 11, 294, 2014, '2014-11-14 15:43:38', 4, 'ACABAMENTO', '0', NULL, NULL),
(1298, 'V', 11, 298, 2014, '2014-11-14 15:43:44', 4, 'NOVO', '0', NULL, NULL),
(1299, 'V', 13, 307, 2014, '2014-11-14 15:44:47', 3, 'NOVO', '0', NULL, NULL),
(1300, 'F', 33, 285, 2014, '2014-11-14 15:45:11', 5, 'FINALIZADO', '0', NULL, NULL),
(1301, 'F', 13, 307, 2014, '2014-11-14 15:45:17', 3, 'IMPRESSAO', '0', NULL, NULL),
(1302, 'V', 33, 294, 2014, '2014-11-14 15:45:21', 5, 'NOVO', '0', NULL, NULL),
(1303, 'V', 11, 307, 2014, '2014-11-14 15:50:53', 4, 'NOVO', '0', NULL, NULL),
(1304, 'V', 12, 299, 2014, '2014-11-14 15:55:22', 3, 'NOVO', '0', NULL, NULL),
(1305, 'F', 12, 299, 2014, '2014-11-14 15:55:33', 3, 'IMPRESSAO', '0', NULL, NULL),
(1306, 'F', 12, 288, 2014, '2014-11-14 15:57:21', 3, 'IMPRESSAO', '0', NULL, NULL),
(1307, 'F', 11, 307, 2014, '2014-11-14 16:10:02', 4, 'ACABAMENTO', '0', NULL, NULL),
(1308, 'V', 11, 305, 2014, '2014-11-14 16:10:08', 4, 'NOVO', '0', NULL, NULL),
(1309, 'F', 11, 305, 2014, '2014-11-14 16:10:16', 4, 'ACABAMENTO', '0', NULL, NULL),
(1310, 'V', 11, 299, 2014, '2014-11-14 16:10:24', 4, 'NOVO', '0', NULL, NULL),
(1311, 'F', 11, 299, 2014, '2014-11-14 16:10:37', 4, 'ACABAMENTO', '0', NULL, NULL),
(1312, 'F', 11, 281, 2014, '2014-11-14 16:11:01', 4, 'ACABAMENTO', '0', NULL, NULL),
(1313, 'F', 11, 286, 2014, '2014-11-14 16:11:19', 4, 'ACABAMENTO', '0', NULL, NULL),
(1314, 'V', 17, 307, 2014, '2014-11-14 16:19:16', 5, 'NOVO', '0', NULL, NULL),
(1315, 'V', 17, 305, 2014, '2014-11-14 16:19:28', 5, 'NOVO', '0', NULL, NULL),
(1316, 'V', 17, 304, 2014, '2014-11-14 16:19:34', 5, 'NOVO', '0', NULL, NULL),
(1317, 'V', 17, 304, 2014, '2014-11-14 16:19:40', 5, 'NOVO', '0', NULL, NULL),
(1318, 'V', 17, 304, 2014, '2014-11-14 16:19:46', 5, 'NOVO', '0', NULL, NULL),
(1319, 'V', 17, 299, 2014, '2014-11-14 16:19:54', 5, 'NOVO', '0', NULL, NULL),
(1320, 'F', 17, 299, 2014, '2014-11-14 16:20:18', 5, 'FINALIZADO', '0', NULL, NULL),
(1321, 'V', 17, 297, 2014, '2014-11-14 16:20:20', 5, 'NOVO', '0', NULL, NULL),
(1322, 'V', 17, 286, 2014, '2014-11-14 16:20:34', 5, 'NOVO', '0', NULL, NULL),
(1323, 'V', 17, 281, 2014, '2014-11-14 16:20:38', 5, 'NOVO', '0', NULL, NULL),
(1324, 'V', 17, 281, 2014, '2014-11-14 16:20:45', 5, 'NOVO', '0', NULL, NULL),
(1325, 'F', 17, 307, 2014, '2014-11-14 16:23:22', 5, 'FINALIZADO', '0', NULL, NULL),
(1326, 'V', 14, 269, 2014, '2014-11-14 16:28:48', 2, 'NOVO', '0', NULL, NULL),
(1327, 'F', 14, 269, 2014, '2014-11-14 16:30:45', 2, 'FINALIZADO', '0', NULL, NULL),
(1328, 'V', 14, 266, 2014, '2014-11-14 16:30:56', 2, 'NOVO', '0', NULL, NULL),
(1329, 'F', 14, 266, 2014, '2014-11-14 16:31:06', 2, 'FINALIZADO', '0', NULL, NULL),
(1330, 'V', 14, 277, 2014, '2014-11-14 16:32:48', 2, 'NOVO', '0', NULL, NULL),
(1331, 'F', 14, 277, 2014, '2014-11-14 16:34:06', 2, 'FINALIZADO', '0', NULL, NULL),
(1332, 'F', 17, 305, 2014, '2014-11-14 16:34:48', 5, 'FINALIZADO', '0', NULL, NULL),
(1333, 'F', 14, 233, 2014, '2014-11-14 16:34:53', 2, 'FINALIZADO', '0', NULL, NULL),
(1334, 'V', 11, 302, 2014, '2014-11-17 08:05:36', 4, 'NOVO', '0', NULL, NULL),
(1335, 'V', 11, 293, 2014, '2014-11-17 08:07:05', 4, 'NOVO', '0', NULL, NULL),
(1336, 'V', 11, 288, 2014, '2014-11-17 08:07:25', 4, 'NOVO', '0', NULL, NULL),
(1337, 'F', 11, 288, 2014, '2014-11-17 08:07:50', 4, 'ACABAMENTO', '0', NULL, NULL),
(1338, 'F', 11, 306, 2014, '2014-11-17 08:15:05', 4, 'ACABAMENTO', '0', NULL, NULL),
(1339, 'V', 11, 273, 2014, '2014-11-17 08:15:24', 4, 'NOVO', '0', NULL, NULL),
(1340, 'F', 11, 240, 2014, '2014-11-17 08:16:11', 4, 'ACABAMENTO', '0', NULL, NULL),
(1341, 'F', 15, 292, 2014, '2014-11-17 08:46:53', 3, 'IMPRESSAO', '0', NULL, NULL),
(1342, 'V', 17, 306, 2014, '2014-11-17 09:02:36', 5, 'NOVO', '0', NULL, NULL),
(1343, 'V', 17, 288, 2014, '2014-11-17 09:02:45', 5, 'NOVO', '0', NULL, NULL),
(1344, 'V', 17, 288, 2014, '2014-11-17 09:02:56', 5, 'NOVO', '0', NULL, NULL),
(1345, 'V', 17, 288, 2014, '2014-11-17 09:03:03', 5, 'NOVO', '0', NULL, NULL),
(1346, 'F', 17, 288, 2014, '2014-11-17 09:03:25', 5, 'FINALIZADO', '0', NULL, NULL),
(1347, 'F', 17, 278, 2014, '2014-11-17 09:03:44', 5, 'FINALIZADO', '0', NULL, NULL),
(1348, 'F', 17, 286, 2014, '2014-11-17 09:04:36', 5, 'FINALIZADO', '0', NULL, NULL),
(1349, 'F', 17, 281, 2014, '2014-11-17 09:04:43', 5, 'FINALIZADO', '0', NULL, NULL),
(1350, 'F', 17, 276, 2014, '2014-11-17 09:04:55', 5, 'FINALIZADO', '0', NULL, NULL),
(1351, 'F', 17, 272, 2014, '2014-11-17 09:05:29', 5, 'FINALIZADO', '0', NULL, NULL),
(1352, 'V', 17, 240, 2014, '2014-11-17 09:05:44', 5, 'NOVO', '0', NULL, NULL),
(1353, 'F', 17, 304, 2014, '2014-11-17 09:06:11', 5, 'FINALIZADO', '0', NULL, NULL),
(1354, 'F', 17, 306, 2014, '2014-11-17 09:07:09', 5, 'FINALIZADO', '0', NULL, NULL),
(1355, 'F', 17, 271, 2014, '2014-11-17 09:07:43', 5, 'FINALIZADO', '0', NULL, NULL),
(1356, 'F', 17, 240, 2014, '2014-11-17 09:08:00', 5, 'FINALIZADO', '0', NULL, NULL),
(1357, 'V', 13, 309, 2014, '2014-11-17 09:08:11', 3, 'NOVO', '0', NULL, NULL),
(1358, 'F', 13, 309, 2014, '2014-11-17 09:08:44', 3, 'IMPRESSAO', '0', NULL, NULL),
(1359, 'V', 15, 308, 2014, '2014-11-17 09:08:46', 3, 'NOVO', '0', NULL, NULL),
(1360, 'F', 15, 308, 2014, '2014-11-17 09:08:52', 3, 'IMPRESSAO', '0', NULL, NULL),
(1361, 'V', 15, 296, 2014, '2014-11-17 09:09:02', 3, 'NOVO', '0', NULL, NULL),
(1362, 'V', 15, 300, 2014, '2014-11-17 09:09:09', 3, 'NOVO', '0', NULL, NULL),
(1363, 'V', 15, 267, 2014, '2014-11-17 09:09:35', 3, 'NOVO', '0', NULL, NULL),
(1364, 'V', 15, 263, 2014, '2014-11-17 09:09:47', 3, 'NOVO', '0', NULL, NULL),
(1365, 'F', 15, 264, 2014, '2014-11-17 09:10:37', 3, 'IMPRESSAO', '0', NULL, NULL),
(1366, 'F', 15, 300, 2014, '2014-11-17 09:11:13', 3, 'IMPRESSAO', '0', NULL, NULL),
(1367, 'F', 15, 227, 2014, '2014-11-17 09:11:15', 3, 'IMPRESSAO', '0', NULL, NULL),
(1368, 'V', 15, 303, 2014, '2014-11-17 09:11:35', 3, 'NOVO', '0', NULL, NULL),
(1369, 'F', 15, 303, 2014, '2014-11-17 09:11:39', 3, 'IMPRESSAO', '0', NULL, NULL),
(1370, 'V', 15, 283, 2014, '2014-11-17 09:12:22', 3, 'NOVO', '0', NULL, NULL),
(1371, 'F', 17, 297, 2014, '2014-11-17 09:35:40', 5, 'FINALIZADO', '0', NULL, NULL),
(1372, 'V', 32, 301, 2014, '2014-11-17 09:54:47', 8, 'NOVO', '0', NULL, NULL),
(1373, 'V', 32, 295, 2014, '2014-11-17 09:55:33', 8, 'NOVO', '0', NULL, NULL),
(1374, 'V', 32, 291, 2014, '2014-11-17 09:55:44', 8, 'NOVO', '0', NULL, NULL),
(1375, 'V', 32, 291, 2014, '2014-11-17 09:56:58', 8, 'NOVO', '0', NULL, NULL),
(1376, 'F', 17, 294, 2014, '2014-11-17 10:03:22', 5, 'FINALIZADO', '0', NULL, NULL),
(1377, 'V', 12, 312, 2014, '2014-11-17 10:21:08', 3, 'NOVO', '0', NULL, NULL),
(1378, 'F', 12, 312, 2014, '2014-11-17 10:22:53', 3, 'IMPRESSAO', '0', NULL, NULL),
(1379, 'V', 11, 312, 2014, '2014-11-17 10:29:30', 4, 'NOVO', '0', NULL, NULL),
(1380, 'V', 11, 308, 2014, '2014-11-17 10:29:49', 4, 'NOVO', '0', NULL, NULL),
(1381, 'V', 11, 309, 2014, '2014-11-17 10:44:50', 4, 'NOVO', '0', NULL, NULL),
(1382, 'V', 11, 303, 2014, '2014-11-17 10:45:32', 4, 'NOVO', '0', NULL, NULL),
(1383, 'F', 11, 303, 2014, '2014-11-17 10:45:44', 4, 'ACABAMENTO', '0', NULL, NULL),
(1384, 'V', 11, 300, 2014, '2014-11-17 10:45:49', 4, 'NOVO', '0', NULL, NULL),
(1385, 'V', 11, 292, 2014, '2014-11-17 10:51:00', 4, 'NOVO', '0', NULL, NULL),
(1386, 'V', 17, 303, 2014, '2014-11-17 10:52:42', 5, 'NOVO', '0', NULL, NULL),
(1387, 'V', 17, 303, 2014, '2014-11-17 10:53:01', 5, 'NOVO', '0', NULL, NULL),
(1388, 'F', 17, 303, 2014, '2014-11-17 10:53:12', 5, 'FINALIZADO', '0', NULL, NULL),
(1389, 'F', 11, 308, 2014, '2014-11-17 10:58:23', 4, 'ACABAMENTO', '0', NULL, NULL),
(1390, 'V', 15, 311, 2014, '2014-11-17 11:04:27', 3, 'NOVO', '0', NULL, NULL),
(1391, 'V', 14, 278, 2014, '2014-11-17 11:09:16', 2, 'NOVO', '0', NULL, NULL),
(1392, 'F', 14, 278, 2014, '2014-11-17 11:09:22', 2, 'FINALIZADO', '0', NULL, NULL),
(1393, 'V', 14, 303, 2014, '2014-11-17 11:09:30', 2, 'NOVO', '0', NULL, NULL),
(1394, 'F', 14, 303, 2014, '2014-11-17 11:09:35', 2, 'FINALIZADO', '0', NULL, NULL),
(1395, 'V', 14, 288, 2014, '2014-11-17 11:09:49', 2, 'NOVO', '0', NULL, NULL),
(1396, 'F', 14, 288, 2014, '2014-11-17 11:09:55', 2, 'FINALIZADO', '0', NULL, NULL),
(1397, 'V', 14, 287, 2014, '2014-11-17 11:10:01', 2, 'NOVO', '0', NULL, NULL),
(1398, 'F', 14, 287, 2014, '2014-11-17 11:10:31', 2, 'FINALIZADO', '0', NULL, NULL),
(1399, 'F', 17, 260, 2014, '2014-11-17 11:15:35', 5, 'FINALIZADO', '0', NULL, NULL),
(1400, 'V', 17, 308, 2014, '2014-11-17 11:15:38', 5, 'NOVO', '0', NULL, NULL),
(1401, 'V', 14, 260, 2014, '2014-11-17 11:18:17', 2, 'NOVO', '0', NULL, NULL),
(1402, 'F', 14, 260, 2014, '2014-11-17 11:18:23', 2, 'FINALIZADO', '0', NULL, NULL),
(1403, 'F', 17, 308, 2014, '2014-11-17 11:20:48', 5, 'FINALIZADO', '0', NULL, NULL),
(1404, 'F', 15, 311, 2014, '2014-11-17 11:29:51', 3, 'IMPRESSAO', '0', NULL, NULL),
(1405, 'V', 11, 311, 2014, '2014-11-17 11:46:45', 4, 'NOVO', '0', NULL, NULL),
(1406, 'F', 11, 302, 2014, '2014-11-17 11:47:34', 4, 'ACABAMENTO', '0', NULL, NULL),
(1407, 'F', 11, 300, 2014, '2014-11-17 11:47:36', 4, 'ACABAMENTO', '0', NULL, NULL),
(1408, 'V', 11, 264, 2014, '2014-11-17 11:48:50', 4, 'NOVO', '0', NULL, NULL),
(1409, 'V', 11, 264, 2014, '2014-11-17 11:49:00', 4, 'NOVO', '0', NULL, NULL),
(1410, 'F', 11, 264, 2014, '2014-11-17 11:49:20', 4, 'ACABAMENTO', '0', NULL, NULL),
(1411, 'V', 11, 227, 2014, '2014-11-17 11:49:38', 4, 'NOVO', '0', NULL, NULL),
(1412, 'V', 13, 313, 2014, '2014-11-17 11:50:55', 3, 'NOVO', '0', NULL, NULL),
(1413, 'F', 13, 313, 2014, '2014-11-17 11:53:26', 3, 'IMPRESSAO', '0', NULL, NULL),
(1414, 'V', 12, 314, 2014, '2014-11-17 11:56:05', 3, 'NOVO', '0', NULL, NULL),
(1415, 'F', 12, 314, 2014, '2014-11-17 11:57:16', 3, 'IMPRESSAO', '0', NULL, NULL),
(1416, 'V', 11, 314, 2014, '2014-11-17 11:59:07', 4, 'NOVO', '0', NULL, NULL),
(1417, 'V', 11, 313, 2014, '2014-11-17 11:59:21', 4, 'NOVO', '0', NULL, NULL),
(1418, 'V', 13, 314, 2014, '2014-11-17 12:01:30', 3, 'NOVO', '0', NULL, NULL),
(1419, 'V', 13, 315, 2014, '2014-11-17 12:01:50', 3, 'NOVO', '0', NULL, NULL),
(1420, 'F', 11, 311, 2014, '2014-11-17 12:03:02', 4, 'ACABAMENTO', '0', NULL, NULL),
(1421, 'F', 11, 309, 2014, '2014-11-17 12:03:05', 4, 'ACABAMENTO', '0', NULL, NULL),
(1422, 'F', 13, 315, 2014, '2014-11-17 12:03:24', 3, 'IMPRESSAO', '0', NULL, NULL),
(1423, 'V', 13, 316, 2014, '2014-11-17 12:04:31', 3, 'NOVO', '0', NULL, NULL),
(1424, 'F', 13, 316, 2014, '2014-11-17 12:05:34', 3, 'IMPRESSAO', '0', NULL, NULL),
(1425, 'V', 15, 317, 2014, '2014-11-17 13:00:22', 3, 'NOVO', '0', NULL, NULL),
(1426, 'F', 15, 317, 2014, '2014-11-17 13:01:32', 3, 'IMPRESSAO', '0', NULL, NULL),
(1427, 'V', 15, 267, 2014, '2014-11-17 13:15:00', 3, 'NOVO', '0', NULL, NULL),
(1428, 'F', 15, 267, 2014, '2014-11-17 13:15:12', 3, 'IMPRESSAO', '0', NULL, NULL),
(1429, 'V', 15, 310, 2014, '2014-11-17 13:15:57', 3, 'NOVO', '0', NULL, NULL),
(1430, 'V', 11, 267, 2014, '2014-11-17 13:21:01', 4, 'NOVO', '0', NULL, NULL),
(1431, 'F', 11, 267, 2014, '2014-11-17 13:21:18', 4, 'ACABAMENTO', '0', NULL, NULL),
(1432, 'F', 11, 227, 2014, '2014-11-17 13:21:29', 4, 'ACABAMENTO', '0', NULL, NULL),
(1433, 'F', 11, 279, 2014, '2014-11-17 13:50:01', 4, 'ACABAMENTO', '0', NULL, NULL),
(1434, 'V', 12, 318, 2014, '2014-11-17 14:01:33', 3, 'NOVO', '0', NULL, NULL),
(1435, 'V', 13, 319, 2014, '2014-11-17 14:05:45', 3, 'NOVO', '0', NULL, NULL),
(1436, 'F', 13, 319, 2014, '2014-11-17 14:06:25', 3, 'IMPRESSAO', '0', NULL, NULL),
(1437, 'V', 12, 318, 2014, '2014-11-17 14:08:25', 3, 'NOVO', '0', NULL, NULL),
(1438, 'F', 12, 318, 2014, '2014-11-17 14:08:30', 3, 'IMPRESSAO', '0', NULL, NULL),
(1439, 'V', 12, 320, 2014, '2014-11-17 14:25:59', 3, 'NOVO', '0', NULL, NULL),
(1440, 'F', 12, 320, 2014, '2014-11-17 14:27:05', 3, 'IMPRESSAO', '0', NULL, NULL),
(1441, 'V', 14, 226, 2014, '2014-11-17 14:30:34', 2, 'NOVO', '0', NULL, NULL),
(1442, 'F', 14, 226, 2014, '2014-11-17 14:30:40', 2, 'FINALIZADO', '0', NULL, NULL),
(1443, 'V', 35, 311, 2014, '2014-11-17 14:34:28', 5, 'NOVO', '0', NULL, NULL),
(1444, 'V', 35, 309, 2014, '2014-11-17 14:34:42', 5, 'NOVO', '0', NULL, NULL),
(1445, 'V', 35, 309, 2014, '2014-11-17 14:35:11', 5, 'NOVO', '0', NULL, NULL),
(1446, 'V', 35, 309, 2014, '2014-11-17 14:35:40', 5, 'NOVO', '0', NULL, NULL),
(1447, 'V', 35, 302, 2014, '2014-11-17 14:36:20', 5, 'NOVO', '0', NULL, NULL),
(1448, 'V', 35, 300, 2014, '2014-11-17 14:36:36', 5, 'NOVO', '0', NULL, NULL),
(1449, 'V', 35, 279, 2014, '2014-11-17 14:36:50', 5, 'NOVO', '0', NULL, NULL),
(1450, 'V', 35, 309, 2014, '2014-11-17 14:37:14', 5, 'NOVO', '0', NULL, NULL),
(1451, 'V', 13, 321, 2014, '2014-11-17 14:39:56', 3, 'NOVO', '0', NULL, NULL),
(1452, 'V', 11, 320, 2014, '2014-11-17 14:43:48', 4, 'NOVO', '0', NULL, NULL),
(1453, 'V', 11, 319, 2014, '2014-11-17 14:43:59', 4, 'NOVO', '0', NULL, NULL),
(1454, 'V', 11, 318, 2014, '2014-11-17 14:44:06', 4, 'NOVO', '0', NULL, NULL),
(1455, 'V', 11, 317, 2014, '2014-11-17 14:44:23', 4, 'NOVO', '0', NULL, NULL),
(1456, 'V', 11, 316, 2014, '2014-11-17 14:44:41', 4, 'NOVO', '0', NULL, NULL),
(1457, 'V', 11, 315, 2014, '2014-11-17 14:44:55', 4, 'NOVO', '0', NULL, NULL),
(1458, 'V', 11, 313, 2014, '2014-11-17 14:45:07', 4, 'NOVO', '0', NULL, NULL),
(1459, 'F', 13, 321, 2014, '2014-11-17 14:45:15', 3, 'IMPRESSAO', '0', NULL, NULL),
(1460, 'F', 11, 313, 2014, '2014-11-17 14:45:19', 4, 'ACABAMENTO', '0', NULL, NULL),
(1461, 'V', 32, 237, 2014, '2014-11-17 14:46:40', 8, 'NOVO', '0', NULL, NULL),
(1462, 'V', 32, 236, 2014, '2014-11-17 14:47:49', 8, 'NOVO', '0', NULL, NULL),
(1463, 'V', 32, 237, 2014, '2014-11-17 14:48:26', 8, 'NOVO', '0', NULL, NULL),
(1464, 'V', 32, 236, 2014, '2014-11-17 14:48:38', 8, 'NOVO', '0', NULL, NULL),
(1465, 'F', 32, 237, 2014, '2014-11-17 14:49:23', 8, 'IMPRESSAO', '0', NULL, NULL),
(1466, 'V', 33, 227, 2014, '2014-11-17 14:55:37', 5, 'NOVO', '0', NULL, NULL),
(1467, 'V', 33, 227, 2014, '2014-11-17 14:57:07', 5, 'NOVO', '0', NULL, NULL),
(1468, 'V', 13, 322, 2014, '2014-11-17 14:57:18', 3, 'NOVO', '0', NULL, NULL),
(1469, 'F', 33, 227, 2014, '2014-11-17 14:57:26', 5, 'FINALIZADO', '0', NULL, NULL),
(1470, 'V', 33, 264, 2014, '2014-11-17 14:57:37', 5, 'NOVO', '0', NULL, NULL),
(1471, 'F', 33, 264, 2014, '2014-11-17 14:57:51', 5, 'FINALIZADO', '0', NULL, NULL),
(1472, 'V', 33, 267, 2014, '2014-11-17 14:58:00', 5, 'NOVO', '0', NULL, NULL),
(1473, 'F', 33, 267, 2014, '2014-11-17 14:58:09', 5, 'FINALIZADO', '0', NULL, NULL),
(1474, 'F', 13, 322, 2014, '2014-11-17 14:58:26', 3, 'IMPRESSAO', '0', NULL, NULL),
(1475, 'F', 33, 302, 2014, '2014-11-17 14:58:45', 5, 'FINALIZADO', '0', NULL, NULL),
(1476, 'F', 33, 300, 2014, '2014-11-17 14:58:56', 5, 'FINALIZADO', '0', NULL, NULL),
(1477, 'F', 33, 309, 2014, '2014-11-17 14:59:12', 5, 'FINALIZADO', '0', NULL, NULL),
(1478, 'F', 33, 311, 2014, '2014-11-17 14:59:25', 5, 'FINALIZADO', '0', NULL, NULL),
(1479, 'V', 33, 313, 2014, '2014-11-17 14:59:31', 5, 'NOVO', '0', NULL, NULL),
(1480, 'F', 13, 310, 2014, '2014-11-17 15:06:56', 3, 'IMPRESSAO', '0', NULL, NULL),
(1481, 'V', 12, 323, 2014, '2014-11-17 15:11:05', 3, 'NOVO', '0', NULL, NULL),
(1482, 'V', 12, 323, 2014, '2014-11-17 15:11:06', 3, 'NOVO', '0', NULL, NULL),
(1483, 'V', 13, 325, 2014, '2014-11-17 15:18:27', 3, 'NOVO', '0', NULL, NULL),
(1484, 'F', 12, 323, 2014, '2014-11-17 15:19:07', 3, 'IMPRESSAO', '0', NULL, NULL),
(1485, 'V', 12, 324, 2014, '2014-11-17 15:19:09', 3, 'NOVO', '0', NULL, NULL),
(1486, 'F', 13, 325, 2014, '2014-11-17 15:19:58', 3, 'IMPRESSAO', '0', NULL, NULL),
(1487, 'F', 11, 316, 2014, '2014-11-17 15:21:02', 4, 'ACABAMENTO', '0', NULL, NULL),
(1488, 'V', 11, 325, 2014, '2014-11-17 15:21:06', 4, 'NOVO', '0', NULL, NULL),
(1489, 'V', 11, 325, 2014, '2014-11-17 15:22:31', 4, 'NOVO', '0', NULL, NULL),
(1490, 'V', 11, 323, 2014, '2014-11-17 15:22:40', 4, 'NOVO', '0', NULL, NULL),
(1491, 'V', 11, 322, 2014, '2014-11-17 15:22:54', 4, 'NOVO', '0', NULL, NULL),
(1492, 'V', 12, 324, 2014, '2014-11-17 15:22:56', 3, 'NOVO', '0', NULL, NULL),
(1493, 'F', 12, 324, 2014, '2014-11-17 15:23:04', 3, 'IMPRESSAO', '0', NULL, NULL),
(1494, 'V', 11, 321, 2014, '2014-11-17 15:23:43', 4, 'NOVO', '0', NULL, NULL),
(1495, 'V', 13, 327, 2014, '2014-11-17 15:46:05', 3, 'NOVO', '0', NULL, NULL),
(1496, 'F', 13, 327, 2014, '2014-11-17 15:46:09', 3, 'IMPRESSAO', '0', NULL, NULL),
(1497, 'F', 11, 325, 2014, '2014-11-17 16:15:35', 4, 'ACABAMENTO', '0', NULL, NULL),
(1498, 'V', 11, 327, 2014, '2014-11-17 16:15:38', 4, 'NOVO', '0', NULL, NULL),
(1499, 'F', 11, 327, 2014, '2014-11-17 16:15:52', 4, 'ACABAMENTO', '0', NULL, NULL),
(1500, 'V', 11, 324, 2014, '2014-11-17 16:15:55', 4, 'NOVO', '0', NULL, NULL),
(1501, 'V', 11, 323, 2014, '2014-11-17 16:15:59', 4, 'NOVO', '0', NULL, NULL),
(1502, 'F', 11, 321, 2014, '2014-11-17 16:16:53', 4, 'ACABAMENTO', '0', NULL, NULL),
(1503, 'V', 35, 327, 2014, '2014-11-17 16:18:01', 5, 'NOVO', '0', NULL, NULL),
(1504, 'F', 35, 327, 2014, '2014-11-17 16:18:40', 5, 'FINALIZADO', '0', NULL, NULL),
(1505, 'V', 35, 316, 2014, '2014-11-17 16:18:54', 5, 'NOVO', '0', NULL, NULL),
(1506, 'V', 35, 325, 2014, '2014-11-17 16:19:14', 5, 'NOVO', '0', NULL, NULL),
(1507, 'V', 35, 321, 2014, '2014-11-17 16:19:55', 5, 'NOVO', '0', NULL, NULL),
(1508, 'F', 35, 279, 2014, '2014-11-17 16:20:14', 5, 'FINALIZADO', '0', NULL, NULL),
(1509, 'F', 35, 313, 2014, '2014-11-17 16:20:24', 5, 'FINALIZADO', '0', NULL, NULL),
(1510, 'F', 35, 316, 2014, '2014-11-17 16:20:28', 5, 'FINALIZADO', '0', NULL, NULL),
(1511, 'V', 14, 327, 2014, '2014-11-17 17:00:10', 2, 'NOVO', '0', NULL, NULL),
(1512, 'F', 14, 327, 2014, '2014-11-17 17:00:20', 2, 'FINALIZADO', '0', NULL, NULL),
(1513, 'F', 11, 323, 2014, '2014-11-17 17:06:42', 4, 'ACABAMENTO', '0', NULL, NULL),
(1514, 'V', 11, 310, 2014, '2014-11-17 17:07:44', 4, 'NOVO', '0', NULL, NULL),
(1515, 'F', 35, 325, 2014, '2014-11-17 17:44:19', 5, 'FINALIZADO', '0', NULL, NULL),
(1516, 'F', 35, 321, 2014, '2014-11-17 17:45:08', 5, 'FINALIZADO', '0', NULL, NULL),
(1517, 'V', 35, 323, 2014, '2014-11-17 17:45:14', 5, 'NOVO', '0', NULL, NULL),
(1518, 'F', 35, 323, 2014, '2014-11-17 17:45:26', 5, 'FINALIZADO', '0', NULL, NULL),
(1519, 'F', 8, 274, 2014, '2014-11-18 07:54:47', 1, 'AGENDAMENTO', '0', NULL, NULL),
(1520, 'F', 32, 236, 2014, '2014-11-18 08:22:41', 8, 'IMPRESSAO', '0', NULL, NULL),
(1521, 'V', 15, 329, 2014, '2014-11-18 08:23:12', 3, 'NOVO', '0', NULL, NULL),
(1522, 'V', 14, 309, 2014, '2014-11-18 08:23:46', 2, 'NOVO', '0', NULL, NULL),
(1523, 'F', 14, 309, 2014, '2014-11-18 08:24:06', 2, 'FINALIZADO', '0', NULL, NULL),
(1524, 'V', 14, 286, 2014, '2014-11-18 08:24:37', 2, 'NOVO', '0', NULL, NULL),
(1525, 'F', 14, 286, 2014, '2014-11-18 08:24:44', 2, 'FINALIZADO', '0', NULL, NULL),
(1526, 'V', 13, 326, 2014, '2014-11-18 08:29:07', 3, 'NOVO', '0', NULL, NULL),
(1527, 'V', 14, 259, 2014, '2014-11-18 08:42:41', 2, 'NOVO', '0', NULL, NULL),
(1528, 'F', 14, 259, 2014, '2014-11-18 08:42:48', 2, 'FINALIZADO', '0', NULL, NULL),
(1529, 'V', 14, 240, 2014, '2014-11-18 08:49:17', 2, 'NOVO', '0', NULL, NULL),
(1530, 'F', 14, 240, 2014, '2014-11-18 08:49:25', 2, 'FINALIZADO', '0', NULL, NULL),
(1531, 'V', 14, 255, 2014, '2014-11-18 08:50:03', 2, 'NOVO', '0', NULL, NULL),
(1532, 'F', 14, 255, 2014, '2014-11-18 08:50:12', 2, 'FINALIZADO', '0', NULL, NULL),
(1533, 'V', 14, 294, 2014, '2014-11-18 09:35:54', 2, 'NOVO', '0', NULL, NULL),
(1534, 'F', 11, 292, 2014, '2014-11-18 09:52:28', 4, 'ACABAMENTO', '0', NULL, NULL),
(1535, 'V', 11, 237, 2014, '2014-11-18 09:52:43', 4, 'NOVO', '0', NULL, NULL),
(1536, 'V', 11, 236, 2014, '2014-11-18 09:52:52', 4, 'NOVO', '0', NULL, NULL),
(1537, 'F', 11, 324, 2014, '2014-11-18 09:56:13', 4, 'ACABAMENTO', '0', NULL, NULL),
(1538, 'V', 12, 333, 2014, '2014-11-18 09:58:49', 3, 'NOVO', '0', NULL, NULL),
(1539, 'F', 12, 333, 2014, '2014-11-18 10:09:01', 3, 'IMPRESSAO', '0', NULL, NULL),
(1540, 'V', 12, 331, 2014, '2014-11-18 10:09:07', 3, 'NOVO', '0', NULL, NULL),
(1541, 'F', 12, 331, 2014, '2014-11-18 10:09:19', 3, 'IMPRESSAO', '0', NULL, NULL),
(1542, 'V', 15, 334, 2014, '2014-11-18 10:49:45', 3, 'NOVO', '0', NULL, NULL),
(1543, 'V', 14, 279, 2014, '2014-11-18 10:49:46', 2, 'NOVO', '0', NULL, NULL),
(1544, 'F', 14, 279, 2014, '2014-11-18 10:49:52', 2, 'FINALIZADO', '0', NULL, NULL),
(1545, 'V', 13, 335, 2014, '2014-11-18 10:59:08', 3, 'NOVO', '0', NULL, NULL),
(1546, 'F', 13, 335, 2014, '2014-11-18 11:01:27', 3, 'IMPRESSAO', '0', NULL, NULL),
(1547, 'F', 15, 296, 2014, '2014-11-18 11:18:45', 3, 'IMPRESSAO', '0', NULL, NULL),
(1548, 'F', 15, 334, 2014, '2014-11-18 11:19:09', 3, 'IMPRESSAO', '0', NULL, NULL),
(1549, 'V', 14, 281, 2014, '2014-11-18 11:26:19', 2, 'NOVO', '0', NULL, NULL),
(1550, 'F', 14, 281, 2014, '2014-11-18 11:26:25', 2, 'FINALIZADO', '0', NULL, NULL),
(1551, 'V', 14, 308, 2014, '2014-11-18 11:26:38', 2, 'NOVO', '0', NULL, NULL),
(1552, 'V', 11, 333, 2014, '2014-11-18 11:28:57', 4, 'NOVO', '0', NULL, NULL),
(1553, 'V', 32, 336, 2014, '2014-11-18 11:29:22', 8, 'NOVO', '0', NULL, NULL),
(1554, 'V', 12, 337, 2014, '2014-11-18 11:34:59', 3, 'NOVO', '0', NULL, NULL),
(1555, 'F', 12, 337, 2014, '2014-11-18 11:40:41', 3, 'IMPRESSAO', '0', NULL, NULL),
(1556, 'V', 12, 336, 2014, '2014-11-18 11:40:44', 3, 'NOVO', '0', NULL, NULL),
(1557, 'V', 12, 336, 2014, '2014-11-18 11:41:14', 3, 'NOVO', '0', NULL, NULL),
(1558, 'V', 11, 337, 2014, '2014-11-18 12:10:51', 4, 'NOVO', '0', NULL, NULL),
(1559, 'F', 11, 333, 2014, '2014-11-18 12:11:10', 4, 'ACABAMENTO', '0', NULL, NULL),
(1560, 'F', 11, 315, 2014, '2014-11-18 12:11:59', 4, 'ACABAMENTO', '0', NULL, NULL),
(1561, 'V', 11, 310, 2014, '2014-11-18 12:12:26', 4, 'NOVO', '0', NULL, NULL),
(1562, 'F', 11, 310, 2014, '2014-11-18 12:12:38', 4, 'ACABAMENTO', '0', NULL, NULL),
(1563, 'F', 11, 312, 2014, '2014-11-18 12:12:57', 4, 'ACABAMENTO', '0', NULL, NULL),
(1564, 'F', 12, 336, 2014, '2014-11-18 12:13:57', 3, 'PRD/IMPRESSAO', '0', NULL, NULL),
(1565, 'V', 11, 335, 2014, '2014-11-18 12:22:12', 4, 'NOVO', '0', NULL, NULL),
(1566, 'V', 11, 336, 2014, '2014-11-18 12:22:33', 4, 'NOVO', '0', NULL, NULL),
(1567, 'V', 11, 334, 2014, '2014-11-18 12:22:51', 4, 'NOVO', '0', NULL, NULL),
(1568, 'V', 11, 331, 2014, '2014-11-18 12:23:03', 4, 'NOVO', '0', NULL, NULL),
(1569, 'F', 11, 331, 2014, '2014-11-18 12:23:11', 4, 'ACABAMENTO', '0', NULL, NULL),
(1570, 'V', 11, 296, 2014, '2014-11-18 12:26:23', 4, 'NOVO', '0', NULL, NULL),
(1571, 'V', 15, 339, 2014, '2014-11-18 13:05:06', 3, 'NOVO', '0', NULL, NULL),
(1572, 'F', 15, 339, 2014, '2014-11-18 14:13:50', 3, 'IMPRESSAO', '0', NULL, NULL),
(1573, 'V', 12, 340, 2014, '2014-11-18 14:19:18', 3, 'NOVO', '0', NULL, NULL),
(1574, 'F', 12, 340, 2014, '2014-11-18 14:21:46', 3, 'IMPRESSAO', '0', NULL, NULL);
INSERT INTO `nivelusuario` (`ID`, `status`, `IDUsuario`, `servicoID`, `ano`, `dataAlteracao`, `nivelUsuario`, `passo`, `dataAgendamento`, `obsAgendamento`, `obsOrcamento`) VALUES
(1575, 'V', 11, 340, 2014, '2014-11-18 14:25:13', 4, 'NOVO', '0', NULL, NULL),
(1576, 'V', 14, 304, 2014, '2014-11-18 14:26:36', 2, 'NOVO', '0', NULL, NULL),
(1577, 'F', 14, 304, 2014, '2014-11-18 14:26:42', 2, 'FINALIZADO', '0', NULL, NULL),
(1578, 'V', 13, 345, 2014, '2014-11-18 15:14:19', 3, 'NOVO', '0', NULL, NULL),
(1579, 'F', 13, 345, 2014, '2014-11-18 15:30:08', 3, 'IMPRESSAO', '0', NULL, NULL),
(1580, 'V', 14, 272, 2014, '2014-11-18 16:00:18', 2, 'NOVO', '0', NULL, NULL),
(1581, 'F', 14, 272, 2014, '2014-11-18 16:00:26', 2, 'FINALIZADO', '0', NULL, NULL),
(1582, 'V', 11, 345, 2014, '2014-11-18 16:01:05', 4, 'NOVO', '0', NULL, NULL),
(1583, 'F', 11, 340, 2014, '2014-11-18 16:01:23', 4, 'ACABAMENTO', '0', NULL, NULL),
(1584, 'V', 11, 339, 2014, '2014-11-18 16:01:26', 4, 'NOVO', '0', NULL, NULL),
(1585, 'F', 11, 337, 2014, '2014-11-18 16:02:21', 4, 'ACABAMENTO', '0', NULL, NULL),
(1586, 'F', 11, 334, 2014, '2014-11-18 16:02:27', 4, 'ACABAMENTO', '0', NULL, NULL),
(1587, 'F', 11, 335, 2014, '2014-11-18 16:02:35', 4, 'ACABAMENTO', '0', NULL, NULL),
(1588, 'V', 13, 348, 2014, '2014-11-18 16:06:17', 3, 'NOVO', '0', NULL, NULL),
(1589, 'F', 13, 348, 2014, '2014-11-18 16:07:00', 3, 'IMPRESSAO', '0', NULL, NULL),
(1590, 'V', 13, 347, 2014, '2014-11-18 16:07:03', 3, 'NOVO', '0', NULL, NULL),
(1591, 'F', 13, 347, 2014, '2014-11-18 16:07:54', 3, 'IMPRESSAO', '0', NULL, NULL),
(1592, 'V', 13, 346, 2014, '2014-11-18 16:11:36', 3, 'NOVO', '0', NULL, NULL),
(1593, 'V', 13, 344, 2014, '2014-11-18 16:12:06', 3, 'NOVO', '0', NULL, NULL),
(1594, 'F', 11, 339, 2014, '2014-11-18 16:15:17', 4, 'ACABAMENTO', '0', NULL, NULL),
(1595, 'F', 11, 336, 2014, '2014-11-18 16:15:32', 4, 'PRD/ACABAMENTO', '0', NULL, NULL),
(1596, 'V', 13, 350, 2014, '2014-11-18 17:04:04', 3, 'NOVO', '0', NULL, NULL),
(1597, 'F', 13, 350, 2014, '2014-11-18 17:04:25', 3, 'IMPRESSAO', '0', NULL, NULL),
(1598, 'V', 33, 334, 2014, '2014-11-18 17:52:40', 5, 'NOVO', '0', NULL, NULL),
(1599, 'V', 33, 334, 2014, '2014-11-18 17:52:55', 5, 'NOVO', '0', NULL, NULL),
(1600, 'F', 33, 334, 2014, '2014-11-18 17:53:06', 5, 'FINALIZADO', '0', NULL, NULL),
(1601, 'V', 14, 334, 2014, '2014-11-18 18:07:01', 2, 'NOVO', '0', NULL, NULL),
(1602, 'F', 14, 334, 2014, '2014-11-18 18:07:26', 2, 'FINALIZADO', '0', NULL, NULL),
(1603, 'V', 12, 351, 2014, '2014-11-19 08:04:02', 3, 'NOVO', '0', NULL, NULL),
(1604, 'F', 12, 351, 2014, '2014-11-19 08:08:05', 3, 'IMPRESSAO', '0', NULL, NULL),
(1605, 'F', 11, 296, 2014, '2014-11-19 08:26:04', 4, 'ACABAMENTO', '0', NULL, NULL),
(1606, 'V', 11, 347, 2014, '2014-11-19 08:27:22', 4, 'NOVO', '0', NULL, NULL),
(1607, 'V', 11, 348, 2014, '2014-11-19 08:28:04', 4, 'NOVO', '0', NULL, NULL),
(1608, 'V', 11, 350, 2014, '2014-11-19 08:28:14', 4, 'NOVO', '0', NULL, NULL),
(1609, 'V', 11, 351, 2014, '2014-11-19 08:28:25', 4, 'NOVO', '0', NULL, NULL),
(1610, 'V', 13, 352, 2014, '2014-11-19 08:48:16', 3, 'NOVO', '0', NULL, NULL),
(1611, 'F', 13, 352, 2014, '2014-11-19 08:48:50', 3, 'IMPRESSAO', '0', NULL, NULL),
(1612, 'V', 13, 343, 2014, '2014-11-19 09:26:18', 3, 'NOVO', '0', NULL, NULL),
(1613, 'V', 13, 338, 2014, '2014-11-19 09:26:25', 3, 'NOVO', '0', NULL, NULL),
(1614, 'F', 13, 338, 2014, '2014-11-19 09:26:42', 3, 'IMPRESSAO', '0', NULL, NULL),
(1615, 'V', 13, 353, 2014, '2014-11-19 09:29:17', 3, 'NOVO', '0', NULL, NULL),
(1616, 'F', 13, 353, 2014, '2014-11-19 09:30:59', 3, 'IMPRESSAO', '0', NULL, NULL),
(1617, 'F', 13, 346, 2014, '2014-11-19 09:31:15', 3, 'IMPRESSAO', '0', NULL, NULL),
(1618, 'V', 12, 354, 2014, '2014-11-19 10:04:38', 3, 'NOVO', '0', NULL, NULL),
(1619, 'V', 13, 330, 2014, '2014-11-19 10:05:17', 3, 'NOVO', '0', NULL, NULL),
(1620, 'F', 13, 330, 2014, '2014-11-19 10:05:32', 3, 'IMPRESSAO', '0', NULL, NULL),
(1621, 'V', 13, 328, 2014, '2014-11-19 10:05:36', 3, 'NOVO', '0', NULL, NULL),
(1622, 'V', 14, 316, 2014, '2014-11-19 10:08:24', 2, 'NOVO', '0', NULL, NULL),
(1623, 'F', 14, 316, 2014, '2014-11-19 10:08:29', 2, 'FINALIZADO', '0', NULL, NULL),
(1624, 'V', 15, 355, 2014, '2014-11-19 10:20:16', 3, 'NOVO', '0', NULL, NULL),
(1625, 'F', 12, 354, 2014, '2014-11-19 10:21:02', 3, 'IMPRESSAO', '0', NULL, NULL),
(1626, 'F', 15, 355, 2014, '2014-11-19 10:21:11', 3, 'IMPRESSAO', '0', NULL, NULL),
(1627, 'V', 14, 315, 2014, '2014-11-19 10:44:08', 2, 'NOVO', '0', NULL, NULL),
(1628, 'V', 33, 339, 2014, '2014-11-19 10:47:01', 5, 'NOVO', '0', NULL, NULL),
(1629, 'F', 33, 315, 2014, '2014-11-19 10:47:15', 5, 'FINALIZADO', '0', NULL, NULL),
(1630, 'V', 14, 315, 2014, '2014-11-19 10:48:18', 2, 'NOVO', '0', NULL, NULL),
(1631, 'F', 14, 315, 2014, '2014-11-19 10:48:24', 2, 'FINALIZADO', '0', NULL, NULL),
(1632, 'V', 11, 355, 2014, '2014-11-19 11:53:18', 4, 'NOVO', '0', NULL, NULL),
(1633, 'V', 11, 352, 2014, '2014-11-19 11:53:40', 4, 'NOVO', '0', NULL, NULL),
(1634, 'F', 11, 348, 2014, '2014-11-19 11:54:06', 4, 'ACABAMENTO', '0', NULL, NULL),
(1635, 'V', 11, 346, 2014, '2014-11-19 11:54:56', 4, 'NOVO', '0', NULL, NULL),
(1636, 'F', 11, 346, 2014, '2014-11-19 11:55:05', 4, 'ACABAMENTO', '0', NULL, NULL),
(1637, 'V', 11, 330, 2014, '2014-11-19 11:55:36', 4, 'NOVO', '0', NULL, NULL),
(1638, 'F', 11, 330, 2014, '2014-11-19 11:55:43', 4, 'ACABAMENTO', '0', NULL, NULL),
(1639, 'V', 11, 338, 2014, '2014-11-19 11:55:50', 4, 'NOVO', '0', NULL, NULL),
(1640, 'F', 11, 338, 2014, '2014-11-19 11:56:04', 4, 'ACABAMENTO', '0', NULL, NULL),
(1641, 'V', 33, 292, 2014, '2014-11-19 11:57:19', 5, 'NOVO', '0', NULL, NULL),
(1642, 'F', 33, 292, 2014, '2014-11-19 11:57:34', 5, 'FINALIZADO', '0', NULL, NULL),
(1643, 'V', 33, 296, 2014, '2014-11-19 11:57:54', 5, 'NOVO', '0', NULL, NULL),
(1644, 'V', 33, 310, 2014, '2014-11-19 11:58:28', 5, 'NOVO', '0', NULL, NULL),
(1645, 'F', 33, 310, 2014, '2014-11-19 11:58:39', 5, 'FINALIZADO', '0', NULL, NULL),
(1646, 'V', 33, 335, 2014, '2014-11-19 11:58:47', 5, 'NOVO', '0', NULL, NULL),
(1647, 'F', 33, 335, 2014, '2014-11-19 11:58:52', 5, 'FINALIZADO', '0', NULL, NULL),
(1648, 'V', 33, 333, 2014, '2014-11-19 11:59:07', 5, 'NOVO', '0', NULL, NULL),
(1649, 'V', 33, 336, 2014, '2014-11-19 11:59:38', 5, 'NOVO', '0', NULL, NULL),
(1650, 'V', 33, 337, 2014, '2014-11-19 11:59:52', 5, 'NOVO', '0', NULL, NULL),
(1651, 'V', 33, 338, 2014, '2014-11-19 12:00:17', 5, 'NOVO', '0', NULL, NULL),
(1652, 'V', 13, 356, 2014, '2014-11-19 12:00:23', 3, 'NOVO', '0', NULL, NULL),
(1653, 'F', 33, 338, 2014, '2014-11-19 12:00:34', 5, 'FINALIZADO', '0', NULL, NULL),
(1654, 'V', 33, 340, 2014, '2014-11-19 12:00:37', 5, 'NOVO', '0', NULL, NULL),
(1655, 'F', 33, 340, 2014, '2014-11-19 12:00:48', 5, 'FINALIZADO', '0', NULL, NULL),
(1656, 'V', 33, 346, 2014, '2014-11-19 12:00:52', 5, 'NOVO', '0', NULL, NULL),
(1657, 'F', 33, 346, 2014, '2014-11-19 12:00:58', 5, 'FINALIZADO', '0', NULL, NULL),
(1658, 'V', 33, 348, 2014, '2014-11-19 12:01:10', 5, 'NOVO', '0', NULL, NULL),
(1659, 'V', 33, 312, 2014, '2014-11-19 12:01:44', 5, 'NOVO', '0', NULL, NULL),
(1660, 'F', 33, 312, 2014, '2014-11-19 12:01:50', 5, 'FINALIZADO', '0', NULL, NULL),
(1661, 'V', 33, 324, 2014, '2014-11-19 12:01:55', 5, 'NOVO', '0', NULL, NULL),
(1662, 'F', 33, 324, 2014, '2014-11-19 12:02:10', 5, 'FINALIZADO', '0', NULL, NULL),
(1663, 'V', 33, 330, 2014, '2014-11-19 12:02:13', 5, 'NOVO', '0', NULL, NULL),
(1664, 'F', 33, 330, 2014, '2014-11-19 12:02:22', 5, 'FINALIZADO', '0', NULL, NULL),
(1665, 'F', 33, 339, 2014, '2014-11-19 12:02:50', 5, 'FINALIZADO', '0', NULL, NULL),
(1666, 'F', 12, 356, 2014, '2014-11-19 12:10:32', 3, 'PRD/IMPRESSAO', '0', NULL, NULL),
(1667, 'V', 11, 356, 2014, '2014-11-19 13:01:49', 4, 'NOVO', '0', NULL, NULL),
(1668, 'V', 11, 354, 2014, '2014-11-19 13:02:11', 4, 'NOVO', '0', NULL, NULL),
(1669, 'V', 11, 353, 2014, '2014-11-19 13:02:33', 4, 'NOVO', '0', NULL, NULL),
(1670, 'F', 11, 355, 2014, '2014-11-19 13:38:36', 4, 'ACABAMENTO', '0', NULL, NULL),
(1671, 'F', 11, 352, 2014, '2014-11-19 13:39:06', 4, 'ACABAMENTO', '0', NULL, NULL),
(1672, 'V', 15, 359, 2014, '2014-11-19 13:41:49', 3, 'NOVO', '0', NULL, NULL),
(1673, 'V', 13, 358, 2014, '2014-11-19 13:42:50', 3, 'NOVO', '0', NULL, NULL),
(1674, 'F', 13, 358, 2014, '2014-11-19 13:44:29', 3, 'IMPRESSAO', '0', NULL, NULL),
(1675, 'V', 13, 357, 2014, '2014-11-19 13:44:34', 3, 'NOVO', '0', NULL, NULL),
(1676, 'F', 13, 357, 2014, '2014-11-19 13:45:08', 3, 'IMPRESSAO', '0', NULL, NULL),
(1677, 'F', 15, 359, 2014, '2014-11-19 13:59:00', 3, 'IMPRESSAO', '0', NULL, NULL),
(1678, 'V', 14, 321, 2014, '2014-11-19 14:06:09', 2, 'NOVO', '0', NULL, NULL),
(1679, 'F', 14, 321, 2014, '2014-11-19 14:06:15', 2, 'FINALIZADO', '0', NULL, NULL),
(1680, 'V', 14, 311, 2014, '2014-11-19 14:06:59', 2, 'NOVO', '0', NULL, NULL),
(1681, 'F', 14, 311, 2014, '2014-11-19 14:07:09', 2, 'FINALIZADO', '0', NULL, NULL),
(1682, 'V', 11, 358, 2014, '2014-11-19 14:17:37', 4, 'NOVO', '0', NULL, NULL),
(1683, 'V', 14, 323, 2014, '2014-11-19 14:20:53', 2, 'NOVO', '0', NULL, NULL),
(1684, 'F', 14, 323, 2014, '2014-11-19 14:21:01', 2, 'FINALIZADO', '0', NULL, NULL),
(1685, 'V', 14, 231, 2014, '2014-11-19 14:21:40', 2, 'NOVO', '0', NULL, NULL),
(1686, 'V', 14, 335, 2014, '2014-11-19 14:24:43', 2, 'NOVO', '0', NULL, NULL),
(1687, 'F', 14, 335, 2014, '2014-11-19 14:24:54', 2, 'FINALIZADO', '0', NULL, NULL),
(1688, 'V', 14, 312, 2014, '2014-11-19 14:25:46', 2, 'NOVO', '0', NULL, NULL),
(1689, 'F', 11, 237, 2014, '2014-11-19 14:25:51', 4, 'ACABAMENTO', '0', NULL, NULL),
(1690, 'F', 14, 312, 2014, '2014-11-19 14:25:55', 2, 'FINALIZADO', '0', NULL, NULL),
(1691, 'F', 11, 236, 2014, '2014-11-19 14:26:04', 4, 'ACABAMENTO', '0', NULL, NULL),
(1692, 'F', 11, 298, 2014, '2014-11-19 14:26:13', 4, 'ACABAMENTO', '0', NULL, NULL),
(1693, 'V', 14, 310, 2014, '2014-11-19 14:26:16', 2, 'NOVO', '0', NULL, NULL),
(1694, 'F', 14, 310, 2014, '2014-11-19 14:26:27', 2, 'FINALIZADO', '0', NULL, NULL),
(1695, 'F', 11, 317, 2014, '2014-11-19 14:27:47', 4, 'ACABAMENTO', '0', NULL, NULL),
(1696, 'F', 11, 318, 2014, '2014-11-19 14:27:57', 4, 'ACABAMENTO', '0', NULL, NULL),
(1697, 'F', 11, 319, 2014, '2014-11-19 14:36:57', 4, 'ACABAMENTO', '0', NULL, NULL),
(1698, 'F', 11, 320, 2014, '2014-11-19 14:37:08', 4, 'ACABAMENTO', '0', NULL, NULL),
(1699, 'V', 11, 359, 2014, '2014-11-19 14:39:32', 4, 'NOVO', '0', NULL, NULL),
(1700, 'F', 11, 353, 2014, '2014-11-19 14:45:30', 4, 'ACABAMENTO', '0', NULL, NULL),
(1701, 'V', 11, 357, 2014, '2014-11-19 14:45:53', 4, 'NOVO', '0', NULL, NULL),
(1702, 'V', 13, 361, 2014, '2014-11-19 14:50:55', 3, 'NOVO', '0', NULL, NULL),
(1703, 'F', 13, 361, 2014, '2014-11-19 14:51:20', 3, 'IMPRESSAO', '0', NULL, NULL),
(1704, 'F', 11, 273, 2014, '2014-11-19 14:57:27', 4, 'ACABAMENTO', '0', NULL, NULL),
(1705, 'F', 11, 322, 2014, '2014-11-19 14:57:37', 4, 'ACABAMENTO', '0', NULL, NULL),
(1706, 'F', 11, 359, 2014, '2014-11-19 14:57:58', 4, 'ACABAMENTO', '0', NULL, NULL),
(1707, 'V', 8, 318, 2014, '2014-11-19 15:28:28', 1, 'NOVO', '0', NULL, NULL),
(1708, 'V', 13, 362, 2014, '2014-11-19 15:36:46', 3, 'NOVO', '0', NULL, NULL),
(1709, 'F', 13, 362, 2014, '2014-11-19 15:38:05', 3, 'IMPRESSAO', '0', NULL, NULL),
(1710, 'V', 17, 355, 2014, '2014-11-19 15:41:57', 5, 'NOVO', '0', NULL, NULL),
(1711, 'V', 17, 339, 2014, '2014-11-19 16:07:06', 5, 'NOVO', '0', NULL, NULL),
(1712, 'V', 13, 329, 2014, '2014-11-19 17:57:48', 3, 'NOVO', '0', NULL, NULL),
(1713, 'V', 11, 362, 2014, '2014-11-20 08:20:21', 4, 'NOVO', '0', NULL, NULL),
(1714, 'V', 11, 361, 2014, '2014-11-20 08:44:53', 4, 'NOVO', '0', NULL, NULL),
(1715, 'V', 14, 346, 2014, '2014-11-20 08:49:07', 2, 'NOVO', '0', NULL, NULL),
(1716, 'F', 14, 346, 2014, '2014-11-20 08:49:11', 2, 'FINALIZADO', '0', NULL, NULL),
(1717, 'V', 14, 330, 2014, '2014-11-20 08:49:25', 2, 'NOVO', '0', NULL, NULL),
(1718, 'F', 14, 330, 2014, '2014-11-20 08:49:30', 2, 'FINALIZADO', '0', NULL, NULL),
(1719, 'V', 14, 285, 2014, '2014-11-20 08:50:28', 2, 'NOVO', '0', NULL, NULL),
(1720, 'F', 14, 285, 2014, '2014-11-20 08:50:34', 2, 'FINALIZADO', '0', NULL, NULL),
(1721, 'V', 14, 292, 2014, '2014-11-20 09:22:15', 2, 'NOVO', '0', NULL, NULL),
(1722, 'F', 14, 292, 2014, '2014-11-20 09:22:25', 2, 'FINALIZADO', '0', NULL, NULL),
(1723, 'F', 15, 329, 2014, '2014-11-20 09:40:44', 3, 'IMPRESSAO', '0', NULL, NULL),
(1724, 'V', 13, 363, 2014, '2014-11-20 10:21:11', 3, 'NOVO', '0', NULL, NULL),
(1725, 'F', 11, 361, 2014, '2014-11-20 10:22:52', 4, 'ACABAMENTO', '0', NULL, NULL),
(1726, 'F', 11, 350, 2014, '2014-11-20 10:23:22', 4, 'ACABAMENTO', '0', NULL, NULL),
(1727, 'F', 11, 347, 2014, '2014-11-20 10:24:02', 4, 'ACABAMENTO', '0', NULL, NULL),
(1728, 'F', 11, 345, 2014, '2014-11-20 10:24:07', 4, 'ACABAMENTO', '0', NULL, NULL),
(1729, 'F', 12, 363, 2014, '2014-11-20 10:30:33', 3, 'IMPRESSAO', '0', NULL, NULL),
(1730, 'V', 13, 365, 2014, '2014-11-20 10:30:35', 3, 'NOVO', '0', NULL, NULL),
(1731, 'F', 13, 365, 2014, '2014-11-20 10:31:30', 3, 'IMPRESSAO', '0', NULL, NULL),
(1732, 'V', 11, 365, 2014, '2014-11-20 10:32:05', 4, 'NOVO', '0', NULL, NULL),
(1733, 'F', 11, 289, 2014, '2014-11-20 10:32:49', 4, 'ACABAMENTO', '0', NULL, NULL),
(1734, 'V', 14, 273, 2014, '2014-11-20 11:02:48', 2, 'NOVO', '0', NULL, NULL),
(1735, 'V', 17, 345, 2014, '2014-11-20 11:04:02', 5, 'NOVO', '0', NULL, NULL),
(1736, 'V', 13, 367, 2014, '2014-11-20 11:29:28', 3, 'NOVO', '0', NULL, NULL),
(1737, 'V', 13, 368, 2014, '2014-11-20 11:29:44', 3, 'NOVO', '0', NULL, NULL),
(1738, 'F', 17, 333, 2014, '2014-11-20 11:29:47', 5, 'FINALIZADO', '0', NULL, NULL),
(1739, 'F', 13, 368, 2014, '2014-11-20 11:29:54', 3, 'IMPRESSAO', '0', NULL, NULL),
(1740, 'V', 17, 347, 2014, '2014-11-20 11:30:11', 5, 'NOVO', '0', NULL, NULL),
(1741, 'F', 13, 367, 2014, '2014-11-20 11:32:40', 3, 'IMPRESSAO', '0', NULL, NULL),
(1742, 'V', 17, 361, 2014, '2014-11-20 11:40:22', 5, 'NOVO', '0', NULL, NULL),
(1743, 'F', 17, 361, 2014, '2014-11-20 11:40:29', 5, 'FINALIZADO', '0', NULL, NULL),
(1744, 'V', 17, 359, 2014, '2014-11-20 11:40:33', 5, 'NOVO', '0', NULL, NULL),
(1745, 'V', 17, 352, 2014, '2014-11-20 11:40:47', 5, 'NOVO', '0', NULL, NULL),
(1746, 'F', 17, 273, 2014, '2014-11-20 11:41:04', 5, 'FINALIZADO', '0', NULL, NULL),
(1747, 'F', 17, 296, 2014, '2014-11-20 11:41:10', 5, 'FINALIZADO', '0', NULL, NULL),
(1748, 'F', 17, 318, 2014, '2014-11-20 11:41:15', 5, 'FINALIZADO', '0', NULL, NULL),
(1749, 'V', 17, 298, 2014, '2014-11-20 11:41:21', 5, 'NOVO', '0', NULL, NULL),
(1750, 'V', 17, 322, 2014, '2014-11-20 11:41:36', 5, 'NOVO', '0', NULL, NULL),
(1751, 'V', 17, 317, 2014, '2014-11-20 11:43:32', 5, 'NOVO', '0', NULL, NULL),
(1752, 'V', 17, 319, 2014, '2014-11-20 11:43:43', 5, 'NOVO', '0', NULL, NULL),
(1753, 'V', 11, 367, 2014, '2014-11-20 11:50:16', 4, 'NOVO', '0', NULL, NULL),
(1754, 'V', 12, 370, 2014, '2014-11-20 12:32:31', 3, 'NOVO', '0', NULL, NULL),
(1755, 'F', 12, 370, 2014, '2014-11-20 12:36:13', 3, 'PRD/IMPRESSAO', '0', NULL, NULL),
(1756, 'V', 11, 368, 2014, '2014-11-20 13:19:39', 4, 'NOVO', '0', NULL, NULL),
(1757, 'V', 15, 371, 2014, '2014-11-20 13:19:39', 3, 'NOVO', '0', NULL, NULL),
(1758, 'F', 15, 371, 2014, '2014-11-20 13:19:45', 3, 'IMPRESSAO', '0', NULL, NULL),
(1759, 'F', 11, 368, 2014, '2014-11-20 13:19:55', 4, 'ACABAMENTO', '0', NULL, NULL),
(1760, 'V', 11, 329, 2014, '2014-11-20 13:20:03', 4, 'NOVO', '0', NULL, NULL),
(1761, 'V', 11, 371, 2014, '2014-11-20 13:20:48', 4, 'NOVO', '0', NULL, NULL),
(1762, 'F', 11, 371, 2014, '2014-11-20 13:30:20', 4, 'ACABAMENTO', '0', NULL, NULL),
(1763, 'V', 13, 369, 2014, '2014-11-20 13:31:59', 3, 'NOVO', '0', NULL, NULL),
(1764, 'V', 12, 372, 2014, '2014-11-20 13:39:08', 3, 'NOVO', '0', NULL, NULL),
(1765, 'F', 12, 372, 2014, '2014-11-20 13:39:16', 3, 'IMPRESSAO', '0', NULL, NULL),
(1766, 'V', 13, 373, 2014, '2014-11-20 13:53:19', 3, 'NOVO', '0', NULL, NULL),
(1767, 'F', 13, 373, 2014, '2014-11-20 13:53:58', 3, 'IMPRESSAO', '0', NULL, NULL),
(1768, 'F', 12, 369, 2014, '2014-11-20 14:05:53', 3, 'IMPRESSAO', '0', NULL, NULL),
(1769, 'V', 36, 370, 2014, '2014-11-20 15:08:32', 8, 'NOVO', '0', NULL, NULL),
(1770, 'F', 17, 347, 2014, '2014-11-20 15:45:14', 5, 'FINALIZADO', '0', NULL, NULL),
(1771, 'F', 17, 352, 2014, '2014-11-20 15:45:29', 5, 'FINALIZADO', '0', NULL, NULL),
(1772, 'V', 11, 373, 2014, '2014-11-20 16:10:39', 4, 'NOVO', '0', NULL, NULL),
(1773, 'V', 11, 372, 2014, '2014-11-20 16:10:46', 4, 'NOVO', '0', NULL, NULL),
(1774, 'F', 11, 372, 2014, '2014-11-20 16:10:56', 4, 'ACABAMENTO', '0', NULL, NULL),
(1775, 'V', 11, 369, 2014, '2014-11-20 16:11:01', 4, 'NOVO', '0', NULL, NULL),
(1776, 'F', 11, 367, 2014, '2014-11-20 16:11:51', 4, 'ACABAMENTO', '0', NULL, NULL),
(1777, 'F', 11, 365, 2014, '2014-11-20 16:12:08', 4, 'ACABAMENTO', '0', NULL, NULL),
(1778, 'F', 11, 362, 2014, '2014-11-20 16:12:19', 4, 'ACABAMENTO', '0', NULL, NULL),
(1779, 'V', 14, 313, 2014, '2014-11-20 16:18:36', 2, 'NOVO', '0', NULL, NULL),
(1780, 'F', 14, 313, 2014, '2014-11-20 16:19:01', 2, 'FINALIZADO', '0', NULL, NULL),
(1781, 'V', 13, 375, 2014, '2014-11-20 16:48:17', 3, 'NOVO', '0', NULL, NULL),
(1782, 'F', 13, 375, 2014, '2014-11-20 16:50:11', 3, 'IMPRESSAO', '0', NULL, NULL),
(1783, 'V', 14, 361, 2014, '2014-11-20 17:10:33', 2, 'NOVO', '0', NULL, NULL),
(1784, 'F', 14, 361, 2014, '2014-11-20 17:10:44', 2, 'FINALIZADO', '0', NULL, NULL),
(1785, 'V', 14, 297, 2014, '2014-11-20 17:11:33', 2, 'NOVO', '0', NULL, NULL),
(1786, 'F', 14, 297, 2014, '2014-11-20 17:11:42', 2, 'FINALIZADO', '0', NULL, NULL),
(1787, 'V', 14, 302, 2014, '2014-11-20 17:11:57', 2, 'NOVO', '0', NULL, NULL),
(1788, 'F', 14, 302, 2014, '2014-11-20 17:12:09', 2, 'FINALIZADO', '0', NULL, NULL),
(1789, 'V', 36, 328, 2014, '2014-11-20 17:12:22', 8, 'NOVO', '0', NULL, NULL),
(1790, 'V', 14, 273, 2014, '2014-11-20 17:12:42', 2, 'NOVO', '0', NULL, NULL),
(1791, 'F', 14, 273, 2014, '2014-11-20 17:12:47', 2, 'FINALIZADO', '0', NULL, NULL),
(1792, 'V', 36, 332, 2014, '2014-11-20 17:13:43', 8, 'NOVO', '0', NULL, NULL),
(1793, 'V', 12, 377, 2014, '2014-11-21 08:16:48', 3, 'NOVO', '0', NULL, NULL),
(1794, 'F', 12, 377, 2014, '2014-11-21 08:17:45', 3, 'PRD/IMPRESSAO', '0', NULL, NULL),
(1795, 'F', 11, 314, 2014, '2014-11-21 08:26:25', 4, 'ACABAMENTO', '0', NULL, NULL),
(1796, 'F', 11, 329, 2014, '2014-11-21 08:26:41', 4, 'ACABAMENTO', '0', NULL, NULL),
(1797, 'V', 11, 375, 2014, '2014-11-21 08:27:35', 4, 'NOVO', '0', NULL, NULL),
(1798, 'V', 12, 379, 2014, '2014-11-21 08:45:38', 3, 'NOVO', '0', NULL, NULL),
(1799, 'V', 12, 379, 2014, '2014-11-21 08:45:57', 3, 'NOVO', '0', NULL, NULL),
(1800, 'F', 12, 379, 2014, '2014-11-21 08:48:39', 3, 'IMPRESSAO', '0', NULL, NULL),
(1801, 'V', 13, 374, 2014, '2014-11-21 09:12:08', 3, 'NOVO', '0', NULL, NULL),
(1802, 'V', 15, 380, 2014, '2014-11-21 09:18:37', 3, 'NOVO', '0', NULL, NULL),
(1803, 'F', 13, 374, 2014, '2014-11-21 09:19:22', 3, 'IMPRESSAO', '0', NULL, NULL),
(1804, 'F', 15, 380, 2014, '2014-11-21 09:21:00', 3, 'IMPRESSAO', '0', NULL, NULL),
(1805, 'V', 11, 380, 2014, '2014-11-21 09:34:55', 4, 'NOVO', '0', NULL, NULL),
(1806, 'V', 11, 379, 2014, '2014-11-21 09:35:07', 4, 'NOVO', '0', NULL, NULL),
(1807, 'V', 11, 377, 2014, '2014-11-21 09:40:28', 4, 'NOVO', '0', NULL, NULL),
(1808, 'V', 14, 239, 2014, '2014-11-21 10:10:16', 2, 'NOVO', '0', NULL, NULL),
(1809, 'F', 14, 239, 2014, '2014-11-21 10:10:24', 2, 'FINALIZADO', '0', NULL, NULL),
(1810, 'F', 14, 248, 2014, '2014-11-21 10:10:49', 2, 'FINALIZADO', '0', NULL, NULL),
(1811, 'V', 14, 296, 2014, '2014-11-21 10:26:08', 2, 'NOVO', '0', NULL, NULL),
(1812, 'V', 11, 374, 2014, '2014-11-21 10:30:16', 4, 'NOVO', '0', NULL, NULL),
(1813, 'F', 11, 373, 2014, '2014-11-21 10:30:30', 4, 'ACABAMENTO', '0', NULL, NULL),
(1814, 'V', 12, 381, 2014, '2014-11-21 11:15:54', 3, 'NOVO', '0', NULL, NULL),
(1815, 'F', 11, 375, 2014, '2014-11-21 11:19:11', 4, 'ACABAMENTO', '0', NULL, NULL),
(1816, 'F', 12, 381, 2014, '2014-11-21 11:19:57', 3, 'IMPRESSAO', '0', NULL, NULL),
(1817, 'F', 11, 351, 2014, '2014-11-21 11:20:33', 4, 'ACABAMENTO', '0', NULL, NULL),
(1818, 'V', 36, 275, 2014, '2014-11-21 11:45:38', 8, 'NOVO', '0', NULL, NULL),
(1819, 'V', 36, 275, 2014, '2014-11-21 11:49:46', 8, 'NOVO', '0', NULL, NULL),
(1820, 'V', 36, 280, 2014, '2014-11-21 11:50:05', 8, 'NOVO', '0', NULL, NULL),
(1821, 'V', 15, 384, 2014, '2014-11-21 12:11:22', 3, 'NOVO', '0', NULL, NULL),
(1822, 'F', 15, 384, 2014, '2014-11-21 12:21:09', 3, 'IMPRESSAO', '0', NULL, NULL),
(1823, 'V', 36, 377, 2014, '2014-11-21 12:38:34', 8, 'NOVO', '0', NULL, NULL),
(1824, 'V', 36, 366, 2014, '2014-11-21 12:39:02', 8, 'NOVO', '0', NULL, NULL),
(1825, 'V', 36, 366, 2014, '2014-11-21 12:39:35', 8, 'NOVO', '0', NULL, NULL),
(1826, 'V', 36, 366, 2014, '2014-11-21 12:39:48', 8, 'NOVO', '0', NULL, NULL),
(1827, 'F', 11, 380, 2014, '2014-11-21 13:20:01', 4, 'ACABAMENTO', '0', NULL, NULL),
(1828, 'F', 11, 379, 2014, '2014-11-21 13:20:12', 4, 'ACABAMENTO', '0', NULL, NULL),
(1829, 'F', 11, 374, 2014, '2014-11-21 13:20:41', 4, 'ACABAMENTO', '0', NULL, NULL),
(1830, 'V', 11, 381, 2014, '2014-11-21 13:20:54', 4, 'NOVO', '0', NULL, NULL),
(1831, 'V', 11, 384, 2014, '2014-11-21 13:50:01', 4, 'NOVO', '0', NULL, NULL),
(1832, 'F', 11, 384, 2014, '2014-11-21 13:50:07', 4, 'ACABAMENTO', '0', NULL, NULL),
(1833, 'F', 11, 369, 2014, '2014-11-21 13:57:54', 4, 'ACABAMENTO', '0', NULL, NULL),
(1834, 'V', 12, 383, 2014, '2014-11-21 13:58:44', 3, 'NOVO', '0', NULL, NULL),
(1835, 'F', 12, 383, 2014, '2014-11-21 13:59:44', 3, 'IMPRESSAO', '0', NULL, NULL),
(1836, 'V', 13, 386, 2014, '2014-11-21 14:04:21', 3, 'NOVO', '0', NULL, NULL),
(1837, 'F', 13, 386, 2014, '2014-11-21 14:05:05', 3, 'IMPRESSAO', '0', NULL, NULL),
(1838, 'V', 11, 383, 2014, '2014-11-21 14:06:18', 4, 'NOVO', '0', NULL, NULL),
(1839, 'F', 35, 359, 2014, '2014-11-21 14:06:44', 5, 'FINALIZADO', '0', NULL, NULL),
(1840, 'V', 13, 385, 2014, '2014-11-21 14:29:17', 3, 'NOVO', '0', NULL, NULL),
(1841, 'F', 13, 385, 2014, '2014-11-21 14:31:53', 3, 'IMPRESSAO', '0', NULL, NULL),
(1842, 'V', 13, 378, 2014, '2014-11-21 14:32:00', 3, 'NOVO', '0', NULL, NULL),
(1843, 'V', 36, 356, 2014, '2014-11-21 14:32:44', 8, 'NOVO', '0', NULL, NULL),
(1844, 'V', 36, 356, 2014, '2014-11-21 14:35:20', 8, 'NOVO', '0', NULL, NULL),
(1845, 'V', 11, 386, 2014, '2014-11-21 15:06:44', 4, 'NOVO', '0', NULL, NULL),
(1846, 'F', 11, 383, 2014, '2014-11-21 15:06:54', 4, 'ACABAMENTO', '0', NULL, NULL),
(1847, 'F', 11, 357, 2014, '2014-11-21 15:07:07', 4, 'ACABAMENTO', '0', NULL, NULL),
(1848, 'V', 11, 385, 2014, '2014-11-21 15:07:11', 4, 'NOVO', '0', NULL, NULL),
(1849, 'F', 35, 322, 2014, '2014-11-21 15:12:18', 5, 'FINALIZADO', '0', NULL, NULL),
(1850, 'F', 35, 317, 2014, '2014-11-21 15:12:47', 5, 'FINALIZADO', '0', NULL, NULL),
(1851, 'V', 13, 389, 2014, '2014-11-21 15:18:16', 3, 'NOVO', '0', NULL, NULL),
(1852, 'F', 13, 389, 2014, '2014-11-21 15:19:18', 3, 'IMPRESSAO', '0', NULL, NULL),
(1853, 'V', 12, 390, 2014, '2014-11-21 16:10:15', 3, 'NOVO', '0', NULL, NULL),
(1854, 'F', 12, 390, 2014, '2014-11-21 16:11:05', 3, 'IMPRESSAO', '0', NULL, NULL),
(1855, 'V', 11, 380, 2014, '2014-11-21 16:18:09', 4, 'NOVO', '0', NULL, NULL),
(1856, 'V', 12, 382, 2014, '2014-11-21 16:18:32', 3, 'NOVO', '0', NULL, NULL),
(1857, 'V', 11, 379, 2014, '2014-11-21 16:18:48', 4, 'NOVO', '0', NULL, NULL),
(1858, 'F', 12, 382, 2014, '2014-11-21 16:19:22', 3, 'IMPRESSAO', '0', NULL, NULL),
(1859, 'V', 11, 367, 2014, '2014-11-21 16:23:22', 4, 'NOVO', '0', NULL, NULL),
(1860, 'V', 11, 347, 2014, '2014-11-21 16:24:04', 4, 'NOVO', '0', NULL, NULL),
(1861, 'V', 11, 276, 2014, '2014-11-21 16:24:08', 4, 'NOVO', '0', NULL, NULL),
(1862, 'V', 11, 383, 2014, '2014-11-21 16:24:44', 4, 'NOVO', '0', NULL, NULL),
(1863, 'V', 13, 391, 2014, '2014-11-21 16:51:08', 3, 'NOVO', '0', NULL, NULL),
(1864, 'F', 13, 391, 2014, '2014-11-21 16:57:28', 3, 'IMPRESSAO', '0', NULL, NULL),
(1865, 'V', 11, 390, 2014, '2014-11-21 17:26:34', 4, 'NOVO', '0', NULL, NULL),
(1866, 'V', 11, 389, 2014, '2014-11-21 17:26:41', 4, 'NOVO', '0', NULL, NULL),
(1867, 'V', 17, 384, 2014, '2014-11-21 17:27:43', 5, 'NOVO', '0', NULL, NULL),
(1868, 'V', 17, 375, 2014, '2014-11-21 17:27:48', 5, 'NOVO', '0', NULL, NULL),
(1869, 'V', 17, 374, 2014, '2014-11-21 17:27:52', 5, 'NOVO', '0', NULL, NULL),
(1870, 'V', 17, 373, 2014, '2014-11-21 17:28:00', 5, 'NOVO', '0', NULL, NULL),
(1871, 'V', 17, 372, 2014, '2014-11-21 17:28:08', 5, 'NOVO', '0', NULL, NULL),
(1872, 'V', 17, 371, 2014, '2014-11-21 17:28:12', 5, 'NOVO', '0', NULL, NULL),
(1873, 'V', 17, 369, 2014, '2014-11-21 17:28:18', 5, 'NOVO', '0', NULL, NULL),
(1874, 'V', 17, 368, 2014, '2014-11-21 17:28:21', 5, 'NOVO', '0', NULL, NULL),
(1875, 'V', 17, 365, 2014, '2014-11-21 17:28:24', 5, 'NOVO', '0', NULL, NULL),
(1876, 'V', 17, 362, 2014, '2014-11-21 17:28:27', 5, 'NOVO', '0', NULL, NULL),
(1877, 'V', 17, 357, 2014, '2014-11-21 17:28:31', 5, 'NOVO', '0', NULL, NULL),
(1878, 'V', 17, 329, 2014, '2014-11-21 17:28:37', 5, 'NOVO', '0', NULL, NULL),
(1879, 'V', 17, 320, 2014, '2014-11-21 17:28:41', 5, 'NOVO', '0', NULL, NULL),
(1880, 'V', 17, 314, 2014, '2014-11-21 17:28:44', 5, 'NOVO', '0', NULL, NULL),
(1881, 'V', 17, 289, 2014, '2014-11-21 17:28:48', 5, 'NOVO', '0', NULL, NULL),
(1882, 'V', 17, 237, 2014, '2014-11-21 17:29:55', 5, 'NOVO', '0', NULL, NULL),
(1883, 'V', 17, 236, 2014, '2014-11-21 17:29:59', 5, 'NOVO', '0', NULL, NULL),
(1884, 'V', 17, 353, 2014, '2014-11-21 17:30:11', 5, 'NOVO', '0', NULL, NULL),
(1885, 'V', 17, 351, 2014, '2014-11-21 17:30:15', 5, 'NOVO', '0', NULL, NULL),
(1886, 'V', 17, 350, 2014, '2014-11-21 17:30:18', 5, 'NOVO', '0', NULL, NULL),
(1887, 'F', 17, 384, 2014, '2014-11-21 17:30:27', 5, 'FINALIZADO', '0', NULL, NULL),
(1888, 'F', 17, 383, 2014, '2014-11-21 17:30:35', 5, 'FINALIZADO', '0', NULL, NULL),
(1889, 'F', 17, 380, 2014, '2014-11-21 17:30:44', 5, 'FINALIZADO', '0', NULL, NULL),
(1890, 'F', 17, 379, 2014, '2014-11-21 17:30:49', 5, 'FINALIZADO', '0', NULL, NULL),
(1891, 'F', 17, 375, 2014, '2014-11-21 17:30:52', 5, 'FINALIZADO', '0', NULL, NULL),
(1892, 'F', 17, 374, 2014, '2014-11-21 17:30:55', 5, 'FINALIZADO', '0', NULL, NULL),
(1893, 'F', 17, 373, 2014, '2014-11-21 17:30:57', 5, 'FINALIZADO', '0', NULL, NULL),
(1894, 'F', 17, 372, 2014, '2014-11-21 17:31:00', 5, 'FINALIZADO', '0', NULL, NULL),
(1895, 'F', 17, 371, 2014, '2014-11-21 17:31:12', 5, 'FINALIZADO', '0', NULL, NULL),
(1896, 'F', 17, 369, 2014, '2014-11-21 17:31:24', 5, 'FINALIZADO', '0', NULL, NULL),
(1897, 'F', 17, 368, 2014, '2014-11-21 17:31:27', 5, 'FINALIZADO', '0', NULL, NULL),
(1898, 'F', 17, 367, 2014, '2014-11-21 17:31:36', 5, 'FINALIZADO', '0', NULL, NULL),
(1899, 'F', 17, 365, 2014, '2014-11-21 17:31:39', 5, 'FINALIZADO', '0', NULL, NULL),
(1900, 'F', 17, 362, 2014, '2014-11-21 17:31:41', 5, 'FINALIZADO', '0', NULL, NULL),
(1901, 'F', 17, 357, 2014, '2014-11-21 17:31:48', 5, 'FINALIZADO', '0', NULL, NULL),
(1902, 'F', 17, 355, 2014, '2014-11-21 17:31:52', 5, 'FINALIZADO', '0', NULL, NULL),
(1903, 'F', 17, 353, 2014, '2014-11-21 17:31:55', 5, 'FINALIZADO', '0', NULL, NULL),
(1904, 'F', 17, 351, 2014, '2014-11-21 17:31:57', 5, 'FINALIZADO', '0', NULL, NULL),
(1905, 'F', 17, 348, 2014, '2014-11-21 17:32:07', 5, 'FINALIZADO', '0', NULL, NULL),
(1906, 'F', 17, 345, 2014, '2014-11-21 17:32:16', 5, 'FINALIZADO', '0', NULL, NULL),
(1907, 'F', 17, 337, 2014, '2014-11-21 17:32:34', 5, 'FINALIZADO', '0', NULL, NULL),
(1908, 'F', 17, 329, 2014, '2014-11-21 17:32:44', 5, 'FINALIZADO', '0', NULL, NULL),
(1909, 'F', 17, 319, 2014, '2014-11-21 17:32:54', 5, 'FINALIZADO', '0', NULL, NULL),
(1910, 'F', 17, 236, 2014, '2014-11-21 17:32:58', 5, 'PRODUCAO', '0', NULL, NULL),
(1911, 'F', 17, 237, 2014, '2014-11-21 17:33:00', 5, 'PRODUCAO', '0', NULL, NULL),
(1912, 'F', 17, 289, 2014, '2014-11-21 17:33:02', 5, 'FINALIZADO', '0', NULL, NULL),
(1913, 'F', 17, 298, 2014, '2014-11-21 17:33:08', 5, 'FINALIZADO', '0', NULL, NULL),
(1914, 'F', 17, 314, 2014, '2014-11-21 17:33:11', 5, 'FINALIZADO', '0', NULL, NULL),
(1915, 'V', 11, 391, 2014, '2014-11-22 09:51:19', 4, 'NOVO', '0', NULL, NULL),
(1916, 'V', 8, 333, 2014, '2014-11-22 12:59:20', 1, 'NOVO', '0', NULL, NULL),
(1917, 'F', 8, 333, 2014, '2014-11-22 12:59:36', 1, 'FINALIZADO', '0', NULL, NULL),
(1918, 'V', 11, 382, 2014, '2014-11-24 08:04:56', 4, 'NOVO', '0', NULL, NULL),
(1919, 'F', 36, 356, 2014, '2014-11-24 08:05:18', 8, 'IMPRESSAO', '0', NULL, NULL),
(1920, 'V', 11, 370, 2014, '2014-11-24 08:07:07', 4, 'NOVO', '0', NULL, NULL),
(1921, 'V', 12, 393, 2014, '2014-11-24 08:09:13', 3, 'NOVO', '0', NULL, NULL),
(1922, 'F', 36, 328, 2014, '2014-11-24 08:12:39', 8, 'ARTE FINALISTA', '0', NULL, NULL),
(1923, 'F', 36, 336, 2014, '2014-11-24 08:13:59', 8, 'ACABAMENTO', '0', NULL, NULL),
(1924, 'V', 36, 237, 2014, '2014-11-24 08:14:20', 8, 'NOVO', '0', NULL, NULL),
(1925, 'F', 12, 393, 2014, '2014-11-24 08:14:30', 3, 'IMPRESSAO', '0', NULL, NULL),
(1926, 'V', 36, 236, 2014, '2014-11-24 08:15:20', 8, 'NOVO', '0', NULL, NULL),
(1927, 'V', 15, 378, 2014, '2014-11-24 08:23:17', 3, 'NOVO', '0', NULL, NULL),
(1928, 'F', 15, 378, 2014, '2014-11-24 08:23:31', 3, 'IMPRESSAO', '0', NULL, NULL),
(1929, 'V', 35, 336, 2014, '2014-11-24 08:24:23', 5, 'NOVO', '0', NULL, NULL),
(1930, 'V', 35, 336, 2014, '2014-11-24 08:24:37', 5, 'NOVO', '0', NULL, NULL),
(1931, 'V', 15, 328, 2014, '2014-11-24 08:36:15', 3, 'NOVO', '0', NULL, NULL),
(1932, 'V', 13, 396, 2014, '2014-11-24 09:08:43', 3, 'NOVO', '0', NULL, NULL),
(1933, 'V', 13, 395, 2014, '2014-11-24 09:09:01', 3, 'NOVO', '0', NULL, NULL),
(1934, 'F', 13, 395, 2014, '2014-11-24 09:10:05', 3, 'IMPRESSAO', '0', NULL, NULL),
(1935, 'V', 13, 394, 2014, '2014-11-24 09:10:07', 3, 'NOVO', '0', NULL, NULL),
(1936, 'F', 13, 394, 2014, '2014-11-24 09:10:13', 3, 'IMPRESSAO', '0', NULL, NULL),
(1937, 'V', 13, 397, 2014, '2014-11-24 09:10:17', 3, 'NOVO', '0', NULL, NULL),
(1938, 'V', 15, 398, 2014, '2014-11-24 09:10:19', 3, 'NOVO', '0', NULL, NULL),
(1939, 'F', 13, 397, 2014, '2014-11-24 09:10:22', 3, 'IMPRESSAO', '0', NULL, NULL),
(1940, 'F', 13, 326, 2014, '2014-11-24 09:10:31', 3, 'IMPRESSAO', '0', NULL, NULL),
(1941, 'V', 13, 387, 2014, '2014-11-24 09:10:40', 3, 'NOVO', '0', NULL, NULL),
(1942, 'F', 15, 398, 2014, '2014-11-24 09:11:03', 3, 'IMPRESSAO', '0', NULL, NULL),
(1943, 'V', 13, 392, 2014, '2014-11-24 09:59:16', 3, 'NOVO', '0', NULL, NULL),
(1944, 'V', 12, 388, 2014, '2014-11-24 10:02:41', 3, 'NOVO', '0', NULL, NULL),
(1945, 'F', 12, 388, 2014, '2014-11-24 10:02:50', 3, 'PRD/IMPRESSAO', '0', NULL, NULL),
(1946, 'V', 36, 337, 2014, '2014-11-24 10:05:05', 8, 'NOVO', '0', NULL, NULL),
(1947, 'V', 15, 392, 2014, '2014-11-24 10:08:07', 3, 'NOVO', '0', NULL, NULL),
(1948, 'F', 11, 382, 2014, '2014-11-24 10:08:19', 4, 'ACABAMENTO', '0', NULL, NULL),
(1949, 'V', 15, 388, 2014, '2014-11-24 10:08:24', 3, 'NOVO', '0', NULL, NULL),
(1950, 'F', 11, 381, 2014, '2014-11-24 10:08:35', 4, 'ACABAMENTO', '0', NULL, NULL),
(1951, 'V', 11, 398, 2014, '2014-11-24 10:08:49', 4, 'NOVO', '0', NULL, NULL),
(1952, 'V', 11, 397, 2014, '2014-11-24 10:09:04', 4, 'NOVO', '0', NULL, NULL),
(1953, 'V', 11, 395, 2014, '2014-11-24 10:09:17', 4, 'NOVO', '0', NULL, NULL),
(1954, 'F', 11, 395, 2014, '2014-11-24 10:09:31', 4, 'ACABAMENTO', '0', NULL, NULL),
(1955, 'V', 11, 394, 2014, '2014-11-24 10:09:34', 4, 'NOVO', '0', NULL, NULL),
(1956, 'F', 11, 394, 2014, '2014-11-24 10:09:40', 4, 'ACABAMENTO', '0', NULL, NULL),
(1957, 'V', 11, 393, 2014, '2014-11-24 10:09:48', 4, 'NOVO', '0', NULL, NULL),
(1958, 'V', 12, 399, 2014, '2014-11-24 10:18:50', 3, 'NOVO', '0', NULL, NULL),
(1959, 'F', 13, 343, 2014, '2014-11-24 10:33:39', 3, 'IMPRESSAO', '0', NULL, NULL),
(1960, 'V', 13, 400, 2014, '2014-11-24 11:14:01', 3, 'NOVO', '0', NULL, NULL),
(1961, 'F', 13, 400, 2014, '2014-11-24 11:15:11', 3, 'IMPRESSAO', '0', NULL, NULL),
(1962, 'F', 12, 399, 2014, '2014-11-24 11:22:42', 3, 'IMPRESSAO', '0', NULL, NULL),
(1963, 'F', 11, 391, 2014, '2014-11-24 11:26:22', 4, 'ACABAMENTO', '0', NULL, NULL),
(1964, 'V', 11, 326, 2014, '2014-11-24 11:26:27', 4, 'NOVO', '0', NULL, NULL),
(1965, 'F', 11, 388, 2014, '2014-11-24 11:29:58', 4, 'PRD/ACABAMENTO', '0', NULL, NULL),
(1966, 'V', 11, 400, 2014, '2014-11-24 11:31:35', 4, 'NOVO', '0', NULL, NULL),
(1967, 'V', 11, 378, 2014, '2014-11-24 11:32:46', 4, 'NOVO', '0', NULL, NULL),
(1968, 'V', 14, 384, 2014, '2014-11-24 11:46:44', 2, 'NOVO', '0', NULL, NULL),
(1969, 'V', 15, 404, 2014, '2014-11-24 12:53:44', 3, 'NOVO', '0', NULL, NULL),
(1970, 'V', 13, 403, 2014, '2014-11-24 13:11:48', 3, 'NOVO', '0', NULL, NULL),
(1971, 'F', 13, 403, 2014, '2014-11-24 13:13:59', 3, 'IMPRESSAO', '0', NULL, NULL),
(1972, 'F', 11, 393, 2014, '2014-11-24 13:16:14', 4, 'ACABAMENTO', '0', NULL, NULL),
(1973, 'F', 11, 386, 2014, '2014-11-24 13:16:26', 4, 'ACABAMENTO', '0', NULL, NULL),
(1974, 'V', 13, 402, 2014, '2014-11-24 13:19:04', 3, 'NOVO', '0', NULL, NULL),
(1975, 'V', 11, 403, 2014, '2014-11-24 13:20:54', 4, 'NOVO', '0', NULL, NULL),
(1976, 'V', 11, 399, 2014, '2014-11-24 13:21:03', 4, 'NOVO', '0', NULL, NULL),
(1977, 'V', 11, 397, 2014, '2014-11-24 13:21:10', 4, 'NOVO', '0', NULL, NULL),
(1978, 'V', 11, 356, 2014, '2014-11-24 13:21:44', 4, 'NOVO', '0', NULL, NULL),
(1979, 'V', 12, 401, 2014, '2014-11-24 13:25:20', 3, 'NOVO', '0', NULL, NULL),
(1980, 'F', 12, 401, 2014, '2014-11-24 13:26:13', 3, 'IMPRESSAO', '0', NULL, NULL),
(1981, 'F', 13, 402, 2014, '2014-11-24 13:29:14', 3, 'IMPRESSAO', '0', NULL, NULL),
(1982, 'F', 15, 404, 2014, '2014-11-24 13:32:35', 3, 'IMPRESSAO', '0', NULL, NULL),
(1983, 'V', 14, 369, 2014, '2014-11-24 13:46:36', 2, 'NOVO', '0', NULL, NULL),
(1984, 'V', 14, 369, 2014, '2014-11-24 13:47:05', 2, 'NOVO', '0', NULL, NULL),
(1985, 'F', 14, 369, 2014, '2014-11-24 13:47:16', 2, 'FINALIZADO', '0', NULL, NULL),
(1986, 'V', 14, 380, 2014, '2014-11-24 13:58:07', 2, 'NOVO', '0', NULL, NULL),
(1987, 'F', 14, 380, 2014, '2014-11-24 13:58:18', 2, 'FINALIZADO', '0', NULL, NULL),
(1988, 'F', 14, 339, 2014, '2014-11-24 13:59:34', 2, 'FINALIZADO', '0', NULL, NULL),
(1989, 'F', 14, 384, 2014, '2014-11-24 14:03:15', 2, 'FINALIZADO', '0', NULL, NULL),
(1990, 'V', 14, 345, 2014, '2014-11-24 14:10:41', 2, 'NOVO', '0', NULL, NULL),
(1991, 'V', 14, 383, 2014, '2014-11-24 14:17:24', 2, 'NOVO', '0', NULL, NULL),
(1992, 'F', 14, 383, 2014, '2014-11-24 14:17:28', 2, 'FINALIZADO', '0', NULL, NULL),
(1993, 'V', 14, 373, 2014, '2014-11-24 14:18:25', 2, 'NOVO', '0', NULL, NULL),
(1994, 'V', 14, 373, 2014, '2014-11-24 14:21:26', 2, 'NOVO', '0', NULL, NULL),
(1995, 'F', 14, 373, 2014, '2014-11-24 14:21:43', 2, 'FINALIZADO', '0', NULL, NULL),
(1996, 'V', 14, 367, 2014, '2014-11-24 14:26:54', 2, 'NOVO', '0', NULL, NULL),
(1997, 'F', 14, 367, 2014, '2014-11-24 14:26:59', 2, 'FINALIZADO', '0', NULL, NULL),
(1998, 'V', 17, 381, 2014, '2014-11-24 14:27:25', 5, 'NOVO', '0', NULL, NULL),
(1999, 'V', 11, 343, 2014, '2014-11-24 14:29:05', 4, 'NOVO', '0', NULL, NULL),
(2000, 'F', 11, 390, 2014, '2014-11-24 14:29:16', 4, 'ACABAMENTO', '0', NULL, NULL),
(2001, 'F', 11, 400, 2014, '2014-11-24 14:29:36', 4, 'ACABAMENTO', '0', NULL, NULL),
(2002, 'F', 11, 398, 2014, '2014-11-24 14:29:52', 4, 'ACABAMENTO', '0', NULL, NULL),
(2003, 'V', 11, 356, 2014, '2014-11-24 14:31:26', 4, 'NOVO', '0', NULL, NULL),
(2004, 'V', 13, 405, 2014, '2014-11-24 15:12:15', 3, 'NOVO', '0', NULL, NULL),
(2005, 'V', 14, 306, 2014, '2014-11-24 15:15:34', 2, 'NOVO', '0', NULL, NULL),
(2006, 'V', 11, 402, 2014, '2014-11-24 15:23:06', 4, 'NOVO', '0', NULL, NULL),
(2007, 'V', 11, 401, 2014, '2014-11-24 15:23:19', 4, 'NOVO', '0', NULL, NULL),
(2008, 'V', 11, 404, 2014, '2014-11-24 15:23:39', 4, 'NOVO', '0', NULL, NULL),
(2009, 'F', 14, 306, 2014, '2014-11-24 15:32:46', 2, 'FINALIZADO', '0', NULL, NULL),
(2010, 'V', 14, 355, 2014, '2014-11-24 15:40:33', 2, 'NOVO', '0', NULL, NULL),
(2011, 'F', 14, 355, 2014, '2014-11-24 15:40:54', 2, 'FINALIZADO', '0', NULL, NULL),
(2012, 'F', 36, 370, 2014, '2014-11-24 16:16:18', 8, 'IMPRESSAO', '0', NULL, NULL),
(2013, 'V', 36, 388, 2014, '2014-11-24 16:18:14', 8, 'NOVO', '0', NULL, NULL),
(2014, 'F', 36, 388, 2014, '2014-11-24 16:18:56', 8, 'ACABAMENTO', '0', NULL, NULL),
(2015, 'V', 13, 406, 2014, '2014-11-24 16:20:12', 3, 'NOVO', '0', NULL, NULL),
(2016, 'F', 13, 406, 2014, '2014-11-24 16:21:01', 3, 'IMPRESSAO', '0', NULL, NULL),
(2017, 'F', 13, 405, 2014, '2014-11-24 16:23:11', 3, 'IMPRESSAO', '0', NULL, NULL),
(2018, 'V', 11, 370, 2014, '2014-11-24 16:28:58', 4, 'NOVO', '0', NULL, NULL),
(2019, 'V', 12, 407, 2014, '2014-11-24 16:46:16', 3, 'NOVO', '0', NULL, NULL),
(2020, 'V', 35, 382, 2014, '2014-11-24 17:14:07', 5, 'NOVO', '0', NULL, NULL),
(2021, 'F', 36, 284, 2014, '2014-11-24 17:33:16', 8, 'AGENDAMENTO', '0', NULL, NULL),
(2022, 'V', 36, 408, 2014, '2014-11-24 17:34:52', 8, 'NOVO', '0', NULL, NULL),
(2023, 'F', 36, 408, 2014, '2014-11-24 17:35:29', 8, 'AGENDAMENTO', '0', NULL, NULL),
(2024, 'V', 36, 282, 2014, '2014-11-24 17:37:47', 8, 'NOVO', '0', NULL, NULL),
(2025, 'V', 36, 282, 2014, '2014-11-24 17:38:32', 8, 'NOVO', '0', NULL, NULL),
(2026, 'V', 36, 349, 2014, '2014-11-24 17:39:16', 8, 'NOVO', '0', NULL, NULL),
(2027, 'F', 11, 326, 2014, '2014-11-25 08:07:54', 4, 'ACABAMENTO', '0', NULL, NULL),
(2028, 'F', 11, 370, 2014, '2014-11-25 08:07:59', 4, 'ACABAMENTO', '0', NULL, NULL),
(2029, 'F', 11, 378, 2014, '2014-11-25 08:08:30', 4, 'ACABAMENTO', '0', NULL, NULL),
(2030, 'F', 11, 358, 2014, '2014-11-25 08:08:45', 4, 'ACABAMENTO', '0', NULL, NULL),
(2031, 'F', 11, 389, 2014, '2014-11-25 08:09:11', 4, 'ACABAMENTO', '0', NULL, NULL),
(2032, 'V', 12, 409, 2014, '2014-11-25 08:12:28', 3, 'NOVO', '0', NULL, NULL),
(2033, 'V', 11, 397, 2014, '2014-11-25 08:16:22', 4, 'NOVO', '0', NULL, NULL),
(2034, 'F', 11, 397, 2014, '2014-11-25 08:16:38', 4, 'ACABAMENTO', '0', NULL, NULL),
(2035, 'V', 11, 406, 2014, '2014-11-25 08:16:56', 4, 'NOVO', '0', NULL, NULL),
(2036, 'F', 12, 409, 2014, '2014-11-25 08:27:20', 3, 'IMPRESSAO', '0', NULL, NULL),
(2037, 'V', 13, 410, 2014, '2014-11-25 08:35:55', 3, 'NOVO', '0', NULL, NULL),
(2038, 'F', 11, 406, 2014, '2014-11-25 08:37:15', 4, 'ACABAMENTO', '0', NULL, NULL),
(2039, 'F', 11, 402, 2014, '2014-11-25 08:37:46', 4, 'ACABAMENTO', '0', NULL, NULL),
(2040, 'V', 17, 406, 2014, '2014-11-25 08:38:50', 5, 'NOVO', '0', NULL, NULL),
(2041, 'V', 13, 410, 2014, '2014-11-25 08:40:32', 3, 'NOVO', '0', NULL, NULL),
(2042, 'F', 13, 410, 2014, '2014-11-25 08:40:36', 3, 'IMPRESSAO', '0', NULL, NULL),
(2043, 'V', 13, 411, 2014, '2014-11-25 09:02:55', 3, 'NOVO', '0', NULL, NULL),
(2044, 'V', 14, 378, 2014, '2014-11-25 09:16:57', 2, 'NOVO', '0', NULL, NULL),
(2045, 'F', 15, 396, 2014, '2014-11-25 09:31:30', 3, 'IMPRESSAO', '0', NULL, NULL),
(2046, 'V', 11, 396, 2014, '2014-11-25 09:33:13', 4, 'NOVO', '0', NULL, NULL),
(2047, 'V', 11, 409, 2014, '2014-11-25 09:36:15', 4, 'NOVO', '0', NULL, NULL),
(2048, 'V', 11, 405, 2014, '2014-11-25 10:16:09', 4, 'NOVO', '0', NULL, NULL),
(2049, 'F', 11, 403, 2014, '2014-11-25 10:16:27', 4, 'ACABAMENTO', '0', NULL, NULL),
(2050, 'F', 11, 396, 2014, '2014-11-25 10:16:34', 4, 'ACABAMENTO', '0', NULL, NULL),
(2051, 'V', 11, 410, 2014, '2014-11-25 10:20:19', 4, 'NOVO', '0', NULL, NULL),
(2052, 'F', 12, 407, 2014, '2014-11-25 10:28:15', 3, 'IMPRESSAO', '0', NULL, NULL),
(2053, 'V', 14, 348, 2014, '2014-11-25 10:43:25', 2, 'NOVO', '0', NULL, NULL),
(2054, 'V', 17, 390, 2014, '2014-11-25 10:53:58', 5, 'NOVO', '0', NULL, NULL),
(2055, 'F', 15, 387, 2014, '2014-11-25 11:05:21', 3, 'IMPRESSAO', '0', NULL, NULL),
(2056, 'V', 12, 412, 2014, '2014-11-25 11:06:44', 3, 'NOVO', '0', NULL, NULL),
(2057, 'V', 15, 413, 2014, '2014-11-25 11:07:26', 3, 'NOVO', '0', NULL, NULL),
(2058, 'V', 13, 414, 2014, '2014-11-25 11:27:15', 3, 'NOVO', '0', NULL, NULL),
(2059, 'F', 13, 414, 2014, '2014-11-25 11:28:08', 3, 'IMPRESSAO', '0', NULL, NULL),
(2060, 'F', 13, 344, 2014, '2014-11-25 11:40:38', 3, 'IMPRESSAO', '0', NULL, NULL),
(2061, 'F', 11, 410, 2014, '2014-11-25 11:41:02', 4, 'ACABAMENTO', '0', NULL, NULL),
(2062, 'F', 11, 356, 2014, '2014-11-25 11:41:40', 4, 'ACABAMENTO', '0', NULL, NULL),
(2063, 'F', 11, 354, 2014, '2014-11-25 11:41:48', 4, 'ACABAMENTO', '0', NULL, NULL),
(2064, 'F', 11, 343, 2014, '2014-11-25 11:42:02', 4, 'ACABAMENTO', '0', NULL, NULL),
(2065, 'V', 11, 344, 2014, '2014-11-25 11:42:09', 4, 'NOVO', '0', NULL, NULL),
(2066, 'F', 11, 405, 2014, '2014-11-25 11:46:47', 4, 'ACABAMENTO', '0', NULL, NULL),
(2067, 'F', 11, 404, 2014, '2014-11-25 11:51:42', 4, 'ACABAMENTO', '0', NULL, NULL),
(2068, 'V', 11, 387, 2014, '2014-11-25 11:51:49', 4, 'NOVO', '0', NULL, NULL),
(2069, 'V', 14, 289, 2014, '2014-11-25 12:05:34', 2, 'NOVO', '0', NULL, NULL),
(2070, 'V', 15, 415, 2014, '2014-11-25 12:29:18', 3, 'NOVO', '0', NULL, NULL),
(2071, 'F', 15, 415, 2014, '2014-11-25 12:31:37', 3, 'IMPRESSAO', '0', NULL, NULL),
(2072, 'V', 15, 416, 2014, '2014-11-25 12:35:26', 3, 'NOVO', '0', NULL, NULL),
(2073, 'F', 15, 416, 2014, '2014-11-25 12:36:15', 3, 'IMPRESSAO', '0', NULL, NULL),
(2074, 'F', 11, 387, 2014, '2014-11-25 13:51:58', 4, 'ACABAMENTO', '0', NULL, NULL),
(2075, 'F', 11, 401, 2014, '2014-11-25 13:52:08', 4, 'ACABAMENTO', '0', NULL, NULL),
(2076, 'V', 11, 407, 2014, '2014-11-25 13:52:50', 4, 'NOVO', '0', NULL, NULL),
(2077, 'V', 11, 414, 2014, '2014-11-25 13:57:16', 4, 'NOVO', '0', NULL, NULL),
(2078, 'V', 11, 415, 2014, '2014-11-25 13:57:33', 4, 'NOVO', '0', NULL, NULL),
(2079, 'V', 11, 416, 2014, '2014-11-25 13:59:03', 4, 'NOVO', '0', NULL, NULL),
(2080, 'V', 12, 418, 2014, '2014-11-25 14:14:28', 3, 'NOVO', '0', NULL, NULL),
(2081, 'F', 12, 418, 2014, '2014-11-25 14:15:08', 3, 'IMPRESSAO', '0', NULL, NULL),
(2082, 'F', 11, 415, 2014, '2014-11-25 14:47:40', 4, 'ACABAMENTO', '0', NULL, NULL),
(2083, 'F', 11, 409, 2014, '2014-11-25 14:47:45', 4, 'ACABAMENTO', '0', NULL, NULL),
(2084, 'V', 11, 418, 2014, '2014-11-25 14:57:47', 4, 'NOVO', '0', NULL, NULL),
(2085, 'V', 14, 351, 2014, '2014-11-25 15:23:41', 2, 'NOVO', '0', NULL, NULL),
(2086, 'V', 12, 421, 2014, '2014-11-25 15:26:33', 3, 'NOVO', '0', NULL, NULL),
(2087, 'F', 12, 421, 2014, '2014-11-25 15:27:20', 3, 'IMPRESSAO', '0', NULL, NULL),
(2088, 'V', 13, 420, 2014, '2014-11-25 15:42:25', 3, 'NOVO', '0', NULL, NULL),
(2089, 'F', 13, 420, 2014, '2014-11-25 15:43:00', 3, 'IMPRESSAO', '0', NULL, NULL),
(2090, 'V', 17, 326, 2014, '2014-11-25 15:49:00', 5, 'NOVO', '0', NULL, NULL),
(2091, 'V', 17, 356, 2014, '2014-11-25 15:49:19', 5, 'NOVO', '0', NULL, NULL),
(2092, 'V', 17, 358, 2014, '2014-11-25 15:49:25', 5, 'NOVO', '0', NULL, NULL),
(2093, 'V', 14, 404, 2014, '2014-11-25 15:56:48', 2, 'NOVO', '0', NULL, NULL),
(2094, 'V', 13, 419, 2014, '2014-11-25 15:56:50', 3, 'NOVO', '0', NULL, NULL),
(2095, 'F', 13, 419, 2014, '2014-11-25 15:57:46', 3, 'IMPRESSAO', '0', NULL, NULL),
(2096, 'F', 17, 404, 2014, '2014-11-25 16:00:52', 5, 'FINALIZADO', '0', NULL, NULL),
(2097, 'F', 35, 390, 2014, '2014-11-25 16:09:12', 5, 'FINALIZADO', '0', NULL, NULL),
(2098, 'V', 35, 354, 2014, '2014-11-25 16:19:55', 5, 'NOVO', '0', NULL, NULL),
(2099, 'V', 35, 354, 2014, '2014-11-25 16:20:15', 5, 'NOVO', '0', NULL, NULL),
(2100, 'V', 35, 354, 2014, '2014-11-25 16:20:33', 5, 'NOVO', '0', NULL, NULL),
(2101, 'F', 35, 354, 2014, '2014-11-25 16:21:06', 5, 'FINALIZADO', '0', NULL, NULL),
(2102, 'V', 12, 423, 2014, '2014-11-25 16:49:25', 3, 'NOVO', '0', NULL, NULL),
(2103, 'F', 17, 326, 2014, '2014-11-25 16:50:06', 5, 'FINALIZADO', '0', NULL, NULL),
(2104, 'V', 17, 415, 2014, '2014-11-25 16:50:10', 5, 'NOVO', '0', NULL, NULL),
(2105, 'V', 17, 410, 2014, '2014-11-25 16:50:18', 5, 'NOVO', '0', NULL, NULL),
(2106, 'V', 17, 410, 2014, '2014-11-25 16:50:25', 5, 'NOVO', '0', NULL, NULL),
(2107, 'F', 17, 410, 2014, '2014-11-25 16:50:37', 5, 'FINALIZADO', '0', NULL, NULL),
(2108, 'V', 17, 409, 2014, '2014-11-25 16:50:41', 5, 'NOVO', '0', NULL, NULL),
(2109, 'F', 17, 409, 2014, '2014-11-25 16:50:58', 5, 'FINALIZADO', '0', NULL, NULL),
(2110, 'F', 17, 406, 2014, '2014-11-25 16:51:09', 5, 'FINALIZADO', '0', NULL, NULL),
(2111, 'V', 17, 405, 2014, '2014-11-25 16:51:14', 5, 'NOVO', '0', NULL, NULL),
(2112, 'F', 17, 405, 2014, '2014-11-25 16:51:24', 5, 'FINALIZADO', '0', NULL, NULL),
(2113, 'V', 17, 403, 2014, '2014-11-25 16:52:02', 5, 'NOVO', '0', NULL, NULL),
(2114, 'F', 17, 403, 2014, '2014-11-25 16:52:09', 5, 'FINALIZADO', '0', NULL, NULL),
(2115, 'V', 17, 402, 2014, '2014-11-25 16:52:12', 5, 'NOVO', '0', NULL, NULL),
(2116, 'F', 17, 402, 2014, '2014-11-25 16:52:22', 5, 'FINALIZADO', '0', NULL, NULL),
(2117, 'V', 17, 401, 2014, '2014-11-25 16:52:52', 5, 'NOVO', '0', NULL, NULL),
(2118, 'F', 17, 401, 2014, '2014-11-25 16:53:14', 5, 'FINALIZADO', '0', NULL, NULL),
(2119, 'V', 17, 400, 2014, '2014-11-25 16:53:17', 5, 'NOVO', '0', NULL, NULL),
(2120, 'F', 17, 400, 2014, '2014-11-25 16:53:36', 5, 'FINALIZADO', '0', NULL, NULL),
(2121, 'V', 17, 398, 2014, '2014-11-25 16:53:42', 5, 'NOVO', '0', NULL, NULL),
(2122, 'F', 17, 398, 2014, '2014-11-25 16:53:51', 5, 'FINALIZADO', '0', NULL, NULL),
(2123, 'V', 17, 397, 2014, '2014-11-25 16:53:54', 5, 'NOVO', '0', NULL, NULL),
(2124, 'F', 17, 397, 2014, '2014-11-25 16:54:02', 5, 'FINALIZADO', '0', NULL, NULL),
(2125, 'V', 17, 396, 2014, '2014-11-25 16:54:20', 5, 'NOVO', '0', NULL, NULL),
(2126, 'F', 17, 396, 2014, '2014-11-25 16:54:27', 5, 'FINALIZADO', '0', NULL, NULL),
(2127, 'V', 17, 395, 2014, '2014-11-25 16:54:34', 5, 'NOVO', '0', NULL, NULL),
(2128, 'F', 17, 395, 2014, '2014-11-25 16:54:41', 5, 'FINALIZADO', '0', NULL, NULL),
(2129, 'V', 17, 394, 2014, '2014-11-25 16:54:45', 5, 'NOVO', '0', NULL, NULL),
(2130, 'F', 17, 394, 2014, '2014-11-25 16:54:51', 5, 'FINALIZADO', '0', NULL, NULL),
(2131, 'V', 17, 393, 2014, '2014-11-25 16:54:54', 5, 'NOVO', '0', NULL, NULL),
(2132, 'F', 17, 393, 2014, '2014-11-25 16:54:59', 5, 'FINALIZADO', '0', NULL, NULL),
(2133, 'V', 17, 391, 2014, '2014-11-25 16:56:29', 5, 'NOVO', '0', NULL, NULL),
(2134, 'F', 17, 391, 2014, '2014-11-25 16:56:42', 5, 'FINALIZADO', '0', NULL, NULL),
(2135, 'V', 17, 389, 2014, '2014-11-25 16:56:48', 5, 'NOVO', '0', NULL, NULL),
(2136, 'F', 17, 389, 2014, '2014-11-25 16:56:59', 5, 'FINALIZADO', '0', NULL, NULL),
(2137, 'V', 17, 388, 2014, '2014-11-25 16:57:06', 5, 'NOVO', '0', NULL, NULL),
(2138, 'F', 17, 388, 2014, '2014-11-25 16:57:13', 5, 'PRODUCAO', '0', NULL, NULL),
(2139, 'V', 17, 387, 2014, '2014-11-25 16:57:18', 5, 'NOVO', '0', NULL, NULL),
(2140, 'V', 17, 386, 2014, '2014-11-25 16:57:23', 5, 'NOVO', '0', NULL, NULL),
(2141, 'F', 17, 387, 2014, '2014-11-25 16:57:35', 5, 'FINALIZADO', '0', NULL, NULL),
(2142, 'F', 17, 386, 2014, '2014-11-25 16:57:53', 5, 'FINALIZADO', '0', NULL, NULL),
(2143, 'F', 17, 381, 2014, '2014-11-25 16:59:02', 5, 'FINALIZADO', '0', NULL, NULL),
(2144, 'F', 17, 378, 2014, '2014-11-25 16:59:07', 5, 'FINALIZADO', '0', NULL, NULL),
(2145, 'V', 17, 370, 2014, '2014-11-25 16:59:10', 5, 'NOVO', '0', NULL, NULL),
(2146, 'F', 17, 370, 2014, '2014-11-25 16:59:16', 5, 'PRODUCAO', '0', NULL, NULL),
(2147, 'F', 17, 350, 2014, '2014-11-25 16:59:29', 5, 'FINALIZADO', '0', NULL, NULL),
(2148, 'F', 17, 320, 2014, '2014-11-25 16:59:38', 5, 'FINALIZADO', '0', NULL, NULL),
(2149, 'F', 17, 358, 2014, '2014-11-25 17:00:03', 5, 'FINALIZADO', '0', NULL, NULL),
(2150, 'V', 14, 250, 2014, '2014-11-25 17:12:30', 2, 'NOVO', '0', NULL, NULL),
(2151, 'F', 14, 250, 2014, '2014-11-25 17:12:39', 2, 'FINALIZADO', '0', NULL, NULL),
(2152, 'F', 12, 423, 2014, '2014-11-25 17:23:32', 3, 'IMPRESSAO', '0', NULL, NULL),
(2153, 'V', 14, 249, 2014, '2014-11-25 17:28:15', 2, 'NOVO', '0', NULL, NULL),
(2154, 'F', 14, 231, 2014, '2014-11-25 18:12:15', 2, 'FINALIZADO', '0', NULL, NULL),
(2155, 'F', 14, 249, 2014, '2014-11-25 18:12:32', 2, 'FINALIZADO', '0', NULL, NULL),
(2156, 'V', 14, 252, 2014, '2014-11-25 18:15:16', 2, 'NOVO', '0', NULL, NULL),
(2157, 'V', 14, 252, 2014, '2014-11-25 18:15:28', 2, 'NOVO', '0', NULL, NULL),
(2158, 'V', 14, 264, 2014, '2014-11-25 18:52:36', 2, 'NOVO', '0', NULL, NULL),
(2159, 'V', 14, 264, 2014, '2014-11-25 18:52:41', 2, 'NOVO', '0', NULL, NULL),
(2160, 'F', 14, 264, 2014, '2014-11-25 18:52:49', 2, 'FINALIZADO', '0', NULL, NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `orcamento`
--

CREATE TABLE IF NOT EXISTS `orcamento` (
  `orcamentoID` int(11) NOT NULL AUTO_INCREMENT,
  `clienteID` int(11) NOT NULL,
  `formPagID` int(11) NOT NULL,
  `valor` float(10,2) NOT NULL,
  `entrada` float(10,2) NOT NULL,
  `troco` float(10,2) NOT NULL,
  `vezes` int(11) NOT NULL,
  `desconto` float(10,2) NOT NULL,
  `notaFiscal` varchar(20) NOT NULL,
  `data` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `usuario` varchar(50) NOT NULL,
  `status` varchar(1) NOT NULL DEFAULT '1',
  `empresaID` int(11) NOT NULL,
  PRIMARY KEY (`orcamentoID`),
  KEY `empresaID` (`empresaID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Extraindo dados da tabela `orcamento`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `orcamentoitem`
--

CREATE TABLE IF NOT EXISTS `orcamentoitem` (
  `itemID` int(11) NOT NULL AUTO_INCREMENT,
  `orcamentoID` int(11) NOT NULL,
  `produtoID` int(11) NOT NULL,
  `quantidade` float(10,2) NOT NULL,
  `valor` float(10,2) NOT NULL,
  `total` float(10,2) NOT NULL,
  PRIMARY KEY (`itemID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Extraindo dados da tabela `orcamentoitem`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `orcamentoservico`
--

CREATE TABLE IF NOT EXISTS `orcamentoservico` (
  `servicoID` int(11) NOT NULL AUTO_INCREMENT,
  `clienteID` int(11) NOT NULL,
  `veiculoID` int(11) NOT NULL DEFAULT '0',
  `km` int(11) NOT NULL DEFAULT '0',
  `empresaID` int(11) NOT NULL,
  `formPagID` int(11) NOT NULL DEFAULT '0',
  `entrada` float(10,2) NOT NULL DEFAULT '0.00',
  `troco` float(10,2) NOT NULL DEFAULT '0.00',
  `vezes` int(11) NOT NULL DEFAULT '0',
  `desconto` float(10,2) NOT NULL DEFAULT '0.00',
  `descricao` text NOT NULL,
  `dataInicio` date NOT NULL,
  `dataFim` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `valor` float(10,2) NOT NULL,
  `usuario` varchar(50) NOT NULL,
  `status` varchar(1) NOT NULL DEFAULT 'M' COMMENT 'M (Em manutenção, em andamento) OU F (Finalizado)',
  `visualizacao` varchar(1) NOT NULL DEFAULT 'N' COMMENT 'S (Sim) OU N (Não)',
  PRIMARY KEY (`servicoID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Extraindo dados da tabela `orcamentoservico`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `orcamentoservicoitem`
--

CREATE TABLE IF NOT EXISTS `orcamentoservicoitem` (
  `servicoitemID` int(11) NOT NULL AUTO_INCREMENT,
  `servicoID` int(11) NOT NULL,
  `descricao` text NOT NULL,
  `valor` float(10,2) NOT NULL,
  `data` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`servicoitemID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Extraindo dados da tabela `orcamentoservicoitem`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `orcamentoservicoproduto`
--

CREATE TABLE IF NOT EXISTS `orcamentoservicoproduto` (
  `servicoprodutoID` int(11) NOT NULL AUTO_INCREMENT,
  `servicoID` int(11) NOT NULL,
  `produtoID` int(11) NOT NULL,
  `valor` float(10,2) NOT NULL,
  `data` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`servicoprodutoID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Extraindo dados da tabela `orcamentoservicoproduto`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `pagar`
--

CREATE TABLE IF NOT EXISTS `pagar` (
  `pagarID` int(11) NOT NULL AUTO_INCREMENT,
  `contapagarID` int(11) NOT NULL,
  `formID` int(11) NOT NULL,
  `valor` float(10,2) NOT NULL,
  `vencimento` date NOT NULL,
  `parcela` int(11) NOT NULL,
  `de` int(11) NOT NULL,
  `status` varchar(1) NOT NULL COMMENT 'Ou ''D'' de Devendo ou ''P'' de Pago',
  `empresaID` int(11) NOT NULL,
  PRIMARY KEY (`pagarID`),
  KEY `empresaID` (`empresaID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=37 ;

--
-- Extraindo dados da tabela `pagar`
--

INSERT INTO `pagar` (`pagarID`, `contapagarID`, `formID`, `valor`, `vencimento`, `parcela`, `de`, `status`, `empresaID`) VALUES
(16, 5, 1, 38.28, '2014-11-10', 1, 1, 'P', 1),
(17, 6, 1, 1060.00, '2014-11-17', 1, 1, 'P', 1),
(18, 7, 1, 1261.20, '2014-11-17', 1, 1, 'P', 1),
(19, 8, 1, 1000.00, '2014-11-14', 1, 2, 'P', 1),
(20, 8, 1, 3171.00, '2014-12-14', 2, 2, 'D', 1),
(21, 9, 1, 777.84, '2014-11-17', 1, 1, 'P', 1),
(22, 10, 1, 2974.80, '2014-11-17', 1, 1, 'P', 1),
(23, 11, 4, 2000.00, '2014-11-21', 1, 1, 'P', 1),
(24, 12, 1, 959.99, '2014-11-17', 1, 1, 'P', 1),
(25, 13, 1, 100.00, '2014-11-17', 1, 2, 'P', 1),
(26, 13, 1, 20.00, '2014-12-09', 2, 2, 'D', 1),
(27, 14, 1, 121.58, '2014-12-04', 1, 1, 'D', 1),
(28, 15, 4, 3203.60, '2014-12-18', 1, 1, 'D', 1),
(29, 16, 1, 1235.00, '2014-11-19', 1, 1, 'P', 1),
(30, 17, 1, 150.00, '2014-11-12', 1, 1, 'P', 1),
(31, 18, 4, 1100.00, '2014-11-25', 1, 1, 'P', 1),
(32, 19, 1, 32.90, '2014-11-25', 1, 1, 'P', 1),
(33, 20, 3, 118.80, '2014-11-25', 1, 1, 'P', 1),
(34, 21, 3, 146.36, '2014-11-25', 1, 1, 'P', 1),
(35, 22, 3, 1859.05, '2014-11-25', 1, 1, 'P', 1),
(36, 23, 3, 126.00, '2004-11-25', 1, 1, 'D', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `produto`
--

CREATE TABLE IF NOT EXISTS `produto` (
  `produtoID` int(11) NOT NULL AUTO_INCREMENT,
  `tipoprodutoID` int(11) NOT NULL,
  `fornecedorID` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `codigo` varchar(20) NOT NULL,
  `unidade` varchar(2) NOT NULL,
  `precoCusto` float(10,2) NOT NULL,
  `preco` float(10,2) NOT NULL,
  `estoqueMinimo` int(11) NOT NULL,
  `estoque` float(10,2) NOT NULL,
  `lucro` varchar(10) NOT NULL,
  `data` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `produtoAtivo` varchar(1) NOT NULL DEFAULT 'S',
  PRIMARY KEY (`produtoID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=17 ;

--
-- Extraindo dados da tabela `produto`
--

INSERT INTO `produto` (`produtoID`, `tipoprodutoID`, `fornecedorID`, `nome`, `codigo`, `unidade`, `precoCusto`, `preco`, `estoqueMinimo`, `estoque`, `lucro`, `data`, `produtoAtivo`) VALUES
(13, 1, 0, 'Lona280', '789', 'MT', 4.35, 9.00, 143, 103.50, '106.90', '2014-11-11 15:53:45', 'S'),
(14, 1, 0, 'Bast&#227;o 16mm - 0,75cm', '963', 'UN', 0.00, 0.00, 100, -1.00, 'null', '2014-11-08 05:33:11', 'S'),
(15, 1, 0, 'Bast&#227;o', '0000025', 'UN', 0.00, 0.00, 100, 0.00, 'null', '2014-10-10 14:44:58', 'S'),
(16, 1, 0, 'Lona440', '147', 'MT', 9.90, 9.90, 30, 88.10, '0.00', '2014-11-10 22:09:20', 'S');

-- --------------------------------------------------------

--
-- Estrutura da tabela `produtoestoque`
--

CREATE TABLE IF NOT EXISTS `produtoestoque` (
  `produtoestoqueID` int(11) NOT NULL AUTO_INCREMENT,
  `produtoID` int(11) NOT NULL,
  `empresaID` int(11) NOT NULL,
  `quantidade` float(10,2) NOT NULL,
  `ultimaInsercao` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`produtoestoqueID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=13 ;

--
-- Extraindo dados da tabela `produtoestoque`
--

INSERT INTO `produtoestoque` (`produtoestoqueID`, `produtoID`, `empresaID`, `quantidade`, `ultimaInsercao`) VALUES
(11, 13, 1, 109.30, '2014-11-11 15:53:45'),
(12, 16, 1, 136.50, '2014-11-10 22:09:20');

-- --------------------------------------------------------

--
-- Estrutura da tabela `produtos`
--

CREATE TABLE IF NOT EXISTS `produtos` (
  `produtoID` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  `codigo` varchar(255) DEFAULT NULL,
  `ativo` varchar(1) NOT NULL DEFAULT 'S',
  `rotinaID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`produtoID`),
  KEY `codigo` (`codigo`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=32 ;

--
-- Extraindo dados da tabela `produtos`
--

INSERT INTO `produtos` (`produtoID`, `nome`, `codigo`, `ativo`, `rotinaID`) VALUES
(7, 'Faixa', '000001', 'S', 0),
(8, 'Banner', '000002', 'S', 0),
(9, 'Lona', '000003', 'S', 0),
(10, 'Adesivo', '000004', 'S', 0),
(11, 'Placa MDF', '000005', 'S', 0),
(12, 'Placa PVC', '000006', 'S', 0),
(14, 'Toldo', '000011', 'S', 2),
(15, 'Cortina', '000012', 'S', 2),
(16, 'Cobertura', '000013', 'S', 2),
(18, 'Fachada', '000015', 'S', 1),
(19, 'Cavalete Madeira', '00014', 'S', 0),
(20, 'Cavalete Metalon', '000016', 'S', 0),
(21, 'Placa em Chapa Galvanizada', '000017', 'S', 1),
(22, 'Painel ACM', '000018', 'S', 1),
(23, 'Lona de Faixa c/ Solda e Ilhós', '000019', 'S', 0),
(24, 'Painel em Vidro Temperado', '000020', 'S', 1),
(25, 'Lona de Painel c/ Solda e Ilhós', '000021', 'S', 0),
(26, 'Adesivo Recorte', '000022', 'S', 0),
(27, 'Reforma Cortina', '000023', 'S', 2),
(28, 'Reforma Toldo', '000024', 'S', 2),
(29, 'Painel Tubo 2"', '000026', 'S', 1),
(30, 'Painel Tubo 2 1/2"', '000027', 'S', 1),
(31, 'Painel em Metalon', '000025', 'S', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `receber`
--

CREATE TABLE IF NOT EXISTS `receber` (
  `receberID` int(11) NOT NULL AUTO_INCREMENT,
  `vendaID` int(11) NOT NULL,
  `formID` int(11) NOT NULL,
  `clienteID` int(11) NOT NULL,
  `valor` float(10,2) NOT NULL,
  `vencimento` date NOT NULL,
  `dataAlteracao` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `parcela` int(11) NOT NULL,
  `de` int(11) NOT NULL,
  `status` varchar(1) NOT NULL COMMENT 'Ou ''D'' de Devendo Ou ''P'' de Pago',
  `servico` varchar(1) NOT NULL,
  `empresaID` int(11) NOT NULL,
  PRIMARY KEY (`receberID`),
  KEY `empresaID` (`empresaID`),
  KEY `dataAlteracao` (`dataAlteracao`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=375 ;

--
-- Extraindo dados da tabela `receber`
--

INSERT INTO `receber` (`receberID`, `vendaID`, `formID`, `clienteID`, `valor`, `vencimento`, `dataAlteracao`, `parcela`, `de`, `status`, `servico`, `empresaID`) VALUES
(137, 233, 1, 93, 70.00, '2014-11-11', '2014-11-11 11:23:32', 1, 1, 'P', 'S', 1),
(138, 234, 1, 95, 100.00, '2014-11-11', '2014-11-11 11:50:11', 1, 1, 'P', 'S', 1),
(139, 235, 1, 97, 20.00, '2014-11-11', '2014-11-11 12:02:24', 1, 1, 'P', 'S', 1),
(140, 238, 1, 99, 30.00, '2014-11-11', '2014-11-11 13:03:18', 1, 1, 'P', 'S', 1),
(141, 237, 3, 98, 117.00, '2014-11-11', '2014-11-11 13:09:10', 1, 1, 'P', 'S', 1),
(143, 232, 7, 92, 134.00, '2014-12-11', '2014-11-11 13:24:39', 1, 1, 'D', 'S', 1),
(144, 230, 7, 89, 640.00, '2014-12-11', '2014-11-11 13:25:23', 1, 1, 'D', 'S', 1),
(145, 240, 7, 90, 175.50, '2014-12-11', '2014-11-11 15:08:13', 1, 1, 'D', 'S', 1),
(146, 240, 7, 90, 175.50, '2014-12-11', '2014-11-11 15:17:09', 1, 1, 'D', 'S', 1),
(147, 242, 1, 100, 20.00, '2014-11-11', '2014-11-11 15:39:28', 1, 1, 'P', 'S', 1),
(148, 234, 7, 95, 100.00, '2014-12-11', '2014-11-11 15:41:12', 1, 1, 'D', 'S', 1),
(149, 243, 1, 101, 50.00, '2014-11-11', '2014-11-11 15:54:38', 1, 1, 'P', 'S', 1),
(150, 245, 1, 103, 150.00, '2014-11-11', '2014-11-11 16:09:09', 1, 1, 'P', 'S', 1),
(151, 226, 7, 87, 35.00, '2014-12-11', '2014-11-11 16:22:03', 1, 1, 'D', 'S', 1),
(152, 227, 7, 88, 210.00, '2014-12-11', '2014-11-11 16:22:54', 1, 1, 'D', 'S', 1),
(153, 228, 7, 59, 126.00, '2014-12-11', '2014-11-11 16:24:45', 1, 1, 'D', 'S', 1),
(154, 230, 7, 89, 640.00, '2014-12-11', '2014-11-11 16:25:26', 1, 1, 'D', 'S', 1),
(155, 250, 7, 106, 10.00, '2014-11-11', '2014-11-11 17:04:58', 1, 1, 'P', 'S', 1),
(156, 250, 7, 106, 7.00, '2014-12-11', '2014-11-11 17:04:58', 1, 1, 'P', 'S', 1),
(157, 251, 1, 107, 17.00, '2014-11-11', '2014-11-11 17:18:58', 1, 1, 'P', 'S', 1),
(158, 252, 7, 108, 20.00, '2014-11-11', '2014-11-11 17:23:16', 1, 1, 'P', 'S', 1),
(159, 252, 7, 108, 5.00, '2014-12-11', '2014-11-11 17:23:16', 1, 1, 'P', 'S', 1),
(160, 254, 1, 109, 15.00, '2014-11-12', '2014-11-12 08:22:42', 1, 1, 'P', 'S', 1),
(161, 257, 1, 110, 70.00, '2014-11-12', '2014-11-12 09:44:36', 1, 1, 'P', 'S', 1),
(162, 260, 1, 113, 30.00, '2014-11-12', '2014-11-12 11:23:37', 1, 1, 'P', 'S', 1),
(163, 259, 7, 112, 20.00, '2014-11-12', '2014-11-12 11:36:06', 1, 1, 'P', 'S', 1),
(164, 259, 7, 112, 20.00, '2014-12-12', '2014-11-12 11:36:06', 1, 1, 'P', 'S', 1),
(165, 262, 7, 114, 20.00, '2014-11-12', '2014-11-12 13:23:25', 1, 1, 'P', 'S', 1),
(166, 262, 7, 114, 10.00, '2014-12-12', '2014-11-12 13:23:25', 1, 1, 'P', 'S', 1),
(167, 246, 1, 104, 225.00, '2014-11-12', '2014-11-12 15:12:43', 1, 1, 'P', 'S', 1),
(168, 229, 1, 59, 126.00, '2014-11-12', '2014-11-12 15:13:59', 1, 1, 'P', 'S', 1),
(169, 264, 1, 116, 100.00, '2014-11-12', '2014-11-12 15:28:57', 1, 1, 'P', 'S', 1),
(170, 258, 1, 74, 65.00, '2014-11-12', '2014-11-12 15:41:40', 1, 1, 'P', 'S', 1),
(171, 266, 1, 119, 30.00, '2014-11-12', '2014-11-12 16:01:01', 1, 1, 'P', 'S', 1),
(172, 268, 1, 86, 78.00, '2014-11-12', '2014-11-12 16:30:11', 1, 1, 'P', 'S', 1),
(173, 269, 7, 123, 50.00, '2014-11-12', '2014-11-12 17:10:37', 1, 1, 'P', 'S', 1),
(174, 269, 7, 123, 40.00, '2014-12-12', '2014-11-12 17:10:37', 1, 1, 'P', 'S', 1),
(175, 274, 7, 128, 670.00, '2014-12-13', '2014-11-13 11:02:37', 1, 1, 'D', 'S', 1),
(176, 276, 1, 130, 35.00, '2014-11-13', '2014-11-13 11:50:50', 1, 1, 'P', 'S', 1),
(177, 274, 7, 128, 320.00, '2014-11-13', '2014-11-13 13:13:41', 1, 1, 'P', 'S', 1),
(178, 274, 7, 128, 350.00, '2014-12-13', '2014-11-13 13:13:41', 1, 1, 'D', 'S', 1),
(179, 279, 7, 132, 332.00, '2014-12-13', '2014-11-13 13:37:57', 1, 1, 'D', 'S', 1),
(180, 280, 7, 133, 1500.00, '2014-11-13', '2014-11-13 13:45:57', 1, 1, 'P', 'S', 1),
(181, 280, 7, 133, 4000.00, '2014-12-13', '2014-11-13 13:45:57', 1, 1, 'D', 'S', 1),
(182, 281, 1, 134, 25.00, '2014-11-13', '2014-11-13 15:40:42', 1, 1, 'P', 'S', 1),
(183, 288, 1, 24, 80.00, '2014-11-13', '2014-11-13 17:55:17', 1, 1, 'P', 'S', 1),
(184, 288, 1, 24, 80.00, '2014-11-13', '2014-11-13 18:00:26', 1, 1, 'P', 'S', 1),
(185, 269, 1, 123, 90.00, '2014-11-14', '2014-11-14 10:47:15', 1, 1, 'P', 'S', 1),
(186, 290, 1, 138, 160.00, '2014-11-14', '2014-11-14 10:56:13', 1, 1, 'P', 'S', 1),
(187, 291, 4, 139, 1060.00, '2014-11-14', '2014-11-14 11:01:00', 1, 1, 'P', 'S', 1),
(188, 291, 4, 139, 0.00, '2014-11-14', '2014-11-14 11:01:00', 1, 1, 'P', 'S', 1),
(189, 295, 7, 141, 10000.00, '2014-12-14', '2014-11-14 12:04:10', 1, 1, 'P', 'S', 1),
(190, 295, 4, 141, 2620.00, '2014-11-14', '2014-11-14 12:06:50', 1, 1, 'P', 'S', 1),
(191, 295, 4, 141, 7380.00, '2014-11-14', '2014-11-14 12:06:50', 1, 1, 'P', 'S', 1),
(192, 297, 1, 144, 17.00, '2014-11-14', '2014-11-14 12:18:35', 1, 1, 'P', 'S', 1),
(193, 297, 1, 144, 17.00, '2014-11-14', '2014-11-14 12:21:11', 1, 1, 'P', 'S', 1),
(194, 299, 1, 56, 70.00, '2014-11-14', '2014-11-14 12:49:16', 1, 1, 'P', 'S', 1),
(195, 302, 2, 145, 225.00, '2014-11-14', '2014-11-14 14:02:12', 1, 1, 'P', 'S', 1),
(196, 302, 2, 145, 0.00, '2014-12-14', '2014-11-14 14:02:12', 1, 1, 'P', 'S', 1),
(197, 306, 1, 150, 80.00, '2014-11-14', '2014-11-14 15:05:22', 1, 1, 'P', 'S', 1),
(198, 303, 1, 147, 80.00, '2014-11-14', '2014-11-14 15:21:56', 1, 1, 'P', 'S', 1),
(199, 307, 1, 151, 50.00, '2014-11-14', '2014-11-14 15:38:24', 1, 1, 'P', 'S', 1),
(200, 277, 1, 129, 30.00, '2014-11-14', '2014-11-14 16:33:15', 1, 1, 'P', 'S', 1),
(201, 310, 7, 154, 50.00, '2014-11-17', '2014-11-17 09:55:47', 1, 1, 'P', 'S', 1),
(202, 310, 7, 154, 120.00, '2014-12-17', '2014-11-17 09:55:47', 1, 1, 'P', 'S', 1),
(203, 312, 1, 63, 70.00, '2014-11-17', '2014-11-17 10:18:18', 1, 1, 'P', 'S', 1),
(204, 311, 7, 155, 20.00, '2014-11-17', '2014-11-17 10:54:12', 1, 1, 'P', 'S', 1),
(205, 311, 7, 155, 10.00, '2014-12-17', '2014-11-17 10:54:12', 1, 1, 'P', 'S', 1),
(206, 278, 1, 131, 131.00, '2014-11-17', '2014-11-17 11:09:06', 1, 1, 'P', 'S', 1),
(207, 287, 1, 136, 80.00, '2014-11-17', '2014-11-17 11:10:25', 1, 1, 'P', 'S', 1),
(208, 255, 7, 90, 598.50, '2014-12-17', '2014-11-17 11:11:00', 1, 1, 'D', 'S', 1),
(209, 231, 7, 91, 0.01, '2014-12-17', '2014-11-17 11:11:11', 1, 1, 'D', 'S', 1),
(210, 240, 7, 90, 175.50, '2014-12-17', '2014-11-17 11:11:55', 1, 1, 'D', 'S', 1),
(211, 255, 7, 90, 598.50, '2014-12-17', '2014-11-17 11:12:15', 1, 1, 'D', 'S', 1),
(212, 314, 3, 160, 120.00, '2014-11-17', '2014-11-17 11:48:46', 1, 1, 'P', 'S', 1),
(213, 314, 3, 160, 0.00, '2014-11-18', '2014-11-17 11:48:46', 1, 1, 'P', 'S', 1),
(214, 315, 7, 161, 50.00, '2014-11-17', '2014-11-17 11:54:09', 1, 1, 'P', 'S', 1),
(215, 315, 7, 161, 43.00, '2014-12-17', '2014-11-17 11:54:09', 1, 1, 'P', 'S', 1),
(216, 317, 1, 163, 30.00, '2014-11-17', '2014-11-17 12:57:32', 1, 1, 'P', 'S', 1),
(217, 321, 1, 167, 45.00, '2014-11-17', '2014-11-17 14:27:16', 1, 1, 'P', 'S', 1),
(218, 326, 7, 170, 90.00, '2014-11-17', '2014-11-17 15:28:18', 1, 1, 'P', 'S', 1),
(219, 326, 7, 170, 90.00, '2014-12-17', '2014-11-17 15:28:18', 1, 1, 'D', 'S', 1),
(220, 327, 1, 171, 30.00, '2014-11-17', '2014-11-17 15:45:58', 1, 1, 'P', 'S', 1),
(221, 328, 7, 172, 300.00, '2014-11-17', '2014-11-17 16:13:44', 1, 1, 'P', 'S', 1),
(222, 328, 7, 172, 1380.00, '2014-12-17', '2014-11-17 16:13:44', 1, 1, 'D', 'S', 1),
(223, 329, 3, 173, 25.00, '2014-11-17', '2014-11-17 16:37:46', 1, 1, 'P', 'S', 1),
(224, 329, 3, 173, 20.00, '2014-11-18', '2014-11-17 16:37:46', 1, 1, 'P', 'S', 1),
(225, 330, 5, 174, 530.00, '2014-11-17', '2014-11-17 16:44:00', 1, 1, 'P', 'S', 1),
(226, 330, 5, 174, 0.00, '2014-12-17', '2014-11-17 16:44:00', 1, 1, 'D', 'S', 1),
(227, 309, 1, 153, 17.00, '2014-11-18', '2014-11-18 08:23:59', 1, 1, 'P', 'S', 1),
(228, 286, 1, 135, 68.00, '2014-11-18', '2014-11-18 08:24:22', 1, 1, 'P', 'S', 1),
(229, 240, 7, 90, 175.50, '2014-12-18', '2014-11-18 08:49:04', 1, 1, 'D', 'S', 1),
(230, 255, 7, 90, 598.50, '2014-12-18', '2014-11-18 08:49:52', 1, 1, 'D', 'S', 1),
(231, 332, 7, 157, 1000.00, '2014-11-18', '2014-11-18 09:06:30', 1, 1, 'P', 'S', 1),
(232, 332, 7, 157, 6990.00, '2014-12-18', '2014-11-18 09:06:30', 1, 1, 'D', 'S', 1),
(233, 279, 1, 132, 30.00, '2014-11-18', '2014-11-18 10:32:32', 1, 1, 'P', 'S', 1),
(234, 279, 5, 132, 300.00, '2014-11-18', '2014-11-18 10:33:39', 1, 1, 'P', 'S', 1),
(235, 279, 5, 132, 30.00, '2014-12-18', '2014-11-18 10:33:39', 1, 1, 'D', 'S', 1),
(236, 334, 1, 176, 17.00, '2014-11-18', '2014-11-18 10:40:40', 1, 1, 'P', 'S', 1),
(237, 338, 1, 178, 70.00, '2014-11-18', '2014-11-18 11:47:37', 1, 1, 'P', 'S', 1),
(238, 339, 1, 179, 20.00, '2014-11-18', '2014-11-18 13:03:54', 1, 1, 'P', 'S', 1),
(239, 340, 7, 180, 10.00, '2014-11-18', '2014-11-18 13:17:06', 1, 1, 'P', 'S', 1),
(240, 340, 7, 180, 20.00, '2014-12-18', '2014-11-18 13:17:06', 1, 1, 'P', 'S', 1),
(241, 341, 1, 38, 200.00, '2014-11-18', '2014-11-18 14:09:58', 1, 1, 'P', 'S', 1),
(242, 304, 1, 149, 34.00, '2014-11-18', '2014-11-18 14:25:14', 1, 1, 'P', 'S', 1),
(243, 346, 7, 184, 150.00, '2014-11-18', '2014-11-18 15:19:42', 1, 1, 'P', 'S', 1),
(244, 346, 7, 184, 134.00, '2014-12-18', '2014-11-18 15:19:42', 1, 1, 'P', 'S', 1),
(245, 347, 2, 130, 40.00, '2014-11-18', '2014-11-18 15:50:45', 1, 1, 'P', 'S', 1),
(246, 347, 2, 130, 0.00, '2014-12-18', '2014-11-18 15:50:45', 1, 1, 'D', 'S', 1),
(247, 272, 5, 126, 95.00, '2014-11-18', '2014-11-18 16:00:11', 1, 1, 'P', 'S', 1),
(248, 272, 5, 126, 0.00, '2014-12-18', '2014-11-18 16:00:11', 1, 1, 'D', 'S', 1),
(249, 313, 7, 156, 153.00, '2014-12-18', '2014-11-18 16:00:39', 1, 1, 'D', 'S', 1),
(250, 335, 1, 177, 45.00, '2014-11-18', '2014-11-18 16:26:09', 1, 1, 'P', 'S', 1),
(251, 350, 7, 187, 150.00, '2014-11-18', '2014-11-18 17:05:24', 1, 1, 'P', 'S', 1),
(252, 350, 7, 187, 100.00, '2014-12-18', '2014-11-18 17:05:24', 1, 1, 'D', 'S', 1),
(253, 352, 1, 189, 20.00, '2014-11-19', '2014-11-19 08:58:18', 1, 1, 'P', 'S', 1),
(254, 316, 2, 159, 140.00, '2014-11-19', '2014-11-19 09:03:37', 1, 1, 'P', 'S', 1),
(255, 316, 2, 159, 0.00, '2014-12-19', '2014-11-19 09:03:37', 1, 1, 'D', 'S', 1),
(256, 353, 7, 5, 100.00, '2014-11-19', '2014-11-19 09:27:38', 1, 1, 'P', 'S', 1),
(257, 353, 7, 5, 57.00, '2014-12-19', '2014-11-19 09:27:38', 1, 1, 'P', 'S', 1),
(258, 354, 5, 190, 160.00, '2014-11-19', '2014-11-19 09:42:15', 1, 1, 'P', 'S', 1),
(259, 354, 5, 190, 150.00, '2014-12-19', '2014-11-19 09:42:15', 1, 1, 'P', 'S', 1),
(260, 316, 1, 159, 140.00, '2014-11-19', '2014-11-19 10:08:15', 1, 1, 'P', 'S', 1),
(261, 355, 7, 192, 20.00, '2014-11-19', '2014-11-19 10:20:17', 1, 1, 'P', 'S', 1),
(262, 355, 7, 192, 5.00, '2014-12-19', '2014-11-19 10:20:17', 1, 1, 'D', 'S', 1),
(263, 359, 1, 193, 40.00, '2014-11-19', '2014-11-19 13:41:06', 1, 1, 'P', 'S', 1),
(264, 360, 1, 194, 240.00, '2014-11-19', '2014-11-19 13:55:16', 1, 1, 'P', 'S', 1),
(265, 323, 7, 91, 199.00, '2014-12-19', '2014-11-19 14:20:41', 1, 1, 'D', 'S', 1),
(266, 231, 7, 91, 0.01, '2014-12-19', '2014-11-19 14:21:21', 1, 1, 'D', 'S', 1),
(267, 361, 1, 195, 30.00, '2014-11-19', '2014-11-19 14:49:38', 1, 1, 'P', 'S', 1),
(268, 361, 1, 195, 30.00, '2014-11-19', '2014-11-19 14:50:04', 1, 1, 'P', 'S', 1),
(269, 285, 7, 90, 0.01, '2014-12-20', '2014-11-20 08:50:14', 1, 1, 'D', 'S', 1),
(270, 318, 5, 165, 150.00, '2014-11-20', '2014-11-20 09:11:22', 1, 1, 'P', 'S', 1),
(271, 318, 5, 165, 0.00, '2014-12-20', '2014-11-20 09:11:23', 1, 1, 'P', 'S', 1),
(272, 366, 2, 198, 200.00, '2014-11-20', '2014-11-20 10:36:58', 1, 1, 'P', 'S', 1),
(273, 366, 2, 198, 0.00, '2014-12-20', '2014-11-20 10:36:58', 1, 1, 'D', 'S', 1),
(274, 367, 1, 199, 180.00, '2014-11-20', '2014-11-20 10:49:47', 1, 1, 'P', 'S', 1),
(275, 273, 3, 127, 90.00, '2014-11-20', '2014-11-20 11:02:27', 1, 1, 'P', 'S', 1),
(276, 273, 3, 127, 0.00, '2014-11-21', '2014-11-20 11:02:27', 1, 1, 'P', 'S', 1),
(277, 370, 7, 202, 2900.00, '2014-12-20', '2014-11-20 12:07:06', 1, 1, 'D', 'S', 1),
(278, 369, 1, 201, 60.00, '2014-11-20', '2014-11-20 13:41:16', 1, 1, 'P', 'S', 1),
(279, 371, 1, 203, 15.00, '2014-11-20', '2014-11-20 13:47:34', 1, 1, 'P', 'S', 1),
(280, 373, 1, 204, 15.00, '2014-11-20', '2014-11-20 13:52:41', 1, 1, 'P', 'S', 1),
(281, 374, 1, 205, 30.00, '2014-11-20', '2014-11-20 14:42:23', 1, 1, 'P', 'S', 1),
(282, 313, 7, 156, 102.00, '2014-12-20', '2014-11-20 16:18:22', 1, 1, 'D', 'S', 1),
(283, 376, 1, 207, 560.00, '2014-11-20', '2014-11-20 16:50:49', 1, 1, 'P', 'S', 1),
(284, 375, 7, 206, 243.00, '2014-12-20', '2014-11-20 17:53:26', 1, 1, 'P', 'S', 1),
(285, 377, 7, 208, 4893.34, '2014-12-20', '2014-11-20 17:53:59', 1, 1, 'D', 'S', 1),
(286, 375, 7, 206, 243.00, '2014-12-20', '2014-11-20 18:00:46', 1, 1, 'D', 'S', 1),
(287, 372, 7, 137, 660.00, '2014-12-20', '2014-11-20 18:01:32', 1, 1, 'P', 'S', 1),
(288, 365, 7, 197, 324.00, '2014-12-20', '2014-11-20 18:02:21', 1, 1, 'P', 'S', 1),
(289, 363, 7, 191, 95.00, '2014-12-20', '2014-11-20 18:02:57', 1, 1, 'D', 'S', 1),
(290, 362, 7, 137, 276.00, '2014-12-20', '2014-11-20 18:03:19', 1, 1, 'P', 'S', 1),
(291, 230, 7, 89, 640.00, '2014-12-20', '2014-11-20 18:05:38', 1, 1, 'D', 'S', 1),
(292, 232, 7, 92, 134.00, '2014-12-20', '2014-11-20 18:05:57', 1, 1, 'D', 'S', 1),
(293, 239, 7, 85, 0.01, '2014-12-20', '2014-11-20 18:06:13', 1, 1, 'D', 'S', 1),
(294, 241, 7, 91, 1080.00, '2014-12-20', '2014-11-20 18:08:55', 1, 1, 'D', 'S', 1),
(295, 250, 7, 106, 17.00, '2014-12-20', '2014-11-20 18:09:18', 1, 1, 'D', 'S', 1),
(296, 379, 7, 210, 51.00, '2014-12-21', '2014-11-21 08:44:31', 1, 1, 'P', 'S', 1),
(297, 378, 7, 209, 68.00, '2014-12-21', '2014-11-21 08:44:47', 1, 1, 'P', 'S', 1),
(298, 377, 7, 208, 4893.34, '2014-12-21', '2014-11-21 08:44:59', 1, 1, 'D', 'S', 1),
(299, 380, 7, 211, 60.00, '2014-12-21', '2014-11-21 09:02:58', 1, 1, 'D', 'S', 1),
(300, 380, 3, 211, 60.00, '2014-11-21', '2014-11-21 09:10:02', 1, 1, 'P', 'S', 1),
(301, 380, 3, 211, 0.00, '2014-11-22', '2014-11-21 09:10:02', 1, 1, 'P', 'S', 1),
(302, 380, 3, 211, 60.00, '2014-11-21', '2014-11-21 09:31:38', 1, 1, 'P', 'S', 1),
(303, 380, 3, 211, 0.00, '2014-11-22', '2014-11-21 09:31:38', 1, 1, 'P', 'S', 1),
(304, 380, 1, 211, 60.00, '2014-11-21', '2014-11-21 09:44:46', 1, 1, 'P', 'S', 1),
(305, 239, 7, 85, 0.01, '2014-12-21', '2014-11-21 10:10:04', 1, 1, 'D', 'S', 1),
(306, 248, 7, 85, 51.00, '2014-12-21', '2014-11-21 10:10:40', 1, 1, 'D', 'S', 1),
(307, 249, 7, 105, 300.00, '2014-12-21', '2014-11-21 10:11:14', 1, 1, 'P', 'S', 1),
(308, 271, 7, 69, 50.00, '2014-12-21', '2014-11-21 10:12:52', 1, 1, 'D', 'S', 1),
(309, 352, 7, 189, 20.00, '2014-12-21', '2014-11-21 12:19:27', 1, 1, 'D', 'S', 1),
(310, 347, 7, 130, 40.00, '2014-12-21', '2014-11-21 12:19:43', 1, 1, 'D', 'S', 1),
(311, 383, 7, 213, 30.00, '2014-12-21', '2014-11-21 12:20:09', 1, 1, 'P', 'S', 1),
(312, 382, 7, 212, 30.00, '2014-12-21', '2014-11-21 12:20:23', 1, 1, 'P', 'S', 1),
(313, 381, 7, 91, 597.00, '2014-12-21', '2014-11-21 12:20:40', 1, 1, 'D', 'S', 1),
(314, 383, 1, 213, 30.00, '2014-11-21', '2014-11-21 12:22:49', 1, 1, 'P', 'S', 1),
(315, 386, 7, 214, 100.00, '2014-12-21', '2014-11-21 14:02:25', 1, 1, 'P', 'S', 1),
(316, 333, 7, 175, 40.00, '2014-12-21', '2014-11-21 14:10:57', 1, 1, 'P', 'S', 1),
(317, 384, 1, 189, 7.00, '2014-11-21', '2014-11-21 14:27:43', 1, 1, 'P', 'S', 1),
(318, 387, 7, 56, 70.00, '2014-12-21', '2014-11-21 14:50:16', 1, 1, 'D', 'S', 1),
(319, 391, 7, 216, 185.00, '2014-12-21', '2014-11-21 16:37:07', 1, 1, 'P', 'S', 1),
(320, 392, 7, 217, 1700.00, '2014-12-21', '2014-11-21 17:30:54', 1, 1, 'P', 'S', 1),
(321, 388, 4, 215, 302.00, '2014-11-21', '2014-11-21 17:47:30', 1, 1, 'P', 'S', 1),
(322, 388, 4, 215, 302.00, '2014-11-30', '2014-11-21 17:47:30', 1, 9, 'D', 'S', 1),
(323, 388, 4, 215, 302.00, '2014-12-30', '2014-11-21 17:47:30', 2, 9, 'D', 'S', 1),
(324, 388, 4, 215, 302.00, '2015-01-30', '2014-11-21 17:47:30', 3, 9, 'D', 'S', 1),
(325, 388, 4, 215, 302.00, '2015-02-28', '2014-11-21 17:47:30', 4, 9, 'D', 'S', 1),
(326, 388, 4, 215, 302.00, '2015-03-30', '2014-11-21 17:47:30', 5, 9, 'D', 'S', 1),
(327, 388, 4, 215, 302.00, '2015-04-30', '2014-11-21 17:47:30', 6, 9, 'D', 'S', 1),
(328, 388, 4, 215, 302.00, '2015-05-30', '2014-11-21 17:47:30', 7, 9, 'D', 'S', 1),
(329, 388, 4, 215, 302.00, '2015-06-30', '2014-11-21 17:47:30', 8, 9, 'D', 'S', 1),
(330, 388, 4, 215, 302.00, '2015-07-30', '2014-11-21 17:47:30', 9, 9, 'D', 'S', 1),
(331, 395, 1, 147, 20.00, '2014-11-22', '2014-11-22 10:14:53', 1, 1, 'P', 'S', 1),
(332, 396, 7, 219, 20.00, '2014-11-22', '2014-11-22 10:32:14', 1, 1, 'P', 'S', 1),
(333, 396, 7, 219, 7.00, '2014-12-22', '2014-11-22 10:32:14', 1, 2, 'P', 'S', 1),
(334, 396, 7, 219, 7.00, '2015-01-22', '2014-11-22 10:32:14', 2, 2, 'P', 'S', 1),
(335, 333, 1, 175, 40.00, '2014-11-22', '2014-11-22 12:59:02', 1, 1, 'P', 'S', 1),
(336, 397, 7, 170, 60.00, '2014-12-24', '2014-11-24 10:36:21', 1, 1, 'D', 'S', 1),
(337, 398, 1, 25, 10.00, '2014-11-24', '2014-11-24 10:42:23', 1, 1, 'P', 'S', 1),
(338, 399, 7, 220, 600.00, '2014-12-24', '2014-11-24 10:43:08', 1, 1, 'D', 'S', 1),
(339, 404, 1, 222, 25.00, '2014-11-24', '2014-11-24 12:52:20', 1, 1, 'P', 'S', 1),
(340, 345, 7, 156, 4.00, '2014-12-24', '2014-11-24 14:11:10', 1, 1, 'P', 'S', 1),
(341, 406, 7, 224, 68.00, '2014-12-24', '2014-11-24 15:18:27', 1, 1, 'P', 'S', 1),
(342, 319, 1, 166, 25.00, '2014-11-24', '2014-11-24 15:22:49', 1, 1, 'P', 'S', 1),
(343, 407, 7, 225, 302.50, '2014-11-24', '2014-11-24 16:02:23', 1, 1, 'P', 'S', 1),
(344, 407, 7, 225, 201.25, '2014-12-24', '2014-11-24 16:02:23', 1, 2, 'D', 'S', 1),
(345, 407, 7, 225, 201.25, '2015-01-24', '2014-11-24 16:02:23', 2, 2, 'D', 'S', 1),
(346, 408, 7, 226, 205.05, '2014-11-25', '2014-11-24 16:26:02', 1, 3, 'D', 'S', 1),
(347, 408, 7, 226, 1850.00, '2014-12-01', '2014-11-24 16:26:02', 2, 3, 'D', 'S', 1),
(348, 408, 7, 226, 942.72, '2014-12-18', '2014-11-24 16:26:02', 3, 3, 'D', 'S', 1),
(349, 405, 7, 223, 34.00, '2014-12-24', '2014-11-24 16:28:49', 1, 1, 'D', 'S', 1),
(350, 407, 7, 225, 312.50, '2014-11-24', '2014-11-24 17:05:55', 1, 1, 'P', 'S', 1),
(351, 407, 7, 225, 392.50, '2014-12-24', '2014-11-24 17:05:55', 1, 1, 'D', 'S', 1),
(352, 409, 7, 200, 80.00, '2014-12-24', '2014-11-24 18:04:09', 1, 1, 'D', 'S', 1),
(353, 325, 7, 169, 45.00, '2014-12-25', '2014-11-25 10:51:19', 1, 1, 'P', 'S', 1),
(354, 414, 7, 91, 80.00, '2014-12-25', '2014-11-25 11:19:11', 1, 1, 'D', 'S', 1),
(355, 372, 3, 137, 576.00, '2014-11-25', '2014-11-25 12:07:23', 1, 1, 'P', 'S', 1),
(356, 372, 3, 137, 0.00, '2014-11-26', '2014-11-25 12:07:23', 1, 1, 'D', 'S', 1),
(357, 416, 7, 232, 10.00, '2014-12-25', '2014-11-25 12:23:43', 1, 1, 'P', 'S', 1),
(358, 415, 7, 231, 40.00, '2014-12-25', '2014-11-25 12:25:15', 1, 1, 'D', 'S', 1),
(359, 417, 7, 234, 35.00, '2014-12-25', '2014-11-25 13:39:39', 1, 1, 'P', 'S', 1),
(360, 418, 7, 233, 94.50, '2014-12-25', '2014-11-25 14:12:41', 1, 1, 'D', 'S', 1),
(361, 351, 4, 188, 460.00, '2014-12-25', '2014-11-25 14:19:12', 1, 1, 'P', 'S', 1),
(362, 419, 7, 59, 60.00, '2014-12-25', '2014-11-25 14:42:45', 1, 1, 'D', 'S', 1),
(363, 420, 7, 107, 8.50, '2014-12-25', '2014-11-25 14:53:39', 1, 2, 'P', 'S', 1),
(364, 420, 7, 107, 8.50, '2015-01-25', '2014-11-25 14:53:39', 2, 2, 'P', 'S', 1),
(365, 421, 7, 137, 153.00, '2014-12-25', '2014-11-25 14:56:28', 1, 1, 'D', 'S', 1),
(366, 412, 7, 229, 1000.00, '2014-11-25', '2014-11-25 15:42:51', 1, 1, 'P', 'S', 1),
(367, 412, 7, 229, 1510.00, '2014-12-25', '2014-11-25 15:42:51', 1, 2, 'D', 'S', 1),
(368, 412, 7, 229, 1510.00, '2015-01-25', '2014-11-25 15:42:51', 2, 2, 'D', 'S', 1),
(369, 423, 7, 236, 17.00, '2014-12-25', '2014-11-25 16:32:53', 1, 1, 'P', 'S', 1),
(370, 391, 7, 216, 100.00, '2014-11-25', '2014-11-25 16:50:24', 1, 1, 'P', 'S', 1),
(371, 391, 7, 216, 42.50, '2014-12-25', '2014-11-25 16:50:24', 1, 2, 'P', 'S', 1),
(372, 391, 7, 216, 42.50, '2015-01-25', '2014-11-25 16:50:24', 2, 2, 'P', 'S', 1),
(373, 424, 7, 237, 80.00, '2014-12-25', '2014-11-25 16:59:24', 1, 1, 'P', 'S', 1),
(374, 263, 7, 115, 324.00, '2014-12-25', '2014-11-25 18:50:35', 1, 1, 'D', 'S', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `retiradas`
--

CREATE TABLE IF NOT EXISTS `retiradas` (
  `retiradaID` int(11) NOT NULL AUTO_INCREMENT,
  `caixaID` int(11) NOT NULL,
  `usuario` varchar(50) NOT NULL,
  `responsavel` varchar(50) NOT NULL,
  `valor` float(10,2) NOT NULL,
  `observacao` text NOT NULL,
  `data` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `empresaID` int(11) NOT NULL,
  PRIMARY KEY (`retiradaID`),
  KEY `empresaID` (`empresaID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=51 ;

--
-- Extraindo dados da tabela `retiradas`
--

INSERT INTO `retiradas` (`retiradaID`, `caixaID`, `usuario`, `responsavel`, `valor`, `observacao`, `data`, `empresaID`) VALUES
(3, 48, 'patricia', 'Patricia Santana', 15.00, 'Pagamento Retrovisor da Kombi', '2014-11-11 10:45:40', 1),
(4, 51, 'patricia', 'Patricia Santana', 172.00, 'Pagamento Gilberto', '2014-11-11 14:34:07', 1),
(5, 51, 'patricia', 'Patricia Santana', 20.00, 'Gasolina Edson', '2014-11-11 14:40:19', 1),
(6, 53, 'patricia', 'Patricia Santana', 40.00, 'Gasolina- Charles e Fabiano', '2014-11-12 08:09:09', 1),
(7, 53, 'patricia', 'Patricia Santana', 650.00, 'deposito', '2014-11-12 15:41:16', 1),
(8, 58, 'patricia', 'Patricia Santana', 1200.00, 'deposito Max Toldos', '2014-11-13 10:51:53', 1),
(9, 58, 'patricia', 'Patricia Santana', 20.00, 'Gasolina Cleber', '2014-11-13 13:33:37', 1),
(10, 58, 'patricia', 'Patricia Santana', 1500.00, 'DEPOSITO MIX ( APOGEU)', '2014-11-13 13:46:43', 1),
(11, 60, 'patricia', 'Patricia Santana', 20.00, 'Gasolina Charles', '2014-11-14 08:04:23', 1),
(12, 60, 'patricia', 'Patricia Santana', 30.00, 'Almoço Funcionários (Posto 5M)', '2014-11-14 08:05:04', 1),
(13, 60, 'patricia', 'Patricia Santana', 250.00, 'Deposito', '2014-11-14 12:34:34', 1),
(14, 60, 'patricia', 'Patricia Santana', 3680.00, 'Cheques para Deposito', '2014-11-14 12:35:56', 1),
(15, 60, 'PATRICIA', 'Patricia Santana', 50.00, 'Deposito', '2014-11-14 16:58:16', 1),
(16, 62, 'patricia', 'Patricia Santana', 20.00, 'Gasolina Charles', '2014-11-17 08:53:23', 1),
(17, 62, 'patricia', 'Patricia Santana', 4.50, 'Água- DG Distribuidora', '2014-11-17 14:06:00', 1),
(18, 62, 'patricia', 'Patricia Santana', 16.12, 'Drogaria(anti Séptico)', '2014-11-17 14:07:19', 1),
(19, 63, 'gabriela ', 'Patricia Santana', 300.00, 'SANGRIA- PATRICIA', '2014-11-17 14:10:14', 1),
(20, 63, 'gabriela ', 'Patricia Santana', 250.00, 'SANGRIA- PATRICIA', '2014-11-17 16:15:09', 1),
(21, 62, 'patricia', 'Patricia Santana', 12.00, 'PILHAS', '2014-11-17 16:39:43', 1),
(22, 64, 'gabriela ', 'Patricia Santana', 20.00, 'GASOLINA CHARLES ', '2014-11-18 08:22:11', 1),
(23, 64, 'gabriela ', 'Patricia Santana', 800.00, 'CHEQUE MAX ', '2014-11-18 17:00:40', 1),
(24, 67, 'patricia', 'Patricia Santana', 20.00, 'Chaveiro Brasil Copias p Saul', '2014-11-19 16:59:28', 1),
(25, 66, 'gabriela ', 'Patricia Santana', 40.00, 'gasolina charles e cleber ', '2014-11-19 17:21:19', 1),
(26, 66, 'gabriela ', 'Patricia Santana', 20.00, 'copia de chaves ', '2014-11-19 17:23:15', 1),
(27, 66, 'gabriela ', 'Patricia Santana', 110.00, 'deposito', '2014-11-19 17:27:36', 1),
(28, 66, 'gabriela ', 'Patricia Santana', 9.50, 'almoço alan ', '2014-11-19 17:28:38', 1),
(29, 66, 'gabriela ', 'Patricia Santana', 12.00, 'agua', '2014-11-19 17:30:44', 1),
(30, 68, 'gabriela ', 'Patricia Santana', 20.00, 'GASOLINA CHARLES ', '2014-11-20 09:48:42', 1),
(31, 68, 'gabriela ', 'Patricia Santana', 11.50, 'almoço alan ', '2014-11-20 18:23:32', 1),
(32, 68, 'gabriela ', 'Patricia Santana', 1410.00, '1260,00 EM DINHEIRO E R$ 150,00 CHEQUE', '2014-11-20 18:25:46', 1),
(33, 71, 'patricia', 'Patricia Santana', 20.00, 'Gasolina Charles', '2014-11-21 09:52:13', 1),
(34, 71, 'patricia', 'Patricia Santana', 11.50, 'ALMOÇO ALAN', '2014-11-21 14:50:43', 1),
(35, 71, 'patricia', 'Patricia Santana', 75.00, 'TONNER', '2014-11-21 15:28:32', 1),
(36, 71, 'patricia', 'Patricia Santana', 7.50, 'ROLO P PINTURA', '2014-11-21 15:28:50', 1),
(37, 71, 'patricia', 'Patricia Santana', 50.00, 'PASTA P LIMPEZA DE M&#195;O', '2014-11-21 15:29:16', 1),
(38, 71, 'PATRICIA', 'Patricia Santana', 150.00, 'ROGÉRIO DEPOSITO', '2014-11-21 17:39:06', 1),
(39, 72, 'patricia', 'Patricia Santana', 20.00, 'GASOLINA EDSON', '2014-11-22 09:37:52', 1),
(40, 73, 'patricia', 'Patricia Santana', 100.00, 'Deposito', '2014-11-22 13:00:10', 1),
(41, 75, 'gabriela ', 'Patricia Santana', 712.50, 'DEPOSITO 312,50 CHEQUE', '2014-11-24 16:39:42', 1),
(42, 74, 'patricia', 'Patricia Santana', 1147.77, 'Cheques para Deposito', '2014-11-24 16:40:15', 1),
(43, 75, 'gabriela ', 'Patricia Santana', 20.00, 'GASOLINA CHARLES ', '2014-11-24 16:47:23', 1),
(44, 75, 'gabriela ', 'Patricia Santana', 11.00, 'ALMOÇO ALLAN ', '2014-11-24 16:49:32', 1),
(45, 75, 'gabriela ', 'Patricia Santana', 8.00, 'AGUA ', '2014-11-24 16:50:27', 1),
(46, 78, 'patricia', 'Patricia Santana', 11.50, 'ALMOÇO ALAN', '2014-11-25 12:19:41', 1),
(47, 77, 'gabriela ', 'Patricia Santana', 20.00, 'GASOLINA ', '2014-11-25 16:38:21', 1),
(48, 77, 'gabriela ', 'Patricia Santana', 11.50, 'ALMOÇO ROGERIO', '2014-11-25 16:40:24', 1),
(49, 77, 'gabriela ', 'Patricia Santana', 11.50, 'ALMOÇO ROGERIO', '2014-11-25 16:43:25', 1),
(50, 77, 'gabriela ', 'Patricia Santana', 710.00, 'RETIRADA', '2014-11-25 17:02:46', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `retiradasestoque`
--

CREATE TABLE IF NOT EXISTS `retiradasestoque` (
  `retiradaID` int(11) NOT NULL AUTO_INCREMENT,
  `produtoID` int(11) NOT NULL,
  `quantidade` float(10,2) NOT NULL,
  `motivo` text NOT NULL,
  `usuario` varchar(100) NOT NULL,
  `data` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `empresaID` int(11) NOT NULL,
  PRIMARY KEY (`retiradaID`),
  KEY `empresaID` (`empresaID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Extraindo dados da tabela `retiradasestoque`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `servico`
--

CREATE TABLE IF NOT EXISTS `servico` (
  `servicoID` int(11) NOT NULL AUTO_INCREMENT,
  `OS` int(11) DEFAULT '0',
  `anoServico` year(4) NOT NULL,
  `clienteID` int(11) NOT NULL,
  `veiculoID` int(11) NOT NULL DEFAULT '0',
  `km` int(11) NOT NULL DEFAULT '0',
  `empresaID` int(11) NOT NULL,
  `formPagID` int(11) NOT NULL DEFAULT '0',
  `entrada` float(10,2) NOT NULL DEFAULT '0.00',
  `troco` float(10,2) NOT NULL DEFAULT '0.00',
  `vezes` int(11) NOT NULL DEFAULT '0',
  `desconto` float(10,2) NOT NULL DEFAULT '0.00',
  `descricao` text NOT NULL,
  `dataInicio` date NOT NULL,
  `dataprevista` date NOT NULL DEFAULT '0000-00-00',
  `dataAgendamento` date NOT NULL DEFAULT '0000-00-00',
  `dataFim` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `valor` float(10,2) NOT NULL,
  `usuario` varchar(50) NOT NULL,
  `status` varchar(1) NOT NULL DEFAULT 'M' COMMENT 'M (Em manutenção, em andamento) OU F (Finalizado)',
  `observacao` varchar(255) DEFAULT NULL,
  `visualizacao` varchar(1) NOT NULL DEFAULT 'N' COMMENT 'S (sim) OU N (não)',
  `finalizado` varchar(1) NOT NULL DEFAULT 'N',
  `nivelUsuario` int(11) NOT NULL,
  `caminhoArte` varchar(255) DEFAULT NULL,
  `passo` varchar(255) NOT NULL DEFAULT 'NOVO',
  `reagendado` tinyint(1) NOT NULL DEFAULT '0',
  `tipo` int(1) NOT NULL DEFAULT '0',
  `obsOrcamento` varchar(255) DEFAULT NULL,
  `rotina` int(11) DEFAULT NULL,
  `visualizadoR2` varchar(1) NOT NULL DEFAULT 'N',
  PRIMARY KEY (`servicoID`),
  KEY `anoServico` (`anoServico`),
  KEY `OS` (`OS`),
  KEY `idx_1` (`visualizacao`),
  KEY `idx_2` (`clienteID`,`empresaID`,`finalizado`,`nivelUsuario`,`status`),
  KEY `idx_3` (`clienteID`,`empresaID`,`finalizado`,`status`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=425 ;

--
-- Extraindo dados da tabela `servico`
--

INSERT INTO `servico` (`servicoID`, `OS`, `anoServico`, `clienteID`, `veiculoID`, `km`, `empresaID`, `formPagID`, `entrada`, `troco`, `vezes`, `desconto`, `descricao`, `dataInicio`, `dataprevista`, `dataAgendamento`, `dataFim`, `valor`, `usuario`, `status`, `observacao`, `visualizacao`, `finalizado`, `nivelUsuario`, `caminhoArte`, `passo`, `reagendado`, `tipo`, `obsOrcamento`, `rotina`, `visualizadoR2`) VALUES
(226, 1, 2014, 87, 0, 0, 1, 7, 0.00, 0.00, 1, 0.00, 'PANETTONE \r\n** VERIFICAR A POSSIBILIDADE DA RETIRADA QUARTA -FEIRA A TARDE** ', '2014-11-11', '2014-11-12', '0000-00-00', '2014-11-17 14:30:40', 35.00, '14', 'F', NULL, 'S', 'F', 2, 'CLIENTES / GABRIELA ROMANATO / NOVEMBRO 11 / 01', 'FINALIZADO', 0, 0, NULL, 0, 'N'),
(227, 2, 2014, 88, 0, 0, 1, 7, 0.00, 0.00, 1, 0.00, 'SANTA LUZIA \r\nVEM RETIRAR NA QUINTA AS 13:00 ', '2014-11-11', '2014-11-13', '0000-00-00', '2014-11-17 14:57:26', 210.00, '14', 'M', NULL, 'N', 'N', 2, 'NOVEMBRO/ FAIXA / FAIXA EDNA / 02', 'FINALIZADO', 0, 0, NULL, 0, 'N'),
(228, 3, 2014, 59, 0, 0, 1, 1, 0.00, 0.00, 1, 0.00, 'LONA DE FAIXA COM SOLDA E ILHÓS (ILHÓS IGUAIS POIS SERA COLOCADO EM CAVALETE) \r\n\r\nORDEM DE SERVIÇO CANCELADAAAAAAAAA', '2014-11-11', '2014-11-13', '0000-00-00', '2014-11-14 16:17:57', 126.00, '14', 'M', NULL, 'N', 'N', 2, 'NOVEMBRO / FAIXA /FAIXA ADAIR / 03 ', 'FINALIZADO', 0, 0, NULL, 0, 'N'),
(229, 3, 2014, 59, 0, 0, 1, 1, 126.00, 0.00, 1, 0.00, 'LONA DE FAIXA COM SOLDA E ILHÓS (ILHÓS IGUAIS POIS SERA COLOCADO EM CAVALETE) ', '2014-11-11', '2014-11-13', '0000-00-00', '2014-11-12 15:14:14', 126.00, '14', 'F', NULL, 'S', 'F', 2, 'NOVEMBRO /  LONA / LONA ADAIR / 03', 'FINALIZADO', 0, 0, NULL, 0, 'N'),
(230, 4, 2014, 89, 0, 0, 1, 7, 0.00, 0.00, 1, 0.00, 'ADESIVO IMPRESSO PARA PAREDE E PARA FREEZER ', '2014-11-11', '2014-11-17', '0000-00-00', '2014-11-11 13:25:23', 640.00, '14', 'M', NULL, 'S', 'N', 4, 'CLIENTES / ROBERTO BATATA CHIC / 04 ', 'IMPRESSAO', 0, 0, NULL, 0, 'N'),
(231, 5, 2014, 91, 0, 0, 1, 7, 0.00, 0.00, 1, 0.00, 'ADOÇ&#195;O E VACINAÇ&#195;O ', '2014-11-11', '2014-11-11', '0000-00-00', '2014-11-25 18:12:15', 0.01, '14', 'F', NULL, 'S', 'F', 2, 'Clientes2014Prefeitura ItupevaNovembro 11 Faixa Itupeva 05', 'FINALIZADO', 0, 0, NULL, 0, 'N'),
(232, 6, 2014, 92, 0, 0, 1, 7, 0.00, 0.00, 1, 0.00, 'MULTIPLICAÇ&#195;O DE CÉLULAS \r\n\r\n-CANCELAR A ORDEM , N&#195;O FEZ O SERVIÇO - ', '2014-11-11', '2014-11-13', '0000-00-00', '2014-11-25 10:39:02', 134.00, '14', 'M', NULL, 'N', 'N', 2, 'NOVEMBRO / FAIXA/ FAIXA STHEINER / 06', 'FINALIZADO', 0, 0, NULL, 0, 'N'),
(233, 7, 2014, 93, 0, 0, 1, 1, 70.00, 0.00, 1, 0.00, '01 FAIXA DE 2,00 X 0,70 \r\n01 FAIXA DE 3,00 X 0,70 ', '2014-11-11', '2014-11-13', '0000-00-00', '2014-11-14 16:34:53', 70.00, '14', 'F', NULL, 'S', 'F', 2, 'NOVEMBRO/ FAIXA / FAIXA RANCHO DO ZEZE ', 'FINALIZADO', 0, 0, NULL, 0, 'N'),
(234, 8, 2014, 95, 0, 0, 1, 7, 0.00, 0.00, 1, 0.00, 'CONSTRUCARD', '2014-11-11', '2014-11-13', '0000-00-00', '2014-11-14 13:38:18', 100.00, '14', 'F', NULL, 'S', 'F', 2, 'NOVEMBRO / FAIXA / FAIXA MARCELO / 08 ', 'FINALIZADO', 0, 0, NULL, 0, 'N'),
(235, 9, 2014, 97, 0, 0, 1, 1, 20.00, 0.00, 1, 0.00, 'MANICURE ', '2014-11-11', '2014-11-13', '0000-00-00', '2014-11-13 16:11:28', 20.00, '14', 'F', NULL, 'S', 'F', 2, 'NOVEMBRO / BANNER /BANNER MICKELY / 9', 'FINALIZADO', 0, 0, NULL, 0, 'N'),
(236, 10, 2014, 98, 0, 0, 1, 3, 0.00, 0.00, 0, 0.00, 'Em Chapa galvanizada e metalon 20x20\r\nCongregaç&#227;o Crist&#227; no Brasil', '2014-11-11', '2014-11-21', '0000-00-00', '2014-11-24 08:15:20', 120.00, '8', 'M', NULL, 'S', 'N', 8, 'Novembro/adesivos/ads Custodio 10', 'PRODUCAO', 0, 0, NULL, 1, 'V'),
(237, 10, 2014, 98, 0, 0, 1, 3, 117.00, 0.00, 1, 3.00, 'Em Chapa galvanizada e metalon 20x20\r\nCongregaç&#227;o Crist&#227; no Brasil', '2014-11-11', '2014-11-21', '0000-00-00', '2014-11-24 08:14:20', 117.00, '8', 'M', NULL, 'S', 'N', 8, 'Novembro/adesivos/ads Custodio 10', 'PRODUCAO', 0, 0, NULL, 1, 'V'),
(238, 11, 2014, 99, 0, 0, 1, 1, 30.00, 0.00, 1, 0.00, 'O Ide de Jesus n&#227;o é um chamado é uma ordem....', '2014-11-11', '2014-11-13', '0000-00-00', '2014-11-13 16:12:19', 30.00, '8', 'F', NULL, 'S', 'F', 2, 'Novembro/Banners/Banner Jeferson 10', 'FINALIZADO', 0, 0, NULL, 0, 'N'),
(239, 12, 2014, 85, 0, 0, 1, 7, 0.00, 0.00, 1, 0.00, 'FROZEN E PEPPA', '2014-11-11', '2014-11-11', '0000-00-00', '2014-11-21 10:10:24', 0.01, '14', 'F', NULL, 'S', 'F', 2, '', 'FINALIZADO', 0, 0, NULL, 0, 'N'),
(240, 13, 2014, 90, 0, 0, 1, 7, 0.00, 0.00, 1, 0.00, 'campanha aids e sífilis ', '2014-11-11', '2014-11-12', '0000-00-00', '2014-11-18 08:49:25', 175.50, '14', 'F', NULL, 'S', 'F', 2, 'Clientes / prefeitura de jundiai / novembro 11 / banner 13', 'FINALIZADO', 0, 0, NULL, 0, 'N'),
(241, 14, 2014, 91, 0, 0, 1, 7, 0.00, 0.00, 1, 0.00, 'pronto socorro infantil ', '2014-11-11', '2014-11-12', '0000-00-00', '2014-11-20 18:08:55', 1080.00, '14', 'M', NULL, 'S', 'N', 4, 'clientes/ prefeitura de itupeva / novembro 11 / perfurado / 14', 'IMPRESSAO', 0, 0, NULL, 0, 'N'),
(242, 15, 2014, 100, 0, 0, 1, 1, 20.00, 0.00, 1, 0.00, 'PLAQUINHA DE CASAMENTO\r\nPVC 2 MM ', '2014-11-11', '2014-11-12', '0000-00-00', '2014-11-13 16:39:55', 20.00, '14', 'F', NULL, 'S', 'F', 2, 'NOVEMBRO / ADESIVO / ADESIVO RONI / 15', 'FINALIZADO', 0, 0, NULL, 0, 'N'),
(243, 16, 2014, 101, 0, 0, 1, 1, 50.00, 0.00, 1, 0.00, 'Já foi Feito', '2014-11-11', '2014-11-11', '0000-00-00', '2014-11-11 16:20:09', 50.00, '8', 'F', NULL, 'S', 'F', 1, 'ja entregue', 'FINALIZADO', 0, 0, NULL, 0, 'N'),
(244, 17, 2014, 103, 0, 0, 1, 1, 0.00, 0.00, 0, 0.00, 'Já foi entregue!', '2014-11-11', '2014-11-11', '0000-00-00', '2014-11-11 16:19:01', 150.00, '8', 'F', NULL, 'S', 'F', 1, 'entregue', 'FINALIZADO', 0, 0, NULL, 0, 'N'),
(245, 17, 2014, 103, 0, 0, 1, 1, 150.00, 0.00, 1, 0.00, 'Já foi entregue!', '2014-11-11', '2014-11-11', '0000-00-00', '2014-11-11 16:18:46', 150.00, '8', 'F', NULL, 'S', 'F', 1, 'entregue', 'FINALIZADO', 0, 0, NULL, 0, 'N'),
(246, 18, 2014, 104, 0, 0, 1, 1, 225.00, 0.00, 1, 0.00, 'SORVETES PARA AMANHA ', '2014-11-11', '2014-11-12', '0000-00-00', '2014-11-12 15:13:28', 225.00, '14', 'F', NULL, 'S', 'F', 2, 'CLIENTES / ELCIO / NOVEMBRO 11 / BANNER / 18', 'FINALIZADO', 0, 0, NULL, 0, 'N'),
(247, 19, 2014, 91, 0, 0, 1, 0, 0.00, 0.00, 0, 0.00, 'PAINEL ACM BRANCO ', '2014-11-11', '2014-12-11', '0000-00-00', '2014-11-14 10:05:21', 1960.00, '14', 'M', NULL, 'S', 'N', 4, 'CLIENTES/ PREFEITURA DE ITUPEVA / NOVEMBRO 11 / PAINEL ACM / 19 ', 'PRD/IMPRESSAO', 0, 0, NULL, 1, 'V'),
(248, 20, 2014, 85, 0, 0, 1, 7, 0.00, 0.00, 1, 0.00, 'SOB NOVA DIREÇ&#195;O ', '2014-11-11', '2014-11-13', '0000-00-00', '2014-11-21 10:10:49', 51.00, '14', 'F', NULL, 'S', 'F', 2, 'NOVEMBRO / FAIXA / FAIXA MARCOS PAULO / 20', 'FINALIZADO', 0, 0, NULL, 0, 'N'),
(249, 21, 2014, 105, 0, 0, 1, 7, 0.00, 0.00, 1, 0.00, 'ENGENHEIRO ', '2014-11-11', '2014-11-13', '0000-00-00', '2014-11-25 18:12:32', 300.00, '14', 'F', NULL, 'S', 'F', 2, 'NOVEMBRO / ADESIVO / ADESIVO GUILHERME / 21 ', 'FINALIZADO', 0, 0, NULL, 0, 'N'),
(250, 22, 2014, 106, 0, 0, 1, 7, 0.00, 0.00, 1, 0.00, 'VENDE-SE ', '2014-11-11', '2014-11-13', '0000-00-00', '2014-11-25 17:12:39', 17.00, '14', 'F', NULL, 'S', 'F', 2, 'NOVEMBRO / FAIXA / FAIXA SIDINEI / 22 ', 'FINALIZADO', 0, 0, NULL, 0, 'N'),
(251, 23, 2014, 107, 0, 0, 1, 1, 17.00, 0.00, 1, 0.00, 'FERIAS ', '2014-11-11', '2014-11-13', '0000-00-00', '2014-11-13 16:12:38', 17.00, '14', 'F', NULL, 'S', 'F', 2, 'NOVEMBRO / FAIXA / FAIXA JULIANO / 23 ', 'FINALIZADO', 0, 0, NULL, 0, 'N'),
(252, 24, 2014, 108, 0, 0, 1, 7, 20.00, 0.00, 1, 0.00, 'COLOCAR ADESIVO PRETO FOSCO NA PARTE PRETA \r\nBAZAR ', '2014-11-11', '2014-11-13', '0000-00-00', '2014-11-25 18:15:16', 25.00, '14', 'M', NULL, 'S', 'N', 2, 'novembro / faixa / FAIXA LUIZ ANTONIO / 24 ', 'FINALIZADO', 0, 0, NULL, 0, 'N'),
(253, 25, 2014, 82, 0, 0, 1, 0, 0.00, 0.00, 0, 0.00, 'BANNER ', '2014-11-11', '2014-11-11', '0000-00-00', '2014-11-13 16:29:51', 0.00, '14', 'M', NULL, 'S', 'N', 2, 'NOVEMBRO / BANNER / BANNER ALEXANDRE / 25', 'FINALIZADO', 0, 0, NULL, 0, 'N'),
(254, 26, 2014, 109, 0, 0, 1, 1, 15.00, 0.00, 1, 0.00, 'VENDE-SE ', '2014-11-12', '2014-11-14', '0000-00-00', '2014-11-14 13:37:44', 15.00, '14', 'F', NULL, 'S', 'F', 2, 'NOVEMBRO / FAIXA / FAIXA DIVA / 26 ', 'FINALIZADO', 0, 0, NULL, 0, 'N'),
(255, 27, 2014, 90, 0, 0, 1, 7, 0.00, 0.00, 1, 0.00, 'exame de aids ', '2014-11-12', '2014-11-12', '0000-00-00', '2014-11-18 08:50:12', 598.50, '14', 'F', NULL, 'S', 'F', 2, 'clientes / prefeitura de jundiai / novembro 12 / faixa secretaria da saude / 27  ', 'FINALIZADO', 0, 0, NULL, 0, 'N'),
(256, 28, 2014, 70, 0, 0, 1, 0, 0.00, 0.00, 0, 0.00, 'lona de painel com solda e ilhós \r\npago 100,00 falta R$ 183,00', '2014-11-12', '2014-11-12', '0000-00-00', '2014-11-12 14:51:52', 183.00, '14', 'M', NULL, 'N', 'N', 2, 'clientes / pastor jean / novembro 07 / 102 ', 'FINALIZADO', 0, 0, NULL, 0, 'N'),
(257, 29, 2014, 110, 0, 0, 1, 1, 70.00, 0.00, 1, 0.00, 'trabalho escolar ', '2014-11-12', '2014-11-14', '0000-00-00', '2014-11-14 11:45:49', 70.00, '14', 'F', NULL, 'S', 'F', 2, 'novembro / banner / banner maria isabel / 29 ', 'FINALIZADO', 0, 0, NULL, 0, 'N'),
(258, 30, 2014, 74, 0, 0, 1, 1, 65.00, 0.00, 1, 0.00, 'EVENTO IGREJA ', '2014-11-12', '2014-11-12', '0000-00-00', '2014-11-12 15:42:05', 65.00, '14', 'F', NULL, 'S', 'F', 1, 'NOVEMBRO / FAIXA / FAIXA ARLINDO / 109 ', 'FINALIZADO', 0, 0, NULL, 0, 'N'),
(259, 31, 2014, 112, 0, 0, 1, 7, 20.00, 0.00, 1, 0.00, 'Adesivo espelhado na cor branca ( n&#227;o depelar)', '2014-11-12', '2014-11-12', '0000-00-00', '2014-11-18 08:42:48', 40.00, '8', 'F', NULL, 'S', 'F', 2, 'Novembro/adesivos/ads Claudio 31', 'FINALIZADO', 0, 0, NULL, 0, 'N'),
(260, 32, 2014, 113, 0, 0, 1, 1, 30.00, 0.00, 1, 0.00, 'LOCAÇ&#195;O DE VAN ', '2014-11-12', '2014-11-13', '0000-00-00', '2014-11-17 11:18:23', 30.00, '14', 'F', NULL, 'S', 'F', 2, 'NOVEMBRO / ADESIVO RECORTE / ADS RECORTE / 32 ', 'FINALIZADO', 0, 0, NULL, 0, 'N'),
(261, 33, 2014, 90, 0, 0, 1, 0, 0.00, 0.00, 0, 0.00, 'PLOTAGEM DE CARRO FUNERÁRIO \r\nS10\r\nUMA JÁ FOI ADESIVADA  ', '2014-11-12', '2014-11-12', '0000-00-00', '2014-11-14 15:38:47', 0.00, '14', 'M', NULL, 'N', 'N', 2, 'CLIENTES / PREFEITURA DE JUNDIAI / NOVEMBRO 12 / 33', 'FINALIZADO', 0, 0, NULL, 0, 'N'),
(262, 34, 2014, 114, 0, 0, 1, 7, 20.00, 0.00, 1, 0.00, 'LONA DE FAIXA COM SOLDA E ILHÓS\r\nSERVIÇOS DE SOLDA ELÉTRICA  \r\n', '2014-11-12', '2014-11-14', '0000-00-00', '2014-11-14 14:03:20', 30.00, '14', 'M', NULL, 'N', 'N', 2, 'NOVEMBRO / LONA / LONA VALTER / 34 ', 'FINALIZADO', 0, 0, NULL, 0, 'N'),
(263, 35, 2014, 115, 0, 0, 1, 7, 0.00, 0.00, 1, 0.00, '01- PLACA PVC 3 MM 1,00 X 0,60 * 01- PLACA PVC 2 MM 0,40 X 0,20 * 01- PLACA PVC 2 MM 0,15 X 0,35 * 01- PLACA PVC 2 MM 0,15 X 0,30 * 10 - ADESIVOS IMPRESSO 0,11 X 0,07 * 06 - ADESIVOS IMPRESSO 0,03 X 0,03 * 10 - ADESIVOS IMPRESSO 0,15 X 0,15', '2014-11-12', '2014-11-14', '0000-00-00', '2014-11-25 18:50:35', 324.00, '14', 'M', NULL, 'S', 'N', 3, 'CLIENTE / PAROQUIA BOM JESUS / NOVEMBRO 12 / 35', 'NOVO', 0, 0, NULL, 0, 'N'),
(264, 36, 2014, 116, 0, 0, 1, 1, 100.00, 0.00, 1, 0.00, 'Pedido já foi entregue! Apenas seguir o caminho de visualizaç&#245;es e execuç&#245;es! Grata', '2014-11-12', '2014-11-12', '0000-00-00', '2014-11-25 18:52:49', 100.00, '8', 'F', NULL, 'S', 'F', 2, 'Já foi entregue', 'FINALIZADO', 0, 0, NULL, 0, 'N'),
(265, 37, 2014, 90, 0, 0, 1, 0, 0.00, 0.00, 0, 0.00, 'SECRETARIA DA EDUCAÇ&#195;O', '2014-11-12', '2014-11-13', '0000-00-00', '2014-11-14 15:38:35', 135.00, '14', 'M', NULL, 'N', 'N', 2, 'CLIENTES / PREFEITURA DE JUNDIAI / NOVEMBRO / 12 / BANNERS ', 'FINALIZADO', 0, 0, NULL, 0, 'N'),
(266, 38, 2014, 119, 0, 0, 1, 1, 30.00, 0.00, 1, 0.00, 'SAL&#195;O DE BELEZA ', '2014-11-12', '2014-11-14', '0000-00-00', '2014-11-14 16:31:06', 30.00, '14', 'F', NULL, 'S', 'F', 2, 'NOVEMBRO / BANNER / BANNER FLAVIANA / 38 ', 'FINALIZADO', 0, 0, NULL, 0, 'N'),
(267, 39, 2014, 104, 0, 0, 1, 0, 0.00, 0.00, 0, 0.00, 'LAVA CAR \r\nordem de serviço gerada errada - cancelarrrrrrr', '2014-11-12', '2014-11-12', '0000-00-00', '2014-11-17 14:58:09', 78.00, '14', 'M', NULL, 'N', 'N', 2, '', 'FINALIZADO', 0, 0, NULL, 0, 'N'),
(268, 40, 2014, 86, 0, 0, 1, 1, 78.00, 0.00, 1, 0.00, 'LAVA CAR ', '2014-11-12', '2014-11-12', '0000-00-00', '2014-11-13 16:39:29', 78.00, '14', 'F', NULL, 'S', 'F', 2, '', 'FINALIZADO', 0, 0, NULL, 0, 'N'),
(269, 41, 2014, 123, 0, 0, 1, 1, 90.00, 0.00, 1, 0.00, '15 ANOS ', '2014-11-12', '2014-11-14', '0000-00-00', '2014-11-14 16:30:45', 90.00, '14', 'F', NULL, 'S', 'F', 2, 'NOVEMBRO / BANNER / BANNER KLEITON / 41 ', 'FINALIZADO', 0, 0, NULL, 0, 'N'),
(270, 42, 2014, 124, 0, 0, 1, 0, 0.00, 0.00, 0, 0.00, 'ADESIVOS ', '2014-11-13', '2014-11-13', '0000-00-00', '2014-11-14 10:29:16', 84.00, '14', 'M', NULL, 'N', 'N', 2, 'CLIENTES / MARCOS ROGERIO / NOVEMBRO 13 / 42 ', 'FINALIZADO', 0, 0, NULL, 0, 'N'),
(271, 43, 2014, 69, 0, 0, 1, 7, 0.00, 0.00, 1, 0.00, 'LONA DE FAIXA COM REBITE (ME CHAMAR QUANDO A LONA ESTIVER IMPRESSA)\r\nA CLIENTE TROUXE OS QUADROS EST&#195;O LA EMBAIXO', '2014-11-13', '2014-11-13', '0000-00-00', '2014-11-21 10:12:52', 50.00, '14', 'M', NULL, 'N', 'N', 2, 'NOVEMBRO / LONA / LONA ELIANA / 43 ', 'FINALIZADO', 0, 0, NULL, 0, 'N'),
(272, 44, 2014, 126, 0, 0, 1, 5, 95.00, 0.00, 1, 0.00, 'N&#195;O D&#202; ESMOLAS ', '2014-11-13', '2014-11-13', '0000-00-00', '2014-11-18 16:00:26', 95.00, '14', 'F', NULL, 'S', 'F', 2, 'NOVEMBRO / FAIXA / FAIXA ALCEU / 44 ', 'FINALIZADO', 0, 0, NULL, 0, 'N'),
(273, 45, 2014, 127, 0, 0, 1, 3, 90.00, 0.00, 1, 0.00, 'ENGENHEIRO', '2014-11-13', '2014-11-14', '0000-00-00', '2014-11-20 17:12:47', 90.00, '14', 'F', NULL, 'S', 'F', 2, 'CLIENTES /  ANTONIO ZONHO / NOVEMBRO 13 / 45', 'FINALIZADO', 0, 0, NULL, 0, 'N'),
(274, 45, 2014, 128, 0, 0, 1, 3, 320.00, 0.00, 1, 0.00, 'reforma de toldo', '2014-11-13', '2014-11-13', '0000-00-00', '2014-11-20 11:02:27', 670.00, '8', 'M', NULL, 'N', 'N', 2, NULL, 'AGENDAMENTO', 0, 0, NULL, 2, 'N'),
(275, 46, 2014, 96, 0, 0, 1, 0, 0.00, 0.00, 0, 0.00, 'PAGO /\r\nBEGE COM BRANCO /\r\nPINTURA PRATA /\r\nVISOR E MOLA / ', '2014-11-13', '2014-11-29', '0000-00-00', '2014-11-21 11:45:38', 0.01, '14', 'M', NULL, 'S', 'N', 8, NULL, 'PRODUCAO', 0, 0, NULL, 2, 'N'),
(276, 47, 2014, 130, 0, 0, 1, 1, 35.00, 0.00, 1, 0.00, 'FRASE EM INGLES', '2014-11-13', '2014-11-14', '0000-00-00', '2014-11-21 16:24:08', 35.00, '14', 'M', NULL, 'S', 'N', 2, 'NOVEMBRO / ADS RECORTE / ADS RECORTE EDIVALDO / 47 ', 'FINALIZADO', 0, 0, NULL, 0, 'N'),
(277, 48, 2014, 129, 0, 0, 1, 1, 30.00, 0.00, 1, 0.00, 'GLADS DELICIA ', '2014-11-13', '2014-11-14', '0000-00-00', '2014-11-14 16:34:06', 30.00, '14', 'F', NULL, 'S', 'F', 2, 'NOVEMBRO / BANNER / BANNER FERNANDA / 48 ', 'FINALIZADO', 0, 0, NULL, 0, 'N'),
(278, 49, 2014, 131, 0, 0, 1, 1, 131.00, 0.00, 1, 3.00, '01 FAIXA 0,50 X 2,00 \r\n02 BANNER 1,00 X 1,70 \r\nSKY ', '2014-11-13', '2014-11-14', '0000-00-00', '2014-11-17 11:09:22', 131.00, '14', 'F', NULL, 'S', 'F', 2, 'NOVEMBRO / BANNER / BANNER ELETRONICA BAHIA / 49 ', 'FINALIZADO', 0, 0, NULL, 0, 'N'),
(279, 50, 2014, 132, 0, 0, 1, 5, 300.00, 0.00, 1, 0.00, 'Lava car\r\nlona de faixa com solda e ilhós(reforçar a solda)\r\n1 lona 4,10 x 0,90\r\n1 lona 4,30 x 0,90\r\n1 lona 4,60 x 0,60\r\n4 Banners 1,50 x 0,30', '2014-11-13', '2014-11-14', '0000-00-00', '2014-11-18 10:49:52', 330.00, '8', 'F', NULL, 'S', 'F', 2, 'novembro/Faixas/faixa Antonio 50', 'FINALIZADO', 0, 0, NULL, 0, 'N'),
(280, 51, 2014, 133, 0, 0, 1, 7, 1500.00, 0.00, 1, 0.00, 'ACM BRANCO FOSCO!\r\nFRENTE 6,24 X 1,50\r\nLADO 1,40 X 1,50\r\nCOLUNA 0,23+ 0,30 X 3,35\r\nCOLUNA 0,25 + 0,54 X 3,35\r\nLETRA CAIXA EM CHAPA GALVANIZADA', '2014-11-13', '2014-12-03', '0000-00-00', '2014-11-21 11:50:05', 5500.00, '8', 'M', NULL, 'S', 'N', 4, 'NOVEMBRO/ADS RECORTE/ ADS APOGEU 51', 'PRD/IMPRESSAO', 0, 0, NULL, 1, 'V'),
(281, 52, 2014, 134, 0, 0, 1, 1, 25.00, 0.00, 1, 0.00, 'IGREJA ', '2014-11-13', '2014-11-17', '0000-00-00', '2014-11-18 11:26:25', 25.00, '14', 'F', NULL, 'S', 'F', 2, 'NOVEMBRO / FAIXA / FAIXA DARLI / 52 ', 'FINALIZADO', 0, 0, NULL, 0, 'N'),
(282, 53, 2014, 125, 0, 0, 1, 0, 0.00, 0.00, 0, 0.00, '01- Toldo Cortina 2,52 x 1,40\r\n01- Toldo Cortina 2,57 x 1,40\r\n01- Toldo Cortina 2,87 x 1,40\r\n01- Toldo Cortina 3,10 x 1,40\r\n01- Toldo Cortina 3,10 x 1,40\r\n01- Toldo Cortina 3,12 x 1,40\r\nLONA DURASOL FT CINZA ', '2014-11-13', '2014-12-08', '0000-00-00', '2014-11-24 17:37:47', 1500.00, '14', 'M', NULL, 'S', 'N', 8, NULL, 'PRODUCAO', 0, 0, NULL, 2, 'N'),
(283, 54, 2014, 129, 0, 0, 1, 0, 0.00, 0.00, 0, 0.00, 'PAINEL EM VIDRO 8 MM COM 4 FURAÇ&#213;ES \r\nADESIVO IMPRESSO E RECORTE', '2014-11-13', '2014-12-05', '0000-00-00', '2014-11-17 09:12:22', 450.00, '14', 'M', NULL, 'S', 'N', 3, 'NOVEMBRO / ADESIVO / ADESIVO FERNANDA / 54', 'PRD/NOVO', 0, 0, NULL, 1, 'V'),
(284, 55, 2014, 94, 0, 0, 1, 0, 0.00, 0.00, 0, 0.00, '01 - TOLDO CORTINA  3,40 X3,00\r\n01 - TOLDO CORTINA 3,56 X 3,00\r\nBEGE FT ', '2014-11-13', '2014-11-29', '0000-00-00', '2014-11-24 17:33:16', 1800.00, '14', 'M', NULL, 'N', 'N', 2, NULL, 'AGENDAMENTO', 0, 0, NULL, 2, 'N'),
(285, 56, 2014, 90, 0, 0, 1, 7, 0.00, 0.00, 1, 0.00, 'KOMBI ', '2014-11-13', '2014-11-13', '0000-00-00', '2014-11-20 08:50:34', 0.01, '14', 'F', NULL, 'S', 'F', 2, 'CLIENTES / PREFEITURA DE JUNDIAI / NOVEMBRO 13 / PLOTAGEM KOMBI / 56', 'FINALIZADO', 0, 0, NULL, 0, 'N'),
(286, 57, 2014, 135, 0, 0, 1, 1, 68.00, 0.00, 1, 0.00, 'AULA DE T&#202;NIS ', '2014-11-13', '2014-11-17', '0000-00-00', '2014-11-18 08:24:44', 68.00, '14', 'F', NULL, 'S', 'F', 2, 'NOVEMBRO / FAIXA / FAIXA JULIO / 57', 'FINALIZADO', 0, 0, NULL, 0, 'N'),
(287, 58, 2014, 136, 0, 0, 1, 1, 80.00, 0.00, 1, 1.00, 'BAGAÇA', '2014-11-13', '2014-11-14', '0000-00-00', '2014-11-17 11:10:31', 80.00, '14', 'F', NULL, 'S', 'F', 2, 'NOVEMBRO/ FAIXA / FAIXA PIOLHO / 58', 'FINALIZADO', 0, 0, NULL, 0, 'N'),
(288, 59, 2014, 24, 0, 0, 1, 1, 80.00, 0.00, 1, 0.00, 'FROZEN - JA FOI FEITA ', '2014-11-13', '2014-11-13', '0000-00-00', '2014-11-17 11:09:55', 80.00, '14', 'F', NULL, 'S', 'F', 2, '', 'FINALIZADO', 0, 0, NULL, 0, 'N'),
(289, 60, 2014, 137, 0, 0, 1, 0, 0.00, 0.00, 0, 0.00, 'PARA HOJE ', '2014-11-14', '2014-11-14', '0000-00-00', '2014-11-25 12:05:34', 221.00, '14', 'M', NULL, 'S', 'N', 2, 'CLIENTES / MARCELO PONTE / NOVEMBRO 14 / 60 ', 'FINALIZADO', 0, 0, NULL, 0, 'N'),
(290, 61, 2014, 138, 0, 0, 1, 1, 160.00, 0.00, 1, 0.00, '1 AUMENTO DE TOLDO + 1 TROCA DE MOLA POR REDUTOR\r\n** JA FOI FEITA E ENTREGUE ** SÓ LIBERAR ', '2014-11-14', '2014-11-14', '0000-00-00', '2014-11-14 11:44:59', 160.00, '14', 'M', NULL, 'S', 'N', 8, NULL, 'PRODUCAO', 0, 0, NULL, 2, 'N'),
(291, 62, 2014, 139, 0, 0, 1, 4, 1060.00, 0.00, 1, 0.00, 'CORTINAS COM REDUTOR/ LONA SANSUY BEGE S 153\r\nO CLIENTE IRÁ RETIRAR E FAZER A INSTALAÇ&#195;O', '2014-11-14', '2014-11-25', '0000-00-00', '2014-11-17 09:55:44', 1060.00, '8', 'M', NULL, 'S', 'N', 8, NULL, 'PRODUCAO', 0, 0, NULL, 2, 'N'),
(292, 62, 2014, 140, 0, 0, 1, 4, 0.00, 0.00, 0, 0.00, 'SAL&#195;O DE BELEZA ', '2014-11-14', '2014-11-18', '0000-00-00', '2014-11-20 09:22:25', 100.00, '14', 'F', NULL, 'S', 'F', 2, 'NOVEMBRO / LONA / LONA PAULO SILVA / 62 ', 'FINALIZADO', 0, 0, NULL, 0, 'N'),
(293, 63, 2014, 91, 0, 0, 1, 0, 0.00, 0.00, 0, 0.00, 'PLACA EM PVC 3 MM DUPLA FACE COM DOBRA', '2014-11-14', '2014-11-14', '0000-00-00', '2014-11-17 08:07:05', 20.00, '14', 'M', NULL, 'S', 'N', 4, 'CLIENTES / PREFEITURA DE JUNDIAI / NOVEMBRO 14/ 63 ', 'IMPRESSAO', 0, 0, NULL, 0, 'N'),
(294, 64, 2014, 142, 0, 0, 1, 0, 0.00, 0.00, 0, 0.00, 'MANICURE \r\nPAGO ', '2014-11-14', '2014-11-17', '0000-00-00', '2014-11-18 09:35:54', 30.00, '14', 'M', NULL, 'S', 'N', 2, 'NOVEMBRO / BANNER / BANNER KLEITON / 64 ', 'FINALIZADO', 0, 0, NULL, 0, 'N'),
(295, 65, 2014, 141, 0, 0, 1, 4, 2620.00, 0.00, 1, 0.00, 'COBERTURA 5,50 X 5,00 LONA VERDE ALGA FT(MODELO FARMACIA)\r\nCORTINA LONA CRISTAL C/ VISOR GRANDE\r\nCOBERTURA 5,50 X 4,50 LONA BEGE FT(TÚNEL)\r\nCOBERTURAS COM PÉ DIREITO', '2014-11-14', '2014-12-10', '0000-00-00', '2014-11-17 09:55:33', 10000.00, '8', 'M', NULL, 'S', 'N', 8, NULL, 'PRODUCAO', 0, 0, NULL, 2, 'N'),
(296, 66, 2014, 143, 0, 0, 1, 0, 0.00, 0.00, 0, 0.00, 'EVENTO IGREJA CASAIS ', '2014-11-14', '2014-11-18', '0000-00-00', '2014-11-21 10:26:08', 34.00, '14', 'M', NULL, 'S', 'N', 2, 'NOVEMBRO/ FAIXA / FAIXA CIRINEIS / 66 ', 'FINALIZADO', 0, 0, NULL, 0, 'N'),
(297, 67, 2014, 144, 0, 0, 1, 1, 17.00, 0.00, 1, 0.00, 'AUTO ELÉTRICA  (BANNER COM ACABAMENTO DE FAIXA) ', '2014-11-14', '2014-11-18', '0000-00-00', '2014-11-20 17:11:42', 17.00, '14', 'F', NULL, 'S', 'F', 2, 'NOVEMBRO / FAIXA/ FAIXA RENATO ', 'FINALIZADO', 0, 0, NULL, 0, 'N'),
(298, 68, 2014, 144, 0, 0, 1, 0, 0.00, 0.00, 0, 0.00, 'AUTO ELÉTRICA ', '2014-11-14', '2014-11-18', '0000-00-00', '2014-11-21 17:33:08', 3.00, '14', 'M', NULL, 'N', 'N', 2, 'NOVEMBRO / ADESIVO / ADESIVO RENATO / 68', 'FINALIZADO', 0, 0, NULL, 0, 'N'),
(299, 69, 2014, 56, 0, 0, 1, 1, 70.00, 0.00, 1, 0.00, 'Material já foi entregue, apenas dar baixa!\r\n\r\nObrigada =)', '2014-11-14', '2014-11-14', '0000-00-00', '2014-11-14 16:20:18', 70.00, '8', 'M', NULL, 'N', 'N', 2, '', 'FINALIZADO', 0, 0, NULL, 0, 'N'),
(300, 70, 2014, 145, 0, 0, 1, 0, 0.00, 0.00, 0, 0.00, 'RECORTES NA LATERAL E PERFURADO NO VIDRO TRASEIRO- CONSTRUÇ&#195;O\r\nORDEM E SERVIÇO CANCELADAAAAAAAAAAAAA', '2014-11-14', '2014-11-18', '0000-00-00', '2014-11-17 14:58:56', 300.00, '8', 'M', NULL, 'N', 'N', 2, 'NOVEMBRO/RECORTES/RECORTE ALCIONO 70', 'FINALIZADO', 0, 0, NULL, 0, 'N'),
(301, 71, 2014, 146, 0, 0, 1, 0, 0.00, 0.00, 0, 0.00, 'TOLDO CORTINA - LONA DURASOL AZUL ', '2014-11-14', '2014-11-20', '0000-00-00', '2014-11-17 09:54:47', 1200.00, '14', 'M', NULL, 'S', 'N', 8, NULL, 'PRODUCAO', 0, 0, NULL, 2, 'N'),
(302, 72, 2014, 145, 0, 0, 1, 2, 225.00, 0.00, 1, 0.00, 'ADESIVO RECORTE PARA OS DOIS LADOS \r\nADESIVO PERFURADO VIDRO TRASEIRO \r\nMARCADO ADESIVAÇ&#195;O PARA TERÇA-FEIRA 18/11 AS 10:00 ', '2014-11-14', '2014-11-18', '0000-00-00', '2014-11-20 17:12:09', 225.00, '14', 'F', NULL, 'S', 'F', 2, 'NOVEMBRO / ADESIVO RECORTE/ ADS RECORTE ALCIONO / 72 ', 'FINALIZADO', 0, 0, NULL, 0, 'N'),
(303, 73, 2014, 147, 0, 0, 1, 1, 80.00, 0.00, 1, 0.00, 'ADESIVAÇ&#195;O JÁ FEITA \r\nFIBRA DE CARBONO ', '2014-11-14', '2014-11-14', '0000-00-00', '2014-11-17 11:09:35', 80.00, '14', 'F', NULL, 'S', 'F', 2, '', 'FINALIZADO', 0, 0, NULL, 0, 'N'),
(304, 74, 2014, 149, 0, 0, 1, 1, 34.00, 0.00, 1, 0.00, 'BAZAR DE ARTESANATO', '2014-11-14', '2014-11-17', '0000-00-00', '2014-11-18 14:26:42', 34.00, '14', 'F', NULL, 'S', 'F', 2, 'NOVEMBRO / FAIXA / FAIXA VERA / 74 ', 'FINALIZADO', 0, 0, NULL, 0, 'N'),
(305, 75, 2014, 148, 0, 0, 1, 0, 0.00, 0.00, 0, 0.00, 'DENTISTA ', '2014-11-14', '2014-11-17', '0000-00-00', '2014-11-14 16:34:48', 150.00, '14', 'M', NULL, 'N', 'N', 2, 'NOVEMBRO/ LONA / LONA SOL / 75 ', 'FINALIZADO', 0, 0, NULL, 0, 'N'),
(306, 76, 2014, 150, 0, 0, 1, 1, 80.00, 0.00, 1, 0.00, 'adesivo ja feito e colocado \r\nfalta só a faixa ', '2014-11-14', '2014-11-18', '0000-00-00', '2014-11-24 15:32:46', 80.00, '14', 'F', NULL, 'S', 'F', 2, 'novembro / faixa / faixa marcia / 76 ', 'FINALIZADO', 0, 0, NULL, 0, 'N'),
(307, 77, 2014, 151, 0, 0, 1, 1, 50.00, 0.00, 1, 0.00, 'ALTA RESOLUÇ&#195;O \r\nPARA HOJEEEEEE', '2014-11-14', '2014-11-14', '0000-00-00', '2014-11-14 16:23:22', 50.00, '14', 'M', NULL, 'N', 'N', 2, 'NOVEMBRO / BANNER /BANNER ELAINE / 77 ', 'FINALIZADO', 0, 0, NULL, 0, 'N'),
(308, 78, 2014, 24, 0, 0, 1, 0, 0.00, 0.00, 0, 0.00, 'VEM BUSCAR HOJE 12:00 ', '2014-11-17', '2014-11-17', '0000-00-00', '2014-11-18 11:26:38', 90.00, '14', 'M', NULL, 'S', 'N', 2, 'CLIENTES / RICK KELLY / NOVEMBRO 17 / FAIXA 78 ', 'FINALIZADO', 0, 0, NULL, 0, 'N'),
(309, 79, 2014, 153, 0, 0, 1, 1, 17.00, 0.00, 1, 0.00, 'VEM BUSCAR HOJE As 17:00 ', '2014-11-17', '2014-11-17', '0000-00-00', '2014-11-18 08:24:06', 17.00, '14', 'F', NULL, 'S', 'F', 2, 'NOVEMBRO/ FAIXA / FAIXA DALILA 79', 'FINALIZADO', 0, 0, NULL, 0, 'N'),
(310, 80, 2014, 154, 0, 0, 1, 7, 50.00, 0.00, 1, 0.00, 'FUNILARIA E PINTURA \r\nPARA TERÇA-FEIRA \r\n\r\nMEDIDAS 5,00 X 0,70 \r\n', '2014-11-17', '2014-11-18', '0000-00-00', '2014-11-19 14:26:27', 170.00, '14', 'F', NULL, 'S', 'F', 2, 'NOVEMBRO / LONA / LONA ROGERIO / 80 ', 'FINALIZADO', 0, 0, NULL, 0, 'N'),
(311, 81, 2014, 155, 0, 0, 1, 7, 20.00, 0.00, 1, 0.00, 'PROMOÇ&#195;O SAL&#195;O ', '2014-11-17', '2014-11-19', '0000-00-00', '2014-11-19 14:07:09', 30.00, '14', 'F', NULL, 'S', 'F', 2, 'NOVEMBRO / BANNER / BANNER EDER / 81 ', 'FINALIZADO', 0, 0, NULL, 0, 'N'),
(312, 82, 2014, 63, 0, 0, 1, 1, 70.00, 0.00, 1, 5.00, 'loja Seven \r\n\r\npara terça - feira cedo \r\n\r\ncolocar os adesivos em placas de PVC 2 MM ', '2014-11-17', '2014-11-18', '0000-00-00', '2014-11-19 14:25:55', 70.00, '14', 'F', NULL, 'S', 'F', 2, 'clientes / gilmario / novembro 17 / 82 ', 'FINALIZADO', 0, 0, NULL, 0, 'N'),
(313, 83, 2014, 156, 0, 0, 1, 7, 0.00, 0.00, 1, 51.00, 'ALUGA-SE APARTAMENTOS \r\nS&#195;O 2 FAIXAS ', '2014-11-17', '2014-11-19', '0000-00-00', '2014-11-20 16:19:01', 102.00, '14', 'F', NULL, 'S', 'F', 2, 'NOVEMBRO / FAIXA / FAIXA L&T / 83 ', 'FINALIZADO', 0, 0, NULL, 0, 'N'),
(314, 84, 2014, 160, 0, 0, 1, 3, 120.00, 0.00, 1, 0.00, 'ADESIVO PERFURADO - MEU MALVADO FAVORITO \r\nVEM ADESIVAR AMANHA AS 15:30 ', '2014-11-17', '2014-11-18', '0000-00-00', '2014-11-21 17:33:11', 120.00, '14', 'M', NULL, 'N', 'N', 2, 'CLIENTES / ADESIVO  /  ADESIVO VANDERLEI / 84 ', 'FINALIZADO', 0, 0, NULL, 0, 'N'),
(315, 85, 2014, 161, 0, 0, 1, 7, 50.00, 0.00, 1, 0.00, 'ELÉTRICA E HIDRÁULICA ', '2014-11-17', '2014-11-19', '0000-00-00', '2014-11-19 10:48:24', 93.00, '14', 'F', NULL, 'S', 'F', 2, 'NOVEMBRO / LONA / LONA JAIR / 85 ', 'FINALIZADO', 0, 0, NULL, 0, 'N'),
(316, 86, 2014, 159, 0, 0, 1, 1, 140.00, 0.00, 1, 0.00, 'BLACK FRIDAY ', '2014-11-17', '2014-11-18', '0000-00-00', '2014-11-19 10:08:29', 140.00, '14', 'F', NULL, 'S', 'F', 2, 'NOVEMBRO / BANNER / BANNER INIMA / 86 ', 'FINALIZADO', 0, 0, NULL, 0, 'N'),
(317, 87, 2014, 163, 0, 0, 1, 1, 30.00, 0.00, 1, 0.00, 'proibido som automotivo pvc 3mm\r\nretira dia 18 de novembro', '2014-11-17', '2014-11-18', '0000-00-00', '2014-11-21 15:12:47', 30.00, '8', 'M', NULL, 'N', 'N', 2, 'novembro/adesivos/ads wanessa 87', 'FINALIZADO', 0, 0, NULL, 0, 'N'),
(318, 88, 2014, 165, 0, 0, 1, 5, 150.00, 0.00, 1, 0.00, 'ESTRUTURA EM METALON PARA QUARTA-FEIRA \r\n\r\n1 LONA DE PAINEL COM SOLDA E ILHÓS 1,50 X 0,60 (ESTRUTURA METALON) \r\n1 BANNER 1,00 X 0,60 \r\n\r\n', '2014-11-17', '2014-11-18', '0000-00-00', '2014-11-20 11:41:15', 150.00, '14', 'M', NULL, 'N', 'N', 2, 'NOVEMBRO / LONA / LONA PAULO NIC / 88 ', 'FINALIZADO', 0, 0, NULL, 0, 'N'),
(319, 89, 2014, 166, 0, 0, 1, 1, 25.00, 0.00, 1, 0.00, 'VENDE-SE ', '2014-11-17', '2014-11-19', '0000-00-00', '2014-11-24 15:22:49', 25.00, '14', 'M', NULL, 'N', 'N', 2, 'NOVEMBRO / ADESIVO / ADESIVO NEUZA / 89 ', 'FINALIZADO', 0, 0, NULL, 0, 'N'),
(320, 90, 2014, 87, 0, 0, 1, 0, 0.00, 0.00, 0, 0.00, 'ROMANATTO ', '2014-11-17', '2014-11-19', '0000-00-00', '2014-11-25 16:59:38', 50.00, '14', 'M', NULL, 'N', 'N', 2, 'NOVEMBRO / ADESIVO / ADESIVO GABRIELA / 90 ', 'FINALIZADO', 0, 0, NULL, 0, 'N'),
(321, 91, 2014, 167, 0, 0, 1, 1, 45.00, 0.00, 1, 0.00, 'EVENTO IGREJA ', '2014-11-17', '2014-11-19', '0000-00-00', '2014-11-19 14:06:15', 45.00, '14', 'F', NULL, 'S', 'F', 2, 'NOVEMBRO / BANNER / BANNER MARIA MARTA / 91 ', 'FINALIZADO', 0, 0, NULL, 0, 'N'),
(322, 92, 2014, 168, 0, 0, 1, 0, 0.00, 0.00, 0, 0.00, 'MURAL DO SGQ \r\nPVC DE 3 MM ', '2014-11-17', '2014-11-19', '0000-00-00', '2014-11-21 15:12:18', 45.00, '14', 'M', NULL, 'N', 'N', 2, 'NOVEMBRO / ADESIVO / ADESIVO FEMES / 92 ', 'FINALIZADO', 0, 0, NULL, 0, 'N'),
(323, 93, 2014, 91, 0, 0, 1, 7, 0.00, 0.00, 1, 0.00, 'EXPO -FEIRA \r\n05 FAIXAS', '2014-11-17', '2014-11-18', '0000-00-00', '2014-11-19 14:21:01', 199.00, '14', 'F', NULL, 'S', 'F', 2, 'CLIENTES / PREFEITURA DE ITUPEVA / NOVEMBRO 17 / FAIXAS 93', 'FINALIZADO', 0, 0, NULL, 0, 'N'),
(324, 94, 2014, 90, 0, 0, 1, 0, 0.00, 0.00, 0, 0.00, 'PLOTAGEM KOMBI ', '2014-11-17', '2014-11-18', '0000-00-00', '2014-11-19 12:02:10', 0.01, '14', 'M', NULL, 'N', 'N', 2, 'CLIENTES / PREFEITURA DE JUNDIAI / NOVEMBRO 17 / 94 ', 'FINALIZADO', 0, 0, NULL, 0, 'N'),
(325, 95, 2014, 169, 0, 0, 1, 7, 0.00, 0.00, 1, 0.00, 'FAMILIA FRANÇA ', '2014-11-17', '2014-11-18', '0000-00-00', '2014-11-25 10:51:19', 45.00, '14', 'M', NULL, 'N', 'N', 2, 'NOVEMBRO /BANNER / BANNER GRAFICA JEDATA / 95 ', 'FINALIZADO', 0, 0, NULL, 0, 'N'),
(326, 96, 2014, 170, 0, 0, 1, 7, 90.00, 0.00, 1, 0.00, 'TRABALHO ESCOLAR ', '2014-11-17', '2014-11-19', '0000-00-00', '2014-11-25 16:50:06', 180.00, '14', 'M', NULL, 'N', 'N', 2, 'NOVEMBRO / BANNER /BANNER ERIVANIA / 96 ', 'FINALIZADO', 0, 0, NULL, 0, 'N'),
(327, 97, 2014, 171, 0, 0, 1, 1, 30.00, 0.00, 1, 0.00, 'BANNER JA FOI FEITO E JA FOI ENTREGUE ...SÓ LIBERAR NO SISTEMA ', '2014-11-17', '2014-11-17', '0000-00-00', '2014-11-17 17:00:20', 30.00, '14', 'F', NULL, 'S', 'F', 2, '', 'FINALIZADO', 0, 0, NULL, 0, 'N'),
(328, 98, 2014, 172, 0, 0, 1, 7, 300.00, 0.00, 1, 0.00, 'PAINEL ACM BRANCO ', '2014-11-17', '2015-01-05', '0000-00-00', '2014-11-24 08:36:15', 1680.00, '14', 'M', NULL, 'S', 'N', 3, 'NOVEMBRO / ADESIVO / ADESIVO GRAZIELE / 98 ', 'ARTE FINALISTA', 0, 0, NULL, 1, 'V'),
(329, 99, 2014, 173, 0, 0, 1, 3, 25.00, 0.00, 1, 0.00, 'BANNER FOTO NOIVADO \r\n\r\nvem buscar na quinta - de tarde', '2014-11-17', '2014-11-19', '0000-00-00', '2014-11-21 17:32:44', 45.00, '14', 'M', NULL, 'N', 'N', 2, 'NOVEMBRO /BANNER / BANNER EVERTON 99 ', 'FINALIZADO', 0, 0, NULL, 0, 'N'),
(330, 100, 2014, 174, 0, 0, 1, 5, 530.00, 0.00, 1, 0.00, 'SERVIÇO JA REALIZADO - SÓ LIBERAR A ORDEM', '2014-11-17', '2014-11-17', '0000-00-00', '2014-11-20 08:49:30', 530.00, '14', 'F', NULL, 'S', 'F', 2, '', 'FINALIZADO', 0, 0, NULL, 0, 'N'),
(331, 101, 2014, 64, 0, 0, 1, 0, 0.00, 0.00, 0, 0.00, 'FREEZER JA ADESIVADO - SÓ LIBERAR A ORDEM ', '2014-11-18', '2014-11-18', '0000-00-00', '2014-11-18 12:23:11', 95.00, '14', 'M', NULL, 'N', 'N', 5, '', 'ACABAMENTO', 0, 0, NULL, 0, 'N'),
(332, 102, 2014, 157, 0, 0, 1, 7, 1000.00, 0.00, 1, 0.00, '01 TOLDO CORTINA 2,68 X 2,65 + 01 TOLDO CORTINA 2,3 X 2,65 + 01 TOLDO CORTINA 2,68 X 2,65 + 01 TOLDO CORTINA 5,43 X 2,60 + 01 TOLDO CORTINA 3,43 X 2,60 + 01 TOLDO POLICARBONATO COMPACTO 3,50 X 1,40 ', '2014-11-18', '2014-12-12', '0000-00-00', '2014-11-20 17:13:43', 7990.00, '14', 'M', NULL, 'S', 'N', 8, NULL, 'PRODUCAO', 0, 0, NULL, 2, 'N'),
(333, 103, 2014, 175, 0, 0, 1, 1, 40.00, 0.00, 1, 0.00, 'FOTO BEBE ', '2014-11-18', '2014-11-20', '0000-00-00', '2014-11-22 12:59:36', 40.00, '14', 'F', NULL, 'S', 'F', 1, 'NOVEMBRO / BANNER / BANNER RODOLFO / 103 ', 'FINALIZADO', 0, 0, NULL, 0, 'N'),
(334, 104, 2014, 176, 0, 0, 1, 1, 17.00, 0.00, 1, 0.00, 'CACHORRO \r\n\r\nTENTAR FAZER PARA HOJE , E ME AVISAR A HORA QUE ESTIVER PRONTA', '2014-11-18', '2014-11-20', '0000-00-00', '2014-11-18 18:07:26', 17.00, '14', 'F', NULL, 'S', 'F', 2, 'NOVEMBRO/ BANNER / BANNER AISLAN / 104 ', 'FINALIZADO', 0, 0, NULL, 0, 'N'),
(335, 105, 2014, 177, 0, 0, 1, 1, 45.00, 0.00, 1, 0.00, 'TRABALHO ESCOLAR - PARA HOJE ', '2014-11-18', '2014-11-18', '0000-00-00', '2014-11-19 14:24:54', 45.00, '14', 'F', NULL, 'S', 'F', 2, 'NOVEMBRO / BANNER / BANNER ANGELICA / 105', 'FINALIZADO', 0, 0, NULL, 0, 'N'),
(336, 106, 2014, 91, 0, 0, 1, 0, 0.00, 0.00, 0, 0.00, 'PAINEL METALON DUPLA FACE  ', '2014-11-18', '2014-11-18', '0000-00-00', '2014-11-24 08:24:23', 2000.00, '14', 'M', NULL, 'S', 'N', 5, 'CLIENTES / PREFEITURA ITUPEVA / NOVEMBRO 18/ LONA 106 ', 'ACABAMENTO', 0, 0, NULL, 1, 'V'),
(337, 107, 2014, 91, 0, 0, 1, 0, 0.00, 0.00, 0, 0.00, 'SEC. DA SAÚDE ', '2014-11-18', '2014-11-18', '0000-00-00', '2014-11-24 10:05:05', 41.90, '14', 'M', NULL, 'S', 'N', 2, 'CLIENTES / PREFEITURA DE ITUPEVA / NOVEMBRO 18 / 107 ', 'FINALIZADO', 0, 0, NULL, 0, 'N'),
(338, 108, 2014, 178, 0, 0, 1, 1, 70.00, 0.00, 1, 0.00, 'ADESIVO JA COLOCADO - SÓ LIBERAR A ORDEM ', '2014-11-18', '2014-11-18', '0000-00-00', '2014-11-19 12:00:34', 70.00, '14', 'M', NULL, 'N', 'N', 2, '', 'FINALIZADO', 0, 0, NULL, 0, 'N'),
(339, 109, 2014, 179, 0, 0, 1, 1, 20.00, 0.00, 1, 0.00, 'ANIVERSÁRIO ', '2014-11-18', '2014-11-21', '0000-00-00', '2014-11-24 13:59:34', 20.00, '8', 'F', NULL, 'S', 'F', 2, 'NOVEMBRO/BANNERS/BANNER JAIR 109', 'FINALIZADO', 0, 0, NULL, 0, 'N'),
(340, 110, 2014, 180, 0, 0, 1, 7, 10.00, 0.00, 1, 0.00, '3&#186; ANIVERSÁRIO CIRCULO DE ORAÇ&#195;O', '2014-11-18', '2014-11-21', '0000-00-00', '2014-11-19 12:00:48', 30.00, '8', 'M', NULL, 'N', 'N', 2, 'NOVEMBRO/BANNERS/BANNER DALVA 110', 'FINALIZADO', 0, 0, NULL, 0, 'N'),
(341, 111, 2014, 38, 0, 0, 1, 1, 200.00, 0.00, 1, 0.00, 'TOLDO JÁ ENTREGUE - SÓ LIBERAR A ORDEM ', '2014-11-18', '2014-11-18', '0000-00-00', '2014-11-18 14:09:58', 200.00, '14', 'M', NULL, 'N', 'N', 8, NULL, 'PRODUCAO', 0, 0, NULL, 2, 'N'),
(342, 112, 2014, 182, 0, 0, 1, 0, 0.00, 0.00, 0, 0.00, 'TOLDO JA FEITO E JA ENTREGUE - SÓ LIBERAR A ORDEM ', '2014-11-18', '2014-11-18', '0000-00-00', '2014-11-18 14:11:38', 800.00, '14', 'M', NULL, 'N', 'N', 8, NULL, 'PRODUCAO', 0, 0, NULL, 2, 'N'),
(343, 113, 2014, 183, 0, 0, 1, 0, 0.00, 0.00, 0, 0.00, 'TIO ADENILSON / E TIA FABI ', '2014-11-18', '2014-11-20', '0000-00-00', '2014-11-25 11:42:02', 50.00, '14', 'M', NULL, 'N', 'N', 5, 'NOVEMBRO / ADESIVO RECORTE / ADS RECORTE / 113', 'ACABAMENTO', 0, 0, NULL, 0, 'N'),
(344, 114, 2014, 91, 0, 0, 1, 0, 0.00, 0.00, 0, 0.00, 'expo uva ', '2014-11-18', '2014-11-19', '0000-00-00', '2014-11-25 11:42:09', 398.00, '14', 'M', NULL, 'S', 'N', 4, 'CLIENTES / PREFEITURA DE ITUPEVA / NOVEMBRO 18 / 114 ', 'IMPRESSAO', 0, 0, NULL, 0, 'N'),
(345, 115, 2014, 156, 0, 0, 1, 7, 0.00, 0.00, 1, 0.00, 'PROG E VIDA ', '2014-11-18', '2014-11-19', '0000-00-00', '2014-11-24 14:11:10', 4.00, '14', 'M', NULL, 'S', 'N', 2, 'NOVEMBRO / ADESIVO RECORTE / ADESICO RECORTE L&T / 115 ', 'FINALIZADO', 0, 0, NULL, 0, 'N'),
(346, 116, 2014, 184, 0, 0, 1, 7, 150.00, 0.00, 1, 0.00, 'FAIXA E LONA JA FEITO - SÓ LIBERAR A ORDEM ', '2014-11-18', '2014-11-18', '0000-00-00', '2014-11-20 08:49:11', 284.00, '14', 'F', NULL, 'S', 'F', 2, '', 'FINALIZADO', 0, 0, NULL, 0, 'N'),
(347, 117, 2014, 130, 0, 0, 1, 7, 0.00, 0.00, 1, 0.00, 'FRASES EM INGL&#202;S ', '2014-11-18', '2014-11-20', '0000-00-00', '2014-11-21 16:24:04', 40.00, '14', 'M', NULL, 'S', 'N', 2, 'CLIENTES / ADS RECORTE / ADS RECORTE EDIVALDO / 117 ', 'FINALIZADO', 0, 0, NULL, 0, 'N'),
(348, 118, 2014, 186, 0, 0, 1, 0, 0.00, 0.00, 0, 0.00, 'SAL&#195;O DE CABELEIREIRA ', '2014-11-18', '2014-11-20', '0000-00-00', '2014-11-25 10:43:25', 17.00, '14', 'M', NULL, 'S', 'N', 2, 'CLIENTES / FAIXA / FAIXA CLEONICE / 118 ', 'FINALIZADO', 0, 0, NULL, 0, 'N'),
(349, 119, 2014, 185, 0, 0, 1, 0, 0.00, 0.00, 0, 0.00, 'TOLDO LONA GLASSLINE FUME COM 2 PÉ DIREITO\r\nO CLIENTE IRÁ TRAZER A CHAPA DE ACM , COBRADO M&#195;O DE OBRA E LETRAS CAIXA.', '2014-11-18', '2014-12-08', '0000-00-00', '2014-11-24 17:39:16', 8040.00, '14', 'M', NULL, 'S', 'N', 8, NULL, 'PRODUCAO', 0, 0, NULL, 2, 'N'),
(350, 120, 2014, 187, 0, 0, 1, 7, 150.00, 0.00, 1, 0.00, 'IGREJA \r\n', '2014-11-18', '2014-11-20', '0000-00-00', '2014-11-25 16:59:29', 250.00, '14', 'M', NULL, 'N', 'N', 2, 'NOVEMBRO / LONA /LONA SEBASTI&#195;O / 120 ', 'FINALIZADO', 0, 0, NULL, 0, 'N'),
(351, 121, 2014, 188, 0, 0, 1, 7, 0.00, 0.00, 1, 0.00, '3 FAIXAS 4,50 X 1,00 + 19 BANNER 1,00 X 0,70 ', '2014-11-18', '2014-11-20', '0000-00-00', '2014-11-25 15:23:41', 460.00, '14', 'M', NULL, 'S', 'N', 2, 'CLIENTES / DIVINO / NOVEMBRO 18/ 121 ', 'FINALIZADO', 0, 0, NULL, 0, 'N'),
(352, 122, 2014, 189, 0, 0, 1, 7, 0.00, 0.00, 1, 0.00, 'GELADINHO\r\nPARA QUINTA-FEIRA ', '2014-11-19', '2014-11-20', '0000-00-00', '2014-11-21 12:19:27', 20.00, '14', 'M', NULL, 'N', 'N', 2, 'CLIENTES / BANNER / BANNER DJALMA /122 ', 'FINALIZADO', 0, 0, NULL, 0, 'N'),
(353, 123, 2014, 5, 0, 0, 1, 7, 100.00, 0.00, 1, 0.00, '*** LONA DE PAINEL SEM ACABAMENTO ***\r\nGARAGEM INFORMATICA ', '2014-11-19', '2014-11-21', '0000-00-00', '2014-11-21 17:31:55', 157.00, '14', 'M', NULL, 'N', 'N', 2, 'CLIENTES / RAFAEL REVENDA / NOVEMBRO 19 / 123 ', 'FINALIZADO', 0, 0, NULL, 0, 'N'),
(354, 124, 2014, 190, 0, 0, 1, 5, 160.00, 0.00, 1, 0.00, 'ADESIVO REFLETIVO BRANCO **MARCADO ADESIVAÇ&#195;O PARA 25/11 AS 8:00 HRS ', '2014-11-19', '2014-11-21', '0000-00-00', '2014-11-25 16:21:06', 310.00, '14', 'M', NULL, 'N', 'N', 2, 'NOVEMBRO / ADS RECORTE / ADS RECORTE MARCELO / 124', 'FINALIZADO', 0, 0, NULL, 0, 'N'),
(355, 125, 2014, 192, 0, 0, 1, 7, 20.00, 0.00, 1, 0.00, 'POLIMENTO DE FARÓIS ', '2014-11-19', '2014-11-21', '0000-00-00', '2014-11-24 15:40:54', 25.00, '14', 'F', NULL, 'S', 'F', 2, 'NOVEMBRO / BANNER /BANNER ISAIAS / 125 ', 'FINALIZADO', 0, 0, NULL, 0, 'N'),
(356, 126, 2014, 91, 0, 0, 1, 0, 0.00, 0.00, 0, 0.00, '30 LONAS COM REBITE , POIS OS PAINÉIS SER&#195;O DUPLA FACE ', '2014-11-19', '2014-11-24', '0000-00-00', '2014-11-25 15:49:19', 3000.00, '14', 'M', NULL, 'S', 'N', 5, 'CLIENTES/ PREFEITURA DE ITUPEVA / NOVEMBRO 19 / 126  ', 'ACABAMENTO', 0, 0, NULL, 1, 'V'),
(357, 127, 2014, 91, 0, 0, 1, 0, 0.00, 0.00, 0, 0.00, '02 - FAIXA NATAL DO PARQUE \r\n05 - FAIXAS TRENZINHO ', '2014-11-19', '2014-11-20', '0000-00-00', '2014-11-21 17:31:48', 278.60, '14', 'M', NULL, 'N', 'N', 2, 'CLIENTES / PREFEITURA ITUPEVA / 127 ', 'FINALIZADO', 0, 0, NULL, 0, 'N'),
(358, 128, 2014, 91, 0, 0, 1, 0, 0.00, 0.00, 0, 0.00, 'VEICULO ABANDONADO ', '2014-11-19', '2014-11-20', '0000-00-00', '2014-11-25 17:00:03', 1500.00, '14', 'M', NULL, 'N', 'N', 2, 'CLIENTES / PREFEITURA DE ITUPEVA / NOVEMBRO 19 / 128 ', 'FINALIZADO', 0, 0, NULL, 0, 'N'),
(359, 129, 2014, 193, 0, 0, 1, 1, 40.00, 0.00, 1, 0.00, 'TAPIOCA, VEM COLAR SEXTA AS 08:00', '2014-11-19', '2014-11-21', '0000-00-00', '2014-11-21 14:06:44', 40.00, '8', 'M', NULL, 'N', 'N', 2, 'NOVEMBRO/ADESIVOS/ADS REINALDO 129', 'FINALIZADO', 0, 0, NULL, 0, 'N'),
(360, 130, 2014, 194, 0, 0, 1, 1, 240.00, 0.00, 1, 0.00, 'TOLDO JA ENTREGUE - SÓ LIBERAR A ORDEM ', '2014-11-19', '2014-11-19', '0000-00-00', '2014-11-19 13:55:16', 240.00, '14', 'M', NULL, 'N', 'N', 8, NULL, 'PRODUCAO', 0, 0, NULL, 2, 'N'),
(361, 131, 2014, 195, 0, 0, 1, 1, 30.00, 0.00, 1, 0.00, 'aniversario de casamento \r\nWillian tentar fazer para hoje. Obrigada.', '2014-11-19', '2014-11-19', '0000-00-00', '2014-11-20 17:10:44', 30.00, '14', 'F', NULL, 'S', 'F', 2, 'novembro / banner / banner anderson / 131 ', 'FINALIZADO', 0, 0, NULL, 0, 'N'),
(362, 132, 2014, 137, 0, 0, 1, 7, 0.00, 0.00, 1, 0.00, 'cliente trouxe o PVC esta na bancada. \r\nobs: As placas est&#227;o adesivadas será preciso limpá-las.\r\nObrigada :)', '2014-11-19', '2014-11-20', '0000-00-00', '2014-11-21 17:31:41', 360.00, '14', 'M', NULL, 'N', 'N', 2, 'clientes / marcelo ponte eventos / novembro 19 / 132 ', 'FINALIZADO', 0, 0, NULL, 0, 'N'),
(363, 133, 2014, 191, 0, 0, 1, 7, 0.00, 0.00, 1, 0.00, 'PLOTAGEM DO CARRINHO DE M&#195;O ', '2014-11-20', '2014-11-21', '0000-00-00', '2014-11-20 18:02:57', 95.00, '14', 'M', NULL, 'N', 'N', 4, 'CLIENTES / LEONEL MIX CREAM / NOVEMBRO 20 / 133 ', 'IMPRESSAO', 0, 0, NULL, 0, 'N'),
(364, 133, 2014, 196, 0, 0, 1, 7, 0.00, 0.00, 0, 0.00, 'TOLDO JA FEITO E JA ENTREGUE - SÓ LIBERAR A ORDEM DE SERVIÇO ', '2014-11-20', '2014-11-20', '0000-00-00', '2014-11-20 18:02:57', 400.00, '14', 'M', NULL, 'N', 'N', 8, NULL, 'PRODUCAO', 0, 0, NULL, 2, 'N'),
(365, 134, 2014, 197, 0, 0, 1, 7, 0.00, 0.00, 1, 0.00, 'BAILE DO HAWAII ', '2014-11-20', '2014-11-21', '0000-00-00', '2014-11-21 17:31:39', 324.00, '14', 'M', NULL, 'N', 'N', 2, 'CLIENTES / EMERSON CEGOBIA / NOVEMBRO 20 / 134 ', 'FINALIZADO', 0, 0, NULL, 0, 'N'),
(366, 135, 2014, 198, 0, 0, 1, 2, 200.00, 0.00, 1, 0.00, 'LONA FUME SANSUY\r\nC/ BABINELA E ESTRUTURA PRATA \r\n**PAGO **', '2014-11-20', '2015-01-05', '0000-00-00', '2014-11-21 12:39:02', 200.00, '14', 'M', NULL, 'S', 'N', 8, NULL, 'PRODUCAO', 0, 0, NULL, 2, 'N'),
(367, 136, 2014, 199, 0, 0, 1, 1, 180.00, 0.00, 1, 0.00, 'PLOTAGEM DE VAN ESCOLAR \r\nPREFIXO DA VAN 141 \r\nPARA HOJE , A VAN JÁ ESTA LA EM BAIXO ', '2014-11-20', '2014-11-20', '0000-00-00', '2014-11-24 14:26:59', 180.00, '14', 'F', NULL, 'S', 'F', 2, 'NOVEMBRO / ADS RECORTE / ADS RECORTE CARLOS DONIZETTI / 136 ', 'FINALIZADO', 0, 0, NULL, 0, 'N'),
(368, 137, 2014, 132, 0, 0, 1, 0, 0.00, 0.00, 0, 0.00, 'PLACAS FEITAS E JA ENTREGUES, SÓ LIBERAR A ORDEM ', '2014-11-20', '2014-11-20', '0000-00-00', '2014-11-21 17:31:27', 100.00, '14', 'M', NULL, 'N', 'N', 2, '', 'FINALIZADO', 0, 0, NULL, 0, 'N'),
(369, 138, 2014, 201, 0, 0, 1, 1, 60.00, 0.00, 1, 0.00, 'IGREJA ', '2014-11-20', '2014-11-24', '0000-00-00', '2014-11-24 13:47:16', 60.00, '14', 'F', NULL, 'S', 'F', 2, 'NOVEMBRO / ADESIVO / ADESIVO FABIOLA /138 ', 'FINALIZADO', 0, 0, NULL, 0, 'N'),
(370, 139, 2014, 202, 0, 0, 1, 7, 0.00, 0.00, 1, 0.00, 'PAINEL 3 PARTES ADESIVO EM RECORTES BRANCO E DOURADO GOLD MAX', '2014-11-20', '2014-11-24', '0000-00-00', '2014-11-25 16:59:16', 2900.00, '8', 'M', NULL, 'N', 'N', 8, 'NOVEMBRO/RECORTES/RECORTE POR DO SOL', 'PRODUCAO', 0, 0, NULL, 1, 'V'),
(371, 140, 2014, 203, 0, 0, 1, 1, 15.00, 0.00, 1, 0.00, 'NUMERO DE TELEFONE + VIVO\r\nWILHIAN, POR FAVOR FAVOR AGORA POIS CLIENTE ESTA NO AGUARDO.\r\noBRIGADA', '2014-11-20', '2014-11-20', '0000-00-00', '2014-11-21 17:31:12', 15.00, '14', 'M', NULL, 'N', 'N', 2, 'NOVEMBRO / ADS RECORTE / ADS RECORTE ENEIAS / 140 ', 'FINALIZADO', 0, 0, NULL, 0, 'N'),
(372, 141, 2014, 137, 0, 0, 1, 3, 576.00, 0.00, 1, 168.00, 'FEIR&#195;O ', '2014-11-20', '2014-11-20', '0000-00-00', '2014-11-25 12:07:23', 576.00, '14', 'M', NULL, 'N', 'N', 2, 'CLIENTES / MARCELO PONTE / NOVEMBRO 20 / 141 ', 'FINALIZADO', 0, 0, NULL, 0, 'N'),
(373, 142, 2014, 204, 0, 0, 1, 1, 15.00, 0.00, 1, 0.00, 'PLACA DE CAMINH&#195;O ', '2014-11-20', '2014-11-21', '0000-00-00', '2014-11-24 14:21:43', 15.00, '14', 'F', NULL, 'S', 'F', 2, 'NOVEMBRO / ADESIVO / ADESIVO ROGERIO / 142 ', 'FINALIZADO', 0, 0, NULL, 0, 'N'),
(374, 143, 2014, 205, 0, 0, 1, 1, 30.00, 0.00, 1, 0.00, 'ANIVERSARIO \r\nVAI MANDAR A FOTO POR E-MAIL ', '2014-11-20', '2014-11-24', '0000-00-00', '2014-11-21 17:30:55', 30.00, '14', 'M', NULL, 'N', 'N', 2, 'NOVEMBRO / BANNER / BANNER JONAS/ 143 ', 'FINALIZADO', 0, 0, NULL, 0, 'N'),
(375, 144, 2014, 206, 0, 0, 1, 7, 0.00, 0.00, 1, 0.00, 'PADOK ', '2014-11-20', '2014-11-21', '0000-00-00', '2014-11-21 17:30:52', 243.00, '14', 'M', NULL, 'N', 'N', 2, 'NOVEMBRO / FAIXA/ FAIXA ADV PADOK / 144 ', 'FINALIZADO', 0, 0, NULL, 0, 'N'),
(376, 145, 2014, 207, 0, 0, 1, 1, 560.00, 0.00, 1, 0.00, 'REFORMA DE TOLDO JA FEITA E JA ENTREGUE - SÓ LIBERAR A ORDEM ', '2014-11-20', '2014-11-20', '0000-00-00', '2014-11-20 16:50:49', 560.00, '14', 'M', NULL, 'N', 'N', 8, NULL, 'PRODUCAO', 0, 0, NULL, 2, 'N'),
(377, 146, 2014, 208, 0, 0, 1, 7, 0.00, 0.00, 1, 0.00, '**CONFIRMAR O QUE JÁ FOI FEITO **\r\n03 - PAINEL 2,50 X 2,00 C/ CHAPA GALVANIZADA * + 01 PAINEL METALON 1,00 X 2,00 + 01 PAINEL METALON C/4 PLACAS DE PVC * + REFORMA PAINEL 6,20 X 1,30 + 1 TOTEN DE TUBO 2 1/2 COM CHAPA GALVANIZADA ', '2014-11-20', '2014-11-24', '0000-00-00', '2014-11-21 12:38:34', 4893.34, '14', 'M', NULL, 'S', 'N', 4, '', 'PRD/IMPRESSAO', 0, 0, NULL, 1, 'V'),
(378, 147, 2014, 209, 0, 0, 1, 7, 0.00, 0.00, 1, 0.00, 'FELIZ NATAL \r\n\r\n** caminho correto: novembro/faixa / faixa de vellis / 147', '2014-11-21', '2014-11-24', '0000-00-00', '2014-11-25 16:59:07', 68.00, '14', 'M', NULL, 'N', 'N', 2, 'NOVEMBRO / BANNER / BANNER DEVELLIS / 147 ', 'FINALIZADO', 0, 0, NULL, 0, 'N'),
(379, 148, 2014, 210, 0, 0, 1, 7, 0.00, 0.00, 1, 0.00, 'GATHA \r\n\r\nWILHIAN POR FAVOR FAZER A FAIXA HOJE PARA RETIRADA AMANHA. ', '2014-11-21', '2014-11-22', '0000-00-00', '2014-11-21 17:30:49', 51.00, '14', 'M', NULL, 'N', 'N', 2, 'NOVEMBRO / FAIXA / FAIXA BRUNO / 148 ', 'FINALIZADO', 0, 0, NULL, 0, 'N'),
(380, 149, 2014, 211, 0, 0, 1, 1, 60.00, 0.00, 1, 0.00, 'ADESIVO RECORTE DE VENDE-SE \r\n1 BANNER 1,20 X 0,80 - TRABALHO ESCOLAR \r\nWILHIAN É PRA HOJEEEEE  NO FINAL DA TARDE ', '2014-11-21', '2014-11-22', '0000-00-00', '2014-11-24 13:58:18', 60.00, '14', 'F', NULL, 'S', 'F', 2, 'NOVEMBRO / BANNER / BANNER CRISTIANO / 149 ', 'FINALIZADO', 0, 0, NULL, 0, 'N'),
(381, 150, 2014, 91, 0, 0, 1, 7, 0.00, 0.00, 1, 0.00, 'NATAL ', '2014-11-21', '2014-11-24', '0000-00-00', '2014-11-25 16:59:02', 597.00, '14', 'M', NULL, 'N', 'N', 2, 'CLIENTES/ PREFEITURA DE ITUPEVA / NOVEMBRO 21 / FAIXAS NATAL 150 ', 'FINALIZADO', 0, 0, NULL, 0, 'N'),
(382, 151, 2014, 212, 0, 0, 1, 7, 0.00, 0.00, 1, 0.00, 'IGREJA ', '2014-11-21', '2014-11-25', '0000-00-00', '2014-11-24 17:14:07', 30.00, '14', 'M', NULL, 'S', 'N', 5, 'NOVEMBRO / BANNER / BANNER IGREJA ASSEMBLEIA / 151 ', 'ACABAMENTO', 0, 0, NULL, 0, 'N'),
(383, 152, 2014, 213, 0, 0, 1, 1, 30.00, 0.00, 1, 0.00, 'BAZAR BENEFICIENTE \r\n** COLOCAR PRETO FOSCO **** ', '2014-11-21', '2014-11-24', '0000-00-00', '2014-11-24 14:17:28', 30.00, '14', 'F', NULL, 'S', 'F', 2, 'NOVEMBRO / BANNER / BANNER EMERSON / 152 ', 'FINALIZADO', 0, 0, NULL, 0, 'N'),
(384, 153, 2014, 189, 0, 0, 1, 1, 7.00, 0.00, 1, 13.00, 'SORVETES - SUCOS E REFRIGERANTES ', '2014-11-21', '2014-11-21', '0000-00-00', '2014-11-24 14:03:15', 7.00, '14', 'F', NULL, 'S', 'F', 2, 'CLIENTES / ADS RECORTE / ADS DJALMA / 153 ', 'FINALIZADO', 0, 0, NULL, 0, 'N'),
(385, 154, 2014, 90, 0, 0, 1, 0, 0.00, 0.00, 0, 0.00, 'SECRETARIA DE SAÚDE ', '2014-11-21', '2014-11-24', '0000-00-00', '2014-11-21 15:07:11', 756.00, '14', 'M', NULL, 'S', 'N', 4, 'CLIENTES / PREFEITURA DE JUNDIAI / NOVEMBRO 21 / 154 ', 'IMPRESSAO', 0, 0, NULL, 0, 'N'),
(386, 155, 2014, 214, 0, 0, 1, 7, 0.00, 0.00, 1, 0.00, '02 FAIXA 2,00 X 0,70 (FUTEBOL PARA HOJE)\r\n01 BANNER 0,70 X 1,00 (SALGADOS , SUCOS..)', '2014-11-21', '2014-11-22', '0000-00-00', '2014-11-25 16:57:53', 100.00, '14', 'M', NULL, 'N', 'N', 2, 'NOVEMBRO / FAIXA / FAIXA VALDOMIRO / 155 ', 'FINALIZADO', 0, 0, NULL, 0, 'N'),
(387, 156, 2014, 56, 0, 0, 1, 7, 0.00, 0.00, 1, 0.00, 'MELANCIA DO NEGUINHO, DOCINHA DOCINHA A PARTIR DE r$ 5,00(BEM GRANDE)\r\n2 CAVALETES- 4 LONAS DE FAIXA', '2014-11-21', '2014-11-28', '0000-00-00', '2014-11-25 16:57:35', 70.00, '8', 'M', NULL, 'N', 'N', 2, 'novembro/faixas/faixa fabiano 156', 'FINALIZADO', 0, 0, NULL, 0, 'N'),
(388, 157, 2014, 215, 0, 0, 1, 4, 302.00, 0.00, 9, 110.00, '***SERVIÇO JÁ REALIZADO ** SÓ LIBERAR A ORDEM..\r\n01 LETRA CAIXA 2,24 X 1,02 \r\n01 PAINEL EM ACM REVESTIMENTO 3,97 X 4,00+ 02 PAINEL METALON COM 2 LONAS + 01 REFORMA E MUDANÇA DE LUMINOSO', '2014-11-21', '2014-11-21', '0000-00-00', '2014-11-25 16:57:13', 3020.00, '14', 'M', NULL, 'N', 'N', 8, '', 'PRODUCAO', 0, 0, NULL, 1, 'V'),
(389, 158, 2014, 90, 0, 0, 1, 0, 0.00, 0.00, 0, 0.00, 'KOMBI ', '2014-11-21', '2014-11-24', '0000-00-00', '2014-11-25 16:56:59', 0.01, '14', 'M', NULL, 'N', 'N', 2, 'CLIENTES / PREFEITURA DE JUNDIAI / NOVEMBRO 21 / 158 ', 'FINALIZADO', 0, 0, NULL, 0, 'N'),
(390, 159, 2014, 189, 0, 0, 1, 0, 0.00, 0.00, 0, 0.00, 'FAZ CARRETO \r\n02 UNIDADES DE CADA ADESIVO ', '2014-11-21', '2014-11-24', '0000-00-00', '2014-11-25 16:09:12', 9.00, '14', 'M', NULL, 'N', 'N', 2, 'NOVEMBRO / ADS RECORTE / ADS RECORTE DJALMA / 159 ', 'FINALIZADO', 0, 0, NULL, 0, 'N'),
(391, 160, 2014, 216, 0, 0, 1, 7, 100.00, 0.00, 2, 0.00, '1 faixa 4,00 x 0,70 + 01 faixa 4,50 x 0,80 + 01 faixa 0,70 x 1,20 ', '2014-11-21', '2014-11-25', '0000-00-00', '2014-11-25 16:56:42', 185.00, '14', 'M', NULL, 'N', 'N', 2, 'clientes / kleber -cyrus / novembro 21 / 160 ', 'FINALIZADO', 0, 0, NULL, 0, 'N'),
(392, 161, 2014, 217, 0, 0, 1, 7, 0.00, 0.00, 1, 0.00, 'PAINEL ACM PRETO - 4,35 X 1,00 COM 20 CM DE AVANÇO + 02 PONTOS DE LUZ ', '2014-11-21', '2015-01-05', '0000-00-00', '2014-11-24 09:59:16', 1700.00, '14', 'M', NULL, 'S', 'N', 3, 'NOVEMBRO / ADS RECORTE / ADS RECORTE FABIANA / 161 ', 'PRD/NOVO', 0, 0, NULL, 1, 'N'),
(393, 162, 2014, 218, 0, 0, 1, 0, 0.00, 0.00, 0, 0.00, 'SORTEIO DE NATAL ', '2014-11-21', '2014-11-25', '0000-00-00', '2014-11-25 16:54:59', 30.00, '14', 'M', NULL, 'N', 'N', 2, 'CLIENTES / SILVANA SUPER JET / NOVEMBRO 24 / 162 ', 'FINALIZADO', 0, 0, NULL, 0, 'N'),
(394, 163, 2014, 147, 0, 0, 1, 1, 0.00, 0.00, 0, 0.00, 'FEITO', '2014-11-22', '2014-11-22', '0000-00-00', '2014-11-25 16:54:51', 20.00, '8', 'M', NULL, 'N', 'N', 2, '', 'FINALIZADO', 0, 0, NULL, 0, 'N'),
(395, 163, 2014, 147, 0, 0, 1, 1, 20.00, 0.00, 1, 0.00, 'FEITO', '2014-11-22', '2014-11-22', '0000-00-00', '2014-11-25 16:54:41', 20.00, '8', 'M', NULL, 'N', 'N', 2, '', 'FINALIZADO', 0, 0, NULL, 0, 'N'),
(396, 164, 2014, 219, 0, 0, 1, 7, 20.00, 0.00, 2, 0.00, 'IMAGEM DE PANETONE TRUFADO\r\nESCRITA: FAZEMOS PANETONES TRUFADOS- FAÇA SUA ENCOMENDA. 9 9815 1785/ 9 72091994\r\nOUTRA FAIXA ALTERAR APENAS O TELEFONE 9 98134616', '2014-11-22', '2014-11-27', '0000-00-00', '2014-11-25 16:54:27', 34.00, '8', 'M', NULL, 'N', 'N', 2, 'NOVEMBRO/FAIXAS/FAIXA EVIO 164', 'FINALIZADO', 0, 0, NULL, 0, 'N'),
(397, 165, 2014, 170, 0, 0, 1, 7, 0.00, 0.00, 1, 0.00, 'TRABALHO ESCOLAR \r\n\r\n**PARA TERÇA-FEIRA ** \r\n\r\ncorrigindo s&#227;o 2 banner ', '2014-11-24', '2014-11-25', '0000-00-00', '2014-11-25 16:54:02', 60.00, '14', 'M', NULL, 'N', 'N', 2, 'NOVEMBRO/ BANNERR / BANNER ERIVANIA / 165 ', 'FINALIZADO', 0, 0, NULL, 0, 'N'),
(398, 166, 2014, 25, 0, 0, 1, 1, 10.00, 0.00, 1, 0.00, 'CLIENTE TROUXE A PEÇA PARA COLOCAR O ADESIVO, ME PERGUNTAR ANTES DE ADESIVAR \r\n****CLIENTE VEM BUSCAR HOJE AS 15:00***', '2014-11-24', '2014-11-24', '0000-00-00', '2014-11-25 16:53:51', 10.00, '14', 'M', NULL, 'N', 'N', 2, 'CLIENTES / JOSE RIBERIO / NOVEMBRO 24 / 166 ', 'FINALIZADO', 0, 0, NULL, 0, 'N'),
(399, 167, 2014, 220, 0, 0, 1, 7, 0.00, 0.00, 1, 0.00, 'PLOTAGEM VEICULAR - LAYOUT EM ANEXO', '2014-11-24', '2014-11-26', '0000-00-00', '2014-11-24 13:21:03', 600.00, '14', 'M', NULL, 'S', 'N', 4, 'NOVEMBRO / ADS RECORTE / ADS ALEX / 167 ', 'IMPRESSAO', 0, 0, NULL, 0, 'N'),
(400, 168, 2014, 5, 0, 0, 1, 0, 0.00, 0.00, 0, 0.00, 'GEOVANNA CALÇADOS ', '2014-11-24', '2014-11-26', '0000-00-00', '2014-11-25 16:53:36', 125.00, '14', 'M', NULL, 'N', 'N', 2, 'CLIENTES / RAFAEL REVENDA / NOVEMBRO 167 / LONA 168 ', 'FINALIZADO', 0, 0, NULL, 0, 'N'),
(401, 169, 2014, 66, 0, 0, 1, 0, 0.00, 0.00, 0, 0.00, 'CNA ', '2014-11-24', '2014-11-26', '0000-00-00', '2014-11-25 16:53:14', 120.00, '14', 'M', NULL, 'N', 'N', 2, 'NOVEMBRO / BANNER / BANNER VANIA CNA / 169 ', 'FINALIZADO', 0, 0, NULL, 0, 'N');
INSERT INTO `servico` (`servicoID`, `OS`, `anoServico`, `clienteID`, `veiculoID`, `km`, `empresaID`, `formPagID`, `entrada`, `troco`, `vezes`, `desconto`, `descricao`, `dataInicio`, `dataprevista`, `dataAgendamento`, `dataFim`, `valor`, `usuario`, `status`, `observacao`, `visualizacao`, `finalizado`, `nivelUsuario`, `caminhoArte`, `passo`, `reagendado`, `tipo`, `obsOrcamento`, `rotina`, `visualizadoR2`) VALUES
(402, 170, 2014, 129, 0, 0, 1, 0, 0.00, 0.00, 0, 0.00, '01 BANNER 0,85 X 0,65 + 01 BANNER 0,40 X 0,60 + 01 BANNER 0,40 X 1,50 ', '2014-11-24', '2014-11-26', '0000-00-00', '2014-11-25 16:52:22', 75.00, '14', 'M', NULL, 'N', 'N', 2, 'NOVEMBRO / BANNER / BANNER FERNANDA / 170 ', 'FINALIZADO', 0, 0, NULL, 0, 'N'),
(403, 171, 2014, 221, 0, 0, 1, 0, 0.00, 0.00, 0, 0.00, 'CATEQUESE ', '2014-11-24', '2014-11-25', '0000-00-00', '2014-11-25 16:52:09', 51.00, '14', 'M', NULL, 'N', 'N', 2, 'CLIENTES / IGREJA NOSSA SRA DE LOURDES / NOVEMBRO 24 / FAIXA 171 ', 'FINALIZADO', 0, 0, NULL, 0, 'N'),
(404, 172, 2014, 222, 0, 0, 1, 1, 25.00, 0.00, 1, 0.00, 'RETIRA AMANH&#195;- VENDE-SE', '2014-11-24', '2014-11-25', '0000-00-00', '2014-11-25 16:00:52', 25.00, '8', 'M', NULL, 'N', 'N', 2, 'NOVEMBRO/ADESIVOS/ADS MANOEL 172', 'FINALIZADO', 0, 0, NULL, 0, 'N'),
(405, 173, 2014, 223, 0, 0, 1, 7, 0.00, 0.00, 1, 0.00, 'IGREJA ', '2014-11-24', '2014-11-26', '0000-00-00', '2014-11-25 16:51:24', 34.00, '14', 'M', NULL, 'N', 'N', 2, 'novembro/ FAIXA / FAIXA GENI / 173 ', 'FINALIZADO', 0, 0, NULL, 0, 'N'),
(406, 174, 2014, 224, 0, 0, 1, 7, 0.00, 0.00, 1, 10.00, 'VENDE-SE AGUA ', '2014-11-24', '2014-11-26', '0000-00-00', '2014-11-25 16:51:09', 68.00, '14', 'M', NULL, 'N', 'N', 2, 'NOVEMBRO / FAIXA / FAIXA LUIZ ANTONIO / 174 ', 'FINALIZADO', 0, 0, NULL, 0, 'N'),
(407, 175, 2014, 225, 0, 0, 1, 7, 312.50, 0.00, 1, 0.00, '01 - ADESIVO RECORTE "SAIDA" 3,40 X 0,30 + 02 PLACA DE CHAPA GALVANIZADA 1,00 X 1,00 " CONTRAM&#195;O) + 04 ADESIVOS "BOMBA" 0,40 X 0,42 1/2 + 0,43 1/2 X 0,13 \r\n**INSTALAÇ&#195;O COMBINADA PARA SEXTA FEIRA**', '2014-11-24', '2014-11-28', '0000-00-00', '2014-11-25 13:52:50', 705.00, '14', 'M', NULL, 'S', 'N', 4, 'CLIENTES / POSTO SOLECAR / NOVEMBRO 24 / 175 ', 'IMPRESSAO', 0, 0, NULL, 0, 'N'),
(408, 176, 2014, 226, 0, 0, 1, 7, 0.00, 0.00, 3, 0.00, 'O MATERIAL JÁ FOI ENTREGUE! FAVOR N&#195;O REPETI-LO\r\nOBRIGADA', '2014-11-24', '2014-11-24', '0000-00-00', '2014-11-24 17:35:29', 3000.00, '8', 'M', NULL, 'N', 'N', 2, NULL, 'AGENDAMENTO', 0, 0, NULL, 2, 'N'),
(409, 177, 2014, 200, 0, 0, 1, 7, 0.00, 0.00, 1, 0.00, 'LOCAÇ&#195;O DE BRINQUEDOS ', '2014-11-24', '2014-11-26', '0000-00-00', '2014-11-25 16:50:58', 80.00, '14', 'M', NULL, 'N', 'N', 2, 'NOVEMBRO / FAIXA / FAIXA LILUKA / 177 ', 'FINALIZADO', 0, 0, NULL, 0, 'N'),
(410, 178, 2014, 227, 0, 0, 1, 0, 0.00, 0.00, 0, 0.00, '02 BANNER 0,90 X 0,70 + 01 FAIXA 2,50 X 1,00 \r\n\r\ncaminho correto: clientes / prefeitura de bragança paulista/novembro 24 / 178', '2014-11-24', '2014-11-26', '0000-00-00', '2014-11-25 16:50:37', 137.50, '14', 'M', NULL, 'N', 'N', 2, 'CLIENTES / PREFEITURA DE ITUPEVA / NOVEMBRO 24 / 178', 'FINALIZADO', 0, 0, NULL, 0, 'N'),
(411, 179, 2014, 227, 0, 0, 1, 0, 0.00, 0.00, 0, 0.00, '01 - faixa 4,00 x 0,70 (encontro de fanfarras) + 01 faixa 0,60 x 1,80 (pacto) + 01 banner 1,20 x 0,80 (pacto) ** colocar ilhós nos 4 cantos das faixas ** ', '2014-11-25', '2014-11-25', '0000-00-00', '2014-11-25 09:02:55', 115.26, '14', 'M', NULL, 'S', 'N', 3, 'clientes / prefeitura de bragança paulista / novembro 25 / 179 ', 'NOVO', 0, 0, NULL, 0, 'N'),
(412, 180, 2014, 229, 0, 0, 1, 7, 1000.00, 0.00, 2, 350.00, 'PAINEL EM ACM AMARELO ADESIVADO, COM 2 PÉ DIREITO ', '2014-11-25', '2015-01-05', '0000-00-00', '2014-11-25 15:42:51', 4020.00, '14', 'M', NULL, 'N', 'N', 3, 'CLIENTES / PAULINHO BATERIAS / NOVEMBRO 25 / PAINEL 180 ', 'PRD/NOVO', 0, 0, NULL, 1, 'N'),
(413, 181, 2014, 230, 0, 0, 1, 0, 0.00, 0.00, 0, 0.00, 'ARTE IGUAL A DE CABREÚVA- ENVIAR AO KENNER P APROVAÇ&#195;O\r\nESTRUTURA EM METALON E ACABAMENTO CANTONEIRA DE ALUMINIO- CONFERIR FOTO ', '2014-11-25', '2015-01-07', '0000-00-00', '2014-11-25 11:07:26', 1300.00, '8', 'M', NULL, 'S', 'N', 3, 'novembro/lonas/lona gabetta 181', 'PRD/NOVO', 0, 0, NULL, 1, 'N'),
(414, 182, 2014, 91, 0, 0, 1, 7, 0.00, 0.00, 1, 0.00, 'CHEQUE ** \r\nWILHIAN TENTAR FAZER HOJE , POIS ELE VEM RETIRAR AMANHA.\r\n\r\nOBRIGADA\r\n\r\nCOLOCAR EM PVC DE 3 MM ', '2014-11-25', '2014-11-25', '0000-00-00', '2014-11-25 13:57:16', 80.00, '14', 'M', NULL, 'S', 'N', 4, 'CLIENTES / PREFEITURA DE ITUPEVA / NOVEMBRO 25 / 182 ', 'IMPRESSAO', 0, 0, NULL, 0, 'N'),
(415, 183, 2014, 231, 0, 0, 1, 7, 0.00, 0.00, 1, 0.00, 'EVENTO IGREJA ', '2014-11-25', '2014-11-27', '0000-00-00', '2014-11-25 16:50:10', 40.00, '14', 'M', NULL, 'S', 'N', 5, 'NOVEMBRO / BANNER / BANNER GILMAR / 183 ', 'ACABAMENTO', 0, 0, NULL, 0, 'N'),
(416, 184, 2014, 232, 0, 0, 1, 7, 0.00, 0.00, 1, 0.00, 'LDS EM AMARELO ', '2014-11-25', '2014-11-27', '0000-00-00', '2014-11-25 13:59:03', 10.00, '14', 'M', NULL, 'S', 'N', 4, 'NOVEMBRO / ADS RECORTE / ADS RECORTE / 184 ', 'IMPRESSAO', 0, 0, NULL, 0, 'N'),
(417, 185, 2014, 234, 0, 0, 1, 7, 0.00, 0.00, 1, 0.00, '.', '2014-11-25', '2014-11-27', '0000-00-00', '2014-11-25 13:39:39', 35.00, '14', 'M', NULL, 'N', 'N', 3, 'NOVEMBRO /BANNER/ BANNER ROSELI / 185 ', 'NOVO', 0, 0, NULL, 0, 'N'),
(418, 186, 2014, 233, 0, 0, 1, 7, 0.00, 0.00, 1, 0.00, 'colch&#227;o ', '2014-11-25', '2014-11-27', '0000-00-00', '2014-11-25 14:57:47', 94.50, '14', 'M', NULL, 'S', 'N', 4, 'NOVEMBRO/ FAIXA / faixa oliver / ', 'IMPRESSAO', 0, 0, NULL, 0, 'N'),
(419, 187, 2014, 59, 0, 0, 1, 7, 0.00, 0.00, 1, 0.00, 'sucos ', '2014-11-25', '2014-11-26', '0000-00-00', '2014-11-25 15:57:46', 60.00, '14', 'M', NULL, 'N', 'N', 4, 'novembro / faixas / faixas adair / 187 ', 'IMPRESSAO', 0, 0, NULL, 0, 'N'),
(420, 188, 2014, 107, 0, 0, 1, 7, 0.00, 0.00, 2, 0.00, 'promoç&#227;o de pizza ', '2014-11-25', '2014-11-27', '0000-00-00', '2014-11-25 15:43:00', 17.00, '14', 'M', NULL, 'N', 'N', 4, 'novembro / faixas / faixa juliano / 188 ', 'IMPRESSAO', 0, 0, NULL, 0, 'N'),
(421, 189, 2014, 137, 0, 0, 1, 7, 0.00, 0.00, 1, 0.00, 'NOMES ', '2014-11-25', '2014-11-26', '0000-00-00', '2014-11-25 15:27:20', 153.00, '14', 'M', NULL, 'N', 'N', 4, 'CLIENTES / MARCELO  PONTES / NOVEMBRO 25 / 189 ', 'IMPRESSAO', 0, 0, NULL, 0, 'N'),
(422, 190, 2014, 235, 0, 0, 1, 0, 0.00, 0.00, 0, 0.00, '20 - PLACAS MDF 0,60 X 0,40 **\r\n\r\nNOVEMBRO / ADESIVO / ADESIVO SHIRLEY / 190 ', '2014-11-25', '2014-11-27', '0000-00-00', '2014-11-25 16:04:53', 500.00, '14', 'M', NULL, 'N', 'N', 3, 'NOVEMBRO / LONAS / LONAS SHIRLEY / 190', 'NOVO', 0, 0, NULL, 0, 'N'),
(423, 191, 2014, 236, 0, 0, 1, 7, 0.00, 0.00, 1, 0.00, 'PAES E BOLOS ', '2014-11-25', '2014-11-28', '0000-00-00', '2014-11-25 17:23:32', 17.00, '14', 'M', NULL, 'N', 'N', 4, 'NOVEMBRO / FAIXA / FAIXA EDITORA / 191 ', 'IMPRESSAO', 0, 0, NULL, 0, 'N'),
(424, 192, 2014, 237, 0, 0, 1, 7, 0.00, 0.00, 1, 0.00, 'JA FOI FEITA ', '2014-11-25', '2014-11-25', '0000-00-00', '2014-11-25 16:59:24', 80.00, '14', 'M', NULL, 'N', 'N', 3, '', 'NOVO', 0, 0, NULL, 0, 'N');

-- --------------------------------------------------------

--
-- Estrutura da tabela `servicofechado`
--

CREATE TABLE IF NOT EXISTS `servicofechado` (
  `servicofechadoID` int(11) NOT NULL AUTO_INCREMENT,
  `servicoID` int(11) NOT NULL,
  `valor` float(10,2) NOT NULL,
  `formPagID` int(11) NOT NULL,
  `usuario` int(11) NOT NULL,
  `data` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`servicofechadoID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=182 ;

--
-- Extraindo dados da tabela `servicofechado`
--

INSERT INTO `servicofechado` (`servicofechadoID`, `servicoID`, `valor`, `formPagID`, `usuario`, `data`) VALUES
(1, 233, 70.00, 1, 14, '2014-11-11 11:23:32'),
(2, 234, 100.00, 1, 14, '2014-11-11 11:50:11'),
(3, 235, 20.00, 1, 14, '2014-11-11 12:02:24'),
(4, 238, 30.00, 1, 8, '2014-11-11 13:03:18'),
(5, 237, 117.00, 3, 8, '2014-11-11 13:09:10'),
(6, 232, 134.00, 7, 8, '2014-11-11 13:24:39'),
(7, 230, 640.00, 7, 8, '2014-11-11 13:25:23'),
(8, 240, 175.50, 7, 14, '2014-11-11 15:08:13'),
(9, 240, 175.50, 7, 8, '2014-11-11 15:17:09'),
(10, 242, 20.00, 1, 14, '2014-11-11 15:39:28'),
(11, 234, 100.00, 7, 8, '2014-11-11 15:41:12'),
(12, 243, 50.00, 1, 8, '2014-11-11 15:54:38'),
(13, 245, 150.00, 1, 8, '2014-11-11 16:09:09'),
(14, 226, 35.00, 7, 8, '2014-11-11 16:22:03'),
(15, 227, 210.00, 7, 8, '2014-11-11 16:22:54'),
(16, 228, 126.00, 7, 8, '2014-11-11 16:24:45'),
(17, 230, 640.00, 7, 8, '2014-11-11 16:25:26'),
(18, 250, 17.00, 7, 14, '2014-11-11 17:04:58'),
(19, 251, 17.00, 1, 14, '2014-11-11 17:18:58'),
(20, 252, 25.00, 7, 14, '2014-11-11 17:23:16'),
(21, 254, 15.00, 1, 14, '2014-11-12 08:22:42'),
(22, 257, 70.00, 1, 14, '2014-11-12 09:44:36'),
(23, 260, 30.00, 1, 14, '2014-11-12 11:23:37'),
(24, 259, 40.00, 7, 14, '2014-11-12 11:36:06'),
(25, 262, 30.00, 7, 8, '2014-11-12 13:23:25'),
(26, 246, 225.00, 1, 14, '2014-11-12 15:12:43'),
(27, 229, 126.00, 1, 14, '2014-11-12 15:13:59'),
(28, 264, 100.00, 1, 8, '2014-11-12 15:28:57'),
(29, 258, 65.00, 1, 8, '2014-11-12 15:41:40'),
(30, 266, 30.00, 1, 14, '2014-11-12 16:01:01'),
(31, 268, 78.00, 1, 14, '2014-11-12 16:30:11'),
(32, 269, 90.00, 7, 14, '2014-11-12 17:10:37'),
(33, 274, 670.00, 7, 8, '2014-11-13 11:02:37'),
(34, 276, 35.00, 1, 14, '2014-11-13 11:50:50'),
(35, 274, 670.00, 7, 8, '2014-11-13 13:13:41'),
(36, 279, 332.00, 7, 8, '2014-11-13 13:37:57'),
(37, 280, 5500.00, 7, 8, '2014-11-13 13:45:57'),
(38, 281, 25.00, 1, 14, '2014-11-13 15:40:42'),
(39, 288, 80.00, 1, 14, '2014-11-13 17:55:17'),
(40, 288, 80.00, 1, 14, '2014-11-13 18:00:26'),
(41, 269, 90.00, 1, 14, '2014-11-14 10:47:15'),
(42, 290, 160.00, 1, 14, '2014-11-14 10:56:13'),
(43, 291, 1060.00, 4, 8, '2014-11-14 11:01:00'),
(44, 295, 10000.00, 7, 8, '2014-11-14 12:04:10'),
(45, 295, 10000.00, 4, 8, '2014-11-14 12:06:50'),
(46, 297, 17.00, 1, 14, '2014-11-14 12:18:35'),
(47, 297, 17.00, 1, 14, '2014-11-14 12:21:11'),
(48, 299, 70.00, 1, 8, '2014-11-14 12:49:16'),
(49, 302, 225.00, 2, 14, '2014-11-14 14:02:12'),
(50, 306, 80.00, 1, 14, '2014-11-14 15:05:22'),
(51, 303, 80.00, 1, 14, '2014-11-14 15:21:56'),
(52, 307, 50.00, 1, 14, '2014-11-14 15:38:24'),
(53, 277, 30.00, 1, 14, '2014-11-14 16:33:15'),
(54, 310, 170.00, 7, 14, '2014-11-17 09:55:47'),
(55, 312, 70.00, 1, 14, '2014-11-17 10:18:18'),
(56, 311, 30.00, 7, 14, '2014-11-17 10:54:12'),
(57, 278, 131.00, 1, 14, '2014-11-17 11:09:06'),
(58, 287, 80.00, 1, 14, '2014-11-17 11:10:25'),
(59, 255, 598.50, 7, 14, '2014-11-17 11:11:00'),
(60, 231, 0.01, 7, 14, '2014-11-17 11:11:11'),
(61, 240, 175.50, 7, 14, '2014-11-17 11:11:55'),
(62, 255, 598.50, 7, 14, '2014-11-17 11:12:15'),
(63, 314, 120.00, 3, 14, '2014-11-17 11:48:46'),
(64, 315, 93.00, 7, 14, '2014-11-17 11:54:09'),
(65, 317, 30.00, 1, 8, '2014-11-17 12:57:32'),
(66, 321, 45.00, 1, 14, '2014-11-17 14:27:16'),
(67, 326, 180.00, 7, 14, '2014-11-17 15:28:18'),
(68, 327, 30.00, 1, 14, '2014-11-17 15:45:58'),
(69, 328, 1680.00, 7, 14, '2014-11-17 16:13:44'),
(70, 329, 45.00, 3, 14, '2014-11-17 16:37:46'),
(71, 330, 530.00, 5, 14, '2014-11-17 16:44:00'),
(72, 309, 17.00, 1, 14, '2014-11-18 08:23:59'),
(73, 286, 68.00, 1, 14, '2014-11-18 08:24:22'),
(74, 240, 175.50, 7, 14, '2014-11-18 08:49:04'),
(75, 255, 598.50, 7, 14, '2014-11-18 08:49:52'),
(76, 332, 7990.00, 7, 14, '2014-11-18 09:06:30'),
(77, 279, 330.00, 1, 14, '2014-11-18 10:32:32'),
(78, 279, 330.00, 5, 14, '2014-11-18 10:33:39'),
(79, 334, 17.00, 1, 14, '2014-11-18 10:40:40'),
(80, 338, 70.00, 1, 14, '2014-11-18 11:47:37'),
(81, 339, 20.00, 1, 8, '2014-11-18 13:03:54'),
(82, 340, 30.00, 7, 8, '2014-11-18 13:17:06'),
(83, 341, 200.00, 1, 14, '2014-11-18 14:09:58'),
(84, 304, 34.00, 1, 14, '2014-11-18 14:25:14'),
(85, 346, 284.00, 7, 14, '2014-11-18 15:19:42'),
(86, 347, 40.00, 2, 14, '2014-11-18 15:50:45'),
(87, 272, 95.00, 5, 14, '2014-11-18 16:00:11'),
(88, 313, 153.00, 7, 14, '2014-11-18 16:00:39'),
(89, 335, 45.00, 1, 14, '2014-11-18 16:26:09'),
(90, 350, 250.00, 7, 14, '2014-11-18 17:05:24'),
(91, 352, 20.00, 1, 14, '2014-11-19 08:58:18'),
(92, 316, 140.00, 2, 14, '2014-11-19 09:03:37'),
(93, 353, 157.00, 7, 14, '2014-11-19 09:27:38'),
(94, 354, 310.00, 5, 14, '2014-11-19 09:42:15'),
(95, 316, 140.00, 1, 14, '2014-11-19 10:08:15'),
(96, 355, 25.00, 7, 14, '2014-11-19 10:20:17'),
(97, 359, 40.00, 1, 8, '2014-11-19 13:41:06'),
(98, 360, 240.00, 1, 14, '2014-11-19 13:55:16'),
(99, 323, 199.00, 7, 14, '2014-11-19 14:20:41'),
(100, 231, 0.01, 7, 14, '2014-11-19 14:21:21'),
(101, 361, 30.00, 1, 14, '2014-11-19 14:49:38'),
(102, 361, 30.00, 1, 14, '2014-11-19 14:50:04'),
(103, 285, 0.01, 7, 14, '2014-11-20 08:50:14'),
(104, 318, 150.00, 5, 14, '2014-11-20 09:11:23'),
(105, 366, 200.00, 2, 14, '2014-11-20 10:36:58'),
(106, 367, 180.00, 1, 14, '2014-11-20 10:49:47'),
(107, 273, 90.00, 3, 14, '2014-11-20 11:02:27'),
(108, 370, 2900.00, 7, 8, '2014-11-20 12:07:06'),
(109, 369, 60.00, 1, 14, '2014-11-20 13:41:16'),
(110, 371, 15.00, 1, 14, '2014-11-20 13:47:34'),
(111, 373, 15.00, 1, 14, '2014-11-20 13:52:41'),
(112, 374, 30.00, 1, 14, '2014-11-20 14:42:23'),
(113, 313, 102.00, 7, 14, '2014-11-20 16:18:22'),
(114, 376, 560.00, 1, 14, '2014-11-20 16:50:49'),
(115, 375, 243.00, 7, 8, '2014-11-20 17:53:26'),
(116, 377, 4893.34, 7, 8, '2014-11-20 17:53:59'),
(117, 375, 243.00, 7, 14, '2014-11-20 18:00:46'),
(118, 372, 744.00, 7, 14, '2014-11-20 18:01:32'),
(119, 365, 324.00, 7, 14, '2014-11-20 18:02:21'),
(120, 363, 95.00, 7, 14, '2014-11-20 18:02:57'),
(121, 362, 360.00, 7, 14, '2014-11-20 18:03:19'),
(122, 230, 640.00, 7, 14, '2014-11-20 18:05:38'),
(123, 232, 134.00, 7, 14, '2014-11-20 18:05:57'),
(124, 239, 0.01, 7, 14, '2014-11-20 18:06:13'),
(125, 241, 1080.00, 7, 14, '2014-11-20 18:08:55'),
(126, 250, 17.00, 7, 14, '2014-11-20 18:09:18'),
(127, 379, 51.00, 7, 14, '2014-11-21 08:44:31'),
(128, 378, 68.00, 7, 14, '2014-11-21 08:44:47'),
(129, 377, 4893.34, 7, 14, '2014-11-21 08:44:59'),
(130, 380, 60.00, 7, 14, '2014-11-21 09:02:58'),
(131, 380, 60.00, 3, 14, '2014-11-21 09:10:02'),
(132, 380, 60.00, 3, 14, '2014-11-21 09:31:38'),
(133, 380, 60.00, 1, 8, '2014-11-21 09:44:47'),
(134, 239, 0.01, 7, 14, '2014-11-21 10:10:04'),
(135, 248, 51.00, 7, 14, '2014-11-21 10:10:40'),
(136, 249, 300.00, 7, 14, '2014-11-21 10:11:14'),
(137, 271, 50.00, 7, 14, '2014-11-21 10:12:52'),
(138, 352, 20.00, 7, 14, '2014-11-21 12:19:27'),
(139, 347, 40.00, 7, 14, '2014-11-21 12:19:43'),
(140, 383, 30.00, 7, 14, '2014-11-21 12:20:09'),
(141, 382, 30.00, 7, 14, '2014-11-21 12:20:23'),
(142, 381, 597.00, 7, 14, '2014-11-21 12:20:40'),
(143, 383, 30.00, 1, 14, '2014-11-21 12:22:49'),
(144, 386, 100.00, 7, 14, '2014-11-21 14:02:25'),
(145, 333, 40.00, 7, 14, '2014-11-21 14:10:57'),
(146, 384, 7.00, 1, 14, '2014-11-21 14:27:43'),
(147, 387, 70.00, 7, 8, '2014-11-21 14:50:16'),
(148, 391, 185.00, 7, 14, '2014-11-21 16:37:07'),
(149, 392, 1700.00, 7, 14, '2014-11-21 17:30:54'),
(150, 388, 3020.00, 4, 8, '2014-11-21 17:47:30'),
(151, 395, 20.00, 1, 8, '2014-11-22 10:14:53'),
(152, 396, 34.00, 7, 8, '2014-11-22 10:32:14'),
(153, 333, 40.00, 1, 8, '2014-11-22 12:59:02'),
(154, 397, 60.00, 7, 14, '2014-11-24 10:36:21'),
(155, 398, 10.00, 1, 14, '2014-11-24 10:42:23'),
(156, 399, 600.00, 7, 14, '2014-11-24 10:43:08'),
(157, 404, 25.00, 1, 8, '2014-11-24 12:52:20'),
(158, 345, 4.00, 7, 14, '2014-11-24 14:11:10'),
(159, 406, 68.00, 7, 14, '2014-11-24 15:18:27'),
(160, 319, 25.00, 1, 8, '2014-11-24 15:22:49'),
(161, 407, 705.00, 7, 14, '2014-11-24 16:02:23'),
(162, 408, 3000.00, 7, 8, '2014-11-24 16:26:02'),
(163, 405, 34.00, 7, 14, '2014-11-24 16:28:49'),
(164, 407, 705.00, 7, 14, '2014-11-24 17:05:55'),
(165, 409, 80.00, 7, 14, '2014-11-24 18:04:09'),
(166, 325, 45.00, 7, 14, '2014-11-25 10:51:19'),
(167, 414, 80.00, 7, 14, '2014-11-25 11:19:11'),
(168, 372, 576.00, 3, 14, '2014-11-25 12:07:23'),
(169, 416, 10.00, 7, 14, '2014-11-25 12:23:43'),
(170, 415, 40.00, 7, 14, '2014-11-25 12:25:15'),
(171, 417, 35.00, 7, 14, '2014-11-25 13:39:39'),
(172, 418, 94.50, 7, 14, '2014-11-25 14:12:41'),
(173, 351, 460.00, 7, 14, '2014-11-25 14:19:12'),
(174, 419, 60.00, 7, 14, '2014-11-25 14:42:45'),
(175, 420, 17.00, 7, 14, '2014-11-25 14:53:39'),
(176, 421, 153.00, 7, 14, '2014-11-25 14:56:28'),
(177, 412, 4020.00, 7, 8, '2014-11-25 15:42:51'),
(178, 423, 17.00, 7, 14, '2014-11-25 16:32:53'),
(179, 391, 185.00, 7, 8, '2014-11-25 16:50:24'),
(180, 424, 80.00, 7, 14, '2014-11-25 16:59:24'),
(181, 263, 324.00, 7, 14, '2014-11-25 18:50:35');

-- --------------------------------------------------------

--
-- Estrutura da tabela `servicoitem`
--

CREATE TABLE IF NOT EXISTS `servicoitem` (
  `servicoitemID` int(11) NOT NULL AUTO_INCREMENT,
  `servicoID` int(11) NOT NULL,
  `descricao` text NOT NULL,
  `valor` float(10,2) NOT NULL,
  `data` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`servicoitemID`),
  KEY `servicoID` (`servicoID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Extraindo dados da tabela `servicoitem`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `servicomateriais`
--

CREATE TABLE IF NOT EXISTS `servicomateriais` (
  `idServicoMaterial` int(11) NOT NULL AUTO_INCREMENT,
  `idServico` int(11) NOT NULL,
  `indice` int(11) NOT NULL DEFAULT '0',
  `produtoID` int(11) NOT NULL,
  `idMaterial` int(11) NOT NULL,
  `Quantidade` double NOT NULL DEFAULT '0',
  `valorCusto` decimal(10,0) NOT NULL,
  `altura` double DEFAULT NULL,
  `largura` double DEFAULT NULL,
  `alturaReal` double DEFAULT NULL,
  `larguraReal` double DEFAULT NULL,
  `quantidadeReal` double DEFAULT NULL,
  `valorVenda` double NOT NULL,
  `dataVenda` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`idServicoMaterial`),
  KEY `idServico` (`idServico`,`idMaterial`),
  KEY `indice` (`indice`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=171 ;

--
-- Extraindo dados da tabela `servicomateriais`
--

INSERT INTO `servicomateriais` (`idServicoMaterial`, `idServico`, `indice`, `produtoID`, `idMaterial`, `Quantidade`, `valorCusto`, `altura`, `largura`, `alturaReal`, `larguraReal`, `quantidadeReal`, `valorVenda`, `dataVenda`) VALUES
(165, 226, 0, 8, 13, 0, '4', NULL, NULL, NULL, NULL, 1.2, 35, '2014-11-11 08:54:30'),
(166, 227, 0, 7, 13, 0, '4', NULL, NULL, NULL, NULL, 0, 210, '2014-11-11 09:23:54'),
(167, 228, 0, 7, 13, 0, '4', NULL, NULL, NULL, NULL, 0, 42, '2014-11-11 09:35:29'),
(168, 229, 0, 9, 13, 0, '4', NULL, NULL, NULL, NULL, 0, 84, '2014-11-11 09:35:29'),
(169, 238, 0, 8, 13, 0, '4', NULL, NULL, NULL, NULL, 0.9, 0.9, '2014-11-11 13:01:58'),
(170, 243, 0, 8, 13, 0, '4', NULL, NULL, NULL, NULL, 0.9, 6.3, '2014-11-11 15:53:45');

-- --------------------------------------------------------

--
-- Estrutura da tabela `servicoproduto`
--

CREATE TABLE IF NOT EXISTS `servicoproduto` (
  `servicoprodutoID` int(11) NOT NULL AUTO_INCREMENT,
  `servicoID` int(11) NOT NULL,
  `produtoID` int(11) NOT NULL,
  `valor` float(10,2) NOT NULL,
  `qtdProduto` int(11) DEFAULT NULL,
  `data` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `altura` double DEFAULT NULL,
  `largura` double DEFAULT NULL,
  PRIMARY KEY (`servicoprodutoID`),
  KEY `servicoID` (`servicoID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=200 ;

--
-- Extraindo dados da tabela `servicoproduto`
--

INSERT INTO `servicoproduto` (`servicoprodutoID`, `servicoID`, `produtoID`, `valor`, `qtdProduto`, `data`, `altura`, `largura`) VALUES
(1, 226, 8, 35.00, 1, '2014-11-11 08:54:30', 1.2, 0.8),
(2, 227, 7, 210.00, 4, '2014-11-11 09:23:54', 0.7, 3),
(3, 228, 7, 42.00, 1, '2014-11-11 09:35:29', 2.5, 0.7),
(4, 229, 9, 84.00, 2, '2014-11-11 09:35:29', 0.7, 2),
(5, 230, 10, 640.00, 1, '2014-11-11 09:54:36', 0, 0),
(6, 231, 7, 0.01, 2, '2014-11-11 10:36:55', 0.7, 3),
(7, 232, 7, 34.00, 1, '2014-11-11 11:11:42', 0.7, 2),
(8, 233, 7, 70.00, 1, '2014-11-11 11:23:12', 0.7, 3),
(9, 234, 7, 100.00, 2, '2014-11-11 11:44:02', 1, 2),
(10, 235, 7, 20.00, 1, '2014-11-11 12:02:06', 0.7, 0.5),
(11, 236, 18, 120.00, 1, '2014-11-11 12:33:56', 0.8, 1),
(12, 237, 18, 120.00, 1, '2014-11-11 12:39:38', 0.8, 1),
(13, 238, 8, 30.00, 1, '2014-11-11 13:01:58', 1, 0.7),
(14, 239, 10, 0.01, 1, '2014-11-11 14:11:14', 0.08, 0.12),
(15, 240, 8, 175.50, 15, '2014-11-11 15:05:02', 1, 0.3),
(16, 241, 10, 1080.00, 2, '2014-11-11 15:14:25', 2.04, 2.18),
(17, 242, 11, 20.00, 1, '2014-11-11 15:32:37', 0.4, 0.15),
(18, 243, 8, 50.00, 1, '2014-11-11 15:53:45', 1, 0.7),
(19, 244, 10, 150.00, 50, '2014-11-11 16:01:56', 0.1, 0.7),
(20, 245, 10, 150.00, 50, '2014-11-11 16:03:06', 0.1, 0.7),
(21, 246, 8, 225.00, 15, '2014-11-11 16:13:21', 0.8, 0.6),
(22, 247, 22, 1960.00, 1, '2014-11-11 16:18:51', 1, 4),
(23, 248, 7, 51.00, 1, '2014-11-11 16:25:46', 0.7, 3),
(24, 249, 11, 300.00, 30, '2014-11-11 16:36:12', 0.4, 0.6),
(25, 250, 7, 17.00, 1, '2014-11-11 17:01:38', 0.7, 1),
(26, 251, 7, 17.00, 1, '2014-11-11 17:17:24', 0.7, 1),
(27, 252, 7, 25.00, 1, '2014-11-11 17:22:56', 0.7, 1),
(28, 253, 8, 0.00, 1, '2014-11-11 18:23:02', 2, 1.87),
(29, 254, 7, 15.00, 1, '2014-11-12 08:22:26', 0.4, 0.6),
(30, 255, 7, 450.00, 10, '2014-11-12 09:01:58', 1, 5),
(31, 256, 7, 68.00, 1, '2014-11-12 09:30:55', 0.7, 4),
(32, 257, 8, 70.00, 2, '2014-11-12 09:44:08', 1.2, 0.9),
(33, 258, 7, 65.00, 1, '2014-11-12 09:51:21', 1.8, 1.2),
(34, 259, 10, 40.00, 2, '2014-11-12 11:21:01', 0.7, 0.6),
(35, 260, 10, 30.00, 1, '2014-11-12 11:22:26', 0.26, 0.68),
(36, 261, 10, 0.00, 2, '2014-11-12 12:03:45', 0, 0),
(37, 262, 9, 30.00, 1, '2014-11-12 12:23:06', 0.7, 1),
(38, 263, 12, 143.00, 4, '2014-11-12 13:58:52', 0, 0),
(39, 264, 7, 100.00, 2, '2014-11-12 15:19:52', 0.7, 3),
(40, 265, 8, 135.00, 10, '2014-11-12 15:39:18', 1, 1.5),
(41, 266, 8, 30.00, 1, '2014-11-12 16:00:49', 1, 0.7),
(42, 267, 7, 78.00, 1, '2014-11-12 16:26:27', 4.3, 0.7),
(43, 268, 7, 78.00, 1, '2014-11-12 16:29:57', 4.3, 0.7),
(44, 269, 8, 90.00, 3, '2014-11-12 17:09:35', 0.7, 1),
(45, 270, 10, 84.00, 1, '2014-11-13 08:35:12', 0.7, 0.15),
(46, 271, 9, 50.00, 2, '2014-11-13 09:01:54', 0.8, 1),
(47, 272, 7, 95.00, 1, '2014-11-13 10:39:05', 1, 3.5),
(48, 273, 11, 90.00, 6, '2014-11-13 11:00:32', 0.4, 0.6),
(49, 274, 14, 320.00, 2, '2014-11-13 11:02:16', 0.8, 2.2),
(50, 275, 15, 900.00, 1, '2014-11-13 11:22:28', 3.4, 3.3),
(51, 276, 10, 35.00, 1, '2014-11-13 11:49:15', 0.5, 1),
(52, 277, 8, 30.00, 1, '2014-11-13 11:56:07', 1, 0.7),
(53, 278, 8, 100.00, 2, '2014-11-13 12:06:43', 1, 1.7),
(54, 279, 23, 332.00, 1, '2014-11-13 13:37:38', 0.9, 4.1),
(55, 280, 22, 5500.00, 1, '2014-11-13 13:45:32', 1.5, 7.64),
(56, 281, 7, 25.00, 1, '2014-11-13 14:28:03', 0.7, 1.5),
(57, 282, 15, 1500.00, 6, '2014-11-13 15:01:50', 0, 0),
(58, 283, 24, 450.00, 1, '2014-11-13 15:17:45', 0.4, 1),
(59, 284, 15, 900.00, 1, '2014-11-13 16:06:07', 3.4, 3),
(60, 285, 10, 0.00, 1, '2014-11-13 16:18:18', 0, 0),
(61, 286, 7, 68.00, 1, '2014-11-13 16:22:42', 4, 0.7),
(62, 287, 7, 81.00, 1, '2014-11-13 17:49:26', 3, 1),
(63, 288, 9, 80.00, 2, '2014-11-13 17:55:05', 0, 0),
(64, 289, 26, 0.00, 1, '2014-11-14 10:14:40', 0.25, 0),
(65, 290, 28, 160.00, 1, '2014-11-14 10:55:59', 0, 0),
(66, 291, 15, 1060.00, 2, '2014-11-14 11:00:19', 2.5, 2.12),
(67, 292, 25, 100.00, 1, '2014-11-14 11:00:33', 1, 2),
(68, 293, 12, 20.00, 1, '2014-11-14 11:43:54', 0.16, 0.13),
(69, 294, 8, 15.00, 2, '2014-11-14 11:48:25', 0.4, 0.3),
(70, 295, 16, 5500.00, 1, '2014-11-14 12:03:36', 5.5, 5),
(71, 296, 7, 34.00, 1, '2014-11-14 12:07:00', 0.7, 2),
(72, 297, 7, 17.00, 1, '2014-11-14 12:18:22', 1, 0.7),
(73, 298, 10, 3.00, 2, '2014-11-14 12:26:30', 0.1, 0.15),
(74, 299, 19, 70.00, 2, '2014-11-14 12:48:56', 1, 0.5),
(75, 300, 26, 300.00, 2, '2014-11-14 13:09:52', 0.38, 1.75),
(76, 301, 15, 1200.00, 1, '2014-11-14 13:45:15', 4.86, 2.06),
(77, 302, 26, 0.00, 2, '2014-11-14 14:01:05', 0.87, 0.18),
(78, 303, 10, 0.00, 1, '2014-11-14 14:39:23', 0, 0),
(79, 304, 7, 34.00, 1, '2014-11-14 14:52:52', 0.7, 2),
(80, 305, 25, 110.00, 2, '2014-11-14 14:59:09', 1.04, 1.02),
(81, 306, 7, 80.00, 2, '2014-11-14 15:04:40', 0.7, 1.5),
(82, 307, 8, 50.00, 1, '2014-11-14 15:37:08', 0.4, 0.6),
(83, 308, 7, 90.00, 3, '2014-11-17 08:58:30', 0.7, 2),
(84, 309, 7, 17.00, 1, '2014-11-17 09:05:37', 0.7, 1),
(85, 310, 25, 170.00, 1, '2014-11-17 09:54:53', 1, 0.7),
(86, 311, 8, 30.00, 1, '2014-11-17 10:08:22', 0.7, 1),
(87, 312, 7, 50.00, 1, '2014-11-17 10:17:11', 0.7, 3),
(88, 313, 7, 153.00, 3, '2014-11-17 10:42:53', 0.7, 3),
(89, 314, 10, 120.00, 1, '2014-11-17 11:47:53', 0, 0),
(90, 315, 25, 93.00, 1, '2014-11-17 11:53:33', 0.68, 2.72),
(91, 316, 8, 140.00, 3, '2014-11-17 12:04:04', 1, 1),
(92, 317, 12, 30.00, 2, '2014-11-17 12:57:14', 0.2, 0.4),
(93, 318, 25, 120.00, 1, '2014-11-17 13:52:00', 0.6, 1.5),
(94, 319, 11, 25.00, 1, '2014-11-17 14:04:54', 0.4, 0.6),
(95, 320, 12, 50.00, 5, '2014-11-17 14:19:29', 0.21, 0.29),
(96, 321, 8, 45.00, 1, '2014-11-17 14:26:54', 1.2, 1),
(97, 322, 12, 45.00, 1, '2014-11-17 14:54:19', 0.1, 1.22),
(98, 323, 7, 199.00, 1, '2014-11-17 15:09:55', 2, 0.7),
(99, 324, 10, 0.01, 1, '2014-11-17 15:12:38', 0, 0),
(100, 325, 8, 45.00, 1, '2014-11-17 15:17:50', 1, 1.5),
(101, 326, 8, 180.00, 6, '2014-11-17 15:27:44', 1.2, 0.8),
(102, 327, 8, 30.00, 1, '2014-11-17 15:45:39', 1, 0.7),
(103, 328, 22, 1680.00, 1, '2014-11-17 16:13:27', 1, 6),
(104, 329, 8, 45.00, 1, '2014-11-17 16:31:52', 1, 1.5),
(105, 330, 10, 530.00, 1, '2014-11-17 16:43:40', 0, 0),
(106, 331, 10, 0.00, 1, '2014-11-18 08:46:56', 0, 0),
(107, 332, 15, 0.00, 6, '2014-11-18 09:04:58', 0, 0),
(108, 333, 8, 40.00, 1, '2014-11-18 09:47:59', 1, 1.5),
(109, 334, 7, 17.00, 1, '2014-11-18 10:40:01', 0.7, 1),
(110, 335, 8, 45.00, 1, '2014-11-18 10:58:22', 1.2, 1.2),
(111, 336, 31, 2000.00, 10, '2014-11-18 11:10:55', 0.8, 0.55),
(112, 337, 8, 41.90, 1, '2014-11-18 11:20:37', 1.2, 0.9),
(113, 338, 10, 0.00, 1, '2014-11-18 11:46:56', 0, 0),
(114, 339, 8, 20.00, 1, '2014-11-18 13:03:33', 0.4, 0.4),
(115, 340, 8, 30.00, 1, '2014-11-18 13:16:17', 1, 0.7),
(116, 341, 14, 200.00, 1, '2014-11-18 14:09:42', 0, 0),
(117, 342, 15, 800.00, 1, '2014-11-18 14:11:38', 2.7, 1.85),
(118, 343, 10, 50.00, 1, '2014-11-18 14:32:26', 0, 0),
(119, 344, 7, 398.00, 10, '2014-11-18 15:10:00', 3, 0.7),
(120, 345, 26, 4.00, 1, '2014-11-18 15:12:58', 0.05, 0.25),
(121, 346, 7, 284.00, 1, '2014-11-18 15:19:11', 2, 0.7),
(122, 347, 26, 40.00, 1, '2014-11-18 15:41:54', 0.52, 0.55),
(123, 348, 7, 17.00, 1, '2014-11-18 16:04:56', 0.7, 1),
(124, 349, 14, 4590.00, 1, '2014-11-18 16:17:41', 3, 8.44),
(125, 350, 25, 250.00, 1, '2014-11-18 17:03:17', 0.76, 3.66),
(126, 351, 7, 270.00, 3, '2014-11-18 17:20:36', 4.5, 1),
(127, 352, 8, 20.00, 1, '2014-11-19 08:47:48', 0.4, 0.6),
(128, 353, 25, 157.00, 1, '2014-11-19 09:26:56', 1.5, 4.2),
(129, 354, 26, 310.00, 1, '2014-11-19 09:41:50', 0, 0),
(130, 355, 8, 25.00, 1, '2014-11-19 10:19:01', 0.6, 0.7),
(131, 356, 31, 3000.00, 15, '2014-11-19 11:09:09', 0.8, 0.55),
(132, 357, 7, 278.60, 7, '2014-11-19 13:35:34', 0.7, 3),
(133, 358, 10, 30.00, 50, '2014-11-19 13:37:51', 0.5, 0.7),
(134, 359, 10, 40.00, 1, '2014-11-19 13:40:37', 0.4, 0.6),
(135, 360, 14, 240.00, 1, '2014-11-19 13:55:01', 2.3, 1.2),
(136, 361, 8, 30.00, 1, '2014-11-19 14:48:46', 0.7, 1),
(137, 362, 10, 30.00, 12, '2014-11-19 15:00:46', 0.5, 1),
(138, 363, 10, 95.00, 1, '2014-11-20 09:50:43', 0, 0),
(139, 364, 28, 400.00, 1, '2014-11-20 09:51:45', 0, 0),
(140, 365, 23, 324.00, 1, '2014-11-20 10:14:43', 4, 2.7),
(141, 366, 28, 200.00, 1, '2014-11-20 10:36:10', 1.4, 1),
(142, 367, 26, 0.00, 1, '2014-11-20 10:49:19', 0, 0),
(143, 368, 11, 100.00, 1, '2014-11-20 11:13:58', 0.4, 0.6),
(144, 369, 10, 60.00, 30, '2014-11-20 11:40:03', 0.15, 0.08),
(145, 370, 22, 2900.00, 1, '2014-11-20 12:06:35', 1.1, 5.99),
(146, 371, 26, 15.00, 4, '2014-11-20 13:19:02', 0.49, 0.05),
(147, 372, 23, 62.00, 1, '2014-11-20 13:31:43', 0.5, 4.95),
(148, 373, 10, 15.00, 1, '2014-11-20 13:52:14', 0.3, 0.15),
(149, 374, 8, 30.00, 1, '2014-11-20 14:38:43', 1, 0.7),
(150, 375, 7, 121.50, 1, '2014-11-20 16:39:03', 1, 4.5),
(151, 376, 27, 560.00, 1, '2014-11-20 16:50:37', 3.65, 2.1),
(152, 377, 31, 0.00, 1, '2014-11-20 17:07:34', 6.2, 1.3),
(153, 378, 7, 68.00, 1, '2014-11-21 08:37:55', 0.7, 4),
(154, 379, 7, 51.00, 1, '2014-11-21 08:42:29', 0.7, 3),
(155, 380, 8, 40.00, 1, '2014-11-21 09:02:46', 1.2, 0.8),
(156, 381, 7, 597.00, 15, '2014-11-21 10:29:59', 0.7, 3),
(157, 382, 8, 30.00, 1, '2014-11-21 10:42:44', 1, 0.7),
(158, 383, 8, 30.00, 1, '2014-11-21 12:09:06', 1, 0.7),
(159, 384, 26, 20.00, 1, '2014-11-21 12:11:00', 1.07, 0.17),
(160, 385, 8, 756.00, 120, '2014-11-21 12:15:31', 1, 0.7),
(161, 386, 7, 0.00, 2, '2014-11-21 14:01:53', 0.7, 2),
(162, 387, 19, 70.00, 2, '2014-11-21 14:49:39', 1, 0.5),
(163, 388, 22, 0.00, 1, '2014-11-21 15:04:03', 3.97, 4),
(164, 389, 26, 0.00, 1, '2014-11-21 15:15:30', 0, 0),
(165, 390, 26, 4.50, 2, '2014-11-21 16:07:05', 0.3, 0.5),
(166, 391, 7, 97.00, 1, '2014-11-21 16:35:22', 4.5, 0.8),
(167, 392, 22, 1700.00, 1, '2014-11-21 16:53:33', 1, 4.35),
(168, 393, 8, 30.00, 1, '2014-11-21 17:20:23', 1, 0.7),
(169, 394, 26, 25.00, 1, '2014-11-22 09:40:39', 0.2, 0.3),
(170, 395, 26, 25.00, 1, '2014-11-22 09:57:36', 0.2, 0.3),
(171, 396, 7, 34.00, 2, '2014-11-22 10:31:08', 0.7, 1),
(172, 397, 8, 30.00, 1, '2014-11-24 09:04:05', 1.2, 0.8),
(173, 398, 26, 0.00, 1, '2014-11-24 09:06:07', 0.4, 0.16),
(174, 399, 26, 0.00, 1, '2014-11-24 10:16:22', 0, 0),
(175, 400, 25, 125.00, 1, '2014-11-24 11:09:58', 4.66, 0.9),
(176, 401, 8, 120.00, 1, '2014-11-24 11:33:38', 2, 2),
(177, 402, 8, 0.00, 1, '2014-11-24 12:07:47', 0.85, 0.65),
(178, 403, 7, 0.00, 1, '2014-11-24 12:23:24', 0.7, 3),
(179, 404, 11, 25.00, 1, '2014-11-24 12:52:04', 0.4, 0.6),
(180, 405, 7, 34.00, 1, '2014-11-24 15:07:20', 0.7, 2),
(181, 406, 7, 78.00, 2, '2014-11-24 15:17:58', 0.7, 2),
(182, 407, 7, 0.00, 1, '2014-11-24 16:01:52', 4.5, 1),
(183, 408, 15, 3000.00, 3, '2014-11-24 16:23:44', 3.1, 3.36),
(184, 409, 7, 0.00, 2, '2014-11-24 18:03:29', 1.5, 1),
(185, 410, 8, 70.00, 2, '2014-11-24 18:07:46', 0.9, 0.7),
(186, 411, 7, 115.26, 1, '2014-11-25 08:55:03', 4, 0.7),
(187, 412, 22, 4370.00, 1, '2014-11-25 09:27:53', 8.23, 1.2),
(188, 413, 18, 1300.00, 1, '2014-11-25 10:13:21', 1.2, 7.7),
(189, 414, 10, 0.00, 1, '2014-11-25 11:10:28', 0.47, 1),
(190, 415, 8, 40.00, 1, '2014-11-25 12:01:30', 1.2, 0.8),
(191, 416, 26, 0.00, 1, '2014-11-25 12:22:27', 0.1, 0),
(192, 417, 8, 35.00, 1, '2014-11-25 13:38:14', 1.2, 0.8),
(193, 418, 7, 94.50, 1, '2014-11-25 14:12:29', 0.9, 3.5),
(194, 419, 7, 60.00, 1, '2014-11-25 14:42:34', 0.5, 2),
(195, 420, 7, 17.00, 1, '2014-11-25 14:53:18', 1, 0.7),
(196, 421, 26, 17.00, 9, '2014-11-25 14:56:08', 0, 0),
(197, 422, 25, 500.00, 1, '2014-11-25 16:04:53', 2, 1),
(198, 423, 7, 17.00, 1, '2014-11-25 16:25:56', 0.7, 1),
(199, 424, 7, 0.00, 4, '2014-11-25 16:59:08', 0.8, 0.6);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tipoproduto`
--

CREATE TABLE IF NOT EXISTS `tipoproduto` (
  `tipoprodutoID` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` varchar(100) NOT NULL,
  `data` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `tipoAtivo` varchar(1) NOT NULL DEFAULT 'S',
  PRIMARY KEY (`tipoprodutoID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Extraindo dados da tabela `tipoproduto`
--

INSERT INTO `tipoproduto` (`tipoprodutoID`, `tipo`, `data`, `tipoAtivo`) VALUES
(1, 'Materiais', '2014-08-30 15:51:27', 'S');

-- --------------------------------------------------------

--
-- Estrutura da tabela `transferenciaestoque`
--

CREATE TABLE IF NOT EXISTS `transferenciaestoque` (
  `transferenciaID` int(11) NOT NULL AUTO_INCREMENT,
  `usuarioID` int(11) NOT NULL,
  `empresaID` int(11) NOT NULL COMMENT 'Empresa que será retirada essa quantidade',
  `origemID` int(11) NOT NULL COMMENT 'Empresa onde será depositada a quantidade que foi retirada',
  `destinoID` int(11) NOT NULL,
  `quantidade` float(10,2) NOT NULL,
  `data` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`transferenciaID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Extraindo dados da tabela `transferenciaestoque`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `transferencias`
--

CREATE TABLE IF NOT EXISTS `transferencias` (
  `transferenciaID` int(11) NOT NULL AUTO_INCREMENT,
  `bancoDe` int(11) NOT NULL,
  `bancoPara` int(11) NOT NULL,
  `valor` float(10,2) NOT NULL,
  `observacoes` text NOT NULL,
  `data` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `empresaID` int(11) NOT NULL,
  PRIMARY KEY (`transferenciaID`),
  KEY `empresaID` (`empresaID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Extraindo dados da tabela `transferencias`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario`
--

CREATE TABLE IF NOT EXISTS `usuario` (
  `usuarioID` int(11) NOT NULL AUTO_INCREMENT,
  `funcionarioID` int(11) NOT NULL,
  `usuarioNome` varchar(50) NOT NULL,
  `usuarioTelefone` varchar(15) NOT NULL,
  `usuarioEmail` varchar(100) NOT NULL,
  `usuarioLogin` varchar(20) NOT NULL,
  `usuarioSenha` varchar(20) NOT NULL,
  `usuarioNivel` int(11) NOT NULL,
  `usuarioData` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `usuarioAtivo` varchar(1) NOT NULL DEFAULT 'S',
  `empresaID` int(11) NOT NULL,
  PRIMARY KEY (`usuarioID`),
  KEY `empresaID` (`empresaID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=52 ;

--
-- Extraindo dados da tabela `usuario`
--

INSERT INTO `usuario` (`usuarioID`, `funcionarioID`, `usuarioNome`, `usuarioTelefone`, `usuarioEmail`, `usuarioLogin`, `usuarioSenha`, `usuarioNivel`, `usuarioData`, `usuarioAtivo`, `empresaID`) VALUES
(8, 8, 'Patricia Santana', '', '', 'patricia', '114757', 1, '2014-10-10 13:19:03', 'S', 1),
(11, 14, 'uilian Saldanha Lima', '', '', 'Uilian', '21dejulho', 4, '2014-10-13 11:35:07', 'S', 1),
(12, 11, 'Felipe César Ferraz', '', '', 'felipe', 'felipeferrazo', 3, '2014-10-13 11:36:04', 'S', 1),
(13, 12, 'Priscila Fernandes Schumacher', '', '', 'Priscila', 'priscilafs', 3, '2014-10-13 11:36:46', 'S', 1),
(14, 16, 'Gabriela Cristina Silva', '', '', 'gabriela', '040985', 2, '2014-10-13 11:37:55', 'S', 1),
(15, 10, 'Carina Mei Asada', '', '', 'camei', 'mei2014', 3, '2014-10-13 11:55:28', 'S', 1),
(16, 13, 'ALAN DOS SANTOS', '', '', 'alan', 'alan2014', 5, '2014-10-16 11:52:51', 'S', 1),
(17, 15, 'Marcelo Soares Correia', '', '', 'marcelo', 'marcelo2014', 5, '2014-10-16 16:24:47', 'S', 1),
(23, 17, 'CLEBER DAVID DE BARROS VIEIRA', '', '', 'cleber', 'cleberdavid', 7, '2014-10-27 10:29:42', 'S', 1),
(24, 18, 'Edison Perpetuo Rodrigues', '', '', 'Edison', 'edisonmax', 6, '2014-10-27 11:24:07', 'S', 1),
(25, 20, 'Rogerio Matavelli', '', '', 'Rogerio', 'mixmax02', 1, '2014-11-03 14:36:37', 'S', 1),
(31, 23, 'André Luiz Pereira Godoy', '', '', 'Andre', 'andre2014', 8, '2014-11-07 15:40:38', 'S', 1),
(32, 19, 'DIEGO FELIPE MAINARDI', '', '', 'Diego', 'diego2014', 8, '2014-11-07 15:43:24', 'S', 1),
(33, 21, 'Felipe Souza do Carmo', '', '', 'Felipe Souza', 'felipe2015', 5, '2014-11-07 15:48:20', 'S', 1),
(34, 25, 'JOABES DE OLIVEIRA CERQUEIRA', '', '', 'Joabes', 'Joabes2015', 6, '2014-11-07 15:49:33', 'S', 1),
(35, 22, 'José Claudio Pereira Gomes', '', '', 'Claudio', 'claudio2015', 5, '2014-11-07 15:50:28', 'S', 1),
(36, 24, 'José Nilson de Oliveira', '', '', 'Zeca', 'zeca2015', 8, '2014-11-07 15:51:33', 'S', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `veiculo`
--

CREATE TABLE IF NOT EXISTS `veiculo` (
  `veiculoID` int(11) NOT NULL AUTO_INCREMENT,
  `clienteID` int(11) NOT NULL,
  `veiculo` varchar(30) NOT NULL,
  `cor` varchar(20) NOT NULL,
  `placa` varchar(8) NOT NULL,
  `data` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `veiculoAtivo` varchar(1) NOT NULL DEFAULT 'S',
  PRIMARY KEY (`veiculoID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Extraindo dados da tabela `veiculo`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `venda`
--

CREATE TABLE IF NOT EXISTS `venda` (
  `vendaID` int(11) NOT NULL AUTO_INCREMENT,
  `clienteID` int(11) NOT NULL,
  `formPagID` int(11) NOT NULL,
  `valor` float(10,2) NOT NULL,
  `entrada` float(10,2) NOT NULL,
  `troco` float(10,2) NOT NULL,
  `vezes` int(11) NOT NULL,
  `desconto` float(10,2) NOT NULL,
  `notaFiscal` varchar(20) NOT NULL,
  `data` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `usuario` varchar(50) NOT NULL,
  `status` varchar(1) NOT NULL DEFAULT '1',
  `empresaID` int(11) NOT NULL,
  PRIMARY KEY (`vendaID`),
  KEY `empresaID` (`empresaID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Extraindo dados da tabela `venda`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `vendaitem`
--

CREATE TABLE IF NOT EXISTS `vendaitem` (
  `itemID` int(11) NOT NULL AUTO_INCREMENT,
  `vendaID` int(11) NOT NULL,
  `produtoID` int(11) NOT NULL,
  `quantidade` float(10,2) NOT NULL,
  `valor` float(10,2) NOT NULL,
  `total` float(10,2) NOT NULL,
  PRIMARY KEY (`itemID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Extraindo dados da tabela `vendaitem`
--


--
-- Restrições para as tabelas dumpadas
--

--
-- Restrições para a tabela `cheques`
--
ALTER TABLE `cheques`
  ADD CONSTRAINT `cheques_ibfk_1` FOREIGN KEY (`empresaID`) REFERENCES `empresa` (`empresaID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para a tabela `contapagar`
--
ALTER TABLE `contapagar`
  ADD CONSTRAINT `contapagar_ibfk_1` FOREIGN KEY (`empresaID`) REFERENCES `empresa` (`empresaID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para a tabela `estoque`
--
ALTER TABLE `estoque`
  ADD CONSTRAINT `estoque_ibfk_1` FOREIGN KEY (`empresaID`) REFERENCES `empresa` (`empresaID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para a tabela `fornecedor`
--
ALTER TABLE `fornecedor`
  ADD CONSTRAINT `fornecedor_ibfk_1` FOREIGN KEY (`empresaID`) REFERENCES `empresa` (`empresaID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para a tabela `funcionario`
--
ALTER TABLE `funcionario`
  ADD CONSTRAINT `funcionario_ibfk_1` FOREIGN KEY (`cargoID`) REFERENCES `cargo` (`cargoID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `funcionario_ibfk_2` FOREIGN KEY (`empresaID`) REFERENCES `empresa` (`empresaID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para a tabela `lancamentos`
--
ALTER TABLE `lancamentos`
  ADD CONSTRAINT `lancamentos_ibfk_1` FOREIGN KEY (`empresaID`) REFERENCES `empresa` (`empresaID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para a tabela `orcamento`
--
ALTER TABLE `orcamento`
  ADD CONSTRAINT `orcamento_ibfk_1` FOREIGN KEY (`empresaID`) REFERENCES `empresa` (`empresaID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para a tabela `pagar`
--
ALTER TABLE `pagar`
  ADD CONSTRAINT `pagar_ibfk_1` FOREIGN KEY (`empresaID`) REFERENCES `empresa` (`empresaID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para a tabela `receber`
--
ALTER TABLE `receber`
  ADD CONSTRAINT `receber_ibfk_1` FOREIGN KEY (`empresaID`) REFERENCES `empresa` (`empresaID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para a tabela `retiradas`
--
ALTER TABLE `retiradas`
  ADD CONSTRAINT `retiradas_ibfk_1` FOREIGN KEY (`empresaID`) REFERENCES `empresa` (`empresaID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para a tabela `retiradasestoque`
--
ALTER TABLE `retiradasestoque`
  ADD CONSTRAINT `retiradasestoque_ibfk_1` FOREIGN KEY (`empresaID`) REFERENCES `empresa` (`empresaID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para a tabela `servicoitem`
--
ALTER TABLE `servicoitem`
  ADD CONSTRAINT `servicoitem_ibfk_1` FOREIGN KEY (`servicoID`) REFERENCES `servico` (`servicoID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para a tabela `servicoproduto`
--
ALTER TABLE `servicoproduto`
  ADD CONSTRAINT `servicoproduto_ibfk_1` FOREIGN KEY (`servicoID`) REFERENCES `servico` (`servicoID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para a tabela `transferencias`
--
ALTER TABLE `transferencias`
  ADD CONSTRAINT `transferencias_ibfk_1` FOREIGN KEY (`empresaID`) REFERENCES `empresa` (`empresaID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para a tabela `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`empresaID`) REFERENCES `empresa` (`empresaID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para a tabela `venda`
--
ALTER TABLE `venda`
  ADD CONSTRAINT `venda_ibfk_1` FOREIGN KEY (`empresaID`) REFERENCES `empresa` (`empresaID`) ON DELETE CASCADE ON UPDATE CASCADE;
