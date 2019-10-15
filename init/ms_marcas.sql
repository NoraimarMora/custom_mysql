-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 15-10-2019 a las 01:04:00
-- Versión del servidor: 10.1.36-MariaDB
-- Versión de PHP: 7.2.10

-- Create ms_marcas database if it doesn't exist
CREATE DATABASE IF NOT EXISTS `ms_marcas`;
-- Grant all privilidges on ms_marcas to root
GRANT ALL PRIVILEGES ON `ms_marcas`.* TO `root`;

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `ms_marcas`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cuentas_bancarias`
--

CREATE TABLE `ms_marcas`.`cuentas_bancarias` (
  `id` int(10) UNSIGNED NOT NULL,
  `beneficiary` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dni_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dni` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `account_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `account_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tienda_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `horarios`
--

CREATE TABLE `ms_marcas`.`horarios` (
  `id` int(10) UNSIGNED NOT NULL,
  `day` enum('1','2','3','4','5','6','7') COLLATE utf8mb4_unicode_ci NOT NULL,
  `open` int(11) NOT NULL,
  `close` int(11) NOT NULL,
  `tienda_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `marcas`
--

CREATE TABLE `ms_marcas`.`marcas` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `logo_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `banner_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `ms_marcas`.`migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `migrations`
--

INSERT INTO `ms_marcas`.`migrations` (`id`, `migration`, `batch`) VALUES
(1, '2019_05_14_013439_create_marcas_table', 1),
(2, '2019_05_14_013538_create_tiendas_table', 1),
(3, '2019_05_14_013608_create_cuentas_bancarias_table', 1),
(4, '2019_05_14_013636_create_horarios_table', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tiendas`
--

CREATE TABLE `ms_marcas`.`tiendas` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `latitude` double NOT NULL,
  `longitude` double NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `marca_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cuentas_bancarias`
--
ALTER TABLE `ms_marcas`.`cuentas_bancarias`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cuentas_bancarias_tienda_id_foreign` (`tienda_id`);

--
-- Indices de la tabla `horarios`
--
ALTER TABLE `ms_marcas`.`horarios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `horarios_tienda_id_foreign` (`tienda_id`);

--
-- Indices de la tabla `marcas`
--
ALTER TABLE `ms_marcas`.`marcas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `ms_marcas`.`migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tiendas`
--
ALTER TABLE `ms_marcas`.`tiendas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tiendas_marca_id_foreign` (`marca_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cuentas_bancarias`
--
ALTER TABLE `ms_marcas`.`cuentas_bancarias`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `horarios`
--
ALTER TABLE `ms_marcas`.`horarios`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `marcas`
--
ALTER TABLE `ms_marcas`.`marcas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `ms_marcas`.`migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `tiendas`
--
ALTER TABLE `ms_marcas`.`tiendas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cuentas_bancarias`
--
ALTER TABLE `ms_marcas`.`cuentas_bancarias`
  ADD CONSTRAINT `cuentas_bancarias_tienda_id_foreign` FOREIGN KEY (`tienda_id`) REFERENCES `tiendas` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `horarios`
--
ALTER TABLE `ms_marcas`.`horarios`
  ADD CONSTRAINT `horarios_tienda_id_foreign` FOREIGN KEY (`tienda_id`) REFERENCES `tiendas` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `tiendas`
--
ALTER TABLE `ms_marcas`.`tiendas`
  ADD CONSTRAINT `tiendas_marca_id_foreign` FOREIGN KEY (`marca_id`) REFERENCES `marcas` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
