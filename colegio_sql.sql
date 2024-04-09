-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 09-04-2024 a las 19:05:28
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
-- Base de datos: `colegio.sql`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `boletin_notas`
--

CREATE TABLE `boletin_notas` (
  `no_identidad` int(11) NOT NULL,
  `curso_cod` int(11) NOT NULL,
  `nota_1` decimal(5,0) NOT NULL,
  `nota_2` decimal(5,0) NOT NULL,
  `nota_3` decimal(5,0) NOT NULL,
  `definitiva` decimal(5,0) GENERATED ALWAYS AS (`nota_1` + `nota_2` + `nota_3` / 3) VIRTUAL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `boletin_notas`
--

INSERT INTO `boletin_notas` (`no_identidad`, `curso_cod`, `nota_1`, `nota_2`, `nota_3`) VALUES
(5298764, 27, 86, 88, 50),
(52828797, 26, 75, 85, 45),
(58967421, 29, 89, 88, 44),
(89644278, 28, 83, 80, 49);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `curso`
--

CREATE TABLE `curso` (
  `COD_CURSOS` int(11) NOT NULL,
  `Materia_ID` int(11) NOT NULL,
  `NOMBRE_CURSOS` varchar(25) NOT NULL,
  `INTENSIDAD_HORAS` int(11) NOT NULL,
  `VALOR_CURSOS` decimal(10,0) NOT NULL,
  `JORNADA_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `curso`
--

INSERT INTO `curso` (`COD_CURSOS`, `Materia_ID`, `NOMBRE_CURSOS`, `INTENSIDAD_HORAS`, `VALOR_CURSOS`, `JORNADA_ID`) VALUES
(26, 1, 'Matemáticas ', 60, 150000, 1),
(27, 2, 'Historia', 80, 180000, 2),
(28, 3, 'Ciencias', 70, 160000, 1),
(29, 4, 'Literatura', 90, 200000, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estudiante`
--

CREATE TABLE `estudiante` (
  `no_identidad` int(11) NOT NULL,
  `nombre1` varchar(25) NOT NULL,
  `nombre2` varchar(25) NOT NULL,
  `apellido1` varchar(25) NOT NULL,
  `apellido2` varchar(25) NOT NULL,
  `tipo_documento` enum('cc','ce','nit','rut') DEFAULT NULL,
  `carnet_cod` int(11) NOT NULL,
  `direccion` varchar(25) NOT NULL,
  `telefono` varchar(25) NOT NULL,
  `edad` int(11) NOT NULL CHECK (`edad` >= 18),
  `ciudad` int(11) NOT NULL,
  `sexo` enum('masculino','femenino') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `estudiante`
--

INSERT INTO `estudiante` (`no_identidad`, `nombre1`, `nombre2`, `apellido1`, `apellido2`, `tipo_documento`, `carnet_cod`, `direccion`, `telefono`, `edad`, `ciudad`, `sexo`) VALUES
(137, 'Juan', 'Carlos', 'López', 'Martínez', '', 26, 'Calle 123', '1234567890', 22, 0, 'masculino'),
(138, 'María', 'Fernanda', 'González', 'Pérez', '', 27, 'Carrera 456', '0987654321', 21, 0, 'femenino'),
(139, 'Pedro', '', 'Sánchez', 'Gómez', '', 28, 'Avenida 789', '1357902468', 28, 0, 'masculino'),
(140, 'Ana', 'María', 'Rodríguez', 'López', '', 29, 'Calle 321', '9876543210', 29, 0, 'femenino'),
(141, 'Luis', 'Felipe', 'Martínez', 'Ramírez', '', 30, 'Carrera 789', '2468135790', 30, 0, 'masculino'),
(142, 'Laura', 'Isabel', 'Hernández', 'Sánchez', '', 31, 'Avenida 567', '9871234560', 31, 0, 'femenino'),
(143, 'Carlos', 'Andrés', 'Gómez', 'Gutiérrez', '', 32, 'Calle 987', '4567890123', 32, 0, 'masculino'),
(144, 'Sofía', '', 'Vargas', 'Jiménez', '', 33, 'Carrera 987', '6543217890', 33, 0, 'femenino'),
(145, 'Daniel', '', 'Ramírez', 'Hernández', '', 34, 'Calle 654', '7890123456', 34, 0, 'masculino'),
(146, 'Camila', 'Alejandra', 'Pérez', 'Sánchez', '', 35, 'Avenida 234', '0123456789', 35, 0, 'femenino'),
(147, 'Andrés', 'Felipe', 'García', 'González', '', 36, 'Calle 876', '5432109876', 36, 0, 'masculino'),
(148, 'Valentina', 'Isabella', 'Díaz', 'Hernández', '', 37, 'Carrera 654', '9012345678', 52, 0, 'femenino'),
(149, 'Javier', 'Alejandro', 'Moreno', 'Martínez', '', 38, 'Calle 543', '6789012345', 37, 0, 'masculino'),
(150, 'Paula', 'Andrea', 'Herrera', 'Pérez', '', 39, 'Avenida 123', '3210987654', 33, 0, 'femenino'),
(151, 'Mateo', 'David', 'Suárez', 'Gómez', '', 40, 'Calle 876', '7890123456', 40, 0, 'masculino'),
(152, 'Mariana', 'Alejandra', 'López', 'Ramírez', '', 41, 'Carrera 321', '5432109876', 41, 0, 'femenino'),
(153, 'Diego', 'Fernando', 'Gutiérrez', 'González', '', 42, 'Avenida 567', '0123456789', 52, 0, 'masculino');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jornada`
--

CREATE TABLE `jornada` (
  `id_jornada` int(11) NOT NULL,
  `nombre_jornada` varchar(50) NOT NULL,
  `Observaciones` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `jornada`
--

INSERT INTO `jornada` (`id_jornada`, `nombre_jornada`, `Observaciones`) VALUES
(1, 'mañana', 'n/a'),
(2, 'tarde', 'n/a');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `materias`
--

CREATE TABLE `materias` (
  `Materia_ID` int(11) NOT NULL,
  `Nombre_Materia` varchar(50) NOT NULL,
  `Profesor_COD` int(11) NOT NULL,
  `Observaciones` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `materias`
--

INSERT INTO `materias` (`Materia_ID`, `Nombre_Materia`, `Profesor_COD`, `Observaciones`) VALUES
(1, 'Matemáticas', 1, 'Examen final el 15 de diciembre'),
(2, 'Historia', 2, 'Presentación de proyecto la próxima semana'),
(3, 'Ciencias', 3, 'Laboratorio práctico el martes'),
(4, 'Literatura', 4, 'Ensayo sobre Shakespeare para el viernes'),
(5, 'Ingles', 5, 'Debate en clase el jueves'),
(6, 'Arte', 6, 'Entrega de proyecto artístico el lunes'),
(7, 'Geografía', 7, 'Excursión al museo geográfico el miércoles'),
(8, 'Economía', 8, 'Exposición oral sobre economía global el viernes'),
(9, 'Biología', 9, 'Prueba escrita el jueves'),
(10, 'Informática', 110, 'Proyecto de programación para el mes próximo'),
(11, 'Matemáticas', 10, 'Examen final el 15 de diciembre'),
(12, 'Historia', 102, 'Presentación de proyecto la próxima semana'),
(13, 'Ciencias', 103, 'Laboratorio práctico el martes'),
(14, 'Literatura', 104, 'Ensayo sobre Shakespeare para el viernes'),
(15, 'Ingles', 105, 'Debate en clase el jueves'),
(16, 'Arte', 106, 'Entrega de proyecto artístico el lunes'),
(17, 'Geografía', 107, 'Excursión al museo geográfico el miércoles'),
(18, 'Economía', 108, 'Exposición oral sobre economía global el viernes'),
(19, 'Biología', 109, 'Prueba escrita el jueves'),
(20, 'Informática', 110, 'Proyecto de programación para el mes próximo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `matricula`
--

CREATE TABLE `matricula` (
  `curso_cod` int(11) NOT NULL,
  `Materia_ID` int(11) NOT NULL,
  `fecha_matricula` date DEFAULT curdate(),
  `descuento` decimal(5,0) NOT NULL,
  `valor_matricula` decimal(10,0) NOT NULL,
  `id_matricula` int(11) NOT NULL,
  `cod_carnet` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `matricula`
--

INSERT INTO `matricula` (`curso_cod`, `Materia_ID`, `fecha_matricula`, `descuento`, `valor_matricula`, `id_matricula`, `cod_carnet`) VALUES
(26, 1, '2024-04-01', 10, 0, 1, 26),
(27, 2, '2024-04-02', 15, 0, 2, 27),
(28, 3, '2024-04-03', 20, 0, 3, 28),
(29, 4, '2024-04-04', 25, 0, 4, 29);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `profesor`
--

CREATE TABLE `profesor` (
  `cod_profesor` int(11) NOT NULL,
  `nombre1` varchar(25) NOT NULL,
  `nombre2` varchar(25) NOT NULL,
  `apellido1` varchar(25) NOT NULL,
  `apellido2` varchar(25) NOT NULL,
  `doc_identidad` enum('cc','ce','nit','rut') DEFAULT NULL,
  `no_documento` varchar(25) NOT NULL,
  `sexo` enum('masculino','femenino') DEFAULT NULL,
  `direccion` varchar(20) NOT NULL,
  `telefono` varchar(25) NOT NULL,
  `fecha_nacimiento` date DEFAULT curdate(),
  `titulo_profesional` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `profesor`
--

INSERT INTO `profesor` (`cod_profesor`, `nombre1`, `nombre2`, `apellido1`, `apellido2`, `doc_identidad`, `no_documento`, `sexo`, `direccion`, `telefono`, `fecha_nacimiento`, `titulo_profesional`) VALUES
(1, 'Juan', 'Carlos', 'López', 'Gómez', 'cc', '1234567890', '', 'Carrera 10 #20-30', '3123456789', '1980-05-15', 'Ingeniero Industrial'),
(2, 'María', 'Alejandra', 'Martínez', 'González', 'cc', '2345678901', '', 'Calle 5 #15-25', '3009876543', '1975-09-20', 'Licenciada en Educac'),
(3, 'Pedro', 'José', 'Ramírez', 'Pérez', 'cc', '3456789012', '', 'Avenida 30 #25-15', '3108765432', '1983-11-10', 'Economista'),
(4, 'Ana', 'Isabel', 'García', 'Sánchez', 'cc', '4567890123', '', 'Calle 15 #30-10', '3156789012', '1978-03-25', 'Doctora en Medicina'),
(5, 'Luis', 'Felipe', 'Rodríguez', 'Hernández', 'cc', '5678901234', '', 'Carrera 25 #10-5', '3207654321', '1982-07-08', 'Ingeniero de Sistema'),
(6, 'Sofía', 'Valentina', 'Díaz', 'Martínez', 'cc', '6789012345', '', 'Avenida 20 #10-25', '3016547890', '1986-01-30', 'Abogada'),
(7, 'Carlos', 'Andrés', 'Pérez', 'Gómez', 'cc', '7890123456', '', 'Calle 30 #5-20', '3178901234', '1972-12-18', 'Contador Público'),
(8, 'Laura', 'Fernanda', 'Gómez', 'López', 'cc', '8901234567', '', 'Carrera 10 #15-30', '3005432167', '1984-08-12', 'Ingeniera Civil'),
(9, 'Diego', 'Andrés', 'Hernández', 'Sánchez', 'cc', '9012345678', '', 'Calle 25 #30-5', '3189012345', '1977-04-22', 'Licenciado en Matemá'),
(10, 'Paula', 'María', 'Martínez', 'Rodríguez', 'cc', '0123456789', '', 'Avenida 15 #20-10', '3148901234', '1970-06-05', 'Doctora en Psicologí');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `boletin_notas`
--
ALTER TABLE `boletin_notas`
  ADD PRIMARY KEY (`no_identidad`),
  ADD KEY `curso_cod` (`curso_cod`);

--
-- Indices de la tabla `curso`
--
ALTER TABLE `curso`
  ADD PRIMARY KEY (`COD_CURSOS`),
  ADD KEY `MATERIA_COD` (`Materia_ID`),
  ADD KEY `JORNADA_ID` (`JORNADA_ID`);

--
-- Indices de la tabla `estudiante`
--
ALTER TABLE `estudiante`
  ADD PRIMARY KEY (`no_identidad`),
  ADD KEY `nombre1` (`nombre1`),
  ADD KEY `carnet_cod` (`carnet_cod`);

--
-- Indices de la tabla `jornada`
--
ALTER TABLE `jornada`
  ADD PRIMARY KEY (`id_jornada`),
  ADD KEY `nombre_jornada` (`nombre_jornada`);

--
-- Indices de la tabla `materias`
--
ALTER TABLE `materias`
  ADD PRIMARY KEY (`Materia_ID`),
  ADD KEY `Nombre_Materia` (`Nombre_Materia`);

--
-- Indices de la tabla `matricula`
--
ALTER TABLE `matricula`
  ADD PRIMARY KEY (`id_matricula`),
  ADD KEY `curso_cod` (`curso_cod`),
  ADD KEY `materia_cod` (`Materia_ID`),
  ADD KEY `cod_carnet` (`cod_carnet`);

--
-- Indices de la tabla `profesor`
--
ALTER TABLE `profesor`
  ADD PRIMARY KEY (`cod_profesor`),
  ADD KEY `nombre1` (`nombre1`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `boletin_notas`
--
ALTER TABLE `boletin_notas`
  MODIFY `no_identidad` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=89644279;

--
-- AUTO_INCREMENT de la tabla `curso`
--
ALTER TABLE `curso`
  MODIFY `COD_CURSOS` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT de la tabla `estudiante`
--
ALTER TABLE `estudiante`
  MODIFY `no_identidad` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=154;

--
-- AUTO_INCREMENT de la tabla `jornada`
--
ALTER TABLE `jornada`
  MODIFY `id_jornada` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `materias`
--
ALTER TABLE `materias`
  MODIFY `Materia_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `matricula`
--
ALTER TABLE `matricula`
  MODIFY `id_matricula` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `profesor`
--
ALTER TABLE `profesor`
  MODIFY `cod_profesor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `boletin_notas`
--
ALTER TABLE `boletin_notas`
  ADD CONSTRAINT `boletin_notas_ibfk_1` FOREIGN KEY (`curso_cod`) REFERENCES `curso` (`COD_CURSOS`);

--
-- Filtros para la tabla `curso`
--
ALTER TABLE `curso`
  ADD CONSTRAINT `curso_ibfk_1` FOREIGN KEY (`Materia_ID`) REFERENCES `materias` (`Materia_ID`),
  ADD CONSTRAINT `curso_ibfk_2` FOREIGN KEY (`JORNADA_ID`) REFERENCES `jornada` (`id_jornada`);

--
-- Filtros para la tabla `matricula`
--
ALTER TABLE `matricula`
  ADD CONSTRAINT `matricula_ibfk_1` FOREIGN KEY (`curso_cod`) REFERENCES `curso` (`COD_CURSOS`),
  ADD CONSTRAINT `matricula_ibfk_2` FOREIGN KEY (`Materia_ID`) REFERENCES `materias` (`Materia_ID`),
  ADD CONSTRAINT `matricula_ibfk_3` FOREIGN KEY (`cod_carnet`) REFERENCES `estudiante` (`carnet_cod`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
