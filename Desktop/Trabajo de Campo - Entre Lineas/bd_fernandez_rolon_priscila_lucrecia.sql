-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 19-06-2024 a las 15:05:35
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
-- Base de datos: `bd_fernandez_rolon_priscila_lucrecia`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `login` (IN `p_usuario` VARCHAR(20), IN `p_contrasenia` VARCHAR(50))   BEGIN
    SELECT *
    FROM usuarios
    WHERE usuario = p_usuario AND pass = p_contrasenia;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `validarDatos` (IN `p_usuario` VARCHAR(20), IN `p_email` VARCHAR(50))   BEGIN
    SELECT * 
    FROM usuarios
    WHERE usuario = p_usuario OR email = p_email;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `autores`
--

CREATE TABLE `autores` (
  `id_autor` int(11) NOT NULL,
  `nombre_autor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria_producto`
--

CREATE TABLE `categoria_producto` (
  `id_categoria` int(11) NOT NULL,
  `descripcion_categoria` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `categoria_producto`
--

INSERT INTO `categoria_producto` (`id_categoria`, `descripcion_categoria`) VALUES
(1, 'Romance'),
(2, 'Ficcion'),
(3, 'Drama'),
(4, 'Terror'),
(5, 'Juvenil'),
(6, 'Fantasia ');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `consultas`
--

CREATE TABLE `consultas` (
  `id_consulta` int(11) NOT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `id_visitante` int(11) DEFAULT NULL,
  `tipo_consulta` int(11) NOT NULL,
  `descripcion` varchar(300) NOT NULL,
  `fecha` datetime NOT NULL DEFAULT current_timestamp(),
  `leido` varchar(2) NOT NULL DEFAULT 'NO'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `consultas`
--

INSERT INTO `consultas` (`id_consulta`, `id_usuario`, `id_visitante`, `tipo_consulta`, `descripcion`, `fecha`, `leido`) VALUES
(9, NULL, 10, 1, 'probando reclamo visitante', '2023-06-13 04:02:26', 'SI'),
(10, NULL, 11, 2, 'probando consulta visitante ', '2023-06-13 04:03:20', 'NO'),
(11, 5, NULL, 1, 'probando reclamo usuario\r\n', '2023-06-13 04:16:35', 'SI'),
(12, 5, NULL, 2, 'Probando consulta usuario', '2023-06-13 04:16:48', 'NO'),
(13, 8, NULL, 1, 'reclamo', '2023-06-13 04:17:18', 'NO'),
(14, 8, NULL, 2, 'consulta', '2023-06-13 04:17:26', 'NO'),
(15, NULL, 12, 2, 'probando consulta 2', '2023-06-13 04:19:35', 'NO'),
(16, NULL, 13, 1, 'probando reclamo 2', '2023-06-13 04:20:28', 'NO'),
(17, NULL, 14, 1, 'probando probando', '2023-06-13 14:30:28', 'NO'),
(18, 8, NULL, 1, 'esto es un reclamo ', '2023-06-13 14:33:35', 'NO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `datos_visitantes`
--

CREATE TABLE `datos_visitantes` (
  `id_visitante` int(11) NOT NULL,
  `nombre_apellido` varchar(100) NOT NULL,
  `email` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `datos_visitantes`
--

INSERT INTO `datos_visitantes` (`id_visitante`, `nombre_apellido`, `email`) VALUES
(10, 'Priscila', 'pris@gmail.com'),
(11, 'Maxi', 'maxi@gmail.com'),
(12, 'Lucrecia', 'lu12@gmail.com'),
(13, 'Roberto', 'roberto64@gmail.com'),
(14, 'Dylan', 'Dylan@gmail.com'),
(15, 'Emma stone', 'ema@gmail.com'),
(16, 'emilia', 'emilia@gmail.com'),
(19, 'rick', 'rick@gmail.com'),
(20, 'carl', 'carl@gmail.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `metodo_pago`
--

CREATE TABLE `metodo_pago` (
  `id_metodo_pago` int(11) NOT NULL,
  `descripcion_metodo` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `metodo_pago`
--

INSERT INTO `metodo_pago` (`id_metodo_pago`, `descripcion_metodo`) VALUES
(1, 'Tarjeta Débito/Crédito'),
(2, 'Efectivo'),
(3, 'Mercado Pago');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id_producto` int(11) NOT NULL,
  `id_categoria` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `descripcion` varchar(500) NOT NULL,
  `precio_lista` int(11) NOT NULL,
  `precio_venta` int(11) NOT NULL,
  `stock` int(11) NOT NULL,
  `imagen` varchar(255) NOT NULL,
  `fecha_alta` int(11) NOT NULL,
  `fecha_modificacion` int(11) NOT NULL,
  `baja` varchar(2) NOT NULL DEFAULT 'NO'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id_producto`, `id_categoria`, `nombre`, `descripcion`, `precio_lista`, `precio_venta`, `stock`, `imagen`, `fecha_alta`, `fecha_modificacion`, `baja`) VALUES
(31, 2, 'Lo Nuestro Fue Real ', 'Una historia sobre la búsqueda de la verdad, para volver a enamorarse, apasionarse por el arte y recorrer cada rincón de París como si estuviésemos allí.', 5260, 7500, 3, '1686504570_049395f8faed9a26ae01.jpg', 0, 0, 'NO'),
(32, 5, 'Antes de Diciembre ', 'Una historia de amor y pasión con una cuenta atrás. Todo acabará Antes de diciembre. Una de las historias de amor más adictivas de Wattpad.', 7109, 8453, 4, '1686515271_6e0110d43ceb3cfb9dbb.webp', 0, 0, 'NO'),
(33, 1, 'El Arte de ser Nosotros', 'Leah no es el tipo de chica que Logan está buscando. Y Logan es la clase de chico que Leah trata de evitar. Quizá por eso lo que hay entre ellos funciona tan bien. ', 5240, 6740, 0, '1686515395_6b856ca10e6037f7104c.webp', 0, 0, 'NO'),
(34, 5, 'Donde todo Brilla', '¿Y si lo único que necesitamos para ser felices es descubrir el brillo de las cosas intangibles? Nicki Aldrich y River Jackson han sido inseparables desde que llegaron al mundo con cuarenta y siete minutos de diferencia.', 4870, 5240, 2, '1686515517_9046919b082b8b8f2dde.webp', 0, 0, 'NO'),
(35, 1, 'El Ultimo Verano', 'AALIYAH ES UNA LUCHADORA. Una gimnasta que sueña con una vida mejor y que hará todo lo que sea necesario para alcanzarla. SHAWN ES UN SOÑADOR. Un alma sensible que pronto irá a la universidad para convertirse en escritor. ', 7856, 8962, 6, '1686515637_2ee21f5988192fae0480.png', 0, 0, 'NO'),
(36, 4, 'IT (ESO)', '¿Quién o qué mutila y mata a los niños de un pequeño pueblo norteamericano? ¿Por qué llega cíclicamente el horror a Derry en forma d e un payaso siniestro que va sembrando la destrucción a su paso? Esto es lo que se proponen averiguar los protagonistas de esta novela.', 14999, 16520, 4, '1686516123_c73af64fd17687e12ed7.png', 0, 0, 'NO'),
(37, 4, 'El resplandor', 'Danny tenía cinco años, y a esa edad pocos niños saben que los espejos invierten las imágenes, y menos aún pueden diferenciar entre realidad y fantasía. Pero Danny tenía pruebas de que sus fantasías relacionadas con el resplandor del espejo acabarían cumpliéndose.', 8300, 9500, 9, '1686516177_f3154ac24b813946e9e4.png', 0, 0, 'NO'),
(38, 6, 'Harry Potter y la piedra filosofal', 'Harry Potter se ha quedado huérfano y vive en casa de sus abominables tíos y del insoportable primo Dudley. Se siente muy triste y solo, hasta que un buen día recibe una carta que cambiará su vida para siempre. En ella le comunican que ha sido aceptado como alumno en el colegio interno Hogwarts de magia y hechicería.', 7000, 8500, 4, '1686516675_fcd6262924a86b4756ec.jpg', 0, 0, 'NO'),
(39, 6, 'Harry Potter y la cámara secreta', 'Mientras Harry espera impaciente en casa de sus insoportables tíos el inicio del segundo curso del Colegio Hogwarts de Magia y Hechicería, un elfo aparece en su habitación y le advierte de que una amenaza mortal se cierne sobre la escuela.', 5620, 6500, 8, '1686516726_18105f9bdbb7f0ed3d03.jpg', 0, 0, 'NO'),
(40, 1, 'Bajo las Estrellas', 'La aventura más dulce y divertida está a punto de empezar. Zorie y Lennon solían ser inseparables, pero desde hace un tiempo se han vuelto expertos en ignorarse. Cuando sus amigos los llevan engañados a acampar, la estratagema sale mal y de pronto los dos se encuentran atrapados en lo salvaje. Solos, lejos y sin hablarse. ', 6125, 7230, 5, '1686541709_a653eac22dc84f20928e.png', 0, 0, 'NO'),
(41, 3, 'Bajo la misma estrella', 'A Hazel y a Gus les gustaría tener vidas más corrientes. Algunos dirían que no han nacido con estrella, que su mundo es injusto. Hazel y Gus son solo adolescentes, pero si algo les ha enseñado el cáncer que ambos padecen es que no hay tiempo para lamentaciones, porque, nos guste o no, solo existe el hoy y el ahora. ', 12450, 14050, 0, '1686541807_ca9a463a9a97f2b9dbb8.png', 0, 0, 'NO'),
(42, 3, 'Un monstruo viene a verme', 'Siete minutos después de la medianoche, Conor despierta y se encuentra un monstruo en la ventana. Pero no es el monstruo que él esperaba, el de la pesadilla que tiene casi todas las noches desde que su madre empezó el arduo e incansable tratamiento. No, este monstruo es algo diferente, antiguo... Y quiere lo más peligroso de todo: la verdad.', 5610, 7450, 6, '1686541886_950f507d752585ac71f4.jpg', 0, 0, 'NO'),
(44, 1, 'Los juegos del hambre ', 'El mundo está observando. Ganar significa fama y riqueza. Perder significa una muerte segura. ¡Que empiecen los septuagésimo cuartos juegos del hambre!', 6250, 6500, 0, '1686629233_11225f459d92e5633efe.png', 0, 0, 'NO'),
(45, 1, 'En llamas ', 'Suzanne Collins continúa la increíble historia de Katniss Everdeen en la fenomenal trilogía de Los Juegos del Hambre .', 6250, 8520, 5, '1686630922_9b64eb7273237e78bbc8.png', 0, 0, 'NO'),
(46, 1, 'Sinsajo', 'El esperado desenlace de la espectacular historia de Katniss Everdeen en la increíble trilogía de Los Juegos del Hambre .', 7410, 8000, 5, '1686631051_a71d46da6bef6a3824c5.png', 0, 0, 'NO'),
(47, 2, 'Elevación', 'King vuelve a Castle Rock con un mensaje para nuestros tiempos. «La prueba de que un maestro aún puede elevar más su leyenda.» USA Today', 4000, 4120, 10, '1686632392_5dbb1f2cf0c113afdca4.png', 0, 0, 'NO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_consulta`
--

CREATE TABLE `tipo_consulta` (
  `id_tipo_consulta` int(11) NOT NULL,
  `descripcion_consulta` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tipo_consulta`
--

INSERT INTO `tipo_consulta` (`id_tipo_consulta`, `descripcion_consulta`) VALUES
(1, 'Reclamo'),
(2, 'Consulta');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_envio`
--

CREATE TABLE `tipo_envio` (
  `id_envio` int(11) NOT NULL,
  `descripcion_envio` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tipo_envio`
--

INSERT INTO `tipo_envio` (`id_envio`, `descripcion_envio`) VALUES
(1, 'Andreani'),
(2, 'Oca'),
(3, 'Correo Argentino');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_perfil`
--

CREATE TABLE `tipo_perfil` (
  `id_perfil` int(11) NOT NULL,
  `nombre_perfil` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tipo_perfil`
--

INSERT INTO `tipo_perfil` (`id_perfil`, `nombre_perfil`) VALUES
(5, 'Administrador'),
(6, 'Cliente');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `apellido` varchar(30) NOT NULL,
  `email` varchar(50) NOT NULL,
  `usuario` varchar(20) NOT NULL,
  `pass` varchar(50) NOT NULL,
  `perfil_id` int(11) NOT NULL DEFAULT 2,
  `baja` varchar(2) NOT NULL DEFAULT 'NO'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombre`, `apellido`, `email`, `usuario`, `pass`, `perfil_id`, `baja`) VALUES
(1, 'priscila', 'fernandez', 'fernandezpriscila04@gmail.com', 'priscila04', '202cb962ac59075b964b07152d234b70', 1, 'NO'),
(2, 'lucrecia', 'rolon', 'lu@gmail.com', 'lu21', '07420fed9ea8033f18da61d67f0aa3ed', 2, 'SI'),
(3, 'gabriel', 'fernandez', 'sgfernandezr@hotmail.com', 'gabriel', 'e10adc3949ba59abbe56e057f20f883e', 2, 'SI'),
(4, 'daniel', 'lopez', 'daniel@gmail.com', 'dani', '202cb962ac59075b964b07152d234b70', 2, 'NO'),
(5, 'mauro', 'mur', 'mauro@gmail.com', 'mauro30', 'b176d94ffe42d0cb805ab11b8f0c2d04', 2, 'NO'),
(7, 'rafael', 'rodriguez', 'ra@gmail.com', 'rafaelRo', '202cb962ac59075b964b07152d234b70', 2, 'NO'),
(8, 'Sara', 'Tancredi', 'saraTancredi@gmail.com', 'sara', '202cb962ac59075b964b07152d234b70', 2, 'NO'),
(9, 'pris', 'fernandez', 'pris@gmail.com', 'pri', 'e060bb629c10e1b143614cc1e9ccdc67', 2, 'SI'),
(10, 'ezequiel', 'ramirez', 'ezequiel@gmail.com', 'ezequiel', 'd7216dec976c1beb88a5b60e749abf07', 2, 'NO'),
(11, 'Dylan', 'Obrien', 'dylan@gmail.com', 'dylan', '202cb962ac59075b964b07152d234b70', 2, 'NO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas_cabecera`
--

CREATE TABLE `ventas_cabecera` (
  `id_cabecera` int(11) NOT NULL,
  `fecha` datetime NOT NULL DEFAULT current_timestamp(),
  `id_usuario` int(11) NOT NULL,
  `id_envio` int(11) NOT NULL,
  `id_metodo_pago` int(11) NOT NULL,
  `domicilio` varchar(255) NOT NULL,
  `cod_postal` int(5) NOT NULL,
  `total_venta` decimal(11,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `ventas_cabecera`
--

INSERT INTO `ventas_cabecera` (`id_cabecera`, `fecha`, `id_usuario`, `id_envio`, `id_metodo_pago`, `domicilio`, `cod_postal`, `total_venta`) VALUES
(9, '2023-06-13 07:39:33', 5, 1, 1, 'Barrio Ponce', 3400, 20230),
(10, '2023-06-13 07:41:28', 5, 1, 3, 'Barrio Ponce', 3400, 46270),
(11, '2023-06-13 07:44:46', 8, 1, 1, 'Tacuari 1316', 3400, 24910),
(12, '2023-06-13 16:10:35', 7, 3, 3, 'quilmes', 3400, 34240),
(13, '2023-06-13 17:35:06', 8, 2, 2, 'casa', 2434, 15953),
(16, '2024-06-15 23:58:14', 10, 2, 2, 'dsa', 4, 6740),
(17, '2024-06-18 22:31:50', 11, 2, 2, 'Barrio Ponce', 3400, 7500),
(18, '2024-06-18 22:35:17', 11, 1, 1, 'Barrio Ponce', 3400, 13480),
(19, '2024-06-18 22:36:39', 11, 3, 3, 'Barrio Ponce', 3400, 8962),
(20, '2024-06-18 22:39:27', 11, 1, 1, 'Barrio Ponce', 3400, 9500),
(21, '2024-06-18 22:41:14', 11, 3, 2, 'Barrio Ponce', 3400, 8962),
(22, '2024-06-18 22:41:43', 11, 1, 2, 'Barrio Ponce', 3400, 8500),
(23, '2024-06-18 23:49:34', 11, 1, 1, 'Barrio Ponce', 3400, 5240),
(24, '2024-06-18 23:52:00', 11, 1, 1, 'Barrio Ponce', 0, 8962),
(25, '2024-06-19 00:00:05', 11, 0, 1, 'dsadsa', 3123, 7500);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas_detalle`
--

CREATE TABLE `ventas_detalle` (
  `id_detalle` int(11) NOT NULL,
  `id_venta` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precio` double(10,2) NOT NULL,
  `sub_total` double(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `ventas_detalle`
--

INSERT INTO `ventas_detalle` (`id_detalle`, `id_venta`, `id_producto`, `cantidad`, `precio`, `sub_total`) VALUES
(11, 9, 44, 2, 6500.00, 13000.00),
(12, 9, 40, 1, 7230.00, 7230.00),
(13, 10, 47, 1, 4120.00, 4120.00),
(14, 10, 41, 3, 14050.00, 42150.00),
(15, 11, 47, 1, 4120.00, 4120.00),
(16, 11, 33, 1, 6740.00, 6740.00),
(17, 11, 41, 1, 14050.00, 14050.00),
(18, 12, 44, 3, 6500.00, 19500.00),
(19, 12, 46, 1, 8000.00, 8000.00),
(20, 12, 33, 1, 6740.00, 6740.00),
(21, 13, 32, 1, 8453.00, 8453.00),
(22, 13, 31, 1, 7500.00, 7500.00),
(25, 16, 33, 1, 6740.00, 6740.00),
(26, 17, 31, 1, 7500.00, 7500.00),
(27, 18, 33, 2, 6740.00, 13480.00),
(28, 19, 35, 1, 8962.00, 8962.00),
(29, 20, 37, 1, 9500.00, 9500.00),
(30, 21, 35, 1, 8962.00, 8962.00),
(31, 22, 38, 1, 8500.00, 8500.00),
(32, 23, 34, 1, 5240.00, 5240.00),
(33, 24, 35, 1, 8962.00, 8962.00),
(34, 25, 31, 1, 7500.00, 7500.00);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `autores`
--
ALTER TABLE `autores`
  ADD PRIMARY KEY (`id_autor`);

--
-- Indices de la tabla `categoria_producto`
--
ALTER TABLE `categoria_producto`
  ADD PRIMARY KEY (`id_categoria`);

--
-- Indices de la tabla `consultas`
--
ALTER TABLE `consultas`
  ADD PRIMARY KEY (`id_consulta`);

--
-- Indices de la tabla `datos_visitantes`
--
ALTER TABLE `datos_visitantes`
  ADD PRIMARY KEY (`id_visitante`);

--
-- Indices de la tabla `metodo_pago`
--
ALTER TABLE `metodo_pago`
  ADD PRIMARY KEY (`id_metodo_pago`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id_producto`),
  ADD KEY `productos_ibfk_1` (`id_categoria`);

--
-- Indices de la tabla `tipo_consulta`
--
ALTER TABLE `tipo_consulta`
  ADD PRIMARY KEY (`id_tipo_consulta`);

--
-- Indices de la tabla `tipo_envio`
--
ALTER TABLE `tipo_envio`
  ADD PRIMARY KEY (`id_envio`);

--
-- Indices de la tabla `tipo_perfil`
--
ALTER TABLE `tipo_perfil`
  ADD PRIMARY KEY (`id_perfil`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `usuario` (`usuario`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indices de la tabla `ventas_cabecera`
--
ALTER TABLE `ventas_cabecera`
  ADD PRIMARY KEY (`id_cabecera`);

--
-- Indices de la tabla `ventas_detalle`
--
ALTER TABLE `ventas_detalle`
  ADD PRIMARY KEY (`id_detalle`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `autores`
--
ALTER TABLE `autores`
  MODIFY `id_autor` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `consultas`
--
ALTER TABLE `consultas`
  MODIFY `id_consulta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `datos_visitantes`
--
ALTER TABLE `datos_visitantes`
  MODIFY `id_visitante` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `metodo_pago`
--
ALTER TABLE `metodo_pago`
  MODIFY `id_metodo_pago` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id_producto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT de la tabla `tipo_consulta`
--
ALTER TABLE `tipo_consulta`
  MODIFY `id_tipo_consulta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `tipo_envio`
--
ALTER TABLE `tipo_envio`
  MODIFY `id_envio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `tipo_perfil`
--
ALTER TABLE `tipo_perfil`
  MODIFY `id_perfil` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `ventas_cabecera`
--
ALTER TABLE `ventas_cabecera`
  MODIFY `id_cabecera` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT de la tabla `ventas_detalle`
--
ALTER TABLE `ventas_detalle`
  MODIFY `id_detalle` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`id_categoria`) REFERENCES `categoria_producto` (`id_categoria`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
