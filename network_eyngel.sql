-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.4.28-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win64
-- HeidiSQL Versión:             12.5.0.6677
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Volcando estructura para tabla network_eyngel.anuncios
CREATE TABLE IF NOT EXISTS `anuncios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `a_descripcion` longtext NOT NULL,
  `a_estado` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Volcando datos para la tabla network_eyngel.anuncios: ~0 rows (aproximadamente)
INSERT IGNORE INTO `anuncios` (`id`, `a_descripcion`, `a_estado`, `created_at`, `updated_at`) VALUES
	(11, '<p>Te damos la bienvenida a Minccy: La red social que supera tus expectativas.</p>', 1, '2023-06-20 05:30:20', '2023-06-20 05:30:20'),
	(12, 'ok google', 1, '2023-07-05 02:27:18', '2023-07-05 02:27:18');

-- Volcando estructura para tabla network_eyngel.estado
CREATE TABLE IF NOT EXISTS `estado` (
  `est_id` int(11) NOT NULL,
  `est_nombre` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`est_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla network_eyngel.estado: ~2 rows (aproximadamente)
INSERT IGNORE INTO `estado` (`est_id`, `est_nombre`, `created_at`, `updated_at`) VALUES
	(0, 'Inactivo', '2023-04-24 05:27:09', '2023-04-24 05:27:09'),
	(1, 'Activo', '2023-04-24 05:27:09', '2023-04-24 05:27:09');

-- Volcando estructura para tabla network_eyngel.failed_jobs
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla network_eyngel.failed_jobs: ~0 rows (aproximadamente)

-- Volcando estructura para tabla network_eyngel.ip_bloqueo
CREATE TABLE IF NOT EXISTS `ip_bloqueo` (
  `ip_id` int(11) NOT NULL AUTO_INCREMENT,
  `ip_numero` varchar(255) NOT NULL,
  `ip_fecha_bloqueo` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`ip_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla network_eyngel.ip_bloqueo: ~0 rows (aproximadamente)

-- Volcando estructura para tabla network_eyngel.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla network_eyngel.migrations: ~0 rows (aproximadamente)

-- Volcando estructura para tabla network_eyngel.movies
CREATE TABLE IF NOT EXISTS `movies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `imagen` varchar(255) NOT NULL,
  `duracion` varchar(45) NOT NULL,
  `descripcion` longtext NOT NULL,
  `url` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `update_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla network_eyngel.movies: ~11 rows (aproximadamente)
INSERT IGNORE INTO `movies` (`id`, `nombre`, `imagen`, `duracion`, `descripcion`, `url`, `created_at`, `update_at`) VALUES
	(1, 'Once upon a time in hollywood', 'https://i.pinimg.com/originals/7a/d7/de/7ad7de49435db662eb31de47250aec79.jpg', '2h 45m', 'La película se centra en el panorama cambiante de Hollywood a finales de los años 60, cuando la industria empezaba a olvidarse de los pilares clásicos. La estrella de un western televisivo, Rick Dalton (DiCaprio), intenta amoldarse a estos cambios al mismo tiempo que su doble (Pitt). Sin embargo, la vida de Dalton parece que está ligada a sus raíces de Hollywood, puesto que es vecino de la actriz y modelo Sharon Tate (Robbie), que acaba siendo víctima de la familia Manson en la matanza de agosto de 1969.', 'https://streamtape.com/e/dKVKd8ZJYwTQ3A/', '2023-06-02 14:41:35', '2023-06-02 14:41:35'),
	(3, 'Terrifier 2', 'https://i.pinimg.com/originals/2f/9f/e1/2f9fe14c1274e2d1dfbab72ed931ab3a.jpg', '2h 18m', 'Después de ser resucitado por una entidad siniestra, Art the Clown regresa al condado de Miles, donde debe cazar y destruir a una adolescente y a su hermano menor en la noche de Halloween.', 'https://streamtape.com/e/M9X7OaDOw1smO24/', '2023-06-02 15:08:55', '2023-06-02 15:08:55'),
	(4, 'La sirenita', 'https://cuevana8.com/_next/image?url=https%3A%2F%2Fimage.tmdb.org%2Ft%2Fp%2Foriginal%2FgoX6Pcb7fugl9ADfg3Ns1OnuIYY.jpg&w=256&q=75', '2h 15min', 'Ariel, la más joven de las hijas del rey Tritón y la más desafiante, anhela saber más sobre el mundo más allá del mar y, mientras visita la superficie, se enamora del apuesto príncipe Eric. Con las sirenas prohibidas para interactuar con los humanos, Ariel hace un trato con la malvada bruja del mar, Ursula, que le da la oportunidad de experimentar la vida en la tierra, pero finalmente pone en peligro su vida y la corona de su padre.', 'https://streamtape.com/e/V7yp9K79pxCKlMA/', '2023-06-04 04:42:31', '2023-06-04 04:42:31'),
	(5, 'Super Mario Bros. La pelicula', 'https://archivos-cms.cinecolombia.com/images/5/6/0/0/40065-4-esl-CO/44c1afd60fb0-smb_cineco_2-poster_480x670.jpg', '1h  32min', '<p>Mientras trabaja bajo tierra para arreglar una tuber&iacute;a de agua, los plomeros de Brooklyn Mario y su hermano Luigi son transportados por una misteriosa tuber&iacute;a y llegan a un nuevo mundo m&aacute;gico. Pero cuando los hermanos se separan, Mario se embarca en una b&uacute;squeda &eacute;pica para encontrar a Luigi. Con la ayuda de un residente del Reino Champi&ntilde;&oacute;n, Toad y algo de entrenamiento de la gobernante del Reino Champi&ntilde;&oacute;n, la Princesa Peach, Mario conocer&aacute; su propio poder.</p>', 'https://streamtape.com/e/mO7oV10WR8tXmd/', '2023-06-04 05:04:42', '2023-06-04 05:04:42'),
	(6, 'Calabozos & Dragones: Honor entre ladrones', 'https://pics.filmaffinity.com/Dungeons_Dragons_Honor_entre_ladrones-501449261-large.jpg', '2h 14min', '<p>Un ladr&oacute;n encantador y una banda de aventureros inveros&iacute;miles emprenden un atraco &eacute;pico para recuperar una reliquia perdida, pero las cosas salen peligrosamente mal cuando se topan con las personas equivocadas.</p>', 'https://streamtape.com/e/OXLq2RgV9xTzD8/', '2023-06-05 01:35:31', '2023-06-05 01:35:31'),
	(7, 'Avatar: El camino del agua', 'https://www.ecartelera.com/carteles/4200/4261/004_p.jpg', '3h 12min', '<p>M&aacute;s de una d&eacute;cada despu&eacute;s de los acontecimientos de &#39;Avatar&#39;, los Na&#39;vi Jake Sully, Neytiri y sus hijos viven en paz en los bosques de Pandora hasta que regresan los hombres del cielo. Entonces comienzan los problemas que persiguen sin descanso a la familia Sully, que decide hacer un gran sacrificio para mantener a su pueblo a salvo y seguir ellos con vida.</p>', 'https://streamtape.com/e/l3J690p4xXF7PVb/', '2023-06-05 02:07:44', '2023-06-05 02:07:44'),
	(8, 'Los blancos no saben saltar', 'https://pics.filmaffinity.com/White_Men_Can_t_Jump-775884921-large.jpg', '1h 41min', '<p>En esta versi&oacute;n moderna de la ic&oacute;nica pel&iacute;cula, Jeremy, basquetbolista exestrella cuyas lesiones detuvieron su carrera, se une de mala gana a Kamal, un jugador que fue prometedor, pero arruin&oacute; su futuro en el deporte. Mientras equilibran relaciones tensas, presiones financieras y luchas internas, estos basquetbolistas callejeros, que aparentemente son polos opuestos, unen fuerzas en un &uacute;ltimo intento de vivir sus sue&ntilde;os.</p>', 'https://streamtape.com/e/Ld0XDr3WRZh6jK/', '2023-06-05 02:37:35', '2023-06-05 02:37:35'),
	(9, 'Ghosting', 'https://images.justwatch.com/poster/304095764/s592/ghosted-2023', '2h 00m', '<p>Cole, un tipo campechano, se enamora perdidamente de la emigm&aacute;tica Sadie, quien, para su enorme sorpresa, resulta ser una agente secreta. Antes de que pueda surgir una segunda cita, los dos deben embarcarse en una aventura internacional para salvar el mundo.</p>', 'https://streamtape.com/e/8OlKbvQw6KSodM3/', '2023-06-05 04:43:00', '2023-06-05 04:43:00'),
	(10, 'Rápidos y furiosos X', 'https://procinal.com/uploads/PELICULAS/Img_movies/Img_360x500/RAPIDOOS%20Y%20FURIOSOS%20X1.jpg', '2h 22min', '<p>A trav&eacute;s de varias misiones y contra lo imposible, Dom Toretto y su familia han sido m&aacute;s astutos y m&aacute;s r&aacute;pidos que todos los enemigos se le han cruzado en su camino. Ahora se enfrentan a su enemigo m&aacute;s letal: una amenaza aterradora que surge de las sombras del pasado que est&aacute; alimentado de una venganza sangrienta, y est&aacute; decidido a destruir a su familia y destruir todo, y a cualquier persona, a los que Dom ama.</p>', 'https://streamtape.com/e/LeYjLPydz6TRBpp/', '2023-06-14 03:46:36', '2023-06-14 03:46:36'),
	(11, 'Tetris', 'https://images.justwatch.com/poster/304847061/s718/tetris.%7Bformat%7D', '1h 57min', '<p>Basada en la historia real del comercial de videojuegos estadounidense Henk Rogers y su descubrimiento del Tetris en 1988. Cuando se dispone a hacer que el juego sea disponible en el mundo, se mete en una peligrosa red de mentiras y corrupci&oacute;n que hay detr&aacute;s de la Cortina de Hierro.</p>', 'https://streamtape.com/e/qxYr3AMwL3czdQj/', '2023-06-17 20:45:42', '2023-06-17 20:45:42'),
	(12, 'Misión de rescate 2', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhkp5-1Cg4nt4dGHeILCsD4g_Y_6Bl0hv2o1U46WlzrzUs6LeNrs_0nyV152PG9tGx3SCMmE1FOJW6IP9gsgn2eljn5tkPMyqRcdQUHB_U6F9qFLnIchTYZlcOybwOxHUKv-b_71noqlbkWU7Myyp9LDespX9l7jlbKgtiCBdaXhebDhEbCisDwin1WZQ/s2222/p', '2h 03min', '<p>Despu&eacute;s de sobrevivir (a duras penas) a todo lo que le sucede en la primera pel&iacute;cula, Rake regresa como mercenario australiano de operaciones encubiertas al que se encomienda otra misi&oacute;n suicida: rescatar a la maltrecha familia de un despiadado g&aacute;ngster georgiano de la prisi&oacute;n donde se encuentra recluida.</p>', 'https://streamtape.com/e/YDW7XYGW3VCvxgx/', '2023-06-17 21:57:39', '2023-06-17 21:57:39');

-- Volcando estructura para tabla network_eyngel.pais
CREATE TABLE IF NOT EXISTS `pais` (
  `pa_id` int(11) NOT NULL AUTO_INCREMENT,
  `pa_nombre` varchar(200) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`pa_id`)
) ENGINE=InnoDB AUTO_INCREMENT=198 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Volcando datos para la tabla network_eyngel.pais: ~197 rows (aproximadamente)
INSERT IGNORE INTO `pais` (`pa_id`, `pa_nombre`, `created_at`, `updated_at`) VALUES
	(1, 'Afganistán', '2023-06-08 15:10:13', '0000-00-00 00:00:00'),
	(2, 'Albania', '2023-06-08 15:10:13', '0000-00-00 00:00:00'),
	(3, 'Alemania', '2023-06-08 15:10:13', '0000-00-00 00:00:00'),
	(4, 'Andorra', '2023-06-08 15:10:13', '0000-00-00 00:00:00'),
	(5, 'Angola', '2023-06-08 15:10:13', '0000-00-00 00:00:00'),
	(6, 'Antigua y Barbuda', '2023-06-08 15:10:13', '0000-00-00 00:00:00'),
	(7, 'Arabia Saudita', '2023-06-08 15:10:13', '0000-00-00 00:00:00'),
	(8, 'Argelia', '2023-06-08 15:10:13', '0000-00-00 00:00:00'),
	(9, 'Argentina', '2023-06-08 15:10:13', '0000-00-00 00:00:00'),
	(10, 'Armenia', '2023-06-08 15:10:13', '0000-00-00 00:00:00'),
	(11, 'Australia', '2023-06-08 15:10:13', '0000-00-00 00:00:00'),
	(12, 'Austria', '2023-06-08 15:10:13', '0000-00-00 00:00:00'),
	(13, 'Azerbaiyán', '2023-06-08 15:10:13', '0000-00-00 00:00:00'),
	(14, 'Bahamas', '2023-06-08 15:10:13', '0000-00-00 00:00:00'),
	(15, 'Bangladés', '2023-06-08 15:10:13', '0000-00-00 00:00:00'),
	(16, 'Barbados', '2023-06-08 15:10:13', '0000-00-00 00:00:00'),
	(17, 'Baréin', '2023-06-08 15:10:13', '0000-00-00 00:00:00'),
	(18, 'Bélgica', '2023-06-08 15:10:13', '0000-00-00 00:00:00'),
	(19, 'Belice', '2023-06-08 15:10:13', '0000-00-00 00:00:00'),
	(20, 'Benín', '2023-06-08 15:10:13', '0000-00-00 00:00:00'),
	(21, 'Bielorrusia', '2023-06-08 15:10:13', '0000-00-00 00:00:00'),
	(22, 'Birmania', '2023-06-08 15:10:13', '0000-00-00 00:00:00'),
	(23, 'Bolivia', '2023-06-08 15:10:13', '0000-00-00 00:00:00'),
	(24, 'Bosnia-Herzegovina', '2023-06-08 15:10:13', '0000-00-00 00:00:00'),
	(25, 'Botsuana', '2023-06-08 15:10:13', '0000-00-00 00:00:00'),
	(26, 'Brasil', '2023-06-08 15:10:13', '0000-00-00 00:00:00'),
	(27, 'Brunéi', '2023-06-08 15:10:13', '0000-00-00 00:00:00'),
	(28, 'Bulgaria', '2023-06-08 15:10:13', '0000-00-00 00:00:00'),
	(29, 'Burkina Faso', '2023-06-08 15:10:13', '0000-00-00 00:00:00'),
	(30, 'Burundi', '2023-06-08 15:10:13', '0000-00-00 00:00:00'),
	(31, 'Bután', '2023-06-08 15:10:13', '0000-00-00 00:00:00'),
	(32, 'Cabo Verde', '2023-06-08 15:10:13', '0000-00-00 00:00:00'),
	(33, 'Camboya', '2023-06-08 15:10:13', '0000-00-00 00:00:00'),
	(34, 'Camerún', '2023-06-08 15:10:13', '0000-00-00 00:00:00'),
	(35, 'Canadá', '2023-06-08 15:10:13', '0000-00-00 00:00:00'),
	(36, 'Catar', '2023-06-08 15:10:13', '0000-00-00 00:00:00'),
	(37, 'Chad', '2023-06-08 15:10:13', '0000-00-00 00:00:00'),
	(38, 'Chile', '2023-06-08 15:10:13', '0000-00-00 00:00:00'),
	(39, 'China', '2023-06-08 15:10:13', '0000-00-00 00:00:00'),
	(40, 'Chipre', '2023-06-08 15:10:13', '0000-00-00 00:00:00'),
	(41, 'Colombia', '2023-06-08 15:10:13', '0000-00-00 00:00:00'),
	(42, 'Comoras', '2023-06-08 15:10:13', '0000-00-00 00:00:00'),
	(43, 'Congo', '2023-06-08 15:10:13', '0000-00-00 00:00:00'),
	(44, 'Corea del Norte', '2023-06-08 15:10:13', '0000-00-00 00:00:00'),
	(45, 'Corea del Sur', '2023-06-08 15:10:13', '0000-00-00 00:00:00'),
	(46, 'Costa de Marfil', '2023-06-08 15:10:13', '0000-00-00 00:00:00'),
	(47, 'Costa Rica', '2023-06-08 15:10:13', '0000-00-00 00:00:00'),
	(48, 'Croacia', '2023-06-08 15:10:13', '0000-00-00 00:00:00'),
	(49, 'Cuba', '2023-06-08 15:10:13', '0000-00-00 00:00:00'),
	(50, 'Dinamarca', '2023-06-08 15:10:13', '0000-00-00 00:00:00'),
	(51, 'Dominica', '2023-06-08 15:10:13', '0000-00-00 00:00:00'),
	(52, 'Ecuador', '2023-06-08 15:10:13', '0000-00-00 00:00:00'),
	(53, 'Egipto', '2023-06-08 15:10:13', '0000-00-00 00:00:00'),
	(54, 'El Salvador', '2023-06-08 15:10:13', '0000-00-00 00:00:00'),
	(55, 'Emiratos Árabes Unidos', '2023-06-08 15:10:13', '0000-00-00 00:00:00'),
	(56, 'Eritrea', '2023-06-08 15:10:13', '0000-00-00 00:00:00'),
	(57, 'Eslovaquia', '2023-06-08 15:10:13', '0000-00-00 00:00:00'),
	(58, 'Eslovenia', '2023-06-08 15:10:13', '0000-00-00 00:00:00'),
	(59, 'España', '2023-06-08 15:10:13', '0000-00-00 00:00:00'),
	(60, 'Estados Unidos', '2023-06-08 15:10:13', '0000-00-00 00:00:00'),
	(61, 'Estonia', '2023-06-08 15:10:13', '0000-00-00 00:00:00'),
	(62, 'Esuatini', '2023-06-08 15:10:13', '0000-00-00 00:00:00'),
	(63, 'Etiopía', '2023-06-08 15:10:13', '0000-00-00 00:00:00'),
	(64, 'Filipinas', '2023-06-08 15:10:13', '0000-00-00 00:00:00'),
	(65, 'Finlandia', '2023-06-08 15:10:13', '0000-00-00 00:00:00'),
	(66, 'Fiyi', '2023-06-08 15:10:13', '0000-00-00 00:00:00'),
	(67, 'Francia', '2023-06-08 15:10:13', '0000-00-00 00:00:00'),
	(68, 'Gabón', '2023-06-08 15:10:13', '0000-00-00 00:00:00'),
	(69, 'Gambia', '2023-06-08 15:10:13', '0000-00-00 00:00:00'),
	(70, 'Georgia', '2023-06-08 15:10:13', '0000-00-00 00:00:00'),
	(71, 'Ghana', '2023-06-08 15:10:13', '0000-00-00 00:00:00'),
	(72, 'Granada', '2023-06-08 15:10:13', '0000-00-00 00:00:00'),
	(73, 'Grecia', '2023-06-08 15:10:13', '0000-00-00 00:00:00'),
	(74, 'Guatemala', '2023-06-08 15:10:13', '0000-00-00 00:00:00'),
	(75, 'Guinea', '2023-06-08 15:10:13', '0000-00-00 00:00:00'),
	(76, 'Guinea Ecuatorial', '2023-06-08 15:10:13', '0000-00-00 00:00:00'),
	(77, 'Guinea-Bisáu', '2023-06-08 15:10:13', '0000-00-00 00:00:00'),
	(78, 'Guyana', '2023-06-08 15:10:13', '0000-00-00 00:00:00'),
	(79, 'Haití', '2023-06-08 15:10:13', '0000-00-00 00:00:00'),
	(80, 'Honduras', '2023-06-08 15:10:13', '0000-00-00 00:00:00'),
	(81, 'Hungría', '2023-06-08 15:10:13', '0000-00-00 00:00:00'),
	(82, 'India', '2023-06-08 15:10:13', '0000-00-00 00:00:00'),
	(83, 'Indonesia', '2023-06-08 15:10:13', '0000-00-00 00:00:00'),
	(84, 'Irak', '2023-06-08 15:10:13', '0000-00-00 00:00:00'),
	(85, 'Irán', '2023-06-08 15:10:13', '0000-00-00 00:00:00'),
	(86, 'Irlanda', '2023-06-08 15:10:13', '0000-00-00 00:00:00'),
	(87, 'Islandia', '2023-06-08 15:10:13', '0000-00-00 00:00:00'),
	(88, 'Islas Marshall', '2023-06-08 15:10:13', '0000-00-00 00:00:00'),
	(89, 'Islas Salomón', '2023-06-08 15:10:13', '0000-00-00 00:00:00'),
	(90, 'Israel', '2023-06-08 15:10:13', '0000-00-00 00:00:00'),
	(91, 'Italia', '2023-06-08 15:10:13', '0000-00-00 00:00:00'),
	(92, 'Jamaica', '2023-06-08 15:10:13', '0000-00-00 00:00:00'),
	(93, 'Japón', '2023-06-08 15:10:13', '0000-00-00 00:00:00'),
	(94, 'Jordania', '2023-06-08 15:10:13', '0000-00-00 00:00:00'),
	(95, 'Kazajistán', '2023-06-08 15:10:13', '0000-00-00 00:00:00'),
	(96, 'Kenia', '2023-06-08 15:10:13', '0000-00-00 00:00:00'),
	(97, 'Kirguistán', '2023-06-08 15:10:13', '0000-00-00 00:00:00'),
	(98, 'Kiribati', '2023-06-08 15:10:13', '0000-00-00 00:00:00'),
	(99, 'Kosovo', '2023-06-08 15:10:13', '0000-00-00 00:00:00'),
	(100, 'Kuwait', '2023-06-08 15:10:13', '0000-00-00 00:00:00'),
	(101, 'Laos', '2023-06-08 15:10:13', '0000-00-00 00:00:00'),
	(102, 'Lesoto', '2023-06-08 15:10:13', '0000-00-00 00:00:00'),
	(103, 'Letonia', '2023-06-08 15:10:13', '0000-00-00 00:00:00'),
	(104, 'Líbano', '2023-06-08 15:10:13', '0000-00-00 00:00:00'),
	(105, 'Liberia', '2023-06-08 15:10:13', '0000-00-00 00:00:00'),
	(106, 'Libia', '2023-06-08 15:10:13', '0000-00-00 00:00:00'),
	(107, 'Liechtenstein', '2023-06-08 15:10:13', '0000-00-00 00:00:00'),
	(108, 'Lituania', '2023-06-08 15:10:13', '0000-00-00 00:00:00'),
	(109, 'Luxemburgo', '2023-06-08 15:10:13', '0000-00-00 00:00:00'),
	(110, 'Macedonia del Norte', '2023-06-08 15:10:13', '0000-00-00 00:00:00'),
	(111, 'Madagascar', '2023-06-08 15:10:13', '0000-00-00 00:00:00'),
	(112, 'Malasia', '2023-06-08 15:10:13', '0000-00-00 00:00:00'),
	(113, 'Malaui', '2023-06-08 15:10:13', '0000-00-00 00:00:00'),
	(114, 'Maldivas', '2023-06-08 15:10:13', '0000-00-00 00:00:00'),
	(115, 'Malí', '2023-06-08 15:10:13', '0000-00-00 00:00:00'),
	(116, 'Malta', '2023-06-08 15:10:13', '0000-00-00 00:00:00'),
	(117, 'Marruecos', '2023-06-08 15:10:13', '0000-00-00 00:00:00'),
	(118, 'Mauricio', '2023-06-08 15:10:13', '0000-00-00 00:00:00'),
	(119, 'Mauritania', '2023-06-08 15:10:13', '0000-00-00 00:00:00'),
	(120, 'México', '2023-06-08 15:10:13', '0000-00-00 00:00:00'),
	(121, 'Micronesia', '2023-06-08 15:10:13', '0000-00-00 00:00:00'),
	(122, 'Moldavia', '2023-06-08 15:10:13', '0000-00-00 00:00:00'),
	(123, 'Mónaco', '2023-06-08 15:10:13', '0000-00-00 00:00:00'),
	(124, 'Mongolia', '2023-06-08 15:10:13', '0000-00-00 00:00:00'),
	(125, 'Montenegro', '2023-06-08 15:10:13', '0000-00-00 00:00:00'),
	(126, 'Mozambique', '2023-06-08 15:10:13', '0000-00-00 00:00:00'),
	(127, 'Namibia', '2023-06-08 15:10:13', '0000-00-00 00:00:00'),
	(128, 'Nauru', '2023-06-08 15:10:13', '0000-00-00 00:00:00'),
	(129, 'Nepal', '2023-06-08 15:10:13', '0000-00-00 00:00:00'),
	(130, 'Nicaragua', '2023-06-08 15:10:13', '0000-00-00 00:00:00'),
	(131, 'Níger', '2023-06-08 15:10:13', '0000-00-00 00:00:00'),
	(132, 'Nigeria', '2023-06-08 15:10:13', '0000-00-00 00:00:00'),
	(133, 'Noruega', '2023-06-08 15:10:13', '0000-00-00 00:00:00'),
	(134, 'Nueva Zelanda', '2023-06-08 15:10:13', '0000-00-00 00:00:00'),
	(135, 'Omán', '2023-06-08 15:10:13', '0000-00-00 00:00:00'),
	(136, 'Países Bajos', '2023-06-08 15:10:13', '0000-00-00 00:00:00'),
	(137, 'Pakistán', '2023-06-08 15:10:13', '0000-00-00 00:00:00'),
	(138, 'Palaos', '2023-06-08 15:10:13', '0000-00-00 00:00:00'),
	(139, 'Palestina', '2023-06-08 15:10:13', '0000-00-00 00:00:00'),
	(140, 'Panamá', '2023-06-08 15:10:13', '0000-00-00 00:00:00'),
	(141, 'Papúa Nueva Guinea', '2023-06-08 15:10:13', '0000-00-00 00:00:00'),
	(142, 'Paraguay', '2023-06-08 15:10:13', '0000-00-00 00:00:00'),
	(143, 'Perú', '2023-06-08 15:10:13', '0000-00-00 00:00:00'),
	(144, 'Polonia', '2023-06-08 15:10:13', '0000-00-00 00:00:00'),
	(145, 'Portugal', '2023-06-08 15:10:13', '0000-00-00 00:00:00'),
	(146, 'Reino Unido', '2023-06-08 15:10:13', '0000-00-00 00:00:00'),
	(147, 'República Centroafricana', '2023-06-08 15:10:13', '0000-00-00 00:00:00'),
	(148, 'República Checa', '2023-06-08 15:10:13', '0000-00-00 00:00:00'),
	(149, 'República Democrática del Congo', '2023-06-08 15:10:13', '0000-00-00 00:00:00'),
	(150, 'República Dominicana', '2023-06-08 15:10:13', '0000-00-00 00:00:00'),
	(151, 'Ruanda', '2023-06-08 15:10:13', '0000-00-00 00:00:00'),
	(152, 'Rumania', '2023-06-08 15:10:13', '0000-00-00 00:00:00'),
	(153, 'Rusia', '2023-06-08 15:10:13', '0000-00-00 00:00:00'),
	(154, 'Samoa', '2023-06-08 15:10:13', '0000-00-00 00:00:00'),
	(155, 'San Cristóbal y Nieves', '2023-06-08 15:10:13', '0000-00-00 00:00:00'),
	(156, 'San Marino', '2023-06-08 15:10:13', '0000-00-00 00:00:00'),
	(157, 'San Vicente y las Granadinas', '2023-06-08 15:10:13', '0000-00-00 00:00:00'),
	(158, 'Santa Lucía', '2023-06-08 15:10:13', '0000-00-00 00:00:00'),
	(159, 'Santo Tomé y Príncipe', '2023-06-08 15:10:13', '0000-00-00 00:00:00'),
	(160, 'Senegal', '2023-06-08 15:10:13', '0000-00-00 00:00:00'),
	(161, 'Serbia', '2023-06-08 15:10:13', '0000-00-00 00:00:00'),
	(162, 'Seychelles', '2023-06-08 15:10:13', '0000-00-00 00:00:00'),
	(163, 'Sierra Leona', '2023-06-08 15:10:13', '0000-00-00 00:00:00'),
	(164, 'Singapur', '2023-06-08 15:10:13', '0000-00-00 00:00:00'),
	(165, 'Siria', '2023-06-08 15:10:13', '0000-00-00 00:00:00'),
	(166, 'Somalia', '2023-06-08 15:10:13', '0000-00-00 00:00:00'),
	(167, 'Sri Lanka', '2023-06-08 15:10:13', '0000-00-00 00:00:00'),
	(168, 'Sudáfrica', '2023-06-08 15:10:13', '0000-00-00 00:00:00'),
	(169, 'Sudán', '2023-06-08 15:10:13', '0000-00-00 00:00:00'),
	(170, 'Sudán del Sur', '2023-06-08 15:10:13', '0000-00-00 00:00:00'),
	(171, 'Suecia', '2023-06-08 15:10:13', '0000-00-00 00:00:00'),
	(172, 'Suiza', '2023-06-08 15:10:13', '0000-00-00 00:00:00'),
	(173, 'Surinam', '2023-06-08 15:10:13', '0000-00-00 00:00:00'),
	(174, 'Tailandia', '2023-06-08 15:10:13', '0000-00-00 00:00:00'),
	(175, 'Taiwán', '2023-06-08 15:10:13', '0000-00-00 00:00:00'),
	(176, 'Tanzania', '2023-06-08 15:10:13', '0000-00-00 00:00:00'),
	(177, 'Tayikistán', '2023-06-08 15:10:13', '0000-00-00 00:00:00'),
	(178, 'Timor Oriental', '2023-06-08 15:10:13', '0000-00-00 00:00:00'),
	(179, 'Togo', '2023-06-08 15:10:13', '0000-00-00 00:00:00'),
	(180, 'Tonga', '2023-06-08 15:10:13', '0000-00-00 00:00:00'),
	(181, 'Trinidad y Tobago', '2023-06-08 15:10:13', '0000-00-00 00:00:00'),
	(182, 'Túnez', '2023-06-08 15:10:13', '0000-00-00 00:00:00'),
	(183, 'Turkmenistán', '2023-06-08 15:10:13', '0000-00-00 00:00:00'),
	(184, 'Turquía', '2023-06-08 15:10:13', '0000-00-00 00:00:00'),
	(185, 'Tuvalu', '2023-06-08 15:10:13', '0000-00-00 00:00:00'),
	(186, 'Ucrania', '2023-06-08 15:10:13', '0000-00-00 00:00:00'),
	(187, 'Uganda', '2023-06-08 15:10:13', '0000-00-00 00:00:00'),
	(188, 'Uruguay', '2023-06-08 15:10:13', '0000-00-00 00:00:00'),
	(189, 'Uzbekistán', '2023-06-08 15:10:13', '0000-00-00 00:00:00'),
	(190, 'Vanuatu', '2023-06-08 15:10:13', '0000-00-00 00:00:00'),
	(191, 'Vaticano', '2023-06-08 15:10:13', '0000-00-00 00:00:00'),
	(192, 'Venezuela', '2023-06-08 15:10:13', '0000-00-00 00:00:00'),
	(193, 'Vietnam', '2023-06-08 15:10:13', '0000-00-00 00:00:00'),
	(194, 'Yemen', '2023-06-08 15:10:13', '0000-00-00 00:00:00'),
	(195, 'Yibuti', '2023-06-08 15:10:13', '0000-00-00 00:00:00'),
	(196, 'Zambia', '2023-06-08 15:10:13', '0000-00-00 00:00:00'),
	(197, 'Zimbabue', '2023-06-08 15:10:13', '0000-00-00 00:00:00');

-- Volcando estructura para tabla network_eyngel.password_resets
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla network_eyngel.password_resets: ~174 rows (aproximadamente)
INSERT IGNORE INTO `password_resets` (`email`, `token`, `created_at`) VALUES
	('lucy150606@gmail.com', '$2y$10$SdnAuYWCD0gnRnJqJ0wgReV92NVx5p.p3bEhFEkrYxSBXv8qzW5pq', '2023-03-17 11:46:00'),
	('myriamyanedespinalbalbin@gmail.com', '$2y$10$msTm4jwD1a6KQbzkTAH83ucOy4Mo3b/dl2GLLu2rrHUl1cSjhqAkS', '2023-03-17 19:05:22'),
	('chinibustamante@hotmail.com', '$2y$10$BUvq94ZqwZV/zcvehoP.DOT9v4ETz6Y7FV/4mStp7L1tniw8jt8pe', '2023-03-18 01:14:20'),
	('sophyarangel@gmail.com', '$2y$10$GSfvIuK8/dVSKz1XY4OG6.IY46YQnc8g6s8latxh0v7MNVQVgfNUm', '2023-03-18 02:28:10'),
	('kjulieth48793@gmail.com', '$2y$10$SkNWzcnYw94Pw58RaJ7T..DZq4Tuk4W8ZWJHPAnkXI1FfDabIOgre', '2023-03-18 14:05:35'),
	('lopezhenao1972@gmail.com', '$2y$10$Al6GgEiToS2HfmmMOdtnlOIor7NpNqAzB3WYFDk3n5D1BvSM8RCRS', '2023-03-18 14:16:47'),
	('samuelpalmareyes@gmail.com', '$2y$10$RK4vHYXhd/6cEcSv2Bg9YepRnvXhUI9Wcjk1wVeljUR1UdhcLOfZm', '2023-03-18 14:39:26'),
	('pollitopollito117@gmail.com', '$2y$10$/gjuk66Ka/bkI4D4GgOfyO/DoAUctbp9fVMscvcOGg570oSpUem6O', '2023-03-18 15:29:33'),
	('Jaymemonroy.530@gmil.com', '$2y$10$57Q/WX7Nh7/Hh5y1Fu8/XerUwtbZeRERybjVVGODiJiNtuaniGeXy', '2023-03-18 19:16:41'),
	('lidiana250190@gmail.com', '$2y$10$wm72RJowhQRPwS97Ag0hl.tkLSSVI4jFLHwvKcM3SoxMk8V6zEwUS', '2023-03-23 18:37:16'),
	('jerrisonagudelo7@gmail.com', '$2y$10$atcVHR.R.7tL7A1XedRZTOHeZUCKFSy1XJ5WTSXnzQqZ.dgNJ0Bya', '2023-03-27 22:43:50'),
	('edinsonlemus291@gmail.com', '$2y$10$L0TjivRPuQpGaj4BnB9Om.KwX0KtnrUhk1X35hsbtyHanFoFNPDau', '2023-03-28 00:46:45'),
	('pruebausuario@gmail.com', '$2y$10$OAPfKgJuZ0TTqDdsDUSYWOPTFOUAKGDGuLTenZB2E7fJBVsCKyflm', '2023-03-28 00:53:37'),
	('luzevernnymosquera@gmail', '$2y$10$wlzDiAED1pgJ9UEeLJJtEOCN.mcs8gHbC7wwx.zfgJb7j.At3DBuW', '2023-03-28 01:00:49'),
	('marbi22nove@gmail.com', '$2y$10$EcHcmEVRqLG553wFWpgfWOZgmujn60sVa4CdPX1SecxMuNP4sv82S', '2023-03-28 01:28:56'),
	('wendyhernandezrincon@gmail.com', '$2y$10$cVGuyVb6TMD.xtbL/TIyHem4ZSu1M3JMFWArus4Re8nQa1QkEeEdy', '2023-03-28 01:44:48'),
	('luzgarciadiaz@hotmail.com', '$2y$10$u6blMBmfR4roKaARV5WIMeACviQg0Vfsmht.GkqMVHE2IPQpME92G', '2023-03-28 01:53:38'),
	('karinatobar285@gmail.com', '$2y$10$oVynsuD1FGLbKJ1zv4sPkuhVNUQlq.Vzv1J9qLYpxp/hn6q98X4YG', '2023-03-28 01:57:47'),
	('paula.moncada@unipaz.edu.co', '$2y$10$DWMvKfWN50SbVBDMO/dyyOzDaz6EVoRp5bAVYxvXwKq3miPfcDv5W', '2023-03-28 02:00:17'),
	('cbsbuildcom.22@hotmail.com', '$2y$10$6.KLa37X1NQ5UlB6dI.nIej2EG07J6vgpqZX5R6Jh97RCvQpQ5fCW', '2023-03-28 02:01:56'),
	('maryrpo.02@hotmail.com', '$2y$10$8dPiVvM1yYUys6tVJZ732eCJEERVoyP7GCx6GsLu4wshnLAeESu8K', '2023-03-28 02:08:35'),
	('villaaleidi@gmail.com', '$2y$10$cByqVVqHZondxT419ocdcuNy3jt4gFBqTKrRFbucnB0x3QL3AYSoS', '2023-03-28 02:11:30'),
	('florezcastellanosm@gmail.com', '$2y$10$570sf7uq1wVq1Tzpz9fOJe9c9pOP3ulcJjLbwTv0pElmfSU0x6jue', '2023-03-28 02:18:30'),
	('ddaniel18@hotmail.com', '$2y$10$1T9zJgYi746sGXx9au6TzOt3HsMYLG2OZTPClNAKrMsmexgoysnNm', '2023-03-28 02:20:42'),
	('jandryeduardo09@gmail.com', '$2y$10$sR0XNll1It6/Flpooqk/.eVg/vf4OsOWsHA0MNV3aCwFajKYYLXY6', '2023-03-28 02:27:30'),
	('19borjajan@gmail.com', '$2y$10$xwCl7yqdkeGNFkz5iNVK9.i/yf1lOgAiiDduuahyfanAsdBarIAqq', '2023-03-28 02:32:11'),
	('Mayaalag2015@gmail.com', '$2y$10$u.yg22pce52L6OWrOhfBd.ek1mOSV8r0WAvoMzVs78KA1XBkv1nSS', '2023-03-28 02:35:12'),
	('anyelismartinez1234@gmail.com', '$2y$10$Tvp2Qo5eqxr4SnQ92xIIuuV36b0KXRTqYFfJ7Xy0Rz.dUNDOhjRq2', '2023-03-28 02:38:11'),
	('jucadume@hotmail.com', '$2y$10$0sDQHQKgVyy36rnSiY.WaengH/Nh1zN.6DLOzpEOEnMUQSM13Z2fe', '2023-03-28 02:46:16'),
	('yenis2021.17@gmail.com', '$2y$10$C.FO0/tlKLVKStCrVuTNke3bd0OcSGpifu2Y8fvZWEG4wyuTfqasS', '2023-03-28 02:46:54'),
	('elguille_40@hotmail.com', '$2y$10$0fphbh/coL3K2yAnOIMK.ecWnJ.Utei91wkes6xqLMZhUT2W4hrEO', '2023-03-28 03:12:23'),
	('jefferson123000@gmail.com', '$2y$10$1uyLCMB1NJ03EtDLCzNQ3u.rTrbSL2b8239.mgB9FtMGohSSTGy5e', '2023-03-28 03:16:16'),
	('alvarezelio869@gmail.com', '$2y$10$/xBp8KesOiq6uEFAECEcgufoc6gecDHjargnkROsFE1hc4hFtGqFK', '2023-03-28 08:38:52'),
	('luzmarinaoliva2020@gmail.com', '$2y$10$7LkVkmV6xmPrYb6oLn6zV.JbMwaSVYTZFaoQAWmMWX9AaQYV/0rKG', '2023-03-29 13:21:12'),
	('ap346898@gmail.com', '$2y$10$/FTjFOh0yM.in/uA29mHx.tX8/Vfe3TyEokLVR7BqHATWvFxo.Psa', '2023-03-30 13:19:19'),
	('charlistonm23@gmail.com', '$2y$10$3za.VA0Xmq7bS7eGZYGKXemU7gUsbpqLOKdKVo7wcQMN5UHDyOua.', '2023-04-01 01:31:45'),
	('linamariaosorio78@gmail.com', '$2y$10$7cBqhARIrT65vqO4cN7apuDVuxOUwzfuG9H0/jPTBDI/geR.mhipS', '2023-04-07 15:42:48'),
	('Pkmlang02@gmail.com', '$2y$10$E7wCbjI61tpChQDWwq1ble/A1zQZ4lSCkub0sncv/BJvyN.WtjPpS', '2023-04-07 22:28:56'),
	('abastecimientogaoe15@gmail.com', '$2y$10$cczC2/JapbQcsrG6aQ2lQ.ppYKHXbwVhSgqCNG9Fs.r.TNRDSu2Z6', '2023-04-08 15:12:36'),
	('jp0377350@gmail.com', '$2y$10$X5OwuMqYg8BX2b1a.XKrIOq3.hYK.SNDTapdBx2Ll81FFL0INKxEq', '2023-04-08 15:49:56'),
	('vianchatomas@gmail.com', '$2y$10$IbcFBQ3Gqtcsi/dS43qT9.glOsmstARkndm6Jc0SOzHi9uoTnUkem', '2023-04-09 00:18:51'),
	('iris83118@gmail.com', '$2y$10$dRx.iZC6AMTkZp5PyeBRrOqyTEmVqzAHEWciVktxlhwitm9C9fEgO', '2023-04-10 13:58:58'),
	('Ragujeroroman@gmail.com', '$2y$10$cBAmrS0KXPKWv6OKnN8C8.kRL5JCsJlCbTv0f8y1rmT.13nVtcQWS', '2023-04-10 15:25:23'),
	('marluru1@gmail.com', '$2y$10$lLJ3Pl4UFm3LIscjquyq5.cHirhLFO.lvIMJ31b/A/s2YbDroNCY.', '2023-04-10 15:39:24'),
	('anaximenesgoitia@gmail.com', '$2y$10$56mkiDtHYnUuV7PLrc2R4uOCdRvLmMqlJdXYEy4p9bHbcLReGuNlm', '2023-04-10 19:02:49'),
	('inabithp11@gmail.com', '$2y$10$soO32YDUIZ87dtcymGxjTu5TELfko/jNuA7PBj9Uq0wQyqJzoU8ry', '2023-04-10 21:16:50'),
	('merilynclavijo@gmail.com', '$2y$10$hUQm8sn0pZI0fZ8828rwKesmbXtGhD35p8rxQwoNLm7cX3cZ9Y/eK', '2023-04-11 18:03:36'),
	('torresplazas.1999@hotmail.com', '$2y$10$K/ie2n39rCPGEm4ip4IU1u4dYQzErKV7IOsfiL04X/eWV1HC8jQfy', '2023-04-11 20:55:29'),
	('fortegana42@gmail.com', '$2y$10$KcgzZ/gJDWqPrBX3thEnjeE7OZ5ZVe7hsUruySxPsgBVADFplyKJ2', '2023-04-11 22:36:52'),
	('williams197628@gmail.com', '$2y$10$m1MveN1sVU62e0yTKJ.cIuCuaqqcVqiictTIWLrTyZWxmOQEGABJW', '2023-04-11 23:47:10'),
	('oscarcristobalvalarezo@gmail.com', '$2y$10$A1bIbOHQabrmSljikejsu.orTJKEnFxyKpCkubXCqP8FzLkk3MUYG', '2023-04-12 00:04:16'),
	('cindyherrera0112@gmail.com', '$2y$10$U6l8quyg8laAeslWsbHVg.0aqOBW7rD6sUIxVLqDeJfllC2uLROSi', '2023-04-12 01:29:58'),
	('borja777.111@gmail.com', '$2y$10$Aiq1QUuM8AXQdL6SN8XRkezxtMy0i5dH4ddvGXmYS42O78UQFbOu2', '2023-04-12 01:41:28'),
	('mariiajaiimez@gmail.com', '$2y$10$aKgIp/Hfn2u78Go95boZLutkY31DcgdJ6qknYzZZjLf9KquBQa6Ii', '2023-04-12 15:40:09'),
	('joanbernal547@gmail.com', '$2y$10$iBkJKbrGPQLWKdDDMS290.HM0Bs0vGZ9.tAI7FbYjopVeB8jaOHFu', '2023-04-12 17:04:34'),
	('cuentasegura063@gmail.com', '$2y$10$R7Zkf3EqG6J8cEbjUozwIOJXRGkmP8hklfgZ0SU6SU8HY7rWxus3q', '2023-04-12 17:14:40'),
	('sarith0731@gmail.com', '$2y$10$oKOAOibCsGmGDZkeAzXqvu6zu4iXwUU6nV7TE2uMd4ZEASns8E9by', '2023-04-12 19:16:41'),
	('kervinrodriguez02@gmail.com', '$2y$10$LapCuY1fC1jfvBwQAiItG.FE69x3PII3q6EahEKsir3QfUqWrsuBi', '2023-04-12 20:31:43'),
	('asorcastro9@gmail.com', '$2y$10$8DxapEvnHd9wWF4wPh6.r.wnhIUYQUJHo/5NmlLaJFLZHONIsLvAa', '2023-04-13 01:23:57'),
	('blancasoto2929@gmail.com', '$2y$10$6EvcDS5U4g668Q3qOOIUp.cY7ZZrusBin7G8b24xd2aMIfZ83.CUy', '2023-04-13 01:47:35'),
	('p329260@mail.com', '$2y$10$vRmLSTIG6/.A4T.vjN4bv.bgf7iB3J2SEtPxrI9dYWfvzkdh7vK3y', '2023-04-13 01:48:55'),
	('olmasal82@live.com', '$2y$10$Szo5IwrYwHPDsbcuNqawE.BTncvRmq5DiGQWhOFmJ4VK.WTa1TrRm', '2023-04-13 01:50:01'),
	('alexandra.y.jose@hotmail.com', '$2y$10$x0BUFAroQ7V/XcwXtaGPqeEqlh67eVCZiaYhArk6xGhD8dlVYnFRq', '2023-04-13 01:50:19'),
	('thiagojaime259@gmail.com', '$2y$10$adH3JYrG7x6dNs2oQVT4R.3hRemo6cFX68rgbmOf2Z5yLreafD9x2', '2023-04-13 01:50:27'),
	('marthajc0426@gmail.com', '$2y$10$Ue5MdHLRDPK3jqRbBx.mfu.I/6OovEz0cy7jUYEuPw.n.nc0Iu5Ou', '2023-04-13 01:51:46'),
	('luisafernandanustesgomez@gmail.com', '$2y$10$L8u1Z7Gkp/yD7s/dgc9hC.YWjFT0HGkp5PdyZh18g8tYmZutvHlx2', '2023-04-13 01:54:49'),
	('yusmarygutierre@gmail.com', '$2y$10$SGwoXwvdqmrtjsNGlhqPQuUXqenBv4h.8EbBmRQ7Hx7vf2J.koyN2', '2023-04-13 01:57:15'),
	('valenescobar980@gmail.com', '$2y$10$xiS2sF4bRSqHMErSm3OdMuRaRbcT2hiI8Y5KKwgwKm2pyUOoLuInq', '2023-04-13 02:00:33'),
	('oscarzapataza@gmail.com', '$2y$10$wp2/CPYNLGwMD06y9GlhY.f7ZOlCdHtPwIYbTr908a2.mWbpp3c1S', '2023-04-13 02:02:49'),
	('kamilaney2010@gmail.com', '$2y$10$8MShlLYDhPAm9bIIjTtYQ.MCSxuVGTdax135.C62RJoKyzc9dIVw2', '2023-04-13 02:06:58'),
	('samuelramos1290@gmail.com', '$2y$10$NJ5KGksIeNtH9t6sYayJFuXVdPTDlR2Qi15HuHPqWQAInBuOtzWuy', '2023-04-13 02:07:53'),
	('pardonaranjocleofelina@gmail.com', '$2y$10$lDg0bAqVllT4lLhkbdFYFeuAacRq1jGFg2Rqpfy2VPrfjLDexVd5q', '2023-04-13 02:19:12'),
	('y.ohana.02@hotmail.com', '$2y$10$Zogfz5/r5Io/4DGO8YfFk.CiPyhy60/Ww3.XsXW3nqbFDbTQPcH0u', '2023-04-13 02:19:22'),
	('aalvapico5@gmail.com', '$2y$10$lsosF3zbm4ZKOCa8A8uWrekwtG9JjNegWbuqViOcPmUsMgBwCyZrG', '2023-04-13 02:26:13'),
	('maanco06@hotmail.com', '$2y$10$f8vSig4zB.NZyWWfBkOuQucFuzBa3QIHlnxrfJgQ0TyRn8TCPpjky', '2023-04-13 02:28:25'),
	('maeupimo1307@gmail.com', '$2y$10$xhr7vOdhGxQGDwlUEJOFyeYrbosj0z1b8SCLxc3t.kqhXKJtk8PD6', '2023-04-13 02:32:44'),
	('nieves.eanm@gmail.com', '$2y$10$s00bZzTypzBxObC8k0K.9.6W7Z4LhuzJIcJncak8uQvsViC8JGJj.', '2023-04-13 02:40:07'),
	('joserriveraf1503@gmail.com', '$2y$10$4pNPMqIgLlyOADZjrUTcfOiKYxxFx8b9orMLhRdOsAjlTzKc3xFAy', '2023-04-13 02:40:42'),
	('tamichemirla@gmail.com', '$2y$10$CUOYB.9df7Bl2zykszJy5eCx1pqgG2lvs5cgkAJyQpv3yLmtK21w.', '2023-04-13 02:41:48'),
	('yolsa8689@gmail.com', '$2y$10$X96QA8SDssp5fo6HdeoHA.50o/uQnpFtTukecy2DXoEII7XUdJDsW', '2023-04-13 02:42:32'),
	('galindowilkin@gmail.com', '$2y$10$X07m/WNGOGqDtoyiE4VXt.dlVeQcdwxjWXie23tRox4Sj74X1UTK6', '2023-04-13 02:44:11'),
	('Claudiajohana0412@hotmail.com', '$2y$10$LsDxrdz5JyKOzpuRekI4qOPlH0ujA1rNL3R4TEjkrgqsog6NWf04C', '2023-04-13 02:46:13'),
	('carlosalbertomejiasm@gmail.com', '$2y$10$g/TlTD5rwTdgMStiAzqxh.0JjCGwv6Vl0NcKb8FzvLZ99g9h.BPgO', '2023-04-13 02:47:21'),
	('mariana_lisbeth_89@hotmail.com', '$2y$10$BzYK6RWpKrRVjZgScLUQje.iI.pSGqnL.s5Vo6h4MEZWSPNSZXQR.', '2023-04-13 02:47:27'),
	('luizavaleta5@gmail.com', '$2y$10$hLNGT4rfGD5BSyA1B2XAsu89iWxB2TTLcaOAKRjGOB/FKYbmzpcli', '2023-04-13 02:50:09'),
	('rc212504@gmail.com', '$2y$10$RbzKYe.e4RM0U9S0M1zaKOlD2fRNz8D09fq415h.0e1Gag3w/UKJm', '2023-04-13 02:51:15'),
	('sanabriasebas21@gmail.com', '$2y$10$BnJyN4npnQAHKSeLCslUgeaGrIc0aJtSNtGzyii3OeYvffzBE06ya', '2023-04-13 02:52:21'),
	('asprillaindira1@gmail.com', '$2y$10$8HfxNWZWONLiOHZpCi7KjuXGqOHDKsjaSJDiHE0IAZK7tz9pZOyNi', '2023-04-13 02:54:55'),
	('zunildanama9@gmail.com', '$2y$10$CxR5m72tIokdil9d2zRw1uiD0DvytahR1LzAkoSn8L82h/V6qZTF.', '2023-04-13 02:57:19'),
	('leo5862882@gmail.com', '$2y$10$2Nb08KLHvFrH0N8.e.V4a.209GReuh8MJ6eW9qQ1uWbvbAW87Eqee', '2023-04-13 03:01:31'),
	('Lopezyiseth814@gmail.com', '$2y$10$9seG3J65i6HgeqANCJ2sEeFleBE47ZWONw9GCy8WSCQDr9YBWHmku', '2023-04-13 03:01:44'),
	('monikpatricia2011@gmail.com', '$2y$10$xFPfXdXM55hTQuXcYT0mLurqW44TRkyxieWxwyQK9.Dpur/PU2s1u', '2023-04-13 03:04:10'),
	('albaluzvargas0@gmail.com', '$2y$10$gChnSB2mRA/kTkWzARcciuOZ8yi/HBl7ZnfcZTmUzDe/pCHIMvIIm', '2023-04-13 03:10:48'),
	('Jhonfirigua1997@gmail.com', '$2y$10$NtJDfV6YNHI8Dls..4Gyb.n2NhrojByLrhNEg56mN6Ju9ShXV.noC', '2023-04-13 03:13:53'),
	('fernandez5115@hotmail.com', '$2y$10$y/bKkENfydlPFKnjFd4qGuJb0kD6RqGhDOBgtYWtdoNW6niNyQ8/6', '2023-04-13 03:13:57'),
	('edwinydrogo14@gmail.com', '$2y$10$U.NSDqGkfsZ3bnKFPsVtLOvCtvfn77lGNduxE02spQiH6aMSTJ/bS', '2023-04-13 03:15:09'),
	('jormanefren79@gmail.com', '$2y$10$k3F7QXjUciymr1o0Homsm.MekiaIDOxlikcdMt7Fj.Dw40/FyJY0C', '2023-04-13 03:15:14'),
	('motoreslavic@gmail.com', '$2y$10$86g5jL3gqkkalWwKE1MVTO1lVm8qi7mbnnBDKXVvo2jQaKzo17YLa', '2023-04-13 03:15:38'),
	('yesmina1974@gmail.com', '$2y$10$bUcUEg/5yyqwPM4YRh6TdOocd.Sw7kO2W6C1tcTprUEGvHMg3JeJy', '2023-04-13 03:20:51'),
	('am5948675@gmail.com', '$2y$10$3zPH.DiPVfbRFiJZqECRw.VojVFBOpdxSTCXc12vM3Kv6RxAnEyt2', '2023-04-13 03:26:14'),
	('buritica1986@gmail.com', '$2y$10$dYEG5c9xUPD//6TIx8.XLOZHNJQwacmUUbYcAnB8YM/WH5LAYX0Sy', '2023-04-13 03:28:16'),
	('juanhumberto1866@gmail.com', '$2y$10$zAC8FT16DSEX9yTwFbPtlO1V3cPojd6T/GnjVCL.VMerNoPshw/gK', '2023-04-13 03:34:39'),
	('nidiarendon05@gmail.com', '$2y$10$9aDydYhBMQyIe8p4jz6Q9OVSlVk/yWdi7oLAP3FiD2kgq8Azx9W.i', '2023-04-13 04:54:05'),
	('andres2020gguillen@gmail.com', '$2y$10$mNDT1/WarMB/CgqxcuWopOF5TEgUvOosz5sMpHgC4KkifSkQpOrqy', '2023-04-13 04:54:32'),
	('ruizsandovalgabriela@gmail.com', '$2y$10$sIeJ9pHq.P4S6U0Akza1sOvV14iMqePFBu627voRoKGBN/DKQlTXK', '2023-04-13 11:59:51'),
	('yesemosquera8@gmail.com', '$2y$10$Xcxv16t0OufZ4ejxvro18uRBZMN2u5IONxEi5zCjQedtDFmtJ45.y', '2023-04-13 22:48:55'),
	('mariape8710@gimail.com', '$2y$10$kVCfX6K89NEPrb6xUbpttOlJ9swRs/9FTwwYGdVXC1rgQOXeeepJ2', '2023-04-14 00:58:50'),
	('dianamarcelamatias04@gmail.com', '$2y$10$bId1duTimYE1pZ0BwyUC/.z6iNncacfFj8zsmLKWoNuyNAVG1VdVa', '2023-04-14 13:05:04'),
	('alejo-140967@hotmail.com', '$2y$10$Ee4raERRauIOhZIsiovcKOFxUCS7cyV4kT07.Mv.v42zlLwQEJz1e', '2023-04-14 21:31:49'),
	('ilderyara98@gmail.com', '$2y$10$1g1bZmpEXUIOtzpt0mUcIO7eH3HeNZZe8Ej3VMKkRcf4mbbXNuTD.', '2023-04-14 23:06:08'),
	('monteroisrrael81@gmail.com', '$2y$10$2rZxBxyk3qwtrrnPpWidPeV3lfbT2LxBPUp.V0SQeSNp1BGxOQFOS', '2023-04-15 01:12:43'),
	('milenamosquera061@gmail.com', '$2y$10$IlR0dG51w7DUd1J8UwnlYuJCdwfhNIYpC.gNC91TGehp7/wawzTuK', '2023-04-15 13:56:19'),
	('eneidapadrino203@gmail.com', '$2y$10$PviphKmxX1Vx6/BXIdKntuqLodAoB6D4B71z03ILpZP21YnWjdW9C', '2023-04-15 17:26:42'),
	('fernandamejia-18@hotmail.com', '$2y$10$ivrZqnZgN6OnWR6gpUKgmO2Cw/mOBnXD0RepGf2AruQPQ/BCxndAC', '2023-04-15 22:04:48'),
	('sandryhcastillo@gmail.com', '$2y$10$UbOGxeTySpco7fnIF.7n/em1Xe7fMbdjs3QCOkx.Z61yRVWzR9j..', '2023-04-15 23:52:42'),
	('johannarubianog@gmail.com', '$2y$10$7zlSm47GZF93dC5PGicEP.17ZmKOixEim2VAAlQO2UZq7xBgaAEdy', '2023-04-16 00:02:16'),
	('gavision879@hotmail.com', '$2y$10$hq7tLFbqEUU/vwQAWXmWZ.7QUC3EebAg3.2D7/Y4PJLa21vsYNXAi', '2023-04-16 00:18:19'),
	('mairim_colombia@hotmail.com', '$2y$10$Nf.4bSK6a4VCD3Iwipsf4eIu6SA0S8xMuAmdYxpLW3CNBq5nIn4yu', '2023-04-16 02:27:59'),
	('marthalugarcia457@gmail.com', '$2y$10$YAmfJpPfzTEFPkxOE.u25uBR3rNhxRn4ztMjSbCR4NJPA2oswN4di', '2023-04-16 14:00:17'),
	('bricenojoss07@gmail.com', '$2y$10$m.FY6T3zQaPiLdbA3kHupu63bn0X6bxwRjgBZ6hFE8AFAgK2hcah.', '2023-04-16 22:24:27'),
	('maryurisjulioherrera9@gmail.com', '$2y$10$b3DFVp/k0HvAPnNby2ul/uGn6iPbjYBc6EAy23yDnSN6csN8pRaIq', '2023-04-17 09:17:58'),
	('gusaredondo@gmail.com', '$2y$10$7ETmnztSbM28GIOlXuAHxOLjgh/LMBXCIbWzS4YMxMhspM1vrit5W', '2023-04-17 13:03:43'),
	('michelteran49@gmail.com', '$2y$10$JQFNSOtYnnDlQVSuuCOKm.Xpona9r64byXtSBLp/jrQR32TXtxovG', '2023-04-17 15:27:45'),
	('calida0406@hotmail.com', '$2y$10$ow15mTrZfEIRsc8AInVZaufXxqahR4k4LCgQFOlMK10qoeT.i2o3i', '2023-04-17 21:23:44'),
	('Mauritoalcaino@gmail.com', '$2y$10$kgiMgjFoQd/RD5TxEPWdKe/G/cCJEAeXaUB0PCtd1VxjyT91BE1Ra', '2023-04-17 21:35:12'),
	('merlyvilaroaguilar@gmail.com', '$2y$10$vVU3K/eCDZQvk5oZzVp5eeSIcyNQul5r9zxHyiqeBDKmKuyT7HZ62', '2023-04-17 21:51:35'),
	('Diegomoreno2086@gmail.com', '$2y$10$WUiG2DrKRqUl4Ssp6x38NeY8/hv9pr2ko6xtFvLqbBGuKMn.zEUG.', '2023-04-17 22:45:51'),
	('rosauraacevedo26@gmail.com', '$2y$10$u9WSbJ/Prm2A55wIjNK4ou7EDAxPJ6e5NLY1WpXTKKam9ccnmXX1W', '2023-04-17 23:05:57'),
	('lagohermoso2024@gmail.com', '$2y$10$agHeoyeGvp3HbQIwPhmAD.KhmRz06MtLLlHk2fHrlVu2XKU9mdNLK', '2023-04-18 13:04:49'),
	('ligabab@gmail.com', '$2y$10$eTIrVs26Py0yVtvraLo6t.xLnV9jKk5RxyspzdwvFCyR.29qqDcXm', '2023-04-18 22:15:35'),
	('henaoramirezdahianna@gmail.com', '$2y$10$4yyJKEhxl8awBfPZ.JuHje8QTbYoDyQwUQQyatBXtrtX61h/GRWNy', '2023-04-19 04:45:31'),
	('luisrja2011@hotmail.com', '$2y$10$DX7CWT/Cn5J1XmYXLqS4Xu/2jttPY0sttw9nCKUxjvJtXf9VojkoC', '2023-04-19 13:45:02'),
	('luisrja2011@hotmail.com', '$2y$10$K70ZyZYRXNU8YdRFkDQPV.jLGGV6nTt3H1y5.t4U7z3ulN6j014xG', '2023-04-19 13:45:02'),
	('williannysgutierrez821@gmail.com', '$2y$10$0YK1.7VvpFwHI8eKj6aXoOtxBprCukgBnQhxrEIoZy1PS4ugAGeU.', '2023-04-20 11:06:00'),
	('dolphi.dc@gmail.com', '$2y$10$y6tJMSzu0MxQ8IrNH1ommutT4j6NbrGGuAKCLikmjaRaAHZvm0g7.', '2023-04-20 17:48:17'),
	('aguilarraquel327@gmail.com', '$2y$10$vzzM9P9qL6vwWIjP7vPFbOwzKS1QzFB06UhVXDMfYGdbOGu/f6l.C', '2023-04-20 23:15:20'),
	('merecedordetodo25@gmail.com', '$2y$10$e3q5xdfYhhEnfpoC7sFu3u0oAWLNYw4wiVAjLhw.JuFiGqrKdHAtG', '2023-04-21 02:01:51'),
	('levinalina4@gmail.com', '$2y$10$x56mT4bwByc5OU1yyPPhQ.5Y7gDAtwBBmWAN6WrHHmJJoogDxcP/W', '2023-04-21 13:57:23'),
	('pablo371929@hotmail.com', '$2y$10$GM/gG9TE5mtoUJEHdTcAUuVTCOkOLr83UdqAJCmVAaVjZeOejNUL2', '2023-04-21 18:21:04'),
	('eii_david_2014@hotmail.com', '$2y$10$2c1ajIgC/CHQ1d/K5zKiYec8UbC3t5W/rG6UqF/Uquam0wkOCwCyG', '2023-04-22 01:53:11'),
	('sanrocro211rodriguez@gmail.com', '$2y$10$b5ol879XVlJ1/nN/g3d0vueafhxJtkN1l9YZzymo9V5DtAmy3aU/a', '2023-04-22 15:58:42'),
	('sebasguajeh@gmail.com', '$2y$10$ChyxOSxWerEPp5ZHiiTB/OXdHr5/5m81BpmWVZU3VjYvupiOSDzg6', '2023-04-23 02:27:07'),
	('legadospublicidad@gmail.com', '$2y$10$TqEv.osrZmodFfjj0Eni4.SjmFLXItyoCIjOJuBURHjaVjuSOIteq', '2023-04-24 19:03:31'),
	('Lilianaisabel626@gmail.com', '$2y$10$7cOL7/keEsP.kCvHmPgTO.hPc4Kb93b4Zk7rbj6U/WhZRvMNRdme.', '2023-04-24 20:23:18'),
	('marydurandeflores@gmail.com', '$2y$10$emdiv3WEhknlntdZJU9Ldelnsr/99yhTVUXlhGmv1AF0nLQqIiZ3C', '2023-04-25 04:57:20'),
	('camilogelisjinete2008@gmail.com', '$2y$10$MJ9VvigAs.FhLAj/DWlije/RdHaa4gWr/7ZHzkgbX7ufho0yNDlte', '2023-04-26 05:54:08'),
	('Jesusmonterrosa243@gmail.com', '$2y$10$mTBIvo/3EBSixt1bokIaZulhZpn1aaUoZNSUjjmyOt7OG1yL.7s6W', '2023-04-26 18:01:08'),
	('eduardoluisblanco@hotmail', '$2y$10$KKBcH9Dbh7fnGXUerU8bjOzdwFJ1HNB5URHLKBiHekLxjTxWIrmxG', '2023-04-27 01:40:39'),
	('arnol710909@gmail.com', '$2y$10$SX/wO8GvAdn3QZ/GfU18I.C6KKyA33s6HdMaECJOLvoZMWlKaWfG.', '2023-04-27 03:01:38'),
	('alfredoyanez314@gmail.com', '$2y$10$gByTl.ekLyPMM5F3KE4tGeRWFbw3IPNDpdt/AWhsfPJE87B61.Xdu', '2023-04-27 12:39:33'),
	('jorgecanno62@gmail.com', '$2y$10$1fJvLY43GADr/KNC4flG/eCpl6moY2EjW0EM9JANiXBcxpYSqMlqK', '2023-04-27 13:47:37'),
	('bastardo.manuel@gmail.com', '$2y$10$SGZdeaWcXcWuhr555eBJIOEEOXcgsMqfRnKdd2JUUCyZOBedJMv9u', '2023-04-27 16:25:34'),
	('milenasilva2481@gmail.com', '$2y$10$LjMZ4NUlQGczDHypeXuXvOSgfx6KLhURD/E.QpBAWdt5ue11OxINW', '2023-04-27 18:56:06'),
	('albery0729@gmail.com', '$2y$10$YROBmNgUZ890R85OQosRjeboGBN.207/Ulzu8kez/.SYcJDpwJIYG', '2023-04-28 04:04:55'),
	('sarai2825@hotmail.com', '$2y$10$GfFF4dLizWbpwPR4QJRckuQHuA95zs2FBC0mUzj/yUB/XYhviYHHC', '2023-04-28 14:19:40'),
	('arayasevilla@gmail.com', '$2y$10$Y784DSUwIltQBmGvI99WVOG8mM4rrUWWTRaJcbHlsZDkwbRcTUNcS', '2023-04-29 17:21:16'),
	('siriasevilla@gmail.com', '$2y$10$5f4qMRrrTSq2EEx2VItIteE1pnl9ex70CNR4ct6h1pWEvHkjjSYQu', '2023-04-29 21:51:32'),
	('morenogranadaj@gmail.com', '$2y$10$S1hs6ezxAGkpSL0EEtnRlO864kNB63a9VyQGTvO0sAA24DQEyQM8a', '2023-04-30 00:24:30'),
	('magdielruidiaz193@gmail.com', '$2y$10$IbGPKrjQ8M7gv0JXAcqWHuz/YcB4/ad6uU/y5soP5HbZ6enT2C8/K', '2023-04-30 00:56:46'),
	('siriaodette11@gmail.com', '$2y$10$e9a7fqKFqLVSthByl5AhF.dtypNwEzqtA5njdy7kZR8lgzjCDHUWK', '2023-04-30 09:19:45'),
	('clizaidacoadecapriata@gmail.com', '$2y$10$41PrLEOgH6pDTzpAFSWHXOQr1WQU.2Wmo.egrmLzvjHdAPLguO05i', '2023-05-03 13:21:20'),
	('kurbaez44@gmail.com', '$2y$10$uktypddqDrN..7BhFQ5bZ.NL0Y.RiI0MmYDGEg8fp71/DU0QATMPy', '2023-05-03 22:44:14'),
	('quinterogaviria2002@gmail.com', '$2y$10$euEIouw0XteGc3auqadV.u9ZLsrZZEQaeFqx6RgImM/DOLD.ZT/cu', '2023-05-03 23:45:31'),
	('yoselynpineda00@gmail.com', '$2y$10$F3kjJ38ZyIhnx31TUOCEwOicPRA4OG3aXVxEvAxuXsIDT1AtvBM1q', '2023-05-04 22:26:57'),
	('yamicomico@gmail.com', '$2y$10$6VW8FVo5VcmVga5st1dI0OJs.KrHPXax7roHv8m3V0NYSSjjKEjbW', '2023-05-05 01:11:16'),
	('rpeley21@gmail.com', '$2y$10$aP1yH6DC0yD2XSFSP1Uzzu46t6uAGmzsVL6NBr1SF6jLglPoDNIb6', '2023-05-05 13:49:54'),
	('solid110682@yahoo.es', '$2y$10$MtWbT4aEBZo/vKP2LuP5MeTPu6oYXhcG7bM7qTtHLbJXORO9pRkC2', '2023-05-05 18:15:44'),
	('alvarezgarciaalejandra176@gmail.com', '$2y$10$td4wm54/pjS2VRseKgQnC.qhoxT1/OAHI/R/hxTE/v9XzTh3vBPfS', '2023-05-06 03:10:18'),
	('azumytamimo00@gmail.com', '$2y$10$AphY8pS0.hz1OlC94LXMTePEloylNMc64uD7CHxt3lAvOw6rZfPhW', '2023-05-09 02:20:08'),
	('alejismartinez123@gmail.com', '$2y$10$.XgTkc.AXCmxA6YGwqLVLOLMMusi2i.Gm8xaSrjmRd7KhKhjoKMjW', '2023-05-10 16:06:02'),
	('mileidisserrano21@gmail.com', '$2y$10$Tz1vALrhPciFg2xNR9zjIOuwv6NawncY4GS4Pg.g79t8QLZ/nDNPW', '2023-05-17 04:37:59'),
	('Dianacarolinamorenoparada@gmail.com', '$2y$10$Lp3R6yi28Jy/OoqQUewVueLtVj3v/TnF5oF/GANKFgXoB1FCd7pEi', '2023-05-19 11:51:39'),
	('joselinrosmaryjaimesparada@gmail.com', '$2y$10$5sdqqCDX2IRoy4H7p7NqSu6QVsg1ku88rPhrhllXtbDa65Pk70zwG', '2023-05-19 12:19:16'),
	('dannamilena89@gmail.com', '$2y$10$2bWR0clVu5LojRRrn1rVIOaiPd0TzdMRhlJMlpe703vxDU/EymAYK', '2023-05-21 03:13:56');

-- Volcando estructura para tabla network_eyngel.personal_access_tokens
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla network_eyngel.personal_access_tokens: ~0 rows (aproximadamente)

-- Volcando estructura para tabla network_eyngel.post_action
CREATE TABLE IF NOT EXISTS `post_action` (
  `poac_id` int(11) NOT NULL AUTO_INCREMENT,
  `poac_id_user` int(11) NOT NULL,
  `poac_id_post` int(11) NOT NULL,
  `poac_action` int(11) NOT NULL,
  `poac_timestamp` timestamp NULL DEFAULT NULL,
  `poac_check` int(11) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`poac_id`)
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Volcando datos para la tabla network_eyngel.post_action: ~0 rows (aproximadamente)
INSERT IGNORE INTO `post_action` (`poac_id`, `poac_id_user`, `poac_id_post`, `poac_action`, `poac_timestamp`, `poac_check`, `created_at`, `updated_at`) VALUES
	(81, 18034, 54, 1, '2023-07-10 03:07:32', 0, '2023-07-10 03:07:32', '2023-07-10 03:07:32'),
	(82, 18034, 52, 1, '2023-07-10 03:07:39', 0, '2023-07-10 03:07:39', '2023-07-10 03:07:39'),
	(83, 18034, 53, 1, '2023-07-10 03:07:43', 0, '2023-07-10 03:07:43', '2023-07-10 03:07:43');

-- Volcando estructura para tabla network_eyngel.post_comment
CREATE TABLE IF NOT EXISTS `post_comment` (
  `poc_id` int(11) NOT NULL AUTO_INCREMENT,
  `poc_id_post` int(11) NOT NULL DEFAULT 0,
  `poc_id_user` int(11) NOT NULL DEFAULT 0,
  `poc_comment` text NOT NULL,
  `poc_timestamp` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`poc_id`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Volcando datos para la tabla network_eyngel.post_comment: ~0 rows (aproximadamente)
INSERT IGNORE INTO `post_comment` (`poc_id`, `poc_id_post`, `poc_id_user`, `poc_comment`, `poc_timestamp`, `created_at`, `updated_at`) VALUES
	(56, 54, 18034, 'Hello world', '2023-07-10 02:49:48', '2023-07-10 02:49:48', '2023-07-10 02:49:48'),
	(57, 54, 18034, 'Hello mister', '2023-07-10 02:50:38', '2023-07-10 02:50:38', '2023-07-10 02:50:38'),
	(58, 54, 18034, 'El crack iñigo martinez', '2023-07-10 02:56:51', '2023-07-10 02:56:51', '2023-07-10 02:56:51'),
	(59, 52, 18034, 'ahora si?', '2023-07-10 03:07:02', '2023-07-10 03:07:02', '2023-07-10 03:07:02');

-- Volcando estructura para tabla network_eyngel.post_user
CREATE TABLE IF NOT EXISTS `post_user` (
  `pu_id` int(11) NOT NULL AUTO_INCREMENT,
  `pu_id_user` int(11) NOT NULL DEFAULT 0,
  `pu_descripcion` text NOT NULL,
  `pu_file` text NOT NULL,
  `pu_extension` varchar(50) NOT NULL DEFAULT '',
  `pu_timestamp` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`pu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Volcando datos para la tabla network_eyngel.post_user: ~4 rows (aproximadamente)
INSERT IGNORE INTO `post_user` (`pu_id`, `pu_id_user`, `pu_descripcion`, `pu_file`, `pu_extension`, `pu_timestamp`, `created_at`, `updated_at`) VALUES
	(52, 18034, 'Fichaje de Inago Martinez por el FC Barcelona', 'img/1688955450-358126871_820137499468275_67845755467176327_n.jpg', 'jpg', '2023-07-10 02:17:31', '2023-07-10 02:17:31', '2023-07-10 02:17:31'),
	(53, 18034, 'Button animation html y css', 'videos/1688955478-0614(1).mp4', 'mp4', '2023-07-10 02:17:58', '2023-07-10 02:17:58', '2023-07-10 02:17:58'),
	(54, 18034, 'Propiedad aspect radio', 'videos/1688956126-0630.mp4', 'mp4', '2023-07-10 02:28:46', '2023-07-10 02:28:46', '2023-07-10 02:28:46');

-- Volcando estructura para tabla network_eyngel.seguidores
CREATE TABLE IF NOT EXISTS `seguidores` (
  `seguido_id_users` int(11) NOT NULL,
  `seguidor_id_users` int(11) NOT NULL,
  `seguidor_timestamp` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Volcando datos para la tabla network_eyngel.seguidores: ~0 rows (aproximadamente)
INSERT IGNORE INTO `seguidores` (`seguido_id_users`, `seguidor_id_users`, `seguidor_timestamp`, `created_at`, `updated_at`) VALUES
	(18035, 18034, '2023-07-10 02:02:45', '2023-07-10 02:02:45', '2023-07-10 02:02:45');

-- Volcando estructura para tabla network_eyngel.tokens_count
CREATE TABLE IF NOT EXISTS `tokens_count` (
  `toc_id` int(11) NOT NULL AUTO_INCREMENT,
  `toc_post_video` int(11) NOT NULL,
  `toc_id_user` int(11) NOT NULL,
  `toc_id_por_video` double DEFAULT 0,
  `toc_fecha` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`toc_id`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Volcando datos para la tabla network_eyngel.tokens_count: ~0 rows (aproximadamente)
INSERT IGNORE INTO `tokens_count` (`toc_id`, `toc_post_video`, `toc_id_user`, `toc_id_por_video`, `toc_fecha`, `created_at`, `updated_at`) VALUES
	(54, 53, 18034, 0.5, '2023-07-09', '2023-07-10 02:20:45', '2023-07-10 02:20:45'),
	(55, 53, 18034, 0.5, '2023-07-09', '2023-07-10 02:21:24', '2023-07-10 02:21:24'),
	(56, 54, 18034, 0.5, '2023-07-09', '2023-07-10 02:28:51', '2023-07-10 02:28:51'),
	(57, 54, 18034, 0.5, '2023-07-09', '2023-07-10 02:32:33', '2023-07-10 02:32:33');

-- Volcando estructura para tabla network_eyngel.t_empresa
CREATE TABLE IF NOT EXISTS `t_empresa` (
  `t_id` int(11) NOT NULL AUTO_INCREMENT,
  `t_nombre` varchar(200) NOT NULL,
  `t_eslogan` varchar(200) NOT NULL,
  `t_descripcion` text NOT NULL,
  `t_direccion` varchar(150) NOT NULL,
  `t_telefono` varchar(11) NOT NULL,
  `t_correo` varchar(100) DEFAULT NULL,
  `t_img_logo` varchar(255) NOT NULL,
  `t_enlace` varchar(255) NOT NULL,
  `t_id_pais` int(11) NOT NULL,
  `t_estado` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`t_id`),
  KEY `FK_t_empresa_pais` (`t_id_pais`),
  CONSTRAINT `FK_t_empresa_pais` FOREIGN KEY (`t_id_pais`) REFERENCES `pais` (`pa_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Volcando datos para la tabla network_eyngel.t_empresa: ~5 rows (aproximadamente)
INSERT IGNORE INTO `t_empresa` (`t_id`, `t_nombre`, `t_eslogan`, `t_descripcion`, `t_direccion`, `t_telefono`, `t_correo`, `t_img_logo`, `t_enlace`, `t_id_pais`, `t_estado`, `created_at`, `updated_at`) VALUES
	(4, 'Robotic Foundation', '', 'En este ejemplo, $texto contiene la cadena de texto original. Luego, utilizamos str_replace() para reemplazar la palabra "ejemplo" por "nuevo" en la variable $texto. El resultado se guarda en la varia', 'Calle 29 16 bis 32', '3223342408', 'roboticfunda@gmail.com', 'images/tienda/logo/2D-CON-FONDO-TRANSPARENTE-FULL-COLOR_.webp', 'https://roboticfunda.com/', 41, 1, '2023-06-09 03:44:31', '2023-06-08 20:19:59'),
	(5, 'prueba', '', '<p>En este ejemplo, <code>$texto</code> contiene la cadena de texto original. Luego, utilizamos <code>str_replace()</code> para reemplazar la palabra &quot;ejemplo&quot; por &quot;nuevo&quot; en la variable <code>$texto</code>. El resultado se guarda en la variable <code>$textoModificado</code>. Finalmente, se imprime el texto modificado.</p>\r\n\r\n<p>El resultado de este ejemplo ser&iacute;a: &quot;Este es un nuevo de cadena de texto.&quot;.</p>\r\n\r\n<p>Puedes ajustar los valores de las cadenas de b&uacute;squeda y reemplazo seg&uacute;n tus necesidades. Adem&aacute;s, ten en cuenta que <code>str_replace()</code> realiza reemplazos exactos, es decir, distingue entre may&uacute;sculas y min&uacute;sculas. Si deseas realizar un reemplazo sin distinguir entre may&uacute;sculas y min&uacute;sculas, puedes usar la funci&oacute;n <code>str_ireplace()</code> en su lugar.</p>', 'ajdklajsdklas', '121212', 'maico@gmail.com', 'images/tienda/logo/D_NQ_NP_848270-MCO43042584967_082020-O.webp', 'http://127.0.0.1:8000/admin/tienda/crear-empresa', 2, 1, '2023-06-09 03:48:01', '2023-06-09 03:48:01'),
	(6, 'realme', '', '<p>Tienda de telefono REALME</p>', 'sin marcar', '11111', 'notengoidea@gmail.com', 'images/tienda/logo/logo20211603165244.jpg', 'https://tienda.mercadolibre.com.co/realme', 41, 1, '2023-06-12 15:55:01', '2023-06-12 15:55:01'),
	(7, 'Huawei', '', '<p>Huawei CHINA</p>', 'no identificada', '111222', 'huawei@huwaei.com', 'images/tienda/logo/logo20220903205837.jpg', 'https://tienda.mercadolibre.com.co/huawei', 41, 1, '2023-06-12 16:04:56', '2023-06-12 16:04:56'),
	(8, 'Xiaomi', '', '<p>XIAOMI</p>', 'no identificada', '112233', 'xiaomi@gmail.com', 'images/tienda/logo/logo20220507163203.jpg', 'https://tienda.mercadolibre.com.co/xiaomi', 41, 1, '2023-06-12 16:06:02', '2023-06-12 16:06:02');

-- Volcando estructura para tabla network_eyngel.t_producto
CREATE TABLE IF NOT EXISTS `t_producto` (
  `tp_id` int(11) NOT NULL AUTO_INCREMENT,
  `tp_id_empresa` int(11) NOT NULL DEFAULT 0,
  `tp_nombre` text NOT NULL,
  `tp_descripcion` text NOT NULL,
  `tp_precio` double NOT NULL DEFAULT 0,
  `tp_enlace_producto` text DEFAULT NULL,
  `tp_imagen` text NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`tp_id`) USING BTREE,
  KEY `FK_t_producto_t_empresa` (`tp_id_empresa`),
  CONSTRAINT `FK_t_producto_t_empresa` FOREIGN KEY (`tp_id_empresa`) REFERENCES `t_empresa` (`t_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Volcando datos para la tabla network_eyngel.t_producto: ~4 rows (aproximadamente)
INSERT IGNORE INTO `t_producto` (`tp_id`, `tp_id_empresa`, `tp_nombre`, `tp_descripcion`, `tp_precio`, `tp_enlace_producto`, `tp_imagen`, `created_at`, `updated_at`) VALUES
	(8, 4, 'resistencia 220 ohm', '<p>jasdhasjkdaskjdh jkhadkjashkjdsa sakjdaskjdajskhaskdj</p>', 100, 'http://127.0.0.1:8000/admin/tienda/crear-producto/Robotic%20Foundation', 'images/productos/ESQUEMA 1 inicial Proyecto Fertirriego.png', '2023-06-09 02:50:21', '2023-06-09 02:50:21'),
	(10, 4, 'Modulo Sensor De Luz Iluminacion Fotorresistencia Arduino', '<p>Ofertas y Promociones en nuestra pagina<br />\r\nSomos Demoss Prototipado SAS en Popay&aacute;n<br />\r\n<br />\r\nDescripci&oacute;n:<br />\r\nM&oacute;dulo Sensor de luz (iluminaci&oacute;n) fotosensible a la luz, el cual contiene una perilla para controlar el umbral de activaci&oacute;n del sensor, la salida se puede conectar directamente al microcontrolador o tarjeta arduino o la salida puede activar directamente un modulo rele.<br />\r\n<br />\r\nSensor de Luz<br />\r\nVoltaje: 3.3V a 5 V<br />\r\nSalida: Digital<br />\r\nTama&ntilde;o: 3.2 x 1.4 cm<br />\r\n<br />\r\nTu compra incluye<br />\r\nModulo Fotorresistencia Sensor de Luz Arduino x 1<br />\r\n<br />\r\nsi necesitas mas componentes los puedes encontrar en este enlace<br />\r\nhttps://listado.mercadolibre.com.co/_CustId_346566872</p>', 6450, 'https://articulo.mercadolibre.com.co/MCO-505397673-modulo-sensor-de-luz-iluminacion-fotorresistencia-arduino-_JM#reco_item_pos=5&reco_backend=machinalis-seller-items&reco_backend_type=low_level&reco_client=vip-seller_items-above&reco_id=33abe624-7f15-4894-a58d-ef63b8b0cc03', 'images/productos/D_NQ_NP_885323-MCO31557860079_072019-O.webp', '2023-06-09 03:05:17', '2023-06-09 03:05:17'),
	(13, 4, 'Modulo I2c Para Display', '<p>Ofertas y Promociones en nuestra pagina<br />\r\nSomos Demoss Prototipado SAS en Popay&aacute;n<br />\r\n<br />\r\nPor lo general un display LCD 16X2 o 20x4 requiere de 6 E/S digitales para su funcionamiento, pero con este fant&aacute;stico m&oacute;dulo &uacute;nicamente ser&aacute; necesario utilizar 2 E/S que soporten comunicaci&oacute;n I2C. Ahorr&aacute;ndote tiempo y recursos. Es compatible con todas las tarjetas Arduino y microcontroladores con interfaz I2C.(No incluye la pantalla LCD)<br />\r\n<br />\r\n<br />\r\nNecesitas m&aacute;s componentes y pagar un solo envi&oacute;? encu&eacute;ntralos en este enlace<br />\r\n<br />\r\nhttps://listado.mercadolibre.com.co/_CustId_346566872</p>', 9630, 'https://articulo.mercadolibre.com.co/MCO-575140549-modulo-i2c-para-display-16x2-20x4-_JM#reco_item_pos=2&reco_backend=machinalis-homes&reco_backend_type=function&reco_client=home_navigation-recommendations&reco_id=7bda33f2-86af-4216-b831-d69751429045&c_id=/home/navigation-recommendations/element&c_element_order=3&c_uid=22cc7046-f9d5-494f-94c6-d39ffe7fb19a', 'images/productos/D_NQ_NP_848270-MCO43042584967_082020-O.webp', '2023-06-09 03:28:04', '2023-06-09 03:04:46'),
	(14, 5, 'asddasda', '<p>En este ejemplo, <code>$texto</code> contiene la cadena de texto original. Luego, utilizamos <code>str_replace()</code> para reemplazar la palabra &quot;ejemplo&quot; por &quot;nuevo&quot; en la variable <code>$texto</code>. El resultado se guarda en la variable <code>$textoModificado</code>. Finalmente, se imprime el texto modificado.</p>\r\n\r\n<p>El resultado de este ejemplo ser&iacute;a: &quot;Este es un nuevo de cadena de texto.&quot;.</p>\r\n\r\n<p>Puedes ajustar los valores de las cadenas de b&uacute;squeda y reemplazo seg&uacute;n tus necesidades. Adem&aacute;s, ten en cuenta que <code>str_replace()</code> realiza reemplazos exactos, es decir, distingue entre may&uacute;sculas y min&uacute;sculas. Si deseas realizar un reemplazo sin distinguir entre may&uacute;sculas y min&uacute;sculas, puedes usar la funci&oacute;n <code>str_ireplace()</code> en su lugar.</p>', 1222, 'http://127.0.0.1:8000/admin/tienda/crear-producto/prueba', 'images/productos/D_NQ_NP_848270-MCO43042584967_082020-O.webp', '2023-06-09 03:48:22', '2023-06-09 03:48:22');

-- Volcando estructura para tabla network_eyngel.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `u_nombre` varchar(255) NOT NULL,
  `u_apellido` varchar(255) NOT NULL,
  `u_nombre_usuario` varchar(255) DEFAULT NULL,
  `u_descripcion_perfil` varchar(250) DEFAULT '',
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `password` varchar(255) NOT NULL,
  `u_sexo` varchar(1) NOT NULL,
  `u_ciudad_residencia` varchar(100) DEFAULT NULL,
  `u_fecha_nacimiento` date DEFAULT NULL,
  `u_tokens` double NOT NULL,
  `u_role` int(11) NOT NULL DEFAULT 0,
  `u_estado` int(11) NOT NULL DEFAULT 1,
  `u_session_id` text DEFAULT NULL,
  `u_ultima_conexion` timestamp NULL DEFAULT NULL,
  `u_img_profile` text DEFAULT NULL,
  `u_term_con` int(11) NOT NULL DEFAULT 0,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  KEY `FK_users_estado` (`u_estado`),
  CONSTRAINT `FK_users_estado` FOREIGN KEY (`u_estado`) REFERENCES `estado` (`est_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18036 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla network_eyngel.users: ~1 rows (aproximadamente)
INSERT IGNORE INTO `users` (`id`, `u_nombre`, `u_apellido`, `u_nombre_usuario`, `u_descripcion_perfil`, `email`, `email_verified_at`, `password`, `u_sexo`, `u_ciudad_residencia`, `u_fecha_nacimiento`, `u_tokens`, `u_role`, `u_estado`, `u_session_id`, `u_ultima_conexion`, `u_img_profile`, `u_term_con`, `remember_token`, `created_at`, `updated_at`) VALUES
	(18034, 'Michael', 'Rodriguez Hernandez', 'michaelrodriguez.hernandez1', 'FC barcelona.', 'maicolr62@gmail.com', '2023-07-10 01:56:34', '$2y$10$Iwl1wpKeWnvvAycekvQOQuH0Nu.GHWXDGkAI1a9WxODMrJ2pPQZg2', 'H', 'Yopal', '2000-11-26', 0, 0, 1, NULL, NULL, 'images/img-profile-minccy/1688953374-michaelrodriguez.hernandez-IMG_20230503_191435.jpg', 1, NULL, '2023-07-10 01:42:34', '2023-07-10 01:56:34'),
	(18035, 'Michael', 'Rodriguez Hernandez', 'michaelrodriguez.hernandez', '', 'maicolh474@gmail.com', '2023-07-10 02:02:37', '$2y$10$Zy7ft5AH70sl9mtMD6hfnuOO62O66OCVTinwjItMbrRJSxzD5tQBO', 'H', NULL, '2000-11-26', 0, 0, 1, NULL, NULL, NULL, 1, NULL, '2023-07-10 02:02:37', '2023-07-10 02:02:37');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
