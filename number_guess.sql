--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    user_id integer,
    num_guesses integer NOT NULL
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    name character varying NOT NULL
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (1, 14, 7);
INSERT INTO public.games VALUES (2, 14, 1);
INSERT INTO public.games VALUES (3, 15, 29);
INSERT INTO public.games VALUES (4, 15, 61);
INSERT INTO public.games VALUES (5, 16, 241);
INSERT INTO public.games VALUES (6, 16, 608);
INSERT INTO public.games VALUES (7, 15, 758);
INSERT INTO public.games VALUES (8, 15, 372);
INSERT INTO public.games VALUES (9, 15, 852);
INSERT INTO public.games VALUES (10, 17, 824);
INSERT INTO public.games VALUES (11, 17, 222);
INSERT INTO public.games VALUES (12, 18, 488);
INSERT INTO public.games VALUES (13, 18, 656);
INSERT INTO public.games VALUES (14, 17, 306);
INSERT INTO public.games VALUES (15, 17, 449);
INSERT INTO public.games VALUES (16, 17, 344);
INSERT INTO public.games VALUES (17, 19, 187);
INSERT INTO public.games VALUES (18, 19, 314);
INSERT INTO public.games VALUES (19, 20, 575);
INSERT INTO public.games VALUES (20, 20, 838);
INSERT INTO public.games VALUES (21, 19, 429);
INSERT INTO public.games VALUES (22, 19, 998);
INSERT INTO public.games VALUES (23, 19, 104);
INSERT INTO public.games VALUES (24, 14, 11);
INSERT INTO public.games VALUES (25, 21, 642);
INSERT INTO public.games VALUES (26, 21, 324);
INSERT INTO public.games VALUES (27, 22, 782);
INSERT INTO public.games VALUES (28, 22, 689);
INSERT INTO public.games VALUES (29, 21, 752);
INSERT INTO public.games VALUES (30, 21, 889);
INSERT INTO public.games VALUES (31, 21, 237);
INSERT INTO public.games VALUES (32, 14, 12);
INSERT INTO public.games VALUES (33, 23, 493);
INSERT INTO public.games VALUES (34, 23, 490);
INSERT INTO public.games VALUES (35, 24, 777);
INSERT INTO public.games VALUES (36, 24, 184);
INSERT INTO public.games VALUES (37, 23, 730);
INSERT INTO public.games VALUES (38, 23, 354);
INSERT INTO public.games VALUES (39, 23, 648);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (14, 'Tom');
INSERT INTO public.users VALUES (15, 'user_1714221670399');
INSERT INTO public.users VALUES (16, 'user_1714221670398');
INSERT INTO public.users VALUES (17, 'user_1714221757424');
INSERT INTO public.users VALUES (18, 'user_1714221757423');
INSERT INTO public.users VALUES (19, 'user_1714221784571');
INSERT INTO public.users VALUES (20, 'user_1714221784570');
INSERT INTO public.users VALUES (21, 'user_1714221867450');
INSERT INTO public.users VALUES (22, 'user_1714221867449');
INSERT INTO public.users VALUES (23, 'user_1714221943996');
INSERT INTO public.users VALUES (24, 'user_1714221943995');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 39, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 24, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: users users_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_name_key UNIQUE (name);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: games games_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- PostgreSQL database dump complete
--

