-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 19-08-2024 a las 21:00:17
-- Versión del servidor: 10.4.22-MariaDB
-- Versión de PHP: 7.4.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `tienda_juegos`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compras`
--

CREATE TABLE `compras` (
  `id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `juego_id` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `juegos`
--

CREATE TABLE `juegos` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `price` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `juegos`
--

INSERT INTO `juegos` (`id`, `name`, `description`, `price`) VALUES
(1, 'The Legend of Zelda: Breath of the Wild', 'Un juego de aventura en un vasto mundo abierto.', '59.99'),
(2, 'Red Dead Redemption 2', 'Un épico juego de acción en el salvaje oeste.', '49.99'),
(3, 'Super Mario Odyssey', 'Una emocionante aventura de Mario en 3D.', '49.99'),
(4, 'The Witcher 3: Wild Hunt', 'Un juego de rol y acción con un mundo abierto.', '39.99'),
(5, 'Minecraft', 'Un juego de construcción y aventuras en un mundo de bloques.', '26.95'),
(6, 'Grand Theft Auto V', 'Un juego de acción en un mundo abierto lleno de crimen.', '29.99'),
(7, 'Fortnite', 'Un juego de disparos y construcción en línea.', '0.00'),
(8, 'Call of Duty: Modern Warfare', 'Un juego de disparos en primera persona.', '59.99'),
(9, 'Cyberpunk 2077', 'Un juego de rol y acción ambientado en un futuro distópico.', '59.99'),
(10, 'Animal Crossing: New Horizons', 'Un simulador de vida en una isla paradisíaca.', '59.99'),
(11, 'FIFA 22', 'El juego de fútbol más popular del mundo.', '49.99'),
(12, 'Assassin’s Creed Valhalla', 'Una épica aventura de acción en la era vikinga.', '59.99'),
(13, 'Among Us', 'Un juego multijugador de deducción social.', '4.99'),
(14, 'The Sims 4', 'Un simulador de vida social.', '39.99'),
(15, 'Doom Eternal', 'Un juego de disparos en primera persona lleno de acción.', '59.99'),
(16, 'Resident Evil Village', 'Un juego de horror y supervivencia.', '59.99'),
(17, 'Ghost of Tsushima', 'Un juego de acción ambientado en el Japón feudal.', '59.99'),
(18, 'Hades', 'Un juego de acción y roguelike basado en la mitología griega.', '24.00'),
(19, 'God of War', 'Un juego de acción y aventura inspirado en la mitología nórdica.', '19.99'),
(20, 'Fall Guys', 'Un divertido juego de fiesta multijugador.', '19.00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('admin','cliente') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `username`, `password`, `role`) VALUES
(1, 'admin', '123', 'admin'),
(2, 'cliente', '1234', 'cliente'),
(3, 'msmith', 'msmith', 'cliente'),
(4, 'ajones', 'ajones', 'cliente'),
(5, 'ebrown', 'ebrown', 'cliente');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `compras`
--
ALTER TABLE `compras`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usuario_id` (`usuario_id`),
  ADD KEY `juego_id` (`juego_id`);

--
-- Indices de la tabla `juegos`
--
ALTER TABLE `juegos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `compras`
--
ALTER TABLE `compras`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `juegos`
--
ALTER TABLE `juegos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `compras`
--
ALTER TABLE `compras`
  ADD CONSTRAINT `compras_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `compras_ibfk_2` FOREIGN KEY (`juego_id`) REFERENCES `juegos` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
