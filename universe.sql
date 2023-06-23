--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(255) NOT NULL,
    description text,
    age_in_million_years numeric NOT NULL,
    rings integer,
    mass integer NOT NULL,
    has_life boolean,
    is_spherical boolean
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(255) NOT NULL,
    color text,
    age_in_million_years numeric NOT NULL,
    size integer,
    mass integer NOT NULL,
    has_gravity boolean,
    is_spherical boolean,
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(255) NOT NULL,
    color text,
    age_in_million_years numeric NOT NULL,
    size integer,
    mass integer NOT NULL,
    star_id integer,
    has_life boolean,
    is_spherical boolean
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: satellite; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.satellite (
    satellite_id integer NOT NULL,
    name character varying(255),
    satellite_type text,
    distance_from_earth integer,
    artificial boolean,
    is_functional boolean,
    mass numeric NOT NULL
);


ALTER TABLE public.satellite OWNER TO freecodecamp;

--
-- Name: satellite_satellite_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.satellite_satellite_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.satellite_satellite_id_seq OWNER TO freecodecamp;

--
-- Name: satellite_satellite_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.satellite_satellite_id_seq OWNED BY public.satellite.satellite_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(255) NOT NULL,
    color text,
    age_in_million_years numeric NOT NULL,
    size integer,
    mass integer NOT NULL,
    galaxy_id integer,
    has_life boolean,
    is_spherical boolean
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: satellite satellite_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.satellite ALTER COLUMN satellite_id SET DEFAULT nextval('public.satellite_satellite_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Andromeda', 'verygalaxy', 9000, 50, 345792434, false, false);
INSERT INTO public.galaxy VALUES (2, 'centurion', 'very big galaxy', 560, 50, 492434, false, false);
INSERT INTO public.galaxy VALUES (3, 'pamelo', 'very far away galaxy', 520, 450, 43292434, false, false);
INSERT INTO public.galaxy VALUES (4, 'Anderson', 'very heavy galaxy', 280, 520, 433292434, false, false);
INSERT INTO public.galaxy VALUES (5, 'katty', 'very beautiful galaxy', 230, 520, 3292434, false, true);
INSERT INTO public.galaxy VALUES (6, 'perry', 'lovely galaxy', 23, 20, 329243234, false, true);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Europa', 'red', 54, 655646, 6464, true, true, NULL);
INSERT INTO public.moon VALUES (2, 'Ganymede', 'blue', 754, 644556, 646544, true, true, NULL);
INSERT INTO public.moon VALUES (3, 'calisto', 'grey', 34, 324, 34543, true, true, NULL);
INSERT INTO public.moon VALUES (4, 'phobos', 'red', 233, 453, 5433, true, true, NULL);
INSERT INTO public.moon VALUES (5, 'Deimos', 'orange', 567, 65567, 34656, true, true, NULL);
INSERT INTO public.moon VALUES (6, 'amalthea', 'blue', 754, 644556, 646544, true, true, NULL);
INSERT INTO public.moon VALUES (7, 'elara', 'grey', 34, 324, 34543, true, true, NULL);
INSERT INTO public.moon VALUES (8, 'ananke', 'red', 233, 453, 5433, true, true, NULL);
INSERT INTO public.moon VALUES (9, 'metis', 'orange', 567, 65567, 34656, true, true, NULL);
INSERT INTO public.moon VALUES (10, 'taygete', 'blue', 754, 644556, 646544, true, true, NULL);
INSERT INTO public.moon VALUES (11, 'themisto', 'grey', 34, 324, 34543, true, true, NULL);
INSERT INTO public.moon VALUES (12, 'leda', 'red', 4554, 23341, 5433, true, true, NULL);
INSERT INTO public.moon VALUES (13, 'Camie', 'orange', 567, 65567, 34656, true, true, NULL);
INSERT INTO public.moon VALUES (14, 'thyone', 'blue', 754, 644556, 646544, true, true, NULL);
INSERT INTO public.moon VALUES (15, 'crocs', 'grey', 34, 324, 34543, true, true, NULL);
INSERT INTO public.moon VALUES (16, 'lacoste', 'red', 4565, 23341, 5433, true, true, NULL);
INSERT INTO public.moon VALUES (17, 'kalyke', 'orange', 567, 65567, 34656, true, true, NULL);
INSERT INTO public.moon VALUES (22, 'thy', 'blue', 754, 644556, 646544, true, true, NULL);
INSERT INTO public.moon VALUES (23, 'honda', 'grey', 34, 324, 34543, true, true, NULL);
INSERT INTO public.moon VALUES (24, 'blonde', 'red', 4565, 23341, 5433, true, true, NULL);
INSERT INTO public.moon VALUES (25, 'sponde', 'orange', 567, 65567, 34656, true, true, NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 'blue', 200, 2500000, 2343234, 1, true, true);
INSERT INTO public.planet VALUES (2, 'Mars', 'red', 123, 2345433, 2343234, 1, false, false);
INSERT INTO public.planet VALUES (3, 'Jupiter', 'brown', 343, 2342342, 67634, 1, false, false);
INSERT INTO public.planet VALUES (34, 'venus', 'red', 345, 34534, 34453, 3, false, false);
INSERT INTO public.planet VALUES (35, 'Mercury', 'red', 45, 3534, 3443, 4, false, false);
INSERT INTO public.planet VALUES (36, 'Pluto', 'Grey', 3445, 334534, 43443, 5, false, false);
INSERT INTO public.planet VALUES (37, 'amnds', 'black', 323, 34656, 342354, 6, false, false);
INSERT INTO public.planet VALUES (38, 'blumonds', 'red', 324, 87545, 986, 4, false, false);
INSERT INTO public.planet VALUES (40, 'harry', 'Grey', 3445, 334534, 43443, 5, false, false);
INSERT INTO public.planet VALUES (41, 'potter', 'black', 323, 34656, 342354, 6, false, false);
INSERT INTO public.planet VALUES (42, 'almonds', 'red', 324, 87545, 986, 4, false, false);
INSERT INTO public.planet VALUES (43, 'lana', 'Grey', 3445, 334534, 43443, 5, false, false);
INSERT INTO public.planet VALUES (44, 'rhoades', 'black', 323, 34656, 342354, 6, false, false);
INSERT INTO public.planet VALUES (45, 'monds', 'red', 324, 87545, 986, 4, false, false);


--
-- Data for Name: satellite; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.satellite VALUES (1, 'brah', NULL, NULL, NULL, NULL, 34534);
INSERT INTO public.satellite VALUES (2, 'mos', NULL, NULL, NULL, NULL, 4634);
INSERT INTO public.satellite VALUES (3, 'Ichi', NULL, NULL, NULL, NULL, 4635);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'red', 500, 234325234, 93729847, 1, false, true);
INSERT INTO public.star VALUES (2, 'Lynx', 'blue', 200, 34325234, 9372984, 2, false, true);
INSERT INTO public.star VALUES (3, 'Eridanus', 'orange', 600, 32527634, 372984, 3, false, true);
INSERT INTO public.star VALUES (4, 'North star', 'Blue', 760, 2527634, 37234984, 4, false, true);
INSERT INTO public.star VALUES (5, 'Polaris', 'red', 260, 32527634, 234984, 5, false, true);
INSERT INTO public.star VALUES (6, 'Castor', 'red', 360, 32527634, 234984, 6, false, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 25, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 45, true);


--
-- Name: satellite_satellite_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.satellite_satellite_id_seq', 3, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: satellite satellite_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.satellite
    ADD CONSTRAINT satellite_name_key UNIQUE (name);


--
-- Name: satellite satellite_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.satellite
    ADD CONSTRAINT satellite_pkey PRIMARY KEY (satellite_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star fk_galaxy; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_galaxy FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: planet fk_star; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_star FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

