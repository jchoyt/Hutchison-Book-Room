--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
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
-- Name: book; Type: TABLE; Schema: public; Owner: postgres; Tablespace:
--

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
    keyword text  DEFAULT ''::text,
    series text  DEFAULT ''::text,
    big_book boolean DEFAULT false
);


ALTER TABLE public.book OWNER TO postgres;

--
-- Name: book_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE book_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.book_id_seq OWNER TO postgres;

--
-- Name: book_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE book_id_seq OWNED BY book.id;


--
-- Name: book_log; Type: TABLE; Schema: public; Owner: postgres; Tablespace:
--

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
    series text,
    modified timestamp without time zone DEFAULT now(),
    modified_by text
);


ALTER TABLE public.book_log OWNER TO postgres;

--
-- Name: colors; Type: TABLE; Schema: public; Owner: postgres; Tablespace:
--

CREATE TABLE colors (
    id integer NOT NULL,
    color text
);


ALTER TABLE public.colors OWNER TO postgres;

--
-- Name: colors_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE colors_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.colors_id_seq OWNER TO postgres;

--
-- Name: colors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE colors_id_seq OWNED BY colors.id;


--
-- Name: genres; Type: TABLE; Schema: public; Owner: postgres; Tablespace:
--

CREATE TABLE genres (
    id integer NOT NULL,
    code text,
    name text
);


ALTER TABLE public.genres OWNER TO postgres;

--
-- Name: genres_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE genres_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.genres_id_seq OWNER TO postgres;

--
-- Name: genres_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE genres_id_seq OWNED BY genres.id;


--
-- Name: graphs; Type: TABLE; Schema: public; Owner: postgres; Tablespace:
--

CREATE TABLE graphs (
    graphid integer NOT NULL,
    userid character varying(100) NOT NULL
);


ALTER TABLE public.graphs OWNER TO postgres;

--
-- Name: label_sql; Type: TABLE; Schema: public; Owner: postgres; Tablespace:
--

CREATE TABLE label_sql (
    table_name character varying(200) NOT NULL,
    sql_clause character varying(2000)
);


ALTER TABLE public.label_sql OWNER TO postgres;

--
-- Name: latticegroup; Type: TABLE; Schema: public; Owner: postgres; Tablespace:
--

CREATE TABLE latticegroup (
    latticegroupid character varying(50) NOT NULL,
    latticegroupname character varying(50),
    latticegroupdesc character varying(200),
    CONSTRAINT latticegroup_latticegroupid_check CHECK ((latticegroupid IS NOT NULL))
);


ALTER TABLE public.latticegroup OWNER TO postgres;

--
-- Name: people; Type: TABLE; Schema: public; Owner: postgres; Tablespace:
--

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


ALTER TABLE public.people OWNER TO postgres;

--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY book ALTER COLUMN id SET DEFAULT nextval('book_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY colors ALTER COLUMN id SET DEFAULT nextval('colors_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY genres ALTER COLUMN id SET DEFAULT nextval('genres_id_seq'::regclass);


--
-- Name: colors_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace:
--

ALTER TABLE ONLY colors
    ADD CONSTRAINT colors_pkey PRIMARY KEY (id);


--
-- Name: genres_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace:
--

ALTER TABLE ONLY genres
    ADD CONSTRAINT genres_pkey PRIMARY KEY (id);


--
-- Name: graphs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace:
--

ALTER TABLE ONLY graphs
    ADD CONSTRAINT graphs_pkey PRIMARY KEY (graphid, userid);


--
-- Name: label_sql_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace:
--

ALTER TABLE ONLY label_sql
    ADD CONSTRAINT label_sql_pkey PRIMARY KEY (table_name);


--
-- Name: latticegroup_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace:
--

ALTER TABLE ONLY latticegroup
    ADD CONSTRAINT latticegroup_pkey PRIMARY KEY (latticegroupid);


--
-- Name: people_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace:
--

ALTER TABLE ONLY people
    ADD CONSTRAINT people_pkey PRIMARY KEY (email);


--
-- Name: color_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY book
    ADD CONSTRAINT color_fkey FOREIGN KEY (color) REFERENCES colors(id);


--
-- Name: genre_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY book
    ADD CONSTRAINT genre_fkey FOREIGN KEY (genre) REFERENCES genres(id);


--
-- Name: people_latticegroupid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY people
    ADD CONSTRAINT people_latticegroupid_fkey FOREIGN KEY (latticegroupid) REFERENCES latticegroup(latticegroupid);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;
GRANT ALL ON SCHEMA public TO webuser;


--
-- Name: book; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE book FROM PUBLIC;
REVOKE ALL ON TABLE book FROM postgres;
GRANT ALL ON TABLE book TO postgres;
GRANT ALL ON TABLE book TO webuser;


--
-- Name: book_id_seq; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON SEQUENCE book_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE book_id_seq FROM postgres;
GRANT ALL ON SEQUENCE book_id_seq TO postgres;
GRANT ALL ON SEQUENCE book_id_seq TO webuser;


--
-- Name: book_log; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE book_log FROM PUBLIC;
REVOKE ALL ON TABLE book_log FROM postgres;
GRANT ALL ON TABLE book_log TO postgres;
GRANT ALL ON TABLE book_log TO webuser;


--
-- Name: colors; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE colors FROM PUBLIC;
REVOKE ALL ON TABLE colors FROM postgres;
GRANT ALL ON TABLE colors TO postgres;
GRANT ALL ON TABLE colors TO webuser;


--
-- Name: colors_id_seq; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON SEQUENCE colors_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE colors_id_seq FROM postgres;
GRANT ALL ON SEQUENCE colors_id_seq TO postgres;
GRANT ALL ON SEQUENCE colors_id_seq TO webuser;


--
-- Name: genres; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE genres FROM PUBLIC;
REVOKE ALL ON TABLE genres FROM postgres;
GRANT ALL ON TABLE genres TO postgres;
GRANT ALL ON TABLE genres TO webuser;


--
-- Name: genres_id_seq; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON SEQUENCE genres_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE genres_id_seq FROM postgres;
GRANT ALL ON SEQUENCE genres_id_seq TO postgres;
GRANT ALL ON SEQUENCE genres_id_seq TO webuser;


--
-- Name: graphs; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE graphs FROM PUBLIC;
REVOKE ALL ON TABLE graphs FROM postgres;
GRANT ALL ON TABLE graphs TO postgres;
GRANT ALL ON TABLE graphs TO webuser;


--
-- Name: label_sql; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE label_sql FROM PUBLIC;
REVOKE ALL ON TABLE label_sql FROM postgres;
GRANT ALL ON TABLE label_sql TO postgres;
GRANT ALL ON TABLE label_sql TO webuser;


--
-- Name: latticegroup; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE latticegroup FROM PUBLIC;
REVOKE ALL ON TABLE latticegroup FROM postgres;
GRANT ALL ON TABLE latticegroup TO postgres;
GRANT ALL ON TABLE latticegroup TO webuser;


--
-- Name: people; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE people FROM PUBLIC;
REVOKE ALL ON TABLE people FROM postgres;
GRANT ALL ON TABLE people TO postgres;
GRANT ALL ON TABLE people TO webuser;


--
-- PostgreSQL database dump complete
--

