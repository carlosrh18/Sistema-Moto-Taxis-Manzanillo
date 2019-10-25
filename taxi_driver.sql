-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 25-10-2019 a las 04:59:44
-- Versión del servidor: 10.1.36-MariaDB
-- Versión de PHP: 7.2.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `taxi_driver`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `taxis`
--

CREATE TABLE `taxis` (
  `taxi_id` int(16) NOT NULL,
  `taxi_number` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `taxi_driver`
--

CREATE TABLE `taxi_driver` (
  `taxi_driver_id` int(16) NOT NULL,
  `driver_id` int(16) NOT NULL,
  `taxi_id` int(16) NOT NULL,
  `day` date NOT NULL,
  `time_start` time NOT NULL,
  `time_finish` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `travel`
--

CREATE TABLE `travel` (
  `travel_id` int(32) NOT NULL,
  `day` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `hour` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `driver_id` int(16) NOT NULL,
  `taxi_id` int(16) NOT NULL,
  `travel_bill` int(5) UNSIGNED NOT NULL,
  `payment_type` int(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `user_id` int(16) NOT NULL,
  `user_name` varchar(15) NOT NULL,
  `user_last_name` varchar(25) NOT NULL,
  `password` varchar(16) NOT NULL,
  `user_type` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `taxis`
--
ALTER TABLE `taxis`
  ADD PRIMARY KEY (`taxi_id`);

--
-- Indices de la tabla `taxi_driver`
--
ALTER TABLE `taxi_driver`
  ADD PRIMARY KEY (`taxi_driver_id`),
  ADD KEY `driver_id` (`driver_id`),
  ADD KEY `taxi_id` (`taxi_id`);

--
-- Indices de la tabla `travel`
--
ALTER TABLE `travel`
  ADD PRIMARY KEY (`travel_id`,`day`),
  ADD KEY `driver_id` (`driver_id`),
  ADD KEY `taxi_id` (`taxi_id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `taxis`
--
ALTER TABLE `taxis`
  MODIFY `taxi_id` int(16) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `taxi_driver`
--
ALTER TABLE `taxi_driver`
  MODIFY `taxi_driver_id` int(16) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `travel`
--
ALTER TABLE `travel`
  MODIFY `travel_id` int(32) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(16) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `taxi_driver`
--
ALTER TABLE `taxi_driver`
  ADD CONSTRAINT `taxi_driver_ibfk_1` FOREIGN KEY (`driver_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `taxi_driver_ibfk_2` FOREIGN KEY (`taxi_id`) REFERENCES `taxis` (`taxi_id`);

--
-- Filtros para la tabla `travel`
--
ALTER TABLE `travel`
  ADD CONSTRAINT `travel_ibfk_1` FOREIGN KEY (`driver_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `travel_ibfk_2` FOREIGN KEY (`taxi_id`) REFERENCES `taxis` (`taxi_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
