--
-- PostgreSQL database dump
--

-- Dumped from database version 12.1
-- Dumped by pg_dump version 12.1

-- Started on 2019-11-14 23:19:56

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
-- TOC entry 203 (class 1259 OID 16396)
-- Name: actor; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.actor (
    actor_id integer NOT NULL,
    actor_name character varying(50) NOT NULL,
    actor_surname character varying(50) NOT NULL
);


ALTER TABLE public.actor OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 16394)
-- Name: actor_actor_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.actor_actor_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.actor_actor_id_seq OWNER TO postgres;

--
-- TOC entry 2907 (class 0 OID 0)
-- Dependencies: 202
-- Name: actor_actor_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.actor_actor_id_seq OWNED BY public.actor.actor_id;


--
-- TOC entry 215 (class 1259 OID 16569)
-- Name: comment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.comment (
    comment_id integer NOT NULL,
    movie_id integer NOT NULL,
    user_id integer NOT NULL,
    comment character varying(50) NOT NULL,
    entry_date date NOT NULL
);


ALTER TABLE public.comment OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 16567)
-- Name: comment_comment_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.comment_comment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comment_comment_id_seq OWNER TO postgres;

--
-- TOC entry 2908 (class 0 OID 0)
-- Dependencies: 214
-- Name: comment_comment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.comment_comment_id_seq OWNED BY public.comment.comment_id;


--
-- TOC entry 211 (class 1259 OID 16516)
-- Name: crew; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.crew (
    crew_id integer NOT NULL,
    movie_id integer NOT NULL
);


ALTER TABLE public.crew OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 16514)
-- Name: crew_crew_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.crew_crew_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.crew_crew_id_seq OWNER TO postgres;

--
-- TOC entry 2909 (class 0 OID 0)
-- Dependencies: 210
-- Name: crew_crew_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.crew_crew_id_seq OWNED BY public.crew.crew_id;


--
-- TOC entry 207 (class 1259 OID 16441)
-- Name: genre; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.genre (
    genre_id integer NOT NULL,
    genre_name text NOT NULL
);


ALTER TABLE public.genre OWNER TO postgres;

--
-- TOC entry 206 (class 1259 OID 16439)
-- Name: genre_genre_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.genre_genre_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.genre_genre_id_seq OWNER TO postgres;

--
-- TOC entry 2910 (class 0 OID 0)
-- Dependencies: 206
-- Name: genre_genre_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.genre_genre_id_seq OWNED BY public.genre.genre_id;


--
-- TOC entry 209 (class 1259 OID 16500)
-- Name: movie; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.movie (
    movie_id integer NOT NULL,
    movie_title text NOT NULL,
    genre_id integer NOT NULL,
    release_date date NOT NULL,
    rating_avg integer NOT NULL,
    rating_count integer NOT NULL,
    age_limit integer NOT NULL,
    crew_id integer NOT NULL
);


ALTER TABLE public.movie OWNER TO postgres;

--
-- TOC entry 208 (class 1259 OID 16498)
-- Name: movie_movie_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.movie_movie_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.movie_movie_id_seq OWNER TO postgres;

--
-- TOC entry 2911 (class 0 OID 0)
-- Dependencies: 208
-- Name: movie_movie_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.movie_movie_id_seq OWNED BY public.movie.movie_id;


--
-- TOC entry 213 (class 1259 OID 16550)
-- Name: rate; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rate (
    rating_id integer NOT NULL,
    movie_id integer NOT NULL,
    user_id integer NOT NULL,
    rating integer NOT NULL,
    CONSTRAINT rate_rating_check CHECK ((rating = ANY (ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10])))
);


ALTER TABLE public.rate OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 16548)
-- Name: rate_rating_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.rate_rating_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.rate_rating_id_seq OWNER TO postgres;

--
-- TOC entry 2912 (class 0 OID 0)
-- Dependencies: 212
-- Name: rate_rating_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.rate_rating_id_seq OWNED BY public.rate.rating_id;


--
-- TOC entry 205 (class 1259 OID 16404)
-- Name: user_table; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_table (
    user_id integer NOT NULL,
    nick_name text NOT NULL,
    email text NOT NULL,
    phone text NOT NULL,
    user_password text NOT NULL,
    birth_date date NOT NULL,
    is_admin boolean NOT NULL,
    about character varying(250),
    CONSTRAINT user_table_email_check CHECK ((email ~* '^\w+@\w+[.]\w+$'::text)),
    CONSTRAINT user_table_nick_name_check CHECK ((nick_name !~ '\s'::text)),
    CONSTRAINT user_table_user_password_check CHECK ((char_length(user_password) >= 8))
);


ALTER TABLE public.user_table OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 16402)
-- Name: user_table_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_table_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_table_user_id_seq OWNER TO postgres;

--
-- TOC entry 2913 (class 0 OID 0)
-- Dependencies: 204
-- Name: user_table_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_table_user_id_seq OWNED BY public.user_table.user_id;


--
-- TOC entry 2726 (class 2604 OID 16399)
-- Name: actor actor_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actor ALTER COLUMN actor_id SET DEFAULT nextval('public.actor_actor_id_seq'::regclass);


--
-- TOC entry 2736 (class 2604 OID 16572)
-- Name: comment comment_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comment ALTER COLUMN comment_id SET DEFAULT nextval('public.comment_comment_id_seq'::regclass);


--
-- TOC entry 2733 (class 2604 OID 16519)
-- Name: crew crew_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.crew ALTER COLUMN crew_id SET DEFAULT nextval('public.crew_crew_id_seq'::regclass);


--
-- TOC entry 2731 (class 2604 OID 16444)
-- Name: genre genre_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.genre ALTER COLUMN genre_id SET DEFAULT nextval('public.genre_genre_id_seq'::regclass);


--
-- TOC entry 2732 (class 2604 OID 16503)
-- Name: movie movie_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie ALTER COLUMN movie_id SET DEFAULT nextval('public.movie_movie_id_seq'::regclass);


--
-- TOC entry 2734 (class 2604 OID 16553)
-- Name: rate rating_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rate ALTER COLUMN rating_id SET DEFAULT nextval('public.rate_rating_id_seq'::regclass);


--
-- TOC entry 2727 (class 2604 OID 16407)
-- Name: user_table user_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_table ALTER COLUMN user_id SET DEFAULT nextval('public.user_table_user_id_seq'::regclass);


--
-- TOC entry 2889 (class 0 OID 16396)
-- Dependencies: 203
-- Data for Name: actor; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.actor (actor_id, actor_name, actor_surname) FROM stdin;
\.


--
-- TOC entry 2901 (class 0 OID 16569)
-- Dependencies: 215
-- Data for Name: comment; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.comment (comment_id, movie_id, user_id, comment, entry_date) FROM stdin;
\.


--
-- TOC entry 2897 (class 0 OID 16516)
-- Dependencies: 211
-- Data for Name: crew; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.crew (crew_id, movie_id) FROM stdin;
\.


--
-- TOC entry 2893 (class 0 OID 16441)
-- Dependencies: 207
-- Data for Name: genre; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.genre (genre_id, genre_name) FROM stdin;
\.


--
-- TOC entry 2895 (class 0 OID 16500)
-- Dependencies: 209
-- Data for Name: movie; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.movie (movie_id, movie_title, genre_id, release_date, rating_avg, rating_count, age_limit, crew_id) FROM stdin;
\.


--
-- TOC entry 2899 (class 0 OID 16550)
-- Dependencies: 213
-- Data for Name: rate; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.rate (rating_id, movie_id, user_id, rating) FROM stdin;
\.


--
-- TOC entry 2891 (class 0 OID 16404)
-- Dependencies: 205
-- Data for Name: user_table; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_table (user_id, nick_name, email, phone, user_password, birth_date, is_admin, about) FROM stdin;
\.


--
-- TOC entry 2914 (class 0 OID 0)
-- Dependencies: 202
-- Name: actor_actor_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.actor_actor_id_seq', 1, false);


--
-- TOC entry 2915 (class 0 OID 0)
-- Dependencies: 214
-- Name: comment_comment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.comment_comment_id_seq', 1, false);


--
-- TOC entry 2916 (class 0 OID 0)
-- Dependencies: 210
-- Name: crew_crew_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.crew_crew_id_seq', 1, false);


--
-- TOC entry 2917 (class 0 OID 0)
-- Dependencies: 206
-- Name: genre_genre_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.genre_genre_id_seq', 1, false);


--
-- TOC entry 2918 (class 0 OID 0)
-- Dependencies: 208
-- Name: movie_movie_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.movie_movie_id_seq', 1, false);


--
-- TOC entry 2919 (class 0 OID 0)
-- Dependencies: 212
-- Name: rate_rating_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.rate_rating_id_seq', 1, false);


--
-- TOC entry 2920 (class 0 OID 0)
-- Dependencies: 204
-- Name: user_table_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_table_user_id_seq', 1, false);


--
-- TOC entry 2738 (class 2606 OID 16401)
-- Name: actor actor_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actor
    ADD CONSTRAINT actor_pkey PRIMARY KEY (actor_id);


--
-- TOC entry 2754 (class 2606 OID 16574)
-- Name: comment comment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comment
    ADD CONSTRAINT comment_pkey PRIMARY KEY (comment_id);


--
-- TOC entry 2750 (class 2606 OID 16521)
-- Name: crew crew_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.crew
    ADD CONSTRAINT crew_pkey PRIMARY KEY (crew_id);


--
-- TOC entry 2746 (class 2606 OID 16449)
-- Name: genre genre_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.genre
    ADD CONSTRAINT genre_pkey PRIMARY KEY (genre_id);


--
-- TOC entry 2748 (class 2606 OID 16508)
-- Name: movie movie_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie
    ADD CONSTRAINT movie_pkey PRIMARY KEY (movie_id);


--
-- TOC entry 2752 (class 2606 OID 16556)
-- Name: rate rate_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rate
    ADD CONSTRAINT rate_pkey PRIMARY KEY (rating_id);


--
-- TOC entry 2740 (class 2606 OID 16417)
-- Name: user_table user_table_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_table
    ADD CONSTRAINT user_table_email_key UNIQUE (email);


--
-- TOC entry 2742 (class 2606 OID 16419)
-- Name: user_table user_table_phone_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_table
    ADD CONSTRAINT user_table_phone_key UNIQUE (phone);


--
-- TOC entry 2744 (class 2606 OID 16415)
-- Name: user_table user_table_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_table
    ADD CONSTRAINT user_table_pkey PRIMARY KEY (user_id);


--
-- TOC entry 2760 (class 2606 OID 16575)
-- Name: comment comment_movie_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comment
    ADD CONSTRAINT comment_movie_id_fkey FOREIGN KEY (movie_id) REFERENCES public.movie(movie_id);


--
-- TOC entry 2761 (class 2606 OID 16580)
-- Name: comment comment_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comment
    ADD CONSTRAINT comment_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.user_table(user_id);


--
-- TOC entry 2757 (class 2606 OID 16522)
-- Name: crew crew_movie_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.crew
    ADD CONSTRAINT crew_movie_id_fkey FOREIGN KEY (movie_id) REFERENCES public.movie(movie_id);


--
-- TOC entry 2756 (class 2606 OID 16529)
-- Name: movie movie_crew_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie
    ADD CONSTRAINT movie_crew_id_fkey FOREIGN KEY (crew_id) REFERENCES public.crew(crew_id);


--
-- TOC entry 2755 (class 2606 OID 16509)
-- Name: movie movie_genre_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie
    ADD CONSTRAINT movie_genre_id_fkey FOREIGN KEY (genre_id) REFERENCES public.genre(genre_id);


--
-- TOC entry 2758 (class 2606 OID 16557)
-- Name: rate rate_movie_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rate
    ADD CONSTRAINT rate_movie_id_fkey FOREIGN KEY (movie_id) REFERENCES public.movie(movie_id);


--
-- TOC entry 2759 (class 2606 OID 16562)
-- Name: rate rate_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rate
    ADD CONSTRAINT rate_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.user_table(user_id);


-- Completed on 2019-11-14 23:19:56

--
-- PostgreSQL database dump complete
--

