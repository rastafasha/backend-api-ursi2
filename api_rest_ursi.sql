-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:8889
-- Tiempo de generación: 05-03-2026 a las 23:14:30
-- Versión del servidor: 5.7.34
-- Versión de PHP: 8.0.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `api_rest_ursi`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `anillos`
--

CREATE TABLE `anillos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `price` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'no-image.jpg',
  `status` enum('PUBLISHED','PENDING','REJECTED') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'PENDING',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `anillos`
--

INSERT INTO `anillos` (`id`, `title`, `slug`, `model`, `description`, `price`, `image`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Powerful Stone', NULL, 'UG11', '<p><span style=\"background-color:rgb(255,255,255);color:rgb(51,51,51);\">SILVER 925</span><br><span style=\"background-color:rgb(255,255,255);color:rgb(51,51,51);\">CARNELIAN OVAL</span><br><span style=\"background-color:rgb(255,255,255);color:rgb(51,51,51);\">4.2 GRS/0.15 ONZAS</span></p>', '140', '2023-05-21 03:07:38anillo1png.png', 'PUBLISHED', '2023-05-14 05:36:49', '2023-05-22 21:42:36'),
(2, 'Powerful Stone', NULL, 'UG01/UG04', '<p><span style=\"background-color:rgb(255,255,255);color:rgb(51,51,51);\">SILVER 925</span><br><span style=\"background-color:rgb(255,255,255);color:rgb(51,51,51);\">CARNELIAN CABUCHON</span><br><span style=\"background-color:rgb(255,255,255);color:rgb(51,51,51);\">3.6 GRS/ 0.13 ONZAS</span></p>', '122', '2023-05-21 03:10:04anillo2png.png', 'PUBLISHED', '2023-05-18 02:30:48', '2023-05-21 10:10:06'),
(3, 'Powerful Stone', NULL, 'UG13', '<p><span style=\"background-color:rgb(255,255,255);color:rgb(51,51,51);\">SILVER 925</span><br><span style=\"background-color:rgb(255,255,255);color:rgb(51,51,51);\">LOLITE ROUND</span><br><span style=\"background-color:rgb(255,255,255);color:rgb(51,51,51);\">4.6 GRS/0.16 ONZAS</span></p>', '183', '2023-05-21 03:10:29anillo3png.png', 'PUBLISHED', '2023-05-18 07:59:18', '2023-05-21 10:10:32'),
(4, 'Ring', NULL, 'UG08', '<p style=\"margin-left:0px;\">3 SILVER 925<br>PERIDOT, YELOW,<br>PURPLU AND GREEN<br>7, 7 ¼, 6 1/4<br>8 GRS / 0.310 ONZA,<br>(INDIVIDUAL 2.9 / 0.10 ONZA)</p><p style=\"margin-left:0px;\">$420 FOR THREE / INDIVIDUAL $144</p>', '144', '2023-05-21 03:10:58anillo4png.png', 'PUBLISHED', '2023-05-18 08:00:03', '2023-05-21 10:11:00'),
(5, 'Collection Orafa', NULL, 'MB30', '<p><span style=\"background-color:rgb(255,255,255);color:rgb(51,51,51);\">MATERIALS: SILVER PLATINUM</span><br><span style=\"background-color:rgb(255,255,255);color:rgb(51,51,51);\">QUANTILY: 1</span><br><span style=\"background-color:rgb(255,255,255);color:rgb(51,51,51);\">STONE: AMETHYST</span><br><span style=\"background-color:rgb(255,255,255);color:rgb(51,51,51);\">MEASURE/SIZE: 7 3/4</span><br><span style=\"background-color:rgb(255,255,255);color:rgb(51,51,51);\">WEIGTH: 7 GRS / 0.25 ONZA</span></p>', '385', '2023-05-21 03:11:40anillo5png.png', 'PUBLISHED', '2023-05-18 08:01:27', '2023-05-21 10:11:42'),
(6, 'Collection Orafa', NULL, 'MB29', '<p><span style=\"background-color:rgb(255,255,255);color:rgb(51,51,51);\">MATERIALS: PLATA CON PLATINO</span><br><span style=\"background-color:rgb(255,255,255);color:rgb(51,51,51);\">STONE: ROUND BLUE ZIRCON</span><br><span style=\"background-color:rgb(255,255,255);color:rgb(51,51,51);\">MEASURE/SIZE: 6</span></p>', '289', '2023-05-21 03:12:03anillo6png.png', 'PUBLISHED', '2023-05-18 08:02:10', '2023-05-21 10:12:06');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aretes`
--

CREATE TABLE `aretes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `price` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('PUBLISHED','PENDING','REJECTED') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'PENDING',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `aretes`
--

INSERT INTO `aretes` (`id`, `title`, `slug`, `model`, `description`, `price`, `image`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Aretes', NULL, 'UG65', '<p><span style=\"background-color:rgb(255,255,255);color:rgb(51,51,51);\">MATERIALS :SILVER 925</span><br><span style=\"background-color:rgb(255,255,255);color:rgb(51,51,51);\">EARRINGS</span><br><span style=\"background-color:rgb(255,255,255);color:rgb(51,51,51);\">MEASURE/SIZE: 7 CM / 2.75 INCH</span><br><span style=\"background-color:rgb(255,255,255);color:rgb(51,51,51);\">WEIGTH7.6 GRS / 0.27 OUNZA</span></p>', '80', '2023-05-18 04:03:27arete1png.png', 'PENDING', '2023-05-17 04:15:52', '2023-05-18 08:03:29'),
(2, 'Collection Angels', NULL, 'UG66', '<p><span style=\"background-color:rgb(255,255,255);color:rgb(51,51,51);\">MATERIALS: SILVER 925</span><br><span style=\"background-color:rgb(255,255,255);color:rgb(51,51,51);\">EARRING</span><br><span style=\"background-color:rgb(255,255,255);color:rgb(51,51,51);\">STONE: RUBI BEADS</span><br><span style=\"background-color:rgb(255,255,255);color:rgb(51,51,51);\">MEASURE/SIZE</span><br><span style=\"background-color:rgb(255,255,255);color:rgb(51,51,51);\">7.5 CM X 0.8 MM / 2.95 X 0.03 INCH</span><br><span style=\"background-color:rgb(255,255,255);color:rgb(51,51,51);\">WEIGTH: 5.4 GRS / 0.19 ONZAS</span></p>', '77', '2023-05-21 03:14:21arete2png.png', 'PENDING', '2023-05-17 04:15:52', '2023-05-21 10:14:24'),
(3, 'Collection Angels', NULL, 'UG67', '<p><span style=\"background-color:rgb(255,255,255);color:rgb(51,51,51);\">MATERIALS: SILVER 925</span><br><span style=\"background-color:rgb(255,255,255);color:rgb(51,51,51);\">EARRING</span><br><span style=\"background-color:rgb(255,255,255);color:rgb(51,51,51);\">MEASURE/SIZE: 5 CM X 1.5 CM / 1.97 X 0.59 INCH</span><br><span style=\"background-color:rgb(255,255,255);color:rgb(51,51,51);\">WEIGTH: 5.4 GRS / 0.19 X 0.05 INCH</span></p>', '99', '2023-05-21 03:15:52arete3png.png', 'PENDING', '2023-05-18 02:41:16', '2023-05-21 10:15:57'),
(4, 'Collection Angels', NULL, 'UG67', '<p><span style=\"background-color:rgb(255,255,255);color:rgb(51,51,51);\">MATERIALS: SILVER 925</span><br><span style=\"background-color:rgb(255,255,255);color:rgb(51,51,51);\">EARRING</span><br><span style=\"background-color:rgb(255,255,255);color:rgb(51,51,51);\">MEASURE/SIZE: 5 CM X 1.5 CM / 1.97 X 0.59 INCH</span><br><span style=\"background-color:rgb(255,255,255);color:rgb(51,51,51);\">WEIGTH: 5.4 GRS / 0.19 X 0.05 INCH</span></p>', '99', '2023-05-21 03:16:22arete4png.png', 'PENDING', '2023-05-18 08:05:42', '2023-05-21 10:16:25');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `banners`
--

CREATE TABLE `banners` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `target` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `imagemovil` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gotBoton` tinyint(1) DEFAULT NULL,
  `botonName` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('PUBLISHED','PENDING','REJECTED') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'PENDING',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `banners`
--

INSERT INTO `banners` (`id`, `title`, `description`, `url`, `target`, `image`, `imagemovil`, `gotBoton`, `botonName`, `status`, `created_at`, `updated_at`) VALUES
(1, '.', '<p>.</p>', 'https://youtu.be/WZRkLcyAbN0', '_self', '2023-09-10 19:12:24curso-de-joyeria-en-houston-tx-1920-x-1080jpg.jpg', '2023-10-08 22:46:38diseno-sin-titulo-9png.png', 1, '+info', 'PUBLISHED', '2023-05-14 20:58:34', '2023-10-09 05:46:48'),
(3, '.', '<p>ads</p>', 'curso/anillos-de-matrimonio', '_blank', '2023-08-15 05:05:54bannhome-anillo-noviosjpg.jpg', '2023-08-15 05:05:54bann-moviljpg.jpg', 1, '+info', 'REJECTED', '2023-08-15 12:06:34', '2023-10-19 21:22:50');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name_eng` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `categories`
--

INSERT INTO `categories` (`id`, `name`, `name_eng`, `created_at`, `updated_at`) VALUES
(1, 'Proyecto de Clase', 'Class Project', '2023-05-14 21:13:20', '2026-03-05 03:09:38'),
(2, 'Tips y Publicidad', 'Tips and Advertising', '2023-05-14 21:06:54', '2026-03-05 03:10:05');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contacts`
--

CREATE TABLE `contacts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cronologiacursos`
--

CREATE TABLE `cronologiacursos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `modo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `modo_eng` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title_eng` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `description_eng` text COLLATE utf8mb4_unicode_ci,
  `fecha` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fecha_eng` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hora` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hora_eng` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `clases` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `clases_eng` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `proyecto` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `proyecto_eng` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `duracion` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `duracion_eng` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `costo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('PUBLISHED','PENDING','REJECTED') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'PENDING',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `cronologiacursos`
--

INSERT INTO `cronologiacursos` (`id`, `modo`, `modo_eng`, `title`, `title_eng`, `description`, `description_eng`, `fecha`, `fecha_eng`, `hora`, `hora_eng`, `clases`, `clases_eng`, `proyecto`, `proyecto_eng`, `duracion`, `duracion_eng`, `costo`, `image`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Curso Online', 'Online Course', 'Alambrismo Avanzado', 'Advanced Wire Wrapping', 'Trabajaremos otras técnicas, más de tipo manual sin tanta intervención del alicate, entorchado de hilos, trenzados, amarres y mucha creatividad serán las constantes para la confección de estos proyectos.', 'We will work on other techniques, more of a manual nature without as much plier intervention; wire wrapping, braiding, tying, and a lot of creativity will be the constants for the making of these projects.', 'Lunes 27 de Marzo y 3 de Abril', 'Monday March 27th and April 3th', '12 A 1 PM', '12 to 1 PM', '2 clases de 1:30 horas c/u', '2 classes of 1:30 hours e/o', '1 proyecto', '1 project', '3 horas', '3 hours', '90', '2023-05-14 15:06:57alambrismo-avanzadopng.png', 'PENDING', '2023-05-14 19:06:59', '2026-03-05 19:37:53'),
(2, 'Curso Online', 'Online Course', 'Resina con Metal', 'Resin whith Metal', 'La Resina tiene muchos usos y formas de aplicación por lo que hemos dividido el curso en varios talleres que lo puedes tomar en el orden que desees según te interese.', 'Resin has many uses and applications, so we have divided the course into several workshops that you can take in any order you wish, depending on your interests.', 'Lunes 13 y 20 de Abril', 'Monday April 13th and 20th', '2:30 PM A 4 PM', '2:30 PM - 4 PM', '2 clases de 1:30 horas c/u', '2 classes of 1:30 hours e/o', '1 proyecto', '1 project', '3 horas', '3 hours', '90', '2023-05-17 23:35:15resinaymetalljpg.jpg', 'PENDING', '2023-05-18 03:35:18', '2026-03-05 19:06:48'),
(3, 'Curso Online', 'Online Course', 'Esmalte al Fuego', 'Torch-Fired Enamel', 'Este taller de esmalte sobre metal al fuego está diseñado para que puedas crear tus piezas de una manera simple usando incluso un soplete de cocina.', 'This torch-fired enameling workshop focuses on accessible techniques for creating custom metal pieces using controlled heating methods.', 'Lunes 27 de Marzo y 3 de Abril', 'Monday March 27th and  April 3th', '2:30 PM A 4 PM', '2:30 PM to 4 PM', '1 clase', '1 class', '1 proyecto', '1 project', '3 horas', '3 Hours', '50', '2023-05-17 23:38:41esmaltealfuegopng.png', 'PENDING', '2023-05-18 03:38:44', '2026-03-05 19:15:59'),
(4, 'Curso Online', 'Online Course', 'Elaboración Molde de Silicona', 'Silicone Mold Making', 'Es ideal para reproducir piezas, se usa para verter en ellos cera derretida para procesos de fundición o también resinas, tiene muchas utilidades, por ejemplo en el Metal clay se usan texturas en planchas hechas de silicona', 'It is ideal for reproducing pieces; it can be used to pour melted wax for casting processes or for resins. It has many uses; for example, in Metal Clay, silicone sheets are used to create textures.', 'Lunes 10 y 17 de Abril', 'Monday April 10 and 17', '12 PM A 1 PM', '12 PM to 1 PM', '2 clases de 1:30 horas c/u', '2 classes of 1:30 hours e/o', '1 proyecto', '1 project', '3 horas', '3 hours', '90', '2023-05-17 23:40:18moldesiliconapng.png', 'PENDING', '2023-05-18 03:40:20', '2026-03-05 19:18:17'),
(5, 'Curso Online', 'Online Course', 'Baños Electrolíticos de Oro sobre Plata', 'Gold Electroplating on Silver', 'Se dará toda la información del tipo de máquina o regulador ideal según sean tus recubrimientos a realizar, trabajaremos en la preparación de la pieza a enchapar y todo el tema del ánodo y todo y el uso de la solución de oro.', 'Complete information will be provided regarding the ideal type of machine or rectifier depending on the coatings you wish to achieve. We will work on preparing the piece for plating, the setup of the anode, and the correct use of the gold solution.', 'Lunes 10 de Abril', 'Monday April 10th', '2:30 PM A 4:30 PM', '2:30 PM to 4:30 PM', '1 clases de 2 horas', '1 class de 2 hours e/o', '1 proyecto', '1 project', '3 horas', '3 hours', '90', '2023-05-17 23:42:24electrolitospng.png', 'PENDING', '2023-05-18 03:42:27', '2026-03-05 19:21:11'),
(6, 'Curso Online', 'Online Course', 'Curso Básico de Orfebrería', 'Basic Metalsmithing Course', 'Este es un paquete de 4 proyectos en un taller, esta ideal para quienes quieren una formación rápida e intensiva, trabajaremos 3 anillos y unos aretes que son los que están en la foto, aprenderás desde las técnicas más básicas.', 'This is a 4-project workshop package, ideal for those seeking fast and intensive training. We will work on the three rings and the pair of earrings shown in the photo; you will learn everything starting from the most basic techniques.', '24 Abril a 1/8/15 de Mayo', 'April 24th to May 1/8/15', '12 PM A 1:30 PM', '12 PM to 1:30 PM', '4 clases de 1:30 horas c/u', '4 classes of 1:30 hours e/o', '1 proyecto', '1 project', '3 horas', '3 hours', '180', '2023-05-17 23:45:25basicoorfebreriapng.png', 'PENDING', '2023-05-18 03:45:27', '2026-03-05 20:33:25'),
(7, 'Curso Online', 'Online Course', 'Remaches', 'Rivets', 'En este taller aprenderás la forma más rápida y segura para unir materiales sin necesidad de soldaduras o pegamentos, solo utilizaras remache también conocido como \"Soldadura en frio\", formidable recurso a la hora de unir elementos que no se pueden soldar y seguro.', 'In this workshop, you will learn the fastest and safest way to join materials without the need for soldering or glues. You will only use rivets, also known as \"Cold Connections,\" a formidable and secure resource when joining elements that cannot be soldered.', 'Lunes 22 y 29 de Mayo', 'Monday May 22 th and 29th', '12 PM A 1 PM', '12 PM to 1 PM', '2 clases de 1:30 horas c/u', '2 classes of 1:30 hours e/o', '1 proyecto', '1 project', '3 horas', '3 hours', '90', '2023-05-17 23:47:48remachespng.png', 'PENDING', '2023-05-18 03:47:56', '2026-03-06 03:09:32'),
(8, 'Curso Online', 'Online Course', 'Cordón Tejido', 'Woven Cord', 'Este cordón resulta una fina solución cuando estamos realizando un dije y necesitamos una cadena para colgarlo o necesitamos una forma para completar una pulsera etc. es de muy fácil elaboración y es muy entretenido', 'This cord is an elegant solution when you are making a pendant and need a chain to hang it, or when you need a specific shape to complete a bracelet, etc. It is very easy to craft and very entertaining to make.', 'Lunes 22 de Mayo', 'Monday May 22th', '2:30 PM A 4:30 PM', '2:30 PM to 4:30 PM', '1 clase', '1 class', '1 proyecto', '1 project', '2 horas', '2 hours', '45', '2023-05-17 23:49:55cordontejidopng.png', 'PENDING', '2023-05-18 03:49:59', '2026-03-06 03:11:20'),
(9, 'Curso Online', 'Online Course', 'Engaste de Piedra Facetada en Caja sobre Superficie Curva', 'Faceted Stone Bezel Setting on Curved Surfaces', 'Técnica avanzada, el participante debe saber ya realizar una caja para engastar piedra y buen uso de la lima de media caña el objetivo es que la caja se adapte a la forma curva del anillo o también de un brazalete', 'Advanced technique; the participant must already know how to create a bezel for stone setting and have good command of the half-round file. The objective is for the bezel to adapt perfectly to the curved shape of a ring or a bracelet.', 'Lunes 5 y 12 de Junio', 'Monday 5th and June 12th', '12 PM A 1:30 PM', '12 PM to 1:30 PM', '2 clases de 1:30 horas c/u', '2 classes of 1:30 hours e/o', '1 proyecto', '1 project', '3 horas', '3 hours', '90', '2023-05-17 23:52:13engastepiedrapng.png', 'PENDING', '2023-05-18 03:52:15', '2026-03-06 03:14:01');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cursos`
--

CREATE TABLE `cursos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name_eng` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `description_eng` text COLLATE utf8mb4_unicode_ci,
  `adicional` text COLLATE utf8mb4_unicode_ci,
  `adicional_eng` text COLLATE utf8mb4_unicode_ci,
  `modal` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `isFeatured` tinyint(1) NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `urlVideo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('PUBLISHED','PENDING','REJECTED') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'PENDING',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `cursos`
--

INSERT INTO `cursos` (`id`, `user_id`, `name`, `name_eng`, `price`, `description`, `description_eng`, `adicional`, `adicional_eng`, `modal`, `slug`, `isFeatured`, `image`, `urlVideo`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 'Curso de Remache combinado con Cuero y otros materiales', 'Riveting Course: Combining Leather and Other Materials', '220', 'Este taller aprenderás la forma más rápida y segura de unir materiales', 'In this workshop, you will learn the fastest and safest way to join materials without the need for soldering or glues.', 'En este taller aprenderás la forma más rápida y segura para unir materiales sin necesidad de soldaduras ni pegamentos, solo utilizarás el remache también conocido como \"Soldadura en frío\", puedes unir metales como aluminio, oro, plata y acero, etc. junto con materiales como el cuero, el vidrio, acrílico etc.\n\nEs un formidable recurso a la hora de unir elementos que no se pueden soldar y es muy seguro.\n2 clases\n6 horas\n2 proyecto', 'In this workshop, you will learn the fastest and safest way to join materials without the need for soldering or glues. You will use riveting, also known as \'Cold Connection,\' to join metals such as aluminum, gold, silver, stainless steel, and more, with materials like leather, glass, acrylic, etc\nIt is a formidable resource for securely joining elements that cannot be soldered.\n2 classes\n6 hours\n2 projects', 'remachecuero0', 'curso-de-remache-combinado-con-cuero-y-otros-materiales', 0, '2023-05-22 14:53:19remache-cueropng.png', NULL, 'PUBLISHED', '2023-05-14 05:05:00', '2026-03-05 03:00:52'),
(2, 1, 'Esmalte al fuego', 'Torch-Fired Enameling', '160', 'Taller de esmalte sobre metal al fuego', 'This fire-on-metal enamel workshop is designed for you to create your pieces in a simple way,', 'Este taller de esmalte sobre metal al fuego está diseñado para que puedas crear tus piezas de una manera simple usando incluso un soplete de cocina, podrás realizar hermosas piezas con colores, alegrar y refrescar tu trabajo actual, el curso se hace en un día, es continuo por 6 horas. El material está incluido, Full Day, 6 horas de capacitación y creación continuas, varios proyectos', 'This fire-on-metal enamel workshop is designed for you to create your pieces in a simple way, using even a kitchen torch. You will be able to make beautiful, colorful pieces to brighten and refresh your current work. The course is completed in a single day, running for 6 continuous hours. Materials are included. Full Day: 6 hours of non-stop training and creation, including several projects.', 'esmaltefuego', 'esmalte-al-fuego', 0, '2023-05-18 00:00:36esmaltealfuegopng.png', 'CcrmJ0MAPKY', 'PUBLISHED', '2023-05-17 05:15:13', '2026-03-06 00:38:29'),
(3, 1, 'Alambrismo Avanzado', 'Advanced Wire Wrapping', '200', 'Este nivel trabajaremos con otras técnicas más de tipo manual', 'At this level, we will work with manual techniques that require less plier intervention.', 'En este nivel trabajaremos con otras técnicas más de tipo manual sin tanta intervención del alicate, entorchado de hilos, trenzados, amarres y mucha creatividad serán las constantes para la confección de estos proyectos a realizar.\nTodos nuestros cursos incluyen los materiales. \nClases: 2\nhoras: 8\nproyectos: 2', 'At this level, we will work with manual techniques that require less plier intervention. Wire coiling, braiding, tying, and a high degree of creativity will be the constant elements in the creation of these projects.\nAll our courses include materials.\nClasses: 2\nHours: 8\nProjects: 2', 'alambrismoavanzado', 'alambrismo-avanzado', 0, '2023-05-18 00:02:17alambrismo-avanzadopng.png', 'WZRkLcyAbN0', 'PUBLISHED', '2023-05-17 05:15:13', '2026-03-06 00:40:20'),
(4, 1, 'Filigrana', 'Filigree', '350', 'En este taller aprenderás todo lo relacionado con esta parte importante de la joyería', 'In this workshop, you will learn everything related to this essential part of jewelry making: filigree.', 'En este taller aprenderás todo lo relacionado con esta parte tan importante de la joyería como es la filigrana, aprenderás desde cómo preparar la cinta doble trenzada y laminada que deja el borde dentado hasta como realizar el relleno, soldadura y sus acabados.\nClases:9 horas\n2 proyectos', 'In this workshop, you will learn everything related to this essential part of jewelry making: filigree. You will learn how to prepare the double-twisted and rolled wire that creates the serrated edge, as well as how to perform the filling, soldering, and finishing touches.\nClasses: 9 hours\nProjects: 2', 'filigrana', 'filigrana', 0, '2023-05-18 00:03:45filigranapng.png', 'bDQp1aM9w3w', 'PUBLISHED', '2023-05-18 02:39:11', '2026-03-06 00:42:37'),
(5, 1, 'Resina Coloreada', 'Colored Resin', '350', 'Aprenderás a hacer calados y soldaduras para la confección de las joyas', 'You will learn to perform piercing and soldering for the creation of jewelry pieces', 'Aprenderás a hacer calados y soldaduras para la confección de las joyas donde se aplicará la resina con color.\n3 clases\n9 horas', 'You will learn to perform piercing and soldering for the creation of jewelry pieces where colored resin will be applied.\nClasses: 3\nHours: 9', 'resinacoloreada', 'resina-coloreada', 1, '2023-05-22 10:32:0402jpg.jpg', NULL, 'PUBLISHED', '2023-05-18 04:06:34', '2026-03-06 00:44:10'),
(6, 1, 'Resina y Madera', 'Resin and Wood', '240', 'Elabora hermosas piezas de orfebrería combinando madera y resina', 'Create beautiful jewelry pieces by combining wood and colored resin.', 'Elabora hermosas piezas de orfebrería combinando madera y resina coloreada.\n2 clases, 4 horas c/u\n8 horas, clase privada', 'Create beautiful jewelry pieces by combining wood and colored resin.\n2 classes, 4 hours each\n8 hours, private class', 'resinamadera', 'resina-y-madera', 1, '2023-05-22 10:32:3108jpg.jpg', NULL, 'PUBLISHED', '2023-05-18 04:08:00', '2026-03-06 00:45:19'),
(7, 1, 'Resina y Metal', 'Resin and Metal', '350', 'Aprenderás algo de soldadura y cómo se aplica la resina', 'You will learn basic soldering and resin application techniques.', 'Aprenderás algo de soldadura y como se aplica la resina.\nClases: 3\nHoras: 9', 'You will learn basic soldering and resin application techniques.\nClasses: 3\nHours: 9', 'resinametal', 'resina-y-metal', 1, '2023-05-22 10:35:55resinametaljpg.jpg', NULL, 'PUBLISHED', '2023-05-18 04:09:13', '2026-03-06 00:46:21'),
(8, 1, 'Resina por Inclusión', 'Inclusion Resin', '220', 'Elaboraremos unas piezas usando dos tecnicas distintas, una con molde de silicona y otra en bastidor de metal', 'We will create pieces using a silicone mold on one hand and metal on the other.', 'Elaboraremos unas piezas usando por un lado un molde de silicona y otra en metal\n2 clases\n6 horas', 'We will create pieces using a silicone mold on one hand and metal on the other.', 'resinainclusion', 'resina-por-inclusion', 1, '2023-07-30 01:44:47300-x-300png.png', NULL, 'PUBLISHED', '2023-05-18 04:10:56', '2026-03-06 00:48:03'),
(9, 1, 'Curso Remache con Engaste', 'Riveting and Setting Course', '220', 'En este taller aprenderás la forma más rápida y segura para unir materiales sin necesidad de soldaduras ni pegamentos', 'In this workshop, you will learn the fastest and safest way to join materials without the need for soldering or glues.', 'En este taller aprenderás la forma más rápida y segura para unir materiales sin necesidad de soldaduras ni pegamentos, solo utilizarás el remache también conocido como \"Soldadura en frío\", puedes unir metales como aluminio, oro, plata y acero, etc. junto con materiales como el cuero, el vidrio, acrílico etc.<br>Es un formidable recurso a la hora de unir elementos que no se pueden soldar y es muy seguro.\n2 clases\n6 horas\n2 proyectos', 'This workshop covers the use of rivets, a technique often referred to as \"cold connections\" in jewelry and metalworking. This method allows for the joining of metals such as aluminum, gold, silver, and steel with other diverse materials like leather, glass, and acrylic. It is a highly effective and secure resource for combining elements that are sensitive to heat or cannot be soldered.\nCourse details:\n2 classes\n6 hours total\n2 completed projects', 'remacheengaste', 'curso-remache-con-engaste', 0, '2023-05-18 00:12:38remachespng.png', NULL, 'PUBLISHED', '2023-05-18 04:12:40', '2026-03-06 01:52:22'),
(10, 1, 'Curso Bisagra y Broche Gaveta', 'Hinge and Box Clasp Course', '380', 'Articulaciones, micro mecanismos o bisagras, en este taller construiremos un brazalete con bisagra', 'Joints, micro-mechanisms, or hinges; in this workshop, we will build a hinged bracelet.', '<p style=\"margin-left:0px;\">Articulaciones, micro mecanismo o bisagras, en este taller construiremos un brazalete con bisagra y broche de gaveta, fabricaremos la charnela o tubo y como se ajusta, remache y acabados</p><ul><li>3 clases de 3 horas c/u</li><li>12 horas</li><li>1 proyecto, brazalete</li></ul>', 'Joints, micro-mechanisms, or hinges; in this workshop, we will build a hinged bracelet with a box clasp. We will manufacture the chenier or tubing and learn how to adjust it, as well as riveting and finishing.\n3 classes, 3 hours each\n12 hours\n1 project: bracelet', 'bisagragaveta', 'curso-bisagra-y-broche-gaveta', 0, '2023-05-18 00:14:25bisagrabrochepng.png', NULL, 'PUBLISHED', '2023-05-18 04:14:34', '2026-03-06 01:53:46'),
(11, 1, 'Curso de Joyería Textil', 'Textile Jewelry Course', '250', 'Usando la técnica de telar y utilizando hilos finos de metal podemos crear este tipo de malla sólida', 'Using the loom technique and fine metal wires, we can create this type of solid mesh.', 'Usando la técnica del telar y utilizando hilos finos de metal podemos crear este tipo de malla sólida muy usada en el alambrismo.\n2 clases de 4 horas c/u\n8 horas\n1 proyecto, brazalete', 'Using the loom technique and fine metal wires, we can create this type of solid mesh, which is widely used in wire wrapping.\n2 classes, 4 hours each\n8 hours\n1 project: bracelet', 'joyeriatextil', 'curso-de-joyeria-textil', 0, '2023-05-18 00:17:02joyeria-textilpng.png', NULL, 'PUBLISHED', '2023-05-18 04:17:05', '2026-03-06 01:55:28'),
(12, 1, 'Crayon Art', 'Crayon Art', '350', 'Usaremos creyones para elaborar junto con la resina piezas de joyería', 'We will use crayons along with resin to create jewelry pieces.', 'Usaremos creyones para elaborar junto con la resina piezas de joyería.\n3 clases\n9 horas', 'We will use crayons along with resin to create jewelry pieces.\n3 classes\n9 hours', 'crayonart', 'crayon-art', 0, '2023-05-18 00:18:16crayonartjpg.jpg', NULL, 'PUBLISHED', '2023-05-18 04:18:18', '2026-03-06 01:56:45'),
(13, 1, 'Curso Engaste de piedras facetadas en caja', 'Faceted Stone Bezel Setting Course', '380', 'En este Taller realizaremos un Anillo con engaste de caja para una piedra facetada octogonal, trabajo de mucha precisión con ayuda del motor colgante y fresas, este engaste también es conocido como falso engaste, es cuestión de practicar.', 'In this workshop, we will create a ring with a bezel setting for an octagonal faceted stone. This is high-precision work using a flexible shaft motor and burs. This setting is also known as a \"faux setting\"; it’s all a matter of practice.', 'Usando la técnica del telar y utilizando hilos finos de metal podemos crear este tipo de malla sólida muy usada en el alambrismo.\n3 clases de 3 horas c/u\n12 horas\n1 proyecto', 'Using the loom technique and fine metal wires, we can create this type of solid mesh, which is widely used in wire wrapping.\n3 classes, 3 hours each\n12 hours\n1 project', 'piedrasfacetada', 'curso-engaste-de-piedras-facetadas-en-caja', 0, '2023-09-10 17:15:21diseno-sin-titulo-10300-x-300png.png', NULL, 'PUBLISHED', '2023-05-18 04:20:16', '2026-03-06 02:03:40'),
(14, 1, 'Curso Anillo de Piedra reconstituido en base metal', 'Metal Base Reconstituted Stone Ring Course', '380', 'Anillo de piedra reconstituido, sobre un anillo tipo Bulgari reconstruiremos la superficie con piedra molida.', 'Reconstituted stone ring; over a Bulgari-style ring, we will reconstruct the surface using crushed stone.', 'Anillo de Piedra reconstituido, sobre un anillo tipo Bulgari reconstruiremos la superficie con piedra molida como: Malaquita, Turquesa y Lapislázuli.\nEl curso está dividido en una parte de orfebrería y la otra el molido de la piedra y forma de aplicarlo y sus acabados.\n3 clases de 3 horas c/u\n9 horas\n1 proyecto', 'Reconstituted Stone Ring: on a Bulgari-style ring, we will reconstruct the surface using crushed stones such as Malachite, Turquoise, and Lapis Lazuli. The course is divided into a metalsmithing section and another focused on stone grinding, application methods, and finishing.\n3 classes, 3 hours each\n9 hours\n1 project', 'anillopiedrareconst', 'curso-anillo-de-piedra-reconstituido-en-base-metal', 0, '2023-05-18 00:22:10anillopriedrapng.png', NULL, 'PUBLISHED', '2023-05-18 04:22:11', '2026-03-06 02:09:02'),
(15, 1, 'Curso de Reconstituido', 'Inlay Course (Reconstituted Stone)', '380', 'Para aprender a realizar este tipo de anillo con piedra molidas primero realizaremos el contenedor donde aprenderás técnicas de joyería.', 'To learn how to make this type of ring with crushed stones, we will first create the setting where you will learn jewelry techniques.', 'Para aprender a realizar este tipo de anillo con piedras molidas primero realizaremos el contenedor donde aprenderás técnicas de joyería y podemos hacer como proyecto un anillo o dije.\n3 clases\n9 horas\n1 proyecto', 'To learn how to make this type of ring with crushed stones, we will first create the setting where you will learn jewelry techniques; we can make either a ring or a pendant as a project.\n3 classes\n9 hours\n1 project', 'reconstituido', 'curso-de-reconstituido', 0, '2023-05-18 00:36:12reconstituidopng.png', NULL, 'PUBLISHED', '2023-05-18 04:36:14', '2026-03-06 02:10:48'),
(16, 1, 'Curso Anillo de Volumen', 'Volume Ring Course', '380', 'Realizaremos un anillo de sello y entraremos en el tema de la joyería', 'We will create a signet ring and delve into the subject of hollow and volumetric jewelry.', 'Realizaremos un anillo de sello y entraremos en el tema de la joyería hueca y volumétrica.\n3 clases\n9 horas\n1 proyecto', 'We will create a signet ring and delve into the subject of hollow and volumetric jewelry.\n3 classes\n9 hours\n1 project', 'anillovolumen', 'curso-anillo-de-volumen', 0, '2023-05-18 00:37:31anillovolumenpng.png', NULL, 'PUBLISHED', '2023-05-18 04:37:33', '2026-03-06 02:12:08'),
(17, 1, 'Curso Anillo Comprimido', 'Compressed Ring Course', '380', 'Un modelo de técnica avanzada, el alumno debe de tener dominio de la soldadura y uso de soplete aprenderemos cómo se crea este tipo de efecto.', 'An advanced technique model; the student must have mastery of soldering and torch use. We will learn how this type of effect is created.', 'Es un modelo de técnica avanzada, el alumno debe de tener dominio de la soldadura y uso de soplete aprenderemos cómo se crea este tipo de efecto haciendo un tipo de comprimido mecánico sobre el metal.\n3 clases de 3 horas c/u\n9 horas\n1 proyecto', 'This is an advanced technique model; the student must have mastery of soldering and torch use. We will learn how to create this effect by performing a type of mechanical compression on the metal.\n3 classes, 3 hours each\n9 hours\n1 project', 'anillocomprimido', 'curso-anillo-comprimido', 0, '2023-05-18 00:38:53anillocomprimidopng.png', NULL, 'PUBLISHED', '2023-05-18 04:38:55', '2026-03-06 02:14:27'),
(18, 1, 'Curso de Anillo Plegado', 'Folded Ring Course', '240', 'un hermoso modelo de con sencilla técnica muy especial por sus dimensiones y curvas que le da al diseño a pesar', 'A beautiful model featuring a simple yet very special technique due to the dimensions and curves it adds to the design.', 'Es un hermoso modelo de con sencilla técnica muy especial por sus dimensiones y curvas que le da al diseño a pesar de que está realizado con hilo y lamina.\n2 clases de 3 horas c/u\n6 horas\n1 proyecto', 'It is a beautiful model with a simple technique, very special for the dimensions and curves it brings to the design despite being made with wire and sheet metal.\n2 classes, 3 hours each\n6 hours\n1 project', 'anilloplegado', 'curso-anillo-plegado', 0, '2023-05-18 00:43:39anilloplegadopng.png', NULL, 'PUBLISHED', '2023-05-18 04:43:42', '2026-03-06 02:16:19'),
(19, 1, 'Curso de Anillo con Engaste 6 uñas', '6-Prong Setting Ring Course', '280', 'Anillo con montura de 6 uñas, adiestramiento en soldadura, el alumno debe de tener conocimientos básicos del oficio.', 'Ring with a 6-prong mount, soldering training; the student must have basic knowledge of the craft.', 'Elaboración de un anillo con montura de 6 uñas, adiestramiento en soldadura, el alumno debe de tener conocimientos básicos del oficio.\nClases: 3\nHoras: 9\nNúmero de Proyectos:1 anillo', 'Creation of a ring with a 6-prong mount, soldering training; the student must have basic knowledge of the craft.\nClasses: 3\nHours: 9\nNumber of Projects: 1 ring', 'anillo6', 'curso-de-anillo-con-engaste-6-unas', 0, '2023-05-18 00:45:41engastedeunaspng.png', NULL, 'PUBLISHED', '2023-05-18 04:45:43', '2026-03-06 02:17:57'),
(20, 1, 'Alambrismo Básico', 'Basic Wire Wrapping', '280', 'En este taller aprenderás el correcto uso del Alicate y el tratamiento del Alambre, se realizarán unos proyectos de entrenamiento como pulsera, anillo', 'In this workshop, you will learn the correct use of pliers and wire handling. We will create training projects such as a bracelet and a ring.', 'En este taller aprenderás el correcto uso del Alicate y el tratamiento del Alambre, se realizarán unos proyectos de entrenamiento como pulsera, anillo y zarcillos.\nClases: 2\nproyectos: 8', 'In this workshop, you will learn the correct use of pliers and wire handling. We will create training projects such as a bracelet, a ring, and earrings. \nClasses: 2\nProjects: 8', 'alambrismobasico', 'alambrismo-basico', 0, '2023-05-18 01:00:29alambrismobasicopng.png', 'oKJgmWeRKoo', 'PUBLISHED', '2023-05-18 05:00:46', '2026-03-06 02:19:20'),
(21, 1, 'Curso de elaboración de molde con masa epoxica', 'Epoxy Putty Mold Making Course', '180', 'Es un hermoso modelo de con sencilla técnica muy especial por sus dimensiones y curvas que le da al diseño a pesar...', 'It is a beautiful model with a simple technique, very special due to its dimensions and the curves it adds to the design despite…', 'Es un hermoso modelo de con sencilla técnica muy especial por sus dimensiones y curvas que le da al diseño a pesar de que está realizado con hilo y lamina.\n1 clases\n4 horas\n1 proyecto', 'It is a beautiful model with a simple technique, very special for its dimensions and the curves it gives to the design despite being made with wire and sheet metal.\n1 class\n4 hours\n1 project', 'moldeepoxica', 'curso-de-elaboracion-de-molde-con-masa-epoxica', 0, '2023-05-18 01:02:43moldeepoxicapng.png', NULL, 'PUBLISHED', '2023-05-18 05:02:45', '2026-03-06 02:20:44'),
(22, 1, 'Curso de Grabado al ácido y remaches', 'Acid Etching and Riveting Course', '220', 'El grabado en el metal es como dibujar sobre el metal, para eso usamos ciertas sustancias las cuales te enseñaremos a usar para que puedas hacer tus diseños', 'Etching on metal is like drawing on metal; for that, we use certain substances that we will teach you how to use so you can create your designs.', 'El grabado en el metal es como dibujar sobre el metal, para eso usamos ciertas sustancias las cuales te enseñaremos a usar para que puedas hacer tus diseños como dar texturas o imprimir formas en el metal y trabajaremos con 2 tipos de materiales como bronce y cobre con remaches\n2 clases\n6 horas\n1 pulsera como proyecto', 'Etching on metal is like drawing on metal; for that, we use certain substances that we will teach you how to use so you can create your designs, such as adding textures or printing shapes onto the metal. We will work with two types of materials, brass and copper, using rivets.\n2 classes\n6 hours\n1 bracelet project', 'gabadoacidoremaches', 'curso-de-grabado-al-acido-y-remaches', 0, '2023-05-18 01:04:28grabadoalacidoyremachespng.png', NULL, 'PUBLISHED', '2023-05-18 05:04:31', '2026-03-06 02:23:04'),
(23, 1, 'Curso de Anillo Embutido y Galloneado', 'Dapped and Fluted Ring Course', '120', 'Este es un anillo muy clásico en la joyería que puede también ser decorado con galloneados', 'This is a very classic ring in jewelry that can also be decorated with fluting.', 'Este es un anillo muy clásico en la joyería que puede también ser decorado con galoneados y engastes de pavé, embutimos en el dado para curvar el anillo.\n1 clase\n4 horas\n1 proyecto', 'This is a very classic ring in jewelry that can also be decorated with fluting and pavé settings; we use the dapping block to curve the ring.\n1 class\n4 hours\n1 project', 'anillogalloneado', 'curso-de-anillo-embutido-y-galloneado', 0, '2023-08-19 20:43:47anillo-galloneado-300-x-300jpg.jpg', NULL, 'PUBLISHED', '2023-05-18 05:05:48', '2026-03-06 02:25:24'),
(24, 1, 'Curso de Anillo varios aros enlazados', 'Interlocking Multi-Band Ring Course', '220', 'También conocido como Anillo Cartier , este anillo es el que tradicionalmente se usaba en Rusia como anillo de matrimonio también llamado Anillo de los Zares.', 'Also known as the Cartier Ring, this design was traditionally used in Russia as a wedding band, often called the Tsar\'s Ring.', 'También conocido como Anillo Cartier , este anillo es el que tradicionalmente se usaba en Rusia como anillo de matrimonio también llamado Anillo de los Zares.\n2 clases\n4 horas\n1 proyecto', 'Also known as the Cartier Ring, this design was traditionally used in Russia as a wedding band, often called the Tsar\'s Ring.\n2 classes\n4 hours\n1 project', 'anilloenlzado', 'curso-de-anillo-varios-aros-enlazados', 0, '2023-05-18 01:07:28anillovariosarospng.png', NULL, 'PUBLISHED', '2023-05-18 05:07:30', '2026-03-06 02:26:44'),
(25, 1, 'Curso de Calado', 'Piercing Course ( Sawing Course)', '120', 'Esta es la técnica más básica del oficio con la que puedes realizar maravillosas joyas en los materiales que desees además del metal', 'This is the most basic technique of the craft, with which you can create wonderful jewelry in the materials of your choice besides metal.', 'Esta es la técnica más básica del oficio con la que puedes realizar maravillosas joyas en los materiales que desees además del metal con esta técnica y el uso del arco de segueta puedes usarlo también en acrílico, madera entre otros.\n1 clases\n4 horas\n1 proyecto', 'This is the most basic technique of the craft, with which you can create wonderful jewelry in the materials of your choice besides metal; with this technique and the use of the jeweler’s saw, you can also work on acrylic, wood, and other materials.\n1 class\n4 hours\n1 project', 'calado', 'curso-de-calado', 0, '2023-05-18 01:08:50caladopng.png', NULL, 'PUBLISHED', '2023-05-18 05:08:51', '2026-03-06 02:28:24'),
(26, 1, 'Curso de Flor Repujada', 'Repoussé Flower Course', '220', 'Aprenderás a calar o cortar el metal con el arco de segueta el recocido del metal, el embutido y acoplado para conformar la flor', 'You will learn to pierce or cut metal with a jeweler\'s saw, metal annealing, dapping, and assembly to shape the flower.', 'Aprenderás a calar o cortar el metal con el arco de segueta el recocido del metal, el embutido y acoplado para conformar la flor\n3 clases\n9 horas\n1 proyecto', 'You will learn to pierce or cut metal with a jeweler\'s saw, metal annealing, dapping, and assembly to shape the flower.\n3 classes\n9 hours\n1 project', 'florrepujada', 'curso-de-flor-repujada', 0, '2023-05-18 01:10:14florrepujadapng.png', NULL, 'PUBLISHED', '2023-05-18 05:10:16', '2026-03-06 02:29:39'),
(27, 1, 'Curso de Anillo Encamisado', 'Cased Ring Course (Hollow-Built Ring Course)', '320', 'Si ya te has propuesto hacer un anillo con las complicaciones de este es porque ya manejas muy bien la soldadura...', 'If you have set out to make a ring with these complications, it is because you already have a strong command of soldering...', 'Si ya te has propuesto hacer un anillo con las complicaciones de este es porque ya manejas muy bien la soldadura y tienes destreza en el uso de las herramientas para dar forma y ajustar partes, es un anillo clásico con muchas variaciones.\n3 clases\n9 horas\n1 proyecto', 'If you have set out to make a ring with these complications, it is because you already have a strong command of soldering and possess the skill to use tools for shaping and fitting parts. It is a classic ring with many variations.\n3 classes\n9 hours\n1 project', 'anilloencamisado', 'curso-de-anillo-encamisado', 0, '2023-05-18 01:11:09anilloencamisadopng.png', NULL, 'PUBLISHED', '2023-05-18 05:11:11', '2026-03-06 02:30:49'),
(28, 1, 'Curso de Grabado al Ácido', 'Acid Etching Course', '180', 'El grabado en el metal es como pintar en él para eso usamos ciertas sustancias las cuales te enseñaremos a usar para que puedas…', 'Etching on metal is like painting on it; for that, we use certain substances that we will teach you how to use so you can…', 'El grabado en el metal es como pintar en él para eso usamos ciertas sustancias las cuales te enseñaremos a usar para que puedas hacer tus diseños, como dar texturas o imprimir formas en el metal\nClases: 1\nHoras: 4\nNúmero de Proyectos:1 (brazalete)', 'Etching on metal is like painting on it; for that, we use certain substances that we will teach you how to use so you can create your designs, such as adding textures or printing shapes onto the metal.\nClasses: 1\nHours: 4\nNumber of Projects: 1 (bracelet)', 'grabadoacido', 'curso-de-grabado-al-acido', 0, '2023-05-18 01:12:19grabadoalacidopng.png', NULL, 'PUBLISHED', '2023-05-18 05:12:21', '2026-03-06 02:32:41'),
(29, 1, 'Curso de Engaste de Caja Cabujón', 'Cabochon Bezel Setting Course', '220', 'Trabajaremos en la elaboración de una caja para piedra cabujón, es considerado el engaste de mayor seguridad…', 'We will work on creating a bezel for a cabochon stone; it is considered the most secure type of setting...', 'Trabajaremos en La elaboración de una caja para piedra cabujón, es considerado el engaste de mayor seguridad, funciona para piedras cabujón o formas irregulares en este taller realizaremos un anillo y un dije.\n1 clases\n6 horas\n1 proyecto', 'We will work on creating a bezel for a cabochon stone; it is considered the most secure type of setting and works for cabochon stones or irregular shapes. In this workshop, we will make a ring and a pendant.\n1 class\n6 hours\n1 project', 'engastecajacabujon', 'curso-de-engaste-caja-cabujon', 0, '2023-05-18 01:14:23engastecajacabujonpng.png', NULL, 'PUBLISHED', '2023-05-18 05:14:32', '2026-03-06 02:34:25'),
(30, 1, 'Curso de Engaste de 4 Uñas', '4-Prong Setting Course', '380', 'Se realizara un anillo con engaste de 4 uñas para piedra facetada preferiblemente redonda u ovalada, el participante debe…', 'A ring with a 4-prong setting for a faceted stone (preferably round or oval) will be created; the participant must...', 'Se realizara un anillo con engaste de 4 uñas para piedra facetada preferiblemente redonda u ovalada, el participante debe de tener dominio del soplete y soldadura.\n3 clases de 3 horas cada uno\n9 horas\n1 proyecto', 'A ring with a 4-prong setting for a faceted stone, preferably round or oval, will be created. The participant must have mastery of the torch and soldering.\n3 classes, 3 hours each\n9 hours\n1 project', 'engaste4unas', 'curso-de-engaste-de-4-unas', 0, '2023-05-18 01:16:12engaste4png.png', NULL, 'PUBLISHED', '2023-05-18 05:16:14', '2026-03-06 02:35:49'),
(31, 1, 'Curso de Anillo Bulgari', 'Bulgari-Style Ring Course', '220', 'Este anillo consta de 3 partes las cuales son: los aros de los bordes realizados en hilo cuadrado y una banda central el taller...', 'This ring consists of 3 parts: the outer bands made of square wire and a central band. The workshop…', 'Este anillo consta de 3 partes las cuales son: los aros de los bordes realizados en hilo cuadrado y una banda central el taller consiste en preparar con medidas exactas estas 3 piezas para posteriormente ser ensambladas y soldadas obteniendo este hermoso modelo.\n2 clases\n6 horas\n1 proyecto', 'This ring consists of 3 parts: the outer bands made of square wire and a central band. The workshop consists of preparing these 3 pieces with exact measurements to be subsequently assembled and soldered, resulting in this beautiful model.\n2 classes\n6 hours\n1 project', 'anillobulgari', 'curso-de-anillo-bulgari', 0, '2023-05-18 01:17:18anillobulgaripng.png', NULL, 'PUBLISHED', '2023-05-18 05:17:20', '2026-03-06 02:37:16'),
(32, 1, 'Curso Modelado en Cera', 'Wax Modeling Course', '220', 'Se  realizara un anillo Bombe con la técnica del modelado en cera realizando la talla y escavado de la cera usando para ello limas...', 'A Bombé ring will be created using the wax modeling technique, carving and hollowing out the wax using files...', 'Se realizara un anillo Bombe con la técnica del modelado en cera realizando la talla y escavado de la cera usando para ello limas y fresas hasta lograr el modelo con los diámetros o espesor de la pieza en la medida correcta realizándole los acabados correspondientes dejándolo listo para el proceso de fundición obteniendo como resultado la misma pieza en el material deseado sea oro o plata\n2 clases\n6 horas\n1 proyecto', 'A Bombé ring will be created using the wax modeling technique, involving carving and hollowing out the wax using files and burs until achieving the model with the correct diameters and thickness. We will apply the corresponding finishes, leaving it ready for the casting process, resulting in the same piece in the desired material, whether gold or silver.\n2 classes\n6 hours\n1 project', 'modeladocera', 'curso-de-modelado-en-cera', 0, '2023-05-18 01:18:27modeladocerapng.png', NULL, 'PUBLISHED', '2023-05-18 05:18:29', '2026-03-06 02:38:40'),
(33, 1, 'Curso Anillo con Engaste 2 Uñas', '2-Prong Setting Ring Course', '260', 'Este es un hermoso modelo de anillo con un engaste con solo 2 uñas es ideal para piedras redondas, el participante debe de tener dominio del soplete', 'This is a beautiful ring model with a 2-prong setting, ideal for round stones. The participant must have mastery of the torch...', 'Este es un hermoso modelo de anillo con un engaste con solo 2 uñas es ideal para piedras redondas, el participante debe de tener dominio del soplete y la soldadura.\n2 clases de 3 horas c/u\n6 horas\n1 proyecto', 'This is a beautiful ring model with a 2-prong setting, ideal for round stones. The participant must have mastery of the torch and soldering.\n2 classes, 3 hours each\n6 hours\n1 project', 'engaste2unas', 'curso-anillo-con-engaste-2-unas', 0, '2023-05-18 01:19:38encaste2png.png', NULL, 'PUBLISHED', '2023-05-18 05:19:40', '2026-03-06 02:40:03'),
(34, 1, 'Curso de Anillo Embutido y Forjado', 'Dapped and Forged Ring Course', '260', 'Este anillo es de técnica avanzada ya que debemos de tener un dominio de martillo para el repujado y embutido...', 'This ring is an advanced technique, as we must have mastery of the hammer for repoussé and dapping...', 'Este anillo es de técnica avanzada ya que debemos de tener un dominio de martillo para el repujado y embutido, utilizaremos el dado de embutir como herramienta de apoyo y le daremos volumen deseado al anillo.\n2 clases de 3 horas c/u\n6 horas\n1 proyecto', 'This ring is an advanced technique, as we must have mastery of the hammer for repoussé and dapping. We will use the dapping block as a support tool to give the ring the desired volume.\n2 classes, 3 hours each\n6 hours\n1 project', 'anilloembutidoforjado', 'curso-de-anillo-embutido-y-forjado', 0, '2023-05-18 01:21:09anilloforjadopng.png', NULL, 'PUBLISHED', '2023-05-18 05:21:11', '2026-03-06 02:41:18'),
(35, 1, 'Metal Clay I', 'Metal Clay I', '360', 'En este taller trabajaremos el material de metal clay que como su nombre lo indica es arcilla y así la trabajaremos, como arcilla, por decirlo así \"modelaremos una joya\"...', 'In this workshop, we will work with metal clay, which, as its name suggests, is clay, and that is how we will handle it. We will \"model a piece of jewelry\" as if it were a flexible dough…', 'En este taller trabajaremos el material de metal clay que como su nombre lo indica es arcilla y así la trabajaremos, como arcilla, por decirlo así \"modelaremos una joya\", como una masa flexible, trabajaremos piezas sencillas estampado y texturas como las de una hoja del jardín o una de las tantas placas de texturas que se consiguen en el mercado, otra cosa importante es trabajar las uniones\n3 clases de 3 horas c/u\n9 horas\n1 proyecto\nno incluye el material, el precio varia por ser metal precioso', 'In this workshop, we will work with metal clay; as its name suggests, it is clay and we will treat it as such. We will \"model a piece of jewelry\" using it as a flexible dough. We will create simple pieces using stamping and textures, such as those from a garden leaf or any of the many texture plates available on the market. Another important aspect is learning how to handle the joins.\n3 classes, 3 hours each\n9 hours\n1 project\nMaterials not included (price varies as it is a precious metal)', 'metalclayI', 'metal-clay-1', 0, '2023-09-03 19:45:51metal-clay-300-x-300png.png', NULL, 'PUBLISHED', '2023-05-18 05:22:16', '2026-03-06 02:42:45'),
(36, 1, 'Metal Clay 2', 'Metal Clay II', '320', 'En este nivel II nos pondremos como meta la creación de una pieza más compleja en su elaboración que debe contemplar muchos elementos...', 'In this Level II, our goal will be to create a more complex piece that involves integrating multiple elements…', 'En este nivel II nos pondremos como meta la creación de una pieza más compleja en su elaboración que debe contemplar muchos elementos a unir\n3 clases de 3 horas c/u\n9 horas\n1 proyecto', 'In this Level II, our goal will be to create a more complex piece that must incorporate many elements to be joined together.\n3 classes, 3 hours each\n9 hours\n1 project', 'metalclay2', 'metal-clay-2', 0, '2023-05-18 01:23:10metalclay2png.png', NULL, 'PUBLISHED', '2023-05-18 05:23:12', '2026-03-06 02:44:26'),
(37, 1, 'Curso de Cadena Cubana', 'Cuban Link Chain Course', '360', 'Realizaremos una pulsera empezando por preparar nuestra soldadura y el hilo que necesitamos para realizarlo, el entorchado..', 'We will create a bracelet, starting with the preparation of our solder and the wire needed for the process, the coiling...', 'Realizaremos una pulsera empezando por preparar nuestra soldadura y el hilo que necesitamos para realizarlo, el entorchado, el calado de eslabón y el armado y soldadura de la cadena, estirado y pulido, llevara un broche sencillo\n3 clases de 3 horas c/u\n9 horas\n1 proyecto', 'We will create a bracelet, starting with the preparation of our solder and the wire needed for the process. We will cover coiling, link piercing, chain assembly and soldering, stretching, and polishing. It will include a simple clasp.\n3 classes, 3 hours each\n9 hours\n1 project', 'cadenacubana', 'curso-de-cadena-cubana', 0, '2023-05-22 12:10:48cadenacubanapng.png', NULL, 'PUBLISHED', '2023-05-18 05:24:20', '2026-03-06 02:45:51'),
(38, 1, 'Curso de Engastes Artesanales', 'Artisan Setting Course', '380', 'Son muchas las maneras de engastar piedras de forma artesanal usando muchas veces solo el arco de segueta', 'There are many ways to set stones in an artisan fashion, often using only a jeweler\'s saw...', 'Son muchas las maneras de engastar piedras de forma artesanal usando muchas veces solo el arco de segueta y en otros casos soldaduras sencillas, realizaremos 3 diferentes engastes\n3 clases de 3 horas cada uno\n9 horas\n3 proyecto', 'There are many ways to set stones in an artisan fashion, often using only a jeweler\'s saw and, in other cases, simple soldering. We will create 3 different settings.\n3 classes, 3 hours each\n9 hours\n3 projects', 'engasteartesanal', 'curso-de-engastes-artesanales', 0, '2023-05-18 01:27:12engastesartesanalespng.png', NULL, 'PUBLISHED', '2023-05-18 05:27:13', '2026-03-06 02:47:23'),
(39, 1, 'Curso de Reconstituido en Lamina', 'Sheet Metal Inlay Course (Reconstituted Stone)', '380', 'Es la forma clásica de hacer un reconstituido sobre lamina, buscando un acabado liso y brillante, para ello', 'This is the classic way to perform an inlay on sheet metal, aiming for a smooth and glossy finish. To achieve this...', 'Esta es la forma clásica de hacer un reconstituido sobre lamina, buscando un acabado liso y brillante, para ello debemos de calar y soldar dos laminas donde queden los espacios que rellenaremos con piedras molidas.\n3 clases de 3 horas cada uno\n9 horas\n1 proyecto', 'This is the classic way to perform an inlay on sheet metal, aiming for a smooth and glossy finish. To do so, we must pierce and solder two metal sheets, creating the spaces that we will fill with crushed stones.\n3 classes, 3 hours each\n9 hours\n1 project', 'reconstituidolamina', 'curso-de-reconstituido-en-lamina', 0, '2023-05-18 01:28:17reconstituidolaminapng.png', NULL, 'PUBLISHED', '2023-05-18 05:28:19', '2026-03-06 02:48:32'),
(40, 1, 'Curso de Calado, Textura y Soldadura (Paquete)', 'Piercing, Texture, and Soldering Course (Bundle)', '180', 'Es un curso intensivo de calado con conocimientos básicos del soplete soldadura, texturas martilladas y embutidos.', 'This is an intensive piercing course covering basic torch soldering, hammered textures, and dapping.', 'Este es un curso intensivo de calado con conocimientos básicos del soplete soldadura, texturas martilladas y embutidos. En solo una clase aprenderás estas importantes técnicas de la joyería y te llevaras un par de zarcillos embutidos y un anillo de plantilla realizados por ti\n1 clases\n4 horas\n2 proyecto', 'This is an intensive piercing course with basic knowledge of torch soldering, hammered textures, and dapping. In just one class, you will learn these essential jewelry techniques and take home a pair of dapped earrings and a template ring made by you.\n1 class\n4 hours\n2 projects', 'caladotexturasoldadura', 'curso-de-calado-textura-y-soldadura-paquete', 0, '2023-08-20 19:32:49300-x-300jpg.jpg', NULL, 'PUBLISHED', '2023-05-18 05:29:48', '2026-03-06 02:49:44'),
(41, 1, 'Curso de Anillo Reconstituido sin Base, Solido', 'Solid, Base-Free Reconstituted Ring Course', '220', 'Realizaremos un anillo 100% reconstituido sin necesidad de base compactaremos la molienda de piedra y daremos forma...', 'We will create a 100% reconstituted ring without the need for a metal base. We will compact the crushed stone and shape the ring itself.', 'Realizaremos un anillo 100% reconstituido sin necesidad de base compactaremos la molienda de piedra y daremos forma al anillo\n2 clases\n6 horas\n4 proyecto', 'We will create a 100% reconstituted ring without the need for a metal base; we will compact the crushed stone and shape the ring.\n2 classes\n6 hours\n4 projects', 'anillosinbase', 'curso-de-anillo-reconstituido-sin-base-solido', 0, '2023-05-18 01:31:32anilloreconstituidopng.png', NULL, 'PUBLISHED', '2023-05-18 05:31:36', '2026-03-06 02:56:39'),
(42, 1, 'Curso de Anillo de Madera Reconstituida y Base de Plata', 'Reconstituted Wood Ring and Silver Base Course', '380', 'Utilizando chapilla ( laminas) haremos este aro solido en madera con un método que te enseñaremos el cual será montado...', 'Using wood veneer (sheets), we will make this solid wooden band with a method that we will teach you, which will then be mounted...', 'Utilizando chapilla ( laminas) haremos este aro solido en madera con un método que te enseñaremos el cual será montado en un anillo de plata con la técnica de encapsulado\n3 clases\n9 horas\n1 proyecto', 'Using wood veneer (sheets), we will create this solid wooden band using a method that we will teach you. It will then be mounted onto a silver ring using the encapsulation technique.\n3 classes\n9 hours\n1 project', 'anillomadera', 'curso-de-anillo-de-madera-reconstituida-y-base-de-plata', 0, '2023-05-18 01:33:08anillomaderapng.png', NULL, 'PUBLISHED', '2023-05-18 05:33:28', '2026-03-06 02:58:02'),
(43, 1, 'Curso Básico de Orfebrería', 'Basic Metalsmithing Course', '480', 'Paquete de proyectos en un solo taller esta especialmente diseñado para quieres quieren una formación rápida e intensiva, es una manera de empezar aunque es mucha la información contenida', 'This project bundle in a single workshop is specifically designed for those seeking fast and intensive training. It’s an ideal way to start, despite the large amount of information included…', 'Este paquete de proyectos en un solo taller esta especialmente diseñado para quieres quieren una formación rápida e intensiva, es una manera de empezar aunque es mucha la información contenida ya que en 4 proyectos aprenderás todas las técnicas básicas incluso engaste de cabujón que ya es avanzado, y después puedes continuar con el orden del curso de capacitación curricular\n\nProyectos a Realizar:\nanillo de plantilla\nzarcillos embutidos con texturas con ganchos\nanillo embutido\nanillo con piedra cabujón en engaste de caja\n4 clase clase\n12 horas\n4 proyecto', 'This project bundle in a single workshop is specifically designed for those seeking fast and intensive training. It’s an ideal way to start, despite the density of information; in just 4 projects, you will learn all the basic techniques, including cabochon setting (which is an advanced skill). Afterwards, you can continue with the curriculum training course.\nProjects to be completed:\nTemplate ring\nDapped and textured earrings with hooks\nDapped ring\nCabochon stone ring with a bezel setting\n4 classes\n12 hours\n4 projects', 'basicoorfebreria', 'curso-basico-de-orfebreria', 1, '2023-05-22 10:37:17basicoorfebreriajpg.jpg', 'WZRkLcyAbN0', 'PUBLISHED', '2023-05-18 05:35:17', '2026-03-06 02:59:50'),
(44, 1, 'Cadenas Armadas y Abiertas (sin soldadura)', 'Assembled and Open Chains (No Soldering)', '120', 'Son muchas las cadenas para trabajar es todo un mundo...', 'There are many types of chains to work with; it is an entire world of its own...', 'Son muchas las cadenas para trabajar es todo un mundo, las más usadas son:\nLa Bizantina\nCola de pescado\nLa Redonda\ncada cadena toma una clase la puedes tomar en el orden que desees\n1 clases\n3 horas\n1 proyecto', 'There are many types of chains to work with, it is an entire world. The most common ones are:\nByzantine\nFishtail\nRound\nEach chain type takes one class, and you can take them in any order you wish.\n1 class\n3 hours\n1 project', 'cadenaarmada', 'cadenas-armadas-y-abiertas-sin-soldadura', 0, '2023-05-18 01:36:40cadenaarmadapng.png', NULL, 'PUBLISHED', '2023-05-18 05:36:41', '2026-03-06 03:01:28'),
(45, 1, 'Curso de Elaboración de Moldes de Silicona', 'Silicone Mold Making Course', '220', 'Técnica es ideal para reproducir piezas, puede ser usado para verter en ellos cera derretida para procesos de fundición o también resinas', 'This technique is ideal for reproducing pieces; it can be used to pour melted wax for casting processes or for resins.', 'Esta técnica es ideal para reproducir piezas, puede ser usado para verter en ellos cera derretida para procesos de fundición o también resinas, tiene muchas utilidades, por ejemplo en el Metal clay se usan texturas en planchas hechas de silicona\n2 clases\n6 horas\n1 proyecto', 'This technique is ideal for reproducing pieces; it can be used to pour melted wax for casting processes or for resins. It has many uses; for example, in Metal Clay, silicone texture plates are used.\n2 classes\n6 hours\n1 project', 'moldesiliconaa', 'curso-de-elaboracion-de-moldes-de-silicona', 0, '2023-05-18 01:38:02moldesiliconapng.png', NULL, 'PUBLISHED', '2023-05-18 05:38:04', '2026-03-06 03:02:46'),
(46, 1, 'Curso de Cordón Tejido', 'Woven Cord Course', '120', 'Este cordón resulta una fina solución cuando estamos realizando un dije y necesitamos una cadena para colgarlo o necesitamos una forma', 'This cord is an elegant solution when creating a pendant and needing a chain to hang it, or when requiring a specific shape to complete a bracelet, etc. It is very easy to make and very enjoyable to craft.', 'Este cordón resulta una fina solución cuando estamos realizando un dije y necesitamos una cadena para colgarlo o necesitamos una forma para completar una pulsera etc. es de muy fácil elaboración y es muy entretenido\n1 clases\n3 horas\n1 proyecto', 'This cord is an elegant solution when creating a pendant and needing a chain to hang it, or when requiring a specific shape to complete a bracelet, etc. It is very easy to make and very enjoyable to craft. \n1 class\n3 hours\n1 project', 'cordontejido', 'curso-de-cordon-tejido', 0, '2023-05-18 01:39:12cordontejidopng.png', NULL, 'PUBLISHED', '2023-05-18 05:39:14', '2026-03-06 03:04:02'),
(47, 1, 'Curso de Escapulario con imagen en resina', 'Scapular Course with Resin Image', '220', 'Realizaremos una pieza que consistirá en 2 etapas la primera es realizar la pieza en resina con la inclusión de una imagen', 'We will create a piece consisting of 2 stages; the first is making the resin piece with an image inclusion.', 'Realizaremos una pieza que consistirá en 2 etapas la primera es realizar la pieza en resina con la inclusión de una imagen y como segunda parte es preparara la armazón en metal se realizara un diseño calado con textura y usaremos la técnica del remache para unir\n2 clases\n6 horas\n1 proyecto', 'We will create a piece consisting of 2 stages: the first is making the resin piece with an image inclusion, and the second part is preparing the metal frame. A pierced design with texture will be created, and we will use the riveting technique to join the parts.\n2 classes\n6 hours\n1 project', 'escapularioresina', 'curso-de-escapulario-con-imagen-en-resina', 0, '2023-05-18 01:40:35escapulatoriopng.png', NULL, 'PUBLISHED', '2023-05-18 05:40:37', '2026-03-06 03:05:15'),
(48, 1, 'Elaboración de cajas con la ayuda de: Lamina fina, una moneda y el dado de embutir', 'Box Making using Thin Sheet Metal, a Coin, and a Dapping Die', '220', 'Esta es una técnica de la vieja escuela, es como la introducción al troquel, es muy rápido de hacer, los contenedores', 'This is an old-school technique that serves as an introduction to die-cutting. It is very quick to perform, and the resulting containers are typically used for resin or reconstituted materials.', 'Esta es una técnica de la vieja escuela, es como la introducción al troquel, es muy rápido de hacer, los contenedores normalmente los usos para resina o reconstituido.\n2 clase clase\n6 horas\n1 proyecto', 'This is an old-school technique, much like an introduction to die-cutting; it’s very fast to do, and these containers are normally used for resin or reconstituted stone.\n2 classes\n6 hours\n1 project', 'cajalaminafina', 'elaboracion-de-cajas-con-la-ayuda-de-lamina-fina-una-moneda-y-el-dado-de-embutir', 0, '2023-05-18 02:22:02elabcajaspng.png', NULL, 'PUBLISHED', '2023-05-18 06:22:04', '2026-03-06 03:06:44'),
(49, 1, 'Curso de Cadena China', 'Chinese Chain Course', '400', 'La Cadena China tiene una forma muy especial en su construcción y su técnica de ensamblaje, es muy elaborada pero de una gran hermosura para el diseño de joyas...', 'The Chinese Chain has a very special construction and assembly technique; it is highly elaborate but possesses great beauty for jewelry design…', 'La Cadena China tiene una forma muy especial en su construcción y su técnica de ensamblaje, es muy elaborada pero de una gran hermosura para el diseño de joyas, en este curso aprenderás a fundir y preparar tu hilo de plata, medidas y cálculos de la cadena para su confección y sus diferentes acabados\nIncluye materiales\n4 clases\n12 horas\n1 pulsera como proyecto', 'The Chinese Chain has a very special construction and assembly technique; it is highly elaborate but possesses great beauty for jewelry design. In this course, you will learn to melt and prepare your silver wire, as well as the measurements and calculations required for the chain\'s construction and its various finishes.\nMaterials included\n4 classes\n12 hours\n1 bracelet project', 'cadenachina', 'curso-de-cadena-china', 1, '2023-05-22 10:38:26cadenachinapng.png', NULL, 'PUBLISHED', '2023-05-18 06:23:19', '2026-03-06 01:50:39'),
(50, 1, 'Curso de Diseño 3D', '3D Design Course', '960', 'Los tiempos han cambiado hace unos años un joyero para crear una joya con múltiples engastes de piedras en las formas más complicadas le podía llevar semanas de trabajo…', 'Times have changed; a few years ago, it could take a jeweler weeks of work to create a piece of jewelry with multiple stone settings in the most complicated shapes…', 'Los tiempos han cambiado hace unos años un joyero para crear una joya con múltiples engastes de piedras en las formas más complicadas le podía llevar semanas de trabajo, ahora con este método de diseño 3D puedes desde tu computador realizar la joya más majestuosa que desees, esta se imprime después en impresora 3D en cera para pasar posteriormente al casting o fundición en el material deseado.\n8 clases de 2 horas cada una\n16 horas\nvarios proyecto', 'Times have changed; a few years ago, it could take a jeweler weeks of work to create a piece with multiple stone settings in the most complicated shapes. Now, with this 3D design method, you can create the most majestic jewelry you desire from your computer. This is then 3D printed in wax to subsequently proceed to casting in the desired material.\n8 classes, 2 hours each\n16 hours\nSeveral projects', 'diseno3d', 'curson-de-diseno-3d', 1, '2023-05-22 10:38:51diseno3dpng.png', NULL, 'PUBLISHED', '2023-05-18 06:24:35', '2026-03-06 01:48:35');
INSERT INTO `cursos` (`id`, `user_id`, `name`, `name_eng`, `price`, `description`, `description_eng`, `adicional`, `adicional_eng`, `modal`, `slug`, `isFeatured`, `image`, `urlVideo`, `status`, `created_at`, `updated_at`) VALUES
(51, 1, 'Curso de baños Electrolíticos en Oro, Plata, Cobre, Niquel, Rodio', 'Electroplating Course: Gold, Silver, Copper, Nickel, and Rhodium', '160', 'En este taller aprenderás cómo se realiza un enchapado o baño electrolítico usando un regulador de voltaje y sales de metales como oro, plata.', 'In this workshop, you will learn how to perform plating or electroplating using a voltage regulator and metal salts such as gold and silver.', 'En este taller aprenderás cómo se realiza un enchapado o baño electrolítico usando un regulador de voltaje y sales de metales como oro, plata, etc.\n\nAprenderás sobre la limpieza de la pieza, como debe estar su acabado según lo deseado y los cuidados que debemos que tener al momento de realizar esta tarea.\n1 clase\n4 horas', 'In this workshop, you will learn how to perform plating or electroplating using a voltage regulator and metal salts such as gold, silver, etc.\nYou will learn about cleaning the piece, how the finish should be according to the desired result, and the precautions we must take when performing this task.\n1 class\n4 hours', 'banoelectrolitico', 'curso-de-banos-electroliticos-en-oro-plata-cobre-niquel-rodio', 1, '2023-05-22 10:39:36electrolitospng.png', NULL, 'PUBLISHED', '2023-05-18 06:33:54', '2026-03-06 01:46:48'),
(52, 1, 'Curso Certificado en \"Asistente de Joyero Calificado\"', 'Certified Course: \"Qualified Jeweler\'s Assistant\"', '10800', 'Este taller es una capacitación intensiva, con un perfil para \"Asistente de joyero\", formado para cumplir las diversas tareas que se realizan en un taller productivo o de servicios.', 'This workshop is an intensive training program designed for the \"Jeweler\'s Assistant\" profile, trained to perform the various tasks required in a production or service workshop.', 'Este taller es una capacitación intensiva, con un perfil para \"Asistente de joyero\", formado para cumplir las diversas tareas que se realizan en un taller productivo o de servicios, iniciamos el taller con la fundición de metal en crisol con soplete oxigas para realizar láminas e hilos y se continúa con un programa de clases dividido en tres niveles.\n120 clases, de 3 horas cada una\n360 horas\n3 niveles\n3 horas diarias', 'This workshop is an intensive training program for a \"Jeweler\'s Assistant\" profile, prepared to handle the diverse tasks of a productive or service-oriented workshop. We begin the workshop with metal melting in a crucible using an oxy-gas torch to create sheets and wires, continuing with a class program divided into three levels.\n120 classes, 3 hours each\n360 hours\n3 levels\n3 hours per day', 'joyerocalificado', 'curso-certificado-en-asistente-de-joyero-calificado', 1, '2023-05-22 10:40:19asistentejoyeropng.png', NULL, 'PUBLISHED', '2023-05-18 06:42:51', '2026-03-06 01:01:28'),
(53, 1, 'Curso de Anillo Antiestres', 'Anti-Stress Ring Course', '120', 'Este es un modelo de anillo con mucho movimiento ya que todos los aros internos se moverán libremente, los bordes los expandimos.', 'This is a ring model with a lot of movement since all the inner bands move freely; we expand the edges.', 'Este es un modelo de anillo con mucho movimientos ya que todos los aros internos se moverán libremente, los bordes los expandimos con un embutidor y no se saldrán nunca. incluye materiales.\nclases: 1\nhoras: 6\nproyecto: 1', 'This is a ring model with a lot of movement as all the inner bands move freely; we expand the edges with a dapping tool so they will never come off. Materials included.\nClasses: 1\nHours: 6\nProject: 1', 'anilloantiestress', 'curso-de-anillo-antiestress', 0, '2023-08-19 21:22:26diseno-sin-titulo-4jpg.jpg', NULL, 'PUBLISHED', '2023-05-18 06:44:17', '2026-03-06 00:59:40'),
(54, 1, 'Curso de Casting', 'Casting Course', '350', 'Aprende a reproducir piezas bajo esta forma también llamada cera perdida, aprenderás a realizar todo el proceso de fundición desde el momento.', 'Learn to reproduce pieces using this method, also known as lost-wax casting. You will learn the entire casting process, from building the wax tree to the moment of pouring the molten metal into the mold.', 'Aprende a reproducir piezas bajo esta forma también llamada cera perdida, aprenderás a realizar todo el proceso de fundición desde el momento de hacer el árbol de ceras hasta el momento de echar la colada en el molde.\n3 clases, de 3 horas cada una\n9 horas', 'Learn to reproduce pieces using this method, also known as lost-wax casting. You will learn the entire casting process, from building the wax tree to the moment of pouring the molten metal into the mold.\n3 classes, 3 hours each\n9 hours', 'casting', 'curso-de-casting', 1, '2023-05-22 10:40:45castingpng.png', NULL, 'PUBLISHED', '2023-05-18 06:45:19', '2026-03-06 00:57:53'),
(55, 1, 'Anillos de Matrimonio', 'Wedding Bands', '300', 'Curso anillo de novios, Un Taller especial donde los novios realizan su anillo de matrimonio.', 'Wedding Ring Course: A special workshop where couples create their own wedding bands.', 'Un Taller especial donde los novios realizan su anillo de matrimonio.\nEl taller tiene una duración de 4 horas, aprenderás a soldar y realizar estos hermosos anillos en hilo plano o media caña.\n¡Quedarán felices!\nhaz tu cita!', 'A special workshop where couples craft their own wedding rings.\nThe workshop lasts 4 hours; you will learn to solder and create these beautiful rings in flat or half-round wire.\nYou will be delighted!\nBook your appointment!', 'anillosdematrimonio', 'anillos-de-matrimonio', 1, '2023-08-03 21:03:20curso-noviosjpg.jpg', 'WZRkLcyAbN0', 'PUBLISHED', '2023-08-04 03:58:33', '2026-03-06 00:56:12'),
(57, 5, 'Eventos Especiales para Grupos', 'Special events for groups', '90', 'Eventos especiales para grupos! \nRecibimos hasta 6 personas, el fin de este Taller es aprender mientras te diviertes,', 'We accommodate up to 6 people. The goal of this workshop is to learn while having fun.', 'Recibimos hasta 6 personas, el fin de este Taller es aprender mientras te diviertes, aprenderán técnicas de la orfebrería usando metales, resina, madera, esmalte o lo que más le guste, realizarán una hermosa pieza de joyería, objeto o escultura  mientras disfrutas y compartes con amigos...el precio es por persona, haz tu cita.', 'We accommodate up to 6 people. The goal of this workshop is to learn while having fun. You will learn metalsmithing techniques using metals, resin, wood, enamel, or whatever you like best. You will create a beautiful piece of jewelry, object, or sculpture while enjoying and sharing with friends. The price is per person; book your appointment now.', 'eventosespecialesparagrupos', 'Cursos-especiales-para-grupos', 1, '2023-08-12 18:58:20foto-agrandanda-cuerso-grupospng.png', NULL, 'PUBLISHED', '2023-08-06 01:42:32', '2026-03-06 00:54:22'),
(58, 5, 'Anillo de Plata con Reconstituido en Piedra', 'Silver Ring with Inlay (Reconstituted Stone)', '320', 'En este video documenta el proceso de cómo sería el paso a paso del curso para elaborar un Anillo en Banda con Reconstituido, si deseas tomar este curso online o en físico aquí en Houston Tx, solo contáctanos.', 'This video documents the step-by-step process of the course for making a Band Ring with Stone Inlay. If you wish to take this course online or in person here in Houston, TX, just contact us.', 'Se realizará una Anillo o Dije en plata 925, con piedra de lapislázuli, Turquesa o Malaquita, en este video presento la elaboración de un Anillo en Banda con Reconstituido, si deseas tomar este curso online o en físico aquí en Houston Tx, solo contactanos</p><p>En este video documenta el proceso de lo que sería el curso para elaborar un Anillo en Banda con Reconstituido, si deseas tomar este curso online o en físico aquí en Houston Tx, solo contáctanos.\n3 clases de 3 horas cada una\n9 Horas\nMaterial de plata incluido\nrealizaremos una pieza en plata con reconstituido', 'You will create a .925 silver ring or pendant with Lapis Lazuli, Turquoise, or Malachite. In this video, I present the making of a Band Ring with Stone Inlay. If you wish to take this course online or in person here in Houston, TX, just contact us.\nThis video documents the process of the course for crafting a Band Ring with Stone Inlay. If you wish to take this course online or in person here in Houston, TX, just contact us.\n3 classes, 3 hours each\n9 Hours\nSilver material included\nWe will create one silver piece with stone inlay', 'anillodeplataconreconstituidoenpiedra', 'anillo-de-plata-con-reconstituido-en-piedra', 1, '2023-08-20 00:21:08300-x-300-jpgjpg.jpg', '8P9z2qzQ50o', 'PUBLISHED', '2023-08-14 00:11:06', '2026-03-06 00:51:15');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dijes`
--

CREATE TABLE `dijes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `price` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('PUBLISHED','PENDING','REJECTED') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'PENDING',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `dijes`
--

INSERT INTO `dijes` (`id`, `title`, `slug`, `model`, `description`, `price`, `image`, `status`, `created_at`, `updated_at`) VALUES
(1, 'COLLECTION: POWERFULS', NULL, 'MC25', '<p><span style=\"background-color:rgb(255,255,255);color:rgb(51,51,51);\">MATERIALS: SILVER 925</span><br><span style=\"background-color:rgb(255,255,255);color:rgb(51,51,51);\">PENDANTIF</span><br><span style=\"background-color:rgb(255,255,255);color:rgb(51,51,51);\">STONE:CARNELIAN</span><br><span style=\"background-color:rgb(255,255,255);color:rgb(51,51,51);\">MEASURE/SIZE: 50 CM / 19.6 INCH</span><br><span style=\"background-color:rgb(255,255,255);color:rgb(51,51,51);\">WEIGTH:21 GRS / 0.74 OZ</span></p>', '120', '2023-05-18 04:06:43dije1png.png', 'PUBLISHED', '2023-05-17 05:08:17', '2023-05-18 08:08:18'),
(2, 'COLLECTION: ORAFA COLLECTION', NULL, 'MB27', '<p><span style=\"background-color:rgb(255,255,255);color:rgb(51,51,51);\">MATERIALS: SILVER</span><br><span style=\"background-color:rgb(255,255,255);color:rgb(51,51,51);\">PENDANTIF</span><br><span style=\"background-color:rgb(255,255,255);color:rgb(51,51,51);\">STONE: ZIRCON BLUE</span><br><span style=\"background-color:rgb(255,255,255);color:rgb(51,51,51);\">MEASURE/SIZE: 60 CM / 23.6 INCH</span><br><span style=\"background-color:rgb(255,255,255);color:rgb(51,51,51);\">WEIGTH: 3.4 GRS / 0.12 OUNZA</span></p>', '289', '2023-05-18 04:07:26dije2png.png', 'PUBLISHED', '2023-05-17 05:08:17', '2023-05-18 08:08:22'),
(3, 'COLLECTION: POWERFULS', NULL, 'MB26', '<p><span style=\"background-color:rgb(255,255,255);color:rgb(51,51,51);\">MATERIALS: SILVER PLATINUM</span><br><span style=\"background-color:rgb(255,255,255);color:rgb(51,51,51);\">PENDENTIF</span><br><span style=\"background-color:rgb(255,255,255);color:rgb(51,51,51);\">STONE: CITRINE</span><br><span style=\"background-color:rgb(255,255,255);color:rgb(51,51,51);\">MEASURE/SIZE: 6 1/4</span><br><span style=\"background-color:rgb(255,255,255);color:rgb(51,51,51);\">WEIGTH: 3.3 GRS / 0.12</span></p>', '375', '2023-05-18 04:08:09dije3png.png', 'PUBLISHED', '2023-05-18 02:41:29', '2023-05-18 08:08:27');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `eventoorlandos`
--

CREATE TABLE `eventoorlandos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `firstName` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastName` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `estado` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pais` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telefono` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `movil` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dondeSeEntero` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `eventoorlandos`
--

INSERT INTO `eventoorlandos` (`id`, `firstName`, `lastName`, `estado`, `pais`, `telefono`, `movil`, `dondeSeEntero`, `email`, `email_verified_at`, `created_at`, `updated_at`) VALUES
(1, 'Neyra', 'Rendon', 'Florida', 'USA', '7868068642', '7868068642', 'Instagram', 'veracierta13@hotmail.com', NULL, '2023-05-25 03:33:14', '2023-05-25 03:33:14'),
(2, 'Neyra', 'Rendon', 'Florida', 'USA', '7868068642', '7868068642', 'Instagram', 'veracierta13@hotmail.com', NULL, '2023-05-25 03:33:14', '2023-05-25 03:33:14');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `expocafs`
--

CREATE TABLE `expocafs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('PUBLISHED','PENDING','REJECTED') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'PENDING',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `expocafs`
--

INSERT INTO `expocafs` (`id`, `image`, `status`, `created_at`, `updated_at`) VALUES
(1, '2023-05-18 04:28:06piezasexpocaf01jpg.jpg', 'PUBLISHED', '2023-05-17 04:35:58', '2023-05-18 08:29:36'),
(2, '2023-05-18 04:28:26piezasexpocaf02jpg.jpg', 'PUBLISHED', '2023-05-18 02:43:20', '2023-05-18 08:29:41'),
(3, '2023-05-18 04:28:40piezasexpocaf03jpg.jpg', 'PUBLISHED', '2023-05-18 08:28:41', '2023-05-18 08:29:44'),
(4, '2023-05-18 04:28:52piezasexpocaf04jpg.jpg', 'PUBLISHED', '2023-05-18 08:28:53', '2023-05-18 08:29:48'),
(5, '2023-05-18 04:29:02piezasexpocaf04jpg.jpg', 'PUBLISHED', '2023-05-18 08:29:03', '2023-05-18 08:29:53'),
(6, '2023-05-18 04:29:21piezasexpocaf05jpg.jpg', 'PUBLISHED', '2023-05-18 08:29:22', '2023-05-18 08:29:56'),
(7, '2023-05-18 04:29:30piezasexpocaf06jpg.jpg', 'PUBLISHED', '2023-05-18 08:29:32', '2023-05-18 08:30:01');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `galleryschools`
--

CREATE TABLE `galleryschools` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `galleryschools`
--

INSERT INTO `galleryschools` (`id`, `title`, `image`, `created_at`, `updated_at`) VALUES
(1, NULL, '2023-05-18 13:40:38img-4941jpg.jpg', '2023-05-18 17:40:41', '2023-05-18 17:40:41'),
(2, NULL, '2023-05-18 13:40:57img-3946jpg.jpg', '2023-05-18 17:40:59', '2023-05-18 17:40:59'),
(3, NULL, '2023-05-18 13:41:15img-3260jpg.jpg', '2023-05-18 17:41:18', '2023-05-18 17:41:18'),
(4, NULL, '2023-05-18 13:41:3410982416-782793918440642-3183658290050116652-njpg.jpg', '2023-05-18 17:41:37', '2023-05-18 17:41:37'),
(5, NULL, '2023-05-18 13:42:17escuelajpg.jpg', '2023-05-18 17:42:19', '2023-05-18 17:42:19'),
(6, NULL, '2023-05-18 13:42:32escuela2jpg.jpg', '2023-05-18 17:42:33', '2023-05-18 17:42:33'),
(7, NULL, '2023-05-18 13:43:04escuela3jpg.jpg', '2023-05-18 17:43:05', '2023-05-18 17:43:05'),
(8, NULL, '2023-05-18 13:43:22ursijpg.jpg', '2023-05-18 17:43:23', '2023-05-18 17:43:23'),
(9, NULL, '2023-05-18 13:46:143bcdf6a1-c522-4cb9-8df2-f8df9240fd9bjpg.jpg', '2023-05-18 17:46:16', '2023-05-18 17:46:16'),
(10, NULL, '2023-05-18 13:46:283f00b15a-2294-40ac-a5b5-d1dae004df0fjpg.jpg', '2023-05-18 17:46:29', '2023-05-18 17:46:29'),
(11, NULL, '2023-05-18 13:46:467be113ec-8d95-4ab5-8ae8-04b3a3365f9fjpg.jpg', '2023-05-18 17:46:48', '2023-05-18 17:46:48'),
(12, NULL, '2023-05-18 13:46:5818f6955c-c474-4cdb-a97b-4915845a1092jpg.jpg', '2023-05-18 17:46:59', '2023-05-18 17:46:59'),
(13, NULL, '2023-05-18 13:47:1219be6ab7-e211-4ff0-b5b2-76f1554dff0ejpg.jpg', '2023-05-18 17:47:13', '2023-05-18 17:47:13'),
(14, NULL, '2023-05-18 13:47:2347de5f79-2a9d-4cd5-9b61-e0bf271cbe86jpg.jpg', '2023-05-18 17:47:24', '2023-05-18 17:47:24'),
(15, NULL, '2023-05-18 13:47:3587de360d-1aec-4542-9926-3c4632048f91jpg.jpg', '2023-05-18 17:47:37', '2023-05-18 17:47:37'),
(16, NULL, '2023-05-18 13:47:4602193f44-a916-4f3d-958c-b8166aebd12bjpg.jpg', '2023-05-18 17:47:47', '2023-05-18 17:47:47'),
(17, NULL, '2023-05-18 13:47:5871916d73-2bb8-40bd-a107-da22563630b6jpg.JPG', '2023-05-18 17:47:59', '2023-05-18 17:47:59'),
(18, NULL, '2023-05-18 13:48:0894476d91-763b-456e-94f3-4dfebe35805cjpg.jpg', '2023-05-18 17:48:09', '2023-05-18 17:48:09'),
(19, NULL, '2023-05-18 13:48:2395812741-e925-4dd0-8a0c-24d6b9c52258jpg.jpg', '2023-05-18 17:48:25', '2023-05-18 17:48:25'),
(20, NULL, '2023-05-18 13:48:3697986291-b52c-4257-9fc6-345eaa104b73-editadojpg.jpg', '2023-05-18 17:48:37', '2023-05-18 17:48:37'),
(21, NULL, '2023-05-18 13:48:53be6626fc-2b6c-4fef-bd22-58fe512f53e01jpg.jpg', '2023-05-18 17:48:55', '2023-05-18 17:48:55'),
(22, NULL, '2023-05-18 13:49:11d09bcc9c-b9e3-4efd-9227-3a1566131722jpg.JPG', '2023-05-18 17:49:12', '2023-05-18 17:49:12'),
(23, NULL, '2023-05-18 13:49:27imagen-013jpg.jpg', '2023-05-18 17:49:29', '2023-05-18 17:49:29'),
(24, NULL, '2023-05-18 13:49:41img-0205jpg.JPG', '2023-05-18 17:49:42', '2023-05-18 17:49:42'),
(25, NULL, '2023-05-18 13:49:52img-0208jpg.JPG', '2023-05-18 17:49:53', '2023-05-18 17:49:53');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `herramientas`
--

CREATE TABLE `herramientas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title_eng` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subtitle` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subtitle_eng` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `description_eng` text COLLATE utf8mb4_unicode_ci,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('PUBLISHED','PENDING','REJECTED') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'PENDING',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `herramientas`
--

INSERT INTO `herramientas` (`id`, `title`, `title_eng`, `subtitle`, `subtitle_eng`, `description`, `description_eng`, `image`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Kit de Herramientas e Insumos', 'Tools and Supplies Kit', 'Para Reconstituido', 'For Reconstitution', 'mortero de metal\nlijas\ncrema de pulir\npinzas\npega loca\nMalaquita\ncoral\napislazuli\nturquesa', 'Metal mortar and pestle\nSandpaper\nPolishing cream\nTweezers\nSuper glue\nMalachite\nCoral\nLapis Lazuli\nTurquoise', NULL, 'PUBLISHED', '2023-05-14 21:49:00', '2026-03-05 01:57:44'),
(2, 'Kit de Herramientas e Insumos', 'Tools and Supplies Kit', 'Para Metal Clay', 'For Metal Clay', 'listones plásticos calibrados para laminar clay.\nexacto\nreglas de medir\npunzón de corte y marcado\nrodillo y otros para laminado y texturas\naceite desmoldante\nalgodón\ncepillo de bronce\nlijas\npapel plástico\npapel encerado\npinza de cobre\nsoplete opciones\ncrema de pulir\npinza doble AA\nset de medidas de anillos\nmartillo de plástico\nlastra de madera\nlastra de metal con medidas\ncentra punto.\ncalentador\nolla electrica', 'Calibrated plastic strips for clay rolling\nPrecision craft knife\nMeasuring rulers\nCutting and marking awl\nRolling pin and laminate/texture tools\nMold release\nCotton\nBrass brush\nSandpaper\nPlastic wrap\nWax paper\nCopper tweezers\nTorch options\nPolishing compound\nAA tweezers\nRing sizer set\nPlastic mallet\nWooden ring mandrel\nGraduated metal ring mandrel\nCenter punch\nWarmer\nElectric pot', NULL, 'PUBLISHED', '2023-05-14 21:49:01', '2026-03-05 02:02:13'),
(3, 'Kit de Herramientas e Insumos', 'Tools and Supplies Kit', 'Para Orfebrería', 'For Goldsmithing', 'Arco de segueta de 120 mm\nPelos de segueta # 2/0 o 3/0\nVernier\nTijera grande\nSoplete\nPinzas de soldar\nLadrillo de soldadura\nLámina de latón\nAstillero de tornillo\nPinza de cobre\nBolsa de arena\nMordaza de madera\nLijas\nMartillo de Herrero\nMartillo de plástico\nMartillo de bola\nTas de martillar\nMotor colgante\nSet de alicates\nBase para motor colgante\nMechas de taladro\nLima\nCrema de pulir', '120 mm Saw frame\nSaw blades # 2/0 or 3/0\nVernier caliper\nLarge shears\nTorch\nSoldering tweezers\nSoldering brick\nBrass sheet\nScrew-on bench pin\nCopper tweezers\nSandbag\nWooden ring clamp\nSandpaper\nBlacksmith hammer\nPlastic mallet\nBall-peen hammer\nBench block\nFlex shaft motor\nPliers set\nFlex shaft motor stand\nDrill bits\nHand file\nPolishing compound', NULL, 'PUBLISHED', '2023-05-18 02:44:51', '2026-03-05 02:06:19');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `joyas`
--

CREATE TABLE `joyas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('PUBLISHED','PENDING','REJECTED') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'PENDING',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `joyas`
--

INSERT INTO `joyas` (`id`, `image`, `status`, `created_at`, `updated_at`) VALUES
(1, '2023-05-18 05:02:03expojoyasgranpantalla01jpg.jpg', 'PUBLISHED', '2023-05-17 18:31:25', '2023-05-18 09:02:05'),
(2, '2023-05-18 04:42:59expojoyasgranpantalla02jpg.jpg', 'PUBLISHED', '2023-05-18 02:43:41', '2023-05-18 08:43:13'),
(3, '2023-05-18 13:06:51expojoyasgranpantalla03jpg.jpg', 'PUBLISHED', '2023-05-18 17:06:53', '2023-05-18 17:20:20'),
(4, '2023-05-18 13:10:05expojoyasgranpantalla04jpg.jpg', 'PUBLISHED', '2023-05-18 17:10:07', '2023-05-18 17:20:15'),
(5, '2023-05-18 13:10:17expojoyasgranpantalla05jpg.jpg', 'PUBLISHED', '2023-05-18 17:10:19', '2023-05-18 17:20:10'),
(6, '2023-05-18 13:10:29expojoyasgranpantalla06jpg.jpg', 'PUBLISHED', '2023-05-18 17:10:30', '2023-05-18 17:20:05'),
(7, '2023-05-18 13:10:40expojoyasgranpantalla07jpg.jpg', 'PUBLISHED', '2023-05-18 17:10:41', '2023-05-18 17:20:00'),
(8, '2023-05-18 13:10:50expojoyasgranpantalla08jpg.jpg', 'PUBLISHED', '2023-05-18 17:10:52', '2023-05-18 17:19:56'),
(9, '2023-05-18 13:11:01expojoyasgranpantalla09jpg.jpg', 'PUBLISHED', '2023-05-18 17:11:02', '2023-05-18 17:19:49'),
(10, '2023-05-18 13:11:11expojoyasgranpantalla10jpg.jpg', 'PUBLISHED', '2023-05-18 17:11:13', '2023-05-18 17:19:45'),
(11, '2023-05-18 13:11:30expojoyasgranpantalla11jpg.jpg', 'PUBLISHED', '2023-05-18 17:11:31', '2023-05-18 17:19:41'),
(12, '2023-05-18 13:16:32expojoyasgranpantalla12jpg.jpg', 'PUBLISHED', '2023-05-18 17:16:34', '2023-05-18 17:19:36'),
(13, '2023-05-18 13:16:43expojoyasgranpantalla13jpg.jpg', 'PUBLISHED', '2023-05-18 17:16:44', '2023-05-18 17:19:33'),
(14, '2023-05-18 13:16:55expojoyasgranpantalla14jpg.jpg', 'PUBLISHED', '2023-05-18 17:16:57', '2023-05-18 17:19:28'),
(15, '2023-05-18 13:17:05expojoyasgranpantalla15jpg.jpg', 'PUBLISHED', '2023-05-18 17:17:07', '2023-05-18 17:19:24'),
(16, '2023-05-18 13:17:16expojoyasgranpantalla16jpg.jpg', 'PUBLISHED', '2023-05-18 17:17:18', '2023-05-18 17:19:21'),
(17, '2023-05-18 13:17:27expojoyasgranpantalla17jpg.jpg', 'PUBLISHED', '2023-05-18 17:17:29', '2023-05-18 17:19:14'),
(18, '2023-05-18 13:17:38expojoyasgranpantalla18jpg.jpg', 'PUBLISHED', '2023-05-18 17:17:41', '2023-05-18 17:19:10'),
(19, '2023-05-18 13:17:53expojoyasgranpantalla19jpg.jpg', 'PUBLISHED', '2023-05-18 17:17:55', '2023-05-18 17:19:05'),
(20, '2023-05-18 13:18:04expojoyasgranpantalla20jpg.jpg', 'PUBLISHED', '2023-05-18 17:18:06', '2023-05-18 17:19:01'),
(21, '2023-05-18 13:18:14expojoyasgranpantalla21jpg.jpg', 'PUBLISHED', '2023-05-18 17:18:16', '2023-05-18 17:18:57'),
(22, '2023-05-18 13:18:28expojoyasgranpantalla22jpg.jpg', 'PUBLISHED', '2023-05-18 17:18:30', '2023-05-18 17:18:53'),
(23, '2023-05-18 13:18:38expojoyasgranpantalla23jpg.jpg', 'PUBLISHED', '2023-05-18 17:18:39', '2023-05-18 17:18:49');

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
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2022_11_30_175428_create_jobs_table', 1),
(6, '2022_12_18_035041_create_contacts_table', 1),
(7, '2023_04_30_145301_create_categories_table', 1),
(8, '2023_04_30_150901_create_profile_table', 1),
(9, '2023_05_02_150541_create_banner_table', 1),
(10, '2023_05_02_150700_create_cursos_table', 1),
(11, '2023_05_02_150901_create_cronologiacursos_table', 1),
(12, '2023_05_02_151113_create_eventoorlando_table', 1),
(13, '2023_05_02_192419_create_services_table', 1),
(14, '2023_05_02_200736_create_galleryschools_table', 1),
(15, '2023_05_13_170813_create_anillos_table', 1),
(16, '2023_05_13_180326_create_aretes_table', 1),
(17, '2023_05_13_180425_create_dijes_table', 1),
(18, '2023_05_13_180450_create_pulseras_table', 1),
(19, '2023_05_13_180525_create_publicaciones_table', 1),
(20, '2023_05_13_180558_create_joyas_table', 1),
(21, '2023_05_13_180622_create_expocafs_table', 1),
(22, '2023_05_13_232827_create_herramientas_table', 1),
(23, '2022_12_09_225551_create_payments_table', 2),
(24, '2023_05_15_001711_create_subscripciones_table', 3),
(26, '2023_04_30_145714_create_posts_table', 4),
(27, '2023_05_19_000000_add_english_fields_to_cursos_table', 5),
(28, '2023_05_19_000001_add_english_fields_to_posts_table', 6),
(29, '2023_05_19_000002_add_english_field_to_categories_table', 7),
(30, '2023_05_19_000003_add_english_fields_to_services_table', 8),
(31, '2023_05_19_000004_add_english_fields_to_herramientas_table', 9),
(32, '2023_05_19_000005_add_english_fields_to_cronologiacursos_table', 10),
(33, '2023_05_19_000006_add_status_to_cronologiacursos_table', 11);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
('ugalletti@hotmail.com', '0Uo4dKbo6rWWydiSOjYUATNyzhw8e94f06GEkSZ1oFoZ1v74W3cIVJQwPp5RrBX9PmLm2uLIuRf0KowO', '2023-07-04 21:36:20');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `payments`
--

CREATE TABLE `payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `curso_id` bigint(20) UNSIGNED DEFAULT NULL,
  `referencia` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `monto` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `payments`
--

INSERT INTO `payments` (`id`, `user_id`, `curso_id`, `referencia`, `name`, `email`, `nombre`, `monto`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 1, '2VB7412495004994W', 'Anillo Antiestress', 'sb-4d2wh864245@personal.example.com', 'Doe', '400.00', '2023-05-17 03:57:44', '2023-05-17 03:57:44', NULL);

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
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `posts`
--

CREATE TABLE `posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title_eng` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `description_eng` text COLLATE utf8mb4_unicode_ci,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `isFeatured` tinyint(1) NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `status` enum('PUBLISHED','PENDING','REJECTED') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'PENDING',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `posts`
--

INSERT INTO `posts` (`id`, `title`, `title_eng`, `description`, `description_eng`, `slug`, `isFeatured`, `image`, `user_id`, `category_id`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Curso Cadena Parte 1', 'Chain Course Part 1\"', 'Este es el resultado del curso de cadena Cubana y broche de caja, realizado por nuestra colega Orfebre de Venezuela Zury que nos visita y siempre que viene a Houston aprovecha y toma algunos de mis cursos, la pulsera quedo muy bien la hicimos de 8 pulgadas y terminó pesando 21.5 grs calculo que hubo una merma de un 10 %.', 'This is the result of the Cuban Link and box clasp course, made by our fellow goldsmith from Venezuela, Zury. She visits us often and, whenever she comes to Houston, she takes some of my courses. The bracelet turned out great; we made it 8 inches long, and it ended up weighing 21.5 grams. I estimate there was a 10% metal loss.', 'curso-cadena-parte-1', 1, '2023-05-21 03:30:38blog2png.png', 1, 1, 'PUBLISHED', '2023-05-18 16:43:41', '2026-03-05 03:21:57'),
(3, '¿Cómo se hace una Cadena Barbada ó Cubana?', 'How to make a Curb or Cuban Link Chain?', 'Aprende mas sobre esta técnica en nuestro cursos online, o presenciales', 'Learn more about this technique in our online or in-person courses', 'como-se-hace-una-cadena-barbada-o-cubana', 1, '2023-05-18 13:05:21blog3png.png', 1, 1, 'PUBLISHED', '2023-05-18 17:05:23', '2026-03-05 03:20:13'),
(4, 'SOLO PARA NOVIOS...', 'FOR COUPLES ONLY', 'Este es un Taller único!, donde los novios realizan sus Aros Nupciales en un ambiente cargado de Fuego, magia y el compromiso de los futuros esposos, podrán realizar los anillos en el material que mas les guste aprenderán todas las técnicas y pasaran un rato increíble', 'This is a one-of-a-kind workshop! Here, couples create their own wedding bands in an atmosphere filled with fire, magic, and the deep commitment of the future spouses. You can craft your rings in the material of your choice while learning all the essential jewelry techniques and enjoying an incredible time together.', 'Los-novios-realizan-sus-aros-de-boda', 1, '2023-10-20 17:50:33noviospng.png', 1, 2, 'PUBLISHED', '2023-07-24 02:06:38', '2026-03-05 03:18:58'),
(5, 'EVENTOS ESPECIALES PARA GRUPOS', 'SPECIAL EVENTS FOR GROUPS', 'GRUPOS DE HASTA 6 PERSONAS\nHemos creado esta actividad para grupos, si eres el tipo de persona que le gusta realizar eventos con amigos con el fin de compartir te recomendamos estos talleres, tenemos muchas opciones, incluye todo', 'GROUPS OF UP TO 6 PEOPLE\nWe have designed this activity for groups. If you enjoy hosting events with friends to share a creative experience, we highly recommend these workshops. We offer many options, and everything is included.', 'eventos-especiales-para-grupos', 1, '2023-07-23 19:12:16jpg-10-copyjpg.jpg', 1, 1, 'PUBLISHED', '2023-07-24 02:12:19', '2026-03-05 03:15:54'),
(6, 'Anillo en plata con reconstituido en piedra', 'Silver ring with reconstituted stone', 'Pueden ver el paso a paso de este anillo en mi canal de youtube aqui les dejo el link:  https://youtu.be/8P9z2qzQ50o', 'You can watch the step-by-step process of making this ring on my YouTube channel. Here is the link: https://youtu.be/8P9z2qzQ50o', 'anillo-en-plata-con-reconstituido-en-piedr', 1, '2023-10-20 17:41:01anillocursoblogjpg.jpg', 1, 1, 'PUBLISHED', '2023-08-14 00:40:26', '2026-03-05 03:12:11');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `profiles`
--

CREATE TABLE `profiles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `surname` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `direccion` text COLLATE utf8mb4_unicode_ci,
  `pais` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `estado` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ciudad` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telhome` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telmovil` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `facebook` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `instagram` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `twitter` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `linkedin` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('VERIFIED','PENDING','REJECTED') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'PENDING',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `profiles`
--

INSERT INTO `profiles` (`id`, `user_id`, `nombre`, `surname`, `direccion`, `pais`, `estado`, `ciudad`, `telhome`, `telmovil`, `facebook`, `instagram`, `twitter`, `linkedin`, `image`, `status`, `created_at`, `updated_at`) VALUES
(1, 6, 'Malcolm', 'Cordova', NULL, 'Venezuela', 'Distrito Federal', NULL, '+584241874370', '1223', '@malcolm', '@malcolm', '@malcolm', '@malcolm', NULL, 'PENDING', '2023-05-17 20:14:52', '2023-05-23 23:00:28');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `publicaciones`
--

CREATE TABLE `publicaciones` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('PUBLISHED','PENDING','REJECTED') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'PENDING',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `publicaciones`
--

INSERT INTO `publicaciones` (`id`, `image`, `status`, `created_at`, `updated_at`) VALUES
(1, '2023-05-18 04:14:33articulosprensa01jpg.jpg', 'PUBLISHED', '2023-05-17 18:02:02', '2023-05-18 08:15:09'),
(2, '2023-05-18 04:14:48articulosprensa02jpg.jpg', 'PUBLISHED', '2023-05-17 18:02:02', '2023-05-18 08:15:14'),
(3, '2023-05-18 04:15:02articulosprensa03jpg.jpg', 'PUBLISHED', '2023-05-18 02:44:01', '2023-05-18 08:15:20'),
(4, '2023-05-18 04:15:31articulosprensa04jpg.jpg', 'PUBLISHED', '2023-05-18 08:15:33', '2023-05-18 08:15:40'),
(5, '2023-05-18 04:15:51articulosprensa05jpg.jpg', 'PUBLISHED', '2023-05-18 08:15:52', '2023-05-18 08:15:58'),
(6, '2023-05-18 04:16:10articulosprensa06jpg.jpg', 'PUBLISHED', '2023-05-18 08:16:12', '2023-05-18 08:19:11'),
(7, '2023-05-18 04:16:23articulosprensa07jpg.jpg', 'PUBLISHED', '2023-05-18 08:16:24', '2023-05-18 08:19:15'),
(8, '2023-05-18 04:16:35articulosprensa08jpg.jpg', 'PUBLISHED', '2023-05-18 08:16:36', '2023-05-18 08:19:19'),
(9, '2023-05-18 04:16:47articulosprensa09jpg.jpg', 'PUBLISHED', '2023-05-18 08:16:49', '2023-05-18 08:19:47'),
(10, '2023-05-18 04:17:01articulosprensa10jpg.jpg', 'PUBLISHED', '2023-05-18 08:17:02', '2023-05-18 08:19:51'),
(11, '2023-05-18 04:17:16articulosprensa11jpg.jpg', 'PUBLISHED', '2023-05-18 08:17:17', '2023-05-18 08:19:55'),
(12, '2023-05-18 04:17:36articulosprensa12jpg.jpg', 'PUBLISHED', '2023-05-18 08:17:38', '2023-05-18 08:20:01'),
(13, '2023-05-18 04:17:48articulosprensa13jpg.jpg', 'PUBLISHED', '2023-05-18 08:17:50', '2023-05-18 08:20:05'),
(14, '2023-05-18 04:18:01articulosprensa14jpg.jpg', 'PUBLISHED', '2023-05-18 08:18:02', '2023-05-18 08:20:09'),
(15, '2023-05-18 04:18:16articulosprensa15jpg.jpg', 'PUBLISHED', '2023-05-18 08:18:17', '2023-05-18 08:20:13'),
(16, '2023-05-18 04:18:56articulosprensa16jpg.jpg', 'PUBLISHED', '2023-05-18 08:18:58', '2023-05-18 08:20:17'),
(17, NULL, 'PUBLISHED', '2023-05-18 08:19:03', '2023-05-18 08:20:22'),
(18, '2023-05-18 04:21:10articulosprensa17jpg.jpg', 'PUBLISHED', '2023-05-18 08:21:12', '2023-05-18 08:24:55'),
(19, '2023-05-18 04:21:49articulosprensa18jpg.jpg', 'PUBLISHED', '2023-05-18 08:21:51', '2023-05-18 08:24:59'),
(20, '2023-05-18 04:22:02articulosprensa19jpg.jpg', 'PUBLISHED', '2023-05-18 08:22:04', '2023-05-18 08:25:03'),
(21, '2023-05-18 04:22:16articulosprensa20jpg.jpg', 'PUBLISHED', '2023-05-18 08:22:18', '2023-05-18 08:25:08'),
(22, '2023-05-18 04:22:34articulosprensa21jpg.jpg', 'PUBLISHED', '2023-05-18 08:22:35', '2023-05-18 08:25:12'),
(23, '2023-05-18 04:22:46articulosprensa22jpg.jpg', 'PUBLISHED', '2023-05-18 08:22:47', '2023-05-18 08:25:16'),
(24, '2023-05-18 04:23:26articulosprensa23jpg.jpg', 'PUBLISHED', '2023-05-18 08:23:27', '2023-05-18 08:25:20'),
(25, '2023-05-18 04:23:40articulosprensa24jpg.jpg', 'PUBLISHED', '2023-05-18 08:23:42', '2023-05-18 08:25:27'),
(26, '2023-05-18 04:23:55articulosprensa25jpg.jpg', 'PUBLISHED', '2023-05-18 08:23:56', '2023-05-18 08:25:32'),
(27, '2023-05-18 04:24:11articulosprensa26jpg.jpg', 'PUBLISHED', '2023-05-18 08:24:13', '2023-05-18 08:25:36'),
(28, '2023-05-18 04:24:27articulosprensa27jpg.jpg', 'PUBLISHED', '2023-05-18 08:24:29', '2023-05-18 08:25:40'),
(29, '2023-05-18 04:24:40articulosprensa28jpg.jpg', 'PUBLISHED', '2023-05-18 08:24:42', '2023-05-18 08:25:44');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pulseras`
--

CREATE TABLE `pulseras` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `price` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('PUBLISHED','PENDING','REJECTED') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'PENDING',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `pulseras`
--

INSERT INTO `pulseras` (`id`, `title`, `slug`, `model`, `description`, `price`, `image`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Collection Angel', NULL, 'UG53', '<p><span style=\"background-color:rgb(255,255,255);color:rgb(51,51,51);\">BANGLE</span><br><span style=\"background-color:rgb(255,255,255);color:rgb(51,51,51);\">Silver 925</span><br><span style=\"background-color:rgb(255,255,255);color:rgb(51,51,51);\">Stone: Mother of Pearl heart,</span><br><span style=\"background-color:rgb(255,255,255);color:rgb(51,51,51);\">Pearl beads, ruby beads,</span><br><span style=\"background-color:rgb(255,255,255);color:rgb(51,51,51);\">Agatha beads.</span></p>', '0', '2023-05-18 04:09:54pulsera1png.png', 'PUBLISHED', '2023-05-17 18:12:45', '2023-05-18 17:20:39'),
(2, 'Collection Bangle', NULL, 'UG54', '<p><span style=\"background-color:rgb(255,255,255);color:rgb(51,51,51);\">MATERIALS: Silver 925</span><br><span style=\"background-color:rgb(255,255,255);color:rgb(51,51,51);\">STONES: Mother of Pearl heart,</span><br><span style=\"background-color:rgb(255,255,255);color:rgb(51,51,51);\">beads Glass MEASURE : 6.5 cm / 2.56 inch</span><br><span style=\"background-color:rgb(255,255,255);color:rgb(51,51,51);\">(Internal Measure).</span><br><span style=\"background-color:rgb(255,255,255);color:rgb(51,51,51);\">WEIGTH: 54.02 GRS / 1.91 OUNCE</span></p>', '225', '2023-05-18 04:10:50pulsera2png.png', 'PUBLISHED', '2023-05-17 18:12:46', '2023-05-18 17:20:51'),
(3, 'Powerfuls Collection', NULL, 'UG55', '<p><span style=\"background-color:rgb(255,255,255);color:rgb(51,51,51);\">MATERIALS: SILVER 925</span><br><span style=\"background-color:rgb(255,255,255);color:rgb(51,51,51);\">BRACELET</span><br><span style=\"background-color:rgb(255,255,255);color:rgb(51,51,51);\">STONE: AMHETYST</span><br><span style=\"background-color:rgb(255,255,255);color:rgb(51,51,51);\">MEASURE/SIZE: 17.3 CM / 6.8 INCH</span><br><span style=\"background-color:rgb(255,255,255);color:rgb(51,51,51);\">WEIGTH: 23.5 GRS / 0.82 OUNZA</span></p>', '205', '2023-05-18 04:12:13pulsera3png.png', 'PUBLISHED', '2023-05-18 02:44:22', '2023-05-18 17:20:55');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `services`
--

CREATE TABLE `services` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title_eng` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subtitle` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subtitle_eng` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `description_eng` text COLLATE utf8mb4_unicode_ci,
  `price` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `videoUrl` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('PUBLISHED','PENDING','REJECTED') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'PENDING',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `services`
--

INSERT INTO `services` (`id`, `title`, `title_eng`, `subtitle`, `subtitle_eng`, `model`, `description`, `description_eng`, `price`, `image`, `videoUrl`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Reparación de Joyas en Oro y Plata', 'Gold and Silver Jewelry Repair', 'Reparación y Actualización de Diseño de Joyas', 'Jewelry Repair and Design Updates', NULL, 'Realizamos todo tipo de reparación como:\nSoldadura de cadenas\nSoldadura de post de zarcillo\nCambio de Broches\nMontura de piedras\nReparaciones en general en oro y plata\nCambio de pilas relojes\nLimpieza y mantenimiento de joyas\nBaños de oro\nEncargos', 'We perform all types of repairs such as,\nChain soldering\nEarring post soldering\nClasp replacement\nStone setting\nGeneral repairs in gold and silver\nWatch battery replacement\nJewelry cleaning and maintenance\nGold plating\nCustom orders', NULL, NULL, 'EPmgpcI0nrA', 'PUBLISHED', '2023-05-14 21:36:16', '2026-03-05 02:27:54');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `subcripcions`
--

CREATE TABLE `subcripcions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `subcripcions`
--

INSERT INTO `subcripcions` (`id`, `email`, `email_verified_at`, `created_at`, `updated_at`) VALUES
(1, 'mercadocreativo@gmail.com', NULL, '2023-05-21 10:26:58', '2023-05-21 10:26:58'),
(2, 'ugalletti@hotmail.com', NULL, '2023-05-23 07:57:26', '2023-05-23 07:57:26'),
(3, 'ugalletti@hotmail.com', NULL, '2023-05-23 07:57:26', '2023-05-23 07:57:26'),
(4, 'gisellearenas1808@gmail.com', NULL, '2023-06-14 08:51:58', '2023-06-14 08:51:58'),
(5, 'gisellearenas1808@gmail.com', NULL, '2023-06-14 08:51:58', '2023-06-14 08:51:58'),
(6, 'ttaghiry@gmail.com', NULL, '2023-08-15 19:44:50', '2023-08-15 19:44:50'),
(7, 'ttaghiry@gmail.com', NULL, '2023-08-15 19:44:50', '2023-08-15 19:44:50'),
(8, '1942106@gmail.com', NULL, '2023-09-20 20:01:32', '2023-09-20 20:01:32'),
(9, '1942106@gmail.com', NULL, '2023-09-20 20:01:32', '2023-09-20 20:01:32'),
(10, 'soyvasco@mac.com', NULL, '2023-09-28 23:14:04', '2023-09-28 23:14:04'),
(11, 'soyvasco@mac.com', NULL, '2023-09-28 23:14:04', '2023-09-28 23:14:04'),
(12, 'desimendozag@gmail.com', NULL, '2023-11-28 03:31:20', '2023-11-28 03:31:20'),
(13, 'desimendozag@gmail.com', NULL, '2023-11-28 03:31:20', '2023-11-28 03:31:20'),
(14, 'aleaba@outlook.es', NULL, '2024-05-28 22:28:17', '2024-05-28 22:28:17'),
(15, 'aleaba@outlook.es', NULL, '2024-05-28 22:28:17', '2024-05-28 22:28:17'),
(16, 'vacana.entremetales@gmail.com', NULL, '2024-09-29 08:07:37', '2024-09-29 08:07:37'),
(17, 'vacana.entremetales@gmail.com', NULL, '2024-09-29 08:07:37', '2024-09-29 08:07:37'),
(18, 'grisjl1403@gmail.com', NULL, '2024-10-05 08:06:05', '2024-10-05 08:06:05'),
(19, 'grisjl1403@gmail.com', NULL, '2024-10-05 08:06:05', '2024-10-05 08:06:05'),
(20, 'ceccovillid@gmail.com', NULL, '2024-12-09 03:28:26', '2024-12-09 03:28:26'),
(21, 'ceccovillid@gmail.com', NULL, '2024-12-09 03:28:26', '2024-12-09 03:28:26'),
(22, 'jalegretti@gmail.com', NULL, '2025-02-13 18:45:37', '2025-02-13 18:45:37'),
(23, 'jalegretti@gmail.com', NULL, '2025-02-13 18:45:37', '2025-02-13 18:45:37'),
(24, 'dexsycolon@gmail.com', NULL, '2025-06-28 03:50:45', '2025-06-28 03:50:45'),
(25, 'dexsycolon@gmail.com', NULL, '2025-06-28 03:50:45', '2025-06-28 03:50:45'),
(26, 'desimendozag@gmail.com', NULL, '2025-07-10 01:45:55', '2025-07-10 01:45:55'),
(27, 'desimendozag@gmail.com', NULL, '2025-07-10 01:45:55', '2025-07-10 01:45:55'),
(28, 'desimendozag@gmail.com', NULL, '2025-08-07 23:36:56', '2025-08-07 23:36:56'),
(29, 'desimendozag@gmail.com', NULL, '2025-08-07 23:36:56', '2025-08-07 23:36:56'),
(30, 'moreno.valentina@gmail.com', NULL, '2025-10-10 05:39:37', '2025-10-10 05:39:37'),
(31, 'moreno.valentina@gmail.com', NULL, '2025-10-10 05:39:37', '2025-10-10 05:39:37');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` enum('SUPERADMIN','ADMIN','MEMBER','GUEST') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'GUEST',
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `username`, `role`, `email`, `email_verified_at`, `password`, `is_active`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'superadministrador', 'SUPERADMIN', 'superadmin@superadmin.com', '2023-05-14 03:46:43', '$2y$10$Yq1AN5MGhqiXw2kzVKLk1OdYdM014GP44JQ60.vLj1QbkGM1xaPlq', NULL, NULL, '2023-05-14 03:46:43', '2023-05-14 03:46:43', NULL),
(2, 'administrador', 'ADMIN', 'admin@admin.com', '2023-05-14 03:46:43', '$2y$10$4Mqrru5HJrDUHDRnhwKS0eRgmDSN.jtm9D.okcNxUBXG576MwTG.6', NULL, NULL, '2023-05-14 03:46:43', '2023-05-14 03:46:43', NULL),
(3, 'miembro', 'MEMBER', 'miembro@miembro.com', '2023-05-14 03:46:43', '$2y$10$/AUEBNePzWStLep3rqkqSORTIu335jmwPlU/.QaKfLOEDEqfg5fRu', NULL, NULL, '2023-05-14 03:46:43', '2023-05-14 03:46:43', NULL),
(4, 'invitado', 'GUEST', 'invitado@invitado.com', '2023-05-14 03:46:43', '$2y$10$iuVUUBqgvAXMWEKf7JxQwub2Z0UpcRM4aGPj4gNG.ZR7YQSFeXooS', NULL, NULL, '2023-05-14 03:46:43', '2023-05-14 03:46:43', NULL),
(5, 'ugalletti', 'SUPERADMIN', 'ugalletti@hotmail.com', NULL, '$2y$10$i0f2YfIWuXCwBzcq0uKg0.LVfUgsumQXg5OnFutFfKSBOw/aTgkL2', NULL, NULL, '2023-07-05 05:31:44', '2023-07-05 06:03:05', NULL),
(6, 'malc', 'GUEST', 'mercadocreativo@gmail.com', NULL, '$2y$10$24fBuL3Jw4gKSvL7u1iow.nwPbpstzgsmyGporccX8A5ezSJekvqe', NULL, NULL, '2023-07-10 22:39:49', '2024-05-06 01:58:00', NULL),
(7, 'Amy', 'GUEST', 'Annayannelli@gmail.com', NULL, '$2y$10$zKpDIE3F1U/gODja2HGEu.Vn0zP/HK.U/pMZS.Mt5.vQulHLwCcbC', NULL, NULL, '2023-08-09 00:11:57', '2023-08-09 00:17:12', NULL),
(8, 'Aleaba', 'GUEST', 'aleaba@outlook.es', NULL, '$2y$10$A2KWGoSn.mfcuNLRnT8caelDqaDMVcvOorhUKOVO.GINTwNGn1gUu', NULL, NULL, '2024-05-28 22:29:34', '2024-05-28 22:29:34', NULL),
(10, 'Dayi', 'GUEST', 'ceccovillid@gmail.com', NULL, '$2y$10$hwLRq.TkFQzPbjUiMTlu7u8Yn.la.61G/mKmnb4PxsxtNIat5vYyC', NULL, NULL, '2024-12-09 09:56:10', '2024-12-09 09:56:10', NULL);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `anillos`
--
ALTER TABLE `anillos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `aretes`
--
ALTER TABLE `aretes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `banners`
--
ALTER TABLE `banners`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `cronologiacursos`
--
ALTER TABLE `cronologiacursos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `cursos`
--
ALTER TABLE `cursos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cursos_user_id_foreign` (`user_id`);

--
-- Indices de la tabla `dijes`
--
ALTER TABLE `dijes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `eventoorlandos`
--
ALTER TABLE `eventoorlandos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `expocafs`
--
ALTER TABLE `expocafs`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indices de la tabla `galleryschools`
--
ALTER TABLE `galleryschools`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `herramientas`
--
ALTER TABLE `herramientas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indices de la tabla `joyas`
--
ALTER TABLE `joyas`
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
-- Indices de la tabla `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payments_user_id_foreign` (`user_id`),
  ADD KEY `payments_curso_id_foreign` (`curso_id`);

--
-- Indices de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indices de la tabla `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `posts_user_id_foreign` (`user_id`),
  ADD KEY `posts_category_id_foreign` (`category_id`);

--
-- Indices de la tabla `profiles`
--
ALTER TABLE `profiles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `profiles_user_id_foreign` (`user_id`);

--
-- Indices de la tabla `publicaciones`
--
ALTER TABLE `publicaciones`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pulseras`
--
ALTER TABLE `pulseras`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `subcripcions`
--
ALTER TABLE `subcripcions`
  ADD PRIMARY KEY (`id`);

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
-- AUTO_INCREMENT de la tabla `anillos`
--
ALTER TABLE `anillos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `aretes`
--
ALTER TABLE `aretes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `banners`
--
ALTER TABLE `banners`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `cronologiacursos`
--
ALTER TABLE `cronologiacursos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `cursos`
--
ALTER TABLE `cursos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT de la tabla `dijes`
--
ALTER TABLE `dijes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `eventoorlandos`
--
ALTER TABLE `eventoorlandos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `expocafs`
--
ALTER TABLE `expocafs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `galleryschools`
--
ALTER TABLE `galleryschools`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT de la tabla `herramientas`
--
ALTER TABLE `herramientas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `joyas`
--
ALTER TABLE `joyas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT de la tabla `payments`
--
ALTER TABLE `payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `profiles`
--
ALTER TABLE `profiles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `publicaciones`
--
ALTER TABLE `publicaciones`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT de la tabla `pulseras`
--
ALTER TABLE `pulseras`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `services`
--
ALTER TABLE `services`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `subcripcions`
--
ALTER TABLE `subcripcions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cursos`
--
ALTER TABLE `cursos`
  ADD CONSTRAINT `cursos_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_curso_id_foreign` FOREIGN KEY (`curso_id`) REFERENCES `cursos` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `payments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `posts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `profiles`
--
ALTER TABLE `profiles`
  ADD CONSTRAINT `profiles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
