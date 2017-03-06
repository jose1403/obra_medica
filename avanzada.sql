-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jun 07, 2016 at 02:10 AM
-- Server version: 5.5.49-0ubuntu0.14.04.1
-- PHP Version: 5.5.9-1ubuntu4.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `avanzada`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--
-- Creation: Jun 07, 2016 at 03:18 AM
--

CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--
-- Creation: Jun 07, 2016 at 03:18 AM
--

CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--
-- Creation: Jun 07, 2016 at 03:18 AM
--

CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_01ab375a_uniq` (`content_type_id`,`codename`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=34 ;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can add permission', 2, 'add_permission'),
(5, 'Can change permission', 2, 'change_permission'),
(6, 'Can delete permission', 2, 'delete_permission'),
(7, 'Can add group', 3, 'add_group'),
(8, 'Can change group', 3, 'change_group'),
(9, 'Can delete group', 3, 'delete_group'),
(10, 'Can add user', 4, 'add_user'),
(11, 'Can change user', 4, 'change_user'),
(12, 'Can delete user', 4, 'delete_user'),
(13, 'Can add content type', 5, 'add_contenttype'),
(14, 'Can change content type', 5, 'change_contenttype'),
(15, 'Can delete content type', 5, 'delete_contenttype'),
(16, 'Can add session', 6, 'add_session'),
(17, 'Can change session', 6, 'change_session'),
(18, 'Can delete session', 6, 'delete_session'),
(19, 'Can add publicaciones', 7, 'add_publicaciones'),
(20, 'Can change publicaciones', 7, 'change_publicaciones'),
(21, 'Can delete publicaciones', 7, 'delete_publicaciones'),
(22, 'Can add productos', 8, 'add_productos'),
(23, 'Can change productos', 8, 'change_productos'),
(24, 'Can delete productos', 8, 'delete_productos'),
(25, 'Can add testimonios', 9, 'add_testimonios'),
(26, 'Can change testimonios', 9, 'change_testimonios'),
(27, 'Can delete testimonios', 9, 'delete_testimonios'),
(28, 'Can add visitas', 10, 'add_visitas'),
(29, 'Can change visitas', 10, 'change_visitas'),
(30, 'Can delete visitas', 10, 'delete_visitas'),
(31, 'Can add usuario perfil', 11, 'add_usuarioperfil'),
(32, 'Can change usuario perfil', 11, 'change_usuarioperfil'),
(33, 'Can delete usuario perfil', 11, 'delete_usuarioperfil');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--
-- Creation: Jun 07, 2016 at 03:18 AM
--

CREATE TABLE IF NOT EXISTS `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$24000$bJoIwQd47fSC$q1sodmeawx+rtO5Fe4NEYQ2HJqFQSoDmwYMkXOXADys=', '2016-06-07 04:49:22', 1, 'asael', '', '', 'undajesusdavid@gmail.com', 1, 1, '2016-06-07 03:20:02');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--
-- Creation: Jun 07, 2016 at 03:18 AM
--

CREATE TABLE IF NOT EXISTS `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--
-- Creation: Jun 07, 2016 at 03:18 AM
--

CREATE TABLE IF NOT EXISTS `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_perm_permission_id_1fbb5f2c_fk_auth_permission_id` (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--
-- Creation: Jun 07, 2016 at 03:18 AM
--

CREATE TABLE IF NOT EXISTS `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2016-06-07 05:15:32', '1', 'Fibra Vital', 1, 'Añadido.', 8, 1),
(2, '2016-06-07 05:18:17', '2', 'Jiaogulan', 1, 'Añadido.', 8, 1),
(3, '2016-06-07 05:21:07', '3', 'Resveratrol', 1, 'Añadido.', 8, 1),
(4, '2016-06-07 05:23:33', '4', 'Lecitina de Soja', 1, 'Añadido.', 8, 1),
(5, '2016-06-07 05:26:05', '5', 'Masajeador Capilar', 1, 'Añadido.', 8, 1),
(6, '2016-06-07 05:35:11', '1', 'Como Quitar Manchas de Acne', 1, 'Añadido.', 7, 1),
(7, '2016-06-07 05:41:19', '2', 'Como Limpiar la Cara de Espinillas', 1, 'Añadido.', 7, 1),
(8, '2016-06-07 05:46:54', '3', 'Palpitaciones: a que se debe y como tratarlas', 1, 'Añadido.', 7, 1),
(9, '2016-06-07 06:01:30', '4', 'Como Limpiar el Colon Naturalmente', 1, 'Añadido.', 7, 1),
(10, '2016-06-07 06:07:58', '5', 'Como Acelera tu Metabolismo para bajar de peso', 1, 'Añadido.', 7, 1);

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--
-- Creation: Jun 07, 2016 at 03:18 AM
--

CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=12 ;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(8, 'principal', 'productos'),
(7, 'principal', 'publicaciones'),
(9, 'principal', 'testimonios'),
(10, 'principal', 'visitas'),
(6, 'sessions', 'session'),
(11, 'usuario', 'usuarioperfil');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--
-- Creation: Jun 07, 2016 at 03:18 AM
--

CREATE TABLE IF NOT EXISTS `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=32 ;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2016-06-07 03:18:09'),
(2, 'auth', '0001_initial', '2016-06-07 03:18:11'),
(3, 'admin', '0001_initial', '2016-06-07 03:18:12'),
(4, 'admin', '0002_logentry_remove_auto_add', '2016-06-07 03:18:12'),
(5, 'contenttypes', '0002_remove_content_type_name', '2016-06-07 03:18:12'),
(6, 'auth', '0002_alter_permission_name_max_length', '2016-06-07 03:18:13'),
(7, 'auth', '0003_alter_user_email_max_length', '2016-06-07 03:18:13'),
(8, 'auth', '0004_alter_user_username_opts', '2016-06-07 03:18:13'),
(9, 'auth', '0005_alter_user_last_login_null', '2016-06-07 03:18:13'),
(10, 'auth', '0006_require_contenttypes_0002', '2016-06-07 03:18:13'),
(11, 'auth', '0007_alter_validators_add_error_messages', '2016-06-07 03:18:13'),
(12, 'principal', '0001_initial', '2016-06-07 03:18:13'),
(13, 'principal', '0002_auto_20160429_0332', '2016-06-07 03:18:14'),
(14, 'principal', '0003_publicaciones', '2016-06-07 03:18:14'),
(15, 'principal', '0004_productos', '2016-06-07 03:18:14'),
(16, 'principal', '0005_delete_productos', '2016-06-07 03:18:14'),
(17, 'principal', '0006_productos', '2016-06-07 03:18:14'),
(18, 'principal', '0007_testimonios', '2016-06-07 03:18:14'),
(19, 'principal', '0008_testimonios_habilitado', '2016-06-07 03:18:15'),
(20, 'principal', '0009_auto_20160504_1322', '2016-06-07 03:18:15'),
(21, 'principal', '0010_auto_20160504_1522', '2016-06-07 03:18:15'),
(22, 'principal', '0011_auto_20160513_0302', '2016-06-07 03:18:15'),
(23, 'principal', '0012_publicaciones', '2016-06-07 03:18:16'),
(24, 'principal', '0013_auto_20160513_0354', '2016-06-07 03:18:16'),
(25, 'principal', '0014_auto_20160517_1118', '2016-06-07 03:18:17'),
(26, 'principal', '0015_auto_20160518_1207', '2016-06-07 03:18:17'),
(27, 'principal', '0016_productos', '2016-06-07 03:18:17'),
(28, 'principal', '0017_auto_20160518_1225', '2016-06-07 03:18:17'),
(29, 'principal', '0018_auto_20160523_1232', '2016-06-07 03:18:17'),
(30, 'principal', '0019_auto_20160523_1241', '2016-06-07 03:18:18'),
(31, 'sessions', '0001_initial', '2016-06-07 03:18:18');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--
-- Creation: Jun 07, 2016 at 03:18 AM
--

CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_de54fa62` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('esufcr5cbdkpf1me8ep13l5og0vsjnth', 'MjgyMDBiYTYzZDkwY2Y4MTQxNDIyYTRhYTEzYTUzMTQ2MDEwOWJmZDp7Il9hdXRoX3VzZXJfaGFzaCI6IjdjMTlkZmQ3ZWEyYjE0NjI0MzNlZmFmZTY5YjYzODQ2Y2QwYjVjMmUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2016-06-21 04:49:23');

-- --------------------------------------------------------

--
-- Table structure for table `principal_productos`
--
-- Creation: Jun 07, 2016 at 03:18 AM
--

CREATE TABLE IF NOT EXISTS `principal_productos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `imagen` varchar(100) NOT NULL,
  `descripcion` longtext NOT NULL,
  `disponible` tinyint(1) NOT NULL,
  `fecha_de_agregado` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre` (`nombre`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `principal_productos`
--

INSERT INTO `principal_productos` (`id`, `nombre`, `imagen`, `descripcion`, `disponible`, `fecha_de_agregado`) VALUES
(1, 'Fibra Vital', 'productos/fibra.JPG', '<p>La fibra alimentaria se puede definir como la parte comestible de las plantas que resiste la digest&iacute;on y absorci&oacute;n en el intestino delgado humano y que experimenta una fermentacion parcial o total en el intestino grueso Esta parte vegetal est&aacute; formada por un conjunto de compuestos qu&iacute;micos de naturaleza heterog&eacute;nea (polisacaridos, oligosacaridos, liqnina y sustancias an&aacute;logas). Desde el punto de vista nutrional, y en sentido estricto, la fibra alimentaria no es un nutriente, ya que no participa directamente en procesos metabolicos b&aacute;sicos del organismo. No obstante, la fibra alimentaria desempe&ntilde;a funciones fisiol&oacute;gicas sumamente importantes como estimular la peristalisis intestinal. La raz&oacute;n por la que el organismo humano no puede procesarla se debe a que el aparato digestivo no dispone de las enzimas que pueden hidrolizarla. Esto no significa que la fibra alimentaria pase intacta a trav&eacute;s del aparato digestivo: aunque el intestino no dispone de enzimas para digerirla, las enzimas de la flora bacteriana fermentan parcialmente la fibra y la descomponen en diversos compuestos qu&iacute;micos: gases (hidr&oacute;geno, dioxido de carbono y metano) y &aacute;cidos grasos de cadena corta (acetato, propionato y butirato. &Eacute;stos &uacute;ltimos pueden ejercer una funci&oacute;n importante en el organismo de los seres vivos. La fibra diet&eacute;tica se encuentra &uacute;nicamente en alimentos de origen vegetal poco procesados tecnol&oacute;gicamente, como los cereales, frutas, verduras y legumbres.</p>', 1, '2016-06-07 05:15:32'),
(2, 'Jiaogulan', 'productos/jiaogulan.jpg', '<p>El Jiaogulan es de gran eficacia para eliminar toxinas del cuerpo, por lo que se recomienda tomar como bebida regular.</p>\r\n<p>La planta de Jiaogulan pertenece a la familia de las Cucurbit&aacute;ceas (pepino).</p>\r\n<p>Es una planta trepadora.</p>\r\n<p class="MsoNormal">Nuestro Jiaogulan se cultiva en el Norte de Tailandia, dentro de la m&aacute;s grande&nbsp;regi&oacute;n agr&iacute;cola del pa&iacute;s conocido por sus suelos muy f&eacute;rtiles y su aire fresco.</p>\r\n<p class="MsoNormal">El Jiaogulan es un Adaptog&eacute;nico potente que ayuda el cuerpo a autoregularse en caso de exceso o de deficiencia y sus propiedades&nbsp;naturales&nbsp;son un gran complemento&nbsp;de la presi&oacute;n arterial, de la hepatitis&nbsp;y del h&iacute;gado&nbsp;deficiente,&nbsp;del colesterol&nbsp;y de los espasmos musculares. Se dice que es el sustituto natural del Ginseng debido a su disponibilidad y a su precio muy razonable.</p>\r\n<p>&nbsp;Es un excelente anti-oxidante que ha sido ampliamente investigado en China, Jap&oacute;n y Tailandia. En estos pa&iacute;ses asi&aacute;ticos, su uso se ha extendido como bebida diaria" compensadora&rdquo;, debido a sus cualidades adaptog&eacute;nicas. Entre sus beneficios, se listan mejoras de la funci&oacute;n card&iacute;aca, enfermedades hep&aacute;ticas, presi&oacute;n arterial, bronquitis, reducci&oacute;n de los niveles de colesterol, arteriosclerosis y derrame cerebral, refuerza el sistema inmunitario e inhibe el crecimiento cancer&iacute;geno celular.&nbsp; </p>\r\n<p>El&nbsp;Jiaogulan&nbsp;tambi&eacute;n se recomienda para&nbsp;personas con problemas circulatorios.<br /> Por &uacute;ltimo,&nbsp;puede acompa&ntilde;ar a los tratamientos&nbsp;en el c&aacute;ncer&nbsp;y la diabetes&nbsp;(milletus).</p>', 1, '2016-06-07 05:18:17'),
(3, 'Resveratrol', 'productos/resveratrol_250.jpg', '<p>El <strong>Resveratrol</strong> es un antioxidante que se encuentra en varias plantas y especialmente en la piel de las uvas rojas, las grosellas, las moras y los cacahuetes.</p>\r\n<p>Se elaboran c&aacute;psulas en diferentes dosis, como sustancia &uacute;nica o juntamente con otros componentes, tambi&eacute;n se elaboran cosm&eacute;ticos con este ingrediente.</p>\r\n<div class="mceTemp" style="float: left;"><dl><dt></dt></dl></div>\r\n<p>Los estudios cient&iacute;ficos demuestran que esta puede ser una de las sustancias mas eficaces que provienen de extractos de plantas, para mejorar la salud.</p>\r\n<p>En definitiva ,se trata de una sustancia extra&iacute;da principalmente del vino tinto pero la cantidad var&iacute;a dependiendo del lugar donde se cultivan las uvas, el tiempo de la cosecha, y otros factores. Despu&eacute;s de a&ntilde;os de investigaci&oacute;n, disponemos es un extracto estandarizado <strong>Resveratrol &nbsp;</strong>como suplemento diet&eacute;tico.</p>\r\n<p>Lo que nos indica que cantidad de <strong>resveratrol</strong> debemos tomar seg&uacute;n las funciones que esperamos de el.</p>\r\n<p>&nbsp;</p>\r\n<p>Seg&uacute;n las investigaciones existen tambi&eacute;n varias formas de esta mol&eacute;cula, la mas activa y la que recomendamos cuando tomamos un suplemento es la forma TRANS.</p>\r\n<p><strong>El resveratrol, </strong>o estos extractos de uva contienen toda una gama de polifenoles que son naturalmente contenidos en el vino tinto, como proanthocyandins, antocianinas, flavonoides, que son los que le dan las propiedades a esta mol&eacute;cula.</p>', 1, '2016-06-07 05:21:07'),
(4, 'Lecitina de Soja', 'productos/lecitina.jpg', '<p><strong>La lecitina de soja es considerada</strong> actualmente como un complemento alimenticio muy beneficioso, estudios realizados en el a&ntilde;o 1972 demostraron que el uso regular de la lecitina de soja beneficiaba la recuperaci&oacute;n de pacientes que hab&iacute;an sufrido lesiones cerebrales. Posteriormente se descubri&oacute; su eficacia para tratar afecciones card&iacute;acas y alteraciones del sistema nervioso.</p>\r\n<p>&nbsp;</p>\r\n<p>El nombre de la <strong>lecitina se deriva</strong> de la palabra griega Lekigos que traduce yema de huevo ya que ese fue el lugar en la cual fue descubierta por primera vez. La lecitina est&aacute; formada principalmente por colina, fosfol&iacute;pidos y &aacute;cidos grasos y su apariencia es de color amarillo o marr&oacute;n debido a la mezcla de las sustancias grasas que la conforman.</p>', 1, '2016-06-07 05:23:33'),
(5, 'Masajeador Capilar', 'productos/masajeadorCapilar.jpg', '<p>Instrumento para el cuidado de la salud que equilibra la bioelectricidad. Puede regular la presi&oacute;n sangu&iacute;nea directamente sin la prescripci&oacute;n de medicinas. Ocupa poco espacio.</p>\r\n<p>Es un bioenergizador celular cuya funci&oacute;n es estabilizar cualquier desequilibrio energ&eacute;tico que se produzca en un &aacute;rea determinada del cuerpo. Fue dise&ntilde;ado utilizando los conocimientos sobre circuitos y canales bioel&eacute;ctricos del cuerpo humano, la teor&iacute;a china del ying-yang, la teor&iacute;a de la Reflexolog&iacute;a y la teor&iacute;a moderna de la medicina preventiva.</p>\r\n<p>El tipo de vida actual lleva a una sobrecarga el&eacute;ctrica corporal (mayor carga positiva que negativa) produci&eacute;ndose una fuerte oxidaci&oacute;n f&iacute;sica, que genera un desequilibrio da&ntilde;ino para el funcionamiento normal de nuestro organismo. Este aparato se utiliza para aliviar m&aacute;s de 70 disfunciones del organismo, desde un simple dolor de cabeza hasta problemas mucho m&aacute;s complejos como hipertensi&oacute;n, artrosis y otras dolencias.</p>', 1, '2016-06-07 05:26:05');

-- --------------------------------------------------------

--
-- Table structure for table `principal_publicaciones`
--
-- Creation: Jun 07, 2016 at 03:18 AM
--

CREATE TABLE IF NOT EXISTS `principal_publicaciones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(50) NOT NULL,
  `portada` varchar(100) NOT NULL,
  `contenido` longtext NOT NULL,
  `comentario` varchar(50) NOT NULL,
  `fecha_de_publicacion` date NOT NULL,
  `status` varchar(1) NOT NULL,
  `author_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `principal_publicaciones_author_id_0fddf025_fk_auth_user_id` (`author_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `principal_publicaciones`
--

INSERT INTO `principal_publicaciones` (`id`, `titulo`, `portada`, `contenido`, `comentario`, `fecha_de_publicacion`, `status`, `author_id`) VALUES
(1, 'Como Quitar Manchas de Acne', 'tutoriales/como-quitar-manchas-de-acne.jpg', '<h2><strong>Remedios caseros para quitar las machas del acn&eacute;</strong></h2>\r\n\r\n<p><span style="font-size:16px"><span style="color:rgb(0, 0, 0)">Para desaparecer las manchas es necesario que te sometas a un tratamiento eficaz para el acn&eacute;.</span></span></p>\r\n\r\n<p><span style="font-size:16px"><span style="color:rgb(0, 0, 0)">Algo que funciona muy bien es lavarse la cara dos veces al d&iacute;a con un limpiador suave. No permitas que el sudor y la suciedad permanezcan en tu piel por mucho tiempo ya que esto podr&iacute;a causar m&aacute;s erupciones en tu rostro o espalda. Exprimir las espinillas y granos es la peor cosa que puedes hacer, si lo haces solo provocar&aacute;s la aparici&oacute;n de cicatrices en la piel.</span></span></p>\r\n\r\n<p><span style="font-size:16px"><span style="color:rgb(0, 0, 0)">Trata de mantenerte lejos de la luz solar, esto puede mejorar notablemente el enrojecimiento de los granos. No uses cremas aceitosas o sustancias que tapen los poros de la piel. Mant&eacute;n una dieta saludable, toma suficiente agua y haz ejercicio con regularidad.</span></span></p>\r\n\r\n<p><span style="font-size:16px"><span style="color:rgb(0, 0, 0)">Los remedios caseros para el acn&eacute; suelen ser muy eficaces, ya que son totalmente naturales. Las mascarillas faciales son excelentes, adem&aacute;s de ser muy econ&oacute;micas. Si tienes la piel muy grasosa puedes aplicarte el jugo extra&iacute;do del n&uacute;cleo de dos manzanas licuadas, d&eacute;jalo en tu rostro durante unos minutos y luego enju&aacute;gate con agua. Para eliminar el brillo de la cara puedes usar una mezcla de un trozo de pl&aacute;tano maduro con una cucharada de miel pura, fr&oacute;talo durante un par de minutos y ver&aacute;s como desaparece el brillo de tu rostro.</span></span></p>\r\n\r\n<p><span style="font-size:16px"><span style="color:rgb(0, 0, 0)">Otra t&eacute;cnica muy buena para reducir y eliminar las manchas de acn&eacute; son los masajes faciales, puedes usar alguna loci&oacute;n suave o prepararte una a base de agua y rosas. Para reducir la inflamaci&oacute;n usa hidrocortisona 2 veces al d&iacute;a. El jugo de lim&oacute;n, la pasta de dientes y el vinagre tambi&eacute;n ayudan a reducir el enrojecimiento de los granos.</span></span></p>', 'Sigue estos consejos para mejorar tu piel', '2016-06-07', 'P', 1),
(2, 'Como Limpiar la Cara de Espinillas', 'tutoriales/como-limpiar-la-cara-de-espinillas.jpg', '<h2><strong>C&oacute;mo limpiar la cara de espinillas siguiendo 6 simples tips</strong></h2>\r\n\r\n<p><span style="font-size:16px"><strong>1. No debes comprar maquillajes aceitosos</strong>, ya que pueden obstruir tus poros y esto provocar&aacute; que te aparezcan espinillas, elige los maquillajes que no contengan aceite y recuerda limpiarte la cara antes de dormir.</span></p>\r\n\r\n<p><span style="font-size:16px"><strong>2. Haz un poco de ejercicios</strong>, como por ejemplo trotar y caminar. Esto har&aacute; que mantengas sanos tus &oacute;rganos internos y tambi&eacute;n eliminar&aacute; las toxinas de tu cuerpo. No olvides darte una ducha despu&eacute;s de ejercitarte.</span></p>\r\n\r\n<p><span style="font-size:16px"><strong>3. Otro tratamiento efectivo es lavarte la cara con agua de arroz</strong>, simplemente tienes que lavar el arroz que utilizas para comer y guarda el agua para que la apliques en tu cara, deja que se seque y luego enju&aacute;gate la cara con agua tibia.</span></p>\r\n\r\n<p><span style="font-size:16px"><strong>4. La mascarilla de papaya</strong> es uno de los tratamientos m&aacute;s efectivos para limpiar la cara de espinillas, para elaborarla tienes que hacer un pur&eacute; de papaya ponerla en tu cara, dej&aacute;ndola actuar por 15 minutos. Luego ret&iacute;rala con un trapo h&uacute;medo, esto har&aacute; que puedas prevenir futuros brotes.</span></p>\r\n\r\n<p><span style="font-size:16px"><strong>5. Utiliza el ajo</strong>, esta es una perfecta opci&oacute;n para limpiar tu cara de espinillas, simplemente tienes que partir un diente de ajo y aplicarlo directamente en las partes donde tengas las espinillas.</span></p>\r\n\r\n<p><span style="font-size:16px"><strong>6. La mascarilla de avena es un</strong> <strong>tratamiento efectivo contra las espinillas</strong>, puedes hacer esta mascarilla con harina de avena mezclada con la leche, apl&iacute;cala sobre tu cara, deja que se seque y luego enju&aacute;gala con agua tibia, esta mascarilla puedes aplic&aacute;rtela 2 veces por semana.</span></p>\r\n\r\n<p><span style="font-size:16px">Ahora que sabes <strong>c&oacute;mo eliminar la cara de espinillas</strong> con estos simples tratamientos caseros tienes que poner mano a la obra. Estos son muy eficaces y mejores que los productos que venden en el mercado. Algo que tienes que saber tambi&eacute;n es que necesitas tener paciencia cuando empieces a utilizar estos tratamientos ya que normalmente toma alrededor de una semana para que puedas notar buenos resultados.</span></p>', 'Aplica estos tips para ir liberandote del acné', '2016-06-07', 'P', 1),
(3, 'Palpitaciones: a que se debe y como tratarlas', 'tutoriales/mujer-palpitaciones.jpg', '<p><span style="font-size:16px"><strong>Las palpitaciones del coraz&oacute;n son una sensaci&oacute;n desagradable</strong> y m&aacute;s com&uacute;n de lo que se cree.</span></p>\r\n\r\n<p><span style="font-size:16px">Experimentarlas <strong>no quiere decir que se tenga un problema de salud grave</strong>, pero igualmente hay que estar atentos.</span></p>\r\n\r\n<p><span style="font-size:16px">Un gran porcentaje de los latidos acelerados no se deben a una enfermedad card&iacute;aca. En este art&iacute;culo te contaremos m&aacute;s al respecto.</span></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h2><span style="font-size:16px">&iquest;Qu&eacute; saber sobre las palpitaciones?</span></h2>\r\n\r\n<p><span style="font-size:16px"><img alt="Qué saber sobre las palpitaciones" class="aligncenter size-large wp-image-91339" src="http://mejorconsalud.com/wp-content/uploads/2016/01/Qu%C3%A9-saber-sobre-las-palpitaciones-500x334.jpg" style="height:334px; width:500px" /></span></p>\r\n\r\n<p><span style="font-size:16px">La definici&oacute;n m&eacute;dica indica que son una irregularidad o una anormalidad en los latidos del coraz&oacute;n. La frecuencia es m&aacute;s r&aacute;pida que lo habitual y puede deberse a diversas razones, entre ellas:</span></p>\r\n\r\n<ul>\r\n	<li><span style="font-size:16px">Tipos de actividades cotidianas</span></li>\r\n	<li><span style="font-size:16px">Exceso de ejercicio</span></li>\r\n	<li><span style="font-size:16px"><a href="http://mejorconsalud.com/9-razones-para-dejar-de-fumar-que-seguro-no-has-escuchado/" target="_blank">Fumar</a></span></li>\r\n	<li><span style="font-size:16px">Consumir alcohol</span></li>\r\n	<li><span style="font-size:16px">Beber mucho caf&eacute;</span></li>\r\n	<li><span style="font-size:16px">Consumir drogas</span></li>\r\n	<li><span style="font-size:16px">Ingerir ciertos medicamentos</span></li>\r\n	<li><span style="font-size:16px">Estados de ansiedad o estr&eacute;s</span></li>\r\n	<li><span style="font-size:16px">Problemas cong&eacute;nitos</span></li>\r\n</ul>\r\n\r\n<p><span style="font-size:16px">Los s&iacute;ntomas m&aacute;s frecuentes son:</span></p>\r\n\r\n<ul>\r\n	<li><span style="font-size:16px">Falta de aire</span></li>\r\n	<li><span style="font-size:16px">Mareos</span></li>\r\n	<li><span style="font-size:16px">Sentir que el coraz&oacute;n late muy fuerte</span></li>\r\n	<li><span style="font-size:16px">Debilidad</span></li>\r\n	<li><span style="font-size:16px"><a href="http://mejorconsalud.com/nauseas-durante-el-embarazo/" target="_blank">N&aacute;useas</a></span></li>\r\n	<li><span style="font-size:16px">Desvanecimiento</span></li>\r\n	<li><span style="font-size:16px">Cansancio</span></li>\r\n	<li><span style="font-size:16px">Dolor en el pecho</span></li>\r\n	<li><span style="font-size:16px">Desmayos</span></li>\r\n	<li><span style="font-size:16px">Sudor fr&iacute;o</span></li>\r\n</ul>\r\n\r\n<p><span style="font-size:16px">La sensaci&oacute;n que se experimenta es estresante porque creemos que vamos a tener un ataque card&iacute;aco.</span></p>\r\n\r\n<p><span style="font-size:16px">Es preciso entender que las palpitaciones son una consecuencia de la liberaci&oacute;n de la hormona adrenalina y por esta raz&oacute;n aparecen cuando estamos ante una situaci&oacute;n de miedo o de mucha emoci&oacute;n.</span></p>\r\n\r\n<p><span style="font-size:16px">Tambi&eacute;n&nbsp;<strong>los latidos del coraz&oacute;n pueden aumentar cuando estamos muy ansiosos</strong> por una situaci&oacute;n o incluso cuando pensamos en la persona amada.</span></p>\r\n\r\n<p><span style="font-size:16px">A su vez, las causas pueden ser psicosom&aacute;ticas y desencadenarse ante un ataque de p&aacute;nico o un inminente peligro. En algunas personas con hipertiroidismo las palpitaciones son recurrentes.</span></p>\r\n\r\n<blockquote>\r\n<p><span style="font-size:16px">&iquest;Quieres conocer m&aacute;s? Lee:&nbsp;<a href="http://mejorconsalud.com/como-disimular-el-cansancio-en-el-rostro-en-10-minutos/" target="_blank">C&oacute;mo disimular el cansancio en el rostro en 10 minutos</a></span></p>\r\n</blockquote>\r\n\r\n<p><span style="font-size:16px"><img alt="Corazón" class="aligncenter size-large wp-image-91342" src="http://mejorconsalud.com/wp-content/uploads/2016/01/Coraz%C3%B3n-500x334.jpg" style="height:334px; width:500px" /></span></p>\r\n\r\n<p><span style="font-size:16px">Si bien no son un riesgo para nuestra salud si ocurren de vez en cuando o en situaciones espec&iacute;ficas, es preciso tenerlas en cuenta si la periodicidad de los episodios va en aumento.</span></p>\r\n\r\n<p><span style="font-size:16px">Cuando son un acontecimiento regular y no una excepci&oacute;n quiz&aacute;s sea bueno consultar con un m&eacute;dico.</span></p>\r\n\r\n<div class="ad-desktop">\r\n<div id="div-gpt-ad-1459529399066-0">&nbsp;</div>\r\n</div>\r\n\r\n<p><span style="font-size:16px">Aquellos que padecen palpitaciones indican que sienten como si el coraz&oacute;n &ldquo;se saliese del pecho o subiese por la <a href="http://mejorconsalud.com/12-remedios-naturales-para-el-dolor-de-garganta/" target="_blank">garganta</a>&rdquo;&nbsp;y que les duele mucho el t&oacute;rax.</span></p>\r\n\r\n<h2><span style="font-size:16px">C&oacute;mo evitar las palpitaciones</span></h2>\r\n\r\n<p><span style="font-size:16px"><img alt="Cómo evitar las palpitaciones" class="aligncenter size-large wp-image-91346" src="http://mejorconsalud.com/wp-content/uploads/2016/01/C%C3%B3mo-evitar-las-palpitaciones-500x314.jpg" style="height:314px; width:500px" /></span></p>\r\n\r\n<p><span style="font-size:16px">Los buenos h&aacute;bitos o la manera en que se afrontan los problemas y las diversas situaciones de la vida pueden minimizar las&nbsp;palpitaciones. Algunos de los consejos para reducirlas o prevenirlas son:</span></p>\r\n\r\n<ul>\r\n	<li><span style="font-size:16px">Analizar los medicamentos que se est&eacute;n consumiendo.</span></li>\r\n	<li><span style="font-size:16px">Recordar antecedentes familiares de enfermedades card&iacute;acas, hipertensi&oacute;n arterial o derrames.</span></li>\r\n	<li><span style="font-size:16px">No fumar.</span></li>\r\n	<li><span style="font-size:16px">Dejar de beber alcohol y caf&eacute;.</span></li>\r\n	<li><span style="font-size:16px">Llevar un diario donde se indiquen los ritmos card&iacute;acos y en qu&eacute; momento se producen las palpitaciones.</span></li>\r\n	<li><span style="font-size:16px">Determinar en qu&eacute; situaci&oacute;n concreta el coraz&oacute;n late a mayor velocidad.</span></li>\r\n	<li><span style="font-size:16px">Realizar <a href="http://mejorconsalud.com/los-3-mejores-ejercicios-para-tu-salud/" target="_blank">ejercicio</a> de baja intensidad y bajo supervisi&oacute;n del m&eacute;dico.</span></li>\r\n	<li><span style="font-size:16px">Reducir la ansiedad mediante t&eacute;cnicas de relajaci&oacute;n como el yoga o la meditaci&oacute;n.</span></li>\r\n	<li><span style="font-size:16px">Respirar profundamente.</span></li>\r\n	<li><span style="font-size:16px">Llevar una vida saludable y una dieta equilibrada.</span></li>\r\n</ul>\r\n\r\n<h2><span style="font-size:16px">&iquest;Qu&eacute; hacer ante un episodio de palpitaciones?</span></h2>\r\n\r\n<p><span style="font-size:16px">En el mismo instante en que tu ritmo card&iacute;aco comience a ser irregular tienes que sentarte y apoyar los pies en el suelo.</span></p>\r\n\r\n<p><span style="font-size:16px">El siguiente paso es respirar lento y profundo, para<strong> que el abdomen se expanda cada vez que el aire ingresa a tus pulmones.</strong> De esta forma los latidos ir&aacute;n volviendo a la normalidad de a poco.</span></p>\r\n\r\n<p><span style="font-size:16px">No entres en p&aacute;nico.</span></p>\r\n\r\n<p><span style="font-size:16px">Otras t&eacute;cnicas interesantes pueden ser:</span></p>\r\n\r\n<h3><span style="font-size:16px">Maniobra de Valsalva</span></h3>\r\n\r\n<p><span style="font-size:16px">Se trata de taparse&nbsp;la nariz, cerrar la boca y exhalar, aunque no puedas sacar el aire por ninguno de los dos sitios. Esto aumentar&aacute; la presi&oacute;n en el t&oacute;rax y permitir&aacute; que se reestablezca el ritmo card&iacute;aco.</span></p>\r\n\r\n<h3><span style="font-size:16px">Toser</span></h3>\r\n\r\n<p><span style="font-size:16px">Este procedimiento sirve tambi&eacute;n para aumentar la presi&oacute;n en el <a href="http://mejorconsalud.com/como-tonificar-y-darle-firmeza-al-pecho/" target="_blank">pecho</a>. Se emplea para personas con s&iacute;ntomas de un preinfarto y es muy bueno para reducir las palpitaciones.</span></p>\r\n\r\n<h3><span style="font-size:16px">Beber agua fr&iacute;a</span></h3>\r\n\r\n<p><span style="font-size:16px"><img alt="Beber agua fría" class="aligncenter size-large wp-image-91347" src="http://mejorconsalud.com/wp-content/uploads/2016/01/Beber-agua-fr%C3%ADa-500x334.jpg" style="height:334px; width:500px" /></span></p>\r\n\r\n<p><span style="font-size:16px">Seg&uacute;n las teor&iacute;as de por qu&eacute; esta t&eacute;cnica funciona se encuentra el hecho de que el es&oacute;fago al recibir el agua realiza una presi&oacute;n sobre el coraz&oacute;n. Tambi&eacute;n hay&nbsp;personas que mojan su rostro con agua helada.</span></p>\r\n\r\n<h2><span style="font-size:16px">Tratamientos naturales para las palpitaciones</span></h2>\r\n\r\n<p><span style="font-size:16px">Adem&aacute;s de los buenos h&aacute;bitos ser&iacute;a bueno que empleases alguno de los siguientes remedios caseros para reducir las palpitaciones.</span></p>\r\n\r\n<h3><span style="font-size:16px">An&iacute;s</span></h3>\r\n\r\n<p><span style="font-size:16px">Ayuda a tratar todo tipo de irregularidades card&iacute;acas debido a sus propiedades calmantes. Se trata de una planta muy arom&aacute;tica usada en la gastronom&iacute;a pero que tambi&eacute;n sirve como medicina en caso de latidos acelerados.</span></p>\r\n\r\n<p><span style="font-size:16px">Se recomienda consumir 2 tazas al d&iacute;a de t&eacute; de an&iacute;s (puedes conseguirlo en bolsitas en las diet&eacute;ticas).</span></p>\r\n\r\n<h3><span style="font-size:16px">Hojas de calabaza</span></h3>\r\n\r\n<p><span style="font-size:16px"><strong>El zapallo o calabaza es un perfecto remedio casero para tratar las palpitaciones.</strong> &Uacute;nicamente utilizar&aacute;s las hojas, que tienen sustancias que calman el sistema nervioso. Tambi&eacute;n puedes realizar un t&eacute;</span></p>\r\n\r\n<div class="ad-desktop">\r\n<div id="div-gpt-ad-1458233387039-2">&nbsp;</div>\r\n</div>\r\n\r\n<h4><span style="font-size:16px">Ingredientes</span></h4>\r\n\r\n<ul>\r\n	<li><span style="font-size:16px">1 pu&ntilde;ado de hojas de planta</span></li>\r\n	<li><span style="font-size:16px">1 litro de agua.</span></li>\r\n</ul>\r\n\r\n<h4><span style="font-size:16px">Preparaci&oacute;n</span></h4>\r\n\r\n<ul>\r\n	<li><span style="font-size:16px">Calienta el agua con las hojas de calabaza.&nbsp;Una vez que ha entrado en ebullici&oacute;n cuela y deja que se entibie un poco.</span></li>\r\n	<li><span style="font-size:16px">A&ntilde;ade una cucharada de la infusi&oacute;n en medio vaso de agua y consume (m&aacute;ximo 3 tomas&nbsp;al d&iacute;a).</span></li>\r\n</ul>\r\n\r\n<blockquote>\r\n<p><span style="font-size:16px">No olvides leer:&nbsp;<a href="http://mejorconsalud.com/descubre-las-propiedades-depurativas-de-la-calabaza/" target="_blank">Descubre las propiedades depurativas de la calabaza</a></span></p>\r\n</blockquote>\r\n\r\n<h3><span style="font-size:16px">Uvas</span></h3>\r\n\r\n<p><span style="font-size:16px"><img alt="Palpitos" class="aligncenter size-large wp-image-91350" src="http://mejorconsalud.com/wp-content/uploads/2016/01/Palpitos-500x334.jpg" style="height:334px; width:500px" /></span></p>\r\n\r\n<p><span style="font-size:16px">Un remedio natural muy eficaz que ayuda a prevenir cualquier problema card&iacute;aco porque fluidifica la <a href="http://mejorconsalud.com/como-depurar-nuestra-sangre-naturalmente/" target="_blank">sangre</a> y al mismo tiempo favorece el sistema circulatorio.</span></p>\r\n\r\n<p><span style="font-size:16px"><strong>Es mejor que consumir una copa de vino tinto</strong> con las comidas, porque con las uvas aprovechamos todas sus propiedades de manera natural y sin el alcohol como protagonista. Un pu&ntilde;ado de fruta al d&iacute;a y alejar&aacute;s las palpitaciones.</span></p>\r\n\r\n<h3><span style="font-size:16px">Miel</span></h3>\r\n\r\n<p><span style="font-size:16px">No hay dudas de que la miel de abejas es un fant&aacute;stico aliado para nuestra salud. Este alimento medicinal que se emplea desde la antig&uuml;edad nos ofrece miles de virtudes.</span></p>\r\n\r\n<p><span style="font-size:16px"><strong>Permite controlar el ritmo card&iacute;aco y evitar los latidos acelerados.</strong> La miel brinda efectos inmediatos sobre este &oacute;rgano vital.</span></p>\r\n\r\n<p><span style="font-size:16px">Se aconseja consumir una cucharada en ayunas. A la hora de dormir podemos tomar la siguiente mezcla.</span></p>\r\n\r\n<h4><span style="font-size:16px">Ingredientes</span></h4>\r\n\r\n<ul>\r\n	<li><span style="font-size:16px">&nbsp;&frac12; taza de agua (125 ml)</span></li>\r\n	<li><span style="font-size:16px">Jugo&nbsp;de &frac12; lim&oacute;n</span></li>\r\n	<li><span style="font-size:16px">1 cucharada de miel (25 g)</span></li>\r\n</ul>\r\n\r\n<h4><span style="font-size:16px">Preparaci&oacute;n</span></h4>\r\n\r\n<p><span style="font-size:16px">Calienta media taza de agua y, cuando est&eacute; tibia, a&ntilde;ade el jugo de medio lim&oacute;n y una cucharada de miel. Cons&uacute;melo antes de acostarte.</span></p>', 'Debemos tener en cuenta cada uno de estos factores', '2016-06-07', 'P', 1),
(4, 'Como Limpiar el Colon Naturalmente', 'tutoriales/Colon-150x150.jpg', '<p style="text-align: justify;"><span style="color:#000000"><span style="font-size:16px">El colon, tambi&eacute;n llamado intestino grueso, <strong>se encuentra al final del sistema digestivo</strong>. Cumple, entre otras, la funci&oacute;n de evacuar las heces pero tambi&eacute;n est&aacute; relacionado con nuestro sistema inmunitario.</span></span></p>\r\n\r\n<p style="text-align: justify;"><span style="color:#000000"><span style="font-size:16px">Para evitar enfermedades del colon (c&aacute;ncer colorrectal, p&oacute;lipos, colitis, diverticulitis, colon irritable&hellip;) y muchas otras que pueden derivar de ellas presentamos los alimentos m&aacute;s adecuados para que est&eacute; saludable.</span></span></p>\r\n\r\n<h2 style="text-align: justify;"><span style="color:#000000"><span style="font-size:16px">Alimentos ricos en fibra</span></span></h2>\r\n\r\n<p style="text-align: justify;"><span style="font-size:16px"><span style="color:#000000">Si pensamos en alimentos saludables al intestino lo que primero nos viene a la mente es la fibr</span>a<span style="color:#000000">. Pero no s&oacute;lo es importante evitar los refinados. Tambi&eacute;n deber&iacute;amos elegir<strong> alimentos que la contengan naturalmente</strong>, y no que la lleven a&ntilde;adida artificialmente. Hoy en d&iacute;a, por ejemplo, el pan integral no suele ser elaborado con harina integral, sino que se hace con harina blanca y despu&eacute;s se le a&ntilde;ade salvado. Por eso trataremos de escoger siempre alimentos con fibra y lo menos procesados posibles.</span></span></p>\r\n\r\n<p style="text-align: justify;"><span style="color:#000000"><span style="font-size:16px"><strong>Encontramos fibra en los alimentos de origen vegetal:</strong></span></span></p>\r\n\r\n<ul>\r\n	<li style="text-align: justify;"><span style="color:#000000"><span style="font-size:16px">Frutas frescas y secas</span></span></li>\r\n	<li style="text-align: justify;"><span style="color:#000000"><span style="font-size:16px">Verduras y hortalizas</span></span></li>\r\n	<li style="text-align: justify;"><span style="color:#000000"><span style="font-size:16px">Legumbres</span></span></li>\r\n	<li style="text-align: justify;"><span style="color:#000000"><span style="font-size:16px">Frutos secos</span></span></li>\r\n	<li style="text-align: justify;"><span style="font-size:16px"><span style="color:#000000">Cereal integral: pan, grano (arroz, </span><a href="http://mejorconsalud.com/los-beneficios-del-mijo-el-unico-cereal-alcalinizante/" title="Beneficios del mijo"><span style="color:#000000">mijo</span></a><span style="color:#000000">, quinoa, trigo) y pasta</span></span></li>\r\n</ul>\r\n\r\n<p style="text-align: justify;"><span style="color:#000000"><span style="font-size:16px"><img alt="pan integral chiot''s run" class="aligncenter size-full wp-image-13298" src="http://mejorconsalud.com/wp-content/uploads/2013/11/pan-integral-chiots-run.jpg" style="border-radius:20px; box-shadow:0em 0em 0.6em grey; height:333px; width:500px" /></span></span></p>\r\n\r\n<h2 style="text-align: justify;"><span style="color:#000000"><span style="font-size:16px">Agua</span></span></h2>\r\n\r\n<p style="text-align: justify;"><span style="color:#000000"><span style="font-size:16px"><strong>Cuando aumentamos el consumo de fibra en nuestra dieta es importante aumentar tambi&eacute;n el consumo de agua</strong> entre comidas, ya que si nos los primeros d&iacute;as podemos notar un mayor estre&ntilde;imiento por la falta de l&iacute;quido.</span></span></p>\r\n\r\n<p style="text-align: justify;"><span style="color:#000000"><span style="font-size:16px">Beberemos por lo menos 6 o 10 vasos diarios. La cantidad de agua que necesitemos depender&aacute; de nuestra edad, de si realizamos esfuerzos f&iacute;sicos y de la temperatura exterior. Tambi&eacute;n pueden influir algunas enfermedades de los ri&ntilde;ones o insuficiencias card&iacute;acas congestivas. En este caso recomendamos consultar con el m&eacute;dico.<strong>&nbsp;</strong></span></span></p>\r\n\r\n<h2 style="text-align: justify;"><span style="color:#000000"><span style="font-size:16px">Calcio</span></span></h2>\r\n\r\n<p style="text-align: justify;"><span style="font-size:16px"><span style="color:#000000">El calcio ha demostrado en algunos estudios reducir el riesgo de c&aacute;ncer del colon y del recto. Tambi&eacute;n lo buscaremos en alimentos que lo contengan de manera natural, para una mejor asimilaci&oacute;n, y<strong> evitaremos todos aquellos que se presenten como &ldquo;enriquecidos en calcio&rdquo;</strong>. Lo encontraremos en los siguientes alimentos:</span></span></p>\r\n\r\n<div class="ad-desktop">\r\n<div id="div-gpt-ad-1459529399066-0" style="text-align: justify;">&nbsp;</div>\r\n</div>\r\n\r\n<ul>\r\n	<li style="text-align: justify;"><span style="font-size:16px"><span style="color:#000000">S&eacute;samo (en semillas, en tah&iacute;n, en aceite, en gomasio&hellip;)</span></span></li>\r\n	<li style="text-align: justify;"><span style="font-size:16px"><span style="color:#000000">Hoja verde (espinaca, acelga, br&oacute;coli&hellip;)</span></span></li>\r\n	<li style="text-align: justify;"><span style="font-size:16px"><span style="color:#000000">Salm&oacute;n</span></span></li>\r\n	<li style="text-align: justify;"><span style="color:#000000"><span style="font-size:16px">Sardinas</span></span></li>\r\n	<li style="text-align: justify;"><span style="color:#000000"><span style="font-size:16px">Almendras (en grano, en bebida)</span></span></li>\r\n</ul>\r\n\r\n<h2 style="text-align: justify;"><span style="color:#000000"><span style="font-size:16px">Vitamina D</span></span></h2>\r\n\r\n<p style="text-align: justify;"><span style="color:#000000"><span style="font-size:16px">Siempre que hablemos del calcio haremos tambi&eacute;n referencia a la vitamina D, ya que &eacute;sta es imprescindible para asimilarlo bien. Adem&aacute;s, tambi&eacute;n es una manera de prevenir el c&aacute;ncer de colon y de recto.</span></span></p>\r\n\r\n<div class="wp-caption aligncenter" id="attachment_13339" style="width: 510px">\r\n<p style="text-align: justify;"><span style="color:#000000"><span style="font-size:16px"><img alt="La fuente más natural y saludable de vitamina D es el sol. Podemos tomarlo en ratos breves a primera hora del día y al atardecer, exponiendo la piel al sol." class="size-full wp-image-13339" src="http://mejorconsalud.com/wp-content/uploads/2013/11/Tomar-el-sol.jpg" style="border-radius:20px; box-shadow:0em 0em 0.6em grey; height:328px; width:500px" /></span></span></p>\r\n\r\n<p style="text-align: justify;"><span style="color:#000000"><span style="font-size:16px">El cuerpo produce la vitamina D cuando la piel se expone directamente al sol. Por eso, con frecuencia se denomina la vitamina de la &ldquo;luz del sol&rdquo;. Podemos tomarlo en ratos breves a primera hora del d&iacute;a y al atardecer.</span></span></p>\r\n</div>\r\n\r\n<p style="text-align: justify;"><span style="color:#000000"><span style="font-size:16px">Tambi&eacute;n hay algunos alimentos que la contienen:</span></span></p>\r\n\r\n<ul>\r\n	<li style="text-align: justify;"><span style="color:#000000"><span style="font-size:16px">Salm&oacute;n</span></span></li>\r\n	<li style="text-align: justify;"><span style="color:#000000"><span style="font-size:16px">Caballa</span></span></li>\r\n	<li style="text-align: justify;"><span style="color:#000000"><span style="font-size:16px">Sardinas</span></span></li>\r\n	<li style="text-align: justify;"><span style="color:#000000"><span style="font-size:16px">Huevo</span></span></li>\r\n</ul>\r\n\r\n<p style="text-align: justify;"><span style="color:#000000"><span style="font-size:16px">Si vivimos en una zona poco soleada durante todo el a&ntilde;o podemos valorar tomarla como suplemento a temporadas.</span></span></p>\r\n\r\n<h2 style="text-align: justify;"><span style="color:#000000"><span style="font-size:16px">&Aacute;cido f&oacute;lico</span></span></h2>\r\n\r\n<p style="text-align: justify;"><span style="font-size:16px"><span style="color:#000000">El &aacute;cido f&oacute;lico o vitamina B9 ayuda al organismo a crear c&eacute;lulas nuevas y, adem&aacute;s de muchas otras propiedades y de ser imprescindible durante el embarazo, tambi&eacute;n reduce el riesgo de padecer c&aacute;ncer de colon. Lo encontmos en:</span></span></p>\r\n\r\n<ul>\r\n	<li style="text-align: justify;"><span style="color:#000000"><span style="font-size:16px">Hojas verdes (acelga, br&oacute;coli, espinaca)</span></span></li>\r\n	<li style="text-align: justify;"><span style="color:#000000"><span style="font-size:16px">Esp&aacute;rragos</span></span></li>\r\n	<li style="text-align: justify;"><span style="color:#000000"><span style="font-size:16px">Guisantes</span></span></li>\r\n	<li style="text-align: justify;"><span style="color:#000000"><span style="font-size:16px">Lentejas</span></span></li>\r\n	<li style="text-align: justify;"><span style="color:#000000"><span style="font-size:16px">Garbanzos</span></span></li>\r\n	<li style="text-align: justify;"><span style="font-size:16px"><a href="http://mejorconsalud.com/las-frutas-mas-beneficiosas-para-los-pulmones/" title="Las frutas más beneficiosas para los pulmones"><span style="color:#000000">Fresa</span></a></span></li>\r\n	<li style="text-align: justify;"><span style="color:#000000"><span style="font-size:16px">Naranja</span></span></li>\r\n	<li style="text-align: justify;"><span style="color:#000000"><span style="font-size:16px">Papaya</span></span></li>\r\n</ul>\r\n\r\n<h2 style="text-align: justify;"><span style="color:#000000"><span style="font-size:16px">Magnesio</span></span></h2>\r\n\r\n<p style="text-align: justify;"><span style="font-size:16px"><span style="color:#000000">Este mineral se utiliza para tratar problemas digestivos asociados al tr&aacute;nsito intestinal, como el de colon irritable, y tambi&eacute;n ayuda a reducir el riesgo de c&aacute;ncer. Tomaremos alimentos ricos en magnesio diariamente:</span></span></p>\r\n\r\n<div class="ad-desktop">\r\n<div id="div-gpt-ad-1458233387039-2" style="text-align: justify;">&nbsp;</div>\r\n</div>\r\n\r\n<ul>\r\n	<li style="text-align: justify;"><span style="color:#000000"><span style="font-size:16px">Cacao</span></span></li>\r\n	<li style="text-align: justify;"><span style="color:#000000"><span style="font-size:16px">Semillas de calabaza</span></span></li>\r\n	<li style="text-align: justify;"><span style="color:#000000"><span style="font-size:16px">Semillas de lino</span></span></li>\r\n	<li style="text-align: justify;"><span style="color:#000000"><span style="font-size:16px">Semillas de girasol</span></span></li>\r\n	<li style="text-align: justify;"><span style="color:#000000"><span style="font-size:16px">Almendras</span></span></li>\r\n	<li style="text-align: justify;"><span style="color:#000000"><span style="font-size:16px">Anacardos</span></span></li>\r\n	<li style="text-align: justify;"><span style="color:#000000"><span style="font-size:16px">Nueces de Brasil</span></span></li>\r\n	<li style="text-align: justify;"><span style="color:#000000"><span style="font-size:16px">Jud&iacute;as blancas</span></span></li>\r\n	<li style="text-align: justify;"><span style="color:#000000"><span style="font-size:16px">Guisantes</span></span></li>\r\n	<li style="text-align: justify;"><span style="color:#000000"><span style="font-size:16px">Hoja verde</span></span></li>\r\n</ul>\r\n\r\n<p style="text-align: justify;"><span style="font-size:16px"><span style="color:#000000">Tambi&eacute;n podemos tomar un suplemento de</span><strong><span style="color:#000000"> </span><span style="color:#000000">cloruro de magnesio</span></strong><span style="color:#000000"> o <strong>citrato de magnesio</strong> durante dos o tres meses.</span></span></p>\r\n\r\n<p style="text-align: justify;"><span style="color:#000000"><span style="font-size:16px"><img alt="frutos secos steffenz" class="aligncenter" src="http://mejorconsalud.com/wp-content/uploads/2013/11/frutos-secos-steffenz.jpg" style="border-bottom-left-radius:20px; border-bottom-right-radius:20px; border-top-left-radius:20px; border-top-right-radius:20px; box-shadow:#808080 0em 0em 0.6em; height:333px; width:500px" /></span></span></p>\r\n\r\n<h2 style="text-align: justify;"><span style="color:#000000"><span style="font-size:16px">Cuidado con la carne roja y procesada</span></span></h2>\r\n\r\n<p style="text-align: justify;"><span style="color:#000000"><span style="font-size:16px">Para nuestra salud intestinal debemos tener en cuenta algunos alimentos que no le son beneficiosos, ya que <strong>generan putrefacciones que se depositan en el intestino</strong> y a la larga nos pueden intoxicar. &Eacute;ste es el caso de las carnes rojas y procesadas.<strong> Optaremos mejor por carne de ave ecol&oacute;gica, pescado, huevo, legumbres</strong>, etc. Estos alimentos aportar&aacute;n la prote&iacute;na y energ&iacute;a necesaria para nuestro organismo.</span></span></p>\r\n\r\n<h2 style="text-align: justify;"><span style="color:#000000"><span style="font-size:16px">Cuidado con los l&aacute;cteos</span></span></h2>\r\n\r\n<p style="text-align: justify;"><span style="color:#000000"><span style="font-size:16px">Si sufrimos de colon irritable tenemos que evitar, adem&aacute;s de las carnes rojas, la leche y sus derivados. Podemos hacer la prueba durante un mes y despu&eacute;s volver a incorporarlos a nuestra dieta. Si no los toleramos bien, nuestro intestino reaccionar&aacute; inmediatamente.</span></span></p>\r\n\r\n<p style="text-align: justify;"><span style="font-size:16px"><span style="color:#000000">Tambi&eacute;n podemos tomar bebidas vegetales durante este tiempo.</span></span></p>\r\n\r\n<h2 style="text-align: justify;"><span style="color:#000000"><span style="font-size:16px">El kuzu, regulador intestinal</span></span></h2>\r\n\r\n<p style="text-align: justify;"><span style="color:#000000"><span style="font-size:16px">El kuzu o kudzu es una ra&iacute;z en polvo que tiene unas <strong>propiedades regeneradoras y reguladoras</strong> maravillosas para nuestro colon. &iquest;C&oacute;mo lo tomamos? Diluimos una cucharada de kuzu molido en un vaso de agua fr&iacute;a, evitando usar una cuchara de metal (elegiremos una de madera o porcelana). Despu&eacute;s lo ponemos en un cazo a hervir, pero sin dejar de remover en ning&uacute;n momento. Al cabo de unos dos minutos, a fuego lento, veremos que la textura y el color cambian, que el l&iacute;quido se vuelve transparente y espeso. En este momento apagamos el fuego, dejamos enfriar, y despu&eacute;s lo tomamos separado de las comidas. Se puede tomar una o dos veces al d&iacute;a hasta notar mejor&iacute;a.</span></span></p>', 'Un colon limpio es un gran paso para buena salud', '2016-06-07', 'P', 1),
(5, 'Como Acelera tu Metabolismo para bajar de peso', 'tutoriales/bajar-peso.jpg', '<div class="mc-content">\r\n<p style="text-align: justify;"><span style="font-size:16px"><strong>Aunque hayas heredado el metabolismo de tu familia, no est&aacute;s condenado a conformarte con &eacute;l y vivir con sobrepeso y las molestias que conlleva. Siempre es posible modificar nuestro metabolismo y hacer que trabaje con nosotros y no en nuestra contra</strong>. Algunos estudios han demostrado que cada uno de estos consejos acelera tu metabolismo, con lo que tu cuerpo baja de peso de forma m&aacute;s r&aacute;pida, sana y natural en menos tiempo y con menor esfuerzo.</span></p>\r\n\r\n<h2 style="text-align: justify;"><span style="font-size:16px">1. Desayuna algo nutritivo todos los d&iacute;as</span></h2>\r\n\r\n<p style="text-align: justify;"><span style="font-size:16px">Comer algo nutritivo en el desayuno (como un omelet de espinacas y queso feta con una rebanada de pan tostado integral) poco despu&eacute;s de levantarte har&aacute; que tu metabolismo comience a trabajar inmediatamente y de forma correcta. <strong>De acuerdo con un estudio llevado a cabo por el Registro Nacional de Control de Peso de Estados Unidos con 5000 pacientes que implementaron el desayuno sano en su vida diaria, la p&eacute;rdida de peso puede ser de hasta 30 kilos en 5 a&ntilde;os.</strong></span></p>\r\n\r\n<p style="text-align: justify;"><span style="font-size:16px">Esto se debe a que el desayuno le da energ&iacute;a al cuerpo y este deja de acumular grasa, en su lugar comienza a trabajar con el alimento que le damos y baja de peso de forma natural. <strong>Adem&aacute;s es recomendable que cenes ligero, ya que durante la noche pasamos varias horas en ayuno y el cuerpo acumular&aacute; la mayor cantidad de grasa que pueda.</strong></span></p>\r\n\r\n<h2 style="text-align: justify;"><span style="font-size:16px">2. Agrega el t&eacute; verde a tu dieta</span></h2>\r\n\r\n<p style="text-align: justify;"><span style="font-size:16px"><img alt="Te verde (2)" class="aligncenter size-full wp-image-17852" src="http://mejorconsalud.com/wp-content/uploads/2014/01/Te-verde-2.jpg" style="border-radius:20px; box-shadow:0em 0em 0.6em grey; height:334px; width:500px" /><br />\r\nEl t&eacute; verde es conocido por sus propiedades antioxidantes, pero tambi&eacute;n se ha descubierto recientemente que ayuda a acelerar el metabolismo, y con ello, a perder peso r&aacute;pidamente. Investigadores de diversas universidades han realizado estudios con varios grupos de gente para determinar los beneficios de esta infusi&oacute;n.&nbsp;Uno de los resultados obtenidos fue que <strong>quienes comenzaron el h&aacute;bito de tomar t&eacute; verde bajaron de peso con mayor rapidez que los dem&aacute;s debido a que facilita la oxidaci&oacute;n de la grasa y la termog&eacute;nesis. La cantidad ideal son 5 tazas de t&eacute; verde al d&iacute;a, con lo que se incrementa considerablemente la energ&iacute;a del cuerpo con apenas 90 calor&iacute;as.</strong></span></p>\r\n\r\n<h2 style="text-align: justify;"><span style="font-size:16px">3. Come alimentos ricos en omega 3</span></h2>\r\n\r\n<p style="text-align: justify;"><span style="font-size:16px">Ya sabemos que comer pescados ricos en &aacute;cidos grasos omega 3 (como el salm&oacute;n o at&uacute;n) acelera tu metabolismo, adem&aacute;s de regular los niveles de az&uacute;car en sangre y reducir otros problemas (como la inflamaci&oacute;n). Pero algunos estudios que se han realizado recientemente han comprobado que<strong> estos &aacute;cidos grasos tambi&eacute;n ayudan a reducir la resistencia a la leptina, una hormona que facilita la p&eacute;rdida de peso</strong>. <strong>En caso de que no te guste comer pescado o prefieras otras alternativas, puedes agregar un complemento diario de omega 3 que contenga entre 1,000 y 2,000 miligramos o algunos frutos secos para obtener los mismos beneficios</strong>.</span></p>\r\n\r\n<div class="ad-desktop">\r\n<div id="div-gpt-ad-1459529399066-0" style="text-align: justify;">&nbsp;</div>\r\n</div>\r\n\r\n<h2 style="text-align: justify;"><span style="font-size:16px">4. No elimines todas las calor&iacute;as de tu dieta</span></h2>\r\n\r\n<p style="text-align: justify;"><span style="font-size:16px"><img alt="desayuno.saludable" class="aligncenter size-full wp-image-20244" src="http://mejorconsalud.com/wp-content/uploads/2014/02/desayuno.saludable.jpg" style="border-radius:20px; box-shadow:0em 0em 0.6em grey; height:332px; width:500px" /><br />\r\nTenemos la idea de que quienes eliminan m&aacute;s calor&iacute;as de su alimentaci&oacute;n, logran bajar de peso m&aacute;s f&aacute;cilmente. Aunque esto puede ser cierto en el inicio,<strong> cuando nuestro cuerpo se da cuenta de que le estamos dando menos calor&iacute;as, comienza a incrementar sus reservas de energ&iacute;a acumulando grasa</strong>. Por ello, comer m&aacute;s acelera tu metabolismo siempre y cuando elijas alimentos sanos y que te aporten nutrientes. Tambi&eacute;n<strong> es importante que no pases largos per&iacute;odos de ayuno. Lo ideal es comer 6 veces al d&iacute;a (300 calor&iacute;as cada vez), en lugar de hacer dos comidas demasiado abundantes o de alto valor cal&oacute;rico.</strong></span></p>\r\n\r\n<h2 style="text-align: justify;"><span style="font-size:16px">5. Agrega distintas intensidades al ejercicio</span></h2>\r\n\r\n<p style="text-align: justify;"><span style="font-size:16px"><strong>La siguiente vez que realices ejercicio (caminar, nadar, correr, etc.) a&ntilde;ade algunos intervalos de 30 segundos en los que aumentes la intensidad y luego regresa a la intensidad normal</strong>. Estos ligeros cambios har&aacute;n que tu cuerpo consuma m&aacute;s energ&iacute;a, fortalece considerablemente la capacidad de las c&eacute;lulas para regenerarse y les ayuda a tener una mayor oxigenaci&oacute;n. Con esto tambi&eacute;n te puedes ejercitar menos tiempo pero lograr los objetivos deseados mucho m&aacute;s r&aacute;pido. Estos intervalos los puedes a&ntilde;adir a cualquier deporte que realices.</span></p>\r\n\r\n<h2 style="text-align: justify;"><span style="font-size:16px">6. Toma un descanso despu&eacute;s de ejercitarte</span></h2>\r\n\r\n<p style="text-align: justify;"><span style="font-size:16px"><img alt="ejercicio peso" class="aligncenter size-full wp-image-20808" src="http://mejorconsalud.com/wp-content/uploads/2014/02/ejercicio-peso.jpg" style="border-radius:20px; box-shadow:0em 0em 0.6em grey; height:334px; width:500px" /><br />\r\nEl ejercicio es un regalo que le podemos hacer a nuestro cuerpo y nuestra salud, pero tambi&eacute;n puede ocasionar un cansancio muy severo cuando es demasiado intenso. <strong>Aunque el ejercicio nos ayuda a acelerar el metabolismo, un elemento clave para ello es el descanso adecuado que le permite a nuestro cuerpo regresar a su estado de calma total.</strong> Es importante que la cantidad de calor&iacute;as que quemas con el ejercicio sea superior a la cantidad que consumes, esto te ayudar&aacute; a bajar de peso m&aacute;s eficazmente.</span></p>\r\n\r\n<h2 style="text-align: justify;"><span style="font-size:16px">7. Evita las grasas trans</span></h2>\r\n\r\n<p style="text-align: justify;"><span style="font-size:16px"><strong>Todos hemos escuchado lo malas que son este tipo de grasas, pero adem&aacute;s reducen la habilidad natural de tu cuerpo para quemar grasa. Esto se debe a que alteran nuestras c&eacute;lulas y alargan nuestro metabolism</strong>o. Por si esto fuera poco, tambi&eacute;n pueden generar resistencia a la insulina e inflamaci&oacute;n. As&iacute; que elimina las grasas trans de tu dieta, acelera tu metabolismo y baja de peso.</span></p>\r\n\r\n<div class="ad-desktop">\r\n<div id="div-gpt-ad-1458233387039-2" style="text-align: justify;">&nbsp;</div>\r\n</div>\r\n\r\n<h2 style="text-align: justify;"><span style="font-size:16px">8. Incrementa la ingesta de prote&iacute;na</span></h2>\r\n\r\n<p style="text-align: justify;"><span style="font-size:16px"><img alt="Salmon" class="aligncenter size-full wp-image-18038" src="http://mejorconsalud.com/wp-content/uploads/2014/01/Salmon.jpg" style="border-radius:20px; box-shadow:0em 0em 0.6em grey; height:334px; width:500px" /><br />\r\nNuestro cuerpo tarda m&aacute;s tiempo en digerir los alimentos ricos en prote&iacute;na que los ricos en grasa o carbohidratos. Esto significa que <strong>cuando comes prote&iacute;na te sientes satisfecho por m&aacute;s tiempo, mientras que tu metabolismo sigue trabajando y quemando grasa para lograrlo</strong>. Esto se traduce en un aceleramiento considerable de tu metabolismo y en una reducci&oacute;n de hambre. Adem&aacute;s, se ha demostrado que comer prote&iacute;na te permite ganar m&uacute;sculo en lugar de grasa.</span></p>\r\n\r\n<h2 style="text-align: justify;"><span style="font-size:16px">Acelera tu metabolismo con una buena dieta</span></h2>\r\n\r\n<p style="text-align: justify;"><span style="font-size:16px"><strong>La gen&eacute;tica marca algunas caracter&iacute;sticas de nuestro cuerpo, pero con algunos cambios podemos tomar el control de aquello que deseamos modificar y lograrlo</strong>. Acelerar el metabolismo significa que este trabajar&aacute; m&aacute;s r&aacute;pido, quemar&aacute; m&aacute;s calor&iacute;as y llegaremos o nos mantendremos en nuestro peso ideal.</span></p>\r\n\r\n<p style="text-align: justify;"><span style="font-size:16px">Al seguir estos trucos, le damos la oportunidad a nuestro organismo de mantenerse sano de forma natural y autorregulada. Esto es mucho m&aacute;s sano que probar dietas complicadas que generan pocos resultados o seguir una mala alimentaci&oacute;n que nos enfermar&aacute;.</span></p>\r\n</div>', 'Recupera tu peso ideal con estos consejos', '2016-06-07', 'P', 1);

-- --------------------------------------------------------

--
-- Table structure for table `principal_testimonios`
--
-- Creation: Jun 07, 2016 at 03:18 AM
--

CREATE TABLE IF NOT EXISTS `principal_testimonios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(200) NOT NULL,
  `paciente` varchar(100) NOT NULL,
  `fecha_de_consulta` datetime NOT NULL,
  `testimonios` longtext NOT NULL,
  `observaciones` longtext NOT NULL,
  `habilitado` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permissi_content_type_id_2f476e4b_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_perm_permission_id_1fbb5f2c_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `principal_publicaciones`
--
ALTER TABLE `principal_publicaciones`
  ADD CONSTRAINT `principal_publicaciones_author_id_0fddf025_fk_auth_user_id` FOREIGN KEY (`author_id`) REFERENCES `auth_user` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
