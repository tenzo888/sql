--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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
-- Name: comet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.comet (
    comet_id integer NOT NULL,
    name character varying(100) NOT NULL,
    orbital_period numeric(10,2) NOT NULL,
    description text NOT NULL,
    is_periodic boolean NOT NULL
);


ALTER TABLE public.comet OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

ALTER TABLE public.comet ALTER COLUMN comet_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.comet_comet_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(100) NOT NULL,
    galaxy_type text NOT NULL,
    age_in_millions integer NOT NULL,
    distance_from_earth numeric(12,2),
    is_visible boolean NOT NULL
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

ALTER TABLE public.galaxy ALTER COLUMN galaxy_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.galaxy_galaxy_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    planet_id integer NOT NULL,
    name character varying(100) NOT NULL,
    diameter integer NOT NULL,
    orbital_period numeric(10,2),
    is_spherical boolean NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

ALTER TABLE public.moon ALTER COLUMN moon_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.moon_moon_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    star_id integer NOT NULL,
    name character varying(100) NOT NULL,
    diameter integer NOT NULL,
    planet_type text NOT NULL,
    has_rings boolean NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

ALTER TABLE public.planet ALTER COLUMN planet_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.planet_planet_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    galaxy_id integer NOT NULL,
    name character varying(100) NOT NULL,
    temperature integer NOT NULL,
    mass numeric(10,2),
    is_active boolean NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

ALTER TABLE public.star ALTER COLUMN star_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.star_star_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Data for Name: comet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.comet OVERRIDING SYSTEM VALUE VALUES (1, 'Halley', 75.30, 'Famous periodic comet', true);
INSERT INTO public.comet OVERRIDING SYSTEM VALUE VALUES (2, 'Hale-Bopp', 2533.00, 'Bright comet discovered in 1995', true);
INSERT INTO public.comet OVERRIDING SYSTEM VALUE VALUES (3, 'Encke', 3.30, 'Short-period comet', true);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy OVERRIDING SYSTEM VALUE VALUES (1, 'Milky Way', 'Spiral', 13600, 0.00, true);
INSERT INTO public.galaxy OVERRIDING SYSTEM VALUE VALUES (2, 'Andromeda', 'Spiral', 10000, 2537000.00, true);
INSERT INTO public.galaxy OVERRIDING SYSTEM VALUE VALUES (3, 'Triangulum', 'Spiral', 12000, 2730000.00, true);
INSERT INTO public.galaxy OVERRIDING SYSTEM VALUE VALUES (4, 'Whirlpool', 'Spiral', 10000, 23000000.00, true);
INSERT INTO public.galaxy OVERRIDING SYSTEM VALUE VALUES (5, 'Sombrero', 'Lenticular', 13000, 29000000.00, true);
INSERT INTO public.galaxy OVERRIDING SYSTEM VALUE VALUES (6, 'Pinwheel', 'Spiral', 11000, 21000000.00, true);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (1, 3, 'Moon', 3474, 27.32, true);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (2, 4, 'Phobos', 22, 0.32, false);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (3, 4, 'Deimos', 12, 1.26, false);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (4, 5, 'Io', 3643, 1.77, true);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (5, 5, 'Europa', 3122, 3.55, true);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (6, 5, 'Ganymede', 5268, 7.15, true);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (7, 5, 'Callisto', 4821, 16.69, true);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (8, 6, 'Titan', 5150, 15.95, true);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (9, 6, 'Rhea', 1528, 4.52, true);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (10, 6, 'Iapetus', 1469, 79.32, true);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (11, 6, 'Dione', 1123, 2.74, true);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (12, 6, 'Enceladus', 504, 1.37, true);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (13, 7, 'Miranda', 471, 1.41, true);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (14, 7, 'Ariel', 1158, 2.52, true);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (15, 7, 'Umbriel', 1169, 4.14, true);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (16, 7, 'Titania', 1578, 8.71, true);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (17, 7, 'Oberon', 1523, 13.46, true);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (18, 8, 'Triton', 2707, 5.88, true);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (19, 8, 'Nereid', 340, 360.14, true);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (20, 8, 'Proteus', 420, 1.12, false);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (1, 1, 'Mercury', 4879, 'Terrestrial', false);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (2, 1, 'Venus', 12104, 'Terrestrial', false);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (3, 1, 'Earth', 12742, 'Terrestrial', false);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (4, 1, 'Mars', 6779, 'Terrestrial', false);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (5, 1, 'Jupiter', 139820, 'Gas Giant', true);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (6, 1, 'Saturn', 116460, 'Gas Giant', true);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (7, 1, 'Uranus', 50724, 'Ice Giant', true);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (8, 1, 'Neptune', 49244, 'Ice Giant', true);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (9, 2, 'Sirius Planet 1', 15000, 'Gas Giant', true);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (10, 3, 'Proxima b', 12000, 'Terrestrial', false);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (11, 4, 'Alpheratz Planet', 18000, 'Gas Giant', true);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (12, 5, 'Triangulum Planet', 10000, 'Terrestrial', false);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star OVERRIDING SYSTEM VALUE VALUES (1, 1, 'Sun', 5778, 1.00, true);
INSERT INTO public.star OVERRIDING SYSTEM VALUE VALUES (2, 1, 'Sirius', 9940, 2.02, true);
INSERT INTO public.star OVERRIDING SYSTEM VALUE VALUES (3, 1, 'Proxima Centauri', 3042, 0.12, true);
INSERT INTO public.star OVERRIDING SYSTEM VALUE VALUES (4, 2, 'Alpheratz', 13800, 3.80, true);
INSERT INTO public.star OVERRIDING SYSTEM VALUE VALUES (5, 3, 'HD 12345', 6000, 1.10, true);
INSERT INTO public.star OVERRIDING SYSTEM VALUE VALUES (6, 4, 'Whirlpool Star', 5500, 1.20, true);


--
-- Name: comet_comet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.comet_comet_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


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
-- Name: comet comet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_name_key UNIQUE (name);


--
-- Name: comet comet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_pkey PRIMARY KEY (comet_id);


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
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

