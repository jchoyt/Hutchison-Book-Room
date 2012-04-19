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
-- Name: book; Type: TABLE; Schema: public; Owner: jchoyt; Tablespace: 
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
    keyword text,
    series_tmp text
);


ALTER TABLE public.book OWNER TO jchoyt;

--
-- Name: book_id_seq; Type: SEQUENCE; Schema: public; Owner: jchoyt
--

CREATE SEQUENCE book_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.book_id_seq OWNER TO jchoyt;

--
-- Name: book_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jchoyt
--

ALTER SEQUENCE book_id_seq OWNED BY book.id;


--
-- Name: book_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jchoyt
--

SELECT pg_catalog.setval('book_id_seq', 723, true);


--
-- Name: book_log; Type: TABLE; Schema: public; Owner: jchoyt; Tablespace: 
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
    series_tmp text,
    modified timestamp without time zone DEFAULT now(),
    modified_by text
);


ALTER TABLE public.book_log OWNER TO jchoyt;

--
-- Name: colors; Type: TABLE; Schema: public; Owner: jchoyt; Tablespace: 
--

CREATE TABLE colors (
    id integer NOT NULL,
    color text
);


ALTER TABLE public.colors OWNER TO jchoyt;

--
-- Name: colors_id_seq; Type: SEQUENCE; Schema: public; Owner: jchoyt
--

CREATE SEQUENCE colors_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.colors_id_seq OWNER TO jchoyt;

--
-- Name: colors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jchoyt
--

ALTER SEQUENCE colors_id_seq OWNED BY colors.id;


--
-- Name: colors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jchoyt
--

SELECT pg_catalog.setval('colors_id_seq', 9, true);


--
-- Name: genres; Type: TABLE; Schema: public; Owner: jchoyt; Tablespace: 
--

CREATE TABLE genres (
    id integer NOT NULL,
    code text,
    name text
);


ALTER TABLE public.genres OWNER TO jchoyt;

--
-- Name: genres_id_seq; Type: SEQUENCE; Schema: public; Owner: jchoyt
--

CREATE SEQUENCE genres_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.genres_id_seq OWNER TO jchoyt;

--
-- Name: genres_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jchoyt
--

ALTER SEQUENCE genres_id_seq OWNED BY genres.id;


--
-- Name: genres_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jchoyt
--

SELECT pg_catalog.setval('genres_id_seq', 4, true);


--
-- Name: graphs; Type: TABLE; Schema: public; Owner: jchoyt; Tablespace: 
--

CREATE TABLE graphs (
    graphid integer NOT NULL,
    userid character varying(100) NOT NULL
);


ALTER TABLE public.graphs OWNER TO jchoyt;

--
-- Name: label_sql; Type: TABLE; Schema: public; Owner: jchoyt; Tablespace: 
--

CREATE TABLE label_sql (
    table_name character varying(200) NOT NULL,
    sql_clause character varying(2000)
);


ALTER TABLE public.label_sql OWNER TO jchoyt;

--
-- Name: latticegroup; Type: TABLE; Schema: public; Owner: jchoyt; Tablespace: 
--

CREATE TABLE latticegroup (
    latticegroupid character varying(50) NOT NULL,
    latticegroupname character varying(50),
    latticegroupdesc character varying(200),
    CONSTRAINT latticegroup_latticegroupid_check CHECK ((latticegroupid IS NOT NULL))
);


ALTER TABLE public.latticegroup OWNER TO jchoyt;

--
-- Name: people; Type: TABLE; Schema: public; Owner: jchoyt; Tablespace: 
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


ALTER TABLE public.people OWNER TO jchoyt;

--
-- Name: id; Type: DEFAULT; Schema: public; Owner: jchoyt
--

ALTER TABLE book ALTER COLUMN id SET DEFAULT nextval('book_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: jchoyt
--

ALTER TABLE colors ALTER COLUMN id SET DEFAULT nextval('colors_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: jchoyt
--

ALTER TABLE genres ALTER COLUMN id SET DEFAULT nextval('genres_id_seq'::regclass);


--
-- Data for Name: book; Type: TABLE DATA; Schema: public; Owner: jchoyt
--

COPY book (id, title, author, genre, color, box, copy_count, minlevel, maxlevel, word_count, keyword, series_tmp) FROM stdin;
363	Baby	Rigby	1	1	1	11	1	1	24	\N	\N
364	Balloons	Rigby	1	1	1	8	1	1	57	\N	\N
365	The Play	Rigby	1	1	1	14	1	1	52	\N	\N
366	Up in the sky	Rigby	1	1	1	11	1	1	56	\N	\N
367	Fruit Salad	Literacy Tree	1	1	2	22	1	1	23	\N	\N
368	Ouch!	Rigby	1	1	2	32	1	1	40	\N	\N
369	What Are You?	Literacy Tree	1	1	2	24	1	1	27	\N	\N
370	Who Likes Ice Cream	Rigby	1	1	2	25	1	1	15	\N	\N
371	In the Garden	Rigby PM Plus	1	1	3	11	1	1	32	\N	\N
372	Look at the house	Rigby PM Plus	1	1	3	13	1	1	53	\N	\N
373	Going on Vacation	Rigby PM Plus	1	1	4	17	1	1	40	\N	\N
374	I am running	Rigby PM Plus	1	1	4	10	1	1	24	\N	\N
375	We dress up	Rigby	1	1	4	11	1	1	56	\N	\N
376	Here's a House	Wright Group	1	1	5	7	1	1	32	\N	\N
377	Naughty Kitten	Rigby Smart Start	1	1	5	3	1	1	18	\N	\N
378	The Farm	Rigby Smart Start	1	1	5	5	1	1	14	\N	\N
379	The Farm	Literacy Tree	1	1	5	22	1	1	14	\N	\N
380	In the shopping cart	Rigby	1	1	6	9	1	1	24	\N	\N
381	Little things	Rigby	1	1	6	16	1	1	33	\N	\N
382	The Amazing Race	Rigby	1	1	6	7	1	1	28	\N	\N
383	Time for dinner	Rigby Smart Start	1	1	6	7	1	1	15	\N	\N
384	A Dog Day	Rigby Smart Start	1	1	7	1	1	1	23	\N	\N
385	Going to School	Rigby	1	1	7	6	1	1	21	\N	\N
386	In the Supermarket	Rigby	1	1	7	8	1	1	24	\N	\N
387	My Planet	Rigby	1	1	7	6	1	1	28	\N	\N
388	The Robot	Rigby Smart Start	1	1	7	5	1	1	18	\N	\N
389	Treasure Hunt	Rigby	1	1	7	9	1	1	14	\N	\N
390	Under the Bed	Rigby Smart Start	1	1	7	7	1	1	28	\N	\N
391	What A Mess	Rigby	1	1	7	6	1	1	14	\N	\N
392	A Zoo	Literacy Tree	1	1	8	20	1	1	14	\N	\N
393	The Royal Family	Seedling Pub	1	1	8	6	1	2	17	\N	\N
394	Where is Gabby?	Pioneer Valley	1	1	8	4	1	1	21	\N	\N
395	Dad	Rigby PM Collection	1	1	9	13	1	1	24	\N	\N
396	Deep in the Forest	Houghton Mifflin	1	1	9	5	1	1	0	\N	\N
397	Me	Rigby PM Collection	1	1	9	9	1	1	24	\N	\N
398	Mom	Rigby PM Collection	1	1	9	13	1	1	24	\N	\N
399	Moms and Dads	Rigby	1	1	9	12	1	1	36	\N	\N
400	In our classroom	Rigby PM,	1	1	10	7	1	1	33	\N	\N
401	Playing	Rigby	1	1	10	9	1	1	39	\N	\N
402	Splash	Wright Group	1	1	10	4	1	1	34	\N	\N
403	Baby Animals at Home	Wright Group	1	1	11	4	1	2	44	\N	\N
404	Christmas	Rigby Smart Start	1	1	11	8	1	1	16	\N	\N
405	I Like Balloons	Dominie ,	1	1	11	3	2	2	27	\N	\N
406	I Read	Dominie ,	1	1	11	5	2	2	38	\N	\N
407	James is Hiding	Windmill Books	1	1	11	2	1	1	24	\N	\N
408	My Class	Seedling Pub	1	1	11	14	1	2	14	\N	\N
409	Our School	Houghton Mifflin	1	1	11	3	1	2	12	\N	\N
410	The Surprise Inside	Houghton Mifflin	1	1	11	6	1	1	14	\N	\N
411	Winter Fun	Dominie ,	1	1	11	2	1	1	13	\N	\N
412	Rosie Likes Pink	Pioneer Valley	1	1	12	6	1	1	24	\N	Bella and Rosie
413	Dinner Time for Bella and Rosie	Pioneer Valley	1	1	12	6	1	1	31	\N	Bella and Rosie
414	Looking Out	Pioneer Valley	1	1	12	6	1	1	27	\N	Bella and Rosie
499	The Race	Windmill Books	1	1	39	5	2	2	54	\N	\N
415	Dressing-Up	Rigby PM Starters One	1	1	12	24	1	1	32	\N	\N
416	Pets	Rigby	1	1	12	8	1	1	33	\N	\N
417	A House	Rigby	1	1	13	16	1	1	32	\N	\N
418	My Glasses	Dominie Press	1	1	13	6	1	1	28	\N	\N
419	On the Line	Dominie Press	1	1	13	6	1	1	35	\N	\N
420	I Can Paint	Wright Group	1	1	14	2	1	1	35	\N	\N
421	The Car Ride	Sundance	1	1	14	8	1	1	41	\N	\N
422	The Circus Train	Sundance	1	1	14	8	1	1	48	\N	\N
423	When The Circus Comes To Town	Sundance	1	1	14	9	1	1	40	\N	\N
424	My Box	Rigby	1	1	15	7	1	1	30	\N	\N
425	Snowman	Rigby	1	1	15	1	1	1	14	\N	\N
426	Socks	Rigby	1	1	15	8	1	1	21	\N	\N
427	The Clown	Rigby Smart Start	1	1	15	8	1	1	13	\N	\N
428	Weather	Rigby	1	1	15	9	1	1	14	\N	\N
429	What Did Ben Want?	Rigby	1	1	15	8	1	1	28	\N	\N
430	Where Is My Pet?	Rigby	1	1	15	8	1	1	34	\N	\N
431	Big things	Rigby PM,	1	1	16	11	1	1	33	\N	\N
432	Look at Pickles	Pioneer Valley	1	1	16	12	2	2	29	\N	Pickles
433	Bella's Busy Day	Pioneer Valley	1	1	17	6	2	2	36	\N	Bella and Rosie
434	Snow Fun	Pioneer Valley	1	1	17	6	2	2	37	\N	Bella and Rosie
435	Playing Together	Pioneer Valley	1	1	17	6	2	2	66	\N	Bella and Rosie
436	Food for Jasper	Pioneer Valley	1	1	17	6	2	2	28	\N	Jasper the Cat
437	Where are the babies?	Rigby PM,	1	1	18	51	2	2	81	\N	\N
438	Cat and Mouse	Rigby PM,	1	1	19	43	2	2	75	\N	\N
439	Ball games	Rigby	1	1	20	45	2	2	88	\N	\N
440	Climbing	Rigby PM,	1	1	21	9	2	2	48	\N	\N
441	One Day	Dominie Press	1	1	22	5	2	2	48	\N	\N
442	Recess	Dominie Press	1	1	22	6	2	2	24	\N	\N
443	The Ball Game	Literacy 2000,	1	1	22	4	2	2	16	\N	\N
444	The skier	Rigby	1	1	22	13	2	2	42	\N	\N
445	Too Much	Dominie Press	1	1	22	3	2	2	27	\N	\N
446	Two Plus Two	Dominie Press	1	1	22	4	2	2	44	\N	\N
447	We go out	Rigby PM,	1	1	22	7	1	1	41	\N	\N
448	Stop!	Rigby	1	1	23	42	2	2	90	\N	\N
449	After the Rain	Literacy Tree	1	1	24	13	2	2	48	\N	\N
450	I am Climbing	Literacy Tree	1	1	24	18	2	2	22	\N	\N
451	In the Sand	Literacy Tree	1	1	24	15	2	2	39	\N	\N
452	The Machine	Literacy Tree	1	1	24	19	2	2	30	\N	\N
453	The Treasure Hunt	Literacy Tree	1	1	24	14	2	2	27	\N	\N
454	The rock pools	Rigby PM,	1	1	25	55	2	2	49	\N	\N
455	Big and Little	Rigby	1	1	26	11	2	2	68	\N	\N
456	My Clothes	Rigby	1	1	26	16	2	2	36	\N	\N
457	My Little Cat	Rigby	1	1	26	13	2	2	57	\N	\N
458	The Toy Box	Rigby PM Plus	1	1	26	6	2	2	49	\N	\N
459	Up and Down	Rigby PM Plus	1	1	26	4	2	2	81	\N	\N
460	Catching	Dominie Press	1	1	27	7	2	2	35	\N	\N
461	Colors In the City	Kaeden Group	1	1	27	2	2	2	61	\N	\N
462	Eating	Wright	1	1	27	6	2	2	29	\N	\N
463	I Can Make Music	Sundance	1	1	27	7	2	2	41	\N	\N
464	Off to Work	Literacy 2000,	1	1	27	2	2	2	41	\N	\N
465	The Clown	Kaeden Group	1	1	27	4	2	2	29	\N	\N
466	The shopping mall	Rigby PM,	1	1	27	9	2	2	44	\N	\N
467	What Can Fly	Literacy 2000,	1	1	27	2	2	2	28	\N	\N
468	Happy Holidays	Dominie Press	1	1	28	5	2	2	27	\N	\N
469	Who Reads?	Dominie Press	1	1	28	6	2	2	25	\N	\N
470	Who's Coming for a Ride?	Literacy 2000,	1	1	28	5	2	2	25	\N	\N
471	Sally's new shoes	Rigby PM,	1	1	29	44	2	2	58	\N	\N
472	Packing my bag	Rigby PM,	1	1	30	40	2	2	52	\N	\N
473	The Pencil	Rigby	1	1	31	41	2	2	97	\N	\N
474	Ben's Red Car	Rigby	1	1	32	52	2	2	49	\N	\N
475	Blue Day	Literacy Tree	1	1	33	35	2	3	35	\N	\N
476	Camping	Literacy Tree	1	1	33	19	2	2	19	\N	\N
477	Who's Coming for a Ride?	Literacy 2000,	1	1	33	28	2	2	25	\N	\N
478	Follow the leader	Windmill Books	1	1	34	3	2	2	15	\N	\N
479	Rain	Dominie ,	1	1	34	2	2	2	52	\N	\N
480	Too Much	Dominie Press	1	1	34	4	2	2	27	\N	\N
481	Where Are the Car Keys	Windmill Books	1	1	34	5	2	2	41	\N	\N
482	Where Can Kitty Sleep?	Windmill Books	1	1	34	3	2	2	15	\N	\N
483	Who Wears This Hat	WrightGroup	1	1	34	7	2	2	42	\N	\N
484	Party Hats	Rigby	1	1	35	15	2	2	72	\N	\N
485	Playing Outside	Rigby	1	1	35	12	2	2	56	\N	\N
486	The Parade	Rigby PM plus	1	1	35	14	2	2	35	\N	\N
487	Big Sea Animals	Rigby	1	1	36	12	2	2	79	\N	\N
488	Going Out	Rigby	1	1	36	14	2	2	48	\N	\N
489	My Sand Castle	Rigby	1	1	36	15	2	2	44	\N	\N
490	A Little Seed	Rigby	1	1	37	8	2	2	18	\N	\N
491	Books	Rigby	1	1	37	9	2	2	21	\N	\N
492	Dinosaur Party	Rigby	1	1	37	8	2	2	25	\N	\N
493	In the Bathroom	Rigby	1	1	37	8	2	2	24	\N	\N
494	The Iron Horse	Rigby	1	1	37	8	2	2	21	\N	\N
495	The Model	Rigby	1	1	37	8	2	2	18	\N	\N
496	The Robber	Rigby	1	1	37	8	2	2	25	\N	\N
497	Out in the weather	Rigby PM,	1	1	38	48	2	2	56	\N	\N
498	Show and Tell	Literacy Tree	1	1	39	18	2	2	32	\N	\N
500	The Surprise Party	Literacy Tree	1	1	39	12	2	2	85	\N	\N
501	Dressing Up	Rigby Smart Start	1	1	40	9	2	2	25	\N	\N
502	Hide and seek	Rigby Smart Start	1	1	40	6	2	2	38	\N	\N
503	My Home	Rigby	1	1	40	9	2	2	23	\N	\N
504	On the Beach	Rigby	1	1	40	6	3	3	28	\N	\N
505	The Animals Went to Bed	Rigby	1	1	40	8	2	2	32	\N	\N
506	The Puzzle	Rigby Smart Start	1	1	40	7	2	2	32	\N	\N
507	The Boat Ride	PM Stars	1	1	41	12	2	3	38	\N	Little Teddy
508	The Big Hole	PM Stars	1	1	41	12	2	3	39	\N	The Toy Town
509	Dad's Ship	PM Stars	1	1	41	12	2	3	42	\N	Ben
510	Sally and the Leaves	PM Stars	1	1	42	12	2	3	55	\N	Sally
511	Hello, Bingo!	PM Stars	1	1	42	12	2	3	42	\N	Sam and Bingo
512	Sally and the Elephant	PM Stars	1	1	42	12	2	3	50	\N	Sally
513	Look at me	Rigby	1	1	43	13	2	2	48	\N	\N
514	The way I go to school	Rigby	1	1	43	11	2	2	53	\N	\N
515	A Yummy Lunch	Pioneer Valley	1	1	44	1	2	2	22	\N	\N
516	Gabby Goes Up and Down	Pioneer Valley	1	1	44	6	2	2	42	\N	\N
517	Gabby Visits Buster	Pioneer Valley	1	1	44	5	2	2	55	\N	\N
518	Over the Bridge	Sundance	1	1	44	13	2	2	50	\N	\N
519	We went To The Zoo	Sundance	1	1	44	7	2	2	32	\N	\N
520	Don't Wake the Baby	Literacy Tree	1	1	45	28	2	2	18	\N	\N
521	A Scrumptious Sundae	Literacy Tree	1	1	45	9	2	2	17	\N	\N
522	The Giant's Breakfast	Literacy Tree	1	1	45	32	2	2	42	\N	\N
523	Dreaming	Rigby	1	1	46	7	2	2	23	\N	\N
524	Our House	Literacy Tree	1	1	46	17	2	2	25	\N	\N
525	The Bath	Rigby Smart Start	1	1	46	1	2	2	28	\N	\N
526	At the Zoo	Rigby	1	1	47	8	2	2	40	\N	\N
527	The go-carts	Rigby	1	1	47	11	2	2	46	\N	\N
528	Time for dinner	Rigby PM Collection	1	1	47	12	2	2	38	\N	\N
529	All of Me	Literacy 2000,	1	1	48	4	2	2	25	\N	\N
530	Dear Santa	Literacy Tree	1	1	48	30	2	2	49	\N	\N
531	Jack-o-lantern	Twig Books	1	1	48	4	2	2	37	Autumn	\N
532	Our Baby	Literacy Tree	1	1	48	27	2	2	14	\N	\N
533	Jack's Road	PM Stars	1	1	49	12	2	3	59	\N	Jack and Billy
534	Matthew and Emma	PM Stars	1	1	49	12	2	3	49	\N	Matthew and Emma
535	Bubbles in the Sky	PM Stars	1	1	49	12	2	3	57	\N	Max and Grandpa
536	We can run	Rigby PM,	1	1	50	46	3	3	77	\N	\N
537	Monkey's Friends	Literacy Tree	1	1	51	11	3	3	36	\N	\N
538	Little Chimp	Rigby PM,	1	1	51	12	3	3	52	\N	Little Chimp
539	The Big Bone	Pioneer Valley	1	1	51	6	3	3	78	\N	Jack and Daisy
540	Teddy Bear's Picnic	PM Stars	1	1	51	12	3	3	66	\N	Little Teddy
541	I Like	Literacy Tree	1	1	52	17	3	3	24	\N	\N
542	Teeny Tiny Tina	Literacy 2000,	1	1	52	28	3	3	34	\N	\N
543	Fishing	Rigby	1	1	53	30	3	3	63	\N	\N
544	A Birthday Cake for Ben	Rigby	1	1	53	20	3	3	71	\N	\N
545	Animals	Rigby Smart Start	1	1	54	7	3	3	28	\N	\N
546	Be Quiet	Rigby	1	1	54	8	3	3	25	\N	\N
547	Breakfast for Pickles	Pioneer Valley	1	1	54	12	3	3	62	\N	Pickles
548	Lost!	Rigby	1	1	54	8	3	3	18	\N	\N
549	Spooky Pet	Rigby	1	1	54	9	3	3	24	\N	\N
550	Tim's Paintings	Rigby	1	1	54	6	3	3	32	\N	\N
551	Four ice creams	Rigby	1	1	55	39	3	3	61	\N	\N
552	The Sun and the Moon	PM Stars	1	1	55	12	2	3	41	\N	\N
553	The photo book	Rigby PM,	1	1	55	20	3	3	76	\N	Kate, James, and Nick
554	Looking down	Rigby	1	1	56	35	3	3	70	\N	\N
555	Going to Work	Literacy Tree	1	1	57	24	3	4	58	\N	\N
556	Jump into Bed	Literacy Tree	1	1	57	18	3	4	51	\N	\N
557	Oh, Fiddlesticks!	Literacy Tree	1	1	57	5	3	3	60	\N	\N
558	Our Shadows	Literacy Tree	1	1	57	20	3	3	54	\N	\N
559	My Accident	Rigby	1	1	58	47	3	3	49	\N	\N
560	At the Farm	Sundance	1	1	59	16	3	3	52	\N	\N
561	At the Zoo	Sundance	1	1	59	5	3	4	73	\N	\N
562	In My Bed	Literacy Tree	1	1	59	27	3	4	57	\N	\N
563	On Our Street	Sundance	1	1	59	6	3	4	52	\N	\N
564	Shopping	Sundance	1	1	59	10	3	4	78	\N	\N
565	Nests	Wright Group	1	1	60	4	3	3	35	\N	\N
566	New Shoes	WrightGroup	1	1	60	9	3	3	29	\N	\N
567	One Bee Got on the Bus	Ready Readers	1	1	60	5	3	4	43	\N	\N
568	Sally and the Daisy	Rigby	1	1	60	31	3	3	60	\N	\N
569	That Fly	Ready Readers	1	1	60	6	3	3	26	\N	\N
570	What's the Time, Mr. Wolf?	Rigby	1	1	60	6	3	3	49	\N	\N
571	Bath Time	Wright Group	1	1	61	10	3	3	23	\N	\N
572	Fun in the Snow	Footprints	1	1	61	11	3	3	56	\N	Bella and Rosie
573	Getting There	Wright Group	1	1	61	5	3	3	36	\N	\N
574	Going to the Beach	Sundance	1	1	61	4	3	4	44	\N	\N
575	On Safari	Rigby	1	1	61	5	3	3	28	\N	\N
576	What I Like at School	Sundance	1	1	61	4	3	4	64	\N	\N
577	Places	Sundance	1	1	61	8	3	4	88	\N	\N
578	Places	Dominie Collection	1	1	61	5	3	4	76	\N	\N
579	Baby Lamb's first drink	Rigby PM,	1	1	62	27	3	3	64	\N	\N
580	Frogs Can Jump	The Wright Group	1	1	62	6	3	3	41	\N	\N
581	Sam and Bingo	Rigby	1	1	62	2	3	3	53	\N	\N
582	Sam's Balloon	Rigby	1	1	62	2	3	3	54	\N	\N
583	Can you see the eggs	Rigby PM,	1	1	63	38	3	3	87	\N	\N
584	Champions	Twig Books	1	1	64	8	3	3	13	\N	\N
585	Don't Leave Anything Behind!	Rigby	1	1	64	26	3	3	22	\N	\N
586	Grocery Shopping	Kaeden Group	1	1	64	3	3	3	34	\N	\N
587	Under My Bed	Literacy 2000,	1	1	64	6	3	3	42	\N	\N
588	Cat Food	Rigby	1	1	65	19	3	3	35	\N	\N
589	My Little Dog	Literacy Tree	1	1	65	19	3	3	102	\N	\N
590	The little snowman	Rigby PM,	1	1	65	14	3	3	59	\N	\N
591	The big kick	Rigby PM,	1	1	66	25	3	3	67	\N	\N
592	Wake Up, Dad	Rigby PM,	1	1	66	28	3	3	67	\N	Kate, James, and Nick
593	Hat Trick	Literacy Tree	1	1	67	33	3	3	38	\N	\N
594	I Can Do It Myself	Literacy Tree	1	1	67	30	3	3	37	\N	\N
595	Dressing Up	Literacy 2000,	1	1	68	34	3	3	31	\N	\N
596	Here's What I Made	Literacy 2000,	1	1	68	33	3	3	38	\N	\N
597	Row Your Boat	Rigby	1	1	68	4	3	4	18	\N	\N
598	Too Many Clothes	Literacy Tree	1	1	68	14	3	3	31	\N	\N
599	What Did Kim Catch?	Rigby	1	1	68	31	3	4	48	\N	\N
600	Filbert The Fly	Literacy Tree	1	1	69	10	3	4	28	\N	\N
601	Getting Ready for the Ball	Literacy Tree	1	1	69	20	3	3	27	\N	\N
602	I Spy	Literacy Tree	1	1	69	21	3	3	25	\N	\N
603	In Went Goldilocks	Literacy Tree	1	1	69	21	3	4	30	\N	\N
604	Mud Pie	Literacy Tree	1	1	69	17	3	4	14	\N	\N
605	Sharing	Literacy Tree	1	1	69	16	3	3	24	\N	\N
606	The baby owls	Rigby PM,	1	1	70	23	3	4	90	\N	\N
607	The lazy pig	Rigby PM,	1	1	70	18	3	3	78	\N	\N
608	Tiger, Tiger	Rigby	1	1	71	20	3	3	55	\N	\N
609	Climbing	Literacy Tree	1	1	72	32	3	3	34	\N	\N
610	Hedgehog is hungry	Rigby ,	1	1	72	21	3	3	76	\N	\N
611	Who Ate the Lettuce?	Literacy Tree	1	1	72	19	3	3	28	\N	\N
612	Woof	Literacy Tree	1	1	72	34	3	3	40	\N	\N
613	Cat and Mouse	Literacy Tree	1	1	73	19	3	3	62	\N	\N
614	The Giant's Day Out	Rigby	1	1	73	8	3	3	26	\N	\N
615	Hot dogs	Rigby PM,	1	1	74	20	3	4	84	\N	\N
616	The merry-go-round	Rigby PM,	1	1	74	32	3	3	84	\N	Kate, James, and Nick
617	My little dog	Rigby PM,	1	1	75	43	3	3	90	\N	\N
618	Photo time	Rigby	1	1	76	16	3	3	59	\N	Jack and Billy
619	The Pet Parade	Literacy Tree	1	1	76	8	3	3	33	\N	\N
620	The flower girl	Rigby PM,	1	1	76	24	3	4	90	\N	\N
621	Animals At the Zoo	Sprouts	1	1	76a	12	3	3	35	\N	\N
622	Bags, Cans, Pots, and Pans	Ready Readers	1	1	76a	6	3	4	56	\N	\N
623	Ben's Pets	Ready Readers	1	1	76a	6	3	4	30	\N	\N
624	Baby in the Cart	Wright Group	1	1	76b	4	3	3	84	\N	\N
625	My Shadow	Ready Readers	1	1	76b	6	3	4	32	\N	\N
626	What Is It?	Sprout	1	1	76b	13	3	3	31	\N	\N
627	Six Go By	Modern Curr. Press	1	1	76c	6	3	4	24	\N	\N
628	When It Rains	Dominie Collection	1	1	76c	5	3	4	37	\N	\N
629	We Went To The Movies	Sprout	1	1	76c	12	3	3	26	\N	\N
630	Buster	Twig	1	1	76c	5	3	4	36	\N	\N
631	Barn Dance	Wright Group	1	1	77	4	3	4	47	\N	\N
632	How to Make a Hot Dog	Wright Group	1	1	77	3	3	4	48	\N	\N
633	Kitty and the birds	Rigby PM,	1	1	77	23	3	3	64	\N	\N
634	At the Library	Rigby	1	1	78	43	3	3	69	\N	\N
635	Hungry Kitten	Dominie Press	1	1	78	4	3	4	50	\N	\N
636	What I Left on My Plate	Dominie Press	1	1	78	6	3	4	54	\N	\N
637	A Raindrop	Dominie Press	1	1	78a	6	3	4	41	\N	\N
638	All About Dinosaurs	Dominie Press	1	1	78a	2	3	4	32	\N	\N
639	I Can Taste	Dominie Press	1	1	78a	7	3	4	31	\N	\N
640	Lots of Dogs	Dominie Press	1	1	78a	7	3	4	68	\N	\N
641	My Pumpkin	Dominie Press	1	1	78a	6	3	4	52	\N	\N
642	On The Road	Dominie Press	1	1	78a	6	3	4	47	\N	\N
643	The Picnic	Dominie Press	1	1	78a	4	3	4	48	\N	\N
644	Doctor Boondoggle	Wright Group	1	1	78b	5	3	4	52	\N	\N
645	First and Last	Dominie Press	1	1	78b	5	3	4	44	\N	\N
646	How to Make Can Stilts	Wright Group	1	1	78b	5	3	4	28	\N	\N
647	Hungry Kitten	Dominie Press	1	1	78b	6	3	4	50	\N	\N
648	I Can Read	Dominie Press	1	1	78b	5	3	4	38	\N	\N
649	I See	Dominie Press	1	1	78b	2	3	4	29	\N	\N
650	Levi Sings	Dominie Press	1	1	78b	5	3	4	29	\N	\N
651	Little Hearts	Wright Group	1	1	78b	5	3	4	44	\N	\N
652	The Big Barn	Dominie Press	1	1	78b	5	3	4	81	\N	\N
653	Winter Fun	Dominie Press	1	1	78b	6	3	4	13	\N	\N
654	Yes, I Can	Dominie Press	1	1	78b	7	3	4	30	\N	\N
655	Mae-Nerd	Dominie Press	1	1	78c	6	3	4	44	\N	\N
656	Merry-Go-Round	Dominie Press	1	1	78c	6	3	4	66	\N	\N
657	Noises	Dominie Press	1	1	78c	7	3	4	98	\N	\N
658	Ready for School	Dominie Press	1	1	78c	6	3	4	41	\N	\N
659	What Did They Want?	Rigby	1	1	78c	8	3	4	28	\N	\N
660	The Dressing-Up Box	Wright	1	1	78c	4	3	4	61	\N	\N
661	Bedtime	Rigby PM Plus	1	1	79	1	4	4	83	\N	\N
662	Happy Birthday	Literacy Tree	1	1	79	21	3	4	28	\N	\N
663	Hungry Bear	Rigby	1	1	79	3	3	4	22	\N	\N
664	Magic Food	Rigby	1	1	79	8	3	4	26	\N	\N
665	Time for Bear	Rigby	1	1	79	2	3	4	28	\N	\N
666	Time for Bed	Rigby Smart Start	1	1	79	3	3	4	28	\N	\N
667	Fast, Faster, Fastest	Twig Books	1	1	80	7	4	4	66	\N	\N
668	Move it	Wright Group	1	1	80	9	4	4	58	\N	\N
669	The Fox	Owen Publishers	1	1	80	7	4	4	24	\N	\N
670	Bubbles	Literacy 2000,	1	1	81	4	3	4	33	\N	\N
671	Gabby is Hungry	Pioneer Valley	1	1	81	6	4	4	78	\N	\N
672	Kittens	Literacy Tree	1	1	81	21	4	4	22	\N	\N
673	If You're Happy	Literacy Tree	1	1	82	17	4	4	179	\N	\N
674	In the Garden	Rigby	1	1	82	35	4	4	90	\N	\N
675	Amy Goes to School	Literacy Tree	1	1	83	42	4	4	90	\N	\N
676	Hot Potato and Cold Potato	Wright Group	1	1	84	5	4	4	77	\N	\N
677	I Am a Cat	Literacy Tree	1	1	84	2	4	4	65	\N	\N
678	Let Me In	Literacy Tree	1	1	84	17	4	4	115	\N	\N
679	Hide and Seek	Rigby PM ,	1	1	85	21	4	4	108	\N	\N
680	Tom is brave	Rigby PM,	1	1	85	26	4	4	57	\N	\N
681	Grandma's House	Pioneer Valley	1	1	86	6	4	4	113	\N	Jasper the Cat
682	Little Chimp and Big Chimp	Rigby PM,	1	1	86	12	4	4	66	\N	Little Chimp
683	Jasper the Fat Cat	Pioneer Valley	1	1	86	6	4	4	68	\N	Jasper the Cat
684	Balloons go Pop!	PM Stars	1	1	86	12	4	4	74	\N	Kate, James, and Nick
685	Screech!	Rigby Literacy Tree	1	1	87	38	4	4	41	\N	\N
686	When I Pretend	Literacy Tree	1	1	87	30	3	4	40	\N	\N
687	Trucks	Literacy Tree	1	1	87	5	3	4	38	\N	\N
688	In My Room	Literacy 2000,	1	1	88	21	4	4	44	\N	\N
689	The farm in spring	Rigby	1	1	89	43	4	4	77	\N	\N
690	At the Park	Sundance	1	1	90	6	4	5	91	\N	\N
691	Bella's Birthday	Footprints	1	1	90	12	4	4	61	\N	Bella and Rosie
692	Going to Grandpa's House	Kaeden Group	1	1	90	4	4	4	42	\N	\N
693	Greedy Cat is Hungry	Cowley	1	1	90	8	4	4	103	\N	\N
694	I Like Painting	Sundance	1	1	90	7	4	4	68	\N	\N
695	Sssh!	Wright Group	1	1	90	5	4	4	49	\N	\N
696	A Bear Lived In A Cave	Sundance	1	1	90	2	4	5	102	\N	\N
697	Going To McDonald's	FCPS,	1	1	91	12	4	4	43	\N	\N
698	At The Pool	Wright Group	1	1	92	5	4	4	64	\N	\N
699	Blackberries	Rigby	1	1	92	17	4	4	107	\N	\N
700	Breakfast	Wright Group	1	1	92	5	3	4	35	\N	\N
701	Mrs. Cook's Hats	Kaeden Group	1	1	92	5	4	4	31	\N	\N
702	My Dream	Oxford	1	1	92	6	3	4	34	\N	\N
703	The grab bag	Rigby PM,	1	1	92	1	4	4	85	\N	\N
704	Ben's treasure hunt	Rigby	1	1	93	28	4	4	102	\N	\N
705	The bumper cars	Rigby PM,	1	1	93	15	4	4	94	\N	\N
706	Dan, The Flying Man	Shortland Publication	1	1	93	2	4	4	60	\N	\N
707	We like fish	Rigby	1	1	94	50	4	4	109	\N	\N
708	Who Helps You?	Sprouts	1	1	95	12	4	4	33	\N	\N
709	Friends	Sprouts	1	1	96	12	4	4	42	\N	\N
710	Snow Walk	Dominie ,	1	1	97	4	5	6	32	\N	\N
711	You Can Play Soccer	Sprouts	1	1	97	12	4	4	37	\N	\N
712	Splash	FCPS,	1	1	98	12	4	4	32	\N	\N
713	The hungry kitten	Rigby PM,	1	1	98	9	4	4	95	\N	\N
714	Ben's Teddy Bear	Rigby	1	1	99	23	5	5	68	\N	\N
715	Going Shopping	Sprout	1	1	99	12	4	5	45	\N	\N
716	Happy Face, Sad Face	Wright Group	1	1	100	6	4	5	76	\N	\N
717	Lizard loses his tail	Rigby PM,	1	1	100	25	4	4	54	\N	\N
718	Mumps	Rigby PM,	1	1	101	15	4	4	112	\N	\N
719	Our Dog Sam	Literacy 2000,	1	1	101	24	4	4	56	\N	\N
720	Take, a Bow, Jody	Seedling Pub	1	1	102	5	5	6	78	\N	\N
721	Father Bear goes fishing	Rigby PM,	1	1	102a	20	4	4	98	\N	\N
722	Where are the sunhats?	Rigby PM,	1	1	102a	25	4	4	130	\N	\N
723	My New Bike	FCPS,	1	1	103	12	4	5	33	\N	\N
\.


--
-- Data for Name: book_log; Type: TABLE DATA; Schema: public; Owner: jchoyt
--

COPY book_log (id, title, author, genre, color, box, copy_count, minlevel, maxlevel, word_count, keyword, series_tmp, modified, modified_by) FROM stdin;
\.


--
-- Data for Name: colors; Type: TABLE DATA; Schema: public; Owner: jchoyt
--

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


--
-- Data for Name: genres; Type: TABLE DATA; Schema: public; Owner: jchoyt
--

COPY genres (id, code, name) FROM stdin;
1	F	Fiction
2	NF	Non Fiction
3	FF	Folklore and Fairytales
4	RT	Reading Theatre
\.


--
-- Data for Name: graphs; Type: TABLE DATA; Schema: public; Owner: jchoyt
--

COPY graphs (graphid, userid) FROM stdin;
\.


--
-- Data for Name: label_sql; Type: TABLE DATA; Schema: public; Owner: jchoyt
--

COPY label_sql (table_name, sql_clause) FROM stdin;
\.


--
-- Data for Name: latticegroup; Type: TABLE DATA; Schema: public; Owner: jchoyt
--

COPY latticegroup (latticegroupid, latticegroupname, latticegroupdesc) FROM stdin;
Public	Public	All users can see the data in this COI - it is the most open, and also the most risky
\.


--
-- Data for Name: people; Type: TABLE DATA; Schema: public; Owner: jchoyt
--

COPY people (email, peopletypeid, password, latticegroupid, firstname, lastname, company, department, address, city, state, zip, country, validationcode, validated) FROM stdin;
admin@mitre.org	3	XPERsFUdQRgrVI/si2Fv1ROAJ3X4BnOredragQ==	Public	\N	\N	\N	\N	\N	\N	\N	\N	\N	still fake	Y
\.


--
-- Name: colors_pkey; Type: CONSTRAINT; Schema: public; Owner: jchoyt; Tablespace: 
--

ALTER TABLE ONLY colors
    ADD CONSTRAINT colors_pkey PRIMARY KEY (id);


--
-- Name: genres_pkey; Type: CONSTRAINT; Schema: public; Owner: jchoyt; Tablespace: 
--

ALTER TABLE ONLY genres
    ADD CONSTRAINT genres_pkey PRIMARY KEY (id);


--
-- Name: graphs_pkey; Type: CONSTRAINT; Schema: public; Owner: jchoyt; Tablespace: 
--

ALTER TABLE ONLY graphs
    ADD CONSTRAINT graphs_pkey PRIMARY KEY (graphid, userid);


--
-- Name: label_sql_pkey; Type: CONSTRAINT; Schema: public; Owner: jchoyt; Tablespace: 
--

ALTER TABLE ONLY label_sql
    ADD CONSTRAINT label_sql_pkey PRIMARY KEY (table_name);


--
-- Name: latticegroup_pkey; Type: CONSTRAINT; Schema: public; Owner: jchoyt; Tablespace: 
--

ALTER TABLE ONLY latticegroup
    ADD CONSTRAINT latticegroup_pkey PRIMARY KEY (latticegroupid);


--
-- Name: people_pkey; Type: CONSTRAINT; Schema: public; Owner: jchoyt; Tablespace: 
--

ALTER TABLE ONLY people
    ADD CONSTRAINT people_pkey PRIMARY KEY (email);


--
-- Name: color_fkey; Type: FK CONSTRAINT; Schema: public; Owner: jchoyt
--

ALTER TABLE ONLY book
    ADD CONSTRAINT color_fkey FOREIGN KEY (color) REFERENCES colors(id);


--
-- Name: genre_fkey; Type: FK CONSTRAINT; Schema: public; Owner: jchoyt
--

ALTER TABLE ONLY book
    ADD CONSTRAINT genre_fkey FOREIGN KEY (genre) REFERENCES genres(id);


--
-- Name: people_latticegroupid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: jchoyt
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


--
-- Name: book; Type: ACL; Schema: public; Owner: jchoyt
--

REVOKE ALL ON TABLE book FROM PUBLIC;
REVOKE ALL ON TABLE book FROM jchoyt;
GRANT ALL ON TABLE book TO jchoyt;
GRANT ALL ON TABLE book TO webuser;


--
-- Name: book_id_seq; Type: ACL; Schema: public; Owner: jchoyt
--

REVOKE ALL ON SEQUENCE book_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE book_id_seq FROM jchoyt;
GRANT ALL ON SEQUENCE book_id_seq TO jchoyt;
GRANT ALL ON SEQUENCE book_id_seq TO webuser;


--
-- Name: book_log; Type: ACL; Schema: public; Owner: jchoyt
--

REVOKE ALL ON TABLE book_log FROM PUBLIC;
REVOKE ALL ON TABLE book_log FROM jchoyt;
GRANT ALL ON TABLE book_log TO jchoyt;
GRANT ALL ON TABLE book_log TO webuser;


--
-- Name: colors; Type: ACL; Schema: public; Owner: jchoyt
--

REVOKE ALL ON TABLE colors FROM PUBLIC;
REVOKE ALL ON TABLE colors FROM jchoyt;
GRANT ALL ON TABLE colors TO jchoyt;
GRANT ALL ON TABLE colors TO webuser;


--
-- Name: colors_id_seq; Type: ACL; Schema: public; Owner: jchoyt
--

REVOKE ALL ON SEQUENCE colors_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE colors_id_seq FROM jchoyt;
GRANT ALL ON SEQUENCE colors_id_seq TO jchoyt;
GRANT ALL ON SEQUENCE colors_id_seq TO webuser;


--
-- Name: genres; Type: ACL; Schema: public; Owner: jchoyt
--

REVOKE ALL ON TABLE genres FROM PUBLIC;
REVOKE ALL ON TABLE genres FROM jchoyt;
GRANT ALL ON TABLE genres TO jchoyt;
GRANT ALL ON TABLE genres TO webuser;


--
-- Name: genres_id_seq; Type: ACL; Schema: public; Owner: jchoyt
--

REVOKE ALL ON SEQUENCE genres_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE genres_id_seq FROM jchoyt;
GRANT ALL ON SEQUENCE genres_id_seq TO jchoyt;
GRANT ALL ON SEQUENCE genres_id_seq TO webuser;


--
-- Name: graphs; Type: ACL; Schema: public; Owner: jchoyt
--

REVOKE ALL ON TABLE graphs FROM PUBLIC;
REVOKE ALL ON TABLE graphs FROM jchoyt;
GRANT ALL ON TABLE graphs TO jchoyt;
GRANT ALL ON TABLE graphs TO webuser;


--
-- Name: label_sql; Type: ACL; Schema: public; Owner: jchoyt
--

REVOKE ALL ON TABLE label_sql FROM PUBLIC;
REVOKE ALL ON TABLE label_sql FROM jchoyt;
GRANT ALL ON TABLE label_sql TO jchoyt;
GRANT ALL ON TABLE label_sql TO webuser;


--
-- Name: latticegroup; Type: ACL; Schema: public; Owner: jchoyt
--

REVOKE ALL ON TABLE latticegroup FROM PUBLIC;
REVOKE ALL ON TABLE latticegroup FROM jchoyt;
GRANT ALL ON TABLE latticegroup TO jchoyt;
GRANT ALL ON TABLE latticegroup TO webuser;


--
-- Name: people; Type: ACL; Schema: public; Owner: jchoyt
--

REVOKE ALL ON TABLE people FROM PUBLIC;
REVOKE ALL ON TABLE people FROM jchoyt;
GRANT ALL ON TABLE people TO jchoyt;
GRANT ALL ON TABLE people TO webuser;


--
-- PostgreSQL database dump complete
--

