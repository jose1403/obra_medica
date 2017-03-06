--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: lau; Tablespace: 
--

CREATE TABLE auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO lau;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: lau
--

CREATE SEQUENCE auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO lau;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lau
--

ALTER SEQUENCE auth_group_id_seq OWNED BY auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: lau; Tablespace: 
--

CREATE TABLE auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO lau;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: lau
--

CREATE SEQUENCE auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO lau;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lau
--

ALTER SEQUENCE auth_group_permissions_id_seq OWNED BY auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: lau; Tablespace: 
--

CREATE TABLE auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO lau;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: lau
--

CREATE SEQUENCE auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO lau;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lau
--

ALTER SEQUENCE auth_permission_id_seq OWNED BY auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: lau; Tablespace: 
--

CREATE TABLE auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(30) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(30) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO lau;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: lau; Tablespace: 
--

CREATE TABLE auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO lau;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: lau
--

CREATE SEQUENCE auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO lau;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lau
--

ALTER SEQUENCE auth_user_groups_id_seq OWNED BY auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: lau
--

CREATE SEQUENCE auth_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO lau;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lau
--

ALTER SEQUENCE auth_user_id_seq OWNED BY auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: lau; Tablespace: 
--

CREATE TABLE auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO lau;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: lau
--

CREATE SEQUENCE auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO lau;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lau
--

ALTER SEQUENCE auth_user_user_permissions_id_seq OWNED BY auth_user_user_permissions.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: lau; Tablespace: 
--

CREATE TABLE django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO lau;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: lau
--

CREATE SEQUENCE django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO lau;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lau
--

ALTER SEQUENCE django_admin_log_id_seq OWNED BY django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: lau; Tablespace: 
--

CREATE TABLE django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO lau;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: lau
--

CREATE SEQUENCE django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO lau;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lau
--

ALTER SEQUENCE django_content_type_id_seq OWNED BY django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: lau; Tablespace: 
--

CREATE TABLE django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO lau;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: lau
--

CREATE SEQUENCE django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO lau;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lau
--

ALTER SEQUENCE django_migrations_id_seq OWNED BY django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: lau; Tablespace: 
--

CREATE TABLE django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO lau;

--
-- Name: principal_perfil_author; Type: TABLE; Schema: public; Owner: lau; Tablespace: 
--

CREATE TABLE principal_perfil_author (
    id integer NOT NULL,
    nombre character varying(50) NOT NULL,
    apellido character varying(50) NOT NULL,
    "Contrasena" character varying(30) NOT NULL,
    foto character varying(100) NOT NULL,
    correo character varying(254) NOT NULL,
    telefono character varying(12) NOT NULL,
    descripcion text NOT NULL,
    author_id integer NOT NULL
);


ALTER TABLE public.principal_perfil_author OWNER TO lau;

--
-- Name: principal_perfil_author_id_seq; Type: SEQUENCE; Schema: public; Owner: lau
--

CREATE SEQUENCE principal_perfil_author_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.principal_perfil_author_id_seq OWNER TO lau;

--
-- Name: principal_perfil_author_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lau
--

ALTER SEQUENCE principal_perfil_author_id_seq OWNED BY principal_perfil_author.id;


--
-- Name: principal_productos; Type: TABLE; Schema: public; Owner: lau; Tablespace: 
--

CREATE TABLE principal_productos (
    id integer NOT NULL,
    nombre character varying(100) NOT NULL,
    imagen character varying(100) NOT NULL,
    descripcion text NOT NULL,
    disponible boolean NOT NULL,
    fecha_de_agregado timestamp with time zone NOT NULL
);


ALTER TABLE public.principal_productos OWNER TO lau;

--
-- Name: principal_productos_id_seq; Type: SEQUENCE; Schema: public; Owner: lau
--

CREATE SEQUENCE principal_productos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.principal_productos_id_seq OWNER TO lau;

--
-- Name: principal_productos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lau
--

ALTER SEQUENCE principal_productos_id_seq OWNED BY principal_productos.id;


--
-- Name: principal_publicaciones; Type: TABLE; Schema: public; Owner: lau; Tablespace: 
--

CREATE TABLE principal_publicaciones (
    id integer NOT NULL,
    titulo character varying(50) NOT NULL,
    portada character varying(100) NOT NULL,
    contenido text NOT NULL,
    comentario character varying(50) NOT NULL,
    fecha_de_publicacion date NOT NULL,
    status character varying(1) NOT NULL,
    author_id integer NOT NULL,
    tema_id integer NOT NULL
);


ALTER TABLE public.principal_publicaciones OWNER TO lau;

--
-- Name: principal_publicaciones_id_seq; Type: SEQUENCE; Schema: public; Owner: lau
--

CREATE SEQUENCE principal_publicaciones_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.principal_publicaciones_id_seq OWNER TO lau;

--
-- Name: principal_publicaciones_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lau
--

ALTER SEQUENCE principal_publicaciones_id_seq OWNED BY principal_publicaciones.id;


--
-- Name: principal_tema_publicacion; Type: TABLE; Schema: public; Owner: lau; Tablespace: 
--

CREATE TABLE principal_tema_publicacion (
    id integer NOT NULL,
    tema character varying(50) NOT NULL,
    descripcion text NOT NULL
);


ALTER TABLE public.principal_tema_publicacion OWNER TO lau;

--
-- Name: principal_tema_publicacion_id_seq; Type: SEQUENCE; Schema: public; Owner: lau
--

CREATE SEQUENCE principal_tema_publicacion_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.principal_tema_publicacion_id_seq OWNER TO lau;

--
-- Name: principal_tema_publicacion_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lau
--

ALTER SEQUENCE principal_tema_publicacion_id_seq OWNED BY principal_tema_publicacion.id;


--
-- Name: principal_testimonios; Type: TABLE; Schema: public; Owner: lau; Tablespace: 
--

CREATE TABLE principal_testimonios (
    id integer NOT NULL,
    nombre character varying(200) NOT NULL,
    paciente character varying(100) NOT NULL,
    fecha_de_consulta timestamp with time zone NOT NULL,
    testimonios text NOT NULL,
    observaciones text NOT NULL,
    habilitado boolean NOT NULL,
    imagen character varying(100) NOT NULL
);


ALTER TABLE public.principal_testimonios OWNER TO lau;

--
-- Name: principal_testimonios_id_seq; Type: SEQUENCE; Schema: public; Owner: lau
--

CREATE SEQUENCE principal_testimonios_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.principal_testimonios_id_seq OWNER TO lau;

--
-- Name: principal_testimonios_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lau
--

ALTER SEQUENCE principal_testimonios_id_seq OWNED BY principal_testimonios.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: lau
--

ALTER TABLE ONLY auth_group ALTER COLUMN id SET DEFAULT nextval('auth_group_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: lau
--

ALTER TABLE ONLY auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('auth_group_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: lau
--

ALTER TABLE ONLY auth_permission ALTER COLUMN id SET DEFAULT nextval('auth_permission_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: lau
--

ALTER TABLE ONLY auth_user ALTER COLUMN id SET DEFAULT nextval('auth_user_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: lau
--

ALTER TABLE ONLY auth_user_groups ALTER COLUMN id SET DEFAULT nextval('auth_user_groups_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: lau
--

ALTER TABLE ONLY auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('auth_user_user_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: lau
--

ALTER TABLE ONLY django_admin_log ALTER COLUMN id SET DEFAULT nextval('django_admin_log_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: lau
--

ALTER TABLE ONLY django_content_type ALTER COLUMN id SET DEFAULT nextval('django_content_type_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: lau
--

ALTER TABLE ONLY django_migrations ALTER COLUMN id SET DEFAULT nextval('django_migrations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: lau
--

ALTER TABLE ONLY principal_perfil_author ALTER COLUMN id SET DEFAULT nextval('principal_perfil_author_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: lau
--

ALTER TABLE ONLY principal_productos ALTER COLUMN id SET DEFAULT nextval('principal_productos_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: lau
--

ALTER TABLE ONLY principal_publicaciones ALTER COLUMN id SET DEFAULT nextval('principal_publicaciones_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: lau
--

ALTER TABLE ONLY principal_tema_publicacion ALTER COLUMN id SET DEFAULT nextval('principal_tema_publicacion_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: lau
--

ALTER TABLE ONLY principal_testimonios ALTER COLUMN id SET DEFAULT nextval('principal_testimonios_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: lau
--

COPY auth_group (id, name) FROM stdin;
1	authores
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lau
--

SELECT pg_catalog.setval('auth_group_id_seq', 1, true);


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: lau
--

COPY auth_group_permissions (id, group_id, permission_id) FROM stdin;
1	1	32
2	1	1
3	1	2
4	1	3
5	1	33
6	1	40
7	1	41
8	1	42
9	1	43
10	1	44
11	1	13
12	1	14
13	1	15
14	1	45
15	1	28
16	1	29
17	1	30
18	1	31
\.


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lau
--

SELECT pg_catalog.setval('auth_group_permissions_id_seq', 18, true);


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: lau
--

COPY auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can add permission	2	add_permission
5	Can change permission	2	change_permission
6	Can delete permission	2	delete_permission
7	Can add group	3	add_group
8	Can change group	3	change_group
9	Can delete group	3	delete_group
10	Can add user	4	add_user
11	Can change user	4	change_user
12	Can delete user	4	delete_user
13	Can add content type	5	add_contenttype
14	Can change content type	5	change_contenttype
15	Can delete content type	5	delete_contenttype
16	Can add session	6	add_session
17	Can change session	6	change_session
18	Can delete session	6	delete_session
28	Can add productos	10	add_productos
29	Can change productos	10	change_productos
30	Can delete productos	10	delete_productos
31	Can add testimonios	11	add_testimonios
32	Can change testimonios	11	change_testimonios
33	Can delete testimonios	11	delete_testimonios
34	Can add usuario perfil	12	add_usuarioperfil
35	Can change usuario perfil	12	change_usuarioperfil
36	Can delete usuario perfil	12	delete_usuarioperfil
40	Can add tema_ publicacion	14	add_tema_publicacion
41	Can change tema_ publicacion	14	change_tema_publicacion
42	Can delete tema_ publicacion	14	delete_tema_publicacion
43	Can add publicaciones	15	add_publicaciones
44	Can change publicaciones	15	change_publicaciones
45	Can delete publicaciones	15	delete_publicaciones
46	Can add perfil_ author	16	add_perfil_author
47	Can change perfil_ author	16	change_perfil_author
48	Can delete perfil_ author	16	delete_perfil_author
\.


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lau
--

SELECT pg_catalog.setval('auth_permission_id_seq', 48, true);


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: lau
--

COPY auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
2	pbkdf2_sha256$24000$yYHtvi35Vhi7$co8ksiEqOruGpJgxpJUOsMNHmjEI7XHcFh2IHqceOuw=	\N	f	jose				f	t	2016-07-21 23:18:44.908159-04:30
3	pbkdf2_sha256$24000$mkCUO4EigXzN$UP13ZqFjfi8VY52gF5LBvXOWr+IL/x8ebirCvAp2fjc=	\N	f	jose12				f	t	2016-07-21 23:27:12.971786-04:30
4	pbkdf2_sha256$24000$HtXfC9h1UknA$1XJxyQYLsFfZoz+/wq+qDmfptH4+hzUMLJgKhGh+vYo=	\N	f	laureano				f	t	2016-07-21 23:30:44.123267-04:30
5	pbkdf2_sha256$24000$al05E2Y4raln$tYClPZwPQEq42i0tnmGvDSprsuC5FFugflDLMkd6C9A=	\N	f	jose14				f	t	2016-07-21 23:32:09.515276-04:30
6	pbkdf2_sha256$24000$RMwFA9Ks7Ky1$sfzUo6WEIc2HZOU4BwF7GrX+Ajrdz4Ql6SvJvnYY8cc=	\N	f	alcapone				f	t	2016-07-21 23:37:19.130771-04:30
7	pbkdf2_sha256$24000$TMbzAtNnIkSb$RSjmJvr0xkMWTbN1x9eGFmRGAVI126uHw3Lw9SMJ2SI=	2016-07-22 21:23:19.282868-04:30	f	axel	Axel	Yajure	axel@g.com	t	t	2016-07-21 23:43:07-04:30
8	pbkdf2_sha256$24000$MSQvyVotDGst$K7kiKSbXQsEs7eWL7dF9ExL52bI90jysVRoEEjy3D5E=	2016-07-27 15:08:12.695316-04:30	f	asael				t	t	2016-07-27 15:07:43.269531-04:30
1	pbkdf2_sha256$24000$yGyaREFbJYNO$2ZHvW9kdcY4Dche1Ivj0QlfX0YeB0hQ/uORuKsd+A3E=	2016-07-27 15:09:30.069826-04:30	t	lau	laureano	gomez		t	t	2016-07-20 21:27:38.311123-04:30
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: lau
--

COPY auth_user_groups (id, user_id, group_id) FROM stdin;
1	7	1
\.


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lau
--

SELECT pg_catalog.setval('auth_user_groups_id_seq', 1, true);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lau
--

SELECT pg_catalog.setval('auth_user_id_seq', 8, true);


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: lau
--

COPY auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lau
--

SELECT pg_catalog.setval('auth_user_user_permissions_id_seq', 1, false);


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: lau
--

COPY django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2016-07-20 21:36:08.659839-04:30	1	variado	1	Añadido.	14	1
2	2016-07-20 21:38:43.503992-04:30	1	como buscarte	1	Añadido.	15	1
3	2016-07-20 21:40:03.282724-04:30	2	como creerte	1	Añadido.	15	1
4	2016-07-20 21:40:58.24631-04:30	2	cutis	1	Añadido.	14	1
5	2016-07-20 21:42:07.239535-04:30	3	como quitar las manchas del acne	1	Añadido.	15	1
6	2016-07-20 21:43:20.936725-04:30	4	como limpiar la cara de espinilla	1	Añadido.	15	1
7	2016-07-20 21:44:36.415103-04:30	3	salud	1	Añadido.	14	1
8	2016-07-20 21:45:04.62578-04:30	5	como reducir el estres	1	Añadido.	15	1
9	2016-07-20 21:46:23.350899-04:30	6	los signos de una buena salud	1	Añadido.	15	1
10	2016-07-20 21:46:39.19375-04:30	6	los signos de una buena salud	2	No ha cambiado ningún campo.	15	1
11	2016-07-20 21:48:06.572852-04:30	7	cuida tu corazon	1	Añadido.	15	1
12	2016-07-20 21:49:51.244401-04:30	1	lecticina	1	Añadido.	10	1
13	2016-07-20 21:50:41.589454-04:30	2	masajeador capilar	1	Añadido.	10	1
14	2016-07-20 21:50:48.121265-04:30	2	masajeador capilar	2	No ha cambiado ningún campo.	10	1
15	2016-07-20 21:51:48.980341-04:30	3	resveratrol	1	Añadido.	10	1
16	2016-07-20 21:53:00.879403-04:30	4	jiogulan	1	Añadido.	10	1
17	2016-07-20 22:01:32.373002-04:30	1	roza campos -- dolor de huesos	1	Añadido.	11	1
18	2016-07-20 22:04:33.617447-04:30	2	alexa ortis -- mareos repentinos	1	Añadido.	11	1
19	2016-07-20 22:05:43.118153-04:30	3	carmina estrada -- dolor de espalda	1	Añadido.	11	1
20	2016-07-20 22:05:53.02156-04:30	3	carmina estrada -- dolor de espalda	2	No ha cambiado ningún campo.	11	1
21	2016-07-20 22:07:01.652594-04:30	4	jose suarez -- dolor de oidos	1	Añadido.	11	1
22	2016-07-20 22:11:48.89247-04:30	3	carmina estrada -- dolor de espalda	2	Modificado/a imagen.	11	1
23	2016-07-20 22:12:02.086401-04:30	2	alexa ortis -- mareos repentinos	2	Modificado/a imagen.	11	1
24	2016-07-20 22:12:15.207485-04:30	1	roza campos -- dolor de huesos	2	Modificado/a imagen.	11	1
25	2016-07-21 22:10:03.136101-04:30	1	laureano gomez	1	Añadido.	16	1
26	2016-07-22 21:22:32.136026-04:30	1	authores	1	Añadido.	3	1
27	2016-07-22 21:23:02.705789-04:30	7	axel	2	Modificado/a first_name y groups.	4	1
28	2016-07-22 21:23:51.437614-04:30	7	cuida tu corazon	2	Modificado/a contenido.	15	7
\.


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lau
--

SELECT pg_catalog.setval('django_admin_log_id_seq', 28, true);


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: lau
--

COPY django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	auth	user
5	contenttypes	contenttype
6	sessions	session
10	principal	productos
11	principal	testimonios
12	usuario	usuarioperfil
14	principal	tema_publicacion
15	principal	publicaciones
16	principal	perfil_author
\.


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lau
--

SELECT pg_catalog.setval('django_content_type_id_seq', 16, true);


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: lau
--

COPY django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2016-07-20 21:13:11.968014-04:30
2	auth	0001_initial	2016-07-20 21:13:13.090362-04:30
3	admin	0001_initial	2016-07-20 21:13:13.395089-04:30
4	admin	0002_logentry_remove_auto_add	2016-07-20 21:13:13.494745-04:30
5	contenttypes	0002_remove_content_type_name	2016-07-20 21:13:13.692913-04:30
6	auth	0002_alter_permission_name_max_length	2016-07-20 21:13:13.781107-04:30
7	auth	0003_alter_user_email_max_length	2016-07-20 21:13:13.88056-04:30
8	auth	0004_alter_user_username_opts	2016-07-20 21:13:14.002772-04:30
9	auth	0005_alter_user_last_login_null	2016-07-20 21:13:14.091152-04:30
10	auth	0006_require_contenttypes_0002	2016-07-20 21:13:14.103525-04:30
11	auth	0007_alter_validators_add_error_messages	2016-07-20 21:13:14.193565-04:30
12	principal	0001_initial	2016-07-20 21:13:14.468273-04:30
13	principal	0002_auto_20160712_1955	2016-07-20 21:13:15.13173-04:30
14	principal	0003_publicaciones	2016-07-20 21:13:15.443566-04:30
15	principal	0004_perfil_author	2016-07-20 21:13:15.729393-04:30
16	sessions	0001_initial	2016-07-20 21:13:15.982175-04:30
17	principal	0005_auto_20160721_0153	2016-07-20 21:23:43.796356-04:30
18	principal	0006_auto_20160721_0155	2016-07-20 21:25:25.631587-04:30
19	principal	0007_testimonios_imagen	2016-07-20 21:57:04.514891-04:30
20	principal	0008_auto_20160722_0109	2016-07-21 20:39:24.343144-04:30
21	principal	0009_perfil_author	2016-07-21 20:40:07.17065-04:30
\.


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lau
--

SELECT pg_catalog.setval('django_migrations_id_seq', 21, true);


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: lau
--

COPY django_session (session_key, session_data, expire_date) FROM stdin;
k3dckz4nf65z54k5t8j5nwa7uppnklbs	MmQ5MmIwOTQyMmFmOTE1NmQxN2M2N2E2NzU1ZDhhYjMxNzUwMmEyZTp7Il9hdXRoX3VzZXJfaGFzaCI6IjMyMGY3NmJlNTAyMzhkN2RkMTc4MDhlY2RkNzEyZjVjNWZhZTk2NjIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2016-08-10 15:09:30.081047-04:30
\.


--
-- Data for Name: principal_perfil_author; Type: TABLE DATA; Schema: public; Owner: lau
--

COPY principal_perfil_author (id, nombre, apellido, "Contrasena", foto, correo, telefono, descripcion, author_id) FROM stdin;
1	laureano	gomez		imagenes/usuario/adelgazar.jpg			mi nombre es laureano, y quero compartir mi experiencia contigo	1
3			*******	imagenes/usuario.png				5
4			*******	imagenes/usuario.png				6
5	Axel	Yajure	************	imagenes/usuario.png	axel@g.com		afasfsadfasfasdf safasdfsdafasdfsd  sdaf asdf asdafasfsadfasfasdf safasdfsdafasdfsd  sdaf asdf asdafasfsadfasfasdf safasdfsdafasdfsd  sdaf asdf asdafasfsadfasfasdf safasdfsdafasdfsd  sdaf asdf asdafasfsadfasfasdf safasdfsdafasdfsd  sdaf asdf asdafasfsadfasfasdf safasdfsdafasdfsd  sdaf asdf asdafasfsadfasfasdf safasdfsdafasdfsd  sdaf asdf asdafasfsadfasfasdf safasdfsdafasdfsd  sdaf asdf asd	7
6			********	imagenes/usuario.png				8
\.


--
-- Name: principal_perfil_author_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lau
--

SELECT pg_catalog.setval('principal_perfil_author_id_seq', 6, true);


--
-- Data for Name: principal_productos; Type: TABLE DATA; Schema: public; Owner: lau
--

COPY principal_productos (id, nombre, imagen, descripcion, disponible, fecha_de_agregado) FROM stdin;
1	lecticina	productos/lecitina_szTIOTe.jpg	producto para implementar en la cara  producto para implementar en la cara producto para implementar en la cara producto para implementar en la cara producto para implementar en la cara producto para implementar en la cara producto para implementar en la cara producto para implementar en la cara	t	2016-07-20 21:49:51.238379-04:30
2	masajeador capilar	productos/masajeadorCapilar_qUnVdZt.jpg	masajeador capilarmasajeador capilarmasajeador capilarmasajeador capilarmasajeador capilarmasajeador capilarmasajeador capilarmasajeador capilarmasajeador capilarmasajeador capilarmasajeador capilarmasajeador capilarmasajeador capilarmasajeador capilarmasajeador capilar	t	2016-07-20 21:50:41.585608-04:30
3	resveratrol	productos/resveratrol_250_Q8s8siv.jpg	producto para cuidar su salud  producto para cuidar su salud producto para cuidar su salud producto para cuidar su salud producto para cuidar su salud producto para cuidar su salud producto para cuidar su salud producto para cuidar su salud producto para cuidar su salud	t	2016-07-20 21:51:48.975428-04:30
4	jiogulan	productos/jiaogulan_FEBPrGV.jpg	producto para evitar la accion corrociva producto para evitar la accion corrocivaproducto para evitar la accion corrocivaproducto para evitar la accion corrocivaproducto para evitar la accion corrocivaproducto para evitar la accion corrocivaproducto para evitar la accion corrocivaproducto para evitar la accion corrocivaproducto para evitar la accion corrocivaproducto para evitar la accion corrociva	t	2016-07-20 21:53:00.873658-04:30
\.


--
-- Name: principal_productos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lau
--

SELECT pg_catalog.setval('principal_productos_id_seq', 4, true);


--
-- Data for Name: principal_publicaciones; Type: TABLE DATA; Schema: public; Owner: lau
--

COPY principal_publicaciones (id, titulo, portada, contenido, comentario, fecha_de_publicacion, status, author_id, tema_id) FROM stdin;
1	como buscarte	tutoriales/13140616_616003221882484_689272485_n_1tppycc.jpg	<p>lerem lorem lorem lorem lorem lerem lorem lorem lorem loremlerem lorem lorem lorem loremlerem lorem lorem lorem loremlerem lorem lorem lorem loremlerem lorem lorem lorem loremlerem lorem lorem lorem loremlerem lorem lorem lorem loremlerem lorem lorem lorem loremlerem lorem lorem lorem loremlerem lorem lorem lorem loremlerem lorem lorem lorem loremlerem lorem lorem lorem loremlerem lorem lorem lorem loremlerem lorem lorem lorem loremlerem lorem lorem lorem loremlerem lorem lorem lorem loremlerem lorem lorem lorem loremlerem lorem lorem lorem loremlerem lorem lorem lorem loremlerem lorem lorem lorem loremlerem lorem lorem lorem loremlerem lorem lorem lorem loremlerem lorem lorem lorem loremlerem lorem lorem lorem loremlerem lorem lorem lorem loremlerem lorem lorem lorem loremlerem lorem lorem lorem loremlerem lorem lorem lorem loremlerem lorem lorem lorem loremlerem lorem lorem lorem loremlerem lorem lorem lorem loremlerem lorem lorem lorem loremlerem lorem lorem lorem loremlerem lorem lorem lorem loremlerem lorem lorem lorem loremlerem lorem lorem lorem loremlerem<img alt="" src="/media/upload/2016/05/19/captura-de-pantalla-de-2015-11-11-072608.png" style="height:300px; width:400px" /> lorem lorem lorem loremlerem lorem lorem lorem loremlerem lorem lorem lorem loremlerem lorem lorem lorem loremlerem lorem lorem lorem loremlerem lorem lorem lorem loremlerem lorem lorem lorem loremlerem lorem lorem lorem loremlerem lorem lorem lorem loremlerem lorem lorem lorem loremlerem lorem lorem lorem loremlerem lorem lorem lorem loremlerem lorem lorem lorem loremlerem lorem lorem lorem loremlerem lorem lorem lorem loremlerem lorem lorem lorem loremlerem lorem lorem lorem loremlerem lorem lorem lorem loremlerem lorem lorem lorem loremlerem lorem lorem lorem loremlerem lorem lorem lorem loremlerem lorem lorem lorem loremlerem lorem lorem lorem loremlerem lorem lorem lorem loremlerem lorem lorem lorem loremlerem lorem lorem lorem loremlerem lorem lorem lorem loremlerem lorem lorem lorem loremlerem lorem lorem lorem loremlerem lorem lorem lorem loremlerem lorem lorem lorem loremlerem lorem lorem lorem loremlerem lorem lorem lorem loremlerem lorem lorem lorem loremlerem lorem lorem lorem loremlerem lorem lorem lorem loremlerem lorem lorem lorem loremlerem lorem lorem lorem loremlerem lorem lorem lorem loremlerem lorem lorem lorem loremlerem lorem lorem lorem loremlerem lorem lorem lorem loremlerem lorem lorem lorem loremlerem lorem lorem lorem loremlerem lorem lorem lorem loremlerem lorem lorem lorem loremlerem lorem lorem lorem loremlerem lorem lorem lorem loremlerem lorem lorem lorem loremlerem lorem lorem lorem loremlerem lorem lorem lorem loremlerem lorem lorem lorem loremlerem lorem lorem lorem loremlerem lorem lorem lorem lorem</p>	el amor	2016-07-21	P	1	1
2	como creerte	tutoriales/images_QJKSv0i.jpeg	<p>sadasdadasd asdasdasd dasdasdasd sadasdadasd asdasdasd dasdasdasdsadasdadasd asdasdasd dasdasdasdsadasdadasd asdasdasd dasdasdasdsadasdadasd asdasdasd dasdasdasdsadasdadasd asdasdasd dasdasdasdsadasdadasd asdasdasd dasdasdasdsadasdadasd asdasdasd dasdasdasdsadasdadasd asdasdasd dasdasdasdsadasdadasd asdasdasd dasdasdasdsadasdadasd asdasdasd dasdasdasdsadasdadasd asdasdasd dasdasdasdsadasdadasd asdasdasd dasdasdasdsadasdadasd asdasdasd dasdasdasdsadasdadasd asdasdasd dasdasdasdsadasdadasd asdasdasd dasdasdasdsadasdadasd asdasdasd dasdasdasdsadasdadasd asdasdasd dasdasdasdsadasdadasd asdasdasd dasdasdasdsadasdadasd asdasdasd dasdasdasdsadasdadasd asdasdasd dasdasdasdsadasdadasd asdasdasd dasdasdasdsadasdadasd asdasdasd dasdasdasdsadasdadasd asdasdasd dasdasdasdsadasdadasd asdasdasd dasdasdasdsadasdadasd asdasdasd dasdasdasdsadasdadasd asdasdasd dasdasdasdsadasdadasd asdasdasd dasdasdasdsadasdadasd asdasdasd dasdasdasdsadasdadasd asdasdasd dasdasdasdsadasdadasd asdasdasd dasdasdasdsadasdadasd asdasdasd dasdasdasdsadasdadasd asdasdasd dasdasdasdsadasdadasd asdasdasd dasdasdasdsadasdadasd asdasdasd dasdasdasdsadasdadasd asdasdasd dasdasdasdsadasdadasd asdasdasd dasdasdasdsadasdadasd sadasdadasd asdasdasd dasdasdasdsadasdadasd asdasdasd dasdasdasdsadasdadasd asdasdasd dasdasdasdsadasdadasd asdasdasd dasdasdasdsadasdadasd asdasdasd dasdasdasdsadasdadasd asdasdasd dasdasdasdsadasdadasd asdasdasd dasdasdasdsadasdadasd asdasdasd dasdasdasdasdasdasd dasdasdasdsadasdadasd asdasdasd dasdasdasdsadasdadasd asdasdasd dasdasdasdsadasdadasd asdasdasd dasdasdasdsadasdadasd asdasdasd dasdasdasdsadasdadasd asdasdasd dasdasdasdsadasdadasd asdasdasd dasdasdasdsadasdadasd asdasdasd dasdasdasdsadasdadasd asdasdasd dasdasdasdsadasdadasd asdasdasd dasdasdasdsadasdadasd asdasdasd dasdasdasdsadasdadasd asdasdasd dasdasdasdsadasdadasd asdasdasd dasdasdasdsadasdadasd asdasdasd dasdasdasdsadasdadasd asdasdasd dasdasdasdsadasdadasd asdasdasd dasdasdasdsadasdadasd asdasdasd dasdasdasdsadasdadasd asdasdasd dasdasdasdsadasdadasd asdasdasd dasdasdasdsadasdadasd asdasdasd dasdasdasdsadasdadasd asdasdasd dasdasdasdsadasdadasd asdasdasd dasdasdasdsadasdadasd asdasdasd dasdasdasdsadasdadasd asdasdasd dasdasdasdsadasdadasd asdasdasd dasdasdasdsadasdadasd asdasdasd dasdasdasdsadasdadasd asdasdasd dasdasdasdsadasdadasd asdasdasd dasdasdasdsadasdadasd asdasdasd dasdasdasdsadasdadasd asdasdasd dasdasdasdsadasdadasd asdasdasd dasdasdasdsadasdadasd asdasdasd dasdasdasdsadasdadasd asdasdasd dasdasdasdsadasdadasd asdasdasd dasdasdasdsadasdadasd asdasdasd dasdasdasdsadasdadasd asdasdasd dasdasdasdsadasdadasd asdasdasd dasdasdasdsadasdadasd asdasdasd dasdasdasdsadasdadasd asdasdasd dasdasdasdsadasdadasd asdasdasd dasdasdasdsadasdadasd asdasdasd dasdasdasdsadasdadasd asdasdasd dasdasdasd</p>	adad	2016-07-21	P	1	1
3	como quitar las manchas del acne	tutoriales/como-quitar-manchas-de-acne_7zhHlys.jpg	<p>sadasdasdas asdasdasd asdadsas dasdasdas&nbsp; sadasdasdas asdasdasd asdadsas dasdasdas sadasdasdas asdasdasd asdadsas dasdasdas sadasdasdas asdasdasd asdadsas dasdasdas sadasdasdas asdasdasd asdadsas dasdasdas sadasdasdas asdasdasd asdadsas dasdasdas sadasdasdas asdasdasd asdadsas dasdasdas sadasdasdas asdasdasd asdadsas dasdasdas sadasdasdas asdasdasd asdadsas dasdasdas sadasdasdas asdasdasd asdadsas dasdasdas sadasdasdas asdasdasd asdadsas dasdasdas sadasdasdas asdasdasd asdadsas dasdasdas sadasdasdas asdasdasd asdadsas dasdasdas sadasdasdas asdasdasd asdadsas dasdasdas sadasdasdas asdasdasd asdadsas dasdasdas sadasdasdas asdasdasd asdadsas dasdasdas sadasdasdas asdasdasd asdadsas dasdasdas sadasdasdas asdasdasd asdadsas dasdasdas sadasdasdas asdasdasd asdadsas dasdasdas sadasdasdas asdasdasd asdadsas dasdasdas sadasdasdas asdasdasd asdadsas dasdasdas sadasdasdas asdasdasd asdadsas dasdasdas sadasdasdas asdasdasd asdadsas dasdasdas sadasdasdas asdasdasd asdadsas dasdasdas sadasdasdas asdasdasd asdadsas dasdasdas sadasdasdas asdasdasd asdadsas dasdasdas sadasdasdas asdasdasd asdadsas dasdasdas sadasdasdas asdasdasd asdadsas dasdasdas sadasdasdas asdasdasd asdadsas dasdasdas sadasdasdas asdasdasd asdadsas dasdasdas sadasdasdas asdasdasd asdadsas dasdasdas sadasdasdas asdasdasd asdadsas dasdasdas sadasdasdas asdasdasd asdadsas dasdasdas sadasdasdas asdasdasd asdadsas dasdasdas sadasdasdas asdasdasd asdadsas dasdasdas sadasdasdas asdasdasd asdadsas dasdasdas sadasdasdas asdasdasd asdadsas dasdasdas sadasdasdas asdasdasd asdadsas dasdasdas sadasdasdas asdasdasd asdadsas dasdasdas sadasdasdas asdasdasd asdadsas dasdasdas sadasdasdas asdasdasd asdadsas dasdasdas sadasdasdas asdasdasd asdadsas dasdasdas sadasdasdas asdasdasd asdadsas dasdasdas sadasdasdas asdasdasd asdadsas dasdasdas sadasdasdas asdasdasd asdadsas dasdasdas sadasdasdas asdasdasd asdadsas dasdasdas sadasdasdas asdasdasd asdadsas dasdasdas sadasdasdas asdasdasd asdadsas dasdasdas sadasdasdas asdasdasd asdadsas dasdasdas sadasdasdas asdasdasd asdadsas dasdasdas sadasdasdas asdasdasd asdadsas dasdasdas sadasdasdas asdasdasd asdadsas dasdasdas sadasdasdas asdasdasd asdadsas dasdasdas sadasdasdas asdasdasd asdadsas dasdasdas sadasdasdas asdasdasd asdadsas dasdasdas sadasdasdas asdasdasd asdadsas dasdasdas sadasdasdas asdasdasd asdadsas dasdasdas sadasdasdas asdasdasd asdadsas dasdasdas sadasdasdas asdasdasd asdadsas dasdasdas sadasdasdas asdasdasd asdadsas dasdasdas sadasdasdas asdasdasd asdadsas dasdasdas sadasdasdas asdasdasd asdadsas dasdasdas sadasdasdas asdasdasd asdadsas dasdasdas sadasdasdas asdasdasd asdadsas dasdasdas sadasdasdas asdasdasd asdadsas dasdasdas sadasdasdas asdasdasd asdadsas dasdasdas sadasdasdas asdasdasd asdadsas dasdasdas sadasdasdas asdasdasd asdadsas dasdasdas</p>	acne	2016-07-21	P	1	2
4	como limpiar la cara de espinilla	tutoriales/como-limpiar-la-cara-de-espinillas_3aJVU7f.jpg	<p>&nbsp;cutis cutis cutiscutis cutis cutiscutis cutis cutiscutis cutis cutiscutis cutis cutiscutis cutis cutiscutis cutis cutiscutis cutis cutiscutis cutis cutiscutis cutis cutiscutis cutis cutiscutis cutis cutiscutis cutis cutiscutis cutis cutiscutis cutis cutiscutis cutis cutiscutis cutis cutiscutis cutis cutiscutis cutis cutiscutis cutis cutiscutis cutis cutiscutis cutis cutiscutis cutis cutiscutis cutis cutiscutis cutis cutiscutis cutis cutiscutis cutis cutiscutis cutis cutiscutis cutis cutiscutis cutis cutiscutis cutis cutiscutis cutis cutiscutis cutis cutiscutis cutis cutiscutis cutis cutiscutis cutis cutiscutis cutis cutiscutis cutis cutiscutis cutis cutiscutis cutis cutiscutis cutis cutiscutis cutis cutiscutis cutis cutiscutis cutis cutiscutis cutis cutiscutis cutis cutiscutis cutis cutiscutis cutis cutiscutis cutis cutiscutis cutis cutiscutis cutis cutiscutis cutis cutiscutis cutis cutiscutis cutis cutiscutis cutis cutiscutis cutis cutiscutis cutis cutiscutis cutis cutiscutis cutis cutiscutis cutis cutiscutis cutis cutiscutis cutis cutiscutis cutis cutiscutis cutis cutiscutis cutis cutiscutis cutis cutiscutis cutis cutiscutis cutis cutiscutis cutis cutiscutis cutis cutiscutis cutis cutiscutis cutis cutiscutis cutis cutiscutis cutis cutiscutis cutis cutiscutis cutis cutiscutis cutis cutiscutis cutis cutiscutis cutis cutiscutis cutis cutiscutis cutis cutiscutis cutis cutiscutis cutis cutiscutis cutis cutiscutis cutis cutiscutis cutis cutiscutis cutis cutiscutis cutis cutiscutis cutis cutiscutis cutis cutiscutis cutis cutiscutis cutis cutiscutis cutis cutiscutis cutis cutiscutis cutis cutiscutis cutis cutiscutis cutis cutiscutis cutis cutiscutis cutis cutiscutis cutis cutiscutis cutis cutiscutis cutis cutiscutis cutis cutiscutis cutis cutiscutis cutis cutiscutis cutis cutiscutis cutis cutiscutis cutis cutiscutis cutis cutiscutis cutis cutiscutis cutis cutiscutis cutis cutiscutis cutis cutiscutis cutis cutiscutis cutis cutiscutis cutis cutiscutis cutis cutiscutis cutis cutiscutis cutis cutiscutis cutis cutiscutis cutis cutiscutis cutis cutiscutis cutis cutiscutis cutis cutiscutis cutis cutiscutis cutis cutiscutis cutis cutiscutis cutis cutiscutis cutis cutiscutis cutis cutiscutis cutis cutiscutis cutis cutiscutis cutis cutiscutis cutis cutiscutis cutis cutiscutis cutis cutiscutis cutis cutiscutis cutis cutiscutis cutis cutiscutis cutis cutiscutis cutis cutiscutis cutis cutiscutis cutis cutiscutis cutis cutiscutis cutis cutiscutis cutis cutiscutis cutis cutiscutis cutis cutiscutis cutis cutiscutis cutis cutiscutis cutis cutiscutis cutis cutiscutis cutis cutiscutis cutis cutiscutis cutis cutiscutis cutis cutiscutis cutis cutiscutis cutis cutiscutis cutis cutiscutis cutis cutiscutis cutis cutiscutis cutis cutiscutis cutis cutiscutis cutis cutiscutis cutis cutiscutis cutis cutiscutis cutis cutiscutis cutis cutiscutis cutis cutiscutis cutis cutiscutis cutis cutiscutis cutis cutiscutis cutis cutiscutis cutis cutiscutis cutis cutiscutis cutis cutiscutis cutis cutiscutis cutis cutiscutis cutis cutiscutis cutis cutiscutis cutis cutiscutis cutis cutisvcutis cutis cutis</p>	cutis cutis cutis	2016-07-21	P	1	2
5	como reducir el estres	tutoriales/mujer-palpitaciones_MdhxI0a.jpg	<p>como reducir el estrescomo reducir el estrescomo reducir el estrescomo reducir el estrescomo reducir el estrescomo reducir el estrescomo reducir el estrescomo reducir el estrescomo reducir el estrescomo reducir el estrescomo reducir el estrescomo reducir el estrescomo reducir el estrescomo reducir el estrescomo reducir el estrescomo reducir el estrescomo reducir el estrescomo reducir el estrescomo reducir el estrescomo reducir el estrescomo reducir el estrescomo reducir el estrescomo reducir el estrescomo reducir el estrescomo reducir el estrescomo reducir el estrescomo reducir el estrescomo reducir el estrescomo reducir el estrescomo reducir el estrescomo reducir el estrescomo reducir el estrescomo reducir el estrescomo reducir el estrescomo reducir el estrescomo reducir el estrescomo reducir el estrescomo reducir el estrescomo reducir el estrescomo reducir el estrescomo reducir el estrescomo reducir el estrescomo reducir el estrescomo reducir el estrescomo reducir el estrescomo reducir el estrescomo reducir el estrescomo reducir el estrescomo reducir el estrescomo reducir el estrescomo reducir el estrescomo reducir el estrescomo reducir el estrescomo reducir el estrescomo reducir el estrescomo reducir el estrescomo reducir el estrescomo reducir el estrescomo reducir el estrescomo reducir el estrescomo reducir el estrescomo reducir el estrescomo reducir el estrescomo reducir el estrescomo reducir el estrescomo reducir el estrescomo reducir el estrescomo reducir el estrescomo reducir el estrescomo reducir el estrescomo reducir el estrescomo reducir el estrescomo reducir el estrescomo reducir el estrescomo reducir el estrescomo reducir el estrescomo reducir el estrescomo reducir el estrescomo reducir el estrescomo reducir el estrescomo reducir el estrescomo reducir el estrescomo reducir el estrescomo reducir el estrescomo reducir el estrescomo reducir el estrescomo reducir el estrescomo reducir el estrescomo reducir el estrescomo reducir el estrescomo reducir el estrescomo reducir el estrescomo reducir el estrescomo reducir el estrescomo reducir el estrescomo reducir el estrescomo reducir el estrescomo reducir el estrescomo reducir el estrescomo reducir el estrescomo reducir el estrescomo reducir el estrescomo reducir el estrescomo reducir el estrescomo reducir el estrescomo reducir el estrescomo reducir el estrescomo reducir el estrescomo reducir el estrescomo reducir el estrescomo reducir el estrescomo reducir el estrescomo reducir el estrescomo reducir el estrescomo reducir el estrescomo reducir el estrescomo reducir el estrescomo reducir el estrescomo reducir el estrescomo reducir el estrescomo reducir el estrescomo reducir el estrescomo reducir el estrescomo reducir el estrescomo reducir el estrescomo reducir el estrescomo reducir el estrescomo reducir el estresvcomo reducir el estrescomo reducir el estrescomo reducir el estrescomo reducir el estrescomo reducir el estrescomo reducir el estrescomo reducir el estrescomo reducir el estrescomo reducir el estrescomo reducir el estrescomo reducir el estrescomo reducir el estrescomo reducir el estrescomo reducir el estrescomo reducir el estrescomo reducir el estrescomo reducir el estrescomo reducir el estrescomo reducir el estrescomo reducir el estrescomo reducir el estrescomo reducir el estrescomo reducir el estrescomo reducir el estrescomo reducir el estrescomo reducir el estrescomo reducir el estrescomo reducir el estrescomo reducir el estrescomo reducir el estrescomo reducir el estrescomo reducir el estrescomo reducir el estrescomo reducir el estrescomo reducir el estrescomo reducir el estrescomo reducir el estrescomo reducir el estrescomo reducir el estrescomo reducir el estrescomo reducir el estrescomo reducir el estrescomo reducir el estrescomo reducir el estrescomo reducir el estrescomo reducir el estrescomo reducir el estrescomo reducir el estrescomo reducir el estrescomo reducir el estrescomo reducir el estrescomo reducir el estrescomo reducir el estres</p>	como reducir el estres	2016-07-21	P	1	3
6	los signos de una buena salud	tutoriales/indice_L7ejFgF.jpeg	<p>los signos de una buena salud los signos de una buena saludlos signos de una buena saludlos signos de una buena saludlos signos de una buena saludlos signos de una buena saludlos signos de una buena saludlos signos de una buena saludlos signos de una buena saludlos signos de una buena saludlos signos de una buena saludlos signos de una buena saludlos signos de una buena saludlos signos de una buena saludlos signos de una buena saludlos signos de una buena saludlos signos de una buena saludlos signos de una buena saludlos signos de una buena saludlos signos de una buena saludlos signos de una buena saludlos signos de una buena saludlos signos de una buena saludlos signos de una buena saludlos signos de una buena saludlos signos de una buena saludlos signos de una buena saludlos signos de una buena saludlos signos de una buena saludlos signos de una buena saludlos signos de una buena saludlos signos de una buena saludlos signos de una buena saludlos signos de una buena saludlos signos de una buena saludlos signos de una buena saludlos signos de una buena saludlos signos de una buena saludlos signos de una buena saludlos signos de una buena saludlos signos de una buena saludlos signos de una buena saludlos signos de una buena saludlos signos de una buena saludlos signos de una buena saludlos signos de una buena saludlos signos de una buena saludlos signos de una buena saludlos signos de una buena saludlos signos de una buena saludlos signos de una buena saludlos signos de una buena saludlos signos de una buena saludlos signos de una buena saludlos signos de una buena saludlos signos de una buena saludlos signos de una buena saludlos signos de una buena saludlos signos de una buena saludlos signos de una buena saludlos signos de una buena saludlos signos de una buena saludlos signos de una buena saludlos signos de una buena saludlos signos de una buena saludlos signos de una buena saludlos signos de una buena saludlos signos de una buena saludlos signos de una buena saludlos signos de una buena saludlos signos de una buena saludlos signos de una buena saludlos signos de una buena saludlos signos de una buena saludlos signos de una buena saludlos signos de una buena saludlos signos de una buena saludlos signos de una buena saludlos signos de una buena saludlos signos de una buena saludlos signos de una buena saludlos signos de una buena saludlos signos de una buena saludlos signos de una buena saludlos signos de una buena saludlos signos de una buena saludlos signos de una buena saludlos signos de una buena saludlos signos de una buena saludlos signos de una buena saludlos signos de una buena saludlos signos de una buena saludlos signos de una buena saludlos signos de una buena saludlos signos de una buena saludlos signos de una buena saludlos signos de una buena saludlos signos de una buena saludlos signos de una buena saludlos signos de una buena saludlos signos de una buena saludlos signos de una buena saludlos signos de una buena saludlos signos de una buena saludlos signos de una buena saludlos signos de una buena saludlos signos de una buena saludlos signos de una buena saludlos signos de una buena saludlos signos de una buena saludlos signos de una buena saludlos signos de una buena saludlos signos de una buena saludlos signos de una buena saludlos signos de una buena saludlos signos de una buena saludlos signos de una buena saludlos signos de una buena saludlos signos de una buena salud</p>	los signos de una buena salud	2016-07-21	P	1	3
7	cuida tu corazon	tutoriales/Colon-150x150_qHBACti.jpg	<p>cuida tu corazon cuida tu corazon cuida tu corazon cuida tu corazoncuida tu corazon cuida tu corazoncuida tu corazon cuida tu corazoncuida tu corazon cuida tu corazoncuida tu corazon cuida tu corazoncuida tu corazon cuida tu corazoncuida tu corazon cuida tu corazoncuida tu corazon cuida tu corazoncuida tu corazon cuida tu corazoncuida tu corazon cuida tu corazoncuida tu corazon cuida tu corazoncuida tu corazon cuida tu corazoncuida tu corazon cuida tu corazoncuida tu corazon cuida tu corazoncuida tu corazon cuida tu corazoncuida tu corazon cuida tu corazoncuida tu corazon cuida tu corazoncuida tu corazon cuida tu corazoncuida tu corazon cuida tu corazoncuida tu corazon cuida tu corazoncuida tu corazon cuida tu corazoncuida tu corazon cuida tu corazoncuida tu corazon cuida tu corazoncuida tu corazon cuida tu corazoncuida tu corazon cuida tu corazoncuida tu corazon cuida tu corazoncuida tu corazon cuida tu corazoncuida tu corazon cuida tu corazoncuida tu corazon cuida tu corazoncuida tu corazon cuida tu corazoncuida tu corazon cuida tu corazoncuida tu corazon cuida tu corazoncuida tu corazon cuida tu corazoncuida tu corazon cuida tu corazoncuida tu corazon cuida tu corazoncuida tu corazon cuida tu corazoncuida tu corazon cuida tu corazoncuida tu corazon cuida tu corazoncuida tu corazon cuida tu corazoncuida tu corazon cuida tu corazoncuida tu corazon cuida tu corazoncuida tu corazon cuida tu corazoncuida tu corazon cuida tu corazoncuida tu corazon cuida tu corazoncuida tu corazon cuida tu corazoncuida tu corazon cuida tu corazoncuida tu corazon cuida tu corazoncuida tu corazon cuida tu corazoncuida tu corazon cuida tu corazoncuida tu corazon cuida tu corazoncuida tu corazon cuida tu corazoncuida tu corazon cuida tu corazoncuida tu corazon cuida tu corazoncuida tu corazon cuida tu corazoncuida tu corazon cuida tu corazoncuida tu corazon cuida tu corazoncuida tu corazon cuida tu corazoncuida tu corazon cuida tu corazoncuida tu corazon cuida tu corazoncuida tu corazon cuida tu corazoncuida tu corazon cuida tu corazoncuida tu corazon cuida tu corazoncuida tu corazon cuida tu corazoncuida tu corazon cuida tu corazoncuida tu corazon cuida tu corazoncuida tu corazon cuida tu corazoncuida tu corazon cuida tu corazoncuida tu corazon cuida tu corazoncuida tu corazon cuida tu corazoncuida tu corazon cuida tu corazoncuida tu corazon cuida tu corazoncuida tu corazon cuida tu corazoncuida tu corazon cuida tu corazoncuida tu corazon cuida tu corazoncuida tu corazon cuida tu corazoncuida tu corazon cuida tu corazoncuida tu corazon cuida tu corazoncuida tu corazon cuida tu corazoncuida tu corazon cuida tu corazoncuida tu corazon cuida tu corazoncuida tu corazon cuida tu corazoncuida tu corazon cuida tu corazoncuida tu corazon cuida tu corazoncuida tu corazon cuida tu corazoncuida tu corazon cuida tu corazoncuida tu corazon cuida tu corazoncuida tu corazon cuida tu corazoncuida tu corazon cuida tu corazoncuida tu corazon cuida tu corazoncuida tu corazon cuida tu corazoncuida tu corazon cuida tu corazoncuida tu corazon cuida tu corazoncuida tu corazon cuida tu corazoncuida tu corazon cuida tu corazoncuida tu corazon cuida tu corazoncuida tu corazon cuida tu corazoncuida tu corazon cuida tu corazoncuida tu corazon cuida tu corazoncuida tu corazon cuida tu corazoncuida tu corazon cuida tu corazoncuida tu corazon cuida tu corazoncuida tu corazon cuida tu corazoncuida tu corazon cuida tu corazoncuida tu corazon cuida tu corazoncuida tu corazon cuida tu corazoncuida tu corazon cuida tu corazoncuida tu corazon cuida tu corazoncuida tu corazon cuida tu corazoncuida tu corazon cuida tu corazoncuida tu corazon cuida tu corazoncuida tu corazon cuida tu corazoncuida tu corazon cuida tu corazoncuida tu corazon cuida tu corazoncuida tu corazon cuida tu corazoncuida tu corazon cuida tu corazoncuida tu corazon cuida tu corazoncuida tu corazon cuida tu corazoncuida tu corazon cuida tu corazoncuida tu corazon cuida tu corazoncuida tu corazon cuida tu corazoncuida tu corazon cuida tu corazoncuida tu corazon cuida tu corazoncuida tu corazon cuida tu corazoncuida tu corazon cuida tu corazoncuida tu corazon cuida tu corazoncuida tu corazon cuida tu corazoncuida tu corazon cuida tu corazoncuida tu corazon cuida tu corazoncuida tu corazon cuida tu corazoncuida tu corazon cuida tu corazoncuida tu corazon cuida tu corazoncuida tu corazon cuida tu corazoncuida tu corazon cuida tu corazoncuida tu corazon cuida tu corazoncuida tu corazon cuida tu corazoncuida tu corazon cuida tu corazoncuida tu corazon cuida tu corazoncuida tu corazon cuida tu corazoncuida tu corazon cuida tu corazoncuida tu corazon cuida tu corazoncuida tu corazon cuida tu corazoncuida tu corazon cuida tu corazoncuida tu corazon cuida tu corazoncuida tu corazon cuida</p>	cuida tu corazon	2016-07-21	P	1	3
\.


--
-- Name: principal_publicaciones_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lau
--

SELECT pg_catalog.setval('principal_publicaciones_id_seq', 7, true);


--
-- Data for Name: principal_tema_publicacion; Type: TABLE DATA; Schema: public; Owner: lau
--

COPY principal_tema_publicacion (id, tema, descripcion) FROM stdin;
1	variado	teas variados de distos temas
2	cutis	tema relacionado con la piel
3	salud	tema sobre la salu
\.


--
-- Name: principal_tema_publicacion_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lau
--

SELECT pg_catalog.setval('principal_tema_publicacion_id_seq', 3, true);


--
-- Data for Name: principal_testimonios; Type: TABLE DATA; Schema: public; Owner: lau
--

COPY principal_testimonios (id, nombre, paciente, fecha_de_consulta, testimonios, observaciones, habilitado, imagen) FROM stdin;
2	mareos repentinos	alexa ortis	2016-07-05 17:33:30-04:30	me mareaba mucho me mareaba muchome mareaba muchome mareaba muchome mareaba muchome mareaba muchome mareaba muchome mareaba muchome mareaba muchome mareaba muchome mareaba muchome mareaba muchome mareaba muchome mareaba muchome mareaba muchome mareaba muchome mareaba muchome mareaba muchome mareaba muchome mareaba muchome mareaba muchome mareaba muchome mareaba muchome mareaba mucho	me mareaba muchome mareaba muchome mareaba muchome mareaba muchome mareaba muchome mareaba muchome mareaba muchome mareaba muchome mareaba mucho	t	testimonios/biografia_mso8aMX.png
4	dolor de oidos	jose suarez	2016-07-01 17:36:33-04:30	me dolia el oido me dolia el oidome dolia el oidome dolia el oidome dolia el oidome dolia el oidome dolia el oidome dolia el oidome dolia el oidome dolia el oidome dolia el oidome dolia el oidome dolia el oidome dolia el oidome dolia el oidome dolia el oidome dolia el oidome dolia el oidome dolia el oidome dolia el oidome dolia el oidome dolia el oidome dolia el oidome dolia el oidome dolia el oidome dolia el oidome dolia el oidome dolia el oidome dolia el oidome dolia el oidome dolia el oidome dolia el oidome dolia el oidome dolia el oidome dolia el oidome dolia el oidome dolia el oidome dolia el oidome dolia el oidome dolia el oidome dolia el oidome dolia el oidome dolia el oidome dolia el oidome dolia el oidome dolia el oidome dolia el oidome dolia el oidome dolia el oidome dolia el oidome dolia el oidome dolia el oidome dolia el oidome dolia el oidome dolia el oidome dolia el oidome dolia el oido	me dolia el oidome dolia el oidome dolia el oidome dolia el oidome dolia el oidome dolia el oidome dolia el oidome dolia el oidome dolia el oidome dolia el oidome dolia el oidome dolia el oidome dolia el oidome dolia el oidome dolia el oidome dolia el oidome dolia el oidome dolia el oidome dolia el oidome dolia el oidome dolia el oidome dolia el oidome dolia el oidome dolia el oidome dolia el oidome dolia el oidome dolia el oidome dolia el oidome dolia el oidome dolia el oidome dolia el oidome dolia el oidome dolia el oidome dolia el oidome dolia el oidome dolia el oidome dolia el oidome dolia el oidome dolia el oidome dolia el oidome dolia el oidome dolia el oidome dolia el oidome dolia el oidome dolia el oidome dolia el oidome dolia el oidome dolia el oidome dolia el oidome dolia el oidome dolia el oidovv	t	testimonios/solo.jpg
3	dolor de espalda	carmina estrada	2016-07-06 01:30:00-04:30	carmina estradacarmina estradacarmina estradacarmina estradacarmina estradacarmina estradacarmina estradacarmina estradacarmina estradacarmina estradacarmina estradacarmina estradacarmina estradacarmina estradacarmina estradacarmina estradacarmina estradacarmina estradacarmina estradacarmina estradacarmina estradacarmina estradacarmina estradacarmina estradacarmina estradacarmina estradacarmina estradacarmina estradacarmina estradacarmina estradacarmina estradacarmina estradacarmina estradacarmina estradacarmina estradacarmina estradacarmina estradacarmina estradacarmina estradacarmina estradacarmina estradacarmina estrada	carmina estradacarmina estradacarmina estradacarmina estradacarmina estradacarmina estradacarmina estradacarmina estradacarmina estradacarmina estradacarmina estradacarmina estradacarmina estradacarmina estradacarmina estradacarmina estradacarmina estradacarmina estradacarmina estradacarmina estradacarmina estradacarmina estradacarmina estradacarmina estradacarmina estradacarmina estradacarmina estradacarmina estradacarmina estradacarmina estradacarmina estradacarmina estradacarmina estradacarmina estradacarmina estradacarmina estradacarmina estradacarmina estradacarmina estradacarmina estradacarmina estradacarmina estradacarmina estradacarmina estradacarmina estradacarmina estradacarmina estrada	t	testimonios/biografia.png
1	dolor de huesos	roza campos	2016-07-05 01:30:00-04:30	me dolian los huesos pero pude lograr salir adelanteme dolian los huesos pero pude lograr salir adelanteme dolian los huesos pero pude lograr salir adelanteme dolian los huesos pero pude lograr salir adelanteme dolian los huesos pero pude lograr salir adelanteme dolian los huesos pero pude lograr salir adelanteme dolian los huesos pero pude lograr salir adelanteme dolian los huesos pero pude lograr salir adelante	me dolian los huesos pero pude lograr salir adelanteme dolian los huesos pero pude lograr salir adelanteme dolian los huesos pero pude lograr salir adelanteme dolian los huesos pero pude lograr salir adelanteme dolian los huesos pero pude lograr salir adelanteme dolian los huesos pero pude lograr salir adelanteme dolian los huesos pero pude lograr salir adelanteme dolian los huesos pero pude lograr salir adelante	t	testimonios/biografia_1L6tnCf.png
\.


--
-- Name: principal_testimonios_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lau
--

SELECT pg_catalog.setval('principal_testimonios_id_seq', 4, true);


--
-- Name: auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: lau; Tablespace: 
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions_group_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: lau; Tablespace: 
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: lau; Tablespace: 
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: lau; Tablespace: 
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission_content_type_id_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: lau; Tablespace: 
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: lau; Tablespace: 
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: lau; Tablespace: 
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups_user_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: lau; Tablespace: 
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: lau; Tablespace: 
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: lau; Tablespace: 
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions_user_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: lau; Tablespace: 
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: lau; Tablespace: 
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: lau; Tablespace: 
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type_app_label_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: lau; Tablespace: 
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_app_label_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: lau; Tablespace: 
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: lau; Tablespace: 
--

ALTER TABLE ONLY django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: lau; Tablespace: 
--

ALTER TABLE ONLY django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: principal_perfil_author_author_id_key; Type: CONSTRAINT; Schema: public; Owner: lau; Tablespace: 
--

ALTER TABLE ONLY principal_perfil_author
    ADD CONSTRAINT principal_perfil_author_author_id_key UNIQUE (author_id);


--
-- Name: principal_perfil_author_pkey; Type: CONSTRAINT; Schema: public; Owner: lau; Tablespace: 
--

ALTER TABLE ONLY principal_perfil_author
    ADD CONSTRAINT principal_perfil_author_pkey PRIMARY KEY (id);


--
-- Name: principal_productos_nombre_key; Type: CONSTRAINT; Schema: public; Owner: lau; Tablespace: 
--

ALTER TABLE ONLY principal_productos
    ADD CONSTRAINT principal_productos_nombre_key UNIQUE (nombre);


--
-- Name: principal_productos_pkey; Type: CONSTRAINT; Schema: public; Owner: lau; Tablespace: 
--

ALTER TABLE ONLY principal_productos
    ADD CONSTRAINT principal_productos_pkey PRIMARY KEY (id);


--
-- Name: principal_publicaciones_pkey; Type: CONSTRAINT; Schema: public; Owner: lau; Tablespace: 
--

ALTER TABLE ONLY principal_publicaciones
    ADD CONSTRAINT principal_publicaciones_pkey PRIMARY KEY (id);


--
-- Name: principal_publicaciones_titulo_199ec49a_uniq; Type: CONSTRAINT; Schema: public; Owner: lau; Tablespace: 
--

ALTER TABLE ONLY principal_publicaciones
    ADD CONSTRAINT principal_publicaciones_titulo_199ec49a_uniq UNIQUE (titulo);


--
-- Name: principal_tema_publicacion_pkey; Type: CONSTRAINT; Schema: public; Owner: lau; Tablespace: 
--

ALTER TABLE ONLY principal_tema_publicacion
    ADD CONSTRAINT principal_tema_publicacion_pkey PRIMARY KEY (id);


--
-- Name: principal_tema_publicacion_tema_af0b0b7e_uniq; Type: CONSTRAINT; Schema: public; Owner: lau; Tablespace: 
--

ALTER TABLE ONLY principal_tema_publicacion
    ADD CONSTRAINT principal_tema_publicacion_tema_af0b0b7e_uniq UNIQUE (tema);


--
-- Name: principal_testimonios_nombre_a3418005_uniq; Type: CONSTRAINT; Schema: public; Owner: lau; Tablespace: 
--

ALTER TABLE ONLY principal_testimonios
    ADD CONSTRAINT principal_testimonios_nombre_a3418005_uniq UNIQUE (nombre);


--
-- Name: principal_testimonios_pkey; Type: CONSTRAINT; Schema: public; Owner: lau; Tablespace: 
--

ALTER TABLE ONLY principal_testimonios
    ADD CONSTRAINT principal_testimonios_pkey PRIMARY KEY (id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: lau; Tablespace: 
--

CREATE INDEX auth_group_name_a6ea08ec_like ON auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_0e939a4f; Type: INDEX; Schema: public; Owner: lau; Tablespace: 
--

CREATE INDEX auth_group_permissions_0e939a4f ON auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_8373b171; Type: INDEX; Schema: public; Owner: lau; Tablespace: 
--

CREATE INDEX auth_group_permissions_8373b171 ON auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_417f1b1c; Type: INDEX; Schema: public; Owner: lau; Tablespace: 
--

CREATE INDEX auth_permission_417f1b1c ON auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_0e939a4f; Type: INDEX; Schema: public; Owner: lau; Tablespace: 
--

CREATE INDEX auth_user_groups_0e939a4f ON auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_e8701ad4; Type: INDEX; Schema: public; Owner: lau; Tablespace: 
--

CREATE INDEX auth_user_groups_e8701ad4 ON auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_8373b171; Type: INDEX; Schema: public; Owner: lau; Tablespace: 
--

CREATE INDEX auth_user_user_permissions_8373b171 ON auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_e8701ad4; Type: INDEX; Schema: public; Owner: lau; Tablespace: 
--

CREATE INDEX auth_user_user_permissions_e8701ad4 ON auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: lau; Tablespace: 
--

CREATE INDEX auth_user_username_6821ab7c_like ON auth_user USING btree (username varchar_pattern_ops);


--
-- Name: django_admin_log_417f1b1c; Type: INDEX; Schema: public; Owner: lau; Tablespace: 
--

CREATE INDEX django_admin_log_417f1b1c ON django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_e8701ad4; Type: INDEX; Schema: public; Owner: lau; Tablespace: 
--

CREATE INDEX django_admin_log_e8701ad4 ON django_admin_log USING btree (user_id);


--
-- Name: django_session_de54fa62; Type: INDEX; Schema: public; Owner: lau; Tablespace: 
--

CREATE INDEX django_session_de54fa62 ON django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: lau; Tablespace: 
--

CREATE INDEX django_session_session_key_c0390e0f_like ON django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: principal_productos_nombre_9068edb8_like; Type: INDEX; Schema: public; Owner: lau; Tablespace: 
--

CREATE INDEX principal_productos_nombre_9068edb8_like ON principal_productos USING btree (nombre varchar_pattern_ops);


--
-- Name: principal_publicaciones_4f331e2f; Type: INDEX; Schema: public; Owner: lau; Tablespace: 
--

CREATE INDEX principal_publicaciones_4f331e2f ON principal_publicaciones USING btree (author_id);


--
-- Name: principal_publicaciones_c80e9cdc; Type: INDEX; Schema: public; Owner: lau; Tablespace: 
--

CREATE INDEX principal_publicaciones_c80e9cdc ON principal_publicaciones USING btree (tema_id);


--
-- Name: principal_publicaciones_titulo_199ec49a_like; Type: INDEX; Schema: public; Owner: lau; Tablespace: 
--

CREATE INDEX principal_publicaciones_titulo_199ec49a_like ON principal_publicaciones USING btree (titulo varchar_pattern_ops);


--
-- Name: principal_tema_publicacion_tema_af0b0b7e_like; Type: INDEX; Schema: public; Owner: lau; Tablespace: 
--

CREATE INDEX principal_tema_publicacion_tema_af0b0b7e_like ON principal_tema_publicacion USING btree (tema varchar_pattern_ops);


--
-- Name: principal_testimonios_nombre_a3418005_like; Type: INDEX; Schema: public; Owner: lau; Tablespace: 
--

CREATE INDEX principal_testimonios_nombre_a3418005_like ON principal_testimonios USING btree (nombre varchar_pattern_ops);


--
-- Name: auth_group_permiss_permission_id_84c5c92e_fk_auth_permission_id; Type: FK CONSTRAINT; Schema: public; Owner: lau
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permiss_permission_id_84c5c92e_fk_auth_permission_id FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: lau
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permiss_content_type_id_2f476e4b_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: lau
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permiss_content_type_id_2f476e4b_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: lau
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: lau
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_per_permission_id_1fbb5f2c_fk_auth_permission_id; Type: FK CONSTRAINT; Schema: public; Owner: lau
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_per_permission_id_1fbb5f2c_fk_auth_permission_id FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: lau
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_content_type_id_c4bce8eb_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: lau
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_content_type_id_c4bce8eb_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: lau
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: principal_perfil_author_author_id_1bf5ed65_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: lau
--

ALTER TABLE ONLY principal_perfil_author
    ADD CONSTRAINT principal_perfil_author_author_id_1bf5ed65_fk_auth_user_id FOREIGN KEY (author_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: principal_pub_tema_id_8ffcb500_fk_principal_tema_publicacion_id; Type: FK CONSTRAINT; Schema: public; Owner: lau
--

ALTER TABLE ONLY principal_publicaciones
    ADD CONSTRAINT principal_pub_tema_id_8ffcb500_fk_principal_tema_publicacion_id FOREIGN KEY (tema_id) REFERENCES principal_tema_publicacion(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: principal_publicaciones_author_id_0fddf025_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: lau
--

ALTER TABLE ONLY principal_publicaciones
    ADD CONSTRAINT principal_publicaciones_author_id_0fddf025_fk_auth_user_id FOREIGN KEY (author_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

