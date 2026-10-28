-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 28-10-2026 a las 18:29:47
-- Versión del servidor: 8.0.17
-- Versión de PHP: 7.3.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `empresa`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `USER_ID` int(11) NOT NULL,
  `run` varchar(13) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `apellido` varchar(45) NOT NULL,
  `direccion` varchar(45) NOT NULL,
  `fono` varchar(15) NOT NULL,
  `correo` varchar(45) NOT NULL,
  `montoCredito` int(11) NOT NULL,
  `deuda` int(11) NOT NULL,
  `Tipo_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`USER_ID`, `run`, `nombre`, `apellido`, `direccion`, `fono`, `correo`, `montoCredito`, `deuda`, `Tipo_id`) VALUES
(1, '1', '22', '22', '22', '22', '22', 22, 22, 1),
(3, '222222', '222222', '2222222', '222222', '222222', '2222222', 2222222, 0, 2),
(5, '1', '1', '1', '1', '1', '1', 1, 0, 2),
(6, '4', '4', '4', '4', '4', '4', 4, 0, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo`
--

CREATE TABLE `tipo` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `tipo`
--

INSERT INTO `tipo` (`id`, `nombre`) VALUES
(1, 'Cliente Normal'),
(2, 'VIP'),
(3, 'Empresa');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password_hash` varchar(120) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellidos` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `tipo_usuario` enum('Administrador','Vendedor') NOT NULL,
  `fecha_registro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `username`, `password_hash`, `nombre`, `apellidos`, `email`, `tipo_usuario`, `fecha_registro`) VALUES
(1, 'etiann', '$2b$12$SFUFvvBzx9gQy.1pkCzbTu19KcaYCzzlshv6krn9LeuewTHvMF/9S', 'etiann', 'beiza bernal', 'etiann@gmail.com', 'Vendedor', '2026-10-28 18:15:17'),
(2, 'etiann', '$2b$12$lS/Qotdu.HPk2hTpzU/djOvkavkWOif3htIGMMy0iGiocVHa.WGRW', 'etiann', 'beiza bernal', 'werqrwe', 'Administrador', '2026-10-28 18:16:02'),
(3, 'lolo', '$2b$12$EFhANcas5N3THepIO4nmiuaFGyBZ6bWENfFfYPRQxT.NzHOt5HIIS', 'lolo', 'lolo', 'lolo', 'Vendedor', '2026-10-28 18:18:57'),
(4, 'aa', '$2b$12$HOGucDxmbuX4/q7qvhjXZOKhlPsazo3vy79M4./cVTiz56d5MFluq', 'aa', 'aa', 'aa', 'Administrador', '2026-10-28 18:20:31'),
(5, 'eee', '$2b$12$k0XKQcsq1NoYiQRi7eGBtuyKotyk9JfupjbVTqHZO6d8N8FCcBkWO', 'eee', 'eee', 'eee', 'Administrador', '2026-10-28 18:25:41'),
(6, 'ttt', '$2b$12$CwLlXhdI8x9n3InKu4nxkessgPZ8Wv9pyXII/toSB18nqEZvKxHSm', 'ttt', 'ttt', 'ttt', 'Vendedor', '2026-10-28 18:28:12'),
(7, 'ppp', '$2b$12$S6dep.QhCkC1XAB0/PIw8uGluDF3uoazP2LF2Ilq9.ERDKg./Tsea', 'ppp', 'ppp', 'ppp', 'Administrador', '2026-10-28 18:29:05');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`USER_ID`);

--
-- Indices de la tabla `tipo`
--
ALTER TABLE `tipo`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `USER_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `tipo`
--
ALTER TABLE `tipo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
