-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 15-10-2019 a las 03:43:59
-- Versión del servidor: 10.1.36-MariaDB
-- Versión de PHP: 7.2.10

-- Create ms_catalogo database if it doesn't exist
CREATE DATABASE IF NOT EXISTS `ms_catalogo`;
-- Grant all privilidges on ms_catalogo to root
GRANT ALL PRIVILEGES ON `ms_catalogo`.* TO `root`;

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `ms_catalogo`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `adonis_schema`
--

CREATE TABLE `ms_catalogo`.`adonis_schema` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `batch` int(11) DEFAULT NULL,
  `migration_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `adonis_schema`
--

INSERT INTO `ms_catalogo`.`adonis_schema` (`id`, `name`, `batch`, `migration_time`) VALUES
(1, '1560480112873_categorias_schema', 1, '2019-10-15 01:36:31'),
(2, '1560480205281_caracteristicas_schema', 1, '2019-10-15 01:36:31'),
(3, '1560480258902_valor_caracteristicas_schema', 1, '2019-10-15 01:36:33'),
(4, '1560480268039_marcas_schema', 1, '2019-10-15 01:36:35'),
(5, '1560480268043_tiendas_schema', 1, '2019-10-15 01:36:40'),
(6, '1560480269217_productos_schema', 1, '2019-10-15 01:36:42'),
(7, '1560717581982_categoria_producto_schema', 1, '2019-10-15 01:36:46'),
(8, '1560717902378_producto_valor_caracteristica_schema', 1, '2019-10-15 01:36:51');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `caracteristicas`
--

CREATE TABLE `ms_catalogo`.`caracteristicas` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `ms_catalogo`.`categorias` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `banner_url` varchar(255) DEFAULT NULL,
  `parent` varchar(255) DEFAULT '0',
  `position` int(11) DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria_producto`
--

CREATE TABLE `ms_catalogo`.`categoria_producto` (
  `id` int(10) UNSIGNED NOT NULL,
  `categoria_id` int(10) UNSIGNED DEFAULT NULL,
  `producto_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `marcas`
--

CREATE TABLE `ms_catalogo`.`marcas` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `ms_catalogo`.`productos` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `reference` varchar(255) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `description` text,
  `imagen_url` varchar(255) DEFAULT NULL,
  `customizable` tinyint(1) DEFAULT NULL,
  `tienda_id` int(10) UNSIGNED DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto_valor_caracteristica`
--

CREATE TABLE `ms_catalogo`.`producto_valor_caracteristica` (
  `id` int(10) UNSIGNED NOT NULL,
  `valor_caracteristica_id` int(10) UNSIGNED DEFAULT NULL,
  `producto_id` int(10) UNSIGNED DEFAULT NULL,
  `impact` double DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tiendas`
--

CREATE TABLE `ms_catalogo`.`tiendas` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `marca_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `valor_caracteristicas`
--

CREATE TABLE `ms_catalogo`.`valor_caracteristicas` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `caracteristica_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `adonis_schema`
--
ALTER TABLE `ms_catalogo`.`adonis_schema`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `caracteristicas`
--
ALTER TABLE `ms_catalogo`.`caracteristicas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `ms_catalogo`.`categorias`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `categoria_producto`
--
ALTER TABLE `ms_catalogo`.`categoria_producto`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categoria_producto_categoria_id_foreign` (`categoria_id`),
  ADD KEY `categoria_producto_producto_id_foreign` (`producto_id`);

--
-- Indices de la tabla `marcas`
--
ALTER TABLE `ms_catalogo`.`marcas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `ms_catalogo`.`productos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `productos_tienda_id_foreign` (`tienda_id`);

--
-- Indices de la tabla `producto_valor_caracteristica`
--
ALTER TABLE `ms_catalogo`.`producto_valor_caracteristica`
  ADD PRIMARY KEY (`id`),
  ADD KEY `producto_valor_caracteristica_valor_caracteristica_id_foreign` (`valor_caracteristica_id`),
  ADD KEY `producto_valor_caracteristica_producto_id_foreign` (`producto_id`);

--
-- Indices de la tabla `tiendas`
--
ALTER TABLE `ms_catalogo`.`tiendas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tiendas_marca_id_foreign` (`marca_id`);

--
-- Indices de la tabla `valor_caracteristicas`
--
ALTER TABLE `ms_catalogo`.`valor_caracteristicas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `valor_caracteristicas_caracteristica_id_foreign` (`caracteristica_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `adonis_schema`
--
ALTER TABLE `ms_catalogo`.`adonis_schema`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `caracteristicas`
--
ALTER TABLE `ms_catalogo`.`caracteristicas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `ms_catalogo`.`categorias`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `categoria_producto`
--
ALTER TABLE `ms_catalogo`.`categoria_producto`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `ms_catalogo`.`productos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `producto_valor_caracteristica`
--
ALTER TABLE `ms_catalogo`.`producto_valor_caracteristica`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `valor_caracteristicas`
--
ALTER TABLE `ms_catalogo`.`valor_caracteristicas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `categoria_producto`
--
ALTER TABLE `ms_catalogo`.`categoria_producto`
  ADD CONSTRAINT `categoria_producto_categoria_id_foreign` FOREIGN KEY (`categoria_id`) REFERENCES `categorias` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `categoria_producto_producto_id_foreign` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `ms_catalogo`.`productos`
  ADD CONSTRAINT `productos_tienda_id_foreign` FOREIGN KEY (`tienda_id`) REFERENCES `tiendas` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `producto_valor_caracteristica`
--
ALTER TABLE `ms_catalogo`.`producto_valor_caracteristica`
  ADD CONSTRAINT `producto_valor_caracteristica_producto_id_foreign` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `producto_valor_caracteristica_valor_caracteristica_id_foreign` FOREIGN KEY (`valor_caracteristica_id`) REFERENCES `valor_caracteristicas` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `tiendas`
--
ALTER TABLE `ms_catalogo`.`tiendas`
  ADD CONSTRAINT `tiendas_marca_id_foreign` FOREIGN KEY (`marca_id`) REFERENCES `marcas` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `valor_caracteristicas`
--
ALTER TABLE `ms_catalogo`.`valor_caracteristicas`
  ADD CONSTRAINT `valor_caracteristicas_caracteristica_id_foreign` FOREIGN KEY (`caracteristica_id`) REFERENCES `caracteristicas` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
