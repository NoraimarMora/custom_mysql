-- Create ms_catalogo database if it doesn't exist
CREATE DATABASE IF NOT EXISTS `ms_catalogo`;
-- Grant all privilidges on ms_catalogo to root
GRANT ALL PRIVILEGES ON `ms_catalogo`.* TO `root`;

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";

--
-- Estructura de las tablas
--

CREATE TABLE `ms_catalogo`.`adonis_schema` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `batch` int(11) DEFAULT NULL,
  `migration_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `adonis_schema` (`id`, `name`, `batch`, `migration_time`) VALUES
(1, '1560480112873_categorias_schema', 1, '2019-09-28 19:29:25'),
(2, '1560480205281_caracteristicas_schema', 2, '2019-09-28 19:30:07'),
(3, '1560480258902_valores_caracteristica_schema', 2, '2019-09-28 19:30:08'),
(4, '1560480268043_tiendas_schema', 2, '2019-09-28 19:30:09'),
(5, '1560480269217_productos_schema', 2, '2019-09-28 19:30:11'),
(6, '1560717581982_categoria_producto_schema', 2, '2019-09-28 19:30:15'),
(7, '1560717902378_producto_valor_caracteristica_schema', 2, '2019-09-28 19:30:17');

CREATE TABLE `ms_catalogo`.`caracteristicas` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `ms_catalogo`.`categorias` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `banner_url` varchar(255) DEFAULT NULL,
  `padre` varchar(255) DEFAULT '0',
  `posicion` int(11) DEFAULT NULL,
  `activo` tinyint(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `ms_catalogo`.`categoria_producto` (
  `id` int(10) UNSIGNED NOT NULL,
  `categoria_id` int(10) UNSIGNED DEFAULT NULL,
  `producto_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `ms_catalogo`.`productos` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `referencia` varchar(255) DEFAULT NULL,
  `precio` double DEFAULT NULL,
  `descripcion` text,
  `imagen_url` varchar(255) DEFAULT NULL,
  `personalizable` tinyint(1) DEFAULT NULL,
  `tienda_id` int(10) UNSIGNED DEFAULT NULL,
  `activo` tinyint(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `ms_catalogo`.`producto_valor_caracteristica` (
  `id` int(10) UNSIGNED NOT NULL,
  `valor_caracteristica_id` int(10) UNSIGNED DEFAULT NULL,
  `producto_id` int(10) UNSIGNED DEFAULT NULL,
  `impacto` double DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `ms_catalogo`.`tiendas` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `ms_catalogo`.`valores_caracteristicas` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `caracteristica_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Índices para tablas volcadas
--

ALTER TABLE `adonis_schema`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `caracteristicas`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `categoria_producto`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categoria_producto_categoria_id_foreign` (`categoria_id`),
  ADD KEY `categoria_producto_producto_id_foreign` (`producto_id`);

ALTER TABLE `productos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `productos_tienda_id_foreign` (`tienda_id`);

ALTER TABLE `producto_valor_caracteristica`
  ADD PRIMARY KEY (`id`),
  ADD KEY `producto_valor_caracteristica_valor_caracteristica_id_foreign` (`valor_caracteristica_id`),
  ADD KEY `producto_valor_caracteristica_producto_id_foreign` (`producto_id`);

ALTER TABLE `tiendas`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `valores_caracteristicas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `valores_caracteristicas_caracteristica_id_foreign` (`caracteristica_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

ALTER TABLE `adonis_schema`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

ALTER TABLE `caracteristicas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE `categorias`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE `categoria_producto`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE `productos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE `producto_valor_caracteristica`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE `valores_caracteristicas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

ALTER TABLE `categoria_producto`
  ADD CONSTRAINT `categoria_producto_categoria_id_foreign` FOREIGN KEY (`categoria_id`) REFERENCES `categorias` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `categoria_producto_producto_id_foreign` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id`) ON DELETE CASCADE;

ALTER TABLE `productos`
  ADD CONSTRAINT `productos_tienda_id_foreign` FOREIGN KEY (`tienda_id`) REFERENCES `tiendas` (`id`) ON DELETE CASCADE;

ALTER TABLE `producto_valor_caracteristica`
  ADD CONSTRAINT `producto_valor_caracteristica_producto_id_foreign` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `producto_valor_caracteristica_valor_caracteristica_id_foreign` FOREIGN KEY (`valor_caracteristica_id`) REFERENCES `valores_caracteristicas` (`id`) ON DELETE CASCADE;

ALTER TABLE `valores_caracteristicas`
  ADD CONSTRAINT `valores_caracteristicas_caracteristica_id_foreign` FOREIGN KEY (`caracteristica_id`) REFERENCES `caracteristicas` (`id`) ON DELETE CASCADE;
COMMIT;