-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 22-07-2022 a las 17:33:08
-- Versión del servidor: 10.4.24-MariaDB
-- Versión de PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `sis_venta`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `idcliente` int(11) NOT NULL,
  `nombre` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `telefono` varchar(15) COLLATE utf8_spanish_ci NOT NULL,
  `direccion` varchar(200) COLLATE utf8_spanish_ci NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `estado` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`idcliente`, `nombre`, `telefono`, `direccion`, `usuario_id`, `estado`) VALUES
(6, 'Manuel', '234543234', 'La Casa', 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `configuracion`
--

CREATE TABLE `configuracion` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `telefono` varchar(15) COLLATE utf8_spanish_ci NOT NULL,
  `email` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `direccion` text COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `configuracion`
--

INSERT INTO `configuracion` (`id`, `nombre`, `telefono`, `email`, `direccion`) VALUES
(1, 'REPORTE DE VENTA B&C', '12345678', 'CORREOJEFE@GMAIL.COM', 'DIRECCION DEL LUGAR');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_permisos`
--

CREATE TABLE `detalle_permisos` (
  `id` int(11) NOT NULL,
  `id_permiso` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `detalle_permisos`
--

INSERT INTO `detalle_permisos` (`id`, `id_permiso`, `id_usuario`) VALUES
(12, 1, 1),
(13, 2, 1),
(14, 3, 1),
(15, 4, 1),
(16, 5, 1),
(17, 6, 1),
(30, 5, 2),
(31, 6, 2),
(40, 4, 4),
(41, 5, 4),
(42, 6, 4),
(49, 4, 5),
(50, 5, 5),
(51, 6, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_temp`
--

CREATE TABLE `detalle_temp` (
  `id` int(11) NOT NULL,
  `id_usuario` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `id_producto` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precio_venta` decimal(10,2) NOT NULL,
  `total` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_venta`
--

CREATE TABLE `detalle_venta` (
  `id` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `id_venta` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precio` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `detalle_venta`
--

INSERT INTO `detalle_venta` (`id`, `id_producto`, `id_venta`, `cantidad`, `precio`) VALUES
(1, 4, 1, 2, '13.00'),
(2, 3, 1, 1, '16.00'),
(3, 4, 2, 3, '13.00'),
(4, 3, 3, 3, '16.00'),
(5, 4, 4, 1, '13.00'),
(6, 3, 5, 2, '16.00'),
(7, 7, 6, 1, '12.00'),
(8, 8, 6, 1, '43.00'),
(9, 9, 7, 2, '56.00'),
(10, 10, 7, 1, '45.00'),
(11, 13, 7, 1, '70.00'),
(12, 9, 8, 2, '56.00'),
(13, 10, 8, 1, '45.00'),
(14, 10, 9, 2, '45.00'),
(15, 12, 9, 1, '65.00'),
(16, 10, 10, 1, '45.00'),
(17, 16, 10, 1, '45.00'),
(18, 15, 11, 1, '45.00'),
(19, 14, 11, 1, '35.00'),
(20, 17, 12, 1, '65.00'),
(21, 17, 13, 1, '65.00'),
(22, 17, 14, 1, '65.00'),
(23, 18, 15, 3, '56.00'),
(24, 9, 16, 1, '65.00'),
(25, 10, 16, 1, '45.00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permisos`
--

CREATE TABLE `permisos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `permisos`
--

INSERT INTO `permisos` (`id`, `nombre`) VALUES
(1, 'configuración'),
(2, 'usuarios'),
(3, 'clientes'),
(4, 'productos'),
(5, 'ventas'),
(6, 'nueva_venta');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `codproducto` int(11) NOT NULL,
  `codigo` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `descripcion` varchar(200) COLLATE utf8_spanish_ci NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `existencia` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `estado` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`codproducto`, `codigo`, `descripcion`, `precio`, `existencia`, `usuario_id`, `estado`) VALUES
(9, '001', 'Cefe Capuchino 12', '65.00', 99, 1, 1),
(10, '002', 'Cafe Americano', '45.00', 94, 1, 1),
(11, '003', 'Cafe Moka', '35.00', 100, 1, 1),
(12, '004', 'Smothie de Gansito', '65.00', 19, 1, 1),
(13, '005', 'Smothie de Kinder', '70.00', 19, 1, 1),
(14, '006', 'Frape de Fresa', '35.00', 49, 1, 1),
(15, '007', 'Frape de Mora Azul', '45.00', 49, 1, 1),
(16, '008', 'Frape de Picafresa', '45.00', 29, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `idusuario` int(11) NOT NULL,
  `nombre` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `correo` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `usuario` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `clave` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `estado` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`idusuario`, `nombre`, `correo`, `usuario`, `clave`, `estado`) VALUES
(1, 'admin', 'CORREOADMIN@GMAIL.COM', 'admin', '21232f297a57a5a743894a0e4a801fc3', 1),
(5, 'user', 'user@gmail.com', 'user', 'ee11cbb19052e40b07aac0ca060c23ee', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

CREATE TABLE `ventas` (
  `id` int(11) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `ventas`
--

INSERT INTO `ventas` (`id`, `id_cliente`, `total`, `id_usuario`, `fecha`) VALUES
(6, 1, '55.00', 1, '2022-07-17 07:14:22'),
(7, 1, '227.00', 1, '2022-07-17 18:28:49'),
(8, 1, '157.00', 1, '2022-07-18 08:07:43'),
(9, 1, '155.00', 1, '2022-07-19 08:25:43'),
(10, 1, '90.00', 1, '2022-07-19 16:17:01'),
(11, 1, '80.00', 1, '2022-07-19 16:19:56'),
(12, 1, '65.00', 1, '2022-07-19 16:21:22'),
(13, 1, '65.00', 1, '2022-07-19 16:21:36'),
(14, 1, '65.00', 1, '2022-07-19 16:21:53'),
(15, 1, '168.00', 1, '2022-07-21 18:26:50'),
(16, 6, '110.00', 1, '2022-07-22 15:12:48');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`idcliente`);

--
-- Indices de la tabla `configuracion`
--
ALTER TABLE `configuracion`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `detalle_permisos`
--
ALTER TABLE `detalle_permisos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `detalle_temp`
--
ALTER TABLE `detalle_temp`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `detalle_venta`
--
ALTER TABLE `detalle_venta`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `permisos`
--
ALTER TABLE `permisos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`codproducto`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`idusuario`);

--
-- Indices de la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `idcliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `configuracion`
--
ALTER TABLE `configuracion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `detalle_permisos`
--
ALTER TABLE `detalle_permisos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT de la tabla `detalle_temp`
--
ALTER TABLE `detalle_temp`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT de la tabla `detalle_venta`
--
ALTER TABLE `detalle_venta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT de la tabla `permisos`
--
ALTER TABLE `permisos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `codproducto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `idusuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `ventas`
--
ALTER TABLE `ventas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
