-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 28-06-2024 a las 18:17:53
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `tienda-online`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compra`
--

CREATE TABLE `compra` (
  `id` int(11) NOT NULL,
  `id_transaccion` varchar(20) NOT NULL,
  `fecha` date NOT NULL,
  `status` varchar(20) NOT NULL,
  `email` varchar(60) NOT NULL,
  `id_cliente` varchar(20) NOT NULL,
  `total` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `compra`
--

INSERT INTO `compra` (`id`, `id_transaccion`, `fecha`, `status`, `email`, `id_cliente`, `total`) VALUES
(1, '57C524407F226770P', '2024-06-28', 'COMPLETED', 'sb-pdexg30605210@personal.example.com', 'RZKVA8QH9GA9A', 1703),
(2, '15J96446CF5120733', '2024-06-28', 'COMPLETED', 'sb-pdexg30605210@personal.example.com', 'RZKVA8QH9GA9A', 1703),
(3, '88X54003XV228963H', '2024-06-28', 'COMPLETED', 'sb-pdexg30605210@personal.example.com', 'RZKVA8QH9GA9A', 1703),
(4, '4SK64984U9064134B', '2024-06-28', 'COMPLETED', 'sb-pdexg30605210@personal.example.com', 'RZKVA8QH9GA9A', 1703),
(5, '1HL32706N30453349', '2024-06-28', 'COMPLETED', 'sb-pdexg30605210@personal.example.com', 'RZKVA8QH9GA9A', 1703),
(6, '26T27665JN1928400', '2024-06-28', 'COMPLETED', 'sb-pdexg30605210@personal.example.com', 'RZKVA8QH9GA9A', 2063),
(7, '6LG636354X804174L', '2024-06-28', 'COMPLETED', 'sb-pdexg30605210@personal.example.com', 'RZKVA8QH9GA9A', 2063),
(8, '9DR29392XF269612D', '2024-06-28', 'COMPLETED', 'sb-pdexg30605210@personal.example.com', 'RZKVA8QH9GA9A', 2423),
(9, '8CA12330H3957163M', '2024-06-28', 'COMPLETED', 'sb-pdexg30605210@personal.example.com', 'RZKVA8QH9GA9A', 2918),
(10, '9KW31343BB3583142', '2024-06-28', 'COMPLETED', 'sb-pdexg30605210@personal.example.com', 'RZKVA8QH9GA9A', 2918),
(11, '526198343X8517716', '2024-06-28', 'COMPLETED', 'sb-pdexg30605210@personal.example.com', 'RZKVA8QH9GA9A', 360);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_compra`
--

CREATE TABLE `detalle_compra` (
  `id` int(11) NOT NULL,
  `id_compra` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `nombre` varchar(200) NOT NULL,
  `precio` decimal(10,0) NOT NULL,
  `cantidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `detalle_compra`
--

INSERT INTO `detalle_compra` (`id`, `id_compra`, `id_producto`, `nombre`, `precio`, `cantidad`) VALUES
(1, 8, 1, 'Samsung s10+', 360, 6),
(2, 8, 3, 'Motorola edge 40 plus', 263, 1),
(3, 9, 1, 'Samsung s10+', 360, 6),
(4, 9, 3, 'Motorola edge 40 plus', 263, 1),
(5, 9, 5, 'Oppo reno 10', 495, 1),
(6, 11, 1, 'Samsung s10+', 360, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(200) NOT NULL,
  `descripcion` text NOT NULL,
  `precio` decimal(10,0) NOT NULL,
  `descuento` tinyint(3) NOT NULL DEFAULT 0,
  `id_categoria` int(11) NOT NULL,
  `activo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id`, `nombre`, `descripcion`, `precio`, `descuento`, `id_categoria`, `activo`) VALUES
(1, 'Samsung s10+', '<p><strong>Descripción:</strong> El Samsung Galaxy S10+ es un smartphone premium que destaca por su diseño elegante y su tecnología avanzada. Con una pantalla Dynamic AMOLED, un potente procesador y una configuración de cámara múltiple, el S10+ ofrece una experiencia de usuario excepcional en todas las áreas.</p>\n\n<p><strong>Especificaciones:</strong></p>\n<ul>\n    <li><strong>Pantalla:</strong> 6.4 pulgadas Dynamic AMOLED, resolución Quad HD+ (3040 x 1440 píxeles)</li>\n    <li><strong>Procesador:</strong> Exynos 9820 (Global) / Qualcomm Snapdragon 855 (USA/China)</li>\n    <li><strong>Memoria RAM:</strong> 8GB / 12GB</li>\n    <li><strong>Almacenamiento Interno:</strong> 128GB / 512GB / 1TB (expandible mediante microSD hasta 1TB)</li>\n    <li><strong>Cámara Trasera:</strong> Triple, 12MP (principal) + 12MP (telefoto) + 16MP (ultra gran angular)</li>\n    <li><strong>Cámara Frontal:</strong> Doble, 10MP (principal) + 8MP (sensor de profundidad)</li>\n    <li><strong>Batería:</strong> 4100mAh, carga rápida e inalámbrica</li>\n    <li><strong>Sistema Operativo:</strong> Android 9.0 (Pie), actualizable a versiones posteriores</li>\n    <li><strong>Conectividad:</strong> 4G LTE, Wi-Fi 6, Bluetooth 5.0, NFC, USB-C</li>\n    <li><strong>Dimensiones:</strong> 157.6 x 74.1 x 7.8 mm</li>\n    <li><strong>Peso:</strong> 175 g / 198 g (ceramic)</li>\n    <li><strong>Otras Características:</strong> Resistencia al agua y al polvo IP68, lector de huellas en pantalla, reconocimiento facial, sonido Dolby Atmos, DeX mode</li>\n</ul>\n\n<p><strong>Disponibilidad:</strong> Disponible en varios colores, incluyendo Prism White, Prism Black, Prism Green, Prism Blue, Ceramic White, y Ceramic Black</p>', 400, 10, 1, 1),
(3, 'Motorola edge 40 plus', '<p><strong>Descripción:</strong> El Motorola Edge 40 es un smartphone de alta gama que combina un diseño elegante con potentes especificaciones. Diseñado para ofrecer una experiencia multimedia excepcional, el Edge 40 está equipado con una pantalla OLED curva, un potente procesador y una configuración de cámara avanzada.</p>\n\n<p><strong>Especificaciones:</strong></p>\n<ul>\n    <li><strong>Pantalla:</strong> 6.55 pulgadas OLED, resolución Full HD+ (2400 x 1080 píxeles), tasa de refresco de 144Hz</li>\n    <li><strong>Procesador:</strong> MediaTek Dimensity 8020</li>\n    <li><strong>Memoria RAM:</strong> 8GB</li>\n    <li><strong>Almacenamiento Interno:</strong> 256GB</li>\n    <li><strong>Cámara Trasera:</strong> Doble, 50MP (principal) + 13MP (ultra gran angular)</li>\n    <li><strong>Cámara Frontal:</strong> 32MP</li>\n    <li><strong>Batería:</strong> 4400mAh, carga rápida de 68W</li>\n    <li><strong>Sistema Operativo:</strong> Android 13</li>\n    <li><strong>Conectividad:</strong> 5G, Wi-Fi 6E, Bluetooth 5.2, NFC, USB-C</li>\n    <li><strong>Dimensiones:</strong> 158.43 x 71.99 x 7.49 mm</li>\n    <li><strong>Peso:</strong> 171 g</li>\n    <li><strong>Otras Características:</strong> Resistencia al agua y al polvo IP68, lector de huellas en pantalla, sonido Dolby Atmos</li>\n</ul>\n\n\n<p><strong>Disponibilidad:</strong> Disponible en colores Nebula Green, Lunar Blue, y Eclipse Black</p>', 350, 25, 1, 1),
(5, 'Oppo reno 10', '256gb blue', 569, 13, 1, 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `compra`
--
ALTER TABLE `compra`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `detalle_compra`
--
ALTER TABLE `detalle_compra`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `compra`
--
ALTER TABLE `compra`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `detalle_compra`
--
ALTER TABLE `detalle_compra`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
