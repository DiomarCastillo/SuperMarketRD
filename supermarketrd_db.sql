-- phpMyAdmin SQL Dump
-- version 4.8.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 02-05-2020 a las 13:00:40
-- Versión del servidor: 10.1.31-MariaDB
-- Versión de PHP: 7.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `supermarketrd_db`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `compra` (`id` INT, `cant` INT)  BEGIN
UPDATE stock
SET cantidad=cantidad+cant
WHERE id_producto=id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `venta` (`id` INT, `cant` INT)  BEGIN
UPDATE stock
SET cantidad=cantidad-cant
WHERE id_producto=id;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `id_cliente` int(11) NOT NULL,
  `nombre_cliente` varchar(255) NOT NULL,
  `cedula_cliente` varchar(50) NOT NULL,
  `rnc_cliente` varchar(20) NOT NULL,
  `telefono_cliente` char(30) NOT NULL,
  `email_cliente` varchar(64) NOT NULL,
  `direccion_cliente` varchar(255) NOT NULL,
  `status_cliente` tinyint(4) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id_cliente`, `nombre_cliente`, `cedula_cliente`, `rnc_cliente`, `telefono_cliente`, `email_cliente`, `direccion_cliente`, `status_cliente`, `date_added`) VALUES
(1, 'Andy', '402-1194688-2', '101589920', '809-235-8525', 'andy@gmail.com', 'Calle primera, La nueva barquita', 1, '2020-04-25 22:09:30'),
(2, 'Juan', '001-2585577-1', '', '809-899-2551', 'juan01@gmail.com', 'Calle principal, Los Molinos', 1, '2020-04-25 22:09:52'),
(3, 'Pedro', '402-1194277-4', '', '829-315-7005', 'pm@hotmail.com', 'Calle A, Villa Duarte', 1, '2020-04-26 10:24:08'),
(4, 'Bruno', '001-2458877-2', '100503890', '849-770-9901', 'bruno@hotmail.com', 'Calle juan vasquez #10, Los Prados', 1, '2020-04-26 18:51:47'),
(8, 'Maria ', '001-1236998-1', '101509530', '849-852-9874', 'Maria@gmail.com', 'Calle Primera, Los Mina', 1, '2020-05-01 21:02:21'),
(7, 'Mauricio', '001-1237899-9', '', '849-789-9998', 'Mauricio@gmail.com', 'Calle Fernandez #30, Los minas', 1, '2020-04-29 19:14:19');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compras`
--

CREATE TABLE `compras` (
  `id_compra` int(11) NOT NULL,
  `numero_compra` int(11) NOT NULL,
  `fecha_compra` datetime NOT NULL,
  `id_proveedor` int(11) NOT NULL,
  `id_vendedor` int(11) NOT NULL,
  `condiciones` varchar(30) NOT NULL,
  `total_compra` varchar(30) NOT NULL,
  `estado_compra` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `compras`
--

INSERT INTO `compras` (`id_compra`, `numero_compra`, `fecha_compra`, `id_proveedor`, `id_vendedor`, `condiciones`, `total_compra`, `estado_compra`) VALUES
(1, 1, '2020-04-26 00:00:00', 1, 1, '1', '118', 1),
(2, 2, '2020-04-26 17:34:44', 0, 1, '1', '129.8', 1),
(3, 3, '2020-04-26 17:35:47', 0, 1, '1', '118', 1),
(4, 4, '2020-04-26 17:36:17', 0, 1, '1', '59', 1),
(5, 5, '2020-04-26 17:39:07', 0, 1, '1', '118', 1),
(6, 6, '2020-04-26 17:41:10', 0, 1, '1', '118', 1),
(7, 7, '2020-04-26 17:43:03', 1, 1, '1', '129.8', 1),
(8, 8, '2020-04-26 17:44:50', 1, 1, '1', '59', 1),
(9, 9, '2020-04-26 17:50:47', 1, 1, '1', '129.8', 1),
(10, 10, '2020-04-26 17:52:33', 1, 1, '1', '59', 1),
(13, 11, '2020-04-26 22:04:59', 2, 1, '1', '359.9', 1),
(14, 12, '2020-04-26 22:16:09', 2, 1, '1', '171.1', 1),
(15, 13, '2020-04-26 23:19:46', 3, 1, '1', '129.8', 1),
(16, 14, '2020-04-27 23:01:54', 1, 2, '1', '2360', 1),
(17, 15, '2020-04-27 23:07:36', 1, 2, '1', '1298', 1),
(18, 16, '2020-04-27 23:08:26', 1, 2, '1', '1298', 1),
(19, 17, '2020-04-27 23:12:31', 2, 2, '1', '590', 1),
(20, 18, '2020-04-28 00:21:30', 2, 2, '1', '1770', 1),
(21, 19, '2020-04-28 17:51:58', 2, 2, '1', '354', 1),
(22, 20, '2020-04-28 17:56:08', 1, 2, '1', '1770', 1),
(23, 21, '2020-05-01 11:21:13', 2, 2, '1', '3540', 1),
(24, 22, '2020-05-01 11:21:54', 6, 2, '1', '1770', 1),
(25, 23, '2020-05-01 21:46:18', 2, 1, '1', '1180', 1),
(26, 24, '2020-05-01 21:48:17', 6, 1, '1', '88500', 1),
(27, 25, '2020-05-01 21:53:54', 1, 1, '1', '560.5', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_compra`
--

CREATE TABLE `detalle_compra` (
  `id_detalle` int(11) NOT NULL,
  `numero_compra` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precio_compra` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `detalle_compra`
--

INSERT INTO `detalle_compra` (`id_detalle`, `numero_compra`, `id_producto`, `cantidad`, `precio_compra`) VALUES
(1, 1, 1, 1, 118),
(2, 2, 3, 1, 110),
(3, 3, 1, 1, 100),
(4, 4, 2, 1, 50),
(5, 5, 1, 1, 100),
(6, 6, 1, 1, 100),
(7, 7, 3, 1, 110),
(8, 8, 2, 1, 50),
(9, 9, 3, 1, 110),
(10, 10, 2, 1, 50),
(21, 11, 4, 1, 95),
(22, 11, 3, 1, 110),
(23, 11, 1, 1, 100),
(24, 12, 2, 1, 50),
(25, 12, 4, 1, 95),
(26, 13, 3, 1, 110),
(27, 14, 5, 10, 200),
(28, 15, 3, 10, 110),
(29, 16, 3, 10, 110),
(30, 17, 2, 10, 50),
(31, 18, 3, 10, 150),
(32, 19, 2, 6, 50),
(33, 20, 3, 10, 150),
(34, 21, 4, 10, 210),
(35, 21, 1, 5, 100),
(36, 21, 2, 8, 50),
(37, 22, 3, 10, 150),
(38, 23, 1, 10, 100),
(39, 24, 5, 10, 7500),
(40, 25, 6, 5, 95);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_factura`
--

CREATE TABLE `detalle_factura` (
  `id_detalle` int(11) NOT NULL,
  `numero_factura` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precio_venta` double NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `detalle_factura`
--

INSERT INTO `detalle_factura` (`id_detalle`, `numero_factura`, `id_producto`, `cantidad`, `precio_venta`) VALUES
(1, 1, 1, 2, 100),
(3, 2, 1, 2, 100),
(4, 2, 1, 2, 100),
(5, 3, 1, 1, 100),
(7, 4, 3, 2, 110),
(8, 4, 3, 2, 110),
(9, 5, 1, 3, 100),
(10, 5, 1, 3, 100),
(11, 5, 1, 1, 100),
(12, 6, 2, 1, 50),
(13, 7, 1, 5, 100),
(14, 8, 1, 1, 100),
(15, 9, 1, 1, 100),
(16, 10, 3, 1, 110),
(17, 11, 1, 1, 100),
(18, 12, 1, 1, 100),
(19, 13, 2, 2, 50),
(20, 13, 1, 2, 100),
(21, 14, 1, 1, 100),
(22, 15, 1, 1, 100),
(23, 15, 2, 1, 50),
(24, 15, 2, 1, 50),
(25, 15, 2, 1, 50),
(26, 15, 2, 1, 50),
(27, 15, 2, 1, 50),
(28, 15, 2, 1, 50),
(29, 15, 2, 1, 50),
(30, 15, 3, 1, 110),
(31, 15, 3, 1, 110),
(32, 15, 3, 1, 110),
(33, 15, 2, 1, 50),
(34, 15, 3, 1, 110),
(35, 15, 1, 1, 100),
(36, 15, 1, 1, 100),
(37, 15, 2, 1, 50),
(38, 15, 3, 1, 110),
(39, 15, 3, 1, 110),
(40, 15, 3, 1, 110),
(41, 15, 1, 1, 100),
(42, 16, 1, 1, 100),
(43, 16, 2, 1, 50),
(44, 16, 3, 1, 110),
(45, 16, 2, 1, 50),
(46, 16, 3, 1, 110),
(47, 17, 3, 1, 110),
(48, 17, 2, 1, 50),
(49, 17, 2, 1, 50),
(50, 18, 1, 1, 100),
(51, 19, 1, 1, 100),
(52, 19, 3, 1, 110),
(53, 19, 4, 1, 95),
(54, 19, 4, 1, 95),
(55, 19, 4, 1, 95),
(56, 19, 5, 1, 200),
(57, 19, 5, 1, 200),
(58, 19, 5, 1, 200),
(59, 19, 5, 1, 200),
(60, 19, 5, 1, 200),
(61, 19, 5, 1, 200),
(62, 19, 5, 1, 200),
(63, 20, 1, 1, 100),
(64, 20, 1, 1, 100),
(65, 20, 1, 1, 100),
(66, 20, 1, 1, 100),
(67, 20, 1, 5, 100),
(68, 20, 1, 1, 100),
(69, 20, 1, 1, 100),
(70, 20, 1, 1, 100),
(71, 20, 1, 1, 100),
(72, 20, 1, 1, 100),
(73, 20, 1, 1, 100),
(74, 20, 1, 1, 100),
(75, 20, 1, 1, 100),
(76, 20, 1, 1, 100),
(77, 20, 1, 1, 100),
(78, 20, 2, 1, 50),
(79, 20, 2, 1, 50),
(80, 20, 2, 1, 50),
(81, 20, 2, 1, 50),
(82, 20, 2, 1, 50),
(83, 20, 2, 1, 50),
(84, 20, 2, 1, 50),
(85, 20, 2, 1, 50),
(86, 20, 2, 1, 50),
(87, 20, 2, 1, 50),
(88, 20, 2, 1, 50),
(89, 20, 2, 1, 50),
(90, 20, 3, 1, 110),
(91, 20, 3, 1, 110),
(92, 20, 3, 1, 110),
(93, 20, 3, 1, 110),
(94, 20, 3, 1, 110),
(95, 20, 3, 1, 110),
(96, 20, 3, 1, 110),
(97, 20, 3, 1, 110),
(98, 20, 3, 1, 110),
(99, 20, 3, 1, 110),
(100, 20, 3, 1, 110),
(101, 20, 3, 1, 110),
(102, 20, 3, 1, 110),
(103, 20, 3, 1, 110),
(104, 20, 3, 1, 110),
(105, 20, 3, 1, 110),
(106, 20, 3, 1, 110),
(107, 20, 3, 1, 110),
(108, 20, 3, 1, 110),
(109, 20, 3, 1, 110),
(110, 20, 3, 1, 110),
(111, 20, 3, 1, 110),
(112, 20, 3, 1, 110),
(113, 20, 3, 1, 110),
(114, 20, 3, 1, 110),
(115, 20, 3, 1, 110),
(116, 20, 3, 1, 110),
(117, 20, 3, 1, 110),
(118, 20, 3, 1, 110),
(119, 20, 3, 1, 110),
(120, 20, 3, 1, 110),
(121, 20, 3, 1, 110),
(122, 20, 3, 1, 110),
(123, 20, 3, 1, 110),
(124, 20, 3, 1, 110),
(125, 20, 3, 1, 110),
(126, 20, 3, 1, 110),
(127, 20, 3, 1, 110),
(128, 20, 3, 1, 110),
(129, 20, 3, 1, 110),
(130, 20, 3, 1, 110),
(131, 20, 3, 1, 110),
(132, 20, 3, 1, 110),
(133, 20, 3, 1, 110),
(134, 20, 4, 1, 95),
(135, 20, 4, 1, 95),
(136, 20, 4, 1, 95),
(137, 20, 4, 1, 95),
(138, 20, 4, 1, 95),
(139, 20, 4, 1, 95),
(140, 20, 4, 1, 95),
(141, 20, 4, 1, 95),
(142, 20, 4, 1, 95),
(143, 20, 5, 1, 200),
(144, 20, 5, 1, 200),
(145, 20, 5, 1, 200),
(146, 20, 5, 1, 200),
(147, 20, 5, 1, 200),
(148, 20, 5, 1, 200),
(149, 20, 5, 1, 200),
(150, 20, 5, 1, 200),
(151, 20, 5, 1, 200),
(152, 20, 5, 1, 200),
(153, 20, 5, 1, 200),
(154, 20, 5, 1, 200),
(155, 20, 5, 1, 200),
(156, 20, 5, 1, 200),
(157, 20, 5, 1, 200),
(158, 20, 5, 1, 200),
(159, 20, 5, 1, 200),
(160, 20, 5, 1, 200),
(161, 20, 5, 1, 200),
(162, 20, 5, 1, 200),
(163, 20, 5, 1, 200),
(164, 20, 5, 1, 200),
(165, 20, 5, 1, 200),
(166, 20, 5, 1, 200),
(167, 20, 5, 1, 200),
(168, 20, 5, 1, 200),
(169, 20, 5, 1, 200),
(170, 20, 5, 1, 200),
(171, 20, 5, 1, 200),
(172, 20, 5, 1, 200),
(173, 20, 5, 1, 200),
(174, 20, 5, 1, 200),
(175, 20, 5, 1, 200),
(176, 20, 5, 1, 200),
(177, 20, 5, 1, 200),
(178, 20, 5, 1, 200),
(179, 20, 5, 1, 200),
(180, 20, 5, 1, 200),
(181, 20, 5, 1, 200),
(182, 20, 5, 1, 200),
(183, 20, 5, 1, 200),
(184, 20, 5, 1, 200),
(185, 20, 5, 1, 200),
(186, 20, 5, 1, 200),
(187, 20, 5, 1, 200),
(188, 20, 5, 1, 200),
(189, 20, 5, 1, 200),
(190, 20, 5, 1, 200),
(191, 20, 5, 1, 200),
(192, 20, 5, 1, 200),
(193, 20, 5, 1, 200),
(194, 20, 5, 1, 200),
(195, 20, 5, 1, 200),
(196, 21, 3, 1, 110),
(197, 22, 1, 1, 100),
(198, 23, 4, 1, 95),
(199, 23, 4, 1, 95),
(200, 24, 3, 1, 110),
(201, 25, 2, 5, 50),
(202, 25, 1, 3, 100),
(203, 26, 1, 1, 100),
(204, 27, 2, 2, 50),
(205, 28, 1, 5, 100),
(212, 29, 1, 2, 100),
(213, 30, 2, 2, 50),
(214, 30, 3, 1, 150),
(211, 29, 2, 1, 50),
(215, 29, 4, 1, 210),
(216, 31, 1, 1, 100),
(217, 31, 4, 1, 210),
(218, 32, 4, 1, 210),
(219, 33, 3, 1, 150),
(220, 33, 2, 1, 50);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `facturas`
--

CREATE TABLE `facturas` (
  `id_factura` int(11) NOT NULL,
  `numero_factura` int(11) NOT NULL,
  `fecha_factura` datetime NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `id_vendedor` int(11) NOT NULL,
  `condiciones` varchar(30) NOT NULL,
  `total_venta` varchar(20) NOT NULL,
  `estado_factura` tinyint(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `facturas`
--

INSERT INTO `facturas` (`id_factura`, `numero_factura`, `fecha_factura`, `id_cliente`, `id_vendedor`, `condiciones`, `total_venta`, `estado_factura`) VALUES
(1, 1, '2020-04-25 22:11:02', 1, 1, '1', '226', 1),
(2, 2, '2020-04-25 22:12:47', 2, 1, '1', '226', 1),
(3, 3, '2020-04-25 22:14:39', 1, 1, '1', '113', 1),
(4, 4, '2020-04-25 22:45:15', 2, 1, '1', '248.6', 1),
(5, 5, '2020-04-25 22:53:46', 1, 1, '1', '452', 1),
(6, 6, '2020-04-25 23:02:14', 2, 1, '1', '56.5', 1),
(7, 7, '2020-04-25 23:04:16', 1, 1, '1', '565', 1),
(8, 8, '2020-04-25 23:43:31', 1, 1, '1', '118', 1),
(9, 9, '2020-04-25 23:57:51', 0, 1, '1', '118', 1),
(10, 10, '2020-04-25 23:58:11', 0, 1, '1', '129.8', 1),
(11, 11, '2020-04-26 00:00:02', 0, 1, '1', '118', 1),
(12, 12, '2020-04-26 10:26:48', 3, 1, '1', '118', 1),
(13, 13, '2020-04-26 10:32:36', 1, 1, '1', '354', 1),
(14, 14, '2020-04-26 10:38:23', 3, 1, '1', '118', 1),
(15, 15, '2020-04-26 13:29:19', 3, 1, '1', '1911.6', 1),
(16, 16, '2020-04-26 13:31:20', 1, 1, '1', '495.6', 1),
(17, 17, '2020-04-26 17:30:48', 0, 1, '1', '247.8', 1),
(18, 18, '2020-04-26 17:32:22', 0, 1, '1', '118', 1),
(19, 19, '2020-04-26 19:52:09', 2, 1, '1', '2236.1', 1),
(20, 20, '2020-04-26 22:04:16', 2, 1, '1', '22178.1', 1),
(21, 21, '2020-04-26 23:19:05', 2, 1, '1', '129.8', 1),
(22, 22, '2020-04-27 19:42:15', 2, 5, '1', '118', 1),
(23, 23, '2020-04-27 19:42:36', 2, 5, '1', '224.2', 1),
(24, 24, '2020-04-27 19:43:19', 2, 5, '1', '129.8', 1),
(25, 25, '2020-04-27 23:06:41', 1, 2, '1', '649', 1),
(26, 26, '2020-04-27 23:16:43', 2, 2, '1', '118', 1),
(27, 27, '2020-04-28 00:23:11', 1, 2, '1', '118', 1),
(28, 28, '2020-04-28 17:58:29', 1, 2, '1', '590', 1),
(33, 30, '2020-05-01 21:33:44', 1, 4, '1', '295', 1),
(32, 29, '2020-05-01 21:32:57', 4, 4, '1', '542.8', 1),
(34, 31, '2020-05-01 21:34:51', 2, 4, '1', '365.8', 1),
(35, 32, '2020-05-01 21:42:33', 7, 4, '1', '247.8', 1),
(36, 33, '2020-05-01 21:43:00', 8, 4, '1', '236', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `perfil`
--

CREATE TABLE `perfil` (
  `id_perfil` int(11) NOT NULL,
  `nombre_empresa` varchar(150) NOT NULL,
  `direccion` varchar(255) NOT NULL,
  `ciudad` varchar(100) NOT NULL,
  `codigo_postal` varchar(100) NOT NULL,
  `estado` varchar(100) NOT NULL,
  `telefono` varchar(20) NOT NULL,
  `email` varchar(64) NOT NULL,
  `impuesto` int(2) NOT NULL,
  `rnc` varchar(20) NOT NULL,
  `logo_url` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `perfil`
--

INSERT INTO `perfil` (`id_perfil`, `nombre_empresa`, `direccion`, `ciudad`, `codigo_postal`, `estado`, `telefono`, `email`, `impuesto`, `rnc`, `logo_url`) VALUES
(1, 'SuperMarketRD', 'Calle Mexico. Los prados #105', 'Distrito Nacional', '11807', 'Santo Domingo', '809-247-9890', 'diomarcastillocolon@gmail.com', 18, '101532483', 'img/1587871499_Login1.png');

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `producto`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `producto` (
`id_producto` int(11)
,`nombre_producto` char(255)
,`status_producto` tinyint(4)
,`date_added` datetime
,`precio_producto` double
,`cantidad` int(10)
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id_producto` int(11) NOT NULL,
  `nombre_producto` char(255) NOT NULL,
  `status_producto` tinyint(4) NOT NULL,
  `date_added` datetime NOT NULL,
  `precio_producto` double NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id_producto`, `nombre_producto`, `status_producto`, `date_added`, `precio_producto`) VALUES
(1, 'Azucar', 1, '2020-04-25 22:10:06', 100),
(2, 'Leche', 1, '2020-04-25 22:43:39', 50),
(3, 'Queso', 1, '2020-04-28 00:19:38', 150),
(4, 'Arroz de 25Lbs', 1, '2020-04-29 19:11:55', 210),
(5, 'Bacteria Trojan', 1, '2020-05-01 21:47:07', 7500),
(6, 'Refresco Kola Real', 1, '2020-05-01 21:51:47', 95);

--
-- Disparadores `productos`
--
DELIMITER $$
CREATE TRIGGER `nuevo_producto` AFTER INSERT ON `productos` FOR EACH ROW BEGIN
    
        INSERT INTO stock(id_producto, cantidad)
        VALUES(NEW.id_producto,0);
 
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedores`
--

CREATE TABLE `proveedores` (
  `id_proveedor` int(11) NOT NULL,
  `nombre_proveedor` varchar(50) NOT NULL,
  `rnc_proveedor` varchar(20) NOT NULL,
  `telefono_proveedor` char(30) NOT NULL,
  `email_proveedor` varchar(65) NOT NULL,
  `direccion_proveedor` varchar(65) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `proveedores`
--

INSERT INTO `proveedores` (`id_proveedor`, `nombre_proveedor`, `rnc_proveedor`, `telefono_proveedor`, `email_proveedor`, `direccion_proveedor`) VALUES
(1, 'Juan carne', '101552583', '809-247-9890', 'juancarne@gmail.com', 'Calle segunda, #11. Los proceres'),
(2, 'Pedro Refresco', '101258080', '809-235-8525', 'pedrorefresco@hotmail.com', 'Calle primera, Ensache la fe'),
(3, 'Manuel Leche', '101803001', '829-963-8585', 'Manuelleche@hotmail.com', 'Calle jimenez, Santiago'),
(5, 'Carlos Arroz', '101502380', '809-369-9989', 'CarlosA@gmail.com', 'Calle duarte, #105. cotui'),
(6, 'Jose Queso', '100258065', '809-877-8820', 'Josequeso01@gmail.com', 'Calle fantino, #100. La vega');

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `reporte`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `reporte` (
`factura` int(11)
,`fecha` datetime
,`total` varchar(20)
,`vendedor` varchar(41)
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `stock`
--

CREATE TABLE `stock` (
  `id` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `cantidad` int(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `stock`
--

INSERT INTO `stock` (`id`, `id_producto`, `cantidad`) VALUES
(1, 1, 10),
(2, 2, 20),
(3, 3, 2),
(4, 4, 7),
(5, 5, 10),
(6, 6, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tmp`
--

CREATE TABLE `tmp` (
  `id_tmp` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `cantidad_tmp` int(11) NOT NULL,
  `precio_tmp` double(8,2) DEFAULT NULL,
  `session_id` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL COMMENT 'auto incrementing user_id of each user, unique index',
  `firstname` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `lastname` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `user_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'user''s name, unique',
  `cargo` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `user_password_hash` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'user''s password in salted and hashed format',
  `user_email` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'user''s email, unique',
  `date_added` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`user_id`, `firstname`, `lastname`, `user_name`, `cargo`, `user_password_hash`, `user_email`, `date_added`) VALUES
(1, 'Diomar', 'Castillo', 'admin', 'admin', '$2y$10$CjT6RFdvLKIzP9mYJkr1I.NK1tYAYGleu7RUkITnJsVIjNyTKSgYy', 'diomar@hotmail.com', '2020-03-22 03:00:27'),
(2, 'Jose', 'Perez', 'jose', 'cajero', '$2y$10$MPVHzZ2ZPOWmtUUGCq3RXu31OTB.jo7M9LZ7PmPQYmgETSNn19ejO', 'Jose14@hotmail.com', '2020-03-25 00:00:00'),
(3, 'Maria', 'Leon', 'Maria', 'super', '$2y$10$5WXuBpClytPUmtgE9LX2LOuBQgSbkphKajuS.WsLWpvOy7XHCPMoy', 'maria01@hotmail.com', '2020-03-27 02:03:47'),
(4, 'Josefina', 'Paredes', 'josefina', 'cajero', '$2y$10$5xbIs5j8uS5kuIfCYFdq1u4.FkgAPWHct7JiEcCTKiWQzppgi344u', 'josefina@hotmail.com', '2020-03-27 02:04:28'),
(5, 'Pedro', 'Colon', 'pedro1', 'super', '$2y$10$SPrpRo8nWeCKf8NTOCOmVe1RSZ6RKxJA1ApjmSwon9NHXPA5.o6ge', 'pedro@hotmail.com', '2020-04-26 23:04:32'),
(6, 'Rosa', 'Martinez', 'rosa02', 'cajero', '$2y$10$lzfQ6n.AkAml9m0SKOfcVuvqQ0VwHj2koIQrZv0Fq2eRtBLjxlMQG', 'rosa10@gmail.com', '2020-05-01 21:25:24');

-- --------------------------------------------------------

--
-- Estructura para la vista `producto`
--
DROP TABLE IF EXISTS `producto`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `producto`  AS  select `p`.`id_producto` AS `id_producto`,`p`.`nombre_producto` AS `nombre_producto`,`p`.`status_producto` AS `status_producto`,`p`.`date_added` AS `date_added`,`p`.`precio_producto` AS `precio_producto`,`s`.`cantidad` AS `cantidad` from (`productos` `p` left join `stock` `s` on((`p`.`id_producto` = `s`.`id_producto`))) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `reporte`
--
DROP TABLE IF EXISTS `reporte`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `reporte`  AS  select `f`.`numero_factura` AS `factura`,`f`.`fecha_factura` AS `fecha`,`f`.`total_venta` AS `total`,concat(`u`.`firstname`,' ',`u`.`lastname`) AS `vendedor` from (`facturas` `f` left join `users` `u` on((`f`.`id_vendedor` = `u`.`user_id`))) ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id_cliente`),
  ADD UNIQUE KEY `codigo_producto` (`nombre_cliente`);

--
-- Indices de la tabla `compras`
--
ALTER TABLE `compras`
  ADD PRIMARY KEY (`id_compra`),
  ADD UNIQUE KEY `numero_cotizacion` (`numero_compra`);

--
-- Indices de la tabla `detalle_compra`
--
ALTER TABLE `detalle_compra`
  ADD PRIMARY KEY (`id_detalle`),
  ADD KEY `numero_cotizacion` (`numero_compra`,`id_producto`);

--
-- Indices de la tabla `detalle_factura`
--
ALTER TABLE `detalle_factura`
  ADD PRIMARY KEY (`id_detalle`),
  ADD KEY `numero_cotizacion` (`numero_factura`,`id_producto`);

--
-- Indices de la tabla `facturas`
--
ALTER TABLE `facturas`
  ADD PRIMARY KEY (`id_factura`),
  ADD UNIQUE KEY `numero_cotizacion` (`numero_factura`);

--
-- Indices de la tabla `perfil`
--
ALTER TABLE `perfil`
  ADD PRIMARY KEY (`id_perfil`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id_producto`);

--
-- Indices de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  ADD PRIMARY KEY (`id_proveedor`),
  ADD UNIQUE KEY `codigo_producto` (`nombre_proveedor`);

--
-- Indices de la tabla `stock`
--
ALTER TABLE `stock`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tmp`
--
ALTER TABLE `tmp`
  ADD PRIMARY KEY (`id_tmp`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `user_name` (`user_name`),
  ADD UNIQUE KEY `user_email` (`user_email`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id_cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `compras`
--
ALTER TABLE `compras`
  MODIFY `id_compra` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT de la tabla `detalle_compra`
--
ALTER TABLE `detalle_compra`
  MODIFY `id_detalle` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT de la tabla `detalle_factura`
--
ALTER TABLE `detalle_factura`
  MODIFY `id_detalle` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=221;

--
-- AUTO_INCREMENT de la tabla `facturas`
--
ALTER TABLE `facturas`
  MODIFY `id_factura` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT de la tabla `perfil`
--
ALTER TABLE `perfil`
  MODIFY `id_perfil` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id_producto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  MODIFY `id_proveedor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `stock`
--
ALTER TABLE `stock`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `tmp`
--
ALTER TABLE `tmp`
  MODIFY `id_tmp` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=311;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'auto incrementing user_id of each user, unique index', AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
