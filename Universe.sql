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
    name character varying(30),
    galaxy_types_id integer NOT NULL,
    how_many_stars_billion integer,
    description text
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
-- Name: galaxy_types; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy_types (
    galaxy_types_id integer NOT NULL,
    name character varying(20) NOT NULL,
    description text
);


ALTER TABLE public.galaxy_types OWNER TO freecodecamp;

--
-- Name: galaxy_types_galaxy_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_types_galaxy_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_types_galaxy_type_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_types_galaxy_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_types_galaxy_type_id_seq OWNED BY public.galaxy_types.galaxy_types_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30),
    planet_id integer NOT NULL,
    description text,
    fun_fact text
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
    name character varying(30) NOT NULL,
    diameter numeric(6,3),
    moon_amount integer,
    galaxy_id integer,
    description text,
    has_life boolean,
    star_id integer
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
    name character varying(30),
    star_types_id integer NOT NULL,
    galaxy_id integer,
    planet_id integer
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
-- Name: star_types; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star_types (
    star_types_id integer NOT NULL,
    name character varying(30),
    explode boolean NOT NULL
);


ALTER TABLE public.star_types OWNER TO freecodecamp;

--
-- Name: star_types_star_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_types_star_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_types_star_type_id_seq OWNER TO freecodecamp;

--
-- Name: star_types_star_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_types_star_type_id_seq OWNED BY public.star_types.star_types_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: galaxy_types galaxy_types_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_types ALTER COLUMN galaxy_types_id SET DEFAULT nextval('public.galaxy_types_galaxy_type_id_seq'::regclass);


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
-- Name: star_types star_types_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_types ALTER COLUMN star_types_id SET DEFAULT nextval('public.star_types_star_type_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 1, 250, NULL);
INSERT INTO public.galaxy VALUES (2, 'Andromeda Galaxy', 1, 1000, NULL);
INSERT INTO public.galaxy VALUES (3, 'M87', 2, 1500, NULL);
INSERT INTO public.galaxy VALUES (4, 'Messier 32', 2, 1, NULL);
INSERT INTO public.galaxy VALUES (5, 'Large Magellanic Cloud', 3, 15, NULL);
INSERT INTO public.galaxy VALUES (6, 'Small Magellanic Cloud', 3, 7, NULL);
INSERT INTO public.galaxy VALUES (7, 'NGC 5866', 4, 100, NULL);
INSERT INTO public.galaxy VALUES (8, 'Sombrero Galaxy', 4, 800, NULL);


--
-- Data for Name: galaxy_types; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy_types VALUES (1, 'Spiral', NULL);
INSERT INTO public.galaxy_types VALUES (2, 'Elliptical', NULL);
INSERT INTO public.galaxy_types VALUES (3, 'Irregular', NULL);
INSERT INTO public.galaxy_types VALUES (4, 'Lenticular', NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 3, NULL, NULL);
INSERT INTO public.moon VALUES (2, 'Phobos', 4, NULL, NULL);
INSERT INTO public.moon VALUES (3, 'Deimos', 4, NULL, NULL);
INSERT INTO public.moon VALUES (4, 'Ganymede', 5, NULL, NULL);
INSERT INTO public.moon VALUES (5, 'Io', 5, NULL, NULL);
INSERT INTO public.moon VALUES (6, 'Europa', 5, NULL, NULL);
INSERT INTO public.moon VALUES (7, 'Titan', 6, NULL, NULL);
INSERT INTO public.moon VALUES (8, 'Enceladus', 6, NULL, NULL);
INSERT INTO public.moon VALUES (9, 'Rhea', 6, NULL, NULL);
INSERT INTO public.moon VALUES (10, 'Titania', 7, NULL, NULL);
INSERT INTO public.moon VALUES (11, 'Oberon', 7, NULL, NULL);
INSERT INTO public.moon VALUES (12, 'Miranda', 7, NULL, NULL);
INSERT INTO public.moon VALUES (13, 'Triton', 8, NULL, NULL);
INSERT INTO public.moon VALUES (14, 'Proteus', 8, NULL, NULL);
INSERT INTO public.moon VALUES (15, 'Nereid', 8, NULL, NULL);
INSERT INTO public.moon VALUES (16, 'Charon', 9, NULL, NULL);
INSERT INTO public.moon VALUES (17, 'Styx', 9, NULL, NULL);
INSERT INTO public.moon VALUES (18, 'Nix', 9, NULL, NULL);
INSERT INTO public.moon VALUES (19, 'Dysnomia', 10, NULL, NULL);
INSERT INTO public.moon VALUES (20, 'Namaka', 11, NULL, NULL);
INSERT INTO public.moon VALUES (21, 'MK 2', 12, NULL, NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 4.880, 0, 1, 'The smallest and closest planet to the Sun, with extreme temperature fluctuations.', false, 1);
INSERT INTO public.planet VALUES (2, 'Venus', 12.104, 0, 1, 'A hot, toxic planet with thick clouds and volcanic surfaces', false, 1);
INSERT INTO public.planet VALUES (3, 'Earth', 12.742, 1, 1, 'The only planet known to support life, with water, land, and an atmosphere that sustains various ecosystems.', true, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 6.779, 2, 1, 'Known as the Red Planet.', false, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 139.820, 95, 1, 'The largest planet.', false, 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 116.460, 146, 1, 'Famous for its extensive ring system.', false, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', 50.724, 27, 1, 'A blue-green planet that rotates on its side.', false, 1);
INSERT INTO public.planet VALUES (8, 'Neptune', 49.244, 14, 1, 'The furthest planet from the Sun that rotates on its side.', false, 1);
INSERT INTO public.planet VALUES (9, 'Pluto', 2.377, 5, 1, 'Once considered the ninth planet, now classified as a dwarf planet.', false, 1);
INSERT INTO public.planet VALUES (10, 'Eris', 2.326, 1, 1, 'A distant dwarf planet, slightly smaller than pluto.', false, 1);
INSERT INTO public.planet VALUES (11, 'Haumea', 1.632, 2, 1, 'A dwarf planet known for its elongated, oval shape due to its fast rotation.', false, 1);
INSERT INTO public.planet VALUES (12, 'Makemake', 1.632, 1, 1, 'A bright, icy surface planet. Similar to Pluto but no known atmosphere or moons.', false, 1);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 1, 1);
INSERT INTO public.star VALUES (2, 'Sirius', 1, 1, 4);
INSERT INTO public.star VALUES (3, 'Alpha Centrauri A', 1, 1, 3);
INSERT INTO public.star VALUES (4, 'Betelgeuse', 2, 1, 5);
INSERT INTO public.star VALUES (5, 'Aldebaran', 2, 1, 6);
INSERT INTO public.star VALUES (6, 'Sirius B', 3, 1, 8);
INSERT INTO public.star VALUES (7, 'Procyon B', 3, 1, 7);
INSERT INTO public.star VALUES (8, 'Crab Pulsar', 4, 1, 9);
INSERT INTO public.star VALUES (9, 'Rigel', 5, 1, 10);
INSERT INTO public.star VALUES (10, 'Antares', 5, 1, 11);


--
-- Data for Name: star_types; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star_types VALUES (1, 'Main Sequence Stars', false);
INSERT INTO public.star_types VALUES (2, 'Red Giants', false);
INSERT INTO public.star_types VALUES (3, 'White Dwarfs', false);
INSERT INTO public.star_types VALUES (4, 'Neutron Stars', false);
INSERT INTO public.star_types VALUES (5, 'Supergiants', true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 8, true);


--
-- Name: galaxy_types_galaxy_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_types_galaxy_type_id_seq', 4, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 21, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 10, true);


--
-- Name: star_types_star_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_types_star_type_id_seq', 5, true);


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
-- Name: galaxy_types galaxy_types_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_types
    ADD CONSTRAINT galaxy_types_name_key UNIQUE (name);


--
-- Name: galaxy_types galaxy_types_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_types
    ADD CONSTRAINT galaxy_types_pkey PRIMARY KEY (galaxy_types_id);


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
-- Name: planet planet_description_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_description_key UNIQUE (description);


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
-- Name: star_types star_types_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_types
    ADD CONSTRAINT star_types_name_key UNIQUE (name);


--
-- Name: star_types star_types_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_types
    ADD CONSTRAINT star_types_pkey PRIMARY KEY (star_types_id);


--
-- Name: galaxy galaxy_galaxy_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_type_id_fkey FOREIGN KEY (galaxy_types_id) REFERENCES public.galaxy_types(galaxy_types_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


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
-- Name: star star_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: star star_star_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_type_id_fkey FOREIGN KEY (star_types_id) REFERENCES public.star_types(star_types_id);


--
-- PostgreSQL database dump complete
--

