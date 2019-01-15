--
-- PostgreSQL database dump
--

-- Dumped from database version 10.5
-- Dumped by pg_dump version 10.5

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: alexrogers823
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO alexrogers823;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: alexrogers823
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO alexrogers823;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: alexrogers823
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: alexrogers823
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO alexrogers823;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: alexrogers823
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO alexrogers823;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: alexrogers823
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: alexrogers823
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO alexrogers823;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: alexrogers823
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO alexrogers823;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: alexrogers823
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: alexrogers823
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO alexrogers823;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: alexrogers823
--

CREATE TABLE public.auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO alexrogers823;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: alexrogers823
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO alexrogers823;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: alexrogers823
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: alexrogers823
--

CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO alexrogers823;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: alexrogers823
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: alexrogers823
--

CREATE TABLE public.auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO alexrogers823;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: alexrogers823
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO alexrogers823;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: alexrogers823
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: alexrogers823
--

CREATE TABLE public.django_admin_log (
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


ALTER TABLE public.django_admin_log OWNER TO alexrogers823;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: alexrogers823
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO alexrogers823;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: alexrogers823
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: alexrogers823
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO alexrogers823;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: alexrogers823
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO alexrogers823;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: alexrogers823
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: alexrogers823
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO alexrogers823;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: alexrogers823
--

CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO alexrogers823;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: alexrogers823
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: alexrogers823
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO alexrogers823;

--
-- Name: expenses_banks; Type: TABLE; Schema: public; Owner: alexrogers823
--

CREATE TABLE public.expenses_banks (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    abbr character varying(100) NOT NULL
);


ALTER TABLE public.expenses_banks OWNER TO alexrogers823;

--
-- Name: expenses_banks_id_seq; Type: SEQUENCE; Schema: public; Owner: alexrogers823
--

CREATE SEQUENCE public.expenses_banks_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.expenses_banks_id_seq OWNER TO alexrogers823;

--
-- Name: expenses_banks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: alexrogers823
--

ALTER SEQUENCE public.expenses_banks_id_seq OWNED BY public.expenses_banks.id;


--
-- Name: expenses_categories; Type: TABLE; Schema: public; Owner: alexrogers823
--

CREATE TABLE public.expenses_categories (
    id integer NOT NULL,
    category character varying(100) NOT NULL
);


ALTER TABLE public.expenses_categories OWNER TO alexrogers823;

--
-- Name: expenses_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: alexrogers823
--

CREATE SEQUENCE public.expenses_categories_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.expenses_categories_id_seq OWNER TO alexrogers823;

--
-- Name: expenses_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: alexrogers823
--

ALTER SEQUENCE public.expenses_categories_id_seq OWNED BY public.expenses_categories.id;


--
-- Name: expenses_expenses; Type: TABLE; Schema: public; Owner: alexrogers823
--

CREATE TABLE public.expenses_expenses (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    amount numeric(7,2) NOT NULL,
    date_posted timestamp with time zone NOT NULL,
    last_updated timestamp with time zone NOT NULL,
    user_id integer NOT NULL,
    bank_id_id integer,
    category_id integer,
    month character varying(2) NOT NULL,
    year character varying(4) NOT NULL
);


ALTER TABLE public.expenses_expenses OWNER TO alexrogers823;

--
-- Name: expenses_expenses_id_seq; Type: SEQUENCE; Schema: public; Owner: alexrogers823
--

CREATE SEQUENCE public.expenses_expenses_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.expenses_expenses_id_seq OWNER TO alexrogers823;

--
-- Name: expenses_expenses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: alexrogers823
--

ALTER SEQUENCE public.expenses_expenses_id_seq OWNED BY public.expenses_expenses.id;


--
-- Name: users_userprofile; Type: TABLE; Schema: public; Owner: alexrogers823
--

CREATE TABLE public.users_userprofile (
    id integer NOT NULL,
    image character varying(100) NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.users_userprofile OWNER TO alexrogers823;

--
-- Name: users_userprofile_id_seq; Type: SEQUENCE; Schema: public; Owner: alexrogers823
--

CREATE SEQUENCE public.users_userprofile_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_userprofile_id_seq OWNER TO alexrogers823;

--
-- Name: users_userprofile_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: alexrogers823
--

ALTER SEQUENCE public.users_userprofile_id_seq OWNED BY public.users_userprofile.id;


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: alexrogers823
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: alexrogers823
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: alexrogers823
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: alexrogers823
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: alexrogers823
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: alexrogers823
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: alexrogers823
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: alexrogers823
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: alexrogers823
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: expenses_banks id; Type: DEFAULT; Schema: public; Owner: alexrogers823
--

ALTER TABLE ONLY public.expenses_banks ALTER COLUMN id SET DEFAULT nextval('public.expenses_banks_id_seq'::regclass);


--
-- Name: expenses_categories id; Type: DEFAULT; Schema: public; Owner: alexrogers823
--

ALTER TABLE ONLY public.expenses_categories ALTER COLUMN id SET DEFAULT nextval('public.expenses_categories_id_seq'::regclass);


--
-- Name: expenses_expenses id; Type: DEFAULT; Schema: public; Owner: alexrogers823
--

ALTER TABLE ONLY public.expenses_expenses ALTER COLUMN id SET DEFAULT nextval('public.expenses_expenses_id_seq'::regclass);


--
-- Name: users_userprofile id; Type: DEFAULT; Schema: public; Owner: alexrogers823
--

ALTER TABLE ONLY public.users_userprofile ALTER COLUMN id SET DEFAULT nextval('public.users_userprofile_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: alexrogers823
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: alexrogers823
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: alexrogers823
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add permission	2	add_permission
6	Can change permission	2	change_permission
7	Can delete permission	2	delete_permission
8	Can view permission	2	view_permission
9	Can add group	3	add_group
10	Can change group	3	change_group
11	Can delete group	3	delete_group
12	Can view group	3	view_group
13	Can add user	4	add_user
14	Can change user	4	change_user
15	Can delete user	4	delete_user
16	Can view user	4	view_user
17	Can add content type	5	add_contenttype
18	Can change content type	5	change_contenttype
19	Can delete content type	5	delete_contenttype
20	Can view content type	5	view_contenttype
21	Can add session	6	add_session
22	Can change session	6	change_session
23	Can delete session	6	delete_session
24	Can view session	6	view_session
25	Can add expenses	7	add_expenses
26	Can change expenses	7	change_expenses
27	Can delete expenses	7	delete_expenses
28	Can view expenses	7	view_expenses
29	Can add banks	8	add_banks
30	Can change banks	8	change_banks
31	Can delete banks	8	delete_banks
32	Can view banks	8	view_banks
33	Can add categories	9	add_categories
34	Can change categories	9	change_categories
35	Can delete categories	9	delete_categories
36	Can view categories	9	view_categories
37	Can add user profile	10	add_userprofile
38	Can change user profile	10	change_userprofile
39	Can delete user profile	10	delete_userprofile
40	Can view user profile	10	view_userprofile
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: alexrogers823
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
2	pbkdf2_sha256$120000$vuiiQ3FmWOJP$ExZZ/vBe86zetP1+u1esKXm4ehu+Zkr94ER/09ubPwU=	\N	f	orcharduser1				f	t	2018-12-29 13:44:59.954777-05
4	pbkdf2_sha256$120000$JS3mfAlFHU0D$B9JYOzlBj1ijFN0lOqUCxenkboRZwmjpQ8F9l4L95N4=	\N	f	exptester			etester@test.com	f	t	2019-01-07 10:18:04.675943-05
3	pbkdf2_sha256$120000$ZtKGUA3rGib2$fsUSHsO2UI/hGQxkQYkF8tGyUhW6JVF1dmU1f8wTz0c=	2019-01-13 18:58:02.147215-05	f	fatboi				f	t	2019-01-07 10:08:26.744659-05
5	pbkdf2_sha256$120000$aibGVYlX9slV$/UzKRRMZxQyPFuTl0bjV8ib260RDayVaFJNOQBe2zoc=	2019-01-13 19:10:14.422142-05	f	skinnyboi			sku@sku.com	f	t	2019-01-13 17:05:54.650217-05
6	pbkdf2_sha256$120000$dl6VmEM7cTwQ$beL5BbjW3RHBw6Y3QqtN3RFDFB0OIXDl1QYyuSG6R4g=	\N	f	stupidboi			stupidboi@haha.com	f	t	2019-01-14 14:32:39.086332-05
7	pbkdf2_sha256$120000$X6sEtoG7kUkT$XeDugGP4K2limFDF74CHSAHeo8u3Tet4QTyAZj7Ae50=	\N	f	interestedMan			interested@call.com	f	t	2019-01-14 14:43:57.854925-05
8	pbkdf2_sha256$120000$PQNRr2lFe7xy$WiDE1TI4JekQbdxGZyq2qTspFAth15ClRzsMA2PWFOk=	\N	f	dumbboi			dummy@dumb.com	f	t	2019-01-14 14:45:42.293098-05
9	pbkdf2_sha256$120000$0Xx6qv3z9fGG$AhNurdUPSthFilzBjq/7x4CpGGHb0SupnMWH0yKwbo4=	\N	f	dumbass			another@dumbass.com	f	t	2019-01-14 14:47:22.126555-05
10	pbkdf2_sha256$120000$2UZOQM0YrVgK$VDj6YBegn4sTeyuQIRfisAu3H0+Xj72BfuBIjxzccSw=	2019-01-14 14:49:17.667039-05	f	tester			test@testing.com	f	t	2019-01-14 14:48:53.300849-05
1	pbkdf2_sha256$120000$IRL5gb7LpRPj$LQQRd99zIiVdGh8dslHKgvuaBHoFQiZ457o4113uEgY=	2019-01-15 15:24:06.661848-05	t	alexrogers823			alex.rogers823@gmail.com	t	t	2018-12-29 12:33:55.214822-05
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: alexrogers823
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: alexrogers823
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: alexrogers823
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2018-12-29 13:45:00.177344-05	2	orcharduser1	1	[{"added": {}}]	4	1
2	2019-01-11 10:00:30.590137-05	1	alexrogers823 Profile	1	[{"added": {}}]	10	1
3	2019-01-11 10:03:16.848884-05	2	fatboi Profile	1	[{"added": {}}]	10	1
4	2019-01-11 10:13:53.181635-05	2	fatboi Profile	3		10	1
5	2019-01-11 10:13:53.23162-05	1	alexrogers823 Profile	3		10	1
6	2019-01-11 10:14:52.740866-05	3	alexrogers823 Profile	1	[{"added": {}}]	10	1
7	2019-01-11 10:15:04.414515-05	4	fatboi Profile	1	[{"added": {}}]	10	1
8	2019-01-13 18:56:42.36998-05	32	LYFT *RIDE TUE 12PM 855-280-0278 CA	3		7	1
9	2019-01-13 18:56:42.624239-05	31	PUBLIX #664 ATLANTA GA	3		7	1
10	2019-01-13 18:56:42.625431-05	30	QT 773 CHAMBLEE GA	3		7	1
11	2019-01-13 18:56:42.626548-05	29	KROGER 259 ATLANTA GA	3		7	1
12	2019-01-13 18:56:42.627947-05	28	VESTA *AT&T 866-608-3007 OR2VDXUHMAGV9	3		7	1
13	2019-01-13 18:56:42.629488-05	27	PUBLIX #1363 BROOKHAVEN GA	3		7	1
14	2019-01-13 18:56:42.630587-05	26	QT 730 SANDY SPRINGSGA	3		7	1
15	2019-01-13 18:56:42.631484-05	25	KROGER 259 ATLANTA GA	3		7	1
16	2019-01-13 18:56:42.63237-05	24	PUBLIX #1363 BROOKHAVEN GA	3		7	1
17	2019-01-13 18:56:42.633298-05	23	KROGER 259 ATLANTA GA	3		7	1
18	2019-01-13 18:56:42.634078-05	22	SPOTIFY NEW YORK CITYNY	3		7	1
19	2019-01-13 18:56:42.668069-05	21	TEAMTREEHOUSE.COM 800-928-2130 FL	3		7	1
20	2019-01-13 18:56:42.66933-05	20	NETFLIX.COM NETFLIX.COM CA24874476184	3		7	1
21	2019-01-13 18:56:42.670282-05	19	KROGER 259 ATLANTA GA	3		7	1
22	2019-01-13 18:56:42.671232-05	18	CHEVRON 0352356 ATLANTA GA00352356 5621922	3		7	1
23	2019-01-13 18:56:42.672307-05	17	PUBLIX #1363 BROOKHAVEN GA	3		7	1
24	2019-01-13 18:56:42.673248-05	16	RACETRAC 2400024489974 ATLANTA GA	3		7	1
25	2019-01-13 18:56:42.674049-05	15	INTERNET PAYMENT - THANK YOU	3		7	1
26	2019-01-13 18:56:42.674957-05	14	KROGER 259 ATLANTA GA	3		7	1
27	2019-01-13 18:56:42.675857-05	13	QT 765 ALPHARETTA GA	3		7	1
28	2019-01-13 18:56:42.676742-05	12	KROGER 259 ATLANTA GA	3		7	1
29	2019-01-13 18:56:42.677961-05	11	PUBLIX #1363 BROOKHAVEN GA	3		7	1
30	2019-01-13 18:56:42.679062-05	10	KROGER 259 ATLANTA GA	3		7	1
31	2019-01-13 18:56:42.680048-05	7	Haircut	3		7	1
32	2019-01-13 18:56:42.680973-05	6	pizza	3		7	1
33	2019-01-13 18:56:42.681931-05	5	Krispy Kreme	3		7	1
34	2019-01-13 18:56:42.710547-05	3	Netflix	3		7	1
35	2019-01-13 18:56:42.711648-05	2	Waffles	3		7	1
36	2019-01-13 18:56:42.712628-05	1	Screwdriver	3		7	1
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: alexrogers823
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	auth	user
5	contenttypes	contenttype
6	sessions	session
7	expenses	expenses
8	expenses	banks
9	expenses	categories
10	users	userprofile
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: alexrogers823
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2018-12-21 12:32:09.93857-05
2	auth	0001_initial	2018-12-21 12:32:10.182516-05
3	admin	0001_initial	2018-12-21 12:32:10.289674-05
4	admin	0002_logentry_remove_auto_add	2018-12-21 12:32:10.298956-05
5	admin	0003_logentry_add_action_flag_choices	2018-12-21 12:32:10.310659-05
6	contenttypes	0002_remove_content_type_name	2018-12-21 12:32:10.372233-05
7	auth	0002_alter_permission_name_max_length	2018-12-21 12:32:10.390342-05
8	auth	0003_alter_user_email_max_length	2018-12-21 12:32:10.402133-05
9	auth	0004_alter_user_username_opts	2018-12-21 12:32:10.412304-05
10	auth	0005_alter_user_last_login_null	2018-12-21 12:32:10.423811-05
11	auth	0006_require_contenttypes_0002	2018-12-21 12:32:10.42531-05
12	auth	0007_alter_validators_add_error_messages	2018-12-21 12:32:10.434479-05
13	auth	0008_alter_user_username_max_length	2018-12-21 12:32:10.447368-05
14	auth	0009_alter_user_last_name_max_length	2018-12-21 12:32:10.460241-05
15	sessions	0001_initial	2018-12-21 12:32:10.470058-05
16	expenses	0001_initial	2018-12-29 13:38:47.616214-05
17	expenses	0002_auto_20181229_1926	2018-12-29 14:26:30.752924-05
18	expenses	0003_banks	2018-12-30 18:05:04.545926-05
19	expenses	0004_expenses_bank_id	2018-12-31 17:49:50.556781-05
20	expenses	0005_auto_20190108_1625	2019-01-08 11:25:21.007864-05
21	users	0001_initial	2019-01-11 09:53:48.989361-05
22	expenses	0006_auto_20190112_1410	2019-01-12 09:11:06.443546-05
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: alexrogers823
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
92qp4otu0zqcvo9tn62uwglmtmaxhyt8	MmQ0YTBjZjU3MTYyYmRhZGFkOThlN2Y0ZmQyOGEwMGViZGQwNWVhOTp7fQ==	2019-01-27 17:43:29.596413-05
qotquwm4nnv2jjoiife2wmhq4zxgbvj6	NThjYWE2MzExNTU0ZjdjZDU4OGY3OTcyMTQ1NDg1MDkxNjEwMTM2OTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIwNGU4ZDRmZjBjZDQ4YWQwMTFiZTlhNTgwZmEyYWM2ZWJjYTk2Mzk3In0=	2019-01-29 15:24:06.683669-05
\.


--
-- Data for Name: expenses_banks; Type: TABLE DATA; Schema: public; Owner: alexrogers823
--

COPY public.expenses_banks (id, name, abbr) FROM stdin;
1	Discover	
\.


--
-- Data for Name: expenses_categories; Type: TABLE DATA; Schema: public; Owner: alexrogers823
--

COPY public.expenses_categories (id, category) FROM stdin;
1	Supermarkets
2	Gasoline
3	Payments and Credits
4	Services
5	Education
6	Merchandise
7	Travel/ Entertainment
8	Restaurants
9	Interest
\.


--
-- Data for Name: expenses_expenses; Type: TABLE DATA; Schema: public; Owner: alexrogers823
--

COPY public.expenses_expenses (id, name, amount, date_posted, last_updated, user_id, bank_id_id, category_id, month, year) FROM stdin;
33	KROGER 259 ATLANTA GA	9.14	2018-11-05 19:00:00-05	2019-01-13 19:06:11.042167-05	3	1	1	11	2006
34	PUBLIX #1363 BROOKHAVEN GA	46.40	2018-11-03 20:00:00-04	2019-01-13 19:06:11.295673-05	3	1	1	11	2004
35	KROGER 259 ATLANTA GA	5.98	2018-11-02 20:00:00-04	2019-01-13 19:06:11.300987-05	3	1	1	11	2003
36	QT 765 ALPHARETTA GA	7.86	2018-11-02 20:00:00-04	2019-01-13 19:06:11.30688-05	3	1	2	11	2003
37	KROGER 259 ATLANTA GA	5.98	2018-10-31 20:00:00-04	2019-01-13 19:06:11.312003-05	3	1	1	11	2001
38	INTERNET PAYMENT - THANK YOU	-404.52	2018-10-29 20:00:00-04	2019-01-13 19:06:11.318369-05	3	1	3	10	2030
39	RACETRAC 2400024489974 ATLANTA GA	6.50	2018-10-29 20:00:00-04	2019-01-13 19:06:11.323478-05	3	1	2	10	2030
40	PUBLIX #1363 BROOKHAVEN GA	17.84	2018-10-27 20:00:00-04	2019-01-13 19:06:11.370247-05	3	1	1	10	2028
41	CHEVRON 0352356 ATLANTA GA00352356 5621922	7.00	2018-10-26 20:00:00-04	2019-01-13 19:06:11.376011-05	3	1	2	10	2027
42	KROGER 259 ATLANTA GA	5.98	2018-10-26 20:00:00-04	2019-01-13 19:06:11.422102-05	3	1	1	10	2027
43	NETFLIX.COM NETFLIX.COM CA24874476184	10.99	2018-10-26 20:00:00-04	2019-01-13 19:06:11.510141-05	3	1	4	10	2027
44	TEAMTREEHOUSE.COM 800-928-2130 FL	25.00	2018-10-26 20:00:00-04	2019-01-13 19:06:11.59747-05	3	1	5	10	2027
45	SPOTIFY NEW YORK CITYNY	9.99	2018-10-25 20:00:00-04	2019-01-13 19:06:11.602269-05	3	1	6	10	2026
46	KROGER 259 ATLANTA GA	6.52	2018-10-24 20:00:00-04	2019-01-13 19:06:11.606891-05	3	1	1	10	2025
47	PUBLIX #1363 BROOKHAVEN GA	17.80	2018-10-23 20:00:00-04	2019-01-13 19:06:11.638932-05	3	1	1	10	2024
48	KROGER 259 ATLANTA GA	7.61	2018-10-21 20:00:00-04	2019-01-13 19:06:11.645748-05	3	1	1	10	2022
49	QT 730 SANDY SPRINGSGA	9.76	2018-10-21 20:00:00-04	2019-01-13 19:06:11.650512-05	3	1	2	10	2022
50	PUBLIX #1363 BROOKHAVEN GA	13.98	2018-10-20 20:00:00-04	2019-01-13 19:06:11.654998-05	3	1	1	10	2021
51	VESTA *AT&T 866-608-3007 OR2VDXUHMAGV9	60.14	2018-10-18 20:00:00-04	2019-01-13 19:06:11.660372-05	3	1	4	10	2019
52	KROGER 259 ATLANTA GA	5.98	2018-10-17 20:00:00-04	2019-01-13 19:06:11.664764-05	3	1	1	10	2018
53	QT 773 CHAMBLEE GA	6.50	2018-10-17 20:00:00-04	2019-01-13 19:06:11.709365-05	3	1	2	10	2018
54	PUBLIX #664 ATLANTA GA	5.98	2018-10-16 20:00:00-04	2019-01-13 19:06:11.714706-05	3	1	1	10	2017
55	LYFT *RIDE TUE 12PM 855-280-0278 CA	15.45	2018-10-15 20:00:00-04	2019-01-13 19:06:11.720326-05	3	1	7	10	2016
56	KROGER 259 ATLANTA GA	9.14	2018-11-05 19:00:00-05	2019-01-13 19:10:21.02008-05	5	1	1	11	2006
57	PUBLIX #1363 BROOKHAVEN GA	46.40	2018-11-03 20:00:00-04	2019-01-13 19:10:21.107988-05	5	1	1	11	2004
58	KROGER 259 ATLANTA GA	5.98	2018-11-02 20:00:00-04	2019-01-13 19:10:21.153209-05	5	1	1	11	2003
59	QT 765 ALPHARETTA GA	7.86	2018-11-02 20:00:00-04	2019-01-13 19:10:21.198981-05	5	1	2	11	2003
60	KROGER 259 ATLANTA GA	5.98	2018-10-31 20:00:00-04	2019-01-13 19:10:21.203595-05	5	1	1	11	2001
61	INTERNET PAYMENT - THANK YOU	-404.52	2018-10-29 20:00:00-04	2019-01-13 19:10:21.208697-05	5	1	3	10	2030
62	RACETRAC 2400024489974 ATLANTA GA	6.50	2018-10-29 20:00:00-04	2019-01-13 19:10:21.214049-05	5	1	2	10	2030
63	PUBLIX #1363 BROOKHAVEN GA	17.84	2018-10-27 20:00:00-04	2019-01-13 19:10:21.2189-05	5	1	1	10	2028
64	CHEVRON 0352356 ATLANTA GA00352356 5621922	7.00	2018-10-26 20:00:00-04	2019-01-13 19:10:21.223144-05	5	1	2	10	2027
65	KROGER 259 ATLANTA GA	5.98	2018-10-26 20:00:00-04	2019-01-13 19:10:21.22717-05	5	1	1	10	2027
66	NETFLIX.COM NETFLIX.COM CA24874476184	10.99	2018-10-26 20:00:00-04	2019-01-13 19:10:21.230994-05	5	1	4	10	2027
67	TEAMTREEHOUSE.COM 800-928-2130 FL	25.00	2018-10-26 20:00:00-04	2019-01-13 19:10:21.234859-05	5	1	5	10	2027
68	SPOTIFY NEW YORK CITYNY	9.99	2018-10-25 20:00:00-04	2019-01-13 19:10:21.239431-05	5	1	6	10	2026
69	KROGER 259 ATLANTA GA	6.52	2018-10-24 20:00:00-04	2019-01-13 19:10:21.244581-05	5	1	1	10	2025
70	PUBLIX #1363 BROOKHAVEN GA	17.80	2018-10-23 20:00:00-04	2019-01-13 19:10:21.24953-05	5	1	1	10	2024
71	KROGER 259 ATLANTA GA	7.61	2018-10-21 20:00:00-04	2019-01-13 19:10:21.254293-05	5	1	1	10	2022
72	QT 730 SANDY SPRINGSGA	9.76	2018-10-21 20:00:00-04	2019-01-13 19:10:21.259457-05	5	1	2	10	2022
73	PUBLIX #1363 BROOKHAVEN GA	13.98	2018-10-20 20:00:00-04	2019-01-13 19:10:21.263507-05	5	1	1	10	2021
74	VESTA *AT&T 866-608-3007 OR2VDXUHMAGV9	60.14	2018-10-18 20:00:00-04	2019-01-13 19:10:21.267788-05	5	1	4	10	2019
75	KROGER 259 ATLANTA GA	5.98	2018-10-17 20:00:00-04	2019-01-13 19:10:21.273007-05	5	1	1	10	2018
76	QT 773 CHAMBLEE GA	6.50	2018-10-17 20:00:00-04	2019-01-13 19:10:21.277409-05	5	1	2	10	2018
77	PUBLIX #664 ATLANTA GA	5.98	2018-10-16 20:00:00-04	2019-01-13 19:10:21.281316-05	5	1	1	10	2017
78	LYFT *RIDE TUE 12PM 855-280-0278 CA	15.45	2018-10-15 20:00:00-04	2019-01-13 19:10:21.285863-05	5	1	7	10	2016
79	KROGER 259 ATLANTA GA	9.14	2018-11-05 19:00:00-05	2019-01-13 19:20:35.510183-05	5	1	1	11	2006
80	PUBLIX #1363 BROOKHAVEN GA	46.40	2018-11-03 20:00:00-04	2019-01-13 19:20:35.712299-05	5	1	1	11	2004
81	KROGER 259 ATLANTA GA	5.98	2018-11-02 20:00:00-04	2019-01-13 19:20:35.758389-05	5	1	1	11	2003
82	QT 765 ALPHARETTA GA	7.86	2018-11-02 20:00:00-04	2019-01-13 19:20:36.029781-05	5	1	2	11	2003
83	KROGER 259 ATLANTA GA	5.98	2018-10-31 20:00:00-04	2019-01-13 19:20:36.076397-05	5	1	1	11	2001
84	INTERNET PAYMENT - THANK YOU	-404.52	2018-10-29 20:00:00-04	2019-01-13 19:20:36.122002-05	5	1	3	10	2030
85	RACETRAC 2400024489974 ATLANTA GA	6.50	2018-10-29 20:00:00-04	2019-01-13 19:20:36.167792-05	5	1	2	10	2030
86	PUBLIX #1363 BROOKHAVEN GA	17.84	2018-10-27 20:00:00-04	2019-01-13 19:20:36.213343-05	5	1	1	10	2028
87	CHEVRON 0352356 ATLANTA GA00352356 5621922	7.00	2018-10-26 20:00:00-04	2019-01-13 19:20:36.293505-05	5	1	2	10	2027
88	KROGER 259 ATLANTA GA	5.98	2018-10-26 20:00:00-04	2019-01-13 19:20:36.347161-05	5	1	1	10	2027
89	NETFLIX.COM NETFLIX.COM CA24874476184	10.99	2018-10-26 20:00:00-04	2019-01-13 19:20:36.574193-05	5	1	4	10	2027
90	TEAMTREEHOUSE.COM 800-928-2130 FL	25.00	2018-10-26 20:00:00-04	2019-01-13 19:20:36.578911-05	5	1	5	10	2027
91	SPOTIFY NEW YORK CITYNY	9.99	2018-10-25 20:00:00-04	2019-01-13 19:20:36.583779-05	5	1	6	10	2026
92	KROGER 259 ATLANTA GA	6.52	2018-10-24 20:00:00-04	2019-01-13 19:20:36.58877-05	5	1	1	10	2025
93	PUBLIX #1363 BROOKHAVEN GA	17.80	2018-10-23 20:00:00-04	2019-01-13 19:20:36.592998-05	5	1	1	10	2024
94	KROGER 259 ATLANTA GA	7.61	2018-10-21 20:00:00-04	2019-01-13 19:20:36.597666-05	5	1	1	10	2022
95	QT 730 SANDY SPRINGSGA	9.76	2018-10-21 20:00:00-04	2019-01-13 19:20:36.601703-05	5	1	2	10	2022
96	PUBLIX #1363 BROOKHAVEN GA	13.98	2018-10-20 20:00:00-04	2019-01-13 19:20:36.606368-05	5	1	1	10	2021
97	VESTA *AT&T 866-608-3007 OR2VDXUHMAGV9	60.14	2018-10-18 20:00:00-04	2019-01-13 19:20:36.611051-05	5	1	4	10	2019
98	KROGER 259 ATLANTA GA	5.98	2018-10-17 20:00:00-04	2019-01-13 19:20:36.615361-05	5	1	1	10	2018
99	QT 773 CHAMBLEE GA	6.50	2018-10-17 20:00:00-04	2019-01-13 19:20:36.621212-05	5	1	2	10	2018
100	PUBLIX #664 ATLANTA GA	5.98	2018-10-16 20:00:00-04	2019-01-13 19:20:36.626964-05	5	1	1	10	2017
101	LYFT *RIDE TUE 12PM 855-280-0278 CA	15.45	2018-10-15 20:00:00-04	2019-01-13 19:20:36.631276-05	5	1	7	10	2016
102	KROGER 259 ATLANTA GA	9.14	2018-11-05 19:00:00-05	2019-01-13 19:25:32.655007-05	1	1	1	11	2006
103	PUBLIX #1363 BROOKHAVEN GA	46.40	2018-11-03 20:00:00-04	2019-01-13 19:25:32.893088-05	1	1	1	11	2004
104	KROGER 259 ATLANTA GA	5.98	2018-11-02 20:00:00-04	2019-01-13 19:25:32.940361-05	1	1	1	11	2003
105	QT 765 ALPHARETTA GA	7.86	2018-11-02 20:00:00-04	2019-01-13 19:25:32.944815-05	1	1	2	11	2003
106	KROGER 259 ATLANTA GA	5.98	2018-10-31 20:00:00-04	2019-01-13 19:25:32.949202-05	1	1	1	11	2001
107	INTERNET PAYMENT - THANK YOU	-404.52	2018-10-29 20:00:00-04	2019-01-13 19:25:32.953504-05	1	1	3	10	2030
108	RACETRAC 2400024489974 ATLANTA GA	6.50	2018-10-29 20:00:00-04	2019-01-13 19:25:32.957504-05	1	1	2	10	2030
109	PUBLIX #1363 BROOKHAVEN GA	17.84	2018-10-27 20:00:00-04	2019-01-13 19:25:32.961866-05	1	1	1	10	2028
110	CHEVRON 0352356 ATLANTA GA00352356 5621922	7.00	2018-10-26 20:00:00-04	2019-01-13 19:25:32.966262-05	1	1	2	10	2027
111	KROGER 259 ATLANTA GA	5.98	2018-10-26 20:00:00-04	2019-01-13 19:25:32.971032-05	1	1	1	10	2027
112	NETFLIX.COM NETFLIX.COM CA24874476184	10.99	2018-10-26 20:00:00-04	2019-01-13 19:25:32.975247-05	1	1	4	10	2027
113	TEAMTREEHOUSE.COM 800-928-2130 FL	25.00	2018-10-26 20:00:00-04	2019-01-13 19:25:32.979089-05	1	1	5	10	2027
114	SPOTIFY NEW YORK CITYNY	9.99	2018-10-25 20:00:00-04	2019-01-13 19:25:32.982953-05	1	1	6	10	2026
115	KROGER 259 ATLANTA GA	6.52	2018-10-24 20:00:00-04	2019-01-13 19:25:32.986883-05	1	1	1	10	2025
116	PUBLIX #1363 BROOKHAVEN GA	17.80	2018-10-23 20:00:00-04	2019-01-13 19:25:32.991055-05	1	1	1	10	2024
117	KROGER 259 ATLANTA GA	7.61	2018-10-21 20:00:00-04	2019-01-13 19:25:32.994957-05	1	1	1	10	2022
118	QT 730 SANDY SPRINGSGA	9.76	2018-10-21 20:00:00-04	2019-01-13 19:25:32.999055-05	1	1	2	10	2022
119	PUBLIX #1363 BROOKHAVEN GA	13.98	2018-10-20 20:00:00-04	2019-01-13 19:25:33.002876-05	1	1	1	10	2021
120	VESTA *AT&T 866-608-3007 OR2VDXUHMAGV9	60.14	2018-10-18 20:00:00-04	2019-01-13 19:25:33.007019-05	1	1	4	10	2019
121	KROGER 259 ATLANTA GA	5.98	2018-10-17 20:00:00-04	2019-01-13 19:25:33.010976-05	1	1	1	10	2018
122	QT 773 CHAMBLEE GA	6.50	2018-10-17 20:00:00-04	2019-01-13 19:25:33.014967-05	1	1	2	10	2018
123	PUBLIX #664 ATLANTA GA	5.98	2018-10-16 20:00:00-04	2019-01-13 19:25:33.019289-05	1	1	1	10	2017
124	LYFT *RIDE TUE 12PM 855-280-0278 CA	15.45	2018-10-15 20:00:00-04	2019-01-13 19:25:33.023387-05	1	1	7	10	2016
125	KROGER 259 ATLANTA GA	9.14	2018-11-05 19:00:00-05	2019-01-13 19:26:44.763412-05	1	1	1	11	2006
126	PUBLIX #1363 BROOKHAVEN GA	46.40	2018-11-03 20:00:00-04	2019-01-13 19:26:44.813729-05	1	1	1	11	2004
127	KROGER 259 ATLANTA GA	5.98	2018-11-02 20:00:00-04	2019-01-13 19:26:44.945316-05	1	1	1	11	2003
128	QT 765 ALPHARETTA GA	7.86	2018-11-02 20:00:00-04	2019-01-13 19:26:44.949992-05	1	1	2	11	2003
129	KROGER 259 ATLANTA GA	5.98	2018-10-31 20:00:00-04	2019-01-13 19:26:44.954388-05	1	1	1	11	2001
130	INTERNET PAYMENT - THANK YOU	-404.52	2018-10-29 20:00:00-04	2019-01-13 19:26:44.958814-05	1	1	3	10	2030
131	RACETRAC 2400024489974 ATLANTA GA	6.50	2018-10-29 20:00:00-04	2019-01-13 19:26:44.963103-05	1	1	2	10	2030
132	PUBLIX #1363 BROOKHAVEN GA	17.84	2018-10-27 20:00:00-04	2019-01-13 19:26:44.967442-05	1	1	1	10	2028
133	CHEVRON 0352356 ATLANTA GA00352356 5621922	7.00	2018-10-26 20:00:00-04	2019-01-13 19:26:44.971758-05	1	1	2	10	2027
134	KROGER 259 ATLANTA GA	5.98	2018-10-26 20:00:00-04	2019-01-13 19:26:44.97736-05	1	1	1	10	2027
135	NETFLIX.COM NETFLIX.COM CA24874476184	10.99	2018-10-26 20:00:00-04	2019-01-13 19:26:44.983628-05	1	1	4	10	2027
136	TEAMTREEHOUSE.COM 800-928-2130 FL	25.00	2018-10-26 20:00:00-04	2019-01-13 19:26:44.989745-05	1	1	5	10	2027
137	SPOTIFY NEW YORK CITYNY	9.99	2018-10-25 20:00:00-04	2019-01-13 19:26:44.996374-05	1	1	6	10	2026
138	KROGER 259 ATLANTA GA	6.52	2018-10-24 20:00:00-04	2019-01-13 19:26:45.002842-05	1	1	1	10	2025
139	PUBLIX #1363 BROOKHAVEN GA	17.80	2018-10-23 20:00:00-04	2019-01-13 19:26:45.008462-05	1	1	1	10	2024
140	KROGER 259 ATLANTA GA	7.61	2018-10-21 20:00:00-04	2019-01-13 19:26:45.014792-05	1	1	1	10	2022
141	QT 730 SANDY SPRINGSGA	9.76	2018-10-21 20:00:00-04	2019-01-13 19:26:45.020948-05	1	1	2	10	2022
142	PUBLIX #1363 BROOKHAVEN GA	13.98	2018-10-20 20:00:00-04	2019-01-13 19:26:45.026439-05	1	1	1	10	2021
143	VESTA *AT&T 866-608-3007 OR2VDXUHMAGV9	60.14	2018-10-18 20:00:00-04	2019-01-13 19:26:45.032465-05	1	1	4	10	2019
144	KROGER 259 ATLANTA GA	5.98	2018-10-17 20:00:00-04	2019-01-13 19:26:45.037239-05	1	1	1	10	2018
145	QT 773 CHAMBLEE GA	6.50	2018-10-17 20:00:00-04	2019-01-13 19:26:45.041604-05	1	1	2	10	2018
146	PUBLIX #664 ATLANTA GA	5.98	2018-10-16 20:00:00-04	2019-01-13 19:26:45.045695-05	1	1	1	10	2017
147	LYFT *RIDE TUE 12PM 855-280-0278 CA	15.45	2018-10-15 20:00:00-04	2019-01-13 19:26:45.049979-05	1	1	7	10	2016
148	KROGER 259 ATLANTA GA	9.14	2018-11-05 19:00:00-05	2019-01-13 19:31:26.269419-05	1	1	1	11	2006
149	PUBLIX #1363 BROOKHAVEN GA	46.40	2018-11-03 20:00:00-04	2019-01-13 19:31:26.312777-05	1	1	1	11	2004
150	KROGER 259 ATLANTA GA	5.98	2018-11-02 20:00:00-04	2019-01-13 19:31:26.358827-05	1	1	1	11	2003
151	QT 765 ALPHARETTA GA	7.86	2018-11-02 20:00:00-04	2019-01-13 19:31:26.363562-05	1	1	2	11	2003
152	KROGER 259 ATLANTA GA	5.98	2018-10-31 20:00:00-04	2019-01-13 19:31:26.367733-05	1	1	1	11	2001
153	INTERNET PAYMENT - THANK YOU	-404.52	2018-10-29 20:00:00-04	2019-01-13 19:31:26.372213-05	1	1	3	10	2030
154	RACETRAC 2400024489974 ATLANTA GA	6.50	2018-10-29 20:00:00-04	2019-01-13 19:31:26.377178-05	1	1	2	10	2030
155	PUBLIX #1363 BROOKHAVEN GA	17.84	2018-10-27 20:00:00-04	2019-01-13 19:31:26.381658-05	1	1	1	10	2028
156	CHEVRON 0352356 ATLANTA GA00352356 5621922	7.00	2018-10-26 20:00:00-04	2019-01-13 19:31:26.386838-05	1	1	2	10	2027
157	KROGER 259 ATLANTA GA	5.98	2018-10-26 20:00:00-04	2019-01-13 19:31:26.392836-05	1	1	1	10	2027
158	NETFLIX.COM NETFLIX.COM CA24874476184	10.99	2018-10-26 20:00:00-04	2019-01-13 19:31:26.399553-05	1	1	4	10	2027
159	TEAMTREEHOUSE.COM 800-928-2130 FL	25.00	2018-10-26 20:00:00-04	2019-01-13 19:31:26.403727-05	1	1	5	10	2027
160	SPOTIFY NEW YORK CITYNY	9.99	2018-10-25 20:00:00-04	2019-01-13 19:31:26.408035-05	1	1	6	10	2026
161	KROGER 259 ATLANTA GA	6.52	2018-10-24 20:00:00-04	2019-01-13 19:31:26.412529-05	1	1	1	10	2025
162	PUBLIX #1363 BROOKHAVEN GA	17.80	2018-10-23 20:00:00-04	2019-01-13 19:31:26.417485-05	1	1	1	10	2024
163	KROGER 259 ATLANTA GA	7.61	2018-10-21 20:00:00-04	2019-01-13 19:31:26.422266-05	1	1	1	10	2022
164	QT 730 SANDY SPRINGSGA	9.76	2018-10-21 20:00:00-04	2019-01-13 19:31:26.426682-05	1	1	2	10	2022
165	PUBLIX #1363 BROOKHAVEN GA	13.98	2018-10-20 20:00:00-04	2019-01-13 19:31:26.433362-05	1	1	1	10	2021
166	VESTA *AT&T 866-608-3007 OR2VDXUHMAGV9	60.14	2018-10-18 20:00:00-04	2019-01-13 19:31:26.439034-05	1	1	4	10	2019
167	KROGER 259 ATLANTA GA	5.98	2018-10-17 20:00:00-04	2019-01-13 19:31:26.443833-05	1	1	1	10	2018
168	QT 773 CHAMBLEE GA	6.50	2018-10-17 20:00:00-04	2019-01-13 19:31:26.44811-05	1	1	2	10	2018
169	PUBLIX #664 ATLANTA GA	5.98	2018-10-16 20:00:00-04	2019-01-13 19:31:26.453132-05	1	1	1	10	2017
170	LYFT *RIDE TUE 12PM 855-280-0278 CA	15.45	2018-10-15 20:00:00-04	2019-01-13 19:31:26.457367-05	1	1	7	10	2016
171	KROGER 259 ATLANTA GA	9.14	2018-11-05 19:00:00-05	2019-01-13 19:34:32.878689-05	1	1	1	11	2006
172	PUBLIX #1363 BROOKHAVEN GA	46.40	2018-11-03 20:00:00-04	2019-01-13 19:34:32.927101-05	1	1	1	11	2004
173	KROGER 259 ATLANTA GA	5.98	2018-11-02 20:00:00-04	2019-01-13 19:34:32.973756-05	1	1	1	11	2003
174	QT 765 ALPHARETTA GA	7.86	2018-11-02 20:00:00-04	2019-01-13 19:34:33.019635-05	1	1	2	11	2003
175	KROGER 259 ATLANTA GA	5.98	2018-10-31 20:00:00-04	2019-01-13 19:34:33.024123-05	1	1	1	11	2001
176	INTERNET PAYMENT - THANK YOU	-404.52	2018-10-29 20:00:00-04	2019-01-13 19:34:33.028819-05	1	1	3	10	2030
177	RACETRAC 2400024489974 ATLANTA GA	6.50	2018-10-29 20:00:00-04	2019-01-13 19:34:33.034783-05	1	1	2	10	2030
178	PUBLIX #1363 BROOKHAVEN GA	17.84	2018-10-27 20:00:00-04	2019-01-13 19:34:33.040352-05	1	1	1	10	2028
179	CHEVRON 0352356 ATLANTA GA00352356 5621922	7.00	2018-10-26 20:00:00-04	2019-01-13 19:34:33.045717-05	1	1	2	10	2027
180	KROGER 259 ATLANTA GA	5.98	2018-10-26 20:00:00-04	2019-01-13 19:34:33.050819-05	1	1	1	10	2027
181	NETFLIX.COM NETFLIX.COM CA24874476184	10.99	2018-10-26 20:00:00-04	2019-01-13 19:34:33.055968-05	1	1	4	10	2027
182	TEAMTREEHOUSE.COM 800-928-2130 FL	25.00	2018-10-26 20:00:00-04	2019-01-13 19:34:33.061287-05	1	1	5	10	2027
183	SPOTIFY NEW YORK CITYNY	9.99	2018-10-25 20:00:00-04	2019-01-13 19:34:33.065807-05	1	1	6	10	2026
184	KROGER 259 ATLANTA GA	6.52	2018-10-24 20:00:00-04	2019-01-13 19:34:33.070569-05	1	1	1	10	2025
185	PUBLIX #1363 BROOKHAVEN GA	17.80	2018-10-23 20:00:00-04	2019-01-13 19:34:33.074955-05	1	1	1	10	2024
186	KROGER 259 ATLANTA GA	7.61	2018-10-21 20:00:00-04	2019-01-13 19:34:33.080546-05	1	1	1	10	2022
187	QT 730 SANDY SPRINGSGA	9.76	2018-10-21 20:00:00-04	2019-01-13 19:34:33.085175-05	1	1	2	10	2022
188	PUBLIX #1363 BROOKHAVEN GA	13.98	2018-10-20 20:00:00-04	2019-01-13 19:34:33.08957-05	1	1	1	10	2021
189	VESTA *AT&T 866-608-3007 OR2VDXUHMAGV9	60.14	2018-10-18 20:00:00-04	2019-01-13 19:34:33.094975-05	1	1	4	10	2019
190	KROGER 259 ATLANTA GA	5.98	2018-10-17 20:00:00-04	2019-01-13 19:34:33.100723-05	1	1	1	10	2018
191	QT 773 CHAMBLEE GA	6.50	2018-10-17 20:00:00-04	2019-01-13 19:34:33.105151-05	1	1	2	10	2018
192	PUBLIX #664 ATLANTA GA	5.98	2018-10-16 20:00:00-04	2019-01-13 19:34:33.109327-05	1	1	1	10	2017
193	LYFT *RIDE TUE 12PM 855-280-0278 CA	15.45	2018-10-15 20:00:00-04	2019-01-13 19:34:33.114589-05	1	1	7	10	2016
194	TISANE EURO-ASIAN CAFE HARTFORD CT	32.00	2017-12-31 19:00:00-05	2019-01-14 14:49:36.909682-05	10	1	8	01	2001
195	WHOLEFDS WHF 10217 WEST HARTFORDCT	10.00	2018-01-03 19:00:00-05	2019-01-14 14:49:37.161255-05	10	1	1	01	2004
196	DUNKIN #351262 Q35 HARTFORD CT	6.26	2018-01-04 19:00:00-05	2019-01-14 14:49:37.229442-05	10	1	8	01	2005
197	INTERNET PAYMENT - THANK YOU	-282.25	2018-01-04 19:00:00-05	2019-01-14 14:49:37.278282-05	10	1	3	01	2005
198	WHOLEFDS WHF 10217 WEST HARTFORDCT	14.21	2018-01-06 19:00:00-05	2019-01-14 14:49:37.325334-05	10	1	1	01	2007
199	KFC E685046 HARTFORD FL	6.37	2018-01-09 19:00:00-05	2019-01-14 14:49:37.410986-05	10	1	8	01	2010
200	DUNKIN #351262 Q35 HARTFORD CT	5.40	2018-01-11 19:00:00-05	2019-01-14 14:49:37.463559-05	10	1	8	01	2012
201	SQ *MUSEUM OF SEX NEW YORK NY0002305843011396325228	16.33	2018-01-12 19:00:00-05	2019-01-14 14:49:37.50971-05	10	1	7	01	2013
202	SUNFLOWER DINER NEW YORK NY	38.39	2018-01-12 19:00:00-05	2019-01-14 14:49:37.514462-05	10	1	8	01	2013
203	ABBEY TAVERN NEW YORK NY	30.00	2018-01-13 19:00:00-05	2019-01-14 14:49:37.537891-05	10	1	8	01	2014
204	AMY RUTH'S NEW YORK NY	29.85	2018-01-13 19:00:00-05	2019-01-14 14:49:37.543536-05	10	1	8	01	2014
205	DD/BR #343886 Q35 NEW YORK NY	2.78	2018-01-13 19:00:00-05	2019-01-14 14:49:37.549083-05	10	1	8	01	2014
206	DIG INN EAST 23RD NEW YORK NY	12.00	2018-01-13 19:00:00-05	2019-01-14 14:49:37.553627-05	10	1	8	01	2014
207	ADIRONDACK TRANSIT LIN NEW YORK NY	22.00	2018-01-14 19:00:00-05	2019-01-14 14:49:37.55798-05	10	1	7	01	2015
208	DUNKIN DONUTS ST1327 NEW YORK NY	7.16	2018-01-14 19:00:00-05	2019-01-14 14:49:37.563027-05	10	1	1	01	2015
209	CAFE SERVICES - GE3 PLAINVILLE CT	3.99	2018-01-15 19:00:00-05	2019-01-14 14:49:37.567473-05	10	1	8	01	2016
210	VESTA *AT&T 866-608-3007 OR2VDXUGYMAHQ	60.14	2018-01-21 19:00:00-05	2019-01-14 14:49:37.571681-05	10	1	4	01	2022
211	CVS/PHARMACY #00350 HARTFORD CT	2.97	2018-01-24 19:00:00-05	2019-01-14 14:49:37.576172-05	10	1	6	01	2025
212	9640 AMC ONLINE 888-440-4262 KS	8.69	2018-01-25 19:00:00-05	2019-01-14 14:49:37.582042-05	10	1	7	01	2026
213	SPOTIFY NEW YORK CITYNY	9.99	2018-01-25 19:00:00-05	2019-01-14 14:49:37.589078-05	10	1	6	01	2026
214	CVS/PHARMACY #04505 CHAMBLEE GA	39.88	2018-01-26 19:00:00-05	2019-01-14 14:49:37.594469-05	10	1	6	01	2027
215	CVS/PHARMACY #04505 CHAMBLEE GA	90.30	2018-01-26 19:00:00-05	2019-01-14 14:49:37.620543-05	10	1	6	01	2027
216	NETFLIX.COM NETFLIX.COM CA19898228361	10.99	2018-01-26 19:00:00-05	2019-01-14 14:49:37.625434-05	10	1	4	01	2027
217	WAL-MART SC - #3621 CHAMBLEE GA	195.95	2018-01-26 19:00:00-05	2019-01-14 14:49:37.630946-05	10	1	6	01	2027
218	CVS/PHARMACY #02083 BROOKHAVEN GA	33.50	2018-01-27 19:00:00-05	2019-01-14 14:49:37.636091-05	10	1	6	01	2028
219	PUBLIX #1363 BROOKHAVEN GA	5.65	2018-01-27 19:00:00-05	2019-01-14 14:49:37.640451-05	10	1	1	01	2028
220	PUBLIX #1363 BROOKHAVEN GA	90.02	2018-01-27 19:00:00-05	2019-01-14 14:49:37.644472-05	10	1	1	01	2028
221	WAL-MART SC - #3621 CHAMBLEE GA	56.97	2018-01-27 19:00:00-05	2019-01-14 14:49:37.648668-05	10	1	6	01	2028
222	PUBLIX #1363 BROOKHAVEN GA	25.69	2018-01-28 19:00:00-05	2019-01-14 14:49:37.652811-05	10	1	1	01	2029
223	ROD*MENS HEALTH 800-666-2303 PAROD*MENS HEALTH	24.97	2018-02-01 19:00:00-05	2019-01-14 14:49:37.657003-05	10	1	6	02	2002
224	PUBLIX #1363 BROOKHAVEN GA	51.21	2018-02-02 19:00:00-05	2019-01-14 14:49:37.66156-05	10	1	1	02	2003
225	INTERNET PAYMENT - THANK YOU	-625.00	2018-02-03 19:00:00-05	2019-01-14 14:49:37.667001-05	10	1	3	02	2004
226	PUBLIX #1363 BROOKHAVEN GA	7.48	2018-02-04 19:00:00-05	2019-01-14 14:49:37.674374-05	10	1	1	02	2005
227	PUBLIX #1363 BROOKHAVEN GA	6.18	2018-02-08 19:00:00-05	2019-01-14 14:49:37.679082-05	10	1	1	02	2009
228	PUBLIX #1363 BROOKHAVEN GA	27.73	2018-02-08 19:00:00-05	2019-01-14 14:49:37.683565-05	10	1	1	02	2009
229	QT 723 ATLANTA GA	5.74	2018-02-08 19:00:00-05	2019-01-14 14:49:37.687708-05	10	1	2	02	2009
230	PUBLIX #1363 BROOKHAVEN GA	14.09	2018-02-09 19:00:00-05	2019-01-14 14:49:37.691972-05	10	1	1	02	2010
231	PUBLIX #1363 BROOKHAVEN GA	48.19	2018-02-10 19:00:00-05	2019-01-14 14:49:37.737154-05	10	1	1	02	2011
232	FUDDRUCKERS 3047 MARIETTA GA	1.58	2018-02-14 19:00:00-05	2019-01-14 14:49:37.741506-05	10	1	8	02	2015
233	PUBLIX #1363 BROOKHAVEN GA	37.31	2018-02-17 19:00:00-05	2019-01-14 14:49:37.745945-05	10	1	1	02	2018
234	BP#8997777CIRCLE M # 61 MARIETTA GA	5.00	2018-02-19 19:00:00-05	2019-01-14 14:49:37.750386-05	10	1	2	02	2020
235	VESTA *AT&T 866-608-3007 OR2VDXUH1787L	60.14	2018-02-20 19:00:00-05	2019-01-14 14:49:37.75503-05	10	1	4	02	2021
236	BP#8997777CIRCLE M # 61 MARIETTA GA	5.25	2018-02-21 19:00:00-05	2019-01-14 14:49:37.759384-05	10	1	2	02	2022
237	COCA COLA LAWRENCEVILLE LAWRENCEVILLEGA	2.00	2018-02-21 19:00:00-05	2019-01-14 14:49:37.763677-05	10	1	8	02	2022
238	PUBLIX #1363 BROOKHAVEN GA	59.41	2018-02-24 19:00:00-05	2019-01-14 14:49:37.76824-05	10	1	1	02	2025
239	PUBLIX #601 BROOKHAVEN GA	6.41	2018-02-24 19:00:00-05	2019-01-14 14:49:37.792882-05	10	1	1	02	2025
240	SPOTIFY NEW YORK CITYNY	9.99	2018-02-25 19:00:00-05	2019-01-14 14:49:37.797249-05	10	1	6	02	2026
241	NETFLIX.COM NETFLIX.COM CA20395109602	10.99	2018-02-26 19:00:00-05	2019-01-14 14:49:37.801508-05	10	1	4	02	2027
242	TREEHOUSE 800-928-2130 FL	25.00	2018-02-26 19:00:00-05	2019-01-14 14:49:37.806218-05	10	1	5	02	2027
243	BP#8997777CIRCLE M # 61 MARIETTA GA	5.50	2018-02-27 19:00:00-05	2019-01-14 14:49:37.811295-05	10	1	2	02	2028
244	PUBLIX #1363 BROOKHAVEN GA	22.00	2018-02-27 19:00:00-05	2019-01-14 14:49:37.817544-05	10	1	1	02	2028
245	CVS/PHARMACY #02083 BROOKHAVEN GA	2.00	2018-03-01 19:00:00-05	2019-01-14 14:49:37.822844-05	10	1	6	03	2002
246	INTERNET PAYMENT - THANK YOU	-624.65	2018-03-01 19:00:00-05	2019-01-14 14:49:37.827139-05	10	1	3	03	2002
247	PUBLIX #601 BROOKHAVEN GA	6.81	2018-03-01 19:00:00-05	2019-01-14 14:49:37.831459-05	10	1	1	03	2002
248	BP#8982845REDAN BP STONE MOUNTAIGA	5.50	2018-03-02 19:00:00-05	2019-01-14 14:49:37.835636-05	10	1	2	03	2003
249	PUBLIX #1363 BROOKHAVEN GA	16.26	2018-03-02 19:00:00-05	2019-01-14 14:49:37.839884-05	10	1	1	03	2003
250	PUBLIX #1363 BROOKHAVEN GA	26.37	2018-03-04 19:00:00-05	2019-01-14 14:49:37.844492-05	10	1	1	03	2005
251	CHEVRON 0201794 ATLANTA GA00201794 9498425	5.25	2018-03-06 19:00:00-05	2019-01-14 14:49:37.849685-05	10	1	2	03	2007
252	PUBLIX #1363 BROOKHAVEN GA	7.34	2018-03-06 19:00:00-05	2019-01-14 14:49:37.880206-05	10	1	1	03	2007
253	PUBLIX #1363 BROOKHAVEN GA	18.61	2018-03-06 19:00:00-05	2019-01-14 14:49:37.884629-05	10	1	1	03	2007
254	BP#1717487CK 2211908 ATLANTA GA	5.00	2018-03-08 19:00:00-05	2019-01-14 14:49:37.889496-05	10	1	2	03	2009
255	SHELL 57544777600 ATLANTA GA	6.00	2018-03-09 19:00:00-05	2019-01-14 14:49:37.913856-05	10	1	2	03	2010
256	PUBLIX #1363 BROOKHAVEN GA	55.54	2018-03-11 20:00:00-04	2019-01-14 14:49:37.919182-05	10	1	1	03	2012
257	CHEVRON 0200861 ATLANTA GA00200861 6178856	6.00	2018-03-13 20:00:00-04	2019-01-14 14:49:37.964415-05	10	1	2	03	2014
258	PUBLIX #1363 BROOKHAVEN GA	18.89	2018-03-13 20:00:00-04	2019-01-14 14:49:37.968849-05	10	1	1	03	2014
259	CHEVRON 0200861 ATLANTA GA00200861 6180256	6.00	2018-03-16 20:00:00-04	2019-01-14 14:49:37.973176-05	10	1	2	03	2017
260	LYFT *RIDE SAT 4AM 855-280-0278 CA	9.09	2018-03-16 20:00:00-04	2019-01-14 14:49:37.977707-05	10	1	7	03	2017
261	PUBLIX #1363 BROOKHAVEN GA	18.50	2018-03-18 20:00:00-04	2019-01-14 14:49:37.981974-05	10	1	1	03	2019
262	BP#8997777CIRCLE M # 61 MARIETTA GA	8.95	2018-03-19 20:00:00-04	2019-01-14 14:49:37.986229-05	10	1	2	03	2020
263	PUBLIX #1363 BROOKHAVEN GA	8.35	2018-03-19 20:00:00-04	2019-01-14 14:49:37.990457-05	10	1	1	03	2020
264	ASHFORD DUNWOODY ATLANTA GA	6.00	2018-03-22 20:00:00-04	2019-01-14 14:49:37.995177-05	10	1	2	03	2023
265	VESTA *AT&T 866-608-3007 OR2VDXUH3RMG2	60.14	2018-03-22 20:00:00-04	2019-01-14 14:49:38.002317-05	10	1	4	03	2023
266	PUBLIX #601 BROOKHAVEN GA	8.26	2018-03-23 20:00:00-04	2019-01-14 14:49:38.008313-05	10	1	1	03	2024
267	SPOTIFY NEW YORK CITYNY	9.99	2018-03-25 20:00:00-04	2019-01-14 14:49:38.012913-05	10	1	6	03	2026
268	CHEVRON 0200861 ATLANTA GA00200861 6186113	6.00	2018-03-26 20:00:00-04	2019-01-14 14:49:38.017546-05	10	1	2	03	2027
269	NETFLIX.COM NETFLIX.COM CA20977572991	10.99	2018-03-26 20:00:00-04	2019-01-14 14:49:38.021795-05	10	1	4	03	2027
270	PUBLIX #1363 BROOKHAVEN GA	29.81	2018-03-26 20:00:00-04	2019-01-14 14:49:38.026386-05	10	1	1	03	2027
271	TREEHOUSE 800-928-2130 FL	25.00	2018-03-26 20:00:00-04	2019-01-14 14:49:38.031828-05	10	1	5	03	2027
272	PUBLIX #1363 BROOKHAVEN GA	3.55	2018-03-27 20:00:00-04	2019-01-14 14:49:38.036607-05	10	1	1	03	2028
273	SHELL 57542375407 MARIETTA GA	8.34	2018-03-29 20:00:00-04	2019-01-14 14:49:38.042568-05	10	1	2	03	2030
274	INTERNET PAYMENT - THANK YOU	-400.00	2018-04-01 20:00:00-04	2019-01-14 14:49:38.050414-05	10	1	3	04	2002
275	PUBLIX #664 ATLANTA GA	28.05	2018-04-01 20:00:00-04	2019-01-14 14:49:38.056493-05	10	1	1	04	2002
276	CHEVRON 0200861 ATLANTA GA00200861 6190660	6.00	2018-04-02 20:00:00-04	2019-01-14 14:49:38.061-05	10	1	2	04	2003
277	PUBLIX #1363 BROOKHAVEN GA	28.05	2018-04-03 20:00:00-04	2019-01-14 14:49:38.068199-05	10	1	1	04	2004
278	PUBLIX #1363 BROOKHAVEN GA	7.02	2018-04-04 20:00:00-04	2019-01-14 14:49:38.07256-05	10	1	1	04	2005
279	BP#8980989BP MEMORIAL ATLANTA GA	6.00	2018-04-06 20:00:00-04	2019-01-14 14:49:38.07683-05	10	1	2	04	2007
280	PUBLIX #1363 BROOKHAVEN GA	31.72	2018-04-08 20:00:00-04	2019-01-14 14:49:38.082117-05	10	1	1	04	2009
281	PUBLIX #1363 BROOKHAVEN GA	5.07	2018-04-09 20:00:00-04	2019-01-14 14:49:38.087155-05	10	1	1	04	2010
282	PUBLIX #1363 BROOKHAVEN GA	16.02	2018-04-09 20:00:00-04	2019-01-14 14:49:38.092963-05	10	1	1	04	2010
283	BP#8997777CIRCLE M # 61 MARIETTA GA	6.00	2018-04-10 20:00:00-04	2019-01-14 14:49:38.097511-05	10	1	2	04	2011
284	CHEVRON 0200861 ATLANTA GA00200861 6197011	10.04	2018-04-13 20:00:00-04	2019-01-14 14:49:38.103427-05	10	1	2	04	2014
285	LYFT *RIDE SUN 8PM 855-280-0278 CA	11.63	2018-04-14 20:00:00-04	2019-01-14 14:49:38.108014-05	10	1	7	04	2015
286	PUBLIX #1363 BROOKHAVEN GA	26.93	2018-04-14 20:00:00-04	2019-01-14 14:49:38.11217-05	10	1	1	04	2015
287	CVS/PHARMACY #05260 IRVING TX	6.80	2018-04-19 20:00:00-04	2019-01-14 14:49:38.117493-05	10	1	6	04	2020
288	VESTA *AT&T 866-608-3007 OR2VDXUH6BMNL	60.14	2018-04-21 20:00:00-04	2019-01-14 14:49:38.122617-05	10	1	4	04	2022
289	PUBLIX #1363 BROOKHAVEN GA	25.33	2018-04-22 20:00:00-04	2019-01-14 14:49:38.128298-05	10	1	1	04	2023
290	ASHFORD DUNWOODY ATLANTA GA	6.00	2018-04-24 20:00:00-04	2019-01-14 14:49:38.134403-05	10	1	2	04	2025
291	PUBLIX #1363 BROOKHAVEN GA	26.90	2018-04-24 20:00:00-04	2019-01-14 14:49:38.13911-05	10	1	1	04	2025
292	SPOTIFY NEW YORK CITYNY	9.99	2018-04-25 20:00:00-04	2019-01-14 14:49:38.143843-05	10	1	6	04	2026
293	NETFLIX.COM NETFLIX.COM CA21471930607	10.99	2018-04-26 20:00:00-04	2019-01-14 14:49:38.148225-05	10	1	4	04	2027
294	PUBLIX #1363 BROOKHAVEN GA	12.07	2018-04-26 20:00:00-04	2019-01-14 14:49:38.152928-05	10	1	1	04	2027
295	TREEHOUSE 800-928-2130 FL	25.00	2018-04-26 20:00:00-04	2019-01-14 14:49:38.157357-05	10	1	5	04	2027
296	CHEVRON 0200861 ATLANTA GA00200861 6106223	6.00	2018-04-29 20:00:00-04	2019-01-14 14:49:38.161532-05	10	1	2	04	2030
297	PUBLIX #1363 BROOKHAVEN GA	2.30	2018-04-29 20:00:00-04	2019-01-14 14:49:38.1658-05	10	1	1	04	2030
298	PUBLIX #1363 BROOKHAVEN GA	55.54	2018-04-29 20:00:00-04	2019-01-14 14:49:38.170951-05	10	1	1	04	2030
299	PUBLIX #1363 BROOKHAVEN GA	3.65	2018-05-01 20:00:00-04	2019-01-14 14:49:38.176425-05	10	1	1	05	2002
300	PUBLIX #1363 BROOKHAVEN GA	3.59	2018-05-03 20:00:00-04	2019-01-14 14:49:38.180961-05	10	1	1	05	2004
301	PUBLIX #1363 BROOKHAVEN GA	6.45	2018-05-03 20:00:00-04	2019-01-14 14:49:38.185214-05	10	1	1	05	2004
302	CHEVRON 0200861 ATLANTA GA00200861 6109458	6.25	2018-05-04 20:00:00-04	2019-01-14 14:49:38.189301-05	10	1	2	05	2005
303	PUBLIX #1363 BROOKHAVEN GA	25.06	2018-05-05 20:00:00-04	2019-01-14 14:49:38.193475-05	10	1	1	05	2006
304	PUBLIX #1363 BROOKHAVEN GA	18.75	2018-05-07 20:00:00-04	2019-01-14 14:49:38.197578-05	10	1	1	05	2008
305	SHELL 57544777600 ATLANTA GA	6.00	2018-05-08 20:00:00-04	2019-01-14 14:49:38.201655-05	10	1	2	05	2009
306	PUBLIX #1363 BROOKHAVEN GA	26.91	2018-05-09 20:00:00-04	2019-01-14 14:49:38.206291-05	10	1	1	05	2010
307	PUBLIX #1363 BROOKHAVEN GA	10.13	2018-05-10 20:00:00-04	2019-01-14 14:49:38.213448-05	10	1	1	05	2011
308	SHELL 57542376504 ATLANTA GA	2.72	2018-05-10 20:00:00-04	2019-01-14 14:49:38.219228-05	10	1	2	05	2011
309	INTERNET PAYMENT - THANK YOU	-35.00	2018-05-11 20:00:00-04	2019-01-14 14:49:38.223427-05	10	1	3	05	2012
310	TEXACO 0353849 CHAMBLEE GA00353849 4971536	6.50	2018-05-12 20:00:00-04	2019-01-14 14:49:38.227695-05	10	1	2	05	2013
311	BP#8997777CIRCLE M # 61 MARIETTA GA	6.00	2018-05-15 20:00:00-04	2019-01-14 14:49:38.232891-05	10	1	2	05	2016
312	INTEREST CHARGE ON PURCHASES	4.68	2018-05-16 20:00:00-04	2019-01-14 14:49:38.23857-05	10	1	9	05	2017
313	PUBLIX #1363 BROOKHAVEN GA	14.97	2018-05-16 20:00:00-04	2019-01-14 14:49:38.242809-05	10	1	1	05	2017
314	TEXACO 0353849 CHAMBLEE GA00353849 4973041	9.68	2018-05-18 20:00:00-04	2019-01-14 14:49:38.247844-05	10	1	2	05	2019
315	MARTA ATLAN00000018162 4048485000 GA	5.00	2018-05-19 20:00:00-04	2019-01-14 14:49:38.253318-05	10	1	7	05	2020
316	VESTA *AT&T 866-608-3007 OR2VDXUH8WI58	60.14	2018-05-21 20:00:00-04	2019-01-14 14:49:38.258935-05	10	1	4	05	2022
317	EXXONMOBIL ROBBINSDALE MN	20.00	2018-05-24 20:00:00-04	2019-01-14 14:49:38.263746-05	10	1	2	05	2025
318	SPOTIFY NEW YORK CITYNY	9.99	2018-05-25 20:00:00-04	2019-01-14 14:49:38.26945-05	10	1	6	05	2026
319	NETFLIX.COM NETFLIX.COM CA22041604909	10.99	2018-05-26 20:00:00-04	2019-01-14 14:49:38.315151-05	10	1	4	05	2027
320	TREEHOUSE 800-928-2130 FL	25.00	2018-05-26 20:00:00-04	2019-01-14 14:49:38.319336-05	10	1	5	05	2027
321	PUBLIX #1363 BROOKHAVEN GA	62.91	2018-05-28 20:00:00-04	2019-01-14 14:49:38.32511-05	10	1	1	05	2029
322	BP#8997777CIRCLE M # 61 MARIETTA GA	6.00	2018-05-29 20:00:00-04	2019-01-14 14:49:38.330456-05	10	1	2	05	2030
323	PUBLIX #1363 BROOKHAVEN GA	16.97	2018-05-31 20:00:00-04	2019-01-14 14:49:38.335729-05	10	1	1	06	2001
324	PUBLIX #1363 BROOKHAVEN GA	20.53	2018-06-02 20:00:00-04	2019-01-14 14:49:38.340039-05	10	1	1	06	2003
325	CHEVRON 0200861 ATLANTA GA00200861 6127639	6.25	2018-06-04 20:00:00-04	2019-01-14 14:49:38.344355-05	10	1	2	06	2005
326	PUBLIX #1363 BROOKHAVEN GA	21.53	2018-06-04 20:00:00-04	2019-01-14 14:49:38.349761-05	10	1	1	06	2005
327	PUBLIX #1044 ATLANTA GA	2.09	2018-06-08 20:00:00-04	2019-01-14 14:49:38.35612-05	10	1	1	06	2009
328	PUBLIX #1044 ATLANTA GA	8.69	2018-06-08 20:00:00-04	2019-01-14 14:49:38.360853-05	10	1	1	06	2009
329	CHEVRON 0200861 ATLANTA GA00200861 6130570	7.00	2018-06-09 20:00:00-04	2019-01-14 14:49:38.365936-05	10	1	2	06	2010
330	PUBLIX #1363 BROOKHAVEN GA	25.18	2018-06-09 20:00:00-04	2019-01-14 14:49:38.370527-05	10	1	1	06	2010
331	INTERNET PAYMENT - THANK YOU	-400.00	2018-06-10 20:00:00-04	2019-01-14 14:49:38.374953-05	10	1	3	06	2011
332	PUBLIX #1363 BROOKHAVEN GA	9.16	2018-06-10 20:00:00-04	2019-01-14 14:49:38.379505-05	10	1	1	06	2011
333	PUBLIX #1363 BROOKHAVEN GA	5.77	2018-06-15 20:00:00-04	2019-01-14 14:49:38.383811-05	10	1	1	06	2016
334	QT 744 ATLANTA GA	10.20	2018-06-15 20:00:00-04	2019-01-14 14:49:38.388606-05	10	1	2	06	2016
335	INTEREST CHARGE ON PURCHASES	8.29	2018-06-16 20:00:00-04	2019-01-14 14:49:38.394575-05	10	1	9	06	2017
336	PUBLIX #1363 BROOKHAVEN GA	8.62	2018-06-16 20:00:00-04	2019-01-14 14:49:38.399312-05	10	1	1	06	2017
337	PUBLIX #1363 BROOKHAVEN GA	22.23	2018-06-17 20:00:00-04	2019-01-14 14:49:38.403687-05	10	1	1	06	2018
338	BP#8997777CIRCLE M # 61 MARIETTA GA	6.00	2018-06-19 20:00:00-04	2019-01-14 14:49:38.407897-05	10	1	2	06	2020
339	PUBLIX #1363 BROOKHAVEN GA	30.11	2018-06-20 20:00:00-04	2019-01-14 14:49:38.412509-05	10	1	1	06	2021
340	VESTA *AT&T 866-608-3007 OR2VDXUHBI830	60.14	2018-06-20 20:00:00-04	2019-01-14 14:49:38.418237-05	10	1	4	06	2021
341	BP#1630995SYLVAN DEVELOP ATLANTA GA	7.00	2018-06-23 20:00:00-04	2019-01-14 14:49:38.422828-05	10	1	2	06	2024
342	PUBLIX #723 DECATUR GA	34.46	2018-06-23 20:00:00-04	2019-01-14 14:49:38.427109-05	10	1	1	06	2024
343	PUBLIX #1363 BROOKHAVEN GA	5.04	2018-06-25 20:00:00-04	2019-01-14 14:49:38.432426-05	10	1	1	06	2026
344	SPOTIFY NEW YORK CITYNY	9.99	2018-06-25 20:00:00-04	2019-01-14 14:49:38.438721-05	10	1	6	06	2026
345	NETFLIX.COM NETFLIX.COM CA22597426890	10.99	2018-06-26 20:00:00-04	2019-01-14 14:49:38.443615-05	10	1	4	06	2027
346	TREEHOUSE 800-928-2130 FL	25.00	2018-06-26 20:00:00-04	2019-01-14 14:49:38.448064-05	10	1	5	06	2027
347	PUBLIX #1363 BROOKHAVEN GA	7.85	2018-06-28 20:00:00-04	2019-01-14 14:49:38.454352-05	10	1	1	06	2029
348	QT 745 ATLANTA GA	6.00	2018-06-29 20:00:00-04	2019-01-14 14:49:38.500456-05	10	1	2	06	2030
349	PUBLIX #1363 BROOKHAVEN GA	16.95	2018-07-02 20:00:00-04	2019-01-14 14:49:38.546864-05	10	1	1	07	2003
350	PUBLIX #1363 BROOKHAVEN GA	12.92	2018-07-05 20:00:00-04	2019-01-14 14:49:38.552571-05	10	1	1	07	2006
351	PUBLIX #1363 BROOKHAVEN GA	19.78	2018-07-07 20:00:00-04	2019-01-14 14:49:38.557572-05	10	1	1	07	2008
352	PUBLIX #723 DECATUR GA	24.04	2018-07-07 20:00:00-04	2019-01-14 14:49:38.562581-05	10	1	1	07	2008
353	QT 744 ATLANTA GA	6.00	2018-07-07 20:00:00-04	2019-01-14 14:49:38.567978-05	10	1	2	07	2008
354	INTERNET PAYMENT - THANK YOU	-771.46	2018-07-08 20:00:00-04	2019-01-14 14:49:38.572228-05	10	1	3	07	2009
355	PUBLIX #1363 BROOKHAVEN GA	6.26	2018-07-08 20:00:00-04	2019-01-14 14:49:38.577021-05	10	1	1	07	2009
356	PUBLIX #601 BROOKHAVEN GA	15.49	2018-07-08 20:00:00-04	2019-01-14 14:49:38.583615-05	10	1	1	07	2009
357	TEXACO 0352507 ATLANTA GA00352507 0748649	6.50	2018-07-10 20:00:00-04	2019-01-14 14:49:38.630128-05	10	1	2	07	2011
358	CVS/PHARMACY #04720 ATLANTA GA	2.58	2018-07-11 20:00:00-04	2019-01-14 14:49:38.675762-05	10	1	6	07	2012
359	PUBLIX #1363 BROOKHAVEN GA	22.22	2018-07-11 20:00:00-04	2019-01-14 14:49:38.680352-05	10	1	1	07	2012
360	QT 744 ATLANTA GA	7.98	2018-07-13 20:00:00-04	2019-01-14 14:49:38.684954-05	10	1	2	07	2014
361	PUBLIX #1363 BROOKHAVEN GA	19.90	2018-07-14 20:00:00-04	2019-01-14 14:49:38.689353-05	10	1	1	07	2015
362	BP#8997777CIRCLE M # 61 MARIETTA GA	6.00	2018-07-16 20:00:00-04	2019-01-14 14:49:38.693724-05	10	1	2	07	2017
363	PUBLIX #1363 BROOKHAVEN GA	23.22	2018-07-19 20:00:00-04	2019-01-14 14:49:38.698991-05	10	1	1	07	2020
364	VESTA *AT&T 866-608-3007 OR2VDXUHE4GED	60.14	2018-07-20 20:00:00-04	2019-01-14 14:49:38.703596-05	10	1	4	07	2021
365	CHEVRON 0200861 ATLANTA GA00200861 6154181	7.00	2018-07-21 20:00:00-04	2019-01-14 14:49:38.708905-05	10	1	2	07	2022
366	PUBLIX #601 BROOKHAVEN GA	5.07	2018-07-23 20:00:00-04	2019-01-14 14:49:38.715901-05	10	1	1	07	2024
367	PUBLIX #1363 BROOKHAVEN GA	38.89	2018-07-24 20:00:00-04	2019-01-14 14:49:38.720611-05	10	1	1	07	2025
368	PUBLIX #1363 BROOKHAVEN GA	3.04	2018-07-25 20:00:00-04	2019-01-14 14:49:38.725352-05	10	1	1	07	2026
369	SPOTIFY NEW YORK CITYNY	9.99	2018-07-25 20:00:00-04	2019-01-14 14:49:38.730014-05	10	1	6	07	2026
370	ASI CITGO RETAIL NORCROSS GAL36372622	10.07	2018-07-26 20:00:00-04	2019-01-14 14:49:38.734196-05	10	1	2	07	2027
371	NETFLIX.COM NETFLIX.COM CA23130806839	10.99	2018-07-26 20:00:00-04	2019-01-14 14:49:38.738659-05	10	1	4	07	2027
372	TREEHOUSE 800-928-2130 FL	25.00	2018-07-26 20:00:00-04	2019-01-14 14:49:38.743835-05	10	1	5	07	2027
373	INTERNET PAYMENT - THANK YOU	-200.00	2018-07-29 20:00:00-04	2019-01-14 14:49:38.748908-05	10	1	3	07	2030
374	PUBLIX #1363 BROOKHAVEN GA	15.74	2018-07-29 20:00:00-04	2019-01-14 14:49:38.756921-05	10	1	1	07	2030
375	SHELL 57542375001 ROSWELL GA	6.50	2018-07-31 20:00:00-04	2019-01-14 14:49:38.761815-05	10	1	2	08	2001
376	KROGER #491 ATLANTA GA	5.93	2018-08-01 20:00:00-04	2019-01-14 14:49:38.766332-05	10	1	1	08	2002
377	PUBLIX #1363 BROOKHAVEN GA	10.39	2018-08-02 20:00:00-04	2019-01-14 14:49:38.770775-05	10	1	1	08	2003
378	QT 723 ATLANTA GA	8.05	2018-08-04 20:00:00-04	2019-01-14 14:49:38.775561-05	10	1	2	08	2005
379	PUBLIX #1363 BROOKHAVEN GA	28.35	2018-08-05 20:00:00-04	2019-01-14 14:49:38.781123-05	10	1	1	08	2006
380	PUBLIX #1363 BROOKHAVEN GA	9.82	2018-08-06 20:00:00-04	2019-01-14 14:49:38.785718-05	10	1	1	08	2007
381	PUBLIX #1363 BROOKHAVEN GA	12.83	2018-08-06 20:00:00-04	2019-01-14 14:49:38.789911-05	10	1	1	08	2007
382	MARTA ATLAN00000018162 4048485000 GA	2.50	2018-08-08 20:00:00-04	2019-01-14 14:49:38.795238-05	10	1	7	08	2009
383	QT 745 ATLANTA GA	6.00	2018-08-08 20:00:00-04	2019-01-14 14:49:38.801076-05	10	1	2	08	2009
384	PUBLIX #601 BROOKHAVEN GA	17.80	2018-08-10 20:00:00-04	2019-01-14 14:49:38.806128-05	10	1	1	08	2011
385	PUBLIX #1363 BROOKHAVEN GA	5.07	2018-08-11 20:00:00-04	2019-01-14 14:49:38.812469-05	10	1	1	08	2012
386	GEORGIA TOLLS 404-893-6100 GA	11.60	2018-08-12 20:00:00-04	2019-01-14 14:49:38.860639-05	10	1	7	08	2013
387	PUBLIX #1363 BROOKHAVEN GA	26.45	2018-08-12 20:00:00-04	2019-01-14 14:49:38.911028-05	10	1	1	08	2013
388	FSI*GEORGIA POWER 866-702-1864 GA44581693100	64.02	2018-08-13 20:00:00-04	2019-01-14 14:49:38.97457-05	10	1	4	08	2014
389	RACETRAC 2400024489974 ATLANTA GA	6.50	2018-08-13 20:00:00-04	2019-01-14 14:49:39.021197-05	10	1	2	08	2014
390	INTERNET PAYMENT - THANK YOU	-270.74	2018-08-14 20:00:00-04	2019-01-14 14:49:39.066042-05	10	1	3	08	2015
391	PUBLIX #1363 BROOKHAVEN GA	17.14	2018-08-14 20:00:00-04	2019-01-14 14:49:39.110292-05	10	1	1	08	2015
392	MARTA ATLAN00000018162 4048485000 GA	5.00	2018-08-16 20:00:00-04	2019-01-14 14:49:39.118085-05	10	1	7	08	2017
393	AMAZON PRIME AMZN.COM/BILLWA28D4N3MSSBY	119.00	2018-08-17 20:00:00-04	2019-01-14 14:49:39.122754-05	10	1	6	08	2018
394	PUBLIX #1363 BROOKHAVEN GA	7.55	2018-08-17 20:00:00-04	2019-01-14 14:49:39.126986-05	10	1	1	08	2018
395	QT 723 ATLANTA GA	6.50	2018-08-17 20:00:00-04	2019-01-14 14:49:39.131401-05	10	1	2	08	2018
396	VESTA *AT&T 866-608-3007 OR2VDXUHGT3LP	60.14	2018-08-19 20:00:00-04	2019-01-14 14:49:39.135776-05	10	1	4	08	2020
397	PUBLIX #1363 BROOKHAVEN GA	9.93	2018-08-20 20:00:00-04	2019-01-14 14:49:39.140031-05	10	1	1	08	2021
398	PUBLIX #1363 BROOKHAVEN GA	5.07	2018-08-22 20:00:00-04	2019-01-14 14:49:39.148238-05	10	1	1	08	2023
399	QT 745 ATLANTA GA	6.00	2018-08-22 20:00:00-04	2019-01-14 14:49:39.154031-05	10	1	2	08	2023
400	PUBLIX #1363 BROOKHAVEN GA	14.90	2018-08-25 20:00:00-04	2019-01-14 14:49:39.175939-05	10	1	1	08	2026
401	SPOTIFY NEW YORK CITYNY	9.99	2018-08-25 20:00:00-04	2019-01-14 14:49:39.180004-05	10	1	6	08	2026
402	NETFLIX.COM NETFLIX.COM CA23746051288	10.99	2018-08-26 20:00:00-04	2019-01-14 14:49:39.184929-05	10	1	4	08	2027
403	PUBLIX #1363 BROOKHAVEN GA	13.63	2018-08-26 20:00:00-04	2019-01-14 14:49:39.190285-05	10	1	1	08	2027
404	TEAMTREEHOUSE.COM 800-928-2130 FL	25.00	2018-08-26 20:00:00-04	2019-01-14 14:49:39.195714-05	10	1	5	08	2027
405	QT 744 ATLANTA GA	6.50	2018-08-27 20:00:00-04	2019-01-14 14:49:39.20119-05	10	1	2	08	2028
406	LYFT *RIDE THU 10PM 855-280-0278 CA	7.94	2018-08-29 20:00:00-04	2019-01-14 14:49:39.205592-05	10	1	7	08	2030
407	LYFT *RIDE FRI 7AM 855-280-0278 CA	12.35	2018-08-30 20:00:00-04	2019-01-14 14:49:39.209795-05	10	1	7	08	2031
408	PUBLIX #1363 BROOKHAVEN GA	27.74	2018-09-02 20:00:00-04	2019-01-14 14:49:39.213976-05	10	1	1	09	2003
409	QT 745 ATLANTA GA	6.00	2018-09-03 20:00:00-04	2019-01-14 14:49:39.218137-05	10	1	2	09	2004
410	PUBLIX #1363 BROOKHAVEN GA	16.00	2018-09-05 20:00:00-04	2019-01-14 14:49:39.222325-05	10	1	1	09	2006
411	QT 730 SANDY SPRINGSGA	6.00	2018-09-09 20:00:00-04	2019-01-14 14:49:39.227769-05	10	1	2	09	2010
412	PUBLIX #1363 BROOKHAVEN GA	12.74	2018-09-10 20:00:00-04	2019-01-14 14:49:39.260476-05	10	1	1	09	2011
413	INTERNET PAYMENT - THANK YOU	-484.34	2018-09-11 20:00:00-04	2019-01-14 14:49:39.269185-05	10	1	3	09	2012
414	KROGER #491 ATLANTA GA	5.65	2018-09-11 20:00:00-04	2019-01-14 14:49:39.280917-05	10	1	1	09	2012
415	PUBLIX #1363 BROOKHAVEN GA	6.00	2018-09-13 20:00:00-04	2019-01-14 14:49:39.285642-05	10	1	1	09	2014
416	QT 744 ATLANTA GA	6.00	2018-09-13 20:00:00-04	2019-01-14 14:49:39.290262-05	10	1	2	09	2014
417	PUBLIX #1363 BROOKHAVEN GA	23.00	2018-09-15 20:00:00-04	2019-01-14 14:49:39.295169-05	10	1	1	09	2016
418	QT 730 SANDY SPRINGSGA	5.50	2018-09-16 20:00:00-04	2019-01-14 14:49:39.343172-05	10	1	2	09	2017
419	VESTA *AT&T 866-608-3007 OR2VDXUHJJQ4W	60.14	2018-09-18 20:00:00-04	2019-01-14 14:49:39.538663-05	10	1	4	09	2019
420	PUBLIX #1363 BROOKHAVEN GA	24.36	2018-09-21 20:00:00-04	2019-01-14 14:49:39.58386-05	10	1	1	09	2022
421	QT 745 ATLANTA GA	6.00	2018-09-21 20:00:00-04	2019-01-14 14:49:39.631388-05	10	1	2	09	2022
422	PUBLIX #1363 BROOKHAVEN GA	24.00	2018-09-22 20:00:00-04	2019-01-14 14:49:39.676557-05	10	1	1	09	2023
423	SPOTIFY NEW YORK CITYNY	9.99	2018-09-25 20:00:00-04	2019-01-14 14:49:39.722056-05	10	1	6	09	2026
424	NETFLIX.COM NETFLIX.COM CA24267076480	10.99	2018-09-26 20:00:00-04	2019-01-14 14:49:39.726223-05	10	1	4	09	2027
425	TEAMTREEHOUSE.COM 800-928-2130 FL	25.00	2018-09-26 20:00:00-04	2019-01-14 14:49:39.730543-05	10	1	5	09	2027
426	CHEVRON 0200861 ATLANTA GA00200861 6191236	7.00	2018-09-28 20:00:00-04	2019-01-14 14:49:39.735107-05	10	1	2	09	2029
427	INTERNET PAYMENT - THANK YOU	-225.37	2018-09-29 20:00:00-04	2019-01-14 14:49:39.739566-05	10	1	3	09	2030
428	PUBLIX #1363 BROOKHAVEN GA	54.32	2018-09-29 20:00:00-04	2019-01-14 14:49:39.743828-05	10	1	1	09	2030
429	RACETRAC 2400024489974 ATLANTA GA	5.65	2018-10-01 20:00:00-04	2019-01-14 14:49:39.748528-05	10	1	2	10	2002
430	PUBLIX #664 ATLANTA GA	5.98	2018-10-02 20:00:00-04	2019-01-14 14:49:39.752985-05	10	1	1	10	2003
431	PUBLIX #1363 BROOKHAVEN GA	9.01	2018-10-06 20:00:00-04	2019-01-14 14:49:39.759682-05	10	1	1	10	2007
432	PUBLIX #1363 BROOKHAVEN GA	47.31	2018-10-06 20:00:00-04	2019-01-14 14:49:39.766546-05	10	1	1	10	2007
433	QT 723 ATLANTA GA	6.00	2018-10-06 20:00:00-04	2019-01-14 14:49:39.771019-05	10	1	2	10	2007
434	KROGER 259 ATLANTA GA	6.52	2018-10-10 20:00:00-04	2019-01-14 14:49:39.775361-05	10	1	1	10	2011
435	QT 744 ATLANTA GA	7.67	2018-10-10 20:00:00-04	2019-01-14 14:49:39.779607-05	10	1	2	10	2011
436	PUBLIX #1363 BROOKHAVEN GA	8.97	2018-10-11 20:00:00-04	2019-01-14 14:49:39.784132-05	10	1	1	10	2012
437	PUBLIX #1363 BROOKHAVEN GA	23.30	2018-10-12 20:00:00-04	2019-01-14 14:49:39.788662-05	10	1	1	10	2013
438	QT 730 SANDY SPRINGSGA	6.50	2018-10-13 20:00:00-04	2019-01-14 14:49:39.793137-05	10	1	2	10	2014
439	KROGER 259 ATLANTA GA	7.61	2018-10-14 20:00:00-04	2019-01-14 14:49:39.798657-05	10	1	1	10	2015
440	LYFT *RIDE TUE 12PM 855-280-0278 CA	15.45	2018-10-15 20:00:00-04	2019-01-14 14:49:39.804726-05	10	1	7	10	2016
441	PUBLIX #664 ATLANTA GA	5.98	2018-10-16 20:00:00-04	2019-01-14 14:49:39.809612-05	10	1	1	10	2017
442	KROGER 259 ATLANTA GA	5.98	2018-10-17 20:00:00-04	2019-01-14 14:49:39.81409-05	10	1	1	10	2018
443	QT 773 CHAMBLEE GA	6.50	2018-10-17 20:00:00-04	2019-01-14 14:49:39.81853-05	10	1	2	10	2018
444	VESTA *AT&T 866-608-3007 OR2VDXUHMAGV9	60.14	2018-10-18 20:00:00-04	2019-01-14 14:49:39.823238-05	10	1	4	10	2019
445	PUBLIX #1363 BROOKHAVEN GA	13.98	2018-10-20 20:00:00-04	2019-01-14 14:49:39.827989-05	10	1	1	10	2021
446	KROGER 259 ATLANTA GA	7.61	2018-10-21 20:00:00-04	2019-01-14 14:49:39.832926-05	10	1	1	10	2022
447	QT 730 SANDY SPRINGSGA	9.76	2018-10-21 20:00:00-04	2019-01-14 14:49:39.838008-05	10	1	2	10	2022
448	PUBLIX #1363 BROOKHAVEN GA	17.80	2018-10-23 20:00:00-04	2019-01-14 14:49:39.843471-05	10	1	1	10	2024
449	KROGER 259 ATLANTA GA	6.52	2018-10-24 20:00:00-04	2019-01-14 14:49:39.848208-05	10	1	1	10	2025
450	SPOTIFY NEW YORK CITYNY	9.99	2018-10-25 20:00:00-04	2019-01-14 14:49:39.852686-05	10	1	6	10	2026
451	CHEVRON 0352356 ATLANTA GA00352356 5621922	7.00	2018-10-26 20:00:00-04	2019-01-14 14:49:39.857681-05	10	1	2	10	2027
452	KROGER 259 ATLANTA GA	5.98	2018-10-26 20:00:00-04	2019-01-14 14:49:39.863222-05	10	1	1	10	2027
453	NETFLIX.COM NETFLIX.COM CA24874476184	10.99	2018-10-26 20:00:00-04	2019-01-14 14:49:39.867832-05	10	1	4	10	2027
454	TEAMTREEHOUSE.COM 800-928-2130 FL	25.00	2018-10-26 20:00:00-04	2019-01-14 14:49:39.872705-05	10	1	5	10	2027
455	PUBLIX #1363 BROOKHAVEN GA	17.84	2018-10-27 20:00:00-04	2019-01-14 14:49:39.877157-05	10	1	1	10	2028
456	INTERNET PAYMENT - THANK YOU	-404.52	2018-10-29 20:00:00-04	2019-01-14 14:49:39.884245-05	10	1	3	10	2030
457	RACETRAC 2400024489974 ATLANTA GA	6.50	2018-10-29 20:00:00-04	2019-01-14 14:49:39.889311-05	10	1	2	10	2030
458	KROGER 259 ATLANTA GA	5.98	2018-10-31 20:00:00-04	2019-01-14 14:49:39.893929-05	10	1	1	11	2001
459	KROGER 259 ATLANTA GA	5.98	2018-11-02 20:00:00-04	2019-01-14 14:49:39.899398-05	10	1	1	11	2003
460	QT 765 ALPHARETTA GA	7.86	2018-11-02 20:00:00-04	2019-01-14 14:49:39.903766-05	10	1	2	11	2003
461	PUBLIX #1363 BROOKHAVEN GA	46.40	2018-11-03 20:00:00-04	2019-01-14 14:49:39.908231-05	10	1	1	11	2004
462	KROGER 259 ATLANTA GA	9.14	2018-11-05 19:00:00-05	2019-01-14 14:49:39.912684-05	10	1	1	11	2006
463	QT 723 ATLANTA GA	7.05	2018-11-07 19:00:00-05	2019-01-14 14:49:39.917056-05	10	1	2	11	2008
464	PUBLIX #1363 BROOKHAVEN GA	3.15	2018-11-08 19:00:00-05	2019-01-14 14:49:39.922191-05	10	1	1	11	2009
465	PUBLIX #1363 BROOKHAVEN GA	11.40	2018-11-09 19:00:00-05	2019-01-14 14:49:39.92832-05	10	1	1	11	2010
466	PUBLIX #664 ATLANTA GA	11.75	2018-11-12 19:00:00-05	2019-01-14 14:49:39.932928-05	10	1	1	11	2013
467	CHEVRON 0200861 ATLANTA GA00200861 6116347	6.08	2018-11-13 19:00:00-05	2019-01-14 14:49:39.937347-05	10	1	2	11	2014
468	VESTA *AT&T 866-608-3007 OR2VDXUHP0MPJ	60.14	2018-11-17 19:00:00-05	2019-01-14 14:49:39.94153-05	10	1	4	11	2018
469	KROGER 259 ATLANTA GA	8.90	2018-11-18 19:00:00-05	2019-01-14 14:49:39.946163-05	10	1	1	11	2019
470	QT 773 CHAMBLEE GA	7.07	2018-11-18 19:00:00-05	2019-01-14 14:49:39.951385-05	10	1	2	11	2019
471	CHEVRON 0374734 MARIETTA GA00374734 3451434	6.88	2018-11-21 19:00:00-05	2019-01-14 14:49:39.95601-05	10	1	2	11	2022
472	PUBLIX #1363 BROOKHAVEN GA	24.75	2018-11-23 19:00:00-05	2019-01-14 14:49:39.960762-05	10	1	1	11	2024
473	SPOTIFY NEW YORK CITYNY	9.99	2018-11-25 19:00:00-05	2019-01-14 14:49:39.967564-05	10	1	6	11	2026
474	KROGER 259 ATLANTA GA	6.52	2018-11-26 19:00:00-05	2019-01-14 14:49:39.975028-05	10	1	1	11	2027
475	NETFLIX.COM NETFLIX.COM CA25472980779	10.99	2018-11-26 19:00:00-05	2019-01-14 14:49:39.980702-05	10	1	4	11	2027
476	TEAMTREEHOUSE.COM 800-928-2130 FL	25.00	2018-11-26 19:00:00-05	2019-01-14 14:49:39.985395-05	10	1	5	11	2027
477	CHEVRON 0200861 ATLANTA GA00200861 6123692	6.42	2018-11-27 19:00:00-05	2019-01-14 14:49:39.98996-05	10	1	2	11	2028
478	PUBLIX #1363 BROOKHAVEN GA	15.96	2018-11-27 19:00:00-05	2019-01-14 14:49:39.994407-05	10	1	1	11	2028
479	INTERNET PAYMENT - THANK YOU	-321.75	2018-11-30 19:00:00-05	2019-01-14 14:49:39.999587-05	10	1	3	12	2001
480	PUBLIX #1363 BROOKHAVEN GA	23.01	2018-11-30 19:00:00-05	2019-01-14 14:49:40.005192-05	10	1	1	12	2001
481	PUBLIX #773 ATLANTA GA	7.55	2018-12-01 19:00:00-05	2019-01-14 14:49:40.011518-05	10	1	1	12	2002
482	QT 730 SANDY SPRINGSGA	8.48	2018-12-01 19:00:00-05	2019-01-14 14:49:40.016649-05	10	1	2	12	2002
483	KROGER 259 ATLANTA GA	5.43	2018-12-02 19:00:00-05	2019-01-14 14:49:40.021487-05	10	1	1	12	2003
484	RACETRAC 2400024489974 ATLANTA GA	5.25	2018-12-05 19:00:00-05	2019-01-14 14:49:40.026265-05	10	1	2	12	2006
485	PUBLIX #1363 BROOKHAVEN GA	7.87	2018-12-09 19:00:00-05	2019-01-14 14:49:40.031078-05	10	1	1	12	2010
486	QT 745 ATLANTA GA	7.14	2018-12-10 19:00:00-05	2019-01-14 14:49:40.036582-05	10	1	2	12	2011
487	PUBLIX #1363 BROOKHAVEN GA	54.47	2018-12-11 19:00:00-05	2019-01-14 14:49:40.041212-05	10	1	1	12	2012
488	KROGER 259 ATLANTA GA	7.61	2018-12-12 19:00:00-05	2019-01-14 14:49:40.047692-05	10	1	1	12	2013
489	QT 730 SANDY SPRINGSGA	5.30	2018-12-15 19:00:00-05	2019-01-14 14:49:40.054704-05	10	1	2	12	2016
490	KROGER 259 ATLANTA GA	5.43	2018-12-16 19:00:00-05	2019-01-14 14:49:40.059614-05	10	1	1	12	2017
491	VESTA *AT&T 866-608-3007 OR2VDXUHRPQUE	60.14	2018-12-17 19:00:00-05	2019-01-14 14:49:40.065469-05	10	1	4	12	2018
492	KROGER 259 ATLANTA GA	6.52	2018-12-18 19:00:00-05	2019-01-14 14:49:40.069944-05	10	1	1	12	2019
493	QT 773 CHAMBLEE GA	5.24	2018-12-19 19:00:00-05	2019-01-14 14:49:40.074421-05	10	1	2	12	2020
494	SPOTIFY NEW YORK CITYNY	9.99	2018-12-25 19:00:00-05	2019-01-14 14:49:40.079505-05	10	1	6	12	2026
495	NETFLIX.COM NETFLIX.COM CA26089230452	10.99	2018-12-26 19:00:00-05	2019-01-14 14:49:40.084277-05	10	1	4	12	2027
496	TEAMTREEHOUSE.COM 800-928-2130 FL	25.00	2018-12-26 19:00:00-05	2019-01-14 14:49:40.089094-05	10	1	5	12	2027
497	HY VEE ROBBINSDALE ROBBINSDALE MN	23.12	2018-12-28 19:00:00-05	2019-01-14 14:49:40.093947-05	10	1	1	12	2029
\.


--
-- Data for Name: users_userprofile; Type: TABLE DATA; Schema: public; Owner: alexrogers823
--

COPY public.users_userprofile (id, image, user_id) FROM stdin;
3	profile_pics/main-photo.jpg	1
4	default.jpg	3
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: alexrogers823
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: alexrogers823
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: alexrogers823
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 40, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: alexrogers823
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: alexrogers823
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 10, true);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: alexrogers823
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: alexrogers823
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 36, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: alexrogers823
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 10, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: alexrogers823
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 22, true);


--
-- Name: expenses_banks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: alexrogers823
--

SELECT pg_catalog.setval('public.expenses_banks_id_seq', 1, true);


--
-- Name: expenses_categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: alexrogers823
--

SELECT pg_catalog.setval('public.expenses_categories_id_seq', 9, true);


--
-- Name: expenses_expenses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: alexrogers823
--

SELECT pg_catalog.setval('public.expenses_expenses_id_seq', 497, true);


--
-- Name: users_userprofile_id_seq; Type: SEQUENCE SET; Schema: public; Owner: alexrogers823
--

SELECT pg_catalog.setval('public.users_userprofile_id_seq', 4, true);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: alexrogers823
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: alexrogers823
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: alexrogers823
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: alexrogers823
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: alexrogers823
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: alexrogers823
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: alexrogers823
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: alexrogers823
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: alexrogers823
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: alexrogers823
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: alexrogers823
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: alexrogers823
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: alexrogers823
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: alexrogers823
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: alexrogers823
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: alexrogers823
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: alexrogers823
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: expenses_banks expenses_banks_pkey; Type: CONSTRAINT; Schema: public; Owner: alexrogers823
--

ALTER TABLE ONLY public.expenses_banks
    ADD CONSTRAINT expenses_banks_pkey PRIMARY KEY (id);


--
-- Name: expenses_categories expenses_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: alexrogers823
--

ALTER TABLE ONLY public.expenses_categories
    ADD CONSTRAINT expenses_categories_pkey PRIMARY KEY (id);


--
-- Name: expenses_expenses expenses_expenses_pkey; Type: CONSTRAINT; Schema: public; Owner: alexrogers823
--

ALTER TABLE ONLY public.expenses_expenses
    ADD CONSTRAINT expenses_expenses_pkey PRIMARY KEY (id);


--
-- Name: users_userprofile users_userprofile_pkey; Type: CONSTRAINT; Schema: public; Owner: alexrogers823
--

ALTER TABLE ONLY public.users_userprofile
    ADD CONSTRAINT users_userprofile_pkey PRIMARY KEY (id);


--
-- Name: users_userprofile users_userprofile_user_id_key; Type: CONSTRAINT; Schema: public; Owner: alexrogers823
--

ALTER TABLE ONLY public.users_userprofile
    ADD CONSTRAINT users_userprofile_user_id_key UNIQUE (user_id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: alexrogers823
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: alexrogers823
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: alexrogers823
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: alexrogers823
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: alexrogers823
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: alexrogers823
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: alexrogers823
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: alexrogers823
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: alexrogers823
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: alexrogers823
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: alexrogers823
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: alexrogers823
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: alexrogers823
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: expenses_expenses_bank_id_id_5be3ff59; Type: INDEX; Schema: public; Owner: alexrogers823
--

CREATE INDEX expenses_expenses_bank_id_id_5be3ff59 ON public.expenses_expenses USING btree (bank_id_id);


--
-- Name: expenses_expenses_category_id_bee7f381; Type: INDEX; Schema: public; Owner: alexrogers823
--

CREATE INDEX expenses_expenses_category_id_bee7f381 ON public.expenses_expenses USING btree (category_id);


--
-- Name: expenses_expenses_user_id_id_66b4fa35; Type: INDEX; Schema: public; Owner: alexrogers823
--

CREATE INDEX expenses_expenses_user_id_id_66b4fa35 ON public.expenses_expenses USING btree (user_id);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: alexrogers823
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: alexrogers823
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: alexrogers823
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: alexrogers823
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: alexrogers823
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: alexrogers823
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: alexrogers823
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: alexrogers823
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: alexrogers823
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: expenses_expenses expenses_expenses_bank_id_id_5be3ff59_fk_expenses_banks_id; Type: FK CONSTRAINT; Schema: public; Owner: alexrogers823
--

ALTER TABLE ONLY public.expenses_expenses
    ADD CONSTRAINT expenses_expenses_bank_id_id_5be3ff59_fk_expenses_banks_id FOREIGN KEY (bank_id_id) REFERENCES public.expenses_banks(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: expenses_expenses expenses_expenses_category_id_bee7f381_fk_expenses_; Type: FK CONSTRAINT; Schema: public; Owner: alexrogers823
--

ALTER TABLE ONLY public.expenses_expenses
    ADD CONSTRAINT expenses_expenses_category_id_bee7f381_fk_expenses_ FOREIGN KEY (category_id) REFERENCES public.expenses_categories(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: expenses_expenses expenses_expenses_user_id_ee8d5f81_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: alexrogers823
--

ALTER TABLE ONLY public.expenses_expenses
    ADD CONSTRAINT expenses_expenses_user_id_ee8d5f81_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_userprofile users_userprofile_user_id_87251ef1_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: alexrogers823
--

ALTER TABLE ONLY public.users_userprofile
    ADD CONSTRAINT users_userprofile_user_id_87251ef1_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

