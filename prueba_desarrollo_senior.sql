-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 06-10-2023 a las 04:45:50
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
-- Base de datos: `prueba_desarrollo_senior`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `books`
--

CREATE TABLE `books` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `release_date` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `book_type_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `books`
--

INSERT INTO `books` (`id`, `name`, `release_date`, `created_at`, `updated_at`, `deleted_at`, `book_type_id`) VALUES
(1, 'Libro Deporte', '2023-09-30', '2023-10-06 06:25:37', '2023-10-06 06:25:37', NULL, 1),
(2, 'Libro Economía', '2023-10-01', '2023-10-06 06:25:49', '2023-10-06 06:25:49', NULL, 2),
(3, 'Libro Cocina', '2023-09-25', '2023-10-06 06:26:06', '2023-10-06 06:26:06', NULL, 1),
(4, 'Libro Ciencias', '2023-10-04', '2023-10-06 06:26:23', '2023-10-06 06:26:23', NULL, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `book_book_category`
--

CREATE TABLE `book_book_category` (
  `book_id` bigint(20) UNSIGNED NOT NULL,
  `book_category_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `book_book_category`
--

INSERT INTO `book_book_category` (`book_id`, `book_category_id`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `book_categories`
--

CREATE TABLE `book_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `book_categories`
--

INSERT INTO `book_categories` (`id`, `name`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Deporte', '2023-10-06 06:24:45', '2023-10-06 06:24:45', NULL),
(2, 'Economía', '2023-10-06 06:24:51', '2023-10-06 06:24:51', NULL),
(3, 'Cocina', '2023-10-06 06:25:00', '2023-10-06 06:25:00', NULL),
(4, 'Ciencias', '2023-10-06 06:25:09', '2023-10-06 06:25:09', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `book_locations`
--

CREATE TABLE `book_locations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `quantity` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `book_id` bigint(20) UNSIGNED DEFAULT NULL,
  `location_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `book_locations`
--

INSERT INTO `book_locations` (`id`, `quantity`, `created_at`, `updated_at`, `deleted_at`, `book_id`, `location_id`) VALUES
(1, 10, '2023-10-06 06:26:42', '2023-10-06 06:26:42', NULL, 1, 1),
(2, 5, '2023-10-06 06:26:50', '2023-10-06 06:26:50', NULL, 1, 2),
(3, 20, '2023-10-06 06:26:57', '2023-10-06 06:26:57', NULL, 1, 3),
(4, 10, '2023-10-06 06:27:08', '2023-10-06 06:27:08', NULL, 2, 1),
(5, 2, '2023-10-06 06:27:16', '2023-10-06 06:27:16', NULL, 2, 3),
(6, 20, '2023-10-06 06:27:25', '2023-10-06 06:27:25', NULL, 3, 1),
(7, 2, '2023-10-06 06:27:32', '2023-10-06 06:27:32', NULL, 4, 1),
(8, 5, '2023-10-06 06:27:39', '2023-10-06 06:27:39', NULL, 4, 2),
(9, 6, '2023-10-06 06:27:46', '2023-10-06 06:27:46', NULL, 4, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `book_reserves`
--

CREATE TABLE `book_reserves` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `date_from` date NOT NULL,
  `date_to` date NOT NULL,
  `quantity` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `book_id` bigint(20) UNSIGNED DEFAULT NULL,
  `location_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `book_reserves`
--

INSERT INTO `book_reserves` (`id`, `date_from`, `date_to`, `quantity`, `created_at`, `updated_at`, `deleted_at`, `book_id`, `location_id`, `user_id`) VALUES
(1, '2023-10-05', '2023-10-08', 1, '2023-10-06 07:22:16', '2023-10-06 07:22:16', NULL, 1, 2, 1),
(2, '2023-10-05', '2023-10-21', 2, '2023-10-06 07:42:03', '2023-10-06 07:42:03', NULL, 3, 1, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `book_types`
--

CREATE TABLE `book_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `book_types`
--

INSERT INTO `book_types` (`id`, `name`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Digital', '2023-10-06 06:24:34', '2023-10-06 06:24:34', NULL),
(2, 'Fisico', '2023-10-06 06:24:39', '2023-10-06 06:24:39', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `locations`
--

CREATE TABLE `locations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `locations`
--

INSERT INTO `locations` (`id`, `name`, `address`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Biblioteca 1', 'Dirección 1', '2023-10-06 06:24:09', '2023-10-06 06:24:09', NULL),
(2, 'Biblioteca 2', 'Dirección 2', '2023-10-06 06:24:17', '2023-10-06 06:24:17', NULL),
(3, 'Biblioteca 3', 'Dirección 3', '2023-10-06 06:24:26', '2023-10-06 06:24:26', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_100000_create_password_resets_table', 1),
(2, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(3, '2023_10_06_000001_create_permissions_table', 1),
(4, '2023_10_06_000002_create_roles_table', 1),
(5, '2023_10_06_000003_create_users_table', 1),
(6, '2023_10_06_000004_create_book_types_table', 1),
(7, '2023_10_06_000005_create_book_categories_table', 1),
(8, '2023_10_06_000006_create_books_table', 1),
(9, '2023_10_06_000007_create_locations_table', 1),
(10, '2023_10_06_000008_create_book_locations_table', 1),
(11, '2023_10_06_000009_create_book_reserves_table', 1),
(12, '2023_10_06_000010_create_permission_role_pivot_table', 1),
(13, '2023_10_06_000011_create_role_user_pivot_table', 1),
(14, '2023_10_06_000012_create_book_book_category_pivot_table', 1),
(15, '2023_10_06_000013_add_relationship_fields_to_books_table', 1),
(16, '2023_10_06_000014_add_relationship_fields_to_book_locations_table', 1),
(17, '2023_10_06_000015_add_relationship_fields_to_book_reserves_table', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `permissions`
--

INSERT INTO `permissions` (`id`, `title`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'user_management_access', NULL, NULL, NULL),
(2, 'permission_create', NULL, NULL, NULL),
(3, 'permission_edit', NULL, NULL, NULL),
(4, 'permission_show', NULL, NULL, NULL),
(5, 'permission_delete', NULL, NULL, NULL),
(6, 'permission_access', NULL, NULL, NULL),
(7, 'role_create', NULL, NULL, NULL),
(8, 'role_edit', NULL, NULL, NULL),
(9, 'role_show', NULL, NULL, NULL),
(10, 'role_delete', NULL, NULL, NULL),
(11, 'role_access', NULL, NULL, NULL),
(12, 'user_create', NULL, NULL, NULL),
(13, 'user_edit', NULL, NULL, NULL),
(14, 'user_show', NULL, NULL, NULL),
(15, 'user_delete', NULL, NULL, NULL),
(16, 'user_access', NULL, NULL, NULL),
(17, 'book_menu_access', NULL, NULL, NULL),
(18, 'book_type_create', NULL, NULL, NULL),
(19, 'book_type_edit', NULL, NULL, NULL),
(20, 'book_type_show', NULL, NULL, NULL),
(21, 'book_type_delete', NULL, NULL, NULL),
(22, 'book_type_access', NULL, NULL, NULL),
(23, 'book_category_create', NULL, NULL, NULL),
(24, 'book_category_edit', NULL, NULL, NULL),
(25, 'book_category_show', NULL, NULL, NULL),
(26, 'book_category_delete', NULL, NULL, NULL),
(27, 'book_category_access', NULL, NULL, NULL),
(28, 'book_create', NULL, NULL, NULL),
(29, 'book_edit', NULL, NULL, NULL),
(30, 'book_show', NULL, NULL, NULL),
(31, 'book_delete', NULL, NULL, NULL),
(32, 'book_access', NULL, NULL, NULL),
(33, 'rent_menu_access', NULL, NULL, NULL),
(34, 'location_create', NULL, NULL, NULL),
(35, 'location_edit', NULL, NULL, NULL),
(36, 'location_show', NULL, NULL, NULL),
(37, 'location_delete', NULL, NULL, NULL),
(38, 'location_access', NULL, NULL, NULL),
(39, 'general_menu_access', NULL, NULL, NULL),
(40, 'book_location_create', NULL, NULL, NULL),
(41, 'book_location_edit', NULL, NULL, NULL),
(42, 'book_location_show', NULL, NULL, NULL),
(43, 'book_location_delete', NULL, NULL, NULL),
(44, 'book_location_access', NULL, NULL, NULL),
(45, 'book_reserf_create', NULL, NULL, NULL),
(46, 'book_reserf_edit', NULL, NULL, NULL),
(47, 'book_reserf_show', NULL, NULL, NULL),
(48, 'book_reserf_delete', NULL, NULL, NULL),
(49, 'book_reserf_access', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permission_role`
--

CREATE TABLE `permission_role` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `permission_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `permission_role`
--

INSERT INTO `permission_role` (`role_id`, `permission_id`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(1, 6),
(1, 7),
(1, 8),
(1, 9),
(1, 10),
(1, 11),
(1, 12),
(1, 13),
(1, 14),
(1, 15),
(1, 16),
(1, 17),
(1, 18),
(1, 19),
(1, 20),
(1, 21),
(1, 22),
(1, 23),
(1, 24),
(1, 25),
(1, 26),
(1, 27),
(1, 28),
(1, 29),
(1, 30),
(1, 31),
(1, 32),
(1, 33),
(1, 34),
(1, 35),
(1, 36),
(1, 37),
(1, 38),
(1, 39),
(1, 40),
(1, 41),
(1, 42),
(1, 43),
(1, 44),
(1, 45),
(1, 46),
(1, 47),
(1, 48),
(1, 49),
(2, 33),
(2, 45),
(2, 46),
(2, 47),
(2, 48),
(2, 49);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id`, `title`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Administrador', NULL, NULL, NULL),
(2, 'Usuario Genérico', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `role_user`
--

CREATE TABLE `role_user` (
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `role_user`
--

INSERT INTO `role_user` (`user_id`, `role_id`) VALUES
(1, 1),
(2, 2),
(3, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` datetime DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Administrador', 'admin@admin.com', NULL, '$2y$10$/.9E/bNVdupjCDSwhh9ChufJ3sflwwtOv8MxVD5/aPBR8SP5d46ae', NULL, NULL, NULL, NULL),
(2, 'User Test 1', 'user1@gmail.com', NULL, '$2y$10$ZndD2dCmuU/pcgxjqZVyFehuUZqXeFcNYLGMNmxiHX8ulX0TBPt/q', NULL, '2023-10-06 06:36:52', '2023-10-06 06:36:52', NULL),
(3, 'User Test 2', 'user2@gmail.com', NULL, '$2y$10$zQm.fdhjxnL5E6LEAELWZecDlmDU9z.zu7az8NkFu0FNWNHkgp05O', NULL, '2023-10-06 06:37:15', '2023-10-06 06:37:15', NULL);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`id`),
  ADD KEY `book_type_fk_9080276` (`book_type_id`);

--
-- Indices de la tabla `book_book_category`
--
ALTER TABLE `book_book_category`
  ADD KEY `book_id_fk_9080277` (`book_id`),
  ADD KEY `book_category_id_fk_9080277` (`book_category_id`);

--
-- Indices de la tabla `book_categories`
--
ALTER TABLE `book_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `book_locations`
--
ALTER TABLE `book_locations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `book_fk_9080374` (`book_id`),
  ADD KEY `location_fk_9080375` (`location_id`);

--
-- Indices de la tabla `book_reserves`
--
ALTER TABLE `book_reserves`
  ADD PRIMARY KEY (`id`),
  ADD KEY `book_fk_9080381` (`book_id`),
  ADD KEY `location_fk_9080382` (`location_id`),
  ADD KEY `user_fk_9080386` (`user_id`);

--
-- Indices de la tabla `book_types`
--
ALTER TABLE `book_types`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `locations`
--
ALTER TABLE `locations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indices de la tabla `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `permission_role`
--
ALTER TABLE `permission_role`
  ADD KEY `role_id_fk_9080250` (`role_id`),
  ADD KEY `permission_id_fk_9080250` (`permission_id`);

--
-- Indices de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `role_user`
--
ALTER TABLE `role_user`
  ADD KEY `user_id_fk_9080259` (`user_id`),
  ADD KEY `role_id_fk_9080259` (`role_id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `books`
--
ALTER TABLE `books`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `book_categories`
--
ALTER TABLE `book_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `book_locations`
--
ALTER TABLE `book_locations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `book_reserves`
--
ALTER TABLE `book_reserves`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `book_types`
--
ALTER TABLE `book_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `locations`
--
ALTER TABLE `locations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `books`
--
ALTER TABLE `books`
  ADD CONSTRAINT `book_type_fk_9080276` FOREIGN KEY (`book_type_id`) REFERENCES `book_types` (`id`);

--
-- Filtros para la tabla `book_book_category`
--
ALTER TABLE `book_book_category`
  ADD CONSTRAINT `book_category_id_fk_9080277` FOREIGN KEY (`book_category_id`) REFERENCES `book_categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `book_id_fk_9080277` FOREIGN KEY (`book_id`) REFERENCES `books` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `book_locations`
--
ALTER TABLE `book_locations`
  ADD CONSTRAINT `book_fk_9080374` FOREIGN KEY (`book_id`) REFERENCES `books` (`id`),
  ADD CONSTRAINT `location_fk_9080375` FOREIGN KEY (`location_id`) REFERENCES `locations` (`id`);

--
-- Filtros para la tabla `book_reserves`
--
ALTER TABLE `book_reserves`
  ADD CONSTRAINT `book_fk_9080381` FOREIGN KEY (`book_id`) REFERENCES `books` (`id`),
  ADD CONSTRAINT `location_fk_9080382` FOREIGN KEY (`location_id`) REFERENCES `locations` (`id`),
  ADD CONSTRAINT `user_fk_9080386` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `permission_role`
--
ALTER TABLE `permission_role`
  ADD CONSTRAINT `permission_id_fk_9080250` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_id_fk_9080250` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `role_user`
--
ALTER TABLE `role_user`
  ADD CONSTRAINT `role_id_fk_9080259` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_id_fk_9080259` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
