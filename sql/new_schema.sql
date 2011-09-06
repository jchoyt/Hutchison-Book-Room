
CREATE TABLE book (
    id integer NOT NULL,
    title text NOT NULL,
    author text DEFAULT ''::text,
    genre integer DEFAULT 1,
    color integer,
    box text,
    copy_count integer,
    minlevel integer,
    maxlevel integer,
    word_count text,
    keyword text
);

CREATE TABLE book_log (
    id integer NOT NULL,
    title text NOT NULL,
    author text DEFAULT ''::text,
    genre integer DEFAULT 1,
    color integer,
    box text,
    copy_count integer,
    minlevel integer,
    maxlevel integer,
    word_count text,
    keyword text,
    modified timestamp default now(),
    modified_by text
);

CREATE SEQUENCE book_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;

ALTER SEQUENCE book_id_seq OWNED BY book.id;

SELECT pg_catalog.setval('book_id_seq1', 27633, true);

CREATE TABLE colors (
    id integer NOT NULL,
    color text
);

CREATE SEQUENCE colors_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;

ALTER SEQUENCE colors_id_seq OWNED BY colors.id;

SELECT pg_catalog.setval('colors_id_seq', 9, true);

CREATE TABLE genres (
    id integer NOT NULL,
    code text,
    name text
);

CREATE SEQUENCE genres_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;

ALTER SEQUENCE genres_id_seq OWNED BY genres.id;

SELECT pg_catalog.setval('genres_id_seq', 4, true);

CREATE TABLE graphs (
    graphid integer NOT NULL,
    userid character varying(100) NOT NULL
);

CREATE TABLE label_sql (
    table_name character varying(200) NOT NULL,
    sql_clause character varying(2000)
);

CREATE TABLE latticegroup (
    latticegroupid character varying(50) NOT NULL,
    latticegroupname character varying(50),
    latticegroupdesc character varying(200),
    CONSTRAINT latticegroup_latticegroupid_check CHECK ((latticegroupid IS NOT NULL))
);

CREATE TABLE people (
    email character varying(100) NOT NULL,
    peopletypeid integer,
    password character varying(100),
    latticegroupid character varying(50),
    firstname character varying(50),
    lastname character varying(75),
    company character varying(100),
    department character varying(50),
    address character varying(300),
    city character varying(50),
    state character varying(50),
    zip character varying(10),
    country character varying(50),
    validationcode character varying(12),
    validated character varying(1),
    CONSTRAINT people_email_check CHECK ((email IS NOT NULL))
);

ALTER TABLE book ALTER COLUMN id SET DEFAULT nextval('book_id_seq'::regclass);

ALTER TABLE colors ALTER COLUMN id SET DEFAULT nextval('colors_id_seq'::regclass);

ALTER TABLE genres ALTER COLUMN id SET DEFAULT nextval('genres_id_seq'::regclass);
COPY book_orig (id, title, author, f, color, box, copy_count, level, word_count, keyword) FROM stdin;
1	Test	Me and you	F	Lime	1	5	3	34	none
\.

COPY colors (id, color) FROM stdin;
1	Dark Blue
2	Green
3	Light Blue
4	Lime
5	Neon Red
6	Orange
7	Purple
8	Red
9	Yellow
\.

COPY genres (id, code, name) FROM stdin;
1	F	Fiction
2	NF	Non Fiction
3	FF	Folklore and Fairytales
4	RT	Reading Theatre
\.

COPY latticegroup (latticegroupid, latticegroupname, latticegroupdesc) FROM stdin;
Public	Public	All users can see the data in this COI - it is the most open, and also the most risky
\.

COPY people (email, peopletypeid, password, latticegroupid, firstname, lastname, company, department, address, city, state, zip, country, validationcode, validated) FROM stdin;
admin@mitre.org	3	XPERsFUdQRgrVI/si2Fv1ROAJ3X4BnOredragQ==	Public	\N	\N	\N	\N	\N	\N	\N	\N	\N	still fake	Y
\.

ALTER TABLE ONLY colors
    ADD CONSTRAINT colors_pkey PRIMARY KEY (id);

ALTER TABLE ONLY genres
    ADD CONSTRAINT genres_pkey PRIMARY KEY (id);

ALTER TABLE ONLY graphs
    ADD CONSTRAINT graphs_pkey PRIMARY KEY (graphid, userid);

ALTER TABLE ONLY label_sql
    ADD CONSTRAINT label_sql_pkey PRIMARY KEY (table_name);

ALTER TABLE ONLY latticegroup
    ADD CONSTRAINT latticegroup_pkey PRIMARY KEY (latticegroupid);

ALTER TABLE ONLY people
    ADD CONSTRAINT people_pkey PRIMARY KEY (email);

ALTER TABLE ONLY book
    ADD CONSTRAINT color_fkey FOREIGN KEY (color) REFERENCES colors(id);

ALTER TABLE ONLY book
    ADD CONSTRAINT genre_fkey FOREIGN KEY (genre) REFERENCES genres(id);

ALTER TABLE ONLY people
    ADD CONSTRAINT people_latticegroupid_fkey FOREIGN KEY (latticegroupid) REFERENCES latticegroup(latticegroupid);


