--
-- PostgreSQL database dump
--

-- Dumped from database version 12.6 (Debian 12.6-1.pgdg100+1)
-- Dumped by pg_dump version 12.6 (Debian 12.6-1.pgdg100+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: tidy
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO tidy;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: tidy
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO tidy;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tidy
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: tidy
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO tidy;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: tidy
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO tidy;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tidy
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: tidy
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO tidy;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: tidy
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO tidy;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tidy
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: tidy
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO tidy;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: tidy
--

CREATE TABLE public.auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO tidy;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: tidy
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO tidy;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tidy
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: tidy
--

CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO tidy;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tidy
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: tidy
--

CREATE TABLE public.auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO tidy;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: tidy
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO tidy;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tidy
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- Name: core_house; Type: TABLE; Schema: public; Owner: tidy
--

CREATE TABLE public.core_house (
    id integer NOT NULL,
    name character varying(200) NOT NULL,
    onwer_id integer NOT NULL
);


ALTER TABLE public.core_house OWNER TO tidy;

--
-- Name: core_house_id_seq; Type: SEQUENCE; Schema: public; Owner: tidy
--

CREATE SEQUENCE public.core_house_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.core_house_id_seq OWNER TO tidy;

--
-- Name: core_house_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tidy
--

ALTER SEQUENCE public.core_house_id_seq OWNED BY public.core_house.id;


--
-- Name: core_location; Type: TABLE; Schema: public; Owner: tidy
--

CREATE TABLE public.core_location (
    id integer NOT NULL,
    name character varying(200) NOT NULL,
    house_id integer,
    thing_id uuid
);


ALTER TABLE public.core_location OWNER TO tidy;

--
-- Name: core_location_id_seq; Type: SEQUENCE; Schema: public; Owner: tidy
--

CREATE SEQUENCE public.core_location_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.core_location_id_seq OWNER TO tidy;

--
-- Name: core_location_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tidy
--

ALTER SEQUENCE public.core_location_id_seq OWNED BY public.core_location.id;


--
-- Name: core_owner; Type: TABLE; Schema: public; Owner: tidy
--

CREATE TABLE public.core_owner (
    id integer NOT NULL,
    name character varying(200) NOT NULL
);


ALTER TABLE public.core_owner OWNER TO tidy;

--
-- Name: core_owner_id_seq; Type: SEQUENCE; Schema: public; Owner: tidy
--

CREATE SEQUENCE public.core_owner_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.core_owner_id_seq OWNER TO tidy;

--
-- Name: core_owner_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tidy
--

ALTER SEQUENCE public.core_owner_id_seq OWNED BY public.core_owner.id;


--
-- Name: core_plane; Type: TABLE; Schema: public; Owner: tidy
--

CREATE TABLE public.core_plane (
    id integer NOT NULL,
    name character varying(200) NOT NULL
);


ALTER TABLE public.core_plane OWNER TO tidy;

--
-- Name: core_plane_id_seq; Type: SEQUENCE; Schema: public; Owner: tidy
--

CREATE SEQUENCE public.core_plane_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.core_plane_id_seq OWNER TO tidy;

--
-- Name: core_plane_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tidy
--

ALTER SEQUENCE public.core_plane_id_seq OWNED BY public.core_plane.id;


--
-- Name: core_sublocation; Type: TABLE; Schema: public; Owner: tidy
--

CREATE TABLE public.core_sublocation (
    id integer NOT NULL,
    name character varying(200) NOT NULL,
    location_id integer NOT NULL
);


ALTER TABLE public.core_sublocation OWNER TO tidy;

--
-- Name: core_sublocation_id_seq; Type: SEQUENCE; Schema: public; Owner: tidy
--

CREATE SEQUENCE public.core_sublocation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.core_sublocation_id_seq OWNER TO tidy;

--
-- Name: core_sublocation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tidy
--

ALTER SEQUENCE public.core_sublocation_id_seq OWNED BY public.core_sublocation.id;


--
-- Name: core_subtype; Type: TABLE; Schema: public; Owner: tidy
--

CREATE TABLE public.core_subtype (
    id integer NOT NULL,
    name character varying(200),
    type_id integer
);


ALTER TABLE public.core_subtype OWNER TO tidy;

--
-- Name: core_subtype_default_tags; Type: TABLE; Schema: public; Owner: tidy
--

CREATE TABLE public.core_subtype_default_tags (
    id integer NOT NULL,
    subtype_id integer NOT NULL,
    tagtype_id integer NOT NULL
);


ALTER TABLE public.core_subtype_default_tags OWNER TO tidy;

--
-- Name: core_subtype_default_tags_id_seq; Type: SEQUENCE; Schema: public; Owner: tidy
--

CREATE SEQUENCE public.core_subtype_default_tags_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.core_subtype_default_tags_id_seq OWNER TO tidy;

--
-- Name: core_subtype_default_tags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tidy
--

ALTER SEQUENCE public.core_subtype_default_tags_id_seq OWNED BY public.core_subtype_default_tags.id;


--
-- Name: core_subtype_id_seq; Type: SEQUENCE; Schema: public; Owner: tidy
--

CREATE SEQUENCE public.core_subtype_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.core_subtype_id_seq OWNER TO tidy;

--
-- Name: core_subtype_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tidy
--

ALTER SEQUENCE public.core_subtype_id_seq OWNED BY public.core_subtype.id;


--
-- Name: core_tag; Type: TABLE; Schema: public; Owner: tidy
--

CREATE TABLE public.core_tag (
    id integer NOT NULL,
    value character varying(200),
    "tagType_id" integer
);


ALTER TABLE public.core_tag OWNER TO tidy;

--
-- Name: core_tag_id_seq; Type: SEQUENCE; Schema: public; Owner: tidy
--

CREATE SEQUENCE public.core_tag_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.core_tag_id_seq OWNER TO tidy;

--
-- Name: core_tag_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tidy
--

ALTER SEQUENCE public.core_tag_id_seq OWNED BY public.core_tag.id;


--
-- Name: core_tagtype; Type: TABLE; Schema: public; Owner: tidy
--

CREATE TABLE public.core_tagtype (
    id integer NOT NULL,
    name character varying(200) NOT NULL,
    suffix character varying(200) NOT NULL,
    "default_subType_id" integer,
    default_type_id integer
);


ALTER TABLE public.core_tagtype OWNER TO tidy;

--
-- Name: core_tagtype_id_seq; Type: SEQUENCE; Schema: public; Owner: tidy
--

CREATE SEQUENCE public.core_tagtype_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.core_tagtype_id_seq OWNER TO tidy;

--
-- Name: core_tagtype_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tidy
--

ALTER SEQUENCE public.core_tagtype_id_seq OWNED BY public.core_tagtype.id;


--
-- Name: core_thing; Type: TABLE; Schema: public; Owner: tidy
--

CREATE TABLE public.core_thing (
    id uuid NOT NULL,
    name character varying(150) NOT NULL,
    location_id integer,
    "subType_id" integer,
    sublocation_id integer,
    type_id integer,
    barcode character varying(128),
    labeled boolean NOT NULL,
    designated_location_id integer,
    designated_sublocation_id integer,
    description character varying(300)
);


ALTER TABLE public.core_thing OWNER TO tidy;

--
-- Name: core_thing_tags; Type: TABLE; Schema: public; Owner: tidy
--

CREATE TABLE public.core_thing_tags (
    id integer NOT NULL,
    thing_id uuid NOT NULL,
    tag_id integer NOT NULL
);


ALTER TABLE public.core_thing_tags OWNER TO tidy;

--
-- Name: core_thing_tags_id_seq; Type: SEQUENCE; Schema: public; Owner: tidy
--

CREATE SEQUENCE public.core_thing_tags_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.core_thing_tags_id_seq OWNER TO tidy;

--
-- Name: core_thing_tags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tidy
--

ALTER SEQUENCE public.core_thing_tags_id_seq OWNED BY public.core_thing_tags.id;


--
-- Name: core_type; Type: TABLE; Schema: public; Owner: tidy
--

CREATE TABLE public.core_type (
    id integer NOT NULL,
    name character varying(200) NOT NULL,
    plane_id integer
);


ALTER TABLE public.core_type OWNER TO tidy;

--
-- Name: core_type_default_tags; Type: TABLE; Schema: public; Owner: tidy
--

CREATE TABLE public.core_type_default_tags (
    id integer NOT NULL,
    type_id integer NOT NULL,
    tagtype_id integer NOT NULL
);


ALTER TABLE public.core_type_default_tags OWNER TO tidy;

--
-- Name: core_type_default_tags_id_seq; Type: SEQUENCE; Schema: public; Owner: tidy
--

CREATE SEQUENCE public.core_type_default_tags_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.core_type_default_tags_id_seq OWNER TO tidy;

--
-- Name: core_type_default_tags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tidy
--

ALTER SEQUENCE public.core_type_default_tags_id_seq OWNED BY public.core_type_default_tags.id;


--
-- Name: core_type_id_seq; Type: SEQUENCE; Schema: public; Owner: tidy
--

CREATE SEQUENCE public.core_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.core_type_id_seq OWNER TO tidy;

--
-- Name: core_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tidy
--

ALTER SEQUENCE public.core_type_id_seq OWNED BY public.core_type.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: tidy
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


ALTER TABLE public.django_admin_log OWNER TO tidy;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: tidy
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO tidy;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tidy
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: tidy
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO tidy;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: tidy
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO tidy;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tidy
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: tidy
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO tidy;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: tidy
--

CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO tidy;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tidy
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: tidy
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO tidy;

--
-- Name: sequences_sequence; Type: TABLE; Schema: public; Owner: tidy
--

CREATE TABLE public.sequences_sequence (
    name character varying(100) NOT NULL,
    last bigint NOT NULL,
    CONSTRAINT sequences_sequence_last_check CHECK ((last >= 0))
);


ALTER TABLE public.sequences_sequence OWNER TO tidy;

--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: tidy
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: tidy
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: tidy
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: tidy
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: tidy
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: tidy
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: core_house id; Type: DEFAULT; Schema: public; Owner: tidy
--

ALTER TABLE ONLY public.core_house ALTER COLUMN id SET DEFAULT nextval('public.core_house_id_seq'::regclass);


--
-- Name: core_location id; Type: DEFAULT; Schema: public; Owner: tidy
--

ALTER TABLE ONLY public.core_location ALTER COLUMN id SET DEFAULT nextval('public.core_location_id_seq'::regclass);


--
-- Name: core_owner id; Type: DEFAULT; Schema: public; Owner: tidy
--

ALTER TABLE ONLY public.core_owner ALTER COLUMN id SET DEFAULT nextval('public.core_owner_id_seq'::regclass);


--
-- Name: core_plane id; Type: DEFAULT; Schema: public; Owner: tidy
--

ALTER TABLE ONLY public.core_plane ALTER COLUMN id SET DEFAULT nextval('public.core_plane_id_seq'::regclass);


--
-- Name: core_sublocation id; Type: DEFAULT; Schema: public; Owner: tidy
--

ALTER TABLE ONLY public.core_sublocation ALTER COLUMN id SET DEFAULT nextval('public.core_sublocation_id_seq'::regclass);


--
-- Name: core_subtype id; Type: DEFAULT; Schema: public; Owner: tidy
--

ALTER TABLE ONLY public.core_subtype ALTER COLUMN id SET DEFAULT nextval('public.core_subtype_id_seq'::regclass);


--
-- Name: core_subtype_default_tags id; Type: DEFAULT; Schema: public; Owner: tidy
--

ALTER TABLE ONLY public.core_subtype_default_tags ALTER COLUMN id SET DEFAULT nextval('public.core_subtype_default_tags_id_seq'::regclass);


--
-- Name: core_tag id; Type: DEFAULT; Schema: public; Owner: tidy
--

ALTER TABLE ONLY public.core_tag ALTER COLUMN id SET DEFAULT nextval('public.core_tag_id_seq'::regclass);


--
-- Name: core_tagtype id; Type: DEFAULT; Schema: public; Owner: tidy
--

ALTER TABLE ONLY public.core_tagtype ALTER COLUMN id SET DEFAULT nextval('public.core_tagtype_id_seq'::regclass);


--
-- Name: core_thing_tags id; Type: DEFAULT; Schema: public; Owner: tidy
--

ALTER TABLE ONLY public.core_thing_tags ALTER COLUMN id SET DEFAULT nextval('public.core_thing_tags_id_seq'::regclass);


--
-- Name: core_type id; Type: DEFAULT; Schema: public; Owner: tidy
--

ALTER TABLE ONLY public.core_type ALTER COLUMN id SET DEFAULT nextval('public.core_type_id_seq'::regclass);


--
-- Name: core_type_default_tags id; Type: DEFAULT; Schema: public; Owner: tidy
--

ALTER TABLE ONLY public.core_type_default_tags ALTER COLUMN id SET DEFAULT nextval('public.core_type_default_tags_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: tidy
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: tidy
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: tidy
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: tidy
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: tidy
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: tidy
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add house	1	add_house
2	Can change house	1	change_house
3	Can delete house	1	delete_house
4	Can add location	2	add_location
5	Can change location	2	change_location
6	Can delete location	2	delete_location
7	Can add owner	3	add_owner
8	Can change owner	3	change_owner
9	Can delete owner	3	delete_owner
10	Can add plane	4	add_plane
11	Can change plane	4	change_plane
12	Can delete plane	4	delete_plane
13	Can add sublocation	5	add_sublocation
14	Can change sublocation	5	change_sublocation
15	Can delete sublocation	5	delete_sublocation
16	Can add sub type	6	add_subtype
17	Can change sub type	6	change_subtype
18	Can delete sub type	6	delete_subtype
19	Can add tag	7	add_tag
20	Can change tag	7	change_tag
21	Can delete tag	7	delete_tag
22	Can add tag type	8	add_tagtype
23	Can change tag type	8	change_tagtype
24	Can delete tag type	8	delete_tagtype
25	Can add thing	9	add_thing
26	Can change thing	9	change_thing
27	Can delete thing	9	delete_thing
28	Can add type	10	add_type
29	Can change type	10	change_type
30	Can delete type	10	delete_type
31	Can add log entry	11	add_logentry
32	Can change log entry	11	change_logentry
33	Can delete log entry	11	delete_logentry
34	Can add permission	12	add_permission
35	Can change permission	12	change_permission
36	Can delete permission	12	delete_permission
37	Can add group	13	add_group
38	Can change group	13	change_group
39	Can delete group	13	delete_group
40	Can add user	14	add_user
41	Can change user	14	change_user
42	Can delete user	14	delete_user
43	Can add content type	15	add_contenttype
44	Can change content type	15	change_contenttype
45	Can delete content type	15	delete_contenttype
46	Can add session	16	add_session
47	Can change session	16	change_session
48	Can delete session	16	delete_session
49	Can view house	1	view_house
50	Can view location	2	view_location
51	Can view owner	3	view_owner
52	Can view plane	4	view_plane
53	Can view sublocation	5	view_sublocation
54	Can view sub type	6	view_subtype
55	Can view tag	7	view_tag
56	Can view tag type	8	view_tagtype
57	Can view thing	9	view_thing
58	Can view type	10	view_type
59	Can view log entry	11	view_logentry
60	Can view permission	12	view_permission
61	Can view group	13	view_group
62	Can view user	14	view_user
63	Can view content type	15	view_contenttype
64	Can view session	16	view_session
65	Can add sequence	17	add_sequence
66	Can change sequence	17	change_sequence
67	Can delete sequence	17	delete_sequence
68	Can view sequence	17	view_sequence
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: tidy
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
2	pbkdf2_sha256$100000$XqKUldYOgugk$rli7i3LG+uqXCLXMuyR2db7v+NDWBTSG4h+QnYxedDo=	2019-02-26 09:17:53.01327+00	t	admin			admin@admin.com	t	t	2019-02-26 09:17:37.823462+00
1	pbkdf2_sha256$390000$HhfFqURsgVnZKHShR10aM2$4ZjEiSV796seW7b0JmtxTPo5dSI7sdbswssn58IZIfQ=	2023-07-29 13:09:20.836076+00	t	tidy			verdienste@gmail.com	t	t	2018-08-01 18:18:24.796002+00
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: tidy
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: tidy
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: core_house; Type: TABLE DATA; Schema: public; Owner: tidy
--

COPY public.core_house (id, name, onwer_id) FROM stdin;
1	Bagz	1
\.


--
-- Data for Name: core_location; Type: TABLE DATA; Schema: public; Owner: tidy
--

COPY public.core_location (id, name, house_id, thing_id) FROM stdin;
1	Magma bag	1	\N
2	Grey Drawer	1	\N
3	Eastpak blue bag	1	\N
4	Case Logic photo backpack	1	f0ea34fc-649c-4604-aa3b-58d8c53fe82c
5	Big closet	1	\N
23	Outside	\N	\N
24	Drumset	1	\N
25	Attic	1	\N
26	Doepfer d3m	1	\N
27	Outer Door Hanger	1	\N
28	Kitchen Closet	1	\N
29	Sofa left	1	\N
30	Sofa right	1	\N
31	Desk	1	\N
\.


--
-- Data for Name: core_owner; Type: TABLE DATA; Schema: public; Owner: tidy
--

COPY public.core_owner (id, name) FROM stdin;
1	Alex Tziallas
\.


--
-- Data for Name: core_plane; Type: TABLE DATA; Schema: public; Owner: tidy
--

COPY public.core_plane (id, name) FROM stdin;
1	Audio
2	Computing & Gadgets
3	Photography and Video
4	Tools
7	Hobby
6	Home
\.


--
-- Data for Name: core_sublocation; Type: TABLE DATA; Schema: public; Owner: tidy
--

COPY public.core_sublocation (id, name, location_id) FROM stdin;
1	5th drawer	2
2	4th drawer	2
3	1st drawer	5
4	2nd drawer	5
5	3rd drawer	5
6	Kick	24
7	Snare	24
8	Boxes box	25
9	Plastic Bag	25
10	Αλμανάκο Box	25
11	1st Shelf	28
12	Headphones	24
13	High Tom	24
14	Medium Tom	24
15	Floor Tom	24
16	Mackie	24
17	Left	31
18	Right	31
\.


--
-- Data for Name: core_subtype; Type: TABLE DATA; Schema: public; Owner: tidy
--

COPY public.core_subtype (id, name, type_id) FROM stdin;
1	XLR to XLR	1
2	PSU to Socket	2
3	Ethernet Hub	3
4	Portable Speaker	4
5	XLR to TRS	1
6	TS to TS	1
7	DVI to DVI	5
9	Type A to Type B	6
8	Type A to Lightning	6
11	Pouch	9
12	VGA to VGA	5
13	Minijack TRS to Minijack TRS	1
14	Apple Headphones	11
15	Game Controller	3
16	Wireless controller dock	3
17	Portable tripod	15
18	Micro USB 5-pin	6
19	USB Mini	6
20	USB type A extension	6
21	Flashlight	16
22	USB Wi-fi	3
23	Workout Gloves	22
24	3 way (no ground)	23
25	Extension	23
26	Plastic Bag	16
27	Audio Amp Tubes	29
28	TS to angled TS	1
29	HDMI	5
30	Display Port to Display Port	5
31	Type C to DisplayPort(1.4)	5
32	Power Strip	31
33	Extension	31
\.


--
-- Data for Name: core_subtype_default_tags; Type: TABLE DATA; Schema: public; Owner: tidy
--

COPY public.core_subtype_default_tags (id, subtype_id, tagtype_id) FROM stdin;
1	1	1
2	2	1
3	5	1
4	6	1
5	7	1
6	8	1
7	9	1
9	12	1
10	13	1
11	18	1
12	19	1
13	20	1
14	25	1
15	28	1
16	29	1
17	30	1
18	31	1
19	32	1
20	33	1
\.


--
-- Data for Name: core_tag; Type: TABLE DATA; Schema: public; Owner: tidy
--

COPY public.core_tag (id, value, "tagType_id") FROM stdin;
1	20	1
2	6	1
3	8	1
4	2	1
5	10	1
6	0.5	1
7	5	1
8	1	1
9	1.5	1
10	4	1
11	0.25	1
12	5	1
13	3	1
14	2.5	1
15	15	1
16	1.8	1
17	4	2
18	8	2
23	\N	3
\.


--
-- Data for Name: core_tagtype; Type: TABLE DATA; Schema: public; Owner: tidy
--

COPY public.core_tagtype (id, name, suffix, "default_subType_id", default_type_id) FROM stdin;
1	Length	m	\N	\N
2	Sockets		32	31
3	Surge Protection		\N	31
\.


--
-- Data for Name: core_thing; Type: TABLE DATA; Schema: public; Owner: tidy
--

COPY public.core_thing (id, name, location_id, "subType_id", sublocation_id, type_id, barcode, labeled, designated_location_id, designated_sublocation_id, description) FROM stdin;
beb09972-c099-4194-abd4-86d96126a827	XBox 360 Controller	2	15	2	3	\N	f	\N	\N	\N
265b0f35-696d-4751-b8b3-ec260066ed0c	Philips Warm 60w light	5	\N	3	17	8718696577554	t	\N	\N	\N
20317107-1c6e-41df-8887-a23ba85c1615	UTP Cable (0.5m)	\N	\N	\N	8	\N	f	\N	\N	\N
21061901-5a60-4d85-9852-72197bb3a894	Kanex Lighning Cable	\N	8	\N	6	2000000000376	f	\N	\N	\N
830208f6-0912-4f81-bdf9-312ac2edf178	Micro Usb (5-pin 0.25m)	2	18	2	6	2000000000338	f	5	5	\N
1e5844be-78ab-4457-bbc6-d5ccd4351820	Ikea 10x AA batteries	5	\N	3	18	23050	f	\N	\N	\N
29993f77-1d6f-48b3-93ab-2c478ddcdb8a	Powerball	5	\N	4	19		f	\N	\N	\N
23b00d9b-751d-4af8-8cd4-9cdc9aad1ff9	USB Mini cable (1m)	\N	19	\N	6	2000000000369	f	5	5	\N
cc2c4878-d62a-4815-8e0f-dd19670dcfdf	Samsung SSD 840 PRO box	2	\N	1	7	\N	f	\N	\N	\N
8ad8223a-14e8-4138-8e6d-fba088bea52e	X-mini II	5	4	4	4		f	\N	\N	\N
c3276ad6-14ee-4b87-ae65-dfca5f3637fd	Nikon MH-24 Battery Charger	2	\N	2	13	\N	f	\N	\N	\N
85ab1d1b-3ef2-4003-9244-1e2ba3341eb0	Microsoft XBox 360 Wifi dock	2	16	2	3	\N	f	\N	\N	\N
376a247f-a970-491c-ab1f-68bc2f2c4f57	EMU USB Midi Pouch	1	11	\N	9	\N	f	\N	\N	\N
81759e2f-266e-4339-a769-21f16531d6a6	PSU Cable (2.5m)	2	2	2	2	2000000000244	t	\N	\N	\N
60b77772-51c0-43c1-ad50-d2d4733047af	Midi Cable (6m)	5	\N	3	12	2000000000275	t	5	3	\N
c6b7f042-080c-4903-95bc-f8b4276d1393	Proel XLR Cable (5m)	5	1	3	1	2000000000046	t	\N	\N	\N
e0030d6b-0bfd-4a89-811e-6694f0aef7de	Plastic Bags	5	26	5	16		f	\N	\N	\N
03ba330a-aeac-44ea-b1d1-8eb737d68bf0	Proel Midi Cable (4m)	26	\N	\N	12	2000000000282	t	5	3	\N
3f8422a8-e502-4023-922b-a8c3a2084cc5	Apple Headphones (old)	2	14	2	11	\N	f	\N	\N	\N
220cfb5c-c08f-4d27-864f-e4964dd58209	PSU Cable (2m)	\N	2	\N	2	2000000000213	t	\N	\N	\N
3b546106-29dc-4493-a119-d7d585a47706	Double PSU Cable (2m)	\N	2	\N	2	2000000000220	t	\N	\N	\N
017a4fd5-53c1-485a-bdb3-5c7b60d74ccf	sssnake midi cable (4m)	5	\N	3	12	2000000000299	t	5	3	\N
05944d2a-0ce3-441b-8b82-f6ffcf07e1d1	Northpole headlight lead	\N	21	\N	16	7071875007686	t	\N	\N	\N
51e2b769-9858-4c86-be65-f2bd3d6520a6	Locks	5	\N	4	25	\N	f	5	4	\N
df9166e1-24ed-49d7-89e7-83803fa14ceb	JBL Clip 2	2	4	2	4	\N	f	\N	\N	\N
c4402dc7-0f92-4dba-9415-b5fc3ed45665	Joby flexible tripod	2	17	\N	15	\N	f	\N	\N	\N
7c5446c5-8e40-4277-8573-fde5bd81a191	Old Keys	5	\N	5	20		f	\N	\N	\N
2c6c49fa-242f-409d-85e7-cf266fb3685b	VGA to MiniDisplay	2	\N	\N	10	\N	f	\N	\N	\N
7bf4399e-9804-4ea8-b2d3-8f8af368d04e	Netgear 8-port Ethernet Hub (100 Mbps)	5	3	4	3	\N	f	\N	\N	\N
428f72fe-7926-4cb1-adad-cff8cb377beb	TP-LINK TL-WN722N	5	22	4	3	2147356003903	f	\N	\N	\N
311440f6-e267-4422-9636-8df7f7b8dc06	Gym Gloves	5	23	5	22		f	\N	\N	\N
3232384c-3616-4850-86cc-5c84d2c7165d	3 port electric socket (no ground)	\N	24	\N	23		f	\N	\N	\N
3527851f-6260-489d-aa6e-34fd02d1eab9	3 meter electric socket extension (no ground)	\N	25	\N	23		f	\N	\N	\N
b08b1d6b-a58b-4f1d-a563-03043be48f60	UTP Cable (5m)	2	\N	2	8	\N	f	\N	\N	\N
032a4577-aeb3-47f2-a8a0-776f5687838d	Micro Usb (5-pin 0.5m)	\N	18	\N	6	2000000000390	f	5	5	\N
0cf8e945-d00f-4220-ae6f-ba7965a2e857	USB mini cable (0.5m)	\N	19	\N	6	2000000000383	f	5	5	\N
38774dc5-6ea2-4c8e-a3a4-614949b82778	USB extension cable	\N	20	\N	6	2000000000345	t	5	5	\N
be4ef97d-4772-4523-8f07-1a84e24f9148	Sentio iphone cable	2	8	2	6	2000000000321	f	5	5	\N
347a0080-a0b0-4dd4-b0ab-36fbb5440522	USB type B cable	1	9	\N	6	2000000000352	t	5	4	\N
6c934ac1-7a49-4131-a05c-afa89602150d	Proel XLR Cable (3m)	5	1	3	1	2000000000060	t	5	3	\N
22ad324e-6030-450a-9f25-29458800d6db	Belden 8m XLR Cable	5	1	3	1	2000000000206	t	5	3	\N
f0ea34fc-649c-4604-aa3b-58d8c53fe82c	Case Logic photo backpack	5	\N	5	14	\N	f	\N	\N	\N
6a92511e-e505-4f1c-a37a-6409e7d84038	Proel XLR Cable (10m)	5	1	3	1	2000000000152	t	5	3	\N
353dee8a-3562-47f0-8f22-591aa7a55cd9	Proel XLR Cable (3m)	5	1	3	1	2000000000077	t	5	3	\N
1bf6ef46-55a6-41ac-aba9-a2dec2adddec	Proel XLR Cable (3m)	5	1	3	1	2000000000053	t	5	3	\N
b11e600b-7931-4d9f-be24-7880c932861e	Proel XLR Cable (10m)	5	1	3	1	2000000000121	t	5	3	\N
fb00a1c2-e45a-432a-8be4-6bf722d85226	Memorabillia	5	\N	5	21		f	5	5	\N
62569cb3-1943-41bb-a788-cd3f9ed5aa08	Proel XLR Cable (5m)	5	1	3	1	2000000000169	t	5	3	\N
57d0fc9b-fbea-441a-bc9d-bf4a33ab0a52	Proel XLR Cable (5m)	5	1	3	1	2000000000183	t	5	3	\N
3ef7ac3a-7a59-48e7-a546-3fb4f817217d	Small Clone Box	25	\N	8	26	683274010137	f	25	8	\N
022623d7-4527-4e0a-a407-8e704927b751	MXR Boost Box	25	\N	8	26	710137031944	f	25	8	\N
47f066b3-e990-4010-9974-bc07d7500d3e	Memory Boy Deluxe box	25	\N	8	26	683274011059	f	25	8	\N
9553b9e1-1f7d-42a3-bf4b-194f3a96ae0e	CryBaby wah box	25	\N	8	26	710137017665	f	25	8	\N
82a48823-d0ea-4d45-af79-a1daf3364b05	BOSS TU-2 box	25	\N	8	7	761294047224	f	25	8	\N
181fa799-a2a2-4d30-a7aa-49b28c32bc1b	Sennheiser RS 180 Box	25	\N	8	7	615104170520	f	25	8	\N
978fdd14-05bc-4812-9afe-d8aafe86f89a	Nikkor 50mm f/1.4G Box	25	\N	8	26	018202021822	f	25	8	\N
ac047b3c-264d-4857-95d3-a1c569a595c3	AKAI MPK 25 box	25	\N	9	7	\N	f	25	9	\N
78eaa927-3cc1-48ae-86a7-31c852c7ff97	Granite TS Cable (10m)	5	6	3	1	2000000000015	t	5	3	\N
9739fb02-715e-4fd3-ade9-73f134be58d7	Proel TS Cable (3m)	5	6	3	1	2000000000022	t	5	3	\N
404313bb-2792-4a7f-8352-89a703297848	Xiaomi Body comp box and receipt	\N	\N	\N	7	6934177707452	t	\N	\N	\N
1ed86a10-9574-4e47-a3fe-0071b6e6cbb7	Ysis Naterial extra screws and poles (Club 3d)	5	\N	4	16	\N	f	5	4	\N
7dd264cb-604f-4242-bed3-14dd665b13b1	Custom Audio Amp Tubes	5	27	4	29	\N	f	5	4	\N
212b7ab2-aa2e-4dd0-b64f-e7152535c7ec	LED Magic Ball	28	\N	11	17	\N	f	28	11	\N
acc56f6f-47ce-45d5-9b1f-fc6d17a847b0	DVI Cable	2	7	2	5	2000000000253	t	\N	\N	\N
587836e2-7655-4240-969c-907eccacf2b4	Sennheiser Minijack TRS cable	5	13	3	1	2000000000178	t	5	3	\N
5eef6a74-3a74-4883-85d3-3ed809c3c801	Ysis Naterial screen	25	\N	\N	30	\N	f	25	\N	\N
e410753b-e798-46c5-a11b-28cdc1e27977	OEM TS Neutrik (2m)	27	6	\N	1	2000000000109	t	5	3	\N
e9e808a2-4f81-4d94-beda-07be2e5149d6	USB type B cable (2m yellow)	5	9	3	6	2000000000406	t	5	5	\N
f4719fee-f102-4ef4-a262-c79c9896b211	Nintento DMG-04	5	\N	4	27	2000000000695	t	\N	\N	\N
d5c00ffe-2ba4-421d-b984-239b1da9a70d	PSU Cable (2.5m)	\N	2	\N	2	2000000000237	t	\N	\N	\N
ff0dc50e-ee57-48a5-9b5e-081f6f74030c	UTP Cable (5m)	2	\N	2	8	2000000000475	t	\N	\N	\N
dc0229a2-3e27-443a-a82d-ddc2a23cd1d4	USB type B cable	2	9	\N	6	2000000000314	t	5	5	\N
e8a63e00-3bde-42ec-b3ac-3f5e03d195c0	USB type B cable	5	9	3	6	2000000000307	t	2	2	\N
f7fa764f-99e1-48f5-9d26-964e7c983220	Fender TS Cable	5	6	3	1	2000000000084	t	5	3	\N
26dcc1b9-fcfa-4b59-addc-519cb860c507	PSU Cable (1.5m)	\N	2	\N	2	2000000000619	t	\N	\N	\N
8305502d-6824-43bc-bb3a-c22f06bb4c92	PSU Cable (1.5m)	\N	2	\N	2	2000000000626	t	\N	\N	\N
cbcd1949-230f-4988-b3d0-9603c33cf2ed	Accu XLR Cable (20m)	24	1	\N	1	2000000000114	f	24	6	\N
1c424dcc-75d7-4c26-a1c0-cbc0d8c46fdf	DIsplay port cable (2m)	\N	30	\N	5	2000000000633	t	\N	\N	\N
487a9978-27d5-4bc1-8ad1-d515a9a84708	Type C to DisplayPort cable (1.8m)	\N	31	\N	5	2000000000640	t	\N	\N	\N
7bdfe976-9b17-4f51-a0a2-b0954ae1bd12	Proel XLR to TRS (2m)	\N	5	\N	1	2000000000657	t	\N	\N	\N
43b3a7af-4cff-4a83-a592-26681d44ac93	Prof low noise inst cable (2m TS)	27	6	\N	1	2000000000192	t	5	3	\N
28498857-23f3-492d-a283-76b1b5a8fd61	VGA Cable (0.5m)	\N	12	\N	5	2000000000260	t	\N	\N	\N
217e4015-792c-4d96-9bba-d8ff279abc35	SC The Spirit cable (15m)	\N	28	\N	1	2000000000541	t	\N	\N	\N
4cf1b8b9-a9e9-4257-acb9-f021acc05b67	HDMI Cable (2m)	\N	29	\N	5	2000000000558	t	\N	\N	\N
a3124db2-9cc1-47c3-a654-bc00c5619f3b	HDMI Cable (1m)	\N	29	\N	5	2000000000565	t	\N	\N	\N
10ade344-0c51-4ff7-acaf-9a375ae182d5	PSU Cable (2m)	\N	2	\N	2	2000000000572	t	\N	\N	\N
59b8a868-08eb-4d4d-a71e-a1077e50fc50	PSU Cable (1.5m)	\N	2	\N	2	2000000000589	t	\N	\N	\N
0d6c3c35-02ec-4cb1-9251-83c88f6245f8	PSU Cable (2m)	\N	2	\N	2	2000000000602	t	\N	\N	\N
ba8ac1ce-fca8-4405-889a-1866113ebedb	Disney Old Comics	25	\N	10	28	\N	f	\N	\N	Αλμανάκο, Ντόναλτ, Μίκυ Μυστήριο, Κλασικά, Το βιβλίο των εξερευνητών
e43beb99-6e20-4f8b-93a7-32c15ef45ea7	Proel XLR to TRS (2m)	\N	5	\N	1	2000000000664	t	\N	\N	\N
fa8aa674-93a0-4400-9f04-f58908ca2213	Fender California Cable Red (3m)	\N	6	\N	1	2000000000688	t	\N	\N	\N
f5e9939e-91d1-42a2-ad88-1ede57f2b053	PSU Cable (grey - 2m)	\N	2	\N	2	2000000000596	t	\N	\N	\N
e7b3ed13-acb3-4e0c-bd29-bf5d2224ebcf	HDMI Cable (1440p - 144hz - 2m)	\N	29	\N	5	2000000000671	t	\N	\N	\N
6091910d-33be-451e-9a73-46e523f28c63	Cordial XLR cable (15m)	24	1	\N	1	2000000000497	t	\N	\N	\N
753ee03b-e393-4637-b36d-8babb5fdb0e5	Accu XLR Cable (20m)	5	1	3	1	2000000000138	t	5	3	Long Cable
db97470b-0012-4ef6-8bb5-829bfbda8e1e	SC The stage cable (15m)	24	5	12	1	2000000000527	t	\N	\N	\N
ddea3c4f-b07a-499e-8854-806283608548	Cordial XLR cable (15m)	24	1	6	1	2000000000503	t	\N	\N	\N
5ae0ae41-9e3f-40aa-87ba-39ac1a94eb4d	Cordial XLR cable (15m)	24	1	7	1	2000000000510	t	\N	\N	\N
7c4d5c6b-af99-4379-802c-e841b07ac019	SC The stage cable (15m)	24	5	16	1	2000000000534	t	\N	\N	\N
d93d009a-56e5-48bd-b0d5-b4fc072c162a	Sommer XLR Cable	5	5	3	1	2000000000701	f	\N	\N	\N
52863f7b-5dac-4236-9aa1-b971857ee988	Legrand 4 Power Strip (1.5m)	\N	32	\N	31	\N	f	\N	\N	\N
bcfdf829-45ea-44b4-aa63-e8f48ae02c65	sas power extension (5m)	\N	33	\N	31	\N	f	\N	\N	\N
14443dd4-a8a7-4e06-ae7d-dd5e01835c4d	sas power extension (10m)	\N	33	\N	31	\N	f	\N	\N	\N
55220308-ba7e-45a6-b9d7-b3d94e7f0f5f	APC Power Strip (Surge Protection)	31	32	17	31	\N	f	\N	\N	\N
ef7229b0-6639-4b31-8245-f630fcbb0364	APC Power Strip (Surge Protection)	31	32	18	31	\N	f	\N	\N	\N
\.


--
-- Data for Name: core_thing_tags; Type: TABLE DATA; Schema: public; Owner: tidy
--

COPY public.core_thing_tags (id, thing_id, tag_id) FROM stdin;
1	cbcd1949-230f-4988-b3d0-9603c33cf2ed	1
3	753ee03b-e393-4637-b36d-8babb5fdb0e5	1
4	22ad324e-6030-450a-9f25-29458800d6db	3
6	6a92511e-e505-4f1c-a37a-6409e7d84038	5
7	b11e600b-7931-4d9f-be24-7880c932861e	5
12	e410753b-e798-46c5-a11b-28cdc1e27977	4
13	acc56f6f-47ce-45d5-9b1f-fc6d17a847b0	4
14	be4ef97d-4772-4523-8f07-1a84e24f9148	6
16	ff0dc50e-ee57-48a5-9b5e-081f6f74030c	7
17	b08b1d6b-a58b-4f1d-a563-03043be48f60	7
18	dc0229a2-3e27-443a-a82d-ddc2a23cd1d4	6
19	347a0080-a0b0-4dd4-b0ab-36fbb5440522	8
20	57d0fc9b-fbea-441a-bc9d-bf4a33ab0a52	7
22	e8a63e00-3bde-42ec-b3ac-3f5e03d195c0	4
23	e9e808a2-4f81-4d94-beda-07be2e5149d6	4
25	28498857-23f3-492d-a283-76b1b5a8fd61	6
26	587836e2-7655-4240-969c-907eccacf2b4	4
27	43b3a7af-4cff-4a83-a592-26681d44ac93	9
28	21061901-5a60-4d85-9852-72197bb3a894	6
29	03ba330a-aeac-44ea-b1d1-8eb737d68bf0	4
30	20317107-1c6e-41df-8887-a23ba85c1615	6
31	017a4fd5-53c1-485a-bdb3-5c7b60d74ccf	10
35	032a4577-aeb3-47f2-a8a0-776f5687838d	6
36	0cf8e945-d00f-4220-ae6f-ba7965a2e857	6
37	830208f6-0912-4f81-bdf9-312ac2edf178	11
38	23b00d9b-751d-4af8-8cd4-9cdc9aad1ff9	8
39	38774dc5-6ea2-4c8e-a3a4-614949b82778	9
40	9739fb02-715e-4fd3-ade9-73f134be58d7	13
42	f7fa764f-99e1-48f5-9d26-964e7c983220	13
43	62569cb3-1943-41bb-a788-cd3f9ed5aa08	7
45	78eaa927-3cc1-48ae-86a7-31c852c7ff97	5
47	c6b7f042-080c-4903-95bc-f8b4276d1393	12
48	1bf6ef46-55a6-41ac-aba9-a2dec2adddec	13
49	6c934ac1-7a49-4131-a05c-afa89602150d	13
50	353dee8a-3562-47f0-8f22-591aa7a55cd9	13
51	60b77772-51c0-43c1-ad50-d2d4733047af	2
52	220cfb5c-c08f-4d27-864f-e4964dd58209	4
53	3b546106-29dc-4493-a119-d7d585a47706	4
57	d5c00ffe-2ba4-421d-b984-239b1da9a70d	14
58	81759e2f-266e-4339-a769-21f16531d6a6	14
59	3527851f-6260-489d-aa6e-34fd02d1eab9	4
60	6091910d-33be-451e-9a73-46e523f28c63	15
61	ddea3c4f-b07a-499e-8854-806283608548	15
62	5ae0ae41-9e3f-40aa-87ba-39ac1a94eb4d	15
63	db97470b-0012-4ef6-8bb5-829bfbda8e1e	15
64	7c4d5c6b-af99-4379-802c-e841b07ac019	15
65	217e4015-792c-4d96-9bba-d8ff279abc35	15
66	4cf1b8b9-a9e9-4257-acb9-f021acc05b67	4
67	a3124db2-9cc1-47c3-a654-bc00c5619f3b	8
68	10ade344-0c51-4ff7-acaf-9a375ae182d5	4
69	59b8a868-08eb-4d4d-a71e-a1077e50fc50	9
70	f5e9939e-91d1-42a2-ad88-1ede57f2b053	4
71	0d6c3c35-02ec-4cb1-9251-83c88f6245f8	4
72	26dcc1b9-fcfa-4b59-addc-519cb860c507	9
73	8305502d-6824-43bc-bb3a-c22f06bb4c92	9
74	1c424dcc-75d7-4c26-a1c0-cbc0d8c46fdf	4
75	487a9978-27d5-4bc1-8ad1-d515a9a84708	16
76	7bdfe976-9b17-4f51-a0a2-b0954ae1bd12	4
77	e43beb99-6e20-4f8b-93a7-32c15ef45ea7	4
78	e7b3ed13-acb3-4e0c-bd29-bf5d2224ebcf	4
79	fa8aa674-93a0-4400-9f04-f58908ca2213	13
80	d93d009a-56e5-48bd-b0d5-b4fc072c162a	15
81	52863f7b-5dac-4236-9aa1-b971857ee988	9
82	52863f7b-5dac-4236-9aa1-b971857ee988	17
83	bcfdf829-45ea-44b4-aa63-e8f48ae02c65	12
84	14443dd4-a8a7-4e06-ae7d-dd5e01835c4d	5
98	55220308-ba7e-45a6-b9d7-b3d94e7f0f5f	23
99	ef7229b0-6639-4b31-8245-f630fcbb0364	18
100	ef7229b0-6639-4b31-8245-f630fcbb0364	23
101	55220308-ba7e-45a6-b9d7-b3d94e7f0f5f	18
\.


--
-- Data for Name: core_type; Type: TABLE DATA; Schema: public; Owner: tidy
--

COPY public.core_type (id, name, plane_id) FROM stdin;
1	Audio Cable	1
2	PSU Cable	2
3	Hardware	2
4	Speaker	1
5	Video Cable	2
6	USB Cable	2
7	Box	2
8	UTP Cable	2
9	Bag	1
10	Adapter	2
11	Headphones	1
12	Midi Cable	1
13	Charger	3
14	Bag	3
15	Tripod	3
16	Tool	4
17	Lamp	6
18	Batteries	2
19	Powerball	2
20	Keys	6
21	Memorabillia	6
22	Gloves	6
23	Electric Socket	2
24	Extension	2
25	Lock	4
26	Box	1
27	Data cable	2
28	Magazines	7
29	Tubes	1
30	Accessory	6
31	Power Cable	6
\.


--
-- Data for Name: core_type_default_tags; Type: TABLE DATA; Schema: public; Owner: tidy
--

COPY public.core_type_default_tags (id, type_id, tagtype_id) FROM stdin;
1	1	1
2	2	1
3	5	1
4	6	1
5	8	1
6	12	1
7	24	1
8	31	1
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: tidy
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2018-08-01 18:18:42.903502+00	1	Audio	1	[{"added": {}}]	4	1
2	2018-08-01 18:19:55.521845+00	1	Length	1	[{"added": {}}]	8	1
3	2018-08-01 18:20:07.319638+00	1	Audio Cable	1	[{"added": {}}]	10	1
4	2018-08-01 18:20:33.910971+00	1	XLR to XLR	1	[{"added": {}}]	6	1
5	2018-08-01 18:21:31.128344+00	1	XLR to XLR	2	[]	6	1
6	2018-08-01 18:21:52.330732+00	1	Length:20 m	1	[{"added": {}}]	7	1
7	2018-08-01 18:21:57.975749+00	cbcd1949-230f-4988-b3d0-9603c33cf2ed	20m Accu Cable	1	[{"added": {}}]	9	1
8	2018-08-01 18:41:12.718013+00	2	Length:6 m	1	[{"added": {}}]	7	1
9	2018-08-01 18:41:19.614126+00	62569cb3-1943-41bb-a788-cd3f9ed5aa08	6m Proel cable	1	[{"added": {}}]	9	1
10	2018-08-01 18:55:15.022046+00	753ee03b-e393-4637-b36d-8babb5fdb0e5	20m Accu Cable	1	[{"added": {}}]	9	1
11	2018-08-01 19:02:04.495267+00	3	Length:8 m	1	[{"added": {}}]	7	1
12	2018-08-01 19:02:07.326339+00	22ad324e-6030-450a-9f25-29458800d6db	Belden 8m XLR Cable	1	[{"added": {}}]	9	1
13	2018-08-01 19:05:51.545807+00	2	Computing & Gadgets	1	[{"added": {}}]	4	1
14	2018-08-01 19:06:17.610677+00	2	PSU Cable	1	[{"added": {}}]	10	1
15	2018-08-01 19:06:50.697527+00	2	PSU to Socket	1	[{"added": {}}]	6	1
16	2018-08-01 19:07:43.693703+00	4	Length:2 m	1	[{"added": {}}]	7	1
17	2018-08-01 19:09:18.283117+00	d5c00ffe-2ba4-421d-b984-239b1da9a70d	PC PSU Cable	1	[{"added": {}}]	9	1
18	2018-08-01 19:19:41.994667+00	5	Length:10 m	1	[{"added": {}}]	7	1
19	2018-08-01 19:19:44.223347+00	6a92511e-e505-4f1c-a37a-6409e7d84038	10 m Proel Cable	1	[{"added": {}}]	9	1
20	2018-08-01 21:11:29.416785+00	3	Hardware	1	[{"added": {}}]	10	1
21	2018-08-01 21:12:05.313762+00	3	Ethernet Hub	1	[{"added": {}}]	6	1
22	2018-08-01 21:13:07.06253+00	1	Owner object (1)	1	[{"added": {}}]	3	1
23	2018-08-01 21:13:10.915976+00	1	House object (1)	1	[{"added": {}}]	1	1
24	2018-08-01 21:13:31.315826+00	1	Magma bag	1	[{"added": {}}]	2	1
25	2018-08-01 21:21:27.972519+00	7bf4399e-9804-4ea8-b2d3-8f8af368d04e	Netgear 8-port Ethernet Hub (100 Mbps)	1	[{"added": {}}]	9	1
26	2018-08-01 21:23:57.602177+00	4	Speaker	1	[{"added": {}}]	10	1
27	2018-08-01 21:25:10.796551+00	4	Portable Speaker	1	[{"added": {}}]	6	1
28	2018-08-01 21:25:21.430467+00	df9166e1-24ed-49d7-89e7-83803fa14ceb	JBL Clip 2	1	[{"added": {}}]	9	1
29	2018-08-01 21:26:02.965881+00	df9166e1-24ed-49d7-89e7-83803fa14ceb	JBL Clip 2	2	[]	9	1
30	2018-08-01 21:31:57.393325+00	b11e600b-7931-4d9f-be24-7880c932861e	10 m Proel Cable	1	[{"added": {}}]	9	1
31	2018-08-01 21:34:12.153901+00	5	XLR to TRS	1	[{"added": {}}]	6	1
32	2018-08-01 21:38:22.456118+00	6ed30e4c-ea20-437c-a8e6-8c46e90cf264	Proel XLR to TRS (2m)	1	[{"added": {}}]	9	1
33	2018-08-01 21:42:09.516634+00	6	TS to TS	1	[{"added": {}}]	6	1
34	2018-08-01 21:42:16.590893+00	9739fb02-715e-4fd3-ade9-73f134be58d7	2m Proel Cable	1	[{"added": {}}]	9	1
35	2018-08-01 21:43:24.681497+00	9739fb02-715e-4fd3-ade9-73f134be58d7	2m Proel Cable	2	[]	9	1
36	2018-08-01 21:43:32.006289+00	9739fb02-715e-4fd3-ade9-73f134be58d7	2m Proel Cable	2	[{"changed": {"fields": ["tags"]}}]	9	1
37	2018-08-01 21:43:39.358517+00	9739fb02-715e-4fd3-ade9-73f134be58d7	2m Proel Cable	2	[{"changed": {"fields": ["tags"]}}]	9	1
38	2018-08-01 21:48:05.325102+00	e410753b-e798-46c5-a11b-28cdc1e27977	OEM TS Neutrik (2m)	1	[{"added": {}}]	9	1
39	2018-08-01 22:33:20.263962+00	5	Video Cable	1	[{"added": {}}]	10	1
40	2018-08-01 22:33:38.373155+00	7	DVI to DVI	1	[{"added": {}}]	6	1
41	2018-08-01 22:33:56.53693+00	acc56f6f-47ce-45d5-9b1f-fc6d17a847b0	DVI Cable	1	[{"added": {}}]	9	1
42	2018-08-01 22:36:28.700597+00	6	USB Cable	1	[{"added": {}}]	10	1
43	2018-08-01 22:37:04.125912+00	8	USB to Lightning	1	[{"added": {}}]	6	1
44	2018-08-01 22:37:18.826032+00	6	Length:0.5 m	1	[{"added": {}}]	7	1
45	2018-08-01 22:38:12.36547+00	2	Grey Drawer	1	[{"added": {}}]	2	1
46	2018-08-01 22:38:34.742798+00	1	5th drawer	1	[{"added": {}}]	5	1
47	2018-08-01 22:39:07.565411+00	be4ef97d-4772-4523-8f07-1a84e24f9148	Sentio iphone cable	1	[{"added": {}}]	9	1
48	2018-08-01 22:50:33.09113+00	7	Box	1	[{"added": {}}]	10	1
49	2018-08-01 22:51:56.788213+00	cc2c4878-d62a-4815-8e0f-dd19670dcfdf	Samsung SSD 840 PRO box	1	[{"added": {}}]	9	1
50	2018-08-01 22:54:13.665179+00	cc2c4878-d62a-4815-8e0f-dd19670dcfdf	Samsung SSD 840 PRO box	2	[{"changed": {"fields": ["subType"]}}]	9	1
51	2018-08-01 22:57:26.928416+00	8	UTP Cable	1	[{"added": {}}]	10	1
52	2018-08-01 22:57:55.075305+00	b08b1d6b-a58b-4f1d-a563-03043be48f60	UTP Cable (6m)	1	[{"added": {}}]	9	1
53	2018-08-01 23:01:28.123141+00	7	Length:5 m	1	[{"added": {}}]	7	1
54	2018-08-01 23:01:43.532927+00	ff0dc50e-ee57-48a5-9b5e-081f6f74030c	UTP Cable (5m)	1	[{"added": {}}]	9	1
55	2018-08-01 23:01:55.068687+00	b08b1d6b-a58b-4f1d-a563-03043be48f60	UTP Cable (5m)	2	[{"changed": {"fields": ["name", "tags"]}}]	9	1
56	2018-08-02 00:47:56.26876+00	9	Type A to Type B	1	[{"added": {}}]	6	1
57	2018-08-02 00:48:11.012367+00	dc0229a2-3e27-443a-a82d-ddc2a23cd1d4	USB type B cable	1	[{"added": {}}]	9	1
58	2018-08-02 00:48:46.380143+00	8	Type A to Lightning	2	[{"changed": {"fields": ["name"]}}]	6	1
59	2018-08-02 00:51:26.317366+00	8	Length:1 m	1	[{"added": {}}]	7	1
60	2018-08-02 00:51:30.243146+00	347a0080-a0b0-4dd4-b0ab-36fbb5440522	USB type B cable	1	[{"added": {}}]	9	1
61	2018-08-02 17:29:15.677034+00	57d0fc9b-fbea-441a-bc9d-bf4a33ab0a52	Proel XLR Cable (5m)	1	[{"added": {}}]	9	1
62	2018-08-02 19:58:48.887787+00	f7fa764f-99e1-48f5-9d26-964e7c983220	Fender TS Cable	1	[{"added": {}}]	9	1
63	2018-08-02 21:50:38.511176+00	e8a63e00-3bde-42ec-b3ac-3f5e03d195c0	USB type B cable	1	[{"added": {}}]	9	1
64	2018-08-02 22:04:58.350658+00	e9e808a2-4f81-4d94-beda-07be2e5149d6	USB type B cable (2m yellow)	1	[{"added": {}}]	9	1
65	2018-08-02 23:03:58.756607+00	10	Midi	1	[{"added": {}}]	6	1
66	2018-08-02 23:04:07.648602+00	60b77772-51c0-43c1-ad50-d2d4733047af	Midi Cable (5m)	1	[{"added": {}}]	9	1
67	2018-08-03 00:20:18.835055+00	6a92511e-e505-4f1c-a37a-6409e7d84038	Proel XLR Cable (10m)	2	[{"changed": {"fields": ["name"]}}]	9	1
68	2018-08-03 10:41:57.859916+00	cbcd1949-230f-4988-b3d0-9603c33cf2ed	Accu XLR Cable (20m)	2	[{"changed": {"fields": ["name"]}}]	9	1
69	2018-08-03 10:42:03.078067+00	753ee03b-e393-4637-b36d-8babb5fdb0e5	Accu XLR Cable (20m)	2	[{"changed": {"fields": ["name"]}}]	9	1
70	2018-08-03 14:25:08.875665+00	9	Pouch	1	[{"added": {}}]	10	1
71	2018-08-03 14:26:25.759696+00	11	EMU USB Midi Pouch	1	[{"added": {}}]	6	1
72	2018-08-03 14:26:37.535235+00	9	Bag	2	[{"changed": {"fields": ["name"]}}]	10	1
73	2018-08-03 14:26:50.01696+00	11	Pouch	2	[{"changed": {"fields": ["name"]}}]	6	1
74	2018-08-03 14:26:58.566389+00	376a247f-a970-491c-ab1f-68bc2f2c4f57	EMU USB Midi Pouch	1	[{"added": {}}]	9	1
75	2018-08-03 14:27:12.134064+00	376a247f-a970-491c-ab1f-68bc2f2c4f57	EMU USB Midi Pouch	2	[{"changed": {"fields": ["location"]}}]	9	1
76	2018-08-03 14:27:22.66412+00	e9e808a2-4f81-4d94-beda-07be2e5149d6	USB type B cable (2m yellow)	2	[{"changed": {"fields": ["location"]}}]	9	1
77	2018-08-03 23:37:45.811021+00	e8a63e00-3bde-42ec-b3ac-3f5e03d195c0	USB type B cable	2	[{"changed": {"fields": ["location"]}}]	9	1
78	2018-08-03 23:37:53.444276+00	347a0080-a0b0-4dd4-b0ab-36fbb5440522	USB type B cable	2	[{"changed": {"fields": ["location"]}}]	9	1
79	2018-08-03 23:41:09.474228+00	12	VGA to VGA	1	[{"added": {}}]	6	1
80	2018-08-03 23:41:15.671266+00	28498857-23f3-492d-a283-76b1b5a8fd61	VGA Cable (0.5m)	1	[{"added": {}}]	9	1
81	2018-08-04 02:00:30.837967+00	10	Adapter	1	[{"added": {}}]	10	1
82	2018-08-04 02:01:03.37869+00	2c6c49fa-242f-409d-85e7-cf266fb3685b	VGA to MiniDisplay	1	[{"added": {}}]	9	1
83	2018-08-04 02:57:07.886079+00	3	Eastpak blue bag	1	[{"added": {}}]	2	1
84	2018-08-04 02:57:31.466436+00	2c6c49fa-242f-409d-85e7-cf266fb3685b	VGA to MiniDisplay	2	[{"changed": {"fields": ["location"]}}]	9	1
85	2018-08-04 18:18:45.495842+00	13	Minijack TRS to Minijack TRS	1	[{"added": {}}]	6	1
86	2018-08-04 18:19:04.687675+00	587836e2-7655-4240-969c-907eccacf2b4	Sennheiser Minijack TRS cable	1	[{"added": {}}]	9	1
87	2018-08-04 18:20:55.587879+00	587836e2-7655-4240-969c-907eccacf2b4	Sennheiser Minijack TRS cable	2	[{"changed": {"fields": ["location"]}}]	9	1
88	2018-08-04 18:26:45.464481+00	9	Length:1.5 m	1	[{"added": {}}]	7	1
89	2018-08-04 18:26:49.09553+00	43b3a7af-4cff-4a83-a592-26681d44ac93	Prof low noise inst cable (2m TS)	1	[{"added": {}}]	9	1
90	2018-08-04 18:53:54.619829+00	21061901-5a60-4d85-9852-72197bb3a894	Kanex Lighning Cable	1	[{"added": {}}]	9	1
91	2018-08-04 18:57:02.61431+00	11	Headphones	1	[{"added": {}}]	10	1
92	2018-08-04 18:57:19.204883+00	14	Apple Headphones	1	[{"added": {}}]	6	1
93	2018-08-04 18:57:56.473142+00	2	4th drawer	1	[{"added": {}}]	5	1
94	2018-08-04 18:58:06.381496+00	3f8422a8-e502-4023-922b-a8c3a2084cc5	Apple Headphones (old)	1	[{"added": {}}]	9	1
95	2018-08-04 19:48:37.342514+00	12	Midi Cable	1	[{"added": {}}]	10	1
96	2018-08-04 19:49:12.308653+00	03ba330a-aeac-44ea-b1d1-8eb737d68bf0	Proel Midi Cable (4m)	1	[{"added": {}}]	9	1
97	2018-08-04 21:42:34.416106+00	60b77772-51c0-43c1-ad50-d2d4733047af	Midi Cable (5m)	2	[{"changed": {"fields": ["type", "subType"]}}]	9	1
98	2018-08-04 21:42:52.909108+00	10	Midi	3		6	1
99	2018-08-04 22:13:13.842631+00	20317107-1c6e-41df-8887-a23ba85c1615	Ethernet Cable (5m)	1	[{"added": {}}]	9	1
100	2018-08-04 22:14:32.871178+00	20317107-1c6e-41df-8887-a23ba85c1615	Ethernet Cable (0.5m)	2	[{"changed": {"fields": ["name"]}}]	9	1
101	2018-08-04 22:14:52.913933+00	20317107-1c6e-41df-8887-a23ba85c1615	UTP Cable (0.5m)	2	[{"changed": {"fields": ["name"]}}]	9	1
102	2018-08-04 22:34:40.99363+00	10	Length:4 m	1	[{"added": {}}]	7	1
103	2018-08-04 22:34:45.273162+00	017a4fd5-53c1-485a-bdb3-5c7b60d74ccf	sssnake midi cable	1	[{"added": {}}]	9	1
104	2018-08-05 13:13:59.789774+00	220cfb5c-c08f-4d27-864f-e4964dd58209	PSU Cable (1.5m)	1	[{"added": {}}]	9	1
105	2018-08-05 13:15:35.146467+00	642eb4bf-cb5c-4eae-bef9-1687472b8cf2	PSU Cable (1.5m)2	1	[{"added": {}}]	9	1
106	2018-08-07 16:43:36.210054+00	3b546106-29dc-4493-a119-d7d585a47706	PSU Cable (1.5m)	1	[{"added": {}}]	9	1
107	2018-08-07 16:55:31.717209+00	15	Game Controller	1	[{"added": {}}]	6	1
108	2018-08-07 16:55:51.972773+00	beb09972-c099-4194-abd4-86d96126a827	XBox 360 Controller	1	[{"added": {}}]	9	1
109	2018-08-07 16:56:34.128559+00	3	Photography and Video	1	[{"added": {}}]	4	1
110	2018-08-07 16:56:40.769688+00	13	Charger	1	[{"added": {}}]	10	1
111	2018-08-07 16:57:08.095169+00	c3276ad6-14ee-4b87-ae65-dfca5f3637fd	Nikon MH-24 Battery Charger	1	[{"added": {}}]	9	1
112	2018-08-07 16:58:14.44804+00	16	Wireless controller dock	1	[{"added": {}}]	6	1
113	2018-08-07 16:58:26.348329+00	85ab1d1b-3ef2-4003-9244-1e2ba3341eb0	Microsoft XBox 360 Wifi dock	1	[{"added": {}}]	9	1
114	2018-08-07 17:00:03.008366+00	14	Bag	1	[{"added": {}}]	10	1
115	2018-08-07 17:00:11.399661+00	f0ea34fc-649c-4604-aa3b-58d8c53fe82c	Case Logic photo backpack	1	[{"added": {}}]	9	1
116	2018-08-07 17:01:02.208239+00	15	Tripod	1	[{"added": {}}]	10	1
117	2018-08-07 17:01:21.991482+00	17	Portable tripod	1	[{"added": {}}]	6	1
118	2018-08-07 17:15:58.122113+00	4	Case Logic photo backpack	1	[{"added": {}}]	2	1
119	2018-08-07 17:16:43.932671+00	c4402dc7-0f92-4dba-9415-b5fc3ed45665	Joby flexible tripod	1	[{"added": {}}]	9	1
120	2018-08-07 23:05:39.088234+00	18	Micro USB 5-pin	1	[{"added": {}}]	6	1
121	2018-08-07 23:05:53.830124+00	032a4577-aeb3-47f2-a8a0-776f5687838d	Micro Usb	1	[{"added": {}}]	9	1
122	2018-08-07 23:11:11.780488+00	032a4577-aeb3-47f2-a8a0-776f5687838d	Micro Usb (5-pin 0.5m)	2	[{"changed": {"fields": ["name"]}}]	9	1
123	2018-08-07 23:14:48.888434+00	19	USB Mini	1	[{"added": {}}]	6	1
124	2018-08-07 23:14:54.747827+00	0cf8e945-d00f-4220-ae6f-ba7965a2e857	USB mini cable (0.5m)	1	[{"added": {}}]	9	1
125	2018-08-07 23:18:55.870057+00	11	Length:0.25 m	1	[{"added": {}}]	7	1
126	2018-08-07 23:19:08.005099+00	830208f6-0912-4f81-bdf9-312ac2edf178	Micro Usb (5-pin 0.25m)	1	[{"added": {}}]	9	1
127	2018-08-07 23:24:57.226825+00	23b00d9b-751d-4af8-8cd4-9cdc9aad1ff9	USB Mini cable (1m)	1	[{"added": {}}]	9	1
128	2018-08-08 09:19:50.737999+00	4	Case Logic photo backpack	2	[{"changed": {"fields": ["thing"]}}]	2	1
129	2018-08-08 16:54:05.174803+00	be4ef97d-4772-4523-8f07-1a84e24f9148	Sentio iphone cable	2	[{"changed": {"fields": ["sublocation"]}}]	9	1
130	2018-08-08 18:55:01.737911+00	20	USB type A extension	1	[{"added": {}}]	6	1
131	2018-08-08 18:55:04.150591+00	38774dc5-6ea2-4c8e-a3a4-614949b82778	USB extension cable	1	[{"added": {}}]	9	1
132	2018-09-03 17:28:27.082362+00	12	Length:5 m	1	[{"added": {}}]	7	1
133	2019-02-11 00:44:18.031494+00	tidy	Sequence(name='tidy', last=0)	2	[{"changed": {"fields": ["last"]}}]	17	1
134	2019-02-23 19:30:55.583691+00	13	Length:3 m	1	[{"added": {}}]	7	1
135	2019-02-23 19:31:04.008395+00	9739fb02-715e-4fd3-ade9-73f134be58d7	3m Proel Cable (2000000000192)	2	[{"changed": {"fields": ["name", "tags"]}}]	9	1
136	2019-02-23 19:40:13.709886+00	6ed30e4c-ea20-437c-a8e6-8c46e90cf264	Proel XLR to TRS (3m) (2000000000246)	2	[{"changed": {"fields": ["name", "tags"]}}]	9	1
137	2019-02-24 16:42:50.802416+00	b11e600b-7931-4d9f-be24-7880c932861e	Proel XLR Cable (10m) (2000000000161)	2	[{"changed": {"fields": ["name"]}}]	9	1
138	2019-02-24 17:04:06.057149+00	f7fa764f-99e1-48f5-9d26-964e7c983220	Fender TS Cable (2000000000024)	2	[{"changed": {"fields": ["tags"]}}]	9	1
139	2019-02-24 17:17:21.476792+00	62569cb3-1943-41bb-a788-cd3f9ed5aa08	Proel XLR Cable (5m) (2000000000277)	2	[{"changed": {"fields": ["name", "tags"]}}]	9	1
140	2019-02-24 18:06:00.200131+00	tidy	Sequence(name='tidy', last=1)	2	[{"changed": {"fields": ["last"]}}]	17	1
141	2019-02-24 18:14:34.349727+00	400c33fd-de26-4bd0-a9e1-0eeac0c528a3	Granite TS Cable (10m)	1	[{"added": {}}]	9	1
142	2019-02-24 18:15:33.693884+00	400c33fd-de26-4bd0-a9e1-0eeac0c528a3	Granite TS Cable (10m)	3		9	1
143	2019-02-24 18:15:48.490362+00	tidy	Sequence(name='tidy', last=0)	2	[{"changed": {"fields": ["last"]}}]	17	1
144	2019-02-24 18:16:56.023588+00	78eaa927-3cc1-48ae-86a7-31c852c7ff97	Granite TS Cable (10m)	1	[{"added": {}}]	9	1
145	2019-02-24 22:48:25.81681+00	9739fb02-715e-4fd3-ade9-73f134be58d7	Proel TS Cable (3m)	2	[{"changed": {"fields": ["name"]}}]	9	1
146	2019-02-25 20:52:53.063672+00	16c86e78-72cf-4cdd-9945-d8379173b42b	Klotz TS Cable (10m)	1	[{"added": {}}]	9	1
147	2019-02-25 21:00:28.896739+00	c6b7f042-080c-4903-95bc-f8b4276d1393	Proel XLR Cable (5m)	1	[{"added": {}}]	9	1
148	2019-02-25 22:34:00.309127+00	1bf6ef46-55a6-41ac-aba9-a2dec2adddec	Proel XLR Cable (3m)	1	[{"added": {}}]	9	1
149	2019-02-25 22:34:11.580366+00	6c934ac1-7a49-4131-a05c-afa89602150d	Proel XLR Cable (3m)	1	[{"added": {}}]	9	1
150	2019-02-25 22:34:22.963628+00	353dee8a-3562-47f0-8f22-591aa7a55cd9	Proel XLR Cable (3m)	1	[{"added": {}}]	9	1
151	2019-03-01 21:12:07.176251+00	e9e808a2-4f81-4d94-beda-07be2e5149d6	USB type B cable (2m yellow)	2	[{"changed": {"fields": ["type"]}}]	9	1
152	2019-03-03 17:41:08.927173+00	60b77772-51c0-43c1-ad50-d2d4733047af	Midi Cable (6m)	2	[{"changed": {"fields": ["name", "tags"]}}]	9	1
153	2019-03-03 17:56:34.60137+00	220cfb5c-c08f-4d27-864f-e4964dd58209	PSU Cable (2m)	2	[{"changed": {"fields": ["name", "tags"]}}]	9	1
154	2019-03-03 17:56:45.278323+00	3b546106-29dc-4493-a119-d7d585a47706	PSU Cable (2m)	2	[{"changed": {"fields": ["name", "tags"]}}]	9	1
155	2019-03-03 17:57:17.629448+00	14	Length:2.5 m	1	[{"added": {}}]	7	1
156	2019-03-03 17:57:29.90805+00	642eb4bf-cb5c-4eae-bef9-1687472b8cf2	PSU Cable (2.5m)	2	[{"changed": {"fields": ["name", "tags"]}}]	9	1
157	2019-03-03 17:57:41.881063+00	d5c00ffe-2ba4-421d-b984-239b1da9a70d	PSU Cable (2.5m)	2	[{"changed": {"fields": ["name", "tags"]}}]	9	1
158	2019-03-03 18:01:13.778481+00	d5c00ffe-2ba4-421d-b984-239b1da9a70d	PSU Cable (2.5m)	2	[{"changed": {"fields": ["tags"]}}]	9	1
159	2019-03-03 18:28:03.136076+00	d5c00ffe-2ba4-421d-b984-239b1da9a70d	PSU Cable (2.5m)	2	[{"changed": {"fields": ["tags"]}}]	9	1
160	2019-03-03 18:43:59.773882+00	220cfb5c-c08f-4d27-864f-e4964dd58209	PSU Cable (2m)	2	[{"changed": {"fields": ["barcode"]}}]	9	1
161	2019-03-03 18:44:58.071162+00	3b546106-29dc-4493-a119-d7d585a47706	PSU Cable (2m)	2	[{"changed": {"fields": ["barcode"]}}]	9	1
162	2019-03-03 18:45:37.711838+00	642eb4bf-cb5c-4eae-bef9-1687472b8cf2	PSU Cable (2.5m)	3		9	1
163	2019-03-03 18:45:37.714998+00	642eb4bf-cb5c-4eae-bef9-1687472b8cf2	PSU Cable (2.5m)	3		9	1
164	2019-03-03 18:46:12.401724+00	d5c00ffe-2ba4-421d-b984-239b1da9a70d	PSU Cable (2.5m)	2	[{"changed": {"fields": ["barcode"]}}]	9	1
165	2019-03-03 18:57:23.189206+00	81759e2f-266e-4339-a769-21f16531d6a6	PSU Cable (2.5m)	1	[{"added": {}}]	9	1
166	2019-03-03 18:57:34.998957+00	3b546106-29dc-4493-a119-d7d585a47706	PSU Cable (2m)	2	[{"changed": {"fields": ["subType"]}}]	9	1
167	2019-03-03 18:57:42.340059+00	220cfb5c-c08f-4d27-864f-e4964dd58209	PSU Cable (2m)	2	[{"changed": {"fields": ["subType"]}}]	9	1
168	2019-03-03 19:03:40.404924+00	3b546106-29dc-4493-a119-d7d585a47706	Double PSU Cable (2m)	2	[{"changed": {"fields": ["name"]}}]	9	1
169	2019-03-03 19:33:56.335462+00	cbcd1949-230f-4988-b3d0-9603c33cf2ed	Accu XLR Cable (20m)	2	[{"changed": {"fields": ["barcode"]}}]	9	1
170	2019-03-03 19:34:31.885024+00	753ee03b-e393-4637-b36d-8babb5fdb0e5	Accu XLR Cable (20m)	2	[{"changed": {"fields": ["barcode"]}}]	9	1
171	2019-03-03 19:36:21.541678+00	b11e600b-7931-4d9f-be24-7880c932861e	Proel XLR Cable (10m)	2	[{"changed": {"fields": ["barcode"]}}]	9	1
172	2019-03-03 19:36:43.821322+00	6a92511e-e505-4f1c-a37a-6409e7d84038	Proel XLR Cable (10m)	2	[{"changed": {"fields": ["barcode"]}}]	9	1
173	2019-03-03 19:46:28.550099+00	22ad324e-6030-450a-9f25-29458800d6db	Belden 8m XLR Cable	2	[{"changed": {"fields": ["barcode"]}}]	9	1
174	2019-03-03 21:11:04.422591+00	57d0fc9b-fbea-441a-bc9d-bf4a33ab0a52	Proel XLR Cable (5m)	2	[{"changed": {"fields": ["barcode"]}}]	9	1
175	2019-03-03 21:11:40.472671+00	c6b7f042-080c-4903-95bc-f8b4276d1393	Proel XLR Cable (5m)	2	[{"changed": {"fields": ["barcode"]}}]	9	1
176	2019-03-03 21:12:22.086358+00	62569cb3-1943-41bb-a788-cd3f9ed5aa08	Proel XLR Cable (5m)	2	[{"changed": {"fields": ["barcode"]}}]	9	1
177	2019-03-03 21:14:18.23054+00	1bf6ef46-55a6-41ac-aba9-a2dec2adddec	Proel XLR Cable (3m)	2	[{"changed": {"fields": ["barcode"]}}]	9	1
178	2019-03-03 21:14:42.036736+00	6c934ac1-7a49-4131-a05c-afa89602150d	Proel XLR Cable (3m)	2	[{"changed": {"fields": ["barcode"]}}]	9	1
179	2019-03-03 21:15:33.431425+00	353dee8a-3562-47f0-8f22-591aa7a55cd9	Proel XLR Cable (3m)	2	[{"changed": {"fields": ["barcode"]}}]	9	1
180	2019-03-03 21:18:50.949009+00	f7fa764f-99e1-48f5-9d26-964e7c983220	Fender TS Cable	2	[{"changed": {"fields": ["barcode"]}}]	9	1
181	2019-03-03 21:27:40.638674+00	6ed30e4c-ea20-437c-a8e6-8c46e90cf264	Proel XLR to TRS (3m)	2	[{"changed": {"fields": ["barcode"]}}]	9	1
182	2019-03-03 21:28:08.654934+00	9739fb02-715e-4fd3-ade9-73f134be58d7	Proel TS Cable (3m)	2	[{"changed": {"fields": ["barcode"]}}]	9	1
183	2019-03-03 21:30:57.63979+00	78eaa927-3cc1-48ae-86a7-31c852c7ff97	Granite TS Cable (10m)	2	[{"changed": {"fields": ["barcode"]}}]	9	1
184	2019-03-03 21:32:03.663945+00	16c86e78-72cf-4cdd-9945-d8379173b42b	Klotz TS Cable (10m)	2	[{"changed": {"fields": ["barcode"]}}]	9	1
185	2019-03-05 19:02:58.107744+00	4	House Work	1	[{"added": {}}]	4	1
186	2019-03-05 19:03:00.589461+00	16	Tool	1	[{"added": {}}]	10	1
187	2019-03-05 19:03:18.54047+00	21	Flashlight	1	[{"added": {}}]	6	1
188	2019-03-05 19:03:56.350445+00	05944d2a-0ce3-441b-8b82-f6ffcf07e1d1	Northpole headlight lead	1	[{"added": {}}]	9	1
189	2019-03-29 00:48:34.127448+00	5	Big closet	1	[{"added": {}}]	2	1
190	2019-03-29 00:49:14.952066+00	3	1st drawer	1	[{"added": {}}]	5	1
191	2019-04-17 13:22:16.179036+00	5	TEST	1	[{"added": {}}]	4	1
192	2019-05-18 11:35:25.078012+00	4	Tools	2	[{"changed": {"fields": ["name"]}}]	4	1
193	2019-05-18 11:35:36.777576+00	6	Hme	1	[{"added": {}}]	4	1
194	2019-05-18 11:36:28.101479+00	17	Lamp	1	[{"added": {}}]	10	1
195	2019-05-18 11:36:41.734593+00	265b0f35-696d-4751-b8b3-ec260066ed0c	Philips Warm 60w light	1	[{"added": {}}]	9	1
196	2019-05-18 11:38:48.226106+00	18	Batteries	1	[{"added": {}}]	10	1
197	2019-05-18 11:39:23.760146+00	1e5844be-78ab-4457-bbc6-d5ccd4351820	Ikea 10x AA batteries	1	[{"added": {}}]	9	1
198	2019-05-18 11:40:36.405352+00	4	2nd drawer	1	[{"added": {}}]	5	1
199	2019-05-18 12:13:35.070285+00	19	Powerball	1	[{"added": {}}]	10	1
200	2019-05-18 12:13:43.724075+00	29993f77-1d6f-48b3-93ab-2c478ddcdb8a	Powerball	1	[{"added": {}}]	9	1
201	2019-05-18 12:23:04.546853+00	8ad8223a-14e8-4138-8e6d-fba088bea52e	X-mini II	1	[{"added": {}}]	9	1
202	2019-05-18 12:24:37.90344+00	20	Keys	1	[{"added": {}}]	10	1
203	2019-05-18 12:24:54.687953+00	7c5446c5-8e40-4277-8573-fde5bd81a191	Old Keys	1	[{"added": {}}]	9	1
204	2019-05-18 12:25:16.280121+00	21	Memorabillia	1	[{"added": {}}]	10	1
205	2019-05-18 12:25:20.298313+00	fb00a1c2-e45a-432a-8be4-6bf722d85226	Memorabillia	1	[{"added": {}}]	9	1
206	2019-05-18 12:25:40.787955+00	5	3rd drawer	1	[{"added": {}}]	5	1
207	2019-05-18 12:48:48.093856+00	22	USB Wi-fi	1	[{"added": {}}]	6	1
208	2019-05-18 12:48:51.31741+00	428f72fe-7926-4cb1-adad-cff8cb377beb	TP-LINK TL-WN722N	1	[{"added": {}}]	9	1
209	2019-05-18 12:58:46.962625+00	22	Gloves	1	[{"added": {}}]	10	1
210	2019-05-18 12:58:57.900769+00	23	Workout Gloves	1	[{"added": {}}]	6	1
211	2019-05-18 12:59:10.520798+00	311440f6-e267-4422-9636-8df7f7b8dc06	Gym Gloves	1	[{"added": {}}]	9	1
212	2019-05-18 13:03:47.512871+00	23	Electric Socket	1	[{"added": {}}]	10	1
213	2019-05-18 13:04:03.337313+00	24	3 way (no ground)	1	[{"added": {}}]	6	1
214	2019-05-18 13:04:09.550169+00	3232384c-3616-4850-86cc-5c84d2c7165d	3 port electric socket (no ground)	1	[{"added": {}}]	9	1
215	2019-05-18 13:06:03.222557+00	24	Extension	1	[{"added": {}}]	10	1
216	2019-05-18 13:06:21.902139+00	25	Extension	1	[{"added": {}}]	6	1
217	2019-05-18 13:06:28.194938+00	3527851f-6260-489d-aa6e-34fd02d1eab9	3 meter electric socket extension (no ground)	1	[{"added": {}}]	9	1
218	2019-05-29 17:37:49.879099+00	26	Plastic Bag	1	[{"added": {}}]	6	1
219	2019-05-29 17:38:50.495098+00	e0030d6b-0bfd-4a89-811e-6694f0aef7de	Plastic Bags	1	[{"added": {}}]	9	1
220	2019-06-14 15:23:11.798743+00	25	Lock	1	[{"added": {}}]	10	1
221	2019-06-14 15:23:34.325771+00	51e2b769-9858-4c86-be65-f2bd3d6520a6	Locks	1	[{"added": {}}]	9	1
222	2019-08-30 22:52:00.990115+00	6	Outside	3		2	1
223	2019-08-30 22:52:41.590294+00	7	Outside	3		2	1
224	2019-08-30 23:19:07.947231+00	8	Outside	3		2	1
225	2019-08-30 23:19:52.310548+00	9	Outside	3		2	1
226	2019-09-01 00:03:57.227947+00	10	Outside	3		2	1
227	2019-09-01 00:05:03.335411+00	11	Outside	3		2	1
228	2019-09-01 00:23:09.7653+00	12	Outside	3		2	1
229	2019-09-01 00:27:30.413177+00	13	Outside	3		2	1
230	2019-09-01 00:28:57.858958+00	13	Outside	3		2	1
231	2019-09-01 01:43:16.654174+00	13	Outside	3		2	1
232	2019-09-01 01:43:31.473122+00	13	Outside	3		2	1
233	2019-09-01 01:44:44.433254+00	13	Outside	3		2	1
234	2019-10-27 20:35:31.031496+00	13	Outside	3		2	1
235	2019-10-27 20:47:44.036879+00	20	Outside	3		2	1
236	2019-10-27 20:54:08.532008+00	21	Outside	3		2	1
237	2019-10-27 20:55:55.08603+00	22	Outside	3		2	1
238	2019-10-27 20:56:18.235937+00	23	Outside	3		2	1
239	2019-10-27 20:56:56.987446+00	23	Outside	3		2	1
241	2019-10-27 20:57:27.884043+00	23	Outside	3		2	1
244	2019-10-27 21:00:59.155608+00	23	Outside	3		2	1
245	2019-10-27 21:06:52.384274+00	23	Outside	3		2	1
246	2019-10-27 21:08:41.389294+00	23	Outside	3		2	1
247	2019-10-27 21:31:33.68119+00	23	Outside	3		2	1
248	2021-05-04 15:51:37.919144+00	353dee8a-3562-47f0-8f22-591aa7a55cd9	Proel XLR Cable (3m)	2	[{"changed": {"fields": ["designated_location", "designated_sublocation"]}}]	9	1
249	2021-05-05 23:56:45.531368+00	ff0dc50e-ee57-48a5-9b5e-081f6f74030c	UTP Cable (5m)	2	[]	9	1
250	2021-05-14 19:27:22.053804+00	24	Drumset	1	[{"added": {}}]	2	1
251	2021-05-14 19:27:41.417562+00	6	Kick	1	[{"added": {}}]	5	1
252	2021-05-14 19:27:47.024946+00	7	Snare	1	[{"added": {}}]	5	1
253	2021-05-14 19:56:36.695127+00	26	Box	1	[{"added": {}}]	10	1
254	2021-05-14 19:57:09.17107+00	25	Attic	1	[{"added": {}}]	2	1
255	2021-05-14 19:57:30.230845+00	8	Boxes box	1	[{"added": {}}]	5	1
256	2021-05-14 19:58:32.28121+00	3ef7ac3a-7a59-48e7-a546-3fb4f817217d	Small Clone Box	1	[{"added": {}}]	9	1
257	2021-05-14 19:59:35.360959+00	022623d7-4527-4e0a-a407-8e704927b751	MXR Boost Box	1	[{"added": {}}]	9	1
258	2021-05-14 20:01:39.210898+00	47f066b3-e990-4010-9974-bc07d7500d3e	Memory Boy Deluxe box	1	[{"added": {}}]	9	1
259	2021-05-14 20:03:14.317867+00	9553b9e1-1f7d-42a3-bf4b-194f3a96ae0e	CryBaby wah box	1	[{"added": {}}]	9	1
260	2021-05-14 20:04:42.719048+00	82a48823-d0ea-4d45-af79-a1daf3364b05	BOSS TU-2 box	1	[{"added": {}}]	9	1
261	2021-05-14 20:07:34.797429+00	181fa799-a2a2-4d30-a7aa-49b28c32bc1b	Sennheiser RS 180 Box	1	[{"added": {}}]	9	1
262	2021-05-14 20:08:39.67932+00	978fdd14-05bc-4812-9afe-d8aafe86f89a	Nikkor 50mm f/1.4G Box	1	[{"added": {}}]	9	1
263	2021-05-14 20:12:23.024471+00	9	Plastic Bag	1	[{"added": {}}]	5	1
264	2021-05-14 20:12:39.901988+00	ac047b3c-264d-4857-95d3-a1c569a595c3	AKAI MPK 25 box	1	[{"added": {}}]	9	1
265	2021-05-14 23:11:03.966551+00	017a4fd5-53c1-485a-bdb3-5c7b60d74ccf	sssnake midi cable (4m)	2	[{"changed": {"fields": ["barcode", "name"]}}]	9	1
266	2021-05-14 23:11:31.531591+00	60b77772-51c0-43c1-ad50-d2d4733047af	Midi Cable (6m)	2	[{"changed": {"fields": ["barcode"]}}]	9	1
267	2021-05-14 23:14:08.051759+00	26	Doepfer d3m	1	[{"added": {}}]	2	1
268	2021-05-14 23:14:26.831818+00	03ba330a-aeac-44ea-b1d1-8eb737d68bf0	Proel Midi Cable (4m)	2	[{"changed": {"fields": ["barcode", "location", "designated_location", "designated_sublocation"]}}]	9	1
269	2021-05-14 23:31:25.979705+00	16c86e78-72cf-4cdd-9945-d8379173b42b	Klotz TS Cable (10m)	3		9	1
270	2021-05-14 23:32:18.905899+00	27	Outer Door Hanger	1	[{"added": {}}]	2	1
271	2021-05-14 23:33:25.308776+00	43b3a7af-4cff-4a83-a592-26681d44ac93	Prof low noise inst cable (2m TS)	2	[{"changed": {"fields": ["location", "designated_location", "designated_sublocation", "labeled"]}}]	9	1
272	2021-05-14 23:33:27.981518+00	e410753b-e798-46c5-a11b-28cdc1e27977	OEM TS Neutrik (2m)	2	[{"changed": {"fields": ["location", "sublocation", "designated_location", "designated_sublocation", "labeled"]}}]	9	1
273	2021-05-14 23:36:00.710315+00	6ed30e4c-ea20-437c-a8e6-8c46e90cf264	Proel XLR to TRS (3m)	3		9	1
274	2021-05-16 20:11:37.468761+00	27	Data cable	1	[{"added": {}}]	10	1
275	2021-05-16 20:12:59.086844+00	f4719fee-f102-4ef4-a262-c79c9896b211	Nintento DMG-04	1	[{"added": {}}]	9	1
276	2021-05-16 21:08:40.913934+00	7	Hobby	1	[{"added": {}}]	4	1
277	2021-05-16 21:08:43.133377+00	28	Magazines	1	[{"added": {}}]	10	1
278	2021-05-16 21:09:08.010164+00	10	Αλμανάκο Box	1	[{"added": {}}]	5	1
279	2021-05-16 21:09:40.740827+00	ba8ac1ce-fca8-4405-889a-1866113ebedb	Αλμανάκο, Ντόναλτ, Μίκυ Μυστήριο, Κλασικά, Το βιβλίο των εξερευνητών	1	[{"added": {}}]	9	1
280	2021-05-28 21:08:04.286838+00	404313bb-2792-4a7f-8352-89a703297848	Xiaomi Body comp box and receipt	1	[{"added": {}}]	9	1
281	2021-06-02 19:23:17.131085+00	1ed86a10-9574-4e47-a3fe-0071b6e6cbb7	Ysis Naterial extra screws and poles (Club 3d)	1	[{"added": {}}]	9	1
282	2021-06-03 18:59:31.626654+00	29	Tubes	1	[{"added": {}}]	10	1
283	2021-06-03 19:00:04.759055+00	27	Audio Amp Tubes	1	[{"added": {}}]	6	1
284	2021-06-03 19:00:43.538149+00	7dd264cb-604f-4242-bed3-14dd665b13b1	Custom Audio Amp Tubes	1	[{"added": {}}]	9	1
285	2021-06-04 15:20:50.523298+00	28	Kitchen Closet	1	[{"added": {}}]	2	1
286	2021-06-04 15:22:14.42923+00	11	1st Shelf	1	[{"added": {}}]	5	1
287	2021-06-04 15:25:11.283148+00	212b7ab2-aa2e-4dd0-b64f-e7152535c7ec	LED Magic Ball	1	[{"added": {}}]	9	1
288	2021-06-04 15:31:40.312238+00	6	Home	2	[{"changed": {"fields": ["name"]}}]	4	1
289	2021-06-04 15:31:45.003992+00	30	Accessory	1	[{"added": {}}]	10	1
290	2021-06-04 15:32:12.574799+00	5eef6a74-3a74-4883-85d3-3ed809c3c801	Ysis Naterial screen	1	[{"added": {}}]	9	1
291	2021-06-04 22:22:18.886649+00	29	Sofa left	1	[{"added": {}}]	2	1
292	2021-06-04 22:22:30.203203+00	30	Sofa right	1	[{"added": {}}]	2	1
293	2021-06-04 22:34:45.470189+00	15	Length:15 m	1	[{"added": {}}]	7	1
294	2021-06-04 22:35:03.066198+00	6091910d-33be-451e-9a73-46e523f28c63	Cordial XLR cable (15m)	1	[{"added": {}}]	9	1
295	2021-06-04 22:35:16.777723+00	ddea3c4f-b07a-499e-8854-806283608548	Cordial XLR cable (15m)	1	[{"added": {}}]	9	1
296	2021-06-04 22:35:27.831968+00	5ae0ae41-9e3f-40aa-87ba-39ac1a94eb4d	Cordial XLR cable (15m)	1	[{"added": {}}]	9	1
297	2021-06-04 22:38:06.660746+00	db97470b-0012-4ef6-8bb5-829bfbda8e1e	SC The stage cable (15m)	1	[{"added": {}}]	9	1
298	2021-06-04 22:38:22.515152+00	7c4d5c6b-af99-4379-802c-e841b07ac019	SC The stage cable (15m)	1	[{"added": {}}]	9	1
299	2021-06-04 22:39:26.434772+00	28	TS to angled TS	1	[{"added": {}}]	6	1
300	2021-06-04 22:39:33.749298+00	217e4015-792c-4d96-9bba-d8ff279abc35	SC The Spirit cable (15m)	1	[{"added": {}}]	9	1
301	2021-06-04 22:47:25.746668+00	29	HDMI	1	[{"added": {}}]	6	1
302	2021-06-04 22:48:03.881513+00	4cf1b8b9-a9e9-4257-acb9-f021acc05b67	HDMI Cable (2m)	1	[{"added": {}}]	9	1
303	2021-06-04 22:48:51.06465+00	a3124db2-9cc1-47c3-a654-bc00c5619f3b	HDMI Cable (1m)	1	[{"added": {}}]	9	1
304	2021-06-04 22:50:14.418304+00	10ade344-0c51-4ff7-acaf-9a375ae182d5	PSU Cable (2m)	1	[{"added": {}}]	9	1
305	2021-06-04 22:51:37.406118+00	59b8a868-08eb-4d4d-a71e-a1077e50fc50	PSU Cable (1.5m)	1	[{"added": {}}]	9	1
306	2021-06-04 22:52:52.804134+00	f5e9939e-91d1-42a2-ad88-1ede57f2b053	PSU Cable (grey - 2m)	1	[{"added": {}}]	9	1
307	2021-06-04 22:53:25.722833+00	0d6c3c35-02ec-4cb1-9251-83c88f6245f8	PSU Cable (2m)	1	[{"added": {}}]	9	1
308	2021-06-04 22:54:18.128597+00	26dcc1b9-fcfa-4b59-addc-519cb860c507	PSU Cable (1.5m)	1	[{"added": {}}]	9	1
309	2021-06-04 22:56:13.937174+00	8305502d-6824-43bc-bb3a-c22f06bb4c92	PSU Cable (1.5m)	1	[{"added": {}}]	9	1
310	2021-06-04 22:57:22.072458+00	30	Display Port to Display Port	1	[{"added": {}}]	6	1
311	2021-06-04 22:57:38.751214+00	1c424dcc-75d7-4c26-a1c0-cbc0d8c46fdf	DIsplay port cable (2m)	1	[{"added": {}}]	9	1
312	2021-06-04 22:59:25.48504+00	31	Type C to DisplayPort(1.4)	1	[{"added": {}}]	6	1
313	2021-06-04 22:59:37.278261+00	16	Length:1.8 m	1	[{"added": {}}]	7	1
314	2021-06-04 22:59:40.878698+00	487a9978-27d5-4bc1-8ad1-d515a9a84708	Type C to DisplayPort cable (1.8m)	1	[{"added": {}}]	9	1
315	2021-06-04 23:01:24.49019+00	7bdfe976-9b17-4f51-a0a2-b0954ae1bd12	Proel XLR to TRS (2m)	1	[{"added": {}}]	9	1
316	2021-06-04 23:01:32.771488+00	e43beb99-6e20-4f8b-93a7-32c15ef45ea7	Proel XLR to TRS (2m)	1	[{"added": {}}]	9	1
317	2021-06-04 23:03:46.127885+00	e7b3ed13-acb3-4e0c-bd29-bf5d2224ebcf	HDMI Cable (1440p - 144hz - 2m)	1	[{"added": {}}]	9	1
318	2021-06-04 23:10:57.929111+00	fa8aa674-93a0-4400-9f04-f58908ca2213	Fender California Cable Red (3m)	1	[{"added": {}}]	9	1
319	2022-12-14 22:43:40.540624+00	ba8ac1ce-fca8-4405-889a-1866113ebedb	Disney Old Comics	2	[{"changed": {"fields": ["Name", "Description"]}}]	9	1
320	2022-12-19 01:05:25.282117+00	5	TEST	3		4	1
321	2023-07-29 13:21:15.244122+00	753ee03b-e393-4637-b36d-8babb5fdb0e5	Accu XLR Cable (20m)	2	[{"changed": {"fields": ["Description", "Location", "Sublocation", "Designated location", "Designated sublocation"]}}]	9	1
322	2023-07-29 22:13:29.50899+00	12	Headphones	1	[{"added": {}}]	5	1
323	2023-07-29 22:13:31.249071+00	db97470b-0012-4ef6-8bb5-829bfbda8e1e	SC The stage cable (15m)	2	[{"changed": {"fields": ["Sublocation"]}}]	9	1
324	2023-07-29 22:22:34.663604+00	ddea3c4f-b07a-499e-8854-806283608548	Cordial XLR cable (15m)	2	[{"changed": {"fields": ["Sublocation"]}}]	9	1
325	2023-07-29 22:22:56.713806+00	cbcd1949-230f-4988-b3d0-9603c33cf2ed	Accu XLR Cable (20m)	2	[{"changed": {"fields": ["Sublocation"]}}]	9	1
326	2023-07-29 22:28:03.461835+00	5ae0ae41-9e3f-40aa-87ba-39ac1a94eb4d	Cordial XLR cable (15m)	2	[{"changed": {"fields": ["Sublocation"]}}]	9	1
327	2023-07-29 22:29:00.406358+00	13	High Tom	1	[{"added": {}}]	5	1
328	2023-07-29 22:29:09.348799+00	14	Medium Tom	1	[{"added": {}}]	5	1
329	2023-07-29 22:29:17.207307+00	15	Floor Tom	1	[{"added": {}}]	5	1
330	2023-07-29 22:35:50.539676+00	16	Mackie	1	[{"added": {}}]	5	1
331	2023-07-29 22:35:59.243178+00	7c4d5c6b-af99-4379-802c-e841b07ac019	SC The stage cable (15m)	2	[{"changed": {"fields": ["Location", "Sublocation"]}}]	9	1
332	2023-07-29 22:54:40.377149+00	d93d009a-56e5-48bd-b0d5-b4fc072c162a	Sommer Cable XLR cable	1	[{"added": {}}]	9	1
333	2023-07-29 22:55:12.522025+00	d93d009a-56e5-48bd-b0d5-b4fc072c162a	Sommer XLR Cable	2	[{"changed": {"fields": ["Name"]}}]	9	1
334	2023-07-29 23:16:10.537117+00	31	Power Cable	1	[{"added": {}}]	10	1
335	2023-07-29 23:16:28.867756+00	32	Power Strip	1	[{"added": {}}]	6	1
336	2023-07-29 23:36:09.010555+00	2	Sockets	1	[{"added": {}}]	8	1
337	2023-07-29 23:36:17.054868+00	17	Sockets:4 	1	[{"added": {}}]	7	1
338	2023-07-29 23:40:38.516495+00	52863f7b-5dac-4236-9aa1-b971857ee988	Legrand 4 Power Strip (1.5m)	1	[{"added": {}}]	9	1
339	2023-07-29 23:41:18.881573+00	33	Extension	1	[{"added": {}}]	6	1
340	2023-07-29 23:41:46.151476+00	bcfdf829-45ea-44b4-aa63-e8f48ae02c65	sas power extension (5m)	1	[{"added": {}}]	9	1
341	2023-07-29 23:42:35.153134+00	14443dd4-a8a7-4e06-ae7d-dd5e01835c4d	sas power extension (10m)	1	[{"added": {}}]	9	1
342	2023-07-29 23:43:55.943565+00	18	Sockets:8 	1	[{"added": {}}]	7	1
343	2023-07-29 23:44:35.196152+00	31	Desk	1	[{"added": {}}]	2	1
344	2023-07-29 23:44:47.361933+00	17	Left	1	[{"added": {}}]	5	1
345	2023-07-29 23:45:03.306264+00	13c6d14f-c343-4885-b811-aef546622f38	APC Power Strip (Surge Protection)	1	[{"added": {}}]	9	1
346	2023-07-29 23:45:42.603565+00	3	Surge Protection	1	[{"added": {}}]	8	1
347	2023-07-29 23:53:30.064061+00	23	 	1	[{"added": {}}]	7	1
348	2023-07-29 23:54:54.569305+00	ac415690-2705-4cab-9e20-d4049913dfd6	APC Power Strip (Surge Protection)	1	[{"added": {}}]	9	1
349	2023-07-29 23:57:20.332705+00	ac415690-2705-4cab-9e20-d4049913dfd6	APC Power Strip (Surge Protection)	3		9	1
350	2023-07-29 23:57:20.335296+00	ac415690-2705-4cab-9e20-d4049913dfd6	APC Power Strip (Surge Protection)	3		9	1
351	2023-07-29 23:57:31.626125+00	13c6d14f-c343-4885-b811-aef546622f38	APC Power Strip (Surge Protection)	3		9	1
352	2023-07-29 23:57:54.311669+00	231c7157-8bff-4ba3-82af-a48d0a17827c	APC Power Strip (Surge Protection)	1	[{"added": {}}]	9	1
353	2023-07-29 23:58:05.790392+00	bc3e26e6-e32a-4d4e-a2e7-a53d039bf45e	APC Power Strip (Surge Protection)	1	[{"added": {}}]	9	1
354	2023-07-30 00:20:23.226151+00	bc3e26e6-e32a-4d4e-a2e7-a53d039bf45e	APC Power Strip (Surge Protection)	3		9	1
355	2023-07-30 00:20:23.236665+00	bc3e26e6-e32a-4d4e-a2e7-a53d039bf45e	APC Power Strip (Surge Protection)	3		9	1
356	2023-07-30 00:20:34.532536+00	231c7157-8bff-4ba3-82af-a48d0a17827c	APC Power Strip (Surge Protection)	3		9	1
357	2023-07-30 00:20:34.534603+00	231c7157-8bff-4ba3-82af-a48d0a17827c	APC Power Strip (Surge Protection)	3		9	1
358	2023-07-30 00:22:25.694489+00	f9626bf8-408f-4eab-aeab-258e0236e155	APC Power Strip (Surge Protection)	1	[{"added": {}}]	9	1
359	2023-07-30 00:23:30.078343+00	b6419c73-1a2a-440c-905c-6865155d7b24	APC Power Strip (Surge Protection)	1	[{"added": {}}]	9	1
360	2023-07-30 00:24:07.733051+00	f9626bf8-408f-4eab-aeab-258e0236e155	APC Power Strip (Surge Protection)	3		9	1
361	2023-07-30 00:24:07.7353+00	f9626bf8-408f-4eab-aeab-258e0236e155	APC Power Strip (Surge Protection)	3		9	1
362	2023-07-30 00:24:07.736958+00	b6419c73-1a2a-440c-905c-6865155d7b24	APC Power Strip (Surge Protection)	3		9	1
363	2023-07-30 00:24:07.738896+00	b6419c73-1a2a-440c-905c-6865155d7b24	APC Power Strip (Surge Protection)	3		9	1
364	2023-07-30 00:27:16.291895+00	8f6f96ce-b521-4263-be5d-6b1475ca8f18	APC Power Strip (Surge Protection)	1	[{"added": {}}]	9	1
365	2023-07-30 00:30:11.284235+00	8f6f96ce-b521-4263-be5d-6b1475ca8f18	APC Power Strip (Surge Protection)	3		9	1
366	2023-07-30 00:30:11.292144+00	8f6f96ce-b521-4263-be5d-6b1475ca8f18	APC Power Strip (Surge Protection)	3		9	1
367	2023-07-30 00:30:22.657273+00	55220308-ba7e-45a6-b9d7-b3d94e7f0f5f	APC Power Strip (Surge Protection)	1	[{"added": {}}]	9	1
368	2023-07-30 17:42:54.09733+00	55220308-ba7e-45a6-b9d7-b3d94e7f0f5f	APC Power Strip (Surge Protection)	2	[{"changed": {"fields": ["Tags"]}}]	9	1
369	2023-07-30 17:45:15.522707+00	55220308-ba7e-45a6-b9d7-b3d94e7f0f5f	APC Power Strip (Surge Protection)	2	[]	9	1
370	2023-07-30 17:45:46.217644+00	18	Right	1	[{"added": {}}]	5	1
371	2023-07-30 17:45:48.830209+00	ef7229b0-6639-4b31-8245-f630fcbb0364	APC Power Strip (Surge Protection)	1	[{"added": {}}]	9	1
372	2023-07-30 17:46:17.749512+00	55220308-ba7e-45a6-b9d7-b3d94e7f0f5f	APC Power Strip (Surge Protection)	2	[{"changed": {"fields": ["Tags", "Location", "Sublocation"]}}]	9	1
373	2023-07-30 17:46:19.27979+00	ef7229b0-6639-4b31-8245-f630fcbb0364	APC Power Strip (Surge Protection)	2	[]	9	1
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: tidy
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	core	house
2	core	location
3	core	owner
4	core	plane
5	core	sublocation
6	core	subtype
7	core	tag
8	core	tagtype
9	core	thing
10	core	type
11	admin	logentry
12	auth	permission
13	auth	group
14	auth	user
15	contenttypes	contenttype
16	sessions	session
17	sequences	sequence
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: tidy
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2018-08-01 18:17:38.040666+00
2	auth	0001_initial	2018-08-01 18:17:38.072893+00
3	admin	0001_initial	2018-08-01 18:17:38.086328+00
4	admin	0002_logentry_remove_auto_add	2018-08-01 18:17:38.10058+00
5	contenttypes	0002_remove_content_type_name	2018-08-01 18:17:38.153076+00
6	auth	0002_alter_permission_name_max_length	2018-08-01 18:17:38.15693+00
7	auth	0003_alter_user_email_max_length	2018-08-01 18:17:38.163628+00
8	auth	0004_alter_user_username_opts	2018-08-01 18:17:38.169101+00
9	auth	0005_alter_user_last_login_null	2018-08-01 18:17:38.175522+00
10	auth	0006_require_contenttypes_0002	2018-08-01 18:17:38.176567+00
11	auth	0007_alter_validators_add_error_messages	2018-08-01 18:17:38.183078+00
12	auth	0008_alter_user_username_max_length	2018-08-01 18:17:38.19091+00
13	auth	0009_alter_user_last_name_max_length	2018-08-01 18:17:38.196442+00
15	sessions	0001_initial	2018-08-01 18:17:38.298717+00
21	admin	0003_logentry_add_action_flag_choices	2019-02-09 21:27:27.340087+00
22	sequences	0001_initial	2019-02-10 01:16:59.184769+00
27	auth	0010_alter_group_name_max_length	2019-09-20 10:04:08.775482+00
28	auth	0011_update_proxy_permissions	2019-09-20 10:04:08.788549+00
29	core	0001_initial	2019-10-27 20:25:22.305796+00
30	core	0002_auto_20180801_2253	2019-10-27 20:25:22.335794+00
31	core	0002_remove_location_system_field	2019-10-27 20:27:14.650196+00
32	core	0003_location_system_field	2019-10-27 20:27:28.260313+00
33	core	0004_auto_20191027_2036	2019-10-27 20:36:26.60325+00
34	core	0005_remove_location_system_field	2019-10-28 11:02:23.741073+00
35	auth	0012_alter_user_first_name_max_length	2022-10-21 01:40:49.552107+00
36	sequences	0002_alter_sequence_last	2022-10-21 01:40:49.586214+00
37	core	0006_thing_description_alter_thing_name	2022-12-14 22:42:23.893133+00
38	core	0007_alter_subtype_default_tags_alter_type_default_tags	2023-07-29 19:35:00.71264+00
39	core	0008_alter_thing_description	2023-07-29 19:35:00.762358+00
40	core	0009_alter_tag_value	2023-07-29 23:48:13.418016+00
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: tidy
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
5nchlowzyz883hsy1dhgfzuyj5mciqvi	NTEwNmNmYzA4MTIwNmMxZmE4ZGM2MTJkNmY1MDhmNjNiOTQwMGYwNjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJlN2ZmYTM4ZWVlODNjYzc4OThmZTNhY2Q5NGY5OTk0MGFlNmViMWQyIn0=	2018-08-15 18:18:27.187181+00
880x1ozccqdnb9xyz9gtr6yuku7mtvk3	NTEwNmNmYzA4MTIwNmMxZmE4ZGM2MTJkNmY1MDhmNjNiOTQwMGYwNjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJlN2ZmYTM4ZWVlODNjYzc4OThmZTNhY2Q5NGY5OTk0MGFlNmViMWQyIn0=	2018-08-16 19:45:34.391467+00
sw73vi0gss1qyoikxx664ld5y58bc1e8	NTEwNmNmYzA4MTIwNmMxZmE4ZGM2MTJkNmY1MDhmNjNiOTQwMGYwNjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJlN2ZmYTM4ZWVlODNjYzc4OThmZTNhY2Q5NGY5OTk0MGFlNmViMWQyIn0=	2018-08-17 10:08:00.068864+00
0jkj84cmu6jmftgrb6551ayjd7mleowp	NTEwNmNmYzA4MTIwNmMxZmE4ZGM2MTJkNmY1MDhmNjNiOTQwMGYwNjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJlN2ZmYTM4ZWVlODNjYzc4OThmZTNhY2Q5NGY5OTk0MGFlNmViMWQyIn0=	2018-08-17 13:17:51.888127+00
t6gk9mk785gcpgv3zourargc0k1k9q7p	NTEwNmNmYzA4MTIwNmMxZmE4ZGM2MTJkNmY1MDhmNjNiOTQwMGYwNjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJlN2ZmYTM4ZWVlODNjYzc4OThmZTNhY2Q5NGY5OTk0MGFlNmViMWQyIn0=	2018-09-11 00:30:43.274278+00
5jri1v2g06o0queuctuuux8kf11jz1bp	NTEwNmNmYzA4MTIwNmMxZmE4ZGM2MTJkNmY1MDhmNjNiOTQwMGYwNjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJlN2ZmYTM4ZWVlODNjYzc4OThmZTNhY2Q5NGY5OTk0MGFlNmViMWQyIn0=	2018-12-30 16:53:47.644678+00
scknp3fd0vurtnns02meqtxn851vpvkc	NTEwNmNmYzA4MTIwNmMxZmE4ZGM2MTJkNmY1MDhmNjNiOTQwMGYwNjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJlN2ZmYTM4ZWVlODNjYzc4OThmZTNhY2Q5NGY5OTk0MGFlNmViMWQyIn0=	2019-02-23 21:09:18.282729+00
8lzcjdbttbgbps01uba3x7phj1n3j1or	NTEwNmNmYzA4MTIwNmMxZmE4ZGM2MTJkNmY1MDhmNjNiOTQwMGYwNjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJlN2ZmYTM4ZWVlODNjYzc4OThmZTNhY2Q5NGY5OTk0MGFlNmViMWQyIn0=	2019-02-25 10:02:41.706126+00
15quv8skntrham5omyvfjdh7jw7qwf41	NTEwNmNmYzA4MTIwNmMxZmE4ZGM2MTJkNmY1MDhmNjNiOTQwMGYwNjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJlN2ZmYTM4ZWVlODNjYzc4OThmZTNhY2Q5NGY5OTk0MGFlNmViMWQyIn0=	2019-03-10 16:39:18.491678+00
s4sonm931xc5x1jdj1r8reotyx9dat3w	OGE2MWJjMjBlZWM3MTVkODg1ZjIyMWQwYjkzMjY4MWIyYWI1NmQzMTp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJlMDljOTI4N2E4MjU3YmQyNWJmNTFjNjdmNzk0NTA2YWQzOGUwYzIzIn0=	2019-03-12 09:17:53.014596+00
15ptev8ug0t7cjh30t4y3ehmqvjqpcvy	NTEwNmNmYzA4MTIwNmMxZmE4ZGM2MTJkNmY1MDhmNjNiOTQwMGYwNjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJlN2ZmYTM4ZWVlODNjYzc4OThmZTNhY2Q5NGY5OTk0MGFlNmViMWQyIn0=	2019-03-25 18:13:29.521784+00
t1refdxl5he931yk9pe374vbbik3z78n	NTEwNmNmYzA4MTIwNmMxZmE4ZGM2MTJkNmY1MDhmNjNiOTQwMGYwNjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJlN2ZmYTM4ZWVlODNjYzc4OThmZTNhY2Q5NGY5OTk0MGFlNmViMWQyIn0=	2019-04-12 00:47:11.256771+00
y8n0c7j4hm93t93w51jd1rqecsb0dfdq	NTEwNmNmYzA4MTIwNmMxZmE4ZGM2MTJkNmY1MDhmNjNiOTQwMGYwNjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJlN2ZmYTM4ZWVlODNjYzc4OThmZTNhY2Q5NGY5OTk0MGFlNmViMWQyIn0=	2019-04-26 20:27:40.766363+00
gbxfheqf1ocj40nxd6uzto4fucqqfysc	NTEwNmNmYzA4MTIwNmMxZmE4ZGM2MTJkNmY1MDhmNjNiOTQwMGYwNjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJlN2ZmYTM4ZWVlODNjYzc4OThmZTNhY2Q5NGY5OTk0MGFlNmViMWQyIn0=	2019-04-30 14:26:20.789972+00
c3z500zq8qr3du6x7hz9527gi591rg4o	NTEwNmNmYzA4MTIwNmMxZmE4ZGM2MTJkNmY1MDhmNjNiOTQwMGYwNjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJlN2ZmYTM4ZWVlODNjYzc4OThmZTNhY2Q5NGY5OTk0MGFlNmViMWQyIn0=	2019-05-15 11:09:39.842584+00
cqx6kzopvjz0y2787i2dlmwfgutw9qgl	NTEwNmNmYzA4MTIwNmMxZmE4ZGM2MTJkNmY1MDhmNjNiOTQwMGYwNjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJlN2ZmYTM4ZWVlODNjYzc4OThmZTNhY2Q5NGY5OTk0MGFlNmViMWQyIn0=	2019-05-16 22:42:10.438352+00
s913366bahsapjli0twgp2g71fyzbiph	NTEwNmNmYzA4MTIwNmMxZmE4ZGM2MTJkNmY1MDhmNjNiOTQwMGYwNjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJlN2ZmYTM4ZWVlODNjYzc4OThmZTNhY2Q5NGY5OTk0MGFlNmViMWQyIn0=	2019-05-20 08:32:27.846687+00
gjr5w1skr94e5rvgk8k75cin7igcjf4f	NTEwNmNmYzA4MTIwNmMxZmE4ZGM2MTJkNmY1MDhmNjNiOTQwMGYwNjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJlN2ZmYTM4ZWVlODNjYzc4OThmZTNhY2Q5NGY5OTk0MGFlNmViMWQyIn0=	2019-06-01 00:23:39.28131+00
ibu2kqgu01i0hdbk1c8bfo7pmh6xfv3s	NTEwNmNmYzA4MTIwNmMxZmE4ZGM2MTJkNmY1MDhmNjNiOTQwMGYwNjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJlN2ZmYTM4ZWVlODNjYzc4OThmZTNhY2Q5NGY5OTk0MGFlNmViMWQyIn0=	2019-06-18 12:31:32.168994+00
6x0srv5ho01zo0lqqacoa5wi8kkrlg7a	NTEwNmNmYzA4MTIwNmMxZmE4ZGM2MTJkNmY1MDhmNjNiOTQwMGYwNjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJlN2ZmYTM4ZWVlODNjYzc4OThmZTNhY2Q5NGY5OTk0MGFlNmViMWQyIn0=	2019-06-28 15:22:43.954106+00
o1h4pbhaesh9i17kwfq5vk9cjyzrnqxk	MWQ4MzJkMGU0ZWE2ZGRjOTI3YjI4NDM4N2UxY2Q4Y2JhMmQ3MTVhNDp7ImVudGl0aWVzIjpbeyJuYW1lIjoiVVRQIENhYmxlICg1bSkiLCJiYXJjb2RlIjoiMjAwMDAwMDAwMDQ3NSIsInR5cGUiOiJVVFAgQ2FibGUiLCJzdWJUeXBlIjpudWxsLCJsb2NhdGlvbiI6IkdyZXkgRHJhd2VyIiwic3VibG9jYXRpb24iOiI0dGggZHJhd2VyIn1dfQ==	2019-07-28 20:33:01.398987+00
ilxwb09qi1bku522i32a6u1qvtc20j6h	YWJiYjViMGY0OWMyOWRlZGQ4YTk5OTYwMzMzZjNjNDZhY2JlY2U4MDp7ImVudGl0aWVzIjpbeyJuYW1lIjoiVVNCIHR5cGUgQiBjYWJsZSIsImJhcmNvZGUiOiIyMDAwMDAwMDAwMzUyIiwidHlwZSI6IlVTQiBDYWJsZSIsImxvY2F0aW9uIjoiTWFnbWEgYmFnIiwic3VibG9jYXRpb24iOm51bGwsImRlc2lnbmF0ZWRMb2NhdGlvbiI6IkJpZyBjbG9zZXQiLCJkZXNpZ25hdGVkU3VibG9jYXRpb24iOiIybmQgZHJhd2VyIn0seyJuYW1lIjoiU2VudGlvIGlwaG9uZSBjYWJsZSIsImJhcmNvZGUiOiIyMDAwMDAwMDAwMzIxIiwidHlwZSI6IlVTQiBDYWJsZSIsImxvY2F0aW9uIjoiR3JleSBEcmF3ZXIiLCJzdWJsb2NhdGlvbiI6IjR0aCBkcmF3ZXIiLCJkZXNpZ25hdGVkTG9jYXRpb24iOiJCaWcgY2xvc2V0IiwiZGVzaWduYXRlZFN1YmxvY2F0aW9uIjoiM3JkIGRyYXdlciJ9LHsibmFtZSI6IlVUUCBDYWJsZSAoNW0pIiwiYmFyY29kZSI6IjIwMDAwMDAwMDA0NzUiLCJ0eXBlIjoiVVRQIENhYmxlIiwibG9jYXRpb24iOiJHcmV5IERyYXdlciIsInN1YmxvY2F0aW9uIjoiNHRoIGRyYXdlciIsImRlc2lnbmF0ZWRMb2NhdGlvbiI6bnVsbCwiZGVzaWduYXRlZFN1YmxvY2F0aW9uIjpudWxsfSx7Im5hbWUiOiJPRU0gVFMgTmV1dHJpayAoMm0pIiwiYmFyY29kZSI6IjIwMDAwMDAwMDAxMDkiLCJ0eXBlIjoiQXVkaW8gQ2FibGUiLCJsb2NhdGlvbiI6IkJpZyBjbG9zZXQiLCJzdWJsb2NhdGlvbiI6IjNyZCBkcmF3ZXIiLCJkZXNpZ25hdGVkTG9jYXRpb24iOm51bGwsImRlc2lnbmF0ZWRTdWJsb2NhdGlvbiI6bnVsbH1dfQ==	2019-08-25 21:19:13.366532+00
y9jefzfnqv79zaq5qy8yrawk54l88ikm	M2YwMDQ3MjQ4Nzc0ZjZlMjcxNGUyNDY2NDA2ODk2NGFkNWEyMjNlMjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJlN2ZmYTM4ZWVlODNjYzc4OThmZTNhY2Q5NGY5OTk0MGFlNmViMWQyIiwiZW50aXRpZXMiOlt7Im5hbWUiOiJVVFAgQ2FibGUgKDVtKSIsImJhcmNvZGUiOiIyMDAwMDAwMDAwNDc1IiwidHlwZSI6IlVUUCBDYWJsZSIsImxvY2F0aW9uIjoiR3JleSBEcmF3ZXIiLCJzdWJsb2NhdGlvbiI6IjR0aCBkcmF3ZXIiLCJkZXNpZ25hdGVkTG9jYXRpb24iOm51bGwsImRlc2lnbmF0ZWRTdWJsb2NhdGlvbiI6bnVsbH0seyJuYW1lIjoiT0VNIFRTIE5ldXRyaWsgKDJtKSIsImJhcmNvZGUiOiIyMDAwMDAwMDAwMTA5IiwidHlwZSI6IkF1ZGlvIENhYmxlIiwibG9jYXRpb24iOiJCaWcgY2xvc2V0Iiwic3VibG9jYXRpb24iOiIzcmQgZHJhd2VyIiwiZGVzaWduYXRlZExvY2F0aW9uIjpudWxsLCJkZXNpZ25hdGVkU3VibG9jYXRpb24iOm51bGx9LHsibmFtZSI6IkFjY3UgWExSIENhYmxlICgyMG0pIiwiYmFyY29kZSI6IjIwMDAwMDAwMDAxMTQiLCJ0eXBlIjoiQXVkaW8gQ2FibGUiLCJsb2NhdGlvbiI6IkJpZyBjbG9zZXQiLCJzdWJsb2NhdGlvbiI6IjFzdCBkcmF3ZXIiLCJkZXNpZ25hdGVkTG9jYXRpb24iOm51bGwsImRlc2lnbmF0ZWRTdWJsb2NhdGlvbiI6bnVsbH1dfQ==	2019-09-26 22:21:32.439502+00
zv6p5vnvkmm5100pcdlyq7xcpu7n2xnw	NzUwY2EzMzQ0ZGNhMWYwMzgzNzg0NTk2M2JkMjk5ZWEwOTcwODgyMTp7ImVudGl0aWVzIjpbeyJuYW1lIjoiVFAtTElOSyBUTC1XTjcyMk4iLCJiYXJjb2RlIjoiMjE0NzM1NjAwMzkwMyIsInR5cGUiOiJIYXJkd2FyZSIsImxvY2F0aW9uIjo1LCJzdWJsb2NhdGlvbiI6NCwiZGVzaWduYXRlZExvY2F0aW9uIjpudWxsLCJkZXNpZ25hdGVkU3VibG9jYXRpb24iOm51bGx9XX0=	2019-10-04 10:11:54.41466+00
wv96l1331ldrk6vd2suut1lweyohr2k5	NDVjODk4Y2FiNjMyNjQ4OGY4ZGU4ZWMzN2I0YjZjYzcyODk4ZWIyYjp7ImVudGl0aWVzIjpbeyJuYW1lIjoiTWljcm8gVXNiICg1LXBpbiAwLjI1bSkiLCJiYXJjb2RlIjoiMjAwMDAwMDAwMDMzOCIsInR5cGUiOiJVU0IgQ2FibGUiLCJzdWJUeXBlIjoiTWljcm8gVVNCIDUtcGluIiwibG9jYXRpb24iOiJHcmV5IERyYXdlciIsInN1YmxvY2F0aW9uIjoiNHRoIGRyYXdlciJ9LHsibmFtZSI6IlBTVSBDYWJsZSAoMi41bSkiLCJiYXJjb2RlIjoiMjAwMDAwMDAwMDI0NCIsInR5cGUiOiJQU1UgQ2FibGUiLCJzdWJUeXBlIjoiUFNVIHRvIFNvY2tldCIsImxvY2F0aW9uIjoiR3JleSBEcmF3ZXIiLCJzdWJsb2NhdGlvbiI6IjR0aCBkcmF3ZXIifV19	2019-08-02 10:02:25.340029+00
9gmzxb4nptnkgsgqs9hon35a1dk3hvo9	ZmNiZWM1OGFiYzFhYmU1Y2U0YTA3YzIxZGI3NTJmNTA0ZDRhMjljMDp7ImVudGl0aWVzIjpbeyJuYW1lIjoiVVNCIHR5cGUgQiBjYWJsZSIsImJhcmNvZGUiOiIyMDAwMDAwMDAwMzA3IiwidHlwZSI6IlVTQiBDYWJsZSIsImxvY2F0aW9uIjoiQmlnIGNsb3NldCIsInN1YmxvY2F0aW9uIjoiMXN0IGRyYXdlciIsImRlc2lnbmF0ZWRMb2NhdGlvbiI6bnVsbCwiZGVzaWduYXRlZFN1YmxvY2F0aW9uIjpudWxsfV19	2019-08-23 10:27:29.283686+00
yglsmytgoinkxjztt7jroaryafbsvgij	NTljYzFkMjA5YjI4MjZmMzJiM2Y4OGQyMGJhODQyMTgyZjliMjUzMjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJjOGY1Y2JlZDA0MDU1Zjk3ODdjZjUxZDFhMjg2NmM4YjA0NjhiMzliIiwiZW50aXRpZXMiOlt7Im5hbWUiOiJDYXNlIExvZ2ljIHBob3RvIGJhY2twYWNrIiwiYmFyY29kZSI6IjIwMDAwMDAwMDA0ODIiLCJ0eXBlIjoiQmFnIiwibG9jYXRpb24iOjMsInN1YmxvY2F0aW9uIjpudWxsLCJkZXNpZ25hdGVkTG9jYXRpb24iOm51bGwsImRlc2lnbmF0ZWRTdWJsb2NhdGlvbiI6bnVsbH1dfQ==	2019-10-20 16:15:17.820959+00
vf0il13g11mjxa23d73m32hdt0p11vky	MTk0YTE0NDU1YjZiZDZlYWUzN2ZlMmNhMDZjMTQ2MTFlMmNhZmRjNzp7ImVudGl0aWVzIjpbeyJuYW1lIjoiVVNCIHR5cGUgQiBjYWJsZSIsImJhcmNvZGUiOiIyMDAwMDAwMDAwMzA3IiwidHlwZSI6IlVTQiBDYWJsZSIsImxvY2F0aW9uIjo1LCJzdWJsb2NhdGlvbiI6MywiZGVzaWduYXRlZExvY2F0aW9uIjo1LCJkZXNpZ25hdGVkU3VibG9jYXRpb24iOjV9LHsibmFtZSI6IkZlbmRlciBUUyBDYWJsZSIsImJhcmNvZGUiOiIyMDAwMDAwMDAwMDg0IiwidHlwZSI6IkF1ZGlvIENhYmxlIiwibG9jYXRpb24iOjIsInN1YmxvY2F0aW9uIjoyLCJkZXNpZ25hdGVkTG9jYXRpb24iOm51bGwsImRlc2lnbmF0ZWRTdWJsb2NhdGlvbiI6bnVsbH0seyJuYW1lIjoiU2VubmhlaXNlciBNaW5pamFjayBUUlMgY2FibGUiLCJiYXJjb2RlIjoiMjAwMDAwMDAwMDE3OCIsInR5cGUiOiJBdWRpbyBDYWJsZSIsImxvY2F0aW9uIjoxLCJzdWJsb2NhdGlvbiI6bnVsbCwiZGVzaWduYXRlZExvY2F0aW9uIjpudWxsLCJkZXNpZ25hdGVkU3VibG9jYXRpb24iOm51bGx9LHsibmFtZSI6IlVUUCBDYWJsZSAoNW0pIiwiYmFyY29kZSI6IjIwMDAwMDAwMDA0NzUiLCJ0eXBlIjoiVVRQIENhYmxlIiwibG9jYXRpb24iOjIsInN1YmxvY2F0aW9uIjoyLCJkZXNpZ25hdGVkTG9jYXRpb24iOm51bGwsImRlc2lnbmF0ZWRTdWJsb2NhdGlvbiI6bnVsbH0seyJuYW1lIjoiUFNVIENhYmxlICgyLjVtKSIsImJhcmNvZGUiOiIyMDAwMDAwMDAwMjQ0IiwidHlwZSI6IlBTVSBDYWJsZSIsImxvY2F0aW9uIjoyLCJzdWJsb2NhdGlvbiI6MiwiZGVzaWduYXRlZExvY2F0aW9uIjpudWxsLCJkZXNpZ25hdGVkU3VibG9jYXRpb24iOm51bGx9XSwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6ImM4ZjVjYmVkMDQwNTVmOTc4N2NmNTFkMWEyODY2YzhiMDQ2OGIzOWIifQ==	2019-11-19 22:12:21.603841+00
men3fvb6vyzxc3ouzc6zx0nfkxjuko17	YjNiMThkMTRkOTk1ZGQxOTlkYmE1OWUzZDM3MTVjM2I1Mzg1OWUxODp7ImVudGl0aWVzIjpbeyJuYW1lIjoiVVRQIENhYmxlICg1bSkiLCJiYXJjb2RlIjoiMjAwMDAwMDAwMDQ3NSIsInR5cGUiOiJVVFAgQ2FibGUiLCJsb2NhdGlvbiI6Miwic3VibG9jYXRpb24iOjIsImRlc2lnbmF0ZWRMb2NhdGlvbiI6bnVsbCwiZGVzaWduYXRlZFN1YmxvY2F0aW9uIjpudWxsfSx7Im5hbWUiOiJGZW5kZXIgVFMgQ2FibGUiLCJiYXJjb2RlIjoiMjAwMDAwMDAwMDA4NCIsInR5cGUiOiJBdWRpbyBDYWJsZSIsImxvY2F0aW9uIjoyLCJzdWJsb2NhdGlvbiI6MiwiZGVzaWduYXRlZExvY2F0aW9uIjpudWxsLCJkZXNpZ25hdGVkU3VibG9jYXRpb24iOm51bGx9LHsibmFtZSI6IlVTQiB0eXBlIEIgY2FibGUgKDJtIHllbGxvdykiLCJiYXJjb2RlIjoiMjAwMDAwMDAwMDQwNiIsInR5cGUiOiJVU0IgQ2FibGUiLCJsb2NhdGlvbiI6NSwic3VibG9jYXRpb24iOjMsImRlc2lnbmF0ZWRMb2NhdGlvbiI6NSwiZGVzaWduYXRlZFN1YmxvY2F0aW9uIjo1fSx7Im5hbWUiOiJPRU0gVFMgTmV1dHJpayAoMm0pIiwiYmFyY29kZSI6IjIwMDAwMDAwMDAxMDkiLCJ0eXBlIjoiQXVkaW8gQ2FibGUiLCJsb2NhdGlvbiI6NSwic3VibG9jYXRpb24iOjUsImRlc2lnbmF0ZWRMb2NhdGlvbiI6bnVsbCwiZGVzaWduYXRlZFN1YmxvY2F0aW9uIjpudWxsfV0sIl9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJjOGY1Y2JlZDA0MDU1Zjk3ODdjZjUxZDFhMjg2NmM4YjA0NjhiMzliIn0=	2021-04-20 10:22:05.19285+00
d6facyd3fawlliwy7pv912nsc4x5qwsv	YzY5NjgwMjVhYTZmMzY1MzEzNDQxNjRlMjlmMDQ2ZWQ3ZDIwMTdjNTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhOTQzZjk2NjEyMWUxMzU3ZmE5ODM5ZGIwM2UyMjdhNWZjYzgzOGZmIiwiZW50aXRpZXMiOlt7ImlkIjoiMzUzZGVlOGEtMzU2Mi00N2YwLThmMjItNTkxYWE3YTU1Y2Q5IiwibmFtZSI6IlByb2VsIFhMUiBDYWJsZSAoM20pIiwiYmFyY29kZSI6IjIwMDAwMDAwMDAwNzciLCJ0eXBlIjoiQXVkaW8gQ2FibGUiLCJsb2NhdGlvbiI6NSwic3VibG9jYXRpb24iOjMsImRlc2lnbmF0ZWRMb2NhdGlvbiI6NSwiZGVzaWduYXRlZFN1YmxvY2F0aW9uIjozfSx7ImlkIjoiNjI1NjljYjMtMTk0My00MWJiLWE3ODgtY2QzZjllZDVhYTA4IiwibmFtZSI6IlByb2VsIFhMUiBDYWJsZSAoNW0pIiwiYmFyY29kZSI6IjIwMDAwMDAwMDAxNjkiLCJ0eXBlIjoiQXVkaW8gQ2FibGUiLCJsb2NhdGlvbiI6NSwic3VibG9jYXRpb24iOjMsImRlc2lnbmF0ZWRMb2NhdGlvbiI6NSwiZGVzaWduYXRlZFN1YmxvY2F0aW9uIjozfSx7ImlkIjoiMWJmNmVmNDYtNTVhNi00MWFjLWFiYTktYTJkZWMyYWRkZGVjIiwibmFtZSI6IlByb2VsIFhMUiBDYWJsZSAoM20pIiwiYmFyY29kZSI6IjIwMDAwMDAwMDAwNTMiLCJ0eXBlIjoiQXVkaW8gQ2FibGUiLCJsb2NhdGlvbiI6NSwic3VibG9jYXRpb24iOjMsImRlc2lnbmF0ZWRMb2NhdGlvbiI6NSwiZGVzaWduYXRlZFN1YmxvY2F0aW9uIjozfV19	2021-05-27 23:32:05.946526+00
ccyg1gidqs79ori1le164f2k71wzffxj	ZmE0MWUwOWY5NzRmOTRkYTdhNzcyYjU1OGRkZGIwYzNjODBkMDdmNTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhOTQzZjk2NjEyMWUxMzU3ZmE5ODM5ZGIwM2UyMjdhNWZjYzgzOGZmIn0=	2021-06-11 21:06:15.341897+00
0ao1ek6uyc7wscep2x9ig1de4qqvfwj9	ZmE0MWUwOWY5NzRmOTRkYTdhNzcyYjU1OGRkZGIwYzNjODBkMDdmNTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhOTQzZjk2NjEyMWUxMzU3ZmE5ODM5ZGIwM2UyMjdhNWZjYzgzOGZmIn0=	2022-10-28 02:59:59.679226+00
959cwit7errl280boh29m1tti333ndhx	.eJxVjDkOwjAUBe_iGll24gUo6XMG62_GAeRIcVIh7k4ipYB2Zt57qwTrUtLaZE4jq6uy6vTLEOgpdRf8gHqfNE11mUfUe6IP2_QwsbxuR_t3UKCVbU1iozeQzcUh9wHYGY90jj1mZzlb7HIgBskcAYIPAn4jXjKZjpyg-nwBDGM5bw:1ovRhK:ly2q7Z--06n59IlSYzDSE41KUk8puxntkbXD0BRpRtU	2022-11-30 23:20:02.997745+00
nyntqwuymqy4m3f7uaawcqm4o5uz0746	.eJxVjDkOwjAUBe_iGll24gUo6XMG62_GAeRIcVIh7k4ipYB2Zt57qwTrUtLaZE4jq6uy6vTLEOgpdRf8gHqfNE11mUfUe6IP2_QwsbxuR_t3UKCVbU1iozeQzcUh9wHYGY90jj1mZzlb7HIgBskcAYIPAn4jXjKZjpyg-nwBDGM5bw:1p1A2F:sE3kU6wch-IGd69btDYsyG-s7rKvbKTNtY13LmGG6s8	2022-12-16 17:41:15.859771+00
7ibel6lsmo6xmvn9e9o5dnuwqmdsbu45	.eJxVjDkOwjAUBe_iGll24gUo6XMG62_GAeRIcVIh7k4ipYB2Zt57qwTrUtLaZE4jq6uy6vTLEOgpdRf8gHqfNE11mUfUe6IP2_QwsbxuR_t3UKCVbU1iozeQzcUh9wHYGY90jj1mZzlb7HIgBskcAYIPAn4jXjKZjpyg-nwBDGM5bw:1p6fX0:PIkDGy2ITanUS5JP6PP6Zf_8MKYfPjwTuRVWuPpKwcI	2022-12-31 22:19:46.410017+00
20cbbncxx59icublgm3akgjfscv82k2v	.eJxVjDkOwjAUBe_iGll24gUo6XMG62_GAeRIcVIh7k4ipYB2Zt57qwTrUtLaZE4jq6uy6vTLEOgpdRf8gHqfNE11mUfUe6IP2_QwsbxuR_t3UKCVbU1iozeQzcUh9wHYGY90jj1mZzlb7HIgBskcAYIPAn4jXjKZjpyg-nwBDGM5bw:1p9mgj:KFr2ImvRA4m-_56Qxu1g6DW4zT__b73qCI8tx2k2-H8	2023-01-09 12:34:41.922038+00
0lxfrhwk99qmgkwg3bsnchd9nl6i3txn	.eJxVjDkOwjAUBe_iGll24gUo6XMG62_GAeRIcVIh7k4ipYB2Zt57qwTrUtLaZE4jq6uy6vTLEOgpdRf8gHqfNE11mUfUe6IP2_QwsbxuR_t3UKCVbU1iozeQzcUh9wHYGY90jj1mZzlb7HIgBskcAYIPAn4jXjKZjpyg-nwBDGM5bw:1pZBiX:RoT8K2UpyyT7TH56sxCVGCCLSJ0urKxMf7FHBTrVhxE	2023-03-20 14:21:33.232254+00
zbn6mcpkc72cme4htjt2pb7iya98kk6x	.eJxVjDkOwjAUBe_iGll24gUo6XMG62_GAeRIcVIh7k4ipYB2Zt57qwTrUtLaZE4jq6uy6vTLEOgpdRf8gHqfNE11mUfUe6IP2_QwsbxuR_t3UKCVbU1iozeQzcUh9wHYGY90jj1mZzlb7HIgBskcAYIPAn4jXjKZjpyg-nwBDGM5bw:1qPjhA:vv4lh_IBy12H9xHB3oSwi4GwcocgCeFY84KqVkrHklI	2023-08-12 13:09:20.838205+00
\.


--
-- Data for Name: sequences_sequence; Type: TABLE DATA; Schema: public; Owner: tidy
--

COPY public.sequences_sequence (name, last) FROM stdin;
tidy	70
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tidy
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tidy
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tidy
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 68, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tidy
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tidy
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 2, true);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tidy
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Name: core_house_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tidy
--

SELECT pg_catalog.setval('public.core_house_id_seq', 1, true);


--
-- Name: core_location_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tidy
--

SELECT pg_catalog.setval('public.core_location_id_seq', 31, true);


--
-- Name: core_owner_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tidy
--

SELECT pg_catalog.setval('public.core_owner_id_seq', 1, true);


--
-- Name: core_plane_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tidy
--

SELECT pg_catalog.setval('public.core_plane_id_seq', 7, true);


--
-- Name: core_sublocation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tidy
--

SELECT pg_catalog.setval('public.core_sublocation_id_seq', 18, true);


--
-- Name: core_subtype_default_tags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tidy
--

SELECT pg_catalog.setval('public.core_subtype_default_tags_id_seq', 20, true);


--
-- Name: core_subtype_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tidy
--

SELECT pg_catalog.setval('public.core_subtype_id_seq', 33, true);


--
-- Name: core_tag_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tidy
--

SELECT pg_catalog.setval('public.core_tag_id_seq', 23, true);


--
-- Name: core_tagtype_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tidy
--

SELECT pg_catalog.setval('public.core_tagtype_id_seq', 3, true);


--
-- Name: core_thing_tags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tidy
--

SELECT pg_catalog.setval('public.core_thing_tags_id_seq', 101, true);


--
-- Name: core_type_default_tags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tidy
--

SELECT pg_catalog.setval('public.core_type_default_tags_id_seq', 8, true);


--
-- Name: core_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tidy
--

SELECT pg_catalog.setval('public.core_type_id_seq', 31, true);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tidy
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 373, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tidy
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 17, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tidy
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 40, true);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: tidy
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: tidy
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: tidy
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: tidy
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: tidy
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: tidy
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: tidy
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: tidy
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: tidy
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: tidy
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: tidy
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: tidy
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: core_house core_house_pkey; Type: CONSTRAINT; Schema: public; Owner: tidy
--

ALTER TABLE ONLY public.core_house
    ADD CONSTRAINT core_house_pkey PRIMARY KEY (id);


--
-- Name: core_location core_location_name_40ac8adc_uniq; Type: CONSTRAINT; Schema: public; Owner: tidy
--

ALTER TABLE ONLY public.core_location
    ADD CONSTRAINT core_location_name_40ac8adc_uniq UNIQUE (name);


--
-- Name: core_location core_location_pkey; Type: CONSTRAINT; Schema: public; Owner: tidy
--

ALTER TABLE ONLY public.core_location
    ADD CONSTRAINT core_location_pkey PRIMARY KEY (id);


--
-- Name: core_owner core_owner_pkey; Type: CONSTRAINT; Schema: public; Owner: tidy
--

ALTER TABLE ONLY public.core_owner
    ADD CONSTRAINT core_owner_pkey PRIMARY KEY (id);


--
-- Name: core_plane core_plane_pkey; Type: CONSTRAINT; Schema: public; Owner: tidy
--

ALTER TABLE ONLY public.core_plane
    ADD CONSTRAINT core_plane_pkey PRIMARY KEY (id);


--
-- Name: core_sublocation core_sublocation_pkey; Type: CONSTRAINT; Schema: public; Owner: tidy
--

ALTER TABLE ONLY public.core_sublocation
    ADD CONSTRAINT core_sublocation_pkey PRIMARY KEY (id);


--
-- Name: core_subtype_default_tags core_subtype_default_tags_pkey; Type: CONSTRAINT; Schema: public; Owner: tidy
--

ALTER TABLE ONLY public.core_subtype_default_tags
    ADD CONSTRAINT core_subtype_default_tags_pkey PRIMARY KEY (id);


--
-- Name: core_subtype_default_tags core_subtype_default_tags_subtype_id_tagtype_id_ed88d8e6_uniq; Type: CONSTRAINT; Schema: public; Owner: tidy
--

ALTER TABLE ONLY public.core_subtype_default_tags
    ADD CONSTRAINT core_subtype_default_tags_subtype_id_tagtype_id_ed88d8e6_uniq UNIQUE (subtype_id, tagtype_id);


--
-- Name: core_subtype core_subtype_pkey; Type: CONSTRAINT; Schema: public; Owner: tidy
--

ALTER TABLE ONLY public.core_subtype
    ADD CONSTRAINT core_subtype_pkey PRIMARY KEY (id);


--
-- Name: core_tag core_tag_pkey; Type: CONSTRAINT; Schema: public; Owner: tidy
--

ALTER TABLE ONLY public.core_tag
    ADD CONSTRAINT core_tag_pkey PRIMARY KEY (id);


--
-- Name: core_tagtype core_tagtype_pkey; Type: CONSTRAINT; Schema: public; Owner: tidy
--

ALTER TABLE ONLY public.core_tagtype
    ADD CONSTRAINT core_tagtype_pkey PRIMARY KEY (id);


--
-- Name: core_thing core_thing_pkey; Type: CONSTRAINT; Schema: public; Owner: tidy
--

ALTER TABLE ONLY public.core_thing
    ADD CONSTRAINT core_thing_pkey PRIMARY KEY (id);


--
-- Name: core_thing_tags core_thing_tags_pkey; Type: CONSTRAINT; Schema: public; Owner: tidy
--

ALTER TABLE ONLY public.core_thing_tags
    ADD CONSTRAINT core_thing_tags_pkey PRIMARY KEY (id);


--
-- Name: core_thing_tags core_thing_tags_thing_id_tag_id_0d9f6dd3_uniq; Type: CONSTRAINT; Schema: public; Owner: tidy
--

ALTER TABLE ONLY public.core_thing_tags
    ADD CONSTRAINT core_thing_tags_thing_id_tag_id_0d9f6dd3_uniq UNIQUE (thing_id, tag_id);


--
-- Name: core_type_default_tags core_type_default_tags_pkey; Type: CONSTRAINT; Schema: public; Owner: tidy
--

ALTER TABLE ONLY public.core_type_default_tags
    ADD CONSTRAINT core_type_default_tags_pkey PRIMARY KEY (id);


--
-- Name: core_type_default_tags core_type_default_tags_type_id_tagtype_id_3699c2ef_uniq; Type: CONSTRAINT; Schema: public; Owner: tidy
--

ALTER TABLE ONLY public.core_type_default_tags
    ADD CONSTRAINT core_type_default_tags_type_id_tagtype_id_3699c2ef_uniq UNIQUE (type_id, tagtype_id);


--
-- Name: core_type core_type_pkey; Type: CONSTRAINT; Schema: public; Owner: tidy
--

ALTER TABLE ONLY public.core_type
    ADD CONSTRAINT core_type_pkey PRIMARY KEY (id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: tidy
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: tidy
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: tidy
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: tidy
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: tidy
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: sequences_sequence sequences_sequence_pkey; Type: CONSTRAINT; Schema: public; Owner: tidy
--

ALTER TABLE ONLY public.sequences_sequence
    ADD CONSTRAINT sequences_sequence_pkey PRIMARY KEY (name);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: tidy
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: tidy
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: tidy
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: tidy
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: tidy
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: tidy
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: tidy
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: tidy
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: tidy
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: core_house_onwer_id_ef275a14; Type: INDEX; Schema: public; Owner: tidy
--

CREATE INDEX core_house_onwer_id_ef275a14 ON public.core_house USING btree (onwer_id);


--
-- Name: core_location_house_id_c75eff55; Type: INDEX; Schema: public; Owner: tidy
--

CREATE INDEX core_location_house_id_c75eff55 ON public.core_location USING btree (house_id);


--
-- Name: core_location_name_40ac8adc_like; Type: INDEX; Schema: public; Owner: tidy
--

CREATE INDEX core_location_name_40ac8adc_like ON public.core_location USING btree (name varchar_pattern_ops);


--
-- Name: core_location_thing_id_cfb2f3c2; Type: INDEX; Schema: public; Owner: tidy
--

CREATE INDEX core_location_thing_id_cfb2f3c2 ON public.core_location USING btree (thing_id);


--
-- Name: core_sublocation_location_id_672d0dc0; Type: INDEX; Schema: public; Owner: tidy
--

CREATE INDEX core_sublocation_location_id_672d0dc0 ON public.core_sublocation USING btree (location_id);


--
-- Name: core_subtype_default_tags_subtype_id_399c439a; Type: INDEX; Schema: public; Owner: tidy
--

CREATE INDEX core_subtype_default_tags_subtype_id_399c439a ON public.core_subtype_default_tags USING btree (subtype_id);


--
-- Name: core_subtype_default_tags_tagtype_id_d5044549; Type: INDEX; Schema: public; Owner: tidy
--

CREATE INDEX core_subtype_default_tags_tagtype_id_d5044549 ON public.core_subtype_default_tags USING btree (tagtype_id);


--
-- Name: core_subtype_type_id_cd63f274; Type: INDEX; Schema: public; Owner: tidy
--

CREATE INDEX core_subtype_type_id_cd63f274 ON public.core_subtype USING btree (type_id);


--
-- Name: core_tag_tagType_id_b491ccd3; Type: INDEX; Schema: public; Owner: tidy
--

CREATE INDEX "core_tag_tagType_id_b491ccd3" ON public.core_tag USING btree ("tagType_id");


--
-- Name: core_tagtype_default_subType_id_a56af9e3; Type: INDEX; Schema: public; Owner: tidy
--

CREATE INDEX "core_tagtype_default_subType_id_a56af9e3" ON public.core_tagtype USING btree ("default_subType_id");


--
-- Name: core_tagtype_default_type_id_0d485cb6; Type: INDEX; Schema: public; Owner: tidy
--

CREATE INDEX core_tagtype_default_type_id_0d485cb6 ON public.core_tagtype USING btree (default_type_id);


--
-- Name: core_thing_designated_location_id_26bf85a5; Type: INDEX; Schema: public; Owner: tidy
--

CREATE INDEX core_thing_designated_location_id_26bf85a5 ON public.core_thing USING btree (designated_location_id);


--
-- Name: core_thing_designated_sublocation_id_9607aea0; Type: INDEX; Schema: public; Owner: tidy
--

CREATE INDEX core_thing_designated_sublocation_id_9607aea0 ON public.core_thing USING btree (designated_sublocation_id);


--
-- Name: core_thing_location_id_b60fa818; Type: INDEX; Schema: public; Owner: tidy
--

CREATE INDEX core_thing_location_id_b60fa818 ON public.core_thing USING btree (location_id);


--
-- Name: core_thing_subType_id_073c3532; Type: INDEX; Schema: public; Owner: tidy
--

CREATE INDEX "core_thing_subType_id_073c3532" ON public.core_thing USING btree ("subType_id");


--
-- Name: core_thing_sublocation_id_c7511f01; Type: INDEX; Schema: public; Owner: tidy
--

CREATE INDEX core_thing_sublocation_id_c7511f01 ON public.core_thing USING btree (sublocation_id);


--
-- Name: core_thing_tags_tag_id_8aaa1cd1; Type: INDEX; Schema: public; Owner: tidy
--

CREATE INDEX core_thing_tags_tag_id_8aaa1cd1 ON public.core_thing_tags USING btree (tag_id);


--
-- Name: core_thing_tags_thing_id_e116f59e; Type: INDEX; Schema: public; Owner: tidy
--

CREATE INDEX core_thing_tags_thing_id_e116f59e ON public.core_thing_tags USING btree (thing_id);


--
-- Name: core_thing_type_id_d8f9224a; Type: INDEX; Schema: public; Owner: tidy
--

CREATE INDEX core_thing_type_id_d8f9224a ON public.core_thing USING btree (type_id);


--
-- Name: core_type_default_tags_tagtype_id_b9a360e2; Type: INDEX; Schema: public; Owner: tidy
--

CREATE INDEX core_type_default_tags_tagtype_id_b9a360e2 ON public.core_type_default_tags USING btree (tagtype_id);


--
-- Name: core_type_default_tags_type_id_f114389d; Type: INDEX; Schema: public; Owner: tidy
--

CREATE INDEX core_type_default_tags_type_id_f114389d ON public.core_type_default_tags USING btree (type_id);


--
-- Name: core_type_plane_id_35714b55; Type: INDEX; Schema: public; Owner: tidy
--

CREATE INDEX core_type_plane_id_35714b55 ON public.core_type USING btree (plane_id);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: tidy
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: tidy
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: tidy
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: tidy
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: sequences_sequence_name_667d3102_like; Type: INDEX; Schema: public; Owner: tidy
--

CREATE INDEX sequences_sequence_name_667d3102_like ON public.sequences_sequence USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: tidy
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: tidy
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: tidy
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: tidy
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: tidy
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: tidy
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: tidy
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_house core_house_onwer_id_ef275a14_fk_core_owner_id; Type: FK CONSTRAINT; Schema: public; Owner: tidy
--

ALTER TABLE ONLY public.core_house
    ADD CONSTRAINT core_house_onwer_id_ef275a14_fk_core_owner_id FOREIGN KEY (onwer_id) REFERENCES public.core_owner(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_location core_location_house_id_c75eff55_fk_core_house_id; Type: FK CONSTRAINT; Schema: public; Owner: tidy
--

ALTER TABLE ONLY public.core_location
    ADD CONSTRAINT core_location_house_id_c75eff55_fk_core_house_id FOREIGN KEY (house_id) REFERENCES public.core_house(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_location core_location_thing_id_cfb2f3c2_fk_core_thing_id; Type: FK CONSTRAINT; Schema: public; Owner: tidy
--

ALTER TABLE ONLY public.core_location
    ADD CONSTRAINT core_location_thing_id_cfb2f3c2_fk_core_thing_id FOREIGN KEY (thing_id) REFERENCES public.core_thing(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_sublocation core_sublocation_location_id_672d0dc0_fk_core_location_id; Type: FK CONSTRAINT; Schema: public; Owner: tidy
--

ALTER TABLE ONLY public.core_sublocation
    ADD CONSTRAINT core_sublocation_location_id_672d0dc0_fk_core_location_id FOREIGN KEY (location_id) REFERENCES public.core_location(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_subtype_default_tags core_subtype_default_subtype_id_399c439a_fk_core_subt; Type: FK CONSTRAINT; Schema: public; Owner: tidy
--

ALTER TABLE ONLY public.core_subtype_default_tags
    ADD CONSTRAINT core_subtype_default_subtype_id_399c439a_fk_core_subt FOREIGN KEY (subtype_id) REFERENCES public.core_subtype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_subtype_default_tags core_subtype_default_tagtype_id_d5044549_fk_core_tagt; Type: FK CONSTRAINT; Schema: public; Owner: tidy
--

ALTER TABLE ONLY public.core_subtype_default_tags
    ADD CONSTRAINT core_subtype_default_tagtype_id_d5044549_fk_core_tagt FOREIGN KEY (tagtype_id) REFERENCES public.core_tagtype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_subtype core_subtype_type_id_cd63f274_fk_core_type_id; Type: FK CONSTRAINT; Schema: public; Owner: tidy
--

ALTER TABLE ONLY public.core_subtype
    ADD CONSTRAINT core_subtype_type_id_cd63f274_fk_core_type_id FOREIGN KEY (type_id) REFERENCES public.core_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_tag core_tag_tagType_id_b491ccd3_fk_core_tagtype_id; Type: FK CONSTRAINT; Schema: public; Owner: tidy
--

ALTER TABLE ONLY public.core_tag
    ADD CONSTRAINT "core_tag_tagType_id_b491ccd3_fk_core_tagtype_id" FOREIGN KEY ("tagType_id") REFERENCES public.core_tagtype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_tagtype core_tagtype_default_subType_id_a56af9e3_fk_core_subtype_id; Type: FK CONSTRAINT; Schema: public; Owner: tidy
--

ALTER TABLE ONLY public.core_tagtype
    ADD CONSTRAINT "core_tagtype_default_subType_id_a56af9e3_fk_core_subtype_id" FOREIGN KEY ("default_subType_id") REFERENCES public.core_subtype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_tagtype core_tagtype_default_type_id_0d485cb6_fk_core_type_id; Type: FK CONSTRAINT; Schema: public; Owner: tidy
--

ALTER TABLE ONLY public.core_tagtype
    ADD CONSTRAINT core_tagtype_default_type_id_0d485cb6_fk_core_type_id FOREIGN KEY (default_type_id) REFERENCES public.core_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_thing core_thing_designated_location_id_26bf85a5_fk_core_location_id; Type: FK CONSTRAINT; Schema: public; Owner: tidy
--

ALTER TABLE ONLY public.core_thing
    ADD CONSTRAINT core_thing_designated_location_id_26bf85a5_fk_core_location_id FOREIGN KEY (designated_location_id) REFERENCES public.core_location(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_thing core_thing_designated_sublocati_9607aea0_fk_core_subl; Type: FK CONSTRAINT; Schema: public; Owner: tidy
--

ALTER TABLE ONLY public.core_thing
    ADD CONSTRAINT core_thing_designated_sublocati_9607aea0_fk_core_subl FOREIGN KEY (designated_sublocation_id) REFERENCES public.core_sublocation(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_thing core_thing_location_id_b60fa818_fk_core_location_id; Type: FK CONSTRAINT; Schema: public; Owner: tidy
--

ALTER TABLE ONLY public.core_thing
    ADD CONSTRAINT core_thing_location_id_b60fa818_fk_core_location_id FOREIGN KEY (location_id) REFERENCES public.core_location(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_thing core_thing_subType_id_073c3532_fk_core_subtype_id; Type: FK CONSTRAINT; Schema: public; Owner: tidy
--

ALTER TABLE ONLY public.core_thing
    ADD CONSTRAINT "core_thing_subType_id_073c3532_fk_core_subtype_id" FOREIGN KEY ("subType_id") REFERENCES public.core_subtype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_thing core_thing_sublocation_id_c7511f01_fk_core_sublocation_id; Type: FK CONSTRAINT; Schema: public; Owner: tidy
--

ALTER TABLE ONLY public.core_thing
    ADD CONSTRAINT core_thing_sublocation_id_c7511f01_fk_core_sublocation_id FOREIGN KEY (sublocation_id) REFERENCES public.core_sublocation(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_thing_tags core_thing_tags_tag_id_8aaa1cd1_fk_core_tag_id; Type: FK CONSTRAINT; Schema: public; Owner: tidy
--

ALTER TABLE ONLY public.core_thing_tags
    ADD CONSTRAINT core_thing_tags_tag_id_8aaa1cd1_fk_core_tag_id FOREIGN KEY (tag_id) REFERENCES public.core_tag(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_thing_tags core_thing_tags_thing_id_e116f59e_fk_core_thing_id; Type: FK CONSTRAINT; Schema: public; Owner: tidy
--

ALTER TABLE ONLY public.core_thing_tags
    ADD CONSTRAINT core_thing_tags_thing_id_e116f59e_fk_core_thing_id FOREIGN KEY (thing_id) REFERENCES public.core_thing(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_thing core_thing_type_id_d8f9224a_fk_core_type_id; Type: FK CONSTRAINT; Schema: public; Owner: tidy
--

ALTER TABLE ONLY public.core_thing
    ADD CONSTRAINT core_thing_type_id_d8f9224a_fk_core_type_id FOREIGN KEY (type_id) REFERENCES public.core_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_type_default_tags core_type_default_tags_tagtype_id_b9a360e2_fk_core_tagtype_id; Type: FK CONSTRAINT; Schema: public; Owner: tidy
--

ALTER TABLE ONLY public.core_type_default_tags
    ADD CONSTRAINT core_type_default_tags_tagtype_id_b9a360e2_fk_core_tagtype_id FOREIGN KEY (tagtype_id) REFERENCES public.core_tagtype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_type_default_tags core_type_default_tags_type_id_f114389d_fk_core_type_id; Type: FK CONSTRAINT; Schema: public; Owner: tidy
--

ALTER TABLE ONLY public.core_type_default_tags
    ADD CONSTRAINT core_type_default_tags_type_id_f114389d_fk_core_type_id FOREIGN KEY (type_id) REFERENCES public.core_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_type core_type_plane_id_35714b55_fk_core_plane_id; Type: FK CONSTRAINT; Schema: public; Owner: tidy
--

ALTER TABLE ONLY public.core_type
    ADD CONSTRAINT core_type_plane_id_35714b55_fk_core_plane_id FOREIGN KEY (plane_id) REFERENCES public.core_plane(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: tidy
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: tidy
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

