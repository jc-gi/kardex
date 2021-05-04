-- phpMyAdmin SQL Dump
-- version 4.6.6deb4+deb9u2
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 29-04-2021 a las 20:50:00
-- Versión del servidor: 10.3.27-MariaDB-0+deb10u1
-- Versión de PHP: 7.3.27-1~deb10u1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `kardex`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `address`
--

CREATE TABLE `address` (
  `address_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `address_line` varchar(100) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `zip_postcode` varchar(45) DEFAULT NULL,
  `state` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `address`
--

INSERT INTO `address` (`address_id`, `student_id`, `address_line`, `city`, `zip_postcode`, `state`) VALUES
(1, 180864, 'SALVADOR NAVA NRO 8', 'SLP', '78110', 'SLP');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `email`
--

CREATE TABLE `email` (
  `email` varchar(100) NOT NULL,
  `student_id` int(11) NOT NULL,
  `email_type` enum('personal','laboral') DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL,
  `created_on` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `email`
--

INSERT INTO `email` (`email`, `student_id`, `email_type`, `updated_on`, `created_on`) VALUES
('JCARLOS0284@GMAIL.COM', 180864, 'personal', '2021-04-29 00:00:00', '2021-04-22 00:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `phone`
--

CREATE TABLE `phone` (
  `phone_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `phone` varchar(30) NOT NULL,
  `phone_type` enum('personal','casa','trabajo') NOT NULL,
  `country_code` varchar(5) DEFAULT NULL,
  `area_code` varchar(5) DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `phone`
--

INSERT INTO `phone` (`phone_id`, `student_id`, `phone`, `phone_type`, `country_code`, `area_code`, `created_on`, `updated_on`) VALUES
(1, 180864, '4443374128', 'personal', '52', '444', '2021-04-29 00:00:00', '2021-04-29 00:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `student`
--

CREATE TABLE `student` (
  `student_id` int(11) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `middle_name` varchar(45) DEFAULT NULL,
  `first_name` varchar(45) DEFAULT NULL,
  `gender` enum('masculino','femenino') NOT NULL,
  `created_on` datetime DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `student`
--

INSERT INTO `student` (`student_id`, `last_name`, `middle_name`, `first_name`, `gender`, `created_on`, `updated_on`) VALUES
(180864, 'GONZALEZ', 'CARLOS', 'JUAN', 'masculino', '2021-04-29 00:00:00', '2021-04-29 06:07:21'),
(180865, 'LOPEZ', 'MARIO', 'JOSE', 'masculino', '2021-04-29 19:43:46', '2021-04-29 21:55:55'),
(180866, 'RUIZ', 'ANGELES', 'MARIA', 'femenino', '2021-04-29 19:43:46', '2021-04-29 21:55:55');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`address_id`,`student_id`),
  ADD KEY `student_id` (`student_id`);

--
-- Indices de la tabla `email`
--
ALTER TABLE `email`
  ADD PRIMARY KEY (`email`,`student_id`),
  ADD KEY `student_id` (`student_id`),
  ADD KEY `student_id_2` (`student_id`);

--
-- Indices de la tabla `phone`
--
ALTER TABLE `phone`
  ADD PRIMARY KEY (`phone_id`,`student_id`),
  ADD KEY `student_id` (`student_id`);

--
-- Indices de la tabla `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`student_id`,`last_name`),
  ADD KEY `student_id` (`student_id`,`last_name`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `address`
--
ALTER TABLE `address`
  ADD CONSTRAINT `address_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `email`
--
ALTER TABLE `email`
  ADD CONSTRAINT `email_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `phone`
--
ALTER TABLE `phone`
  ADD CONSTRAINT `phone_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
