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
    name character varying(30) NOT NULL,
    type text,
    size numeric,
    has_black_hole boolean,
    number_of_black_holes integer
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
    name character varying(30) NOT NULL,
    type text,
    diameter numeric,
    is_inhabited boolean,
    planet_id integer,
    number_of_sister_moons integer
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
    type text,
    distance_from_star numeric,
    mass numeric,
    has_atmosphere boolean,
    star_id integer,
    number_of_moons integer
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
    name character varying(30) NOT NULL,
    type text,
    purpose text,
    launch_date date,
    is_active boolean,
    years_in_orbit integer
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
    name character varying(30) NOT NULL,
    type text,
    age integer,
    mass numeric,
    has_planets boolean,
    galaxy_id integer,
    number_of_planets integer
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

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Spiral', 1000000.0, true, 4);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Elliptical', 1200000.0, false, 2);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Irregular', 500000.0, false, 0);
INSERT INTO public.galaxy VALUES (4, 'Centaurus A', 'Elliptical', 500000.0, true, 1);
INSERT INTO public.galaxy VALUES (5, 'Messier 87', 'Elliptical', 10000000.0, true, 3);
INSERT INTO public.galaxy VALUES (6, 'Sombrero', 'Spiral', 60000.0, false, 0);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 'Natural satellite', 3474.8, false, 1, 0);
INSERT INTO public.moon VALUES (2, 'Phobos', 'Natural satellite', 22.2, false, 2, 0);
INSERT INTO public.moon VALUES (3, 'Europa', 'Natural satellite', 3121.6, false, 3, 0);
INSERT INTO public.moon VALUES (4, 'Ganymede', 'Natural satellite', 5262.4, false, 3, 3);
INSERT INTO public.moon VALUES (5, 'Io', 'Natural satellite', 3642.6, false, 3, 0);
INSERT INTO public.moon VALUES (6, 'Titan', 'Natural satellite', 5150, false, 4, 0);
INSERT INTO public.moon VALUES (7, 'Enceladus', 'Natural satellite', 504.2, false, 4, 0);
INSERT INTO public.moon VALUES (8, 'Mimas', 'Natural satellite', 396.4, false, 4, 0);
INSERT INTO public.moon VALUES (9, 'Triton', 'Natural satellite', 2706.8, false, 5, 0);
INSERT INTO public.moon VALUES (10, 'Charon', 'Natural satellite', 1208, false, 6, 0);
INSERT INTO public.moon VALUES (11, 'Callisto', 'Natural satellite', 4820.6, false, 3, 4);
INSERT INTO public.moon VALUES (12, 'Dione', 'Natural satellite', 561.4, false, 4, 0);
INSERT INTO public.moon VALUES (13, 'Rhea', 'Natural satellite', 763.8, false, 4, 0);
INSERT INTO public.moon VALUES (14, 'Titania', 'Natural satellite', 1577.8, false, 5, 0);
INSERT INTO public.moon VALUES (15, 'Oberon', 'Natural satellite', 1522.8, false, 5, 0);
INSERT INTO public.moon VALUES (16, 'Umbriel', 'Natural satellite', 1169.4, false, 5, 0);
INSERT INTO public.moon VALUES (17, 'Ariel', 'Natural satellite', 1157.8, false, 5, 0);
INSERT INTO public.moon VALUES (18, 'Miranda', 'Natural satellite', 235.8, false, 5, 0);
INSERT INTO public.moon VALUES (19, 'Tethys', 'Natural satellite', 531.1, false, 4, 0);
INSERT INTO public.moon VALUES (20, 'Hyperion', 'Natural satellite', 270.4, false, 4, 0);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 'Terrestrial', 149600000, 5972000000000000000000000, true, 1, 1);
INSERT INTO public.planet VALUES (2, 'Mars', 'Terrestrial', 227900000, 639000000000000000000000, true, 1, 2);
INSERT INTO public.planet VALUES (3, 'Jupiter', 'Gas giant', 778600000, 1898000000000000000000000000, false, 1, 79);
INSERT INTO public.planet VALUES (4, 'Venus', 'Terrestrial', 108200000, 4867000000000000000000000, true, 1, 0);
INSERT INTO public.planet VALUES (5, 'Saturn', 'Gas giant', 1429000000, 568300000000000000000000000, false, 1, 82);
INSERT INTO public.planet VALUES (6, 'Neptune', 'Ice giant', 4498000000, 102400000000000000000000000, true, 1, 14);
INSERT INTO public.planet VALUES (7, 'Mercury', 'Terrestrial', 57900000, 328500000000000000000000, false, 1, 0);
INSERT INTO public.planet VALUES (8, 'Uranus', 'Ice giant', 2871000000, 86810000000000000000000000, true, 1, 27);
INSERT INTO public.planet VALUES (9, 'Pluto', 'Dwarf', 5906000000, 13090000000000000000000, false, 1, 5);
INSERT INTO public.planet VALUES (10, 'Kepler-186f', 'Exoplanet', 500000000, 3850000000000000000000000, true, 1, 0);
INSERT INTO public.planet VALUES (11, 'HD 209458 b', 'Exoplanet', 150000000, 1898000000000000000000000000, false, 2, 0);
INSERT INTO public.planet VALUES (12, '55 Cancri e', 'Exoplanet', 40000000, 8630000000000000000000000, true, 2, 0);


--
-- Data for Name: satellite; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.satellite VALUES (1, 'Hubble Space Telescope', 'Space telescope', 'Astronomy', '1990-04-24', true, 32);
INSERT INTO public.satellite VALUES (2, 'International Space Station', 'Space station', 'Research', '1998-11-20', true, 24);
INSERT INTO public.satellite VALUES (3, 'GPS Satellite', 'Navigation satellite', 'Navigation', '1978-02-22', true, 46);
INSERT INTO public.satellite VALUES (4, 'Lunar Reconnaissance Orbiter', 'Lunar orbiter', 'Space exploration', '2009-06-18', true, 13);
INSERT INTO public.satellite VALUES (5, 'Compton Gamma Ray Observatory', 'Gamma-ray telescope', 'Astronomy', '1991-04-05', false, 30);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'G-type main-sequence', 500000002, 1989, true, 1, 8);
INSERT INTO public.star VALUES (2, 'Sirius', 'A-type main-sequence', 200000003, 2063, true, 1, 3);
INSERT INTO public.star VALUES (3, 'Proxima Centauri', 'Red dwarf', 360000003, 25, false, 4, 0);
INSERT INTO public.star VALUES (4, 'Alpha Centauri A', 'G-type main-sequence', 600000002, 2186, true, 4, 8);
INSERT INTO public.star VALUES (5, 'Alpha Centauri B', 'K-type main-sequence', 600000002, 1684, true, 4, 8);
INSERT INTO public.star VALUES (6, 'Betelgeuse', 'Red supergiant', 80000000, 14, false, 2, 0);


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
-- Name: satellite_satellite_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.satellite_satellite_id_seq', 5, true);


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

