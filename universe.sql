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
    name character varying(200) NOT NULL,
    galaxy_type character varying(50),
    distance_from_earth_mpc numeric,
    diameter_ly integer
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
-- Name: habitat; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.habitat (
    habitat_id integer NOT NULL,
    planet_id integer,
    name character varying(200) NOT NULL
);


ALTER TABLE public.habitat OWNER TO freecodecamp;

--
-- Name: habitat_habitat_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.habitat_habitat_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.habitat_habitat_id_seq OWNER TO freecodecamp;

--
-- Name: habitat_habitat_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.habitat_habitat_id_seq OWNED BY public.habitat.habitat_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    planet_id integer NOT NULL,
    name character varying(200) NOT NULL,
    description text,
    has_life boolean,
    population integer
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
    star_id integer NOT NULL,
    description text,
    has_life boolean,
    name character varying(200) NOT NULL,
    population integer
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
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(200) NOT NULL,
    galaxy_id integer NOT NULL,
    distance_from_sol numeric,
    star_type character varying(50)
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
-- Name: habitat habitat_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.habitat ALTER COLUMN habitat_id SET DEFAULT nextval('public.habitat_habitat_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Barred spiral galaxy', 0.008, 87400);
INSERT INTO public.galaxy VALUES (2, 'Canis Major Dwarf', 'Satellite', 0.008, NULL);
INSERT INTO public.galaxy VALUES (3, 'Ursa Major II Dwarf', 'Satellite', 0.03, 1800);
INSERT INTO public.galaxy VALUES (4, 'Large Magellanic Cloud', 'Satellite', 0.05, 32200);
INSERT INTO public.galaxy VALUES (5, 'Triangulum', 'Spiral Galaxy', 0.970, 61120);
INSERT INTO public.galaxy VALUES (6, 'Andromeda', 'Barred Spiral Galaxy', 0.765, 152000);


--
-- Data for Name: habitat; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.habitat VALUES (1, 1, 'Eden Orbital');
INSERT INTO public.habitat VALUES (2, 2, 'Ares Station');
INSERT INTO public.habitat VALUES (3, 3, 'Zeus Habitat');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 1, 'Luna', 'Covered in a giant solar array and a giant space elevator Luna is different from the barren rock it originally was. Its capital Selene was the former capital of the Federation', true, 10);
INSERT INTO public.moon VALUES (2, 2, 'Phobos', 'A tiny rock orbiting Mars', false, 0);
INSERT INTO public.moon VALUES (3, 2, 'Deimos', 'A tiny rock orbiting Mars', false, 0);
INSERT INTO public.moon VALUES (4, 3, 'Europa', 'An icy moon orbiting Jupiter, kept as a wildlife reserve with a negligable population', false, 0);
INSERT INTO public.moon VALUES (5, 3, 'Io', 'A rocky moon of Jupiter', false, 0);
INSERT INTO public.moon VALUES (6, 3, 'Ganymede', 'A rocky moon of Jupiter', false, 0);
INSERT INTO public.moon VALUES (7, 3, 'Callisto', 'A rocky moon of Jupiter', false, 0);
INSERT INTO public.moon VALUES (8, 3, 'Jupiter LXI', 'A rocky moon of Jupiter', false, 0);
INSERT INTO public.moon VALUES (9, 3, 'Amalthea', 'A rocky moon of Jupiter', false, 0);
INSERT INTO public.moon VALUES (10, 3, 'Himalia', 'A rocky moon of Jupiter', false, 0);
INSERT INTO public.moon VALUES (11, 3, 'Adrastea', 'A rocky moon of Jupiter', false, 0);
INSERT INTO public.moon VALUES (12, 6, 'Titan', 'The largest moon of Saturn, with liquid water on the surface. Half-mad robots roam the surface in an eternal quest to find life', false, 0);
INSERT INTO public.moon VALUES (13, 6, 'Enceladus', 'An icy moon. Researchers study this moon and its interesting chemistry to see if life could exist there', false, 0);
INSERT INTO public.moon VALUES (14, 6, 'Mimas', 'A small rock, home of a small group of hardy colonists adapted to the low gravity', false, 0);
INSERT INTO public.moon VALUES (15, 6, 'Dione', 'Its large ice cliffs make it a magnet for tourists', false, 0);
INSERT INTO public.moon VALUES (16, 6, 'Iapetus', 'A small rocky moon of Saturn', false, 0);
INSERT INTO public.moon VALUES (17, 6, 'Tethys', 'A small rocky moon of Saturn', false, 0);
INSERT INTO public.moon VALUES (18, 6, 'Hyperion', 'A small rocky moon of Saturn', false, 0);
INSERT INTO public.moon VALUES (19, 6, 'Epimetheus', 'A small rocky moon of Saturn', false, 0);
INSERT INTO public.moon VALUES (20, 7, 'Triton', 'An icy moon of Neptune', false, 0);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 1, 'Birthplace of humanity, ruled by United Earth', true, 'Earth', 5);
INSERT INTO public.planet VALUES (2, 1, 'The red planet, first planet settled by humanity. Ruled by Collective Industries', true, 'Mars', 1);
INSERT INTO public.planet VALUES (3, 1, 'Biggest gas giant in Sol system', false, 'Jupiter', 0);
INSERT INTO public.planet VALUES (4, 1, 'The hotest planet in the sol system, closest to the Sun. Used as a giant Antimatter generator.', true, 'Mercury', 1);
INSERT INTO public.planet VALUES (5, 1, 'Covered in hot poisonous gas', false, 'Venus', 0);
INSERT INTO public.planet VALUES (6, 1, 'Second biggest gas giant in Sol system', false, 'Saturn', 0);
INSERT INTO public.planet VALUES (7, 1, 'A cold gas giant', false, 'Neptune', 0);
INSERT INTO public.planet VALUES (8, 1, 'A cold gas giant', false, 'Uranus', 0);
INSERT INTO public.planet VALUES (9, 2, 'A small rocky planet, about the same mass as Earth, eventually settled by humans who live in underground cities', true, 'Brimstone', 4);
INSERT INTO public.planet VALUES (10, 2, 'A barren irradiated world twice the mass of Mars', false, 'Satyn', 0);
INSERT INTO public.planet VALUES (11, 5, 'A small blasted rock, orbited by a giant habitat', false, 'Barny', 4);
INSERT INTO public.planet VALUES (12, 3, 'A gas giant orbited by several space habitats', false, 'Kastor', 3);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sol', 1, 0, 'G2V');
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 1, 4.2465, 'M5.5Ve');
INSERT INTO public.star VALUES (3, 'Rigil Kentaurus', 1, 4.3441, 'G2V');
INSERT INTO public.star VALUES (4, 'Toliman', 1, 4.3441, 'K1V');
INSERT INTO public.star VALUES (5, 'Barnards Star', 1, 5.9629, 'M4.0Ve');
INSERT INTO public.star VALUES (6, 'Luhman 16', 1, 6.5029, 'L8');


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: habitat_habitat_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.habitat_habitat_id_seq', 3, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


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
-- Name: habitat habitat_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.habitat
    ADD CONSTRAINT habitat_pkey PRIMARY KEY (habitat_id);


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
-- Name: habitat name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.habitat
    ADD CONSTRAINT name_unique UNIQUE (name);


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
-- Name: star fk_galaxy_star; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_galaxy_star FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: habitat fk_planet_habitat; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.habitat
    ADD CONSTRAINT fk_planet_habitat FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: moon fk_planet_moon; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_planet_moon FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet fk_star_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_star_planet FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

