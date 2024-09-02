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
-- Name: player_info; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.player_info (
    username character varying(22) NOT NULL,
    games_played integer NOT NULL,
    best_game integer NOT NULL
);


ALTER TABLE public.player_info OWNER TO freecodecamp;

--
-- Data for Name: player_info; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.player_info VALUES ('Aziz', 1, 5);
INSERT INTO public.player_info VALUES ('Ali', 2, 1);
INSERT INTO public.player_info VALUES ('user_1725287121617', 2, 66);
INSERT INTO public.player_info VALUES ('user_1725287121618', 5, 24);
INSERT INTO public.player_info VALUES ('user_1725287555226', 2, 34);
INSERT INTO public.player_info VALUES ('user_1725287555227', 5, 31);


--
-- PostgreSQL database dump complete
--

