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
    word_count text DEFAULT ''::text,
    keyword text DEFAULT ''::text,
    series text DEFAULT ''::text,
    big_book boolean DEFAULT false,
    notes text DEFAULT ''::text
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
    series_tmp text,
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
-- Data for Name: book; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY book (id, title, author, genre, color, box, copy_count, minlevel, maxlevel, word_count, keyword, series, big_book, notes) FROM stdin;
3386	Brith the Terrible	Literacy 2000	1	9	107	9	28	28				f	
3498	The Work Helicopter	Rigby PM	1	8	3	8	16	16				f	
1125	My Shadow	Wright Group	1	1	56	4	3	4	42			f	
5308	Mouse Tales	Lobel	1	8	36	4	18	18				f	
1333	The Little Work Plane	Rigby PM	1	8	5	10	16	16	304			f	
1236	Bee My Valentine!	Cohen, Miriam	1	6	28A	8	14	14	250+		Welcome to First Grade	f	
784	Some Days Are Like That	Dominie Collection	1	2	5A	3	6	6	69		Teachers Choice Series	f	
671	Gabby is Hungry	Pioneer Valley	1	1	81	6	3	4	78		Gabby	f	
1347	Eating Green	Reading Reading Books	1	1	67	18	3	4	88			f	
1348	A House for Squirrel	Reading Reading Books	1	1	67	18	3	4	55			f	
803	Take a Bow, Jody	Seedling Pub	1	2	7A	5	6	6	78			f	
904	Pickles Goes to School	Pioneer Valley 	1	2	39	12	8	8	90		Pickles	f	
5312	Tasmanian Devils	Rigby PM	2	9	35	5	28	28				f	
5316	Where Does the Rabbit Hop?	Ready Readers	1	2	60	6	8	8	71			f	
5322	Thunderstorms	Children's Press	2	3	58	4	36	36				f	
1721	Seeds and Plants	Dominie Press	2	6	24	2	14	14	173	Plants		f	
3303	Revolutionary War on Wednesday	Osborne, Mary Pope	1	9	72	12	28	28		American Revolution	Magic Tree House	f	
5252	The Cay	Taylor, Theodore	1	7	23	11	50	50		Historical Fiction		f	
4233	The Pilgrims' First Thanksgiving	McGovern, Ann	2	3	41	3	36	36		Thanksgiving		f	
452	The Machine	Literacy Tree	1	1	24	19	2	2	30			f	
1145	Zoo-Looking	Mondo	1	6	5	12	12	12	149			t	
1319	Grandma Comes to Stay Again	Rigby Sails	1	8	7A	6	16	16				f	
1159	One Hot Summer Night	Mondo	1	8	12A	30	16	16	126			f	
1162	I Can Do It	Mondo	1	8	15A	30	16	16	200			f	
715	Going Shopping	FCPS	1	1	99	12	3	4	45			f	
1043	Molly's Mailbox	Dominie Press	1	2	76	6	10	10	122		Teacher's Choice Series	f	
552	The Sun and the Moon	PM Stars	1	1	55	12	3	4	41			f	
1146	Cows in the garden	Rigby PM	1	6	6	10	12	12	163			f	
5313	Jane Goodall and the Chimps	Wright Group	2	9	18	5	24	24		Biography		f	
4305	Meet Erdene	iOpeners	2	3	72	7	38	38		Biography		f	
5325	Sound, Heat and Light - Energy at Work	Berger, Melvin	2	9	8	4	24	24				f	
5327	Mountains	Dominie Press	2	9	27	4	28	28				f	
3428	The Beast in Ms. Rooney's Room	Giff, Patricia Reilly	1	9	124	16	28	28			Kids of the Polk Street School	f	
3623	Jordan's Lucky Day	Rigby PM	1	8	87	5	20	20				f	
4944	Ramona the Brave	Cleary, Beverly	1	3	60	7	36	36				f	
4458	Finding Your Way	Orbit	2	4	50	8	40	40		Geography		f	
1161	Pete's New Shoes	Literacy Tree	1	6	11	9	12	12	91			f	
1196	BMX Billy	Literacy Tree	1	6	17	20	12	12	93	realistic		f	
1157	Look in the garden	Rigby PM	1	6	9	17	12	12	208			f	
1158	Snowball, the white mouse	Rigby PM	1	6	9	12	12	12	223			f	
1160	A friend for Max	Rigby PM	1	6	11	18	12	12	228			f	
1164	Brave Triceratops	Rigby PM	1	6	13	12	12	12	178			f	
993	Stables are for horses	Windmill Books	1	8	5A	5	16	16	66			f	
3800	Henry and Mudge and the Long Weekend	Rylant, Cynthia	1	8	30A	7	18	18			Henry and Mudge	f	
875	Meeka Goes Swimming	FCPS	1	2	26	12	6	6	65			f	
5056	Airborne!	iOpeners	2	5	16	6	60	60				f	
1346	Flowers Like Worms	Reading Reading Books	1	1	67	18	3	4	45			f	
1253	Little Chimp and the termites	Rigby PM	1	6	30A	16	14	14	192			f	
1251	The fox who foxed	Rigby PM	1	6	30	10	14	14	212			f	
1252	Coco's bell	Rigby PM	1	6	30A	16	14	14	224			f	
1425	At the Zoo	Sundance	2	1	12	14	3	3	73			f	
1224	Chano	Literacy Tree	1	6	26	8	14	14	124			f	
1246	Rosie at the Zoo	Learning Media	1	6	30	5	14	14	135			f	
5317	The Current in Your Home	Houghton-Mifflin	2	4	98	6	44	44		Energy, Electricity		f	
5326	Swimming Lessons	Storyteller	2	8	4	4	16	16				f	
5328	Forests	Dominie Press	2	9	27	3	28	28				f	
4797	Black Duck	Lisle, Janet Taylor	1	4	104	4	44	44		Historical Fiction		f	
4825	Dinosaur Bob and his Adventures with the Family Lazardo	Joyce, William	1	3	9	12	30	34		Dinosaurs		f	
4092	A Picture Book of Martin Luther King	Scholastic	2	9	37	13	28	28		Biography		f	
1261	Mr Naughty is Missing	Pioneer Valley	1	6	31A	6	14	14	270			f	
1279	And Billy Went Out to Play	Bookshelf	1	8	5A	4	16	16	227			f	
3788	Henry and Mudge The First Book	Rylant, Cynthia	1	8	30	3	18	18			Henry and Mudge	f	
1343	Brr!	Reading Reading Books	1	1	12A	18	1	1	29	Winter		f	
1330	The Kite that Got Away	Rigby PM	1	8	18	15	16	16	292			f	
672	Kittens	Literacy Tree	1	1	81	21	3	4	22			f	
1331	A Bike for Alex	Rigby PM	1	8	4	14	16	16	305			f	
5310	Zack's Alligator	Mozelle, Shirley	1	8	77	4	20	20				f	New - Added 10/8/13
5314	Underwater with Jacques Cousteau	Houghton-Mifflin	2	9	18	12	24	24		Biography		f	
5318	Making Clay	Houghton-Mifflin	2	3	52	6	36	36				f	
4588	Surviving Volcanoes and Glaciers	Nat'l Geographic	2	4	94	11	44	44				f	
5329	Stargazers	Gibbons, Gail	2	9	19	5	24	24		Solar System		f	
4679	Because of Winn-Dixie	DiCamillo, Kate	1	4	43	9	40	40		Newberry		f	
4963	Hop to It, Minty!	Rigby PM Chapter	1	3	66	17	36	36				f	
417	A house	Rigby PM	1	1	13	30	1	1	32			f	
5309	Once Upon a Time	Ready Readers	1	6	44	4	14	14	243	A Play		f	
5311	Pirate Traps	Wright Group	1	8	64	5	20	20				f	
4040	Inventing the Telephone	iOpeners	2	9	16	13	24	24		Narrative		f	
5319	Bluebird Out My Window	Houghton-Mifflin	2	9	18	6	24	24		Life Cycle		f	
4355	If You Lived With The Iroquois Indians	Scholastic	2	4	11	10	40	40		Native Americans		f	
5330	Energy on Earth	Newbridge	2	4	99	12	44	44		Energy		f	
4866	Tall Tales	Rigby PM Chapter	1	3	21	9	30	34				f	
3409	Buster and the Pet Detectives	Sundance	1	9	115	4	28	28			Supa Doopers	f	
426	Socks	Rigby	1	1	15	8	1	1	21			f	
428	Weather	Rigby	1	1	15	9	1	1	14			f	
484	Party Hats	Rigby	1	1	35	15	2	2	72			f	
3321	Afternoon on the Amazon	Osborne, Mary Pope	1	9	77	11	28	28			Magic Tree House	f	
1249	Wait for your Turn!	Dominie 	1	6	30	5	14	14	141		Teacher's Choice Series	f	
1478	Tick Tock World Clocks	iOpeners	2	1	20	9	4	4	43			f	
5320	Finding Gold	Houghton-Mifflin	2	3	31	12	30	34				f	
5331	A Special Trip	Houghton - Mifflin	2	9	9	3	24	24				f	
4914	Mystery Ranch	Warner, Gertrude Chandler	1	3	44	5	36	36			The Boxcar Children	f	
668	Move it	Wright Group	1	2	61	9	8	8	58			f	
516	Gabby Goes Up and Down	Pioneer Valley	1	1	44	6	2	2	42		Gabby	f	
513	Look at me	Rigby PM	1	1	43	25	2	2	48			f	
526	At the Zoo	Rigby PM	1	1	47	20	2	2	40			f	
600	Filbert The Fly	Literacy Tree	1	1	69	10	3	4	28			f	
712	Splash !	FCPS	1	1	98	12	3	4	32			f	
3269	Bringing The Sea Back Home	Literacy Tree	1	9	55	7	24	24				f	
688	In My Room	Literacy 2000	1	1	88	21	3	4	44			f	
689	The farm in spring	Rigby	1	1	89	43	3	4	77			f	
692	Going to Grandpa's House	Kaeden Group	1	1	90	4	3	4	42			f	
619	The Pet Parade	Literacy Tree	1	1	76	8	3	4	33			f	
5130	Looking at Prehistory	Pearson	2	7	21	22	50	50				f	
1537	Push and Pull	iOpeners	2	2	12	9	8	8	49			f	
5321	A Sea Star	Ready Readers	2	2	15	5	8	8	82			f	
5332	Let's Talk About Tongues	Children's Press	2	6	26	3	14	14	401			f	
686	When I Pretend	Literacy Tree	1	1	87	31	3	4	40			f	
3946	Space, Stars, and Planets	Rigby Sails	2	8	25	6	18	18		Solar System		f	
691	Bella's Birthday	Pioneer Valley	1	1	90	14	3	4	61		Bella and Rosie	f	
822	Baby Elephant Gets Lost	Wright Group	1	2	9	5	6	6	90			f	
824	My Cat	Ready Readers	1	2	9	6	6	6	40			f	
825	Night Animals	Ready Readers	1	2	9	5	6	6	56			f	
5315	Making Mount Rushmore	Wright Group	2	9	40	4	28	28				f	
4143		iOpeners	2	3	7	9	30	30		Biography		f	
5333	Animal Mix-Ups	Twig	2	8	14	5	16	16		Compare and Contrast		f	
727	Play Ball!	Twig Books	1	1	16	5	1	1	14	Sports, Baseball		f	
674	In the Garden	Literacy Tree	1	2	19	30	6	6	90			f	
463	I Can Make Music	Sundance	1	1	27	11	2	2	41			f	
930	Worms Are Everywhere	FCPS	1	2	44	12	8	8	66			f	
907	The Garden Hose	Rigby	1	2	40	4	8	8	58			f	
920	Bingo's Birthday	Rigby PM	1	2	43	10	8	8	116			f	
923	Super Sandwich	Sundance	1	2	43	6	8	8	72			f	
932	Just Like Me	Children's Press- Rookie Reader	1	2	45	4	8	8	138			f	
936	Purple is Part of a Rainbow	Children's Press--Rookie Reader	1	2	47	9	8	8	131			f	
948	Sam's Mask	Ready to Read	1	2	49A	6	8	8	41			f	
949	Taking Care of Rosie	Seedling Publication	1	2	49A	5	8	8	61			f	
1679	Let's Make Music	iOpeners	2	6	16	9	14	14	220	How to books		f	
1379	Moving	Sundance	2	1	4	19	2	2	56			f	
3686	Frog and Toad Are Friends	Lobel, Arnold	1	8	71	8	20	20			Frog and Toad	f	
937	Where's My Pencil?	FCPS	1	2	47	11	8	8	86			f	
1100	Lost socks	Rigby PM	1	2	96	9	10	10	159			f	
3687	Frog and Toad All Year	Lobel, Arnold	1	8	72	4	20	20			Frog and Toad	f	
1033	Mai-Li's Surprise	Richard Owen Publishers	1	2	74	6	10	10	63			f	
1034	Sam plays paddle ball	Rigby PM	1	2	74	12	10	10	161			f	
1041	When It Rains	Kaeden Group	1	2	75	3	10	10	106			f	
4410	Sports Heroes	Rigby PM	2	4	32	16	40	40				f	
830	Goodbye, Lucy	Sunshine	1	2	9A	7	6	6	60			f	
865	Traffic Jam	Sundance	1	2	23	6	6	6	81			f	
3702	Little Dinosaur Escapes	Rigby PM	1	8	52	9	18	18		Dinosaurs	In the Days of the Dinosaurs	f	
1022	Thanksgiving	Kaeden Group	1	2	71	5	10	10	75	Thanksgiving		f	
1382	At the Wildlife Park	Sundance	2	1	4	10	2	2	34			f	
3180	Horrible Harry and The Ant Invasion	Kline, Suzy	1	9	19	7	24	24			Horrible Harry	f	
3178	The Very Thin Cat of Alloway Road	Literacy 2000	1	9	18	4	24	24				f	
3179	Gail and Me	Literacy Tree	1	9	18	3	24	24				f	
3243	Adventure in the Hills	Rigby PM Plus	1	9	45	6	24	24				f	
3244	Separate Ways	Rigby PM Plus	1	9	45	6	24	24		Divorce		f	
3247	Spanish Omelette	Rigby PM	1	9	46	9	24	24				f	
1116	In the Chicken Coop	Wright Group	1	2	15	5	6	6	56	Farm		f	
1102	Brown Mouse gets some corn	Rigby PM	1	2	98	7	10	10	158			f	
1103	Sam's painting	Rigby PM	1	2	98	12	10	10	181			f	
1387	What Comes Out At Night?	Sundance	2	1	5	9	2	2	48			f	
1388	Good to Eat	Twig	2	1	5	7	2	2	31			f	
1389	A Week of Weather	Benchmark	2	1	5	6	2	2	56	Weather		f	
1390	Wood	Twig	2	1	5	5	2	2	26			f	
1471	We Need Water	Outside the box	2	1	19	19	4	4	26			f	
1555	Whatever Will These Become?	Literacy Tree	2	2	16	4	8	8	47			f	
1638	Power From the Sun	Sundance	2	6	4	4	12	12	147	Energy		f	
1639	Gorillas	Sundance	2	6	5	5	12	12	205	Zoo		f	
1716	Fur, Feathers, Scales, Skin	Newbridge Discovery Links	2	6	24	4	14	14	173			f	
3388	Sam's Glasses	Literacy Tree	1	9	107	3	28	28				f	
3389	Beauregard the Cat	Mondo	1	9	108	20	28	28				f	
3393	River Runners	Literacy Tree	1	9	111	19	28	28				f	
3456	Freckle Juice	Blume, Judy	1	9	137	18	28	28				f	
3457	The One in the Middle Is the Green Kangaroo	Blume, Judy	1	9	137	11	28	28				f	
3552	Tricking the Tiger	Rigby PM Plus	1	8	42	7	18	18				f	
3626	Look Out for Your Tail	Literacy Tree	1	8	20A	5	18	18				f	
3706	The Surf Carnival	Rigby PM	1	8	53	9	20	20				f	
817	A Walk for Pickles	Pioneer Valley	1	2	8A	12	6	6	82		Pickles	f	
3804	The Hat Came Back	Literacy Tree	1	8	77	4	20	20				f	
3803	Just for Fun	Literacy 2000	1	8	24	7	18	18				f	
968	Sally's Red Bucket	Rigby PM	1	2	53	18	8	8	127		Sally	f	
3842	Let's Read Biography Maya Lin	Houghton-Miffin	2	8	1	18	16	16		Biography		f	
1002	Ying	Rigby	1	2	66	10	10	10	65			f	
3904	Let's Read Biography Ben Franklin 	Houghton-Miffin	2	8	15	5	18	18		Biography		f	
1074	Sally's friends	Rigby PM	1	2	84	8	10	10	128		Sally	f	
1117	Little Teddy and Monkey	Rigby PM Stars	1	1	78D	12	3	4	50		Little Teddy	f	
3906	Floating and Sinking	Book Shelf	2	8	15	20	18	18				f	
4033	Elephants	Sundance	2	9	14	6	24	24				f	
4024	Sending Messages	Alphakids	2	9	11	6	24	24				f	
4106	Plants that Bite Back	Sundance	2	9	41	5	28	28				f	
4186	Changing Shores	iOpeners	2	3	24	2	30	34				f	
4267	Earthquakes and Tsunamis	Rigby PM Plus	2	3	53	6	36	36				f	
4345	If You Traveled on the Underground Railroad	Scholastic	2	4	1	17	40	40		Underground Railroad		f	
4360	Weather	Rourke	2	4	13	4	40	40		Weather		f	
4423	Why Don't You Get A Horse, Sam Adams?	Fritz, Jean	2	4	38	10	40	40		Biography, American Revolution		f	
4500	Dinosaurs: Giant Jigsaws	Rigby Sails	2	4	64	6	40	40		Archeology		f	
4578	What Is the Media?	Houghton-Miffin	2	4	90	36	44	44				f	
4580	On Assignment: Queen Anne's Revenge	Newbridge	2	4	91	11	44	44				f	
4640	Indian Ghost Mystery	Perfection 	1	4	22	17	40	40				f	
4717	Neighborhood Nonsense	Rigby Sails	1	4	61	6	40	40				f	
4718	A Wild Race in the Sun	Rigby Sails	1	4	61	6	40	40		Narrative		f	
4792	The Return of the Indian	Banks, Lynne Reid	1	4	101	8	44	44				f	
4947	Henry Huggins	Cleary, Beverly	1	3	61	11	36	36				f	
5022	Climbing Everest	iOpeners	2	5	4	6	60	60				f	
5023	Outdoor Adventures	iOpeners	2	5	4	6	60	60				f	
5099	Remember the Ladies	Scholastic	2	7	6	18	50	50				f	
5177	Calico Bush	Field, Rachel	1	5	3	12	60	60		Newberry, Historical Fiction		f	
1311	Lizzie's Lunch	Literacy Tree	1	8	5A	30	16	16	119			f	
1131	The broken flower pot	Rigby PM	1	6	2	10	12	12	203			f	
629	We Went To The Movies	FCPS	1	1	76c	12	3	4	26			f	
543	Fishing	Rigby	1	1	53	30	3	4	63			f	
1155	A Bedtime Story	Mondo	1	8	65	16	20	20	335			f	
1306	Jack and the Fox	Pioneer Valley	1	8	1C	6	16	16	226		Jack and Daisy	f	
814	Snowball Fight!	Wright Group	1	2	8	5	6	6	35	Winter		f	
1133	Carla's Ribbons	Kaeden Group	1	6	3	5	12	12	212			f	
1130	Mother Tiger and her cubs	Rigby PM	1	6	2	12	12	12	212			f	
1128	Buzz Said the Bee	Lewison, Wendy	1	6	1	6	12	12	62			t	
1138	Down by the sea	Rigby PM	1	6	3A	12	12	12	173			f	
1134	Jack and Billy and Rose	Rigby PM	1	6	3	12	12	12	179			f	
1136	Tom's ride	Rigby PM	1	6	3	11	12	12	185			f	
1135	Locked out	Rigby PM	1	6	3	10	12	12	195			f	
1148	Each Peach Pear Plum	Scholastic	1	6	7	20	12	12	115			t	
1154	More Spaghetti, I Say!	Gelman, Rita	1	6	8A	12	12	12	340			t	
1277	The Dippy Dinner Drippers	Sunshine Books	1	6	35A	6	14	14	181			t	
1283	Goodnight Goodnight	Literacy Tree	1	6	36A	16	14	14	185			t	
628	When It Rains	Dominie Collection	1	1	76c	5	3	4	37			f	
630	Buster	Twig	1	1	76c	5	3	4	36			f	
1321	What's Cooking?	Mondo	1	6	45B	17	14	14	287			t	
1287	Ben's Tooth	Rigby PM	1	6	39	9	14	14	197			f	
1289	Swimming with a dragon	Rigby PM	1	6	39	13	14	14	230			f	
1290	The flood	Rigby PM	1	6	39	3	14	14	238			f	
1291	The little red bus	Rigby PM	1	6	39	8	14	14	222			f	
1292	A Lollipop Please	Literacy 2000	1	6	40	5	14	14	73			f	
1293	Red Squirrel's Adventure	Rigby PM	1	6	40	15	14	14	223			f	
1294	Snow on the hill	Rigby PM	1	6	40	3	14	14	213			f	
1295	The Person from Planet X	Sunshine Books	1	6	40	4	14	14	246			f	
1296	Katie's butterfly	Rigby PM	1	6	41	13	14	14	222			f	
1297	The hospital party	Rigby PM	1	6	41	20	14	14	237			f	
1300	Pizza for Dinner	Literacy Tree	1	6	43	17	14	14	164			f	
1301	The cross-country race	Rigby PM	1	6	43	7	14	14	246			f	
1302	The Possum Babies	Rigby Sails	1	6	43	6	14	14	233			f	
1307	Mr. McGrah's New Car	Wright Group	1	6	44	6	14	14	119			f	
1308	Out After Dark	Wright Group	1	6	44	5	14	14	114			f	
1310	The Bird Table	Wright Group	1	6	44	5	14	14	166			f	
1305	Can I Play Outside? (a play)	Literacy Tree	1	6	43A	30	14	14	121			f	
1342	Splash!	Reading Reading Books	1	1	12A	18	1	1	21			f	
1349	Lunch for Carl	Reading Reading Books	1	1	48	18	2	2	36			f	
1353	The Walk	Pioneer Valley	1	1	33	12	2	2	29			f	
454	The rock pools	Rigby PM	1	1	25	55	2	2	49			f	
719	Our Dog Sam	Literacy 2000,	1	1	39	24	2	2	56			f	
722	Where are the sunhats?	Rigby PM	1	2	13	25	6	6	130			f	
721	Father Bear goes fishing	Rigby PM	1	2	15	19	6	6	98			f	
1298	Jasper goes Camping	Pioneer Valley	1	6	41	6	14	14	244		Jasper the Cat	f	
3139	Gasp!	Mondo	1	9	1	15	24	24				f	
1149	Shopping at the Mall	Kaeden Group	1	6	7	4	12	12	145			f	
1150	Candlelight	Rigby PM	1	6	8	10	12	12	231			f	
1152	The clever Penguins	Rigby PM	1	6	8	9	12	12	174			f	
716	Happy Face, Sad Face	Wright Group	1	1	100	6	3	4	76			f	
363	Baby	Rigby PM	1	1	1	11	1	1	24			f	
717	Lizard loses his tail	Rigby PM	1	2	13	25	6	6	54			f	
1153	Apple Tree	Literacy Tree	1	6	8A	23	12	12	198			t	
1282	The Royal Dinner	Literacy Tree	1	6	36A	20	14	14	250+			t	
1143	Ebenezer and the Sneeze	Wright Group	1	2	9A	4	6	6	115			f	
1012	Bella and Rosie Trick-or-Treat	Pioneer Valley	1	2	59	14	8	8	129		Bella and Rosie	f	
1132	The Toytown race car	Rigby PM	1	2	67	9	10	10	188			f	
1139	The best hats	Rigby PM	1	6	3A	12	12	12	201			f	
1141	Max and the birdhouse	Rigby PM	1	6	4	17	12	12	190			f	
1221	Old Grizzly	Sunshine Books	1	6	25A	4	14	14	185			t	
1278	A Small World	Sunshine Books	1	6	35A	3	14	14	146			t	
1223	Superkids	Sunshine Books	1	6	26	3	14	14	165			t	
1276	The Tiny Woman's Coat	Sunshine Books	1	6	35A	10	14	14	147			t	
1304	Ratty-tatty	Sunshine Books	1	6	43	8	14	14	181			t	
1288	Pepper's Adventure	Rigby PM	1	6	39	8	14	14	264			f	
1299	The Never-Told Story	Literacy Tree	1	6	42	31	14	14	137			f	
1147	The Barnaby's New House	Literacy Tree	1	6	6	31	12	12	135			f	
1137	Birthday presents	Rigby PM	1	2	89	14	10	10	162			f	
1140	A treasure Island	Rigby PM	1	2	89	12	10	10	177			f	
1312	Joey	Rigby PM	1	6	22	3	12	12	243			f	
1240	Greedy Cat	Ready to Ready	1	6	22	6	12	12	166			t	
1165	Come on, Tim	Rigby PM	1	6	13	6	12	12	198			f	
1166	The bears and the magpie	Rigby PM Plus	1	6	13	19	12	12	205			f	
1170	Miss Pomelili's Wet Week	Wright Group	1	6	14	5	12	12	215			f	
1177	I Have A Question, Grandma	Literacy Tree	1	6	15	19	12	12	124			f	
1179	Sooty	Alpha Kids	1	6	15	4	12	12	212			f	
835	Waves	Literacy Tree	1	2	11	14	6	6	66			t	
1194	House hunting	Rigby PM	1	6	17	6	12	12	223			f	
1197	Buffy's Tricks	Literacy Tree	1	6	18	30	12	12	97			f	
1198	Philippa and the Dragon	Literacy Tree	1	6	19	30	12	12	137			f	
1199	Hippo's Hiccups (a play)	Literacy Tree	1	6	20	30	12	12	208			f	
1201	Gregor the Grumblesome Giant	Literacy Tree	1	6	21	30	12	12	212			f	
1204	Mushrooms for dinner	Rigby PM	1	6	23	4	12	12	177			f	
1205	Pete Little	Rigby PM	1	6	23	5	12	12	222			f	
1208	Max and Jake	Rigby PM	1	6	24	17	12	12	212			f	
1209	The jungle frogs	Rigby PM	1	6	24	14	12	12	195			f	
1210	The picnic boat	Rigby PM	1	6	24	10	12	12	210			f	
1211	I'm King of the Mountain	Learning Media	1	6	24A	6	12	12	285			f	
1215	The Lost Keys	Rigby PM Plus	1	6	24A	12	12	12	223			f	
1216	Sometimes Things Change	Rookie Reader	1	6	25	7	12	12	71			f	
1217	The Horrible Urktar of Or	Sunshine Books	1	6	25	5	12	12	143			f	
1195	Jordan's soccer ball	Rigby PM	1	6	17	11	12	12	210	Sports, Soccer		f	
1151	Late for soccer	Rigby PM	1	6	8	8	12	12	185	Sports, Soccer		f	
1176	A Mouse in the House	Pioneer Valley	1	6	14	6	12	12	228		Jasper the Cat	f	
3141	Miss Nelson Has A Field Day	Allard, Harry	1	9	3	8	24	24		Sports		f	
1206	The Naughty Ann	Rigby PM	1	6	23	8	12	12	159			f	
829	The farm concert	Wright Group	1	1	90	8	3	4	74			t	
1202	Happy Birthday, Duckling	Literacy Tree	2	8	14	30	16	16	154			f	
1237	What About Bennie?	Literacy Tree	1	6	28A	29	14	14	124			f	
1219	Clever Brown Mouse	Rigby PM	1	6	2	8	12	12	199			f	
1267	The wheelbarrow garden	Rigby PM	1	6	34	17	14	14	231			f	
1270	Dad and the Go-Cart	Rigby Sails	1	6	34A	6	14	14	227			f	
1271	The New Wheels	Rigby Sails	1	6	34A	6	14	14	236			f	
1274	The waving sheep	Rigby PM	1	6	35	8	14	14	250			f	
1285	Emma's Problem	Literacy Tree	1	6	38	26	14	14	190			f	
1313	The flying fish	Rigby PM	1	6	45	6	14	14	215			f	
1314	The island picnic	Rigby PM	1	6	45	9	14	14	236			f	
1315	The nest on the beach	Rigby PM	1	6	45	14	14	14	243			f	
1275	The Drummers	Kaeden Group	1	6	35A	4	14	14	80			f	
1189	Monkey's Ride	Rigby Sails	1	8	14	6	16	16				f	
1190	Mr. Magee's Goats	Rigby Sails	1	8	14	6	16	16				f	
1272	The King's Pudding	Literacy Tree	1	8	15A	8	16	16	211			f	
1192	Pop and Robby	Rigby Sails	1	8	16	6	16	16				f	
1188	Spies Go Shopping	Rigby Sails	1	8	16	6	16	16				f	
1186	Big Mouse, Little Mouse	Rigby Sails	1	8	7A	6	16	16				f	
1127	Gabby and the Christmas Tree	Pioneer Valley	1	6	1	12	12	12	105		Gabby	f	
1180	Mom at the Market	Rigby Sails	1	8	44	6	18	18				f	
1191	Dad at the Fair	Rigby Sails	1	8	13	6	16	16				f	
1187	Happy Harriet	Rigby Sails	1	8	14	6	16	16				f	
1184	Frogs in the House	Rigby Sails	1	8	44	6	18	18				f	
1185	Dad at the Beach	Rigby Sails	1	8	13	6	16	16				f	
1262	Dragon with a Cold	Sunshine Books	1	8	24	11	18	18	149			f	
1142	Gabby Runs Away	Pioneer Valley	1	6	5	3	12	12	220		Gabby	f	
1220	It Takes Time to Grow	Sunshine Books	1	6	25A	3	14	14	57			f	
1218	Candy, the old car	Rigby PM	1	6	25A	15	14	14	234			f	
1264	Sally's Surprise Garden	Literacy Tree	1	6	33	31	14	14	146			f	
1242	The Pesky Paua	Wright Group	1	6	29	5	14	14	267			f	
1238	A Farmyard Fiasco	Wright Group	1	6	29	6	14	14	186			f	
1234	Sam's Haircut	Rigby PM	1	6	28	18	14	14	226			f	
3142	Miss Nelson is Missing!	Allard, Harry	1	9	3	16	24	24				f	
1230	The classroom caterpillars	Rigby PM	1	6	27A	11	14	14	216			f	
1228	Locked In	Rigby PM	1	6	27	20	14	14	228			f	
1231	New glasses for Max	Rigby PM	1	6	27A	22	14	14	239			f	
1229	Popcorn fun	Rigby PM	1	6	27	15	14	14	217			f	
1233	Father Bear's Surprise	Rigby PM	1	6	28	4	14	14	224			f	
1193	Clown is Sick 	Rigby Sails	1	8	14	6	16	16				f	
1281	Ten, Nine, Eight 	Bang, Molly	1	6	36	20	14	14	60			f	
1280	No Singing Today!	Mondo	1	6	36	13	14	14	419			f	
1175	The Printing Machine	Literacy Tree	1	6	14	8	12	12	102			f	
1227	The New Building	Sunshine Books	1	6	31	3	14	14	78			f	
1243	My Friend Jess	Wright Group	1	6	29	3	14	14	124			f	
1232	Mrs. Spider's beautiful web	Rigby PM	1	6	27A	7	14	14	212			f	
1178	Just My Luck	Literacy Tree	1	6	15	26	12	12	136			f	
1200	T.J.'s Tree	Literacy Tree	1	6	20	30	12	12	77			f	
1183	Papa's Spaghetti	Literacy Tree	1	6	16	31	12	12	248			f	
1163	Sally's Picture	Literacy Tree	1	6	18	17	12	12	125			f	
1286	Rice Cakes (a play)	Literacy Tree	1	6	38	31	14	14	250			f	
1316	A tree horse	Rigby PM	1	6	45A	19	14	14	220			f	
868	Clever Fox	Rigby PM	1	2	24	9	6	6	114			f	
1326	Teasing Mom	Rigby PM	1	6	46	14	14	14	239			f	
1327	The jump rope	Rigby PM	1	6	46	18	14	14	241			f	
1328	Little Dinosaur's Skateboard	Pioneer Valley	1	6	46	6	14	14	186			f	
1350	The Sea	Reading Reading Books	1	1	48	18	2	2	24			f	
998	Wake Up, Isabel!	Literacy Tree	1	2	65	11	8	8	143			t	
1344	Dressed Up Dogs	Reading Reading Books	1	1	12A	18	1	1	25			f	
1351	The Pirate	Reading Reading Books	1	1	48	18	2	2	24			f	
1260	Help for Rosie	Pioneer Valley	1	6	31A	14	14	14	165		Bella and Rosie	f	
369	What Are You?	Literacy Tree	1	1	2	24	1	1	27			f	
371	In the Garden	Rigby PM Plus	1	1	3	11	1	1	32			f	
373	Going on Vacation	Rigby PM Plus	1	1	4	17	1	1	40			f	
374	I am running	Rigby PM Plus	1	1	4	10	1	1	24			f	
3143	The T-Shirt Triplets	Literacy Tree	1	9	4	4	24	24				f	
378	The Farm	Rigby Smart Start	1	1	5	5	1	1	14			f	
379	The Farm	Literacy Tree	1	1	5	22	1	1	14			f	
382	The Amazing Race	Rigby	1	1	6	7	1	1	28			f	
383	Time for dinner	Rigby Smart Start	1	1	6	7	1	1	15			f	
380	In the shopping cart	Rigby PM	1	1	6	11	1	1	24			f	
365	The Play	Rigby PM	1	1	42	14	2	2	52			f	
375	We dress up	Rigby PM	1	1	42	11	2	2	56			f	
364	Balloons	Rigby PM	1	1	41	8	2	2	57			f	
376	Here's a House	Wright Group	1	1	76A	7	3	4	32			f	
1318	Molly and Harry	Rigby Sails	1	6	45B	6	14	14				f	
1268	Toys	Dominie	1	2	46	5	8	8	76			f	
1257	My Monster Friends	Literacy Tree	1	2	88	30	10	10	94			f	
1269	Big Red and the Car Wash	Rigby Sails	1	6	16A	6	12	12	225			f	
1322	Sailor Sam and the Captain	Rigby Sails	1	8	7A	6	16	16				f	
1334	What Would You Do?	Wright Group	1	6	12	5	12	12	160			f	
1325	Bully Cat	Rigby Sails	1	8	7A	6	16	16				f	
1320	Zack's Spots	Rigby Sails	1	8	7A	6	16	16				f	
388	The Robot	Rigby Smart Start	1	1	7	5	1	1	18			f	
390	Under the Bed	Rigby Smart Start	1	1	7	7	1	1	28			f	
1169	Dry and Snug and Warm	Wright Group	1	6	25	4	12	12	64			f	
398	Mom	Rigby PM Collection	1	1	9	25	1	1	24			f	
397	Me	Rigby PM Collection	1	1	9	21	1	1	24			f	
396	Deep in the Forest	Houghton Mifflin	1	1	9	5	1	1	0			f	
412	Rosie Likes Pink	Pioneer Valley	1	1	6A	20	1	1	24		Bella and Rosie	f	
414	Looking Out	Pioneer Valley	1	1	8A	20	1	1	27		Bella and Rosie	f	
404	Christmas	Rigby Smart Start	1	1	11	8	1	1	16			f	
407	James is Hiding	Windmill Books	1	1	11	2	1	1	24			f	
410	The Surprise Inside	Houghton Mifflin	1	1	11	6	1	1	14			f	
499	The Race	Windmill Books	1	1	39	5	2	2	54			f	
420	I Can Paint	Wright Group	1	1	14	2	1	1	35			f	
421	The Car Ride	Sundance	1	1	14	8	1	1	41			f	
422	The Circus Train	Sundance	1	1	14	8	1	1	48			f	
423	When The Circus Comes To Town	Sundance	1	1	14	9	1	1	40			f	
424	My Box	Rigby	1	1	15	7	1	1	30			f	
427	The Clown	Rigby Smart Start	1	1	15	8	1	1	13			f	
429	What Did Ben Want?	Rigby	1	1	15	8	1	1	28			f	
430	Where Is My Pet?	Rigby	1	1	15	8	1	1	34			f	
439	Ball games	Rigby	1	1	20	45	2	2	88			f	
443	The Ball Game	Literacy 2000,	1	1	22	4	2	2	16			f	
448	Stop!	Rigby	1	1	23	42	2	2	90			f	
450	I am Climbing	Literacy Tree	1	1	24	18	2	2	22			f	
455	Big and Little	Rigby	1	1	26	11	2	2	68			f	
1332	Clucky	Rigby PM	1	8	12	9	16	16	262			f	
1339	When the Moon Was Blue	Literacy Tree	1	8	12A	5	16	16	175			f	
1335	Riding Acorn	Pioneer Valley	1	8	15A	6	16	16	294			f	
1324	Eddy's Hair	Rigby Sails	1	6	16A	6	12	12	322			f	
1259	Too Much Noise	Literacy Tree	1	6	31	18	14	14	340			f	
1340	The Rocket Ship	Rigby PM	1	8	5	10	16	16	313			f	
1338	The Little Blue Horse	Rigby PM	1	8	4	13	16	16	311			f	
1284	The Dinosaur's Cold	Literacy Tree	1	8	34	30	18	18				f	
405	I Like Balloons	Dominie ,	1	1	11	3	1	1	27			f	
406	I Read	Dominie ,	1	1	11	5	1	1	38			f	
946	Bruno's Birthday	Literacy Tree	1	2	49	30	8	8	32			f	
953	Mrs. Wishy-washy	Wright Group	1	2	49B	4	8	8	102			t	
1263	Only An Octopus	Literacy Tree	1	6	32	30	14	14	236			f	
1030	The hungry giant 	Wright Group	1	2	73	5	10	10	183			t	
1222	Christmas Dog	Sunshine Books	1	6	25A	5	14	14	285	Christmas		f	
954	In a dark, dark wood	Wright Group	1	2	49B	14	8	8	81			t	
1254	The Ocean	Pioneer Valley	1	6	30A	5	14	14	362		Bella & Rosie	f	
1225	Jasper and the Cheese	Pioneer Valley	1	6	26	8	14	14	159		Jasper the Cat	f	
1250	Ten little garden snails	Rigby PM	1	6	30	11	14	14	101			f	
1336	Bella is a Bad Dog	Pioneer Valley	1	6	49	14	14	14	132		Bella and Rosie	f	
1226	Space Fairy	Pioneer Valley	1	6	44	6	14	14	182		Galaxy Girl	f	
392	A Zoo	Literacy Tree	1	1	8	22	1	1	14			f	
367	Fruit Salad	Literacy Tree	1	1	2	23	1	1	23			f	
1317	The Cat and The Dog	Literacy Tree	1	6	45A	14	14	14	248			f	
933	I Love Cats	Children's Press- Rookie Reader	1	2	45	8	8	8	116			t	
456	My Clothes	Rigby	1	1	26	16	2	2	36			f	
458	The Toy Box	Rigby PM Plus	1	1	26	6	2	2	49			f	
478	Follow the leader	Windmill Books	1	1	34	3	2	2	15			f	
394	Where is Gabby?	Pioneer Valley	1	1	8	16	1	1	21		Gabby	f	
433	Bella's Busy Day	Pioneer Valley	1	1	38A	32	2	2	36		Bella and Rosie	f	
441	One Day	Dominie Press	1	1	78B	5	3	4	48		Teachers Choice Series	f	
419	On the Line	Dominie Press	1	1	28	6	2	2	35			f	
3144	The Stranger's Gift (a play)	Literacy Tree	1	9	4	6	24	24		A Play		f	
3145	Alexander and the Wind-Up Mouse	Lionni, Leo	1	9	4	14	24	24				f	
3146	The Lucky Feather	Literacy Tree	1	9	5	4	24	24				f	
482	Where Can Kitty Sleep?	Windmill Books	1	1	34	3	2	2	15			f	
3147	Yellow Overalls	Literacy Tree	1	9	5	7	24	24				f	
479	Rain	Dominie	1	1	34	3	2	2	52			f	
442	Recess	Dominie Press	1	1	22	6	2	2	24		Teacher's Choice Series	f	
481	Where Are the Car Keys?	Windmill Books	1	1	34	5	2	2	41			f	
415	Dressing-Up	Rigby PM 	1	1	12	38	1	1	32			f	
483	Who Wears This Hat?	WrightGroup	1	1	34	10	2	2	42			f	
416	Pets	Rigby PM	1	1	12	23	1	1	33			f	
381	Little things	Rigby PM	1	1	6	30	1	1	33			f	
431	Big things	Rigby PM	1	1	16	24	1	1	33			f	
401	Playing	Rigby PM	1	1	10	23	1	1	39			f	
444	The skier	Rigby PM	1	1	22	15	2	2	42			f	
393	The Royal Family	Seedling Pub	1	1	1	6	1	1	17			f	
461	Colors In the City	Kaeden Group	1	1	1	2	1	1	61			f	
465	The Clown	Kaeden Group	1	1	5	4	1	1	29			f	
408	My Class	Seedling Pub	1	1	11	14	1	1	14			f	
409	Our School	Houghton Mifflin	1	1	11	3	1	1	12			f	
462	Eating	Wright Group	1	1	8	6	1	1	29			f	
385	Going to School	Rigby Smart Start	1	1	7	6	1	1	21			f	
386	In the Supermarket	Rigby Smart Start	1	1	7	8	1	1	24			f	
387	My Planet	Rigby Smart Start	1	1	7	6	1	1	28			f	
366	Up in the sky	Rigby PM Plus	1	1	41	10	2	2	56			f	
402	Splash!	Wright Group	1	1	54	4	3	4	34			f	
469	Who Reads?	Dominie Press	1	1	28	6	2	2	25		Teacher's Choice Series	f	
446	Two Plus Two	Dominie Collection	1	2	43	4	8	8	44		Teacher's Choice Series	f	
468	Happy Holidays	Dominie Press	1	1	28	5	2	2	27		Teacher's Choice Series	f	
418	My Glasses	Dominie Press	1	1	28	6	2	2	28		Teacher's Choice Series	f	
460	Catching	Dominie Press	1	1	27	7	2	2	35		Teacher's Choice Series	f	
445	Too Much	Dominie Press	1	1	22	6	2	2	27		Teacher's Choice Series	f	
1329	Saving Hoppo	Rigby PM	1	8	1A	13	16	16	316			f	
400	In our classroom	Rigby PM Plus	1	1	10	7	1	1	33			f	
413	Dinner Time for Bella and Rosie	Pioneer Valley	1	1	6A	20	1	1	31		Bella and Rosie	f	
490	A Little Seed	Rigby	1	1	37	8	2	2	18			f	
491	Books	Rigby	1	1	37	9	2	2	21			f	
492	Dinosaur Party	Rigby	1	1	37	8	2	2	25			f	
493	In the Bathroom	Rigby	1	1	37	8	2	2	24			f	
495	The Model	Rigby	1	1	37	8	2	2	18			f	
496	The Robber	Rigby	1	1	37	8	2	2	25			f	
501	Dressing Up	Rigby Smart Start	1	1	40	9	2	2	25			f	
377	Naughty Kitten!	Rigby Smart Start	1	1	5	3	1	1	18			f	
506	The Puzzle	Rigby Smart Start	1	1	40	7	2	2	32			f	
521	A Scrumptious Sundae	Literacy Tree	1	1	45	9	2	2	17			f	
522	The Giant's Breakfast	Literacy Tree	1	1	45	32	2	2	42			f	
523	Dreaming	Rigby	1	1	46	7	2	2	23			f	
524	Our House	Literacy Tree	1	1	46	17	2	2	25			f	
537	Monkey's Friends	Literacy Tree	1	1	51	11	3	3	36			f	
555	Going to Work	Literacy Tree	1	1	57	24	3	4	58			f	
562	In My Bed	Literacy Tree	1	1	59	27	3	4	57			f	
563	On Our Street	Sundance	1	1	59	6	3	4	52			f	
567	One Bee Got on the Bus	Ready Readers	1	1	60	5	3	4	43			f	
576	What I Like at School	Sundance	1	1	61	4	3	4	64			f	
577	Places	Sundance	1	1	61	8	3	4	88			f	
554	Looking down	Rigby	1	1	56	37	3	4	70			f	
570	What's the Time, Mr. Wolf?	Rigby	1	1	60	6	3	4	49			f	
569	That Fly	Ready Readers	1	1	60	6	3	4	26			f	
571	Bath Time	Wright Group	1	1	61	10	3	4	23			f	
544	A Birthday Cake for Ben	Rigby	1	1	53	20	3	4	71			f	
542	Teeny Tiny Tina	Literacy 2000,	1	1	52	28	3	4	34			f	
565	Nests	Wright Group	1	1	60	4	3	4	35			f	
566	New Shoes	WrightGroup	1	1	60	9	3	4	29			f	
560	At the Farm	Sundance	1	1	59	16	3	4	52			f	
541	I Like	Literacy Tree	1	1	52	17	3	4	24			f	
435	Playing Together	Pioneer Valley	1	1	17	31	2	2	66		Bella and Rosie	f	
557	Oh, Fiddlesticks!	Literacy Tree	1	1	57	5	3	4	60			f	
558	Our Shadows	Literacy Tree	1	1	57	20	3	4	54			f	
559	My accident	Rigby PM	1	1	58	47	3	4	49			f	
474	Ben's Red Car	Rigby	1	1	32	56	2	2	49			f	
449	After the Rain	Literacy Tree	1	1	92	14	3	4	48			f	
498	Show and Tell	Literacy Tree	1	1	39	19	2	2	32			f	
370	Who Likes Ice Cream?	Rigby	1	1	2	26	1	1	15			f	
389	Treasure Hunt	Rigby Smart Start	1	1	7	9	1	1	14			f	
556	Jump into Bed	Literacy Tree	1	1	57	19	3	4	51			f	
434	Snow Fun	Pioneer Valley	1	1	38A	32	2	2	37		Bella and Rosie	f	
437	Where are the babies?	Rigby PM	1	1	18	51	2	2	81			f	
438	Cat and Mouse	Rigby PM	1	1	19	43	2	2	75			f	
485	Playing Outside	Rigby PM	1	1	82	12	3	4	56			f	
395	Dad	Rigby PM 	1	1	9	27	1	1	24			f	
471	Sally's new shoes	Rigby PM	1	1	29	44	2	2	58			f	
497	Out in the weather	Rigby PM	1	1	38	48	2	2	56			f	
472	Packing my bag	Rigby PM	1	1	30	40	2	2	52			f	
3148	A House is a House for Me	Hoberman, Mary Ann	1	9	6	14	24	24				t	
505	The Animals Went to Bed	Rigby Smart Start	1	1	40	8	2	2	32			f	
502	Hide and seek	Rigby Smart Start	1	1	11	6	1	1	38			f	
564	Shopping	Sundance	1	1	59	15	3	4	78			f	
597	Row Your Boat	Literacy Tree	1	1	68	4	3	4	18			f	
527	The go-carts	Rigby	1	1	47	13	2	2	46			f	
528	Time for dinner	Rigby PM Collection	1	1	47	15	2	2	38			f	
466	The shopping mall	Rigby PM	1	1	27	11	2	2	44			f	
575	On Safari	Rigby	1	1	10	5	1	1	28			f	
545	Animals	Rigby Smart Start	1	1	14	7	1	1	28			f	
503	My Home	Rigby Smart Start	1	1	14	9	1	1	28			f	
447	We go out	Rigby PM	1	1	8A	7	1	1	41			f	
494	The Iron Horse	Rigby Smart Start	1	1	7	8	1	1	21			f	
489	My Sand Castle	Rigby PM	1	1	82	15	3	4	44			f	
546	Be Quiet!	Rigby	1	1	40	8	2	2	25			f	
549	Spooky Pet	Rigby	1	1	40	9	2	2	24			f	
500	The Surprise Party	Literacy Tree	1	1	93	12	3	4	85			f	
573	Getting There	Wright Group	1	1	27	5	2	2	36			f	
578	Places	Dominie Collection	1	1	61	5	3	4	76		Teacher's Choice Series	f	
550	Tim's Paintings	Rigby	1	1	7	5	1	1	32			f	
574	Going to the Beach	Sundance	1	2	36	4	8	8	30			f	
520	Don't Wake the Baby	Literacy Tree	1	1	45	29	2	2	18			f	
487	Big Sea Animals	Rigby PM	1	1	36	13	2	2	79			f	
457	My little cat	Rigby PM	1	1	26	13	2	2	57			f	
488	Going out	Rigby PM	1	1	36	16	2	2	48			f	
602	I Spy	Literacy Tree	1	1	69	21	3	3	25			f	
604	Mud Pie	Literacy Tree	1	1	69	17	3	4	14			f	
622	Bags, Cans, Pots, and Pans	Ready Readers	1	1	76a	6	3	4	56			f	
623	Ben's Pets	Ready Readers	1	1	76a	6	3	4	30			f	
627	Six Go By	Modern Curr. Press	1	1	76c	6	3	4	24			f	
631	Barn Dance	Wright Group	1	1	77	4	3	4	47			f	
636	What I Left on My Plate	Dominie Press	1	1	78	6	3	4	54			f	
637	A Raindrop	Dominie Press	1	1	78a	6	3	4	41			f	
640	Lots of Dogs	Dominie Press	1	1	78a	7	3	4	68			f	
642	On The Road	Dominie Press	1	1	78a	6	3	4	47			f	
643	The Picnic	Dominie Press	1	1	78a	4	3	4	48			f	
645	First and Last	Dominie Press	1	1	78b	5	3	4	44			f	
651	Little Hearts	Wright Group	1	1	78b	5	3	4	44			f	
655	Mae-Nerd	Dominie Press	1	1	78c	6	3	4	44			f	
656	Merry-Go-Round	Dominie Press	1	1	78c	6	3	4	66			f	
658	Ready for School	Dominie Press	1	1	78c	6	3	4	41			f	
659	What Did They Want?	Rigby	1	1	78c	8	3	4	28			f	
660	The Dressing-Up Box	Wright	1	1	78c	4	3	4	61			f	
663	Hungry Bear	Rigby	1	1	79	3	3	4	22			f	
664	Magic Food	Rigby	1	1	79	8	3	4	26			f	
666	Time for Bed	Rigby Smart Start	1	1	79	3	3	4	28			f	
670	Bubbles	Literacy 2000,	1	1	81	4	3	4	33			f	
515	A Yummy Lunch	Pioneer Valley	1	1	44	13	2	2	22			f	
615	Hot dogs	Rigby PM	1	1	74	20	3	4	84			f	
606	The baby owls	Rigby PM	1	1	70	23	3	4	90			f	
669	The Fox	Owen Publishers	1	1	80	7	3	4	24			f	
626	What Is It?	FCPS	1	1	76b	15	3	4	31			f	
621	Animals At the Zoo	FCPS	1	1	76a	12	3	4	35			f	
580	Frogs Can Jump	The Wright Group	1	1	62	6	3	4	41			f	
581	Sam and Bingo	Rigby	1	1	62	2	3	4	53			f	
582	Sam's Balloon	Rigby	1	1	62	2	3	4	54			f	
624	Baby in the Cart	Wright Group	1	1	76b	4	3	4	84			f	
634	At the Library	Rigby	1	1	78	43	3	4	69			f	
585	Don't Leave Anything Behind!	Rigby	1	1	64	26	3	4	22			f	
587	Under My Bed	Literacy 2000,	1	1	64	6	3	4	42			f	
399	Moms and Dads	Rigby PM	1	1	3	25	1	1	36			f	
589	My Little Dog	Literacy Tree	1	1	65	19	3	4	102			f	
601	Getting Ready for the Ball	Literacy Tree	1	1	69	20	3	4	27			f	
605	Sharing	Literacy Tree	1	1	69	16	3	4	24			f	
607	The lazy pig	Rigby PM	1	1	70	18	3	4	78			f	
608	Tiger, Tiger	Rigby	1	1	71	20	3	4	55			f	
519	We went To The Zoo	Sundance	1	1	46A	8	2	2	32			f	
613	Cat and Mouse	Literacy Tree	1	1	73	19	3	4	62			f	
598	Too Many Clothes	Literacy Tree	1	1	68	14	3	4	31			f	
551	Four ice creams	Rigby PM	1	1	55	39	3	4	61			f	
632	How to Make a Hot Dog	Wright Group	1	1	77	3	3	4	48	How to books		f	
610	Hedgehog is hungry	Rigby PM	1	1	72	25	3	4	76			f	
453	The Treasure Hunt	Literacy Tree	1	1	24	16	2	2	27			f	
588	Cat Food	Literacy Tree	1	1	65	20	3	4	35			f	
646	How to Make Can Stilts	Wright Group	1	1	78b	5	3	4	28	How to books		f	
514	The way I go to school	Rigby PM	1	1	43	24	2	2	53			f	
679	Hide and Seek	Rigby PM	1	2	18	21	6	6	108			f	
614	The Giant's Day Out	Rigby	1	1	28	8	2	2	26			f	
641	My Pumpkin	Dominie Press	1	1	78a	6	3	4	52	Autumn		f	
639	I Can Taste	Dominie Press	1	1	78a	7	3	4	31	Senses		f	
657	Noises!!!	Dominie Press	1	1	78c	7	3	4	98			f	
440	Climbing	Rigby PM	1	1	21	23	2	2	48			f	
644	Doctor Boondoggle	Wright Group	1	2	1A	6	6	6	52			f	
638	All About Dinosaurs	Dominie Press	1	1	78a	2	3	4	32		Teacher's Choice Series	f	
654	Yes, I Can	Dominie Press	1	1	78B	7	3	4	30		Teachers Choice Series	f	
647	Hungry Kitten	Dominie Press	1	1	78B	6	3	4	50		Teachers Choice Series	f	
648	I Can Read	Dominie Press	1	1	78B	5	3	4	38		Teachers Choice Series	f	
650	Levi Sings	Dominie Press	1	1	78B	5	3	4	29		Teachers Choice Series	f	
652	The Big Barn	Dominie Press	1	1	78B	5	3	4	81		Teachers Choice Series	f	
535	Bubbles in the Sky	PM Stars	1	1	85	12	3	4	57		Max and Grandpa	f	
700	Breakfast	Wright Group	1	1	92	5	3	4	35			f	
702	My Dream	Oxford	1	1	92	6	3	4	34			f	
726	Moccasins	Twig Books	1	1	16	5	1	1	20			f	
728	Umbrella	Wright Group	1	1	77	5	3	4	73			f	
733	Costume Party	Benchmark	1	1	78d	6	3	4	64			f	
734	A Party for Rabbit	Benchmark	1	1	78d	6	3	4	70			f	
620	The flower girl	Rigby PM	1	1	76	24	3	4	90			f	
680	Tom is brave	Rigby PM	1	2	12	26	6	6	57			f	
740	Where is Peanut?	Pioneer Valley	1	2	1	12	6	6	71			f	
723	My New Bike	FCPS,	1	1	103	12	3	4	33			f	
697	Going To McDonald's	FCPS,	1	1	91	12	3	4	43			f	
708	Who Helps You?	FCPS	1	1	95	12	3	4	33			f	
709	Friends	FCPS	1	1	96	12	3	4	42			f	
761	On Vacation	Sundance	1	2	4	6	6	6	88			f	
749	On the Playground	FCPS	1	2	2	16	6	6	44			f	
790	The Pumpkin Patch	FCPS	1	2	6	13	6	6	51			f	
617	My little dog	Rigby PM	1	1	75	42	3	4	90			f	
794	Meeka	FCPS	1	2	7	13	6	6	42			f	
744	The Pirate and the Parrot	Literacy Tree	1	2	1A	18	6	6	85			f	
745	I Love Chickens	Wright Group	1	2	1A	4	6	6	67			f	
746	Elevator	Wright Group	1	2	1A	3	6	6	90			f	
451	In the Sand	Literacy Tree	1	1	79	17	3	4	39			f	
750	Where is Hannah?	Rigby PM	1	2	2	22	6	6	143			f	
751	Baby Hippo	Rigby PM	1	2	2A	20	6	6	117			f	
753	Jolly Roger, the pirate	Rigby PM	1	2	2A	28	6	6	138			f	
759	I Like the Rain	Literacy Tree	1	2	3A	15	6	6	96			f	
760	Ben's Teddy Bear	Rigby	1	2	3A	23	6	6	68			f	
768	Fantail, Fantail	Learning Media	1	2	5	5	6	6	67			f	
678	Let Me In!	Literacy Tree	1	2	59A	18	8	8	115			f	
786	Roll Over	Literacy Tree	1	2	6	8	6	6	182			f	
792	Up and Down the Hill	Benchmark	1	2	6A	6	6	6	78			f	
729	Go, go, go	Wright Group	1	1	10	7	1	1	17			f	
667	Fast, Faster, Fastest	Twig Books	1	1	80	6	3	4	66			f	
732	A Monster Sandwich	Wright Group	1	1	80	3	3	4	36			f	
676	Hot Potato and Cold Potato	Wright Group	1	1	84	6	3	4	77			f	
682	Little Chimp and Big Chimp	Rigby PM	1	1	86	12	3	4	66		Little Chimp	f	
747	In a Minute	Literacy Tree	1	2	2	15	6	6	74			f	
698	At The Pool	Wright Group	1	1	92	5	3	4	64			f	
695	Sssh!	Wright Group	1	1	90	5	3	4	49			f	
694	I Like Painting	Sundance	1	1	90	7	3	4	68			f	
579	Baby Lamb's first drink	Rigby PM	1	1	62	27	3	4	64			f	
731	Chicken for Dinner	Wright Group	1	1	76a	5	3	4	27			f	
583	Can you see the eggs?	Rigby PM	1	1	63	38	3	4	87			f	
793	Horace	Wright Group	1	2	6A	6	6	6	56			f	
730	If You Meet a Dragon...	Wright Group	1	1	73	6	3	4	31			f	
596	Here's What I Made	Literacy 2000,	1	1	68	30	3	4	38			f	
595	Dressing Up	Literacy 2000,	1	1	68	30	3	4	31			f	
592	Wake Up, Dad	Rigby PM	1	1	66	28	3	4	67		Kate, James, and Nick	f	
616	The merry-go-round	Rigby PM	1	1	74	32	3	4	84		Kate, James, and Nick	f	
590	The little snowman	Rigby PM	1	1	65	14	3	4	59			f	
591	The big kick	Rigby PM	1	1	66	25	3	4	67			f	
538	Little Chimp	Rigby PM	1	1	51	12	3	4	52		Little Chimp	f	
536	We can run	Rigby PM	1	1	50	46	3	4	77			f	
802	Snow Walk	Dominie 	1	2	7A	4	6	6	32			f	
801	Just Like Me!	Sunshine	1	2	7A	3	6	6	62			f	
548	Lost!	Rigby	1	1	28	7	2	2	18			f	
810	Monkey on the Roof	Rigby PM	1	2	8	3	6	6	92			f	
811	Sam's Picnic	Rigby PM	1	2	8	3	6	6	104			f	
816	The Scarecrow	Sundance	1	2	8	12	6	6	97			f	
818	The Chick and the Duckling	Aladdin Books	1	2	8A	4	6	6	112			f	
807	Jack's Seed	FCPS	1	2	8	12	6	6	56			f	
706	Dan, The Flying Man	Shortland Publication	1	1	93	3	3	4	60			f	
785	Buzz Off, Bee	Literacy Tree	1	2	6	11	6	6	85			f	
599	What Did Kim Catch?	Literacy Tree	1	1	68	32	3	4	48			f	
553	The photo book	Rigby PM	1	1	55	21	3	4	76		Kate, James, and Nick	f	
815	The Merry-Go-Round	Ready Readers	1	1	92	5	3	4	45			f	
701	Mrs. Cook's Hats	Kaeden Group	1	1	5	5	1	1	31			f	
704	Ben's treasure hunt	Rigby PM	1	2	14	28	6	6	102			f	
743	At the Playground	Sundance	1	1	80	20	3	4	86			f	
3150	The Small Potatoes Club	Ziefert, Harriet	1	9	7	9	24	24			Small Potatoes	f	
653	Winter Fun	Dominie Press	1	1	1	6	1	1	13	Winter		f	
693	Greedy Cat is Hungry	Cowley	1	2	28	8	6	6	103			f	
699	Blackberries	Rigby PM	1	2	14	23	6	6	107			f	
752	Brave Father Mouse	Rigby PM	1	2	37	20	8	8	92			f	
791	Who Can See the Camel?	Wright Group	1	1	87	4	3	4	76			f	
690	At the Park	Sundance	1	2	11	6	6	6	91			f	
738	Sandy Gets a Leash	Rigby PM Stars	1	2	22	6	6	6	120			f	
368	Ouch!	Rigby	1	1	2	30	1	1	40			f	
844	Snowflakes	Kaeden Group	1	2	17	4	6	6	49			f	
847	Our Teacher, Miss Pool	Cowley	1	2	18	4	6	6	62			f	
848	Sam Writes	Wright Group	1	2	18	5	6	6	62			f	
852	Shadows	FCPS	1	2	20	12	6	6	45			f	
853	The big hit	Rigby PM	1	2	20	15	6	6	120			f	
858	Pizza Day	FCPS	1	2	22	16	6	6	63			f	
860	Baby's Birthday	Literacy 2000	1	2	23	4	6	6	54			f	
861	Baked Potatoes	Wright	1	2	23	3	6	6	73			f	
863	Fun	Kaeden Group	1	2	23	3	6	6	45			f	
864	Little Chimp runs away	Rigby PM	1	2	23	6	6	6	104			f	
866	Billy can count	Rigby PM	1	2	24	11	6	6	122			f	
870	The Toytown fire engine	Rigby PM	1	2	24	9	6	6	105			f	
872	Sam and the waves	Rigby PM	1	2	25	12	6	6	122			f	
873	Speedy Bee	Rigby PM	1	2	25	13	6	6	106			f	
874	Walk, ride, run	Rigby PM	1	2	25	14	6	6	116			f	
896	Dilly Duck and Dally Duck	Rigby PM	1	2	17	11	6	6	139			f	
713	The hungry kitten	Rigby PM	1	2	12	20	6	6	95			f	
837	Choosing a Puppy	Rigby PM	1	2	44	17	8	8	158			f	
662	Happy Birthday!	Literacy Tree	1	1	79	24	3	4	28			f	
707	We like fish	Rigby PM	1	2	16	50	6	6	109			f	
736	Ella and the Toy Rabbit	Rigby PM Stars	1	2	9A	6	6	6	108		Ella	f	
718	Mumps	Rigby PM	1	2	6A	21	6	6	112			f	
850	The Wide Mouthed Frog	Literacy Tree	1	2	49	30	8	8	121			f	
737	The Big Helicopter	Rigby PM Stars	1	2	34	6	8	8	125		Matthew and Emma	f	
869	Lucky goes to dog school	Rigby PM	1	2	37	18	8	8	127			f	
841	Taking Pictures	Alpha Kids	1	2	57	6	8	8	137			f	
839	Visitors	Literacy Tree	1	2	57	11	8	8	46			f	
879	City Storm	Wright Group	1	2	61	5	8	8	180			f	
883	Grandpa Knits Hats	Wright Group	1	2	61	6	8	8	55			f	
843	Here come the shapes	Rigby PM	1	2	61	16	8	8	118			f	
884	My Tiger Cat	Kaeden Group	1	2	63	5	8	8	76			f	
886	The Package	Kaeden Group	1	2	63	5	8	8	35			f	
881	Fluffy Chicks	Wright Group	1	2	64A	5	8	8	50			f	
890	Sam goes to school	Rigby PM	1	2	35	13	8	8	131			f	
891	The big yellow castle	Rigby PM	1	2	35	10	8	8	135			f	
685	Screech!	Rigby Literacy Tree	1	2	15A	30	6	6	41			f	
859	A Tree Fell Over the River	Sundance	1	1	87	5	3	4	72			f	
842	Ben's Dad	Rigby PM	1	2	32	26	8	8	103			f	
857	Baby Bear goes fishing	Rigby PM	1	2	32	28	8	8	112			f	
871	Red Squirrel hides some nuts	Rigby PM	1	2	46	10	8	8	128			f	
826	Walking in the Jungle	Sundance	1	2	33	6	8	8	113			f	
854	The new baby	Rigby PM	1	2	33	22	8	8	133			f	
905	Mother's Day	Rigby PM	1	2	40	14	8	8	118			f	
887	Washing Our Dog	Sundance	1	6	31	5	14	14	120			f	
711	You Can Play Soccer	FCPS	1	1	97	12	3	4	37	Sports, Soccer		f	
831	My Five Senses	FCPS	1	2	10	30	6	6	59			f	
876	No Recess	FCPS	1	2	26	16	6	6	61			f	
504	On the Beach	Rigby Smart Start	1	1	40	7	2	2	28			f	
705	The bumper cars	Rigby PM	1	1	93	15	3	4	94			f	
838	The Boogly	Literacy Tree	1	2	38	31	8	8	61			f	
568	Sally and the Daisy	Rigby PM	1	1	60	31	3	4	60		Sally	f	
618	Photo time	Rigby PM	1	1	76	16	3	4	59		Jack and Billy	f	
819	My Brown Cow	Wright Group	1	2	8A	3	6	6	62			f	
820	Where is Skunk?	Wright Group	1	2	8A	6	6	6	65			f	
821	At the Fair	Sundance	1	2	9	4	6	6	115			f	
827	Where Can a Hippo Hide? 	Ready Readers	1	2	9A	6	6	6	41			f	
828	Yes, I Can!	Ready Readers	1	2	9A	6	6	6	45			f	
885	Nick's Glasses	Learning Media,Ltd	1	2	29	4	8	8	52			f	
895	A crocodile and a whale	Rigby PM	1	2	35	14	8	8	127			f	
894	New boots	Rigby PM	1	2	34	11	8	8	127			f	
899	Mr. Wolf Leaves Town	Alpha Kids	1	2	37	4	8	8	208			f	
901	Jolly Roger and the treasure	Rigby PM	1	2	39	18	8	8	129			f	
903	My New School	FCPS	1	2	39	12	8	8	63			f	
906	The leaf boats	Rigby PM	1	2	40	14	8	8	132			f	
867	Bread for the ducks	Rigby PM	1	2	24	8	6	6	109			f	
675	Amy Goes to School	Literacy Tree	1	2	28	35	6	6	90			f	
633	Kitty and the birds	Rigby PM	1	1	77	24	3	4	64			f	
851	Timmy	Literacy 2000	1	2	38	28	8	8	54			f	
840	A Piece of Paper	Literacy Tree	1	2	15A	18	6	6	85			f	
877	Sally and the sparrows	Rigby PM	1	2	59A	19	8	8	151		Sally	f	
677	I Am a Cat	Literacy Tree	1	2	94	12	10	10	65			f	
957	Jumbo	Rigby PM	1	2	50	10	8	8	133			f	
961	Sitting	Literacy Tree	1	2	51	13	8	8	46			f	
962	Snowy Gets a Wash	Rigby PM	1	2	51	21	8	8	181			f	
963	Go Back to Sleep	Literacy Tree	1	2	52	25	8	8	74			f	
964	Going Fishing	Literacy 2000	1	2	52	5	8	8	26			f	
965	Guess What Kind of Ball	Kaeden Group	1	2	52	5	8	8	219			f	
972	Just Like Grandpa	Literacy Tree	1	2	54	30	8	8	81			f	
974	Hermit Crab	Rigby PM	1	2	55	14	8	8	111			f	
975	Little Bulldozer	Rigby PM	1	2	55	21	8	8	170			f	
977	Secret Soup	Literacy Tree	1	2	57	37	8	8	51			f	
978	A Party for Brown Mouse	Rigby PM	1	2	58	6	8	8	149			f	
979	Katie's Caterpillar	Rigby PM	1	2	58	10	8	8	149			f	
980	Look out for Bingo	Rigby PM	1	2	58	12	8	8	138			f	
981	Max Rides His Bike	Rigby PM	1	2	58	8	8	8	143			f	
984	My Bike	Learning Media	1	2	59	4	8	8	109			f	
985	Roar Like A Tiger	Rigby PM	1	2	59	10	8	8	148			f	
986	Jumper	Literacy Tree	1	2	60	35	8	8	125			f	
988	Max and the little plant	Rigby PM	1	2	62	16	8	8	134			f	
989	Max goes fishing	Rigby PM	1	2	62	13	8	8	147			f	
992	Kitty Cat plays inside	Rigby PM	1	2	63	11	8	8	134			f	
994	A friend for little white rabbit	Rigby PM	1	2	64	18	8	8	113			f	
996	The little white hen	Rigby PM	1	2	65	13	8	8	159			f	
1024	Baby Bear climbs a tree	Rigby PM	1	2	72	9	10	10	147			f	
1027	The Fire on Toytown hill	Rigby PM	1	2	72	10	10	10	166			f	
1026	Little Chimp and the bees	Rigby PM	1	2	72	15	10	10	160			f	
956	I'm a Big Brother	FCPS	1	2	50	13	8	8	79			f	
966	Guess What!	Literacy Tree	1	2	52	33	8	8	28			f	
991	I can squeak	Windmill Books	1	2	63	5	8	8	154			f	
995	Seagull is clever	Rigby PM	1	2	64	32	8	8	98			f	
976	Tiny and the big wave	Rigby PM	1	2	95	25	10	10	163			f	
935	Valentine's Day	Wright Group	1	1	87	3	3	4	49			f	
928	What We Like	Sundance	1	2	11	6	6	6	71			f	
967	A lucky day for Little Dinosaur	Rigby PM	1	2	67	21	10	10	135			f	
929	Katie Did It	Children's Press	1	6	22	10	12	12	104			f	
922	Splishy-Sploshy	Wright Group	1	6	12	7	12	12	127			f	
855	A Hungry Puppy	Pioneer Valley	1	2	21	14	6	6	103		Bella and Rosie	f	
862	Bella and Rosie Play Hide and Seek	Pioneer Valley	1	2	23	13	6	6	118		Bella and Rosie	f	
1060	Birthday Balloons	Rigby PM 	1	2	79	11	10	10	182			f	
1062	Dad Didn't Mind At All	Literacy Tree	1	2	80	33	10	10	127			f	
1063	Good Night, Little Brother	Literacy Tree	1	2	80	32	10	10	68			f	
1064	Jane's car	Rigby PM	1	2	81	11	10	10	121			f	
1065	The house in the tree	Rigby PM	1	2	81	10	10	10	202			f	
1067	Baby Bear's Hiding Place	Rigby PM 	1	2	82	16	10	10	187			f	
1068	Little Bulldozer helps again	Rigby PM	1	2	82	10	10	10	197			f	
1070	The house on the hill	Rigby PM	1	2	82	15	10	10	189			f	
1118	Daniel	Literacy Tree	1	2	91	20	10	10	161			f	
1119	A Beaver Tale	Wright Group	1	2	64A	4	8	8	228			f	
1120	Under the Big Top	Wright Group	1	2	64A	13	8	8	103			f	
1122	Around My School	Rigby	1	2	56	4	8	8	60			f	
1123	A Bear Lived in a Cave	Sundance	1	2	24	7	6	6	102			f	
1124	Look Out!	Literacy Tree	1	1	23	7	2	2	15			f	
780	I Can Help 	Domine Collection	1	2	5A	5	6	6	65		Teachers Choice Series	f	
805	Family Soccer	Kaeden Group	1	2	8	5	6	6	55	Sports, Soccer		f	
950	The Secret Message	Literacy Tree	1	2	49A	30	8	8	68			f	
952	The Fantastic Cake	Wright Group	1	2	49B	3	8	8	169			f	
999	Moving Day	Rigby	1	2	66	7	10	10	55			f	
1000	The Biggest Cake in the World	Cowley	1	2	66	12	10	10	120			f	
1001	What Do I See In the Garden?	Wright Group	1	2	66	5	10	10	108			f	
1017	Where's Sylvester's Bed?	Wright Group	1	2	70	10	10	10	78			f	
1015	Oh No!	Rigby	1	2	70	5	10	10	122			f	
1014	Nana's Orchard	Kaeden Group	1	2	70	5	10	10	92			f	
1009	The beach house	Rigby PM	1	2	68	15	10	10	164			f	
1008	Kitty Cat and the paint 	Rigby PM	1	2	68	10	10	10	165			f	
1007	Brown Mouse plays a trick	Rigby PM	1	2	68	10	10	10	155			f	
1006	Bingo goes to school	Rigby PM	1	2	68	12	10	10	171			f	
1018	Night Walk	Owen Publications	1	2	71	7	10	10	51			f	
1020	Rosie's Walk	Scholastic	1	2	71	12	10	10	32			f	
1021	Sick in Bed	Sundance	1	2	71	4	10	10	109			f	
1028	Across the Stream	Mulberry Books	1	2	73	6	10	10	94			f	
1029	Nothing in the Mailbox	Owen	1	2	73	11	10	10	73			f	
1031	Billy at school	Rigby PM	1	2	74	10	10	10	163			f	
1032	Look! I Can Read!	Scholastic	1	2	74	7	10	10	120			f	
1052	Cars	Puffin/Unicorn	1	2	77	5	10	10	72			f	
1053	When I Was Sick	Literacy Tree	1	2	77	29	10	10	53			f	
1054	Bossy Bettina	Literacy Tree	1	2	77	15	10	10	97			f	
1058	The Hungry Giant's Lunch	Wright Group	1	2	78	4	10	10	140			f	
1059	Come to My House!	Sunshine	1	2	78	3	10	10	131			f	
1025	Bugs for breakfast	Rigby PM	1	2	72	10	10	10	158			f	
973	The Storm	Literacy Tree	1	2	54	29	8	8	33			f	
960	Fire! Fire!	Rigby PM	1	2	51	20	8	8	164			f	
3152	The Small Potatoes and the Sleep-Over	Ziefert, Harriet	1	9	8	3	24	24			Small Potatoes	f	
3153	The Small Potatoes and the Magic Show	Ziefert, Harriet	1	9	8	3	24	24			Small Potatoes	f	
3154	Charlie	Literacy Tree	1	9	9	6	24	24				f	
3155	Alfie's Gift	Literacy Tree	1	9	9	4	24	24				f	
3156	Once When I Was Shipwrecked	Literacy Tree	1	9	9	4	24	24				f	
3157	Trees Belong to Everyone	Literacy Tree	1	9	9	4	24	24				f	
3158	Oh, What a Daughter!	Literacy Tree	1	9	10	7	24	24				f	
3159	The Selfish Giant	Literacy 2000	1	9	10	3	24	24				f	
3161	King Beast's Birthday	Literacy Tree	1	9	10	5	24	24				f	
3162	The Mystery of the Big Paw Print	Cosson, M.J.	1	9	11	15	24	24		Mystery	Kooties Club Mystery	f	
3163	The Mystery of the Flying Mummy	Cosson, M.J.	1	9	12	6	24	24		Mystery	Kooties Club Mystery	f	
3164	The Mystery of Mr. Dodge	Cosson, M.J.	1	9	12	11	24	24		Mystery	Kooties Club Mystery	f	
3166	The Mystery of Ben Franklin's Ghost	Cosson, M.J.	1	9	13	14	24	24		Mystery	Kooties Club Mystery	f	
3167	The Mystery of Apartment A-13	Cosson, M.J.	1	9	14	3	24	24		Mystery	Kooties Club Mystery	f	
3168	The Mystery of the Old Knife	Cosson, M.J.	1	9	14	9	24	24		Mystery	Kooties Club Mystery	f	
3169	The Mystery of the Icky Icon	Cosson, M.J.	1	9	14	3	24	24		Mystery	Kooties Club Mystery	f	
3171	The Mystery of I Love Elvis	Cosson, M.J.	1	9	15	14	24	24		Mystery	Kooties Club Mystery	f	
3172	The Mystery of the Last Laugh	Cosson, M.J.	1	9	15	5	24	24		Mystery	Kooties Club Mystery	f	
3173	The Mystery of the Too Crisp Cash	Cosson, M.J.	1	9	16	12	24	24		Mystery	Kooties Club Mystery	f	
3174	The Mystery of the PB & J Jam	Cosson, M.J.	1	9	16	3	24	24		Mystery	Kooties Club Mystery	f	
3175	Magic All Around	Literacy 2000	1	9	18	4	24	24				f	
1061	The duck with a broken wing	Rigby PM	1	2	79	27	10	10	189			f	
892	The Loose Tooth	Pioneer Valley	1	2	31	9	6	6	134		Galaxy Girl	f	
3176	Pete's Story	Literacy 2000	1	9	18	3	24	24				f	
1114	Magpie's baking day	Rigby PM	1	2	101	22	10	10	132			f	
1045	Roy G. Biv 	Wright Group	1	2	9A	5	6	6	68			f	
1038	A Bug, a Bear, and a Boy And the Bath	Scholastic	1	2	59A	6	8	8	74			f	
1037	A Bug, a Bear, and a Boy Play Hide-and-Seek	Scholastic	1	2	59A	9	8	8	67			f	
1036	A Bug, a Bear, and a Boy Plant A Garden	Scholastic	1	2	59A	5	8	8	66			f	
1039	A Bug, a Bear, and a Boy Go for a Ride	Scholastic	1	2	59A	4	8	8	83			f	
1066	Tiger runs away	Rigby PM	1	6	10	9	12	12	213			f	
1035	A Bug, a Bear, and a Boy Fly a Kite	Scholastic	1	6	10	4	12	12	125			f	
3181	Horrible Harry and The Green Slime	Kline, Suzy	1	9	19	7	24	24			Horrible Harry	f	
3182	Two Red Tugs	Rigby PM	1	9	20	10	24	24				f	
3183	Mack's Big Day	Rigby PM Plus	1	9	20	11	24	24				f	
3184	The Monster in Room 202	Troll	1	9	20	4	24	24				f	
3185	Cam Jansen and the Mystery of the Stolen Diamonds	Adler, David	1	9	21	14	24	24		Mystery	Cam Jansen	f	
3186	Cam Jansen and the Mystery of the U.F.O.	Adler, David	1	9	21	8	24	24		Mystery	Cam Jansen	f	
3187	Cam Jansen and the Mystery of the Gold Coins	Adler, David	1	9	22	9	24	24		Mystery	Cam Jansen	f	
3188	Cam Jansen and the Mystery of the Stolen Corn Popper	Adler, David	1	9	22	10	24	24		Mystery	Cam Jansen	f	
3189	Cam Jansen and the Mystery of the Circus Clown	Adler, David	1	9	23	12	24	24		Mystery	Cam Jansen	f	
3191	Cam Jansen and the Mystery at the Haunted House	Adler, David	1	9	23	2	24	24		Mystery	Cam Jansen	f	
3192	Cam Jansen and the Mystery of the Television Dog	Adler, David	1	9	24	11	24	24		Mystery	Cam Jansen	f	
3193	Cam Jansen and the Chocolate Fudge Mystery	Adler, David	1	9	24	10	24	24		Mystery	Cam Jansen	f	
3194	Cam Jansen and the Mystery of the Babe Ruth Baseball	Adler, David	1	9	25	12	24	24		Mystery	Cam Jansen	f	
3195	Cam Jansen and the Mystery at the Monkey House	Adler, David	1	9	25	6	24	24		Mystery	Cam Jansen	f	
3196	Cam Jansen and the Mystery of the Dinosaur Bones	Adler, David	1	9	26	21	24	24		Mystery	Cam Jansen	f	
3197	Cam Jansen and the Mystery of the Carnival Prize	Adler, David	1	9	27	11	24	24		Mystery	Cam Jansen	f	
3198	Cam Jansen and the Mystery of the Monster Movie	Adler, David	1	9	27	4	24	24		Mystery	Cam Jansen	f	
3199	Silver and Prince	Rigby PM 	1	9	29	8	24	24				f	
3200	The Bully	Rigby PM Plus	1	9	29	6	24	24		Bullying		f	
3201	The Forgotten Princess	Literacy Tree	1	9	29	8	24	24				f	
3202	The Gooey Chewy Contest	Mondo	1	9	30	20	24	24				f	
3203	Rosie's Story	Mondo	1	9	31	20	24	24				f	
3204	Amelia Bedelia	Parish, Peggy	1	9	32	4	24	24			Amelia Bedelia	f	
1445	Wheels	Literacy Tree	2	1	15	5	3	3	27			f	
1358	The Van	Pioneer Valley	1	1	61A	18	3	4	55			f	
1360	Having Fun	Pioneer Valley	1	1	64	18	3	4	35			f	
1359	My Black Cat	Pioneer Valley	1	1	72	18	3	4	52			f	
1356	Splashing Dad	Pioneer Valley	1	1	71	18	3	4	37			f	
898	Daniel's Basketball Team	Dominie Collection	1	2	36	5	8	8	80	Basketball		f	
913	The Home Run	Dominie Collection	1	2	41	4	8	8	92	Sports, Baseball	Teachers Choice Series	f	
3190	Cam Jansen and the Mystery of Flight 54	Adler, David	1	9	23	6	24	24		Mystery	Cam Jansen	f	
3165	The Mystery of the Gross Gift	Cosson, M.J.	1	9	13	6	24	24		Mystery	Kooties Club Mystery	f	
3170	The Mystery of the Missing Heart	Cosson, M.J.	1	9	14	8	24	24		Mystery	Kooties Club Mystery	f	
3160	Rabbit Stew	Literacy 2000	1	9	10	4	24	24				f	
3177	A Silent World	Literacy Tree	1	9	18	6	24	24				f	
3205	Come Back, Amelia Bedelia	Parish, Peggy	1	9	32	4	24	24			Amelia Bedelia	f	
3206	Good Work, Amelia Bedelia	Parish, Peggy	1	9	32	4	24	24			Amelia Bedelia	f	
3207	Happy Haunting, Amelia Bedelia	Parish, Peggy	1	9	32	4	24	24		Halloween	Amelia Bedelia	f	
3209	Winter on the Ice	Rigby PM Plus	1	9	34	15	24	24				f	
3210	Dad's Pasta	Rigby Sails	1	9	34	4	24	24				f	
3211	McGinty's Friend	Rigby Sails	1	9	34	4	24	24				f	
3212	The Red Shoes	Rigby Sails	1	9	34	4	24	24				f	
3213	The Adventures of Granny Gatman	Dominie Press	1	9	35	5	24	24				f	
3214	Awumpalema	Literacy Tree	1	9	35	6	24	24				f	
3215	A Pocketful of Acorns	Dominie Press	1	9	35	4	24	24				f	
3216	Lionel and Amelia	Mondo	1	9	36	20	24	24				f	
3217	Grumpy Pumpkins	Delton, Judy	1	9	37	4	24	24			Pee Wee Scouts	f	
3218	Lucky Dog Days	Delton, Judy	1	9	37	9	24	24			Pee Wee Scouts	f	
3219	Peanut-Butter Pilgrims	Delton, Judy	1	9	37	4	24	24		Thanksgiving	Pee Wee Scouts	f	
3220	Spring Sprouts	Delton, Judy	1	9	37	5	24	24			Pee Wee Scouts	f	
3221	Camp Ghost-Away	Delton, Judy	1	9	38	2	24	24			Pee Wee Scouts	f	
3222	Cookies and Crutches	Delton, Judy	1	9	38	4	24	24			Pee Wee Scouts	f	
3223	That Mushy Stuff	Delton, Judy	1	9	38	5	24	24		Valentines	Pee Wee Scouts	f	
3224	Tiny Dinosaurs	Rigby PM Plus	1	9	39	6	24	24				f	
3225	The Tornado	Rigby PM Plus	1	9	39	6	24	24				f	
3226	Runaround Rowdy	Rigby PM Plus	1	9	39	6	24	24				f	
3227	Teamwork	Rigby PM Plus	1	9	39	6	24	24		Sports		f	
3228	Rory's Big Chance	Rigby PM Plus	1	9	40	6	24	24				f	
3229	Robin Hood Meets Little John	Rigby PM Plus	1	9	40	6	24	24				f	
3230	Lucy meets a Dragon	Literacy Tree	1	9	40	6	24	24		Chinese New Year		f	
3231	Grandad	Literacy Tree	1	9	40	7	24	24				f	
3232	The Riddle of the Red Purse	Giff, Patricia Reilly	1	9	41	7	24	24		Mystery	Polka Dot Private Eye	f	
3233	The Powder Puff Puzzle	Giff, Patricia Reilly	1	9	41	6	24	24		Mystery	Polka Dot Private Eye	f	
3234	The Long Way Westward	I Can Read	1	9	42	6	24	24		Westward Expansion		f	
3235	The Josefina Story Quilt	I Can Read	1	9	42	6	24	24		Westward Expansion		f	
3237	Marcella	Literacy Tree	1	9	43	5	24	24				f	
3238	Can I Have a Dinosaur?	Literacy Tree	1	9	43	5	24	24		Dinosaurs		f	
3239	The Schoolyard Mystery	Levy, Elizabeth	1	9	44	3	24	24		Mystery	Invisible Ink	f	
3240	The Snack Attack Mystery	Levy, Elizabeth	1	9	44	3	24	24		Mystery	Invisible Ink	f	
3241	The Creepy Computer Mystery	Levy, Elizabeth	1	9	44	5	24	24		Mystery	Invisible Ink	f	
3242	The Karate Class Mystery	Levy, Elizabeth	1	9	44	5	24	24		Mystery	Invisible Ink	f	
3245	Penguin Rescue	Rigby PM Plus	1	9	45	6	24	24		Environment		f	
3246	The Fierce Little Woman and the Wicked Pirate	Literacy 2000	1	9	46	5	24	24		Pirates		f	
3248	Oliver Trades Places	ETA 	1	9	46	6	24	24				f	
3249	Catching Cam's Balloon	ETA 	1	9	47	9	24	24				f	
3250	Mr. Lee's Worm Farm	ETA	1	9	47	8	24	24				f	
3251	Walking the Dog	ETA 	1	9	48	10	24	24				f	
3252	Dom's Handplant	Literacy Tree	1	9	48	11	24	24		Sports, Skateboard		f	
3253	Vacation at Lighthouse Rock	Rigby PM Plus	1	9	49	6	24	24				f	
3254	Survivors in the Frozen North	Rigby PM Plus	1	9	49	6	24	24				f	
3255	Minh's New Life	Rigby PM Plus	1	9	49	6	24	24				f	
3256	The Mysterious Neighbor	Rigby Literacy by Design	1	9	50	6	24	24		Mystery		f	
3257	Clean Your Room, Tanya	ETA 	1	9	50	4	24	24				f	
3258	Monsters Always Welcome!	ETA 	1	9	50	8	24	24				f	
3259	Elmo's Elephants	ETA	1	9	50	11	24	24				f	
3260	Castle Rock	Sundance	1	9	51	4	24	24			Supa Doopers	f	
3261	Frizz	Sundance	1	9	51	6	24	24			Supa Doopers	f	
3262	Wild Abbie	Sundance	1	9	51	6	24	24			Supa Doopers	f	
3263	A Problem in the Palace	Sundance	1	9	52	5	24	24			Supa Doopers	f	
3264	Rachel Wrecks a Wedding	Sundance	1	9	52	5	24	24			Supa Doopers	f	
3265	The Mummy's Curse	Sundance	1	9	52	4	24	24			Supa Doopers	f	
3266	Creepy McPhee	Sundance	1	9	53	3	24	24			Supa Doopers	f	
3267	Zelda the Queen of Bad Habits	Sundance	1	9	53	5	24	24			Supa Doopers	f	
3268	Bubble Buster	Sundance	1	9	53	3	24	24				f	
3271	The Frog Who Thought He Was A Horse	Literacy Tree	1	9	55	4	24	24				f	
3272	George and Martha	Marshall, James	1	9	56	10	24	24				f	
3273	The Twiddle Twins' Haunted House	Mondo	1	9	57	20	24	24				f	
3274	Witch Way to the Country	Yearling	1	9	58	2	24	24				f	
3275	Claudine's Concert	Literacy 2000	1	9	58	5	24	24				f	
3276	Huberta the Hiking Hippo	Literacy Tree	1	9	58	2	24	24				f	
3277	Triplet Trouble and the Pizza Party	Dadey/Jones	1	9	58	6	24	24				f	
3278	Teacher's Pet	Dicks, Terrance	1	9	58	2	24	24				f	
3279	Splash-A-Roo and Snowflakes	Yearling	1	9	59	4	24	24				f	
3281	B-e-s-t Friends	Giff, Patricia Reilly	1	9	61	8	24	24			Kids of the Polk Street School	f	
940	Bad Hair Day	Dominie Press	1	2	48	6	8	8	113		Teachers Choice Series	f	
3208	Teach Us, Amelia Bedilia	Parish, Peggy	1	9	32	3	24	24			Amelia Bedelia	f	
3236	Another Day, Another Challenge	Literacy Tree	1	9	43	12	24	24				f	
3270	Snow Goes to Town	Literacy Tree	1	9	55	6	24	24				f	
3280	Marty Frye, Private Eye	Scholastic	1	9	59	7	24	24				f	
3282	The Candy Corn Contest	Giff, Patricia Reilly	1	9	61	8	24	24			Kids of the Polk Street School	f	
3283	Fancy Feet	Giff, Patricia Reilly	1	9	62	13	24	24			Kids of the Polk Street School	f	
3284	December Secrets	Giff, Patricia Reilly	1	9	62	9	24	24		Christmas	Kids of the Polk Street School	f	
3285	All About Stacy	Giff, Patricia Reilly	1	9	63	6	24	24			Kids of the Polk Street School	f	
3286	Stacy Says Good-bye	Giff, Patricia Reilly	1	9	63	4	24	24			Kids of the Polk Street School	f	
3287	Pickle Puss	Giff, Patricia Reilly	1	9	64	16	24	24			Kids of the Polk Street School	f	
3288	Watch Out! Man-eating Snake	Giff, Patricia Reilly	1	9	65	11	24	24			Kids of the Polk Street School	f	
3289	Spectacular Stone Soup	Giff, Patricia Reilly	1	9	65	7	24	24			Kids of the Polk Street School	f	
3290	Say "Cheese"	Giff, Patricia Reilly	1	9	66	14	24	24			Kids of the Polk Street School	f	
3291	The Best Older Sister	Yearling	1	9	67	2	24	24				f	
3292	The Great Outdoor Camping Trip	ETA	1	9	67	9	24	24				f	
3293	The Great Bamboozle	Dominie Press	1	9	67	2	28	28		Pirates		f	
3294	A Lion's Dinner	Dominie Press	1	9	68	4	24	24				f	
3295	Just Joking	Dominie Press	1	9	68	5	24	24				f	
3296	Lost!	Dominie Press	1	9	68	5	24	24				f	
3297	The Everybody Bicycle	Dominie Press	1	9	68	4	24	24			 	f	
3298	My Word How Absurd	Literacy Tree	1	9	69	20	24	24				f	
3299	Dolphins at Daybreak	Osborne, Mary Pope	1	9	71	6	28	28			Magic Tree House	f	
3300	Polar Bears Past Bedtime	Osborne, Mary Pope	1	9	71	5	28	28			Magic Tree House	f	
3301	Good Morning, Gorillas	Osborne, Mary Pope	1	9	71	6	28	28			Magic Tree House	f	
3302	Lions at Lunchtime	Osborne, Mary Pope	1	9	71	7	28	28			Magic Tree House	f	
3305	Sunset of the Sabertooth	Osborne, Mary Pope	1	9	73	6	28	28			Magic Tree House	f	
3306	Twister on Tuesday	Osborne, Mary Pope	1	9	73	4	28	28			Magic Tree House	f	
3307	High Tide in Hawaii	Osborne, Mary Pope	1	9	73	5	28	28			Magic Tree House	f	
3308	Stage Fright on a Summer Night	Osborne, Mary Pope	1	9	73	5	28	28		Shakespeare	Magic Tree House	f	
3310	Ghost Town at Sundown	Osborne, Mary Pope	1	9	74	3	28	28			Magic Tree House	f	
3314	Midnight on the Moon	Osborne, Mary Pope	1	9	75	7	28	28			Magic Tree House	f	
3309	Hour of the Olympics	Osborne, Mary Pope	1	9	74	8	28	28		Olympics, Greece	Magic Tree House	f	
1104	Two little ducks get lost	Rigby PM	1	2	98	13	10	10	178			f	
1105	Grandpa Snored	Literacy Tree	1	2	99	27	10	10	51			f	
1361	Colors 	Sundance	2	1	1	5	1	1	9			f	
3316	Tonight on the Titanic	Osborne, Mary Pope	1	9	76	5	28	28			Magic Tree House	f	
3317	Pirates Past Noon	Osborne, Mary Pope	1	9	76	5	28	28		Pirates	Magic Tree House	f	
3318	Dingoes at Dinnertime	Osborne, Mary Pope	1	9	76	3	28	28			Magic Tree House	f	
3319	Thanksgiving on Thursday	Osborne, Mary Pope	1	9	77	6	28	28		Thanksgiving	Magic Tree House	f	
1115	My House	Literacy Tree	1	2	101	8	10	10	126			f	
3322	Earthquake in the Early Morning	Osborne, Mary Pope	1	9	77	4	28	28			Magic Tree House	f	
473	The Pencil	Rigby PM	1	1	31	41	2	2	97			f	
3323	Night of the Ninjas	Osborne, Mary Pope	1	9	78	4	28	28			Magic Tree House	f	
1069	Bella and Rosie Love the Fall	Pioneer Valley	1	2	82	8	10	10	190	Readers' Theater	Bella and Rosie	f	
1071	Brandon's New School	Pioneer Valley	1	2	83	3	10	10	163			f	
3325	Tigers at Twilight	Osborne, Mary Pope	1	9	78	3	28	28			Magic Tree House	f	
3326	Dragon of the Red Dawn	Osborne, Mary Pope	1	9	79	7	28	28			Magic Tree House	f	
3327	A Good Night for Ghosts	Osborne, Mary Pope	1	9	79	6	28	28			Magic Tree House	f	
3328	Winter of the Ice Wizard	Osborne, Mary Pope	1	9	79	6	28	28			Magic Tree House	f	
1354	Fruit Salad	Pioneer Valley	1	1	33	12	2	2	24			f	
1352	Reading Buddies	Pioneer Valley	1	1	33	12	2	2	34		Galaxy Girl	f	
1345	Gilbert the Prize Winning Pig	Pioneer Valley	1	1	33	12	2	2	20		Gilbert	f	
517	Gabby Visits Buster	Pioneer Valley	1	1	44	23	2	2	55		Gabby	f	
518	Over the Bridge	Sundance	1	1	46A	15	2	2	50			f	
3329	Carnival at Candlelight	Osborne, Mary Pope	1	9	79	6	28	28			Magic Tree House	f	
3330	Haunted Castle on Hallows Eve	Osborne, Mary Pope	1	9	80	6	28	28			Magic Tree House	f	
1207	Try again, Hannah	Rigby PM	1	6	23	9	12	12	228	Sports, Gymnastics		f	
1323	Black Cat Stays Out	Rigby Sails	1	8	7A	6	16	16				f	
1362	Cookies	Twig	2	1	1	5	1	1	15			f	
1363	Who Likes the Cold?	Twig	2	1	1	3	1	1	29			f	
572	Fun in the Snow	Pioneer Valley	1	1	104	31	3	4	56		Bella and Rosie	f	
683	Jasper the Fat Cat	Pioneer Valley	1	1	86	24	3	4	68		Jasper the Cat	f	
902	Lost in the Woods	Pioneer Valley	1	2	39	14	8	8	120		Bella and Rosie	f	
1019	Pickles Helps Out	Pioneer Valley	1	2	71	12	10	10	160		Pickles	f	
3311	Viking Ships at Sunrise	Osborne, Mary Pope	1	9	74	7	28	28			Magic Tree House	f	
3320	Mummies in the Morning	Osborne, Mary Pope	1	9	77	7	28	28		Egypt	Magic Tree House	f	
3304	Civil War on Sunday	Osborne, Mary Pope	1	9	72	8	28	28		Civil War	Magic Tree House	f	
3313	Buffalo Before Breakfast	Osborne, Mary Pope	1	9	75	3	28	28			Magic Tree House	f	
3312	Day of the Dragon King	Osborne, Mary Pope	1	9	75	6	28	28		Chinese New Year	Magic Tree House	f	
3315	Vacation Under the Volcano	Osborne, Mary Pope	1	9	76	8	28	28			Magic Tree House	f	
3324	The Knight at Dawn	Osborne, Mary Pope	1	9	78	6	28	28			Magic Tree House	f	
1364	What Can You See in a Desert?	Benchmark	2	1	1	6	1	1	28			f	
1365	What Do Insects Do?	Scholastic	2	1	2	6	1	1	24			f	
1366	Autumn Leaves	Pebble Books	2	1	2	2	1	1	17	Autumn		f	
1367	Staying Healthy	Nat'l Geographic	2	1	2	8	1	1	7			f	
1368	Animals A to Z	iOpeners	2	1	2	6	1	1	29	Alphabet		f	
1369	A Horse Can�	Reading Reading Books	2	1	2A	18	1	1	24			f	
1370	Looking at Fish	Reading Reading Books	2	1	2A	18	1	1	35			f	
1371	A Day in Africa	Reading Reading Books	2	1	2A	18	1	1	24			f	
1372	Tubes Can Be Fun	Literacy Tree	2	1	3	17	2	2	28			f	
1373	Baby Animals	Reading Corners	2	1	3	3	2	2	44			f	
1374	Our Garden	Literacy 2000	2	1	3	7	2	2	16			f	
1375	What Do Scientists Do?	Twig	2	1	3	6	2	2	24			f	
1376	Animal Habitats	Sundance	2	1	4	10	2	2	73			f	
1378	Big Mammals	Sundance	2	1	4	6	2	2	42			f	
1380	Things I Do for Fun	Sundance	2	1	4	2	2	2	36			f	
1381	Working At Home	Sundance	2	1	4	6	2	2	28			f	
1383	In the Sky	Sundance	2	1	4	2	2	2	42			f	
1384	The World Around Us	Sundance	2	1	4	7	2	2	29			f	
1385	Rules, Rules, Rules	Mondo	2	1	5	1	2	2		Safety, Anthology	Reading Safari Magazine	f	
1386	What Can Go Fast?	Sundance	2	1	5	5	2	2	37			f	
3331	Season of the Sandstorms	Osborne, Mary Pope	1	9	80	7	28	28			Magic Tree House	f	
3332	A Crazy Day with Cobras	Osborne, Mary Pope	1	9	80	6	28	28			Magic Tree House	f	
3333	The First Dog	Brett, Jan	1	9	86	2	28	28				f	
3334	Jimmy's Boa Bounces Back	Kellogg, Steven	1	9	86	6	28	28				f	
3335	The Story About Ping	Flack, Marjorie	1	9	86	2	28	28		China		f	
1121	Our Tree House	Wright Group	1	2	56	12	8	8	144			f	
882	George's Show and Tell	Pioneer Valley	1	2	65	4	8	8	133			f	
735	Bingo and the Ducks	Rigby PM	1	2	62	6	8	8	121			f	
1101	Our Soccer Team 	Literacy Tree	1	6	10	30	12	12	139	Sports, Soccer		f	
1391	Jack-o'-lantern	Twig	2	1	5	3	2	2	37	Autumn		f	
1392	Camouflage	Literacy Footprints	2	1	5	6	2	2	56			f	
1393	Flying and Floating	Sundance	2	1	6	3	2	2	64			f	
1394	Around and around	Rigby PM Plus	2	1	6	15	2	2	72			f	
1395	On and Off	Rigby PM Plus	2	1	6	14	2	2	60			f	
1396	Chickens and Chicks	Lerner	2	1	6	6	2	2	31			f	
1397	Water	Literacy Tree	2	1	7	20	2	2	28			f	
1398	Whiskers	Literacy Tree	2	1	7	18	2	2	29			f	
1399	How Many?	Pioneer Valley	2	1	7	12	2	2	49	Math		f	
1400	My Magnet	Literacy Tree	2	1	8	16	2	2	36			f	
1401	Seasons of the Year	Rosen Real	2	1	8	3	2	2	40			f	
1402	In Spring	Outside the box	2	1	8	12	2	2	34			f	
1403	Water Can Be�	Outside the box	2	1	8	12	2	2	17			f	
1404	Old and New	Benchmark	2	1	8	6	2	2	54			f	
1405	Making a bird	Rigby	2	1	9	13	2	2	32	How to books		f	
1407	Making a rabbit	Rigby PM Plus	2	1	9	7	2	2	32	How to books		f	
1408	Milk	Literacy Tree	2	1	10	20	2	2	21			f	
1409	The World In A Supermarket 	Creative Teaching Press	2	1	10	6	2	2	24			t	
1412	A Map of My House	Benchmark	2	1	10	12	2	2	75	Geography		f	
1413	Puppies Can Play	Reading Reading Books	2	1	11	18	2	2	42	Repetitive		f	
1414	Our Five Senses on the Farm	Reading Reading Books	2	1	11	18	2	2	40	Senses		f	
1415	Farm Feet	Reading Reading Books	2	1	11	18	2	2	40	Repetitive		f	
1416	My Favorite Fruit	Reading Reading Books	2	1	11	18	2	2	35	Repetitive		f	
1417	Switzerland	Pioneer Valley	2	1	11A	18	2	2	36			f	
1418	Amazing Magnets	Wright Group	2	1	12	4	3	3	53	Magnets		f	
1419	Animals Hide and Seek	Wright Group	2	1	12	4	3	3	56			f	
1420	Mix It Up	Twig	2	1	12	6	3	3	35	Colors		f	
3336	Anna Banana and Me	Blegvad, Lenore	1	9	86	6	28	28				f	
1422	Using Tools	Discovery Links	2	1	12	13	3	3	30			f	
1423	Legs, Legs, Legs	Wright Group	2	1	12	4	3	3	36			f	
1424	The Transportation Museum	Sundance	2	1	12	7	3	3	79			f	
1426	Getting Ready for School	Sundance	2	1	12	5	3	3	39			f	
1427	Little and Big	Sundance	2	1	13	5	3	3	57			f	
1428	Things On Wheels	Sundance	2	1	13	13	3	3	69			f	
1429	Trucks	Twig	2	1	13	4	3	3	24			f	
1431	My Garden	Rosen Real	2	1	13	6	3	3	33			f	
1432	Our Nature Chart	Benchmark	2	1	13	6	3	3	82	Charts		f	
1433	A Bird Has Feathers	Outside the box	2	1	14	17	3	3	27			f	
1435	How Many Legs?	Outside the box	2	1	14	20	3	3	47			f	
1436	Trucks	Literacy Tree	2	1	14	5	3	3	38			f	
1437	Balancing	Twig	2	1	14	5	3	3	46			f	
1438	Look Who's at the Zoo!	Reading Reading Books	2	1	14A	18	3	3	59			f	
1439	On and Off the Road	Reading Reading Books	2	1	14A	18	3	3	58			f	
1440	Frog Fun	Reading Reading Books	2	1	14A	18	3	3	45			f	
1441	Look Who's Eating	Reading Reading Books	2	1	14A	18	3	3	41			f	
1442	Hiding	Literacy Tree	2	1	15	18	3	3	61			f	
1443	The Divers	Wright Group	2	1	15	6	3	3	25			f	
1444	Touch	TWIG	2	1	15	5	3	3	39			f	
1377	Animal Homes	Sundance	2	1	4	9	2	2	48			f	
1410	The Zoo	Wright Group	2	1	10	9	2	2	31			f	
1434	Here is a Seed	Outside the Box	2	1	14	7	3	3	23			f	
1446	Wrinkles	Literacy Tree	2	1	15	5	3	3	32			f	
1447	Homes Around the World	iOpeners	2	1	15	6	3	3	41			f	
1448	What Makes It Go?	iOpeners	2	1	15	6	3	3	29			f	
1449	Beds	Shortland	2	1	16	6	3	3	44			f	
1450	Caring	Shortland	2	1	16	5	3	3	47			f	
1451	Clothes	Shortland	2	1	16	4	3	3	25			f	
1452	Shopping	Shortland	2	1	16	5	3	3	41			f	
1453	Hands, Hands, Hands	Literacy Tree	2	1	16	16	3	3	24			f	
1454	Winter Weather Fun	Benchmark	2	1	16	6	3	3	71	Weather, Snow		f	
1455	Beaks	Literacy Tree	2	1	17	19	3	3	43			f	
1456	Thanksgiving Then and Now	Benchmark	2	1	17	12	3	3	43	Thanksgiving, Compare and Contrast		f	
1457	Magnets	Benchmark	2	1	17	6	3	3	55			f	
1458	A Carpenter's Tools	Pioneer Valley	2	1	17A	24	3	3	63			f	
1459	The Rain Forest	Pioneer Valley	2	1	17A	18	3	3	69			f	
1461	Tails and Claws	Wright Group	2	1	18	3	4	4	65			f	
1463	Tracks	Twig	2	1	18	3	4	4	49			f	
1464	Pigs Peek	Owen Publishing	2	1	18	5	4	4	28			f	
1465	What Season is This?	Wright Group	2	1	18	2	4	4	24			f	
1466	Our School	Wright Group	2	1	18	5	4	4	46			f	
1467	A House for Me	Wright Group	2	1	18	6	4	4	71			f	
1468	Baby Animals at Home	Wright Group	2	1	18	4	4	4	64			f	
1469	City Senses	Twig	2	1	18	4	4	4	85			f	
1470	Who Says?	Wright Group	2	1	18	6	4	4	49			f	
1430	Up and Down	Rigby PM Plus	2	1	13	15	3	3	81			f	
1472	I See You	Twig	2	1	19	6	4	4	56			f	
1473	What is in Space?	Wright Group	2	1	19	5	4	4	41			f	
1474	What Is This Skeleton?	Sunshine	2	1	19	4	4	4	48			f	
1475	Whisper and Shout	Twig	2	1	19	5	4	4	92			f	
1476	Needs and Wants	Benchmark	2	1	20	6	4	4	43			f	
1477	Across the Seasons	Benchmark	2	1	20	6	4	4	75	Weather		f	
1479	Encyclopedia of Places	iOpeners	2	1	20	6	4	4	38			f	
1480	The Way Things Were	iOpeners	2	1	20	6	4	4	39			f	
1481	Looking at Cities	iOpeners	2	1	20	6	4	4	30			f	
1482	Plants	Alphakids	2	2	1	6	6	6	122	Plants		f	
1484	A Plant Has Parts	Benchmark	2	2	1	6	6	6	77	Plants, Parts of Plants		f	
1486	Gardening	Wright Group	2	2	1	5	6	6	77	Plants		f	
1487	What's Alive?	Newbridge Discovery Links	2	2	2	14	6	6	53			f	
1488	An Apple Floats	Outside the box	2	2	2	10	6	6	35			f	
1489	Animals Hide	Newbridge Discovery Links	2	2	2	13	6	6	55			f	
1490	Legs	Literacy Tree	2	2	2	7	6	6	21	Animal Characteristics		f	
1491	Numerals	Literacy 2000	2	2	2	4	6	6	63	Math		f	
1492	Dad's Garden	Literacy Tree	2	2	3	30	6	6	25			f	
1493	Nests	Literacy Tree	2	2	3	20	6	6	58			f	
1494	Learning About Leaves	Rosen Real	2	2	4	4	6	6	37	Autumn		f	
1495	Ocean Facts	Rosen Real	2	2	4	5	6	6	40			f	
1496	Is It Rough? Is It Smooth?	Rosen Real	2	2	4	10	6	6	45			f	
1497	Teeth	Wright Group	2	2	4	13	6	6	71			f	
1498	On the Computer	Wright Group	2	2	4	6	6	6	67			f	
1500	I am a Drummer	iOpeners	2	2	5	6	6	6	32	Autobiography		f	
1501	Bugs and Beetles	Mondo	2	2	5	10	6	6	173	Bugs	Reading Safari Magazine	f	
1502	Animal Tracks	Wright Group	2	2	5	6	6	6	152			f	
1503	Fast Machines	Wright Group	2	2	5	6	6	6	146			f	
1504	Tails	Wright Group	2	2	5	6	6	6	52			f	
1505	Worms	Literacy 2000	2	2	5	2	6	6	39			f	
1506	Day and Night	Wright Group	2	2	5	3	6	6	102			f	
1507	A Porcupine	Wright Group	2	2	6	5	6	6	49			f	
1508	Animal Noises	Sundance	2	2	6	7	6	6	56			f	
1509	At the Water Hole	Sundance	2	2	6	5	6	6	70			f	
1510	Tools to Use	Sundance	2	2	6	5	6	6	42			f	
1511	On Vacation	Sundance	2	2	6	6	6	6	88			f	
1512	Star Pictures	iOpeners	2	2	6	6	6	6	43			f	
1513	Add the Animals	Benchmark	2	2	6	6	6	6	74	Math		f	
1514	Long Ago	Benchmark	2	2	7	6	6	6	105			f	
1515	Boats	Twig	2	2	7	6	6	6	57			f	
1516	Helping You	Shortland	2	2	7	5	6	6	53			f	
1517	Water Falling	Literacy Tree	2	2	7	5	6	6	41			f	
1518	How Machines Help	Sunshine	2	2	7	5	6	6	143			f	
1519	My Skin	Wright Group	2	2	7	5	6	6	64			f	
1520	Firefighters!	Houghton-Miffin	2	2	9	7	8	8	50			f	
1521	Let's Make Music	Rosen Real	2	2	9	6	8	8	102			f	
1523	Planes, Trains, and More	iOpeners	2	2	9	6	8	8	43			f	
1524	Big and Little Dinosaurs	Rigby	2	2	9	5	8	8	50	Dinosaurs		f	
1525	Around My Classroom	Rigby	2	2	9	6	8	8	76			f	
1526	Kitchen Tools	Wright Group	2	2	10	6	8	8	104			f	
1527	The Sun	Newbrige Discovery Links	2	2	10	13	8	8	42	Solar System		f	
1528	Making a caterpillar	Rigby PM Plus	2	2	10	16	8	8	115	How to books		f	
1529	Words Are Everywhere	Literacy 2000	2	2	10	6	8	8	46			f	
1530	Magnets	Discovery Links	2	2	11	22	8	8	52			f	
1522	Small and Large	iOpeners	2	2	9	7	8	8	89			f	
1460	Colors of the Rain Forest	Scholastic	2	1	17A	4	3	3	88			f	
1499	Spider Legs	Wright Group	2	2	4	5	6	6	52	Bugs		f	
1483	Where do Plants Grow?	iOpeners	2	2	1	5	6	6	28	Plants		f	
1485	Our Earth	Newbrige Discovery Links	2	2	1	11	6	6	33	Earth		f	
1531	Castle	Rigby	2	2	11	12	8	8	36			f	
1532	Drawing Plans	Rigby	2	2	11	5	8	8	40	Maps		f	
1534	A Trip to the Beach	iOpeners	2	2	12	6	8	8	44	Narrative		f	
1535	Lend a Hand	iOpeners	2	2	12	6	8	8	26			f	
1536	Ben Lost a Tooth	iOpeners	2	2	12	6	8	8	31	Narrative		f	
1538	What is it?	iOpeners	2	2	12	6	8	8	31	Steps/Procedural		f	
1539	Where does Breakfast Come From?	iOpeners	2	2	12	6	8	8	56			f	
1540	Koalas	Literacy Tree	2	2	13	20	8	8	36			f	
1541	Earthquake!	Wright Group	2	2	13	4	8	8	40	Natural Disaster		f	
1542	The Rain and the Sun	Wright Group	2	2	13	5	8	8	45			f	
1543	The Sunflower	Rigby	2	2	13	3	8	8	33	Plants		f	
1545	Saguaro	Ecton, Anne	2	2	14	6	8	8	44			f	
1546	What's Black and White and Moos?	Twig	2	2	14	10	8	8	78			f	
1547	Patterns	Literacy Tree	2	2	14	10	8	8	57			f	
1548	Around My Home	Rigby	2	2	14	4	8	8	56			f	
1549	Beautiful Bugs	Scholastic	2	2	14	5	8	8	70	Bugs		f	
1550	Rookie Reader - Animal Babies	Children's Press	2	2	15	9	8	8	114			f	
1551	Is It Floating?	Sunshine	2	2	16	5	8	8	146			f	
1552	People Can Build	Sunshine	2	2	16	5	8	8	46			f	
1553	Seeds, Seeds, Seeds	Sunshine	2	2	16	5	8	8	96	Plants		f	
1554	Noses	Literacy Tree	2	2	16	6	8	8	56			f	
1533	Sisters	Dominie Press	2	2	11	4	8	8	77			f	
1556	Making Oatmeal	Shortland	2	2	16	5	8	8	38	Cooking, Nutrition		f	
1558	What Do Animals Do?	Sundance	2	2	17	6	8	8	29			f	
1559	Weather	Benchmark	2	2	17	6	8	8	138			f	
1560	The Four Seasons	Benchmark	2	2	17	6	8	8	154			f	
1561	The Weather Report	Rosen Real	2	2	17	11	8	8	119			f	
1562	Grow, Seed, Grow	Discovery Links	2	2	18	10	8	8	36	Plants		f	
1563	The Wind	Discovery Links	2	2	18	12	8	8	36			f	
1565	Dinosaur Fun Facts	Steck-Vaughn	2	2	18	2	8	8	84	Dinosaurs		f	
1566	Storm!	Wright Group	2	2	19	8	8	8	49	Weather		f	
1567	Skin, Skin	Wright Group	2	2	19	6	8	8	44			f	
1568	In the Rain Forest	Wright Group	2	2	19	5	8	8	57			f	
1569	Why We have Thanksgiving	Modern Curriculum Press	2	2	19	4	8	8				f	
1570	Learning About Sand	Rosen Real	2	2	19	6	8	8	42	Soil		f	
1571	Tails	Literacy Tree	2	2	21	8	10	10	47			f	
1572	Skin	Literacy 2000	2	2	21	8	10	10	97			f	
1573	How Spiders Live	Sunshine	2	2	21	4	10	10	145	Bugs		f	
1574	A Spinning Snake	Sunshine	2	2	21	3	10	10	156			f	
1575	Rainforest Plants	Sundance	2	2	21	5	10	10	151	Plants		f	
1576	Hay Making	Wright Group	2	2	22	6	10	10	62			f	
1557	What Animals Eat	Sundance	2	2	17	8	8	8	75			f	
1579	The Water Boatman	Learning Media	2	2	22	11	10	10	44	Bugs		f	
1581	Make a House	iOpeners	2	2	23	6	10	10	41	Steps/Procedural		f	
1582	A Dog Named Honey	iOpeners	2	2	23	6	10	10	46	Biography		f	
1583	What Should we Wear?	iOpeners	2	2	23	6	10	10	50			f	
1584	Then and Now	iOpeners	2	2	23	9	10	10	98	Past and Present		f	
1585	It is raining	Rigby PM Plus	2	2	24	15	10	10	56			f	
1586	Where did all the water go?	Rigby PM Plus	2	2	24	14	10	10	139			f	
1587	The Strongest Animal	Owen Publishing	2	2	24	15	10	10	58			f	
1589	Clothes	Dominie Press	2	2	25	4	10	10	103			f	
1590	Hats	Dominie Press	2	2	25	4	10	10	88			f	
1591	My Dad 	Dominie Press	2	2	25	5	10	10	79			f	
1592	My Mom	Dominie Press	2	2	25	4	10	10	91			f	
1593	Shoes	Dominie Press	2	2	25	5	10	10	73			f	
1594	How Animals Hide	Wright Group	2	2	25	6	10	10	98			f	
1595	Helping Our World	Rigby	2	2	25	8	10	10	105			f	
1596	Looking At Maps	Rigby	2	2	25	6	10	10	97	Geography		f	
1597	Hot Sunny Days	Rigby PM Plus	2	2	26	13	10	10	122			f	
1598	An Elephant's Trunk	Houghton-Miffin	2	2	26	4	10	10	47			f	
1599	Pollution	Wright Group	2	2	26	3	10	10	46			f	
1600	In the Park	Literacy Tree	2	2	26	15	10	10	96			f	
1601	Children At Play	Sundance	2	2	27	7	10	10	101	Fact vs. Opinion		f	
1602	The Plane Ride	Sundance	2	2	27	11	10	10	68			f	
1603	What I'd Like to Be	Sundance	2	2	27	11	10	10	112			f	
1604	Our Earth	Rosen Real	2	2	27	5	10	10	53	Solar System		f	
1605	What Makes Light?	Sunshine	2	2	27	5	10	10	119			f	
1606	Cranes	Rigby	2	2	28	3	10	10	61			f	
1607	Following Directions	Rigby	2	2	28	6	10	10	71			f	
1608	Living Here	Rigby	2	2	28	5	10	10	94			f	
1609	Fly, Butterfly	Newbridge 	2	2	28	13	10	10	49	Bugs		f	
1611	My Five Senses	Benchmark	2	2	29	6	10	10	142	Senses		f	
1612	Trees and Leaves	iOpeners	2	2	29	6	10	10	33	Plants		f	
1613	Using Magnets	Benchmark	2	2	29	6	10	10	160			f	
1614	Bread Bread Bread	Scholastic	2	2	29	1	10	10	95			t	
1615	Babies	Rigby	2	2	29	5	10	10	108			f	
1616	What Dinosaurs Ate	Rigby	2	2	30	4	10	10	44	Dinosaurs		f	
1617	A Trip to the Zoo	Rosen Real	2	2	30	2	10	10	112			f	
1618	At Home Around the World	Rosen Real	2	2	30	12	10	10	82			f	
1619	Let's Draw	Rosen Real	2	2	30	12	10	10	70			f	
1610	Guide to Growing	iOpeners	2	2	29	7	10	10	106			f	
1580	My Gymnastics Class	iOpeners	2	2	23	6	10	10	33			f	
1588	Melting	Bookshelf	2	2	24	6	10	10	69			f	
1621	Our Senses	Literacy Footprints	2	2	31	6	10	10	77	Fact vs. Opinion		f	
1622	Winter	Rigby	2	2	31	4	10	10	25	Seasons		f	
1624	What Is A Mammal?	Rosen Real	2	2	31	5	10	10	102			f	
1626	Schools	Rigby	2	6	1	11	12	12	266			f	
1627	Building a house	Rigby PM Plus	2	6	1	15	12	12	197	How to books		f	
1629	Jungle	Mondo	2	6	2	19	12	12		Narrative,  Anthology	Reading Safari Magazine	f	
1630	Maps	CTP	2	6	2	19	12	12	99	Geography		t	
1633	Our house is a safe house	Rigby PM Plus	2	6	3	14	12	12	163			f	
1634	The Big Round-up	Wright Group	2	6	3	3	12	12	121			f	
1635	What is a Cycle?	Newbridge 	2	6	4	7	12	12	151			f	
1636	Living Things	Rosen Real	2	6	4	6	12	12	151			f	
1637	Chickens	Mondo	2	6	4	7	12	12	105	Life Cycle		f	
1564	Rain is water	Rigby PM Plus	2	2	18	14	8	8	82			f	
1577	Milking	Wright Group	2	2	22	7	10	10	67			f	
1625	Chinese New Year	Rigby	2	6	1	14	12	12	92	Chinese New Year		f	
1620	I want to be a Sailor	Rigby	2	2	30	4	10	10	174	Careers		f	
1632	The Great Wall of China	Rigby	2	6	3	9	12	12	53	China		f	
1640	Up Close	Newbridge Discovery Links	2	6	5	3	12	12	123	Senses		f	
1641	Wheels All Around	Houghton-Miffin	2	6	5	4	12	12	117			f	
1642	Our new house	Rigby PM Plus	2	6	5	12	12	12	68			f	
1643	Maps Show Us the Way	Rosen Real	2	6	6	6	12	12	94	Geography		t	
1644	A Butterfly is Born	Newbridge	2	6	6	6	12	12	250	Life Cycle		f	
1645	Dragonflies	Owen Publishing	2	6	6	11	12	12	53	Bugs, Insects		f	
1646	Teeth	Rigby	2	6	6	3	12	12	94			f	
1647	Spiders	Pioneer Valley Books	2	6	7	12	12	12	153	Bugs		f	
1648	How Do Frogs Grow?	Newbridge	2	6	7	8	12	12	42	Life Cycle		f	
1649	Looking Like Plants	Sundance	2	6	7	5	12	12	218	Bugs, Insects		f	
1650	Ants	Wright Group	2	6	7	5	12	12	94	Bugs, Insects		f	
1651	My New House	Rigby	2	6	7	4	12	12	82			f	
1652	In Times Long Ago	Creative Teaching Press	2	6	8	19	12	12	196	Past and Present		f	
1653	Beaks	Newbridge	2	6	8	7	12	12	125	Birds		f	
1654	Think About the Weather	Newbridge	2	6	8	2	12	12	81	Weather		f	
1655	A Seed Needs Help	Benchmark	2	6	9	6	12	12	140	Plants, Life Cycle		f	
1656	Snow and Ice	Rigby Sails	2	6	9	6	12	12	340	Weather, Snow		f	
1657	Frogs and Toads	Rigby Sails	2	6	9	6	12	12	323	Life Cycle, Compare Contrast		f	
1658	Boats	Rigby Sails	2	6	9	6	12	12	260			f	
1659	Plants  	Benchmark	2	6	9	6	12	12	162	Plants, Life Cycle		f	
1661	My Global Address	CTP	2	6	10	18	12	12	84	Geography		t	
1662	Washing the Dog	Sundance	2	6	10	9	12	12	84			f	
1663	Trees	Rigby Sails	2	6	11	6	12	12	351	Plants		f	
1664	Lizards	Rigby Sails	2	6	11	6	12	12	228			f	
1665	Where do Snakes Live?	Rigby Sails	2	6	11	6	12	12	251			f	
1666	Batteries	Benchmark	2	6	11	6	12	12	105	Circuits		f	
1667	Weather Tools	Benchmark	2	6	11	6	12	12	117	Weather		f	
1668	Growing Tomatoes	Alphakids	2	6	12	6	12	12	87	Plants		f	
1669	Changing Weather	Benchmark	2	6	12	6	12	12	145	Weather		f	
1670	Hooray! 100 Days	Benchmark	2	6	12	6	12	12	184			f	
1672	Birds' Nests	Rigby	2	6	13	2	12	12	65			f	
1673	Using Wheels	Sundance	2	6	13	6	12	12	115	Transportation		f	
1674	Sending Signals	Literacy Tree	2	6	15	20	14	14	163			f	
1675	If you like Strawberries Don�t Read This Book	Literacy 2000	2	6	15	20	14	14	101	Plants		f	
1676	Storms	Rigby Sails	2	6	16	6	14	14	284	Weather, Snow		f	
1677	Insects All Around	Benchmark	2	6	16	6	14	14	229	Bugs,  Insects		f	
1682	Hide and Seek	Wright Group	2	6	17	4	14	14	138	Camouflage		f	
1683	What Came Out of My Bean?	Wright Group	2	6	17	8	14	14	158	Plants		f	
1684	Oil from the Sea	Rigby	2	6	17	3	14	14	147	Careers, Community Helper		f	
1686	Wheels at Work	Rigby	2	6	17	3	14	14	129	Machines, Transportation		f	
1687	Feeding the Lambs	Rigby PM Plus	2	6	18	15	14	14	79	Letter Writing		f	
1688	The Tiny Dot	Houghton-Miffin	2	6	18	5	14	14	62	Bugs, Butterfly		f	
1689	Gardens are Great	Mondo	2	6	18	1	14	14		Anthology, Plants, Bugs	Reading Safari Magazine	f	
1690	What's Under the Ocean?	Troll	2	6	18	6	14	14	108	Sea Animals		f	
1691	Let's Look At Leopards	Rosen Real	2	6	19	6	14	14	155	African Animals		f	
1692	A Park Ranger's Day	Rosen Real	2	6	19	12	14	14	195	Careers, Community Helper		f	
1693	Making Money	Rosen Real	2	6	19	6	14	14	129	Math, Economics		f	
1694	Becoming A Butterfly	Rosen Real	2	6	19	6	14	14	83	Bugs, Butterfly		f	
1695	A Look At The Calendar	Rosen Real	2	6	19	5	14	14	139			f	
1696	We Honor America	Rosen Real	2	6	19	6	14	14	132	Holiday		f	
1697	Mice	Literacy Tree	2	6	20	20	14	14	143	Life Cycle		f	
1698	Sea Horses	Sundance	2	6	20	4	14	14	219	Ocean		f	
1678	Eat Your Vegetables!	iOpeners	2	6	16	9	14	14	157			f	
1680	Sand 	iOpeners	2	6	16	7	14	14	49	Soil		f	
1671	What's the Address?	iOpeners	2	6	12	10	12	12	186	Geography, Letter Writing		f	
1660	Animal Homes	Rigby PM Plus	2	6	10	11	12	12	193			f	
3337	A Chair for My Mother	Williams, Vera B. 	1	9	87	21	28	28				f	
1628	Making a toy house	Rigby PM Plus	2	6	1	13	12	12	132	How to books		f	
1685	The Bulldozer Cleared the Way	Rigby	2	6	17	5	14	14		Repetition, Building, Machines		f	
1631	Push and Pull	Newbridge	2	6	3	11	12	12	138	Forces, Motion		f	
1699	The Taj Mahal	Rigby	2	6	20	12	14	14	46	India		f	
1700	Hatching Chicks	Literacy Footprints	2	6	21	6	14	14	132	Life Cycle		f	
1701	Frogs	Usborne	2	6	21	3	14	14				f	
1702	Turtle Nest	Owen Publishing	2	6	21	13	14	14	85	Sea Turtles		f	
1703	The Hospital	Sundance	2	6	22	5	14	14	180	Careers, Community Helper		f	
1705	How We Make Music	Rosen Real	2	6	22	6	14	14	104			f	
1706	Taking Care of the Our World	Rosen Real	2	6	22	6	14	14	137	Community, Go Green, Recycling		f	
1707	Grow A Plant Inch By Inch	Rosen Real	2	6	22	7	14	14	142	Plants		f	
1708	Sounds of the Farm	Newbridge	2	6	22	5	14	14	133	Farm		t	
1709	Guide Dogs	Rosen Real	2	6	22	3	14	14	107	Community Helper		f	
1710	Watch A Frog Grow	Benchmark	2	6	23	5	14	14	354	Life Cycle		f	
1711	A Nest of Grass	Rigby Sails	2	6	23	6	14	14	359	Mice		f	
1712	A Big Spider	Rigby Sails	2	6	23	6	14	14	271	Bugs		f	
1713	Eggs, Eggs, Eggs	Rigby Sails	2	6	23	6	14	14	248	Life Cycle		f	
1714	Changing and Growing	Rigby Sails	2	6	23	6	14	14	315	Life Cycle		f	
1715	Summer to Fall	Benchmark	2	6	23	6	14	14	204	Seasons		f	
1717	What Is Matter?	Newbridge	2	6	24	10	14	14		Solid, Liquid, Gas		f	
1718	Simple Machines	Newbridge	2	6	24	7	14	14	161			f	
1719	What Do Scientists Do?	Newbridge Discovery Links	2	6	24	5	14	14	79	Careers		f	
1720	Machines at Work	Sundance	2	6	24	5	14	14	101	Machines		f	
1722	The Guessing Jar	Benchmark	2	6	25	6	14	14	370	Estimation, Math		f	
1723	Our Moon	Benchmark	2	6	25	4	14	14	169	Solar System		f	
1726	Working Dogs	Pioneer Valley Books	2	6	26	6	14	14	193	Community Helper		f	
1727	Bread	Rigby	2	6	26	4	14	14	105	Nutrition, Cooking		f	
1728	Making A Birdhouse	Houghton-Miffin	2	6	26	4	14	14		How to books		f	
1729	Spiders	Alphakids	2	6	26	6	14	14	107	Bugs		f	
1730	Dinosaurs	Wright Group	2	6	26	2	14	14	117	Dinosaurs		f	
1732	Let's Read Biography Martin Luther King, Jr. 	Houghton-Miffin	2	6	27	10	14	14		Biography		f	
1578	Pilgrim Children Had Many Chores	Creative Teaching P	2	2	22	20	10	10	47	Thanksgiving, Long Ago		t	
1704	What People Do	Sundance	2	6	22	6	14	14	148	Careers		f	
1421	To the Ocean	Wright Group	2	1	12	4	3	3	26	Ocean, Earth		f	
3338	Cherries and Cherry Pits	Williams, Vera B.	1	9	88	20	28	28				f	
3339	Sugar Cakes Cyril	Mondo	1	9	89	25	28	28				f	
3340	Cloudy With A Chance of Meatballs	Barrett, Judi	1	9	91	13	28	28				f	
3341	The Littles	Peterson, John	1	9	92	7	28	28			The Littles	f	
3342	The Littles and the Lost Children	Peterson, John	1	9	92	7	28	28			The Littles	f	
3343	The Littles Go Exploring	Peterson, John	1	9	92	6	28	28			The Littles	f	
3344	The Littles Go to School	Peterson, John	1	9	93	7	28	28			The Littles	f	
3345	The Littles to the Rescue	Peterson, John	1	9	93	5	28	28			The Littles	f	
3346	Tracey and the Sun	Rigby Sails	1	9	94	6	28	28		Narrative		f	
3347	Animals Say …	Rigby Sails	1	9	94	4	28	28				f	
3348	Mouse Manual	Rigby Sails	1	9	94	4	28	28				f	
3349	Spy Manual	Rigby Sails	1	9	94	4	28	28				f	
3350	The Night Out	Rigby Sails	1	9	95	4	28	28				f	
3351	The Daily Meow	Rigby Sails	1	9	95	4	28	28				f	
3352	Mickey Maloney's Mail	Rigby Sails	1	9	95	4	28	28				f	
3353	An Anteater Named Arthur	Waber, Bernard	1	9	96	9	28	28				f	
3354	Silly Willy	Mondo	1	9	97	15	28	28				f	
3355	George Washington's Mother	Fritz, Jean	1	9	98	6	28	28		Historical Fiction, Colonial		f	
3356	Red, White, and Blue  The Story of the American Flag	Herman, John	1	9	98	6	28	28		Historical Fiction, Colonial		f	
3357	Aliens Don't Wear Braces	Dadey/Jones	1	9	101	6	28	28			Bailey School Kids	f	
3358	Angels Don't Know Karate	Dadey/Jones	1	9	101	3	28	28			Bailey School Kids	f	
3359	Dragons Don't Cook Pizza	Dadey/Jones	1	9	101	3	28	28			Bailey School Kids	f	
3360	Elves Don't Wear Hard Hats	Dadey/Jones	1	9	101	5	28	28			Bailey School Kids	f	
3361	Frankenstein Doesn't Plant Petunias	Dadey/Jones	1	9	101	4	28	28			Bailey School Kids	f	
3362	Frankenstein Doesn't Start Food Fights	Dadey/Jones	1	9	101	3	28	28			Bailey School Kids	f	
3363	Gargoyles Don't Drive School Buses	Dadey/Jones	1	9	102	4	28	28			Bailey School Kids	f	
3364	Genies Don't Ride Bicycles	Dadey/Jones	1	9	102	2	28	28			Bailey School Kids	f	
3365	Ghosts Don't Eat Potato Chips	Dadey/Jones	1	9	102	3	28	28			Bailey School Kids	f	
3366	Hercules Doesn't Pull Teeth	Dadey/Jones	1	9	102	5	28	28			Bailey School Kids	f	
3367	Knights Don't Teach Piano	Dadey/Jones	1	9	102	2	28	28			Bailey School Kids	f	
3368	Leprechauns Don't Play Basketball	Dadey/Jones	1	9	102	6	28	28			Bailey School Kids	f	
3369	Martians Don't Take Temperatures	Dadey/Jones	1	9	103	5	28	28			Bailey School Kids	f	
3370	Monsters Don't Scuba Dive	Dadey/Jones	1	9	103	2	28	28			Bailey School Kids	f	
3371	Mummies Don't Coach Softball	Dadey/Jones	1	9	103	4	28	28			Bailey School Kids	f	
3372	Pirates Don't Wear Pink Sunglasses	Dadey/Jones	1	9	103	12	28	28			Bailey School Kids	f	
3373	Robots Don't Catch Chicken Pox	Dadey/Jones	1	9	104	2	28	28			Bailey School Kids	f	
3374	Santa Claus Doesn't Mop Floors	Dadey/Jones	1	9	104	4	28	28			Bailey School Kids	f	
1725	Fascinating Faces	Literacy Tree	2	6	25	10	14	14	124			f	
1731	Let's Read Biography George Washington 	Houghton-Miffin	2	6	27	11	14	14		Biography		f	
1724	Tiny Bird	Invitation to Literacy HM	2	6	25	8	14	14		Hummingbird		f	
3375	Sea Serpents Don't Juggle Water Balloons	Dadey/Jones	1	9	104	4	28	28			Bailey School Kids	f	
3376	Vampires Don't Wear Polka Dots	Dadey/Jones	1	9	104	10	28	28			Bailey School Kids	f	
3377	Trolls Don't Ride Roller Coasters	Dadey/Jones	1	9	105	5	28	28			Bailey School Kids	f	
3378	Werewolves Don't Go to Summer Camp	Dadey/Jones	1	9	105	5	28	28			Bailey School Kids	f	
3379	Witches Don't Do Backflips	Dadey/Jones	1	9	105	2	28	28			Bailey School Kids	f	
3380	Wizards Don't Wear Graduation Gowns	Dadey/Jones	1	9	105	2	28	28			Bailey School Kids	f	
3381	Zombies Don't Play Soccer	Dadey/Jones	1	9	105	5	28	28			Bailey School Kids	f	
3382	Blueberries for Sal	McCloskey, Robert	1	9	106	2	28	28				f	
3383	Miss Rumphius	Cooney, Barbara	1	9	106	5	28	28				f	
3384	A Dragon in My Backpack	Woodruff, Elvira	1	9	106	6	28	28				f	
3385	The Fiddle and the Moon	Literacy Tree	1	9	107	4	28	28				f	
3387	Making Friends on Beacon Street	Literacy Tree	1	9	107	4	28	28				f	
3390	Junie B. Jones Has a Peep in Her Pocket	Park, Barbara	1	9	109	2	28	28			Junie B. Jones	f	
3391	Junie B. Jones is Captain Field Day	Park, Barbara	1	9	109	2	28	28			Junie B. Jones	f	
3392	Junie B. Jones Smells Something Fishy	Park, Barbara	1	9	109	2	28	28			Junie B. Jones	f	
3395	The Mystery of the Talking Tail	Sundance	1	9	112	12	28	28			Supa Doopers	f	
3396	Brain-in-a-Box	Sundance	1	9	112	5	28	28			Supa Doopers	f	
3397	My Weird Mother	Sundance	1	9	112	5	28	28			Supa Doopers	f	
3398	Lucky Last Luke	Sundance	1	9	113	6	28	28			Supa Doopers	f	
3399	Rosa and Fredo	Sundance	1	9	113	5	28	28			Supa Doopers	f	
3400	Troublemaker	Sundance	1	9	113	10	28	28			Supa Doopers	f	
3401	In a Pickle	Sundance	1	9	114	6	28	28			Supa Doopers	f	
3402	Flying High	Sundance	1	9	114	6	28	28			Supa Doopers	f	
3403	Tom and the Terrible Crankyshanks	Sundance	1	9	114	5	28	28		Pirates	Supa Doopers	f	
3404	The Wreckers	Sundance	1	9	114	5	28	28			Supa Doopers	f	
3405	King Arthur and the Square Table	Sundance	1	9	115	4	28	28			Supa Doopers	f	
3406	Looking for Dad	Sundance	1	9	115	5	28	28			Supa Doopers	f	
3407	Scritch! Scratch!	Sundance	1	9	115	6	28	28			Supa Doopers	f	
3408	Last Chance Cabin	Sundance	1	9	115	3	28	28			Supa Doopers	f	
3410	Snow Bright and the Seven Sumos	Sundance	1	9	116	6	28	28			Supa Doopers	f	
3411	Snow Bright and the Tooth Magician	Sundance	1	9	116	4	28	28			Supa Doopers	f	
1171	Pickles Gets Lost	Pioneer Valley	1	6	14	12	12	12	154		Pickles	f	
3412	The Big Chase	Sundance	1	9	116	5	28	28			Supa Doopers	f	
3413	Tricksters	Sundance	1	9	116	4	28	28			Supa Doopers	f	
3414	Wedding Day Disaster	Sundance	1	9	117	5	28	28			Supa Doopers	f	
3415	Bull Harris and the Purple Ooze	Sundance	1	9	117	10	28	28			Supa Doopers	f	
3416	Identity Kit	Rigby PM 	1	9	119	12	28	28				f	
3417	Shorty	Literacy Tree	1	9	120	12	28	28				f	
3418	Donkey	Literacy Tree	1	9	120	5	28	28				f	
3419	The Present from Aunt Skidoo	Literacy Tree	1	9	120	4	28	28				f	
3420	Molly's Pilgrim	Cohen, Barbara	1	9	120	4	28	28		Immigration		f	
3421	Snaggle Doodles	Giff, Patricia Reilly	1	9	121	12	28	28			Kids of the Polk Street School	f	
1181	Daisy's Bell	Pioneer Valley	1	6	15A	6	12	12	211		Jack and Daisy	f	
1182	Wait for Me	Pioneer Valley	1	6	15A	6	12	12	171		Jack and Daisy	f	
3422	In the Dinosaur's Paw	Giff, Patricia Reilly	1	9	121	12	28	28		Dinosaurs	Kids of the Polk Street School	f	
3423	Purple Climbing Days	Giff, Patricia Reilly	1	9	122	14	28	28			Kids of the Polk Street School	f	
3424	The Valentine Star	Giff, Patricia Reilly	1	9	122	12	28	28		Valentines	Kids of the Polk Street School	f	
3425	Lazy Lions, Lucky Lambs	Giff, Patricia Reilly	1	9	123	11	28	28			Kids of the Polk Street School	f	
3426	The Secret at the Polk Street School	Giff, Patricia Reilly	1	9	123	6	28	28			Kids of the Polk Street School	f	
3427	Sunny-Side Up	Giff, Patricia Reilly	1	9	124	9	28	28			Kids of the Polk Street School	f	
3429	Alexander and the Terrible, Horrible, No Good, Very Bad Day	Viorst, Judith	1	9	126	8	28	28				f	
3430	The Important Book	Brown, Margaret Wise	1	9	126	12	28	28				f	
3431	Birdwoman Interview	Rigby Sails	1	9	127	4	28	28				f	
3432	Cat's Diary	Rigby Sails	1	9	127	4	28	28				f	
3433	Dog's Diary	Rigby Sails	1	9	127	3	28	28				f	
3434	The Jungle Sun	Rigby Sails	1	9	127	3	28	28				f	
3435	Grandpa Jones and the No-company Cat	Rigby PM Plus	1	9	128	6	28	28				f	
3436	Did You Hear?	Rigby Literacy by Design	1	9	128	6	28	28				f	
3438	Sea Monkeys	ETA	1	9	129	8	28	28				f	
3440	Fuzz and the Glass Eye	Literacy Tree	1	9	130	14	28	28				f	
3442	The Case of the Snowboarding Superstar	Preller, James	1	9	131	3	28	28		Mystery	Jigsaw Jones Mystery	f	
3444	The Case of the Stolen Baseball Cards	Preller, James	1	9	131	6	28	28		Mystery	Jigsaw Jones Mystery	f	
3447	A Year on My Street	Yearling	1	9	134	6	28	28				f	
1213	I Can Do It, I Really Can	Dominie Collection	1	6	24A	6	12	12	195		Teacher's Choice Series	f	
1214	I Don't Think It's Fair	Dominie Collection	1	6	24A	4	12	12	147		Teacher's Choice Series	f	
3448	Russel Sprouts	Hurwitz, Johanna	1	9	134	3	28	28				f	
3449	Dinner at Alberta's	Hoban, Russell	1	9	134	5	28	28				f	
3437	Diving at the Pool	Rigby PM Plus	1	9	128	11	28	28				f	
3441	Humphrey	Literacy Tree	1	9	130	16	28	28				f	
3450	I Love the Beach	Literacy Tree	1	9	135	8	28	28				f	
3451	In the Clouds	Literacy Tree	1	9	135	9	28	28				f	
3452	Treasure Hunting	Literacy Tree	1	9	135	5	28	28				f	
3454	The Moon and the Mirror (A play)	Literacy Tree	1	9	136	8	28	28				f	
3455	A Pocketful of Mouse	Literacy 2000	1	9	136	6	28	28				f	
3439	Chicken Soup with Rice	Sendak, Maurice	1	9	129	3	28	28				f	
3394	Pie, Pie Beautiful Pie	Literacy Tree	1	9	111	11	28	28				f	
3446	Peter the Pumpkin-Eater	Literacy Tree	1	9	133	18	28	28				f	
3443	The Case of the Spooky Sleepover	Preller, James	1	9	131	3	28	28		Mystery	Jigsaw Jones Mystery	f	
1212	Happy Mother's Day!	Dominie Collection	1	6	24A	6	12	12	101		Teacher's Choice Series	f	
3458	Little Hawk's New Name	Scholastic	1	9	138	2	28	28		Historical Fiction, Native American		f	
3459	The Duck in the Gun	Literacy Tree	1	9	138	4	28	28		Historical Fiction		f	
3460	The Copper Lady	First Avenue	1	9	138	6	28	28		Historical Fiction		f	
3461	The War Shirt	Rigby	1	9	139	5	28	28				f	
3462	Funny Business 	Rigby PM	1	9	139	9	28	28				f	
3463	Walking	Literacy 2000	1	9	139	7	28	28				f	
3464	Roly meets the monster	Literacy 2000	1	9	139	4	28	28				f	
3466	Bird Talk	Book Treks	1	9	140	6	28	28				f	
3467	The Case of the Missing Planet	Book Treks	1	9	140	5	28	28				f	
3470	The Fright Before Christmas	Howe, James	1	9	142	5	28	28		Christmas		f	
3951	How does a Cactus Grow?	Benchmark	2	8	26	6	18	18		Plants		f	
3952	School Trip Estimation	Benchmark	2	8	26	6	18	18		Math, Estimation		f	
3953	George Washington	Acorn	2	8	26	7	18	18		Biography		f	
3954	Meet the Octopus	Mondo	2	8	28	20	20	20				t	
3955	Two Hungry Hippos	Benchmark	2	8	28	6	20	20		Math		f	
3956	Trees	Benchmark	2	8	28	3	20	20		Plants		f	
3957	Emergency Vehicles	Rigby PM Plus	2	8	29	9	20	20				f	
3958	Vehicles for Fun and Sports	Rigby PM Plus	2	8	29	8	20	20				f	
3959	Vehicles in the Air	Rigby PM Plus	2	8	29	11	20	20				f	
3960	Ships At Sea	Rigby PM Plus	2	8	30	10	20	20				f	
3961	Trains on the Rails	Rigby PM Plus	2	8	30	9	20	20				f	
3963	Tubes in My Ears	Mondo	2	8	31	11	20	20				f	
3964	Skyscraper	Sundance	2	8	31	6	20	20				f	
3965	Tarantula	Sundance	2	8	31	5	20	20		Bugs		f	
3967	Animal Homes	Scholastic	2	8	32	5	20	20				f	
3968	Brown Bears	Rigby PM	2	8	32	10	20	20				f	
3969	Elephants	Rigby PM	2	8	32	6	20	20				f	
3970	Lions and Tigers	Rigby PM	2	8	32	3	20	20				f	
3972	Slinky Scaly Snakes	DK Publishing	2	8	32	5	20	20				f	
3973	Mighty Movers, Mighty Diggers	ETA Cuisenaire	2	8	33	12	20	20		Machines		f	
3974	Going Places	Benchmark	2	8	33	6	20	20				f	
3975	Seasons	Literary Footprints	2	8	33	6	20	20				f	
3976	Butterflies	Literacy Footprints	2	8	33	6	20	20		Bugs		f	
3977	Hello Creatures!	Literacy Tree	2	8	34	11	20	20		Bugs		f	
3978	Time for A Family	Literacy Tree	2	8	34	20	20	20				f	
3979	School in Colonial America	Scholastic	2	8	34	6	20	20		Colonial		f	
3980	Pilgrims of Plymouth	Nat'l Geographic	2	8	35	15	20	20		Thanksgiving		t	
3981	Leaves	Capstone / Pebble	2	8	35	3	20	20		Plants		f	
3982	Abraham Lincoln	Acorn	2	8	36	8	20	20		Biography		f	
3983	The Boston Tea Party	Sundance	2	8	36	4	20	20		American Revolution		f	
3984	Science Fair	Newbridge Newbridge	2	8	36	5	20	20				f	
3985	Animals' Eyes and Ears	Benchmark	2	8	36	4	20	20				f	
3986	The Pueblo People	Newbridge Newbridge	2	8	37	8	20	20				f	
3987	The Yard Sale	Nat'l Geographic	2	8	37	6	20	20				f	
3988	Stems	Pebble Books	2	8	37	3	20	20		Plants		f	
3989	Young Amelia Earhart	Troll	2	8	37	4	20	20		Biography		f	
3990	Rain Forest Ride	Scholastic	2	8	38	5	20	20				f	
3991	Deserts	Benchmark	2	8	38	6	20	20				f	
3992	Jackie Robinson He Led the Way	All Aboard Reading	2	8	38	6	20	20		Biography		f	
4006	Blackbirds	Sunshine	2	9	6	4	24	24				f	
4007	The Panda	Sunshine	2	9	6	3	24	24				f	
4008	Volcanoes	Sunshine	2	9	6	2	24	24		Landforms		f	
4009	Going to be … a Butterfly	Sunshine	2	9	6	3	24	24		Bugs		f	
4010	Did You Know?	Sunshine	2	9	6	3	24	24				f	
4011	Funny Dog Facts	ETA Cuisenaire	2	9	7	12	24	24				f	
4012	Meet the Bugs!	ETA Cuisenaire	2	9	7	9	24	24		Bugs		f	
4013	Feeding Time At the Zoo	ETA Cuisenaire	2	9	7	9	24	24				f	
4014	An Introduction to Australian Spiders	Book Shelf	2	9	7	5	24	24		Bugs		f	
4015	Dinosaur Babies	Penner, Lucille	2	9	8	7	24	24		Dinosaurs		f	
4016	Sun, Moon and Stars	Usborne	2	9	8	6	24	24		Solar System		f	
4017	Oil Spill!	Berger, Melvin	2	9	9	6	24	24				f	
4018	Breathing	Mondo	2	9	9	20	24	24				f	
4019	Under Sail	Alphakids	2	9	9	5	24	24				f	
1235	A Cape for Daisy	Pioneer Valley	1	6	28	6	14	14	235		Jack and Daisy	f	
1248	I Fixed Breakfast	Dominie Press	1	6	30	6	14	14	176		Teacher's Choice Series	f	
3966	Waterhole	Rigby	2	8	31	7	20	20				f	
3971	Monkeys and Apes	Rigby PM	2	8	32	6	20	20				f	
3445	Flat Stanley	Brown, Jeff	1	9	132	11	28	28				f	
4021	The Asante of West Africa	PowerKids Press	2	9	10	8	24	24		West Africa, Ghana, Gold Coast		f	
4022	Rocky Shores	Dominie Press	2	9	11	6	24	24				f	
4023	Insects and Crawly Creatures	Eye Openers 	2	9	11	4	24	24		Bugs		f	
3472	King Kong and the Flower Fairy	Literacy Tree	1	9	143	20	28	28				f	
3471	Monsieur Armand	ETA	1	9	143	12	28	28				f	
3469	The Midnight Pig	Literacy Tree	1	9	142	15	28	28				f	
3962	Trucks on the Road	Rigby PM Plus	2	8	30	8	20	20				f	
3473	A Froggy Tale	Literacy 2000	1	8	1	6	16	16				f	
3474	Noisy Nora	Wells, Rosemary	1	8	1	10	16	16				t	
3479	Going To School	Pioneer Valley	1	8	1A	6	16	16			Bella and Rosie	f	
3481	Adventure in the Purple Forest	Pioneer Valley	1	8	1B	6	16	16			Spaceboy	f	
3482	Dog Bones	Pioneer Valley	1	8	1B	6	16	16				f	
3483	Maggie's Pets	Pioneer Valley	1	8	1B	6	16	16				f	
3484	Daisy's Airplane Trip	Pioneer Valley	1	8	1C	6	16	16			Jack and Daisy	f	
3485	A Puppy Named Boss	Pioneer Valley	1	8	1C	6	16	16			Jack and Daisy	f	
3486	Hunting Squirrels	Pioneer Valley	1	8	1C	6	16	16			Jack and Daisy	f	
3488	Lost in the Forest	Rigby  PM	1	8	2	6	16	16		Dinosaurs	In the Days of the Dinosaurs	f	
3489	Pterosaur's Long Flight	Rigby  PM	1	8	2	6	16	16		Dinosaurs	In the Days of the Dinosaurs	f	
3491	The Dinosaur Chase	Rigby  PM	1	8	2	8	16	16		Dinosaurs	In the Days of the Dinosaurs	f	
3492	The Triceratops and the Crocodiles	Rigby  PM Plus	1	8	2	8	16	16		Dinosaurs	In the Days of the Dinosaurs	f	
3493	More Spaghetti!	Rigby PM	1	8	3	3	16	16				f	
3494	Rebecca and the Concert	Rigby PM	1	8	3	4	16	16				f	
3495	The Big Bad Wolf	Rigby PM	1	8	3	10	16	16				f	
3496	The Little Girl and Her Beetle	Literacy Tree	1	8	3	5	16	16				f	
3497	The Manners of a Pig	Mondo	1	8	3	7	16	16				f	
3499	Two Little Goldfish	Rigby PM	1	8	3	4	16	16				f	
3500	Jordan at the Big Game	Rigby PM Plus	1	8	4	7	16	16		Soccer, Sports		f	
3501	Skates for Luke	Rigby PM	1	8	4	3	16	16				f	
3502	The Lions and the Water Buffaloes	Rigby PM	1	8	4	5	16	16				f	
3503	The Youngest Giraffe	Rigby PM Plus	1	8	4	6	16	16				f	
3506	Toby and the Big Red Van	Rigby PM	1	8	5	5	16	16				f	
3507	Tommy's Treasure	Literacy Tree	1	8	5	6	16	16				f	
3508	Hiccups	Mondo	1	8	6	19	16	16				f	
3510	The Friendly Crocodile	Kaeden Group	1	8	6	3	16	16				f	
3512	Liar, Liar, Pants on Fire	Cohen	1	8	6A	8	16	16				f	
3513	Lost in the Museum	Cohen	1	8	6A	8	16	16				f	
3514	No Good in Art	Cohen	1	8	6A	5	16	16				f	
3516	When Will I Read?	Cohen	1	8	6A	9	16	16				f	
3517	Mitch to the Rescue	Rigby PM 	1	8	7	5	16	16				f	
3518	Sarah and the Barking Dog	Rigby PM 	1	8	7	6	16	16				f	
3519	Look Out!	Rigby PM Plus	1	8	7	7	16	16				f	
3521	The Missing Mitten Mystery	Kellogg, Steven	1	8	7	6	16	16				f	
436	Food for Jasper	Pioneer Valley	1	1	17	6	2	2	28		Jasper the Cat	f	
3524	Tall Tales	Literacy Tree	1	8	8	30	16	16				f	
3525	Fred Goes Shopping	Popcorn/Sundance	1	8	9	17	16	16			Fred	f	
3526	Fred Joins the Band	Popcorn/Sundance	1	8	9	20	16	16			Fred	f	
3527	Fred's Big Lunch	Popcorn/Sundance	1	8	9	17	16	16			Fred	f	
3529	Fred's Polka Dot Sock	Popcorn/Sundance	1	8	9A	15	16	16			Fred	f	
3530	Fred's Weekend	Popcorn/Sundance	1	8	9A	8	16	16			Fred	f	
3531	Meet Messy Fred	Popcorn/Sundance	1	8	9A	11	16	16			Fred	f	
3532	Guess What Today Is?	Popcorn/Sundance	1	8	9A	15	16	16			Fred	f	
3533	Bookstore Cat	Step into Reading	1	8	10	5	16	16				f	
3534	Grandma Moves In	Rigby	1	8	10	5	16	16				f	
3537	The Little Yellow Chicken	Sunshine	1	8	10	4	16	16				t	
3539	Who's in the Shed?	Literacy Tree	1	8	10A	20	16	16				t	
3540	I Spy A School Bus	Scholastic	1	8	11	6	16	16				f	
3541	I Spy Funny Teeth	Scholastic	1	8	11	5	16	16				f	
3619	Trixie's Summer	Rigby PM Plus	1	8	29	6	18	18				f	
3480	Grizzly and the Bumble-bee	Sunshine	1	8	1A	5	16	16				f	
3528	Fred's Little Snack	Popcorn/Sundance	1	8	9	12	16	16			Fred	f	
432	Look at Pickles	Pioneer Valley	1	1	36	12	2	2	29		Pickles	f	
3490	The Careful Crocodile	Rigby  PM	1	8	2	10	16	16		Dinosaurs	In the Days of the Dinosaurs	f	
3509	The Busy Beavers	Rigby PM	1	8	6	8	16	16				f	
3505	The Straight Line Wonder	Mondo	1	8	49A	19	18	18				f	
3477	Sloppy Tiger Bedtime	Sunshine Books	1	8	1	8	16	16				f	
3511	Jim's Dog Muffins	Cohen	1	8	69	7	20	20				f	
3487	Eggs in the Sun	Rigby Sails	1	8	44	6	18	18				f	
4020	Sea Otters	Story Teller	2	9	10	9	24	24				f	
3536	See You Tomorrow, Charles	Cohen	1	8	37B	6	18	18				f	
3542	McBungle Down Under	Rigby	1	8	27	10	18	18				f	
3538	Jasper and the Kitten	Pioneer Valley	1	8	10	4	16	16			Jasper the Cat	f	
3520	Swoop!	Rigby PM Plus	1	8	7	6	16	16				f	
3522	The Secret Cave	Rigby PM Plus	1	8	7	7	16	16				f	
3465	No Trouble At All!	Literacy Tree	1	9	140	14	28	28				f	
3544	In the Middle of the Night	Sunshine	1	8	11	5	16	16				f	
3545	The Dancing Dragon	Mondo	1	8	11A	10	16	16		Chinese New Year		f	
3546	Coyote Plants A Peach Tree	Owen Publishers	1	8	11A	4	16	16				f	
3547	No TV	Rigby Sails	1	8	11A	6	16	16				f	
3515	So What?	Cohen	1	8	6A	5	16	16				f	
3535	I Love Cats	Mondo	1	8	10	16	16	16				f	
3555	The Wicked Pirates	Sunshine	1	8	13	7	16	16				t	
3556	A Hundred Hugs	Sunshine	1	8	13	7	16	16				t	
3558	Miss Grimble	Rigby Sails	1	8	14	6	16	16				f	
3561	Bird Hotel	Rigby Sails	1	8	15	6	16	16				f	
3564	Who Took the Farmer's Hat?	Scholastic	1	8	15	11	16	16				f	
3565	A Vacation for MM Mouse	Rigby Sails	1	8	16	6	16	16				f	
3567	Dad and the Cake	Rigby Sails	1	8	16	6	16	16				f	
3568	Mom's Bag	Rigby Sails	1	8	16	6	16	16				f	
3569	The Big Laugh	Sunshine	1	8	17	4	16	16				f	
3571	Pickles and the Hole	Pioneer Valley	1	8	17	6	16	16			Pickles	f	
3572	Birthdays	Sunshine	1	8	17	3	16	16				t	
3573	Shintaro's Umbrellas	Owen Publications	1	8	18	5	16	16				f	
3578	Danger in the Parking Lot	Rigby PM Plus	1	8	19	5	18	18				f	
3580	Hermie the Crab	Rigby PM Plus	1	8	19	5	18	18				f	
3581	The Jets and the Rockets	Rigby PM Plus	1	8	19	6	18	18		Baseball, Sports		f	
3582	Wet Weather Camping	Rigby PM Plus	1	8	19	7	18	18				f	
3583	Jonathan Buys a Present	Rigby PM	1	8	20	9	18	18				f	
3584	Knit, Knit, Knit, Knit	Literacy Tree	1	8	20	8	18	18				f	
3586	The Giant Pumpkin	Wright Group	1	8	20	8	18	18		Autumn		f	
3589	Soup Fit for a King	Sunshine	1	8	20A	7	18	18				f	
3590	The Noise Festival	Sunshine	1	8	20A	4	18	18				f	
3591	Riding to Craggy Rock	Rigby PM	1	8	21	12	18	18				f	
3592	The Race to Green End	Rigby PM	1	8	21	13	18	18				f	
3594	The Big Green Caterpillar	Literacy 2000	1	8	22	3	18	18				f	
3595	The Hair Party	Literacy 2000	1	8	22	6	18	18				f	
3596	The Queen's Parrot (a play)	Literacy Tree	1	8	22	30	18	18				f	
3597	Cat Concert	Literacy Tree	1	8	23	8	18	18				f	
3598	License Plates	Rigby PM	1	8	23	12	18	18				f	
3599	Grandpa's Birthday	Literacy Tree	1	8	24	7	18	18				f	
3600	Our Old Friend, Bear	Rigby PM	1	8	24	7	18	18		Death of Pet		f	
3601	Nick Wants a Puppy	ETA 	1	8	24	10	18	18				f	
3604	The Tickle-Bugs	Literacy 2000	1	8	25	3	18	18				f	
3605	The Doorbell Rang	Hutchins, Pat	1	8	25	6	18	18				t	
3608	The School Fair	Rigby PM Plus	1	8	26	6	18	18				f	
3611	First Flight	Rigby PM Plus	1	8	27	9	18	18				f	
3612	The Pumpkin House	Literacy Tree	1	8	27	5	18	18				f	
3613	Mystery of the Bay Monster	Rigby Literacy by Design	1	8	28	6	18	18				f	
3614	A Little Adventure	Rigby PM	1	8	28	10	18	18		Hiking		f	
3617	Kayaking at Blue Lake	Rigby PM Plus	1	8	29	6	18	18				f	
3618	A Home for Star and Patches	Rigby PM Plus	1	8	29	6	18	18			Clare and Abby	f	
3550	Ducks on the Run!	Rigby PM Plus	1	8	12	8	16	16				f	
3548	A Surprise for Zack	Rigby PM Plus	1	8	12	4	16	16				f	
3606	Bird's-Eye View	Rigby PM	1	8	26	10	18	18				f	
3615	Morning Bath	Sunshine	1	8	20A	3	18	18				f	
3616	Library Day	Sunshine	1	8	20A	6	18	18				f	
3560	Rooster Trouble	Rigby Sails	1	6	34A	6	14	14	279			f	
3570	More Trouble	Pioneer Valley	1	6	49	8	14	14	264		Bella and Rosie	f	
3574	Swimming Across the Pool	Rigby PM Plus	1	8	27	9	18	18				f	
3554	The Smallest Horses	Rigby PM Plus	1	8	27	7	18	18				f	
3563	Tony's Dad	Rigby Sails	1	8	44	6	18	18				f	
3559	Molly's Trampoline	Rigby Sails	1	8	44	6	18	18				f	
3575	The Bird That Could Think	Rigby PM Plus	1	8	18	8	16	16				f	
3553	That's Not Our Dog!	Rigby PM Plus	1	8	13	9	16	16				f	
3603	The Dragon Who Had the Measles	Literacy Tree	1	8	70	4	20	20				f	
3549	Come Back, Pip!	Rigby PM Plus	1	8	42	9	18	18				f	
508	The Big Hole	PM Stars	1	1	41	12	2	2	39		The Toy Town	f	
547	Breakfast for Pickles	Pioneer Valley	1	1	54	12	3	4	62		Pickles	f	
539	The Big Bone	Pioneer Valley	1	1	51	6	3	4	78		Jack and Daisy	f	
3566	Big Hippo and Little Hippo	Rigby Sails	1	8	49	6	18	18				f	
3562	Dad Goes Fishing	Rigby Sails	1	8	49	6	18	18				f	
3557	Dad and the Bike Race	Rigby Sails	1	8	49	6	18	18				f	
3585	The Story of Ferdinand	Leaf, Munro	1	8	66	4	20	20				f	
3593	The Seat Belt Song	Rigby PM	1	8	83	9	20	20				f	
3579	Gibbon Island	Rigby PM Plus	1	8	80	7	20	20				f	
3504	Rainbow Parrot	Literacy Tree	1	8	5	13	16	16				f	
3576	The Hut in the Old Tree	Rigby PM Plus	1	8	18	7	16	16				f	
3620	The Motorcycle Photo	Rigby PM Plus	1	8	29	6	18	18				f	
3621	The Surprise Invitation	Rigby PM Plus	1	8	29	6	18	18				f	
512	Sally and the elephant	PM Stars	1	1	83	12	3	4	50		Sally	f	
510	Sally and the leaves	PM Stars	1	1	83	12	3	4	55		Sally	f	
507	The boat ride	PM Stars	1	1	83	12	3	4	38		Little Teddy	f	
509	Dad's Ship	PM Stars	1	1	54	12	3	4	42		Ben	f	
533	Jack's Road	PM Stars	1	1	85	12	3	4	59		Jack and Billy	f	
534	Matthew and Emma	PM Stars	1	1	85	12	3	4	49		Matthew and Emma	f	
3637	Fun for Pickles	Pioneer Valley Books	1	8	34	6	18	18			Pickles	f	
3638	Ant City	Rigby PM	1	8	35	8	18	18				f	
3641	Rescuing Nelson	Rigby PM	1	8	35	5	18	18			Nelson	f	
3643	Toby and the Accident	Rigby PM	1	8	35	14	18	18				f	
3650	Sam the Minuteman	I Can Read	1	8	37A	6	18	18		Historical Fiction		f	
4108	Animal Talk	Sundance	2	9	41	6	28	28				f	
3622	River Rafting Fun	Rigby PM Plus	1	8	21	6	18	18				f	
3624	Nelson, The Baby Elephant	Rigby PM	1	8	21	9	18	18			Nelson	f	
3642	The Cabin in the Hills	Rigby PM	1	8	35	7	18	18				f	
3630	Zoe at the Fancy Dress Ball	Literacy Tree	1	8	23	6	18	18				f	
3640	Jim's Trumpet	Sunshine	1	6	35	5	14	14	304			f	
3675	Little Runner of the Longhouse	I Can Read	1	8	73	2	20	20				f	
3657	Postman Pete	Mondo	1	8	39	7	18	18				f	
3674	Harry The Dirty Dog	Zion, Gene	1	8	45	5	18	18				f	
3665	Skating at Rainbow Lake	Rigby PM	1	8	41	7	18	18				f	
3652	Jim Meets the Thing	Cohen	1	8	6A	11	16	16				f	
3673	Bird Watching	Rigby PM Plus	1	8	45	12	18	18				f	
3648	Don't Eat Too Much Turkey!	Cohen	1	8	37A	8	18	18				f	
3651	First Grade Takes a Test	Cohen	1	8	37B	7	18	18				f	
3671	Starring First Grade	Cohen	1	8	37B	10	18	18				f	
3636	Edgar Badger's Balloon Day	Mondo	1	8	62	13	20	20				f	
3658	Rally Car Race	Rigby PM Plus	1	8	39	16	18	18				f	
3667	The Chocolate Cake	Rigby PM Plus	1	8	42	8	18	18				f	
3668	Going to Town	Wilder, Laura Ingalls	1	8	43	6	18	18		Pioneer	Little House on the Prairie	f	
3669	Don't Worry	Literacy Tree	1	8	43	6	18	18				f	
3663	Rex Plays Fetch	Rigby PM Plus	1	8	41	10	18	18				f	
3664	The Bear and the Bees	Rigby PM Plus	1	8	41	6	18	18				f	
3644	Mouse Soup	Lobel	1	8	36	5	18	18				f	
3684	The Two Foolish Cats (a play)	Literacy Tree	1	8	68	5	20	20		A Play		f	
3655	Skyfire	Asch, Frank	1	8	38	6	18	18				f	
3656	The Snowy Day	Keats, Ezra Jack	1	8	38	2	18	18		Caldecott		f	
3631	Mr. Putter and Tabby Bake a Cake	Rylant, Cynthia	1	8	33	5	18	18			Mr. Putter and Tabby	f	
3632	Mr. Putter and Tabby Fly the Plane	Rylant, Cynthia	1	8	33	6	18	18			Mr. Putter and Tabby	f	
3633	Mr. Putter and Tabby Pour the Tea	Rylant, Cynthia	1	8	33	4	18	18			Mr. Putter and Tabby	f	
3634	Mr. Putter and Tabby Row the Boat	Rylant, Cynthia	1	8	33	5	18	18			Mr. Putter and Tabby	f	
3635	Mr. Putter and Tabby Walk the Dog	Rylant, Cynthia	1	8	33	2	18	18			Mr. Putter and Tabby	f	
3628	George Washington and the General's Dog	Step into Reading	1	8	28	7	18	18		Historical Fiction		f	
3639	Grandad's Mask	Rigby PM	1	8	63	7	20	20				f	
681	Grandma's House	Pioneer Valley	1	1	86	6	3	4	113		Jasper the Cat	f	
3676	The Golly Sisters Go West	I Can Read	1	8	73	6	20	20		Westward Expansion		f	
3677	Hooray for the Golly Sisters!	I Can Read	1	8	73	3	20	20		Westward Expansion		f	
3659	Star and Patches	Rigby PM Plus	1	8	63	11	20	20			Clare and Abby	f	
684	Balloons go Pop!	PM Stars	1	1	86	12	3	4	74		Kate, James, and Nick	f	
3661	Prickles the Porcupine	Rigby PM Plus	1	8	63	10	20	20				f	
3680	Mr. Pepperpot's Pet	Literacy Tree	1	8	55	6	20	20				f	
3649	Lucky Socks	Rigby Literacy by Design	1	8	81	4	20	20				f	
3690	Roller Coaster Ride	Rigby PM Plus	1	8	68	8	20	20				f	
3682	Dash, the Young Meerkat	Rigby PM Plus	1	8	59	6	20	20				f	
3647	Fish for Sale	Sundance	1	8	69	7	20	20			Supa Doopers	f	
3670	A Bull in a China Shop	Literacy Tree	1	8	70	20	20	20				f	
3662	Daisy to the Rescue	Pioneer Valley	1	8	57	6	20	20			Jack and Daisy	f	
3672	A Spider in My Bedroom	Rigby PM Plus	1	8	80	11	20	20				f	
3629	The Hailstorm	Rigby PM	1	8	23	10	18	18				f	
3646	My Dog F.I.D.O.	Sundance	1	8	37	5	18	18			Supa Doopers	f	
3660	Bend, Stretch, and Leap	Rigby PM Plus	1	8	40	13	18	18		Sports		f	
3681	Dogstar	Literacy Tree	1	8	47	6	18	18				f	
3679	A New School for Megan	Rigby PM	1	8	47	11	18	18				f	
3666	Sea Otter Goes Hunting	Rigby PM Plus	1	8	42	12	18	18				f	
3683	Muffin is Trapped	Rigby PM	1	8	48	10	18	18				f	
3685	Moppet on the Run	Rigby PM	1	8	48	9	18	18				f	
3689	Millie's Adventure	ETA	1	8	49	7	18	18				f	
3691	Nelson is Kidnapped	Rigby PM	1	9	128	7	28	28			Nelson	f	
3654	Log Hotel	Scholastic	1	8	38	12	18	18				f	
3707	Scaredy Bears	Sunshine	1	8	53	9	20	20				f	
3708	Noises in the Night	Rigby Literacy by Design	1	8	53	6	20	20		Mystery		f	
3711	Flying Fingers	Literacy 2000	1	8	55	7	20	20				f	
3712	Friends are Forever	Literacy Tree	1	8	55	4	20	20				f	
3713	Oh, Columbus	Literacy Tree	1	8	55	6	20	20				f	
3715	The White Horse	Literacy Tree	1	8	55	7	20	20				f	
3717	The Relatives Came	Rylant, Cynthia	1	8	55A	3	20	20		Caldecott		f	
3718	Have You Seen a Javelina?	Literacy 2000	1	8	56	7	20	20				f	
3719	Misha Disappears	Literacy Tree	1	8	56	8	20	20				f	
3720	Rosie's House	Literacy Tree	1	8	56	6	20	20				f	
3721	The Lonely Giant	Literacy Tree	1	8	56	7	20	20				f	
3722	The Smallest Tree	Literacy Tree	1	8	56	6	20	20				f	
3724	The Big Catch	Literacy Tree	1	8	57	8	20	20				f	
3726	The Truck Parade	Rigby PM Plus	1	8	57	12	20	20				f	
3727	Ox-Cart Man	Scholastic	1	8	58	4	20	20				f	
3728	Jamaica's Find	Scholastic	1	8	58	9	20	20				f	
3729	Clifford The Big Red Dog	Bridwell, Norman	1	8	58	6	20	20				f	
3730	Nice New Neighbors	Scholastic	1	8	58	4	20	20				f	
4109	Kitchen Science	Nat'l Geographic	2	9	42	6	28	28				f	
3688	Days With Frog and Toad	Lobel, Arnold	1	8	72	9	20	20			Frog and Toad	f	
3710	The Paper Crane	Bang, Molly	1	9	56	4	24	24				f	
3705	Sam's Solution	Literacy 2000	1	8	53	4	20	20				f	
3725	The Running Shoes	Rigby PM Plus	1	8	57	11	20	20				f	
3709	The Very Hungry Caterpillar	Carle, Eric	1	8	49A	6	18	18				t	
3714	The Marble Patch	Rigby PM	1	8	45	8	18	18				f	
3723	Jordan's Catch	Rigby PM	1	8	40	12	18	18				f	
741	Jack and the Ball	Pioneer Valley	1	2	1	6	6	6	100		Jack and Daisy	f	
739	Bingo's Ice Cream Cone	Rigby PM	1	2	1	12	6	6	88		Sam and Bingo	f	
755	Billy is hiding	Rigby PM	1	2	3	14	6	6	97		Jack and Billy	f	
756	Little Chimp is Brave	PM Stars	1	2	3	12	6	6	92		Little Chimp	f	
757	Presents for Jack and Billy	PM Stars	1	2	3	12	6	6	105		Jack and Billy	f	
758	Spaceboy Plays Hide and Seek	Pioneer Valley	1	2	3	12	6	6	80		Spaceboy	f	
762	At Grandma's House	Dominie Collection	1	2	4	6	6	6	66		Teachers Choice Series	f	
763	Practice Makes Perfect	Dominie Collection	1	2	4	5	6	6	111		Teachers Choice Series	f	
764	So Do I 	Dominie Collection	1	2	4	4	6	6	49		Teachers Choice Series	f	
765	Things That Drag Behind	Dominie Collection	1	2	4	5	6	6	42		Teachers Choice Series	f	
766	First In Line	Dominie Collection	1	2	4	4	6	6	77		Teachers Choice Series	f	
767	Follow the Leader	Dominie Collection	1	2	4	6	6	6	75		Teachers Choice Series	f	
769	At the Park	Dominie Collection	1	2	5	5	6	6	74		Teachers Choice Series	f	
770	Birds Need Trees	Dominie Collection	1	2	5	3	6	6	63		Teachers Choice Series	f	
771	Frogs On A Log	Dominie Collection	1	2	5	4	6	6	75		Teachers Choice Series	f	
772	Harry's Hats	Dominie Collection	1	2	5	6	6	6	49		Teachers Choice Series	f	
773	I Like My Picture! 	Dominie Collection	1	2	5	5	6	6	160		Teachers Choice Series	f	
774	I Want to Be a Ballerina	Dominie Collection	1	2	5	3	6	6	66		Teachers Choice Series	f	
775	Outside, Inside	Dominie Collection	1	2	5	4	6	6	97		Teachers Choice Series	f	
776	Silly Cat Tricks	Dominie Collection	1	2	5	7	6	6	83		Teachers Choice Series	f	
777	Animals at the Mall	Dominie Collection	1	2	5A	4	6	6	49		Teachers Choice Series	f	
778	Helping My Dad	Dominie Collection	1	2	5A	6	6	6	90		Teachers Choice Series	f	
779	How are We the Same?	Dominie Collection	1	2	5A	6	6	6	100		Teachers Choice Series	f	
783	Who Made These Tracks?	Dominie Collection	1	2	5A	6	6	6	45		Teachers Choice Series	f	
781	The Bad Day 	Dominie Collection	1	2	5A	6	6	6	93		Teachers Choice Series	f	
787	Who Likes to Swim?	Dominie Collection	1	2	6	6	6	6	100		Teachers Choice Series	f	
788	Stories of Me	Dominie Collection	1	2	6	6	6	6	80		Teachers Choice Series	f	
789	Yes, It Does	Dominie Collection	1	2	6	6	6	6	91		Teachers Choice Series	f	
3695	The Nesting Place	Rigby PM	1	8	76	15	20	20		Dinosaurs	In the Days of the Dinosaurs	f	
3694	Gorgo Meets Her Match	Rigby PM	1	8	76	12	20	20		Dinosaurs	In the Days of the Dinosaurs	f	
3697	Patrick's Dinosaurs	Carrick, Carol	1	8	76	3	20	20		Dinosaurs		f	
3704	Arky, The Dinosaur with Feathers	Rigby PM Plus	1	8	76	6	20	20		Dinosaurs	In the Days of the Dinosaurs	f	
3701	A Friend for Ben	Rigby Literacy by Design	1	8	81	6	20	20				f	
3698	A Bike for Brad	Rigby PM	1	8	68	5	20	20				f	
795	I Can Use the Computer	Dominie Collection	1	2	7	6	6	6	52		Teachers Choice Series	f	
796	Later	Dominie Collection	1	2	7	6	6	6	106		Teachers Choice Series	f	
3693	A Troop of Little Dinosaurs	Rigby PM	1	8	50	10	18	18		Dinosaurs	In the Days of the Dinosaurs	f	
3696	Zala Runs for Her Life	Rigby PM	1	8	50	9	18	18		Dinosaurs	In the Days of the Dinosaurs	f	
3700	A Blue Birthday	Rigby Literacy by Design	1	8	51	6	18	18				f	
3703	When the Volcano Erupted	Rigby PM	1	8	52	13	18	18		Dinosaurs	In the Days of the Dinosaurs	f	
3731	A Dog Called Bear	Rigby PM	1	8	59	7	20	20				f	
3732	Nelson Gets a Fright	Rigby PM	1	8	59	8	20	20			Nelson	f	
3733	The Carnival Horse	Rigby PM Plus	1	8	59	14	20	20				f	
3734	Nate the Great	Sharmat, Marjorie Weinman	1	8	60	11	20	20		Mystery	Nate the Great	f	
3735	Nate the Great and the Sticky Case	Sharmat, Marjorie Weinman	1	8	60	4	20	20		Mystery	Nate the Great	f	
3736	Nate the Great and the Tardy Tortoise	Sharmat, Marjorie Weinman	1	8	60	2	20	20		Mystery	Nate the Great	f	
3737	Nate the Great Goes Down in the Dumps	Sharmat, Marjorie Weinman	1	8	60	11	20	20		Mystery	Nate the Great	f	
3738	Nate the Great and the Lost List	Sharmat, Marjorie Weinman	1	8	60A	6	20	20		Mystery	Nate the Great	f	
3739	Nate the Great and The Missing Key	Sharmat, Marjorie Weinman	1	8	60A	20	20	20		Mystery	Nate the Great	f	
3741	Nate the Great Goes Undercover	Sharmat, Marjorie Weinman	1	8	60A	6	20	20		Mystery	Nate the Great	f	
3743	Nate the Great and The Halloween Hunt	Sharmat, Marjorie Weinman	1	8	61	2	20	20		Halloween, Mystery	Nate the Great	f	
3744	Nate the Great and the Phony Clue	Sharmat, Marjorie Weinman	1	8	61	13	20	20		Mystery	Nate the Great	f	
3746	Anyone Can Have a Pet	Rigby PM Plus	1	8	62	17	20	20				f	
3749	Crosby Crocodiles' Disguise	Literacy Tree	1	8	63	5	20	20				f	
3752	Mr. Merton's Vacation	Rigby Sails	1	8	64	4	20	20				f	
3754	Space Cat	Rigby Sails	1	8	64	3	20	20				f	
3755	The Giant Seeds	Rigby PM Plus	1	8	64	15	20	20				f	
3757	Camping with Claudine	Literacy Tree	1	8	65	5	20	20		Camping		f	
3759	Now, Listen Stanley	Literacy 2000	1	8	65	5	20	20				f	
3762	Keep the Lights Burning, Abbie	Roop, Connie	1	8	65A	20	20	20		Historical Fiction		f	
3763	Concert Night	Literacy 2000	1	8	66	4	20	20				f	
3767	Scare-Kid	Literacy Tree	1	8	66	4	20	20				f	
3768	Souvenirs	Literacy Tree	1	8	66	6	20	20				f	
856	Jasper and the Birds	Pioneer Valley	1	2	21	6	6	6	89		Jasper the Cat	f	
3774	Pookie and Joe	Literacy 2000	1	8	68	7	20	20				f	
3775	Riding High	Rigby PM	1	8	68	11	20	20				f	
3779	Camp Knock Knock	Yearling	1	8	69	3	20	20				f	
3781	Parents' Night Fright	Levy, Elizabeth	1	8	69	5	20	20			Invisible Ink	f	
3782	The King Who Gobbled His Dinner	Sundance	1	8	69	5	20	20			Supa Doopers	f	
3784	The Oogly Gum Chasing Game	Literacy Tree	1	8	70	5	20	20				f	
3786	The Little Spider	Literacy Tree	1	8	70	6	20	20				f	
3787	Henry and Mudge and the Best Day of All	Rylant, Cynthia	1	8	30A	11	18	18			Henry and Mudge	f	
3789	Henry and Mudge in the Sparkle Days	Rylant, Cynthia	1	8	31A	9	18	18			Henry and Mudge	f	
3790	Henry and Mudge and the Bedtime Thumps	Rylant, Cynthia	1	8	32	12	18	18			Henry and Mudge	f	
3793	Henry and Mudge in Puddle Trouble	Rylant, Cynthia	1	8	32A	9	18	18			Henry and Mudge	f	
3792	Henry and Mudge and the Wild Wind	Rylant, Cynthia	1	8	32	9	18	18			Henry and Mudge	f	
3791	Henry and Mudge and the Careful Cousin	Rylant, Cynthia	1	8	32A	12	18	18			Henry and Mudge	f	
3742	Nate the Great and the Fishy Prize	Sharmat, Marjorie Weinman	1	8	61	12	20	20		Mystery	Nate the Great	f	
3756	Vicky the High Jumper	Literacy Tree	1	8	64	5	20	20				f	
3760	The Monster of Mirror Mountain	Literacy Tree	1	8	65	9	20	20				f	
3750	The Skating Trail	Rigby PM	1	8	8	9	16	16				f	
3753	Soup	Sunshine Books	1	8	10A	13	16	16				f	
3783	Ask Mr. Bear	Flack, Marjorie	1	8	49A	9	18	18				t	
3761	Tony and the Butterfly	Literacy Tree	1	8	24	5	18	18				f	
3771	Fox on Wheels	Scholastic	1	8	25	4	18	18				f	
3778	The Green Dragons	Rigby PM	1	8	45	8	18	18				f	
3751	Toby at Stony Bay	Rigby PM	1	8	39	10	18	18				f	
3777	The Big, Bad Cook	Literacy 2000	1	8	47	8	18	18				f	
3745	The Most Unusual Pet	ETA	1	8	47	8	18	18				f	
797	Pinata Time	Dominie Collection	1	2	7	5	6	6	71		Teachers Choice Series	f	
798	March, March, Marching	Dominie Collection	1	2	7	5	6	6	60		Teachers Choice Series	f	
799	Where Did They Go?	Dominie Collection	1	2	7	6	6	6	102		Teachers Choice Series	f	
800	A home for Little Teddy	Rigby PM	1	2	7A	21	6	6	153		Little Teddy	f	
832	Hoofprints	Dominie Collection	1	2	10	3	6	6	62		Teachers Choice Series	f	
3765	Look Out! Look Out! Tractor About!	Sundance	1	8	37	3	18	18				f	
3785	The Grandma Mix-up	I Can Read	1	8	70	3	20	20				f	
3773	Caps for Sale	Slobodkina, Esphyr	1	8	67	3	20	20				t	
3740	Nate the Great and the Snowy Trail	Sharmat, Marjorie Weinman	1	8	60A	9	20	20		Winter, Mystery	Nate the Great	f	
888	Animal Tricks	Pioneer Valley	1	2	30	6	6	6	115		Jasper the Cat	f	
889	Super Dog	Pioneer Valley	1	2	30	6	6	6	86		Jack and Daisy	f	
834	The Toytown Bus Helps Out	Rigby PM Stars	1	2	34	6	8	8	125		Toytown bus	f	
836	Flowers for Grandma	Rigby PM Stars	1	2	34	6	8	8	131		Ella	f	
3805	The Siege	ETA	1	8	77	10	20	20				f	
3806	A Bargain for Frances	Hoban	1	8	78	20	20	20			Frances	f	
3807	A Baby Sister for Frances	Hoban	1	8	79	4	20	20			Frances	f	
3809	Best Friends for Frances	Hoban	1	8	79	5	20	20			Frances	f	
3810	The Dragon's Birthday	Literacy Tree	1	8	79	4	20	20				f	
3813	My Two Families	Rigby PM	1	8	80	8	20	20		Adoption		f	
3814	The Dolphin on the Wall	Rigby PM	1	8	80	10	20	20				f	
3818	Teamwork Saves the Day	Rigby Literacy by Design	1	8	81	6	20	20		 		f	
3819	A Choice for Sarah	Rigby PM Plus	1	8	81	6	20	20				f	
3820	Charlie's Great Race	Rigby PM Plus	1	8	81	6	20	20				f	
3821	Riding the Skateboard Ramps	Rigby PM Plus	1	8	82	6	20	20				f	
3822	The Contest	Rigby PM Plus	1	8	82	6	20	20				f	
3823	Jordan and the Northside Reps	Rigby PM	1	8	82	11	20	20		Sports, Soccer		f	
3824	My Steps	Derby, Sally	1	8	82	6	20	20				f	
3826	Kerry's Double	Rigby PM	1	8	83	9	20	20				f	
3827	The Talent Contest	Rigby PM	1	8	83	11	20	20				f	
3828	Bunrakkit	Sunshine Books	1	8	84	5	20	20				f	
3829	Beanbag	Literacy 2000	1	8	84	6	20	20				f	
3831	Perfect Paper Planes	Rigby PM Plus	1	8	84	6	20	20				f	
3832	The Japanese Garden	Rigby PM Plus	1	8	84	6	20	20				f	
3833	The Fishing Trip	Rigby PM Plus	1	8	85	6	20	20				f	
3834	Carl's High Jump	Rigby PM Plus	1	8	85	6	20	20				f	
3835	The Family Tree	Rigby PM Plus	1	8	85	6	20	20				f	
3836	The Highway Turtles	Rigby PM Plus	1	8	85	6	20	20				f	
969	Mother Bear's Scarf	Rigby PM Stars	1	2	53	6	8	8	152		Bear Family	f	
970	Speedy Bee's Dance	Rigby PM Stars	1	2	53	6	8	8	166		Speedy Bee	f	
971	A Bad Day for Little Dinosaur	Rigby PM Stars	1	2	53	6	8	8	153		Little Dinosaur	f	
3839	The Best Part	Rigby PM 	1	8	87	11	20	20				f	
3840	Bushfire in the Koala Reserve	Rigby PM Plus	1	8	87	6	20	20				f	
3841	Sailing to a New Land	Rigby PM Plus	1	8	87	6	20	20		Historical Fiction		f	
3993	Antarctica	Cowcher, Helen	2	9	1	8	24	24				t	
3994	Thinking About Ants	Mondo	2	9	1	16	24	24		Bugs		t	
4110	I'm A Chef	Literacy 2000	2	9	42	7	28	28		Career		f	
3799	Henry and Mudge and the Happy Cat	Rylant, Cynthia	1	8	30	7	18	18			Henry and Mudge	f	
3796	Henry and Mudge Take The Big Test	Rylant, Cynthia	1	8	30	7	18	18			Henry and Mudge	f	
3798	Henry and Mudge and the Forever Sea	Rylant, Cynthia	1	8	31	8	18	18			Henry and Mudge	f	
3797	Henry and Mudge and the Cold Shivers	Rylant, Cynthia	1	8	31	4	18	18			Henry and Mudge	f	
3825	Kerry 	Rigby PM	1	8	83	9	20	20				f	
3830	The Right Place for Jupiter	Rigby PM	1	8	84	9	20	20				f	
908	If Horses Could Talk!	Dominie Collection	1	2	41	6	8	8	32		Teachers Choice Series	f	
909	Let's Eat	Domine Collection	1	2	41	6	8	8	65		Teachers Choice Series	f	
910	Looking at Baby Animals	Dominie Collection	1	2	41	4	8	8	54		Teachers Choice Series	f	
911	My Special Place	Dominie Collection	1	2	41	6	8	8	116		Teachers Choice Series	f	
912	Pictures	Dominie Collection	1	2	41	6	8	8	76		Teachers Choice Series	f	
919	Trouble	Dominie Collection	1	2	42	6	8	8	113		Teachers Choice Series	f	
917	Saturday Morning Breakfast	Dominie Collection	1	2	42	6	8	8	65		Teachers Choice Series	f	
914	Ben Ate It 	Dominie Collection	1	2	42	6	8	8	130		Teachers Choice Series	f	
915	I'm Telling	Dominie Collection	1	2	42	6	8	8	71		Teachers Choice Series	f	
916	It's Raining	Dominie Collection	1	2	42	3	8	8	86		Teachers Choice Series	f	
918	What Time Is It?	Dominie Collection	1	2	42	5	8	8	136		Teachers Choice Series	f	
924	I Love You	Dominie Collection	1	2	43	6	8	8	121		Teachers Choice Series	f	
925	Two is A Pair	Dominie Collection	1	2	43	6	8	8	78		Teachers Choice Series	f	
926	What If?	Dominie Collection	1	2	43	5	8	8	57		Teachers Choice Series	f	
927	The Wagon Ride	Dominie Collection	1	2	43	6	8	8	115		Teachers Choice Series	f	
938	Are You the New Principal?	Dominie Collection	1	2	48	3	8	8	120		Teachers Choice Series	f	
939	20 Pennies	Dominie Collection	1	2	48	4	8	8	212		Teachers Choice Series	f	
941	Don't Be Silly	Dominie Collection	1	2	48	5	8	8	76		Teachers Choice Series	f	
942	I Can Find	Dominie Collection	1	2	48	6	8	8	131		Teachers Choice Series	f	
943	Nick's Pet	Dominie Press	1	2	48	6	8	8	119		Teachers Choice Series	f	
3838	Buffalo Bill and the Pony Express	Coerr, Eleanor	1	8	86	7	20	20		Historical Fiction, Westward Expansion		f	
3837	Grandpa Comes to Stay	Mondo	1	8	86	14	20	20				f	
3995	Louis Braille Light out of Darkness 	Waterford	2	9	2	5	24	24		Biography		f	
3996	The Courage to Learn - Helen Keller	Waterford	2	9	2	8	24	24		Biography		f	
3997	The Flight of the Union	On My Own History	2	9	2	7	24	24		Biography		f	
3998	Cass Becomes A Star	Literacy Tree	2	9	2	7	24	24				f	
3999	Rice	Literacy Tree	2	9	3	20	24	24		Nutrition		f	
4000	A Brand-New Butterfly	Literacy Tree	2	9	3	20	24	24		Bugs		f	
4001	Diary of a Honeybee	Literacy 2000	2	9	4	5	24	24		Bugs		f	
4002	Whales The Gentle Giant 	Milton, Joyce	2	9	4	17	24	24				f	
4003	Young Davy Crockett	Troll	2	9	5	6	24	24		Biography		f	
4004	Young Arthur Ashe	Troll	2	9	5	4	24	24		Biography		f	
4005	Young Christopher Columbus	Troll	2	9	5	17	24	24		Biography		f	
3843	Let's Read Biography Gary Soto	Houghton-Miffin	2	8	1	18	16	16		Biography		f	
3844	Predicting the Weather	Benchmark	2	8	1	6	16	16		Weather		f	
3845	Big Red Tomatoes	Nat'l Geographic	2	8	1	2	16	16		Plants		f	
3846	Families and Feasts	Rigby PM Plus	2	8	2	21	16	16		Holidays, Cultures		f	
3847	Peaches All the Time	Benchmark	2	8	2	5	16	16		Plants		f	
3849	Brownie Math	Rosen Real	2	8	2	6	16	16		Math, Cooking		f	
3850	School Then and Now	Lerner	2	8	2	6	16	16		Long Ago		f	
3851	Growing Radishes and Carrots	Mondo	2	8	3	20	16	16		Plants		f	
3853	Money - Saving and Spending	Rosen Real	2	8	3	6	16	16		Math, Economics		f	
3854	Making Party Food	Rigby PM Plus	2	8	4	20	16	16		How to books, Cooking		f	
3855	Sharks	Alphakids	2	8	4	3	16	16				f	
3856	Space Travel	Alphakids	2	8	4	6	16	16		Solar System, Astronauts		f	
3857	A Trip to the Dentist	Rosen Real	2	8	4	6	16	16		Career, Community Helper, Health		f	
3858	Amazing Ants	Sundance	2	8	5	6	16	16		Bugs, Life Cycle		f	
3859	Animal Builders	Sunshine	2	8	5	6	16	16				f	
3860	Shadows Everywhere	Scholastic	2	8	5	10	16	16				f	
3861	Niagara Falls	Rosen Real	2	8	5	6	16	16		Landmarks		f	
3862	Washington, D.C.	Rosen Real	2	8	5	6	16	16		Landmarks, George Washington, American Symbols		f	
3863	Healthy Food	Rigby PM Plus	2	8	6	14	16	16		Nutrition, Health		f	
3864	Where does food come from?	Rigby PM Plus	2	8	6	14	16	16		Plants		f	
3865	Animal Groups	Benchmark	2	8	6	6	16	16				f	
3866	So Many Snakes	Rosen Real	2	8	6	2	16	16				f	
3867	Jumping Spiders	Rigby Sails	2	8	7	6	16	16		Bugs		f	
3868	Starfish	Rigby Sails	2	8	7	6	16	16				f	
3869	Hedgehogs	Rigby Sails	2	8	7	6	16	16				f	
3870	Tents	Rigby Sails	2	8	7	6	16	16				f	
3871	Tigers	Rigby Sails	2	8	7	6	16	16				f	
3872	Food Trappers	Wright Group	2	8	8	16	16	16		Plants, Bugs		f	
3873	Weather Watching	Sundance	2	8	8	6	16	16		Weather		f	
3874	What Is A Reptile	Troll	2	8	8	5	16	16				f	
3876	The Coast	Sundance	2	8	8	5	16	16		Landforms, Geography		f	
3877	Map My Town	Mondo	2	8	9	18	16	16		Anthology, Geography	Reading Safari Magazine	f	
3879	The Fourth of July	Rosen Real	2	8	9	6	16	16		Holiday, American Symbols		f	
3880	Water Power	Sundance	2	8	9	6	16	16		Energy		f	
3881	Bird Beaks	Wright Group	2	8	10	3	16	16				f	
3882	Fly Away Home	Wright Group	2	8	10	5	16	16		Bugs		f	
3884	Eva the Beekeeper	iOpeners	2	8	10	8	16	16		Bugs, Career		f	
3885	Making Electricity	Sundance	2	8	10	9	16	16		Energy		f	
3886	Clean and Healthy	Rosen Real	2	8	10	6	16	16		Health		f	
3887	How and Where Trees Live	Mondo	2	8	11	19	16	16		Plants, Seasons, Anthology	Reading Safari Magazine	f	
3888	Let's Read Biography Christopher Columbus	Houghton-Miffin	2	8	11	4	16	16		Biography		f	
1057	Jasper's Birthday Party	Pioneer Valley	1	2	78	6	10	10	123		Jasper the Cat	f	
3892	Headgear	Rigby Sails	2	8	12	6	16	16		Safety, Health		f	
3893	Trunks, Humps, and Tails	Rigby Sails	2	8	12	6	16	16				f	
3894	Saving the Bald Eagles 	Benchmark	2	8	12	6	16	16		Endangered		f	
3895	A Trip into Space	Sundance	2	8	12	8	16	16		Solar System		f	
3896	Water, Ice and Steam	Rosen Real	2	8	12	5	16	16		Matter		f	
3897	Our Sun	Rosen Real	2	8	12	5	16	16		Solar System, Weather		f	
3898	How do Animals Stay Alive?	Benchmark	2	8	13	6	16	16				f	
1046	It's Alright To Cry	Dominie Press	1	2	76	6	10	10	138		Teacher's Choice Series	f	
1047	If I Had an Elephant	Dominie Press	1	2	76	5	10	10	90		Teacher's Choice Series	f	
1048	The Family On Lake Street	Dominie Press	1	2	76	4	10	10	159		Teacher's Choice Series	f	
1049	Where Will I Sit?	Dominie Press	1	2	76	7	10	10	77		Teacher's Choice Series	f	
1051	The Reading Lesson	Dominie Press	1	2	76	5	10	10	78		Teacher's Choice Series	f	
1056	A Playmate for Jack	Pioneer Valley	1	2	78	6	10	10	194		Jack and Daisy	f	
1055	Party Clothes	Pioneer Valley	1	2	78	6	10	10	132		Jasper the Cat	f	
3878	Great Inventions	iOpeners	2	8	9	8	16	16				f	
3890	Follow a River	iOpeners	2	8	11	9	16	16		Geography, Landforms		f	
3889	Clouds	iOpeners	2	8	11	9	16	16		Weather, Water Cycle		f	
3891	Matsumura's Ice Sculpture	iOpeners	2	8	11	9	16	16				f	
3883	Dig in	iOpeners	2	8	10	12	16	16				f	
3875	The Mystery of Magnets	Newbridge	2	8	8	16	16	16		Magnets		f	
3848	We All Scream For Ice Cream!	Benchmark	2	8	2	5	16	16				f	
3899	The Penguin Chick	Nat'l Geographic	2	8	13	6	16	16		Life Cycle		f	
3900	What is a Mountain?	Rosen Real	2	8	13	6	16	16				f	
3901	The Power of Nature	Benchmark	2	8	13	6	16	16		Weather, Cause and Effect, Natural Disaster		f	
3902	Breathing	Bookshelf	2	8	13	5	16	16				f	
3903	Let's Read Biography  Squanto	Houghton-Miffin	2	8	15	10	18	18		Biography		f	
1011	A Birthday Present for Spaceboy	Pioneer Valley	1	2	56	12	8	8	130		Spaceboy	f	
1010	Jasper and the Squirrel	Pioneer Valley	1	2	63	6	8	8	99		Jasper the Cat	f	
3905	Astronauts in Space	Nat'l Geographic	2	8	15	2	18	18		Solar System		f	
3908	Living and Growing	Rigby PM Plus	2	8	16	14	18	18		Health, Life Cycle		f	
3909	The Big Snow	Benchmark	2	8	16	5	18	18		Weather, Snow		f	
3910	Jellybeans	Benchmark	2	8	16	2	18	18		Math, Estimation		f	
3911	How to Make Salsa	Mondo	2	8	17	10	18	18		How to books, Cooking		f	
3912	Under the Sea	Usborne	2	8	17	6	18	18				f	
3913	Unusual Machines	Sundance	2	8	17	6	18	18		Machines		f	
3914	Cats	Rigby PM	2	8	18	10	18	18				f	
3915	Dogs	Rigby PM	2	8	18	6	18	18				f	
1073	Lunch	Kaeden Group	1	2	83	6	10	10	156			f	
1075	Teasing Dad	Rigby PM	1	2	84	9	10	10	158			f	
1076	The best cake	Rigby PM	1	2	84	11	10	10	162			f	
1077	Tim's favorite toy	Rigby PM	1	2	84	10	10	10	202			f	
1078	Grandma's Memories	Literacy 2000	1	2	85	33	10	10	102			f	
1080	Baby Bear's Present	Rigby PM	1	2	86	9	10	10	206			f	
1081	Rabbits' ears	Rigby PM	1	2	86	14	10	10	179			f	
1088	Footprints	Literacy Tree	1	6	16A	26	12	12	96			f	
1083	Family Photos	Literacy Tree	1	2	88	37	10	10	106			f	
1085	Little Chimp and Baby Chimp	Rigby PM	1	2	65	11	8	8	184			f	
1094	Joe makes a house	Rigby PM	1	6	3A	8	12	12	174			f	
1087	The Swan family	Rigby PM 	1	2	91	11	10	10	172			f	
1084	Sarah's Seed	Literacy Tree	1	2	46	32	8	8	107			f	
1089	I Have a Pet	Dominie Press	1	1	37	3	2	2	35			f	
1090	Lost at the Fun Park	Rigby PM	1	2	93	9	10	10	192			f	
1091	Lucy's Sore Knee	Windmill Books	1	2	93	4	10	10	95			f	
1092	Pets	Literacy Tree	1	2	93	13	10	10	51			f	
1093	I'm Looking for My Hat	Wright Group	1	2	94	5	10	10	89			f	
1095	My Native American School	Kaeden Group	1	2	94	3	10	10	86			f	
1097	Tabby in the tree	Rigby PM	1	2	95	7	10	10	200			f	
1107	The Christmas tree	Rigby PM	1	2	99	9	10	10	163			f	
1108	Bandages	Kaeden Group	1	2	100	3	10	10	153			f	
1109	Cookie's Week	Scholastic	1	2	100	8	10	10	84			f	
3917	Guinea Pigs	Rigby PM	2	8	18	10	18	18				f	
3919	Mice	Rigby PM	2	8	19	5	18	18				f	
3920	Watch a Butterfly Grow	Benchmark	2	8	19	12	18	18		Life Cycle		f	
3921	Trees	Literacy Tree	2	8	19	20	18	18		Plants		f	
3922	Balance and Motion	Newbridge	2	8	20	14	18	18				f	
3925	Everybody Eats Bread	Literacy 2000	2	8	20	4	18	18		Nutrition		f	
3926	Spiders!	Rosen Real	2	8	20	2	18	18		Bugs		f	
3927	Using Resources to Build	Benchmark	2	8	20	6	20	20		Natural Resources		f	
3929	Our Clothes	Rigby PM Plus	2	8	21	13	18	18				f	
3930	The Animals of Alaska	Rosen Real	2	8	21	3	18	18				f	
3931	Chocolate	Sundance	2	8	21	3	18	18				f	
3932	Something Is Waiting	Literacy 2000	2	8	22	8	18	18				f	
3933	I Am A Rock	Scholastic	2	8	22	4	18	18				f	
3936	Desert Animals	Rosen Real	2	8	22	6	18	18				f	
3937	Benjamin Franklin	Benchmark	2	8	22	6	18	18		Biography		f	
3938	Some Machines Are Enormous	Mondo	2	8	23	20	18	18		Machines		f	
3940	Jellyfish	Alphakids	2	8	23	5	18	18				f	
3942	Taking Care of Ourselves	Rigby PM Plus	2	8	24	14	18	18				f	
3943	Our Sun	Benchmark	2	8	24	5	18	18		Solar System		f	
3944	Clouds	Benchmark	2	8	24	2	18	18		Weather		f	
3947	Shadows and Shade	Explorations	2	8	25	5	18	18				f	
3948	Floating and Sinking	Sundance	2	8	25	6	18	18				f	
3949	Sea Giants	Alphakids	2	8	25	4	18	18				f	
3950	Seeds 	Pebble Books	2	8	26	6	18	18		Plants		f	
3945	Flying Machines	Rigby Sails	2	8	25	6	18	18				f	
1099	Honey for Baby Bear	Rigby PM	1	2	96	7	10	10	200			f	
1082	The Fishing Contest	Literacy Tree	1	2	36	35	8	8	84			f	
1355	Look Out for Space Monster	Pioneer Valley	1	1	104	18	3	4	54		Spaceboy	f	
1357	Stargazers	Pioneer Valley	1	1	61A	18	3	4	83		Galaxy Girl	f	
3923	Oscar's Day	iOpeners	2	8	20	8	18	18				f	
3939	Penguins	Alphakids	2	8	23	4	18	18				f	
3934	Get the Message	iOpeners	2	8	22	9	18	18				f	
3935	Beatrix Potter	iOpeners	2	8	22	9	18	18		Biography		f	
3924	Fins, Wings, and Legs	iOpeners	2	8	20	8	18	18				f	
1098	Chug the tractor	Rigby PM	1	2	96	9	10	10	203			f	
3916	Goldfish	Rigby PM	2	8	18	11	18	18				f	
1106	My Grandpa	Mondo	1	2	99	4	10	10	79			f	
754	Sally's Beans	Rigby PM Collection	1	2	2A	27	6	6	123		Sally	f	
1086	Postcards From Pop	Literacy Tree	1	6	35	15	14	14	122			f	
3918	Parakeets	Rigby PM	2	8	19	10	18	18				f	
3907	Games We Play	Rigby PM Plus	2	8	16	15	18	18				f	
3941	Living with Others	Rigby PM Plus	2	8	24	14	18	18				f	
4025	Let's Read Biography Abraham Lincoln	Houghton-Miffin	2	9	12	9	24	24		Biography		f	
4026	Thurgood Marshall	Scholastic	2	9	12	3	24	24		Biography		f	
4027	Egyptians	Usborne	2	9	12	6	24	24		Egypt		f	
4028	What is Matter?	Benchmark	2	9	13	15	24	24				f	
4029	Incredible, Edible Plants	Benchmark	2	9	13	6	24	24		Plants		f	
4031	Making a Flashlight	Sundance	2	9	14	6	24	24				f	
4032	Firefighters	Sundance	2	9	14	4	24	24				f	
4034	Social Insects	Sundance	2	9	14	5	24	24		Bugs		f	
4035	Dinosaur Reports	Sundance	2	9	14	6	24	24		Dinosaurs		f	
4036	Volcanoes	Sundance	2	9	14	6	24	24				f	
4037	How Animals Move Around	Rigby PM Plus	2	9	15	12	24	24				f	
4038	How People Move Around	Rigby PM Plus	2	9	15	14	24	24				f	
4039	Animal Reports	Sundance	2	9	15	5	24	24				f	
4042	Who Eats What?	HarperTrophy	2	9	16	3	24	24				f	
4043	America's Symbols	Newbridge	2	9	16	6	24	24		American Symbols		f	
4044	Eggs and Chicks	Usborne	2	9	17	4	24	24				f	
4045	Tadpoles and Frogs	Usborne	2	9	17	5	24	24				f	
4046	Earthquake!	Newbridge	2	9	18	6	24	24				f	
4047	Our Solar System	Mondo	2	9	23	20	28	28		Anthology	Reading Safari Magazine	f	
4049	Kids In Colonial Times 	Powerkids Press	2	9	24	24	28	28		Colonial		f	
4050	Vote!	Christelow, Eileen	2	9	25	6	28	28		Election		f	
4052	Cesar Chavez	Rookie Biographies	2	9	25	5	28	28		Biography		f	
4054	Waterfalls, Glaciers, and Avalanches	Rigby PM Plus	2	9	26	6	28	28				f	
4055	Seasons and Weather	Rigby PM Plus	2	9	26	11	28	28		Weather		f	
4056	Sky Changes	Rigby PM Plus	2	9	26	15	28	28				f	
4057	Deserts	Rigby PM Plus	2	9	27	6	28	28				f	
4058	Forests	Rigby PM Plus	2	9	27	6	28	28				f	
4059	Mountains, Hills, and Cliffs	Rigby PM Plus	2	9	27	6	28	28				f	
4060	Rivers, Streams, and Lakes	Rigby PM Plus	2	9	28	6	28	28				f	
4061	Oceans, Seas, and Coasts	Rigby PM Plus	2	9	28	6	28	28				f	
4062	Sand	Nat'l Geographic	2	9	28	6	28	28				f	
4063	Landforms By the Sea	Newbridge	2	9	28	6	28	28				f	
4064	Plant and Animal Partners	Benchmark	2	9	29	6	28	28		Plants		f	
4065	Caterpillars	Mondo	2	9	29	20	28	28		Bugs		t	
4066	What Makes It Rain?	Troll	2	9	29	5	28	28				f	
4067	Spiders	Mondo	2	9	30	13	28	28		Bugs		t	
4069	Those Tricky Animals	Literacy 2000	2	9	30	5	28	28		Camouflage		f	
4070	Beekeeper	Literacy Tree	2	9	30	3	28	28		Career		f	
4071	Learning About Fairness from the Life of Susan B. Anthony	Powerkids Press	2	9	31	6	28	28		Biography		f	
4074	Earthworms and Their Food	Sunshine	2	9	32	11	28	28				f	
4075	How Earthworms Grow	Sunshine	2	9	32	9	28	28				f	
4076	How Earthworms Live	Sunshine	2	9	32	8	28	28				f	
4078	Masks	Literacy 2000	2	9	33	2	28	28				f	
4080	We Are All Alike	Benchmark	2	9	33	3	28	28				f	
4081	Walking	Literacy 2000	2	9	33	7	28	28				f	
4082	Using A Beak	Rigby Sails	2	9	34	7	28	28				f	
4083	Using A Tail	Rigby Sails	2	9	34	8	28	28				f	
4084	The Hiders	Rigby Sails	2	9	34	3	28	28		Camouflage		f	
4085	Ostriches	Rigby Sails	2	9	34	3	28	28				f	
4086	From Here To There	Rigby Sails	2	9	35	3	28	28				f	
4087	Baboon Troops	Rigby Sails	2	9	35	3	28	28				f	
4088	Bugs on the Menu	Rigby Sails	2	9	35	3	28	28		Bugs		f	
4090	Colonial Life	Children's Press	2	9	36	1	28	28		Colonial		f	
4091	The Thirteen Colonies	Children's Press	2	9	36	2	28	28		Colonial		f	
4093	Postcards From Mexico	Steck-Vaughn	2	9	37	10	28	28				f	
4094	How Flowers Grow	Usborne	2	9	38	4	28	28		Plants		f	
4095	From Father to Son	Rigby	2	9	38	6	28	28				f	
4097	How News Travels	Rigby PM Plus	2	9	39	16	28	28				f	
4098	Reaching Above  The Bessie Coleman Story	Waterford	2	9	39	12	28	28		Biography		f	
4099	This is Our Earth	Benson, Laura	2	9	39	3	28	28				t	
4101	Which Wheels are Best?	ETA Cuisenaire	2	9	40	10	28	28				f	
4103	Things We Fear	Sundance	2	9	41	5	28	28				f	
4104	Brain Power	Sundance	2	9	41	5	28	28				f	
4105	Hoaxes, Fibs, and Fakes	Sundance	2	9	41	6	28	28				f	
4051	George Washington Our First President	Rosen Real	2	9	25	8	28	28		Biography		f	
4072	Alexander Graham Bell 	Rosen Real	2	9	31	6	28	28		Biography		f	
4073	The Life of Abraham Lincoln	Rosen Real	2	9	31	6	28	28		Biography		f	
4107	Break That Code	Sundance	2	9	41	6	28	28				f	
4079	Fun with Shadows	iOpeners	2	9	33	9	28	28				f	
4041	All About Me	iOpeners	2	9	16	9	24	24		Procedural		f	
4100	Time to Celebrate!	iOpeners	2	9	40	8	28	28				f	
4048	Balloons	iOpeners	2	9	23	9	28	28				f	
4077	Book of Space Questions and Answers	iOpeners	2	9	33	9	28	28		Solar System		f	
4053	April - A Pueblo Story Teller	Newbridge	2	9	25	10	28	28				f	
4096	Islands	Dominie Press	2	9	38	6	28	28				f	
4068	Spiderman	Literacy Tree	2	9	30	4	28	28		Bugs		f	
4102	Let's Get Moving	Literacy 2000	2	9	40	5	28	28				f	
4089	Buttons for General Washington	On My Own History	2	9	36	4	28	28		American Revolution		f	
4112	Our Government	Rand McNally	2	9	43	2	28	28				f	
4113	My Town At Work	Nat'l Geographic	2	9	43	5	28	28				f	
4114	See the U.S.A.	Nat'l Geographic	2	9	43	3	28	28				f	
4115	Frederick Douglass  Fights for Freedom	Davidson, Margaret	2	9	44	7	28	28		Biography		f	
4116	A Picture Book of Benjamin Franklin	Holiday Publication	2	9	44	2	28	28		Biography		f	
4117	Owls	Rigby PM	2	9	45	6	28	28				f	
4118	Jellyfish	ETA Cuisenaire	2	9	45	9	28	28				f	
4119	Creatures of the Dark	Literacy 2000	2	9	45	5	28	28				f	
4120	Knights and Castles	Osborne, Mary Pope	2	9	46	1	28	28			Magic Tree House	f	
4121	Mummies and Pyramids	Osborne, Mary Pope	2	9	46	6	28	28		Egypt	Magic Tree House	f	
4122	Rain Forests	Osborne, Mary Pope	2	9	46	6	28	28			Magic Tree House	f	
4123	Dinosaurs	Osborne, Mary Pope	2	9	46	5	28	28		Dinosaurs	Magic Tree House	f	
4124	Abraham Lincoln	Osborne, Mary Pope	2	9	47	6	28	28		Biography	Magic Tree House	f	
4125	John Paul Jones 	Foxhound	2	9	48	45	28	28		Biography		f	
4126	George Washington	Capstone	2	3	1	6	30	30		Biography		f	
4127	Thomas Jefferson	Capstone	2	3	1	6	30	30		Biography		f	
4128	The U.S. Capitol	Capstone	2	3	1	6	30	30				f	
4129	The Milkmakers	Gibbons, Gail	2	3	1	2	30	30				f	
4131	The Popcorn Book	de Paola, Tomie	2	3	2	20	30	30				f	
4133	Paul Revere 	Steck-Vaughn	2	3	3	12	30	30		Biography		f	
4134	What is Rock?	Sunshine	2	3	4	20	30	30				f	
4135	What Happens to Rock?	Sunshine	2	3	4	16	30	30				f	
4136	Pocahontas Powhatan Princess	Rosen Publishing	2	3	5	10	30	30		Biography		f	
4137	Life in the Time of Rosa Parks and the Civil Rights Movement	Heinemann	2	3	5	2	30	30		Civil Rights		f	
4138	Do Whales Have Belly Buttons?	Scholastic	2	3	6	5	30	30				f	
4139	Up and Away! Taking A Flight	Mondo	2	3	6	5	30	30				t	
4140	Beavers	Mondo	2	3	6	15	30	30				t	
4141	Abe Lincoln The Young Years	Troll	2	3	7	6	30	30		Biography		f	
4142	Just A Few Words, Mr. Lincoln	Scholastic	2	3	7	3	30	30		Biography		f	
4144	Meet Christopher Columbus	Random House	2	3	8	6	30	30		Biography		f	
4145	Escape North! The Story of Harriet Tubman	Scholastic	2	3	8	5	30	30		Slavery, Biography		f	
4146	Titanic	Scholastic	2	3	8	4	30	30				f	
4147	Pilgrims Research Guide	Osborne, Mary Pope	2	3	9	6	30	30			Magic Tree House	f	
4149	Pandas and Other Endangered Species	Osborne, Mary Pope	2	3	9	6	30	30			Magic Tree House	f	
4150	Lighthouses Beacons of the Past	Book Treks	2	3	10	6	30	30				f	
4151	The Wonder of Whales	Book Treks	2	3	10	6	30	30				f	
4152	Buzz About Honeybees	Book Treks	2	3	10	6	30	30		Bugs		f	
4153	Mysterious Magnets	Book Treks	2	3	10	16	30	30		Magnets		f	
4154	All About Donkeys	Literacy 2000	2	3	11	5	30	30				f	
4155	Cesar Chavez	Benchmark	2	3	11	9	30	30		Biography		f	
4156	Michelle Kwan	Benchmark	2	3	11	6	30	30		Biography		f	
4157	Ants	Benchmark	2	3	11	6	30	30		Bugs		f	
4158	The Rockies	Newbridge	2	3	11	6	30	30				f	
4160	Helen Keller	Davidson, Margaret	2	3	12	11	30	30		Biography		f	
4161	Snakes and Other Reptiles	Osborne, Mary Pope	2	3	13	6	30	30			Magic Tree House	f	
4162	Ghosts	Osborne, Mary Pope	2	3	13	6	30	30			Magic Tree House	f	
4163	Dog Heroes	Osborne, Mary Pope	2	3	13	6	30	30			Magic Tree House	f	
4164	Jane Addams	Foxhound	2	3	14	36	30	30		Biography		f	
4166	What It Means To Be a Citizen	Pearson	2	3	16	6	30	30		Community		f	
4168	The Shapes of Water	Orbit	2	3	18	29	30	34				f	
4169	Inside the Castle Walls	ETA Cuisenaire	2	3	18	11	30	34				f	
4170	A Picture Book of Robert E. Lee	Holiday House	2	3	19	12	30	34		Biography		f	
4171	Planning a Birthday Party	Mondo	2	3	20	10	30	34				f	
4172	Animal Shelters	Mondo	2	3	20	13	30	34				t	
4173	How Do Birds Find Their Way?	HarperTrophy	2	3	20	4	30	34				f	
4174	Duck Magic	Literacy Tree	2	3	21	11	30	34				f	
4175	Splatter	Orbit	2	3	21	22	30	34				f	
4176	Animal Olympics	Mondo	2	3	22	20	30	34		Anthology	Reading Safari Magazine	f	
4177	The Moon	Literary 2000	2	3	22	11	30	34		Solar System		f	
4178	Cat Talk	Orbit	2	3	23	26	30	34				f	
4179	Creatures of the Dark	Literacy Tree	2	3	23	5	30	34				f	
4181	The Trojan Horse	Literacy Tree	2	3	23	7	30	34				f	
4182	Coconut Seed or Fruit?	iOpeners	2	3	24	6	30	34		Plants		f	
4183	Catching the Wind	iOpeners	2	3	24	5	30	34				f	
4184	We Need Insects!	iOpeners	2	3	24	6	30	34		Bugs		f	
4159	Going To School	iOpeners	2	3	12	6	30	30				f	
4111	The Amazing Silkworm	Nat'l Geographic	2	9	42	6	28	28				f	
4167	James Madison Founding Father	Rosen Real	2	3	16	7	30	30		Biography		f	
4187	Frogs	Mondo	2	3	24	9	30	34				f	
4188	Canoe Diary	Orbit	2	3	25	28	30	34				f	
4189	Toothwalkers	Rigby Sails	2	3	25	6	30	34				f	
4190	Burrows, Tunnels, and Chambers	Rigby Sails	2	3	25	6	30	34				f	
4132	The Cloud Book	dePaola, Tomie	2	3	2	5	30	30		Clouds		f	
4165	George Washington Carver	Foxhound	2	3	15	30	30	30		Biography		f	
4180	Rabbits	Literacy Tree	2	3	23	4	30	34				f	
4130	Dinosaur Olympics	ETA Cuisenaire	2	3	1	8	30	30		Dinosaurs		f	
4191	Slugs and Snails	Book Shelf	2	3	26	22	30	34				f	
4192	Clouds	Literacy Tree	2	3	26	7	30	34				f	
4193	Animal Fathers	Literacy 2000	2	3	26	5	30	34				f	
4194	A Letter From Fish Bay	Orbit	2	3	27	30	30	34		Biography		f	
4195	Whale Tales	Orbit	2	3	28	23	30	34				f	
4196	A Weed is a Flower - The Life of George Washington Carver	Aliki	2	3	28	6	30	34		Biography		f	
4197	Six Simple Machines	Sundance	2	3	28	6	30	34		Machines		f	
4198	Electricity Makes Things Work	Rigby PM Plus	2	3	29	17	30	34		Energy		f	
4199	Stomachs	Rigby Sails	2	3	29	6	30	34				f	
4200	Changes All Around Us	Nat'l Geographic	2	3	29	5	30	34				f	
4201	The Sun	Nat'l Geographic	2	3	29	4	30	34		Solar System		f	
4202	On Safari	Nat'l Geographic	2	3	30	6	30	34				f	
4203	Storms	Nat'l Geographic	2	3	30	5	30	34		Weather		f	
4204	Bicycles	Nat'l Geographic	2	3	30	5	30	34				f	
4205	Sound	Nat'l Geographic	2	3	30	2	30	34				f	
4206	Jackie Robinson and The Story of All-Black Baseball 	O'Connor, Jim	2	3	30	4	30	34		Biography		f	
4207	Water and Wind	Rigby PM Plus	2	3	31	6	30	34				f	
4208	Storms	Rigby PM Plus	2	3	31	6	30	34		Weather		f	
4209	The Sun	Rigby PM Plus	2	3	31	6	30	34		Solar System		f	
4210	A More Perfect Union	Mulberry	2	3	33	5	34	34				f	
4211	A More Perfect Union (Una Union Mas Perfecta)	Mulberry	2	3	33	2	34	34		Spanish		f	
4213	Insect Lives	Berger, Melvin	2	3	33	8	34	34		Bugs		f	
4214	Looking at Lizards	Book Treks	2	3	34	3	34	34				f	
4215	First Kids	Book Treks	2	3	34	6	34	34		Biography		f	
4216	Hunting Crocodiles with Steve Irwin	Book Treks	2	3	34	6	34	34		Biography		f	
4217	Force and Motion	Millmark Education	2	3	34	10	34	34				f	
4218	An International Airport	Book Shelf	2	3	35	5	34	34				f	
4222	All The World's A Stage	Literacy Tree	2	3	37	15	36	36				f	
4223	Hairy Little Critters	Literacy Tree	2	3	38	20	36	36				f	
4224	Crocodilians	Literacy Tree	2	3	38	5	36	36				f	
4225	Friendship In Action	Rigby	2	3	39	20	36	36				f	
4226	Plants	Rigby	2	3	39	6	36	36		Plants		f	
4227	The Glorious Flight	Provensen Press	2	3	40	19	36	36		Caldecott		f	
4228	Germs Make Me Sick	Harper Collins	2	3	40	3	36	36		Health		f	
4229	Molly Pitcher Young Patriot	Aladdin	2	3	41	2	36	36		Biography		f	
4230	Jim Thorpe Olympic Champion	Aladdin	2	3	41	2	36	36		Biography		f	
4231	Martha Washington America's First First Lady	Aladdin	2	3	41	2	36	36		Biography		f	
4232	Susan B. Anthony Champion of Women's Rights	Aladdin	2	3	41	2	36	36		Biography		f	
4234	What's the Big Idea, Ben Franklin?	Fritz, Jean	2	3	42	10	36	36		Biography		f	
4235	Sunshine Makes the Seasons	HarperTrophy	2	3	42	2	36	36				f	
4236	The Secret Soldier - The Story of Deborah Sampson	McGovern - Scholastic	2	3	42	7	36	36		Biography		f	
4237	Whales	Mondo	2	3	43	17	36	36				f	
4238	Stargazers	Scholastic	2	3	43	2	36	36		Solar System		f	
4239	The Bicycle Book	Rigby PM	2	3	44	10	36	36				f	
4240	Kites	Rigby PM	2	3	44	10	36	36				f	
4241	Yo-Yos	Rigby PM	2	3	44	11	36	36				f	
4242	Skateboarding	Rigby PM	2	3	45	10	36	36				f	
4243	Snowboarding Diary	Rigby PM	2	3	45	12	36	36				f	
4244	The Go-cart Team	Rigby PM	2	3	45	12	36	36				f	
4245	The Dinosaur Connection	Literacy Tree	2	3	46	20	36	36		Dinosaurs		f	
4246	Animals of the Ice and Snow	Literacy 2000	2	3	46	4	36	36				f	
4248	Rice	Nat'l Geographic	2	3	47	6	36	36		Nutrition		f	
4249	Traveling Across Australia	Nat'l Geographic	2	3	47	5	36	36				f	
4251	Exploring Tide Pools	Nat'l Geographic	2	3	47	4	36	36				f	
4252	The Olympics	Nat'l Geographic	2	3	47	6	36	36				f	
4253	Sky Rider	Orbit	2	3	48	24	36	36				f	
4254	Taking Flight	ETA Cuisenaire	2	3	48	9	36	36				f	
4255	You Can Canoe	Literary Tree	2	3	49	19	36	36				f	
4256	Animal Look-Alikes	iOpeners	2	3	49	9	36	36				f	
4257	Animal Hiding Places	Nat'l Geographic	2	3	50	6	36	36				f	
4258	My Balloon Ride	Nat'l Geographic	2	3	50	6	36	36				f	
4260	Strange Plants	Nat'l Geographic	2	3	50	5	36	36		Plants		f	
4261	Time Lines: 1900-2000	Nat'l Geographic	2	3	50	5	36	36				f	
4262	Amazing Journeys	Literacy Tree	2	3	51	20	36	36				t	
4265	Never Bored on Boards	Literacy 2000	2	3	52	10	36	36				f	
4247	Tadpole Diary	Literacy Tree	2	3	46	5	36	36		Life Cycle		t	
4263	Looking Back at Ancient Greece	Perfection	2	3	51	5	36	36		Greece		f	
4220	Abraham Lincoln	Heinemann	2	3	35	7	34	34		Biography		f	
4212	The Native Americans Told Us So	Newbridge	2	3	33	16	34	34		Native Americans		t	
4185	On the Farm	iOpeners	2	3	24	7	30	34				f	
4266	Gravity and the Solar System	Rigby PM Plus	2	3	53	6	36	36		Solar System		f	
4268	Volcanoes and Geysers	Rigby PM Plus	2	3	53	6	36	36				f	
4269	Kitesurfing	Rigby Sails	2	3	53	6	36	36				f	
4270	Rubbery Arms and Baggy Bodies	Rigby Sails	2	3	53	6	36	36				f	
4259	Simple Machines	Nat'l Geographic	2	3	50	8	36	36		Machines		f	
4264	Eye on Ancient Egypt	Perfection	2	3	51	6	36	36		Egypt		f	
4221	Water Wise	iOpeners	2	3	35	3	34	34				f	
4250	Harvest Festivals	Nat'l Geographic	2	3	47	7	36	36				f	
4271	Winter Survival	Literary Tree	2	3	54	12	36	36				f	
4274	All About Bikes	iOpeners	2	3	54	6	36	36				f	
4275	Bungee 70528	Orbit	2	3	55	24	36	36				f	
4276	Deserts	Gibbons, Gail	2	3	56	4	36	36				f	
4277	Abraham Lincoln President of a Divided Country	Children's Press	2	3	56	5	36	36		Biography		f	
4278	Squanto Friend of the Pilgrims	Bulla, Clyde	2	3	57	5	36	36		Biography		f	
4279	True Stories About Abraham Lincoln	Scholastic	2	3	57	2	36	36		Biography		f	
4280	Meet Thomas Jefferson	Barrett, Marvin	2	3	57	8	36	36		Biography		f	
4281	Platypus	Mondo	2	3	61	20	38	38				f	
4282	Rain Forest Secrets	Scholastic	2	3	61	6	38	38				f	
4283	If you lived in Williamsburg in Colonial Days	Scholastic	2	3	62	16	38	38		Colonial		f	
4284	Betsy Ross	Holiday House	2	3	63	11	38	38		Biography, American Symbols		f	
4285	Down on the Ice	Orbit	2	3	64	30	38	38				f	
4286	Bats	Literacy Tree	2	3	64	5	38	38				f	
4287	Puppets	Literacy Tree	2	3	65	16	38	38				f	
4288	The Magic School Bus At the Waterworks	Cole, Joanna	2	3	66	9	38	38			Magic School Bus	t	
4290	The Magic School Bus Inside the Earth	Cole, Joanna	2	3	66	4	38	38			Magic School Bus	f	
4291	Deserts and Desert Dwellers	Mondo	2	3	67	20	38	38		Anthology	Reading Safari Magazine	f	
4292	Encyclopedia of World Sports	iOpeners	2	3	67	5	38	38				f	
4294	George Washington's Breakfast	Fritz, Jean	2	3	68	2	38	38		Biography		f	
4296	Using Your Five Senses	Nat'l Geographic	2	3	69	5	38	38				f	
4298	Laughter is the Best Medicine	Literacy Tree	2	3	70	20	38	38				f	
4299	The Very First Americans	Ashrose, Cara	2	3	70	6	38	38		Native Americans		f	
4300	The Sky's the Limit	Orbit	2	3	71	22	38	38				f	
4301	Astronauts Take Flight	iOpeners	2	3	71	6	38	38				f	
4302	A Year in Antarctica	iOpeners	2	3	71	6	38	38				f	
4303	Saving the Yellow Eye	Orbit	2	3	72	28	38	38		Endangered		f	
4304	Travel Smart	iOpeners	2	3	72	6	38	38				f	
4306	Native Americans	Children's Press	2	3	73	8	38	38		Native Americans		f	
4309	Christopher Columbus and His Voyage to the New World	Young, Robert	2	3	74	10	38	38		Biography		f	
4310	Booker T. Washington	McLoone, Margo	2	3	75	20	38	38		Biography		f	
4311	Cesar Chavez	Capstone	2	3	75	5	38	38		Biography		f	
4312	Jane Addams Pioneer Social Worker	Children's Press	2	3	76	6	38	38		Biography		f	
4313	Do All Spiders Spin Webs?	Scholastic	2	3	76	5	38	38		Bugs		f	
4314	What Makes An Ocean Wave?	Scholastic	2	3	76	6	38	38				f	
4315	What If You'd Been at Jamestown?	Perfection	2	3	77	20	38	38		Colonial		f	
4317	Asthma In Action	Book Treks	2	3	78	6	38	38				f	
4318	Ellen Ochou - Reaching for the Stars	Book Treks	2	3	78	6	38	38		Biography		f	
4319	More Than Marionettes	Book Treks	2	3	78	5	38	38				f	
4320	Young Eagles Take to the Sky	Book Treks	2	3	78	6	38	38				f	
4321	Police Work	Book Treks	2	3	78	9	38	38		Career		f	
4322	Hiking the Appalachian Trail	Book Treks	2	3	78	6	38	38				f	
4323	Yo-Yo Ma  World Musician	Book Treks	2	3	78	6	38	38		Biography		f	
4324	Down the Mighty Mississippi	Book Treks	2	3	78	6	38	38				f	
4325	American Indian Crafts	Book Treks	2	3	78	6	38	38		Native Americans		f	
4326	The Story of Small Fry	Literacy  Tree	2	3	79	14	38	38				f	
4327	Dinosaur Bones	Aliki	2	3	79	5	38	38		Dinosaurs		f	
4328	Seeing is Believing	Rigby	2	3	80	10	38	38				f	
4329	Work and Machines	Rigby	2	3	80	4	38	38		Machines		f	
4330	Plant Works	Rigby	2	3	80	6	38	38		Plants		f	
4331	Creepy Crawlies	Literacy 2000	2	3	80	7	38	38		Bugs		f	
4332	Searching For Sea Lions	Orbit	2	3	81	24	38	38				f	
4333	The Mystery of Magnets	iOpeners	2	3	81	6	38	38		Magnets		f	
4335	Land of the Dragons	Orbit	2	3	82	25	38	38				f	
4336	Caught in A Flash	Orbit	2	3	82	24	38	38				f	
4337	The Jesse Owens Story	Perfection	2	3	83	20	38	38		Biography		f	
4338	Finding Providence  The Story of Roger Willilams	Avi	2	3	83	6	38	38		Biography		f	
4496	Asli's Story	Orbit	2	4	63	19	40	40		Refugee, Somalia		f	
4339	Alexander Graham Bell and the Telephone	Nat'l Geographic	2	3	84	6	38	38		Biography		f	
4340	The Story of the Pony Express	Nat'l Geographic	2	3	84	6	38	38		Westward Expansion		f	
4341	Worm Work	Rigby Sails	2	3	84	6	38	38				f	
4342	Oil on Water	Rigby Sails	2	3	84	6	38	38				f	
4343	Clean and Clear	Houghton-Miffin	2	3	85	36	38	38				f	
4293	John Smith	Foxhound	2	3	68	36	38	38		Pocahontas, Biography		f	
4346	If you lived at the Time of the Civil War	Scholastic	2	4	2	14	40	40		Civil War		f	
4347	If You Sailed On the Mayflower	Scholastic	2	4	3	16	40	40				f	
4348	If You Lived in Colonial Times	Scholastic	2	4	4	15	40	40		Colonial		f	
4334	The Changing Earth	iOpeners	2	3	81	7	38	38				f	
4272	They Worked Together	iOpeners	2	3	54	4	36	36				f	
4273	Could We Live on the Moon?	iOpeners	2	3	54	10	36	36		Solar System		f	
4289	The Magic School Bus in the Time of the Dinosaurs	Cole, Joanna	2	3	66	4	38	38		Dinosaurs	Magic School Bus	f	
4297	Make it, Wear it	I openers	2	3	69	5	38	38		How to books		f	
4308	Tracing the Anasazi	Houghton-Miffin	2	3	74	32	38	38		How to books		f	
4316	How a Book Gets Published	Book Treks	2	3	78	6	38	38		How to books		f	
4307	How to Grow Crystals	Mondo	2	3	73	20	38	38		How to books		f	
4349	If You Were There When They Signed the Constitution	Scholastic	2	4	5	11	40	40				f	
4350	If You Lived at the Time of the American Revolution	Scholastic	2	4	6	11	40	40		American Revolution		f	
4351	If You Traveled West in a Covered Wagon	Scholastic	2	4	7	14	40	40		Westward Expansion		f	
4352	If You Lived With the Cherokee 	Scholastic	2	4	8	12	40	40		Native Americans		f	
4353	If You Lived at the Time of the Great San Francisco Earth Quake	Scholastic	2	4	9	10	40	40				f	
4354	If Your Name Was Changed At Ellis Island	Scholastic	2	4	10	13	40	40		Immigration		f	
4357	If You Grew Up With Abraham Lincoln	Scholastic	2	4	12	5	40	40		Biography		f	
4359	School Days in 1700	Houghton-Miffin	2	4	13	34	40	40				f	
4361	All About Alligators	Arnosky, Jim	2	4	13	4	40	40				f	
4362	Remarkable Road Side Attractions	Book Treks	2	4	14	6	40	40				f	
4363	Adding Up the Ads - Kids and Advertising	Book Treks	2	4	14	6	40	40				f	
4364	The Chocolate Farm	Book Treks	2	4	14	6	40	40				f	
4365	What's the Fashion?	Book Treks	2	4	14	6	40	40				f	
4366	The International Space Station	Book Treks	2	4	14	5	40	40		Solar System		f	
4368	Wolves	Literacy 2000	2	4	15	5	40	40				f	
4369	It's a Frog's Life	Literacy 2000	2	4	15	2	40	40				f	
4370	What's Cooking?	Orbit	2	4	16	29	40	40		Cooking		f	
4371	Gold	Nat'l Geographic	2	4	16	6	40	40				f	
4372	Volcanoes	Nat'l Geographic	2	4	16	6	40	40				f	
4373	Nature Did It First	Newbridge	2	4	17	12	40	40				f	
4374	Pocahontas	Houghton-Miffin	2	4	17	25	40	40		Biography		f	
4375	Bridging the Gap	Orbit	2	4	18	30	40	40				f	
4376	Heartlands	Newbridge	2	4	18	12	40	40				f	
4379	All About Owls	Scholastic	2	4	19	2	40	40				f	
4380	Night Lights - A Cruise Around the Solar System	Orbit	2	4	20	25	40	40		Solar System		f	
4381	Island Animals	Newbridge	2	4	20	9	40	40				f	
4382	Spider Relatives	Literacy 2000	2	4	20	2	40	40		Bugs		f	
4383	Finding the Titanic	Scholastic	2	4	21	10	40	40				f	
4384	The Code of the Drum	Perfection	2	4	21	8	40	40		Civil War		f	
4385	Journey to the Undersea Gardens	iOpeners	2	4	22	4	40	40				f	
4386	At the Root of It	iOpeners	2	4	22	4	40	40		Plants		f	
4387	People on the Move	iOpeners	2	4	22	10	40	40				f	
4388	New Language, New Friends	iOpeners	2	4	22	9	40	40				f	
4389	It's a Mammal!	iOpeners	2	4	22	6	40	40				f	
4390	Albatross, the Survivor	Rigby Sails	2	4	22	6	40	40				f	
4391	Hurricanes	Newbridge	2	4	23	11	40	40		Weather		f	
4392	Free Fall	Orbit	2	4	23	23	40	40				f	
4393	Up the Amazon	Nat'l Geographic	2	4	23	4	40	40				f	
4394	Hometowns	Newbridge	2	4	24	12	40	40				f	
4395	For A Good Cause	Newbridge	2	4	24	12	40	40				f	
4396	Famous Animals	Literacy Tree	2	4	25	20	40	40				f	
4397	Trains	Literacy Tree	2	4	25	3	40	40				f	
4398	The Mountain Bike Challenge	Orbit	2	4	26	24	40	40				f	
4399	From Axes to Zippers: Simple Machines	Benchmark	2	4	26	6	40	40		Simple Machines		f	
4400	In the Search of the Mummy	ETA Cuisenaire	2	4	26	9	40	40				f	
4401	Amelia Earhart	Literacy Tree	2	4	27	20	40	40		Biography		f	
4402	Sarah Morton's Day  A Day in the Life of a Pilgrim Girl	Scholastic	2	4	28	15	40	40		Biography		f	
4403	Taking to the Air	Literary Tree	2	4	28	14	40	40				f	
4405	It's All In the Soil	iOpeners	2	4	30	11	40	40				f	
4406	Helen Keller's Teacher	Davidson, Margaret	2	4	30	7	40	40		Biography		f	
4407	Light	Nat'l Geographic	2	4	30	6	40	40				f	
4408	Wake Up, Young Soldier	Houghton-Miffin	2	4	31	36	40	40		Civil War		f	
4409	Can It Rain Cats and Dogs?	Scholastic	2	4	31	2	40	40				f	
4411	Sports Technology	Rigby PM	2	4	32	12	40	40				f	
4412	Great Sporting Events	Rigby PM 	2	4	33	12	40	40				f	
4413	Sports On Wheels	Rigby PM	2	4	33	17	40	40				f	
4414	Beginning of Sports	Rigby PM	2	4	34	14	40	40				f	
4415	Extreme Sports	Rigby PM 	2	4	34	9	40	40				f	
4416	Our Changing Earth	Orbit	2	4	35	22	40	40				f	
4417	There's No Place Like Home	Orbit	2	4	35	20	40	40		Solar System		f	
4418	Hawaiian Magic	Orbit	2	4	36	22	40	40				f	
4419	Measuring the Weather	Orbit	2	4	36	23	40	40		Weather		f	
4420	Can't You Make Them Behave, King George?	Fritz, Jean	2	4	37	6	40	40		Biography, American Revolution		f	
4421	Where was Patrick Henry on the 29th of May ?	Fritz, Jean	2	4	37	10	40	40		Biography, American Revolution		f	
4344	Children of Ancient Greece	Rosen Real	2	3	85	6	38	38		Greece		f	
4377	Ancient Egyptians	World Wise	2	4	19	16	40	40		Egypt		f	
4378	Ancient Romans	World Wise	2	4	19	18	40	40		Rome		f	
4424	And Then What Happened, Paul Revere?	Fritz, Jean	2	4	38	9	40	40		Biography, American Revolution		f	
4425	George Washington A Picture Book Biography	Giblin, James Cross	2	4	38	2	40	40		Biography, American Revolution		f	
4426	Martial Arts	Orbit	2	4	39	18	40	40				f	
4427	News Flash!	Orbit	2	4	39	23	40	40				f	
4428	The Amazing Book oF Mammal Records	Scholastic	2	4	40	12	40	40				f	
4356	If You Lived With The Sioux Indians	Scholastic	2	4	11	7	40	40		Native Americans		f	
4404	America's Civil War	Perfection	2	4	29	12	40	40		Civil War		f	
4429	What do Sharks Eat for Dinner?	Scholastic	2	4	40	5	40	40				f	
4430	Weather Words and What They Mean	Gibbons, Gail	2	4	40	2	40	40		Weather		f	
4431	Coral Reefs	iOpeners	2	4	41	8	40	40				f	
4432	Look Up	iOpeners	2	4	41	6	40	40				f	
4433	Island Life	iOpeners	2	4	41	8	40	40				f	
4434	Who Needs Weeds?	Newbridge	2	4	41	10	40	40		Plants		f	
4435	Race to the Pole	Nat'l Geographic	2	4	41	4	40	40				f	
4436	Parks for People	Newbridge	2	4	42	12	40	40				f	
4437	Big Digs	Newbridge	2	4	42	12	40	40		Machines		f	
4438	Many Happy Returns A Review of Recycling	Literacy 2000	2	4	42	3	40	40		Go Green		f	
4439	Animals On the Move	Newbridge	2	4	43	12	40	40				f	
4440	Metal Matters	Newbridge	2	4	43	12	40	40				f	
4441	Days to Remember	iOpeners	2	4	43	6	40	40				f	
4442	The Trail of Tears	Scholastic	2	4	44	10	40	40		Native Americans		f	
4443	Pocahontas and the Strangers	Scholastic	2	4	44	3	40	40		Biography		f	
4444	Children of the Civil War	1st Ave. Editions	2	4	44	5	40	40		Civil War		f	
4445	Tasmanian Devils	Orbit	2	4	45	21	40	40				f	
4446	What Can You Do with an Elephant House?	Orbit	2	4	45	18	40	40				f	
4447	A World of Imagination	Literacy Tree	2	4	46	9	40	40				f	
4449	Cracking the Wall	1st Ave. Editions	2	4	46	10	40	40		Integration		f	
4450	Ice on Earth	Newbridge	2	4	47	12	40	40				f	
4451	Exploring Caves	Newbridge	2	4	47	12	40	40				f	
4452	Andrew Carnegie	Wright Group	2	4	47	6	40	40		Biography		f	
4453	The Big Picture - Making a TV Drama Series	Orbit	2	4	48	18	40	40				f	
4454	Hunting the Horned Lizard	Orbit	2	4	48	18	40	40				f	
4455	Fossil Tales	Newbridge	2	4	49	11	40	40				f	
4456	What A Job!	Newbridge	2	4	49	12	40	40		Career		f	
4457	Remembering the Big Quake	Orbit	2	4	50	19	40	40				f	
4459	The Story of Thomas Alva Edison	Davidson, Margaret	2	4	50	3	40	40		Biography		f	
4460	Helpful Hints For Boring Moments	Rigby Sails	2	4	51	6	40	40		Procedural Text		f	
4461	North to the Pole with Matthew Henson	Book Treks	2	4	51	6	40	40				f	
4462	The Ancient Ones The Anasazi of Mesa Verde	Book Treks	2	4	51	6	40	40				f	
4463	Wacky Weather	Book Treks	2	4	51	5	40	40		Weather		f	
4464	They Changed the World	iOpeners	2	4	51	4	40	40				f	
4465	What Makes an Animal an Animal?	Benchmark	2	4	53	6	40	40				f	
4466	What Makes a Plant a Plant?	Benchmark	2	4	53	12	40	40		Plants		f	
4468	Ancient China	Chelsea House	2	4	53	2	40	40		China		f	
4469	Work Then and Now	Newbridge	2	4	54	12	40	40				f	
4470	Temporary Shelters	Newbridge	2	4	54	12	40	40				f	
4471	Talkin' About Bessie The Story of Aviator Elizabeth Coleman	Grimes, Nikki	2	4	54	6	40	40		Biography		f	
4473	Forces and Motion	Ranger Rick	2	4	55	16	40	40				f	
4474	Hunting With My Camera	Literacy Tree 	2	4	55	5	40	40				f	
4475	America's Coasts	Newbridge	2	4	56	12	40	40				f	
4476	Wolves	Newbridge	2	4	56	12	40	40				f	
4477	The Iditarod	Perfection	2	4	56	6	40	40				f	
4478	How I Met Einstein	Orbit	2	4	57	18	40	40				f	
4479	Wreck Trek	Orbit	2	4	57	18	40	40				f	
4480	A Drop of Water	Scholastic	2	4	57	5	40	40				f	
4481	National Parks	iOpeners	2	4	58	6	40	40				f	
4482	Save Our Earth	iOpeners	2	4	58	6	40	40		Go Green		f	
4483	Bird Watching	iOpeners	2	4	58	6	40	40				f	
4484	Olympic Champions	iOpeners	2	4	58	7	40	40				f	
4485	All About the Body	iOpeners	2	4	58	6	40	40				f	
4487	The American Revolution	Teacher Crafted Materials	2	4	59	6	40	40		American Revolution		f	
4488	Whale! Nantucket Whaling Days	Houghton-Miffin	2	4	60	36	40	40				f	
4489	Escape to Freedom The Underground Railroad	Benchmark	2	4	60	6	40	40		Underground Railroad		f	
4490	Journeying into Rain Forests	Nat'l Geographic	2	4	61	12	40	40				f	
4491	Introduction to Weather	Nat'l Geographic	2	4	61	3	40	40		Weather		f	
4492	Learning About Ocean Animals	Nat'l Geographic	2	4	61	11	40	40				f	
4493	The Living Rain Forest	Orbit	2	4	62	23	40	40				f	
4494	Riddles of the Universe	Orbit	2	4	62	20	40	40				f	
4497	Alice's Diary Living With Diabetes	Orbit	2	4	63	24	40	40		Health		f	
4498	Robots	iOpeners	2	4	63	6	40	40				f	
4499	Comets	Rigby Sails	2	4	64	6	40	40		Solar System		f	
4422	The Declaration of Independence and Thomas Jefferson of Virginia	Rosen	2	4	37	7	40	40		Biography		f	
4467	Ancient Greece	Chelsea House	2	4	53	6	40	40		Greece		f	
4472	China - Civilizations Past to Present	Nat'l Geographic	2	4	55	15	40	40		China		f	
4501	Sports News	Rigby Sails	2	4	64	6	40	40		Newspaper Report		f	
4502	Uninvited Guests	Rigby Sails	2	4	64	6	40	40				f	
4503	Divers of the Deep Sea	Nat'l Geographic	2	4	64	6	40	40				f	
4504	Going West Trials and Trade-Offs	Houghton-Miffin	2	4	65	35	40	40		Westward Expansion		f	
4505	Skeletons Inside and Out	iOpeners	2	4	65	6	40	40				f	
4506	Our History with Horses	Newbridge	2	4	66	12	40	40				f	
4448	Amy Johnson- Pioneering Woman Aviator	Literacy 2000	2	4	46	5	40	40		Biography		f	
4495	The Great Pyramid	Nat'l Geographic	2	4	62	7	40	40		Egypt		f	
4507	Peering Into Darkness	Nat'l Geographic	2	4	66	12	40	40				f	
4508	First-Aid Handbook	iOpeners	2	4	66	6	40	40				f	
4509	Endurance Shackleton's Antarctic Expedition	Orbit	2	4	67	16	40	40				f	
4510	Twisting Up a Storm	Orbit	2	4	67	17	40	40				f	
4511	Rome	Nat'l Geographic	2	4	67	7	40	40		Rome		f	
4512	Tremendous Trees	Book Treks	2	4	68	6	40	40		Plants		f	
4513	Maya Lin- Linking People and Places	Book Treks	2	4	68	6	40	40		Biography		f	
4514	Light in the Sky	Book Treks	2	4	68	2	40	40				f	
4515	The Great Barrier Reef	Book Treks	2	4	68	5	40	40				f	
4516	Gloria Estefan	Book Treks	2	4	68	6	40	40		Biography		f	
4517	Transforming Trash	Orbit	2	4	68	17	40	40		Go Green		f	
4518	Fight In The Fields: Cesar Chavez	Perfection	2	4	69	12	40	40		Biography		f	
4519	Creatures of the Reef	Orbit	2	4	70	20	40	40				f	
4520	What In The World Is the World Wide Web?	Orbit	2	4	70	17	40	40				f	
4521	The Body in Motion	Newbridge	2	4	71	10	40	40				f	
4522	Mars	Newbridge	2	4	71	12	40	40		Solar System		f	
4523	Energetic Me	Rigby	2	4	72	6	40	40				f	
4524	Switched On	Rigby	2	4	72	11	40	40				f	
4525	Water Changes Things	Rigby	2	4	72	13	40	40				f	
4526	Watery Worlds	Rigby	2	4	72	8	40	40				f	
4527	Whirly Birds	Literacy 2000	2	4	72	5	40	40				f	
4528	Growing up In Ancient Greece	Troll	2	4	73	12	40	40		Greece		f	
4530	Growing Up in Ancient China	Troll	2	4	73	12	40	40		China		f	
4531	Martin Luther King, Jr.	Usborne	2	4	74	5	40	40		Biography		f	
4532	It'll Be All Right on the Night!	Orbit	2	4	74	18	40	40				f	
4533	Harriet Tubman The Road to Freedom	Troll	2	4	74	2	40	40		Biography		f	
4534	Amazing Arachnids	Book Treks	2	4	75	6	40	40		Bugs		f	
4535	Saving The Florida Panthers	Book Treks	2	4	75	11	40	40		Endangered		f	
4536	African American Cowboys True Heroes of the Old West	Book Treks	2	4	75	6	40	40		Westward Expansion		f	
4538	Penguins	Newbridge	2	4	75	11	40	40				f	
4539	Frogs. Toads, Lizards, and Salamanders	Scholastic	2	4	76	9	40	40				f	
4540	Skeletons! Skeletons!	Scholastic	2	4	76	7	40	40				f	
4541	The True Story of Corky the Blind Seal	Scholastic	2	4	76	7	40	40				f	
4542	Our West	Newbridge	2	4	77	12	40	40				f	
4543	Codes & Messages	Literacy 2000	2	4	77	5	40	40				f	
4544	Mali Land of Gold & Glory	Five Ponds Press	2	4	77	4	40	40				f	
4545	Jackie Robinson: Strong Inside and Out	Time for Kids	2	4	77	6	40	40		Biography		f	
4546	Discovering Underwater Treasures	Nat'l Geographic	2	4	78	12	44	44				f	
4547	Protecting the Seas	Nat'l Geographic	2	4	78	12	44	44				f	
4548	Plant Atlas	Benchmark	2	4	78	2	44	44		Plants		f	
4549	Lost Star  The Story of Amelia Earhart	Scholastic	2	4	79	22	44	44		Biography		f	
4550	Animal Senses: Sight and Hearing	Rigby Sails	2	4	80	6	44	44		Senses		f	
4551	Animal Senses: Smell, Taste, Touch	Rigby Sails	2	4	80	6	44	44		Senses		f	
4552	Brain Matter	Rigby Sails	2	4	80	6	44	44				f	
4553	Wildlife Photographer Frank Greenway	iOpeners	2	4	80	6	44	44		Biography		f	
4554	Peter Salem - Hero of the Revolution	Houghton-Miffin	2	4	81	34	44	44		Biography, American Revolution		f	
4555	Winter at Valley Forge	Capstone	2	4	81	6	44	44		Graphic Novel, American Revolution		f	
4556	The Northeast	Nat'l Geographic	2	4	82	12	44	44				f	
4557	The Southeast	Nat'l Geographic	2	4	82	12	44	44				f	
4558	Tracking Animal Migrators	Nat'l Geographic	2	4	83	11	44	44				f	
4559	Feeding the World	Nat'l Geographic	2	4	83	11	44	44				f	
4560	Hurricane	iOpeners	2	4	83	4	44	44		Weather		f	
4561	Discovering Ancient Civilizations	Nat'l Geographic	2	4	84	10	44	44				f	
4562	Endangered Species	Nat'l Geographic	2	4	84	11	44	44				f	
4563	Blowing In The Wind	Literacy 2000	2	4	84	9	44	44		Weather		f	
4564	Colonial Times from A to Z	Crabtree	2	4	85	6	44	44		Colonial		f	
4565	Colonial Crafts	Crabtree	2	4	85	6	44	44		Colonial		f	
4566	George vs. George	Schanzer, Rosalyn	2	4	85	6	44	44		American Revolution		f	
4567	Pilgrims of Plimouth	Sewall, Marcia	2	4	85	3	44	44				f	
4568	Freedom Train The Story of Harriet Tubman	Scholastic	2	4	86	12	44	44		Biography, Underground Railroad		f	
4569	A Knight's Journey	Sundance	2	4	87	4	44	44		Medieval		f	
4570	Awesome Adventures	Sundance	2	4	87	4	44	44				f	
4571	One In A Million	Sundance	2	4	87	3	44	44				f	
4572	Fantastic Creatures	Sundance	2	4	87	5	44	44				f	
4573	The West	Nat'l Geographic	2	4	88	13	44	44				f	
4574	The Midwest	Nat'l Geographic	2	4	88	12	44	44				f	
4575	On Board the Santa Maria	Houghton-Miffin	2	4	89	35	44	44				f	
4576	Taste of America	iOpeners	2	4	89	6	44	44				f	
4577	Dancing Around the World	iOpeners	2	4	89	6	44	44				f	
4537	Clay Magic The Art of Clay Animation	Book Treks	2	4	75	6	40	40				f	
4581	Shh! We're Writing the Constitution	Fritz, Jean	2	4	91	9	44	44				f	
4582	One Thing Leads To Another	Newbridge	2	4	92	10	44	44				f	
4583	Protecting Primates	Nat'l Geographic	2	4	92	17	44	44				f	
4584	Charting Your Course	iOpeners	2	4	92	6	44	44				f	
4585	Narcissa Whitman Brave Pioneer	Troll	2	4	93	8	44	44		Biography		f	
4586	Rosa	Giovanni, Nikki	2	4	93	5	44	44		Biography		f	
4587	The Southwest	Nat'l Geographic	2	4	94	5	44	44				f	
4589	A Guide to Rocks and Minerals	iOpeners	2	4	94	6	44	44				f	
4591	Crossing Borders: Stories of Immigrants	iOpeners	2	4	95	7	44	44		Immigration		f	
4592	World Beneath The Waves	Benchmark	2	4	95	2	44	44				f	
4593	To Space and Back	Ride, Sally	2	4	96	4	44	44		Biography		f	
4594	What's in a Name? A Story about George Eliot	Rigby PM Chapter	2	4	96	9	44	44		Biography		f	
4595	Civil War Ghosts	Scholastic	2	4	96	4	44	44		Civil War		f	
4596	Find Out About It	iOpeners	2	4	97	6	44	44				f	
4597	Try It!	iOpeners	2	4	97	6	44	44				f	
4598	Going Solo	iOpeners	2	4	97	6	44	44				f	
4599	Nutty for Peanuts	Book Treks	2	4	98	6	44	44				f	
4600	The Surprising World of Plants	Steck-Vaughn	2	4	98	6	44	44		Plants		f	
4601	Digging for Dinosaurs	Nat'l Geographic	2	4	98	10	44	44		Dinosaurs		f	
4148	American Revolution Research Guide	Osborne, Mary Pope	2	3	9	6	30	30		American Revolution	Magic Tree House	f	
4602	Dinosaurs Before Dark	Osborne, Mary Pope	1	9	81	21	28	28		Dinosaurs	Magic Tree House	f	
4367	What's Living at Your Place?	Orbit	2	4	15	29	40	40		Bugs, Life Cycle		f	
3468	Free to Learn	Perfection	1	9	141	17	28	28		Historical Fiction, Slavery		f	
4030	The Moon	Newbridge	2	9	13	11	24	24		Solar System		f	
4579	Inside the Internet	Nat'l Geographic	2	4	90	11	44	44				f	
3928	Our Bodies	Rigby PM Plus	2	8	21	16	18	18				f	
4603	Meet Addy	Porter, Connie	1	4	1	2	40	40			American Girl	f	
4604	Addy Learns a Lesson	Porter, Connie	1	4	1	3	40	40			American Girl	f	
4605	Attack on Fort McHenry	Literacy 2000	1	4	1	4	40	40		Historical Fiction		f	
4606	Meet Kaya	Shaw, Janet	1	4	2	6	40	40		Historical Fiction, Native American	American Girl	f	
4607	Kaya's Escape! 	Shaw, Janet	1	4	2	6	40	40		Historical Fiction, Native American	American Girl	f	
4608	Kaya's Hero 	Shaw, Janet	1	4	3	6	40	40		Historical Fiction, Native American	American Girl	f	
4609	Kaya And Lone Dog 	Shaw, Janet	1	4	3	6	40	40		Historical Fiction, Native American	American Girl	f	
4610	Kaya Shows The Way 	Shaw, Janet	1	4	4	6	40	40		Historical Fiction, Native American	American Girl	f	
4611	Changes For Kaya	Shaw, Janet	1	4	4	6	40	40		Historical Fiction, Native American	American Girl	f	
4612	Meet Felicity	Tripp, Valerie	1	4	5	8	40	40		Historical Fiction, American Revolution, Virginia	American Girl	f	
4613	Felicity Learns a Lesson 	Tripp, Valerie	1	4	5	6	40	40		Historical Fiction, American Revolution, Virginia	American Girl	f	
4614	Felicity's Surprise 	Tripp, Valerie	1	4	6	6	40	40		Historical Fiction, American Revolution, Virginia	American Girl	f	
4615	Happy Birthday, Felicity	Tripp, Valerie	1	4	6	6	40	40		Historical Fiction, American Revolution, Virginia	American Girl	f	
4616	Felicity Saves the Day	Tripp, Valerie	1	4	7	6	40	40		Historical Fiction, American Revolution, Virginia	American Girl	f	
4617	Changes For Felicity	Tripp, Valerie	1	4	7	6	40	40		Historical Fiction, American Revolution, Virginia	American Girl	f	
4619	Nothing is for Free	Perfection 	1	4	8	6	40	40		Great Depression		f	
4620	It's Only Goodbye	Gross, Virginia	1	4	9	35	40	40		Immigration		f	
4621	Little House on the Prairie	Wilder, Laura Ingalls	1	4	10	14	40	40				f	
4622	Little House in the Big Woods	Wilder, Laura Ingalls	1	4	11	12	40	40		Historical Fiction		f	
4623	On the Banks of Plum Creek	Wilder, Laura Ingalls	1	4	12	2	40	40				f	
4624	Little Town on the Prairie	Wilder, Laura Ingalls	1	4	12	2	40	40				f	
4625	Farmer Boy	Wilder, Laura Ingalls	1	4	13	4	40	40				f	
4626	Hannah's Voyage	ETA	1	4	14	11	40	40		Historical Fiction		f	
4627	Champ	Scholastic	1	4	14	6	40	40				f	
4628	Brothers at War	Perfection 	1	4	15	18	40	40				f	
4629	Superfudge	Blume, Judy	1	4	16	9	40	40				f	
4630	Tales of a Fourth Grade Nothing	Blume, Judy	1	4	17	27	40	40				f	
4631	Anna-Maria's Moccasins	Book Treks	1	4	18	6	40	40				f	
4632	Cicely's Secret	Book Treks	1	4	18	6	40	40				f	
4633	Three Cheers for Planet Earth!	Book Treks	1	4	18	5	40	40				f	
4634	Moon Runner	Marsden, Carolyn	1	4	18	6	40	40				f	
4636	Dear Mr. Henshaw	Cleary, Beverly	1	4	20	13	40	40				f	
4637	Tales of Louisa May Alcott	Perfection 	1	4	21	5	40	40				f	
4638	Firewatch	Perfection 	1	4	21	10	40	40				f	
4639	No Arm in Left Field	Christopher, Matt	1	4	21	4	40	40			Matt Christopher	f	
4618	Mother of Invention	Perfection	1	4	8	12	40	40		Historical Fiction		f	
4793	The Magic Half	Barrows, Annie	1	4	102	6	44	44				f	
4590	Women Writers	Houghton-Miffin	2	4	95	36	44	44		Biography, Civil War		f	
4641	Homer Price	McCloskey, Robert	1	4	22	4	40	40				f	
4642	Myth or Mystery	Literacy Tree	1	4	23	12	40	40				f	
4643	Hannah and the Golden Thread	ETA Cuisenaire	1	4	23	8	40	40				f	
4644	The Mystery of the Silver Spoons	ETA	1	4	24	10	40	40				f	
4645	Dear Sam, Dear Ben	ETA	1	4	24	12	40	40				f	
4646	James and the Giant Peach	Dahl, Roald	1	4	25	7	40	40				f	
4647	Jim Ugly	Fleischman, Sid 	1	4	25	2	40	40				f	
4648	Somebody Moved in Next Door	Rigby PM Chapter	1	4	26	11	40	40				f	
4649	Mrs. Marigold's Menagerie	Rigby Sails	1	4	26	6	40	40				f	
4650	Bunnicula Strikes Again!	Howe, James	1	4	27	6	40	40				f	
4635	The Big Wave	Buck, Pearl	1	4	19	19	40	40				f	
4486	Daughters of Liberty	Houghton-Miffin	2	4	59	30	40	40		American Revolution		f	
4651	Lowji Discovers America	Fleming, Candace	1	4	27	6	40	40				f	
4652	Freedom's Wings: Corey's Underground Railroad Diary 	Wyeth, Sharon Dennis	1	4	28	6	40	40		Historical Fiction, Underground Railroad	My America	f	
4653	Charlotte's Web	White, E.B.	1	4	30	12	40	40				f	
4654	Cara's Letters	Rigby PM Chapter	1	4	31	12	40	40				f	
4655	Eric's Travel Diary	Rigby PM Chapter	1	4	31	9	40	40				f	
4657	The Dolphin Caller	Rigby PM Chapter	1	4	31	9	40	40				f	
4659	Brian's Winter	Paulsen, Gary	1	4	32	3	40	40				f	
4661	Gypsy in the Cellar	Perfection	1	4	33	7	40	40				f	
4662	Summer Shepherd	Perfection 	1	4	34	5	40	40				f	
4663	Tall Shadow - A Navajo Boy	Perfection 	1	4	34	8	40	40				f	
4664	Disaster at Lunker Lake	Perfection	1	4	34	12	40	40				f	
4665	Song of the Trees	Taylor, Mildred	1	4	35	10	40	40				f	
4666	The Castle in the Attic	Winthrop, Elizabeth	1	4	35	6	40	40				f	
4667	Miracles on Maple Hill	Sorensen, Virginia	1	4	36	14	40	40		Newberry		f	
4668	The Werewolf Chase A Mystery about Adaptations	Lerner	1	4	37	6	40	40		Graphic Novel, Mystery	Summer Camp Science Mysteries	f	
4669	The Hunt for Hidden Treasure A Mystery about Rocks	Lerner	1	4	37	6	40	40		Graphic Novel, Mystery	Summer Camp Science Mysteries	f	
4670	In Search of the Fog Zombie A Mystery about Matter	Lerner	1	4	37	6	40	40		Graphic Novel, Mystery	Summer Camp Science Mysteries	f	
4671	No Talking	Clements, Andrew	1	4	38	6	40	40				f	
4672	Lost and Found	Clements, Andrew	1	4	39	6	40	40				f	
4673	The Indian in the Cupboard	Banks, Lynne Reid	1	4	40	8	40	40				f	
4674	The Mystery of the Cupboard	Banks, Lynne Reid	1	4	40	4	40	40				f	
4675	The Mystery of the Missing Garden Gnome	ETA	1	4	41	8	40	40				f	
4676	The Circus Detective	ETA	1	4	41	11	40	40				f	
4677	The Shawl	ETA	1	4	41	10	40	40				f	
4678	Freedom Crossing	Clark, Margaret Goff	1	4	42	24	40	40		Historical Fiction, Underground Railroad		f	
4680	Babe The Gallant Pig	King-Smith, Dick	1	4	44	11	40	40				f	
4681	Joker	Perfection 	1	4	45	4	40	40				f	
4682	For Honey	Perfection 	1	4	45	12	40	40				f	
4683	Summer Friends	Perfection 	1	4	45	11	40	40				f	
4684	Aunt Tabitha's Gift	Rigby Sails	1	4	46	6	40	40		Narrative		f	
4685	Grandma's Bird	Rigby Sails	1	4	46	6	40	40				f	
4686	I'm a Wimp!	Rigby Sails	1	4	46	6	40	40				f	
4688	The Enormous Egg	Butterworth, Oliver	1	4	47	6	40	40				f	
4689	Sarah, Plain and Tall	MacLachlan, Patricia	1	4	48	17	40	40		Historical Fiction, Newberry	Sarah, Plain and Tall	f	
4690	Skylark	MacLachlan, Patricia	1	4	49	5	40	40		Historical Fiction	Sarah, Plain and Tall	f	
4691	The Whipping Boy	Fleishman, Sid	1	4	49	8	40	40		Newberry		f	
4692	Otherwise Known as Sheila the Great	Blume, Judy	1	4	50	5	40	40				f	
4693	Johnny Long Legs	Christopher, Matt	1	4	50	4	40	40			Matt Christopher	f	
4694	King of the Wind	Henry, Marguerite	1	4	51	2	40	40		Historical Fiction		f	
4695	Stormy, Misty's Foal	Henry. Marguerite	1	4	51	2	40	40				f	
4696	Misty of Chincoteague	Henry, Marguerite	1	4	51	6	40	40				f	
4697	Raising Pilot	Book Treks	1	4	52	5	40	40				f	
4698	The Water is Wide	Book Treks	1	4	52	6	40	40		Historical Fiction		f	
4699	The Mystery of the Hidden Letter	Book Treks	1	4	52	5	40	40				f	
4700	Sadako and the Thousant Paper Cranes	Coerr, Eleanor	1	4	52	3	40	40		Historical Fiction		f	
4701	Charlie and the Chocolate Factory	Dahl, Roald	1	4	53	10	40	40				f	
4702	Charlie and the Great Glass Elevator	Dahl, Roald	1	4	53	2	40	40				f	
4703	David Went Where on Vacation	Perfection 	1	4	54	6	40	40				f	
4704	To Rainbow Valley	Perfection 	1	4	54	7	40	40				f	
4705	Kodie's Mare	Perfection 	1	4	54	6	40	40				f	
4706	The Great Kapok Tree	Cherry, Lynne	1	4	55	6	40	40				f	
4707	A World of Imagination	Literacy Tree	1	4	56	20	40	40				f	
4708	The Hidden Dagger	Perfection 	1	4	57	6	40	40				f	
4709	Linnie's Letters	Perfection 	1	4	57	8	40	40		Historical Fiction		f	
4710	Tales of Mark Twain	Perfection 	1	4	57	6	40	40				f	
4711	Almost Sisters	Perfection	1	4	58	6	40	40				f	
4712	Second Cousins	Hamilton, Virginia	1	4	58	6	40	40				f	
4713	Shiloh	Naylor, Phyllis Reynolds	1	4	59	11	40	40		Newberry		f	
4714	Not in a Thousand Years	Rigby PM Chapter	1	4	60	11	40	40				f	
4715	Cool Moves	Rigby PM Chapter	1	4	60	11	40	40				f	
4716	The Robber's Mask	Rigby Sails	1	4	61	6	40	40		Narrative		f	
4687	The Family Under the Bridge	Carlson, Natalie	1	4	47	8	40	40		Newberry		f	
4719	Burly Reid	Rigby Sails	1	4	61	6	40	40				f	
4720	The Materializer	Rigby Sails	1	4	61	6	40	40		Science Fiction		f	
4721	The Cricket in Times Square	Selden, George	1	4	62	10	40	40				f	
4722	The Missing 'Gator of Gumbo Limbo	George, Jean Craighead	1	4	62	6	40	40				f	
4723	The Day It Rained Forever  The Story of the Johnstown Flood	Gross, Virginia T. 	1	4	63	14	40	40		Historical Fiction		f	
4724	Hiroshima	Scholastic	1	4	63	3	40	40				f	
4725	The Good Master	Seredy, Kate	1	4	63	3	40	40		Newberry		f	
4726	United in Freedom	Perfection	1	4	64	20	40	40		Slavery		f	
4728	River of Ice	Perfection	1	4	65	13	40	40				f	
4660	What's the Trick?	Perfection	1	4	33	9	40	40				f	
4658	Hatchet	Paulsen, Gary	1	4	32	10	40	40				f	
4729	The Secret Room	Perfection	1	4	65	12	40	40		Historical Fiction, World War II		f	
4730	River of Amber	Perfection 	1	4	66	7	40	40		Historical Fiction, World War II		f	
4731	Tales of William Shakespeare Classics	Perfection 	1	4	66	5	40	40				f	
4732	Tales of William Shakespeare The Comedies	Perfection 	1	4	66	3	40	40				f	
4733	Tales of Sherlock Holmes	Perfection 	1	4	66	6	40	40				f	
4734	Tales of Jack London	Perfection 	1	4	67	7	40	40				f	
4735	Tales of Detectives	Perfection	1	4	67	8	40	40				f	
4736	Shakespeare and Me	Perfection 	1	4	67	8	40	40				f	
4737	Nickaleer! Shipwreck Survivors 	Perfection 	1	4	68	18	40	40				f	
4738	Dirt Bike Racer	Christopher, Matt	1	4	68	5	40	40			Matt Christopher	f	
4739	Twins	Perfection 	1	4	69	19	40	40		Slavery		f	
4742	Catching Air!	Rigby PM Chapter	1	4	70	12	40	40				f	
4743	From the Mixed-up Files of Mrs. Basil E. Frankweiler	Konigsburg, E.L.	1	4	71	15	40	40				f	
4744	One-Eyed Cat	Fox, Paula	1	4	72	9	40	40		Newberry		f	
4745	Tales of the Civil War	Perfection	1	4	73	17	40	40		Historical Fiction, Civil War		f	
4746	The Cat Who Went to Heaven	Coatsworth, Elizabeth	1	4	73	9	40	40		Newberry		f	
4747	In the Year of the Boar and Jackie Robinson	Lord, Bette Bao	1	4	74	10	40	40		Historical Fiction		f	
4748	Voices	ETA	1	4	74	10	40	40				f	
4749	Hachiko Waits	Newman, Leslea	1	4	75	6	40	40				f	
4750	The Nighttime Cabin Thief A Mystery about Light	Lerner	1	4	75	6	40	40		Graphic Novel, Mystery	Summer Camp Science Mysteries	f	
4751	The Matchbox	Literacy 2000	1	4	75	3	40	40		Historical Fiction, World War II		f	
4752	Comeback Kids: Safe at Home	Lupica, Mike	1	4	76	6	40	40		Sports, Baseball		f	
4753	Journey	MacLachlan, Patricia	1	4	76	3	40	40				f	
4754	A Dog's Life The Autobiography of a Stray	Martin, Ann	1	4	77	5	40	40				f	
4755	Philippa Fisher's Fairy Godsister	Kessler, Liz	1	4	77	6	40	40				f	
4756	Journey to Jo'burg: A South African Story	Naidoo, Beverley	1	4	78	5	40	40		Historical Fiction		f	
4757	By Sea To America	Rigby Literacy by Design	1	4	78	6	40	40		Historical Fiction, Immigration		f	
4759	Matilda	Dahl, Roald	1	4	79	7	40	40				f	
4760	The Borrowers	Norton, Mary	1	4	80	11	40	40				f	
4762	The Gold Cadillac	Taylor, Mildred	1	4	82	19	40	40				f	
4763	Mississippi Bridge	Taylor, Mildred	1	4	82	3	40	40		Historical Fiction		f	
4764	The Friendship	Taylor, Mildred	1	4	83	15	40	40		Historical Fiction		f	
4765	Abel's Island	Steig, William	1	4	87	19	44	44				f	
4766	Diary of a Wimpy Kid	Kinney, Jeff	1	4	88	6	44	44				f	
4767	The Last Dinosaur	Sundance	1	4	89	5	44	44			Fact vs. Fiction	f	
4768	Crossing the Divide	Sundance	1	4	89	2	44	44			Fact vs. Fiction	f	
4769	Not a Chance	Sundance	1	4	89	5	44	44			Fact vs. Fiction	f	
4770	Bertrand's Quest	Sundance	1	4	89	3	44	44			Fact vs. Fiction	f	
4771	The Lion, the Witch, and the Wardrobe	Lewis, C.S.	1	4	90	14	44	44			Chronicles of Narnia	f	
4772	Prince Caspian	Lewis, C.S.	1	4	91	6	44	44			Chronicles of Narnia	f	
4773	The Last Battle	Lewis, C.S.	1	4	91	5	44	44			Chronicles of Narnia	f	
4774	The Voyage of Dawn Treader	Lewis, C.S.	1	4	92	7	44	44			Chronicles of Narnia	f	
4775	Tullian Trouble	Rigby Sails	1	4	93	6	44	44		Science Fiction		f	
4776	Spymail	Rigby Sails	1	4	93	6	44	44				f	
4777	What's New?	Rigby Sails	1	4	93	6	44	44				f	
4778	Splinters	Rigby Sails	1	4	93	6	44	44		Narrative		f	
4779	Squid Monster	Rigby Sails	1	4	94	6	44	44				f	
4780	Diamond Hunter	Rigby Sails	1	4	94	12	44	44		Science Fiction		f	
4781	Nettie's Trip South	Scholastic/Ann Turner	1	4	94	2	44	44		Historical Fiction		f	
4782	Sounder	Armstrong, William	1	4	95	8	44	44		Newberry		f	
4783	Iron Thunder: The Battle Between The Monitor & The Merrimac	Avi	1	4	95	6	44	44		Historical Fiction, Civil War		f	
4784	Tracker	Paulsen, Gary	1	4	96	13	44	44				f	
4785	Gaffer Samson's Luck	Walsh, Jill	1	4	96	4	44	44				f	
4786	The Sign of the Beaver	Speare, Elizabeth George	1	4	97	17	44	44		Historical Fiction		f	
4787	George Washington's Socks	Woodruff, Elvira	1	4	98	14	44	44				f	
4788	The Cave	ETA	1	4	98	12	44	44				f	
4789	Cousins	Hamilton, Virginia	1	4	99	17	44	44				f	
4791	The Secret of the Indian	Banks, Lynne Reid	1	4	100	7	44	44				f	
4741	Time Trap	Perfection	1	4	70	19	40	40		Historical Fiction, Martin Luther King, Jr. 		f	
4790	The Well	Taylor, Mildred	1	4	99	7	44	44		Historical Fiction		f	
4758	Morning Girl	Dorris, Michael	1	4	78	7	40	40		Historical Fiction		f	
4794	How to Steal a Dog	O'Connor, Barbara	1	4	102	6	44	44				f	
4795	Behind Rebel Lines	Reit, Seymour	1	4	103	9	44	44		Historical Fiction, Civil War		f	
4798	Trout Summer	Conly, Jane	1	4	104	2	44	44				f	
4799	Tuckers' Gold	Rigby Literacy by Design	1	4	105	6	44	44		Historical Fiction, Westward Explansion, Gold Rush		f	
4800	The Ketchup Deal	Orbit	1	4	105	12	44	44				f	
4801	The Black Stallion	Farley, Walter	1	4	106	6	44	44				f	
4802	Worth	LaFaye, A.	1	4	107	6	44	44		Historical Fiction, Adoption		f	
4803	The Stowaway	Gregory, Kristiana	1	4	107	6	44	44				f	
4804	Little Rabbit's Loose Tooth	Bate, Lucy	1	3	1	16	30	30				f	
4740	Kids In Charge	Book Treks	1	4	69	8	40	40				f	
4806	The King's Clocks	Literacy 2000	1	3	1	5	30	30				f	
4808	More Stories Julian Tells	Cameron, Ann	1	3	2	5	30	34				f	
4809	Amber Brown Is Not A Crayon	Danziger, Paula	1	3	3	10	30	34			Amber Brown	f	
4810	The Chocolate Touch	Catling, Patrick	1	3	3	4	30	34				f	
4811	The First Morning	Literacy Tree	1	3	4	5	30	34				f	
4812	Dear Diary	Literacy Tree	1	3	4	8	30	34				f	
4813	Oscar and Tatiana	Literacy Tree	1	3	4	6	30	34				f	
4814	Gribblegrot from Outer Space	Literacy Tree	1	3	4	4	30	34				f	
4815	Four-Legged Friends	Literacy Tree	1	3	4	7	30	34				f	
4817	The Sunday Horse	Literacy Tree	1	3	6	27	30	34				f	
4820	The Jersey	Disney	1	3	8	6	30	34				f	
4821	Kidnap at the Catfish Café	Giff, Patricia Reilly	1	3	8	5	30	34			Adventures of Minnie and Max	f	
4822	How To Be Cool in Third Grade	Duffey, Betsy	1	3	8	6	30	34				f	
4823	Mike Mulligan and His Steam Shovel	Houghton-Mifflin	1	3	9	7	30	34				f	
4824	Doctor DeSoto	Steig, William	1	3	9	2	30	34				f	
4826	My Family & the Wasps	Dominie Press	1	3	9	4	30	34				f	
4827	Blackberries in the Dark	Jukes, Mavis	1	3	10	20	30	34		Historical Fiction		f	
4828	The Trouble with Parents	Sundance	1	3	11	12	30	34			Supa Doopers	f	
4829	Rollerama	Sundance	1	3	11	9	30	34			Supa Doopers	f	
4830	Second Story Sally	Sundance	1	3	11	6	30	34			Supa Doopers	f	
4831	The Frogs of Betts	Sundance	1	3	12	5	30	34			Supa Doopers	f	
4832	Dragon Trouble	Sundance	1	3	12	6	30	34			Supa Doopers	f	
4833	Rodney, the Surfing Duck	Sundance	1	3	12	4	30	34			Supa Doopers	f	
4834	My Brother, the Spy	Sundance	1	3	12	4	30	34			Supa Doopers	f	
4835	Holly & Mac	Sundance	1	3	12	6	30	34			Supa Doopers	f	
4836	Princess Euphorbia	Sundance	1	3	13	3	30	34			Supa Doopers	f	
4837	Joe Cocker Spaniel 	Sundance	1	3	13	4	30	34			Supa Doopers	f	
4838	Green with Red Spots Horrible	Sundance	1	3	13	5	30	34			Supa Doopers	f	
4839	Simon and the Aliens	Sundance	1	3	13	4	30	34		Science Fiction	Supa Doopers	f	
4840	The Case of the Disappearing Bones	Sundance	1	3	13	14	30	34			Supa Doopers	f	
4841	Mr. Kean's Garden	Rigby Literacy by Design	1	3	14	6	30	34				f	
4842	Simon's Scoop	Rigby Literacy by Design	1	3	14	6	30	34				f	
4843	Trouble On the Trail	Rigby Literacy by Design	1	3	14	6	30	34				f	
4844	Too Much Stuff!	Rigby Literacy by Design	1	3	14	6	30	34				f	
4845	The Bake Sale Battle	Rigby Literacy by Design	1	3	14	6	30	34		A Play		f	
4846	Beeman Interview	Rigby Sails	1	3	15	6	30	34		Interview		f	
4847	Mickey Maloney - Spy	Rigby Sails	1	3	15	6	30	34		Biography		f	
4848	The Island of Wingo	Rigby Sails	1	3	15	4	30	34				f	
4849	The Egg Saga	Rigby Sails	1	3	15	4	30	34				f	
4850	On the List	Rigby Sails	1	3	15	6	30	34				f	
4851	Spy Maps	Rigby Sails	1	3	15	6	30	34		Map		f	
4852	Police Files	Rigby Sails	1	3	16	6	30	34				f	
4853	Animal Advertisements	Rigby Sails	1	3	16	4	30	34				f	
4854	Fun Zone	Rigby Sails	1	3	16	6	30	34		Map		f	
4855	Destination Planet Blobb	Rigby Sails	1	3	16	6	30	34				f	
4856	On the Menu	Rigby Sails	1	3	16	6	30	34				f	
4857	Kids Say…	Rigby Sails	1	3	17	6	30	34				f	
4858	Marvelous Menus	Rigby Sails	1	3	17	6	30	34				f	
4859	The Zachary's Plans	Rigby Sails	1	3	17	6	30	34				f	
4860	Caught by the Sea	Orbit	1	3	18	20	30	34				f	
4861	Be A Perfect Person in Just Three Days	Manes, Stephen	1	3	18	10	30	34				f	
4862	In your Dreams	Rigby PM	1	3	19	11	30	34		Anthology		f	
4863	Ice Cream Supreme	ETA Cuisenaire	1	3	19	10	30	34				f	
4865	My Father's Dragon	Gannett, Ruth	1	3	20	6	30	34				f	
4867	Supernova	Rigby PM Chapter	1	3	21	18	30	34				f	
4868	The Creature of Cassidy's Creek	Rigby PM Chapter	1	3	21	7	30	34				f	
4869	The Falcon	Rigby PM Chapter	1	3	21	8	30	34				f	
4870	Ben's Tune	Rigby PM Chapter	1	3	22	20	30	34				f	
4796	Bridge to Terabithia	Paterson, Katherine	1	4	103	10	44	44		Newberry		f	
4807	The Stories Julian Tells	Cameron, Ann	1	3	2	10	30	34				f	
4871	Phan's Diary	Rigby PM Chapter	1	3	22	18	30	34		Vietnam		f	
4872	The Bear Collection	Rigby PM Chapter	1	3	23	13	30	34				f	
4873	The Big Toe Robbery	Rigby PM Chapter	1	3	23	12	30	34				f	
4875	The Secret	Rigby PM Chapter	1	3	23	10	30	34				f	
4876	The Crystal Unicorn	Rigby PM Chapter	1	3	23	7	30	34				f	
4877	Super-tuned	Rigby PM Chapter	1	3	24	11	30	34				f	
4878	The Junkyard Dog	Rigby PM Chapter	1	3	24	9	30	34				f	
4879	From the Hillside	Rigby PM Chapter	1	3	25	12	30	34				f	
4880	To the Other Side	Rigby PM Chapter	1	3	25	10	30	34				f	
4881	A Medal for Molly	Rigby PM Chapter	1	3	26	9	30	34				f	
4882	Queen of the Pool	Rigby PM Chapter	1	3	26	8	30	34				f	
4874	Dr. MacTavish's Creature	Rigby PM Chapter	1	3	23	9	30	34				f	
4819	Midnight Rescue	Literacy Tree	1	3	7	13	30	34				f	
4816	Uncle Tease	Literacy Tree	1	3	5	21	30	34				f	
4864	No Way, Winky Blue!	Mondo	1	3	20	16	30	34				f	
4805	Black Beauty	Random House	1	3	1	6	30	30				f	
4883	Skeeter	Rigby PM Chapter	1	3	26	12	30	34				f	
4884	Robin Hood	Bullseye Classic	1	3	27	6	30	34				f	
4885	The Three Musketeers	Bullseye Classic	1	3	27	6	30	34				f	
4886	The Last of the Mohicans	Bullseye Classic	1	3	27	9	30	34				f	
4887	What a Day!	Literacy Tree	1	3	28	10	30	34				f	
4888	Something Queer is Going On	Levy, Elizabeth	1	3	29	6	30	34				f	
4889	Something Queer on Vacation	Levy, Elizabeth	1	3	29	12	30	34				f	
4890	Spy in the Sky: A Story of the Civil War	Hyperion	1	3	30	6	30	34		Civil War		f	
4891	Donavan's Word Jar	DeGross, Mona	1	3	31	11	30	34				f	
4892	Harry Houdini - Wonderdog!	Orbit	1	3	32	12	30	34				f	
4893	Saving the Park	Orbit	1	3	32	18	30	34				f	
4894	Underground Adventure	Rigby PM Plus Chapter	1	3	33	12	30	34				f	
4895	The Dog I Share	Orbit	1	3	33	12	30	34				f	
4897	Disaster Quarterback	Filson, Brent	1	3	36	5	36	36				f	
4898	Amber Brown Is Feeling Blue	Danziger, Paula	1	3	36	2	36	36			Amber Brown	f	
4899	Song and Dance Man	Ackerman, Karen	1	3	36	6	36	36				f	
4900	Detective Pony	Betancourt, Jeanne	1	3	37	6	36	36			Pony Pals	f	
4901	Pony to the Rescue	Betancourt, Jeanne	1	3	37	6	36	36			Pony Pals	f	
4902	My Family Tree	ETA	1	3	38	12	36	36				f	
4903	Patrick	ETA	1	3	38	10	36	36				f	
4904	Teacher's Pet	Hurwitz, Johanna	1	3	38	6	36	36				f	
4906	The Bad Luck of King Fred	Literacy Tree	1	3	39	7	36	36				f	
4907	The Adventures of Ali Baba Bernstein	Hurwitz, Johanna	1	3	39	4	36	36				f	
4908	It came through the wall!	Mondo	1	3	40	21	36	36				f	
4909	Surprise Island 	Warner, Gertrude Chandler	1	3	41	12	36	36			The Boxcar Children	f	
4910	Mike's Mystery	Warner, Gertrude Chandler	1	3	42	6	36	36			The Boxcar Children	f	
4911	The Yellow House Mystery 	Warner, Gertrude Chandler	1	3	42	6	36	36			The Boxcar Children	f	
4912	The Mystery Bookstore 	Warner, Gertrude Chandler	1	3	43	7	36	36			The Boxcar Children	f	
4913	The Boxcar Children	Warner, Gertrude Chandler	1	3	43	3	36	36			The Boxcar Children	f	
4915	The Mystery of the Stolen Music	Warner, Gertrude Chandler	1	3	44	9	36	36			The Boxcar Children	f	
4916	Wild Bird and other stories of adventure	Orbit	1	3	47	21	36	36				f	
4917	River Rats	Orbit	1	3	47	23	36	36				f	
4918	Dunkin' Dazza's Soaring Slammer	Sundance	1	3	48	14	36	36		Sports, Basketball	Supa Doopers	f	
4919	Dunkin' Dazza's Daring Dribble	Sundance	1	3	48	4	36	36		Sports, Basketball	Supa Doopers	f	
4920	My Teacher Turns into a Tyrannosaurus	Sundance	1	3	48	10	36	36			Supa Doopers	f	
4921	Rachel to the Rescue	Sundance	1	3	49	15	36	36			Supa Doopers	f	
4922	Alroy's Very Nearly Clean Bedroom	Sundance	1	3	49	11	36	36			Supa Doopers	f	
4923	Trapped!	Sundance	1	3	50	11	36	36			Supa Doopers	f	
4924	The Spray-Paint Mystery	Scholastic 	1	3	50	6	36	36				f	
4925	Angel Child, Dragon Child	Reading Rainbow	1	3	50	4	36	36				f	
4926	The Spirit of the Wild West	Perfection	1	3	51	6	36	36		Historical Fiction		f	
4927	Song of David	Perfection	1	3	51	12	36	36		Historical Fiction		f	
4928	Bigfoot in New York City?	Perfection	1	3	52	8	36	36			Cody Smith Mystery	f	
4929	The Case of the Disappearing Kidnapper	Perfection	1	3	52	6	36	36			Cody Smith Mystery	f	
4930	The Jayhawk Horse Mystery	Perfection	1	3	53	5	36	36			Cody Smith Mystery	f	
4931	Cody Smith and the Holiday Mysteries	Perfection	1	3	54	8	36	36			Cody Smith Mystery	f	
4932	The Case of the Missing Emeralds	Perfection	1	3	54	5	36	36			Cody Smith Mystery	f	
4933	The Case of the Vanishing Cat	Perfection	1	3	54	8	36	36			Cody Smith Mystery	f	
4934	A New Mother	Perfection	1	3	55	6	36	36				f	
4935	Holding The Yellow Rabbit	Perfection	1	3	55	6	36	36				f	
4936	Westward to Home: Joshua's Oregon Trail Diary	Hermes, Patricia	1	3	56	5	36	36		Westward Expansion		f	
4937	An American Army of Two	On My Own History	1	3	56	5	36	36				f	
4938	The Mouse and the Motorcycle	Cleary, Beverly	1	3	57	12	36	36				f	
4939	Ralph S. Mouse	Cleary, Beverly	1	3	57	2	36	36				f	
4940	Runaway Ralph	Cleary, Beverly	1	3	58	10	36	36				f	
4941	Muggie Maggie	Cleary, Beverly	1	3	58	2	36	36				f	
4942	Ramona Forever	Cleary, Beverly	1	3	59	4	36	36				f	
4943	Beezus and Ramona	Cleary, Beverly	1	3	59	11	36	36				f	
4945	Ramona Quimby, Age 8	Cleary, Beverly	1	3	60	8	36	36				f	
4946	Henry and Ribsy	Cleary, Beverly	1	3	61	3	36	36				f	
4948	Exercise Time	Rigby Sails	1	3	62	6	36	36				f	
4949	Cool School	Rigby Sails	1	3	62	6	36	36				f	
4950	Matilda's Plans	Rigby Sails	1	3	62	6	36	36				f	
4951	The Monsters of Burwood	Rigby Sails	1	3	62	6	36	36		Rules		f	
4952	Boot Balancers Wanted	Rigby Sails	1	3	62	6	36	36		Advertisements		f	
4953	Who Did It?	Rigby Sails	1	3	63	6	36	36		Diary		f	
4954	Have You Read It?	Rigby Sails	1	3	63	6	36	36				f	
4955	Riding the Bubbly Seas	Rigby Sails	1	3	63	6	36	36				f	
4956	My Life with Birds	Rigby Sails	1	3	63	6	36	36		Autobiography		f	
4957	Allen Jay and the Underground Railroad	Brill, Marlene Targ	1	3	64	6	36	36		Historical Fiction, Underground Railroad		f	
4905	P.S. I Love You, Gramps	Literacy Tree	1	3	39	19	36	36				f	
4896	Which Way, Jack?	Literacy Tree	1	3	35	27	36	36				f	
4958	The Courage of Sarah Noble	Dalgliesh, Alice	1	3	64	7	36	36				f	
4959	Hooray for Rhody!	Book Treks	1	3	65	12	36	36				f	
4960	A Home for Nellie (a play)	Book Treks	1	3	65	4	36	36		A Play		f	
4961	Robot Trouble	Rigby Literacy by Design	1	3	65	6	36	36		Science Fiction		f	
4962	Saturdays with Pop	Rigby Literacy by Design	1	3	65	6	36	36				f	
4964	There's a Ship Outside My Window	Rigby PM Chapter	1	3	66	16	36	36				f	
4965	The Trouble with Oatmeal	Rigby PM Chapter	1	3	67	10	36	36				f	
4966	Some Dog!	Rigby PM Chapter	1	3	67	17	36	36				f	
4967	Alfred the Curious	Rigby PM Chapter	1	3	68	11	36	36				f	
4968	Firelight Secrets	Rigby PM Chapter	1	3	68	16	36	36				f	
4969	Photographic Memory	Rigby PM Chapter	1	3	69	9	36	36				f	
4970	Seawall	Rigby PM Chapter	1	3	69	18	36	36			 	f	
4971	Dragons	Literacy 2000	1	3	73	5	38	38				f	
4972	Sam, Bangs and Moonshine	Ness, Evaline	1	3	73	3	38	38				f	
4973	Miss Geneva's Lantern	Mondo	1	3	73	13	38	38				f	
4974	A Pony Named Shawney	Mondo	1	3	74	18	38	38		 		f	
4975	The Secret Soldier	Perfection	1	3	75	21	38	38				f	
4976	Half Free	Perfection	1	3	76	6	38	38		Historical Fiction, Slavery		f	
4978	We're Behind You George Washington	Perfection	1	3	77	10	38	38		American Revolution		f	
4980	Owls in the Family	Mowat, Farley	1	3	78	5	38	38				f	
4981	Howliday Inn	Howe, James	1	3	78	2	38	38				f	
4982	Return to Howliday Inn	Howe, James	1	3	78	5	38	38				f	
4983	Fantastic Mr. Fox	Dahl, Roald	1	3	78	3	38	38				f	
4984	Knots on a Counting Rope	Martin, Jr., Bill	1	3	79	3	38	38				f	
4985	The Ballad of Robin Hood	Literacy Tree	1	3	79	5	38	38				f	
4986	Fire at the Triangle Factory	First Avenue Edition	1	3	79	3	38	38		Historical Fiction		f	
4987	Rave Reviews	Rigby Sails	1	3	79	6	38	38		Reviews		f	
4988	The Magician	Literacy 2000	1	3	79	5	38	38				f	
4989	The Great Cheese Conspiracy	Van Leeuwen, Jean	1	3	80	17	38	38				f	
4990	The Diamond Champs	Christopher, Matt	1	3	81	4	38	38		Sports, Baseball	Matt Christopher	f	
4991	The Kid Who Only Hit Homers	Christopher, Matt	1	3	81	5	38	38		Sports, Baseball	Matt Christopher	f	
4992	Look Who's Playing First Base	Christopher, Matt	1	3	82	5	38	38		Sports, Baseball	Matt Christopher	f	
4993	Catcher with a Glass Arm	Christopher, Matt	1	3	83	5	38	38		Sports, Baseball	Matt Christopher	f	
4994	Little Lefty	Christopher, Matt	1	3	83	5	38	38		Sports, Baseball	Matt Christopher	f	
4995	Kimo and the Secret Waves	Perfection	1	3	84	5	38	38				f	
4996	Mary Moon is Missing	Giff, Patricia Reilly	1	3	84	8	38	38			Adventures of Minnie and Max	f	
4997	Hannah 	ETA Cuisenaire	1	3	84	10	38	38				f	
4998	The Hundred Dresses	Estes, Eleanor	1	3	85	13	38	38				f	
4999	Riding Freedom	Ryan, Pam Munoz	1	3	86	10	38	38				f	
5000	Stone Fox	Gardiner, John	1	3	86	10	38	38				f	
5001	We Are Patriots  Hope's Revolutionary War Diary	Gregory, Kristiana	1	3	87	6	38	38		Historical Fiction, American Revolution	My America	f	
5002	My Brother's Keeper: Virginia's Civil War Diary	Osborne, Mary Pope	1	3	87	6	38	38		Historical Fiction, Civil War		f	
5003	An Amazing Journey	Book Treks	1	3	88	6	38	38				f	
5004	It's All Greek To Me	Scieszka, Jon	1	3	88	6	38	38		Greece	The Time Warp Trio	f	
5005	Dogs and Danger	Scholastic	1	3	88	5	38	38				f	
5006	A Home for the New Nation	Book Treks	1	3	89	6	38	38		Historical Fiction		f	
5007	Goooaaalll!	Rigby Sails	1	3	89	12	38	38		Sports, Soccer		f	
5008	The Skate Jam	Orbit	1	3	90	12	38	38		Sports, Skateboard, Solar Power		f	
5009	Dragon Fire	Orbit	1	3	90	12	38	38				f	
5010	John Paul Jones and the Battle at Sea	Houghton-Miffin	2	5	1	36	60	60				f	
5011	Invisible Clues	Rigby Sails	2	5	1	6	60	60		Investigation		f	
5012	Into the Abyss  A Tour of Inner Space	Perfection	2	5	2	3	60	60		Solar System		f	
5014	Puzzling Out Patterns	Nat'l Geographic	2	5	2	2	60	60		Math, Ratios		f	
5015	The Bill of Rights	Nat'l Geographic	2	5	2	2	60	60				f	
5016	Four Great Cities	iOpeners	2	5	3	6	60	60				f	
5017	Finding a Way Six Historic U.S. Routes	iOpeners	2	5	3	5	60	60				f	
5019	Using Force and Motion	Nat'l Geographic	2	5	3	3	60	60				f	
5020	Staying Healthy	iOpeners	2	5	4	6	60	60				f	
5021	A Guide to Constellations	iOpeners	2	5	4	6	60	60		Solar System		f	
4977	The Believers	Perfection	1	3	76	5	38	38		Historical Fiction, New World		f	
5013	Time Travelers Adventures in Archaeology	Rigby PM	2	5	2	10	60	60		Archaeology		f	
5018	Blue or Gray? A Family Divided	Nat'l Geographic	2	5	3	2	60	60		Civil War		f	
5024	Zoos: Back to Nature?	iOpeners	2	5	5	6	60	60				f	
5025	What Is A Government?	iOpeners	2	5	5	6	60	60				f	
5026	What Time Is It?	iOpeners	2	5	5	6	60	60				f	
5027	Living Through a Natural Disaster	iOpeners	2	5	5	5	60	60				f	
5028	Discovering the Old Stone Age	Pearson	2	5	6	23	60	60		Archaeology		f	
5029	Medieval Buildings	Pearson	2	5	6	24	60	60		Medieval		f	
5030	Cities: Too Much, Too Fast?	Pearson	2	5	7	24	60	60				f	
5031	Building Ancient Greece and Rome	Pearson	2	5	7	24	60	60		Greece, Rome		f	
5032	Mysteries of the Ancient Americas	Pearson	2	5	8	25	60	60				f	
5033	Sailing for India	Pearson	2	5	8	23	60	60				f	
5034	Winston Churchill	Pearson	2	5	9	24	60	60		Biography		f	
5035	It Can Be Done! The Life and Legacy of Cesar Chavez	Book Treks	2	5	10	6	60	60		Biography		f	
5037	Communicating with Animals	Book Treks	2	5	10	5	60	60				f	
5038	Women Who Broke Barriers	Book Treks	2	5	10	6	60	60		Biography		f	
5039	Fractals The Art of Math	Book Treks	2	5	10	6	60	60		Math		f	
5040	Pedal to the Metal A History of Cars	Book Treks	2	5	10	5	60	60				f	
5041	Tracking Wildlife with Frank Craighead	Book Treks	2	5	10	6	60	60				f	
5042	Skate Parks On a Roll!	Book Treks	2	5	10	6	60	60				f	
5043	The Great Little Madison	Fritz, Jean	2	5	11	5	60	60				f	
5044	Homesick My Own Story	Fritz, Jean	2	5	11	10	60	60		Biography		f	
5045	Scream Machines All About Roller Coasters	Book Treks	2	5	12	6	60	60				f	
5046	Fur Traders of New France	Houghton-Miffin	2	5	12	34	60	60				f	
5047	The Architecture of the Middle Ages	Pearson	2	5	13	24	60	60		Medieval		f	
5048	Churchill and the World at War	Pearson	2	5	13	24	60	60				f	
5049	Egyptian Mythology and Everyday Life	Pearson	2	5	14	24	60	60		Egypt		f	
5050	The Pursuit of Spices	Pearson	2	5	14	22	60	60				f	
5051	Walls of the World	iOpeners	2	5	15	6	60	60				f	
5052	A Bright Idea	iOpeners	2	5	15	6	60	60				f	
5054	Light and Shade	iOpeners	2	5	15	6	60	60				f	
5055	Living In Harsh Lands	iOpeners	2	5	16	6	60	60		Geography		f	
5057	First Journeys	iOpeners	2	5	16	6	60	60		Narrative		f	
5058	A Band of Brave Men 	iOpeners	2	5	16	6	60	60		Civil War, Narrative		f	
5059	The Human Machine	Nat'l Geographic	2	5	17	2	60	60				f	
5060	Understanding the Brain	Nat'l Geographic	2	5	17	2	60	60				f	
5061	What Archaeology Tells Us About Prehistory	Pearson	2	5	18	23	60	60		Archaeology		f	
5062	The Early Americas' Unsolved Mysteries	Pearson	2	5	18	24	60	60		Archaeology		f	
5063	Greek and Roman Architecture	Pearson	2	5	19	24	60	60		Greece, Rome		f	
5064	Sea Route to the Spice Lands	Pearson	2	5	19	24	60	60				f	
5065	The Rise of the Megacity	Pearson	2	5	20	24	60	60				f	
5066	Winston Churchill England's Lion	Pearson	2	5	20	24	60	60		Biography		f	
5067	Bull Run	Fleischman, Paul	2	5	21	6	60	60		Civil War		f	
5068	Blast Zone The Eruption and Recovery of Mount St. Helens	Book Treks	2	5	21	6	60	60				f	
5069	Remarkable Robots	Book Treks	2	5	21	6	60	60				f	
5070	Hatshepsut Egypt's Woman King	iOpeners	2	5	22	4	60	60		Egypt		f	
5071	Our Mysterious Universe	iOpeners	2	5	22	6	60	60				f	
5072	Hear Our Stories	iOpeners	2	5	22	6	60	60				f	
5073	It's Not All Ancient History	iOpeners	2	5	23	6	60	60				f	
5074	Rock Records	iOpeners	2	5	23	6	60	60				f	
5075	Starting Points	iOpeners	2	5	23	6	60	60				f	
5076	The Mythical World of Atlantis	Disney	2	5	24	22	60	60				f	
5077	The African American Story	Five Ponds Press	2	5	25	7	60	60		Anthology		f	
5078	A Young Patriot	Clarion	2	5	26	6	60	60		American Revolution		f	
5079	They Made a Revolution: 1776	Archer, Jules	2	5	26	4	60	60		Biography, Anthology, American Revolution		f	
5080	The American Revolution	Pearson	2	5	27	6	60	60		American Revolution		f	
5081	The Civil War	Pearson	2	5	27	6	60	60		Civil War		f	
5082	Drums The World's Heartbeat	Book Treks	2	5	27	6	60	60				f	
5083	The Incredible Journey of Lewis and Clark	Scholastic	2	10	1	5	70	80				f	
5084	Harriet Tubman	Silver-Burnett	2	10	2	12	70	80		Biography, Anthology		f	
5085	Mighty Animal Cells	Lerner	2	10	3	6	70	80				f	
5086	Powerful Plant Cells	Lerner	2	10	3	6	70	80				f	
5087	Invincible Louisa	Meigs, Cornelia	2	10	4	10	70	80		Biography, Newberry		f	
5088	Flatboat Mondays	Houghton-Miffin	2	7	1	36	50	50				f	
5089	Lewis and Clark, A Journey of Discovery	Book Treks	2	7	1	6	50	50				f	
5090	Mighty Ironclads	Houghton-Miffin	2	7	2	35	50	50		Civil War		f	
5091	If We Had Wings The Story of the Tuskegee Airmen	Book Treks	2	7	2	6	50	50		World War II		f	
5092	Wind and Water Two Great Powers	Houghton-Miffin	2	7	3	36	50	50				f	
5093	Get Moving-All About Muscles	Book Treks	2	7	3	7	50	50				f	
5094	A Walk With John Muir	Houghton-Miffin	2	7	4	36	50	50		Biography		f	
5095	Forty Famous Women	iOpeners	2	7	4	6	50	50		Biography		f	
5096	Using Energy	Nat'l Geographic	2	7	5	10	50	50				f	
5097	Blood	Newbridge	2	7	5	11	50	50				f	
5098	The Silk Route	Major, John	2	7	5	7	50	50				f	
5100	Write It Down!	iOpeners	2	7	7	6	50	50				f	
5101	Crafts and Games Around the World	iOpeners	2	7	7	6	50	50				f	
5102	Flags	iOpeners	2	7	7	6	50	50				f	
5103	Building An Ice Hotel	iOpeners	2	7	7	6	50	50				f	
5104	Turn It Down!	iOpeners	2	7	8	6	50	50				f	
5105	In the Mountains	iOpeners	2	7	8	6	50	50				f	
5106	Fossil Seekers	iOpeners	2	7	8	6	50	50				f	
5107	Seeing is Not Believing	iOpeners	2	7	8	6	50	50				f	
5108	Winging It	iOpeners	2	7	8	6	50	50				f	
5109	Ben Franklin of Old Philadelphia	Landmark 	2	7	9	6	50	50		Biography		f	
5110	Drag Racing Attacking the Green	Perfection	2	7	9	3	50	50				f	
5111	Ideas that Shaped Egyptian Life	Pearson	2	7	10	24	50	50		Egypt		f	
5053	Build Your Own Website	iOpeners	2	5	15	6	60	60		How to books		f	
5112	House, Church, Castle	Pearson	2	7	10	24	50	50				f	
5113	Battles of the Civil War - Antietam	Benchmark	2	7	11	6	50	50		Civil War		f	
5115	Journey to Antarctica	Rigby PM	2	7	13	12	50	50				f	
5117	Bikes	Book Treks	2	7	14	6	50	50				f	
5118	The Oceans Around Us	Nat'l Geographic	2	7	15	23	50	50				f	
5119	Living History	iOpeners	2	7	15	5	50	50				f	
5120	Global Warming	Nat'l Geographic	2	7	16	12	50	50				f	
5122	Amusement Park Science	Newbridge	2	7	17	10	50	50				f	
5123	Understanding Electricity	Nat'l Geographic	2	7	17	2	50	50				f	
5124	Everest	Rigby PM	2	7	17	13	50	50				f	
5125	Monticello	Children's Press	2	7	18	16	50	50		Thomas Jefferson, Virginia		f	
5126	The Gettysburg Address 	Childrens Press	2	7	18	5	50	50		Civil War		f	
5127	The Battle of Chancellorsville	Children's Press	2	7	19	18	50	50		Civil War		f	
5128	African-Americans In the Thirteen Colonies	Children's Press	2	7	19	8	50	50		Slavery, Colonial		f	
5129	The Jamestown Colony	Children's Press	2	7	20	12	50	50		Virginia, Colonial		f	
5131	Where Did They Come From?  Where Did They Go?	Pearson	2	7	21	24	50	50				f	
5132	Buildings in Greece and Rome	Pearson	2	7	22	24	50	50		Greece, Rome		f	
5133	Growing Cities, Growing Problems	Pearson	2	7	22	24	50	50		Egypt		f	
5134	Life and Beliefs in Ancient Egypt	Pearson	2	7	23	24	50	50				f	
5135	Matthew Brady - Photographing the Civil War	Book Treks	2	7	23	6	50	50		Civil War		f	
5136	The Civil Rights Movement  People Who Changed America	Nat'l Geographic	2	7	23	3	50	50		Biography, Civil Rights,Thurgood Marshall, Rosa Parks, Martin Luther King Jr., Malcolm X 		f	
5137	The Harlem Renaissance	Newbridge	2	7	24	12	50	50				f	
5138	Mystery in the Arctic	Rigby PM	2	7	24	12	50	50				f	
5139	Demolition 	iOpeners	2	7	24	6	50	50				f	
5140	African Safari	Rigby PM	2	7	25	12	50	50				f	
5141	Eye on the Universe	Newbridge	2	7	25	12	50	50				f	
5142	Survival Animal Adaptations	iOpeners	2	7	25	6	50	50				f	
5143	Give Me Liberty!  The Story of the Declaration of Independence	Freedman, Russell	2	7	26	6	50	50		American Revolution		f	
5144	Building Bridges	iOpeners	2	7	26	6	50	50				f	
5145	Explore Your World	iOpeners	2	7	26	6	50	50				f	
5146	The Pony Express - Heroes in the Saddle	Perfection	2	7	27	6	50	50				f	
5147	The Civil War Moments in History	Perfection	2	7	27	4	50	50		Civil War		f	
5148	Tsunami	Perfection	2	7	27	7	50	50				f	
5149	Earthquake!	Perfection	2	7	28	9	50	50				f	
5150	Volcano!  Dome of Fire	Perfection	2	7	28	6	50	50				f	
5151	Volcanoes 	iOpeners	2	7	28	6	50	50				f	
5152	Ancient Egypt	Perfection	2	7	29	6	50	50		Egypt		f	
5153	Famous American Spies	Book Treks	2	7	31	6	50	50				f	
5154	Making the Impossible Possible	Book Treks	2	7	31	6	50	50				f	
5155	Wetlands	Book Treks	2	7	31	6	50	50				f	
5156	Be a Smart Surfer!  The Internet and You	Book Treks	2	7	31	6	50	50				f	
5157	David's World	Book Treks	2	7	31	6	50	50		Sign Language		f	
5158	Helping Hands Wildlife Rehabilitation at Work	Book Treks	2	7	31	6	50	50				f	
5159	Growing Up With Music	Book Treks	2	7	31	6	50	50		Biography		f	
5160	Animal Heroes	Book Treks	2	7	32	6	50	50				f	
5161	Food for Thought	Book Treks	2	7	32	6	50	50				f	
5162	West by Stagecoach	Book Treks	2	7	32	6	50	50		Westward Expansion		f	
5163	Ancient Treasures	Book Treks	2	7	32	5	50	50				f	
5164	From Barter to Bills	Book Treks	2	7	32	5	50	50				f	
5165	Surprising Snakes	Book Treks	2	7	32	6	50	50				f	
5166	The Many Faces of Masks	Book Treks	2	7	32	6	50	50				f	
5168	Our 41st President George Bush	Scholastic	2	7	33	5	50	50		Biography		f	
5169	Dark Zones	Rigby PM	2	7	34	12	50	50				f	
5170	Antarctica	National Science Foundation	2	7	34	20	50	50				f	
5171	Williamsburg - Cornerstones of Freedom	Children's Press	2	7	35	23	50	50		Colonial, Virginia		f	
5172	Coral Reef	DK	2	7	36	2	50	50				f	
5173	Virginia -From Sea to Shining Sea	Children's Press	2	7	36	6	50	50		Virginia		f	
5174	Life In the Polar Lands	Scholastic	2	7	36	18	50	50				f	
5175	A Wrinkle In Time	L'Engle, Madeleine	1	5	1	11	60	60				f	
5176	Tuck Everlasting	Babbit, Natalie	1	5	2	12	60	60		Newberry		f	
5114	Thurgood Marshall and Civil Rights	Houghton-Miffin	2	7	13	37	50	50		Biography, Civil Rights		f	
5121	The Magic of Light and Sound	Nat'l Geographic	2	7	16	6	50	50				f	
5178	Hoot	Hiaasen, Carl	1	5	4	8	60	60		Newberry		f	
5179	Flush	Hiaasen, Carl	1	5	5	6	60	60				f	
5181	The Lightning Thief	Riordan, Rick	1	5	7	6	60	60				f	
5182	Dragon's Gate	Yep, Laurence	1	5	8	6	60	60		Historical Fiction, Newberry		f	
5183	Elijah of Buxton	Curtis, Christoher Paul	1	5	9	6	60	60		Historical Fiction		f	
5185	The Witch of Blackbird Pond	Speare, Elizabeth George	1	5	10	5	60	60		Historical Fiction, Newberry		f	
5186	Missing May	Rylant, Cynthia	1	5	11	2	60	60		Newberry		f	
5187	Red Cap	Wisler, G. Clifton	1	5	11	6	60	60		Historical Fiction, American Revolution		f	
5188	Roll of Thunder, Hear My Cry	Taylor, Mildred D.	1	5	12	11	60	60		Historical Fiction		f	
5184	Walk Two Moons	Creech, Sharon	1	5	10	5	60	60		Newberry		f	
5116	Who Was Poor Richard?	Houghton-Miffin	2	7	14	32	50	50		Biography		f	
5189	Tiger Eyes	Blume, Judy	1	5	13	12	60	60				f	
5190	Blood on the River: James Town 1607	Carbone, Elisa	1	5	14	6	60	60		Historical Fiction		f	
5191	The Little Prince	de Saint Exupery, Antione	1	5	19	17	60	60				f	
5192	M.C. Higgins, The Great	Hamilton, Virginia	1	5	20	10	60	60		Newberry		f	
5193	Out of the Dust	Hesse, Karen	1	5	21	5	60	60		Historical Fiction, Newberry		f	
5194	The Yearling	Rawlings, Marjorie	1	5	22	9	60	60				f	
5195	Call It Courage	Sperry, Armstrong	1	5	23	25	60	60		Newberry		f	
5196	Where the Red Fern Grows	Rawls, Wilson	1	5	24	10	60	60				f	
5197	The Egypt Game	Snyder, Zilpha Keatley	1	5	25	7	60	60		Newberry		f	
5198	Jacob Have I Loved	Paterson, Katherine	1	5	26	4	60	60		Newberry		f	
5199	The Road to Memphis	Taylor, Mildred D.	1	5	26	3	60	60		Historical Fiction		f	
5200	Let The Circle Be Unbroken	Taylor, Mildred D.	1	5	27	5	60	60				f	
5201	My Brother Sam is Dead	Collier, James	1	5	31	12	60	60		Historical Fiction, American Revolution, Newberry		f	
5202	White Fang	London, Jack	1	5	32	2	60	60				f	
5203	The Ear, the Eye, the Arm	Farmer, Nancy	1	5	32	2	60	60				f	
5205	The Endless Steppe	Hautzig, Esther	1	5	34	7	60	60		Historical Fiction		f	
5206	Disaster Three Real-Life Stories of Survival	Hyperion	1	5	38	10	60	60				f	
5207	The Renaissance Kids	Book Treks	1	5	39	6	60	60				f	
5208	Play the Game You Know	Book Treks	1	5	39	7	60	60				f	
5209	The Missing Trumpet Blues	Book Treks	1	5	39	6	60	60				f	
5210	Curiosity Falls	Book Treks	1	5	39	6	60	60		Historical Fiction		f	
5211	The Hot Shots	Book Treks	1	5	39	5	60	60		Sports, Basketball		f	
5212	Banner in the Sky	Ullman, James	1	5	40	6	60	60		Newberry		f	
5213	Rifles for Watie	Keith, Harold	1	5	41	2	60	60		Historical Fiction, Civil War, Newberry		f	
5214	Go Big Or Go Home	Hobbs, Will	1	5	42	6	60	60				f	
5215	Scorpions	Myers, Walter Dean	1	10	1	5	70	80				f	
5216	Point Blank	Horowitz, Anthony	1	10	2	8	70	80		Science Fiction		f	
5217	Friedrich	Richter, Hans Peter	1	10	3	5	70	80		Historical Fiction, World War II		f	
5218	Little Women	Alcott, Louisa May	1	10	4	1	70	80		Historical Fiction		f	
5219	Night John	Paulsen, Gary	1	10	4	2	70	80		Historical Fiction, Slavery		f	
5221	War Horse	Morpurgo, Michael	1	10	6	6	70	80		Historical Fiction, World War I		f	
5223	My Friend Meg	ETA	1	7	2	12	50	50				f	
5224	Seb and Sasha	ETA	1	7	2	10	50	50				f	
5225	The Survivors	ETA	1	7	2	6	50	50				f	
5226	Midnight Magic	Avi	1	7	3	8	50	50				f	
5227	Onion John	Krumgold, Joseph	1	7	4	14	50	50		Historical Fiction, Newberry		f	
5228	My Side of the Mountain	George, Jean Craighead	1	7	5	14	50	50		Newberry		f	
5229	Julie of the Wolves	George, Jean Craighead	1	7	6	11	50	50		Newberry		f	
5230	War Comes to Willy Freeman	Collier, James	1	7	7	7	50	50		Historical Fiction, American Revolution		f	
5231	Jump Ship to Freedom	Collier, James	1	7	7	2	50	50		Historical Fiction		f	
5233	Graven Images: Three Stories	Fleischman, Paul	1	7	8	2	50	50		Anthology, Newberry		f	
5234	The Perilous Road	Steele, William 	1	7	8	4	50	50		Historical Fiction		f	
5235	A Gathering of Days A New England Girl's Journal, 1830-32	Blos, Joan	1	7	9	8	50	50		Historical Fiction, Newberry		f	
5238	The Real Thief	Steig, William	1	7	11	6	50	50				f	
5239	The Roman Oracle	Rigby Sails	1	7	11	12	50	50		Historical Fiction, Rome, Newspaper Report		f	
5240	The Door in the Wall	de Angeli, Marguerite	1	7	12	11	50	50		Historical Fiction		f	
5241	Wringer	Spinelli, Jerry	1	7	13	6	50	50				f	
5242	Bud, Not Buddy	Curtis, Christopher Paul	1	7	14	6	50	50		Newberry		f	
5243	Letters to Leah	ETA	1	7	15	12	50	50				f	
5245	Hitty: Her First Hundred Years	Field, Rachel	1	7	16	3	50	50				f	
5246	BFG	Dahl, Roald	1	7	16	3	50	50				f	
5247	Number The Stars	Lowry, Lois	1	7	17	8	50	50		Historical Fiction, World War II		f	
5248	Park's Quest	Paterson, Katherine	1	7	17	4	50	50				f	
5249	Shadow of a Bull	Wojciechowska, Maia	1	7	18	5	50	50		Newberry		f	
5250	A Long Way From Chicago	Peck, Richard	1	7	21	8	50	50		Historical Fiction, Newberry		f	
5237	The View from Saturday	Konigsburg, E.L.	1	7	19	6	50	50		Newberry		f	
5236	Ella Enchanted	Levine, Gail Carson	1	7	10	10	50	50		Newberry		f	
5180	The Phantom TollBooth	Juster, Norton	1	5	6	8	60	60				f	
5232	The Summer of the Swans	Byars, Betsy	1	7	8	6	50	50		Newberry		f	
5220	The Hobbit	Tolkien, J.R.R.	1	10	5	9	70	80				f	
5251	Island of the Blue Dolphins	O'Dell, Scott	1	7	22	12	50	50		Historical Fiction, Newberry		f	
5253	Anne of Green Gables	Montgomery, L.M.	1	7	24	4	50	50				f	
5254	The House of Dies Drear	Hamilton, Virginia	1	7	25	6	50	50		Historical Fiction, Underground Railroad		f	
5255	The Green Book	Walsh, Jill Paton	1	7	25	2	50	50		Science Fiction		f	
5256	The Fighting Ground	Avi	1	7	26	10	50	50		Historical Fiction, American Revolution		f	
5257	The True Confessions of Charlottle Doyle	Avi	1	7	27	3	50	50		Historical Fiction		f	
5258	The Mailbox	Shafer, Audrey	1	7	27	3	50	50				f	
5259	Jip, His Story	Paterson, Katherine	1	7	28	14	50	50		Historical Fiction		f	
5222	The Tale of Despereaux	DiCamillo, Kate	1	7	1	11	50	50		Newberry		f	
5244	Escape to Danger	Book Treks	1	7	15	6	50	50		Historical Fiction		f	
5260	The Secret of Nimh	O'Brien, Robert	1	7	29	5	50	50		Newberry		f	
5261	Dogsong	Paulsen, Gary	1	7	29	3	50	50				f	
5262	The Incredible Journey	Burnford, Sheila	1	7	30	6	50	50				f	
5263	Esperanza Rising	Ryan, Pam Munoz	1	7	30	6	50	50		Historical Fiction		f	
5264	Holes	Sachar, Louis	1	7	31	7	50	50		Newberry		f	
5265	The Wanderer	Creech, Sharon	1	7	32	5	50	50				f	
5266	The Westing Game	Raskin, Ellen	1	7	33	10	50	50		Newberry		f	
5267	Five Little Peppers and How They Grew	Sidney, Margaret	1	7	37	10	50	50				f	
5268	The Mystery of the Rescued Rubies	Book Treks	1	7	38	6	50	50				f	
5269	What a Vacation! A Family Play	Book Treks	1	7	38	6	50	50		A Play		f	
5270	The Egyptian Collar Mystery	Book Treks	1	7	38	6	50	50				f	
5271	Mirror, Mirror	Book Treks	1	7	38	6	50	50		Science Fiction		f	
5272	Saving Alpha Nagawa	Book Treks	1	7	38	6	50	50				f	
5273	From Corey Gordon's Extremely Private Diary	Book Treks	1	7	39	6	50	50				f	
5274	The Museum Chase	Book Treks	1	7	39	6	50	50				f	
5275	Rabbit Hill	Lawson, Robert	1	7	39	8	50	50		Newberry		f	
5276	Bright Freedom's Song	Houston, Gloria	1	7	40	16	50	50		Historical Fiction, Underground Railroad		f	
5277	Plain City	Hamilton, Virginia	1	7	41	10	50	50				f	
5278	Kindertransport	Drucker, Olga Levy	1	7	41	2	50	50		Historical Fiction, World War II		f	
5279	Twenty and Ten	Bishop, Claire	1	7	42	5	50	50		Historical Fiction, World War II		f	
5280	The Seventh Princess	Sullivan, Nick	1	7	42	4	50	50				f	
5281	Zoobreak	Korman, Gordon	1	7	43	6	50	50				f	
5282	Winter Camp	Hill, Kirkpatrick	1	7	44	4	50	50				f	
5283	Day of Glory: The Guns at Lexington and Concord	Spencer, Philip	1	7	44	2	50	50		Historical Fiction, Revolutionary War		f	
5284	Fearless 	Woodruff, Elvira	1	7	45	6	50	50				f	
5285	Miss Spitfire: Reaching Helen Keller	Miller, Sarah	1	7	46	6	50	50				f	
5286	The Mystery of Drear House	Hamilton, Virginia	1	7	46	6	50	50				f	
3140	The Trouble with Herbert	Mondo	1	9	2	13	24	24				f	
4818	Dinosaur Girl	Literacy Tree	1	3	7	16	30	34		Dinosaurs		f	
4656	Sea Wind	Rigby PM Chapter	1	4	31	12	40	40				f	
4727	Tales of Edgar Allan Poe	Perfection	1	4	64	5	40	40				f	
4979	Grace's Letter to Lincoln	Roop, Peter and Connie	1	3	77	6	38	38				f	
5204	The Giver	Lowry, Lois	1	5	33	8	60	60		Newberry		f	
1623	Vegetables and How They Grow	Rosen Real	2	2	31	7	10	10	86	Plants		f	
5287	Chain Reaction	Book Treks	1	4	18	6	40	40				f	
5289	Moses in Egypt	Banks, Lynne Reid	1	7	47	5	50	50				f	
5291	Chocolate Fever	Smith, Robert	1	3	70	5	36	36				f	
5292	Julie's Wolf Pack	George, Jean Craighead	1	7	19	5	50	50				f	
5293	Caddie Woodlawn	Brink, Carol	1	4	60A	5	40	40		Newberry		f	
3852	I Write for the Newspaper	Rosen Real	2	8	3	6	16	16		Careers		f	
5294	The Secret School	Avi	1	4	108	6	44	44				f	
5295	Notes From a Liar and Her Dog	Choldenko, Gennifer	1	4	108	6	44	44				f	
4295	The Desert Run	Orbit	2	3	69	29	38	38				f	
1406	Making a dinosaur	Rigby PM	2	1	9	15	2	2	32	How to books		f	
1544	Spiders	Wright Group	2	2	13	10	8	8	75	Bugs		f	
3149	The Small Potatoes Busy Beach Day 	Ziefert, Harriet	1	9	7	7	24	24			Small Potatoes	f	
3151	The Small Potatoes and the Birthday Party	Ziefert, Harriet	1	9	8	8	24	24			Small Potatoes	f	
4358	Abraham Lincoln A Great American Life	Perfection	2	4	12	10	40	40		Biography		f	
5296	fudge-a-mania	Blume, Judy	1	4	16A	7	40	40				f	
5297	Playground Science	iOpeners	2	4	52	6	40	40		Simple Machines		f	
5298	Sacajawea	Benchmark	2	8	38	4	20	20		Biography		f	
4529	Growing Up In Ancient Rome	Troll	2	4	73	7	40	40		Rome		f	
1681	Seeds Get Around	Newbridge	2	6	17	16	14	14	224	Plants		f	
5299	Where Does the Garbage Go?	HarperTrophy	2	9	23	6	28	28		Recycle		f	
1266	The fawn in the forest	Rigby PM	1	6	34	13	14	14	227			f	
3816	The Walkathon	Rigby PM	1	8	80	9	20	20				f	
5036	America's Secret Weapon	Book Treks	2	5	10	6	60	60		Narrative, Fact vs. Opinion, World War II		f	
486	The Parade	Rigby PM plus	1	1	35	15	2	2	67			f	
391	What A Mess!	Rigby Smart Start	1	1	7	6	1	1	14			f	
511	Hello, Bingo!	Rigby PM Stars	1	1	82	12	3	4	42		Sam and Bingo	f	
372	Look at the house	Rigby PM Plus	1	1	42	13	2	2	53			f	
893	A Walk for Jasper	Pioneer Valley	1	2	31	6	6	6	87		Jasper the Cat	f	
959	Soccer at the park	Rigby PM	1	2	50	29	8	8	131	Sports, Soccer		f	
833	Kitty Cat Runs Up a Tree	Rigby PM Stars	1	2	34	6	8	8	134		Kitty Cat	f	
5300	Grumbles, Growls, and Roars	Wright Group	1	2	83	7	10	10	133	Dinosaurs		f	
540	Teddy bears' picnic	PM Stars	1	2	17	12	6	6	66		Little Teddy	f	
5301	My Hamster, Van	Ready Readers	1	2	56	5	8	8	73			f	
5302	I Got a Goldfish	Ready Readers	1	2	56	6	8	8	92			f	
5303	Stan Packs	Ready Readers	1	2	33	6	8	8	84			f	
5290	Tangerine	Bloor, Edward	1	7	20	10	50	50				f	
4761	The Great Gilly Hopkins	Paterson, Katherine	1	4	81	6	40	40		Newberry		f	
4219	Thomas Jefferson	Heinemann	2	3	35	8	34	34		Biography		f	
5167	Rosa Parks The Life of a Civil Rights Heroine	Rosen	2	7	33	16	50	50		Graphic Novel, Biography		f	
5304	The Trip	Ready Readers	1	2	33	6	8	8	108			f	
5305	Glenda the Lion	Ready Readers	1	2	33	6	8	8	88			f	
5306	At the Pool	Oxford	1	2	67	5	10	10	87			f	
1247	Are We There Yet?	Dominie Press	1	2	76	4	10	10	127		Teacher's Choice Series	f	
5307	The Name Is the Same	Ready Readers	1	6	12	6	12	12	115			f	
6126	The Spy Meeting	Rigby Sails	1	11	2	1	\N	\N	\N	\N		f	
6127	Barney Malloon's Balloon	Rigby Sails	1	11	2	1	\N	\N	\N	\N		f	
6128	Alley Cats	Rigby Sails	1	11	2	1	\N	\N	\N	\N		f	
6129	No Queen Today!	Rigby Sails	1	11	2	1	\N	\N	\N	\N		f	
6130	The Giant of Ginger Hill	Rigby Sails	1	11	2	1	\N	\N	\N	\N		f	
6131	Food Fit for a King	Rigby Sails	1	11	2	1	\N	\N	\N	\N		f	
6132	Chicken Food	Rigby Sails	1	11	2	1	\N	\N	\N	\N		f	
6133	The Feast	Rigby Sails	1	11	2	1	\N	\N	\N	\N		f	
6134	Boo-hoo	The Story Box	1	11	2	2	\N	\N	\N	\N		f	
6135	Three little ducks	The Story Box	1	11	2	3	\N	\N	\N	\N		f	
6136	To Town	The Story Box	1	11	2	1	\N	\N	\N	\N		f	
6137	Poor old Polly	The Story Box	1	11	2	2	\N	\N	\N	\N		f	
6138	Obadiah	The Story Box	1	11	2	1	\N	\N	\N	\N		f	
6139	One cold wet night	The Story Box	1	11	2	2	\N	\N	\N	\N		f	
6140	The big toe	The Story Box	1	11	2	1	\N	\N	\N	\N		f	
6141	Woosh!	The Story Box	1	11	2	1	\N	\N	\N	\N		f	
6142	In a dark, dark wood	The Story Box	1	11	2	2	\N	\N	\N	\N		f	
6143	Dan, the flying man	The Story Box	1	11	2	1	\N	\N	\N	\N		f	
6144	Mrs. Wishy-washy	The Story Box	1	11	2	1	\N	\N	\N	\N		f	
6145	Grandpa, Grandpa	The Story Box	1	11	2	2	\N	\N	\N	\N		f	
6146	Hairy Bear	The Story Box	1	11	2	3	\N	\N	\N	\N		f	
6147	The farm concert	The Story Box	1	11	2	2	\N	\N	\N	\N		f	
6148	The Monster's Party	The Story Box	1	11	2	2	\N	\N	\N	\N		f	
6149	Yes Ma'am	The Story Box	1	11	2	2	\N	\N	\N	\N		f	
6150	Lazy Mary	The Story Box	1	11	2	2	\N	\N	\N	\N		f	
6151	The Red Rose	The Story Box	1	11	2	2	\N	\N	\N	\N		f	
6152	Who Will Be My Mother?	The Story Box	1	11	2	3	\N	\N	\N	\N		f	
6153	Sing a song	The Story Box	1	11	2	2	\N	\N	\N	\N		f	
6154	Smarty Pants	The Story Box	1	11	2	1	\N	\N	\N	\N		f	
6155	Meanies	The Story Box	1	11	2	1	\N	\N	\N	\N		f	
6156	To market, to market	The Story Box	1	11	2	1	\N	\N	\N	\N		f	
6157	The hungry giant	The Story Box	1	11	2	1	\N	\N	\N	\N		f	
6158	The jigaree	The Story Box	1	11	2	1	\N	\N	\N	\N		f	
6159	My Wonderful Aunt - Story One	Sunshine Books	1	11	2	1	\N	\N	\N	\N		f	
6160	My Wonderful Aunt - Story Two	Sunshine Books	1	11	2	1	\N	\N	\N	\N		f	
6161	My Wonderful Aunt - Story Three	Sunshine Books	1	11	2	1	\N	\N	\N	\N		f	
6162	My Wonderful Aunt - Story Four	Sunshine Books	1	11	2	1	\N	\N	\N	\N		f	
6163	My Wonderful Aunt - Story Five	Sunshine Books	1	11	2	1	\N	\N	\N	\N		f	
6164	My Wonderful Aunt - Story Six	Sunshine Books	1	11	2	1	\N	\N	\N	\N		f	
6165	Mrs. Grindy's Shoes	Sunshine Books	1	11	2	1	\N	\N	\N	\N		f	
6166	Boggywooga	Sunshine Books	1	11	2	1	\N	\N	\N	\N		f	
6167	Mr. Whisper	Sunshine Books	1	11	2	1	\N	\N	\N	\N		f	
6168	Dinner!	Sunshine Books	1	11	2	1	\N	\N	\N	\N		f	
6169	I Can Fly	Sunshine Books	1	11	2	1	\N	\N	\N	\N		f	
6170	Just This Once	Sunshine Books	1	11	2	1	\N	\N	\N	\N		f	
6171	Mr. Grump	Sunshine Books	1	11	2	1	\N	\N	\N	\N		f	
6172	My Sloppy Tiger Goes to School	Sunshine Books	1	11	2	1	\N	\N	\N	\N		f	
6173	Old Grizzly	Sunshine Books	1	11	2	1	\N	\N	\N	\N		f	
6174	Ratty-tatty	Sunshine Books	1	11	2	1	\N	\N	\N	\N		f	
6175	The Dandelion	Sunshine Books	1	11	2	1	\N	\N	\N	\N		f	
6176	Quack, Quack, Quack	Sunshine Books	1	11	2	1	\N	\N	\N	\N		f	
6177	"Scat!" Said the Cat	Sunshine Books	1	11	2	1	\N	\N	\N	\N		f	
6178	The Cooking Pot	Sunshine Books	1	11	2	2	\N	\N	\N	\N		f	
6179	The Ha-Ha Powder	Sunshine Books	1	11	2	1	\N	\N	\N	\N		f	
6180	The Poor Sore Paw	Sunshine Books	1	11	2	1	\N	\N	\N	\N		f	
6181	The Secret of Spooky House	Sunshine Books	1	11	2	1	\N	\N	\N	\N		f	
6182	The Terrible Tiger	Sunshine Books	1	11	2	1	\N	\N	\N	\N		f	
6183	The Tiny Woman's Coat	Sunshine Books	1	11	2	1	\N	\N	\N	\N		f	
6184	A Small World	Sunshine Books	1	11	2	1	\N	\N	\N	\N		f	
6185	What Am I?	Sunshine Books	1	11	2	1	\N	\N	\N	\N		f	
6186	Noise	Sunshine Books	1	11	2	1	\N	\N	\N	\N		f	
6187	Clouds	Sunshine Books	1	11	2	1	\N	\N	\N	\N		f	
6188	The Wicked Pirates	Sunshine Books	1	11	2	1	\N	\N	\N	\N		f	
6189	Superkids	Sunshine Books	1	11	2	1	\N	\N	\N	\N		f	
6190	A Hundred Hugs	Sunshine Books	1	11	2	1	\N	\N	\N	\N		f	
6191	Birthdays	Sunshine Books	1	11	2	1	\N	\N	\N	\N		f	
6192	Now I Am Five	Sunshine Books	1	11	2	1	\N	\N	\N	\N		f	
6193	Duck and Hen	Sunshine Books	1	11	2	1	\N	\N	\N	\N		f	
6194	Clyde Klutter's Room	Sunshine Books	1	11	2	1	\N	\N	\N	\N		f	
6195	I Dream	Sunshine Books	1	11	2	1	\N	\N	\N	\N		f	
6196	Mrs. Muddle Mud-puddle	Sunshine Books	1	11	2	1	\N	\N	\N	\N		f	
6197	The Dippy Dinner Drippers	Sunshine Books	1	11	2	1	\N	\N	\N	\N		f	
6198	The Humongous Cat	Sunshine Books	1	11	2	1	\N	\N	\N	\N		f	
6199	The Little Yellow Chicken	Sunshine Books	1	11	2	1	\N	\N	\N	\N		f	
6200	The Wind Blows	Ray's Readers	1	11	2	1	\N	\N	\N	\N	Letter Blends	f	
6201	Lots of Sweaters	Ray's Readers	1	11	2	1	\N	\N	\N	\N	Letter Blends	f	
6202	Scott's Day	Ray's Readers	1	11	2	1	\N	\N	\N	\N	Letter Blends	f	
6203	Sniffles	Ray's Readers	1	11	2	1	\N	\N	\N	\N	Letter Blends	f	
6204	Big Bradley	Ray's Readers	1	11	2	1	\N	\N	\N	\N	Letter Blends	f	
6205	Clay Today!	Ray's Readers	1	11	2	1	\N	\N	\N	\N	Letter Blends	f	
6206	Crossing the Creek	Ray's Readers	1	11	2	1	\N	\N	\N	\N	Letter Blends	f	
6207	Desert Friends	Ray's Readers	1	11	2	1	\N	\N	\N	\N	Letter Blends	f	
6208	Glitter Trouble	Ray's Readers	1	11	2	1	\N	\N	\N	\N	Letter Blends	f	
6209	Freda Frog	Ray's Readers	1	11	2	1	\N	\N	\N	\N	Letter Blends	f	
6210	The Playful Platypus	Ray's Readers	1	11	2	1	\N	\N	\N	\N	Letter Blends	f	
6211	Charles	Ray's Readers	1	11	2	1	\N	\N	\N	\N	Letter Blends	f	
6212	Dragon's Dream	Ray's Readers	1	11	2	1	\N	\N	\N	\N	Letter Blends	f	
6213	Where and Why?	Ray's Readers	1	11	2	1	\N	\N	\N	\N	Letter Blends	f	
6214	Where's Fletcher?	Ray's Readers	1	11	2	1	\N	\N	\N	\N	Letter Blends	f	
6215	Mrs. Smith	Ray's Readers	1	11	2	1	\N	\N	\N	\N	Letter Blends	f	
6216	Skip's Sketchbook	Ray's Readers	1	11	2	1	\N	\N	\N	\N	Letter Blends	f	
6217	The Problem	Ray's Readers	1	11	2	1	\N	\N	\N	\N	Letter Blends	f	
6218	The Toy Maker	Ray's Readers	1	11	2	1	\N	\N	\N	\N	Letter Blends	f	
6219	The Tricksters	Ray's Readers	1	11	2	1	\N	\N	\N	\N	Letter Blends	f	
6220	Twins	Ray's Readers	1	11	2	1	\N	\N	\N	\N	Letter Blends	f	
6221	See Me Reading	Ray's Readers	1	11	2	1	\N	\N	\N	\N	Letter Blends	f	
6222	Who is Taller?	Ray's Readers	1	11	2	1	\N	\N	\N	\N	Letter Blends	f	
6223	The Pets	Ray's Readers	1	11	2	1	\N	\N	\N	\N	Letter Blends	f	
6224	The Slippery Slide	Ray's Readers	1	11	2	1	\N	\N	\N	\N	Letter Blends	f	
6225	Theodore	Ray's Readers	1	11	2	1	\N	\N	\N	\N	Letter Blends	f	
6226	Spider Spins	Ray's Readers	1	11	2	1	\N	\N	\N	\N	Letter Blends	f	
6227	Grumpy Grizzly	Ray's Readers	1	11	2	1	\N	\N	\N	\N	Letter Blends	f	
6228	Sherman Shoots…	Ray's Readers	1	11	2	1	\N	\N	\N	\N	Letter Blends	f	
6229	Rough-Face Girl (10)	Benchmark	1	\N	1	12	10	28		Tales, Native American	Reader's Theater	f	
6230	The Tortoise and the Hare (9)	Benchmark	1	\N	1	12	10	28		Tales, Fable	Reader's Theater	f	
6231	A Father, His Son, and Their Donkey (8)	Benchmark	1	\N	1	12	10	28		Tales, Fable	Reader's Theater	f	
6232	Matthew Henson at the North Pole (12)	Benchmark	1	\N	2	12	10	28		Explorers, Biography	Reader's Theater	f	
6233	Johnny Appleseed (8)	Benchmark	1	\N	2	12	10	28		Tales	Reader's Theater	f	
6234	Cry Out Liberty: Sarah Winnemucca, Indian Princess (10)	Benchmark	1	\N	2	12	10	28		Native Americans, Biography	Reader's Theater	f	
6235	Yeh-shen (8)	Benchmark	1	\N	3	12	10	28		Tales, China	Reader's Theater	f	
6236	Ben Franklin's Visit (12)	Benchmark	1	\N	3	12	10	28		Biography, New Nation, Inventions	Reader's Theater	f	
6237	Under the Sea with Jacques Cousteau (12)	Benchmark	1	\N	3	12	10	28		Biography	Reader's Theater	f	
6238	Why the Sky is Far Away (11)	Benchmark	1	\N	4	12	10	36		Tales, Africa	Reader's Theater	f	
6239	How the Rhino Got Wrinkly Skin (6)	Benchmark	1	\N	5	12	12	28		Tales	Reader's Theater	f	
6240	The Boy Who Cried Wolf (9)	Benchmark	1	\N	5	12	12	28		Tales, Fable	Reader's Theater	f	
6241	Jessie Owens: Fastest Human (6)	Benchmark	1	\N	5	13	12	28		Olympics, Biography	Reader's Theater	f	
6242	Harriet Tubman and the Underground Railroad (6)	Benchmark	1	\N	6	6	14	28		Biography, Civil War, Slavery	Reader's Theater	f	
6243	Why Mosquitoes Buzz in People's Ears (8)	Benchmark	1	\N	6	12	14	28		Tales, Africa	Reader's Theater	f	
6244	Why Mole Lives Underground (5)	Benchmark	1	\N	6	6	14	28		Tales	Reader's Theater	f	
6245	How the Turtle Cracked Its Shell (6)	Benchmark	1	\N	6	8	14	28		Tales	Reader's Theater	f	
6246	The King's New Crown (5)	Benchmark	1	\N	7	6	16	20		Tales, Math	Reader's Theater	f	
6247	The Wright Brothers at Kitty Hawk (5)	Benchmark	1	\N	7	6	16	20		Inventions	Reader's Theater	f	
6248	Cesar Chavez Comes to Visit (6)	Benchmark	1	\N	8	7	18	24		Biography	Reader's Theater	f	
6249	Thomas Edison Invents the Lightbulb (6)	Benchmark	1	\N	8	7	16	24		Inventions	Reader's Theater	f	
6250	Clara Barton: Angel of the Battlefield (6)	Benchmark	1	\N	9	7	30	36		Civil War, Biography	Reader's Theater	f	
6251	Jackie Robinson: Breaking Baseball's Barriers (6)	Benchmark	1	\N	9	6	30	38		Biography	Reader's Theater	f	
6252	Columbus Meets Isabella and Ferdinand (6)	Benchmark	1	\N	10	6	36	40		Explorers	Reader's Theater	f	
6253	The Corps of Discovery (7)	Benchmark	1	\N	10	12	40	44		Explorers, Thomas Jefferson, Lewis and Clark, Sacajawea	Reader's Theater	f	
6254	Eleanor Roosevelt and Marian Anderson (8)	Benchmark	1	\N	11	12	30	50		Biography, Civil Rights	Reader's Theater	f	
6255	Battle for the Ballot (9)	Benchmark	1	\N	11	12	30	50		Constitution, Vote, Susan B. Anthony	Reader's Theater	f	
6256	As the Mayan Calendars Turn (10)	Benchmark	1	\N	11	12	30	50		Ancient Civilizations, Time	Reader's Theater	f	
6257	One Giant Leap (12)	Benchmark	1	\N	12	11	30	50		Space Exploration, Neil Armstrong	Reader's Theater	f	
6258	Leaf Monster (6)	Benchmark	1	\N	12	10	30	50		Tales, Spanish	Reader's Theater	f	
6259	Isaac Newton: The World in Motion (7)	Benchmark	1	\N	12	12	38	50		Biography, Motion	Reader's Theater	f	
6260	Anansi the Spider and the Sky King (6)	Benchmark	1	\N	13	12	30	60		Tales, Africa	Reader's Theater	f	
6261	Loki and the Magic Hammer (10)	Benchmark	1	\N	13	12	30	60		Tales, Myth	Reader's Theater	f	
6262	Hammurabi's Law and Order (12)	Benchmark	1	\N	13	12	30	60		Ancient Civilizations, Time	Reader's Theater	f	
6263	The Big Cheese (11)	Benchmark	1	\N	14	1	10	28		Thomas Jefferson, New Nation	Reader's Theater	f	
6264	Cindy Eller Plays Ball (9)	Benchmark	1	\N	14	1	10	28		Tales	Reader's Theater	f	
6265	Tag Sale Today (7)	Benchmark	1	\N	14	1	10	28			Reader's Theater	f	
6266	The Great Lemonade Standoff (6)	Benchmark	1	\N	14	1	14	20			Reader's Theater	f	
6267	The Time Capsule (5)	Benchmark	1	\N	14	1	10	18			Reader's Theater	f	
6268	Farflings From Farflung (6)	Benchmark	1	\N	14	1	24	28			Reader's Theater	f	
6269	How the Hubba-Dubbas Saved Lake Ni-Ni (10)	Benchmark	1	\N	14	1	10	28			Reader's Theater	f	
6270	Keelboat Annie (9)	Benchmark	1	\N	14	1	10	28		Tales	Reader's Theater	f	
6271	The Earth Day Garden (6)	Benchmark	1	\N	14	1	18	24			Reader's Theater	f	
6272	Blackout (6)	Benchmark	1	\N	14	1	18	24			Reader's Theater	f	
\.


--
-- Name: book_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('book_id_seq', 6272, true);


--
-- Data for Name: book_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY book_log (id, title, author, genre, color, box, copy_count, minlevel, maxlevel, word_count, keyword, series_tmp, modified, modified_by) FROM stdin;
\.


--
-- Data for Name: colors; Type: TABLE DATA; Schema: public; Owner: postgres
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
10	Black
11	Big Book
\.


--
-- Name: colors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('colors_id_seq', 11, true);


--
-- Data for Name: genres; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY genres (id, code, name) FROM stdin;
1	F	Fiction
2	NF	Non Fiction
4	RT	Reader's Theater
5	P	Poetry
3	FFM	Folktales, Fairytales, and Myths
\.


--
-- Name: genres_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('genres_id_seq', 5, true);


--
-- Data for Name: graphs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY graphs (graphid, userid) FROM stdin;
\.


--
-- Data for Name: label_sql; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY label_sql (table_name, sql_clause) FROM stdin;
\.


--
-- Data for Name: latticegroup; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY latticegroup (latticegroupid, latticegroupname, latticegroupdesc) FROM stdin;
Public	Public	All users can see the data in this COI - it is the most open, and also the most risky
\.


--
-- Data for Name: people; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY people (email, peopletypeid, password, latticegroupid, firstname, lastname, company, department, address, city, state, zip, country, validationcode, validated) FROM stdin;
admin@mitre.org	3	XPERsFUdQRgrVI/si2Fv1ROAJ3X4BnOredragQ==	Public	\N	\N	\N	\N	\N	\N	\N	\N	\N	still fake	Y
jchoyt@khresear.ch	1	2BpVS+K/rBySVw2AjmQKlZmstg8Wl6HDMDyIjw==	Public	Jeffrey	hoyt	null	null	null	null	null	null	null	iwvelrgeiusm	N
guest@fcps.edu	1	vaxQ9aJWd6Rr1GhUt5ms4YEvgASqXymV7DTXtA==	Public	Guest	User	null	null	null	null	null	null	null	ksqxobkkcpcw	N
bookroom@fcps.edu	1	5RULsnVyqW39XzqJb2Y3d1JYWriakafv7g8ggw==	Public	Book	Room	null	null	null	null	null	null	null	zoypybihpxos	N
\.


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

