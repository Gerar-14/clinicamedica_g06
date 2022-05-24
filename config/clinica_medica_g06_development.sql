-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 24-05-2022 a las 04:34:25
-- Versión del servidor: 10.4.18-MariaDB
-- Versión de PHP: 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `clinica_medica_g06_development`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `accesos`
--

CREATE TABLE `accesos` (
  `id` bigint(20) NOT NULL,
  `rol_id` bigint(20) NOT NULL,
  `permiso_id` bigint(20) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `accesos`
--

INSERT INTO `accesos` (`id`, `rol_id`, `permiso_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000'),
(2, 1, 2, '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000'),
(3, 1, 3, '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000'),
(4, 1, 4, '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000'),
(5, 1, 5, '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `areas`
--

CREATE TABLE `areas` (
  `id` bigint(20) NOT NULL,
  `nombre_area` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `area_tipo_examen`
--

CREATE TABLE `area_tipo_examen` (
  `id` bigint(20) NOT NULL,
  `area_id` bigint(20) NOT NULL,
  `tipo_examen_id` bigint(20) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ar_internal_metadata`
--

CREATE TABLE `ar_internal_metadata` (
  `key` varchar(255) NOT NULL,
  `value` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `ar_internal_metadata`
--

INSERT INTO `ar_internal_metadata` (`key`, `value`, `created_at`, `updated_at`) VALUES
('environment', 'development', '2022-05-24 00:26:41.544067', '2022-05-24 00:26:41.544067');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `countries`
--

CREATE TABLE `countries` (
  `id` bigint(20) NOT NULL,
  `nombre_country` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `countries`
--

INSERT INTO `countries` (`id`, `nombre_country`, `created_at`, `updated_at`) VALUES
(1, 'El Salvador', '2022-05-24 00:43:14.182586', '2022-05-24 00:43:14.182586');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `departamentos`
--

CREATE TABLE `departamentos` (
  `id` bigint(20) NOT NULL,
  `nombre_departamento` varchar(255) DEFAULT NULL,
  `country_id` bigint(20) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `departamentos`
--

INSERT INTO `departamentos` (`id`, `nombre_departamento`, `country_id`, `created_at`, `updated_at`) VALUES
(1, 'Ahuachapan', 1, '2022-05-24 00:45:25.340281', '2022-05-24 00:45:25.340281'),
(2, 'Cabañas', 1, '2022-05-24 00:45:52.567715', '2022-05-24 00:45:52.567715'),
(3, 'Chalatenango', 1, '2022-05-24 00:46:17.238248', '2022-05-24 00:46:17.238248'),
(4, 'Cuscatlán', 1, '2022-05-24 00:46:41.762533', '2022-05-24 00:46:41.762533'),
(5, 'La Libertad', 1, '2022-05-24 00:46:55.068356', '2022-05-24 00:46:55.068356'),
(6, 'Morazán', 1, '2022-05-24 00:47:12.084051', '2022-05-24 00:47:12.084051'),
(7, 'La Paz', 1, '2022-05-24 00:47:23.885897', '2022-05-24 00:47:23.885897'),
(8, 'Santa Ana', 1, '2022-05-24 00:47:38.419460', '2022-05-24 00:47:38.419460'),
(9, 'San Miguel', 1, '2022-05-24 00:49:39.365162', '2022-05-24 00:49:39.365162'),
(10, 'San Salvador', 1, '2022-05-24 00:49:51.257010', '2022-05-24 00:49:51.257010'),
(11, 'San Vicente', 1, '2022-05-24 00:50:07.319805', '2022-05-24 00:50:07.319805'),
(12, 'Sonsonate', 1, '2022-05-24 00:51:01.407049', '2022-05-24 00:51:01.407049'),
(13, 'La Unión', 1, '2022-05-24 00:51:29.839471', '2022-05-24 00:51:29.839471'),
(14, 'Usulután', 1, '2022-05-24 00:51:46.839825', '2022-05-24 00:51:46.839825');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleados`
--

CREATE TABLE `empleados` (
  `id` bigint(20) NOT NULL,
  `nombre_empleado` varchar(255) DEFAULT NULL,
  `apellido_empleado` varchar(255) DEFAULT NULL,
  `profesion` varchar(255) DEFAULT NULL,
  `dui_empleado` varchar(255) DEFAULT NULL,
  `municipio_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `empleados`
--

INSERT INTO `empleados` (`id`, `nombre_empleado`, `apellido_empleado`, `profesion`, `dui_empleado`, `municipio_id`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 'José Manuel', 'Martínez Alvarado', 'Ingeniero de Sistemas', '05789765-3', 10, 1, '2022-05-24 01:16:35.255718', '2022-05-24 01:20:35.668285'),
(2, 'Ana Maria', 'Escobar López', 'Laboratorista', '03187129-1', 10, 2, '2022-05-24 01:18:36.444069', '2022-05-24 01:18:36.444069'),
(3, 'Juan Carlos', 'Méndez Pérez', 'Jefe de Laboratorio', '08257190-7', 10, 3, '2022-05-24 01:20:21.978966', '2022-05-24 01:20:21.978966'),
(4, 'Daniela Helena', 'Campos Rodríguez', 'Recepcionista', '09126783-5', 10, 4, '2022-05-24 01:22:50.355146', '2022-05-24 01:22:50.355146');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `laboratorios`
--

CREATE TABLE `laboratorios` (
  `id` bigint(20) NOT NULL,
  `nombre_laboratorio` varchar(255) DEFAULT NULL,
  `municipio_id` bigint(20) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `laboratorista`
--

CREATE TABLE `laboratorista` (
  `id` bigint(20) NOT NULL,
  `num_junta_vigilancia` varchar(255) DEFAULT NULL,
  `laboratorio_id` bigint(20) NOT NULL,
  `empleado_id` bigint(20) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `menus`
--

CREATE TABLE `menus` (
  `id` bigint(20) NOT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `menu_id` bigint(20) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `menus`
--

INSERT INTO `menus` (`id`, `nombre`, `menu_id`, `created_at`, `updated_at`) VALUES
(1, 'Menú', NULL, '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000'),
(2, 'Mostrar Menú', 1, '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000'),
(3, 'Detalle Menú', 1, '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000'),
(4, 'Editar Menú', 1, '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000'),
(5, 'Eliminar Menú', 1, '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000'),
(6, 'Crear Menú', 1, '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000'),
(7, 'Tipo Sangre', NULL, '2022-05-24 02:31:36.762691', '2022-05-24 02:31:36.762691'),
(8, 'Crear Tipo de Sangre', 7, '2022-05-24 02:32:00.420090', '2022-05-24 02:32:42.297428');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `menu_permisos`
--

CREATE TABLE `menu_permisos` (
  `id` bigint(20) NOT NULL,
  `menu_id` bigint(20) NOT NULL,
  `permiso_id` bigint(20) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `menu_permisos`
--

INSERT INTO `menu_permisos` (`id`, `menu_id`, `permiso_id`, `created_at`, `updated_at`) VALUES
(1, 2, 1, '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000'),
(2, 3, 2, '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000'),
(3, 4, 3, '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000'),
(4, 5, 4, '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000'),
(5, 6, 5, '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `menu_rols`
--

CREATE TABLE `menu_rols` (
  `id` bigint(20) NOT NULL,
  `menu_id` bigint(20) NOT NULL,
  `rol_id` bigint(20) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `menu_rols`
--

INSERT INTO `menu_rols` (`id`, `menu_id`, `rol_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000'),
(2, 2, 1, '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000'),
(3, 3, 1, '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000'),
(4, 4, 1, '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000'),
(5, 5, 1, '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000'),
(6, 6, 1, '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `muestras`
--

CREATE TABLE `muestras` (
  `id` bigint(20) NOT NULL,
  `tipo_muestra` varchar(255) DEFAULT NULL,
  `fecha_entrega_muestra` datetime(6) DEFAULT NULL,
  `empleado_id` bigint(20) NOT NULL,
  `orden_tipo_examen_id` bigint(20) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `municipios`
--

CREATE TABLE `municipios` (
  `id` bigint(20) NOT NULL,
  `nombre_municipio` varchar(255) DEFAULT NULL,
  `departamento_id` bigint(20) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `municipios`
--

INSERT INTO `municipios` (`id`, `nombre_municipio`, `departamento_id`, `created_at`, `updated_at`) VALUES
(1, 'Soyapango', 10, '2022-05-24 01:00:04.362199', '2022-05-24 01:00:04.362199'),
(2, 'Atiquizaya', 1, '2022-05-24 01:00:49.047108', '2022-05-24 01:00:49.047108'),
(3, 'Sensuntepeque', 2, '2022-05-24 01:01:20.114254', '2022-05-24 01:01:20.114254'),
(4, 'Agua Caliente', 3, '2022-05-24 01:02:16.161586', '2022-05-24 01:02:16.161586'),
(5, 'El Rosario', 4, '2022-05-24 01:03:02.485663', '2022-05-24 01:03:02.485663'),
(6, 'Antiguo Cuscatlan', 5, '2022-05-24 01:03:54.226946', '2022-05-24 01:03:54.226946'),
(7, 'Cacaopera', 6, '2022-05-24 01:04:24.986034', '2022-05-24 01:04:24.986034'),
(8, 'Olocuilta', 7, '2022-05-24 01:05:21.680120', '2022-05-24 01:05:21.680120'),
(9, 'Chalchuapa', 8, '2022-05-24 01:06:01.399658', '2022-05-24 01:06:01.399658'),
(10, 'Chinameca', 9, '2022-05-24 01:06:50.859111', '2022-05-24 01:06:50.859111'),
(11, 'Apastepeque', 11, '2022-05-24 01:07:23.378546', '2022-05-24 01:07:23.378546'),
(12, 'Acajutla', 12, '2022-05-24 01:08:00.167450', '2022-05-24 01:08:00.167450'),
(13, 'El Sauce', 13, '2022-05-24 01:08:56.024961', '2022-05-24 01:08:56.024961'),
(14, 'Jiquilisco', 14, '2022-05-24 01:09:39.179445', '2022-05-24 01:09:39.179445');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ordens`
--

CREATE TABLE `ordens` (
  `id` bigint(20) NOT NULL,
  `fecha_examen` datetime(6) DEFAULT NULL,
  `paciente_id` bigint(20) NOT NULL,
  `laboratorista_id` bigint(20) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `orden_tipo_examen`
--

CREATE TABLE `orden_tipo_examen` (
  `id` bigint(20) NOT NULL,
  `tipo_examen_id` bigint(20) NOT NULL,
  `orden_id` bigint(20) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pacientes`
--

CREATE TABLE `pacientes` (
  `id` bigint(20) NOT NULL,
  `nombre_paciente` varchar(255) DEFAULT NULL,
  `apellido_paciente` varchar(255) DEFAULT NULL,
  `genero_paciente` varchar(255) DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `telefono` varchar(255) DEFAULT NULL,
  `telefono_celular` varchar(255) DEFAULT NULL,
  `telefono_contacto` varchar(255) DEFAULT NULL,
  `correo_electronico` varchar(255) DEFAULT NULL,
  `apellido_casado` varchar(255) DEFAULT NULL,
  `estado_civil` varchar(255) DEFAULT NULL,
  `dui_paciente` varchar(255) DEFAULT NULL,
  `pasaporte` varchar(255) DEFAULT NULL,
  `municipio_id` bigint(20) NOT NULL,
  `tipo_sangre_id` bigint(20) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `parametros`
--

CREATE TABLE `parametros` (
  `id` bigint(20) NOT NULL,
  `nombre_parametro` varchar(255) DEFAULT NULL,
  `tipo_parametro` int(11) DEFAULT NULL,
  `unidad_medida_id` bigint(20) NOT NULL,
  `parametro_id` bigint(20) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permisos`
--

CREATE TABLE `permisos` (
  `id` bigint(20) NOT NULL,
  `nombre_permiso` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `ruta` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `permisos`
--

INSERT INTO `permisos` (`id`, `nombre_permiso`, `created_at`, `updated_at`, `ruta`) VALUES
(1, 'Mostrar Menú', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', '/menus'),
(2, 'Detalle Menús', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', '/menus/:id'),
(3, 'Editar Menú', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', '/menus/:id/edit'),
(4, 'Eliminar Menú', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', '/menus/:id'),
(5, 'Crear Menú', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', '/menus/new');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `resultados`
--

CREATE TABLE `resultados` (
  `id` bigint(20) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `parametro_id` bigint(20) NOT NULL,
  `orden_id` bigint(20) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rols`
--

CREATE TABLE `rols` (
  `id` bigint(20) NOT NULL,
  `nombre_rol` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `rols`
--

INSERT INTO `rols` (`id`, `nombre_rol`, `created_at`, `updated_at`) VALUES
(1, 'Administrador', '2022-05-24 01:27:10.263531', '2022-05-24 01:27:10.263531'),
(2, 'Recepcionista', '2022-05-24 01:27:42.463632', '2022-05-24 01:27:42.463632'),
(3, 'Laboratorista', '2022-05-24 01:27:56.036431', '2022-05-24 01:27:56.036431'),
(4, 'Jefe de Laboratorio', '2022-05-24 01:29:48.448108', '2022-05-24 01:29:48.448108');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol_empleados`
--

CREATE TABLE `rol_empleados` (
  `id` bigint(20) NOT NULL,
  `rol_id` bigint(20) NOT NULL,
  `empleado_id` bigint(20) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `rol_empleados`
--

INSERT INTO `rol_empleados` (`id`, `rol_id`, `empleado_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '2022-05-24 01:34:09.914510', '2022-05-24 01:34:09.914510'),
(2, 2, 4, '2022-05-24 01:34:38.821815', '2022-05-24 01:34:38.821815'),
(3, 3, 2, '2022-05-24 01:38:39.996798', '2022-05-24 01:38:39.996798'),
(4, 4, 3, '2022-05-24 01:39:05.750504', '2022-05-24 01:39:05.750504');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `schema_migrations`
--

CREATE TABLE `schema_migrations` (
  `version` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `schema_migrations`
--

INSERT INTO `schema_migrations` (`version`) VALUES
('20220520170404'),
('20220521032142'),
('20220522013830'),
('20220522014219'),
('20220522014644'),
('20220522015044'),
('20220522020721'),
('20220522021110'),
('20220522021111'),
('20220522190528'),
('20220522190628'),
('20220522190719'),
('20220522190819'),
('20220522191619'),
('20220522191751'),
('20220522191843'),
('20220522191939'),
('20220522192034'),
('20220522192125'),
('20220522192217'),
('20220522192329'),
('20220522192426'),
('20220522192534'),
('20220522192639'),
('20220522192725'),
('20220522192830'),
('20220522193307'),
('20220522193417'),
('20220522230748');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_examen`
--

CREATE TABLE `tipo_examen` (
  `id` bigint(20) NOT NULL,
  `nombre_tipo_examen` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_examen_parametros`
--

CREATE TABLE `tipo_examen_parametros` (
  `id` bigint(20) NOT NULL,
  `parametro_id` bigint(20) NOT NULL,
  `tipo_examen_id` bigint(20) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_sangres`
--

CREATE TABLE `tipo_sangres` (
  `id` bigint(20) NOT NULL,
  `nombre_tipo_sangre` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `unidad_medidas`
--

CREATE TABLE `unidad_medidas` (
  `id` bigint(20) NOT NULL,
  `nombre_unidad_medida` varchar(255) DEFAULT NULL,
  `siglas` varchar(255) DEFAULT NULL,
  `sistema_medida` varchar(255) DEFAULT NULL,
  `descripcion_unidad_medida` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` bigint(20) NOT NULL,
  `email` varchar(255) NOT NULL DEFAULT '',
  `encrypted_password` varchar(255) NOT NULL DEFAULT '',
  `reset_password_token` varchar(255) DEFAULT NULL,
  `reset_password_sent_at` datetime(6) DEFAULT NULL,
  `remember_created_at` datetime(6) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `password_salt` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `email`, `encrypted_password`, `reset_password_token`, `reset_password_sent_at`, `remember_created_at`, `created_at`, `updated_at`, `password_salt`) VALUES
(1, 'administrador@gmail.com', '562a98fb91e0ea2febed3746698e2e1ebf5ac71d77cb2f43e0a7adcf435bd42d922048e60943b9b4e5fe56a0d0d6f53841453444594ddc7ab626eb9486bcedb1', NULL, NULL, NULL, '2022-05-24 00:35:01.104317', '2022-05-24 00:35:01.104317', '8pPNenLokzGp9zS4TQ6a'),
(2, 'laboratorista@gmail.com', '55417dea87524dd036917d1179e2142d668ac7f5c4b8ddfef0b8ca2d451fd7a74e6a71223efea50b1f92bb879a2ba1471a06fce5a1456b29991769333611fb1c', NULL, NULL, NULL, '2022-05-24 00:35:51.434683', '2022-05-24 00:35:51.434683', 'YCZf2AyuPmUerryanR1Y'),
(3, 'jefelaboratorista@gmail.com', 'ee06ed16c835aef555345fefb9277dabdf7b21ee9cc5a40ab961ad64965e2f77a744414e88064b925fdeb40c0834527ca0365385740f8ac4d5ac7d195c554732', NULL, NULL, NULL, '2022-05-24 00:37:11.129879', '2022-05-24 00:37:11.129879', 'ZWxvqtYBxvw9DGya8Gbo'),
(4, 'recepcionista@gmail.com', '00a32731083f8b3619592de13d052296d4122de831dafaf116aef16b143b31ff60136a244c6fcaf2606585266abbaed14da6aac271300f79a63b2957abb9b7de', NULL, NULL, NULL, '2022-05-24 00:38:02.437251', '2022-05-24 00:38:02.437251', '3FTGUc6XX6prYLy5Szmm');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `valor_referencia`
--

CREATE TABLE `valor_referencia` (
  `id` bigint(20) NOT NULL,
  `valor_referencia` varchar(255) DEFAULT NULL,
  `parametro_id` bigint(20) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `accesos`
--
ALTER TABLE `accesos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `index_accesos_on_rol_id` (`rol_id`),
  ADD KEY `index_accesos_on_permiso_id` (`permiso_id`);

--
-- Indices de la tabla `areas`
--
ALTER TABLE `areas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `area_tipo_examen`
--
ALTER TABLE `area_tipo_examen`
  ADD PRIMARY KEY (`id`),
  ADD KEY `index_area_tipo_examen_on_area_id` (`area_id`),
  ADD KEY `index_area_tipo_examen_on_tipo_examen_id` (`tipo_examen_id`);

--
-- Indices de la tabla `ar_internal_metadata`
--
ALTER TABLE `ar_internal_metadata`
  ADD PRIMARY KEY (`key`);

--
-- Indices de la tabla `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `departamentos`
--
ALTER TABLE `departamentos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `index_departamentos_on_country_id` (`country_id`);

--
-- Indices de la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD PRIMARY KEY (`id`),
  ADD KEY `index_empleados_on_municipio_id` (`municipio_id`),
  ADD KEY `index_empleados_on_user_id` (`user_id`);

--
-- Indices de la tabla `laboratorios`
--
ALTER TABLE `laboratorios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `index_laboratorios_on_municipio_id` (`municipio_id`);

--
-- Indices de la tabla `laboratorista`
--
ALTER TABLE `laboratorista`
  ADD PRIMARY KEY (`id`),
  ADD KEY `index_laboratorista_on_laboratorio_id` (`laboratorio_id`),
  ADD KEY `index_laboratorista_on_empleado_id` (`empleado_id`);

--
-- Indices de la tabla `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`),
  ADD KEY `index_menus_on_menu_id` (`menu_id`);

--
-- Indices de la tabla `menu_permisos`
--
ALTER TABLE `menu_permisos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `index_menu_permisos_on_menu_id` (`menu_id`),
  ADD KEY `index_menu_permisos_on_permiso_id` (`permiso_id`);

--
-- Indices de la tabla `menu_rols`
--
ALTER TABLE `menu_rols`
  ADD PRIMARY KEY (`id`),
  ADD KEY `index_menu_rols_on_menu_id` (`menu_id`),
  ADD KEY `index_menu_rols_on_rol_id` (`rol_id`);

--
-- Indices de la tabla `muestras`
--
ALTER TABLE `muestras`
  ADD PRIMARY KEY (`id`),
  ADD KEY `index_muestras_on_empleado_id` (`empleado_id`),
  ADD KEY `index_muestras_on_orden_tipo_examen_id` (`orden_tipo_examen_id`);

--
-- Indices de la tabla `municipios`
--
ALTER TABLE `municipios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `index_municipios_on_departamento_id` (`departamento_id`);

--
-- Indices de la tabla `ordens`
--
ALTER TABLE `ordens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `index_ordens_on_paciente_id` (`paciente_id`),
  ADD KEY `index_ordens_on_laboratorista_id` (`laboratorista_id`);

--
-- Indices de la tabla `orden_tipo_examen`
--
ALTER TABLE `orden_tipo_examen`
  ADD PRIMARY KEY (`id`),
  ADD KEY `index_orden_tipo_examen_on_tipo_examen_id` (`tipo_examen_id`),
  ADD KEY `index_orden_tipo_examen_on_orden_id` (`orden_id`);

--
-- Indices de la tabla `pacientes`
--
ALTER TABLE `pacientes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `index_pacientes_on_municipio_id` (`municipio_id`),
  ADD KEY `index_pacientes_on_tipo_sangre_id` (`tipo_sangre_id`);

--
-- Indices de la tabla `parametros`
--
ALTER TABLE `parametros`
  ADD PRIMARY KEY (`id`),
  ADD KEY `index_parametros_on_unidad_medida_id` (`unidad_medida_id`),
  ADD KEY `index_parametros_on_parametro_id` (`parametro_id`);

--
-- Indices de la tabla `permisos`
--
ALTER TABLE `permisos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `resultados`
--
ALTER TABLE `resultados`
  ADD PRIMARY KEY (`id`),
  ADD KEY `index_resultados_on_parametro_id` (`parametro_id`),
  ADD KEY `index_resultados_on_orden_id` (`orden_id`);

--
-- Indices de la tabla `rols`
--
ALTER TABLE `rols`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `rol_empleados`
--
ALTER TABLE `rol_empleados`
  ADD PRIMARY KEY (`id`),
  ADD KEY `index_rol_empleados_on_rol_id` (`rol_id`),
  ADD KEY `index_rol_empleados_on_empleado_id` (`empleado_id`);

--
-- Indices de la tabla `schema_migrations`
--
ALTER TABLE `schema_migrations`
  ADD PRIMARY KEY (`version`);

--
-- Indices de la tabla `tipo_examen`
--
ALTER TABLE `tipo_examen`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tipo_examen_parametros`
--
ALTER TABLE `tipo_examen_parametros`
  ADD PRIMARY KEY (`id`),
  ADD KEY `index_tipo_examen_parametros_on_parametro_id` (`parametro_id`),
  ADD KEY `index_tipo_examen_parametros_on_tipo_examen_id` (`tipo_examen_id`);

--
-- Indices de la tabla `tipo_sangres`
--
ALTER TABLE `tipo_sangres`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `unidad_medidas`
--
ALTER TABLE `unidad_medidas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `index_users_on_email` (`email`),
  ADD UNIQUE KEY `index_users_on_reset_password_token` (`reset_password_token`);

--
-- Indices de la tabla `valor_referencia`
--
ALTER TABLE `valor_referencia`
  ADD PRIMARY KEY (`id`),
  ADD KEY `index_valor_referencia_on_parametro_id` (`parametro_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `accesos`
--
ALTER TABLE `accesos`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `areas`
--
ALTER TABLE `areas`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `area_tipo_examen`
--
ALTER TABLE `area_tipo_examen`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `countries`
--
ALTER TABLE `countries`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `departamentos`
--
ALTER TABLE `departamentos`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `empleados`
--
ALTER TABLE `empleados`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `laboratorios`
--
ALTER TABLE `laboratorios`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `laboratorista`
--
ALTER TABLE `laboratorista`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `menus`
--
ALTER TABLE `menus`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `menu_permisos`
--
ALTER TABLE `menu_permisos`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `menu_rols`
--
ALTER TABLE `menu_rols`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `muestras`
--
ALTER TABLE `muestras`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `municipios`
--
ALTER TABLE `municipios`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `ordens`
--
ALTER TABLE `ordens`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `orden_tipo_examen`
--
ALTER TABLE `orden_tipo_examen`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pacientes`
--
ALTER TABLE `pacientes`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `parametros`
--
ALTER TABLE `parametros`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `permisos`
--
ALTER TABLE `permisos`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `resultados`
--
ALTER TABLE `resultados`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `rols`
--
ALTER TABLE `rols`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `rol_empleados`
--
ALTER TABLE `rol_empleados`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `tipo_examen`
--
ALTER TABLE `tipo_examen`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tipo_examen_parametros`
--
ALTER TABLE `tipo_examen_parametros`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tipo_sangres`
--
ALTER TABLE `tipo_sangres`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `unidad_medidas`
--
ALTER TABLE `unidad_medidas`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `valor_referencia`
--
ALTER TABLE `valor_referencia`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `accesos`
--
ALTER TABLE `accesos`
  ADD CONSTRAINT `fk_rails_8bc1dd1ada` FOREIGN KEY (`permiso_id`) REFERENCES `permisos` (`id`),
  ADD CONSTRAINT `fk_rails_9fafd79768` FOREIGN KEY (`rol_id`) REFERENCES `rols` (`id`);

--
-- Filtros para la tabla `area_tipo_examen`
--
ALTER TABLE `area_tipo_examen`
  ADD CONSTRAINT `fk_rails_ded57f4b30` FOREIGN KEY (`area_id`) REFERENCES `areas` (`id`),
  ADD CONSTRAINT `fk_rails_fcd1d5f3d4` FOREIGN KEY (`tipo_examen_id`) REFERENCES `tipo_examen` (`id`);

--
-- Filtros para la tabla `departamentos`
--
ALTER TABLE `departamentos`
  ADD CONSTRAINT `fk_rails_1226b42850` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`);

--
-- Filtros para la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD CONSTRAINT `fk_rails_515956b146` FOREIGN KEY (`municipio_id`) REFERENCES `municipios` (`id`),
  ADD CONSTRAINT `fk_rails_c219bfb5b3` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `laboratorios`
--
ALTER TABLE `laboratorios`
  ADD CONSTRAINT `fk_rails_06cba3315e` FOREIGN KEY (`municipio_id`) REFERENCES `municipios` (`id`);

--
-- Filtros para la tabla `laboratorista`
--
ALTER TABLE `laboratorista`
  ADD CONSTRAINT `fk_rails_926bfc8318` FOREIGN KEY (`empleado_id`) REFERENCES `empleados` (`id`),
  ADD CONSTRAINT `fk_rails_a316d6d983` FOREIGN KEY (`laboratorio_id`) REFERENCES `laboratorios` (`id`);

--
-- Filtros para la tabla `menus`
--
ALTER TABLE `menus`
  ADD CONSTRAINT `fk_rails_9442e9859c` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`);

--
-- Filtros para la tabla `menu_permisos`
--
ALTER TABLE `menu_permisos`
  ADD CONSTRAINT `fk_rails_34cd798aeb` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`),
  ADD CONSTRAINT `fk_rails_8d4c2ff555` FOREIGN KEY (`permiso_id`) REFERENCES `permisos` (`id`);

--
-- Filtros para la tabla `menu_rols`
--
ALTER TABLE `menu_rols`
  ADD CONSTRAINT `fk_rails_88e6716973` FOREIGN KEY (`rol_id`) REFERENCES `rols` (`id`),
  ADD CONSTRAINT `fk_rails_8dcf0fb3ed` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`);

--
-- Filtros para la tabla `muestras`
--
ALTER TABLE `muestras`
  ADD CONSTRAINT `fk_rails_9ea797143f` FOREIGN KEY (`empleado_id`) REFERENCES `empleados` (`id`),
  ADD CONSTRAINT `fk_rails_b719eedaf3` FOREIGN KEY (`orden_tipo_examen_id`) REFERENCES `orden_tipo_examen` (`id`);

--
-- Filtros para la tabla `municipios`
--
ALTER TABLE `municipios`
  ADD CONSTRAINT `fk_rails_3e2b31ed2a` FOREIGN KEY (`departamento_id`) REFERENCES `departamentos` (`id`);

--
-- Filtros para la tabla `ordens`
--
ALTER TABLE `ordens`
  ADD CONSTRAINT `fk_rails_90a84a09d7` FOREIGN KEY (`paciente_id`) REFERENCES `pacientes` (`id`),
  ADD CONSTRAINT `fk_rails_dec68fa5b4` FOREIGN KEY (`laboratorista_id`) REFERENCES `laboratorista` (`id`);

--
-- Filtros para la tabla `orden_tipo_examen`
--
ALTER TABLE `orden_tipo_examen`
  ADD CONSTRAINT `fk_rails_2809a11da3` FOREIGN KEY (`orden_id`) REFERENCES `ordens` (`id`),
  ADD CONSTRAINT `fk_rails_45067d63f3` FOREIGN KEY (`tipo_examen_id`) REFERENCES `tipo_examen` (`id`);

--
-- Filtros para la tabla `pacientes`
--
ALTER TABLE `pacientes`
  ADD CONSTRAINT `fk_rails_72c7ecac3a` FOREIGN KEY (`tipo_sangre_id`) REFERENCES `tipo_sangres` (`id`),
  ADD CONSTRAINT `fk_rails_7c8b637667` FOREIGN KEY (`municipio_id`) REFERENCES `municipios` (`id`);

--
-- Filtros para la tabla `parametros`
--
ALTER TABLE `parametros`
  ADD CONSTRAINT `fk_rails_7f8421b9ea` FOREIGN KEY (`unidad_medida_id`) REFERENCES `unidad_medidas` (`id`),
  ADD CONSTRAINT `fk_rails_94d09e98e1` FOREIGN KEY (`parametro_id`) REFERENCES `parametros` (`id`);

--
-- Filtros para la tabla `resultados`
--
ALTER TABLE `resultados`
  ADD CONSTRAINT `fk_rails_0587426348` FOREIGN KEY (`parametro_id`) REFERENCES `parametros` (`id`),
  ADD CONSTRAINT `fk_rails_3a1fc3eb5e` FOREIGN KEY (`orden_id`) REFERENCES `ordens` (`id`);

--
-- Filtros para la tabla `rol_empleados`
--
ALTER TABLE `rol_empleados`
  ADD CONSTRAINT `fk_rails_852c9ea15f` FOREIGN KEY (`rol_id`) REFERENCES `rols` (`id`),
  ADD CONSTRAINT `fk_rails_cee163f38f` FOREIGN KEY (`empleado_id`) REFERENCES `empleados` (`id`);

--
-- Filtros para la tabla `tipo_examen_parametros`
--
ALTER TABLE `tipo_examen_parametros`
  ADD CONSTRAINT `fk_rails_004ecf0464` FOREIGN KEY (`tipo_examen_id`) REFERENCES `tipo_examen` (`id`),
  ADD CONSTRAINT `fk_rails_b269a52731` FOREIGN KEY (`parametro_id`) REFERENCES `parametros` (`id`);

--
-- Filtros para la tabla `valor_referencia`
--
ALTER TABLE `valor_referencia`
  ADD CONSTRAINT `fk_rails_e2805ff686` FOREIGN KEY (`parametro_id`) REFERENCES `parametros` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
