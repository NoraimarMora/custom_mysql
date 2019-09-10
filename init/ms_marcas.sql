
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";

--
-- Estructura de las tablas
--

CREATE TABLE `cuentas_bancarias` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `beneficiario` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tipo_dni` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dni` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `num_cuenta` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tipo_cuenta` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tienda_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `horarios` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `dia` enum('1','2','3','4','5','6','7') COLLATE utf8mb4_unicode_ci NOT NULL,
  `abierto` int(11) NOT NULL,
  `cerrado` int(11) NOT NULL,
  `tienda_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `marcas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `logo_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `banner_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `activo` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2019_05_14_013439_create_marcas_table', 1),
(2, '2019_05_14_013538_create_tiendas_table', 1),
(3, '2019_05_14_013608_create_cuentas_bancarias_table', 1),
(4, '2019_05_14_013636_create_horarios_table', 1);

CREATE TABLE `tiendas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `latitud` double NOT NULL,
  `longitud` double NOT NULL,
  `marca_id` bigint(20) UNSIGNED NOT NULL,
  `activo` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Índices para tablas volcadas
--

ALTER TABLE `cuentas_bancarias`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cuentas_bancarias_tienda_id_foreign` (`tienda_id`);

ALTER TABLE `horarios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `horarios_tienda_id_foreign` (`tienda_id`);

ALTER TABLE `marcas`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `tiendas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tiendas_marca_id_foreign` (`marca_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

ALTER TABLE `cuentas_bancarias`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE `horarios`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE `marcas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

ALTER TABLE `tiendas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restricciones para tablas volcadas
--

ALTER TABLE `cuentas_bancarias`
  ADD CONSTRAINT `cuentas_bancarias_tienda_id_foreign` FOREIGN KEY (`tienda_id`) REFERENCES `tiendas` (`id`) ON DELETE CASCADE;

ALTER TABLE `horarios`
  ADD CONSTRAINT `horarios_tienda_id_foreign` FOREIGN KEY (`tienda_id`) REFERENCES `tiendas` (`id`) ON DELETE CASCADE;

ALTER TABLE `tiendas`
  ADD CONSTRAINT `tiendas_marca_id_foreign` FOREIGN KEY (`marca_id`) REFERENCES `marcas` (`id`) ON DELETE CASCADE;
COMMIT;