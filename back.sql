--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
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
-- Name: activities; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE activities (
    id integer NOT NULL,
    name character varying,
    subprocedure_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    generator_id integer
);


ALTER TABLE public.activities OWNER TO postgres;

--
-- Name: activities_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE activities_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.activities_id_seq OWNER TO postgres;

--
-- Name: activities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE activities_id_seq OWNED BY activities.id;


--
-- Name: activity_by_products; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE activity_by_products (
    id integer NOT NULL,
    activity_id integer,
    product_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.activity_by_products OWNER TO postgres;

--
-- Name: activity_by_products_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE activity_by_products_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.activity_by_products_id_seq OWNER TO postgres;

--
-- Name: activity_by_products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE activity_by_products_id_seq OWNED BY activity_by_products.id;


--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.ar_internal_metadata OWNER TO postgres;

--
-- Name: business_units; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE business_units (
    id integer NOT NULL,
    name character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.business_units OWNER TO postgres;

--
-- Name: business_units_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE business_units_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.business_units_id_seq OWNER TO postgres;

--
-- Name: business_units_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE business_units_id_seq OWNED BY business_units.id;


--
-- Name: cost_by_resources; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE cost_by_resources (
    id integer NOT NULL,
    meter_id integer,
    resource_id integer,
    subresource_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    activity_by_product_id integer,
    quantity numeric,
    cost numeric
);


ALTER TABLE public.cost_by_resources OWNER TO postgres;

--
-- Name: cost_by_resources_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE cost_by_resources_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cost_by_resources_id_seq OWNER TO postgres;

--
-- Name: cost_by_resources_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE cost_by_resources_id_seq OWNED BY cost_by_resources.id;


--
-- Name: generators; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE generators (
    id integer NOT NULL,
    name character varying,
    unity character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    quantity numeric
);


ALTER TABLE public.generators OWNER TO postgres;

--
-- Name: generators_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE generators_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.generators_id_seq OWNER TO postgres;

--
-- Name: generators_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE generators_id_seq OWNED BY generators.id;


--
-- Name: human_usages; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE human_usages (
    id integer NOT NULL,
    registration_date date,
    subresource_id integer,
    quantity numeric,
    meter_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.human_usages OWNER TO postgres;

--
-- Name: human_usages_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE human_usages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.human_usages_id_seq OWNER TO postgres;

--
-- Name: human_usages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE human_usages_id_seq OWNED BY human_usages.id;


--
-- Name: indirect_activities; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE indirect_activities (
    id integer NOT NULL,
    name character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    subprocedure_id integer,
    generator_id integer
);


ALTER TABLE public.indirect_activities OWNER TO postgres;

--
-- Name: indirect_activities_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE indirect_activities_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.indirect_activities_id_seq OWNER TO postgres;

--
-- Name: indirect_activities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE indirect_activities_id_seq OWNED BY indirect_activities.id;


--
-- Name: indirect_activity_by_products; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE indirect_activity_by_products (
    id integer NOT NULL,
    product_id integer,
    indirect_activity_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.indirect_activity_by_products OWNER TO postgres;

--
-- Name: indirect_activity_by_products_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE indirect_activity_by_products_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.indirect_activity_by_products_id_seq OWNER TO postgres;

--
-- Name: indirect_activity_by_products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE indirect_activity_by_products_id_seq OWNED BY indirect_activity_by_products.id;


--
-- Name: indirect_activity_by_resources; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE indirect_activity_by_resources (
    id integer NOT NULL,
    resource_id integer,
    subresource_id integer,
    quantity numeric,
    cost numeric,
    meter_id integer,
    indirect_activity_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.indirect_activity_by_resources OWNER TO postgres;

--
-- Name: indirect_activity_by_resources_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE indirect_activity_by_resources_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.indirect_activity_by_resources_id_seq OWNER TO postgres;

--
-- Name: indirect_activity_by_resources_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE indirect_activity_by_resources_id_seq OWNED BY indirect_activity_by_resources.id;


--
-- Name: kardex_acs; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE kardex_acs (
    id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.kardex_acs OWNER TO postgres;

--
-- Name: kardex_acs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE kardex_acs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.kardex_acs_id_seq OWNER TO postgres;

--
-- Name: kardex_acs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE kardex_acs_id_seq OWNED BY kardex_acs.id;


--
-- Name: kardex_aps; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE kardex_aps (
    id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.kardex_aps OWNER TO postgres;

--
-- Name: kardex_aps_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE kardex_aps_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.kardex_aps_id_seq OWNER TO postgres;

--
-- Name: kardex_aps_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE kardex_aps_id_seq OWNED BY kardex_aps.id;


--
-- Name: kardex_mos; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE kardex_mos (
    id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.kardex_mos OWNER TO postgres;

--
-- Name: kardex_mos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE kardex_mos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.kardex_mos_id_seq OWNER TO postgres;

--
-- Name: kardex_mos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE kardex_mos_id_seq OWNED BY kardex_mos.id;


--
-- Name: kardex_products; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE kardex_products (
    id integer NOT NULL,
    registre_date date,
    quantity numeric,
    total_value numeric,
    meter_id integer,
    production_order_id integer,
    number_sale integer,
    product_id integer,
    type_kpo boolean,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.kardex_products OWNER TO postgres;

--
-- Name: kardex_products_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE kardex_products_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.kardex_products_id_seq OWNER TO postgres;

--
-- Name: kardex_products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE kardex_products_id_seq OWNED BY kardex_products.id;


--
-- Name: kardexes; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE kardexes (
    id integer NOT NULL,
    registration_date date,
    provider_id integer,
    subresource_id integer,
    quantity numeric,
    total_value numeric,
    meter_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    type_kardex boolean
);


ALTER TABLE public.kardexes OWNER TO postgres;

--
-- Name: kardexes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE kardexes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.kardexes_id_seq OWNER TO postgres;

--
-- Name: kardexes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE kardexes_id_seq OWNED BY kardexes.id;


--
-- Name: macroprocesses; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE macroprocesses (
    id integer NOT NULL,
    name character varying,
    business_unit_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.macroprocesses OWNER TO postgres;

--
-- Name: macroprocesses_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE macroprocesses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.macroprocesses_id_seq OWNER TO postgres;

--
-- Name: macroprocesses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE macroprocesses_id_seq OWNED BY macroprocesses.id;


--
-- Name: macroproducts; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE macroproducts (
    id integer NOT NULL,
    name character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.macroproducts OWNER TO postgres;

--
-- Name: macroproducts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE macroproducts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.macroproducts_id_seq OWNER TO postgres;

--
-- Name: macroproducts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE macroproducts_id_seq OWNED BY macroproducts.id;


--
-- Name: meters; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE meters (
    id integer NOT NULL,
    unity character varying,
    type_unity character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.meters OWNER TO postgres;

--
-- Name: meters_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE meters_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.meters_id_seq OWNER TO postgres;

--
-- Name: meters_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE meters_id_seq OWNED BY meters.id;


--
-- Name: op_cost_by_resources; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE op_cost_by_resources (
    id integer NOT NULL,
    quantity numeric,
    meter_id integer,
    resource_id integer,
    subresource_id integer,
    activity_by_product_id integer,
    cost numeric,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    production_order_id integer
);


ALTER TABLE public.op_cost_by_resources OWNER TO postgres;

--
-- Name: op_cost_by_resources_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE op_cost_by_resources_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.op_cost_by_resources_id_seq OWNER TO postgres;

--
-- Name: op_cost_by_resources_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE op_cost_by_resources_id_seq OWNED BY op_cost_by_resources.id;


--
-- Name: positions; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE positions (
    id integer NOT NULL,
    name character varying,
    area character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.positions OWNER TO postgres;

--
-- Name: positions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE positions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.positions_id_seq OWNER TO postgres;

--
-- Name: positions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE positions_id_seq OWNED BY positions.id;


--
-- Name: procedures; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE procedures (
    id integer NOT NULL,
    name character varying,
    macroprocess_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.procedures OWNER TO postgres;

--
-- Name: procedures_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE procedures_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.procedures_id_seq OWNER TO postgres;

--
-- Name: procedures_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE procedures_id_seq OWNED BY procedures.id;


--
-- Name: production_order_identifiers; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE production_order_identifiers (
    id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.production_order_identifiers OWNER TO postgres;

--
-- Name: production_order_identifiers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE production_order_identifiers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.production_order_identifiers_id_seq OWNER TO postgres;

--
-- Name: production_order_identifiers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE production_order_identifiers_id_seq OWNED BY production_order_identifiers.id;


--
-- Name: production_orders; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE production_orders (
    id integer NOT NULL,
    id_po integer,
    product_id integer,
    quantity numeric,
    date_start date,
    date_end date,
    status integer,
    total_cost numeric,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.production_orders OWNER TO postgres;

--
-- Name: production_orders_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE production_orders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.production_orders_id_seq OWNER TO postgres;

--
-- Name: production_orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE production_orders_id_seq OWNED BY production_orders.id;


--
-- Name: products; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE products (
    id integer NOT NULL,
    name character varying,
    macroproduct_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.products OWNER TO postgres;

--
-- Name: products_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE products_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.products_id_seq OWNER TO postgres;

--
-- Name: products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE products_id_seq OWNED BY products.id;


--
-- Name: providers; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE providers (
    id integer NOT NULL,
    name character varying,
    nit character varying,
    sector character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.providers OWNER TO postgres;

--
-- Name: providers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE providers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.providers_id_seq OWNER TO postgres;

--
-- Name: providers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE providers_id_seq OWNED BY providers.id;


--
-- Name: resources; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE resources (
    id integer NOT NULL,
    name character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.resources OWNER TO postgres;

--
-- Name: resources_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE resources_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.resources_id_seq OWNER TO postgres;

--
-- Name: resources_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE resources_id_seq OWNED BY resources.id;


--
-- Name: roles; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE roles (
    id integer NOT NULL,
    name character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.roles OWNER TO postgres;

--
-- Name: roles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.roles_id_seq OWNER TO postgres;

--
-- Name: roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE roles_id_seq OWNED BY roles.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO postgres;

--
-- Name: sessions; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE sessions (
    id integer NOT NULL,
    time_init timestamp without time zone,
    time_end timestamp without time zone,
    user_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.sessions OWNER TO postgres;

--
-- Name: sessions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE sessions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sessions_id_seq OWNER TO postgres;

--
-- Name: sessions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE sessions_id_seq OWNED BY sessions.id;


--
-- Name: subprocedures; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE subprocedures (
    id integer NOT NULL,
    name character varying,
    procedure_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.subprocedures OWNER TO postgres;

--
-- Name: subprocedures_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE subprocedures_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.subprocedures_id_seq OWNER TO postgres;

--
-- Name: subprocedures_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE subprocedures_id_seq OWNED BY subprocedures.id;


--
-- Name: subresources; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE subresources (
    id integer NOT NULL,
    name character varying,
    resource_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    properties character varying,
    identity_card character varying,
    salary numeric,
    hours_worked numeric,
    value_hour numeric,
    unit_cost numeric,
    stock_minimum numeric,
    stock_maximum numeric,
    current_stock numeric,
    identifier character varying,
    useful_life numeric,
    market_valuer double precision,
    provider_id integer,
    position_id integer,
    category character varying,
    meter_id integer
);


ALTER TABLE public.subresources OWNER TO postgres;

--
-- Name: subresources_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE subresources_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.subresources_id_seq OWNER TO postgres;

--
-- Name: subresources_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE subresources_id_seq OWNED BY subresources.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE users (
    id integer NOT NULL,
    username character varying,
    email character varying,
    encrypted_password character varying,
    salt character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    role_id integer
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY activities ALTER COLUMN id SET DEFAULT nextval('activities_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY activity_by_products ALTER COLUMN id SET DEFAULT nextval('activity_by_products_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY business_units ALTER COLUMN id SET DEFAULT nextval('business_units_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cost_by_resources ALTER COLUMN id SET DEFAULT nextval('cost_by_resources_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY generators ALTER COLUMN id SET DEFAULT nextval('generators_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY human_usages ALTER COLUMN id SET DEFAULT nextval('human_usages_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY indirect_activities ALTER COLUMN id SET DEFAULT nextval('indirect_activities_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY indirect_activity_by_products ALTER COLUMN id SET DEFAULT nextval('indirect_activity_by_products_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY indirect_activity_by_resources ALTER COLUMN id SET DEFAULT nextval('indirect_activity_by_resources_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY kardex_acs ALTER COLUMN id SET DEFAULT nextval('kardex_acs_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY kardex_aps ALTER COLUMN id SET DEFAULT nextval('kardex_aps_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY kardex_mos ALTER COLUMN id SET DEFAULT nextval('kardex_mos_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY kardex_products ALTER COLUMN id SET DEFAULT nextval('kardex_products_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY kardexes ALTER COLUMN id SET DEFAULT nextval('kardexes_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY macroprocesses ALTER COLUMN id SET DEFAULT nextval('macroprocesses_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY macroproducts ALTER COLUMN id SET DEFAULT nextval('macroproducts_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY meters ALTER COLUMN id SET DEFAULT nextval('meters_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY op_cost_by_resources ALTER COLUMN id SET DEFAULT nextval('op_cost_by_resources_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY positions ALTER COLUMN id SET DEFAULT nextval('positions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY procedures ALTER COLUMN id SET DEFAULT nextval('procedures_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY production_order_identifiers ALTER COLUMN id SET DEFAULT nextval('production_order_identifiers_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY production_orders ALTER COLUMN id SET DEFAULT nextval('production_orders_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY products ALTER COLUMN id SET DEFAULT nextval('products_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY providers ALTER COLUMN id SET DEFAULT nextval('providers_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY resources ALTER COLUMN id SET DEFAULT nextval('resources_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY roles ALTER COLUMN id SET DEFAULT nextval('roles_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY sessions ALTER COLUMN id SET DEFAULT nextval('sessions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY subprocedures ALTER COLUMN id SET DEFAULT nextval('subprocedures_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY subresources ALTER COLUMN id SET DEFAULT nextval('subresources_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Data for Name: activities; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY activities (id, name, subprocedure_id, created_at, updated_at, generator_id) FROM stdin;
1	Asignación de citas presenciales (Cardiología)	3	2016-12-16 18:46:00.734001	2016-12-16 18:46:00.734001	1
2	Confirmación (Cardiología)	3	2016-12-16 18:46:00.738703	2016-12-16 18:46:00.738703	1
3	Ingreso Administrativo (Cardiología)	3	2016-12-16 18:46:00.743254	2016-12-16 18:46:00.743254	1
4	Cardiología	4	2016-12-16 18:46:00.747729	2016-12-16 18:46:00.747729	1
5	Medicina interna	4	2016-12-16 18:46:00.752028	2016-12-16 18:46:00.752028	1
6	Realización Procedimiento EKG	5	2016-12-16 18:46:00.756499	2016-12-16 18:46:00.756499	1
7	Realización Procedimiento ECO TT	5	2016-12-16 18:46:00.760669	2016-12-16 18:46:00.760669	1
8	Realización Procedimiento ECO ESTRÉS	5	2016-12-16 18:46:00.765102	2016-12-16 18:46:00.765102	1
9	Realización Procedimiento ECO TE	5	2016-12-16 18:46:00.769145	2016-12-16 18:46:00.769145	1
10	Realización Procedimiento HOLTER	5	2016-12-16 18:46:00.773295	2016-12-16 18:46:00.773295	1
11	Retiro de HOLTER	5	2016-12-16 18:46:00.777438	2016-12-16 18:46:00.777438	1
12	Realización Procedimiento MAPA	5	2016-12-16 18:46:00.78143	2016-12-16 18:46:00.78143	1
13	Retiro de MAPA	5	2016-12-16 18:46:00.786141	2016-12-16 18:46:00.786141	1
14	Realización Procedimiento PRUEBA DE ESFUERZO	5	2016-12-16 18:46:00.790349	2016-12-16 18:46:00.790349	1
15	Educación al paciente sobre examen-encuesta  (Cardiología)	7	2016-12-16 18:46:00.794858	2016-12-16 18:46:00.794858	1
16	Transcripción de procedimiento  (Cardiología)	8	2016-12-16 18:46:00.799014	2016-12-16 18:46:00.799014	1
17	Empaque  (Cardiología)	8	2016-12-16 18:46:00.803259	2016-12-16 18:46:00.803259	1
18	Asignación de Cita Cardiología (Rehabilitación)	12	2016-12-16 18:46:00.807592	2016-12-16 18:46:00.807592	1
19	Confirmación de cita (Rehabilitación)	12	2016-12-16 18:46:00.811799	2016-12-16 18:46:00.811799	1
20	Ingreso Administrativo (Rehabilitación)	12	2016-12-16 18:46:00.81606	2016-12-16 18:46:00.81606	1
21	Ingreso control (Rehabilitación)	12	2016-12-16 18:46:00.820255	2016-12-16 18:46:00.820255	1
22	Egreso paciente (Rehabilitación)	12	2016-12-16 18:46:00.827364	2016-12-16 18:46:00.827364	1
23	Informe de paciente (Rehabilitación)	16	2016-12-16 18:46:00.831472	2016-12-16 18:46:00.831472	1
24	Entrega informe  (Rehabilitación)	16	2016-12-16 18:46:00.835673	2016-12-16 18:46:00.835673	1
25	Encuesta de antecedentes personales (Rehabilitación)	17	2016-12-16 18:46:00.839642	2016-12-16 18:46:00.839642	1
26	Educación (Rehabilitación)	17	2016-12-16 18:46:00.843626	2016-12-16 18:46:00.843626	1
27	Recepción (Urgencias)	23	2016-12-16 18:46:00.847593	2016-12-16 18:46:00.847593	1
28	Pre consulta Triage (Urgencias)	23	2016-12-16 18:46:00.851592	2016-12-16 18:46:00.851592	1
29	Valoración médica (Urgencias)	23	2016-12-16 18:46:00.85565	2016-12-16 18:46:00.85565	1
30	Informar estado de salud (Urgencias)	23	2016-12-16 18:46:00.860212	2016-12-16 18:46:00.860212	1
31	Recomendaciones de egreso (Urgencias)	23	2016-12-16 18:46:00.865571	2016-12-16 18:46:00.865571	1
32	Egreso administrativo (Urgencias)	23	2016-12-16 18:46:00.869703	2016-12-16 18:46:00.869703	1
33	Ordenes médicas (Urgencias)	25	2016-12-16 18:46:00.873925	2016-12-16 18:46:00.873925	1
34	Asignar una cama de acuerdo a la patología y/o  de acuerdo a la identidad (Hospitalización)	26	2016-12-16 18:46:00.8778	2016-12-16 18:46:00.8778	1
35	Llega el paciente  jefe verifica que la habitación este en buenas condiciones (Hospitalización)	26	2016-12-16 18:46:00.881793	2016-12-16 18:46:00.881793	1
36	Verificar información del paciente (Hospitalización)	26	2016-12-16 18:46:00.885787	2016-12-16 18:46:00.885787	1
37	Dialogar y diligenciar con pacientes acerca de los derechos y deberes (Hospitalización)	26	2016-12-16 18:46:00.88993	2016-12-16 18:46:00.88993	1
38	Informa al paciente su estado (Hospitalización)	27	2016-12-16 18:46:00.893969	2016-12-16 18:46:00.893969	1
39	Revista médica (Hospitalización)	27	2016-12-16 18:46:00.897986	2016-12-16 18:46:00.897986	1
40	Evolución médica (Hospitalización)	27	2016-12-16 18:46:00.902055	2016-12-16 18:46:00.902055	1
41	Registros (Hospitalización)	27	2016-12-16 18:46:00.906322	2016-12-16 18:46:00.906322	1
42	Salida administrativa del paciente (Hospitalización)	27	2016-12-16 18:46:00.911101	2016-12-16 18:46:00.911101	1
43	Recibe el paciente telefónicamente  (Hospitalización)	28	2016-12-16 18:46:00.915229	2016-12-16 18:46:00.915229	1
44	Toma de hemocultivos y laboratorios  (Hospitalización)	28	2016-12-16 18:46:00.919662	2016-12-16 18:46:00.919662	1
45	Toma de electrocardiograma (Hospitalización)	28	2016-12-16 18:46:00.923921	2016-12-16 18:46:00.923921	1
46	Cateterismos y sondas vesicales (Hospitalización)	28	2016-12-16 18:46:00.928089	2016-12-16 18:46:00.928089	1
47	Lista de dietas (Hospitalización)	28	2016-12-16 18:46:00.932538	2016-12-16 18:46:00.932538	1
48	Solicitud de reporte de procedimientos (Hospitalización)	28	2016-12-16 18:46:00.93658	2016-12-16 18:46:00.93658	1
49	Administración de medicamentos (Hospitalización)	28	2016-12-16 18:46:00.940565	2016-12-16 18:46:00.940565	1
50	Revisar ordenes médicas (Hospitalización)	28	2016-12-16 18:46:00.945229	2016-12-16 18:46:00.945229	1
51	Toma de signos vitales (Hospitalización)	28	2016-12-16 18:46:00.949375	2016-12-16 18:46:00.949375	1
52	Egreso (Hospitalización)	28	2016-12-16 18:46:00.953552	2016-12-16 18:46:00.953552	1
53	Encuesta de satisfacción (Hospitalización)	28	2016-12-16 18:46:00.957867	2016-12-16 18:46:00.957867	1
54	Verificación de paz y salvo (Hospitalización)	28	2016-12-16 18:46:00.96181	2016-12-16 18:46:00.96181	1
55	Educación al paciente (Hospitalización)	28	2016-12-16 18:46:00.965654	2016-12-16 18:46:00.965654	1
56	Organiza y folear la historia clínica paciente al egreso del servicio (Hospitalización)	28	2016-12-16 18:46:00.969782	2016-12-16 18:46:00.969782	1
57	Toma signos (Aux. Hospitalización)	29	2016-12-16 18:46:00.974146	2016-12-16 18:46:00.974146	1
58	Control de signos vitales y control de líquidos (Aux. Hospitalización)	29	2016-12-16 18:46:00.978503	2016-12-16 18:46:00.978503	1
59	Toma de examen y muestras (Aux. Hospitalización)	29	2016-12-16 18:46:00.982747	2016-12-16 18:46:00.982747	1
60	Canalización de vena (Aux. Hospitalización)	29	2016-12-16 18:46:00.986894	2016-12-16 18:46:00.986894	1
61	Traslado de pacientes (Aux. Hospitalización)	29	2016-12-16 18:46:00.991513	2016-12-16 18:46:00.991513	1
62	Lavado de manos (Aux. Hospitalización)	29	2016-12-16 18:46:00.995722	2016-12-16 18:46:00.995722	1
63	Baño del paciente (Aux. Hospitalización)	29	2016-12-16 18:46:01.000103	2016-12-16 18:46:01.000103	1
64	Arreglo de cama (Aux. Hospitalización)	29	2016-12-16 18:46:01.004101	2016-12-16 18:46:01.004101	1
65	Admón. de medicamentos (Aux. Hospitalización)	29	2016-12-16 18:46:01.008398	2016-12-16 18:46:01.008398	1
66	Curación (Aux. Hospitalización)	29	2016-12-16 18:46:01.012615	2016-12-16 18:46:01.012615	1
67	Registros (Notas de enfermería  registros en el sistema) (Aux. Hospitalización)	29	2016-12-16 18:46:01.016733	2016-12-16 18:46:01.016733	1
68	Retira venopuncion y manilla de identificación (Aux. Hospitalización)	29	2016-12-16 18:46:01.021189	2016-12-16 18:46:01.021189	1
69	Asignar una cama de acuerdo a la patología  de acuerdo a la identidad (Hospitalización Administrativos)	30	2016-12-16 18:46:01.025299	2016-12-16 18:46:01.025299	1
70	Solicitud interconsulta (Hospitalización Administrativos)	30	2016-12-16 18:46:01.029324	2016-12-16 18:46:01.029324	1
71	Certificados y constancia de hospitalización (Hospitalización Administrativos)	30	2016-12-16 18:46:01.033262	2016-12-16 18:46:01.033262	1
72	Registro de asignación de cama  (Hospitalización Administrativos)	30	2016-12-16 18:46:01.03726	2016-12-16 18:46:01.03726	1
73	Pacientes Cuidado en casa  (Hospitalización Administrativos)	30	2016-12-16 18:46:01.041587	2016-12-16 18:46:01.041587	1
74	Organiza y folear la historia clínica paciente al egreso del servicio (Hospitalización Administrativos)	30	2016-12-16 18:46:01.045661	2016-12-16 18:46:01.045661	1
75	Asignación de cama (UCI-UCIN)	31	2016-12-16 18:46:01.050119	2016-12-16 18:46:01.050119	1
76	Apoyo (UCI-UCIN)	31	2016-12-16 18:46:01.054347	2016-12-16 18:46:01.054347	1
77	Constante Valoración (JEFES UCI-UCIN)	32	2016-12-16 18:46:01.058551	2016-12-16 18:46:01.058551	1
78	Solicitud y Administración de medicamentos (JEFES UCI-UCIN)	32	2016-12-16 18:46:01.062749	2016-12-16 18:46:01.062749	1
79	Toma de exámenes (JEFES UCI-UCIN)	32	2016-12-16 18:46:01.066956	2016-12-16 18:46:01.066956	1
80	Limpiezas y curaciones (JEFES UCI-UCIN)	32	2016-12-16 18:46:01.071083	2016-12-16 18:46:01.071083	1
81	Registro clínicos  ( Notas de enfermería registros ) (JEFES UCI-UCIN)	32	2016-12-16 18:46:01.075123	2016-12-16 18:46:01.075123	1
82	Arreglo de habitación ( cambio sabana y baño paciente ) (JEFES UCI-UCIN)	32	2016-12-16 18:46:01.079008	2016-12-16 18:46:01.079008	1
83	Monitoria invasiva (JEFES UCI-UCIN)	32	2016-12-16 18:46:01.083521	2016-12-16 18:46:01.083521	1
84	Registros (JEFES UCI-UCIN)	32	2016-12-16 18:46:01.087652	2016-12-16 18:46:01.087652	1
85	Solicitud de dietas  (JEFES UCI-UCIN)	32	2016-12-16 18:46:01.091634	2016-12-16 18:46:01.091634	1
86	Protocolo de traslado (JEFES UCI-UCIN)	32	2016-12-16 18:46:01.095746	2016-12-16 18:46:01.095746	1
87	Consentimiento (JEFES UCI-UCIN)	32	2016-12-16 18:46:01.099753	2016-12-16 18:46:01.099753	1
88	Historia clínica (JEFES UCI-UCIN)	32	2016-12-16 18:46:01.103894	2016-12-16 18:46:01.103894	1
89	Recepción pacientes (Auxiliares UCI-UCIN)	33	2016-12-16 18:46:01.107858	2016-12-16 18:46:01.107858	1
90	Valoración (Auxiliares UCI-UCIN)	33	2016-12-16 18:46:01.111736	2016-12-16 18:46:01.111736	1
91	Análisis  historia  clínica (Auxiliares UCI-UCIN)	33	2016-12-16 18:46:01.115741	2016-12-16 18:46:01.115741	1
92	Registros en el sistema ( Notas de enfermería registros ) (Auxiliares UCI-UCIN)	33	2016-12-16 18:46:01.119923	2016-12-16 18:46:01.119923	1
93	Solicitud y Admón. medicamentos (Auxiliares UCI-UCIN)	33	2016-12-16 18:46:01.123906	2016-12-16 18:46:01.123906	1
94	Retiro de dispositivos médicos  (Auxiliares UCI-UCIN)	33	2016-12-16 18:46:01.12779	2016-12-16 18:46:01.12779	1
95	Arreglo de habitación ( cambio sabana y baño paciente ) (Auxiliares UCI-UCIN)	33	2016-12-16 18:46:01.132094	2016-12-16 18:46:01.132094	1
96	Monitoria invasiva (Auxiliares UCI-UCIN)	33	2016-12-16 18:46:01.136185	2016-12-16 18:46:01.136185	1
97	Cuidado de higiene y control (Auxiliares UCI-UCIN)	33	2016-12-16 18:46:01.140701	2016-12-16 18:46:01.140701	1
98	Solicitud de dietas  (Auxiliares UCI-UCIN)	33	2016-12-16 18:46:01.145096	2016-12-16 18:46:01.145096	1
99	Informar evolución (Auxiliares UCI-UCIN)	33	2016-12-16 18:46:01.14999	2016-12-16 18:46:01.14999	1
100	Plan egreso (Auxiliares UCI-UCIN)	33	2016-12-16 18:46:01.153767	2016-12-16 18:46:01.153767	1
101	Recepción pacientes  (Medico UCI-UCIN)	34	2016-12-16 18:46:01.158289	2016-12-16 18:46:01.158289	1
102	Valoración (Medico UCI-UCIN)	34	2016-12-16 18:46:01.16354	2016-12-16 18:46:01.16354	1
103	Análisis  historia  clínica (Medico UCI-UCIN)	34	2016-12-16 18:46:01.167676	2016-12-16 18:46:01.167676	1
104	Registro historia clínica (Medico UCI-UCIN)	34	2016-12-16 18:46:01.171758	2016-12-16 18:46:01.171758	1
105	Constante Valoración (Medico UCI-UCIN)	34	2016-12-16 18:46:01.176201	2016-12-16 18:46:01.176201	1
106	Procedimientos (Medico UCI-UCIN)	34	2016-12-16 18:46:01.180326	2016-12-16 18:46:01.180326	1
107	Revista médica  (Medico UCI-UCIN)	34	2016-12-16 18:46:01.184573	2016-12-16 18:46:01.184573	1
108	Informar evolución (Medico UCI-UCIN)	34	2016-12-16 18:46:01.188682	2016-12-16 18:46:01.188682	1
109	Consentimiento (Medico UCI-UCIN)	34	2016-12-16 18:46:01.19275	2016-12-16 18:46:01.19275	1
110	Egreso (Medico UCI-UCIN)	34	2016-12-16 18:46:01.19671	2016-12-16 18:46:01.19671	1
111	Evaluación (Fisioterapeuta UCI-UCIN)	35	2016-12-16 18:46:01.200995	2016-12-16 18:46:01.200995	1
112	Procedimiento (Fisioterapeuta UCI-UCIN)	35	2016-12-16 18:46:01.20536	2016-12-16 18:46:01.20536	1
113	Seguimiento (Fisioterapeuta UCI-UCIN)	35	2016-12-16 18:46:01.209761	2016-12-16 18:46:01.209761	1
114	Registros (Fisioterapeuta UCI-UCIN)	35	2016-12-16 18:46:01.213871	2016-12-16 18:46:01.213871	1
115	Certificados de estancia  (Administrativo UCI-UCIN)	36	2016-12-16 18:46:01.218689	2016-12-16 18:46:01.218689	1
116	Supervisar cumplimiento de normas de bioseguridad ( Angiografía preparación)	37	2016-12-16 18:46:01.222738	2016-12-16 18:46:01.222738	1
117	Solicitud cama ( Angiografía preparación)	37	2016-12-16 18:46:01.226893	2016-12-16 18:46:01.226893	1
118	Apoyo procedimientos ( Angiografía preparación)	37	2016-12-16 18:46:01.230829	2016-12-16 18:46:01.230829	1
119	Atender solicitudes ( Angiografía preparación)	37	2016-12-16 18:46:01.23468	2016-12-16 18:46:01.23468	1
120	Admisión procedimiento ( Angiografía preparación)	37	2016-12-16 18:46:01.23857	2016-12-16 18:46:01.23857	1
121	Confirmación de procedimientos ( Angiografía preparación)	37	2016-12-16 18:46:01.242811	2016-12-16 18:46:01.242811	1
122	Asignación de citas procedimiento ( Angiografía preparación)	37	2016-12-16 18:46:01.246886	2016-12-16 18:46:01.246886	1
123	Preparar sala (Técnicos Angiografía)	38	2016-12-16 18:46:01.2534	2016-12-16 18:46:01.2534	1
124	Asistir al especialista (Técnicos Angiografía)	38	2016-12-16 18:46:01.257568	2016-12-16 18:46:01.257568	1
125	Verificar plan procedimiento (Circulantes Angiografía)	39	2016-12-16 18:46:01.261897	2016-12-16 18:46:01.261897	1
126	Asistir al especialista (Circulantes Angiografía)	39	2016-12-16 18:46:01.267438	2016-12-16 18:46:01.267438	1
127	Ingreso de los pacientes (Recuperación Angiografía)	40	2016-12-16 18:46:01.271644	2016-12-16 18:46:01.271644	1
128	Consentimiento (Recuperación Angiografía)	40	2016-12-16 18:46:01.275659	2016-12-16 18:46:01.275659	1
129	Verificación (Recuperación Angiografía)	40	2016-12-16 18:46:01.279964	2016-12-16 18:46:01.279964	1
130	Recuperación ambulatorio (Recuperación Angiografía)	40	2016-12-16 18:46:01.284084	2016-12-16 18:46:01.284084	1
131	Pacientes piso (Recuperación Angiografía)	40	2016-12-16 18:46:01.288209	2016-12-16 18:46:01.288209	1
132	Egreso (Recuperación Angiografía)	40	2016-12-16 18:46:01.292222	2016-12-16 18:46:01.292222	1
133	Arreglo de la unidad  (Recuperación Angiografía por auxiliar)	41	2016-12-16 18:46:01.296718	2016-12-16 18:46:01.296718	1
134	Ingreso paciente piso  (Recuperación Angiografía por auxiliar)	41	2016-12-16 18:46:01.30099	2016-12-16 18:46:01.30099	1
135	Preparar paciente ambulatorio  (Recuperación Angiografía por auxiliar)	41	2016-12-16 18:46:01.305399	2016-12-16 18:46:01.305399	1
136	Registros  (Recuperación Angiografía por auxiliar)	41	2016-12-16 18:46:01.309492	2016-12-16 18:46:01.309492	1
137	Entregar al paciente  (Recuperación Angiografía por auxiliar)	41	2016-12-16 18:46:01.313646	2016-12-16 18:46:01.313646	1
138	Recepción de pacientes de sala  (Recuperación Angiografía por auxiliar)	41	2016-12-16 18:46:01.317902	2016-12-16 18:46:01.317902	1
139	Signos vitales  (Recuperación Angiografía por auxiliar)	41	2016-12-16 18:46:01.322123	2016-12-16 18:46:01.322123	1
140	Retiro del introductor  (Recuperación Angiografía por auxiliar)	41	2016-12-16 18:46:01.326836	2016-12-16 18:46:01.326836	1
141	Recuperación pacientes PISO  (Recuperación Angiografía por auxiliar)	41	2016-12-16 18:46:01.331241	2016-12-16 18:46:01.331241	1
142	Recuperación pacientes ( egreso ambulatorio )  (Recuperación Angiografía por auxiliar)	41	2016-12-16 18:46:01.335637	2016-12-16 18:46:01.335637	1
143	Traslado de pacientes  (Recuperación Angiografía por auxiliar)	41	2016-12-16 18:46:01.340175	2016-12-16 18:46:01.340175	1
144	Egreso  (Recuperación Angiografía por auxiliar)	41	2016-12-16 18:46:01.344478	2016-12-16 18:46:01.344478	1
145	Atención a usuarios (Imágenes Diagnosticas) 	42	2016-12-16 18:46:01.348461	2016-12-16 18:46:01.348461	1
146	Citas médicas  (Imágenes Diagnosticas) 	43	2016-12-16 18:46:01.352564	2016-12-16 18:46:01.352564	1
147	Ingreso administrativo recepción (Imágenes Diagnosticas) 	43	2016-12-16 18:46:01.356578	2016-12-16 18:46:01.356578	1
148	Ingreso eco por auxiliar (Imágenes Diagnosticas) 	43	2016-12-16 18:46:01.360621	2016-12-16 18:46:01.360621	1
149	Ingreso por enfermera a escan (Imágenes Diagnosticas) 	43	2016-12-16 18:46:01.364719	2016-12-16 18:46:01.364719	1
150	Preparación pacientes escan (Imágenes Diagnosticas) 	43	2016-12-16 18:46:01.368745	2016-12-16 18:46:01.368745	1
151	Apoyo a auxiliares enfermeras (Imágenes Diagnosticas) 	43	2016-12-16 18:46:01.372731	2016-12-16 18:46:01.372731	1
152	Escenografía	44	2016-12-16 18:46:01.376818	2016-12-16 18:46:01.376818	1
153	Rx	44	2016-12-16 18:46:01.380714	2016-12-16 18:46:01.380714	1
154	Mamografía	44	2016-12-16 18:46:01.38469	2016-12-16 18:46:01.38469	1
155	Densitometría	44	2016-12-16 18:46:01.388646	2016-12-16 18:46:01.388646	1
156	Fluoroscopia 	44	2016-12-16 18:46:01.392747	2016-12-16 18:46:01.392747	1
157	Doppler	44	2016-12-16 18:46:01.396717	2016-12-16 18:46:01.396717	1
158	Pletismógrafia	44	2016-12-16 18:46:01.400684	2016-12-16 18:46:01.400684	1
159	Ecografía	44	2016-12-16 18:46:01.404951	2016-12-16 18:46:01.404951	1
160	Biopsia	44	2016-12-16 18:46:01.408889	2016-12-16 18:46:01.408889	1
161	Transcripción de Escenografías	46	2016-12-16 18:46:01.413034	2016-12-16 18:46:01.413034	1
162	Transcripción de Rx	46	2016-12-16 18:46:01.416872	2016-12-16 18:46:01.416872	1
163	Transcripción de Mamografías	46	2016-12-16 18:46:01.420891	2016-12-16 18:46:01.420891	1
164	Transcripción de Densitometrías	46	2016-12-16 18:46:01.425246	2016-12-16 18:46:01.425246	1
165	Transcripción de  Fluoroscopias	46	2016-12-16 18:46:01.429239	2016-12-16 18:46:01.429239	1
166	Transcripción de Doppler	46	2016-12-16 18:46:01.433276	2016-12-16 18:46:01.433276	1
167	Transcripción de Pletismógrafias	46	2016-12-16 18:46:01.437195	2016-12-16 18:46:01.437195	1
168	Transcripción de Ecografías	46	2016-12-16 18:46:01.441364	2016-12-16 18:46:01.441364	1
169	Transcripción de Biopsias	46	2016-12-16 18:46:01.445337	2016-12-16 18:46:01.445337	1
170	Entrega de Ecografías	46	2016-12-16 18:46:01.449473	2016-12-16 18:46:01.449473	1
171	Atención usuarios (Resonancia)	48	2016-12-16 18:46:01.453606	2016-12-16 18:46:01.453606	1
172	Recepción paciente ( Ingreso administrativo) (Resonancia)	49	2016-12-16 18:46:01.457887	2016-12-16 18:46:01.457887	1
173	Ingreso por auxiliar (Resonancia)	49	2016-12-16 18:46:01.462266	2016-12-16 18:46:01.462266	1
174	Validar Documentos (T) (Resonancia)	49	2016-12-16 18:46:01.466595	2016-12-16 18:46:01.466595	1
175	Ingreso al Resonador (Resonancia)	50	2016-12-16 18:46:01.47189	2016-12-16 18:46:01.47189	1
176	Toma de examen(Resonancia)	50	2016-12-16 18:46:01.477791	2016-12-16 18:46:01.477791	1
177	Toma de examen con anestesia (Resonancia)	50	2016-12-16 18:46:01.481881	2016-12-16 18:46:01.481881	1
178	Fin de examen (Resonancia)	51	2016-12-16 18:46:01.486232	2016-12-16 18:46:01.486232	1
179	Entrega de documentos al paciente  (Resonancia)	55	2016-12-16 18:46:01.490613	2016-12-16 18:46:01.490613	1
180	Transcripción (Resonancia)	55	2016-12-16 18:46:01.494681	2016-12-16 18:46:01.494681	1
181	Recepción Angiografía  (Esterilización)	60	2016-12-16 18:46:01.498638	2016-12-16 18:46:01.498638	1
182	seguimiento cirugía (Esterilización Instrumental)	60	2016-12-16 18:46:01.502623	2016-12-16 18:46:01.502623	1
183	Lavado instrumental Cirugía (Esterilización)	61	2016-12-16 18:46:01.507013	2016-12-16 18:46:01.507013	1
184	Lavado Angiografía (Esterilización)	61	2016-12-16 18:46:01.510985	2016-12-16 18:46:01.510985	1
185	Secado instrumental Cirugía (Esterilización)	62	2016-12-16 18:46:01.51516	2016-12-16 18:46:01.51516	1
186	Secado Angiografía (Esterilización)	62	2016-12-16 18:46:01.527196	2016-12-16 18:46:01.527196	1
187	Recepción dispositivos (Esterilización)	65	2016-12-16 18:46:01.531739	2016-12-16 18:46:01.531739	1
188	Alistamiento instrumental por una cirugía (Esterilización)	65	2016-12-16 18:46:01.536366	2016-12-16 18:46:01.536366	1
189	Registro errores de dispensación (Servicios farmacéuticos)	69	2016-12-16 18:46:01.540589	2016-12-16 18:46:01.540589	1
190	Alistamiento de carro de procedimiento  (Servicios farmacéuticos)	70	2016-12-16 18:46:01.544799	2016-12-16 18:46:01.544799	1
191	Seguimiento a la cirugía (Servicios farmacéuticos)	70	2016-12-16 18:46:01.548928	2016-12-16 18:46:01.548928	1
192	Cuentas de COF (Servicios farmacéuticos)	70	2016-12-16 18:46:01.554156	2016-12-16 18:46:01.554156	1
193	Cuentas de DIME (Servicios farmacéuticos)	70	2016-12-16 18:46:01.558589	2016-12-16 18:46:01.558589	1
194	Aprobar los insumos que colocan en enfermería por paciente. (Servicios farmacéuticos Angiografía)	72	2016-12-16 18:46:01.562678	2016-12-16 18:46:01.562678	1
195	Alistar por paciente los insumos de pre inducción. (Servicios farmacéuticos Angiografía)	72	2016-12-16 18:46:01.566701	2016-12-16 18:46:01.566701	1
196	Informes angiografía	104	2016-12-16 18:46:01.571484	2016-12-16 18:46:01.571484	1
197	Entrega resultados ( Pacientes de Cardiología )	8	2016-12-16 18:46:01.575626	2016-12-16 18:46:01.575626	1
\.


--
-- Name: activities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('activities_id_seq', 197, true);


--
-- Data for Name: activity_by_products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY activity_by_products (id, activity_id, product_id, created_at, updated_at) FROM stdin;
1	116	304	2016-12-16 18:46:03.276402	2016-12-16 18:46:03.276402
2	119	304	2016-12-16 18:46:03.281395	2016-12-16 18:46:03.281395
3	120	304	2016-12-16 18:46:03.285589	2016-12-16 18:46:03.285589
4	121	304	2016-12-16 18:46:03.289948	2016-12-16 18:46:03.289948
5	122	304	2016-12-16 18:46:03.293784	2016-12-16 18:46:03.293784
6	123	304	2016-12-16 18:46:03.299484	2016-12-16 18:46:03.299484
7	124	304	2016-12-16 18:46:03.306335	2016-12-16 18:46:03.306335
8	125	304	2016-12-16 18:46:03.310198	2016-12-16 18:46:03.310198
9	126	304	2016-12-16 18:46:03.314188	2016-12-16 18:46:03.314188
10	127	304	2016-12-16 18:46:03.318409	2016-12-16 18:46:03.318409
11	128	304	2016-12-16 18:46:03.323231	2016-12-16 18:46:03.323231
12	129	304	2016-12-16 18:46:03.328665	2016-12-16 18:46:03.328665
13	130	304	2016-12-16 18:46:03.33577	2016-12-16 18:46:03.33577
14	132	304	2016-12-16 18:46:03.339821	2016-12-16 18:46:03.339821
15	133	304	2016-12-16 18:46:03.344925	2016-12-16 18:46:03.344925
16	135	304	2016-12-16 18:46:03.349116	2016-12-16 18:46:03.349116
17	136	304	2016-12-16 18:46:03.353448	2016-12-16 18:46:03.353448
18	137	304	2016-12-16 18:46:03.357875	2016-12-16 18:46:03.357875
19	138	304	2016-12-16 18:46:03.362431	2016-12-16 18:46:03.362431
20	139	304	2016-12-16 18:46:03.366627	2016-12-16 18:46:03.366627
21	142	304	2016-12-16 18:46:03.370859	2016-12-16 18:46:03.370859
22	143	304	2016-12-16 18:46:03.374935	2016-12-16 18:46:03.374935
23	144	304	2016-12-16 18:46:03.379377	2016-12-16 18:46:03.379377
24	181	304	2016-12-16 18:46:03.383585	2016-12-16 18:46:03.383585
25	184	304	2016-12-16 18:46:03.387805	2016-12-16 18:46:03.387805
26	186	304	2016-12-16 18:46:03.391666	2016-12-16 18:46:03.391666
27	194	304	2016-12-16 18:46:03.395715	2016-12-16 18:46:03.395715
28	195	304	2016-12-16 18:46:03.399705	2016-12-16 18:46:03.399705
29	196	304	2016-12-16 18:46:03.403764	2016-12-16 18:46:03.403764
30	140	304	2016-12-16 18:46:03.408041	2016-12-16 18:46:03.408041
31	116	303	2016-12-16 18:46:03.412522	2016-12-16 18:46:03.412522
32	119	303	2016-12-16 18:46:03.416662	2016-12-16 18:46:03.416662
33	120	303	2016-12-16 18:46:03.42095	2016-12-16 18:46:03.42095
34	121	303	2016-12-16 18:46:03.424925	2016-12-16 18:46:03.424925
35	122	303	2016-12-16 18:46:03.42909	2016-12-16 18:46:03.42909
36	123	303	2016-12-16 18:46:03.437768	2016-12-16 18:46:03.437768
37	124	303	2016-12-16 18:46:03.443104	2016-12-16 18:46:03.443104
38	125	303	2016-12-16 18:46:03.447412	2016-12-16 18:46:03.447412
39	126	303	2016-12-16 18:46:03.45181	2016-12-16 18:46:03.45181
40	127	303	2016-12-16 18:46:03.455979	2016-12-16 18:46:03.455979
41	128	303	2016-12-16 18:46:03.459995	2016-12-16 18:46:03.459995
42	129	303	2016-12-16 18:46:03.464367	2016-12-16 18:46:03.464367
43	130	303	2016-12-16 18:46:03.469	2016-12-16 18:46:03.469
44	132	303	2016-12-16 18:46:03.47309	2016-12-16 18:46:03.47309
45	133	303	2016-12-16 18:46:03.477473	2016-12-16 18:46:03.477473
46	135	303	2016-12-16 18:46:03.481862	2016-12-16 18:46:03.481862
47	136	303	2016-12-16 18:46:03.485863	2016-12-16 18:46:03.485863
48	137	303	2016-12-16 18:46:03.490187	2016-12-16 18:46:03.490187
49	138	303	2016-12-16 18:46:03.495273	2016-12-16 18:46:03.495273
50	139	303	2016-12-16 18:46:03.49988	2016-12-16 18:46:03.49988
51	142	303	2016-12-16 18:46:03.50413	2016-12-16 18:46:03.50413
52	143	303	2016-12-16 18:46:03.509141	2016-12-16 18:46:03.509141
53	144	303	2016-12-16 18:46:03.513744	2016-12-16 18:46:03.513744
54	181	303	2016-12-16 18:46:03.517874	2016-12-16 18:46:03.517874
55	184	303	2016-12-16 18:46:03.522056	2016-12-16 18:46:03.522056
56	186	303	2016-12-16 18:46:03.526336	2016-12-16 18:46:03.526336
57	194	303	2016-12-16 18:46:03.530965	2016-12-16 18:46:03.530965
58	195	303	2016-12-16 18:46:03.536828	2016-12-16 18:46:03.536828
59	196	303	2016-12-16 18:46:03.54095	2016-12-16 18:46:03.54095
60	140	303	2016-12-16 18:46:03.545752	2016-12-16 18:46:03.545752
61	116	305	2016-12-16 18:46:03.55052	2016-12-16 18:46:03.55052
62	119	305	2016-12-16 18:46:03.554756	2016-12-16 18:46:03.554756
63	120	305	2016-12-16 18:46:03.558886	2016-12-16 18:46:03.558886
64	121	305	2016-12-16 18:46:03.562935	2016-12-16 18:46:03.562935
65	122	305	2016-12-16 18:46:03.566823	2016-12-16 18:46:03.566823
66	123	305	2016-12-16 18:46:03.570796	2016-12-16 18:46:03.570796
67	124	305	2016-12-16 18:46:03.575232	2016-12-16 18:46:03.575232
68	125	305	2016-12-16 18:46:03.579753	2016-12-16 18:46:03.579753
69	126	305	2016-12-16 18:46:03.584397	2016-12-16 18:46:03.584397
70	127	305	2016-12-16 18:46:03.592173	2016-12-16 18:46:03.592173
71	128	305	2016-12-16 18:46:03.59693	2016-12-16 18:46:03.59693
72	129	305	2016-12-16 18:46:03.601038	2016-12-16 18:46:03.601038
73	130	305	2016-12-16 18:46:03.605139	2016-12-16 18:46:03.605139
74	132	305	2016-12-16 18:46:03.609235	2016-12-16 18:46:03.609235
75	133	305	2016-12-16 18:46:03.613542	2016-12-16 18:46:03.613542
76	135	305	2016-12-16 18:46:03.618674	2016-12-16 18:46:03.618674
77	136	305	2016-12-16 18:46:03.622784	2016-12-16 18:46:03.622784
78	137	305	2016-12-16 18:46:03.626984	2016-12-16 18:46:03.626984
79	138	305	2016-12-16 18:46:03.630951	2016-12-16 18:46:03.630951
80	139	305	2016-12-16 18:46:03.637671	2016-12-16 18:46:03.637671
81	142	305	2016-12-16 18:46:03.641844	2016-12-16 18:46:03.641844
82	143	305	2016-12-16 18:46:03.645846	2016-12-16 18:46:03.645846
83	144	305	2016-12-16 18:46:03.649777	2016-12-16 18:46:03.649777
84	181	305	2016-12-16 18:46:03.653849	2016-12-16 18:46:03.653849
85	184	305	2016-12-16 18:46:03.657914	2016-12-16 18:46:03.657914
86	186	305	2016-12-16 18:46:03.661841	2016-12-16 18:46:03.661841
87	194	305	2016-12-16 18:46:03.666486	2016-12-16 18:46:03.666486
88	195	305	2016-12-16 18:46:03.671729	2016-12-16 18:46:03.671729
89	196	305	2016-12-16 18:46:03.675756	2016-12-16 18:46:03.675756
90	140	305	2016-12-16 18:46:03.679766	2016-12-16 18:46:03.679766
91	116	306	2016-12-16 18:46:03.684364	2016-12-16 18:46:03.684364
92	119	306	2016-12-16 18:46:03.688455	2016-12-16 18:46:03.688455
93	120	306	2016-12-16 18:46:03.692851	2016-12-16 18:46:03.692851
94	121	306	2016-12-16 18:46:03.697812	2016-12-16 18:46:03.697812
95	122	306	2016-12-16 18:46:03.701867	2016-12-16 18:46:03.701867
96	123	306	2016-12-16 18:46:03.70592	2016-12-16 18:46:03.70592
97	124	306	2016-12-16 18:46:03.709946	2016-12-16 18:46:03.709946
98	125	306	2016-12-16 18:46:03.714156	2016-12-16 18:46:03.714156
99	126	306	2016-12-16 18:46:03.71836	2016-12-16 18:46:03.71836
100	127	306	2016-12-16 18:46:03.722394	2016-12-16 18:46:03.722394
101	128	306	2016-12-16 18:46:03.727223	2016-12-16 18:46:03.727223
102	129	306	2016-12-16 18:46:03.731147	2016-12-16 18:46:03.731147
103	130	306	2016-12-16 18:46:03.734968	2016-12-16 18:46:03.734968
104	132	306	2016-12-16 18:46:03.739901	2016-12-16 18:46:03.739901
105	133	306	2016-12-16 18:46:03.743933	2016-12-16 18:46:03.743933
106	135	306	2016-12-16 18:46:03.748542	2016-12-16 18:46:03.748542
107	136	306	2016-12-16 18:46:03.752744	2016-12-16 18:46:03.752744
108	137	306	2016-12-16 18:46:03.757577	2016-12-16 18:46:03.757577
109	138	306	2016-12-16 18:46:03.761783	2016-12-16 18:46:03.761783
110	139	306	2016-12-16 18:46:03.765744	2016-12-16 18:46:03.765744
111	142	306	2016-12-16 18:46:03.769832	2016-12-16 18:46:03.769832
112	143	306	2016-12-16 18:46:03.773909	2016-12-16 18:46:03.773909
113	144	306	2016-12-16 18:46:03.777884	2016-12-16 18:46:03.777884
114	181	306	2016-12-16 18:46:03.781695	2016-12-16 18:46:03.781695
115	184	306	2016-12-16 18:46:03.785668	2016-12-16 18:46:03.785668
116	186	306	2016-12-16 18:46:03.789698	2016-12-16 18:46:03.789698
117	194	306	2016-12-16 18:46:03.794749	2016-12-16 18:46:03.794749
118	195	306	2016-12-16 18:46:03.799455	2016-12-16 18:46:03.799455
119	196	306	2016-12-16 18:46:03.803899	2016-12-16 18:46:03.803899
120	140	306	2016-12-16 18:46:03.808554	2016-12-16 18:46:03.808554
121	116	307	2016-12-16 18:46:03.812703	2016-12-16 18:46:03.812703
122	119	307	2016-12-16 18:46:03.817673	2016-12-16 18:46:03.817673
123	120	307	2016-12-16 18:46:03.8218	2016-12-16 18:46:03.8218
124	121	307	2016-12-16 18:46:03.825946	2016-12-16 18:46:03.825946
125	122	307	2016-12-16 18:46:03.83092	2016-12-16 18:46:03.83092
126	123	307	2016-12-16 18:46:03.834842	2016-12-16 18:46:03.834842
127	124	307	2016-12-16 18:46:03.839269	2016-12-16 18:46:03.839269
128	125	307	2016-12-16 18:46:03.843608	2016-12-16 18:46:03.843608
129	126	307	2016-12-16 18:46:03.847651	2016-12-16 18:46:03.847651
130	127	307	2016-12-16 18:46:03.85207	2016-12-16 18:46:03.85207
131	128	307	2016-12-16 18:46:03.856102	2016-12-16 18:46:03.856102
132	129	307	2016-12-16 18:46:03.861358	2016-12-16 18:46:03.861358
133	130	307	2016-12-16 18:46:03.866355	2016-12-16 18:46:03.866355
134	132	307	2016-12-16 18:46:03.870546	2016-12-16 18:46:03.870546
135	133	307	2016-12-16 18:46:03.87581	2016-12-16 18:46:03.87581
136	135	307	2016-12-16 18:46:03.880143	2016-12-16 18:46:03.880143
137	136	307	2016-12-16 18:46:03.884759	2016-12-16 18:46:03.884759
138	137	307	2016-12-16 18:46:03.88909	2016-12-16 18:46:03.88909
139	138	307	2016-12-16 18:46:03.893117	2016-12-16 18:46:03.893117
140	139	307	2016-12-16 18:46:03.897354	2016-12-16 18:46:03.897354
141	142	307	2016-12-16 18:46:03.901792	2016-12-16 18:46:03.901792
142	143	307	2016-12-16 18:46:03.905761	2016-12-16 18:46:03.905761
143	144	307	2016-12-16 18:46:03.909728	2016-12-16 18:46:03.909728
144	181	307	2016-12-16 18:46:03.913805	2016-12-16 18:46:03.913805
145	184	307	2016-12-16 18:46:03.917998	2016-12-16 18:46:03.917998
146	186	307	2016-12-16 18:46:03.922288	2016-12-16 18:46:03.922288
147	194	307	2016-12-16 18:46:03.926816	2016-12-16 18:46:03.926816
148	195	307	2016-12-16 18:46:03.931101	2016-12-16 18:46:03.931101
149	196	307	2016-12-16 18:46:03.936388	2016-12-16 18:46:03.936388
150	140	307	2016-12-16 18:46:03.941792	2016-12-16 18:46:03.941792
151	116	341	2016-12-16 18:46:03.9459	2016-12-16 18:46:03.9459
152	119	341	2016-12-16 18:46:03.949898	2016-12-16 18:46:03.949898
153	120	341	2016-12-16 18:46:03.954311	2016-12-16 18:46:03.954311
154	121	341	2016-12-16 18:46:03.959357	2016-12-16 18:46:03.959357
155	122	341	2016-12-16 18:46:03.964237	2016-12-16 18:46:03.964237
156	123	341	2016-12-16 18:46:03.968552	2016-12-16 18:46:03.968552
157	124	341	2016-12-16 18:46:03.973117	2016-12-16 18:46:03.973117
158	125	341	2016-12-16 18:46:03.977331	2016-12-16 18:46:03.977331
159	126	341	2016-12-16 18:46:03.981897	2016-12-16 18:46:03.981897
160	127	341	2016-12-16 18:46:03.986293	2016-12-16 18:46:03.986293
161	128	341	2016-12-16 18:46:03.990285	2016-12-16 18:46:03.990285
162	129	341	2016-12-16 18:46:03.994314	2016-12-16 18:46:03.994314
163	130	341	2016-12-16 18:46:03.998463	2016-12-16 18:46:03.998463
164	132	341	2016-12-16 18:46:04.003557	2016-12-16 18:46:04.003557
165	133	341	2016-12-16 18:46:04.008747	2016-12-16 18:46:04.008747
166	135	341	2016-12-16 18:46:04.012801	2016-12-16 18:46:04.012801
167	136	341	2016-12-16 18:46:04.018322	2016-12-16 18:46:04.018322
168	137	341	2016-12-16 18:46:04.023437	2016-12-16 18:46:04.023437
169	138	341	2016-12-16 18:46:04.02762	2016-12-16 18:46:04.02762
170	139	341	2016-12-16 18:46:04.034952	2016-12-16 18:46:04.034952
171	142	341	2016-12-16 18:46:04.03919	2016-12-16 18:46:04.03919
172	143	341	2016-12-16 18:46:04.043118	2016-12-16 18:46:04.043118
173	144	341	2016-12-16 18:46:04.047662	2016-12-16 18:46:04.047662
174	181	341	2016-12-16 18:46:04.051916	2016-12-16 18:46:04.051916
175	184	341	2016-12-16 18:46:04.057364	2016-12-16 18:46:04.057364
176	186	341	2016-12-16 18:46:04.061848	2016-12-16 18:46:04.061848
177	194	341	2016-12-16 18:46:04.065972	2016-12-16 18:46:04.065972
178	195	341	2016-12-16 18:46:04.070316	2016-12-16 18:46:04.070316
179	196	341	2016-12-16 18:46:04.074385	2016-12-16 18:46:04.074385
180	140	341	2016-12-16 18:46:04.07858	2016-12-16 18:46:04.07858
181	116	342	2016-12-16 18:46:04.082797	2016-12-16 18:46:04.082797
182	119	342	2016-12-16 18:46:04.087537	2016-12-16 18:46:04.087537
183	120	342	2016-12-16 18:46:04.091886	2016-12-16 18:46:04.091886
184	121	342	2016-12-16 18:46:04.095921	2016-12-16 18:46:04.095921
185	122	342	2016-12-16 18:46:04.10037	2016-12-16 18:46:04.10037
186	123	342	2016-12-16 18:46:04.104451	2016-12-16 18:46:04.104451
187	124	342	2016-12-16 18:46:04.109065	2016-12-16 18:46:04.109065
188	125	342	2016-12-16 18:46:04.113216	2016-12-16 18:46:04.113216
189	126	342	2016-12-16 18:46:04.117292	2016-12-16 18:46:04.117292
190	127	342	2016-12-16 18:46:04.121545	2016-12-16 18:46:04.121545
191	128	342	2016-12-16 18:46:04.127371	2016-12-16 18:46:04.127371
192	129	342	2016-12-16 18:46:04.131788	2016-12-16 18:46:04.131788
193	130	342	2016-12-16 18:46:04.136039	2016-12-16 18:46:04.136039
194	132	342	2016-12-16 18:46:04.140033	2016-12-16 18:46:04.140033
195	133	342	2016-12-16 18:46:04.143948	2016-12-16 18:46:04.143948
196	135	342	2016-12-16 18:46:04.148	2016-12-16 18:46:04.148
197	136	342	2016-12-16 18:46:04.152003	2016-12-16 18:46:04.152003
198	137	342	2016-12-16 18:46:04.156048	2016-12-16 18:46:04.156048
199	138	342	2016-12-16 18:46:04.160588	2016-12-16 18:46:04.160588
200	139	342	2016-12-16 18:46:04.164819	2016-12-16 18:46:04.164819
201	142	342	2016-12-16 18:46:04.168854	2016-12-16 18:46:04.168854
202	143	342	2016-12-16 18:46:04.172891	2016-12-16 18:46:04.172891
203	144	342	2016-12-16 18:46:04.177797	2016-12-16 18:46:04.177797
204	181	342	2016-12-16 18:46:04.182084	2016-12-16 18:46:04.182084
205	184	342	2016-12-16 18:46:04.186206	2016-12-16 18:46:04.186206
206	186	342	2016-12-16 18:46:04.190048	2016-12-16 18:46:04.190048
207	194	342	2016-12-16 18:46:04.193984	2016-12-16 18:46:04.193984
208	195	342	2016-12-16 18:46:04.198444	2016-12-16 18:46:04.198444
209	196	342	2016-12-16 18:46:04.202789	2016-12-16 18:46:04.202789
210	140	342	2016-12-16 18:46:04.206654	2016-12-16 18:46:04.206654
211	116	343	2016-12-16 18:46:04.210621	2016-12-16 18:46:04.210621
212	119	343	2016-12-16 18:46:04.214702	2016-12-16 18:46:04.214702
213	120	343	2016-12-16 18:46:04.218732	2016-12-16 18:46:04.218732
214	121	343	2016-12-16 18:46:04.224012	2016-12-16 18:46:04.224012
215	122	343	2016-12-16 18:46:04.227922	2016-12-16 18:46:04.227922
216	123	343	2016-12-16 18:46:04.232008	2016-12-16 18:46:04.232008
217	124	343	2016-12-16 18:46:04.235978	2016-12-16 18:46:04.235978
218	125	343	2016-12-16 18:46:04.239756	2016-12-16 18:46:04.239756
219	126	343	2016-12-16 18:46:04.243649	2016-12-16 18:46:04.243649
220	127	343	2016-12-16 18:46:04.247628	2016-12-16 18:46:04.247628
221	128	343	2016-12-16 18:46:04.251581	2016-12-16 18:46:04.251581
222	129	343	2016-12-16 18:46:04.256334	2016-12-16 18:46:04.256334
223	130	343	2016-12-16 18:46:04.262394	2016-12-16 18:46:04.262394
224	132	343	2016-12-16 18:46:04.266515	2016-12-16 18:46:04.266515
225	133	343	2016-12-16 18:46:04.270791	2016-12-16 18:46:04.270791
226	135	343	2016-12-16 18:46:04.274752	2016-12-16 18:46:04.274752
227	136	343	2016-12-16 18:46:04.279486	2016-12-16 18:46:04.279486
228	137	343	2016-12-16 18:46:04.284799	2016-12-16 18:46:04.284799
229	138	343	2016-12-16 18:46:04.288739	2016-12-16 18:46:04.288739
230	139	343	2016-12-16 18:46:04.292827	2016-12-16 18:46:04.292827
231	142	343	2016-12-16 18:46:04.296851	2016-12-16 18:46:04.296851
232	143	343	2016-12-16 18:46:04.301321	2016-12-16 18:46:04.301321
233	144	343	2016-12-16 18:46:04.306046	2016-12-16 18:46:04.306046
234	181	343	2016-12-16 18:46:04.310624	2016-12-16 18:46:04.310624
235	184	343	2016-12-16 18:46:04.31576	2016-12-16 18:46:04.31576
236	186	343	2016-12-16 18:46:04.320424	2016-12-16 18:46:04.320424
237	194	343	2016-12-16 18:46:04.32442	2016-12-16 18:46:04.32442
238	195	343	2016-12-16 18:46:04.330263	2016-12-16 18:46:04.330263
239	196	343	2016-12-16 18:46:04.334574	2016-12-16 18:46:04.334574
240	140	343	2016-12-16 18:46:04.340322	2016-12-16 18:46:04.340322
241	116	344	2016-12-16 18:46:04.344869	2016-12-16 18:46:04.344869
242	119	344	2016-12-16 18:46:04.349679	2016-12-16 18:46:04.349679
243	120	344	2016-12-16 18:46:04.353897	2016-12-16 18:46:04.353897
244	121	344	2016-12-16 18:46:04.35821	2016-12-16 18:46:04.35821
245	122	344	2016-12-16 18:46:04.363268	2016-12-16 18:46:04.363268
246	123	344	2016-12-16 18:46:04.367608	2016-12-16 18:46:04.367608
247	124	344	2016-12-16 18:46:04.371757	2016-12-16 18:46:04.371757
248	125	344	2016-12-16 18:46:04.376108	2016-12-16 18:46:04.376108
249	126	344	2016-12-16 18:46:04.380147	2016-12-16 18:46:04.380147
250	127	344	2016-12-16 18:46:04.38411	2016-12-16 18:46:04.38411
251	128	344	2016-12-16 18:46:04.388179	2016-12-16 18:46:04.388179
252	129	344	2016-12-16 18:46:04.393013	2016-12-16 18:46:04.393013
253	130	344	2016-12-16 18:46:04.397634	2016-12-16 18:46:04.397634
254	132	344	2016-12-16 18:46:04.402108	2016-12-16 18:46:04.402108
255	133	344	2016-12-16 18:46:04.406073	2016-12-16 18:46:04.406073
256	135	344	2016-12-16 18:46:04.409859	2016-12-16 18:46:04.409859
257	136	344	2016-12-16 18:46:04.4148	2016-12-16 18:46:04.4148
258	137	344	2016-12-16 18:46:04.419214	2016-12-16 18:46:04.419214
259	138	344	2016-12-16 18:46:04.423268	2016-12-16 18:46:04.423268
260	139	344	2016-12-16 18:46:04.427589	2016-12-16 18:46:04.427589
261	142	344	2016-12-16 18:46:04.432153	2016-12-16 18:46:04.432153
262	143	344	2016-12-16 18:46:04.437819	2016-12-16 18:46:04.437819
263	144	344	2016-12-16 18:46:04.442347	2016-12-16 18:46:04.442347
264	181	344	2016-12-16 18:46:04.446532	2016-12-16 18:46:04.446532
265	184	344	2016-12-16 18:46:04.452356	2016-12-16 18:46:04.452356
266	186	344	2016-12-16 18:46:04.457315	2016-12-16 18:46:04.457315
267	194	344	2016-12-16 18:46:04.461736	2016-12-16 18:46:04.461736
268	195	344	2016-12-16 18:46:04.465844	2016-12-16 18:46:04.465844
269	196	344	2016-12-16 18:46:04.470178	2016-12-16 18:46:04.470178
270	140	344	2016-12-16 18:46:04.474378	2016-12-16 18:46:04.474378
271	116	345	2016-12-16 18:46:04.47861	2016-12-16 18:46:04.47861
272	119	345	2016-12-16 18:46:04.482889	2016-12-16 18:46:04.482889
273	120	345	2016-12-16 18:46:04.486862	2016-12-16 18:46:04.486862
274	121	345	2016-12-16 18:46:04.492283	2016-12-16 18:46:04.492283
275	122	345	2016-12-16 18:46:04.496836	2016-12-16 18:46:04.496836
276	123	345	2016-12-16 18:46:04.500955	2016-12-16 18:46:04.500955
277	124	345	2016-12-16 18:46:04.505351	2016-12-16 18:46:04.505351
278	125	345	2016-12-16 18:46:04.510363	2016-12-16 18:46:04.510363
279	126	345	2016-12-16 18:46:04.515417	2016-12-16 18:46:04.515417
280	127	345	2016-12-16 18:46:04.520297	2016-12-16 18:46:04.520297
281	128	345	2016-12-16 18:46:04.524185	2016-12-16 18:46:04.524185
282	129	345	2016-12-16 18:46:04.529353	2016-12-16 18:46:04.529353
283	130	345	2016-12-16 18:46:04.533916	2016-12-16 18:46:04.533916
284	132	345	2016-12-16 18:46:04.538187	2016-12-16 18:46:04.538187
285	133	345	2016-12-16 18:46:04.542203	2016-12-16 18:46:04.542203
286	135	345	2016-12-16 18:46:04.547606	2016-12-16 18:46:04.547606
287	136	345	2016-12-16 18:46:04.552538	2016-12-16 18:46:04.552538
288	137	345	2016-12-16 18:46:04.556633	2016-12-16 18:46:04.556633
289	138	345	2016-12-16 18:46:04.560828	2016-12-16 18:46:04.560828
290	139	345	2016-12-16 18:46:04.565896	2016-12-16 18:46:04.565896
291	142	345	2016-12-16 18:46:04.569806	2016-12-16 18:46:04.569806
292	143	345	2016-12-16 18:46:04.574844	2016-12-16 18:46:04.574844
293	144	345	2016-12-16 18:46:04.579207	2016-12-16 18:46:04.579207
294	181	345	2016-12-16 18:46:04.583389	2016-12-16 18:46:04.583389
295	184	345	2016-12-16 18:46:04.589073	2016-12-16 18:46:04.589073
296	186	345	2016-12-16 18:46:04.593124	2016-12-16 18:46:04.593124
297	194	345	2016-12-16 18:46:04.596942	2016-12-16 18:46:04.596942
298	195	345	2016-12-16 18:46:04.601026	2016-12-16 18:46:04.601026
299	196	345	2016-12-16 18:46:04.605837	2016-12-16 18:46:04.605837
300	140	345	2016-12-16 18:46:04.610828	2016-12-16 18:46:04.610828
301	116	346	2016-12-16 18:46:04.615107	2016-12-16 18:46:04.615107
302	119	346	2016-12-16 18:46:04.619637	2016-12-16 18:46:04.619637
303	120	346	2016-12-16 18:46:04.623667	2016-12-16 18:46:04.623667
304	121	346	2016-12-16 18:46:04.628073	2016-12-16 18:46:04.628073
305	122	346	2016-12-16 18:46:04.63181	2016-12-16 18:46:04.63181
306	123	346	2016-12-16 18:46:04.636003	2016-12-16 18:46:04.636003
307	124	346	2016-12-16 18:46:04.640043	2016-12-16 18:46:04.640043
308	125	346	2016-12-16 18:46:04.644078	2016-12-16 18:46:04.644078
309	126	346	2016-12-16 18:46:04.648401	2016-12-16 18:46:04.648401
310	127	346	2016-12-16 18:46:04.652812	2016-12-16 18:46:04.652812
311	128	346	2016-12-16 18:46:04.656921	2016-12-16 18:46:04.656921
312	129	346	2016-12-16 18:46:04.660919	2016-12-16 18:46:04.660919
313	130	346	2016-12-16 18:46:04.664823	2016-12-16 18:46:04.664823
314	132	346	2016-12-16 18:46:04.668765	2016-12-16 18:46:04.668765
315	133	346	2016-12-16 18:46:04.672832	2016-12-16 18:46:04.672832
316	135	346	2016-12-16 18:46:04.677044	2016-12-16 18:46:04.677044
317	136	346	2016-12-16 18:46:04.681189	2016-12-16 18:46:04.681189
318	137	346	2016-12-16 18:46:04.685185	2016-12-16 18:46:04.685185
319	138	346	2016-12-16 18:46:04.689429	2016-12-16 18:46:04.689429
320	139	346	2016-12-16 18:46:04.693792	2016-12-16 18:46:04.693792
321	142	346	2016-12-16 18:46:04.69787	2016-12-16 18:46:04.69787
322	143	346	2016-12-16 18:46:04.701984	2016-12-16 18:46:04.701984
323	144	346	2016-12-16 18:46:04.70627	2016-12-16 18:46:04.70627
324	181	346	2016-12-16 18:46:04.710388	2016-12-16 18:46:04.710388
325	184	346	2016-12-16 18:46:04.718389	2016-12-16 18:46:04.718389
326	186	346	2016-12-16 18:46:04.729527	2016-12-16 18:46:04.729527
327	194	346	2016-12-16 18:46:04.733806	2016-12-16 18:46:04.733806
328	195	346	2016-12-16 18:46:04.738389	2016-12-16 18:46:04.738389
329	196	346	2016-12-16 18:46:04.742374	2016-12-16 18:46:04.742374
330	140	346	2016-12-16 18:46:04.748997	2016-12-16 18:46:04.748997
331	116	347	2016-12-16 18:46:04.753466	2016-12-16 18:46:04.753466
332	119	347	2016-12-16 18:46:04.757827	2016-12-16 18:46:04.757827
333	120	347	2016-12-16 18:46:04.762069	2016-12-16 18:46:04.762069
334	121	347	2016-12-16 18:46:04.767409	2016-12-16 18:46:04.767409
335	122	347	2016-12-16 18:46:04.773745	2016-12-16 18:46:04.773745
336	123	347	2016-12-16 18:46:04.778006	2016-12-16 18:46:04.778006
337	124	347	2016-12-16 18:46:04.782065	2016-12-16 18:46:04.782065
338	125	347	2016-12-16 18:46:04.786321	2016-12-16 18:46:04.786321
339	126	347	2016-12-16 18:46:04.791591	2016-12-16 18:46:04.791591
340	127	347	2016-12-16 18:46:04.796166	2016-12-16 18:46:04.796166
341	128	347	2016-12-16 18:46:04.800201	2016-12-16 18:46:04.800201
342	129	347	2016-12-16 18:46:04.804047	2016-12-16 18:46:04.804047
343	130	347	2016-12-16 18:46:04.807891	2016-12-16 18:46:04.807891
344	132	347	2016-12-16 18:46:04.813312	2016-12-16 18:46:04.813312
345	133	347	2016-12-16 18:46:04.81745	2016-12-16 18:46:04.81745
346	135	347	2016-12-16 18:46:04.821643	2016-12-16 18:46:04.821643
347	136	347	2016-12-16 18:46:04.825901	2016-12-16 18:46:04.825901
348	137	347	2016-12-16 18:46:04.829983	2016-12-16 18:46:04.829983
349	138	347	2016-12-16 18:46:04.834017	2016-12-16 18:46:04.834017
350	139	347	2016-12-16 18:46:04.838112	2016-12-16 18:46:04.838112
351	142	347	2016-12-16 18:46:04.842037	2016-12-16 18:46:04.842037
352	143	347	2016-12-16 18:46:04.846364	2016-12-16 18:46:04.846364
353	144	347	2016-12-16 18:46:04.850434	2016-12-16 18:46:04.850434
354	181	347	2016-12-16 18:46:04.854696	2016-12-16 18:46:04.854696
355	184	347	2016-12-16 18:46:04.858975	2016-12-16 18:46:04.858975
356	186	347	2016-12-16 18:46:04.863034	2016-12-16 18:46:04.863034
357	194	347	2016-12-16 18:46:04.867083	2016-12-16 18:46:04.867083
358	195	347	2016-12-16 18:46:04.871118	2016-12-16 18:46:04.871118
359	196	347	2016-12-16 18:46:04.875021	2016-12-16 18:46:04.875021
360	140	347	2016-12-16 18:46:04.879126	2016-12-16 18:46:04.879126
361	116	348	2016-12-16 18:46:04.88315	2016-12-16 18:46:04.88315
362	119	348	2016-12-16 18:46:04.887016	2016-12-16 18:46:04.887016
363	120	348	2016-12-16 18:46:04.890935	2016-12-16 18:46:04.890935
364	121	348	2016-12-16 18:46:04.894953	2016-12-16 18:46:04.894953
365	122	348	2016-12-16 18:46:04.898904	2016-12-16 18:46:04.898904
366	123	348	2016-12-16 18:46:04.902894	2016-12-16 18:46:04.902894
367	124	348	2016-12-16 18:46:04.906943	2016-12-16 18:46:04.906943
368	125	348	2016-12-16 18:46:04.911295	2016-12-16 18:46:04.911295
369	126	348	2016-12-16 18:46:04.915112	2016-12-16 18:46:04.915112
370	127	348	2016-12-16 18:46:04.919	2016-12-16 18:46:04.919
371	128	348	2016-12-16 18:46:04.923054	2016-12-16 18:46:04.923054
372	129	348	2016-12-16 18:46:04.926953	2016-12-16 18:46:04.926953
373	130	348	2016-12-16 18:46:04.93091	2016-12-16 18:46:04.93091
374	132	348	2016-12-16 18:46:04.935148	2016-12-16 18:46:04.935148
375	133	348	2016-12-16 18:46:04.93901	2016-12-16 18:46:04.93901
376	135	348	2016-12-16 18:46:04.943514	2016-12-16 18:46:04.943514
377	136	348	2016-12-16 18:46:04.947855	2016-12-16 18:46:04.947855
378	137	348	2016-12-16 18:46:04.952317	2016-12-16 18:46:04.952317
379	138	348	2016-12-16 18:46:04.956751	2016-12-16 18:46:04.956751
380	139	348	2016-12-16 18:46:04.960899	2016-12-16 18:46:04.960899
381	142	348	2016-12-16 18:46:04.96503	2016-12-16 18:46:04.96503
382	143	348	2016-12-16 18:46:04.969277	2016-12-16 18:46:04.969277
383	144	348	2016-12-16 18:46:04.973389	2016-12-16 18:46:04.973389
384	181	348	2016-12-16 18:46:04.977509	2016-12-16 18:46:04.977509
385	184	348	2016-12-16 18:46:04.981944	2016-12-16 18:46:04.981944
386	186	348	2016-12-16 18:46:04.985881	2016-12-16 18:46:04.985881
387	194	348	2016-12-16 18:46:04.989746	2016-12-16 18:46:04.989746
388	195	348	2016-12-16 18:46:04.993714	2016-12-16 18:46:04.993714
389	196	348	2016-12-16 18:46:04.997621	2016-12-16 18:46:04.997621
390	140	348	2016-12-16 18:46:05.001556	2016-12-16 18:46:05.001556
391	116	349	2016-12-16 18:46:05.005814	2016-12-16 18:46:05.005814
392	119	349	2016-12-16 18:46:05.009996	2016-12-16 18:46:05.009996
393	120	349	2016-12-16 18:46:05.014206	2016-12-16 18:46:05.014206
394	121	349	2016-12-16 18:46:05.01988	2016-12-16 18:46:05.01988
395	122	349	2016-12-16 18:46:05.023953	2016-12-16 18:46:05.023953
396	123	349	2016-12-16 18:46:05.037123	2016-12-16 18:46:05.037123
397	124	349	2016-12-16 18:46:05.041402	2016-12-16 18:46:05.041402
398	125	349	2016-12-16 18:46:05.045691	2016-12-16 18:46:05.045691
399	126	349	2016-12-16 18:46:05.050431	2016-12-16 18:46:05.050431
400	127	349	2016-12-16 18:46:05.054608	2016-12-16 18:46:05.054608
401	128	349	2016-12-16 18:46:05.058974	2016-12-16 18:46:05.058974
402	129	349	2016-12-16 18:46:05.063759	2016-12-16 18:46:05.063759
403	130	349	2016-12-16 18:46:05.069417	2016-12-16 18:46:05.069417
404	132	349	2016-12-16 18:46:05.073613	2016-12-16 18:46:05.073613
405	133	349	2016-12-16 18:46:05.077988	2016-12-16 18:46:05.077988
406	135	349	2016-12-16 18:46:05.082072	2016-12-16 18:46:05.082072
407	136	349	2016-12-16 18:46:05.086392	2016-12-16 18:46:05.086392
408	137	349	2016-12-16 18:46:05.092152	2016-12-16 18:46:05.092152
409	138	349	2016-12-16 18:46:05.097431	2016-12-16 18:46:05.097431
410	139	349	2016-12-16 18:46:05.101755	2016-12-16 18:46:05.101755
411	142	349	2016-12-16 18:46:05.106956	2016-12-16 18:46:05.106956
412	143	349	2016-12-16 18:46:05.112554	2016-12-16 18:46:05.112554
413	144	349	2016-12-16 18:46:05.117408	2016-12-16 18:46:05.117408
414	181	349	2016-12-16 18:46:05.121891	2016-12-16 18:46:05.121891
415	184	349	2016-12-16 18:46:05.126624	2016-12-16 18:46:05.126624
416	186	349	2016-12-16 18:46:05.131177	2016-12-16 18:46:05.131177
417	194	349	2016-12-16 18:46:05.135946	2016-12-16 18:46:05.135946
418	195	349	2016-12-16 18:46:05.140195	2016-12-16 18:46:05.140195
419	196	349	2016-12-16 18:46:05.145119	2016-12-16 18:46:05.145119
420	140	349	2016-12-16 18:46:05.149331	2016-12-16 18:46:05.149331
421	116	350	2016-12-16 18:46:05.153937	2016-12-16 18:46:05.153937
422	119	350	2016-12-16 18:46:05.159469	2016-12-16 18:46:05.159469
423	120	350	2016-12-16 18:46:05.164579	2016-12-16 18:46:05.164579
424	121	350	2016-12-16 18:46:05.170016	2016-12-16 18:46:05.170016
425	122	350	2016-12-16 18:46:05.174594	2016-12-16 18:46:05.174594
426	123	350	2016-12-16 18:46:05.179166	2016-12-16 18:46:05.179166
427	124	350	2016-12-16 18:46:05.18343	2016-12-16 18:46:05.18343
428	125	350	2016-12-16 18:46:05.187729	2016-12-16 18:46:05.187729
429	126	350	2016-12-16 18:46:05.191883	2016-12-16 18:46:05.191883
430	127	350	2016-12-16 18:46:05.196426	2016-12-16 18:46:05.196426
431	128	350	2016-12-16 18:46:05.200625	2016-12-16 18:46:05.200625
432	129	350	2016-12-16 18:46:05.20462	2016-12-16 18:46:05.20462
433	130	350	2016-12-16 18:46:05.209014	2016-12-16 18:46:05.209014
434	132	350	2016-12-16 18:46:05.213433	2016-12-16 18:46:05.213433
435	133	350	2016-12-16 18:46:05.217749	2016-12-16 18:46:05.217749
436	135	350	2016-12-16 18:46:05.22201	2016-12-16 18:46:05.22201
437	136	350	2016-12-16 18:46:05.226408	2016-12-16 18:46:05.226408
438	137	350	2016-12-16 18:46:05.230472	2016-12-16 18:46:05.230472
439	138	350	2016-12-16 18:46:05.235153	2016-12-16 18:46:05.235153
440	139	350	2016-12-16 18:46:05.239452	2016-12-16 18:46:05.239452
441	142	350	2016-12-16 18:46:05.243787	2016-12-16 18:46:05.243787
442	143	350	2016-12-16 18:46:05.248572	2016-12-16 18:46:05.248572
443	144	350	2016-12-16 18:46:05.253449	2016-12-16 18:46:05.253449
444	181	350	2016-12-16 18:46:05.262053	2016-12-16 18:46:05.262053
445	184	350	2016-12-16 18:46:05.266446	2016-12-16 18:46:05.266446
446	186	350	2016-12-16 18:46:05.270623	2016-12-16 18:46:05.270623
447	194	350	2016-12-16 18:46:05.2749	2016-12-16 18:46:05.2749
448	195	350	2016-12-16 18:46:05.279152	2016-12-16 18:46:05.279152
449	196	350	2016-12-16 18:46:05.283457	2016-12-16 18:46:05.283457
450	140	350	2016-12-16 18:46:05.287489	2016-12-16 18:46:05.287489
451	116	351	2016-12-16 18:46:05.291643	2016-12-16 18:46:05.291643
452	119	351	2016-12-16 18:46:05.29552	2016-12-16 18:46:05.29552
453	120	351	2016-12-16 18:46:05.29959	2016-12-16 18:46:05.29959
454	121	351	2016-12-16 18:46:05.303704	2016-12-16 18:46:05.303704
455	122	351	2016-12-16 18:46:05.308117	2016-12-16 18:46:05.308117
456	123	351	2016-12-16 18:46:05.312611	2016-12-16 18:46:05.312611
457	124	351	2016-12-16 18:46:05.3167	2016-12-16 18:46:05.3167
458	125	351	2016-12-16 18:46:05.320805	2016-12-16 18:46:05.320805
459	126	351	2016-12-16 18:46:05.325532	2016-12-16 18:46:05.325532
460	127	351	2016-12-16 18:46:05.329581	2016-12-16 18:46:05.329581
461	128	351	2016-12-16 18:46:05.333552	2016-12-16 18:46:05.333552
462	129	351	2016-12-16 18:46:05.33756	2016-12-16 18:46:05.33756
463	130	351	2016-12-16 18:46:05.341927	2016-12-16 18:46:05.341927
464	132	351	2016-12-16 18:46:05.346649	2016-12-16 18:46:05.346649
465	133	351	2016-12-16 18:46:05.352166	2016-12-16 18:46:05.352166
466	135	351	2016-12-16 18:46:05.356474	2016-12-16 18:46:05.356474
467	136	351	2016-12-16 18:46:05.361505	2016-12-16 18:46:05.361505
468	137	351	2016-12-16 18:46:05.365955	2016-12-16 18:46:05.365955
469	138	351	2016-12-16 18:46:05.370249	2016-12-16 18:46:05.370249
470	139	351	2016-12-16 18:46:05.375509	2016-12-16 18:46:05.375509
471	142	351	2016-12-16 18:46:05.380474	2016-12-16 18:46:05.380474
472	143	351	2016-12-16 18:46:05.385128	2016-12-16 18:46:05.385128
473	144	351	2016-12-16 18:46:05.389465	2016-12-16 18:46:05.389465
474	181	351	2016-12-16 18:46:05.393466	2016-12-16 18:46:05.393466
475	184	351	2016-12-16 18:46:05.397994	2016-12-16 18:46:05.397994
476	186	351	2016-12-16 18:46:05.403274	2016-12-16 18:46:05.403274
477	194	351	2016-12-16 18:46:05.408207	2016-12-16 18:46:05.408207
478	195	351	2016-12-16 18:46:05.412311	2016-12-16 18:46:05.412311
479	196	351	2016-12-16 18:46:05.4164	2016-12-16 18:46:05.4164
480	140	351	2016-12-16 18:46:05.42101	2016-12-16 18:46:05.42101
481	116	352	2016-12-16 18:46:05.424884	2016-12-16 18:46:05.424884
482	119	352	2016-12-16 18:46:05.42903	2016-12-16 18:46:05.42903
483	120	352	2016-12-16 18:46:05.433397	2016-12-16 18:46:05.433397
484	121	352	2016-12-16 18:46:05.43782	2016-12-16 18:46:05.43782
485	122	352	2016-12-16 18:46:05.442099	2016-12-16 18:46:05.442099
486	123	352	2016-12-16 18:46:05.446313	2016-12-16 18:46:05.446313
487	124	352	2016-12-16 18:46:05.45249	2016-12-16 18:46:05.45249
488	125	352	2016-12-16 18:46:05.45711	2016-12-16 18:46:05.45711
489	126	352	2016-12-16 18:46:05.46149	2016-12-16 18:46:05.46149
490	127	352	2016-12-16 18:46:05.466007	2016-12-16 18:46:05.466007
491	128	352	2016-12-16 18:46:05.470456	2016-12-16 18:46:05.470456
492	129	352	2016-12-16 18:46:05.476139	2016-12-16 18:46:05.476139
493	130	352	2016-12-16 18:46:05.480432	2016-12-16 18:46:05.480432
494	132	352	2016-12-16 18:46:05.484729	2016-12-16 18:46:05.484729
495	133	352	2016-12-16 18:46:05.489436	2016-12-16 18:46:05.489436
496	135	352	2016-12-16 18:46:05.493471	2016-12-16 18:46:05.493471
497	136	352	2016-12-16 18:46:05.497622	2016-12-16 18:46:05.497622
498	137	352	2016-12-16 18:46:05.501976	2016-12-16 18:46:05.501976
499	138	352	2016-12-16 18:46:05.50637	2016-12-16 18:46:05.50637
500	139	352	2016-12-16 18:46:05.511499	2016-12-16 18:46:05.511499
501	142	352	2016-12-16 18:46:05.515833	2016-12-16 18:46:05.515833
502	143	352	2016-12-16 18:46:05.520393	2016-12-16 18:46:05.520393
503	144	352	2016-12-16 18:46:05.526319	2016-12-16 18:46:05.526319
504	181	352	2016-12-16 18:46:05.531091	2016-12-16 18:46:05.531091
505	184	352	2016-12-16 18:46:05.537247	2016-12-16 18:46:05.537247
506	186	352	2016-12-16 18:46:05.541652	2016-12-16 18:46:05.541652
507	194	352	2016-12-16 18:46:05.545767	2016-12-16 18:46:05.545767
508	195	352	2016-12-16 18:46:05.550488	2016-12-16 18:46:05.550488
509	196	352	2016-12-16 18:46:05.554527	2016-12-16 18:46:05.554527
510	140	352	2016-12-16 18:46:05.558559	2016-12-16 18:46:05.558559
511	116	353	2016-12-16 18:46:05.563468	2016-12-16 18:46:05.563468
512	119	353	2016-12-16 18:46:05.567549	2016-12-16 18:46:05.567549
513	120	353	2016-12-16 18:46:05.571971	2016-12-16 18:46:05.571971
514	121	353	2016-12-16 18:46:05.577485	2016-12-16 18:46:05.577485
515	122	353	2016-12-16 18:46:05.581659	2016-12-16 18:46:05.581659
516	123	353	2016-12-16 18:46:05.585746	2016-12-16 18:46:05.585746
517	124	353	2016-12-16 18:46:05.589653	2016-12-16 18:46:05.589653
518	125	353	2016-12-16 18:46:05.593953	2016-12-16 18:46:05.593953
519	126	353	2016-12-16 18:46:05.598487	2016-12-16 18:46:05.598487
520	127	353	2016-12-16 18:46:05.602516	2016-12-16 18:46:05.602516
521	128	353	2016-12-16 18:46:05.607069	2016-12-16 18:46:05.607069
522	129	353	2016-12-16 18:46:05.611544	2016-12-16 18:46:05.611544
523	130	353	2016-12-16 18:46:05.616029	2016-12-16 18:46:05.616029
524	132	353	2016-12-16 18:46:05.620131	2016-12-16 18:46:05.620131
525	133	353	2016-12-16 18:46:05.624499	2016-12-16 18:46:05.624499
526	135	353	2016-12-16 18:46:05.628527	2016-12-16 18:46:05.628527
527	136	353	2016-12-16 18:46:05.632828	2016-12-16 18:46:05.632828
528	137	353	2016-12-16 18:46:05.637178	2016-12-16 18:46:05.637178
529	138	353	2016-12-16 18:46:05.641466	2016-12-16 18:46:05.641466
530	139	353	2016-12-16 18:46:05.645978	2016-12-16 18:46:05.645978
531	142	353	2016-12-16 18:46:05.649937	2016-12-16 18:46:05.649937
532	143	353	2016-12-16 18:46:05.654043	2016-12-16 18:46:05.654043
533	144	353	2016-12-16 18:46:05.660241	2016-12-16 18:46:05.660241
534	181	353	2016-12-16 18:46:05.664925	2016-12-16 18:46:05.664925
535	184	353	2016-12-16 18:46:05.66899	2016-12-16 18:46:05.66899
536	186	353	2016-12-16 18:46:05.673476	2016-12-16 18:46:05.673476
537	194	353	2016-12-16 18:46:05.677815	2016-12-16 18:46:05.677815
538	195	353	2016-12-16 18:46:05.682373	2016-12-16 18:46:05.682373
539	196	353	2016-12-16 18:46:05.687528	2016-12-16 18:46:05.687528
540	140	353	2016-12-16 18:46:05.691936	2016-12-16 18:46:05.691936
541	116	354	2016-12-16 18:46:05.696452	2016-12-16 18:46:05.696452
542	119	354	2016-12-16 18:46:05.700645	2016-12-16 18:46:05.700645
543	120	354	2016-12-16 18:46:05.704845	2016-12-16 18:46:05.704845
544	121	354	2016-12-16 18:46:05.710529	2016-12-16 18:46:05.710529
545	122	354	2016-12-16 18:46:05.715005	2016-12-16 18:46:05.715005
546	123	354	2016-12-16 18:46:05.720235	2016-12-16 18:46:05.720235
547	124	354	2016-12-16 18:46:05.725132	2016-12-16 18:46:05.725132
548	125	354	2016-12-16 18:46:05.729547	2016-12-16 18:46:05.729547
549	126	354	2016-12-16 18:46:05.733809	2016-12-16 18:46:05.733809
550	127	354	2016-12-16 18:46:05.738256	2016-12-16 18:46:05.738256
551	128	354	2016-12-16 18:46:05.742445	2016-12-16 18:46:05.742445
552	129	354	2016-12-16 18:46:05.748539	2016-12-16 18:46:05.748539
553	130	354	2016-12-16 18:46:05.753042	2016-12-16 18:46:05.753042
554	132	354	2016-12-16 18:46:05.757934	2016-12-16 18:46:05.757934
555	133	354	2016-12-16 18:46:05.762637	2016-12-16 18:46:05.762637
556	135	354	2016-12-16 18:46:05.768092	2016-12-16 18:46:05.768092
557	136	354	2016-12-16 18:46:05.772414	2016-12-16 18:46:05.772414
558	137	354	2016-12-16 18:46:05.776579	2016-12-16 18:46:05.776579
559	138	354	2016-12-16 18:46:05.780536	2016-12-16 18:46:05.780536
560	139	354	2016-12-16 18:46:05.784563	2016-12-16 18:46:05.784563
561	142	354	2016-12-16 18:46:05.789526	2016-12-16 18:46:05.789526
562	143	354	2016-12-16 18:46:05.794515	2016-12-16 18:46:05.794515
563	144	354	2016-12-16 18:46:05.798749	2016-12-16 18:46:05.798749
564	181	354	2016-12-16 18:46:05.803432	2016-12-16 18:46:05.803432
565	184	354	2016-12-16 18:46:05.807555	2016-12-16 18:46:05.807555
566	186	354	2016-12-16 18:46:05.812229	2016-12-16 18:46:05.812229
567	194	354	2016-12-16 18:46:05.818516	2016-12-16 18:46:05.818516
568	195	354	2016-12-16 18:46:05.822953	2016-12-16 18:46:05.822953
569	196	354	2016-12-16 18:46:05.828148	2016-12-16 18:46:05.828148
570	140	354	2016-12-16 18:46:05.833527	2016-12-16 18:46:05.833527
571	116	355	2016-12-16 18:46:05.837703	2016-12-16 18:46:05.837703
572	119	355	2016-12-16 18:46:05.84182	2016-12-16 18:46:05.84182
573	120	355	2016-12-16 18:46:05.84616	2016-12-16 18:46:05.84616
574	121	355	2016-12-16 18:46:05.850488	2016-12-16 18:46:05.850488
575	122	355	2016-12-16 18:46:05.855733	2016-12-16 18:46:05.855733
576	123	355	2016-12-16 18:46:05.85977	2016-12-16 18:46:05.85977
577	124	355	2016-12-16 18:46:05.864656	2016-12-16 18:46:05.864656
578	125	355	2016-12-16 18:46:05.869323	2016-12-16 18:46:05.869323
579	126	355	2016-12-16 18:46:05.87335	2016-12-16 18:46:05.87335
580	127	355	2016-12-16 18:46:05.877435	2016-12-16 18:46:05.877435
581	128	355	2016-12-16 18:46:05.881366	2016-12-16 18:46:05.881366
582	129	355	2016-12-16 18:46:05.885364	2016-12-16 18:46:05.885364
583	130	355	2016-12-16 18:46:05.88933	2016-12-16 18:46:05.88933
584	132	355	2016-12-16 18:46:05.893353	2016-12-16 18:46:05.893353
585	133	355	2016-12-16 18:46:05.897343	2016-12-16 18:46:05.897343
586	135	355	2016-12-16 18:46:05.901851	2016-12-16 18:46:05.901851
587	136	355	2016-12-16 18:46:05.907018	2016-12-16 18:46:05.907018
588	137	355	2016-12-16 18:46:05.912523	2016-12-16 18:46:05.912523
589	138	355	2016-12-16 18:46:05.916623	2016-12-16 18:46:05.916623
590	139	355	2016-12-16 18:46:05.920846	2016-12-16 18:46:05.920846
591	142	355	2016-12-16 18:46:05.925838	2016-12-16 18:46:05.925838
592	143	355	2016-12-16 18:46:05.929705	2016-12-16 18:46:05.929705
593	144	355	2016-12-16 18:46:05.933616	2016-12-16 18:46:05.933616
594	181	355	2016-12-16 18:46:05.937834	2016-12-16 18:46:05.937834
595	184	355	2016-12-16 18:46:05.941982	2016-12-16 18:46:05.941982
596	186	355	2016-12-16 18:46:05.946747	2016-12-16 18:46:05.946747
597	194	355	2016-12-16 18:46:05.95208	2016-12-16 18:46:05.95208
598	195	355	2016-12-16 18:46:05.957567	2016-12-16 18:46:05.957567
599	196	355	2016-12-16 18:46:05.962483	2016-12-16 18:46:05.962483
600	140	355	2016-12-16 18:46:05.966679	2016-12-16 18:46:05.966679
601	116	356	2016-12-16 18:46:05.970821	2016-12-16 18:46:05.970821
602	119	356	2016-12-16 18:46:05.975048	2016-12-16 18:46:05.975048
603	120	356	2016-12-16 18:46:05.979325	2016-12-16 18:46:05.979325
604	121	356	2016-12-16 18:46:05.983544	2016-12-16 18:46:05.983544
605	122	356	2016-12-16 18:46:05.988012	2016-12-16 18:46:05.988012
606	123	356	2016-12-16 18:46:05.992485	2016-12-16 18:46:05.992485
607	124	356	2016-12-16 18:46:05.996462	2016-12-16 18:46:05.996462
608	125	356	2016-12-16 18:46:06.000539	2016-12-16 18:46:06.000539
609	126	356	2016-12-16 18:46:06.004492	2016-12-16 18:46:06.004492
610	127	356	2016-12-16 18:46:06.008843	2016-12-16 18:46:06.008843
611	128	356	2016-12-16 18:46:06.013906	2016-12-16 18:46:06.013906
612	129	356	2016-12-16 18:46:06.018027	2016-12-16 18:46:06.018027
613	130	356	2016-12-16 18:46:06.023226	2016-12-16 18:46:06.023226
614	132	356	2016-12-16 18:46:06.027339	2016-12-16 18:46:06.027339
615	133	356	2016-12-16 18:46:06.031603	2016-12-16 18:46:06.031603
616	135	356	2016-12-16 18:46:06.036086	2016-12-16 18:46:06.036086
617	136	356	2016-12-16 18:46:06.040453	2016-12-16 18:46:06.040453
618	137	356	2016-12-16 18:46:06.044492	2016-12-16 18:46:06.044492
619	138	356	2016-12-16 18:46:06.049505	2016-12-16 18:46:06.049505
620	139	356	2016-12-16 18:46:06.053569	2016-12-16 18:46:06.053569
621	142	356	2016-12-16 18:46:06.058032	2016-12-16 18:46:06.058032
622	143	356	2016-12-16 18:46:06.062062	2016-12-16 18:46:06.062062
623	144	356	2016-12-16 18:46:06.067578	2016-12-16 18:46:06.067578
624	181	356	2016-12-16 18:46:06.071518	2016-12-16 18:46:06.071518
625	184	356	2016-12-16 18:46:06.075562	2016-12-16 18:46:06.075562
626	186	356	2016-12-16 18:46:06.079511	2016-12-16 18:46:06.079511
627	194	356	2016-12-16 18:46:06.084004	2016-12-16 18:46:06.084004
628	195	356	2016-12-16 18:46:06.088155	2016-12-16 18:46:06.088155
629	196	356	2016-12-16 18:46:06.092794	2016-12-16 18:46:06.092794
630	140	356	2016-12-16 18:46:06.096762	2016-12-16 18:46:06.096762
631	116	357	2016-12-16 18:46:06.10088	2016-12-16 18:46:06.10088
632	119	357	2016-12-16 18:46:06.106529	2016-12-16 18:46:06.106529
633	120	357	2016-12-16 18:46:06.110666	2016-12-16 18:46:06.110666
634	121	357	2016-12-16 18:46:06.115339	2016-12-16 18:46:06.115339
635	122	357	2016-12-16 18:46:06.119354	2016-12-16 18:46:06.119354
636	123	357	2016-12-16 18:46:06.123553	2016-12-16 18:46:06.123553
637	124	357	2016-12-16 18:46:06.128213	2016-12-16 18:46:06.128213
638	125	357	2016-12-16 18:46:06.133566	2016-12-16 18:46:06.133566
639	126	357	2016-12-16 18:46:06.138954	2016-12-16 18:46:06.138954
640	127	357	2016-12-16 18:46:06.143399	2016-12-16 18:46:06.143399
641	128	357	2016-12-16 18:46:06.14805	2016-12-16 18:46:06.14805
642	129	357	2016-12-16 18:46:06.152144	2016-12-16 18:46:06.152144
643	130	357	2016-12-16 18:46:06.156121	2016-12-16 18:46:06.156121
644	132	357	2016-12-16 18:46:06.160153	2016-12-16 18:46:06.160153
645	133	357	2016-12-16 18:46:06.16487	2016-12-16 18:46:06.16487
646	135	357	2016-12-16 18:46:06.168876	2016-12-16 18:46:06.168876
647	136	357	2016-12-16 18:46:06.173518	2016-12-16 18:46:06.173518
648	137	357	2016-12-16 18:46:06.177664	2016-12-16 18:46:06.177664
649	138	357	2016-12-16 18:46:06.18163	2016-12-16 18:46:06.18163
650	139	357	2016-12-16 18:46:06.186135	2016-12-16 18:46:06.186135
651	142	357	2016-12-16 18:46:06.19047	2016-12-16 18:46:06.19047
652	143	357	2016-12-16 18:46:06.194881	2016-12-16 18:46:06.194881
653	144	357	2016-12-16 18:46:06.199237	2016-12-16 18:46:06.199237
654	181	357	2016-12-16 18:46:06.203732	2016-12-16 18:46:06.203732
655	184	357	2016-12-16 18:46:06.212241	2016-12-16 18:46:06.212241
656	186	357	2016-12-16 18:46:06.216372	2016-12-16 18:46:06.216372
657	194	357	2016-12-16 18:46:06.220472	2016-12-16 18:46:06.220472
658	195	357	2016-12-16 18:46:06.224556	2016-12-16 18:46:06.224556
659	196	357	2016-12-16 18:46:06.228442	2016-12-16 18:46:06.228442
660	140	357	2016-12-16 18:46:06.232982	2016-12-16 18:46:06.232982
661	116	358	2016-12-16 18:46:06.237639	2016-12-16 18:46:06.237639
662	119	358	2016-12-16 18:46:06.242341	2016-12-16 18:46:06.242341
663	120	358	2016-12-16 18:46:06.246762	2016-12-16 18:46:06.246762
664	121	358	2016-12-16 18:46:06.250883	2016-12-16 18:46:06.250883
665	122	358	2016-12-16 18:46:06.254843	2016-12-16 18:46:06.254843
666	123	358	2016-12-16 18:46:06.259101	2016-12-16 18:46:06.259101
667	124	358	2016-12-16 18:46:06.263479	2016-12-16 18:46:06.263479
668	125	358	2016-12-16 18:46:06.267543	2016-12-16 18:46:06.267543
669	126	358	2016-12-16 18:46:06.271554	2016-12-16 18:46:06.271554
670	127	358	2016-12-16 18:46:06.27663	2016-12-16 18:46:06.27663
671	128	358	2016-12-16 18:46:06.281068	2016-12-16 18:46:06.281068
672	129	358	2016-12-16 18:46:06.287284	2016-12-16 18:46:06.287284
673	130	358	2016-12-16 18:46:06.291458	2016-12-16 18:46:06.291458
674	132	358	2016-12-16 18:46:06.296108	2016-12-16 18:46:06.296108
675	133	358	2016-12-16 18:46:06.3004	2016-12-16 18:46:06.3004
676	135	358	2016-12-16 18:46:06.304479	2016-12-16 18:46:06.304479
677	136	358	2016-12-16 18:46:06.308578	2016-12-16 18:46:06.308578
678	137	358	2016-12-16 18:46:06.312596	2016-12-16 18:46:06.312596
679	138	358	2016-12-16 18:46:06.317147	2016-12-16 18:46:06.317147
680	139	358	2016-12-16 18:46:06.321339	2016-12-16 18:46:06.321339
681	142	358	2016-12-16 18:46:06.32552	2016-12-16 18:46:06.32552
682	143	358	2016-12-16 18:46:06.330511	2016-12-16 18:46:06.330511
683	144	358	2016-12-16 18:46:06.334494	2016-12-16 18:46:06.334494
684	181	358	2016-12-16 18:46:06.338764	2016-12-16 18:46:06.338764
685	184	358	2016-12-16 18:46:06.343084	2016-12-16 18:46:06.343084
686	186	358	2016-12-16 18:46:06.347649	2016-12-16 18:46:06.347649
687	194	358	2016-12-16 18:46:06.352281	2016-12-16 18:46:06.352281
688	195	358	2016-12-16 18:46:06.356309	2016-12-16 18:46:06.356309
689	196	358	2016-12-16 18:46:06.360589	2016-12-16 18:46:06.360589
690	140	358	2016-12-16 18:46:06.365542	2016-12-16 18:46:06.365542
691	116	360	2016-12-16 18:46:06.370015	2016-12-16 18:46:06.370015
692	119	360	2016-12-16 18:46:06.375358	2016-12-16 18:46:06.375358
693	120	360	2016-12-16 18:46:06.379357	2016-12-16 18:46:06.379357
694	121	360	2016-12-16 18:46:06.383417	2016-12-16 18:46:06.383417
695	122	360	2016-12-16 18:46:06.387704	2016-12-16 18:46:06.387704
696	123	360	2016-12-16 18:46:06.392163	2016-12-16 18:46:06.392163
697	124	360	2016-12-16 18:46:06.396104	2016-12-16 18:46:06.396104
698	125	360	2016-12-16 18:46:06.400089	2016-12-16 18:46:06.400089
699	126	360	2016-12-16 18:46:06.404307	2016-12-16 18:46:06.404307
700	127	360	2016-12-16 18:46:06.408529	2016-12-16 18:46:06.408529
701	128	360	2016-12-16 18:46:06.412553	2016-12-16 18:46:06.412553
702	129	360	2016-12-16 18:46:06.417236	2016-12-16 18:46:06.417236
703	130	360	2016-12-16 18:46:06.421306	2016-12-16 18:46:06.421306
704	132	360	2016-12-16 18:46:06.426358	2016-12-16 18:46:06.426358
705	133	360	2016-12-16 18:46:06.430353	2016-12-16 18:46:06.430353
706	135	360	2016-12-16 18:46:06.435032	2016-12-16 18:46:06.435032
707	136	360	2016-12-16 18:46:06.440469	2016-12-16 18:46:06.440469
708	137	360	2016-12-16 18:46:06.445985	2016-12-16 18:46:06.445985
709	138	360	2016-12-16 18:46:06.450747	2016-12-16 18:46:06.450747
710	139	360	2016-12-16 18:46:06.455175	2016-12-16 18:46:06.455175
711	142	360	2016-12-16 18:46:06.459485	2016-12-16 18:46:06.459485
712	143	360	2016-12-16 18:46:06.463552	2016-12-16 18:46:06.463552
713	144	360	2016-12-16 18:46:06.467986	2016-12-16 18:46:06.467986
714	181	360	2016-12-16 18:46:06.471995	2016-12-16 18:46:06.471995
715	184	360	2016-12-16 18:46:06.476153	2016-12-16 18:46:06.476153
716	186	360	2016-12-16 18:46:06.481529	2016-12-16 18:46:06.481529
717	194	360	2016-12-16 18:46:06.485931	2016-12-16 18:46:06.485931
718	195	360	2016-12-16 18:46:06.490732	2016-12-16 18:46:06.490732
719	196	360	2016-12-16 18:46:06.494957	2016-12-16 18:46:06.494957
720	140	360	2016-12-16 18:46:06.498935	2016-12-16 18:46:06.498935
721	116	359	2016-12-16 18:46:06.503346	2016-12-16 18:46:06.503346
722	119	359	2016-12-16 18:46:06.508518	2016-12-16 18:46:06.508518
723	120	359	2016-12-16 18:46:06.513533	2016-12-16 18:46:06.513533
724	121	359	2016-12-16 18:46:06.517596	2016-12-16 18:46:06.517596
725	122	359	2016-12-16 18:46:06.521954	2016-12-16 18:46:06.521954
726	123	359	2016-12-16 18:46:06.526317	2016-12-16 18:46:06.526317
727	124	359	2016-12-16 18:46:06.530606	2016-12-16 18:46:06.530606
728	125	359	2016-12-16 18:46:06.536253	2016-12-16 18:46:06.536253
729	126	359	2016-12-16 18:46:06.540518	2016-12-16 18:46:06.540518
730	127	359	2016-12-16 18:46:06.544562	2016-12-16 18:46:06.544562
731	128	359	2016-12-16 18:46:06.548695	2016-12-16 18:46:06.548695
732	129	359	2016-12-16 18:46:06.55348	2016-12-16 18:46:06.55348
733	130	359	2016-12-16 18:46:06.557543	2016-12-16 18:46:06.557543
734	132	359	2016-12-16 18:46:06.562021	2016-12-16 18:46:06.562021
735	133	359	2016-12-16 18:46:06.566543	2016-12-16 18:46:06.566543
736	135	359	2016-12-16 18:46:06.570761	2016-12-16 18:46:06.570761
737	136	359	2016-12-16 18:46:06.575536	2016-12-16 18:46:06.575536
738	137	359	2016-12-16 18:46:06.579524	2016-12-16 18:46:06.579524
739	138	359	2016-12-16 18:46:06.583479	2016-12-16 18:46:06.583479
740	139	359	2016-12-16 18:46:06.587847	2016-12-16 18:46:06.587847
741	142	359	2016-12-16 18:46:06.5947	2016-12-16 18:46:06.5947
742	143	359	2016-12-16 18:46:06.599272	2016-12-16 18:46:06.599272
743	144	359	2016-12-16 18:46:06.603423	2016-12-16 18:46:06.603423
744	181	359	2016-12-16 18:46:06.607487	2016-12-16 18:46:06.607487
745	184	359	2016-12-16 18:46:06.611523	2016-12-16 18:46:06.611523
746	186	359	2016-12-16 18:46:06.616174	2016-12-16 18:46:06.616174
747	194	359	2016-12-16 18:46:06.620888	2016-12-16 18:46:06.620888
748	195	359	2016-12-16 18:46:06.625029	2016-12-16 18:46:06.625029
749	196	359	2016-12-16 18:46:06.628963	2016-12-16 18:46:06.628963
750	140	359	2016-12-16 18:46:06.632859	2016-12-16 18:46:06.632859
751	116	361	2016-12-16 18:46:06.637525	2016-12-16 18:46:06.637525
752	119	361	2016-12-16 18:46:06.642175	2016-12-16 18:46:06.642175
753	120	361	2016-12-16 18:46:06.647068	2016-12-16 18:46:06.647068
754	121	361	2016-12-16 18:46:06.654364	2016-12-16 18:46:06.654364
755	122	361	2016-12-16 18:46:06.660535	2016-12-16 18:46:06.660535
756	123	361	2016-12-16 18:46:06.664961	2016-12-16 18:46:06.664961
757	124	361	2016-12-16 18:46:06.669015	2016-12-16 18:46:06.669015
758	125	361	2016-12-16 18:46:06.674067	2016-12-16 18:46:06.674067
759	126	361	2016-12-16 18:46:06.678265	2016-12-16 18:46:06.678265
760	127	361	2016-12-16 18:46:06.68301	2016-12-16 18:46:06.68301
761	128	361	2016-12-16 18:46:06.687001	2016-12-16 18:46:06.687001
762	129	361	2016-12-16 18:46:06.690738	2016-12-16 18:46:06.690738
763	130	361	2016-12-16 18:46:06.695064	2016-12-16 18:46:06.695064
764	132	361	2016-12-16 18:46:06.699678	2016-12-16 18:46:06.699678
765	133	361	2016-12-16 18:46:06.704281	2016-12-16 18:46:06.704281
766	135	361	2016-12-16 18:46:06.70839	2016-12-16 18:46:06.70839
767	136	361	2016-12-16 18:46:06.712918	2016-12-16 18:46:06.712918
768	137	361	2016-12-16 18:46:06.71749	2016-12-16 18:46:06.71749
769	138	361	2016-12-16 18:46:06.722166	2016-12-16 18:46:06.722166
770	139	361	2016-12-16 18:46:06.726509	2016-12-16 18:46:06.726509
771	142	361	2016-12-16 18:46:06.73054	2016-12-16 18:46:06.73054
772	143	361	2016-12-16 18:46:06.734629	2016-12-16 18:46:06.734629
773	144	361	2016-12-16 18:46:06.738804	2016-12-16 18:46:06.738804
774	181	361	2016-12-16 18:46:06.742653	2016-12-16 18:46:06.742653
775	184	361	2016-12-16 18:46:06.746697	2016-12-16 18:46:06.746697
776	186	361	2016-12-16 18:46:06.75059	2016-12-16 18:46:06.75059
777	194	361	2016-12-16 18:46:06.754526	2016-12-16 18:46:06.754526
778	195	361	2016-12-16 18:46:06.758519	2016-12-16 18:46:06.758519
779	196	361	2016-12-16 18:46:06.764143	2016-12-16 18:46:06.764143
780	140	361	2016-12-16 18:46:06.768536	2016-12-16 18:46:06.768536
781	116	362	2016-12-16 18:46:06.772649	2016-12-16 18:46:06.772649
782	119	362	2016-12-16 18:46:06.776541	2016-12-16 18:46:06.776541
783	120	362	2016-12-16 18:46:06.780378	2016-12-16 18:46:06.780378
784	121	362	2016-12-16 18:46:06.785029	2016-12-16 18:46:06.785029
785	122	362	2016-12-16 18:46:06.788686	2016-12-16 18:46:06.788686
786	123	362	2016-12-16 18:46:06.792583	2016-12-16 18:46:06.792583
787	124	362	2016-12-16 18:46:06.796558	2016-12-16 18:46:06.796558
788	125	362	2016-12-16 18:46:06.801518	2016-12-16 18:46:06.801518
789	126	362	2016-12-16 18:46:06.805415	2016-12-16 18:46:06.805415
790	127	362	2016-12-16 18:46:06.809499	2016-12-16 18:46:06.809499
791	128	362	2016-12-16 18:46:06.822492	2016-12-16 18:46:06.822492
792	129	362	2016-12-16 18:46:06.827061	2016-12-16 18:46:06.827061
793	130	362	2016-12-16 18:46:06.832157	2016-12-16 18:46:06.832157
794	132	362	2016-12-16 18:46:06.836419	2016-12-16 18:46:06.836419
795	133	362	2016-12-16 18:46:06.840762	2016-12-16 18:46:06.840762
796	135	362	2016-12-16 18:46:06.844886	2016-12-16 18:46:06.844886
797	136	362	2016-12-16 18:46:06.849577	2016-12-16 18:46:06.849577
798	137	362	2016-12-16 18:46:06.85361	2016-12-16 18:46:06.85361
799	138	362	2016-12-16 18:46:06.85828	2016-12-16 18:46:06.85828
800	139	362	2016-12-16 18:46:06.864695	2016-12-16 18:46:06.864695
801	142	362	2016-12-16 18:46:06.869334	2016-12-16 18:46:06.869334
802	143	362	2016-12-16 18:46:06.873786	2016-12-16 18:46:06.873786
803	144	362	2016-12-16 18:46:06.878137	2016-12-16 18:46:06.878137
804	181	362	2016-12-16 18:46:06.882786	2016-12-16 18:46:06.882786
805	184	362	2016-12-16 18:46:06.888287	2016-12-16 18:46:06.888287
806	186	362	2016-12-16 18:46:06.892989	2016-12-16 18:46:06.892989
807	194	362	2016-12-16 18:46:06.897222	2016-12-16 18:46:06.897222
808	195	362	2016-12-16 18:46:06.90135	2016-12-16 18:46:06.90135
809	196	362	2016-12-16 18:46:06.906079	2016-12-16 18:46:06.906079
810	140	362	2016-12-16 18:46:06.910455	2016-12-16 18:46:06.910455
811	116	363	2016-12-16 18:46:06.914607	2016-12-16 18:46:06.914607
812	119	363	2016-12-16 18:46:06.918985	2016-12-16 18:46:06.918985
813	120	363	2016-12-16 18:46:06.92344	2016-12-16 18:46:06.92344
814	121	363	2016-12-16 18:46:06.928051	2016-12-16 18:46:06.928051
815	122	363	2016-12-16 18:46:06.932436	2016-12-16 18:46:06.932436
816	123	363	2016-12-16 18:46:06.936546	2016-12-16 18:46:06.936546
817	124	363	2016-12-16 18:46:06.940852	2016-12-16 18:46:06.940852
818	125	363	2016-12-16 18:46:06.945043	2016-12-16 18:46:06.945043
819	126	363	2016-12-16 18:46:06.949266	2016-12-16 18:46:06.949266
820	127	363	2016-12-16 18:46:06.954282	2016-12-16 18:46:06.954282
821	128	363	2016-12-16 18:46:06.958691	2016-12-16 18:46:06.958691
822	129	363	2016-12-16 18:46:06.963049	2016-12-16 18:46:06.963049
823	130	363	2016-12-16 18:46:06.967527	2016-12-16 18:46:06.967527
824	132	363	2016-12-16 18:46:06.971532	2016-12-16 18:46:06.971532
825	133	363	2016-12-16 18:46:06.976596	2016-12-16 18:46:06.976596
826	135	363	2016-12-16 18:46:06.980607	2016-12-16 18:46:06.980607
827	136	363	2016-12-16 18:46:06.985616	2016-12-16 18:46:06.985616
828	137	363	2016-12-16 18:46:06.990655	2016-12-16 18:46:06.990655
829	138	363	2016-12-16 18:46:06.995667	2016-12-16 18:46:06.995667
830	139	363	2016-12-16 18:46:06.999742	2016-12-16 18:46:06.999742
831	142	363	2016-12-16 18:46:07.003829	2016-12-16 18:46:07.003829
832	143	363	2016-12-16 18:46:07.007871	2016-12-16 18:46:07.007871
833	144	363	2016-12-16 18:46:07.012147	2016-12-16 18:46:07.012147
834	181	363	2016-12-16 18:46:07.016339	2016-12-16 18:46:07.016339
835	184	363	2016-12-16 18:46:07.021107	2016-12-16 18:46:07.021107
836	186	363	2016-12-16 18:46:07.02546	2016-12-16 18:46:07.02546
837	194	363	2016-12-16 18:46:07.029833	2016-12-16 18:46:07.029833
838	195	363	2016-12-16 18:46:07.035983	2016-12-16 18:46:07.035983
839	196	363	2016-12-16 18:46:07.041889	2016-12-16 18:46:07.041889
840	140	363	2016-12-16 18:46:07.047449	2016-12-16 18:46:07.047449
841	116	364	2016-12-16 18:46:07.05185	2016-12-16 18:46:07.05185
842	119	364	2016-12-16 18:46:07.056876	2016-12-16 18:46:07.056876
843	120	364	2016-12-16 18:46:07.061741	2016-12-16 18:46:07.061741
844	121	364	2016-12-16 18:46:07.067058	2016-12-16 18:46:07.067058
845	122	364	2016-12-16 18:46:07.071698	2016-12-16 18:46:07.071698
846	123	364	2016-12-16 18:46:07.075909	2016-12-16 18:46:07.075909
847	124	364	2016-12-16 18:46:07.081251	2016-12-16 18:46:07.081251
848	125	364	2016-12-16 18:46:07.085608	2016-12-16 18:46:07.085608
849	126	364	2016-12-16 18:46:07.090994	2016-12-16 18:46:07.090994
850	127	364	2016-12-16 18:46:07.095686	2016-12-16 18:46:07.095686
851	128	364	2016-12-16 18:46:07.100229	2016-12-16 18:46:07.100229
852	129	364	2016-12-16 18:46:07.104531	2016-12-16 18:46:07.104531
853	130	364	2016-12-16 18:46:07.109106	2016-12-16 18:46:07.109106
854	132	364	2016-12-16 18:46:07.114184	2016-12-16 18:46:07.114184
855	133	364	2016-12-16 18:46:07.118561	2016-12-16 18:46:07.118561
856	135	364	2016-12-16 18:46:07.123551	2016-12-16 18:46:07.123551
857	136	364	2016-12-16 18:46:07.127661	2016-12-16 18:46:07.127661
858	137	364	2016-12-16 18:46:07.132185	2016-12-16 18:46:07.132185
859	138	364	2016-12-16 18:46:07.136361	2016-12-16 18:46:07.136361
860	139	364	2016-12-16 18:46:07.141123	2016-12-16 18:46:07.141123
861	142	364	2016-12-16 18:46:07.145542	2016-12-16 18:46:07.145542
862	143	364	2016-12-16 18:46:07.149751	2016-12-16 18:46:07.149751
863	144	364	2016-12-16 18:46:07.154286	2016-12-16 18:46:07.154286
864	181	364	2016-12-16 18:46:07.15944	2016-12-16 18:46:07.15944
865	184	364	2016-12-16 18:46:07.163915	2016-12-16 18:46:07.163915
866	186	364	2016-12-16 18:46:07.168249	2016-12-16 18:46:07.168249
867	194	364	2016-12-16 18:46:07.172425	2016-12-16 18:46:07.172425
868	195	364	2016-12-16 18:46:07.176595	2016-12-16 18:46:07.176595
869	196	364	2016-12-16 18:46:07.180545	2016-12-16 18:46:07.180545
870	140	364	2016-12-16 18:46:07.184587	2016-12-16 18:46:07.184587
871	116	365	2016-12-16 18:46:07.188603	2016-12-16 18:46:07.188603
872	119	365	2016-12-16 18:46:07.192767	2016-12-16 18:46:07.192767
873	120	365	2016-12-16 18:46:07.19715	2016-12-16 18:46:07.19715
874	121	365	2016-12-16 18:46:07.201776	2016-12-16 18:46:07.201776
875	122	365	2016-12-16 18:46:07.206597	2016-12-16 18:46:07.206597
876	123	365	2016-12-16 18:46:07.211145	2016-12-16 18:46:07.211145
877	124	365	2016-12-16 18:46:07.215359	2016-12-16 18:46:07.215359
878	125	365	2016-12-16 18:46:07.21969	2016-12-16 18:46:07.21969
879	126	365	2016-12-16 18:46:07.223617	2016-12-16 18:46:07.223617
880	127	365	2016-12-16 18:46:07.227607	2016-12-16 18:46:07.227607
881	128	365	2016-12-16 18:46:07.231778	2016-12-16 18:46:07.231778
882	129	365	2016-12-16 18:46:07.235793	2016-12-16 18:46:07.235793
883	130	365	2016-12-16 18:46:07.239668	2016-12-16 18:46:07.239668
884	132	365	2016-12-16 18:46:07.243601	2016-12-16 18:46:07.243601
885	133	365	2016-12-16 18:46:07.247586	2016-12-16 18:46:07.247586
886	135	365	2016-12-16 18:46:07.251499	2016-12-16 18:46:07.251499
887	136	365	2016-12-16 18:46:07.255702	2016-12-16 18:46:07.255702
888	137	365	2016-12-16 18:46:07.259983	2016-12-16 18:46:07.259983
889	138	365	2016-12-16 18:46:07.26398	2016-12-16 18:46:07.26398
890	139	365	2016-12-16 18:46:07.268094	2016-12-16 18:46:07.268094
891	142	365	2016-12-16 18:46:07.272499	2016-12-16 18:46:07.272499
892	143	365	2016-12-16 18:46:07.2784	2016-12-16 18:46:07.2784
893	144	365	2016-12-16 18:46:07.282571	2016-12-16 18:46:07.282571
894	181	365	2016-12-16 18:46:07.28759	2016-12-16 18:46:07.28759
895	184	365	2016-12-16 18:46:07.292745	2016-12-16 18:46:07.292745
896	186	365	2016-12-16 18:46:07.296692	2016-12-16 18:46:07.296692
897	194	365	2016-12-16 18:46:07.300847	2016-12-16 18:46:07.300847
898	195	365	2016-12-16 18:46:07.30469	2016-12-16 18:46:07.30469
899	196	365	2016-12-16 18:46:07.308648	2016-12-16 18:46:07.308648
900	140	365	2016-12-16 18:46:07.31357	2016-12-16 18:46:07.31357
901	116	366	2016-12-16 18:46:07.317705	2016-12-16 18:46:07.317705
902	119	366	2016-12-16 18:46:07.321613	2016-12-16 18:46:07.321613
903	120	366	2016-12-16 18:46:07.326565	2016-12-16 18:46:07.326565
904	121	366	2016-12-16 18:46:07.332553	2016-12-16 18:46:07.332553
905	122	366	2016-12-16 18:46:07.336609	2016-12-16 18:46:07.336609
906	123	366	2016-12-16 18:46:07.341592	2016-12-16 18:46:07.341592
907	124	366	2016-12-16 18:46:07.345921	2016-12-16 18:46:07.345921
908	125	366	2016-12-16 18:46:07.350561	2016-12-16 18:46:07.350561
909	126	366	2016-12-16 18:46:07.355396	2016-12-16 18:46:07.355396
910	127	366	2016-12-16 18:46:07.359457	2016-12-16 18:46:07.359457
911	128	366	2016-12-16 18:46:07.364625	2016-12-16 18:46:07.364625
912	129	366	2016-12-16 18:46:07.368737	2016-12-16 18:46:07.368737
913	130	366	2016-12-16 18:46:07.372599	2016-12-16 18:46:07.372599
914	132	366	2016-12-16 18:46:07.376621	2016-12-16 18:46:07.376621
915	133	366	2016-12-16 18:46:07.38088	2016-12-16 18:46:07.38088
916	135	366	2016-12-16 18:46:07.385491	2016-12-16 18:46:07.385491
917	136	366	2016-12-16 18:46:07.389816	2016-12-16 18:46:07.389816
918	137	366	2016-12-16 18:46:07.394106	2016-12-16 18:46:07.394106
919	138	366	2016-12-16 18:46:07.399598	2016-12-16 18:46:07.399598
920	139	366	2016-12-16 18:46:07.404719	2016-12-16 18:46:07.404719
921	142	366	2016-12-16 18:46:07.409195	2016-12-16 18:46:07.409195
922	143	366	2016-12-16 18:46:07.414666	2016-12-16 18:46:07.414666
923	144	366	2016-12-16 18:46:07.419195	2016-12-16 18:46:07.419195
924	181	366	2016-12-16 18:46:07.42335	2016-12-16 18:46:07.42335
925	184	366	2016-12-16 18:46:07.427917	2016-12-16 18:46:07.427917
926	186	366	2016-12-16 18:46:07.433371	2016-12-16 18:46:07.433371
927	194	366	2016-12-16 18:46:07.437595	2016-12-16 18:46:07.437595
928	195	366	2016-12-16 18:46:07.441883	2016-12-16 18:46:07.441883
929	196	366	2016-12-16 18:46:07.446221	2016-12-16 18:46:07.446221
930	140	366	2016-12-16 18:46:07.450217	2016-12-16 18:46:07.450217
\.


--
-- Name: activity_by_products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('activity_by_products_id_seq', 930, true);


--
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
environment	development	2016-12-16 18:45:59.731016	2016-12-16 18:45:59.731016
\.


--
-- Data for Name: business_units; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY business_units (id, name, created_at, updated_at) FROM stdin;
1	MISIONAL	2016-12-16 18:46:00.079063	2016-12-16 18:46:00.079063
2	APOYOS	2016-12-16 18:46:00.083114	2016-12-16 18:46:00.083114
3	ESTRATEGICOS	2016-12-16 18:46:00.087016	2016-12-16 18:46:00.087016
\.


--
-- Name: business_units_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('business_units_id_seq', 3, true);


--
-- Data for Name: cost_by_resources; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY cost_by_resources (id, meter_id, resource_id, subresource_id, created_at, updated_at, activity_by_product_id, quantity, cost) FROM stdin;
1	4	2	82	2016-12-16 18:46:16.799086	2016-12-16 18:46:16.799086	1	0.02	466.54
2	4	2	82	2016-12-16 18:46:16.806043	2016-12-16 18:46:16.806043	2	0.18	4198.86
3	4	2	142	2016-12-16 18:46:16.810874	2016-12-16 18:46:16.810874	3	0.33	2810.61
4	4	2	142	2016-12-16 18:46:16.815623	2016-12-16 18:46:16.815623	4	0.1	851.7
5	4	2	142	2016-12-16 18:46:16.82038	2016-12-16 18:46:16.82038	5	0.28	2384.76
6	4	2	217	2016-12-16 18:46:16.824824	2016-12-16 18:46:16.824824	6	0.21	7511.91
8	5	1	853	2016-12-16 18:46:16.833297	2016-12-16 18:46:16.833297	7	2.0	1584.0
9	4	2	146	2016-12-16 18:46:16.838077	2016-12-16 18:46:16.838077	8	0.2	4441.0
11	4	2	281	2016-12-16 18:46:16.846737	2016-12-16 18:46:16.846737	10	0.2	6082.6
12	4	2	281	2016-12-16 18:46:16.850972	2016-12-16 18:46:16.850972	11	0.25	7603.25
13	4	2	281	2016-12-16 18:46:16.855936	2016-12-16 18:46:16.855936	12	0.2	6082.6
14	4	2	281	2016-12-16 18:46:16.860181	2016-12-16 18:46:16.860181	13	1.5	45619.5
15	4	2	281	2016-12-16 18:46:16.864753	2016-12-16 18:46:16.864753	14	0.25	7603.25
16	4	2	53	2016-12-16 18:46:16.869459	2016-12-16 18:46:16.869459	15	0.22	1694.0
17	4	2	53	2016-12-16 18:46:16.874106	2016-12-16 18:46:16.874106	16	0.67	5159.0
18	4	2	53	2016-12-16 18:46:16.878189	2016-12-16 18:46:16.878189	17	0.14	1078.0
19	4	2	53	2016-12-16 18:46:16.882534	2016-12-16 18:46:16.882534	18	0.08	616.0
20	4	2	53	2016-12-16 18:46:16.887119	2016-12-16 18:46:16.887119	19	0.08	616.0
21	4	2	164	2016-12-16 18:46:16.891195	2016-12-16 18:46:16.891195	19	0.08	618.24
22	4	2	53	2016-12-16 18:46:16.895823	2016-12-16 18:46:16.895823	20	0.19	1463.0
23	4	2	53	2016-12-16 18:46:16.900916	2016-12-16 18:46:16.900916	21	1.33	10241.0
24	4	2	53	2016-12-16 18:46:16.905381	2016-12-16 18:46:16.905381	22	0.08	616.0
25	4	2	53	2016-12-16 18:46:16.910228	2016-12-16 18:46:16.910228	23	0.17	1309.0
26	4	2	268	2016-12-16 18:46:16.915039	2016-12-16 18:46:16.915039	24	0.25	2019.5
27	4	2	268	2016-12-16 18:46:16.919304	2016-12-16 18:46:16.919304	25	0.38	3069.64
28	4	2	268	2016-12-16 18:46:16.923678	2016-12-16 18:46:16.923678	26	0.35	2827.3
29	4	2	162	2016-12-16 18:46:16.928103	2016-12-16 18:46:16.928103	27	0.17	2089.64
30	4	2	162	2016-12-16 18:46:16.932611	2016-12-16 18:46:16.932611	28	0.25	3073.0
31	4	2	106	2016-12-16 18:46:16.936806	2016-12-16 18:46:16.936806	29	0.5	3832.0
32	4	2	53	2016-12-16 18:46:16.941199	2016-12-16 18:46:16.941199	30	0.75	5775.0
33	4	2	82	2016-12-16 18:46:16.945226	2016-12-16 18:46:16.945226	31	0.02	466.54
34	4	2	82	2016-12-16 18:46:16.950146	2016-12-16 18:46:16.950146	32	0.18	4198.86
35	4	2	142	2016-12-16 18:46:16.95488	2016-12-16 18:46:16.95488	33	0.33	2810.61
36	4	2	142	2016-12-16 18:46:16.961182	2016-12-16 18:46:16.961182	34	0.1	851.7
37	4	2	142	2016-12-16 18:46:16.965163	2016-12-16 18:46:16.965163	35	0.28	2384.76
38	4	2	217	2016-12-16 18:46:16.969199	2016-12-16 18:46:16.969199	36	0.21	7511.91
40	5	1	853	2016-12-16 18:46:16.978186	2016-12-16 18:46:16.978186	37	2.0	1584.0
41	4	2	146	2016-12-16 18:46:16.98333	2016-12-16 18:46:16.98333	38	0.2	4441.0
43	4	2	281	2016-12-16 18:46:16.992243	2016-12-16 18:46:16.992243	40	0.2	6082.6
44	4	2	281	2016-12-16 18:46:16.996452	2016-12-16 18:46:16.996452	41	0.25	7603.25
45	4	2	281	2016-12-16 18:46:17.000324	2016-12-16 18:46:17.000324	42	0.2	6082.6
46	4	2	281	2016-12-16 18:46:17.004591	2016-12-16 18:46:17.004591	43	1.5	45619.5
47	4	2	281	2016-12-16 18:46:17.009313	2016-12-16 18:46:17.009313	44	0.25	7603.25
48	4	2	53	2016-12-16 18:46:17.013665	2016-12-16 18:46:17.013665	45	0.22	1694.0
49	4	2	53	2016-12-16 18:46:17.018161	2016-12-16 18:46:17.018161	46	0.67	5159.0
50	4	2	53	2016-12-16 18:46:17.022326	2016-12-16 18:46:17.022326	47	0.14	1078.0
51	4	2	53	2016-12-16 18:46:17.026374	2016-12-16 18:46:17.026374	48	0.08	616.0
52	4	2	53	2016-12-16 18:46:17.031126	2016-12-16 18:46:17.031126	49	0.08	616.0
53	4	2	164	2016-12-16 18:46:17.035239	2016-12-16 18:46:17.035239	50	0.08	618.24
54	4	2	53	2016-12-16 18:46:17.039465	2016-12-16 18:46:17.039465	50	0.19	1463.0
55	4	2	53	2016-12-16 18:46:17.043744	2016-12-16 18:46:17.043744	51	1.33	10241.0
56	4	2	53	2016-12-16 18:46:17.048237	2016-12-16 18:46:17.048237	52	0.08	616.0
57	4	2	53	2016-12-16 18:46:17.052723	2016-12-16 18:46:17.052723	53	0.17	1309.0
58	4	2	268	2016-12-16 18:46:17.05711	2016-12-16 18:46:17.05711	54	0.25	2019.5
59	4	2	268	2016-12-16 18:46:17.061258	2016-12-16 18:46:17.061258	55	0.38	3069.64
60	4	2	268	2016-12-16 18:46:17.06521	2016-12-16 18:46:17.06521	56	0.35	2827.3
61	4	2	162	2016-12-16 18:46:17.069251	2016-12-16 18:46:17.069251	57	0.17	2089.64
62	4	2	162	2016-12-16 18:46:17.073866	2016-12-16 18:46:17.073866	58	0.25	3073.0
63	4	2	106	2016-12-16 18:46:17.081627	2016-12-16 18:46:17.081627	59	0.5	3832.0
64	4	2	53	2016-12-16 18:46:17.086093	2016-12-16 18:46:17.086093	60	0.75	5775.0
65	4	2	82	2016-12-16 18:46:17.090256	2016-12-16 18:46:17.090256	61	0.02	466.54
66	4	2	82	2016-12-16 18:46:17.094711	2016-12-16 18:46:17.094711	62	0.18	4198.86
67	4	2	142	2016-12-16 18:46:17.099183	2016-12-16 18:46:17.099183	63	0.33	2810.61
68	4	2	142	2016-12-16 18:46:17.10339	2016-12-16 18:46:17.10339	64	0.1	851.7
69	4	2	142	2016-12-16 18:46:17.107692	2016-12-16 18:46:17.107692	65	0.28	2384.76
70	4	2	217	2016-12-16 18:46:17.112255	2016-12-16 18:46:17.112255	66	0.21	7511.91
72	5	1	853	2016-12-16 18:46:17.120416	2016-12-16 18:46:17.120416	67	2.0	1584.0
74	4	2	146	2016-12-16 18:46:17.129317	2016-12-16 18:46:17.129317	69	0.86	19096.3
75	4	2	281	2016-12-16 18:46:17.133333	2016-12-16 18:46:17.133333	70	0.2	6082.6
76	4	2	281	2016-12-16 18:46:17.138192	2016-12-16 18:46:17.138192	71	0.25	7603.25
77	4	2	281	2016-12-16 18:46:17.142842	2016-12-16 18:46:17.142842	72	0.2	6082.6
78	4	2	281	2016-12-16 18:46:17.147569	2016-12-16 18:46:17.147569	73	1.5	45619.5
79	4	2	281	2016-12-16 18:46:17.152085	2016-12-16 18:46:17.152085	74	0.25	7603.25
80	4	2	53	2016-12-16 18:46:17.156601	2016-12-16 18:46:17.156601	75	0.22	1694.0
81	4	2	53	2016-12-16 18:46:17.161215	2016-12-16 18:46:17.161215	76	0.67	5159.0
82	4	2	53	2016-12-16 18:46:17.165565	2016-12-16 18:46:17.165565	77	0.14	1078.0
83	4	2	53	2016-12-16 18:46:17.169886	2016-12-16 18:46:17.169886	78	0.08	616.0
84	4	2	53	2016-12-16 18:46:17.174824	2016-12-16 18:46:17.174824	79	0.08	616.0
85	4	2	164	2016-12-16 18:46:17.179149	2016-12-16 18:46:17.179149	80	0.08	618.24
86	4	2	53	2016-12-16 18:46:17.183294	2016-12-16 18:46:17.183294	80	0.19	1463.0
87	4	2	53	2016-12-16 18:46:17.187384	2016-12-16 18:46:17.187384	81	1.33	10241.0
88	4	2	53	2016-12-16 18:46:17.191841	2016-12-16 18:46:17.191841	82	0.08	616.0
89	4	2	53	2016-12-16 18:46:17.196982	2016-12-16 18:46:17.196982	83	0.17	1309.0
90	4	2	268	2016-12-16 18:46:17.201258	2016-12-16 18:46:17.201258	84	0.25	2019.5
91	4	2	268	2016-12-16 18:46:17.20579	2016-12-16 18:46:17.20579	85	0.38	3069.64
92	4	2	268	2016-12-16 18:46:17.210256	2016-12-16 18:46:17.210256	86	0.35	2827.3
93	4	2	162	2016-12-16 18:46:17.214468	2016-12-16 18:46:17.214468	87	0.17	2089.64
94	4	2	162	2016-12-16 18:46:17.218671	2016-12-16 18:46:17.218671	88	0.25	3073.0
95	4	2	106	2016-12-16 18:46:17.222949	2016-12-16 18:46:17.222949	89	0.5	3832.0
96	4	2	53	2016-12-16 18:46:17.22738	2016-12-16 18:46:17.22738	90	0.75	5775.0
42	4	2	146	2016-12-16 18:46:16.987669	2016-12-16 18:53:52.817651	39	1.0	22205.0
7	4	2	217	2016-12-16 18:46:16.829143	2016-12-16 21:41:51.683409	7	1.0	35771.0
10	4	2	146	2016-12-16 18:46:16.842223	2016-12-16 21:55:23.877343	9	1.0	22205.0
71	4	2	217	2016-12-16 18:46:17.116351	2016-12-19 04:44:16.763241	67	1.5	53656.5
97	4	2	82	2016-12-16 18:46:17.232098	2016-12-16 18:46:17.232098	91	0.02	466.54
98	4	2	82	2016-12-16 18:46:17.23652	2016-12-16 18:46:17.23652	92	0.18	4198.86
99	4	2	142	2016-12-16 18:46:17.24056	2016-12-16 18:46:17.24056	93	0.33	2810.61
100	4	2	142	2016-12-16 18:46:17.244564	2016-12-16 18:46:17.244564	94	0.1	851.7
101	4	2	142	2016-12-16 18:46:17.249172	2016-12-16 18:46:17.249172	95	0.28	2384.76
102	4	2	217	2016-12-16 18:46:17.253403	2016-12-16 18:46:17.253403	96	0.21	7511.91
105	4	2	146	2016-12-16 18:46:17.266224	2016-12-16 18:46:17.266224	98	0.2	4441.0
107	4	2	281	2016-12-16 18:46:17.275363	2016-12-16 18:46:17.275363	100	0.2	6082.6
108	4	2	281	2016-12-16 18:46:17.279901	2016-12-16 18:46:17.279901	101	0.25	7603.25
109	4	2	281	2016-12-16 18:46:17.284244	2016-12-16 18:46:17.284244	102	0.2	6082.6
110	4	2	281	2016-12-16 18:46:17.288402	2016-12-16 18:46:17.288402	103	1.5	45619.5
111	4	2	281	2016-12-16 18:46:17.292705	2016-12-16 18:46:17.292705	104	0.25	7603.25
112	4	2	53	2016-12-16 18:46:17.296956	2016-12-16 18:46:17.296956	105	0.22	1694.0
113	4	2	53	2016-12-16 18:46:17.301759	2016-12-16 18:46:17.301759	106	0.67	5159.0
114	4	2	53	2016-12-16 18:46:17.306033	2016-12-16 18:46:17.306033	107	0.14	1078.0
115	4	2	53	2016-12-16 18:46:17.310236	2016-12-16 18:46:17.310236	108	0.08	616.0
116	4	2	53	2016-12-16 18:46:17.314771	2016-12-16 18:46:17.314771	109	0.08	616.0
117	4	2	164	2016-12-16 18:46:17.318943	2016-12-16 18:46:17.318943	110	0.08	618.24
118	4	2	53	2016-12-16 18:46:17.323539	2016-12-16 18:46:17.323539	110	0.19	1463.0
119	4	2	53	2016-12-16 18:46:17.328969	2016-12-16 18:46:17.328969	111	1.33	10241.0
120	4	2	53	2016-12-16 18:46:17.333563	2016-12-16 18:46:17.333563	112	0.08	616.0
121	4	2	53	2016-12-16 18:46:17.338271	2016-12-16 18:46:17.338271	113	0.17	1309.0
122	4	2	268	2016-12-16 18:46:17.342356	2016-12-16 18:46:17.342356	114	0.25	2019.5
123	4	2	268	2016-12-16 18:46:17.347288	2016-12-16 18:46:17.347288	115	0.38	3069.64
124	4	2	268	2016-12-16 18:46:17.351468	2016-12-16 18:46:17.351468	116	0.35	2827.3
125	4	2	162	2016-12-16 18:46:17.356203	2016-12-16 18:46:17.356203	117	0.17	2089.64
126	4	2	162	2016-12-16 18:46:17.360276	2016-12-16 18:46:17.360276	118	0.25	3073.0
127	4	2	106	2016-12-16 18:46:17.364395	2016-12-16 18:46:17.364395	119	0.5	3832.0
128	4	2	53	2016-12-16 18:46:17.368734	2016-12-16 18:46:17.368734	120	0.75	5775.0
129	4	2	82	2016-12-16 18:46:17.373818	2016-12-16 18:46:17.373818	121	0.02	466.54
130	4	2	82	2016-12-16 18:46:17.378315	2016-12-16 18:46:17.378315	122	0.18	4198.86
131	4	2	142	2016-12-16 18:46:17.382548	2016-12-16 18:46:17.382548	123	0.33	2810.61
132	4	2	142	2016-12-16 18:46:17.387631	2016-12-16 18:46:17.387631	124	0.1	851.7
133	4	2	142	2016-12-16 18:46:17.391871	2016-12-16 18:46:17.391871	125	0.28	2384.76
134	4	2	217	2016-12-16 18:46:17.396238	2016-12-16 18:46:17.396238	126	0.21	7511.91
137	4	2	146	2016-12-16 18:46:17.411462	2016-12-16 18:46:17.411462	128	0.2	4441.0
139	4	2	281	2016-12-16 18:46:17.420164	2016-12-16 18:46:17.420164	130	0.2	6082.6
140	4	2	281	2016-12-16 18:46:17.42501	2016-12-16 18:46:17.42501	131	0.25	7603.25
141	4	2	281	2016-12-16 18:46:17.429598	2016-12-16 18:46:17.429598	132	0.2	6082.6
142	4	2	281	2016-12-16 18:46:17.433942	2016-12-16 18:46:17.433942	133	1.5	45619.5
143	4	2	281	2016-12-16 18:46:17.438561	2016-12-16 18:46:17.438561	134	0.25	7603.25
144	4	2	53	2016-12-16 18:46:17.444227	2016-12-16 18:46:17.444227	135	0.22	1694.0
145	4	2	53	2016-12-16 18:46:17.448306	2016-12-16 18:46:17.448306	136	0.67	5159.0
146	4	2	53	2016-12-16 18:46:17.452265	2016-12-16 18:46:17.452265	137	0.14	1078.0
147	4	2	53	2016-12-16 18:46:17.457549	2016-12-16 18:46:17.457549	138	0.08	616.0
148	4	2	53	2016-12-16 18:46:17.46252	2016-12-16 18:46:17.46252	139	0.08	616.0
149	4	2	164	2016-12-16 18:46:17.468681	2016-12-16 18:46:17.468681	140	0.08	618.24
150	4	2	53	2016-12-16 18:46:17.474214	2016-12-16 18:46:17.474214	140	0.19	1463.0
151	4	2	53	2016-12-16 18:46:17.478219	2016-12-16 18:46:17.478219	141	1.33	10241.0
152	4	2	53	2016-12-16 18:46:17.482473	2016-12-16 18:46:17.482473	142	0.08	616.0
153	4	2	53	2016-12-16 18:46:17.486623	2016-12-16 18:46:17.486623	143	0.17	1309.0
154	4	2	268	2016-12-16 18:46:17.491202	2016-12-16 18:46:17.491202	144	0.25	2019.5
155	4	2	268	2016-12-16 18:46:17.495733	2016-12-16 18:46:17.495733	145	0.38	3069.64
156	4	2	268	2016-12-16 18:46:17.500222	2016-12-16 18:46:17.500222	146	0.35	2827.3
157	4	2	162	2016-12-16 18:46:17.504429	2016-12-16 18:46:17.504429	147	0.17	2089.64
158	4	2	162	2016-12-16 18:46:17.508548	2016-12-16 18:46:17.508548	148	0.25	3073.0
159	4	2	106	2016-12-16 18:46:17.512904	2016-12-16 18:46:17.512904	149	0.5	3832.0
160	4	2	53	2016-12-16 18:46:17.518677	2016-12-16 18:46:17.518677	150	0.75	5775.0
161	4	2	82	2016-12-16 18:46:17.523295	2016-12-16 18:46:17.523295	151	0.02	466.54
162	4	2	82	2016-12-16 18:46:17.527466	2016-12-16 18:46:17.527466	152	0.18	4198.86
163	4	2	142	2016-12-16 18:46:17.531946	2016-12-16 18:46:17.531946	153	0.33	2810.61
164	4	2	142	2016-12-16 18:46:17.536332	2016-12-16 18:46:17.536332	154	0.1	851.7
165	4	2	142	2016-12-16 18:46:17.540604	2016-12-16 18:46:17.540604	155	0.28	2384.76
166	4	2	217	2016-12-16 18:46:17.545232	2016-12-16 18:46:17.545232	156	0.21	7511.91
169	4	2	146	2016-12-16 18:46:17.558167	2016-12-16 18:46:17.558167	158	0.2	4441.0
171	4	2	281	2016-12-16 18:46:17.567208	2016-12-16 18:46:17.567208	160	0.2	6082.6
172	4	2	281	2016-12-16 18:46:17.571834	2016-12-16 18:46:17.571834	161	0.25	7603.25
173	4	2	281	2016-12-16 18:46:17.576159	2016-12-16 18:46:17.576159	162	0.2	6082.6
174	4	2	281	2016-12-16 18:46:17.580647	2016-12-16 18:46:17.580647	163	1.5	45619.5
175	4	2	281	2016-12-16 18:46:17.584981	2016-12-16 18:46:17.584981	164	0.25	7603.25
176	4	2	53	2016-12-16 18:46:17.589779	2016-12-16 18:46:17.589779	165	0.22	1694.0
177	4	2	53	2016-12-16 18:46:17.594245	2016-12-16 18:46:17.594245	166	0.67	5159.0
178	4	2	53	2016-12-16 18:46:17.599168	2016-12-16 18:46:17.599168	167	0.14	1078.0
179	4	2	53	2016-12-16 18:46:17.603783	2016-12-16 18:46:17.603783	168	0.08	616.0
180	4	2	53	2016-12-16 18:46:17.608144	2016-12-16 18:46:17.608144	169	0.08	616.0
181	4	2	164	2016-12-16 18:46:17.612963	2016-12-16 18:46:17.612963	170	0.08	618.24
182	4	2	53	2016-12-16 18:46:17.617226	2016-12-16 18:46:17.617226	170	0.19	1463.0
183	4	2	53	2016-12-16 18:46:17.621371	2016-12-16 18:46:17.621371	171	1.33	10241.0
184	4	2	53	2016-12-16 18:46:17.625583	2016-12-16 18:46:17.625583	172	0.08	616.0
185	4	2	53	2016-12-16 18:46:17.629945	2016-12-16 18:46:17.629945	173	0.17	1309.0
186	4	2	268	2016-12-16 18:46:17.634402	2016-12-16 18:46:17.634402	174	0.25	2019.5
187	4	2	268	2016-12-16 18:46:17.638858	2016-12-16 18:46:17.638858	175	0.38	3069.64
188	4	2	268	2016-12-16 18:46:17.643118	2016-12-16 18:46:17.643118	176	0.35	2827.3
189	4	2	162	2016-12-16 18:46:17.647649	2016-12-16 18:46:17.647649	177	0.17	2089.64
190	4	2	162	2016-12-16 18:46:17.652224	2016-12-16 18:46:17.652224	178	0.25	3073.0
191	4	2	106	2016-12-16 18:46:17.656676	2016-12-16 18:46:17.656676	179	0.5	3832.0
192	4	2	53	2016-12-16 18:46:17.662253	2016-12-16 18:46:17.662253	180	0.75	5775.0
170	4	2	146	2016-12-16 18:46:17.562459	2016-12-17 16:05:25.408739	159	1.0	22205.0
103	4	2	217	2016-12-16 18:46:17.257463	2016-12-19 14:19:48.495435	97	1.5	53656.5
106	4	2	146	2016-12-16 18:46:17.270732	2016-12-19 14:20:37.355937	99	1.5	33307.5
135	4	2	217	2016-12-16 18:46:17.400767	2016-12-19 14:21:38.834337	127	1.5	53656.5
138	4	2	146	2016-12-16 18:46:17.415771	2016-12-19 14:22:27.935952	129	1.5	33307.5
104	5	1	853	2016-12-16 18:46:17.261732	2016-12-19 15:47:46.919712	97	4.0	3168.0
136	5	1	853	2016-12-16 18:46:17.40723	2016-12-19 16:44:31.611712	127	3.0	2376.0
193	4	2	82	2016-12-16 18:46:17.667204	2016-12-16 18:46:17.667204	181	0.02	466.54
194	4	2	82	2016-12-16 18:46:17.671411	2016-12-16 18:46:17.671411	182	0.18	4198.86
195	4	2	142	2016-12-16 18:46:17.676024	2016-12-16 18:46:17.676024	183	0.33	2810.61
196	4	2	142	2016-12-16 18:46:17.680286	2016-12-16 18:46:17.680286	184	0.1	851.7
197	4	2	142	2016-12-16 18:46:17.684594	2016-12-16 18:46:17.684594	185	0.28	2384.76
198	4	2	217	2016-12-16 18:46:17.68962	2016-12-16 18:46:17.68962	186	0.21	7511.91
200	5	1	853	2016-12-16 18:46:17.698303	2016-12-16 18:46:17.698303	187	2.0	1584.0
201	4	2	146	2016-12-16 18:46:17.702423	2016-12-16 18:46:17.702423	188	0.2	4441.0
203	4	2	281	2016-12-16 18:46:17.711734	2016-12-16 18:46:17.711734	190	0.2	6082.6
204	4	2	281	2016-12-16 18:46:17.716026	2016-12-16 18:46:17.716026	191	0.25	7603.25
205	4	2	281	2016-12-16 18:46:17.720755	2016-12-16 18:46:17.720755	192	0.2	6082.6
206	4	2	281	2016-12-16 18:46:17.726192	2016-12-16 18:46:17.726192	193	1.5	45619.5
207	4	2	281	2016-12-16 18:46:17.730556	2016-12-16 18:46:17.730556	194	0.25	7603.25
208	4	2	53	2016-12-16 18:46:17.734801	2016-12-16 18:46:17.734801	195	0.22	1694.0
209	4	2	53	2016-12-16 18:46:17.739257	2016-12-16 18:46:17.739257	196	0.67	5159.0
210	4	2	53	2016-12-16 18:46:17.744252	2016-12-16 18:46:17.744252	197	0.14	1078.0
211	4	2	53	2016-12-16 18:46:17.749206	2016-12-16 18:46:17.749206	198	0.08	616.0
212	4	2	53	2016-12-16 18:46:17.754236	2016-12-16 18:46:17.754236	199	0.08	616.0
213	4	2	164	2016-12-16 18:46:17.758619	2016-12-16 18:46:17.758619	200	0.08	618.24
214	4	2	53	2016-12-16 18:46:17.762627	2016-12-16 18:46:17.762627	200	0.19	1463.0
215	4	2	53	2016-12-16 18:46:17.766817	2016-12-16 18:46:17.766817	201	1.33	10241.0
216	4	2	53	2016-12-16 18:46:17.771046	2016-12-16 18:46:17.771046	202	0.08	616.0
217	4	2	53	2016-12-16 18:46:17.775235	2016-12-16 18:46:17.775235	203	0.17	1309.0
218	4	2	268	2016-12-16 18:46:17.779385	2016-12-16 18:46:17.779385	204	0.25	2019.5
219	4	2	268	2016-12-16 18:46:17.784175	2016-12-16 18:46:17.784175	205	0.38	3069.64
220	4	2	268	2016-12-16 18:46:17.788213	2016-12-16 18:46:17.788213	206	0.35	2827.3
221	4	2	162	2016-12-16 18:46:17.793159	2016-12-16 18:46:17.793159	207	0.17	2089.64
222	4	2	162	2016-12-16 18:46:17.797244	2016-12-16 18:46:17.797244	208	0.25	3073.0
223	4	2	106	2016-12-16 18:46:17.802159	2016-12-16 18:46:17.802159	209	0.5	3832.0
224	4	2	53	2016-12-16 18:46:17.806287	2016-12-16 18:46:17.806287	210	0.75	5775.0
225	4	2	82	2016-12-16 18:46:17.810359	2016-12-16 18:46:17.810359	211	0.02	466.54
226	4	2	82	2016-12-16 18:46:17.814359	2016-12-16 18:46:17.814359	212	0.18	4198.86
227	4	2	142	2016-12-16 18:46:17.818336	2016-12-16 18:46:17.818336	213	0.33	2810.61
228	4	2	142	2016-12-16 18:46:17.823583	2016-12-16 18:46:17.823583	214	0.1	851.7
229	4	2	142	2016-12-16 18:46:17.827415	2016-12-16 18:46:17.827415	215	0.28	2384.76
230	4	2	217	2016-12-16 18:46:17.831562	2016-12-16 18:46:17.831562	216	0.21	7511.91
233	4	2	146	2016-12-16 18:46:17.846294	2016-12-16 18:46:17.846294	218	0.2	4441.0
235	4	2	281	2016-12-16 18:46:17.855197	2016-12-16 18:46:17.855197	220	0.2	6082.6
236	4	2	281	2016-12-16 18:46:17.86061	2016-12-16 18:46:17.86061	221	0.25	7603.25
237	4	2	281	2016-12-16 18:46:17.86568	2016-12-16 18:46:17.86568	222	0.2	6082.6
238	4	2	281	2016-12-16 18:46:17.870293	2016-12-16 18:46:17.870293	223	1.5	45619.5
239	4	2	281	2016-12-16 18:46:17.87575	2016-12-16 18:46:17.87575	224	0.25	7603.25
240	4	2	53	2016-12-16 18:46:17.880212	2016-12-16 18:46:17.880212	225	0.22	1694.0
241	4	2	53	2016-12-16 18:46:17.884316	2016-12-16 18:46:17.884316	226	0.67	5159.0
242	4	2	53	2016-12-16 18:46:17.889166	2016-12-16 18:46:17.889166	227	0.14	1078.0
243	4	2	53	2016-12-16 18:46:17.8935	2016-12-16 18:46:17.8935	228	0.08	616.0
244	4	2	53	2016-12-16 18:46:17.899178	2016-12-16 18:46:17.899178	229	0.08	616.0
245	4	2	164	2016-12-16 18:46:17.903601	2016-12-16 18:46:17.903601	230	0.08	618.24
246	4	2	53	2016-12-16 18:46:17.908552	2016-12-16 18:46:17.908552	230	0.19	1463.0
247	4	2	53	2016-12-16 18:46:17.912621	2016-12-16 18:46:17.912621	231	1.33	10241.0
248	4	2	53	2016-12-16 18:46:17.917871	2016-12-16 18:46:17.917871	232	0.08	616.0
249	4	2	53	2016-12-16 18:46:17.922458	2016-12-16 18:46:17.922458	233	0.17	1309.0
250	4	2	268	2016-12-16 18:46:17.926904	2016-12-16 18:46:17.926904	234	0.25	2019.5
251	4	2	268	2016-12-16 18:46:17.931204	2016-12-16 18:46:17.931204	235	0.38	3069.64
252	4	2	268	2016-12-16 18:46:17.936129	2016-12-16 18:46:17.936129	236	0.35	2827.3
253	4	2	162	2016-12-16 18:46:17.9404	2016-12-16 18:46:17.9404	237	0.17	2089.64
254	4	2	162	2016-12-16 18:46:17.946222	2016-12-16 18:46:17.946222	238	0.25	3073.0
255	4	2	106	2016-12-16 18:46:17.950271	2016-12-16 18:46:17.950271	239	0.5	3832.0
256	4	2	53	2016-12-16 18:46:17.954698	2016-12-16 18:46:17.954698	240	0.75	5775.0
257	4	2	82	2016-12-16 18:46:17.95979	2016-12-16 18:46:17.95979	241	0.02	466.54
258	4	2	82	2016-12-16 18:46:17.963848	2016-12-16 18:46:17.963848	242	0.18	4198.86
259	4	2	142	2016-12-16 18:46:17.969226	2016-12-16 18:46:17.969226	243	0.33	2810.61
260	4	2	142	2016-12-16 18:46:17.97331	2016-12-16 18:46:17.97331	244	0.1	851.7
261	4	2	142	2016-12-16 18:46:17.977433	2016-12-16 18:46:17.977433	245	0.28	2384.76
262	4	2	217	2016-12-16 18:46:17.982214	2016-12-16 18:46:17.982214	246	0.21	7511.91
263	4	2	217	2016-12-16 18:46:17.986753	2016-12-16 18:46:17.986753	247	0.86	30763.06
264	5	1	853	2016-12-16 18:46:17.99218	2016-12-16 18:46:17.99218	247	2.0	1584.0
265	4	2	146	2016-12-16 18:46:17.996253	2016-12-16 18:46:17.996253	248	0.2	4441.0
266	4	2	146	2016-12-16 18:46:18.000486	2016-12-16 18:46:18.000486	249	0.86	19096.3
267	4	2	281	2016-12-16 18:46:18.005158	2016-12-16 18:46:18.005158	250	0.2	6082.6
268	4	2	281	2016-12-16 18:46:18.009715	2016-12-16 18:46:18.009715	251	0.25	7603.25
269	4	2	281	2016-12-16 18:46:18.0139	2016-12-16 18:46:18.0139	252	0.2	6082.6
270	4	2	281	2016-12-16 18:46:18.01864	2016-12-16 18:46:18.01864	253	1.5	45619.5
271	4	2	281	2016-12-16 18:46:18.023191	2016-12-16 18:46:18.023191	254	0.25	7603.25
272	4	2	53	2016-12-16 18:46:18.027522	2016-12-16 18:46:18.027522	255	0.22	1694.0
273	4	2	53	2016-12-16 18:46:18.032526	2016-12-16 18:46:18.032526	256	0.67	5159.0
274	4	2	53	2016-12-16 18:46:18.036975	2016-12-16 18:46:18.036975	257	0.14	1078.0
275	4	2	53	2016-12-16 18:46:18.041184	2016-12-16 18:46:18.041184	258	0.08	616.0
276	4	2	53	2016-12-16 18:46:18.046213	2016-12-16 18:46:18.046213	259	0.08	616.0
277	4	2	164	2016-12-16 18:46:18.050383	2016-12-16 18:46:18.050383	260	0.08	618.24
278	4	2	53	2016-12-16 18:46:18.054511	2016-12-16 18:46:18.054511	260	0.19	1463.0
279	4	2	53	2016-12-16 18:46:18.058897	2016-12-16 18:46:18.058897	261	1.33	10241.0
280	4	2	53	2016-12-16 18:46:18.064409	2016-12-16 18:46:18.064409	262	0.08	616.0
281	4	2	53	2016-12-16 18:46:18.068688	2016-12-16 18:46:18.068688	263	0.17	1309.0
282	4	2	268	2016-12-16 18:46:18.074032	2016-12-16 18:46:18.074032	264	0.25	2019.5
283	4	2	268	2016-12-16 18:46:18.078253	2016-12-16 18:46:18.078253	265	0.38	3069.64
284	4	2	268	2016-12-16 18:46:18.082285	2016-12-16 18:46:18.082285	266	0.35	2827.3
285	4	2	162	2016-12-16 18:46:18.087117	2016-12-16 18:46:18.087117	267	0.17	2089.64
286	4	2	162	2016-12-16 18:46:18.091518	2016-12-16 18:46:18.091518	268	0.25	3073.0
287	4	2	106	2016-12-16 18:46:18.095494	2016-12-16 18:46:18.095494	269	0.5	3832.0
288	4	2	53	2016-12-16 18:46:18.099439	2016-12-16 18:46:18.099439	270	0.75	5775.0
202	4	2	146	2016-12-16 18:46:17.707072	2016-12-17 17:39:16.576962	189	1.5	33307.5
231	4	2	217	2016-12-16 18:46:17.835982	2016-12-17 18:55:45.878269	217	1.5	53656.5
289	4	2	82	2016-12-16 18:46:18.103691	2016-12-16 18:46:18.103691	271	0.02	466.54
290	4	2	82	2016-12-16 18:46:18.110211	2016-12-16 18:46:18.110211	272	0.18	4198.86
291	4	2	142	2016-12-16 18:46:18.114505	2016-12-16 18:46:18.114505	273	0.33	2810.61
292	4	2	142	2016-12-16 18:46:18.118571	2016-12-16 18:46:18.118571	274	0.1	851.7
293	4	2	142	2016-12-16 18:46:18.122413	2016-12-16 18:46:18.122413	275	0.28	2384.76
294	4	2	217	2016-12-16 18:46:18.12723	2016-12-16 18:46:18.12723	276	0.21	7511.91
297	4	2	146	2016-12-16 18:46:18.142216	2016-12-16 18:46:18.142216	278	0.2	4441.0
299	4	2	281	2016-12-16 18:46:18.152253	2016-12-16 18:46:18.152253	280	0.2	6082.6
300	4	2	281	2016-12-16 18:46:18.156674	2016-12-16 18:46:18.156674	281	0.25	7603.25
301	4	2	281	2016-12-16 18:46:18.161709	2016-12-16 18:46:18.161709	282	0.2	6082.6
302	4	2	281	2016-12-16 18:46:18.165917	2016-12-16 18:46:18.165917	283	1.5	45619.5
303	4	2	281	2016-12-16 18:46:18.170702	2016-12-16 18:46:18.170702	284	0.25	7603.25
304	4	2	53	2016-12-16 18:46:18.175227	2016-12-16 18:46:18.175227	285	0.22	1694.0
305	4	2	53	2016-12-16 18:46:18.180061	2016-12-16 18:46:18.180061	286	0.67	5159.0
306	4	2	53	2016-12-16 18:46:18.184326	2016-12-16 18:46:18.184326	287	0.14	1078.0
307	4	2	53	2016-12-16 18:46:18.197038	2016-12-16 18:46:18.197038	288	0.08	616.0
308	4	2	53	2016-12-16 18:46:18.202303	2016-12-16 18:46:18.202303	289	0.08	616.0
309	4	2	164	2016-12-16 18:46:18.206356	2016-12-16 18:46:18.206356	290	0.08	618.24
310	4	2	53	2016-12-16 18:46:18.210634	2016-12-16 18:46:18.210634	290	0.19	1463.0
311	4	2	53	2016-12-16 18:46:18.21524	2016-12-16 18:46:18.21524	291	1.33	10241.0
312	4	2	53	2016-12-16 18:46:18.220725	2016-12-16 18:46:18.220725	292	0.08	616.0
313	4	2	53	2016-12-16 18:46:18.225036	2016-12-16 18:46:18.225036	293	0.17	1309.0
314	4	2	268	2016-12-16 18:46:18.230414	2016-12-16 18:46:18.230414	294	0.25	2019.5
315	4	2	268	2016-12-16 18:46:18.234879	2016-12-16 18:46:18.234879	295	0.38	3069.64
316	4	2	268	2016-12-16 18:46:18.24022	2016-12-16 18:46:18.24022	296	0.35	2827.3
317	4	2	162	2016-12-16 18:46:18.244616	2016-12-16 18:46:18.244616	297	0.17	2089.64
318	4	2	162	2016-12-16 18:46:18.250341	2016-12-16 18:46:18.250341	298	0.25	3073.0
319	4	2	106	2016-12-16 18:46:18.25525	2016-12-16 18:46:18.25525	299	0.5	3832.0
320	4	2	53	2016-12-16 18:46:18.259744	2016-12-16 18:46:18.259744	300	0.75	5775.0
321	4	2	82	2016-12-16 18:46:18.26462	2016-12-16 18:46:18.26462	301	0.02	466.54
322	4	2	82	2016-12-16 18:46:18.269035	2016-12-16 18:46:18.269035	302	0.18	4198.86
323	4	2	142	2016-12-16 18:46:18.274225	2016-12-16 18:46:18.274225	303	0.33	2810.61
324	4	2	142	2016-12-16 18:46:18.279998	2016-12-16 18:46:18.279998	304	0.1	851.7
325	4	2	142	2016-12-16 18:46:18.286215	2016-12-16 18:46:18.286215	305	0.28	2384.76
326	4	2	217	2016-12-16 18:46:18.290806	2016-12-16 18:46:18.290806	306	0.21	7511.91
329	4	2	146	2016-12-16 18:46:18.304101	2016-12-16 18:46:18.304101	308	0.2	4441.0
331	4	2	281	2016-12-16 18:46:18.313347	2016-12-16 18:46:18.313347	310	0.2	6082.6
332	4	2	281	2016-12-16 18:46:18.318716	2016-12-16 18:46:18.318716	311	0.25	7603.25
333	4	2	281	2016-12-16 18:46:18.323375	2016-12-16 18:46:18.323375	312	0.2	6082.6
334	4	2	281	2016-12-16 18:46:18.328005	2016-12-16 18:46:18.328005	313	1.5	45619.5
335	4	2	281	2016-12-16 18:46:18.332262	2016-12-16 18:46:18.332262	314	0.25	7603.25
336	4	2	53	2016-12-16 18:46:18.337123	2016-12-16 18:46:18.337123	315	0.22	1694.0
337	4	2	53	2016-12-16 18:46:18.34175	2016-12-16 18:46:18.34175	316	0.67	5159.0
338	4	2	53	2016-12-16 18:46:18.346233	2016-12-16 18:46:18.346233	317	0.14	1078.0
339	4	2	53	2016-12-16 18:46:18.350344	2016-12-16 18:46:18.350344	318	0.08	616.0
340	4	2	53	2016-12-16 18:46:18.355372	2016-12-16 18:46:18.355372	319	0.08	616.0
341	4	2	164	2016-12-16 18:46:18.359867	2016-12-16 18:46:18.359867	320	0.08	618.24
342	4	2	53	2016-12-16 18:46:18.364139	2016-12-16 18:46:18.364139	320	0.19	1463.0
343	4	2	53	2016-12-16 18:46:18.36834	2016-12-16 18:46:18.36834	321	1.33	10241.0
344	4	2	53	2016-12-16 18:46:18.372434	2016-12-16 18:46:18.372434	322	0.08	616.0
345	4	2	53	2016-12-16 18:46:18.376518	2016-12-16 18:46:18.376518	323	0.17	1309.0
346	4	2	268	2016-12-16 18:46:18.381403	2016-12-16 18:46:18.381403	324	0.25	2019.5
347	4	2	268	2016-12-16 18:46:18.385807	2016-12-16 18:46:18.385807	325	0.38	3069.64
348	4	2	268	2016-12-16 18:46:18.390243	2016-12-16 18:46:18.390243	326	0.35	2827.3
349	4	2	162	2016-12-16 18:46:18.395295	2016-12-16 18:46:18.395295	327	0.17	2089.64
350	4	2	162	2016-12-16 18:46:18.400036	2016-12-16 18:46:18.400036	328	0.25	3073.0
351	4	2	106	2016-12-16 18:46:18.405328	2016-12-16 18:46:18.405328	329	0.5	3832.0
352	4	2	53	2016-12-16 18:46:18.410247	2016-12-16 18:46:18.410247	330	0.75	5775.0
353	4	2	82	2016-12-16 18:46:18.414385	2016-12-16 18:46:18.414385	331	0.02	466.54
354	4	2	82	2016-12-16 18:46:18.418539	2016-12-16 18:46:18.418539	332	0.18	4198.86
355	4	2	142	2016-12-16 18:46:18.424701	2016-12-16 18:46:18.424701	333	0.33	2810.61
356	4	2	142	2016-12-16 18:46:18.428936	2016-12-16 18:46:18.428936	334	0.1	851.7
357	4	2	142	2016-12-16 18:46:18.434227	2016-12-16 18:46:18.434227	335	0.28	2384.76
358	4	2	217	2016-12-16 18:46:18.438556	2016-12-16 18:46:18.438556	336	0.21	7511.91
361	4	2	146	2016-12-16 18:46:18.454618	2016-12-16 18:46:18.454618	338	0.2	4441.0
363	4	2	281	2016-12-16 18:46:18.463601	2016-12-16 18:46:18.463601	340	0.2	6082.6
364	4	2	281	2016-12-16 18:46:18.468219	2016-12-16 18:46:18.468219	341	0.25	7603.25
365	4	2	281	2016-12-16 18:46:18.473773	2016-12-16 18:46:18.473773	342	0.2	6082.6
366	4	2	281	2016-12-16 18:46:18.478093	2016-12-16 18:46:18.478093	343	1.5	45619.5
367	4	2	281	2016-12-16 18:46:18.482571	2016-12-16 18:46:18.482571	344	0.25	7603.25
368	4	2	53	2016-12-16 18:46:18.486917	2016-12-16 18:46:18.486917	345	0.22	1694.0
369	4	2	53	2016-12-16 18:46:18.491356	2016-12-16 18:46:18.491356	346	0.67	5159.0
370	4	2	53	2016-12-16 18:46:18.495723	2016-12-16 18:46:18.495723	347	0.14	1078.0
371	4	2	53	2016-12-16 18:46:18.500282	2016-12-16 18:46:18.500282	348	0.08	616.0
372	4	2	53	2016-12-16 18:46:18.504705	2016-12-16 18:46:18.504705	349	0.08	616.0
373	4	2	164	2016-12-16 18:46:18.509436	2016-12-16 18:46:18.509436	350	0.08	618.24
374	4	2	53	2016-12-16 18:46:18.514164	2016-12-16 18:46:18.514164	350	0.19	1463.0
375	4	2	53	2016-12-16 18:46:18.518284	2016-12-16 18:46:18.518284	351	1.33	10241.0
376	4	2	53	2016-12-16 18:46:18.52251	2016-12-16 18:46:18.52251	352	0.08	616.0
377	4	2	53	2016-12-16 18:46:18.526862	2016-12-16 18:46:18.526862	353	0.17	1309.0
378	4	2	268	2016-12-16 18:46:18.531237	2016-12-16 18:46:18.531237	354	0.25	2019.5
379	4	2	268	2016-12-16 18:46:18.535338	2016-12-16 18:46:18.535338	355	0.38	3069.64
380	4	2	268	2016-12-16 18:46:18.539595	2016-12-16 18:46:18.539595	356	0.35	2827.3
381	4	2	162	2016-12-16 18:46:18.543697	2016-12-16 18:46:18.543697	357	0.17	2089.64
382	4	2	162	2016-12-16 18:46:18.547915	2016-12-16 18:46:18.547915	358	0.25	3073.0
383	4	2	106	2016-12-16 18:46:18.552316	2016-12-16 18:46:18.552316	359	0.5	3832.0
384	4	2	53	2016-12-16 18:46:18.556778	2016-12-16 18:46:18.556778	360	0.75	5775.0
298	4	2	146	2016-12-16 18:46:18.147256	2016-12-17 20:06:44.195675	279	1.5	33307.5
296	5	1	853	2016-12-16 18:46:18.136638	2016-12-17 20:38:04.359325	277	1.0	792.0
330	4	2	146	2016-12-16 18:46:18.308776	2016-12-17 21:00:20.913966	309	1.5	33307.5
359	4	2	217	2016-12-16 18:46:18.443087	2016-12-17 21:36:05.279037	337	2.0	71542.0
362	4	2	146	2016-12-16 18:46:18.459152	2016-12-17 21:36:28.821716	339	2.0	44410.0
385	4	2	82	2016-12-16 18:46:18.561073	2016-12-16 18:46:18.561073	361	0.02	466.54
386	4	2	82	2016-12-16 18:46:18.565314	2016-12-16 18:46:18.565314	362	0.18	4198.86
387	4	2	142	2016-12-16 18:46:18.569805	2016-12-16 18:46:18.569805	363	0.33	2810.61
388	4	2	142	2016-12-16 18:46:18.575045	2016-12-16 18:46:18.575045	364	0.1	851.7
389	4	2	142	2016-12-16 18:46:18.579469	2016-12-16 18:46:18.579469	365	0.28	2384.76
390	4	2	217	2016-12-16 18:46:18.585046	2016-12-16 18:46:18.585046	366	0.21	7511.91
393	4	2	146	2016-12-16 18:46:18.597805	2016-12-16 18:46:18.597805	368	0.2	4441.0
395	4	2	281	2016-12-16 18:46:18.606394	2016-12-16 18:46:18.606394	370	0.2	6082.6
396	4	2	281	2016-12-16 18:46:18.610623	2016-12-16 18:46:18.610623	371	0.25	7603.25
397	4	2	281	2016-12-16 18:46:18.614861	2016-12-16 18:46:18.614861	372	0.2	6082.6
398	4	2	281	2016-12-16 18:46:18.6194	2016-12-16 18:46:18.6194	373	1.5	45619.5
399	4	2	281	2016-12-16 18:46:18.623675	2016-12-16 18:46:18.623675	374	0.25	7603.25
400	4	2	53	2016-12-16 18:46:18.627802	2016-12-16 18:46:18.627802	375	0.22	1694.0
401	4	2	53	2016-12-16 18:46:18.632049	2016-12-16 18:46:18.632049	376	0.67	5159.0
402	4	2	53	2016-12-16 18:46:18.636763	2016-12-16 18:46:18.636763	377	0.14	1078.0
403	4	2	53	2016-12-16 18:46:18.641087	2016-12-16 18:46:18.641087	378	0.08	616.0
404	4	2	53	2016-12-16 18:46:18.645311	2016-12-16 18:46:18.645311	379	0.08	616.0
405	4	2	164	2016-12-16 18:46:18.649399	2016-12-16 18:46:18.649399	380	0.08	618.24
406	4	2	53	2016-12-16 18:46:18.653515	2016-12-16 18:46:18.653515	380	0.19	1463.0
407	4	2	53	2016-12-16 18:46:18.657573	2016-12-16 18:46:18.657573	381	1.33	10241.0
408	4	2	53	2016-12-16 18:46:18.66196	2016-12-16 18:46:18.66196	382	0.08	616.0
409	4	2	53	2016-12-16 18:46:18.667216	2016-12-16 18:46:18.667216	383	0.17	1309.0
410	4	2	268	2016-12-16 18:46:18.672154	2016-12-16 18:46:18.672154	384	0.25	2019.5
411	4	2	268	2016-12-16 18:46:18.677367	2016-12-16 18:46:18.677367	385	0.38	3069.64
412	4	2	268	2016-12-16 18:46:18.681977	2016-12-16 18:46:18.681977	386	0.35	2827.3
413	4	2	162	2016-12-16 18:46:18.686362	2016-12-16 18:46:18.686362	387	0.17	2089.64
414	4	2	162	2016-12-16 18:46:18.690816	2016-12-16 18:46:18.690816	388	0.25	3073.0
415	4	2	106	2016-12-16 18:46:18.695122	2016-12-16 18:46:18.695122	389	0.5	3832.0
416	4	2	53	2016-12-16 18:46:18.699478	2016-12-16 18:46:18.699478	390	0.75	5775.0
417	4	2	82	2016-12-16 18:46:18.703822	2016-12-16 18:46:18.703822	391	0.02	466.54
418	4	2	82	2016-12-16 18:46:18.707863	2016-12-16 18:46:18.707863	392	0.18	4198.86
419	4	2	142	2016-12-16 18:46:18.712031	2016-12-16 18:46:18.712031	393	0.33	2810.61
420	4	2	142	2016-12-16 18:46:18.716469	2016-12-16 18:46:18.716469	394	0.1	851.7
421	4	2	142	2016-12-16 18:46:18.720952	2016-12-16 18:46:18.720952	395	0.28	2384.76
422	4	2	217	2016-12-16 18:46:18.725067	2016-12-16 18:46:18.725067	396	0.21	7511.91
424	5	1	853	2016-12-16 18:46:18.733326	2016-12-16 18:46:18.733326	397	2.0	1584.0
425	4	2	146	2016-12-16 18:46:18.737856	2016-12-16 18:46:18.737856	398	0.2	4441.0
427	4	2	281	2016-12-16 18:46:18.746715	2016-12-16 18:46:18.746715	400	0.2	6082.6
428	4	2	281	2016-12-16 18:46:18.751093	2016-12-16 18:46:18.751093	401	0.25	7603.25
429	4	2	281	2016-12-16 18:46:18.755196	2016-12-16 18:46:18.755196	402	0.2	6082.6
430	4	2	281	2016-12-16 18:46:18.759491	2016-12-16 18:46:18.759491	403	1.5	45619.5
431	4	2	281	2016-12-16 18:46:18.763828	2016-12-16 18:46:18.763828	404	0.25	7603.25
432	4	2	53	2016-12-16 18:46:18.767974	2016-12-16 18:46:18.767974	405	0.22	1694.0
433	4	2	53	2016-12-16 18:46:18.772052	2016-12-16 18:46:18.772052	406	0.67	5159.0
434	4	2	53	2016-12-16 18:46:18.776117	2016-12-16 18:46:18.776117	407	0.14	1078.0
435	4	2	53	2016-12-16 18:46:18.780442	2016-12-16 18:46:18.780442	408	0.08	616.0
436	4	2	53	2016-12-16 18:46:18.784692	2016-12-16 18:46:18.784692	409	0.08	616.0
437	4	2	164	2016-12-16 18:46:18.788976	2016-12-16 18:46:18.788976	410	0.08	618.24
438	4	2	53	2016-12-16 18:46:18.793024	2016-12-16 18:46:18.793024	410	0.19	1463.0
439	4	2	53	2016-12-16 18:46:18.797187	2016-12-16 18:46:18.797187	411	1.33	10241.0
440	4	2	53	2016-12-16 18:46:18.801426	2016-12-16 18:46:18.801426	412	0.08	616.0
441	4	2	53	2016-12-16 18:46:18.805567	2016-12-16 18:46:18.805567	413	0.17	1309.0
442	4	2	268	2016-12-16 18:46:18.809758	2016-12-16 18:46:18.809758	414	0.25	2019.5
443	4	2	268	2016-12-16 18:46:18.814081	2016-12-16 18:46:18.814081	415	0.38	3069.64
444	4	2	268	2016-12-16 18:46:18.818552	2016-12-16 18:46:18.818552	416	0.35	2827.3
445	4	2	162	2016-12-16 18:46:18.823156	2016-12-16 18:46:18.823156	417	0.17	2089.64
446	4	2	162	2016-12-16 18:46:18.827421	2016-12-16 18:46:18.827421	418	0.25	3073.0
447	4	2	106	2016-12-16 18:46:18.832063	2016-12-16 18:46:18.832063	419	0.5	3832.0
448	4	2	53	2016-12-16 18:46:18.836194	2016-12-16 18:46:18.836194	420	0.75	5775.0
449	4	2	82	2016-12-16 18:46:18.840221	2016-12-16 18:46:18.840221	421	0.02	466.54
450	4	2	82	2016-12-16 18:46:18.845078	2016-12-16 18:46:18.845078	422	0.18	4198.86
451	4	2	142	2016-12-16 18:46:18.849817	2016-12-16 18:46:18.849817	423	0.33	2810.61
452	4	2	142	2016-12-16 18:46:18.853967	2016-12-16 18:46:18.853967	424	0.1	851.7
453	4	2	142	2016-12-16 18:46:18.858176	2016-12-16 18:46:18.858176	425	0.28	2384.76
454	4	2	217	2016-12-16 18:46:18.862181	2016-12-16 18:46:18.862181	426	0.21	7511.91
456	5	1	853	2016-12-16 18:46:18.870892	2016-12-16 18:46:18.870892	427	2.0	1584.0
457	4	2	146	2016-12-16 18:46:18.876664	2016-12-16 18:46:18.876664	428	0.2	4441.0
459	4	2	281	2016-12-16 18:46:18.885203	2016-12-16 18:46:18.885203	430	0.2	6082.6
460	4	2	281	2016-12-16 18:46:18.889485	2016-12-16 18:46:18.889485	431	0.25	7603.25
461	4	2	281	2016-12-16 18:46:18.893656	2016-12-16 18:46:18.893656	432	0.2	6082.6
462	4	2	281	2016-12-16 18:46:18.903643	2016-12-16 18:46:18.903643	433	1.5	45619.5
463	4	2	281	2016-12-16 18:46:18.908641	2016-12-16 18:46:18.908641	434	0.25	7603.25
464	4	2	53	2016-12-16 18:46:18.913108	2016-12-16 18:46:18.913108	435	0.22	1694.0
465	4	2	53	2016-12-16 18:46:18.917829	2016-12-16 18:46:18.917829	436	0.67	5159.0
466	4	2	53	2016-12-16 18:46:18.922597	2016-12-16 18:46:18.922597	437	0.14	1078.0
467	4	2	53	2016-12-16 18:46:18.927034	2016-12-16 18:46:18.927034	438	0.08	616.0
468	4	2	53	2016-12-16 18:46:18.931581	2016-12-16 18:46:18.931581	439	0.08	616.0
469	4	2	164	2016-12-16 18:46:18.936032	2016-12-16 18:46:18.936032	440	0.08	618.24
470	4	2	53	2016-12-16 18:46:18.940468	2016-12-16 18:46:18.940468	440	0.19	1463.0
471	4	2	53	2016-12-16 18:46:18.944916	2016-12-16 18:46:18.944916	441	1.33	10241.0
472	4	2	53	2016-12-16 18:46:18.955042	2016-12-16 18:46:18.955042	442	0.08	616.0
473	4	2	53	2016-12-16 18:46:18.959651	2016-12-16 18:46:18.959651	443	0.17	1309.0
474	4	2	268	2016-12-16 18:46:18.963931	2016-12-16 18:46:18.963931	444	0.25	2019.5
475	4	2	268	2016-12-16 18:46:18.968451	2016-12-16 18:46:18.968451	445	0.38	3069.64
476	4	2	268	2016-12-16 18:46:18.972768	2016-12-16 18:46:18.972768	446	0.35	2827.3
477	4	2	162	2016-12-16 18:46:18.977203	2016-12-16 18:46:18.977203	447	0.17	2089.64
478	4	2	162	2016-12-16 18:46:18.982013	2016-12-16 18:46:18.982013	448	0.25	3073.0
479	4	2	106	2016-12-16 18:46:18.986287	2016-12-16 18:46:18.986287	449	0.5	3832.0
480	4	2	53	2016-12-16 18:46:18.990753	2016-12-16 18:46:18.990753	450	0.75	5775.0
394	4	2	146	2016-12-16 18:46:18.602407	2016-12-18 20:12:30.055328	369	2.0	44410.0
423	4	2	217	2016-12-16 18:46:18.72907	2016-12-19 14:25:07.656674	397	1.5	53656.5
426	4	2	146	2016-12-16 18:46:18.742272	2016-12-19 14:26:05.162848	399	1.5	33307.5
455	4	2	217	2016-12-16 18:46:18.866502	2016-12-19 14:27:36.411893	427	1.5	53656.5
458	4	2	146	2016-12-16 18:46:18.880953	2016-12-19 14:28:22.485728	429	1.5	33307.5
481	4	2	82	2016-12-16 18:46:18.994846	2016-12-16 18:46:18.994846	451	0.02	466.54
482	4	2	82	2016-12-16 18:46:18.998893	2016-12-16 18:46:18.998893	452	0.18	4198.86
483	4	2	142	2016-12-16 18:46:19.003329	2016-12-16 18:46:19.003329	453	0.33	2810.61
484	4	2	142	2016-12-16 18:46:19.007783	2016-12-16 18:46:19.007783	454	0.1	851.7
485	4	2	142	2016-12-16 18:46:19.011891	2016-12-16 18:46:19.011891	455	0.28	2384.76
486	4	2	217	2016-12-16 18:46:19.015852	2016-12-16 18:46:19.015852	456	0.21	7511.91
489	4	2	146	2016-12-16 18:46:19.029887	2016-12-16 18:46:19.029887	458	0.2	4441.0
491	4	2	281	2016-12-16 18:46:19.038251	2016-12-16 18:46:19.038251	460	0.2	6082.6
492	4	2	281	2016-12-16 18:46:19.042601	2016-12-16 18:46:19.042601	461	0.25	7603.25
493	4	2	281	2016-12-16 18:46:19.0469	2016-12-16 18:46:19.0469	462	0.2	6082.6
494	4	2	281	2016-12-16 18:46:19.050993	2016-12-16 18:46:19.050993	463	1.5	45619.5
495	4	2	281	2016-12-16 18:46:19.055498	2016-12-16 18:46:19.055498	464	0.25	7603.25
496	4	2	53	2016-12-16 18:46:19.059968	2016-12-16 18:46:19.059968	465	0.22	1694.0
497	4	2	53	2016-12-16 18:46:19.066207	2016-12-16 18:46:19.066207	466	0.67	5159.0
498	4	2	53	2016-12-16 18:46:19.070811	2016-12-16 18:46:19.070811	467	0.14	1078.0
499	4	2	53	2016-12-16 18:46:19.075248	2016-12-16 18:46:19.075248	468	0.08	616.0
500	4	2	53	2016-12-16 18:46:19.079532	2016-12-16 18:46:19.079532	469	0.08	616.0
501	4	2	164	2016-12-16 18:46:19.084472	2016-12-16 18:46:19.084472	470	0.08	618.24
502	4	2	53	2016-12-16 18:46:19.088674	2016-12-16 18:46:19.088674	470	0.19	1463.0
503	4	2	53	2016-12-16 18:46:19.093228	2016-12-16 18:46:19.093228	471	1.33	10241.0
504	4	2	53	2016-12-16 18:46:19.097241	2016-12-16 18:46:19.097241	472	0.08	616.0
505	4	2	53	2016-12-16 18:46:19.102093	2016-12-16 18:46:19.102093	473	0.17	1309.0
506	4	2	268	2016-12-16 18:46:19.106619	2016-12-16 18:46:19.106619	474	0.25	2019.5
507	4	2	268	2016-12-16 18:46:19.110954	2016-12-16 18:46:19.110954	475	0.38	3069.64
508	4	2	268	2016-12-16 18:46:19.11531	2016-12-16 18:46:19.11531	476	0.35	2827.3
509	4	2	162	2016-12-16 18:46:19.119854	2016-12-16 18:46:19.119854	477	0.17	2089.64
510	4	2	162	2016-12-16 18:46:19.124901	2016-12-16 18:46:19.124901	478	0.25	3073.0
511	4	2	106	2016-12-16 18:46:19.129332	2016-12-16 18:46:19.129332	479	0.5	3832.0
512	4	2	53	2016-12-16 18:46:19.133822	2016-12-16 18:46:19.133822	480	0.75	5775.0
513	4	2	82	2016-12-16 18:46:19.138049	2016-12-16 18:46:19.138049	481	0.02	466.54
514	4	2	82	2016-12-16 18:46:19.143656	2016-12-16 18:46:19.143656	482	0.18	4198.86
515	4	2	142	2016-12-16 18:46:19.149012	2016-12-16 18:46:19.149012	483	0.33	2810.61
516	4	2	142	2016-12-16 18:46:19.152995	2016-12-16 18:46:19.152995	484	0.1	851.7
517	4	2	142	2016-12-16 18:46:19.157874	2016-12-16 18:46:19.157874	485	0.28	2384.76
518	4	2	217	2016-12-16 18:46:19.162731	2016-12-16 18:46:19.162731	486	0.21	7511.91
521	4	2	146	2016-12-16 18:46:19.176948	2016-12-16 18:46:19.176948	488	0.2	4441.0
523	4	2	281	2016-12-16 18:46:19.185852	2016-12-16 18:46:19.185852	490	0.2	6082.6
524	4	2	281	2016-12-16 18:46:19.190119	2016-12-16 18:46:19.190119	491	0.25	7603.25
525	4	2	281	2016-12-16 18:46:19.194826	2016-12-16 18:46:19.194826	492	0.2	6082.6
526	4	2	281	2016-12-16 18:46:19.199652	2016-12-16 18:46:19.199652	493	1.5	45619.5
527	4	2	281	2016-12-16 18:46:19.204635	2016-12-16 18:46:19.204635	494	0.25	7603.25
528	4	2	53	2016-12-16 18:46:19.208902	2016-12-16 18:46:19.208902	495	0.22	1694.0
529	4	2	53	2016-12-16 18:46:19.213416	2016-12-16 18:46:19.213416	496	0.67	5159.0
530	4	2	53	2016-12-16 18:46:19.217867	2016-12-16 18:46:19.217867	497	0.14	1078.0
531	4	2	53	2016-12-16 18:46:19.221798	2016-12-16 18:46:19.221798	498	0.08	616.0
532	4	2	53	2016-12-16 18:46:19.226835	2016-12-16 18:46:19.226835	499	0.08	616.0
533	4	2	164	2016-12-16 18:46:19.231582	2016-12-16 18:46:19.231582	500	0.08	618.24
534	4	2	53	2016-12-16 18:46:19.236691	2016-12-16 18:46:19.236691	500	0.19	1463.0
535	4	2	53	2016-12-16 18:46:19.240819	2016-12-16 18:46:19.240819	501	1.33	10241.0
536	4	2	53	2016-12-16 18:46:19.244779	2016-12-16 18:46:19.244779	502	0.08	616.0
537	4	2	53	2016-12-16 18:46:19.248904	2016-12-16 18:46:19.248904	503	0.17	1309.0
538	4	2	268	2016-12-16 18:46:19.258013	2016-12-16 18:46:19.258013	504	0.25	2019.5
539	4	2	268	2016-12-16 18:46:19.262997	2016-12-16 18:46:19.262997	505	0.38	3069.64
540	4	2	268	2016-12-16 18:46:19.26742	2016-12-16 18:46:19.26742	506	0.35	2827.3
541	4	2	162	2016-12-16 18:46:19.271838	2016-12-16 18:46:19.271838	507	0.17	2089.64
542	4	2	162	2016-12-16 18:46:19.275833	2016-12-16 18:46:19.275833	508	0.25	3073.0
543	4	2	106	2016-12-16 18:46:19.280222	2016-12-16 18:46:19.280222	509	0.5	3832.0
544	4	2	53	2016-12-16 18:46:19.284065	2016-12-16 18:46:19.284065	510	0.75	5775.0
545	4	2	82	2016-12-16 18:46:19.289151	2016-12-16 18:46:19.289151	511	0.02	466.54
546	4	2	82	2016-12-16 18:46:19.293612	2016-12-16 18:46:19.293612	512	0.18	4198.86
547	4	2	142	2016-12-16 18:46:19.301383	2016-12-16 18:46:19.301383	513	0.33	2810.61
548	4	2	142	2016-12-16 18:46:19.307551	2016-12-16 18:46:19.307551	514	0.1	851.7
549	4	2	142	2016-12-16 18:46:19.311856	2016-12-16 18:46:19.311856	515	0.28	2384.76
550	4	2	217	2016-12-16 18:46:19.316354	2016-12-16 18:46:19.316354	516	0.21	7511.91
553	4	2	146	2016-12-16 18:46:19.329944	2016-12-16 18:46:19.329944	518	0.2	4441.0
555	4	2	281	2016-12-16 18:46:19.338045	2016-12-16 18:46:19.338045	520	0.2	6082.6
556	4	2	281	2016-12-16 18:46:19.342048	2016-12-16 18:46:19.342048	521	0.25	7603.25
557	4	2	281	2016-12-16 18:46:19.34707	2016-12-16 18:46:19.34707	522	0.2	6082.6
558	4	2	281	2016-12-16 18:46:19.351413	2016-12-16 18:46:19.351413	523	1.5	45619.5
559	4	2	281	2016-12-16 18:46:19.355889	2016-12-16 18:46:19.355889	524	0.25	7603.25
560	4	2	53	2016-12-16 18:46:19.360439	2016-12-16 18:46:19.360439	525	0.22	1694.0
561	4	2	53	2016-12-16 18:46:19.364793	2016-12-16 18:46:19.364793	526	0.67	5159.0
562	4	2	53	2016-12-16 18:46:19.368927	2016-12-16 18:46:19.368927	527	0.14	1078.0
563	4	2	53	2016-12-16 18:46:19.373145	2016-12-16 18:46:19.373145	528	0.08	616.0
564	4	2	53	2016-12-16 18:46:19.377693	2016-12-16 18:46:19.377693	529	0.08	616.0
565	4	2	164	2016-12-16 18:46:19.381995	2016-12-16 18:46:19.381995	530	0.08	618.24
566	4	2	53	2016-12-16 18:46:19.386385	2016-12-16 18:46:19.386385	530	0.19	1463.0
567	4	2	53	2016-12-16 18:46:19.39085	2016-12-16 18:46:19.39085	531	1.33	10241.0
568	4	2	53	2016-12-16 18:46:19.395933	2016-12-16 18:46:19.395933	532	0.08	616.0
569	4	2	53	2016-12-16 18:46:19.400062	2016-12-16 18:46:19.400062	533	0.17	1309.0
570	4	2	268	2016-12-16 18:46:19.404328	2016-12-16 18:46:19.404328	534	0.25	2019.5
571	4	2	268	2016-12-16 18:46:19.408441	2016-12-16 18:46:19.408441	535	0.38	3069.64
572	4	2	268	2016-12-16 18:46:19.41249	2016-12-16 18:46:19.41249	536	0.35	2827.3
573	4	2	162	2016-12-16 18:46:19.416944	2016-12-16 18:46:19.416944	537	0.17	2089.64
574	4	2	162	2016-12-16 18:46:19.421514	2016-12-16 18:46:19.421514	538	0.25	3073.0
575	4	2	106	2016-12-16 18:46:19.425587	2016-12-16 18:46:19.425587	539	0.5	3832.0
576	4	2	53	2016-12-16 18:46:19.429475	2016-12-16 18:46:19.429475	540	0.75	5775.0
490	4	2	146	2016-12-16 18:46:19.034113	2016-12-19 14:30:23.105545	459	1.5	33307.5
519	4	2	217	2016-12-16 18:46:19.167278	2016-12-19 14:31:18.928105	487	1.5	53656.5
551	4	2	217	2016-12-16 18:46:19.321339	2016-12-19 14:33:09.273224	517	1.5	53656.5
554	4	2	146	2016-12-16 18:46:19.33402	2016-12-19 14:33:59.985023	519	1.5	33307.5
520	5	1	853	2016-12-16 18:46:19.171679	2016-12-19 17:59:18.196916	487	3.0	2376.0
552	5	1	853	2016-12-16 18:46:19.325721	2016-12-19 18:28:22.103013	517	3.0	2376.0
488	5	1	853	2016-12-16 18:46:19.025461	2016-12-20 14:43:07.329265	457	12.0	9504.0
577	4	2	82	2016-12-16 18:46:19.433883	2016-12-16 18:46:19.433883	541	0.02	466.54
578	4	2	82	2016-12-16 18:46:19.438226	2016-12-16 18:46:19.438226	542	0.18	4198.86
579	4	2	142	2016-12-16 18:46:19.442668	2016-12-16 18:46:19.442668	543	0.33	2810.61
580	4	2	142	2016-12-16 18:46:19.446983	2016-12-16 18:46:19.446983	544	0.1	851.7
581	4	2	142	2016-12-16 18:46:19.451934	2016-12-16 18:46:19.451934	545	0.28	2384.76
582	4	2	217	2016-12-16 18:46:19.456041	2016-12-16 18:46:19.456041	546	0.21	7511.91
584	5	1	853	2016-12-16 18:46:19.464617	2016-12-16 18:46:19.464617	547	2.0	1584.0
585	4	2	146	2016-12-16 18:46:19.468513	2016-12-16 18:46:19.468513	548	0.2	4441.0
586	4	2	146	2016-12-16 18:46:19.472576	2016-12-16 18:46:19.472576	549	0.86	19096.3
587	4	2	281	2016-12-16 18:46:19.477007	2016-12-16 18:46:19.477007	550	0.2	6082.6
588	4	2	281	2016-12-16 18:46:19.481155	2016-12-16 18:46:19.481155	551	0.25	7603.25
589	4	2	281	2016-12-16 18:46:19.485468	2016-12-16 18:46:19.485468	552	0.2	6082.6
590	4	2	281	2016-12-16 18:46:19.489744	2016-12-16 18:46:19.489744	553	1.5	45619.5
591	4	2	281	2016-12-16 18:46:19.493692	2016-12-16 18:46:19.493692	554	0.25	7603.25
592	4	2	53	2016-12-16 18:46:19.498097	2016-12-16 18:46:19.498097	555	0.22	1694.0
593	4	2	53	2016-12-16 18:46:19.502423	2016-12-16 18:46:19.502423	556	0.67	5159.0
594	4	2	53	2016-12-16 18:46:19.506436	2016-12-16 18:46:19.506436	557	0.14	1078.0
595	4	2	53	2016-12-16 18:46:19.510547	2016-12-16 18:46:19.510547	558	0.08	616.0
596	4	2	53	2016-12-16 18:46:19.514476	2016-12-16 18:46:19.514476	559	0.08	616.0
597	4	2	164	2016-12-16 18:46:19.519214	2016-12-16 18:46:19.519214	560	0.08	618.24
598	4	2	53	2016-12-16 18:46:19.523376	2016-12-16 18:46:19.523376	560	0.19	1463.0
599	4	2	53	2016-12-16 18:46:19.527467	2016-12-16 18:46:19.527467	561	1.33	10241.0
600	4	2	53	2016-12-16 18:46:19.5316	2016-12-16 18:46:19.5316	562	0.08	616.0
601	4	2	53	2016-12-16 18:46:19.535534	2016-12-16 18:46:19.535534	563	0.17	1309.0
602	4	2	268	2016-12-16 18:46:19.539667	2016-12-16 18:46:19.539667	564	0.25	2019.5
603	4	2	268	2016-12-16 18:46:19.543998	2016-12-16 18:46:19.543998	565	0.38	3069.64
604	4	2	268	2016-12-16 18:46:19.548481	2016-12-16 18:46:19.548481	566	0.35	2827.3
605	4	2	162	2016-12-16 18:46:19.552536	2016-12-16 18:46:19.552536	567	0.17	2089.64
606	4	2	162	2016-12-16 18:46:19.556766	2016-12-16 18:46:19.556766	568	0.25	3073.0
607	4	2	106	2016-12-16 18:46:19.561202	2016-12-16 18:46:19.561202	569	0.5	3832.0
608	4	2	53	2016-12-16 18:46:19.565367	2016-12-16 18:46:19.565367	570	0.75	5775.0
609	4	2	82	2016-12-16 18:46:19.569382	2016-12-16 18:46:19.569382	571	0.02	466.54
610	4	2	82	2016-12-16 18:46:19.573453	2016-12-16 18:46:19.573453	572	0.18	4198.86
611	4	2	142	2016-12-16 18:46:19.577576	2016-12-16 18:46:19.577576	573	0.33	2810.61
612	4	2	142	2016-12-16 18:46:19.581911	2016-12-16 18:46:19.581911	574	0.1	851.7
613	4	2	142	2016-12-16 18:46:19.586247	2016-12-16 18:46:19.586247	575	0.28	2384.76
614	4	2	217	2016-12-16 18:46:19.590611	2016-12-16 18:46:19.590611	576	0.21	7511.91
616	5	1	853	2016-12-16 18:46:19.599129	2016-12-16 18:46:19.599129	577	2.0	1584.0
617	4	2	146	2016-12-16 18:46:19.603319	2016-12-16 18:46:19.603319	578	0.2	4441.0
619	4	2	281	2016-12-16 18:46:19.612886	2016-12-16 18:46:19.612886	580	0.2	6082.6
620	4	2	281	2016-12-16 18:46:19.616991	2016-12-16 18:46:19.616991	581	0.25	7603.25
621	4	2	281	2016-12-16 18:46:19.621298	2016-12-16 18:46:19.621298	582	0.2	6082.6
622	4	2	281	2016-12-16 18:46:19.625589	2016-12-16 18:46:19.625589	583	1.5	45619.5
623	4	2	281	2016-12-16 18:46:19.630092	2016-12-16 18:46:19.630092	584	0.25	7603.25
624	4	2	53	2016-12-16 18:46:19.634377	2016-12-16 18:46:19.634377	585	0.22	1694.0
625	4	2	53	2016-12-16 18:46:19.63856	2016-12-16 18:46:19.63856	586	0.67	5159.0
626	4	2	53	2016-12-16 18:46:19.642541	2016-12-16 18:46:19.642541	587	0.14	1078.0
627	4	2	53	2016-12-16 18:46:19.64656	2016-12-16 18:46:19.64656	588	0.08	616.0
628	4	2	53	2016-12-16 18:46:19.650976	2016-12-16 18:46:19.650976	589	0.08	616.0
629	4	2	164	2016-12-16 18:46:19.655342	2016-12-16 18:46:19.655342	590	0.08	618.24
630	4	2	53	2016-12-16 18:46:19.659393	2016-12-16 18:46:19.659393	590	0.19	1463.0
631	4	2	53	2016-12-16 18:46:19.663377	2016-12-16 18:46:19.663377	591	1.33	10241.0
632	4	2	53	2016-12-16 18:46:19.667401	2016-12-16 18:46:19.667401	592	0.08	616.0
633	4	2	53	2016-12-16 18:46:19.678835	2016-12-16 18:46:19.678835	593	0.17	1309.0
634	4	2	268	2016-12-16 18:46:19.683593	2016-12-16 18:46:19.683593	594	0.25	2019.5
635	4	2	268	2016-12-16 18:46:19.687726	2016-12-16 18:46:19.687726	595	0.38	3069.64
636	4	2	268	2016-12-16 18:46:19.693935	2016-12-16 18:46:19.693935	596	0.35	2827.3
637	4	2	162	2016-12-16 18:46:19.698557	2016-12-16 18:46:19.698557	597	0.17	2089.64
638	4	2	162	2016-12-16 18:46:19.702663	2016-12-16 18:46:19.702663	598	0.25	3073.0
639	4	2	106	2016-12-16 18:46:19.707456	2016-12-16 18:46:19.707456	599	0.5	3832.0
640	4	2	53	2016-12-16 18:46:19.712076	2016-12-16 18:46:19.712076	600	0.75	5775.0
641	4	2	82	2016-12-16 18:46:19.716364	2016-12-16 18:46:19.716364	601	0.02	466.54
642	4	2	82	2016-12-16 18:46:19.72099	2016-12-16 18:46:19.72099	602	0.18	4198.86
643	4	2	142	2016-12-16 18:46:19.725622	2016-12-16 18:46:19.725622	603	0.33	2810.61
644	4	2	142	2016-12-16 18:46:19.736177	2016-12-16 18:46:19.736177	604	0.1	851.7
645	4	2	142	2016-12-16 18:46:19.742886	2016-12-16 18:46:19.742886	605	0.28	2384.76
646	4	2	217	2016-12-16 18:46:19.748547	2016-12-16 18:46:19.748547	606	0.21	7511.91
648	5	1	853	2016-12-16 18:46:19.757751	2016-12-16 18:46:19.757751	607	2.0	1584.0
649	4	2	146	2016-12-16 18:46:19.762443	2016-12-16 18:46:19.762443	608	0.2	4441.0
651	4	2	281	2016-12-16 18:46:19.774628	2016-12-16 18:46:19.774628	610	0.2	6082.6
652	4	2	281	2016-12-16 18:46:19.780469	2016-12-16 18:46:19.780469	611	0.25	7603.25
653	4	2	281	2016-12-16 18:46:19.784724	2016-12-16 18:46:19.784724	612	0.2	6082.6
654	4	2	281	2016-12-16 18:46:19.789095	2016-12-16 18:46:19.789095	613	1.5	45619.5
655	4	2	281	2016-12-16 18:46:19.793443	2016-12-16 18:46:19.793443	614	0.25	7603.25
656	4	2	53	2016-12-16 18:46:19.797618	2016-12-16 18:46:19.797618	615	0.22	1694.0
657	4	2	53	2016-12-16 18:46:19.802039	2016-12-16 18:46:19.802039	616	0.67	5159.0
658	4	2	53	2016-12-16 18:46:19.806693	2016-12-16 18:46:19.806693	617	0.14	1078.0
659	4	2	53	2016-12-16 18:46:19.8114	2016-12-16 18:46:19.8114	618	0.08	616.0
660	4	2	53	2016-12-16 18:46:19.815411	2016-12-16 18:46:19.815411	619	0.08	616.0
661	4	2	164	2016-12-16 18:46:19.819838	2016-12-16 18:46:19.819838	620	0.08	618.24
662	4	2	53	2016-12-16 18:46:19.824207	2016-12-16 18:46:19.824207	620	0.19	1463.0
663	4	2	53	2016-12-16 18:46:19.828605	2016-12-16 18:46:19.828605	621	1.33	10241.0
664	4	2	53	2016-12-16 18:46:19.833057	2016-12-16 18:46:19.833057	622	0.08	616.0
665	4	2	53	2016-12-16 18:46:19.837352	2016-12-16 18:46:19.837352	623	0.17	1309.0
666	4	2	268	2016-12-16 18:46:19.841975	2016-12-16 18:46:19.841975	624	0.25	2019.5
667	4	2	268	2016-12-16 18:46:19.846983	2016-12-16 18:46:19.846983	625	0.38	3069.64
668	4	2	268	2016-12-16 18:46:19.851472	2016-12-16 18:46:19.851472	626	0.35	2827.3
669	4	2	162	2016-12-16 18:46:19.856065	2016-12-16 18:46:19.856065	627	0.17	2089.64
670	4	2	162	2016-12-16 18:46:19.860881	2016-12-16 18:46:19.860881	628	0.25	3073.0
671	4	2	106	2016-12-16 18:46:19.865527	2016-12-16 18:46:19.865527	629	0.5	3832.0
672	4	2	53	2016-12-16 18:46:19.869864	2016-12-16 18:46:19.869864	630	0.75	5775.0
615	4	2	217	2016-12-16 18:46:19.594798	2016-12-19 14:36:30.802977	577	1.5	53656.5
618	4	2	146	2016-12-16 18:46:19.608132	2016-12-19 14:37:21.322853	579	1.5	33307.5
650	4	2	146	2016-12-16 18:46:19.7684	2016-12-19 14:39:11.904866	609	1.5	33307.5
673	4	2	82	2016-12-16 18:46:19.874276	2016-12-16 18:46:19.874276	631	0.02	466.54
674	4	2	82	2016-12-16 18:46:19.878945	2016-12-16 18:46:19.878945	632	0.18	4198.86
675	4	2	142	2016-12-16 18:46:19.883136	2016-12-16 18:46:19.883136	633	0.33	2810.61
676	4	2	142	2016-12-16 18:46:19.887489	2016-12-16 18:46:19.887489	634	0.1	851.7
677	4	2	142	2016-12-16 18:46:19.891773	2016-12-16 18:46:19.891773	635	0.28	2384.76
678	4	2	217	2016-12-16 18:46:19.896251	2016-12-16 18:46:19.896251	636	0.21	7511.91
681	4	2	146	2016-12-16 18:46:19.909521	2016-12-16 18:46:19.909521	638	0.2	4441.0
683	4	2	281	2016-12-16 18:46:19.917759	2016-12-16 18:46:19.917759	640	0.2	6082.6
684	4	2	281	2016-12-16 18:46:19.921788	2016-12-16 18:46:19.921788	641	0.25	7603.25
685	4	2	281	2016-12-16 18:46:19.925894	2016-12-16 18:46:19.925894	642	0.2	6082.6
686	4	2	281	2016-12-16 18:46:19.930698	2016-12-16 18:46:19.930698	643	1.5	45619.5
687	4	2	281	2016-12-16 18:46:19.935079	2016-12-16 18:46:19.935079	644	0.25	7603.25
688	4	2	53	2016-12-16 18:46:19.939385	2016-12-16 18:46:19.939385	645	0.22	1694.0
689	4	2	53	2016-12-16 18:46:19.943972	2016-12-16 18:46:19.943972	646	0.67	5159.0
690	4	2	53	2016-12-16 18:46:19.948346	2016-12-16 18:46:19.948346	647	0.14	1078.0
691	4	2	53	2016-12-16 18:46:19.952421	2016-12-16 18:46:19.952421	648	0.08	616.0
692	4	2	53	2016-12-16 18:46:19.956957	2016-12-16 18:46:19.956957	649	0.08	616.0
693	4	2	164	2016-12-16 18:46:19.961342	2016-12-16 18:46:19.961342	650	0.08	618.24
694	4	2	53	2016-12-16 18:46:19.966092	2016-12-16 18:46:19.966092	650	0.19	1463.0
695	4	2	53	2016-12-16 18:46:19.970345	2016-12-16 18:46:19.970345	651	1.33	10241.0
696	4	2	53	2016-12-16 18:46:19.975293	2016-12-16 18:46:19.975293	652	0.08	616.0
697	4	2	53	2016-12-16 18:46:19.979545	2016-12-16 18:46:19.979545	653	0.17	1309.0
698	4	2	268	2016-12-16 18:46:19.984084	2016-12-16 18:46:19.984084	654	0.25	2019.5
699	4	2	268	2016-12-16 18:46:19.988343	2016-12-16 18:46:19.988343	655	0.38	3069.64
700	4	2	268	2016-12-16 18:46:19.992484	2016-12-16 18:46:19.992484	656	0.35	2827.3
701	4	2	162	2016-12-16 18:46:19.996597	2016-12-16 18:46:19.996597	657	0.17	2089.64
702	4	2	162	2016-12-16 18:46:20.000615	2016-12-16 18:46:20.000615	658	0.25	3073.0
703	4	2	106	2016-12-16 18:46:20.005017	2016-12-16 18:46:20.005017	659	0.5	3832.0
704	4	2	53	2016-12-16 18:46:20.009568	2016-12-16 18:46:20.009568	660	0.75	5775.0
705	4	2	82	2016-12-16 18:46:20.013949	2016-12-16 18:46:20.013949	661	0.02	466.54
706	4	2	82	2016-12-16 18:46:20.01843	2016-12-16 18:46:20.01843	662	0.18	4198.86
707	4	2	142	2016-12-16 18:46:20.022593	2016-12-16 18:46:20.022593	663	0.33	2810.61
708	4	2	142	2016-12-16 18:46:20.026629	2016-12-16 18:46:20.026629	664	0.1	851.7
709	4	2	142	2016-12-16 18:46:20.030928	2016-12-16 18:46:20.030928	665	0.28	2384.76
710	4	2	217	2016-12-16 18:46:20.035695	2016-12-16 18:46:20.035695	666	0.21	7511.91
712	5	1	853	2016-12-16 18:46:20.044525	2016-12-16 18:46:20.044525	667	2.0	1584.0
713	4	2	146	2016-12-16 18:46:20.048559	2016-12-16 18:46:20.048559	668	0.2	4441.0
715	4	2	281	2016-12-16 18:46:20.057347	2016-12-16 18:46:20.057347	670	0.2	6082.6
716	4	2	281	2016-12-16 18:46:20.061508	2016-12-16 18:46:20.061508	671	0.25	7603.25
717	4	2	281	2016-12-16 18:46:20.06615	2016-12-16 18:46:20.06615	672	0.2	6082.6
718	4	2	281	2016-12-16 18:46:20.070772	2016-12-16 18:46:20.070772	673	1.5	45619.5
719	4	2	281	2016-12-16 18:46:20.075834	2016-12-16 18:46:20.075834	674	0.25	7603.25
720	4	2	53	2016-12-16 18:46:20.080109	2016-12-16 18:46:20.080109	675	0.22	1694.0
721	4	2	53	2016-12-16 18:46:20.084578	2016-12-16 18:46:20.084578	676	0.67	5159.0
722	4	2	53	2016-12-16 18:46:20.088898	2016-12-16 18:46:20.088898	677	0.14	1078.0
723	4	2	53	2016-12-16 18:46:20.093342	2016-12-16 18:46:20.093342	678	0.08	616.0
724	4	2	53	2016-12-16 18:46:20.099078	2016-12-16 18:46:20.099078	679	0.08	616.0
725	4	2	164	2016-12-16 18:46:20.103473	2016-12-16 18:46:20.103473	680	0.08	618.24
726	4	2	53	2016-12-16 18:46:20.107516	2016-12-16 18:46:20.107516	680	0.19	1463.0
727	4	2	53	2016-12-16 18:46:20.11394	2016-12-16 18:46:20.11394	681	1.33	10241.0
728	4	2	53	2016-12-16 18:46:20.119227	2016-12-16 18:46:20.119227	682	0.08	616.0
729	4	2	53	2016-12-16 18:46:20.123678	2016-12-16 18:46:20.123678	683	0.17	1309.0
730	4	2	268	2016-12-16 18:46:20.127809	2016-12-16 18:46:20.127809	684	0.25	2019.5
731	4	2	268	2016-12-16 18:46:20.132864	2016-12-16 18:46:20.132864	685	0.38	3069.64
732	4	2	268	2016-12-16 18:46:20.136899	2016-12-16 18:46:20.136899	686	0.35	2827.3
733	4	2	162	2016-12-16 18:46:20.141078	2016-12-16 18:46:20.141078	687	0.17	2089.64
734	4	2	162	2016-12-16 18:46:20.146594	2016-12-16 18:46:20.146594	688	0.25	3073.0
735	4	2	106	2016-12-16 18:46:20.150804	2016-12-16 18:46:20.150804	689	0.5	3832.0
736	4	2	53	2016-12-16 18:46:20.15495	2016-12-16 18:46:20.15495	690	0.75	5775.0
737	4	2	82	2016-12-16 18:46:20.159293	2016-12-16 18:46:20.159293	691	0.02	466.54
738	4	2	82	2016-12-16 18:46:20.163465	2016-12-16 18:46:20.163465	692	0.18	4198.86
739	4	2	142	2016-12-16 18:46:20.167476	2016-12-16 18:46:20.167476	693	0.33	2810.61
740	4	2	142	2016-12-16 18:46:20.171685	2016-12-16 18:46:20.171685	694	0.1	851.7
741	4	2	142	2016-12-16 18:46:20.1758	2016-12-16 18:46:20.1758	695	0.28	2384.76
742	4	2	217	2016-12-16 18:46:20.180127	2016-12-16 18:46:20.180127	696	0.21	7511.91
745	4	2	146	2016-12-16 18:46:20.194283	2016-12-16 18:46:20.194283	698	0.2	4441.0
747	4	2	281	2016-12-16 18:46:20.202661	2016-12-16 18:46:20.202661	700	0.2	6082.6
748	4	2	281	2016-12-16 18:46:20.20698	2016-12-16 18:46:20.20698	701	0.25	7603.25
749	4	2	281	2016-12-16 18:46:20.211134	2016-12-16 18:46:20.211134	702	0.2	6082.6
750	4	2	281	2016-12-16 18:46:20.215259	2016-12-16 18:46:20.215259	703	1.5	45619.5
751	4	2	281	2016-12-16 18:46:20.219365	2016-12-16 18:46:20.219365	704	0.25	7603.25
752	4	2	53	2016-12-16 18:46:20.2239	2016-12-16 18:46:20.2239	705	0.22	1694.0
753	4	2	53	2016-12-16 18:46:20.228332	2016-12-16 18:46:20.228332	706	0.67	5159.0
754	4	2	53	2016-12-16 18:46:20.232432	2016-12-16 18:46:20.232432	707	0.14	1078.0
755	4	2	53	2016-12-16 18:46:20.236955	2016-12-16 18:46:20.236955	708	0.08	616.0
756	4	2	53	2016-12-16 18:46:20.241337	2016-12-16 18:46:20.241337	709	0.08	616.0
757	4	2	164	2016-12-16 18:46:20.24587	2016-12-16 18:46:20.24587	710	0.08	618.24
758	4	2	53	2016-12-16 18:46:20.250326	2016-12-16 18:46:20.250326	710	0.19	1463.0
759	4	2	53	2016-12-16 18:46:20.254819	2016-12-16 18:46:20.254819	711	1.33	10241.0
760	4	2	53	2016-12-16 18:46:20.259288	2016-12-16 18:46:20.259288	712	0.08	616.0
761	4	2	53	2016-12-16 18:46:20.263841	2016-12-16 18:46:20.263841	713	0.17	1309.0
762	4	2	268	2016-12-16 18:46:20.268035	2016-12-16 18:46:20.268035	714	0.25	2019.5
763	4	2	268	2016-12-16 18:46:20.273377	2016-12-16 18:46:20.273377	715	0.38	3069.64
764	4	2	268	2016-12-16 18:46:20.278326	2016-12-16 18:46:20.278326	716	0.35	2827.3
765	4	2	162	2016-12-16 18:46:20.282503	2016-12-16 18:46:20.282503	717	0.17	2089.64
766	4	2	162	2016-12-16 18:46:20.286638	2016-12-16 18:46:20.286638	718	0.25	3073.0
767	4	2	106	2016-12-16 18:46:20.291622	2016-12-16 18:46:20.291622	719	0.5	3832.0
768	4	2	53	2016-12-16 18:46:20.29571	2016-12-16 18:46:20.29571	720	0.75	5775.0
746	4	2	146	2016-12-16 18:46:20.198575	2016-12-18 20:37:46.040045	699	2.0	44410.0
679	4	2	217	2016-12-16 18:46:19.900536	2016-12-19 14:40:11.152773	637	1.5	53656.5
682	4	2	146	2016-12-16 18:46:19.913691	2016-12-19 14:40:59.612825	639	1.5	33307.5
711	4	2	217	2016-12-16 18:46:20.040568	2016-12-19 14:42:02.342013	667	1.5	53656.5
744	5	1	853	2016-12-16 18:46:20.190084	2016-12-19 17:00:44.590597	697	8.0	6336.0
680	5	1	853	2016-12-16 18:46:19.905265	2016-12-20 17:38:24.094532	637	3.0	2376.0
769	4	2	82	2016-12-16 18:46:20.300387	2016-12-16 18:46:20.300387	721	0.02	466.54
770	4	2	82	2016-12-16 18:46:20.304806	2016-12-16 18:46:20.304806	722	0.18	4198.86
771	4	2	142	2016-12-16 18:46:20.309236	2016-12-16 18:46:20.309236	723	0.33	2810.61
772	4	2	142	2016-12-16 18:46:20.314144	2016-12-16 18:46:20.314144	724	0.1	851.7
773	4	2	142	2016-12-16 18:46:20.321732	2016-12-16 18:46:20.321732	725	0.28	2384.76
774	4	2	217	2016-12-16 18:46:20.326012	2016-12-16 18:46:20.326012	726	0.21	7511.91
777	4	2	146	2016-12-16 18:46:20.339033	2016-12-16 18:46:20.339033	728	0.2	4441.0
779	4	2	281	2016-12-16 18:46:20.347307	2016-12-16 18:46:20.347307	730	0.2	6082.6
780	4	2	281	2016-12-16 18:46:20.351441	2016-12-16 18:46:20.351441	731	0.25	7603.25
781	4	2	281	2016-12-16 18:46:20.355492	2016-12-16 18:46:20.355492	732	0.2	6082.6
782	4	2	281	2016-12-16 18:46:20.359504	2016-12-16 18:46:20.359504	733	1.5	45619.5
783	4	2	281	2016-12-16 18:46:20.363707	2016-12-16 18:46:20.363707	734	0.25	7603.25
784	4	2	53	2016-12-16 18:46:20.367921	2016-12-16 18:46:20.367921	735	0.22	1694.0
785	4	2	53	2016-12-16 18:46:20.372451	2016-12-16 18:46:20.372451	736	0.67	5159.0
786	4	2	53	2016-12-16 18:46:20.376455	2016-12-16 18:46:20.376455	737	0.14	1078.0
787	4	2	53	2016-12-16 18:46:20.409341	2016-12-16 18:46:20.409341	738	0.08	616.0
788	4	2	53	2016-12-16 18:46:20.414017	2016-12-16 18:46:20.414017	739	0.08	616.0
789	4	2	164	2016-12-16 18:46:20.418483	2016-12-16 18:46:20.418483	740	0.08	618.24
790	4	2	53	2016-12-16 18:46:20.422457	2016-12-16 18:46:20.422457	740	0.19	1463.0
791	4	2	53	2016-12-16 18:46:20.426675	2016-12-16 18:46:20.426675	741	1.33	10241.0
792	4	2	53	2016-12-16 18:46:20.430793	2016-12-16 18:46:20.430793	742	0.08	616.0
793	4	2	53	2016-12-16 18:46:20.43487	2016-12-16 18:46:20.43487	743	0.17	1309.0
794	4	2	268	2016-12-16 18:46:20.439114	2016-12-16 18:46:20.439114	744	0.25	2019.5
795	4	2	268	2016-12-16 18:46:20.443373	2016-12-16 18:46:20.443373	745	0.38	3069.64
796	4	2	268	2016-12-16 18:46:20.447481	2016-12-16 18:46:20.447481	746	0.35	2827.3
797	4	2	162	2016-12-16 18:46:20.451766	2016-12-16 18:46:20.451766	747	0.17	2089.64
798	4	2	162	2016-12-16 18:46:20.457081	2016-12-16 18:46:20.457081	748	0.25	3073.0
799	4	2	106	2016-12-16 18:46:20.461369	2016-12-16 18:46:20.461369	749	0.5	3832.0
800	4	2	53	2016-12-16 18:46:20.465626	2016-12-16 18:46:20.465626	750	0.75	5775.0
801	4	2	82	2016-12-16 18:46:20.469637	2016-12-16 18:46:20.469637	751	0.02	466.54
802	4	2	82	2016-12-16 18:46:20.47389	2016-12-16 18:46:20.47389	752	0.18	4198.86
803	4	2	142	2016-12-16 18:46:20.478149	2016-12-16 18:46:20.478149	753	0.33	2810.61
804	4	2	142	2016-12-16 18:46:20.482397	2016-12-16 18:46:20.482397	754	0.1	851.7
805	4	2	142	2016-12-16 18:46:20.486577	2016-12-16 18:46:20.486577	755	0.28	2384.76
806	4	2	217	2016-12-16 18:46:20.490617	2016-12-16 18:46:20.490617	756	0.21	7511.91
809	4	2	146	2016-12-16 18:46:20.503613	2016-12-16 18:46:20.503613	758	0.2	4441.0
811	4	2	281	2016-12-16 18:46:20.512238	2016-12-16 18:46:20.512238	760	0.2	6082.6
812	4	2	281	2016-12-16 18:46:20.516536	2016-12-16 18:46:20.516536	761	0.25	7603.25
813	4	2	281	2016-12-16 18:46:20.521041	2016-12-16 18:46:20.521041	762	0.2	6082.6
814	4	2	281	2016-12-16 18:46:20.525621	2016-12-16 18:46:20.525621	763	1.5	45619.5
815	4	2	281	2016-12-16 18:46:20.529972	2016-12-16 18:46:20.529972	764	0.25	7603.25
816	4	2	53	2016-12-16 18:46:20.534317	2016-12-16 18:46:20.534317	765	0.22	1694.0
817	4	2	53	2016-12-16 18:46:20.544502	2016-12-16 18:46:20.544502	766	0.67	5159.0
818	4	2	53	2016-12-16 18:46:20.549023	2016-12-16 18:46:20.549023	767	0.14	1078.0
819	4	2	53	2016-12-16 18:46:20.554137	2016-12-16 18:46:20.554137	768	0.08	616.0
820	4	2	53	2016-12-16 18:46:20.558516	2016-12-16 18:46:20.558516	769	0.08	616.0
821	4	2	164	2016-12-16 18:46:20.562872	2016-12-16 18:46:20.562872	770	0.08	618.24
822	4	2	53	2016-12-16 18:46:20.567245	2016-12-16 18:46:20.567245	770	0.19	1463.0
823	4	2	53	2016-12-16 18:46:20.571494	2016-12-16 18:46:20.571494	771	1.33	10241.0
824	4	2	53	2016-12-16 18:46:20.575901	2016-12-16 18:46:20.575901	772	0.08	616.0
825	4	2	53	2016-12-16 18:46:20.580183	2016-12-16 18:46:20.580183	773	0.17	1309.0
826	4	2	268	2016-12-16 18:46:20.584485	2016-12-16 18:46:20.584485	774	0.25	2019.5
827	4	2	268	2016-12-16 18:46:20.588616	2016-12-16 18:46:20.588616	775	0.38	3069.64
828	4	2	268	2016-12-16 18:46:20.592734	2016-12-16 18:46:20.592734	776	0.35	2827.3
829	4	2	162	2016-12-16 18:46:20.59735	2016-12-16 18:46:20.59735	777	0.17	2089.64
830	4	2	162	2016-12-16 18:46:20.601593	2016-12-16 18:46:20.601593	778	0.25	3073.0
831	4	2	106	2016-12-16 18:46:20.605679	2016-12-16 18:46:20.605679	779	0.5	3832.0
832	4	2	53	2016-12-16 18:46:20.609624	2016-12-16 18:46:20.609624	780	0.75	5775.0
833	4	2	82	2016-12-16 18:46:20.61384	2016-12-16 18:46:20.61384	781	0.02	466.54
834	4	2	82	2016-12-16 18:46:20.617904	2016-12-16 18:46:20.617904	782	0.18	4198.86
835	4	2	142	2016-12-16 18:46:20.622781	2016-12-16 18:46:20.622781	783	0.33	2810.61
836	4	2	142	2016-12-16 18:46:20.644387	2016-12-16 18:46:20.644387	784	0.1	851.7
837	4	2	142	2016-12-16 18:46:20.64877	2016-12-16 18:46:20.64877	785	0.28	2384.76
838	4	2	217	2016-12-16 18:46:20.652973	2016-12-16 18:46:20.652973	786	0.21	7511.91
839	4	2	217	2016-12-16 18:46:20.657638	2016-12-16 18:46:20.657638	787	0.86	30763.06
840	5	1	853	2016-12-16 18:46:20.66175	2016-12-16 18:46:20.66175	787	2.0	1584.0
841	4	2	146	2016-12-16 18:46:20.667636	2016-12-16 18:46:20.667636	788	0.2	4441.0
842	4	2	146	2016-12-16 18:46:20.671703	2016-12-16 18:46:20.671703	789	0.86	19096.3
843	4	2	281	2016-12-16 18:46:20.67595	2016-12-16 18:46:20.67595	790	0.2	6082.6
844	4	2	281	2016-12-16 18:46:20.680801	2016-12-16 18:46:20.680801	791	0.25	7603.25
845	4	2	281	2016-12-16 18:46:20.684696	2016-12-16 18:46:20.684696	792	0.2	6082.6
846	4	2	281	2016-12-16 18:46:20.68974	2016-12-16 18:46:20.68974	793	1.5	45619.5
847	4	2	281	2016-12-16 18:46:20.69369	2016-12-16 18:46:20.69369	794	0.25	7603.25
848	4	2	53	2016-12-16 18:46:20.697873	2016-12-16 18:46:20.697873	795	0.22	1694.0
849	4	2	53	2016-12-16 18:46:20.702458	2016-12-16 18:46:20.702458	796	0.67	5159.0
850	4	2	53	2016-12-16 18:46:20.706458	2016-12-16 18:46:20.706458	797	0.14	1078.0
851	4	2	53	2016-12-16 18:46:20.710622	2016-12-16 18:46:20.710622	798	0.08	616.0
852	4	2	53	2016-12-16 18:46:20.714673	2016-12-16 18:46:20.714673	799	0.08	616.0
853	4	2	164	2016-12-16 18:46:20.718815	2016-12-16 18:46:20.718815	800	0.08	618.24
854	4	2	53	2016-12-16 18:46:20.722795	2016-12-16 18:46:20.722795	800	0.19	1463.0
855	4	2	53	2016-12-16 18:46:20.726863	2016-12-16 18:46:20.726863	801	1.33	10241.0
856	4	2	53	2016-12-16 18:46:20.731275	2016-12-16 18:46:20.731275	802	0.08	616.0
857	4	2	53	2016-12-16 18:46:20.735496	2016-12-16 18:46:20.735496	803	0.17	1309.0
858	4	2	268	2016-12-16 18:46:20.739789	2016-12-16 18:46:20.739789	804	0.25	2019.5
859	4	2	268	2016-12-16 18:46:20.744127	2016-12-16 18:46:20.744127	805	0.38	3069.64
860	4	2	268	2016-12-16 18:46:20.74849	2016-12-16 18:46:20.74849	806	0.35	2827.3
861	4	2	162	2016-12-16 18:46:20.752816	2016-12-16 18:46:20.752816	807	0.17	2089.64
862	4	2	162	2016-12-16 18:46:20.756761	2016-12-16 18:46:20.756761	808	0.25	3073.0
863	4	2	106	2016-12-16 18:46:20.761042	2016-12-16 18:46:20.761042	809	0.5	3832.0
864	4	2	53	2016-12-16 18:46:20.765313	2016-12-16 18:46:20.765313	810	0.75	5775.0
778	4	2	146	2016-12-16 18:46:20.343358	2016-12-19 14:45:13.947599	729	1.5	33307.5
776	5	1	853	2016-12-16 18:46:20.33465	2016-12-20 16:06:46.951346	727	17.0	13464.0
807	4	2	217	2016-12-16 18:46:20.49482	2016-12-19 17:23:11.821874	757	2.0	71542.0
865	4	2	82	2016-12-16 18:46:20.769612	2016-12-16 18:46:20.769612	811	0.02	466.54
866	4	2	82	2016-12-16 18:46:20.774509	2016-12-16 18:46:20.774509	812	0.18	4198.86
867	4	2	142	2016-12-16 18:46:20.778685	2016-12-16 18:46:20.778685	813	0.33	2810.61
868	4	2	142	2016-12-16 18:46:20.78355	2016-12-16 18:46:20.78355	814	0.1	851.7
869	4	2	142	2016-12-16 18:46:20.787716	2016-12-16 18:46:20.787716	815	0.28	2384.76
870	4	2	217	2016-12-16 18:46:20.791912	2016-12-16 18:46:20.791912	816	0.21	7511.91
871	4	2	217	2016-12-16 18:46:20.796609	2016-12-16 18:46:20.796609	817	0.86	30763.06
872	5	1	853	2016-12-16 18:46:20.800744	2016-12-16 18:46:20.800744	817	2.0	1584.0
873	4	2	146	2016-12-16 18:46:20.804959	2016-12-16 18:46:20.804959	818	0.2	4441.0
874	4	2	146	2016-12-16 18:46:20.809535	2016-12-16 18:46:20.809535	819	0.86	19096.3
875	4	2	281	2016-12-16 18:46:20.813857	2016-12-16 18:46:20.813857	820	0.2	6082.6
876	4	2	281	2016-12-16 18:46:20.818452	2016-12-16 18:46:20.818452	821	0.25	7603.25
877	4	2	281	2016-12-16 18:46:20.822667	2016-12-16 18:46:20.822667	822	0.2	6082.6
878	4	2	281	2016-12-16 18:46:20.826593	2016-12-16 18:46:20.826593	823	1.5	45619.5
879	4	2	281	2016-12-16 18:46:20.830937	2016-12-16 18:46:20.830937	824	0.25	7603.25
880	4	2	53	2016-12-16 18:46:20.835368	2016-12-16 18:46:20.835368	825	0.22	1694.0
881	4	2	53	2016-12-16 18:46:20.839572	2016-12-16 18:46:20.839572	826	0.67	5159.0
882	4	2	53	2016-12-16 18:46:20.843765	2016-12-16 18:46:20.843765	827	0.14	1078.0
883	4	2	53	2016-12-16 18:46:20.847862	2016-12-16 18:46:20.847862	828	0.08	616.0
884	4	2	53	2016-12-16 18:46:20.851992	2016-12-16 18:46:20.851992	829	0.08	616.0
885	4	2	164	2016-12-16 18:46:20.856547	2016-12-16 18:46:20.856547	830	0.08	618.24
886	4	2	53	2016-12-16 18:46:20.861352	2016-12-16 18:46:20.861352	830	0.19	1463.0
887	4	2	53	2016-12-16 18:46:20.865998	2016-12-16 18:46:20.865998	831	1.33	10241.0
888	4	2	53	2016-12-16 18:46:20.870084	2016-12-16 18:46:20.870084	832	0.08	616.0
889	4	2	53	2016-12-16 18:46:20.874003	2016-12-16 18:46:20.874003	833	0.17	1309.0
890	4	2	268	2016-12-16 18:46:20.878031	2016-12-16 18:46:20.878031	834	0.25	2019.5
891	4	2	268	2016-12-16 18:46:20.881993	2016-12-16 18:46:20.881993	835	0.38	3069.64
892	4	2	268	2016-12-16 18:46:20.886103	2016-12-16 18:46:20.886103	836	0.35	2827.3
893	4	2	162	2016-12-16 18:46:20.890132	2016-12-16 18:46:20.890132	837	0.17	2089.64
894	4	2	162	2016-12-16 18:46:20.894049	2016-12-16 18:46:20.894049	838	0.25	3073.0
895	4	2	106	2016-12-16 18:46:20.898165	2016-12-16 18:46:20.898165	839	0.5	3832.0
896	4	2	53	2016-12-16 18:46:20.902369	2016-12-16 18:46:20.902369	840	0.75	5775.0
897	4	2	82	2016-12-16 18:46:20.906949	2016-12-16 18:46:20.906949	841	0.02	466.54
898	4	2	82	2016-12-16 18:46:20.911258	2016-12-16 18:46:20.911258	842	0.18	4198.86
899	4	2	142	2016-12-16 18:46:20.915396	2016-12-16 18:46:20.915396	843	0.33	2810.61
900	4	2	142	2016-12-16 18:46:20.919867	2016-12-16 18:46:20.919867	844	0.1	851.7
901	4	2	142	2016-12-16 18:46:20.924256	2016-12-16 18:46:20.924256	845	0.28	2384.76
902	4	2	217	2016-12-16 18:46:20.928911	2016-12-16 18:46:20.928911	846	0.21	7511.91
903	4	2	217	2016-12-16 18:46:20.933095	2016-12-16 18:46:20.933095	847	0.86	30763.06
904	5	1	853	2016-12-16 18:46:20.937278	2016-12-16 18:46:20.937278	847	2.0	1584.0
905	4	2	146	2016-12-16 18:46:20.94124	2016-12-16 18:46:20.94124	848	0.2	4441.0
906	4	2	146	2016-12-16 18:46:20.945361	2016-12-16 18:46:20.945361	849	0.86	19096.3
907	4	2	281	2016-12-16 18:46:20.949306	2016-12-16 18:46:20.949306	850	0.2	6082.6
908	4	2	281	2016-12-16 18:46:20.954174	2016-12-16 18:46:20.954174	851	0.25	7603.25
909	4	2	281	2016-12-16 18:46:20.959014	2016-12-16 18:46:20.959014	852	0.2	6082.6
910	4	2	281	2016-12-16 18:46:20.963286	2016-12-16 18:46:20.963286	853	1.5	45619.5
911	4	2	281	2016-12-16 18:46:20.967177	2016-12-16 18:46:20.967177	854	0.25	7603.25
912	4	2	53	2016-12-16 18:46:20.971119	2016-12-16 18:46:20.971119	855	0.22	1694.0
913	4	2	53	2016-12-16 18:46:20.975195	2016-12-16 18:46:20.975195	856	0.67	5159.0
914	4	2	53	2016-12-16 18:46:20.979543	2016-12-16 18:46:20.979543	857	0.14	1078.0
915	4	2	53	2016-12-16 18:46:20.983899	2016-12-16 18:46:20.983899	858	0.08	616.0
916	4	2	53	2016-12-16 18:46:20.988308	2016-12-16 18:46:20.988308	859	0.08	616.0
917	4	2	164	2016-12-16 18:46:20.992789	2016-12-16 18:46:20.992789	860	0.08	618.24
918	4	2	53	2016-12-16 18:46:20.997334	2016-12-16 18:46:20.997334	860	0.19	1463.0
919	4	2	53	2016-12-16 18:46:21.001655	2016-12-16 18:46:21.001655	861	1.33	10241.0
920	4	2	53	2016-12-16 18:46:21.006026	2016-12-16 18:46:21.006026	862	0.08	616.0
921	4	2	53	2016-12-16 18:46:21.010123	2016-12-16 18:46:21.010123	863	0.17	1309.0
922	4	2	268	2016-12-16 18:46:21.014198	2016-12-16 18:46:21.014198	864	0.25	2019.5
923	4	2	268	2016-12-16 18:46:21.018287	2016-12-16 18:46:21.018287	865	0.38	3069.64
924	4	2	268	2016-12-16 18:46:21.022214	2016-12-16 18:46:21.022214	866	0.35	2827.3
925	4	2	162	2016-12-16 18:46:21.026247	2016-12-16 18:46:21.026247	867	0.17	2089.64
926	4	2	162	2016-12-16 18:46:21.03026	2016-12-16 18:46:21.03026	868	0.25	3073.0
927	4	2	106	2016-12-16 18:46:21.034213	2016-12-16 18:46:21.034213	869	0.5	3832.0
928	4	2	53	2016-12-16 18:46:21.038103	2016-12-16 18:46:21.038103	870	0.75	5775.0
929	4	2	82	2016-12-16 18:46:21.042528	2016-12-16 18:46:21.042528	871	0.02	466.54
930	4	2	82	2016-12-16 18:46:21.046391	2016-12-16 18:46:21.046391	872	0.18	4198.86
931	4	2	142	2016-12-16 18:46:21.050281	2016-12-16 18:46:21.050281	873	0.33	2810.61
932	4	2	142	2016-12-16 18:46:21.055133	2016-12-16 18:46:21.055133	874	0.1	851.7
933	4	2	142	2016-12-16 18:46:21.059114	2016-12-16 18:46:21.059114	875	0.28	2384.76
934	4	2	217	2016-12-16 18:46:21.063414	2016-12-16 18:46:21.063414	876	0.21	7511.91
935	4	2	217	2016-12-16 18:46:21.067674	2016-12-16 18:46:21.067674	877	0.86	30763.06
936	5	1	853	2016-12-16 18:46:21.071905	2016-12-16 18:46:21.071905	877	2.0	1584.0
937	4	2	146	2016-12-16 18:46:21.076582	2016-12-16 18:46:21.076582	878	0.2	4441.0
938	4	2	146	2016-12-16 18:46:21.081001	2016-12-16 18:46:21.081001	879	0.86	19096.3
939	4	2	281	2016-12-16 18:46:21.085899	2016-12-16 18:46:21.085899	880	0.2	6082.6
940	4	2	281	2016-12-16 18:46:21.090078	2016-12-16 18:46:21.090078	881	0.25	7603.25
941	4	2	281	2016-12-16 18:46:21.094197	2016-12-16 18:46:21.094197	882	0.2	6082.6
942	4	2	281	2016-12-16 18:46:21.098269	2016-12-16 18:46:21.098269	883	1.5	45619.5
943	4	2	281	2016-12-16 18:46:21.10267	2016-12-16 18:46:21.10267	884	0.25	7603.25
944	4	2	53	2016-12-16 18:46:21.1077	2016-12-16 18:46:21.1077	885	0.22	1694.0
945	4	2	53	2016-12-16 18:46:21.111875	2016-12-16 18:46:21.111875	886	0.67	5159.0
946	4	2	53	2016-12-16 18:46:21.117053	2016-12-16 18:46:21.117053	887	0.14	1078.0
947	4	2	53	2016-12-16 18:46:21.121283	2016-12-16 18:46:21.121283	888	0.08	616.0
948	4	2	53	2016-12-16 18:46:21.126022	2016-12-16 18:46:21.126022	889	0.08	616.0
949	4	2	164	2016-12-16 18:46:21.130149	2016-12-16 18:46:21.130149	890	0.08	618.24
950	4	2	53	2016-12-16 18:46:21.134549	2016-12-16 18:46:21.134549	890	0.19	1463.0
951	4	2	53	2016-12-16 18:46:21.139353	2016-12-16 18:46:21.139353	891	1.33	10241.0
952	4	2	53	2016-12-16 18:46:21.143725	2016-12-16 18:46:21.143725	892	0.08	616.0
953	4	2	53	2016-12-16 18:46:21.147628	2016-12-16 18:46:21.147628	893	0.17	1309.0
954	4	2	268	2016-12-16 18:46:21.151635	2016-12-16 18:46:21.151635	894	0.25	2019.5
955	4	2	268	2016-12-16 18:46:21.155609	2016-12-16 18:46:21.155609	895	0.38	3069.64
956	4	2	268	2016-12-16 18:46:21.159508	2016-12-16 18:46:21.159508	896	0.35	2827.3
957	4	2	162	2016-12-16 18:46:21.163599	2016-12-16 18:46:21.163599	897	0.17	2089.64
958	4	2	162	2016-12-16 18:46:21.167885	2016-12-16 18:46:21.167885	898	0.25	3073.0
959	4	2	106	2016-12-16 18:46:21.179137	2016-12-16 18:46:21.179137	899	0.5	3832.0
960	4	2	53	2016-12-16 18:46:21.183524	2016-12-16 18:46:21.183524	900	0.75	5775.0
961	4	2	82	2016-12-16 18:46:21.188082	2016-12-16 18:46:21.188082	901	0.02	466.54
962	4	2	82	2016-12-16 18:46:21.192427	2016-12-16 18:46:21.192427	902	0.18	4198.86
963	4	2	142	2016-12-16 18:46:21.196962	2016-12-16 18:46:21.196962	903	0.33	2810.61
964	4	2	142	2016-12-16 18:46:21.201396	2016-12-16 18:46:21.201396	904	0.1	851.7
965	4	2	142	2016-12-16 18:46:21.205914	2016-12-16 18:46:21.205914	905	0.28	2384.76
966	4	2	217	2016-12-16 18:46:21.210139	2016-12-16 18:46:21.210139	906	0.21	7511.91
967	4	2	217	2016-12-16 18:46:21.214357	2016-12-16 18:46:21.214357	907	0.86	30763.06
968	5	1	853	2016-12-16 18:46:21.219158	2016-12-16 18:46:21.219158	907	2.0	1584.0
969	4	2	146	2016-12-16 18:46:21.223761	2016-12-16 18:46:21.223761	908	0.2	4441.0
970	4	2	146	2016-12-16 18:46:21.229153	2016-12-16 18:46:21.229153	909	0.86	19096.3
971	4	2	281	2016-12-16 18:46:21.233878	2016-12-16 18:46:21.233878	910	0.2	6082.6
972	4	2	281	2016-12-16 18:46:21.238122	2016-12-16 18:46:21.238122	911	0.25	7603.25
973	4	2	281	2016-12-16 18:46:21.242439	2016-12-16 18:46:21.242439	912	0.2	6082.6
974	4	2	281	2016-12-16 18:46:21.246641	2016-12-16 18:46:21.246641	913	1.5	45619.5
975	4	2	281	2016-12-16 18:46:21.251175	2016-12-16 18:46:21.251175	914	0.25	7603.25
976	4	2	53	2016-12-16 18:46:21.255916	2016-12-16 18:46:21.255916	915	0.22	1694.0
977	4	2	53	2016-12-16 18:46:21.260134	2016-12-16 18:46:21.260134	916	0.67	5159.0
978	4	2	53	2016-12-16 18:46:21.26454	2016-12-16 18:46:21.26454	917	0.14	1078.0
979	4	2	53	2016-12-16 18:46:21.269029	2016-12-16 18:46:21.269029	918	0.08	616.0
980	4	2	53	2016-12-16 18:46:21.273201	2016-12-16 18:46:21.273201	919	0.08	616.0
981	4	2	164	2016-12-16 18:46:21.277609	2016-12-16 18:46:21.277609	920	0.08	618.24
982	4	2	53	2016-12-16 18:46:21.282493	2016-12-16 18:46:21.282493	920	0.19	1463.0
983	4	2	53	2016-12-16 18:46:21.28712	2016-12-16 18:46:21.28712	921	1.33	10241.0
984	4	2	53	2016-12-16 18:46:21.29141	2016-12-16 18:46:21.29141	922	0.08	616.0
985	4	2	53	2016-12-16 18:46:21.295856	2016-12-16 18:46:21.295856	923	0.17	1309.0
986	4	2	268	2016-12-16 18:46:21.30007	2016-12-16 18:46:21.30007	924	0.25	2019.5
987	4	2	268	2016-12-16 18:46:21.304958	2016-12-16 18:46:21.304958	925	0.38	3069.64
988	4	2	268	2016-12-16 18:46:21.309366	2016-12-16 18:46:21.309366	926	0.35	2827.3
989	4	2	162	2016-12-16 18:46:21.313428	2016-12-16 18:46:21.313428	927	0.17	2089.64
990	4	2	162	2016-12-16 18:46:21.318146	2016-12-16 18:46:21.318146	928	0.25	3073.0
991	4	2	106	2016-12-16 18:46:21.322729	2016-12-16 18:46:21.322729	929	0.5	3832.0
992	4	2	53	2016-12-16 18:46:21.327199	2016-12-16 18:46:21.327199	930	0.75	5775.0
993	4	2	217	2016-12-16 18:52:54.385631	2016-12-16 18:52:54.385631	37	1.0	35771.0
994	5	1	617	2016-12-16 18:54:50.963888	2016-12-16 18:54:50.963888	37	2.0	6852.0
995	5	1	1000	2016-12-16 18:55:29.480031	2016-12-16 18:55:29.480031	37	1.0	492.0
996	5	1	901	2016-12-16 18:56:04.488506	2016-12-16 18:56:04.488506	37	1.0	204.0
997	5	1	367	2016-12-16 18:56:49.519689	2016-12-16 18:56:49.519689	37	1.0	11655.0
998	5	1	382	2016-12-16 18:57:12.62428	2016-12-16 18:57:12.62428	37	1.0	81.0
999	5	1	520	2016-12-16 18:58:15.327667	2016-12-16 18:58:15.327667	37	0.2	274.8
1000	5	1	762	2016-12-16 18:58:59.647486	2016-12-16 18:58:59.647486	37	5.0	1310.0
1001	5	1	948	2016-12-16 18:59:40.900992	2016-12-16 18:59:40.900992	37	0.2	86222.2
1002	5	1	971	2016-12-16 19:00:32.381502	2016-12-16 19:00:32.381502	37	2.0	806.0
1003	5	1	967	2016-12-16 19:00:52.449939	2016-12-16 19:00:52.449939	37	2.0	2280.0
1004	5	1	847	2016-12-16 19:01:22.354802	2016-12-16 19:01:22.354802	37	2.0	1914.0
1005	5	1	880	2016-12-16 19:02:12.732551	2016-12-16 19:02:12.732551	37	0.2	11435.4
1006	5	1	1145	2016-12-16 19:02:41.211452	2016-12-16 19:02:41.211452	37	0.2	181325.2
1007	5	1	943	2016-12-16 19:03:22.430904	2016-12-16 19:03:22.430904	37	0.2	8323.2
1008	5	1	543	2016-12-16 19:03:57.255382	2016-12-16 19:03:57.255382	37	0.2	13030.0
1009	5	1	641	2016-12-16 19:04:24.052194	2016-12-16 19:04:24.052194	37	1.0	1324.0
1011	5	1	743	2016-12-16 19:08:42.921927	2016-12-16 19:08:42.921927	37	1.0	2151.0
1010	5	1	643	2016-12-16 19:04:51.261851	2016-12-16 19:10:20.825782	37	2.0	3652.0
1012	5	1	1538	2016-12-16 19:18:52.531452	2016-12-16 19:18:52.531452	37	1.0	957.0
1013	5	1	1537	2016-12-16 19:19:06.831166	2016-12-16 19:19:06.831166	37	1.0	4000.0
1014	5	1	1539	2016-12-16 19:19:23.955249	2016-12-16 19:19:23.955249	37	1.0	56.0
1015	5	1	1540	2016-12-16 19:19:36.068655	2016-12-16 19:19:36.068655	37	2.0	75.0
1016	5	1	1541	2016-12-16 19:19:47.492595	2016-12-16 19:19:47.492595	37	1.0	458.0
1017	5	1	1542	2016-12-16 19:19:59.769419	2016-12-16 19:19:59.769419	37	2.0	700.0
1018	5	1	1543	2016-12-16 19:20:12.983689	2016-12-16 19:20:12.983689	37	1.0	796.0
1019	5	1	1544	2016-12-16 19:20:25.192927	2016-12-16 19:20:25.192927	37	1.0	2682.0
1020	5	1	1545	2016-12-16 19:20:47.24404	2016-12-16 19:20:47.24404	37	1.0	2051.0
1021	5	1	1546	2016-12-16 19:20:59.111584	2016-12-16 19:20:59.111584	37	1.0	2280.0
167	4	2	217	2016-12-16 18:46:17.549371	2016-12-17 16:04:50.284881	157	1.0	35771.0
1022	5	1	894	2016-12-17 16:06:25.60408	2016-12-17 16:06:25.60408	157	10.0	13970.0
1023	5	1	955	2016-12-17 16:06:59.248231	2016-12-17 16:06:59.248231	157	1.0	78845.0
1024	5	1	1000	2016-12-17 16:07:49.709732	2016-12-17 16:07:49.709732	157	1.0	492.0
1025	5	1	1039	2016-12-17 16:13:13.700747	2016-12-17 16:13:13.700747	157	1.0	158.0
1026	5	1	1175	2016-12-17 16:14:44.916523	2016-12-17 16:14:44.916523	157	1.0	248.0
1027	5	1	434	2016-12-17 16:15:35.099045	2016-12-17 16:15:35.099045	157	1.0	408.0
1028	5	1	1032	2016-12-17 16:17:52.905341	2016-12-17 16:17:52.905341	157	1.0	2129.0
1029	5	1	901	2016-12-17 16:18:22.570227	2016-12-17 16:18:22.570227	157	1.0	204.0
1030	5	1	1451	2016-12-17 16:18:59.16289	2016-12-17 16:18:59.16289	157	1.0	3745.0
1031	5	1	382	2016-12-17 16:20:13.326684	2016-12-17 16:20:13.326684	157	2.0	162.0
1032	5	1	520	2016-12-17 16:22:30.579344	2016-12-17 16:22:30.579344	157	1.0	1374.0
1033	5	1	762	2016-12-17 16:23:26.370013	2016-12-17 16:23:26.370013	157	0.2	52.4
1034	5	1	928	2016-12-17 16:30:10.183481	2016-12-17 16:30:10.183481	157	1.0	2375.0
1035	5	1	933	2016-12-17 16:31:17.073896	2016-12-17 16:31:17.073896	157	0.2	16000.0
1036	5	1	966	2016-12-17 16:32:39.637871	2016-12-17 16:32:39.637871	157	2.0	276.0
1037	5	1	967	2016-12-17 16:41:00.979122	2016-12-17 16:41:00.979122	157	2.0	2280.0
1038	5	1	368	2016-12-17 16:41:53.085632	2016-12-17 16:41:53.085632	157	0.2	2255.8
1039	5	1	849	2016-12-17 16:47:55.797708	2016-12-17 16:47:55.797708	157	3.0	2871.0
1040	5	1	854	2016-12-17 16:50:03.92723	2016-12-17 16:50:03.92723	157	3.0	2859.0
1041	5	1	880	2016-12-17 16:55:04.373808	2016-12-17 16:55:04.373808	157	0.2	11435.4
1043	5	1	640	2016-12-17 16:56:37.453394	2016-12-17 16:56:37.453394	157	1.0	3064.0
1044	5	1	743	2016-12-17 16:57:10.190754	2016-12-17 16:57:10.190754	157	1.0	2151.0
1045	5	1	927	2016-12-17 16:57:43.371638	2016-12-17 16:57:43.371638	157	1.0	2942.0
1042	5	1	643	2016-12-17 16:56:07.098145	2016-12-17 16:58:07.826605	157	2.0	3652.0
1046	5	1	784	2016-12-17 16:59:38.234446	2016-12-17 16:59:38.234446	157	1.0	2305.0
1047	5	1	786	2016-12-17 17:00:28.558981	2016-12-17 17:00:28.558981	157	1.0	3287.0
1048	5	1	1537	2016-12-17 17:00:46.301479	2016-12-17 17:00:46.301479	157	1.0	4000.0
1049	5	1	1538	2016-12-17 17:01:00.359056	2016-12-17 17:01:00.359056	157	1.0	957.0
1050	5	1	1539	2016-12-17 17:01:13.628525	2016-12-17 17:01:13.628525	157	1.0	56.0
1052	5	1	1541	2016-12-17 17:01:42.216404	2016-12-17 17:01:42.216404	157	1.0	458.0
1054	5	1	1543	2016-12-17 17:02:14.949424	2016-12-17 17:02:14.949424	157	1.0	796.0
1055	5	1	1544	2016-12-17 17:02:30.420666	2016-12-17 17:02:30.420666	157	1.0	2682.0
1053	5	1	1542	2016-12-17 17:01:59.407859	2016-12-17 17:29:10.078338	157	2.0	700.0
1056	5	1	1546	2016-12-17 17:02:59.888426	2016-12-17 17:02:59.888426	157	1.0	2280.0
1060	5	1	367	2016-12-17 17:11:45.418551	2016-12-17 17:11:45.418551	7	1.0	11655.0
1068	5	1	847	2016-12-17 17:19:35.646191	2016-12-17 17:19:35.646191	7	2.0	1914.0
1073	5	1	880	2016-12-17 17:22:45.226046	2016-12-17 17:23:30.096012	7	0.2	11435.4
1077	5	1	743	2016-12-17 17:25:16.592597	2016-12-17 17:25:16.592597	7	1.0	2151.0
1084	4	1	1540	2016-12-17 17:33:51.980646	2016-12-17 17:33:51.980646	7	2.0	75.0
1089	5	1	1545	2016-12-17 17:35:11.360861	2016-12-17 17:35:11.360861	7	1.0	2051.0
199	4	2	217	2016-12-16 18:46:17.693644	2016-12-17 17:38:54.310497	187	1.5	53656.5
1093	5	1	1000	2016-12-17 17:48:28.632019	2016-12-17 17:48:28.632019	187	2.0	984.0
1101	5	1	382	2016-12-17 17:52:23.489021	2016-12-17 17:52:23.489021	187	2.0	162.0
1107	5	1	928	2016-12-17 18:04:35.62943	2016-12-17 18:04:35.62943	187	1.0	2375.0
1112	5	1	967	2016-12-17 18:14:53.400053	2016-12-17 18:14:53.400053	187	1.0	1140.0
1118	5	1	880	2016-12-17 18:24:10.79347	2016-12-17 18:24:10.79347	187	0.2	11435.4
1057	5	1	894	2016-12-17 17:09:42.425943	2016-12-17 17:09:42.425943	7	2.0	2794.0
1061	5	1	382	2016-12-17 17:12:09.469605	2016-12-17 17:12:09.469605	7	1.0	81.0
1065	5	1	972	2016-12-17 17:16:24.35819	2016-12-17 17:16:56.748104	7	1.0	279.0
1069	5	1	848	2016-12-17 17:20:00.784336	2016-12-17 17:20:00.784336	7	2.0	1882.0
1079	5	1	779	2016-12-17 17:26:38.433397	2016-12-17 17:26:38.433397	7	1.0	2710.0
1085	5	1	1541	2016-12-17 17:34:05.094102	2016-12-17 17:34:05.094102	7	1.0	458.0
1090	5	1	1546	2016-12-17 17:35:25.568957	2016-12-17 17:35:25.568957	7	1.0	2280.0
1094	5	1	1175	2016-12-17 17:49:00.543949	2016-12-17 17:49:00.543949	187	1.0	248.0
1102	5	1	534	2016-12-17 17:53:26.942272	2016-12-17 17:53:26.942272	187	1.0	8400.0
1105	5	1	762	2016-12-17 18:00:57.297428	2016-12-17 18:00:57.297428	187	3.0	786.0
1108	5	1	971	2016-12-17 18:05:02.141444	2016-12-17 18:05:02.141444	187	2.0	806.0
1113	5	1	849	2016-12-17 18:15:28.256605	2016-12-17 18:15:28.256605	187	2.0	1914.0
1117	5	1	549	2016-12-17 18:21:34.167515	2016-12-17 18:21:34.167515	187	0.2	12901.0
1119	5	1	913	2016-12-17 18:34:24.839268	2016-12-17 18:34:24.839268	187	0.2	67558.4
1058	5	1	1000	2016-12-17 17:11:04.264068	2016-12-17 17:11:04.264068	7	1.0	492.0
1063	5	1	804	2016-12-17 17:13:10.183044	2016-12-17 17:13:10.183044	7	1.0	44080.0
1066	5	1	971	2016-12-17 17:17:17.472037	2016-12-17 17:17:17.472037	7	2.0	806.0
1071	5	1	546	2016-12-17 17:21:31.191379	2016-12-17 17:21:31.191379	7	1.0	53969.0
1075	5	1	643	2016-12-17 17:24:12.588431	2016-12-17 17:26:14.624909	7	2.0	3652.0
1081	5	1	1537	2016-12-17 17:33:02.078477	2016-12-17 17:33:02.078477	7	1.0	4000.0
1087	5	1	1543	2016-12-17 17:34:32.607419	2016-12-17 17:34:32.607419	7	1.0	796.0
1091	5	1	364	2016-12-17 17:47:37.951158	2016-12-17 17:47:37.951158	187	2.0	684.0
1096	5	1	956	2016-12-17 17:50:07.313901	2016-12-17 17:50:07.313901	187	4.0	206084.0
1098	5	1	1451	2016-12-17 17:50:41.393881	2016-12-17 17:50:41.393881	187	2.0	7490.0
1110	5	1	986	2016-12-17 18:12:49.015515	2016-12-17 18:12:49.015515	187	0.2	17018.2
1115	5	1	438	2016-12-17 18:17:45.462504	2016-12-17 18:17:45.462504	187	1.0	450000.0
1059	5	1	901	2016-12-17 17:11:26.310947	2016-12-17 17:11:26.310947	7	1.0	204.0
1064	5	1	935	2016-12-17 17:15:01.323312	2016-12-17 17:15:01.323312	7	0.2	7926.8
1067	5	1	975	2016-12-17 17:18:16.882327	2016-12-17 17:18:16.882327	7	1.0	46529.0
1072	5	1	549	2016-12-17 17:21:53.174398	2016-12-17 17:21:53.174398	7	1.0	64505.0
1076	5	1	644	2016-12-17 17:24:34.52094	2016-12-17 17:24:34.52094	7	1.0	1527.0
1078	5	1	927	2016-12-17 17:25:52.408116	2016-12-17 17:25:52.408116	7	1.0	2942.0
1051	5	1	1540	2016-12-17 17:01:26.333105	2016-12-17 17:28:55.759084	157	2.0	75.0
1082	5	1	1538	2016-12-17 17:33:22.638381	2016-12-17 17:33:22.638381	7	1.0	957.0
1083	5	1	1539	2016-12-17 17:33:37.96491	2016-12-17 17:33:37.96491	7	1.0	56.0
1088	5	1	1544	2016-12-17 17:34:48.074518	2016-12-17 17:34:48.074518	7	1.0	2682.0
1092	5	1	894	2016-12-17 17:47:59.564898	2016-12-17 17:47:59.564898	187	10.0	13970.0
1097	5	1	901	2016-12-17 17:50:24.02969	2016-12-17 17:50:24.02969	187	1.0	204.0
1100	5	1	367	2016-12-17 17:51:42.351091	2016-12-17 17:51:42.351091	187	1.0	11655.0
1111	5	1	1009	2016-12-17 18:13:29.804616	2016-12-17 18:13:29.804616	187	1.0	967.0
1116	5	1	547	2016-12-17 18:19:47.010214	2016-12-17 18:20:09.702087	187	0.2	12901.0
1099	5	1	743	2016-12-17 17:51:09.006948	2016-12-17 18:46:39.83075	187	2.0	4302.0
1062	5	1	762	2016-12-17 17:12:28.404366	2016-12-17 17:12:51.586178	7	5.0	1310.0
1070	5	1	544	2016-12-17 17:21:02.048159	2016-12-17 17:21:02.048159	7	1.0	64505.0
1074	5	1	641	2016-12-17 17:23:54.517763	2016-12-17 17:23:54.517763	7	1.0	1324.0
1080	5	1	786	2016-12-17 17:27:09.538036	2016-12-17 17:27:09.538036	7	1.0	3287.0
1086	5	1	1542	2016-12-17 17:34:18.183026	2016-12-17 17:34:18.183026	7	2.0	700.0
1095	5	1	637	2016-12-17 17:49:33.334364	2016-12-17 17:49:33.334364	187	1.0	15293.0
1106	5	1	862	2016-12-17 18:01:31.575695	2016-12-17 18:02:53.694492	187	0.2	65170.6
1109	5	1	972	2016-12-17 18:06:33.359205	2016-12-17 18:06:33.359205	187	1.0	279.0
1114	5	1	847	2016-12-17 18:15:56.845599	2016-12-17 18:15:56.845599	187	2.0	1914.0
1120	5	1	1383	2016-12-17 18:41:59.963941	2016-12-17 18:41:59.963941	187	1.0	535000.0
1121	5	1	1514	2016-12-17 18:43:13.620894	2016-12-17 18:43:13.620894	187	0.2	17632.0
1122	5	1	936	2016-12-17 18:44:19.061907	2016-12-17 18:44:19.061907	187	0.2	8600.0
1123	4	1	644	2016-12-17 18:44:50.551064	2016-12-17 18:44:50.551064	187	1.0	1527.0
1124	5	1	927	2016-12-17 18:47:09.711567	2016-12-17 18:47:09.711567	187	1.0	2942.0
1125	5	1	643	2016-12-17 18:50:30.942274	2016-12-17 18:50:30.942274	187	1.0	1826.0
1126	5	1	779	2016-12-17 18:50:52.030832	2016-12-17 18:50:52.030832	187	1.0	2710.0
1127	5	1	786	2016-12-17 18:51:14.935041	2016-12-17 18:51:14.935041	187	1.0	3287.0
1128	5	1	1537	2016-12-17 18:51:30.318962	2016-12-17 18:51:30.318962	187	1.0	4000.0
1129	5	1	1538	2016-12-17 18:51:42.486461	2016-12-17 18:51:42.486461	187	1.0	957.0
1130	5	1	1539	2016-12-17 18:51:56.974668	2016-12-17 18:51:56.974668	187	1.0	56.0
1131	5	1	1540	2016-12-17 18:52:13.290686	2016-12-17 18:52:13.290686	187	2.0	75.0
1132	5	1	1541	2016-12-17 18:52:28.023746	2016-12-17 18:52:28.023746	187	1.0	458.0
1133	5	1	1542	2016-12-17 18:52:44.31015	2016-12-17 18:52:44.31015	187	2.0	700.0
1134	5	1	1543	2016-12-17 18:53:00.916341	2016-12-17 18:53:00.916341	187	1.0	796.0
1135	5	1	1544	2016-12-17 18:53:15.864365	2016-12-17 18:53:15.864365	187	1.0	2682.0
1136	5	1	1545	2016-12-17 18:53:30.561307	2016-12-17 18:53:30.561307	187	1.0	2051.0
1137	5	1	1546	2016-12-17 18:53:43.779872	2016-12-17 18:53:43.779872	187	1.0	2280.0
234	4	2	146	2016-12-16 18:46:17.851203	2016-12-17 18:56:08.324622	219	1.5	33307.5
1138	5	1	894	2016-12-17 19:00:00.937639	2016-12-17 19:00:00.937639	217	10.0	13970.0
1139	5	1	1000	2016-12-17 19:01:00.358636	2016-12-17 19:01:00.358636	217	1.0	492.0
1140	5	1	1175	2016-12-17 19:01:35.919299	2016-12-17 19:01:35.919299	217	1.0	248.0
1142	5	1	956	2016-12-17 19:02:14.992991	2016-12-17 19:02:14.992991	217	4.0	206084.0
1143	5	1	901	2016-12-17 19:03:11.160472	2016-12-17 19:03:11.160472	217	1.0	204.0
1144	5	1	367	2016-12-17 19:03:43.699407	2016-12-17 19:05:47.913784	217	0.2	2331.0
1145	5	1	520	2016-12-17 19:09:37.783451	2016-12-17 19:09:37.783451	217	0.2	274.8
1146	5	1	762	2016-12-17 19:11:02.857464	2016-12-17 19:11:02.857464	217	0.2	52.4
1147	5	1	804	2016-12-17 19:12:18.049413	2016-12-17 19:12:18.049413	217	0.2	8816.0
1148	5	1	935	2016-12-17 19:13:09.478608	2016-12-17 19:13:09.478608	217	0.2	7926.8
1149	5	1	971	2016-12-17 19:13:39.373943	2016-12-17 19:13:39.373943	217	2.0	806.0
1150	5	1	972	2016-12-17 19:42:04.130855	2016-12-17 19:42:04.130855	217	2.0	558.0
1151	5	1	975	2016-12-17 19:42:33.092835	2016-12-17 19:42:33.092835	217	1.0	46529.0
1152	5	1	847	2016-12-17 19:43:20.376489	2016-12-17 19:43:20.376489	217	2.0	1914.0
1153	5	1	848	2016-12-17 19:44:43.915528	2016-12-17 19:44:43.915528	217	2.0	1882.0
1154	5	1	544	2016-12-17 19:45:33.970174	2016-12-17 19:45:33.970174	217	0.2	12901.0
1155	5	1	545	2016-12-17 19:45:56.822084	2016-12-17 19:45:56.822084	217	0.2	12901.0
1156	5	1	547	2016-12-17 19:46:26.332152	2016-12-17 19:46:26.332152	217	0.2	12901.0
1157	5	1	549	2016-12-17 19:46:51.389074	2016-12-17 19:46:51.389074	217	0.2	12901.0
1158	5	1	880	2016-12-17 19:47:18.085271	2016-12-17 19:47:18.085271	217	0.2	11435.4
1159	5	1	641	2016-12-17 19:48:47.363444	2016-12-17 19:48:47.363444	217	1.0	1324.0
1141	5	1	640	2016-12-17 19:01:55.909014	2016-12-17 19:49:09.731061	217	2.0	6128.0
1160	5	1	743	2016-12-17 19:54:51.781623	2016-12-17 19:54:51.781623	217	1.0	2151.0
1161	5	1	927	2016-12-17 19:55:17.580142	2016-12-17 19:55:17.580142	217	1.0	2942.0
1162	5	1	643	2016-12-17 19:57:46.038596	2016-12-17 19:57:46.038596	217	1.0	1826.0
1163	5	1	779	2016-12-17 19:58:10.612127	2016-12-17 19:58:10.612127	217	\N	0.0
1165	5	1	786	2016-12-17 20:02:28.985151	2016-12-17 20:02:28.985151	217	1.0	3287.0
1166	5	1	1537	2016-12-17 20:02:56.464424	2016-12-17 20:02:56.464424	217	1.0	4000.0
1167	5	1	1538	2016-12-17 20:03:07.744615	2016-12-17 20:03:07.744615	217	1.0	957.0
1168	5	1	1539	2016-12-17 20:03:25.257317	2016-12-17 20:03:25.257317	217	1.0	56.0
1169	5	1	1540	2016-12-17 20:03:39.376639	2016-12-17 20:03:39.376639	217	2.0	75.0
1170	5	1	1541	2016-12-17 20:03:54.367232	2016-12-17 20:03:54.367232	217	1.0	458.0
1171	5	1	1542	2016-12-17 20:04:11.163374	2016-12-17 20:04:11.163374	217	2.0	700.0
1172	5	1	1543	2016-12-17 20:04:25.330433	2016-12-17 20:04:25.330433	217	1.0	796.0
1173	5	1	1544	2016-12-17 20:04:38.367163	2016-12-17 20:04:38.367163	217	1.0	2682.0
1174	5	1	1545	2016-12-17 20:04:55.337976	2016-12-17 20:04:55.337976	217	1.0	2051.0
1175	5	1	1546	2016-12-17 20:05:07.570445	2016-12-17 20:05:07.570445	217	1.0	2280.0
295	4	2	217	2016-12-16 18:46:18.131626	2016-12-17 20:06:21.676961	277	1.5	53656.5
1176	5	1	894	2016-12-17 20:26:56.951447	2016-12-17 20:26:56.951447	277	2.0	2794.0
1177	5	1	956	2016-12-17 20:27:39.732743	2016-12-17 20:27:39.732743	277	1.0	51521.0
1179	5	1	367	2016-12-17 20:28:33.705734	2016-12-17 20:28:33.705734	277	0.2	2331.0
1181	5	1	382	2016-12-17 20:29:52.410622	2016-12-17 20:29:52.410622	277	0.2	16.2
1182	5	1	520	2016-12-17 20:30:28.786173	2016-12-17 20:30:28.786173	277	1.0	1374.0
1183	5	1	607	2016-12-17 20:30:54.974425	2016-12-17 20:30:54.974425	277	0.2	36595.6
1184	5	1	762	2016-12-17 20:31:16.588309	2016-12-17 20:31:16.588309	277	0.2	52.4
1185	5	1	779	2016-12-17 20:31:36.843235	2016-12-17 20:31:36.843235	277	0.2	542.0
1186	5	1	927	2016-12-17 20:32:01.262499	2016-12-17 20:32:01.262499	277	0.2	588.4
1187	5	1	935	2016-12-17 20:32:53.555387	2016-12-17 20:32:53.555387	277	0.2	7926.8
1189	5	1	786	2016-12-17 20:35:48.413365	2016-12-17 20:35:48.413365	277	1.0	3287.0
1190	5	1	971	2016-12-17 20:36:19.870363	2016-12-17 20:40:27.705754	277	2.0	806.0
1192	5	1	972	2016-12-17 20:40:46.538114	2016-12-17 20:40:46.538114	277	1.0	279.0
1193	5	1	847	2016-12-17 20:41:07.265778	2016-12-17 20:41:07.265778	277	1.0	957.0
1195	5	1	547	2016-12-17 20:42:14.38773	2016-12-17 20:42:14.38773	277	0.2	12901.0
1198	5	1	640	2016-12-17 20:51:17.744067	2016-12-17 20:51:17.744067	277	1.0	3064.0
1178	5	1	743	2016-12-17 20:28:15.612534	2016-12-17 20:53:16.230688	277	2.0	4302.0
1197	5	1	880	2016-12-17 20:44:58.79422	2016-12-17 20:44:58.79422	277	0.2	11435.4
1196	5	1	549	2016-12-17 20:42:50.045686	2016-12-17 20:45:57.334688	277	0.2	12901.0
1199	5	1	643	2016-12-17 20:55:18.92146	2016-12-17 20:55:18.92146	277	1.0	1826.0
1200	5	1	1537	2016-12-17 20:55:33.546942	2016-12-17 20:55:33.546942	277	1.0	4000.0
1201	5	1	1538	2016-12-17 20:56:03.982813	2016-12-17 20:56:03.982813	277	1.0	957.0
1202	5	1	1539	2016-12-17 20:56:22.969184	2016-12-17 20:56:22.969184	277	1.0	56.0
1203	5	1	1540	2016-12-17 20:56:47.11622	2016-12-17 20:56:47.11622	277	2.0	75.0
1204	5	1	1541	2016-12-17 20:57:01.228611	2016-12-17 20:57:01.228611	277	1.0	458.0
1205	5	1	1542	2016-12-17 20:57:16.958619	2016-12-17 20:57:16.958619	277	2.0	700.0
1206	5	1	1543	2016-12-17 20:57:37.115424	2016-12-17 20:57:37.115424	277	1.0	796.0
1207	5	1	1544	2016-12-17 20:57:51.708742	2016-12-17 20:57:51.708742	277	1.0	2682.0
1208	5	1	1545	2016-12-17 20:58:12.336471	2016-12-17 20:58:12.336471	277	1.0	2051.0
1209	5	1	1546	2016-12-17 20:58:28.257283	2016-12-17 20:58:28.257283	277	1.0	2280.0
327	4	2	217	2016-12-16 18:46:18.295359	2016-12-17 20:59:55.264667	307	1.5	53656.5
1210	5	1	894	2016-12-17 21:01:25.601691	2016-12-17 21:01:25.601691	307	4.0	5588.0
1213	5	1	901	2016-12-17 21:04:25.336673	2016-12-17 21:04:25.336673	307	1.0	204.0
1216	5	1	367	2016-12-17 21:05:40.989258	2016-12-17 21:06:03.38269	307	0.2	2331.0
1222	5	1	862	2016-12-17 21:13:35.484375	2016-12-17 21:13:35.484375	307	0.2	65170.6
1227	5	1	853	2016-12-17 21:23:09.930124	2016-12-17 21:23:09.930124	307	1.0	792.0
1232	5	1	1512	2016-12-17 21:27:47.264557	2016-12-17 21:27:47.264557	307	0.2	19488.0
1237	5	1	1538	2016-12-17 21:30:09.256087	2016-12-17 21:30:09.256087	307	1.0	957.0
1242	5	1	1543	2016-12-17 21:31:35.794139	2016-12-17 21:31:35.794139	307	1.0	796.0
1249	5	1	1171	2016-12-17 21:42:09.500116	2016-12-17 21:42:09.500116	337	1.0	16598.0
1254	5	1	743	2016-12-17 21:58:01.339755	2016-12-17 21:58:01.339755	337	0.2	430.2
1214	5	1	955	2016-12-17 21:04:54.660773	2016-12-17 21:04:54.660773	307	1.0	78845.0
1220	5	1	784	2016-12-17 21:12:28.421622	2016-12-17 21:12:28.421622	307	0.2	461.0
1225	5	1	971	2016-12-17 21:17:24.940023	2016-12-17 21:17:24.940023	307	2.0	806.0
1230	5	1	913	2016-12-17 21:24:30.212971	2016-12-17 21:24:30.212971	307	0.2	67558.4
1235	5	1	643	2016-12-17 21:29:32.239619	2016-12-17 21:29:32.239619	307	1.0	1826.0
1240	5	1	1541	2016-12-17 21:31:03.21923	2016-12-17 21:31:03.21923	307	1.0	458.0
1247	5	1	955	2016-12-17 21:41:12.304863	2016-12-17 21:41:12.304863	337	2.0	157690.0
1252	5	1	901	2016-12-17 21:57:28.878524	2016-12-17 21:57:28.878524	337	1.0	204.0
1212	5	1	1000	2016-12-17 21:04:05.908956	2016-12-17 21:04:05.908956	307	2.0	984.0
1215	5	1	743	2016-12-17 21:05:17.236132	2016-12-17 21:05:17.236132	307	1.0	2151.0
1221	5	1	783	2016-12-17 21:12:53.57998	2016-12-17 21:12:53.57998	307	0.2	3139.2
1226	5	1	1197	2016-12-17 21:22:36.014779	2016-12-17 21:22:36.014779	307	1.0	4220.0
1231	5	1	1319	2016-12-17 21:26:39.867801	2016-12-17 21:26:39.867801	307	1.0	1866667.0
1236	5	1	1537	2016-12-17 21:29:54.999541	2016-12-17 21:29:54.999541	307	1.0	4000.0
1241	5	1	1542	2016-12-17 21:31:19.226357	2016-12-17 21:31:19.226357	307	2.0	700.0
1245	5	1	1546	2016-12-17 21:32:41.49144	2016-12-17 21:32:41.49144	307	1.0	2280.0
1248	5	1	1000	2016-12-17 21:41:27.15069	2016-12-17 21:41:27.15069	337	3.0	1476.0
1253	5	1	1451	2016-12-17 21:57:45.968066	2016-12-17 21:57:45.968066	337	1.0	3745.0
1217	5	1	520	2016-12-17 21:07:03.857887	2016-12-17 21:07:03.857887	307	1.0	1374.0
1219	5	1	762	2016-12-17 21:11:59.443532	2016-12-17 21:11:59.443532	307	3.0	786.0
1224	5	1	972	2016-12-17 21:16:46.950544	2016-12-17 21:16:46.950544	307	2.0	558.0
1229	5	1	880	2016-12-17 21:23:55.289035	2016-12-17 21:23:55.289035	307	0.2	11435.4
1234	5	1	644	2016-12-17 21:29:11.395751	2016-12-17 21:29:11.395751	307	1.0	1527.0
1239	5	1	1540	2016-12-17 21:30:47.262805	2016-12-17 21:30:47.262805	307	2.0	75.0
1244	5	1	1545	2016-12-17 21:32:08.488463	2016-12-17 21:32:24.447553	307	2.0	4102.0
1246	5	1	894	2016-12-17 21:38:07.425534	2016-12-17 21:38:07.425534	337	3.0	4191.0
1251	5	1	1097	2016-12-17 21:56:28.156036	2016-12-17 21:56:28.156036	337	1.0	4675.0
1218	5	1	534	2016-12-17 21:08:27.262574	2016-12-17 21:08:27.262574	307	1.0	8400.0
1223	5	1	927	2016-12-17 21:14:17.030716	2016-12-17 21:14:17.030716	307	1.0	2942.0
1228	5	1	847	2016-12-17 21:23:27.73416	2016-12-17 21:23:27.73416	307	1.0	957.0
1233	5	1	640	2016-12-17 21:28:50.373069	2016-12-17 21:28:50.373069	307	1.0	3064.0
1238	5	1	1539	2016-12-17 21:30:25.54109	2016-12-17 21:30:25.54109	307	1.0	56.0
1243	5	1	1544	2016-12-17 21:31:53.464245	2016-12-17 21:31:53.464245	307	1.0	2682.0
1250	5	1	1039	2016-12-17 21:56:02.393793	2016-12-17 21:56:02.393793	337	1.0	158.0
1255	5	1	367	2016-12-17 21:58:25.917125	2016-12-17 21:58:44.934427	337	0.2	2331.0
1256	5	1	382	2016-12-18 19:44:57.722488	2016-12-18 19:44:57.722488	337	0.2	16.2
1257	5	1	520	2016-12-18 19:47:33.157668	2016-12-18 19:47:33.157668	337	0.2	274.8
1258	5	1	762	2016-12-18 19:48:09.030187	2016-12-18 19:48:09.030187	337	3.0	786.0
1259	5	1	779	2016-12-18 19:48:36.599135	2016-12-18 19:48:36.599135	337	0.2	542.0
1260	5	1	783	2016-12-18 19:48:57.957061	2016-12-18 19:48:57.957061	337	1.0	15696.0
1261	5	1	804	2016-12-18 19:49:33.985484	2016-12-18 19:49:33.985484	337	0.2	8816.0
1262	5	1	927	2016-12-18 19:53:22.059686	2016-12-18 19:53:22.059686	337	2.0	5884.0
1263	5	1	950	2016-12-18 19:53:58.603521	2016-12-18 19:53:58.603521	337	0.2	170560.0
1264	5	1	971	2016-12-18 19:54:42.570421	2016-12-18 19:54:42.570421	337	6.0	2418.0
1265	5	1	973	2016-12-18 19:55:25.55602	2016-12-18 19:55:25.55602	337	1.0	266.0
1266	5	1	975	2016-12-18 19:55:51.885913	2016-12-18 19:55:51.885913	337	1.0	46529.0
1267	5	1	853	2016-12-18 19:56:17.733669	2016-12-18 19:56:17.733669	337	1.0	792.0
1268	5	1	854	2016-12-18 19:56:37.622612	2016-12-18 19:56:37.622612	337	2.0	1906.0
1269	5	1	855	2016-12-18 19:56:53.776435	2016-12-18 19:56:53.776435	337	3.0	2310.0
1270	5	1	1268	2016-12-18 19:58:22.789802	2016-12-18 19:58:22.789802	337	1.0	4400000.0
1271	5	1	565	2016-12-18 20:01:00.220441	2016-12-18 20:01:00.220441	337	0.2	19529.4
1272	5	1	913	2016-12-18 20:02:06.714216	2016-12-18 20:02:36.498418	337	0.2	67558.4
1273	5	1	644	2016-12-18 20:03:08.538399	2016-12-18 20:03:41.322838	337	2.0	3054.0
1274	5	1	1537	2016-12-18 20:04:18.977532	2016-12-18 20:04:18.977532	337	1.0	4000.0
1275	5	1	1538	2016-12-18 20:04:37.439569	2016-12-18 20:04:37.439569	337	1.0	957.0
1276	5	1	1539	2016-12-18 20:04:57.580119	2016-12-18 20:04:57.580119	337	1.0	56.0
1277	5	1	1540	2016-12-18 20:05:16.976609	2016-12-18 20:05:16.976609	337	2.0	75.0
1278	5	1	1541	2016-12-18 20:05:38.100976	2016-12-18 20:05:38.100976	337	1.0	458.0
1279	5	1	1542	2016-12-18 20:05:56.916795	2016-12-18 20:05:56.916795	337	2.0	700.0
1280	5	1	1543	2016-12-18 20:06:17.808223	2016-12-18 20:06:17.808223	337	1.0	796.0
1281	5	1	1544	2016-12-18 20:07:15.657932	2016-12-18 20:07:15.657932	337	1.0	2682.0
1282	5	1	1545	2016-12-18 20:07:48.506722	2016-12-18 20:07:48.506722	337	1.0	2051.0
1283	5	1	1546	2016-12-18 20:08:07.553678	2016-12-18 20:08:07.553678	337	1.0	2280.0
391	4	2	217	2016-12-16 18:46:18.589105	2016-12-18 20:11:56.0551	367	2.0	71542.0
1284	5	1	894	2016-12-18 20:19:04.48805	2016-12-18 20:19:04.48805	367	5.0	6985.0
1285	5	1	1000	2016-12-18 20:19:23.444285	2016-12-18 20:19:23.444285	367	2.0	984.0
1286	5	1	901	2016-12-18 20:19:48.07168	2016-12-18 20:19:48.07168	367	1.0	204.0
1287	5	1	367	2016-12-18 20:20:06.49452	2016-12-18 20:20:06.49452	367	0.2	2331.0
1288	5	1	542	2016-12-18 20:21:02.962895	2016-12-18 20:21:02.962895	367	0.2	475200.0
1289	5	1	762	2016-12-18 20:21:35.706691	2016-12-18 20:21:35.706691	367	5.0	1310.0
1290	5	1	971	2016-12-18 20:24:37.914015	2016-12-18 20:25:13.931374	367	2.0	806.0
1291	5	1	986	2016-12-18 20:25:57.601809	2016-12-18 20:25:57.601809	367	0.2	17018.2
1292	5	1	1197	2016-12-18 20:27:47.485763	2016-12-18 20:27:47.485763	367	1.0	4220.0
1293	5	1	847	2016-12-18 20:28:39.851927	2016-12-18 20:28:39.851927	367	4.0	3828.0
1294	5	1	644	2016-12-18 20:29:01.594038	2016-12-18 20:29:01.594038	367	1.0	1527.0
1295	5	1	1537	2016-12-18 20:30:13.161657	2016-12-18 20:30:13.161657	367	1.0	4000.0
1296	5	1	1538	2016-12-18 20:30:32.012686	2016-12-18 20:30:32.012686	367	1.0	957.0
1297	5	1	1539	2016-12-18 20:30:48.993693	2016-12-18 20:30:48.993693	367	1.0	56.0
1298	5	1	1540	2016-12-18 20:31:06.292882	2016-12-18 20:31:06.292882	367	2.0	75.0
1299	5	1	1541	2016-12-18 20:31:24.937414	2016-12-18 20:31:24.937414	367	1.0	458.0
1300	5	1	1542	2016-12-18 20:32:24.576129	2016-12-18 20:32:24.576129	367	2.0	700.0
1301	5	1	1543	2016-12-18 20:32:43.090126	2016-12-18 20:32:43.090126	367	1.0	796.0
1302	5	1	1544	2016-12-18 20:33:04.339871	2016-12-18 20:33:04.339871	367	1.0	2682.0
1303	5	1	1545	2016-12-18 20:33:26.039794	2016-12-18 20:33:26.039794	367	1.0	2051.0
1304	5	1	1546	2016-12-18 20:33:43.226554	2016-12-18 20:33:43.226554	367	1.0	2280.0
743	4	2	217	2016-12-16 18:46:20.184983	2016-12-18 20:37:20.527179	697	2.0	71542.0
1305	5	1	367	2016-12-19 04:46:34.062966	2016-12-19 04:46:34.062966	67	1.0	11655.0
1306	5	1	364	2016-12-19 13:26:21.935171	2016-12-19 13:26:21.935171	697	2.0	684.0
1307	5	1	894	2016-12-19 13:33:26.896145	2016-12-19 13:33:26.896145	697	15.0	20955.0
1308	5	1	1000	2016-12-19 13:33:56.002498	2016-12-19 13:33:56.002498	697	2.0	984.0
1309	5	1	1039	2016-12-19 13:34:47.26234	2016-12-19 13:34:47.26234	697	1.0	158.0
1310	5	1	1116	2016-12-19 13:35:51.400548	2016-12-19 13:35:51.400548	697	45.0	88515.0
1311	5	1	1169	2016-12-19 13:36:28.126242	2016-12-19 13:36:28.126242	697	1.0	5644.0
1312	5	1	1175	2016-12-19 13:38:20.261137	2016-12-19 13:38:20.261137	697	1.0	248.0
1313	5	1	1462	2016-12-19 13:38:44.780718	2016-12-19 13:38:44.780718	697	1.0	462693.0
1314	5	1	1470	2016-12-19 13:40:38.696418	2016-12-19 13:40:38.696418	697	2.0	718.0
1315	5	1	1126	2016-12-19 13:42:30.656994	2016-12-19 13:42:30.656994	697	1.0	2085.0
1316	5	1	721	2016-12-19 13:44:03.929328	2016-12-19 13:44:03.929328	697	2.0	596.0
1317	5	1	1002	2016-12-19 13:44:43.44396	2016-12-19 13:44:43.44396	697	1.0	5795.0
1318	5	1	1206	2016-12-19 13:46:30.503691	2016-12-19 13:46:30.503691	697	50.0	68550.0
1319	4	2	146	2016-12-19 14:17:12.681464	2016-12-19 14:17:12.681464	68	1.5	33307.5
487	4	2	217	2016-12-16 18:46:19.020493	2016-12-19 14:29:24.443976	457	1.5	53656.5
522	4	2	146	2016-12-16 18:46:19.181297	2016-12-19 14:32:11.865732	489	1.5	33307.5
583	4	2	217	2016-12-16 18:46:19.460217	2016-12-19 14:34:58.954727	547	1.5	53656.5
647	4	2	217	2016-12-16 18:46:19.753344	2016-12-19 14:38:18.572434	607	1.5	53656.5
714	4	2	146	2016-12-16 18:46:20.053099	2016-12-19 14:43:03.69237	669	1.5	33307.5
775	4	2	217	2016-12-16 18:46:20.330412	2016-12-19 14:44:20.715586	727	1.5	53656.5
1320	5	1	520	2016-12-19 14:48:55.798754	2016-12-19 14:48:55.798754	67	1.0	1374.0
1322	5	1	644	2016-12-19 14:57:00.854268	2016-12-19 14:57:00.854268	67	1.0	1527.0
1323	5	1	762	2016-12-19 14:58:22.675476	2016-12-19 14:58:22.675476	67	3.0	786.0
1324	5	1	847	2016-12-19 14:59:14.990982	2016-12-19 14:59:14.990982	67	1.0	957.0
1325	5	1	869	2016-12-19 15:00:06.588807	2016-12-19 15:00:06.588807	67	1.0	162524.0
1326	5	1	894	2016-12-19 15:00:41.494863	2016-12-19 15:00:41.494863	67	2.0	2794.0
1327	5	1	901	2016-12-19 15:01:36.597347	2016-12-19 15:01:36.597347	67	1.0	204.0
1328	5	1	956	2016-12-19 15:03:58.929209	2016-12-19 15:03:58.929209	67	1.0	51521.0
1329	5	1	966	2016-12-19 15:04:36.105944	2016-12-19 15:04:36.105944	67	1.0	138.0
1330	5	1	971	2016-12-19 15:05:03.664818	2016-12-19 15:05:03.664818	67	2.0	806.0
1331	5	1	1000	2016-12-19 15:05:31.245361	2016-12-19 15:05:31.245361	67	1.0	492.0
1332	5	1	643	2016-12-19 15:08:31.060302	2016-12-19 15:08:31.060302	67	1.0	1826.0
1333	5	1	784	2016-12-19 15:09:15.436996	2016-12-19 15:09:15.436996	67	1.0	2305.0
1334	5	1	780	2016-12-19 15:09:55.553295	2016-12-19 15:09:55.553295	67	1.0	1471.0
1335	5	1	1537	2016-12-19 15:11:34.486678	2016-12-19 15:11:34.486678	67	\N	0.0
1336	5	1	1538	2016-12-19 15:12:25.82517	2016-12-19 15:12:25.82517	67	\N	0.0
1337	5	1	1539	2016-12-19 15:13:21.459288	2016-12-19 15:13:21.459288	67	1.0	56.0
1343	5	1	1545	2016-12-19 15:16:32.813255	2016-12-19 15:16:32.813255	67	\N	0.0
1345	5	1	364	2016-12-19 15:18:04.018672	2016-12-19 15:18:04.018672	97	1.0	342.0
1350	5	1	520	2016-12-19 15:21:00.156129	2016-12-19 15:21:00.156129	97	1.0	1374.0
1355	5	1	605	2016-12-19 15:25:33.990255	2016-12-19 15:25:33.990255	97	1.0	34300.0
1361	5	1	644	2016-12-19 15:29:40.788681	2016-12-19 15:29:40.788681	97	4.0	6108.0
1366	5	1	762	2016-12-19 15:35:02.584458	2016-12-19 15:35:02.584458	97	5.0	1310.0
1373	5	1	849	2016-12-19 15:42:43.025737	2016-12-19 15:42:43.025737	97	2.0	1914.0
1379	5	1	903	2016-12-19 15:52:31.65757	2016-12-19 15:52:31.65757	97	1.0	144.0
1381	5	1	940	2016-12-19 15:54:17.439402	2016-12-19 15:54:17.439402	97	2.0	77066.0
1385	5	1	967	2016-12-19 16:00:05.628401	2016-12-19 16:00:05.628401	97	3.0	3420.0
1368	5	1	779	2016-12-19 15:36:38.570683	2016-12-19 16:24:50.095154	97	3.0	8130.0
1338	5	1	1540	2016-12-19 15:14:15.92401	2016-12-19 15:14:15.92401	67	2.0	75.0
1339	5	1	1541	2016-12-19 15:15:00.600636	2016-12-19 15:15:00.600636	67	1.0	458.0
1344	5	1	1546	2016-12-19 15:16:47.378807	2016-12-19 15:16:47.378807	67	\N	0.0
1346	5	1	367	2016-12-19 15:18:28.539174	2016-12-19 15:18:28.539174	97	1.0	11655.0
1351	5	1	535	2016-12-19 15:21:31.499319	2016-12-19 15:21:31.499319	97	2.0	53110.0
1356	5	1	623	2016-12-19 15:26:16.997504	2016-12-19 15:26:16.997504	97	1.0	8678.0
1362	5	1	721	2016-12-19 15:32:23.364548	2016-12-19 15:32:23.364548	97	2.0	596.0
1367	5	1	767	2016-12-19 15:35:55.437835	2016-12-19 15:35:55.437835	97	1.0	24000000.0
1369	5	1	803	2016-12-19 15:39:33.893478	2016-12-19 15:39:33.893478	97	1.0	5500000.0
1380	5	1	928	2016-12-19 15:53:29.743413	2016-12-19 15:53:29.743413	97	2.0	4750.0
1382	5	1	954	2016-12-19 15:57:08.30569	2016-12-19 15:57:08.30569	97	1.0	102683.0
1386	5	1	969	2016-12-19 16:00:31.558453	2016-12-19 16:00:31.558453	97	1.0	275.0
1340	5	1	1542	2016-12-19 15:15:36.4815	2016-12-19 15:15:36.4815	67	2.0	700.0
1347	5	1	380	2016-12-19 15:18:55.72479	2016-12-19 15:18:55.72479	97	1.0	77.0
1352	5	1	536	2016-12-19 15:21:56.265882	2016-12-19 15:21:56.265882	97	24.0	48672.0
1357	5	1	628	2016-12-19 15:26:52.252525	2016-12-19 15:26:52.252525	97	2.0	48732.0
1358	5	1	640	2016-12-19 15:27:42.949901	2016-12-19 15:27:42.949901	97	5.0	15320.0
1363	5	1	724	2016-12-19 15:32:56.891414	2016-12-19 15:32:56.891414	97	1.0	1683.0
1370	5	1	804	2016-12-19 15:40:04.044281	2016-12-19 15:40:04.044281	97	1.0	44080.0
1376	5	1	873	2016-12-19 15:49:55.568679	2016-12-19 15:49:55.568679	97	1.0	208800.0
1383	5	1	955	2016-12-19 15:58:12.802955	2016-12-19 15:58:12.802955	97	3.0	236535.0
1341	5	1	1543	2016-12-19 15:15:59.152185	2016-12-19 15:15:59.152185	67	1.0	796.0
1348	5	1	382	2016-12-19 15:19:22.68201	2016-12-19 15:19:22.68201	97	2.0	162.0
1353	5	1	553	2016-12-19 15:22:33.829269	2016-12-19 15:22:33.829269	97	1.0	64505.0
1359	5	1	641	2016-12-19 15:28:44.293252	2016-12-19 15:28:44.293252	97	1.0	1324.0
1364	5	1	740	2016-12-19 15:33:29.704964	2016-12-19 15:33:29.704964	97	2.0	650.0
1371	5	1	810	2016-12-19 15:40:23.591031	2016-12-19 15:40:23.591031	97	1.0	2681.0
1375	5	1	854	2016-12-19 15:46:35.395723	2016-12-19 15:46:35.395723	97	4.0	3812.0
1377	5	1	894	2016-12-19 15:51:43.5311	2016-12-19 15:51:43.5311	97	19.0	26543.0
1384	5	1	966	2016-12-19 15:58:33.724122	2016-12-19 15:59:41.611677	97	6.0	828.0
1342	5	1	1544	2016-12-19 15:16:17.201268	2016-12-19 15:16:17.201268	67	\N	0.0
1349	5	1	434	2016-12-19 15:19:53.310649	2016-12-19 15:19:53.310649	97	2.0	816.0
1354	5	1	565	2016-12-19 15:24:09.768897	2016-12-19 15:24:09.768897	97	1.0	97647.0
1365	5	1	743	2016-12-19 15:34:05.479727	2016-12-19 15:34:05.479727	97	1.0	2151.0
1372	5	1	834	2016-12-19 15:41:22.287752	2016-12-19 15:41:22.287752	97	1.0	231.0
1378	5	1	901	2016-12-19 15:52:08.182763	2016-12-19 15:52:08.182763	97	1.0	204.0
1387	5	1	971	2016-12-19 16:01:20.650034	2016-12-19 16:01:20.650034	97	14.0	5642.0
1388	5	1	973	2016-12-19 16:01:57.902737	2016-12-19 16:01:57.902737	97	14.0	3724.0
1389	5	1	975	2016-12-19 16:02:22.491679	2016-12-19 16:02:22.491679	97	1.0	46529.0
1390	5	1	1000	2016-12-19 16:03:54.129652	2016-12-19 16:03:54.129652	97	4.0	1968.0
1391	5	1	1002	2016-12-19 16:04:28.713964	2016-12-19 16:04:28.713964	97	1.0	5795.0
1392	5	1	1003	2016-12-19 16:05:14.666758	2016-12-19 16:05:14.666758	97	1.0	26717.0
1393	5	1	1009	2016-12-19 16:05:49.448586	2016-12-19 16:05:49.448586	97	3.0	2901.0
1394	5	1	1039	2016-12-19 16:06:16.131323	2016-12-19 16:06:47.907314	97	3.0	474.0
1395	5	1	1096	2016-12-19 16:07:20.440754	2016-12-19 16:07:20.440754	97	1.0	11459.0
1396	5	1	1101	2016-12-19 16:07:52.032791	2016-12-19 16:07:52.032791	97	2.0	27714.0
1397	5	1	1108	2016-12-19 16:08:18.78335	2016-12-19 16:08:18.78335	97	1.0	20507.0
1398	5	1	1112	2016-12-19 16:08:51.814706	2016-12-19 16:08:51.814706	97	6.0	11034.0
1399	5	1	1124	2016-12-19 16:09:19.67767	2016-12-19 16:09:19.67767	97	1.0	2300.0
1400	5	1	1150	2016-12-19 16:10:25.207098	2016-12-19 16:10:25.207098	97	2.0	32920.0
1401	5	1	1164	2016-12-19 16:11:29.394281	2016-12-19 16:11:29.394281	97	1.0	13725.0
1402	5	1	1167	2016-12-19 16:12:09.483549	2016-12-19 16:12:09.483549	97	1.0	6238.0
1403	5	1	1169	2016-12-19 16:12:30.091045	2016-12-19 16:12:30.091045	97	1.0	5644.0
1404	5	1	1175	2016-12-19 16:13:33.763018	2016-12-19 16:13:33.763018	97	2.0	496.0
1405	5	1	1179	2016-12-19 16:14:09.657552	2016-12-19 16:14:09.657552	97	1.0	33540.0
1406	5	1	1187	2016-12-19 16:14:31.513301	2016-12-19 16:14:31.513301	97	1.0	24592.0
1407	5	1	1206	2016-12-19 16:15:16.878294	2016-12-19 16:15:16.878294	97	40.0	54840.0
1408	5	1	1260	2016-12-19 16:15:49.691406	2016-12-19 16:15:49.691406	97	1.0	1065.0
1409	5	1	1438	2016-12-19 16:18:36.238334	2016-12-19 16:18:36.238334	97	3.0	52011.0
1410	5	1	1439	2016-12-19 16:19:03.978991	2016-12-19 16:19:03.978991	97	2.0	29484.0
1411	5	1	1442	2016-12-19 16:19:26.250814	2016-12-19 16:19:26.250814	97	2.0	29400.0
1412	5	1	1451	2016-12-19 16:19:49.638327	2016-12-19 16:19:49.638327	97	2.0	7490.0
1413	5	1	1470	2016-12-19 16:20:17.509695	2016-12-19 16:20:17.509695	97	1.0	359.0
1414	5	1	1487	2016-12-19 16:20:57.251677	2016-12-19 16:20:57.251677	97	1.0	3126.0
1415	5	1	1531	2016-12-19 16:21:16.419109	2016-12-19 16:21:16.419109	97	1.0	11569.0
1360	5	1	643	2016-12-19 15:29:08.49702	2016-12-19 16:24:17.932127	97	2.0	3652.0
1416	5	1	780	2016-12-19 16:25:11.431381	2016-12-19 16:25:11.431381	97	1.0	1471.0
1417	5	1	1537	2016-12-19 16:25:31.778732	2016-12-19 16:25:31.778732	97	\N	0.0
1419	5	1	1539	2016-12-19 16:26:44.400758	2016-12-19 16:26:44.400758	97	1.0	56.0
1420	5	1	1540	2016-12-19 16:27:01.9531	2016-12-19 16:27:01.9531	97	2.0	75.0
1421	5	1	1541	2016-12-19 16:27:21.065933	2016-12-19 16:27:21.065933	97	1.0	458.0
1422	5	1	956	2016-12-19 16:27:27.622161	2016-12-19 16:27:27.622161	697	3.0	154563.0
1423	5	1	1542	2016-12-19 16:27:39.309541	2016-12-19 16:27:39.309541	97	2.0	700.0
1424	5	1	635	2016-12-19 16:28:09.922574	2016-12-19 16:28:09.922574	697	4.0	18852.0
1425	5	1	810	2016-12-19 16:28:28.469122	2016-12-19 16:28:28.469122	697	1.0	2681.0
1426	5	1	1097	2016-12-19 16:28:53.310692	2016-12-19 16:28:53.310692	697	1.0	4675.0
1427	5	1	1179	2016-12-19 16:29:14.889111	2016-12-19 16:29:14.889111	697	1.0	33540.0
1428	5	1	901	2016-12-19 16:29:37.753036	2016-12-19 16:29:37.753036	697	1.0	204.0
1429	5	1	743	2016-12-19 16:29:57.817405	2016-12-19 16:29:57.817405	697	0.4	860.4
1430	5	1	367	2016-12-19 16:30:34.072723	2016-12-19 16:30:34.072723	697	0.2	2331.0
1431	5	1	380	2016-12-19 16:30:40.245639	2016-12-19 16:30:40.245639	127	2.0	154.0
1432	5	1	382	2016-12-19 16:30:59.250337	2016-12-19 16:30:59.250337	697	0.4	32.4
1433	5	1	520	2016-12-19 16:31:20.128027	2016-12-19 16:31:20.128027	697	1.0	1374.0
1434	5	1	434	2016-12-19 16:31:26.617218	2016-12-19 16:31:26.617218	127	2.0	816.0
1435	5	1	491	2016-12-19 16:31:47.689613	2016-12-19 16:31:47.689613	127	17.0	11679.0
1436	5	1	504	2016-12-19 16:32:08.392997	2016-12-19 16:32:08.392997	127	2.0	1832.0
1437	5	1	565	2016-12-19 16:32:38.365578	2016-12-19 16:32:38.365578	127	1.0	97647.0
1438	5	1	535	2016-12-19 16:33:02.914846	2016-12-19 16:33:02.914846	697	0.2	5311.0
1439	5	1	715	2016-12-19 16:34:21.940067	2016-12-19 16:34:21.940067	697	1.0	7800.0
1440	5	1	762	2016-12-19 16:34:35.848561	2016-12-19 16:34:35.848561	697	5.0	1310.0
1441	5	1	628	2016-12-19 16:34:38.20664	2016-12-19 16:34:38.20664	127	1.0	24366.0
1442	5	1	784	2016-12-19 16:34:55.746943	2016-12-19 16:34:55.746943	697	3.0	6915.0
1443	5	1	640	2016-12-19 16:35:08.456522	2016-12-19 16:35:08.456522	127	3.0	9192.0
1444	5	1	783	2016-12-19 16:35:48.788972	2016-12-19 16:36:18.205248	697	1.0	15696.0
1446	5	1	644	2016-12-19 16:36:28.789305	2016-12-19 16:36:28.789305	127	2.0	3054.0
1447	5	1	804	2016-12-19 16:36:39.920291	2016-12-19 16:36:39.920291	697	0.2	8816.0
1448	5	1	743	2016-12-19 16:37:08.244171	2016-12-19 16:37:08.244171	127	3.0	6453.0
1449	5	1	762	2016-12-19 16:37:44.995508	2016-12-19 16:37:44.995508	127	8.0	2096.0
1450	5	1	772	2016-12-19 16:38:10.309894	2016-12-19 16:38:10.309894	127	4.0	1580.0
1451	5	1	927	2016-12-19 16:39:02.427016	2016-12-19 16:39:02.427016	697	0.2	588.4
1453	5	1	928	2016-12-19 16:39:43.41586	2016-12-19 16:39:43.41586	697	0.4	950.0
1454	5	1	963	2016-12-19 16:40:03.374334	2016-12-19 16:40:03.374334	697	2.0	16800.0
1455	5	1	966	2016-12-19 16:40:31.031282	2016-12-19 16:40:31.031282	697	5.0	690.0
1456	5	1	974	2016-12-19 16:41:03.735935	2016-12-19 16:41:03.735935	697	1.0	647.0
1457	5	1	975	2016-12-19 16:41:52.416934	2016-12-19 16:41:52.416934	697	1.0	46529.0
1458	5	1	1009	2016-12-19 16:42:33.328095	2016-12-19 16:42:33.328095	697	0.6	580.2
1459	5	1	1238	2016-12-19 16:43:00.543426	2016-12-19 16:43:00.543426	697	1.0	2021.0
1460	5	1	1258	2016-12-19 16:43:38.412096	2016-12-19 16:43:38.412096	697	0.4	447.2
1461	5	1	810	2016-12-19 16:44:02.596882	2016-12-19 16:44:02.596882	127	1.0	2681.0
1462	5	1	850	2016-12-19 16:44:52.519155	2016-12-19 16:44:52.519155	127	2.0	2002.0
1463	5	1	857	2016-12-19 16:45:25.808059	2016-12-19 16:45:25.808059	127	1.0	190240.0
1464	5	1	894	2016-12-19 16:46:31.331865	2016-12-19 16:46:31.331865	127	10.0	13970.0
1465	5	1	901	2016-12-19 16:46:58.070128	2016-12-19 16:46:58.070128	127	2.0	408.0
1466	5	1	955	2016-12-19 16:47:19.731456	2016-12-19 16:47:19.731456	127	2.0	157690.0
1467	5	1	971	2016-12-19 16:48:26.348055	2016-12-19 16:48:26.348055	127	10.0	4030.0
1468	5	1	972	2016-12-19 16:48:52.791871	2016-12-19 16:48:52.791871	127	3.0	837.0
1469	5	1	973	2016-12-19 16:49:09.968254	2016-12-19 16:49:09.968254	127	10.0	2660.0
1470	5	1	980	2016-12-19 16:49:34.623499	2016-12-19 16:49:34.623499	127	1.0	680000.0
1471	5	1	1000	2016-12-19 16:49:59.121604	2016-12-19 16:49:59.121604	127	3.0	1476.0
1472	5	1	1097	2016-12-19 16:50:50.721686	2016-12-19 16:50:50.721686	127	1.0	4675.0
1473	5	1	1197	2016-12-19 16:51:52.597247	2016-12-19 16:51:52.597247	127	1.0	4220.0
1474	5	1	1485	2016-12-19 16:52:46.255663	2016-12-19 16:52:46.255663	697	1.0	3484.0
1475	5	1	1205	2016-12-19 16:53:28.106918	2016-12-19 16:53:28.106918	127	40.0	43280.0
1476	5	1	938	2016-12-19 16:53:55.536273	2016-12-19 16:53:55.536273	697	0.2	12814.0
1477	5	1	1260	2016-12-19 16:54:27.973736	2016-12-19 16:54:27.973736	127	1.0	1065.0
1452	5	1	779	2016-12-19 16:39:07.414034	2016-12-19 17:03:41.08454	127	2.0	5420.0
1491	5	1	1540	2016-12-19 17:07:20.215749	2016-12-19 17:07:20.215749	127	2.0	75.0
1478	5	1	1451	2016-12-19 16:55:19.031416	2016-12-19 16:55:19.031416	127	2.0	7490.0
1481	5	1	1519	2016-12-19 16:57:02.842925	2016-12-19 16:57:02.842925	127	1.0	15522.0
1485	5	1	1537	2016-12-19 16:59:46.625185	2016-12-19 16:59:46.625185	127	\N	0.0
1489	5	1	1538	2016-12-19 17:06:07.242698	2016-12-19 17:06:07.242698	127	\N	0.0
1500	5	1	1546	2016-12-19 17:10:01.466176	2016-12-19 17:10:01.466176	127	\N	0.0
1504	5	1	1543	2016-12-19 17:12:29.611032	2016-12-19 17:12:29.611032	97	\N	0.0
1505	5	1	1544	2016-12-19 17:12:45.017815	2016-12-19 17:12:45.017815	97	\N	0.0
1508	5	1	641	2016-12-19 17:14:49.827507	2016-12-19 17:14:49.827507	697	1.0	1324.0
1516	5	1	1537	2016-12-19 17:17:50.683848	2016-12-19 17:17:50.683848	697	1.0	4000.0
1535	5	1	855	2016-12-19 17:23:11.423601	2016-12-19 17:23:11.423601	397	4.0	3080.0
1539	5	1	901	2016-12-19 17:24:36.591425	2016-12-19 17:24:36.591425	397	3.0	612.0
1544	5	1	640	2016-12-19 17:25:39.87794	2016-12-19 17:25:39.87794	757	1.0	3064.0
1548	5	1	971	2016-12-19 17:26:48.262912	2016-12-19 17:26:48.262912	397	3.0	1209.0
1553	5	1	894	2016-12-19 17:28:01.906176	2016-12-19 17:28:01.906176	757	2.0	2794.0
1479	5	1	967	2016-12-19 16:55:23.635865	2016-12-19 16:55:23.635865	697	10.0	11400.0
1482	5	1	786	2016-12-19 16:57:07.447693	2016-12-19 16:57:07.447693	697	0.8	2629.6
1445	5	1	643	2016-12-19 16:35:49.957045	2016-12-19 16:58:09.921315	127	3.0	5478.0
1484	5	1	854	2016-12-19 16:59:32.009368	2016-12-19 16:59:32.009368	697	4.0	3812.0
1486	5	1	855	2016-12-19 17:02:51.429724	2016-12-19 17:02:51.429724	697	2.0	1540.0
1487	5	1	565	2016-12-19 17:04:00.005417	2016-12-19 17:04:00.005417	697	0.2	19529.4
1493	5	1	1542	2016-12-19 17:08:06.576578	2016-12-19 17:08:06.576578	127	2.0	700.0
1496	5	1	913	2016-12-19 17:08:39.765172	2016-12-19 17:08:39.765172	697	0.2	67558.4
1501	5	1	1545	2016-12-19 17:10:27.927846	2016-12-19 17:10:27.927846	127	\N	0.0
1517	5	1	1538	2016-12-19 17:18:09.968287	2016-12-19 17:18:09.968287	697	1.0	957.0
1522	5	1	1541	2016-12-19 17:18:52.551687	2016-12-19 17:18:52.551687	697	1.0	458.0
1526	5	1	641	2016-12-19 17:19:24.990318	2016-12-19 17:19:24.990318	397	1.0	1324.0
1528	5	1	715	2016-12-19 17:19:47.571096	2016-12-19 17:19:47.571096	397	2.0	15600.0
1531	5	1	743	2016-12-19 17:20:15.393546	2016-12-19 17:20:15.393546	397	1.0	2151.0
1533	5	1	779	2016-12-19 17:21:16.148691	2016-12-19 17:21:16.148691	397	2.0	5420.0
1545	5	1	956	2016-12-19 17:25:59.403261	2016-12-19 17:25:59.403261	397	1.0	51521.0
1549	5	1	786	2016-12-19 17:26:54.974136	2016-12-19 17:26:54.974136	757	0.2	657.4
1558	5	1	1197	2016-12-19 17:28:55.390705	2016-12-19 17:28:55.390705	397	2.0	8440.0
1480	5	1	1488	2016-12-19 16:56:20.397432	2016-12-19 16:56:20.397432	127	1.0	3472.0
1483	5	1	380	2016-12-19 16:58:32.145971	2016-12-19 16:58:32.145971	697	0.2	15.4
1488	5	1	780	2016-12-19 17:04:40.848518	2016-12-19 17:04:40.848518	127	1.0	1471.0
1490	5	1	1539	2016-12-19 17:06:56.199936	2016-12-19 17:06:56.199936	127	1.0	56.0
1498	5	1	1187	2016-12-19 17:09:29.542923	2016-12-19 17:09:29.542923	697	0.2	4918.4
1499	5	1	1544	2016-12-19 17:09:40.108026	2016-12-19 17:09:40.108026	127	\N	0.0
1502	5	1	1512	2016-12-19 17:11:26.536869	2016-12-19 17:11:26.536869	697	0.6	58464.0
1509	5	1	643	2016-12-19 17:15:18.37513	2016-12-19 17:15:18.37513	697	2.0	3652.0
1510	5	1	644	2016-12-19 17:15:38.211433	2016-12-19 17:15:38.211433	697	3.0	4581.0
1511	5	1	640	2016-12-19 17:16:10.125586	2016-12-19 17:16:10.125586	697	1.0	3064.0
1512	5	1	724	2016-12-19 17:16:41.145631	2016-12-19 17:16:41.145631	697	1.0	1683.0
1513	5	1	366	2016-12-19 17:17:04.297222	2016-12-19 17:17:04.297222	397	1.0	1801.0
1518	5	1	604	2016-12-19 17:18:14.134547	2016-12-19 17:18:14.134547	397	2.0	481500.0
1519	5	1	1539	2016-12-19 17:18:24.4642	2016-12-19 17:18:24.4642	697	1.0	56.0
1523	5	1	640	2016-12-19 17:19:01.496562	2016-12-19 17:19:01.496562	397	1.0	3064.0
1527	5	1	1544	2016-12-19 17:19:43.865933	2016-12-19 17:19:43.865933	697	1.0	2682.0
1536	5	1	859	2016-12-19 17:23:41.779251	2016-12-19 17:23:41.779251	397	1.0	161034.0
1538	5	1	367	2016-12-19 17:24:15.983794	2016-12-19 17:24:15.983794	757	0.2	2331.0
1542	5	1	927	2016-12-19 17:25:05.081827	2016-12-19 17:25:05.081827	397	1.0	2942.0
1543	5	1	565	2016-12-19 17:25:25.116315	2016-12-19 17:25:25.116315	757	0.2	19529.4
1547	5	1	779	2016-12-19 17:26:37.936215	2016-12-19 17:26:37.936215	757	0.2	542.0
1552	5	1	974	2016-12-19 17:27:37.126001	2016-12-19 17:27:37.126001	397	1.0	647.0
1556	5	1	1010	2016-12-19 17:28:26.880328	2016-12-19 17:28:26.880328	397	3.0	5871.0
1557	5	1	927	2016-12-19 17:28:44.50788	2016-12-19 17:28:44.50788	757	0.2	588.4
1492	5	1	1541	2016-12-19 17:07:42.070919	2016-12-19 17:07:42.070919	127	1.0	458.0
1495	5	1	1543	2016-12-19 17:08:25.10595	2016-12-19 17:08:25.10595	127	1.0	796.0
1503	5	1	1055	2016-12-19 17:12:24.256412	2016-12-19 17:12:57.041245	697	0.2	168516.0
1506	5	1	1545	2016-12-19 17:12:58.611412	2016-12-19 17:12:58.611412	97	\N	0.0
1507	5	1	1546	2016-12-19 17:13:14.163143	2016-12-19 17:13:14.163143	97	\N	0.0
1497	5	1	1052	2016-12-19 17:09:09.4068	2016-12-19 17:13:21.118712	697	0.2	196000.0
1521	5	1	617	2016-12-19 17:18:37.340266	2016-12-19 17:18:37.340266	397	2.0	6852.0
1532	5	1	762	2016-12-19 17:20:47.337308	2016-12-19 17:20:47.337308	397	3.0	786.0
1534	5	1	852	2016-12-19 17:22:34.905636	2016-12-19 17:22:34.905636	397	4.0	3508.0
1541	5	1	520	2016-12-19 17:24:49.795964	2016-12-19 17:24:49.795964	757	0.2	274.8
1550	5	1	972	2016-12-19 17:27:10.408472	2016-12-19 17:27:10.408472	397	3.0	837.0
1555	5	1	901	2016-12-19 17:28:16.82657	2016-12-19 17:28:16.82657	757	1.0	204.0
1494	5	1	880	2016-12-19 17:08:16.193067	2016-12-19 17:08:16.193067	697	0.2	11435.4
1514	5	1	491	2016-12-19 17:17:22.564575	2016-12-19 17:17:22.564575	397	7.0	4809.0
1515	5	1	520	2016-12-19 17:17:44.443839	2016-12-19 17:17:44.443839	397	1.0	1374.0
1520	5	1	1540	2016-12-19 17:18:36.861748	2016-12-19 17:18:36.861748	697	2.0	75.0
1524	5	1	1542	2016-12-19 17:19:08.064478	2016-12-19 17:19:08.064478	697	2.0	700.0
1525	5	1	1543	2016-12-19 17:19:24.250805	2016-12-19 17:19:24.250805	697	1.0	796.0
1529	5	1	1545	2016-12-19 17:19:55.333023	2016-12-19 17:19:55.333023	697	1.0	2051.0
1530	5	1	1546	2016-12-19 17:20:15.276632	2016-12-19 17:20:15.276632	697	1.0	2280.0
810	4	2	146	2016-12-16 18:46:20.508002	2016-12-19 17:22:51.159446	759	2.0	44410.0
1537	5	1	894	2016-12-19 17:24:05.520794	2016-12-19 17:24:05.520794	397	10.0	13970.0
1540	5	1	382	2016-12-19 17:24:37.456112	2016-12-19 17:24:37.456112	757	0.2	16.2
1546	5	1	643	2016-12-19 17:26:04.398947	2016-12-19 17:26:24.03747	757	1.0	1826.0
1551	5	1	854	2016-12-19 17:27:21.974365	2016-12-19 17:27:21.974365	757	4.0	3812.0
1554	5	1	1000	2016-12-19 17:28:02.569803	2016-12-19 17:28:02.569803	397	1.0	492.0
1559	5	1	928	2016-12-19 17:29:07.771392	2016-12-19 17:29:07.771392	757	0.2	475.0
1560	5	1	1238	2016-12-19 17:29:16.496562	2016-12-19 17:29:16.496562	397	2.0	4042.0
1561	5	1	930	2016-12-19 17:29:29.653429	2016-12-19 17:29:29.653429	757	0.2	8323.2
1562	5	1	1451	2016-12-19 17:29:33.495606	2016-12-19 17:29:33.495606	397	10.0	37450.0
1563	5	1	956	2016-12-19 17:29:52.530955	2016-12-19 17:29:52.530955	757	1.0	51521.0
1564	5	1	643	2016-12-19 17:30:12.661937	2016-12-19 17:30:12.661937	397	1.0	1826.0
1565	5	1	971	2016-12-19 17:30:15.466269	2016-12-19 17:30:15.466269	757	2.0	806.0
1566	5	1	784	2016-12-19 17:30:31.587328	2016-12-19 17:30:31.587328	397	1.0	2305.0
1567	5	1	972	2016-12-19 17:30:34.453972	2016-12-19 17:30:34.453972	757	1.0	279.0
1568	5	1	973	2016-12-19 17:30:51.917592	2016-12-19 17:30:51.917592	757	1.0	266.0
1569	5	1	780	2016-12-19 17:30:52.50246	2016-12-19 17:30:52.50246	397	1.0	1471.0
1570	5	1	1000	2016-12-19 17:31:02.902934	2016-12-19 17:31:02.902934	757	2.0	984.0
1571	5	1	1537	2016-12-19 17:31:07.338307	2016-12-19 17:31:07.338307	397	\N	0.0
1572	5	1	1538	2016-12-19 17:31:31.516404	2016-12-19 17:31:31.516404	397	1.0	957.0
1573	5	1	1539	2016-12-19 17:31:53.224762	2016-12-19 17:31:53.224762	397	1.0	56.0
1574	5	1	743	2016-12-19 17:32:01.02285	2016-12-19 17:32:01.02285	757	1.0	2151.0
1575	5	1	1540	2016-12-19 17:32:08.81256	2016-12-19 17:32:08.81256	397	2.0	75.0
1576	5	1	1541	2016-12-19 17:32:24.907579	2016-12-19 17:32:24.907579	397	1.0	458.0
1577	5	1	1542	2016-12-19 17:32:41.079712	2016-12-19 17:32:41.079712	397	2.0	700.0
1578	5	1	1537	2016-12-19 17:32:41.700359	2016-12-19 17:32:41.700359	757	1.0	4000.0
1579	5	1	1543	2016-12-19 17:33:00.292487	2016-12-19 17:33:00.292487	397	1.0	796.0
1580	5	1	1538	2016-12-19 17:33:01.228237	2016-12-19 17:33:01.228237	757	1.0	957.0
1581	5	1	1544	2016-12-19 17:33:13.183266	2016-12-19 17:33:13.183266	397	\N	0.0
1582	5	1	1539	2016-12-19 17:33:15.80627	2016-12-19 17:33:15.80627	757	1.0	56.0
1583	5	1	1545	2016-12-19 17:33:28.487187	2016-12-19 17:33:28.487187	397	\N	0.0
1584	5	1	1540	2016-12-19 17:33:32.863708	2016-12-19 17:33:32.863708	757	2.0	75.0
1585	5	1	1546	2016-12-19 17:33:42.25108	2016-12-19 17:33:42.25108	397	\N	0.0
1586	5	1	1541	2016-12-19 17:33:47.362389	2016-12-19 17:33:47.362389	757	1.0	458.0
1587	5	1	1542	2016-12-19 17:34:01.477675	2016-12-19 17:34:01.477675	757	2.0	700.0
1588	5	1	1543	2016-12-19 17:34:16.204164	2016-12-19 17:34:16.204164	757	1.0	796.0
1589	5	1	1544	2016-12-19 17:34:28.907364	2016-12-19 17:34:28.907364	757	1.0	2682.0
1590	5	1	1545	2016-12-19 17:34:44.54441	2016-12-19 17:34:44.54441	757	1.0	2051.0
1591	5	1	1546	2016-12-19 17:35:00.869455	2016-12-19 17:35:00.869455	757	1.0	2280.0
1592	5	1	364	2016-12-19 17:35:17.448937	2016-12-19 17:35:17.448937	427	1.0	342.0
1593	5	1	434	2016-12-19 17:35:33.777545	2016-12-19 17:35:33.777545	427	1.0	408.0
1594	5	1	644	2016-12-19 17:35:55.605161	2016-12-19 17:35:55.605161	427	2.0	3054.0
1595	5	1	743	2016-12-19 17:36:16.212404	2016-12-19 17:36:16.212404	427	2.0	4302.0
1596	5	1	810	2016-12-19 17:36:45.250564	2016-12-19 17:36:45.250564	427	1.0	2681.0
1599	5	1	847	2016-12-19 17:38:39.569812	2016-12-19 17:38:39.569812	427	1.0	957.0
1600	5	1	850	2016-12-19 17:39:05.401486	2016-12-19 17:39:05.401486	427	1.0	1001.0
1601	5	1	857	2016-12-19 17:39:42.840737	2016-12-19 17:39:42.840737	427	1.0	190240.0
1602	5	1	901	2016-12-19 17:40:04.685257	2016-12-19 17:40:04.685257	427	1.0	204.0
1603	5	1	955	2016-12-19 17:40:28.800945	2016-12-19 17:40:28.800945	427	1.0	78845.0
1604	5	1	967	2016-12-19 17:40:52.147986	2016-12-19 17:40:52.147986	427	1.0	1140.0
1605	5	1	971	2016-12-19 17:41:24.366835	2016-12-19 17:41:24.366835	427	4.0	1612.0
1606	5	1	972	2016-12-19 17:41:45.047154	2016-12-19 17:41:45.047154	427	2.0	558.0
1607	5	1	983	2016-12-19 17:42:07.318312	2016-12-19 17:42:07.318312	427	1.0	828000.0
1608	5	1	1002	2016-12-19 17:42:29.267277	2016-12-19 17:42:29.267277	427	1.0	5795.0
1609	5	1	1097	2016-12-19 17:43:42.347259	2016-12-19 17:43:42.347259	427	1.0	4675.0
1610	5	1	1169	2016-12-19 17:44:02.050219	2016-12-19 17:44:02.050219	427	1.0	5644.0
1611	5	1	1198	2016-12-19 17:44:19.717094	2016-12-19 17:44:19.717094	427	1.0	4060.0
1612	5	1	1260	2016-12-19 17:45:19.168001	2016-12-19 17:45:19.168001	427	1.0	1065.0
1613	5	1	643	2016-12-19 17:45:49.745877	2016-12-19 17:45:49.745877	427	1.0	1826.0
1614	5	1	784	2016-12-19 17:46:15.113116	2016-12-19 17:46:15.113116	427	1.0	2305.0
1615	5	1	786	2016-12-19 17:46:40.4835	2016-12-19 17:46:40.4835	427	1.0	3287.0
1616	5	1	1537	2016-12-19 17:46:54.185555	2016-12-19 17:46:54.185555	427	\N	0.0
1617	5	1	1538	2016-12-19 17:47:06.158041	2016-12-19 17:47:06.158041	427	\N	0.0
1618	5	1	1539	2016-12-19 17:47:25.614807	2016-12-19 17:47:25.614807	427	1.0	56.0
1619	5	1	1540	2016-12-19 17:47:42.98061	2016-12-19 17:47:42.98061	427	2.0	75.0
1620	5	1	1541	2016-12-19 17:48:04.392846	2016-12-19 17:48:04.392846	427	1.0	458.0
1621	5	1	1542	2016-12-19 17:48:19.434263	2016-12-19 17:48:19.434263	427	2.0	700.0
1622	5	1	1543	2016-12-19 17:48:35.151606	2016-12-19 17:48:35.151606	427	1.0	796.0
1623	5	1	1544	2016-12-19 17:48:49.846654	2016-12-19 17:48:49.846654	427	\N	0.0
1624	5	1	1545	2016-12-19 17:49:03.245059	2016-12-19 17:49:03.245059	427	\N	0.0
1625	5	1	1546	2016-12-19 17:49:18.629367	2016-12-19 17:49:18.629367	427	\N	0.0
1626	5	1	367	2016-12-19 17:52:35.598573	2016-12-19 17:52:35.598573	487	1.0	11655.0
1627	5	1	382	2016-12-19 17:53:09.502718	2016-12-19 17:53:09.502718	487	2.0	162.0
1628	5	1	520	2016-12-19 17:53:27.764891	2016-12-19 17:53:27.764891	487	1.0	1374.0
1629	5	1	543	2016-12-19 17:53:47.311997	2016-12-19 17:53:47.311997	487	1.0	65150.0
1630	5	1	617	2016-12-19 17:54:43.526451	2016-12-19 17:54:43.526451	487	2.0	6852.0
1631	5	1	640	2016-12-19 17:55:05.103286	2016-12-19 17:55:05.103286	487	1.0	3064.0
1633	5	1	644	2016-12-19 17:56:06.735735	2016-12-19 17:56:06.735735	487	1.0	1527.0
1634	5	1	743	2016-12-19 17:56:24.525931	2016-12-19 17:56:24.525931	487	1.0	2151.0
1635	5	1	762	2016-12-19 17:56:43.18076	2016-12-19 17:56:43.18076	487	3.0	786.0
1637	5	1	786	2016-12-19 17:57:34.023505	2016-12-19 17:57:34.023505	487	1.0	3287.0
1638	5	1	804	2016-12-19 17:57:58.437157	2016-12-19 17:57:58.437157	487	1.0	44080.0
1639	5	1	849	2016-12-19 17:58:22.24579	2016-12-19 17:58:22.24579	487	1.0	957.0
1640	5	1	854	2016-12-19 17:59:48.809613	2016-12-19 17:59:48.809613	487	3.0	2859.0
1641	5	1	869	2016-12-19 18:00:10.042528	2016-12-19 18:00:10.042528	487	1.0	162524.0
1642	5	1	894	2016-12-19 18:00:30.375862	2016-12-19 18:00:30.375862	487	10.0	13970.0
1643	5	1	901	2016-12-19 18:00:48.844682	2016-12-19 18:00:48.844682	487	1.0	204.0
1636	5	1	779	2016-12-19 17:57:00.834369	2016-12-19 18:10:39.806664	487	2.0	5420.0
1666	5	1	520	2016-12-19 18:24:07.162643	2016-12-19 18:24:07.162643	517	1.0	1374.0
1644	5	1	927	2016-12-19 18:01:32.801594	2016-12-19 18:01:32.801594	487	1.0	2942.0
1645	5	1	928	2016-12-19 18:02:01.25211	2016-12-19 18:02:01.25211	487	1.0	2375.0
1649	5	1	975	2016-12-19 18:06:38.942845	2016-12-19 18:06:38.942845	487	1.0	46529.0
1652	5	1	1451	2016-12-19 18:09:07.306183	2016-12-19 18:09:07.306183	487	1.0	3745.0
1653	5	1	780	2016-12-19 18:11:47.479092	2016-12-19 18:11:47.479092	487	1.0	1471.0
1656	5	1	1539	2016-12-19 18:14:20.849429	2016-12-19 18:14:20.849429	487	1.0	56.0
1659	5	1	1542	2016-12-19 18:16:46.416658	2016-12-19 18:16:46.416658	487	2.0	700.0
1662	5	1	1546	2016-12-19 18:19:22.694783	2016-12-19 18:19:22.694783	487	\N	0.0
1665	5	1	382	2016-12-19 18:23:47.439105	2016-12-19 18:23:47.439105	517	2.0	162.0
1675	5	1	901	2016-12-19 18:31:12.872021	2016-12-19 18:31:12.872021	517	1.0	204.0
1680	5	1	966	2016-12-19 18:33:00.302834	2016-12-19 18:33:00.302834	517	1.0	138.0
1670	5	1	643	2016-12-19 18:25:50.593159	2016-12-19 18:34:15.332017	517	2.0	3652.0
1683	5	1	780	2016-12-19 18:34:50.831919	2016-12-19 18:34:50.831919	517	1.0	1471.0
1688	5	1	1542	2016-12-19 18:36:13.976014	2016-12-19 18:36:13.976014	517	2.0	700.0
1695	5	1	1560	2016-12-19 18:58:16.186144	2016-12-19 18:58:16.186144	157	0.2	9000.0
1697	5	1	1556	2016-12-19 18:59:56.411854	2016-12-19 18:59:56.411854	7	0.2	23447.4
1699	5	1	1551	2016-12-19 19:02:08.664945	2016-12-19 19:02:08.664945	187	0.2	53040.0
1701	5	1	1547	2016-12-19 19:05:16.86659	2016-12-19 19:05:16.86659	217	2.0	454.0
1709	5	1	543	2016-12-20 14:25:20.334825	2016-12-20 14:25:20.334825	457	1.0	65150.0
1716	5	1	644	2016-12-20 14:36:43.084846	2016-12-20 14:36:43.084846	457	5.0	7635.0
1723	5	1	779	2016-12-20 14:40:44.669514	2016-12-20 14:40:44.669514	457	1.0	2710.0
1727	5	1	1554	2016-12-20 14:46:10.025482	2016-12-20 14:46:10.025482	457	1.0	171680.0
1732	5	1	933	2016-12-20 14:49:07.623527	2016-12-20 14:49:07.623527	457	1.0	80000.0
1737	5	1	972	2016-12-20 14:52:18.484899	2016-12-20 14:52:18.484899	457	10.0	2790.0
1742	5	1	1039	2016-12-20 14:56:03.907975	2016-12-20 14:56:03.907975	457	1.0	158.0
1747	5	1	1238	2016-12-20 15:01:07.701909	2016-12-20 15:01:07.701909	457	1.0	2021.0
1715	5	1	643	2016-12-20 14:36:23.869162	2016-12-20 15:08:59.322586	457	6.0	10956.0
1751	5	1	1537	2016-12-20 15:11:08.361788	2016-12-20 15:11:08.361788	457	\N	0.0
1646	5	1	956	2016-12-19 18:03:54.162295	2016-12-19 18:03:54.162295	487	2.0	103042.0
1647	5	1	966	2016-12-19 18:05:09.445366	2016-12-19 18:05:09.445366	487	2.0	276.0
1650	5	1	1000	2016-12-19 18:07:37.208415	2016-12-19 18:07:37.208415	487	2.0	984.0
1632	5	1	643	2016-12-19 17:55:41.060232	2016-12-19 18:09:56.159193	487	2.0	3652.0
1654	5	1	1537	2016-12-19 18:12:44.341988	2016-12-19 18:12:44.341988	487	\N	0.0
1657	5	1	1540	2016-12-19 18:15:04.201378	2016-12-19 18:15:04.201378	487	2.0	75.0
1660	5	1	1543	2016-12-19 18:17:38.772436	2016-12-19 18:17:38.772436	487	1.0	796.0
1663	5	1	1545	2016-12-19 18:20:18.172351	2016-12-19 18:20:18.172351	487	\N	0.0
1664	5	1	367	2016-12-19 18:23:16.858879	2016-12-19 18:23:16.858879	517	1.0	11655.0
1669	5	1	640	2016-12-19 18:25:29.079737	2016-12-19 18:25:29.079737	517	1.0	3064.0
1674	5	1	894	2016-12-19 18:30:48.963534	2016-12-19 18:30:48.963534	517	3.0	4191.0
1679	5	1	955	2016-12-19 18:32:36.506288	2016-12-19 18:32:36.506288	517	1.0	78845.0
1687	5	1	1541	2016-12-19 18:35:49.915284	2016-12-19 18:35:49.915284	517	1.0	458.0
1692	5	1	1546	2016-12-19 18:37:14.903059	2016-12-19 18:37:14.903059	517	\N	0.0
1694	5	1	1557	2016-12-19 18:57:43.851546	2016-12-19 18:57:43.851546	157	0.2	3900.0
1696	5	1	1555	2016-12-19 18:59:25.226368	2016-12-19 18:59:25.226368	7	0.2	8160.0
1704	5	1	375	2016-12-20 14:18:36.379211	2016-12-20 14:18:36.379211	457	1.0	8353.0
1708	5	1	1550	2016-12-20 14:23:18.867862	2016-12-20 14:23:18.867862	457	2.0	16800.0
1714	5	1	641	2016-12-20 14:33:43.073938	2016-12-20 14:33:43.073938	457	3.0	3972.0
1721	5	1	780	2016-12-20 14:39:18.211882	2016-12-20 14:39:18.211882	457	2.0	2942.0
1730	5	1	901	2016-12-20 14:47:58.637521	2016-12-20 14:47:58.637521	457	3.0	612.0
1735	5	1	967	2016-12-20 14:51:11.414053	2016-12-20 14:51:11.414053	457	2.0	2280.0
1739	5	1	974	2016-12-20 14:52:59.932532	2016-12-20 14:52:59.932532	457	1.0	647.0
1744	5	1	1102	2016-12-20 14:57:04.463527	2016-12-20 14:57:04.463527	457	1.0	1534.0
1748	5	1	1260	2016-12-20 15:01:30.56219	2016-12-20 15:01:30.56219	457	1.0	1065.0
1754	5	1	1540	2016-12-20 15:12:13.024006	2016-12-20 15:12:13.024006	457	2.0	75.0
1648	5	1	971	2016-12-19 18:05:52.39083	2016-12-19 18:05:52.39083	487	2.0	806.0
1651	5	1	1002	2016-12-19 18:08:21.957613	2016-12-19 18:08:21.957613	487	1.0	5795.0
1655	5	1	1538	2016-12-19 18:13:26.789758	2016-12-19 18:13:26.789758	487	\N	0.0
1658	5	1	1541	2016-12-19 18:15:59.861179	2016-12-19 18:15:59.861179	487	1.0	458.0
1661	5	1	1544	2016-12-19 18:18:23.926781	2016-12-19 18:18:23.926781	487	\N	0.0
1668	5	1	565	2016-12-19 18:25:02.827927	2016-12-19 18:25:02.827927	517	1.0	97647.0
1673	5	1	854	2016-12-19 18:29:19.806696	2016-12-19 18:29:19.806696	517	1.0	953.0
1678	5	1	930	2016-12-19 18:32:20.086611	2016-12-19 18:32:20.086611	517	1.0	41616.0
1686	5	1	1540	2016-12-19 18:35:29.956757	2016-12-19 18:35:29.956757	517	2.0	75.0
1691	5	1	1545	2016-12-19 18:37:00.06358	2016-12-19 18:37:00.06358	517	\N	0.0
1693	5	1	1556	2016-12-19 18:57:12.271691	2016-12-19 18:57:12.271691	157	0.2	23447.4
1702	5	1	364	2016-12-20 14:17:40.993279	2016-12-20 14:17:40.993279	457	1.0	342.0
1706	5	1	504	2016-12-20 14:21:55.516856	2016-12-20 14:21:55.516856	457	1.0	916.0
1711	5	1	565	2016-12-20 14:28:55.10803	2016-12-20 14:28:55.10803	457	1.0	97647.0
1718	5	1	721	2016-12-20 14:37:32.397867	2016-12-20 14:37:32.397867	457	2.0	596.0
1719	5	1	743	2016-12-20 14:38:09.876151	2016-12-20 14:38:09.876151	457	1.0	2151.0
1724	5	1	804	2016-12-20 14:41:31.902682	2016-12-20 14:41:31.902682	457	1.0	44080.0
1728	5	1	873	2016-12-20 14:47:07.648364	2016-12-20 14:47:07.648364	457	1.0	208800.0
1733	5	1	1564	2016-12-20 14:50:28.29181	2016-12-20 14:50:28.29181	457	1.0	45000.0
1738	5	1	973	2016-12-20 14:52:39.430622	2016-12-20 14:52:39.430622	457	10.0	2660.0
1743	5	1	1097	2016-12-20 14:56:43.915648	2016-12-20 14:56:43.915648	457	1.0	4675.0
1749	5	1	1451	2016-12-20 15:04:15.009549	2016-12-20 15:04:15.009549	457	4.0	14980.0
1752	5	1	1538	2016-12-20 15:11:39.530305	2016-12-20 15:11:39.530305	457	\N	0.0
1667	5	1	550	2016-12-19 18:24:33.096228	2016-12-19 18:24:33.096228	517	1.0	64505.0
1677	5	1	928	2016-12-19 18:31:50.84079	2016-12-19 18:31:50.84079	517	1.0	2375.0
1682	5	1	1000	2016-12-19 18:33:39.149406	2016-12-19 18:33:39.149406	517	1.0	492.0
1672	5	1	779	2016-12-19 18:27:43.419444	2016-12-19 18:34:35.240264	517	3.0	8130.0
1685	5	1	1539	2016-12-19 18:35:16.179152	2016-12-19 18:35:16.179152	517	1.0	56.0
1690	5	1	1544	2016-12-19 18:36:46.159971	2016-12-19 18:36:46.159971	517	\N	0.0
1705	5	1	505	2016-12-20 14:21:31.153581	2016-12-20 14:21:31.153581	457	1.0	855.0
1710	5	1	553	2016-12-20 14:26:01.324019	2016-12-20 14:26:01.324019	457	1.0	64505.0
1717	5	1	715	2016-12-20 14:37:04.185073	2016-12-20 14:37:04.185073	457	1.0	7800.0
1722	5	1	783	2016-12-20 14:39:54.720033	2016-12-20 14:39:54.720033	457	1.0	15696.0
1726	5	1	1553	2016-12-20 14:45:27.078486	2016-12-20 14:45:27.078486	457	1.0	190240.0
1731	5	1	923	2016-12-20 14:48:28.042592	2016-12-20 14:48:28.042592	457	1.0	2359.0
1736	5	1	971	2016-12-20 14:51:54.179114	2016-12-20 14:51:54.179114	457	20.0	8060.0
1741	5	1	1000	2016-12-20 14:54:08.210434	2016-12-20 14:54:08.210434	457	3.0	1476.0
1745	5	1	1548	2016-12-20 14:58:44.639768	2016-12-20 14:58:44.639768	457	1.0	16380.0
1753	5	1	1539	2016-12-20 15:11:58.386337	2016-12-20 15:11:58.386337	457	1.0	56.0
1671	5	1	762	2016-12-19 18:26:07.711576	2016-12-19 18:26:07.711576	517	3.0	786.0
1676	5	1	927	2016-12-19 18:31:33.697958	2016-12-19 18:31:33.697958	517	1.0	2942.0
1681	5	1	971	2016-12-19 18:33:23.087663	2016-12-19 18:33:23.087663	517	2.0	806.0
1684	5	1	1537	2016-12-19 18:35:02.054977	2016-12-19 18:35:02.054977	517	\N	0.0
1689	5	1	1543	2016-12-19 18:36:31.468748	2016-12-19 18:36:31.468748	517	1.0	796.0
1698	5	1	1557	2016-12-19 19:00:21.443245	2016-12-19 19:00:21.443245	7	0.2	3900.0
1700	5	1	1557	2016-12-19 19:02:35.4108	2016-12-19 19:02:35.4108	187	0.2	3900.0
1703	5	1	367	2016-12-20 14:18:05.431728	2016-12-20 14:18:05.431728	457	1.0	11655.0
1707	5	1	520	2016-12-20 14:22:19.913624	2016-12-20 14:22:19.913624	457	1.0	1374.0
1712	5	1	616	2016-12-20 14:32:21.953976	2016-12-20 14:32:21.953976	457	2.0	2242.0
1713	5	1	640	2016-12-20 14:33:27.771414	2016-12-20 14:33:27.771414	457	10.0	30640.0
1720	5	1	762	2016-12-20 14:38:35.276089	2016-12-20 14:38:35.276089	457	3.0	786.0
1725	5	1	847	2016-12-20 14:42:13.168144	2016-12-20 14:42:13.168144	457	10.0	9570.0
1729	5	1	894	2016-12-20 14:47:27.827699	2016-12-20 14:47:27.827699	457	10.0	13970.0
1734	5	1	955	2016-12-20 14:50:46.087822	2016-12-20 14:50:46.087822	457	3.0	236535.0
1740	5	1	975	2016-12-20 14:53:36.324001	2016-12-20 14:53:36.324001	457	1.0	46529.0
1746	5	1	1175	2016-12-20 15:00:24.150805	2016-12-20 15:00:24.150805	457	1.0	248.0
1750	5	1	784	2016-12-20 15:09:52.232359	2016-12-20 15:09:52.232359	457	1.0	2305.0
1755	5	1	1541	2016-12-20 15:12:29.102333	2016-12-20 15:12:29.102333	457	1.0	458.0
1756	5	1	1542	2016-12-20 15:12:42.906956	2016-12-20 15:12:42.906956	457	2.0	700.0
1757	5	1	1543	2016-12-20 15:13:08.599506	2016-12-20 15:13:08.599506	457	1.0	796.0
1758	5	1	1544	2016-12-20 15:13:23.60464	2016-12-20 15:13:23.60464	457	\N	0.0
1759	5	1	1545	2016-12-20 15:13:35.255164	2016-12-20 15:13:35.255164	457	\N	0.0
1760	5	1	1546	2016-12-20 15:13:48.071044	2016-12-20 15:13:48.071044	457	\N	0.0
1761	5	1	367	2016-12-20 15:15:39.112053	2016-12-20 15:15:39.112053	547	1.0	11655.0
1762	5	1	520	2016-12-20 15:16:01.628612	2016-12-20 15:16:01.628612	547	1.0	1374.0
1763	5	1	640	2016-12-20 15:17:02.983112	2016-12-20 15:17:02.983112	547	1.0	3064.0
1765	5	1	762	2016-12-20 15:17:38.574056	2016-12-20 15:17:38.574056	547	3.0	786.0
1767	5	1	786	2016-12-20 15:18:36.662254	2016-12-20 15:18:36.662254	547	1.0	3287.0
1768	5	1	854	2016-12-20 15:19:15.746056	2016-12-20 15:19:15.746056	547	2.0	1906.0
1769	5	1	1554	2016-12-20 15:20:04.330319	2016-12-20 15:20:04.330319	547	1.0	171680.0
1770	5	1	894	2016-12-20 15:20:52.902698	2016-12-20 15:20:52.902698	547	10.0	13970.0
1771	5	1	901	2016-12-20 15:21:07.043825	2016-12-20 15:21:07.043825	547	1.0	204.0
1772	5	1	928	2016-12-20 15:21:38.088836	2016-12-20 15:21:38.088836	547	1.0	2375.0
1773	5	1	930	2016-12-20 15:22:03.492647	2016-12-20 15:22:03.492647	547	1.0	41616.0
1774	5	1	955	2016-12-20 15:22:23.744935	2016-12-20 15:22:23.744935	547	1.0	78845.0
1775	5	1	971	2016-12-20 15:23:55.962761	2016-12-20 15:23:55.962761	547	2.0	806.0
1776	5	1	1000	2016-12-20 15:24:11.683087	2016-12-20 15:24:11.683087	547	1.0	492.0
1764	5	1	643	2016-12-20 15:17:20.607078	2016-12-20 15:24:39.929572	547	2.0	3652.0
1766	5	1	779	2016-12-20 15:18:02.608275	2016-12-20 15:25:01.899719	547	2.0	5420.0
1777	5	1	1537	2016-12-20 15:25:17.879394	2016-12-20 15:25:17.879394	547	\N	0.0
1778	5	1	1538	2016-12-20 15:25:36.90741	2016-12-20 15:25:36.90741	547	\N	0.0
1779	5	1	1539	2016-12-20 15:25:52.056324	2016-12-20 15:25:52.056324	547	1.0	56.0
1780	5	1	1540	2016-12-20 15:26:07.546801	2016-12-20 15:26:07.546801	547	2.0	75.0
1781	5	1	1541	2016-12-20 15:26:22.083539	2016-12-20 15:26:22.083539	547	1.0	458.0
1782	5	1	1542	2016-12-20 15:26:34.717533	2016-12-20 15:26:34.717533	547	2.0	700.0
1783	5	1	1543	2016-12-20 15:27:07.340483	2016-12-20 15:27:07.340483	547	1.0	796.0
1784	5	1	1544	2016-12-20 15:27:20.503835	2016-12-20 15:27:20.503835	547	\N	0.0
1785	5	1	1545	2016-12-20 15:27:35.697243	2016-12-20 15:27:35.697243	547	\N	0.0
1786	5	1	1546	2016-12-20 15:27:49.906545	2016-12-20 15:27:49.906545	547	\N	0.0
1787	5	1	362	2016-12-20 15:35:43.501063	2016-12-20 15:35:43.501063	727	1.0	26815.0
1788	5	1	1556	2016-12-20 15:35:59.678071	2016-12-20 15:35:59.678071	277	0.2	23447.4
1789	5	1	364	2016-12-20 15:36:03.317422	2016-12-20 15:36:03.317422	727	1.0	342.0
1790	5	1	367	2016-12-20 15:36:30.541809	2016-12-20 15:36:30.541809	727	3.0	34965.0
1791	5	1	376	2016-12-20 15:37:00.78938	2016-12-20 15:37:00.78938	727	1.0	6905.0
1792	5	1	382	2016-12-20 15:37:34.403744	2016-12-20 15:37:34.403744	727	2.0	162.0
1793	5	1	1564	2016-12-20 15:38:01.369926	2016-12-20 15:38:01.369926	277	0.2	9000.0
1794	5	1	434	2016-12-20 15:39:23.933532	2016-12-20 15:39:23.933532	727	2.0	816.0
1795	5	1	435	2016-12-20 15:39:49.22954	2016-12-20 15:39:49.22954	727	1.0	43787.0
1796	5	1	491	2016-12-20 15:41:03.071628	2016-12-20 15:41:03.071628	727	1.0	687.0
1797	5	1	1551	2016-12-20 15:41:16.875423	2016-12-20 15:41:16.875423	307	0.2	53040.0
1798	5	1	501	2016-12-20 15:41:36.689948	2016-12-20 15:41:36.689948	727	2.0	61816.0
1799	5	1	1555	2016-12-20 15:41:49.11658	2016-12-20 15:41:49.11658	307	0.2	8160.0
1800	5	1	504	2016-12-20 15:42:00.176534	2016-12-20 15:42:00.176534	727	2.0	1832.0
1801	5	1	520	2016-12-20 15:42:58.259317	2016-12-20 15:42:58.259317	727	2.0	2748.0
1802	5	1	1550	2016-12-20 15:43:37.354019	2016-12-20 15:43:37.354019	727	2.0	16800.0
1803	5	1	535	2016-12-20 15:44:11.414193	2016-12-20 15:44:11.414193	727	2.0	53110.0
1804	5	1	536	2016-12-20 15:44:33.50737	2016-12-20 15:44:33.50737	727	12.0	24336.0
1805	5	1	550	2016-12-20 15:46:26.654556	2016-12-20 15:46:26.654556	727	1.0	64505.0
1806	5	1	553	2016-12-20 15:46:58.172365	2016-12-20 15:46:58.172365	727	1.0	64505.0
1807	5	1	565	2016-12-20 15:47:26.466974	2016-12-20 15:47:53.314553	727	2.0	195294.0
1808	5	1	567	2016-12-20 15:48:14.999966	2016-12-20 15:48:14.999966	727	1.0	64505.0
1809	5	1	605	2016-12-20 15:50:24.458959	2016-12-20 15:50:24.458959	727	1.0	34300.0
1810	5	1	623	2016-12-20 15:52:01.614835	2016-12-20 15:52:01.614835	727	2.0	17356.0
1811	5	1	640	2016-12-20 15:52:23.313479	2016-12-20 15:52:23.313479	727	6.0	18384.0
1813	5	1	644	2016-12-20 15:54:12.853529	2016-12-20 15:54:12.853529	727	3.0	4581.0
1814	5	1	715	2016-12-20 15:54:33.589592	2016-12-20 15:54:33.589592	727	1.0	7800.0
1815	5	1	718	2016-12-20 15:54:51.959743	2016-12-20 15:54:51.959743	727	1.0	178533.0
1816	5	1	721	2016-12-20 15:55:12.110224	2016-12-20 15:55:12.110224	727	2.0	596.0
1817	5	1	724	2016-12-20 15:56:15.422807	2016-12-20 15:56:15.422807	727	2.0	3366.0
1818	5	1	740	2016-12-20 15:56:37.584103	2016-12-20 15:56:37.584103	727	2.0	650.0
1819	5	1	762	2016-12-20 15:56:58.471315	2016-12-20 15:56:58.471315	727	6.0	1572.0
1820	5	1	767	2016-12-20 15:57:19.972983	2016-12-20 15:57:19.972983	727	1.0	24000000.0
1821	5	1	772	2016-12-20 15:58:51.186651	2016-12-20 15:58:51.186651	727	2.0	790.0
1822	5	1	780	2016-12-20 15:59:52.403339	2016-12-20 15:59:52.403339	727	7.0	10297.0
1823	5	1	783	2016-12-20 16:00:17.308114	2016-12-20 16:00:17.308114	727	2.0	31392.0
1825	5	1	801	2016-12-20 16:01:18.994035	2016-12-20 16:01:18.994035	727	1.0	545131.0
1826	5	1	1549	2016-12-20 16:01:24.483495	2016-12-20 16:01:24.483495	337	1.0	2100000.0
1827	5	1	803	2016-12-20 16:01:43.92589	2016-12-20 16:01:43.92589	727	1.0	5500000.0
1828	5	1	804	2016-12-20 16:02:14.231556	2016-12-20 16:02:14.231556	727	2.0	88160.0
1829	5	1	1553	2016-12-20 16:02:22.735482	2016-12-20 16:02:54.4375	337	0.2	38048.0
1830	5	1	810	2016-12-20 16:04:28.067636	2016-12-20 16:04:28.067636	727	1.0	2681.0
1831	5	1	1554	2016-12-20 16:04:38.009411	2016-12-20 16:04:38.009411	337	0.2	34336.0
1832	5	1	845	2016-12-20 16:05:12.063299	2016-12-20 16:05:12.063299	727	2.0	824.0
1837	5	1	857	2016-12-20 16:07:09.535871	2016-12-20 16:07:09.535871	727	3.0	570720.0
1824	5	1	779	2016-12-20 16:00:46.599514	2016-12-20 16:51:35.234627	727	2.0	5420.0
1834	5	1	1558	2016-12-20 16:05:34.284229	2016-12-20 16:05:34.284229	337	1.0	2100000.0
1836	5	1	1559	2016-12-20 16:06:39.192707	2016-12-20 16:06:39.192707	337	0.2	209208.0
1840	5	1	873	2016-12-20 16:11:38.312424	2016-12-20 16:11:38.312424	727	1.0	208800.0
1841	5	1	1563	2016-12-20 16:13:50.975074	2016-12-20 16:13:50.975074	727	1.0	1624000.0
1847	5	1	940	2016-12-20 16:16:30.426599	2016-12-20 16:16:30.426599	727	2.0	77066.0
1853	5	1	971	2016-12-20 16:21:39.173237	2016-12-20 16:21:39.173237	727	31.0	12493.0
1855	5	1	973	2016-12-20 16:24:19.536363	2016-12-20 16:24:19.536363	727	28.0	7448.0
1860	5	1	1547	2016-12-20 16:32:40.298246	2016-12-20 16:32:40.298246	697	2.0	454.0
1864	5	1	1052	2016-12-20 16:34:01.367103	2016-12-20 16:34:01.367103	727	2.0	1960000.0
1869	5	1	1124	2016-12-20 16:35:59.987852	2016-12-20 16:35:59.987852	727	1.0	2300.0
1873	5	1	1175	2016-12-20 16:41:30.883705	2016-12-20 16:41:30.883705	727	2.0	496.0
1882	5	1	1441	2016-12-20 16:48:22.184522	2016-12-20 16:48:22.184522	727	2.0	29400.0
1887	5	1	1518	2016-12-20 16:50:28.682049	2016-12-20 16:50:28.682049	727	1.0	4183.0
1891	5	1	1539	2016-12-20 16:52:24.03581	2016-12-20 16:52:24.03581	727	1.0	56.0
1895	5	1	1544	2016-12-20 16:53:52.872634	2016-12-20 16:53:52.872634	727	\N	0.0
1902	5	1	535	2016-12-20 16:59:56.383976	2016-12-20 16:59:56.383976	667	1.0	26555.0
1906	5	1	605	2016-12-20 17:04:28.324581	2016-12-20 17:04:28.324581	667	1.0	34300.0
1911	5	1	740	2016-12-20 17:08:04.675797	2016-12-20 17:08:04.675797	667	2.0	650.0
1915	5	1	804	2016-12-20 17:11:24.123049	2016-12-20 17:11:24.123049	667	1.0	44080.0
1920	5	1	855	2016-12-20 17:14:05.804823	2016-12-20 17:14:05.804823	667	10.0	7700.0
1924	5	1	903	2016-12-20 17:16:32.095574	2016-12-20 17:16:32.095574	667	1.0	144.0
1929	5	1	973	2016-12-20 17:22:08.399597	2016-12-20 17:22:08.399597	667	10.0	2660.0
1934	5	1	1032	2016-12-20 17:23:51.437286	2016-12-20 17:23:51.437286	667	1.0	2129.0
1939	5	1	1175	2016-12-20 17:25:59.476433	2016-12-20 17:25:59.476433	667	1.0	248.0
1944	5	1	1531	2016-12-20 17:28:55.580428	2016-12-20 17:28:55.580428	667	2.0	23138.0
1949	5	1	1539	2016-12-20 17:31:00.617662	2016-12-20 17:31:00.617662	667	1.0	56.0
1956	5	1	1546	2016-12-20 17:32:42.068598	2016-12-20 17:32:42.068598	667	\N	0.0
1958	5	1	382	2016-12-20 17:35:37.347585	2016-12-20 17:35:37.347585	637	1.0	81.0
1964	5	1	932	2016-12-20 17:38:59.717809	2016-12-20 17:38:59.717809	637	1.0	77037.0
1965	5	1	971	2016-12-20 17:39:51.879042	2016-12-20 17:39:51.879042	637	2.0	806.0
1833	5	1	847	2016-12-20 16:05:34.060935	2016-12-20 16:06:07.301446	727	15.0	14355.0
1835	5	1	852	2016-12-20 16:06:29.416712	2016-12-20 16:06:29.416712	727	2.0	1754.0
1839	5	1	1554	2016-12-20 16:08:59.976139	2016-12-20 16:08:59.976139	727	1.0	171680.0
1845	5	1	903	2016-12-20 16:15:37.75291	2016-12-20 16:15:37.75291	727	1.0	144.0
1851	5	1	956	2016-12-20 16:20:20.289051	2016-12-20 16:20:20.289051	727	4.0	206084.0
1858	5	1	1003	2016-12-20 16:32:01.897539	2016-12-20 16:32:01.897539	727	1.0	26717.0
1867	5	1	1101	2016-12-20 16:35:06.67429	2016-12-20 16:35:06.67429	727	2.0	27714.0
1871	5	1	1169	2016-12-20 16:40:18.937304	2016-12-20 16:40:18.937304	727	1.0	5644.0
1876	5	1	1197	2016-12-20 16:43:03.509737	2016-12-20 16:43:03.509737	727	1.0	4220.0
1880	5	1	1260	2016-12-20 16:44:47.852298	2016-12-20 16:44:47.852298	727	1.0	1065.0
1885	5	1	1486	2016-12-20 16:49:43.324192	2016-12-20 16:49:43.324192	727	1.0	2831.0
1812	5	1	643	2016-12-20 15:53:27.902481	2016-12-20 16:51:18.628915	727	6.0	10956.0
1897	5	1	1546	2016-12-20 16:54:22.671206	2016-12-20 16:54:22.671206	727	\N	0.0
1899	5	1	501	2016-12-20 16:59:00.985568	2016-12-20 16:59:00.985568	667	1.0	30908.0
1904	5	1	543	2016-12-20 17:01:01.890424	2016-12-20 17:01:01.890424	667	1.0	65150.0
1908	5	1	641	2016-12-20 17:06:49.899243	2016-12-20 17:06:49.899243	667	1.0	1324.0
1912	5	1	762	2016-12-20 17:09:28.094812	2016-12-20 17:09:28.094812	667	3.0	786.0
1917	5	1	810	2016-12-20 17:11:55.996821	2016-12-20 17:11:55.996821	667	1.0	2681.0
1922	5	1	894	2016-12-20 17:15:36.361295	2016-12-20 17:15:54.117454	667	36.0	50292.0
1926	5	1	954	2016-12-20 17:20:01.846109	2016-12-20 17:20:01.846109	667	2.0	205366.0
1931	5	1	975	2016-12-20 17:22:53.228009	2016-12-20 17:22:53.228009	667	1.0	46529.0
1936	5	1	1097	2016-12-20 17:24:29.048768	2016-12-20 17:24:29.048768	667	1.0	4675.0
1941	5	1	1197	2016-12-20 17:26:47.546362	2016-12-20 17:26:47.546362	667	3.0	12660.0
1946	5	1	779	2016-12-20 17:29:39.118539	2016-12-20 17:29:39.118539	667	1.0	2710.0
1952	5	1	1542	2016-12-20 17:31:44.885381	2016-12-20 17:31:44.885381	667	2.0	700.0
1960	5	1	644	2016-12-20 17:36:40.518426	2016-12-20 17:36:40.518426	637	1.0	1527.0
1961	5	1	762	2016-12-20 17:37:49.022215	2016-12-20 17:37:49.022215	637	3.0	786.0
1966	5	1	972	2016-12-20 17:40:13.198525	2016-12-20 17:40:13.198525	637	1.0	279.0
1838	5	1	1553	2016-12-20 16:07:58.313576	2016-12-20 16:07:58.313576	727	1.0	190240.0
1846	5	1	913	2016-12-20 16:15:57.62938	2016-12-20 16:15:57.62938	727	2.0	675584.0
1852	5	1	963	2016-12-20 16:21:03.49039	2016-12-20 16:21:03.49039	727	3.0	25200.0
1859	5	1	1010	2016-12-20 16:32:25.023979	2016-12-20 16:32:25.023979	727	2.0	3914.0
1868	5	1	1116	2016-12-20 16:35:28.481471	2016-12-20 16:35:28.481471	727	5.0	9835.0
1872	5	1	1548	2016-12-20 16:40:42.046899	2016-12-20 16:40:42.046899	727	2.0	32760.0
1877	5	1	1205	2016-12-20 16:43:31.096714	2016-12-20 16:43:31.096714	727	80.0	86560.0
1878	5	1	1238	2016-12-20 16:43:53.224883	2016-12-20 16:43:53.224883	727	1.0	2021.0
1863	5	1	1548	2016-12-20 16:33:34.141938	2016-12-20 16:44:12.528563	697	0.4	6552.0
1881	5	1	1439	2016-12-20 16:47:58.377956	2016-12-20 16:47:58.377956	727	3.0	44226.0
1886	5	1	1513	2016-12-20 16:50:12.9697	2016-12-20 16:50:12.9697	727	1.0	95566.0
1889	5	1	1537	2016-12-20 16:51:48.816474	2016-12-20 16:51:48.816474	727	\N	0.0
1893	5	1	1542	2016-12-20 16:53:20.193356	2016-12-20 16:53:20.193356	727	2.0	700.0
1900	5	1	504	2016-12-20 16:59:15.820962	2016-12-20 16:59:15.820962	667	2.0	1832.0
1909	5	1	721	2016-12-20 17:07:08.607078	2016-12-20 17:07:08.607078	667	2.0	596.0
1914	5	1	787	2016-12-20 17:10:40.491462	2016-12-20 17:10:40.491462	667	4.0	12308.0
1919	5	1	848	2016-12-20 17:12:44.480195	2016-12-20 17:12:44.480195	667	10.0	9410.0
1923	5	1	901	2016-12-20 17:16:16.308608	2016-12-20 17:16:16.308608	667	3.0	612.0
1928	5	1	972	2016-12-20 17:21:44.052755	2016-12-20 17:21:44.052755	667	10.0	2790.0
1933	5	1	1010	2016-12-20 17:23:29.452867	2016-12-20 17:23:29.452867	667	4.0	7828.0
1938	5	1	1169	2016-12-20 17:25:28.253469	2016-12-20 17:25:28.253469	667	1.0	5644.0
1943	5	1	1485	2016-12-20 17:28:32.92911	2016-12-20 17:28:32.92911	667	1.0	3484.0
1948	5	1	1538	2016-12-20 17:30:31.840564	2016-12-20 17:30:31.840564	667	\N	0.0
1954	5	1	1544	2016-12-20 17:32:10.429245	2016-12-20 17:32:10.429245	667	\N	0.0
1955	5	1	1545	2016-12-20 17:32:30.062019	2016-12-20 17:32:30.062019	667	\N	0.0
1957	5	1	367	2016-12-20 17:35:15.51912	2016-12-20 17:35:15.51912	637	1.0	11655.0
1963	5	1	901	2016-12-20 17:38:38.923309	2016-12-20 17:38:38.923309	637	1.0	204.0
1842	5	1	880	2016-12-20 16:14:26.990384	2016-12-20 16:14:26.990384	727	1.0	57177.0
1843	5	1	894	2016-12-20 16:14:47.925267	2016-12-20 16:14:47.925267	727	8.0	11176.0
1848	5	1	930	2016-12-20 16:17:43.01664	2016-12-20 16:17:43.01664	727	2.0	83232.0
1854	5	1	972	2016-12-20 16:22:02.064836	2016-12-20 16:22:02.064836	727	15.0	4185.0
1856	5	1	975	2016-12-20 16:31:01.676801	2016-12-20 16:31:01.676801	727	2.0	93058.0
1865	5	1	1096	2016-12-20 16:34:27.742315	2016-12-20 16:34:27.742315	727	1.0	11459.0
1870	5	1	1167	2016-12-20 16:38:35.488146	2016-12-20 16:38:52.674003	727	5.0	31190.0
1874	5	1	1179	2016-12-20 16:41:56.199951	2016-12-20 16:41:56.199951	727	1.0	33540.0
1883	5	1	1451	2016-12-20 16:48:56.002948	2016-12-20 16:48:56.002948	727	7.0	26215.0
1888	5	1	1524	2016-12-20 16:50:49.309327	2016-12-20 16:50:49.309327	727	1.0	2479.0
1892	5	1	1540	2016-12-20 16:52:40.014425	2016-12-20 16:52:40.014425	727	2.0	75.0
1896	5	1	1545	2016-12-20 16:54:07.245629	2016-12-20 16:54:07.245629	727	\N	0.0
1898	5	1	367	2016-12-20 16:58:15.445245	2016-12-20 16:58:15.445245	667	1.0	11655.0
1903	5	1	536	2016-12-20 17:00:24.928478	2016-12-20 17:00:24.928478	667	12.0	24336.0
1907	5	1	623	2016-12-20 17:06:26.784587	2016-12-20 17:06:26.784587	667	3.0	26034.0
1913	5	1	783	2016-12-20 17:10:10.904751	2016-12-20 17:10:10.904751	667	3.0	47088.0
1918	5	1	847	2016-12-20 17:12:25.911285	2016-12-20 17:12:25.911285	667	10.0	9570.0
1927	5	1	971	2016-12-20 17:21:19.440132	2016-12-20 17:21:19.440132	667	20.0	8060.0
1932	5	1	1000	2016-12-20 17:23:10.488303	2016-12-20 17:23:10.488303	667	3.0	1476.0
1937	5	1	1101	2016-12-20 17:24:44.88359	2016-12-20 17:24:44.88359	667	3.0	41571.0
1942	5	1	1237	2016-12-20 17:28:09.81509	2016-12-20 17:28:09.81509	667	1.0	1659.0
1947	5	1	1537	2016-12-20 17:30:15.963191	2016-12-20 17:30:15.963191	667	\N	0.0
1953	5	1	1543	2016-12-20 17:31:58.686963	2016-12-20 17:31:58.686963	667	1.0	796.0
1962	5	1	852	2016-12-20 17:38:04.745325	2016-12-20 17:38:04.745325	637	1.0	877.0
1844	5	1	901	2016-12-20 16:15:05.51057	2016-12-20 16:15:05.51057	727	7.0	1428.0
1849	5	1	954	2016-12-20 16:19:38.2416	2016-12-20 16:19:38.2416	727	1.0	102683.0
1850	5	1	955	2016-12-20 16:19:56.637346	2016-12-20 16:19:56.637346	727	7.0	551915.0
1857	5	1	1000	2016-12-20 16:31:24.132269	2016-12-20 16:31:24.132269	727	3.0	1476.0
1861	5	1	1032	2016-12-20 16:32:45.918201	2016-12-20 16:32:45.918201	727	4.0	8516.0
1862	5	1	1039	2016-12-20 16:33:31.667823	2016-12-20 16:33:31.667823	727	2.0	316.0
1866	5	1	1097	2016-12-20 16:34:45.231746	2016-12-20 16:34:45.231746	727	2.0	9350.0
1875	5	1	1187	2016-12-20 16:42:17.319651	2016-12-20 16:42:17.319651	727	3.0	73776.0
1879	5	1	1246	2016-12-20 16:44:23.186511	2016-12-20 16:44:23.186511	727	1.0	692.0
1884	5	1	1473	2016-12-20 16:49:15.52754	2016-12-20 16:49:15.52754	727	1.0	128197.0
1890	5	1	1538	2016-12-20 16:52:03.592254	2016-12-20 16:52:03.592254	727	\N	0.0
1894	5	1	1543	2016-12-20 16:53:40.146267	2016-12-20 16:53:40.146267	727	1.0	796.0
1901	5	1	534	2016-12-20 16:59:37.216835	2016-12-20 16:59:37.216835	667	3.0	25200.0
1905	5	1	565	2016-12-20 17:02:50.748088	2016-12-20 17:02:50.748088	667	1.0	97647.0
1910	5	1	724	2016-12-20 17:07:28.826744	2016-12-20 17:07:28.826744	667	1.0	1683.0
1916	5	1	805	2016-12-20 17:11:41.23046	2016-12-20 17:11:41.23046	667	1.0	3275.0
1921	5	1	1554	2016-12-20 17:14:52.686713	2016-12-20 17:14:52.686713	667	1.0	171680.0
1925	5	1	940	2016-12-20 17:19:43.626524	2016-12-20 17:19:43.626524	667	1.0	38533.0
1930	5	1	974	2016-12-20 17:22:31.372691	2016-12-20 17:22:31.372691	667	2.0	1294.0
1935	5	1	1039	2016-12-20 17:24:10.780436	2016-12-20 17:24:10.780436	667	1.0	158.0
1940	5	1	1179	2016-12-20 17:26:16.536903	2016-12-20 17:26:16.536903	667	1.0	33540.0
1945	5	1	643	2016-12-20 17:29:20.223215	2016-12-20 17:29:20.223215	667	1.0	1826.0
1950	5	1	1540	2016-12-20 17:31:15.037936	2016-12-20 17:31:15.037936	667	2.0	75.0
1951	5	1	1541	2016-12-20 17:31:30.182213	2016-12-20 17:31:30.182213	667	1.0	458.0
1959	5	1	520	2016-12-20 17:36:06.714818	2016-12-20 17:36:06.714818	637	1.0	1374.0
1967	5	1	1000	2016-12-20 17:41:14.081814	2016-12-20 17:41:14.081814	637	1.0	492.0
1968	5	1	643	2016-12-20 17:41:42.610759	2016-12-20 17:41:42.610759	637	1.0	1826.0
1969	5	1	1550	2016-12-20 17:42:00.472033	2016-12-20 17:42:00.472033	697	0.2	1680.0
1970	5	1	779	2016-12-20 17:42:11.46154	2016-12-20 17:42:11.46154	637	1.0	2710.0
1971	5	1	1537	2016-12-20 17:42:23.14617	2016-12-20 17:42:23.14617	637	\N	0.0
1972	5	1	1538	2016-12-20 17:42:43.85015	2016-12-20 17:42:43.85015	637	\N	0.0
1973	5	1	1539	2016-12-20 17:42:55.874895	2016-12-20 17:42:55.874895	637	1.0	56.0
1974	5	1	1540	2016-12-20 17:43:13.755585	2016-12-20 17:43:13.755585	637	2.0	75.0
1975	5	1	1541	2016-12-20 17:43:29.067353	2016-12-20 17:43:29.067353	637	1.0	458.0
1976	5	1	1542	2016-12-20 17:43:41.902566	2016-12-20 17:43:41.902566	637	2.0	700.0
1977	5	1	1543	2016-12-20 17:44:11.107809	2016-12-20 17:44:11.107809	637	1.0	796.0
1978	5	1	1544	2016-12-20 17:44:23.864995	2016-12-20 17:44:23.864995	637	\N	0.0
1979	5	1	1552	2016-12-20 17:44:29.463943	2016-12-20 17:44:29.463943	697	1.0	34300.0
1980	5	1	1545	2016-12-20 17:44:39.543648	2016-12-20 17:44:39.543648	637	\N	0.0
1981	5	1	1546	2016-12-20 17:45:07.88253	2016-12-20 17:45:07.88253	637	\N	0.0
1982	5	1	374	2016-12-20 17:49:05.972383	2016-12-20 17:49:05.972383	607	2.0	24402.0
1983	5	1	504	2016-12-20 17:49:23.404031	2016-12-20 17:49:23.404031	607	1.0	916.0
1984	5	1	520	2016-12-20 17:49:40.358231	2016-12-20 17:49:40.358231	607	1.0	1374.0
1985	5	1	643	2016-12-20 17:50:02.285848	2016-12-20 17:50:02.285848	607	2.0	3652.0
1986	5	1	762	2016-12-20 17:50:17.980282	2016-12-20 17:50:17.980282	607	5.0	1310.0
1987	5	1	784	2016-12-20 17:50:41.850257	2016-12-20 17:50:41.850257	607	1.0	2305.0
1988	5	1	847	2016-12-20 17:51:11.462433	2016-12-20 17:51:11.462433	607	2.0	1914.0
\.


--
-- Name: cost_by_resources_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('cost_by_resources_id_seq', 1989, true);


--
-- Data for Name: generators; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY generators (id, name, unity, created_at, updated_at, quantity) FROM stdin;
1	# de Productos	Unidad	2016-12-16 18:46:00.028945	2016-12-16 18:46:00.028945	\N
\.


--
-- Name: generators_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('generators_id_seq', 1, true);


--
-- Data for Name: human_usages; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY human_usages (id, registration_date, subresource_id, quantity, meter_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: human_usages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('human_usages_id_seq', 1, false);


--
-- Data for Name: indirect_activities; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY indirect_activities (id, name, created_at, updated_at, subprocedure_id, generator_id) FROM stdin;
1	Insumos (Cardiología)	2016-12-16 18:46:07.463521	2016-12-16 18:46:07.463521	1	\N
2	Agenda  (Cardiología)	2016-12-16 18:46:07.468756	2016-12-16 18:46:07.468756	1	\N
3	Matriz de riesgo  (Cardiología)	2016-12-16 18:46:07.473782	2016-12-16 18:46:07.473782	2	\N
4	Verificar condiciones del paciente mediante escalas de riesgos  (Cardiología)	2016-12-16 18:46:07.479394	2016-12-16 18:46:07.479394	6	\N
5	Entrega del resultado a " Entrega de resultados" (primer piso )  (Cardiología)	2016-12-16 18:46:07.484792	2016-12-16 18:46:07.484792	8	\N
6	Lista de chequeo (Cardiología)	2016-12-16 18:46:07.490202	2016-12-16 18:46:07.490202	9	\N
7	Comités (Cardiología)	2016-12-16 18:46:07.495092	2016-12-16 18:46:07.495092	9	\N
8	Entrega a facturación (Cardiología)	2016-12-16 18:46:07.499578	2016-12-16 18:46:07.499578	9	\N
9	Verificar Cumplimiento de insumos, dispositivos y equipos médicos durante la prestación del Servicio (Rehabilitación)	2016-12-16 18:46:07.503724	2016-12-16 18:46:07.503724	10	\N
10	Verificar Registros en los inventarios realizados (Diariamente)  (Rehabilitación)	2016-12-16 18:46:07.508376	2016-12-16 18:46:07.508376	10	\N
11	Registrar inventarios del servicio (Rehabilitación)	2016-12-16 18:46:07.512607	2016-12-16 18:46:07.512607	10	\N
12	Solicitar los insumos que se requieren para la oportunidad del servicio (Rehabilitación)	2016-12-16 18:46:07.517353	2016-12-16 18:46:07.517353	10	\N
13	Entrega a facturación (Rehabilitación)	2016-12-16 18:46:07.521637	2016-12-16 18:46:07.521637	10	\N
14	Realización y Verificación de cumplimiento de Matriz de Riesgo en el servicio (Rehabilitación)	2016-12-16 18:46:07.525993	2016-12-16 18:46:07.525993	11	\N
15	Verificar posibles riesgos en el paciente ( aplicación de escalas por protocolo, o riesgo de todo tipo sea asistencial o administrativo) (Rehabilitación)	2016-12-16 18:46:07.530661	2016-12-16 18:46:07.530661	11	\N
16	Asignación de Control (Rehabilitación)	2016-12-16 18:46:07.534588	2016-12-16 18:46:07.534588	12	\N
17	Tareas administrativas (Rehabilitación)	2016-12-16 18:46:07.539227	2016-12-16 18:46:07.539227	12	\N
18	Ingreso (Rehabilitación)	2016-12-16 18:46:07.543582	2016-12-16 18:46:07.543582	13	\N
19	Verificar condiciones del paciente mediante escalas de riesgos ( FISIO) (Rehabilitación)	2016-12-16 18:46:07.547701	2016-12-16 18:46:07.547701	14	\N
20	Verificación de aplicación de protocolos ( listas de chequeo) (Rehabilitación)	2016-12-16 18:46:07.551675	2016-12-16 18:46:07.551675	15	\N
21	Matriz de riesgo, en donde validan riesgos posibles en el servicio, planes de acción, ( se verifican con calidad ) se hace seguimiento constante a estos riesgos (Rehabilitación)	2016-12-16 18:46:07.555645	2016-12-16 18:46:07.555645	18	\N
22	Realización de Planes de acción, según oportunidades de mejora ( Rondas de seguridad, Auditorias de Calidad, Auditorias Interna) (Rehabilitación)	2016-12-16 18:46:07.559598	2016-12-16 18:46:07.559598	18	\N
23	Lista de chequeo (Rehabilitación)	2016-12-16 18:46:07.5636	2016-12-16 18:46:07.5636	19	\N
24	Comités (Rehabilitación)	2016-12-16 18:46:07.567637	2016-12-16 18:46:07.567637	20	\N
25	Reportes (Rehabilitación)	2016-12-16 18:46:07.571796	2016-12-16 18:46:07.571796	21	\N
26	Insumos y medicamentos (Urgencias)	2016-12-16 18:46:07.575661	2016-12-16 18:46:07.575661	22	\N
27	Entrega de turno (Urgencias)	2016-12-16 18:46:07.579649	2016-12-16 18:46:07.579649	22	\N
28	Guías médicas (Urgencias)	2016-12-16 18:46:07.583747	2016-12-16 18:46:07.583747	22	\N
29	Alistamiento de personal (Urgencias)	2016-12-16 18:46:07.587767	2016-12-16 18:46:07.587767	22	\N
30	Protocolos (Urgencias)	2016-12-16 18:46:07.591941	2016-12-16 18:46:07.591941	22	\N
31	Riesgo (Urgencias)	2016-12-16 18:46:07.597072	2016-12-16 18:46:07.597072	22	\N
32	Diligenciar registros (Urgencias)	2016-12-16 18:46:07.601411	2016-12-16 18:46:07.601411	23	\N
33	Recursos (Urgencias)	2016-12-16 18:46:07.606948	2016-12-16 18:46:07.606948	24	\N
34	Búsqueda activa de pacientes (Urgencias)	2016-12-16 18:46:07.610965	2016-12-16 18:46:07.610965	25	\N
35	Rondas de seguridad (Urgencias)	2016-12-16 18:46:07.614881	2016-12-16 18:46:07.614881	25	\N
36	Ejecución de planes de riesgo (Urgencias)	2016-12-16 18:46:07.618823	2016-12-16 18:46:07.618823	25	\N
37	Revaloración de estado ( Comités y seguimiento )  (Urgencias)	2016-12-16 18:46:07.623623	2016-12-16 18:46:07.623623	25	\N
38	Nómina ( Hospitalización)	2016-12-16 18:46:07.62765	2016-12-16 18:46:07.62765	26	\N
39	Entrega de turno ( Hospitalización)	2016-12-16 18:46:07.631845	2016-12-16 18:46:07.631845	26	\N
40	Cuadro de turno  ( Hospitalización)	2016-12-16 18:46:07.63581	2016-12-16 18:46:07.63581	26	\N
41	Registro Entrega de turno (Hospitalización)	2016-12-16 18:46:07.641621	2016-12-16 18:46:07.641621	26	\N
42	Matriz de riesgo (Hospitalización)	2016-12-16 18:46:07.64588	2016-12-16 18:46:07.64588	26	\N
43	Revisar los recursos (Hospitalización)	2016-12-16 18:46:07.650949	2016-12-16 18:46:07.650949	26	\N
44	Verificación de solicitud de insumos (Hospitalización)	2016-12-16 18:46:07.654872	2016-12-16 18:46:07.654872	26	\N
45	Solicitud de papelería (Hospitalización)	2016-12-16 18:46:07.659141	2016-12-16 18:46:07.659141	26	\N
46	Lista de chequeo (Hospitalización)	2016-12-16 18:46:07.664405	2016-12-16 18:46:07.664405	26	\N
47	Reunión de proceso (Hospitalización)	2016-12-16 18:46:07.66853	2016-12-16 18:46:07.66853	26	\N
48	Comité transfusional (Hospitalización)	2016-12-16 18:46:07.673835	2016-12-16 18:46:07.673835	26	\N
49	Inducción general de la institución (Hospitalización)	2016-12-16 18:46:07.677737	2016-12-16 18:46:07.677737	26	\N
50	Informe de gestión (Hospitalización)	2016-12-16 18:46:07.681794	2016-12-16 18:46:07.681794	26	\N
51	Comité de Referencia y contra referencia (Hospitalización)	2016-12-16 18:46:07.685672	2016-12-16 18:46:07.685672	26	\N
52	Comités de seguridad, tecno vigilancia, farmacovigilancia (Hospitalización)	2016-12-16 18:46:07.691646	2016-12-16 18:46:07.691646	26	\N
53	Comité de infecciones (Hospitalización)	2016-12-16 18:46:07.696048	2016-12-16 18:46:07.696048	26	\N
54	Cofyte (Hospitalización)	2016-12-16 18:46:07.702078	2016-12-16 18:46:07.702078	26	\N
55	Comité de Mortalidad (Hospitalización)	2016-12-16 18:46:07.706581	2016-12-16 18:46:07.706581	26	\N
56	PACAS (Hospitalización)	2016-12-16 18:46:07.713652	2016-12-16 18:46:07.713652	26	\N
57	Revisión reportes de nómina (Hospitalización)	2016-12-16 18:46:07.719121	2016-12-16 18:46:07.719121	26	\N
58	Evaluación de desempeño (Hospitalización)	2016-12-16 18:46:07.723282	2016-12-16 18:46:07.723282	26	\N
59	Entrega de turno medico (Hospitalización)	2016-12-16 18:46:07.727634	2016-12-16 18:46:07.727634	27	\N
60	Revista médica (cardióloga y médico general) (Hospitalización)	2016-12-16 18:46:07.732142	2016-12-16 18:46:07.732142	27	\N
61	Entrega de turno jefes (Hospitalización)	2016-12-16 18:46:07.736341	2016-12-16 18:46:07.736341	28	\N
62	Alistamiento de medicamentos (Preparación) (Hospitalización)	2016-12-16 18:46:07.742008	2016-12-16 18:46:07.742008	28	\N
63	Verificar las fechas de vencimiento de los medicamentos, seleccionar para rotación, registro (Hospitalización)	2016-12-16 18:46:07.746385	2016-12-16 18:46:07.746385	28	\N
64	Registros ( Notas de enfermería, registros en el sistema) (Hospitalización)	2016-12-16 18:46:07.751628	2016-12-16 18:46:07.751628	28	\N
65	Entrega de turno (Aux. Hospitalización)	2016-12-16 18:46:07.755911	2016-12-16 18:46:07.755911	29	\N
66	Preparación de medicamentos	2016-12-16 18:46:07.760563	2016-12-16 18:46:07.760563	29	\N
67	Registro de inventarios y temperaturas (Aux. Hospitalización)	2016-12-16 18:46:07.765586	2016-12-16 18:46:07.765586	29	\N
68	Realizar autorizaciones (Hospitalización Administrativos)	2016-12-16 18:46:07.769932	2016-12-16 18:46:07.769932	30	\N
69	Coordinar traslados (Hospitalización Administrativos)	2016-12-16 18:46:07.774223	2016-12-16 18:46:07.774223	30	\N
70	Contestar teléfonos (Hospitalización Administrativos)	2016-12-16 18:46:07.778445	2016-12-16 18:46:07.778445	30	\N
71	Censo diario (Hospitalización Administrativos)	2016-12-16 18:46:07.783093	2016-12-16 18:46:07.783093	30	\N
72	Registros (Hospitalización Administrativos)	2016-12-16 18:46:07.787315	2016-12-16 18:46:07.787315	30	\N
73	Reportes (Hospitalización Administrativos)	2016-12-16 18:46:07.791504	2016-12-16 18:46:07.791504	30	\N
74	Planear Actividades (UCI-UCIN)	2016-12-16 18:46:07.795693	2016-12-16 18:46:07.795693	31	\N
75	Reuniones (UCI-UCIN)	2016-12-16 18:46:07.800983	2016-12-16 18:46:07.800983	31	\N
76	Personal (UCI-UCIN)	2016-12-16 18:46:07.805101	2016-12-16 18:46:07.805101	31	\N
77	Riesgos (UCI-UCIN)	2016-12-16 18:46:07.809816	2016-12-16 18:46:07.809816	31	\N
78	Reporte de eventos (UCI-UCIN)	2016-12-16 18:46:07.81546	2016-12-16 18:46:07.81546	31	\N
79	Planes de riesgo (UCI-UCIN)	2016-12-16 18:46:07.82056	2016-12-16 18:46:07.82056	31	\N
80	Rondas de seguridad (UCI-UCIN)	2016-12-16 18:46:07.824685	2016-12-16 18:46:07.824685	31	\N
81	Efectividad de plan de riesgo (UCI-UCIN)	2016-12-16 18:46:07.829612	2016-12-16 18:46:07.829612	31	\N
82	Corrección de errores (UCI-UCIN)	2016-12-16 18:46:07.834081	2016-12-16 18:46:07.834081	31	\N
83	Planear Actividades (JEFES UCI-UCIN)	2016-12-16 18:46:07.838237	2016-12-16 18:46:07.838237	32	\N
84	Entrega de turno (JEFES UCI-UCIN)	2016-12-16 18:46:07.844668	2016-12-16 18:46:07.844668	32	\N
85	Reuniones (JEFES UCI-UCIN)	2016-12-16 18:46:07.84866	2016-12-16 18:46:07.84866	32	\N
86	Retiro de dispositivos médicos  (JEFES UCI-UCIN)	2016-12-16 18:46:07.852638	2016-12-16 18:46:07.852638	32	\N
87	Reunión del proceso (Fisioterapeuta UCI-UCIN)	2016-12-16 18:46:07.857617	2016-12-16 18:46:07.857617	35	\N
88	Censo diario de pacientes (Administrativo UCI-UCIN)	2016-12-16 18:46:07.861902	2016-12-16 18:46:07.861902	36	\N
89	Revisión y actualización de tableros  (Administrativo UCI-UCIN)	2016-12-16 18:46:07.866182	2016-12-16 18:46:07.866182	36	\N
90	Información de disponibilidad de camas (Administrativo UCI-UCIN)	2016-12-16 18:46:07.872192	2016-12-16 18:46:07.872192	36	\N
91	Ingreso pacientes censo ASU (Administrativo UCI-UCIN)	2016-12-16 18:46:07.876337	2016-12-16 18:46:07.876337	36	\N
92	Depurar foliar y revisar  historias clínicas físicas (Administrativo UCI-UCIN)	2016-12-16 18:46:07.880686	2016-12-16 18:46:07.880686	36	\N
93	Solicitud de camas piso  (Administrativo UCI-UCIN)	2016-12-16 18:46:07.884759	2016-12-16 18:46:07.884759	36	\N
94	Revisión  de disponibilidad de papelería (Administrativo UCI-UCIN)	2016-12-16 18:46:07.890239	2016-12-16 18:46:07.890239	36	\N
95	Alimentación de estadísticas (Administrativo UCI-UCIN)	2016-12-16 18:46:07.894381	2016-12-16 18:46:07.894381	36	\N
96	Traslado de documentos a otros departamentos  (Administrativo UCI-UCIN)	2016-12-16 18:46:07.898627	2016-12-16 18:46:07.898627	36	\N
97	Validación y autorización de estancias (Administrativo UCI-UCIN)	2016-12-16 18:46:07.903273	2016-12-16 18:46:07.903273	36	\N
98	Autorización de procedimientos  (Administrativo UCI-UCIN)	2016-12-16 18:46:07.907673	2016-12-16 18:46:07.907673	36	\N
99	Llamado e ingreso de familiares de pacientes (Administrativo UCI-UCIN)	2016-12-16 18:46:07.911963	2016-12-16 18:46:07.911963	36	\N
100	Realización de stikers  (Administrativo UCI-UCIN)	2016-12-16 18:46:07.916797	2016-12-16 18:46:07.916797	36	\N
101	Llamado y envió de ordenes medicas con patinador  (Administrativo UCI-UCIN)	2016-12-16 18:46:07.920992	2016-12-16 18:46:07.920992	36	\N
102	Revisar, surtir y verificar la papelería de las estaciones de enfermería  (Administrativo UCI-UCIN)	2016-12-16 18:46:07.926149	2016-12-16 18:46:07.926149	36	\N
103	Solicitud de insumos, papelería y suministros  (Administrativo UCI-UCIN)	2016-12-16 18:46:07.930589	2016-12-16 18:46:07.930589	36	\N
104	Registro y entrega de reservas de cama al jefe del servicio (Administrativo UCI-UCIN)	2016-12-16 18:46:07.934883	2016-12-16 18:46:07.934883	36	\N
105	Revisión de estancias en el sistema  (Administrativo UCI-UCIN)	2016-12-16 18:46:07.939035	2016-12-16 18:46:07.939035	36	\N
106	Recepción de llamadas (Administrativo UCI-UCIN)	2016-12-16 18:46:07.943244	2016-12-16 18:46:07.943244	36	\N
107	Entrega de encuestas de satisfacción  (Administrativo UCI-UCIN)	2016-12-16 18:46:07.947775	2016-12-16 18:46:07.947775	36	\N
108	Mesas de ayuda  (Administrativo UCI-UCIN)	2016-12-16 18:46:07.9519	2016-12-16 18:46:07.9519	36	\N
109	Realizar ronda telefónica a los servicios ( Angiografía preparación)	2016-12-16 18:46:07.956692	2016-12-16 18:46:07.956692	37	\N
110	Verificar el diligenciamiento del formato de chequeo diario ( Angiografía preparación)	2016-12-16 18:46:07.960806	2016-12-16 18:46:07.960806	37	\N
111	Verificar que se diligencie el registro diario de los formatos de temperatura y humedad ( Angiografía preparación)	2016-12-16 18:46:07.964718	2016-12-16 18:46:07.964718	37	\N
112	Verificar que se diligencie el registro diario de la verificación del desfibrilador ( Angiografía preparación)	2016-12-16 18:46:07.968671	2016-12-16 18:46:07.968671	37	\N
113	Verificar que en la mañana  y  tarde  la auxiliar de farmacia surta el carro de procedimiento  ( Angiografía preparación)	2016-12-16 18:46:07.972603	2016-12-16 18:46:07.972603	37	\N
114	Reportar eventos adversos ( Angiografía preparación)	2016-12-16 18:46:07.977277	2016-12-16 18:46:07.977277	37	\N
115	Supervisar el correcto manejo del sistema de recolección de desechos según protocolo ( Angiografía preparación)	2016-12-16 18:46:07.981751	2016-12-16 18:46:07.981751	37	\N
116	Verificar Stock ( Angiografía preparación)	2016-12-16 18:46:07.985721	2016-12-16 18:46:07.985721	37	\N
117	Solicitudes ( mesa de ayuda) ( Angiografía preparación)	2016-12-16 18:46:07.990296	2016-12-16 18:46:07.990296	37	\N
118	Verificar horarios ( Angiografía preparación)	2016-12-16 18:46:07.994469	2016-12-16 18:46:07.994469	37	\N
119	Informar al paciente ( demora del procedimiento) ( Angiografía preparación)	2016-12-16 18:46:07.999125	2016-12-16 18:46:07.999125	37	\N
120	Honorarios ( Angiografía preparación)	2016-12-16 18:46:08.004081	2016-12-16 18:46:08.004081	37	\N
121	Revisar honorarios ( Angiografía preparación)	2016-12-16 18:46:08.008463	2016-12-16 18:46:08.008463	37	\N
122	Estadísticas ( Angiografía preparación)	2016-12-16 18:46:08.012493	2016-12-16 18:46:08.012493	37	\N
123	Nomina ( Angiografía preparación)	2016-12-16 18:46:08.017639	2016-12-16 18:46:08.017639	37	\N
124	Informe de gestión ( Angiografía preparación)	2016-12-16 18:46:08.022244	2016-12-16 18:46:08.022244	37	\N
125	Cancelaciones ( Angiografía preparación)	2016-12-16 18:46:08.031096	2016-12-16 18:46:08.031096	37	\N
126	Cotizaciones ( Angiografía preparación)	2016-12-16 18:46:08.036384	2016-12-16 18:46:08.036384	37	\N
127	Ayuda a cirugía ( Angiografía preparación)	2016-12-16 18:46:08.04104	2016-12-16 18:46:08.04104	37	\N
128	Tareas administrativas ( Angiografía preparación consulta)	2016-12-16 18:46:08.049534	2016-12-16 18:46:08.049534	37	\N
129	Tareas administrativas ( Angiografía preparación procedimientos)	2016-12-16 18:46:08.054549	2016-12-16 18:46:08.054549	37	\N
130	Registros (Técnicos Angiografía)	2016-12-16 18:46:08.059832	2016-12-16 18:46:08.059832	38	\N
131	Temperatura (Técnicos Angiografía)	2016-12-16 18:46:08.064045	2016-12-16 18:46:08.064045	38	\N
132	Calibración (Técnicos Angiografía)	2016-12-16 18:46:08.068355	2016-12-16 18:46:08.068355	38	\N
133	Verificar y liberar espacio en el disco duro Angiografo (Técnicos Angiografía)	2016-12-16 18:46:08.072874	2016-12-16 18:46:08.072874	38	\N
134	Registros (Circulantes Angiografía)	2016-12-16 18:46:08.076677	2016-12-16 18:46:08.076677	39	\N
135	Hoja de gastos (Circulantes Angiografía)	2016-12-16 18:46:08.081218	2016-12-16 18:46:08.081218	39	\N
136	Carro de paro  (Recuperación Angiografía por auxiliar)	2016-12-16 18:46:08.085495	2016-12-16 18:46:08.085495	41	\N
137	Chequeo del carro del paro y desfibrilador  (Recuperación Angiografía por auxiliar)	2016-12-16 18:46:08.090064	2016-12-16 18:46:08.090064	41	\N
138	Protocolos (Imágenes Diagnosticas) 	2016-12-16 18:46:08.094586	2016-12-16 18:46:08.094586	42	\N
139	Insumos (Imágenes Diagnosticas) 	2016-12-16 18:46:08.098585	2016-12-16 18:46:08.098585	42	\N
140	Personal (Imágenes Diagnosticas) 	2016-12-16 18:46:08.102598	2016-12-16 18:46:08.102598	42	\N
141	Riesgos (Imágenes Diagnosticas) 	2016-12-16 18:46:08.108292	2016-12-16 18:46:08.108292	42	\N
142	Equipos ( T) (Imágenes Diagnosticas) 	2016-12-16 18:46:08.113027	2016-12-16 18:46:08.113027	42	\N
143	Empaque ( Imágenes Resonancia )  (Imágenes Diagnosticas) 	2016-12-16 18:46:08.117618	2016-12-16 18:46:08.117618	45	\N
144	Entrega de resultados ( Archivar y entregar ) (Imágenes Diagnosticas) 	2016-12-16 18:46:08.121927	2016-12-16 18:46:08.121927	45	\N
145	Traslado de paciente (Imágenes Diagnosticas) 	2016-12-16 18:46:08.125921	2016-12-16 18:46:08.125921	47	\N
146	Planeación de la atención (Resonancia)	2016-12-16 18:46:08.130611	2016-12-16 18:46:08.130611	48	\N
147	Identificación de riesgos del proceso (Resonancia)	2016-12-16 18:46:08.134888	2016-12-16 18:46:08.134888	48	\N
148	Informe (Resonancia)	2016-12-16 18:46:08.138713	2016-12-16 18:46:08.138713	48	\N
149	Equipos ( T) (Resonancia)	2016-12-16 18:46:08.142972	2016-12-16 18:46:08.142972	48	\N
150	Reunión (Resonancia)	2016-12-16 18:46:08.147109	2016-12-16 18:46:08.147109	48	\N
151	Verificar buen servicio (Resonancia)	2016-12-16 18:46:08.150766	2016-12-16 18:46:08.150766	48	\N
152	Lista de chequeo (Resonancia)	2016-12-16 18:46:08.154637	2016-12-16 18:46:08.154637	48	\N
153	Registros (Resonancia)	2016-12-16 18:46:08.158982	2016-12-16 18:46:08.158982	48	\N
154	Insumos (Resonancia)	2016-12-16 18:46:08.163932	2016-12-16 18:46:08.163932	48	\N
155	Entrega de imágenes a sala de lectura (Resonancia)	2016-12-16 18:46:08.16784	2016-12-16 18:46:08.16784	52	\N
156	Informes (Resonancia)	2016-12-16 18:46:08.171918	2016-12-16 18:46:08.171918	53	\N
157	Entrega documentos facturación (Resonancia)	2016-12-16 18:46:08.175827	2016-12-16 18:46:08.175827	54	\N
158	Recepción programación (Esterilización)	2016-12-16 18:46:08.179788	2016-12-16 18:46:08.179788	56	\N
159	Análisis (Esterilización)	2016-12-16 18:46:08.183722	2016-12-16 18:46:08.183722	56	\N
160	Realización de programación (Esterilización)	2016-12-16 18:46:08.18816	2016-12-16 18:46:08.18816	56	\N
161	Socialización de programación (Esterilización)	2016-12-16 18:46:08.19251	2016-12-16 18:46:08.19251	56	\N
162	Auditoria de inventarios (Esterilización)	2016-12-16 18:46:08.197608	2016-12-16 18:46:08.197608	57	\N
163	Análisis de información (Esterilización)	2016-12-16 18:46:08.201676	2016-12-16 18:46:08.201676	57	\N
164	Requerimiento (Esterilización)	2016-12-16 18:46:08.205741	2016-12-16 18:46:08.205741	57	\N
165	Recepción de insumos (Esterilización)	2016-12-16 18:46:08.210096	2016-12-16 18:46:08.210096	57	\N
166	Seguimiento (Esterilización)	2016-12-16 18:46:08.214117	2016-12-16 18:46:08.214117	57	\N
167	Realización de turnos (Esterilización)	2016-12-16 18:46:08.218125	2016-12-16 18:46:08.218125	58	\N
168	Programación diaria de roles (Esterilización)	2016-12-16 18:46:08.22207	2016-12-16 18:46:08.22207	58	\N
169	Verificación de tareas por cumplir (Esterilización)	2016-12-16 18:46:08.22634	2016-12-16 18:46:08.22634	58	\N
170	Recepción de ropa limpia (Esterilización)	2016-12-16 18:46:08.230416	2016-12-16 18:46:08.230416	59	\N
171	Clasificación ropas cirugía  angio (Esterilización)	2016-12-16 18:46:08.23444	2016-12-16 18:46:08.23444	59	\N
172	Doblado de prendas (Esterilización)	2016-12-16 18:46:08.238824	2016-12-16 18:46:08.238824	59	\N
173	Almacenamiento de prendas  (Esterilización)	2016-12-16 18:46:08.242855	2016-12-16 18:46:08.242855	59	\N
174	Recepción cirugía  (Esterilización)	2016-12-16 18:46:08.247073	2016-12-16 18:46:08.247073	60	\N
175	Recepción áreas asistenciales (Esterilización)	2016-12-16 18:46:08.251559	2016-12-16 18:46:08.251559	60	\N
176	Registros (Esterilización Instrumental)	2016-12-16 18:46:08.255964	2016-12-16 18:46:08.255964	60	\N
177	recepción esterilización (Esterilización Instrumental)	2016-12-16 18:46:08.259993	2016-12-16 18:46:08.259993	60	\N
178	Alistamiento de ropa para esterilización	2016-12-16 18:46:08.263854	2016-12-16 18:46:08.263854	63	\N
179	Elaboración de paquetes de ropa (Esterilización)	2016-12-16 18:46:08.268069	2016-12-16 18:46:08.268069	63	\N
180	Empaque ( y marcación ) (Esterilización)	2016-12-16 18:46:08.274409	2016-12-16 18:46:08.274409	63	\N
181	Preparación del Autoclave de vapor (Esterilización)	2016-12-16 18:46:08.280293	2016-12-16 18:46:08.280293	63	\N
182	Relacionar paquetes de ingreso al autoclave (Esterilización)	2016-12-16 18:46:08.284595	2016-12-16 18:46:08.284595	63	\N
183	Registro de temperatura (Esterilización)	2016-12-16 18:46:08.290234	2016-12-16 18:46:08.290234	63	\N
184	Test de Bowie Dick (Esterilización)	2016-12-16 18:46:08.29525	2016-12-16 18:46:08.29525	63	\N
185	Selección de sistema (Esterilización)	2016-12-16 18:46:08.300194	2016-12-16 18:46:08.300194	63	\N
186	Marcación de lote (Esterilización)	2016-12-16 18:46:08.304187	2016-12-16 18:46:08.304187	63	\N
187	Preparación de carga y relación de paquetes (Esterilización)	2016-12-16 18:46:08.309107	2016-12-16 18:46:08.309107	63	\N
188	Monitoreo (Esterilización)	2016-12-16 18:46:08.31327	2016-12-16 18:46:08.31327	63	\N
189	Selección de ciclo (Esterilización)	2016-12-16 18:46:08.31805	2016-12-16 18:46:08.31805	63	\N
190	Registro de carga (Esterilización)	2016-12-16 18:46:08.322404	2016-12-16 18:46:08.322404	63	\N
191	Incubación de indicar biológico (Esterilización)	2016-12-16 18:46:08.326627	2016-12-16 18:46:08.326627	63	\N
192	Desmonte de autoclave (Esterilización)	2016-12-16 18:46:08.331884	2016-12-16 18:46:08.331884	63	\N
193	Verificar los rangos de T y H (Esterilización)	2016-12-16 18:46:08.336117	2016-12-16 18:46:08.336117	63	\N
194	Registro (Esterilización)	2016-12-16 18:46:08.340116	2016-12-16 18:46:08.340116	63	\N
195	Recepción  (Almacenamiento Esterilización)	2016-12-16 18:46:08.345077	2016-12-16 18:46:08.345077	64	\N
196	Verificar los rangos de T y H (Esterilización almacenamiento)	2016-12-16 18:46:08.349375	2016-12-16 18:46:08.349375	64	\N
197	Registro (Almacenamiento Esterilización)	2016-12-16 18:46:08.353553	2016-12-16 18:46:08.353553	64	\N
198	Ubicación de dispositivos  (Esterilización)	2016-12-16 18:46:08.363458	2016-12-16 18:46:08.363458	64	\N
199	Registro (Dispositivos para Esterilización)	2016-12-16 18:46:08.367744	2016-12-16 18:46:08.367744	64	\N
200	Revisión de fechas de vencimiento (Esterilización)	2016-12-16 18:46:08.372104	2016-12-16 18:46:08.372104	64	\N
201	Ubicación de dispositivos estériles en las estanterías  (Esterilización)	2016-12-16 18:46:08.376605	2016-12-16 18:46:08.376605	65	\N
202	Verificación inventario (Esterilización)	2016-12-16 18:46:08.381213	2016-12-16 18:46:08.381213	65	\N
203	Despacho áreas asistenciales (Esterilización)	2016-12-16 18:46:08.385469	2016-12-16 18:46:08.385469	65	\N
204	Ubicación insumos angiografía (Esterilización)	2016-12-16 18:46:08.390964	2016-12-16 18:46:08.390964	65	\N
205	Verificar condiciones de recepción de dispositivos médicos (bioseguridad y formatos) (Esterilización)	2016-12-16 18:46:08.395121	2016-12-16 18:46:08.395121	66	\N
206	Verificar selección de tipos de empaque (Esterilización)	2016-12-16 18:46:08.399263	2016-12-16 18:46:08.399263	66	\N
207	Verificar sistema de rotulación (Esterilización)	2016-12-16 18:46:08.406215	2016-12-16 18:46:08.406215	66	\N
208	Imprimir stikers (Esterilización)	2016-12-16 18:46:08.410534	2016-12-16 18:46:08.410534	66	\N
209	Realización de planes para reducción de riesgos (Esterilización)	2016-12-16 18:46:08.414801	2016-12-16 18:46:08.414801	66	\N
210	Revisar el viraje de diferente controles de esterilización (Esterilización)	2016-12-16 18:46:08.419125	2016-12-16 18:46:08.419125	66	\N
211	Auditar la trazabilidad de reusó (Esterilización)	2016-12-16 18:46:08.423413	2016-12-16 18:46:08.423413	66	\N
212	Controlar los indicadores de gestión (Esterilización)	2016-12-16 18:46:08.429083	2016-12-16 18:46:08.429083	66	\N
213	Interdependencia con los distintos comités (Esterilización)	2016-12-16 18:46:08.433388	2016-12-16 18:46:08.433388	66	\N
214	Revisión de nómina  (Esterilización)	2016-12-16 18:46:08.437537	2016-12-16 18:46:08.437537	66	\N
215	Actividades de coordinación servicios farmacéuticos	2016-12-16 18:46:08.441592	2016-12-16 18:46:08.441592	67	\N
216	Riesgos (Servicios farmacéuticos)	2016-12-16 18:46:08.445538	2016-12-16 18:46:08.445538	67	\N
217	Entrega de turno (Servicios farmacéuticos)	2016-12-16 18:46:08.449863	2016-12-16 18:46:08.449863	67	\N
218	pedido de insumos (Servicios farmacéuticos)	2016-12-16 18:46:08.454433	2016-12-16 18:46:08.454433	67	\N
219	Despachar pedidos a UCI	2016-12-16 18:46:08.45869	2016-12-16 18:46:08.45869	68	\N
220	Despachar pedidos a HOSPITALIZACION	2016-12-16 18:46:08.462698	2016-12-16 18:46:08.462698	68	\N
221	Limpieza de carro de medicamentos	2016-12-16 18:46:08.466684	2016-12-16 18:46:08.466684	69	\N
222	Archivo de listas (Servicios farmacéuticos)	2016-12-16 18:46:08.471062	2016-12-16 18:46:08.471062	69	\N
223	Inventario ( 2 veces al año ) (Servicios farmacéuticos)	2016-12-16 18:46:08.475953	2016-12-16 18:46:08.475953	69	\N
224	Registros de temperatura (Servicios farmacéuticos)	2016-12-16 18:46:08.47988	2016-12-16 18:46:08.47988	69	\N
225	Limpieza de stands (Servicios farmacéuticos)	2016-12-16 18:46:08.483812	2016-12-16 18:46:08.483812	69	\N
226	Pedido de medicamentos (Servicios farmacéuticos)	2016-12-16 18:46:08.488	2016-12-16 18:46:08.488	69	\N
227	Recepción de medicamentos (Servicios farmacéuticos)	2016-12-16 18:46:08.492654	2016-12-16 18:46:08.492654	69	\N
228	Surtir stands (Servicios farmacéuticos)	2016-12-16 18:46:08.497376	2016-12-16 18:46:08.497376	69	\N
229	Relación de medicamentos (Servicios farmacéuticos)	2016-12-16 18:46:08.502	2016-12-16 18:46:08.502	69	\N
230	Devoluciones de pedido (Servicios farmacéuticos)	2016-12-16 18:46:08.506046	2016-12-16 18:46:08.506046	69	\N
231	Medicamentos vencidos/3 meses (Servicios farmacéuticos)	2016-12-16 18:46:08.510094	2016-12-16 18:46:08.510094	69	\N
232	Organización de la farmacia (Servicios farmacéuticos)	2016-12-16 18:46:08.513852	2016-12-16 18:46:08.513852	69	\N
233	Seguimiento farmacoterapeutico (Servicios farmacéuticos)	2016-12-16 18:46:08.518342	2016-12-16 18:46:08.518342	69	\N
234	Aleatorio (Servicios farmacéuticos)	2016-12-16 18:46:08.523149	2016-12-16 18:46:08.523149	69	\N
235	Verificar re empaques, y asignar lo que se va a empacar al otro día (Servicios farmacéuticos)	2016-12-16 18:46:08.527454	2016-12-16 18:46:08.527454	69	\N
236	Devoluciones de medicamentos  (Servicios farmacéuticos)	2016-12-16 18:46:08.531642	2016-12-16 18:46:08.531642	69	\N
237	Re empaque (Servicios farmacéuticos)	2016-12-16 18:46:08.535841	2016-12-16 18:46:08.535841	69	\N
238	Apertura farmacia	2016-12-16 18:46:08.539664	2016-12-16 18:46:08.539664	70	\N
239	Preparar insumos ( gorros, guantes, etc.)	2016-12-16 18:46:08.543957	2016-12-16 18:46:08.543957	70	\N
240	Solicitud de medicamentos a suministros (Servicios farmacéuticos Cirugía)	2016-12-16 18:46:08.547835	2016-12-16 18:46:08.547835	71	\N
241	Registro de temperatura (Servicios farmacéuticos Cirugía)	2016-12-16 18:46:08.552639	2016-12-16 18:46:08.552639	71	\N
242	Solicitar pedidos almacén general. (Servicios farmacéuticos Angiografía)	2016-12-16 18:46:08.556658	2016-12-16 18:46:08.556658	72	\N
243	Recibir pedidos del almacén ( revisar lote y fecha de vencimiento)  (Servicios farmacéuticos Angiografía)	2016-12-16 18:46:08.563084	2016-12-16 18:46:08.563084	72	\N
244	Solicitar mercancía en consignación ( correo electrónico) (Servicios farmacéuticos Angiografía)	2016-12-16 18:46:08.567245	2016-12-16 18:46:08.567245	72	\N
245	Recibir mercancía en consignación (Servicios farmacéuticos Angiografía)	2016-12-16 18:46:08.571592	2016-12-16 18:46:08.571592	72	\N
246	Hacer lista de chequeo diario del carro de procedimientos de las salas y completar el stock de insumos (Servicios farmacéuticos Angiografía)	2016-12-16 18:46:08.575614	2016-12-16 18:46:08.575614	72	\N
247	Surtir carro de procedimientos tarde (Servicios farmacéuticos Angiografía)	2016-12-16 18:46:08.580215	2016-12-16 18:46:08.580215	72	\N
248	Registrar la toma de la temperatura, humedad y nevera. (Servicios farmacéuticos Angiografía)	2016-12-16 18:46:08.584245	2016-12-16 18:46:08.584245	72	\N
249	Realizar traslado de las bodegas de consignación para reportar a compras. (Servicios farmacéuticos Angiografía)	2016-12-16 18:46:08.588351	2016-12-16 18:46:08.588351	72	\N
250	Realizar cargue de insumo RU a la bodega angiografía. (Servicios farmacéuticos Angiografía)	2016-12-16 18:46:08.592686	2016-12-16 18:46:08.592686	72	\N
251	Realizar cargo de insumos por paciente dx (Servicios farmacéuticos Angiografía)	2016-12-16 18:46:08.597436	2016-12-16 18:46:08.597436	72	\N
252	Realizar cargo de insumos por paciente de tto (Servicios farmacéuticos Angiografía)	2016-12-16 18:46:08.601585	2016-12-16 18:46:08.601585	72	\N
253	Realizar inventarios de consignación con cada proveedor mensual. (Servicios farmacéuticos Angiografía)	2016-12-16 18:46:08.60638	2016-12-16 18:46:08.60638	72	\N
254	Hacer verificación del inventario con el proveedor. (Servicios farmacéuticos Angiografía)	2016-12-16 18:46:08.612151	2016-12-16 18:46:08.612151	72	\N
255	Ingreso de insumos de consignación al siis (Servicios farmacéuticos Angiografía)	2016-12-16 18:46:08.61612	2016-12-16 18:46:08.61612	72	\N
256	Realizar devolución de mercancía en consignación. (Servicios farmacéuticos Angiografía)	2016-12-16 18:46:08.620065	2016-12-16 18:46:08.620065	72	\N
257	Verificar programación para la solicitud de insumos que no estén disponibles (Servicios farmacéuticos Angiografía)	2016-12-16 18:46:08.624147	2016-12-16 18:46:08.624147	72	\N
258	Solicitar los insumos a compra cuando no estén disponible o eventuales.  (Servicios farmacéuticos Angiografía)	2016-12-16 18:46:08.628173	2016-12-16 18:46:08.628173	72	\N
259	Realizar inventario trimestral del almacén de angiografía. (Servicios farmacéuticos Angiografía)	2016-12-16 18:46:08.633302	2016-12-16 18:46:08.633302	72	\N
260	Revisión de inventarios semanales por especialidad (Servicios farmacéuticos Angiografía)	2016-12-16 18:46:08.637598	2016-12-16 18:46:08.637598	72	\N
261	Hacer lista de chequeo de insumos próximos a vencer. (Servicios farmacéuticos Angiografía)	2016-12-16 18:46:08.650301	2016-12-16 18:46:08.650301	72	\N
262	Informe de servicio (comunicación )	2016-12-16 18:46:08.656125	2016-12-16 18:46:08.656125	73	\N
263	Cronogramas (Comercial)	2016-12-16 18:46:08.662709	2016-12-16 18:46:08.662709	74	\N
264	Cotizaciones eventuales(Comercial)	2016-12-16 18:46:08.667159	2016-12-16 18:46:08.667159	74	\N
265	Proyecciones (Comercial)	2016-12-16 18:46:08.671704	2016-12-16 18:46:08.671704	74	\N
266	Dime te cuenta (Comercial)	2016-12-16 18:46:08.675971	2016-12-16 18:46:08.675971	75	\N
267	Casos de éxito (Comercial)	2016-12-16 18:46:08.680594	2016-12-16 18:46:08.680594	75	\N
268	Campaña de ahorro (Comercial)	2016-12-16 18:46:08.684673	2016-12-16 18:46:08.684673	75	\N
269	Piensa positivo (Comercial)	2016-12-16 18:46:08.689724	2016-12-16 18:46:08.689724	75	\N
270	Correo masivo cumpleaños (Comercial)	2016-12-16 18:46:08.693683	2016-12-16 18:46:08.693683	75	\N
271	Actualización carteleras(Comercial)	2016-12-16 18:46:08.69814	2016-12-16 18:46:08.69814	76	\N
272	Comité de gerencia (Comercial)	2016-12-16 18:46:08.70296	2016-12-16 18:46:08.70296	77	\N
273	Temas por área (Comercial)	2016-12-16 18:46:08.707153	2016-12-16 18:46:08.707153	77	\N
274	Habladores pasillos (Comercial)	2016-12-16 18:46:08.712077	2016-12-16 18:46:08.712077	78	\N
275	Página web	2016-12-16 18:46:08.71715	2016-12-16 18:46:08.71715	79	\N
276	Facebook	2016-12-16 18:46:08.722176	2016-12-16 18:46:08.722176	79	\N
277	Apoyo por áreas (Comercial)	2016-12-16 18:46:08.726564	2016-12-16 18:46:08.726564	80	\N
278	Pólizas (Comercial)	2016-12-16 18:46:08.731235	2016-12-16 18:46:08.731235	81	\N
279	Revisar (Comercial)	2016-12-16 18:46:08.735876	2016-12-16 18:46:08.735876	82	\N
280	Estancia (Comercial)	2016-12-16 18:46:08.740315	2016-12-16 18:46:08.740315	83	\N
281	Mensual (Comercial)	2016-12-16 18:46:08.744603	2016-12-16 18:46:08.744603	84	\N
282	Diaria 2 veces (Comercial)	2016-12-16 18:46:08.74872	2016-12-16 18:46:08.74872	84	\N
283	Informes gerencia semanal (Comercial)	2016-12-16 18:46:08.752787	2016-12-16 18:46:08.752787	85	\N
284	Informes gerencia mensual (Comercial)	2016-12-16 18:46:08.758643	2016-12-16 18:46:08.758643	85	\N
285	Informes gerencia eventual (Comercial)	2016-12-16 18:46:08.76425	2016-12-16 18:46:08.76425	85	\N
286	Revisión parametrización (Comercial)	2016-12-16 18:46:08.769751	2016-12-16 18:46:08.769751	86	\N
287	Clausulados (Comercial)	2016-12-16 18:46:08.774024	2016-12-16 18:46:08.774024	86	\N
288	Revisar Contratos (Comercial)	2016-12-16 18:46:08.779375	2016-12-16 18:46:08.779375	86	\N
289	Relacionar con otras entidades (Comercial)	2016-12-16 18:46:08.784191	2016-12-16 18:46:08.784191	86	\N
290	Áreas para completar informes (Comercial)	2016-12-16 18:46:08.788161	2016-12-16 18:46:08.788161	87	\N
291	Presupuesto (Comercial)	2016-12-16 18:46:08.792242	2016-12-16 18:46:08.792242	88	\N
292	Insumos (Comercial)	2016-12-16 18:46:08.796496	2016-12-16 18:46:08.796496	89	\N
293	General (Comercial)	2016-12-16 18:46:08.801063	2016-12-16 18:46:08.801063	89	\N
294	Realizar cartas (Comercial)	2016-12-16 18:46:08.805691	2016-12-16 18:46:08.805691	90	\N
295	Realizar cotizaciones ambulatorias (Comercial)	2016-12-16 18:46:08.81015	2016-12-16 18:46:08.81015	91	\N
296	Firmar (Comercial)	2016-12-16 18:46:08.814398	2016-12-16 18:46:08.814398	91	\N
297	generar reporte  (Comercial)	2016-12-16 18:46:08.818654	2016-12-16 18:46:08.818654	91	\N
298	Enviar (Comercial)	2016-12-16 18:46:08.822828	2016-12-16 18:46:08.822828	91	\N
299	Actividades de secretaria (Comercial)	2016-12-16 18:46:08.826975	2016-12-16 18:46:08.826975	92	\N
300	Actualizar base de datos entidades (Comercial)	2016-12-16 18:46:08.831194	2016-12-16 18:46:08.831194	92	\N
301	Apoyo a jefe (Comercial)	2016-12-16 18:46:08.835412	2016-12-16 18:46:08.835412	92	\N
302	Apoyo a Aux contratación (Comercial)	2016-12-16 18:46:08.839554	2016-12-16 18:46:08.839554	92	\N
303	Totales (Comercial)	2016-12-16 18:46:08.844243	2016-12-16 18:46:08.844243	93	\N
304	Activar planes (Comercial)	2016-12-16 18:46:08.850019	2016-12-16 18:46:08.850019	94	\N
305	Planos MID insumos (Comercial)	2016-12-16 18:46:08.854357	2016-12-16 18:46:08.854357	94	\N
306	Planos MID procedimientos (Comercial)	2016-12-16 18:46:08.860435	2016-12-16 18:46:08.860435	94	\N
307	Envió de planos (Comercial)	2016-12-16 18:46:08.865222	2016-12-16 18:46:08.865222	94	\N
308	Convenios (Comercial)	2016-12-16 18:46:08.870018	2016-12-16 18:46:08.870018	95	\N
309	Seguimiento al particular (Comercial)	2016-12-16 18:46:08.875171	2016-12-16 18:46:08.875171	96	\N
310	Seguimiento ( fidelizar cliente ) (Comercial)	2016-12-16 18:46:08.883611	2016-12-16 18:46:08.883611	96	\N
311	Visitas ( mantenimiento a clientes ) (Comercial)	2016-12-16 18:46:08.888249	2016-12-16 18:46:08.888249	96	\N
312	Ejecutar Jornadas de salud (Comercial)	2016-12-16 18:46:08.893741	2016-12-16 18:46:08.893741	96	\N
313	Campañas (Comercial)	2016-12-16 18:46:08.898062	2016-12-16 18:46:08.898062	96	\N
314	Preparación de jornadas de salud (Comercial)	2016-12-16 18:46:08.90333	2016-12-16 18:46:08.90333	97	\N
315	comerciales (Comercial)	2016-12-16 18:46:08.909029	2016-12-16 18:46:08.909029	97	\N
316	Entidad (Comercial)	2016-12-16 18:46:08.914709	2016-12-16 18:46:08.914709	97	\N
317	Preparación de campañas (Comercial)	2016-12-16 18:46:08.920745	2016-12-16 18:46:08.920745	97	\N
318	Visitas a gerencias (Comercial)	2016-12-16 18:46:08.925043	2016-12-16 18:46:08.925043	98	\N
319	Acompañamiento a gerencia	2016-12-16 18:46:08.929484	2016-12-16 18:46:08.929484	98	\N
320	Apoyo a situaciones adversas (Comercial)	2016-12-16 18:46:08.934066	2016-12-16 18:46:08.934066	99	\N
321	Proponer a gerencia (Comercial)	2016-12-16 18:46:08.940314	2016-12-16 18:46:08.940314	100	\N
322	Efectividad de licitaciones (Comercial)	2016-12-16 18:46:08.945224	2016-12-16 18:46:08.945224	101	\N
323	Lista de chequeo contratos (Comercial)	2016-12-16 18:46:08.949632	2016-12-16 18:46:08.949632	102	\N
324	Reuniones gerencia (Comercial)	2016-12-16 18:46:08.954385	2016-12-16 18:46:08.954385	103	\N
\.


--
-- Name: indirect_activities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('indirect_activities_id_seq', 324, true);


--
-- Data for Name: indirect_activity_by_products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY indirect_activity_by_products (id, product_id, indirect_activity_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: indirect_activity_by_products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('indirect_activity_by_products_id_seq', 1, false);


--
-- Data for Name: indirect_activity_by_resources; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY indirect_activity_by_resources (id, resource_id, subresource_id, quantity, cost, meter_id, indirect_activity_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: indirect_activity_by_resources_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('indirect_activity_by_resources_id_seq', 1, false);


--
-- Data for Name: kardex_acs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY kardex_acs (id, created_at, updated_at) FROM stdin;
\.


--
-- Name: kardex_acs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('kardex_acs_id_seq', 1, false);


--
-- Data for Name: kardex_aps; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY kardex_aps (id, created_at, updated_at) FROM stdin;
\.


--
-- Name: kardex_aps_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('kardex_aps_id_seq', 1, false);


--
-- Data for Name: kardex_mos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY kardex_mos (id, created_at, updated_at) FROM stdin;
\.


--
-- Name: kardex_mos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('kardex_mos_id_seq', 1, false);


--
-- Data for Name: kardex_products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY kardex_products (id, registre_date, quantity, total_value, meter_id, production_order_id, number_sale, product_id, type_kpo, created_at, updated_at) FROM stdin;
\.


--
-- Name: kardex_products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('kardex_products_id_seq', 1, false);


--
-- Data for Name: kardexes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY kardexes (id, registration_date, provider_id, subresource_id, quantity, total_value, meter_id, created_at, updated_at, type_kardex) FROM stdin;
\.


--
-- Name: kardexes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('kardexes_id_seq', 1, false);


--
-- Data for Name: macroprocesses; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY macroprocesses (id, name, business_unit_id, created_at, updated_at) FROM stdin;
1	CARDIOLOGIA	1	2016-12-16 18:46:00.09874	2016-12-16 18:46:00.09874
2	REHABILITACION	1	2016-12-16 18:46:00.103473	2016-12-16 18:46:00.103473
3	URGENCIAS	1	2016-12-16 18:46:00.112614	2016-12-16 18:46:00.112614
4	HOSPITALIZACION	1	2016-12-16 18:46:00.116912	2016-12-16 18:46:00.116912
5	UNIDAD DE CUIDADOS INTENSIVOS	1	2016-12-16 18:46:00.122098	2016-12-16 18:46:00.122098
6	ANGIOGRAFIA	1	2016-12-16 18:46:00.126184	2016-12-16 18:46:00.126184
7	DIAGNOSTICO	1	2016-12-16 18:46:00.130373	2016-12-16 18:46:00.130373
8	RESONANCIA	1	2016-12-16 18:46:00.134085	2016-12-16 18:46:00.134085
9	ESTERILIZACION	2	2016-12-16 18:46:00.139921	2016-12-16 18:46:00.139921
10	SERVICIOS FARMACEUTICOS	2	2016-12-16 18:46:00.143769	2016-12-16 18:46:00.143769
11	GESTION COMERCIAL	3	2016-12-16 18:46:00.147754	2016-12-16 18:46:00.147754
\.


--
-- Name: macroprocesses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('macroprocesses_id_seq', 11, true);


--
-- Data for Name: macroproducts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY macroproducts (id, name, created_at, updated_at) FROM stdin;
1	(Cardiologia) Consulta externa	2016-12-16 18:46:01.586422	2016-12-16 18:46:01.586422
2	(Cardiologia) Examenes	2016-12-16 18:46:01.591665	2016-12-16 18:46:01.591665
3	Rehabilitacion	2016-12-16 18:46:01.596091	2016-12-16 18:46:01.596091
4	Urgencias	2016-12-16 18:46:01.599767	2016-12-16 18:46:01.599767
5	(Estancia) UCI	2016-12-16 18:46:01.603834	2016-12-16 18:46:01.603834
6	(Estancia) UCIN	2016-12-16 18:46:01.607724	2016-12-16 18:46:01.607724
7	(Estancia) Hospitalizacion	2016-12-16 18:46:01.61235	2016-12-16 18:46:01.61235
8	(Imágenes) Resonancia	2016-12-16 18:46:01.618438	2016-12-16 18:46:01.618438
9	(Imágenes) Diagnostico	2016-12-16 18:46:01.622656	2016-12-16 18:46:01.622656
10	(Angiografia) Consulta	2016-12-16 18:46:01.626613	2016-12-16 18:46:01.626613
11	(Angiografia) Cardiologia	2016-12-16 18:46:01.630757	2016-12-16 18:46:01.630757
12	(Angiografia) Periferico	2016-12-16 18:46:01.634715	2016-12-16 18:46:01.634715
13	(Cirugia) Torax	2016-12-16 18:46:01.638755	2016-12-16 18:46:01.638755
14	(Cirugia) Cardiovascular	2016-12-16 18:46:01.642965	2016-12-16 18:46:01.642965
15	(Cirugia) Neurologica	2016-12-16 18:46:01.646757	2016-12-16 18:46:01.646757
16	(Cirugia) Insuficiencia venosa	2016-12-16 18:46:01.651755	2016-12-16 18:46:01.651755
17	(Cirugia) Transplante cardiaco	2016-12-16 18:46:01.655644	2016-12-16 18:46:01.655644
18	(Angiografia) Neuro	2016-12-16 18:46:01.659443	2016-12-16 18:46:01.659443
\.


--
-- Name: macroproducts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('macroproducts_id_seq', 18, true);


--
-- Data for Name: meters; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY meters (id, unity, type_unity, created_at, updated_at) FROM stdin;
1	Kilos	Masa	2016-12-16 18:46:00.053101	2016-12-16 18:46:00.053101
2	Litros	Volumen	2016-12-16 18:46:00.057542	2016-12-16 18:46:00.057542
3	Otro	Otro	2016-12-16 18:46:00.061441	2016-12-16 18:46:00.061441
4	Hora	Tiempo	2016-12-16 18:46:00.065686	2016-12-16 18:46:00.065686
5	Unidad	Unidad	2016-12-16 18:46:00.069733	2016-12-16 18:46:00.069733
\.


--
-- Name: meters_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('meters_id_seq', 5, true);


--
-- Data for Name: op_cost_by_resources; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY op_cost_by_resources (id, quantity, meter_id, resource_id, subresource_id, activity_by_product_id, cost, created_at, updated_at, production_order_id) FROM stdin;
\.


--
-- Name: op_cost_by_resources_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('op_cost_by_resources_id_seq', 1, false);


--
-- Data for Name: positions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY positions (id, name, area, created_at, updated_at) FROM stdin;
1	ANALISTA CONTABLE	CONTABILIDAD E IMPUESTOS	2016-12-16 18:46:08.966428	2016-12-16 18:46:08.966428
2	ANALISTA DE CALIDAD	CALIDAD	2016-12-16 18:46:08.971248	2016-12-16 18:46:08.971248
3	ANALISTA DE MEDIO AMBIENTE	INFRAESTRUCTURA Y MEDIO AMBIENTE	2016-12-16 18:46:08.976155	2016-12-16 18:46:08.976155
4	ANALISTA DE PSICOLOGIA	ATENCION Y SEGUIMIENTO AL USUARIO	2016-12-16 18:46:08.981197	2016-12-16 18:46:08.981197
5	ANALISTA DE SISTEMAS	TECNOLOGIA DE LA INFORMACION Y COMUNICACIONES	2016-12-16 18:46:08.985125	2016-12-16 18:46:08.985125
6	ANALISTA DE TALENTO HUMANO	TALENTO HUMANO	2016-12-16 18:46:08.98926	2016-12-16 18:46:08.98926
7	ANALISTA NIIF	CONTABILIDAD E IMPUESTOS	2016-12-16 18:46:08.994121	2016-12-16 18:46:08.994121
8	APRENDIZ ADM. EN SALUD	AYUDAS DIAGNOSTICAS	2016-12-16 18:46:08.99941	2016-12-16 18:46:08.99941
9	APRENDIZ AUX DE ENFERMERIA	AYUDAS DIAGNOSTICAS	2016-12-16 18:46:09.003432	2016-12-16 18:46:09.003432
10	APRENDIZ AUX DE ENFERMERIA	CARDIOLOGIA NO INVASIVA	2016-12-16 18:46:09.008161	2016-12-16 18:46:09.008161
11	APRENDIZ AUXILIAR CONTABLE	CONTABILIDAD E IMPUESTOS	2016-12-16 18:46:09.01213	2016-12-16 18:46:09.01213
12	APRENDIZ COMERCIAL	DIRECCION COMERCIAL	2016-12-16 18:46:09.01613	2016-12-16 18:46:09.01613
13	APRENDIZ COMPRAS	COMPRAS Y SUMINISTROS	2016-12-16 18:46:09.020653	2016-12-16 18:46:09.020653
14	APRENDIZ DE ARCHIVO	TECNOLOGIA DE LA INFORMACION Y COMUNICACIONES	2016-12-16 18:46:09.024664	2016-12-16 18:46:09.024664
15	APRENDIZ EN AUDITORIA	AUDITORIA MEDICA	2016-12-16 18:46:09.028661	2016-12-16 18:46:09.028661
16	APRENDIZ INGENIERIA BIOMEDICA	TECNOLOGIA BIOMEDICA	2016-12-16 18:46:09.033574	2016-12-16 18:46:09.033574
17	APRENDIZ MEDIO AMBIENTE	INFRAESTRUCTURA Y MEDIO AMBIENTE	2016-12-16 18:46:09.037572	2016-12-16 18:46:09.037572
18	APRENDIZ PSICOLOGIA	ATENCION Y SEGUIMIENTO AL USUARIO	2016-12-16 18:46:09.045785	2016-12-16 18:46:09.045785
19	APRENDIZ SEGURIDAD Y SALUD EN EL TRA	TALENTO HUMANO	2016-12-16 18:46:09.050035	2016-12-16 18:46:09.050035
20	APRENDIZ SERVICIO FARMACEUTICO	SERVICIO FARMACEUTICO	2016-12-16 18:46:09.054868	2016-12-16 18:46:09.054868
21	APRENDIZ TALENTO HUMANO	TALENTO HUMANO	2016-12-16 18:46:09.059127	2016-12-16 18:46:09.059127
22	APRENDIZ TECNOLOGO EN SISTEMAS	TECNOLOGIA DE LA INFORMACION Y COMUNICACIONES	2016-12-16 18:46:09.063311	2016-12-16 18:46:09.063311
23	ASISTENTE DE CONTRATACION Y COMUNICA	DIRECCION COMERCIAL	2016-12-16 18:46:09.068157	2016-12-16 18:46:09.068157
24	ASISTENTE DE FACTURACION	FACTURACION	2016-12-16 18:46:09.072458	2016-12-16 18:46:09.072458
25	ASISTENTE DE SERVICIO FARMACEUTICO	SERVICIO FARMACEUTICO	2016-12-16 18:46:09.076729	2016-12-16 18:46:09.076729
26	AUDITOR(A) MEDICO	AUDITORIA MEDICA	2016-12-16 18:46:09.080792	2016-12-16 18:46:09.080792
27	AUX DE CALIDAD	CALIDAD	2016-12-16 18:46:09.084905	2016-12-16 18:46:09.084905
28	AUX DE ENFERMERIA COMITE DE INFECCIO	COMITÉ DE INFECCIONES	2016-12-16 18:46:09.089263	2016-12-16 18:46:09.089263
29	AUX DE FARMACIA	URGENCIAS-UCI-HOSPITALIZACION	2016-12-16 18:46:09.093599	2016-12-16 18:46:09.093599
30	AUX DE FARMACIA	ANGIOGRAFIA	2016-12-16 18:46:09.097444	2016-12-16 18:46:09.097444
31	AUX DE FARMACIA	CIRUGIA	2016-12-16 18:46:09.101609	2016-12-16 18:46:09.101609
32	AUX DE FARMACIA	SERVICIO FARMACEUTICO	2016-12-16 18:46:09.10581	2016-12-16 18:46:09.10581
33	AUX. ADMINISTRATIVO DE CIRUGIA	CIRUGIA	2016-12-16 18:46:09.109717	2016-12-16 18:46:09.109717
34	AUXILIAR ADMINISTRATIVO	ANGIOGRAFIA	2016-12-16 18:46:09.113732	2016-12-16 18:46:09.113732
35	AUXILIAR ATENCION Y SEGUIMIENTO AL U	ATENCION Y SEGUIMIENTO AL USUARIO	2016-12-16 18:46:09.117605	2016-12-16 18:46:09.117605
36	AUXILIAR COMERCIAL	DIRECCION COMERCIAL	2016-12-16 18:46:09.121638	2016-12-16 18:46:09.121638
37	AUXILIAR COMPRAS	COMPRAS Y SUMINISTROS	2016-12-16 18:46:09.125601	2016-12-16 18:46:09.125601
38	AUXILIAR DE ARCHIVO	TECNOLOGIA DE LA INFORMACION Y COMUNICACIONES	2016-12-16 18:46:09.129662	2016-12-16 18:46:09.129662
39	AUXILIAR DE AUDITORIA	AUDITORIA MEDICA	2016-12-16 18:46:09.133722	2016-12-16 18:46:09.133722
40	AUXILIAR DE CARTERA	CARTERA Y RADICACION	2016-12-16 18:46:09.137836	2016-12-16 18:46:09.137836
41	AUXILIAR DE CONCILIACIONES	CONTABILIDAD E IMPUESTOS	2016-12-16 18:46:09.141694	2016-12-16 18:46:09.141694
42	AUXILIAR DE CONVENIOS	DIRECCION COMERCIAL	2016-12-16 18:46:09.146743	2016-12-16 18:46:09.146743
43	AUXILIAR DE ENFERMERIA	AYUDAS DIAGNOSTICAS	2016-12-16 18:46:09.15141	2016-12-16 18:46:09.15141
44	AUXILIAR DE ENFERMERIA	UNIDAD DE CUIDADOS INTENSIVOS	2016-12-16 18:46:09.155516	2016-12-16 18:46:09.155516
45	AUXILIAR DE ENFERMERIA	HOSPITALIZACION	2016-12-16 18:46:09.160067	2016-12-16 18:46:09.160067
46	AUXILIAR DE ENFERMERIA	ANGIOGRAFIA	2016-12-16 18:46:09.164406	2016-12-16 18:46:09.164406
47	AUXILIAR DE ENFERMERIA	URGENCIAS	2016-12-16 18:46:09.168401	2016-12-16 18:46:09.168401
48	AUXILIAR DE ENFERMERIA	RESONANCIA	2016-12-16 18:46:09.173729	2016-12-16 18:46:09.173729
49	AUXILIAR DE ENFERMERIA	FALLA CARDIACA	2016-12-16 18:46:09.178361	2016-12-16 18:46:09.178361
50	AUXILIAR DE ENFERMERIA	CARDIOLOGIA NO INVASIVA	2016-12-16 18:46:09.182679	2016-12-16 18:46:09.182679
51	AUXILIAR DE ESTERILIZACION	ESTERILIZACION	2016-12-16 18:46:09.186681	2016-12-16 18:46:09.186681
52	AUXILIAR DE FACTURACION AMBULATORIO	FACTURACION	2016-12-16 18:46:09.191227	2016-12-16 18:46:09.191227
53	AUXILIAR DE FACTURACION -ANGIOGRAFIA	FACTURACION	2016-12-16 18:46:09.19534	2016-12-16 18:46:09.19534
54	AUXILIAR DE FARMACIA	SERVICIO FARMACEUTICO	2016-12-16 18:46:09.199256	2016-12-16 18:46:09.199256
55	AUXILIAR DE MANTENIMIENTO	INFRAESTRUCTURA Y MEDIO AMBIENTE	2016-12-16 18:46:09.204306	2016-12-16 18:46:09.204306
56	AUXILIAR DE RADICACION	CARTERA Y RADICACION	2016-12-16 18:46:09.208496	2016-12-16 18:46:09.208496
57	AUXILIAR DE ROPERIA	INFRAESTRUCTURA Y MEDIO AMBIENTE	2016-12-16 18:46:09.212657	2016-12-16 18:46:09.212657
58	AUXILIAR DE SERVICIOS GENERALES	TALENTO HUMANO	2016-12-16 18:46:09.21738	2016-12-16 18:46:09.21738
59	AUXILIAR DE SUMINISTROS	COMPRAS Y SUMINISTROS	2016-12-16 18:46:09.221669	2016-12-16 18:46:09.221669
60	AUXILIAR DE TALENTO HUMANO	TALENTO HUMANO	2016-12-16 18:46:09.226415	2016-12-16 18:46:09.226415
61	AUXILIAR DE TESORERIA	TESORERIA	2016-12-16 18:46:09.231536	2016-12-16 18:46:09.231536
62	AUXILIAR SERVICIOS NO POS	AUDITORIA MEDICA	2016-12-16 18:46:09.235856	2016-12-16 18:46:09.235856
63	AUXLIAR DE SISTEMAS	TECNOLOGIA DE LA INFORMACION Y COMUNICACIONES	2016-12-16 18:46:09.2405	2016-12-16 18:46:09.2405
64	CAJERA PRINCIPAL	TESORERIA	2016-12-16 18:46:09.244475	2016-12-16 18:46:09.244475
65	CAMILLERO	CAMILLERO	2016-12-16 18:46:09.248538	2016-12-16 18:46:09.248538
66	CIRCULANTE DE ANGIOGRAFIA	ANGIOGRAFIA	2016-12-16 18:46:09.252614	2016-12-16 18:46:09.252614
67	CIRCULANTE DE CIRUGIA	CIRUGIA	2016-12-16 18:46:09.257288	2016-12-16 18:46:09.257288
68	COMUNICADOR INTERNO	DIRECCION COMERCIAL	2016-12-16 18:46:09.261957	2016-12-16 18:46:09.261957
69	CONTADORA	CONTABILIDAD E IMPUESTOS	2016-12-16 18:46:09.267743	2016-12-16 18:46:09.267743
70	COOR.TECN.BIOMEDICA INFRA. Y MEDIO A	TECNOLOGIA BIOMEDICA	2016-12-16 18:46:09.271649	2016-12-16 18:46:09.271649
71	COORD ATENCION Y SEGUIMIENTO AL USUA	ATENCION Y SEGUIMIENTO AL USUARIO	2016-12-16 18:46:09.275568	2016-12-16 18:46:09.275568
72	COORD SUMINISTROS E INVENTARIOS	COMPRAS Y SUMINISTROS	2016-12-16 18:46:09.279579	2016-12-16 18:46:09.279579
73	COORD. DE AYUDAS DIAGNOSTICAS	AYUDAS DIAGNOSTICAS	2016-12-16 18:46:09.284058	2016-12-16 18:46:09.284058
74	COORD. SEGURIDAD Y SALUD EN EL TRABA	TALENTO HUMANO	2016-12-16 18:46:09.29007	2016-12-16 18:46:09.29007
75	COORDINADOR CENTRAL DE ESTERILIZACIO	ESTERILIZACION	2016-12-16 18:46:09.293837	2016-12-16 18:46:09.293837
76	COORDINADOR COMERCIAL	DIRECCION COMERCIAL	2016-12-16 18:46:09.297671	2016-12-16 18:46:09.297671
77	COORDINADOR DE ARCHIVO	TECNOLOGIA DE LA INFORMACION Y COMUNICACIONES	2016-12-16 18:46:09.301679	2016-12-16 18:46:09.301679
78	COORDINADOR DE COMPRAS	COMPRAS Y SUMINISTROS	2016-12-16 18:46:09.305637	2016-12-16 18:46:09.305637
79	COORDINADOR DE COSTOS Y PRESUPUESTOS	COSTOS Y PRESUPUESTOS	2016-12-16 18:46:09.31009	2016-12-16 18:46:09.31009
80	COORDINADOR ENFERMERIA	UNIDAD DE CUIDADOS INTENSIVOS	2016-12-16 18:46:09.314833	2016-12-16 18:46:09.314833
81	COORDINADOR(A) ANGIOGRAFIA	ANGIOGRAFIA	2016-12-16 18:46:09.318826	2016-12-16 18:46:09.318826
82	COORDINADOR(A) COMITE INFECCIONES	COMITÉ DE INFECCIONES	2016-12-16 18:46:09.322936	2016-12-16 18:46:09.322936
83	COORDINADOR(A) DE CIRUGIA	CIRUGIA	2016-12-16 18:46:09.326978	2016-12-16 18:46:09.326978
84	COORDINADOR(A) DE HOSPITALIZACION	HOSPITALIZACION	2016-12-16 18:46:09.332116	2016-12-16 18:46:09.332116
85	COORDINADOR(A) DE RESONANCIA	RESONANCIA	2016-12-16 18:46:09.336158	2016-12-16 18:46:09.336158
86	COORDINADOR(A) SEGURIDAD DEL PACIENT	SEGURIDAD DEL PACIENTE	2016-12-16 18:46:09.340236	2016-12-16 18:46:09.340236
87	COORDINADORA DE SERVICIO FARMACEUTICO	SERVICIO FARMACEUTICO	2016-12-16 18:46:09.344028	2016-12-16 18:46:09.344028
88	CORRDINADOR(A) DE GESTION CLINICA	GESTION CLINICA	2016-12-16 18:46:09.347902	2016-12-16 18:46:09.347902
89	CORRDINADOR(A) DE URGENCIAS	URGENCIAS	2016-12-16 18:46:09.352188	2016-12-16 18:46:09.352188
90	ENFERMERO JEFE	HOSPITALIZACION	2016-12-16 18:46:09.356455	2016-12-16 18:46:09.356455
91	ENFERMERO(A) AUDITOR	AUDITORIA MEDICA	2016-12-16 18:46:09.360512	2016-12-16 18:46:09.360512
92	ENFERMERO(A) JEFE	UNIDAD DE CUIDADOS INTENSIVOS	2016-12-16 18:46:09.364728	2016-12-16 18:46:09.364728
93	ENFERMERO(A) JEFE	HOSPITALIZACION	2016-12-16 18:46:09.368906	2016-12-16 18:46:09.368906
94	ENFERMERO(A) JEFE	URGENCIAS	2016-12-16 18:46:09.372709	2016-12-16 18:46:09.372709
95	FACTURADOR	FACTURACION	2016-12-16 18:46:09.376775	2016-12-16 18:46:09.376775
96	FISIOTERAPEUTA	REHABILITACION CARDIACA	2016-12-16 18:46:09.380634	2016-12-16 18:46:09.380634
97	FISIOTERAPEUTA	UNIDAD DE CUIDADOS INTENSIVOS	2016-12-16 18:46:09.384705	2016-12-16 18:46:09.384705
98	FISIOTERAPEUTA	HOSPITALIZACION	2016-12-16 18:46:09.388687	2016-12-16 18:46:09.388687
99	GERENTE GENERAL	GERENCIA	2016-12-16 18:46:09.392609	2016-12-16 18:46:09.392609
100	INGENIERO DE SOPORTE	TECNOLOGIA BIOMEDICA	2016-12-16 18:46:09.396618	2016-12-16 18:46:09.396618
101	INGENIERO TIC	TECNOLOGIA DE LA INFORMACION Y COMUNICACIONES	2016-12-16 18:46:09.400669	2016-12-16 18:46:09.400669
102	INSTRUCTOR DE REANIMACION	CARDIOLOGIA NO INVASIVA	2016-12-16 18:46:09.404821	2016-12-16 18:46:09.404821
103	INSTRUMENTADOR(A) QUIRURGICO	CIRUGIA	2016-12-16 18:46:09.408983	2016-12-16 18:46:09.408983
104	JEFE DE CALIDAD	CALIDAD	2016-12-16 18:46:09.412989	2016-12-16 18:46:09.412989
105	JEFE DE CARTERA	CARTERA Y RADICACION	2016-12-16 18:46:09.416888	2016-12-16 18:46:09.416888
106	JEFE DE FACTURACION	FACTURACION	2016-12-16 18:46:09.420968	2016-12-16 18:46:09.420968
107	JEFE DE TALENTO HUMANO	TALENTO HUMANO	2016-12-16 18:46:09.424925	2016-12-16 18:46:09.424925
108	JEFE DE TIC	TECNOLOGIA DE LA INFORMACION Y COMUNICACIONES	2016-12-16 18:46:09.428976	2016-12-16 18:46:09.428976
109	LIQUIDADOR	FACTURACION	2016-12-16 18:46:09.433194	2016-12-16 18:46:09.433194
110	MEDICO ANESTESIOLOGO	ANGIOGRAFIA	2016-12-16 18:46:09.436994	2016-12-16 18:46:09.436994
111	MEDICO ASISTENCIAL	UNIDAD DE CUIDADOS INTENSIVOS	2016-12-16 18:46:09.44092	2016-12-16 18:46:09.44092
112	MEDICO ASISTENCIAL	HOSPITALIZACION	2016-12-16 18:46:09.444796	2016-12-16 18:46:09.444796
113	MEDICO ASISTENCIAL	ANGIOGRAFIA	2016-12-16 18:46:09.448783	2016-12-16 18:46:09.448783
114	MEDICO ASISTENCIAL	URGENCIAS	2016-12-16 18:46:09.452807	2016-12-16 18:46:09.452807
115	MEDICO ASISTENCIAL	URGENCIAS - HOSPITALIZACION	2016-12-16 18:46:09.456691	2016-12-16 18:46:09.456691
116	MEDICO ASISTENCIAL DE COMITÉ	GESTION CLINICA	2016-12-16 18:46:09.460709	2016-12-16 18:46:09.460709
117	MEDICO ASISTENCIAL DE TRASPLANTE	HOSPITALIZACION - TRASPLANTE CARDIACO	2016-12-16 18:46:09.464822	2016-12-16 18:46:09.464822
118	MEDICO CARDIOLOGO	FALLA CARDIACA	2016-12-16 18:46:09.468701	2016-12-16 18:46:09.468701
119	MEDICO INTERNISTA	HOSPITALIZACION-URGENCIAS-CARDIO	2016-12-16 18:46:09.472838	2016-12-16 18:46:09.472838
120	MEDICO INTERNISTA	UNIDAD DE CUIDADOS INTENSIVOS	2016-12-16 18:46:09.476659	2016-12-16 18:46:09.476659
121	MENSAJERO	GERENCIA	2016-12-16 18:46:09.480843	2016-12-16 18:46:09.480843
122	MENSAJERO	TESORERIA	2016-12-16 18:46:09.484798	2016-12-16 18:46:09.484798
123	MENSAJERO	CARTERA Y RADICACION	2016-12-16 18:46:09.488698	2016-12-16 18:46:09.488698
124	NUTRICIONISTA-DIETISTA	TRASPLANTE CARDIACO	2016-12-16 18:46:09.492708	2016-12-16 18:46:09.492708
125	ORIENTADOR (A)	AYUDAS DIAGNOSTICAS	2016-12-16 18:46:09.49689	2016-12-16 18:46:09.49689
126	PERFUSIONISTA	CIRUGIA	2016-12-16 18:46:09.500704	2016-12-16 18:46:09.500704
127	SECRETARIA CALL CENTER	CALL CENTER	2016-12-16 18:46:09.504752	2016-12-16 18:46:09.504752
128	SECRETARIA ENTREGA DE RESULTADOS	EMPAQUE Y ENTREGA DE RESULTADOS	2016-12-16 18:46:09.508717	2016-12-16 18:46:09.508717
129	SECRETARIO(A) CLINICA	TALENTO HUMANO	2016-12-16 18:46:09.512657	2016-12-16 18:46:09.512657
130	SECRETARIO(A) CLINICA	ADMISION DEL PACIENTE	2016-12-16 18:46:09.516802	2016-12-16 18:46:09.516802
131	SECRETARIO(A) CLINICA	UNIDAD DE CUIDADOS INTENSIVOS	2016-12-16 18:46:09.521059	2016-12-16 18:46:09.521059
132	SECRETARIO(A) CLINICA	RESONANCIA	2016-12-16 18:46:09.524765	2016-12-16 18:46:09.524765
133	SECRETARIO(A) CLINICA	URGENCIAS	2016-12-16 18:46:09.528731	2016-12-16 18:46:09.528731
134	SECRETARIO(A) CLINICA	CARDIOLOGIA NO INVASIVA	2016-12-16 18:46:09.532769	2016-12-16 18:46:09.532769
135	SECRETARIO(A) CLINICA	CIRUGIA	2016-12-16 18:46:09.536658	2016-12-16 18:46:09.536658
136	SECRETARIO(A) CLINICA	HOSPITALIZACION	2016-12-16 18:46:09.540644	2016-12-16 18:46:09.540644
137	SECRETARIO(A) CLINICA	REHABILITACION CARDIACA	2016-12-16 18:46:09.54467	2016-12-16 18:46:09.54467
138	SECRETARIO(A) CLINICA	ANGIOGRAFIA	2016-12-16 18:46:09.548671	2016-12-16 18:46:09.548671
139	SECRETARIO(A) CLINICA CONSULTAS	ANGIOGRAFIA	2016-12-16 18:46:09.55265	2016-12-16 18:46:09.55265
140	SECRETARIO(A) CLINICA PROGRAMACION	ANGIOGRAFIA	2016-12-16 18:46:09.556684	2016-12-16 18:46:09.556684
141	SECRETARIO(A) EMPAQUE	EMPAQUE Y ENTREGA DE RESULTADOS	2016-12-16 18:46:09.560728	2016-12-16 18:46:09.560728
142	SECRETARIO(A) TRANSCRIPCION	TRANSCRIPCION	2016-12-16 18:46:09.564745	2016-12-16 18:46:09.564745
143	SECRETARIO(A) TRANSCRIPCION	CARDIOLOGIA NO INVASIVA	2016-12-16 18:46:09.568685	2016-12-16 18:46:09.568685
144	SECRETARIO(A) TRANSCRIPCION	ANGIOGRAFIA	2016-12-16 18:46:09.572946	2016-12-16 18:46:09.572946
145	SUPERVISOR (A) DE CALL CENTER	CALL CENTER	2016-12-16 18:46:09.577109	2016-12-16 18:46:09.577109
146	TECNICO DE RADIOLOGIA E IMAGENES DIA	LABORATORIO VASCULAR	2016-12-16 18:46:09.58122	2016-12-16 18:46:09.58122
147	TECNICO DE RADIOLOGIA E IMAGENES DIA	RESONANCIA	2016-12-16 18:46:09.585191	2016-12-16 18:46:09.585191
148	TECNICO DE RADIOLOGIA E IMAGENES DIA	AYUDAS DIAGNOSTICAS	2016-12-16 18:46:09.589139	2016-12-16 18:46:09.589139
149	TECNICO(A)	RESONANCIA	2016-12-16 18:46:09.592911	2016-12-16 18:46:09.592911
150	TECNICO(A) ANGIOGRAFIA	ANGIOGRAFIA	2016-12-16 18:46:09.597149	2016-12-16 18:46:09.597149
151	TECNICO(A) PLETISMOGRAFIA	LABORATORIO VASCULAR	2016-12-16 18:46:09.601121	2016-12-16 18:46:09.601121
152	TESORERA	TESORERIA	2016-12-16 18:46:09.604824	2016-12-16 18:46:09.604824
\.


--
-- Name: positions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('positions_id_seq', 152, true);


--
-- Data for Name: procedures; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY procedures (id, name, macroprocess_id, created_at, updated_at) FROM stdin;
1	PLANEACION CARDIOLOGIA	1	2016-12-16 18:46:00.157834	2016-12-16 18:46:00.157834
2	TOMA DE EXAMEN Y CONSULTA (CARDIOLOGIA)	1	2016-12-16 18:46:00.162289	2016-12-16 18:46:00.162289
3	PLANEACION REHABILITACION	2	2016-12-16 18:46:00.166448	2016-12-16 18:46:00.166448
4	TERAPIA REHABILITACION	2	2016-12-16 18:46:00.170646	2016-12-16 18:46:00.170646
5	ENTRADA URGENCIAS	3	2016-12-16 18:46:00.174884	2016-12-16 18:46:00.174884
6	PROCESO URGENCIAS	3	2016-12-16 18:46:00.178844	2016-12-16 18:46:00.178844
7	SEGUIMIENTO URGENCIAS	3	2016-12-16 18:46:00.182857	2016-12-16 18:46:00.182857
8	PROCEDIMIENTOS HOSPITALIZACION	4	2016-12-16 18:46:00.187009	2016-12-16 18:46:00.187009
9	SEGUIMIENTO Y EGRESO ADMINISTRATIVO (HOSPITALIZACION)	4	2016-12-16 18:46:00.190998	2016-12-16 18:46:00.190998
10	PROCEDIMIENTOS (UCI-UCIN)	5	2016-12-16 18:46:00.194998	2016-12-16 18:46:00.194998
11	PROCEDIMIENTOS ANGIOGRAFIA	6	2016-12-16 18:46:00.199074	2016-12-16 18:46:00.199074
12	PREPARACION (DIAGNOSTICO)	7	2016-12-16 18:46:00.20292	2016-12-16 18:46:00.20292
13	ADMISION (DIAGNOSTICO)	7	2016-12-16 18:46:00.207043	2016-12-16 18:46:00.207043
14	EGRESO (DIAGNOSTICO)	7	2016-12-16 18:46:00.210976	2016-12-16 18:46:00.210976
15	TRANSCRIPCION (DIAGNOSTICO)	7	2016-12-16 18:46:00.215136	2016-12-16 18:46:00.215136
16	TRASLADO DE PACIENTES (DIAGNOSTICO)	7	2016-12-16 18:46:00.219005	2016-12-16 18:46:00.219005
17	INGRESO RESONANCIA	8	2016-12-16 18:46:00.223178	2016-12-16 18:46:00.223178
18	TOMA DE EXAMEN RESONANCIA	8	2016-12-16 18:46:00.227193	2016-12-16 18:46:00.227193
19	EGRESO RESONANCIA	8	2016-12-16 18:46:00.230851	2016-12-16 18:46:00.230851
20	ALISTAMIENTO ESTERILIZACION	9	2016-12-16 18:46:00.234684	2016-12-16 18:46:00.234684
21	PROCESO DE ESTERILIZACION	9	2016-12-16 18:46:00.238824	2016-12-16 18:46:00.238824
22	FARMACIA 4TO PISO	10	2016-12-16 18:46:00.242797	2016-12-16 18:46:00.242797
23	FARMACIA CIRUGIA	10	2016-12-16 18:46:00.246911	2016-12-16 18:46:00.246911
24	FARMACIA ANGIOGRAFIA	10	2016-12-16 18:46:00.251951	2016-12-16 18:46:00.251951
25	COMUNICACIÓN COMERCIAL	11	2016-12-16 18:46:00.256071	2016-12-16 18:46:00.256071
26	CONTRATACION	11	2016-12-16 18:46:00.260807	2016-12-16 18:46:00.260807
27	APOYO COMERCIAL	11	2016-12-16 18:46:00.264789	2016-12-16 18:46:00.264789
28	CONVENIOS	11	2016-12-16 18:46:00.268806	2016-12-16 18:46:00.268806
29	ASESOR COMERCIAL	11	2016-12-16 18:46:00.273326	2016-12-16 18:46:00.273326
30	COORDINACION COMERCIAL	11	2016-12-16 18:46:00.277668	2016-12-16 18:46:00.277668
\.


--
-- Name: procedures_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('procedures_id_seq', 30, true);


--
-- Data for Name: production_order_identifiers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY production_order_identifiers (id, created_at, updated_at) FROM stdin;
\.


--
-- Name: production_order_identifiers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('production_order_identifiers_id_seq', 1, false);


--
-- Data for Name: production_orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY production_orders (id, id_po, product_id, quantity, date_start, date_end, status, total_cost, created_at, updated_at) FROM stdin;
\.


--
-- Name: production_orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('production_orders_id_seq', 1, false);


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY products (id, name, macroproduct_id, created_at, updated_at) FROM stdin;
1	 CARDIOLOGIA	1	2016-12-16 18:46:01.672945	2016-12-16 18:46:01.672945
2	 MEDICINA INTERNA	1	2016-12-16 18:46:01.678035	2016-12-16 18:46:01.678035
3	 ELECTROCARDIOGRAFÍA  	2	2016-12-16 18:46:01.682658	2016-12-16 18:46:01.682658
4	 ECOCARDIOGRAMA (TRASTORACICO) 	2	2016-12-16 18:46:01.68657	2016-12-16 18:46:01.68657
5	 PRUEBA ESFUERZO  	2	2016-12-16 18:46:01.69081	2016-12-16 18:46:01.69081
6	 MONITOREO PRESION  	2	2016-12-16 18:46:01.694605	2016-12-16 18:46:01.694605
7	 HOLTER 	2	2016-12-16 18:46:01.700881	2016-12-16 18:46:01.700881
8	 ECO-TRANSESOFAGICO  	2	2016-12-16 18:46:01.704998	2016-12-16 18:46:01.704998
9	 ECO-ESTRÉS	2	2016-12-16 18:46:01.70913	2016-12-16 18:46:01.70913
10	 TERAPIA CARDIACA	3	2016-12-16 18:46:01.713396	2016-12-16 18:46:01.713396
11	 CEFALEA	4	2016-12-16 18:46:01.717359	2016-12-16 18:46:01.717359
12	 DOLOR EN EL PECHO - NO ESPECIFICADO	4	2016-12-16 18:46:01.721457	2016-12-16 18:46:01.721457
13	 ANEURISMA CEREBRAL - SIN RUPTURA	4	2016-12-16 18:46:01.725752	2016-12-16 18:46:01.725752
14	 DISNEA	4	2016-12-16 18:46:01.730705	2016-12-16 18:46:01.730705
15	 OTRAS CONVULSIONES  Y LAS NO ESPECIFICADAS	4	2016-12-16 18:46:01.734612	2016-12-16 18:46:01.734612
16	 HIPERTENSION ESENCIAL (PRIMARIA)	4	2016-12-16 18:46:01.738595	2016-12-16 18:46:01.738595
17	 SINCOPE Y COLAPSO	4	2016-12-16 18:46:01.742944	2016-12-16 18:46:01.742944
18	 DOLOR EN MIEMBRO	4	2016-12-16 18:46:01.746966	2016-12-16 18:46:01.746966
19	 CEFALEA VASCULAR NCOP	4	2016-12-16 18:46:01.750958	2016-12-16 18:46:01.750958
20	 ENFERMEDAD CEREBROVASCULAR - NO ESPECIFICADA	4	2016-12-16 18:46:01.755342	2016-12-16 18:46:01.755342
21	 EMBOLIA Y TROMBOSIS DE ARTERIAS DE LOS MIEMBROS INFERIORES	4	2016-12-16 18:46:01.759623	2016-12-16 18:46:01.759623
22	 DOLOR PRECORDIAL	4	2016-12-16 18:46:01.764427	2016-12-16 18:46:01.764427
23	 MIGRA&#209;A - NO ESPECIFICADA	4	2016-12-16 18:46:01.769216	2016-12-16 18:46:01.769216
24	 OTROS SINDROMES DE CEFALEA ESPECIFICADOS	4	2016-12-16 18:46:01.773502	2016-12-16 18:46:01.773502
25	 ANGINA DE PECHO - NO ESPECIFICADA	4	2016-12-16 18:46:01.777973	2016-12-16 18:46:01.777973
26	 TAQUICARDIA SUPRAVENTRICULAR	4	2016-12-16 18:46:01.783075	2016-12-16 18:46:01.783075
27	 MALFORMACION ARTERIOVENOSA DE LOS VASOS CEREBRALES	4	2016-12-16 18:46:01.787325	2016-12-16 18:46:01.787325
28	 CEFALEA DEBIDA A TENSION	4	2016-12-16 18:46:01.791471	2016-12-16 18:46:01.791471
29	 ANGINA INESTABLE	4	2016-12-16 18:46:01.795643	2016-12-16 18:46:01.795643
30	 FISTULA ARTERIOVENOSA - ADQUIRIDA	4	2016-12-16 18:46:01.800736	2016-12-16 18:46:01.800736
31	 NEUMONIA - NO ESPECIFICADA	4	2016-12-16 18:46:01.804981	2016-12-16 18:46:01.804981
32	 INFECCION AGUDA NO ESPECIFICADA DE LAS VIAS RESPIRATORIAS INFERIORES	4	2016-12-16 18:46:01.809011	2016-12-16 18:46:01.809011
33	 SINDROME NEFROTICO: NO  ESPECIFICADA	4	2016-12-16 18:46:01.812802	2016-12-16 18:46:01.812802
34	 ALERGIA NO ESPECIFICADA	4	2016-12-16 18:46:01.816675	2016-12-16 18:46:01.816675
35	 EFECTOS ADVERSOS DE ANTICOAGULANTES	4	2016-12-16 18:46:01.8208	2016-12-16 18:46:01.8208
36	 HIPOGLICEMIA NO ESPECIFICADA	4	2016-12-16 18:46:01.824777	2016-12-16 18:46:01.824777
37	 EPILEPSIA TIPO NO ESPECIFICADO	4	2016-12-16 18:46:01.828757	2016-12-16 18:46:01.828757
38	 AMNESIA GLOBAL TRANSITORIA	4	2016-12-16 18:46:01.832898	2016-12-16 18:46:01.832898
39	 ISQUEMIA CEREBRAL TRANSITORIA - SIN OTRA ESPECIFICACION	4	2016-12-16 18:46:01.836727	2016-12-16 18:46:01.836727
40	 OTROS VERTIGOS PERIFERICOS	4	2016-12-16 18:46:01.840613	2016-12-16 18:46:01.840613
41	 VERTIGO DE ORIGEN CENTRAL	4	2016-12-16 18:46:01.844843	2016-12-16 18:46:01.844843
42	 INFARTO AGUDO DEL MIOCARDIO - SIN OTRA ESPECIFICACION	4	2016-12-16 18:46:01.849021	2016-12-16 18:46:01.849021
43	 INSUFICIENCIA CARDIACA CONGESTIVA	4	2016-12-16 18:46:01.853335	2016-12-16 18:46:01.853335
44	 EMBOLIA Y TROMBOSIS DE VENA NO ESPECIFICADA	4	2016-12-16 18:46:01.857498	2016-12-16 18:46:01.857498
45	 INSUFICIENCIA VENOSA (CRONICA) (PERIFERICA)	4	2016-12-16 18:46:01.862305	2016-12-16 18:46:01.862305
46	 OTRAS DERMATITIS ATOPICAS	4	2016-12-16 18:46:01.866511	2016-12-16 18:46:01.866511
47	 LUPUS ERITEMATOSO SISTEMICO - SIN OTRA ESPECIFICACION	4	2016-12-16 18:46:01.871214	2016-12-16 18:46:01.871214
48	 LUMBAGO CON CIATICA	4	2016-12-16 18:46:01.875545	2016-12-16 18:46:01.875545
49	 INSUFICIENCIA RENAL CRONICA - NO ESPECIFICADA	4	2016-12-16 18:46:01.879854	2016-12-16 18:46:01.879854
50	 TRAUMATISMO DE LA CABEZA NO ESPECIFICADO	4	2016-12-16 18:46:01.883688	2016-12-16 18:46:01.883688
51	 TRASPLANTE DE CORAZON	4	2016-12-16 18:46:01.887691	2016-12-16 18:46:01.887691
52	 TRASTORNO HEMORRAGICO DEBIDO A ANTICOAGULANTES CIRCULANTES	4	2016-12-16 18:46:01.891691	2016-12-16 18:46:01.891691
53	 HIPOGLICEMIA SIN COMA - INDUCIDA POR DROGAS	4	2016-12-16 18:46:01.896232	2016-12-16 18:46:01.896232
54	 OTRAS EPILEPSIAS	4	2016-12-16 18:46:01.900885	2016-12-16 18:46:01.900885
55	 MIGRA&#209;A  COMPLICADA	4	2016-12-16 18:46:01.905417	2016-12-16 18:46:01.905417
56	 SINDROME DE CEFALEA EN RACIMOS	4	2016-12-16 18:46:01.90966	2016-12-16 18:46:01.90966
57	 PARALISIS DE BELL	4	2016-12-16 18:46:01.91365	2016-12-16 18:46:01.91365
58	 POLINEUROPATIA - NO ESPECIFICADA	4	2016-12-16 18:46:01.917703	2016-12-16 18:46:01.917703
59	 MIOPATIA - NO ESPECIFICADA	4	2016-12-16 18:46:01.921834	2016-12-16 18:46:01.921834
60	 MONOPLEJIA DEL MIEMBRO INFERIOR	4	2016-12-16 18:46:01.925833	2016-12-16 18:46:01.925833
61	 OTROS TRASTORNOS ESPECIFICADOS DEL PARPADO	4	2016-12-16 18:46:01.930046	2016-12-16 18:46:01.930046
62	 HEMORRAGIA CONJUNTIVAL	4	2016-12-16 18:46:01.93419	2016-12-16 18:46:01.93419
63	 TINNITUS	4	2016-12-16 18:46:01.938641	2016-12-16 18:46:01.938641
64	 ENFERMEDAD RENAL HIPERTENSIVA CON INSUFICIENCIA RENAL	4	2016-12-16 18:46:01.943074	2016-12-16 18:46:01.943074
65	 INFARTO TRANSMURAL AGUDO DEL MIOCARDIO DE LA PARED INFERIOR	4	2016-12-16 18:46:01.947524	2016-12-16 18:46:01.947524
66	 INFARTO SUBSECUENTE DEL MIOCARDIO DE LA PARED INFERIOR	4	2016-12-16 18:46:01.951535	2016-12-16 18:46:01.951535
67	 CARDIOMIOPATIA ISQUEMICA	4	2016-12-16 18:46:01.955777	2016-12-16 18:46:01.955777
68	 MIOCARDITIS AGUDA - NO ESPECIFICADA	4	2016-12-16 18:46:01.959827	2016-12-16 18:46:01.959827
69	 BLOQUEO AURICULOVENTRICULAR DE SEGUNDO GRADO	4	2016-12-16 18:46:01.963783	2016-12-16 18:46:01.963783
70	 TAQUICARDIA PAROXISTICA - NO ESPECIFICADA	4	2016-12-16 18:46:01.96765	2016-12-16 18:46:01.96765
71	 FIBRILACION Y ALETEO AURICULAR	4	2016-12-16 18:46:01.97228	2016-12-16 18:46:01.97228
72	 HEMORRAGIA SUBARACNOIDEA - NO ESPECIFICADA	4	2016-12-16 18:46:01.97691	2016-12-16 18:46:01.97691
73	 HEMORRAGIA INTRACEREBRAL EN HEMISFERIO - NO ESPECIFICADA	4	2016-12-16 18:46:01.980952	2016-12-16 18:46:01.980952
74	 SECUELAS DE ENFERMEDAD CEREBROVASCULAR - NO ESPECIFICADA COMO HEMORRAGICA U OCLUS	4	2016-12-16 18:46:01.984913	2016-12-16 18:46:01.984913
75	 ATEROSCLEROSIS DE LAS ARTERIAS DE LOS MIEMBROS	4	2016-12-16 18:46:01.989269	2016-12-16 18:46:01.989269
76	 ANEURISMA DE LA AORTA TORACICA - SIN MENCION DE RUPTURA	4	2016-12-16 18:46:01.993126	2016-12-16 18:46:01.993126
77	 ENFERMEDAD VASCULAR PERIFERICA - NO ESPECIFICADA	4	2016-12-16 18:46:01.997471	2016-12-16 18:46:01.997471
78	 TRASTORNOS DE ARTERIAS Y ARTERIOLAS - NO ESPECIFICADO	4	2016-12-16 18:46:02.001602	2016-12-16 18:46:02.001602
79	 FLEBITIS Y TROMBOFLEBITIS DE   LOS MIEMBROS INFERIORES - NO ESPECIFICADA	4	2016-12-16 18:46:02.006184	2016-12-16 18:46:02.006184
80	 VENAS VARICOSAS DE LOS MIEMBROS INFERIORES CON INFLAMACION	4	2016-12-16 18:46:02.01135	2016-12-16 18:46:02.01135
81	 NEUMONIA  BACTERIANA - NO ESPECIFICADA	4	2016-12-16 18:46:02.015599	2016-12-16 18:46:02.015599
82	 BRONQUITIS AGUDA DEBIDA A OTROS MICROORGANISMOS ESPECIFICADOS	4	2016-12-16 18:46:02.019643	2016-12-16 18:46:02.019643
83	 INSUFICIENCIA RESPIRATORIA AGUDA	4	2016-12-16 18:46:02.023815	2016-12-16 18:46:02.023815
84	 OTRAS GASTRITIS AGUDAS	4	2016-12-16 18:46:02.027882	2016-12-16 18:46:02.027882
85	 HEMORRAGIA GASTROINTESTINAL - NO ESPECIFICADA	4	2016-12-16 18:46:02.031783	2016-12-16 18:46:02.031783
86	 CELULITIS DE OTRAS PARTES DE LOS MIEMBROS	4	2016-12-16 18:46:02.036368	2016-12-16 18:46:02.036368
87	 CELULITIS DE SITIO NO ESPECIFICADO	4	2016-12-16 18:46:02.040478	2016-12-16 18:46:02.040478
88	 LUPUS ERITEMATOSO SISTEMICO CON COMPROMISO DE ORGANOS O SISTEMAS	4	2016-12-16 18:46:02.044542	2016-12-16 18:46:02.044542
89	 LUMBAGO NO ESPECIFICADO	4	2016-12-16 18:46:02.051021	2016-12-16 18:46:02.051021
90	 SINDROME NEFRITICO AGUDO: GLOMERULONEFRITIS PROLIFERATIVA MESANGIAL DIFUSA	4	2016-12-16 18:46:02.05503	2016-12-16 18:46:02.05503
91	 SINDROME NEFRITICO AGUDO: OTRAS	4	2016-12-16 18:46:02.059684	2016-12-16 18:46:02.059684
92	 SINDROME NEFRITICO CRONICO: LESIONES GLOMERULARES FOCALES Y SEGMENTARIAS	4	2016-12-16 18:46:02.063756	2016-12-16 18:46:02.063756
93	 SINDROME NEFROTICO: ANOMALIA GLOMERULAR MINIMA	4	2016-12-16 18:46:02.071033	2016-12-16 18:46:02.071033
94	 PROTEINURIA AISLADA CON LESION MORFOLOGICA ESPECIFICADA: GLOMERULONEFRITIS MESAN	4	2016-12-16 18:46:02.075222	2016-12-16 18:46:02.075222
95	 TRASTORNOS GLOMERULARES EN  OTRAS ENFERMEDADES CLASIFICADAS EN OTRA PARTE	4	2016-12-16 18:46:02.080049	2016-12-16 18:46:02.080049
96	 INFECCION DE VIAS URINARIAS SITIO NO ESPECIFICADO	4	2016-12-16 18:46:02.084226	2016-12-16 18:46:02.084226
97	 TAQUICARDIA NO ESPECIFICADA	4	2016-12-16 18:46:02.088707	2016-12-16 18:46:02.088707
98	 BRADICARDIA - NO ESPECIFICADA	4	2016-12-16 18:46:02.093152	2016-12-16 18:46:02.093152
99	 PALPITACIONES	4	2016-12-16 18:46:02.097165	2016-12-16 18:46:02.097165
100	 EPISTAXIS	4	2016-12-16 18:46:02.10178	2016-12-16 18:46:02.10178
101	 TOS	4	2016-12-16 18:46:02.105803	2016-12-16 18:46:02.105803
102	 DOLOR LOCALIZADO EN OTRAS PARTES INFERIORES DEL ABDOMEN	4	2016-12-16 18:46:02.110121	2016-12-16 18:46:02.110121
103	 OTROS DOLORES ABDOMINALES Y LOS NO ESPECIFICADOS	4	2016-12-16 18:46:02.115602	2016-12-16 18:46:02.115602
104	 DESORIENTACION NO  ESPECIFICADA	4	2016-12-16 18:46:02.119676	2016-12-16 18:46:02.119676
105	 MAREO Y DESVANECIMIENTO	4	2016-12-16 18:46:02.123653	2016-12-16 18:46:02.123653
106	 TRAUMATISMO SUPERFICIAL DE OTRAS PARTES DE LA CABEZA	4	2016-12-16 18:46:02.127879	2016-12-16 18:46:02.127879
107	 TRAUMATISMO CEREBRAL FOCAL	4	2016-12-16 18:46:02.131879	2016-12-16 18:46:02.131879
108	 OTROS TRAUMATISMOS INTRACRANEALES	4	2016-12-16 18:46:02.136578	2016-12-16 18:46:02.136578
109	 TRAUMATISMO INTRACRANEAL - NO ESPECIFICADO	4	2016-12-16 18:46:02.140681	2016-12-16 18:46:02.140681
110	 COMPLICACION MECANICA DE CATETER PARA DIALISIS VASCULAR	4	2016-12-16 18:46:02.145362	2016-12-16 18:46:02.145362
111	 EXAMEN MEDICO GENERAL	4	2016-12-16 18:46:02.150023	2016-12-16 18:46:02.150023
112	 TRASPLANTE DE RIÑON	4	2016-12-16 18:46:02.153979	2016-12-16 18:46:02.153979
113	 ANEURISMA CEREBRAL - SIN RUPTURA	5	2016-12-16 18:46:02.158209	2016-12-16 18:46:02.158209
114	 MALFORMACION ARTERIOVENOSA DE LOS VASOS CEREBRALES	5	2016-12-16 18:46:02.162355	2016-12-16 18:46:02.162355
115	 ANGINA INESTABLE	5	2016-12-16 18:46:02.167506	2016-12-16 18:46:02.167506
116	 TINNITUS	5	2016-12-16 18:46:02.171723	2016-12-16 18:46:02.171723
117	 INFARTO SUBENDOCARDICO AGUDO DEL MIOCARDIO	5	2016-12-16 18:46:02.176293	2016-12-16 18:46:02.176293
118	 INFARTO CEREBRAL DEBIDO A TROMBOSIS DE ARTERIAS CEREBRALES	5	2016-12-16 18:46:02.180245	2016-12-16 18:46:02.180245
119	 MALFORMACION ARTERIOVENOSA DE LOS VASOS PRECEREBRALES	5	2016-12-16 18:46:02.18461	2016-12-16 18:46:02.18461
120	 OTRAS FORMAS ESPECIFICADAS DE ANGINA DE PECHO	5	2016-12-16 18:46:02.188733	2016-12-16 18:46:02.188733
121	 INFARTO AGUDO DEL MIOCARDIO - SIN OTRA ESPECIFICACION	5	2016-12-16 18:46:02.192799	2016-12-16 18:46:02.192799
122	 HEMORRAGIA INTRACEREBRAL EN HEMISFERIO - NO ESPECIFICADA	5	2016-12-16 18:46:02.196745	2016-12-16 18:46:02.196745
123	 ACCIDENTE VASCULAR ENCEFALICO AGUDO - NO ESPECIFICADO COMO HEMORRAGICO O ISQUEMIC	5	2016-12-16 18:46:02.200744	2016-12-16 18:46:02.200744
124	 NEUMONIA  BACTERIANA - NO ESPECIFICADA	5	2016-12-16 18:46:02.204955	2016-12-16 18:46:02.204955
125	 INSUFICIENCIA (DE LA VALVULA) MITRAL	5	2016-12-16 18:46:02.208893	2016-12-16 18:46:02.208893
126	 CARDIOMIOPATIA DILATADA	5	2016-12-16 18:46:02.213254	2016-12-16 18:46:02.213254
127	 INSUFICIENCIA CARDIACA CONGESTIVA	5	2016-12-16 18:46:02.217103	2016-12-16 18:46:02.217103
128	 DISECCION DE ARTERIAS CEREBRALES - SIN RUPTURA	5	2016-12-16 18:46:02.221411	2016-12-16 18:46:02.221411
129	 FISTULA ARTERIOVENOSA - ADQUIRIDA	5	2016-12-16 18:46:02.225722	2016-12-16 18:46:02.225722
130	 EDEMA PULMONAR	5	2016-12-16 18:46:02.229721	2016-12-16 18:46:02.229721
131	 OTRAS FORMAS  DE ESCLEROSIS SISTEMICA	5	2016-12-16 18:46:02.234569	2016-12-16 18:46:02.234569
132	 TRASPLANTE DE CORAZON	5	2016-12-16 18:46:02.238735	2016-12-16 18:46:02.238735
133	 AMNESIA GLOBAL TRANSITORIA	5	2016-12-16 18:46:02.242873	2016-12-16 18:46:02.242873
134	 HIPERTENSION ESENCIAL (PRIMARIA)	5	2016-12-16 18:46:02.24679	2016-12-16 18:46:02.24679
135	 ANGINA DE PECHO - NO ESPECIFICADA	5	2016-12-16 18:46:02.250747	2016-12-16 18:46:02.250747
136	 INFARTO TRANSMURAL AGUDO DEL MIOCARDIO - DE SITIO NO ESPECIFICADO	5	2016-12-16 18:46:02.256558	2016-12-16 18:46:02.256558
137	 ENFERMEDAD ATEROSCLEROTICA DEL CORAZON	5	2016-12-16 18:46:02.260684	2016-12-16 18:46:02.260684
138	 CARDIOMIOPATIA ISQUEMICA	5	2016-12-16 18:46:02.264678	2016-12-16 18:46:02.264678
139	 ESTENOSIS (DE LA VALVULA) AORTICA	5	2016-12-16 18:46:02.268693	2016-12-16 18:46:02.268693
140	 FIBRILACION Y ALETEO AURICULAR	5	2016-12-16 18:46:02.272983	2016-12-16 18:46:02.272983
141	 HEMORRAGIA SUBARACNOIDEA DE ARTERIA COMUNICANTE POSTERIOR	5	2016-12-16 18:46:02.27868	2016-12-16 18:46:02.27868
142	 OTROS INFARTOS CEREBRALES	5	2016-12-16 18:46:02.282865	2016-12-16 18:46:02.282865
143	 OCLUSION Y ESTENOSIS DE ARTERIA CAROTIDA	5	2016-12-16 18:46:02.286921	2016-12-16 18:46:02.286921
144	 ENFERMEDAD CEREBROVASCULAR - NO ESPECIFICADA	5	2016-12-16 18:46:02.292711	2016-12-16 18:46:02.292711
145	 MALFORMACION ARTERIOVENOSA PERIFERICA	5	2016-12-16 18:46:02.296959	2016-12-16 18:46:02.296959
146	 EPISTAXIS	5	2016-12-16 18:46:02.30093	2016-12-16 18:46:02.30093
147	 CEFALEA	5	2016-12-16 18:46:02.305043	2016-12-16 18:46:02.305043
148	 CARDIOMIOPATIA ISQUEMICA	6	2016-12-16 18:46:02.3114	2016-12-16 18:46:02.3114
149	 ENFERMEDAD VASCULAR PERIFERICA - NO ESPECIFICADA	6	2016-12-16 18:46:02.316963	2016-12-16 18:46:02.316963
150	 HIPERTENSION ESENCIAL (PRIMARIA)	6	2016-12-16 18:46:02.321028	2016-12-16 18:46:02.321028
151	 INFARTO AGUDO DEL MIOCARDIO - SIN OTRA ESPECIFICACION	6	2016-12-16 18:46:02.325679	2016-12-16 18:46:02.325679
152	 ANEURISMA CEREBRAL - SIN RUPTURA	6	2016-12-16 18:46:02.32971	2016-12-16 18:46:02.32971
153	 DOLOR EN EL PECHO - NO ESPECIFICADO	6	2016-12-16 18:46:02.334057	2016-12-16 18:46:02.334057
154	 ANGINA INESTABLE	6	2016-12-16 18:46:02.338057	2016-12-16 18:46:02.338057
155	 INSUFICIENCIA CARDIACA CONGESTIVA	6	2016-12-16 18:46:02.341914	2016-12-16 18:46:02.341914
156	 ANGINA DE PECHO - NO ESPECIFICADA	6	2016-12-16 18:46:02.345755	2016-12-16 18:46:02.345755
157	 INFARTO TRANSMURAL AGUDO DEL MIOCARDIO - DE SITIO NO ESPECIFICADO	6	2016-12-16 18:46:02.349708	2016-12-16 18:46:02.349708
158	 ENFERMEDAD CARDIOVASCULAR ATEROSCLEROTICA - ASI DESCRITA	6	2016-12-16 18:46:02.353616	2016-12-16 18:46:02.353616
159	 OCLUSION Y ESTENOSIS DE ARTERIA CAROTIDA	6	2016-12-16 18:46:02.357591	2016-12-16 18:46:02.357591
160	 INSUFICIENCIA RENAL AGUDA CON NECROSIS TUBULAR	6	2016-12-16 18:46:02.3618	2016-12-16 18:46:02.3618
161	 DEFECTO DEL TABIQUE AURICULAR	6	2016-12-16 18:46:02.366488	2016-12-16 18:46:02.366488
162	 ENFERMEDAD ATEROSCLEROTICA DEL CORAZON	6	2016-12-16 18:46:02.371161	2016-12-16 18:46:02.371161
163	 TAQUICARDIA VENTRICULAR	6	2016-12-16 18:46:02.375399	2016-12-16 18:46:02.375399
164	 ACCIDENTE VASCULAR ENCEFALICO AGUDO - NO ESPECIFICADO COMO HEMORRAGICO O ISQUEMIC	6	2016-12-16 18:46:02.379429	2016-12-16 18:46:02.379429
165	 ATEROSCLEROSIS DE LAS ARTERIAS DE LOS MIEMBROS	6	2016-12-16 18:46:02.38359	2016-12-16 18:46:02.38359
166	 ESTRECHEZ ARTERIAL	6	2016-12-16 18:46:02.389525	2016-12-16 18:46:02.389525
167	 EMBOLIA Y TROMBOSIS DE VENA CAVA	6	2016-12-16 18:46:02.393639	2016-12-16 18:46:02.393639
168	 COARTACION DE LA AORTA	6	2016-12-16 18:46:02.39754	2016-12-16 18:46:02.39754
169	 DOLOR PRECORDIAL	6	2016-12-16 18:46:02.40217	2016-12-16 18:46:02.40217
170	 DIABETES MELLITUS NO INSULINODEPENDIENTE CON OTRAS COMPLICACIONES ESPECIFICADAS	6	2016-12-16 18:46:02.406038	2016-12-16 18:46:02.406038
171	 OTRAS ISQUEMIAS CEREBRALES TRANSITORIAS Y SINDROMES AFINES	6	2016-12-16 18:46:02.410337	2016-12-16 18:46:02.410337
172	 ESPASMO HEMIFACIAL CLONICO	6	2016-12-16 18:46:02.414535	2016-12-16 18:46:02.414535
255	 INFECCION BACTERIANA - NO ESPECIFICADA	7	2016-12-16 18:46:02.777964	2016-12-16 18:46:02.777964
173	 TROMBOSIS CORONARIA QUE NO RESULTA EN INFARTO DEL MIOCARDIO	6	2016-12-16 18:46:02.419579	2016-12-16 18:46:02.419579
174	 HEMORRAGIA SUBDURAL (AGUDA) (NO TRAUMATICA)	6	2016-12-16 18:46:02.424165	2016-12-16 18:46:02.424165
175	 ENFERMEDAD CEREBROVASCULAR - NO ESPECIFICADA	6	2016-12-16 18:46:02.42828	2016-12-16 18:46:02.42828
176	 ATEROSCLEROSIS DE LA ARTERIA RENAL	6	2016-12-16 18:46:02.434286	2016-12-16 18:46:02.434286
177	 ANEURISMA DE LA AORTA ABDOMINAL - SIN MENCION DE RUPTURA	6	2016-12-16 18:46:02.440235	2016-12-16 18:46:02.440235
178	 EMBOLIA Y TROMBOSIS DE ARTERIA ILIACA	6	2016-12-16 18:46:02.444296	2016-12-16 18:46:02.444296
179	 FISTULA ARTERIOVENOSA - ADQUIRIDA	6	2016-12-16 18:46:02.448272	2016-12-16 18:46:02.448272
180	 EMBOLIA Y TROMBOSIS DE OTRAS VENAS ESPECIFICADAS	6	2016-12-16 18:46:02.452176	2016-12-16 18:46:02.452176
181	 EDEMA PULMONAR	6	2016-12-16 18:46:02.456246	2016-12-16 18:46:02.456246
182	 MALFORMACION ARTERIOVENOSA DE LOS VASOS CEREBRALES	6	2016-12-16 18:46:02.460348	2016-12-16 18:46:02.460348
183	 COMPLICACION MECANICA DE CATETER PARA DIALISIS VASCULAR	6	2016-12-16 18:46:02.464659	2016-12-16 18:46:02.464659
184	 PRESENCIA DE ANGIOPLASTIA - INJERTOS Y PROTESIS CARDIOVASCULARES	6	2016-12-16 18:46:02.469288	2016-12-16 18:46:02.469288
185	 DEPENDENCIA DE DIALISIS RENAL	6	2016-12-16 18:46:02.479333	2016-12-16 18:46:02.479333
186	 VASCULAR	6	2016-12-16 18:46:02.48365	2016-12-16 18:46:02.48365
187	 INFARTO AGUDO DEL MIOCARDIO - SIN OTRA ESPECIFICACION	7	2016-12-16 18:46:02.487622	2016-12-16 18:46:02.487622
188	 DOLOR EN EL PECHO - NO ESPECIFICADO	7	2016-12-16 18:46:02.491745	2016-12-16 18:46:02.491745
189	 ANGINA INESTABLE	7	2016-12-16 18:46:02.496443	2016-12-16 18:46:02.496443
190	 INSUFICIENCIA CARDIACA CONGESTIVA	7	2016-12-16 18:46:02.500482	2016-12-16 18:46:02.500482
191	 ENFERMEDAD CEREBROVASCULAR - NO ESPECIFICADA	7	2016-12-16 18:46:02.504964	2016-12-16 18:46:02.504964
192	 HIPERTENSION ESENCIAL (PRIMARIA)	7	2016-12-16 18:46:02.508987	2016-12-16 18:46:02.508987
193	 CARDIOMIOPATIA ISQUEMICA	7	2016-12-16 18:46:02.513039	2016-12-16 18:46:02.513039
194	 ANGINA DE PECHO - NO ESPECIFICADA	7	2016-12-16 18:46:02.516945	2016-12-16 18:46:02.516945
195	 ENFERMEDAD ATEROSCLEROTICA DEL CORAZON	7	2016-12-16 18:46:02.520879	2016-12-16 18:46:02.520879
196	 INFARTO AGUDO TRANSMURAL DEL MIOCARDIO DE OTROS SITIOS	7	2016-12-16 18:46:02.524906	2016-12-16 18:46:02.524906
197	 INFARTO SUBENDOCARDICO AGUDO DEL MIOCARDIO	7	2016-12-16 18:46:02.529227	2016-12-16 18:46:02.529227
198	 ENFERMEDAD CARDIOVASCULAR ATEROSCLEROTICA - ASI DESCRITA	7	2016-12-16 18:46:02.533013	2016-12-16 18:46:02.533013
199	 ANEURISMA CEREBRAL - SIN RUPTURA	7	2016-12-16 18:46:02.537024	2016-12-16 18:46:02.537024
200	 INFARTO TRANSMURAL AGUDO DEL MIOCARDIO DE LA PARED ANTERIOR	7	2016-12-16 18:46:02.541411	2016-12-16 18:46:02.541411
201	 ESTENOSIS (DE LA VALVULA) AORTICA	7	2016-12-16 18:46:02.545346	2016-12-16 18:46:02.545346
202	 FIBRILACION Y ALETEO AURICULAR	7	2016-12-16 18:46:02.549221	2016-12-16 18:46:02.549221
203	 SINCOPE Y COLAPSO	7	2016-12-16 18:46:02.553281	2016-12-16 18:46:02.553281
204	 INFARTO CEREBRAL - NO ESPECIFICADO	7	2016-12-16 18:46:02.557689	2016-12-16 18:46:02.557689
205	 ISQUEMIA CEREBRAL TRANSITORIA - SIN OTRA ESPECIFICACION	7	2016-12-16 18:46:02.561606	2016-12-16 18:46:02.561606
206	 INFARTO TRANSMURAL AGUDO DEL MIOCARDIO - DE SITIO NO ESPECIFICADO	7	2016-12-16 18:46:02.565723	2016-12-16 18:46:02.565723
207	 ACCIDENTE VASCULAR ENCEFALICO AGUDO - NO ESPECIFICADO COMO HEMORRAGICO O ISQUEMIC	7	2016-12-16 18:46:02.570143	2016-12-16 18:46:02.570143
208	 EPISTAXIS	7	2016-12-16 18:46:02.574235	2016-12-16 18:46:02.574235
209	 INFARTO TRANSMURAL AGUDO DEL MIOCARDIO DE LA PARED INFERIOR	7	2016-12-16 18:46:02.579904	2016-12-16 18:46:02.579904
210	 DISNEA	7	2016-12-16 18:46:02.584033	2016-12-16 18:46:02.584033
211	 DOLOR PRECORDIAL	7	2016-12-16 18:46:02.587945	2016-12-16 18:46:02.587945
212	 OTROS ESTADOS POSTQUIRURGICOS ESPECIFICADOS	7	2016-12-16 18:46:02.591669	2016-12-16 18:46:02.591669
213	 INSUFICIENCIA (DE LA VALVULA) AORTICA	7	2016-12-16 18:46:02.595703	2016-12-16 18:46:02.595703
214	 OTRAS FORMAS ESPECIFICADAS DE ANGINA DE PECHO	7	2016-12-16 18:46:02.599967	2016-12-16 18:46:02.599967
215	 CEFALEA	7	2016-12-16 18:46:02.603834	2016-12-16 18:46:02.603834
216	 PRESENCIA DE VALVULA CARDIACA PROTESICA	7	2016-12-16 18:46:02.608061	2016-12-16 18:46:02.608061
217	 AMAUROSIS FUGAZ	7	2016-12-16 18:46:02.611963	2016-12-16 18:46:02.611963
218	 ENDOCARDITIS AGUDA - NO ESPECIFICADA	7	2016-12-16 18:46:02.616511	2016-12-16 18:46:02.616511
219	 HEMORRAGIA INTRAENCEFALICA - NO ESPECIFICADA	7	2016-12-16 18:46:02.620641	2016-12-16 18:46:02.620641
220	 ATEROSCLEROSIS DE LAS ARTERIAS DE LOS MIEMBROS	7	2016-12-16 18:46:02.624713	2016-12-16 18:46:02.624713
221	 DISECCION DE AORTA (CUALQUIER PARTE)	7	2016-12-16 18:46:02.628595	2016-12-16 18:46:02.628595
222	 ANEURISMA DE LA AORTA ABDOMINAL - SIN MENCION DE RUPTURA	7	2016-12-16 18:46:02.632559	2016-12-16 18:46:02.632559
223	 EMBOLIA Y TROMBOSIS DE ARTERIAS DE LOS MIEMBROS SUPERIORES	7	2016-12-16 18:46:02.63656	2016-12-16 18:46:02.63656
224	 EMBOLIA Y TROMBOSIS DE ARTERIAS DE LOS MIEMBROS INFERIORES	7	2016-12-16 18:46:02.64074	2016-12-16 18:46:02.64074
225	 MALFORMACION CONGENITA DEL TABIQUE CARDIACO - NO ESPECIFICADA	7	2016-12-16 18:46:02.644824	2016-12-16 18:46:02.644824
226	 INFARTO SUBSECUENTE DEL MIOCARDIO DE PARTE NO ESPECIFICADA	7	2016-12-16 18:46:02.649185	2016-12-16 18:46:02.649185
227	 BLOQUEO AURICULOVENTRICULAR COMPLETO	7	2016-12-16 18:46:02.653085	2016-12-16 18:46:02.653085
228	 INSUFICIENCIA CARDIACA - NO ESPECIFICADA	7	2016-12-16 18:46:02.658978	2016-12-16 18:46:02.658978
229	 HEMORRAGIA SUBARACNOIDEA DE ARTERIA CEREBRAL MEDIA	7	2016-12-16 18:46:02.663379	2016-12-16 18:46:02.663379
230	 HEMORRAGIA SUBARACNOIDEA DE ARTERIA COMUNICANTE POSTERIOR	7	2016-12-16 18:46:02.667473	2016-12-16 18:46:02.667473
231	 OCLUSION Y ESTENOSIS DE ARTERIA CAROTIDA	7	2016-12-16 18:46:02.671587	2016-12-16 18:46:02.671587
232	 OTROS TRASTORNOS ESPECIFICADOS DE ARTERIAS Y ARTERIOLAS	7	2016-12-16 18:46:02.675716	2016-12-16 18:46:02.675716
233	 DERRAME PLEURAL NO CLASIFICADO EN OTRA PARTE	7	2016-12-16 18:46:02.679614	2016-12-16 18:46:02.679614
234	 INFECCION LOCAL DE LA PIEL Y DEL TEJIDO SUBCUTANEO - NO ESPECIFICADA	7	2016-12-16 18:46:02.683781	2016-12-16 18:46:02.683781
235	 OTROS DOLORES ABDOMINALES Y LOS NO ESPECIFICADOS	7	2016-12-16 18:46:02.689009	2016-12-16 18:46:02.689009
236	 OTRAS CONVULSIONES  Y LAS NO ESPECIFICADAS	7	2016-12-16 18:46:02.693506	2016-12-16 18:46:02.693506
237	 TRASPLANTE DE CORAZON	7	2016-12-16 18:46:02.697779	2016-12-16 18:46:02.697779
238	 DIARREA Y GASTROENTERITIS DE PRESUNTO ORIGEN INFECCIOSO	7	2016-12-16 18:46:02.702295	2016-12-16 18:46:02.702295
239	 HIPOTIROIDISMO NO ESPECIFICADO	7	2016-12-16 18:46:02.706297	2016-12-16 18:46:02.706297
240	 OTROS VERTIGOS PERIFERICOS	7	2016-12-16 18:46:02.710227	2016-12-16 18:46:02.710227
241	 VERTIGO DE ORIGEN CENTRAL	7	2016-12-16 18:46:02.714735	2016-12-16 18:46:02.714735
242	 ENFERMEDAD ISQUEMICA AGUDA DEL CORAZON - NO ESPECIFICADA	7	2016-12-16 18:46:02.719394	2016-12-16 18:46:02.719394
243	 ENFERMEDAD PULMONAR DEL CORAZON - NO ESPECIFICADA	7	2016-12-16 18:46:02.723971	2016-12-16 18:46:02.723971
244	 DERRAME PERICARDICO (NO INFLAMATORIO)	7	2016-12-16 18:46:02.730156	2016-12-16 18:46:02.730156
245	 TAQUICARDIA SUPRAVENTRICULAR	7	2016-12-16 18:46:02.733945	2016-12-16 18:46:02.733945
246	 HEMORRAGIA SUBARACNOIDEA DE ARTERIA COMUNICANTE ANTERIOR	7	2016-12-16 18:46:02.737798	2016-12-16 18:46:02.737798
247	 HEMORRAGIA SUBARACNOIDEA - NO ESPECIFICADA	7	2016-12-16 18:46:02.741775	2016-12-16 18:46:02.741775
248	 INFARTO CEREBRAL DEBIDO A TROMBOSIS DE ARTERIAS PRECEREBRALES	7	2016-12-16 18:46:02.746008	2016-12-16 18:46:02.746008
249	 FISTULA ARTERIOVENOSA - ADQUIRIDA	7	2016-12-16 18:46:02.75073	2016-12-16 18:46:02.75073
250	 OTROS TRASTORNOS DEL PULMON	7	2016-12-16 18:46:02.754968	2016-12-16 18:46:02.754968
251	 HEMORRAGIA GASTROINTESTINAL - NO ESPECIFICADA	7	2016-12-16 18:46:02.760667	2016-12-16 18:46:02.760667
252	 CELULITIS DE LA CARA	7	2016-12-16 18:46:02.764599	2016-12-16 18:46:02.764599
253	 PRESENCIA DE ANGIOPLASTIA - INJERTOS Y PROTESIS CARDIOVASCULARES	7	2016-12-16 18:46:02.768586	2016-12-16 18:46:02.768586
254	 SEPTICEMIA DEBIDA A OTROS ORGANISMOS GRAMNEGATIVOS	7	2016-12-16 18:46:02.773397	2016-12-16 18:46:02.773397
256	 ENCEFALITIS VIRAL - NO ESPECIFICADA	7	2016-12-16 18:46:02.781839	2016-12-16 18:46:02.781839
257	 OTRAS DIABETES MELLITUS ESPECIFICADAS CON CETOACIDOSIS	7	2016-12-16 18:46:02.786289	2016-12-16 18:46:02.786289
258	 DIABETES MELLITUS - NO ESPECIFICADA SIN MENCION DE COMPLICACION	7	2016-12-16 18:46:02.790297	2016-12-16 18:46:02.790297
259	 EPILEPSIA TIPO NO ESPECIFICADO	7	2016-12-16 18:46:02.794644	2016-12-16 18:46:02.794644
260	 CEFALEA VASCULAR NCOP	7	2016-12-16 18:46:02.799712	2016-12-16 18:46:02.799712
261	 OTROS SINDROMES DE CEFALEA ESPECIFICADOS	7	2016-12-16 18:46:02.804348	2016-12-16 18:46:02.804348
262	 DIPLOPIA	7	2016-12-16 18:46:02.808372	2016-12-16 18:46:02.808372
263	 TRASTORNOS DE LAS VALVULAS MITRAL Y AORTICA	7	2016-12-16 18:46:02.812334	2016-12-16 18:46:02.812334
264	 ENFERMEDAD RENAL HIPERTENSIVA CON INSUFICIENCIA RENAL	7	2016-12-16 18:46:02.816569	2016-12-16 18:46:02.816569
265	 INFARTO SUBSECUENTE DEL MIOCARDIO DE LA PARED INFERIOR	7	2016-12-16 18:46:02.82068	2016-12-16 18:46:02.82068
266	 TROMBOSIS CORONARIA QUE NO RESULTA EN INFARTO DEL MIOCARDIO	7	2016-12-16 18:46:02.824541	2016-12-16 18:46:02.824541
267	 INSUFICIENCIA (DE LA VALVULA) MITRAL	7	2016-12-16 18:46:02.82864	2016-12-16 18:46:02.82864
268	 ESTENOSIS (DE LA VALVULA) AORTICA CON INSUFICIENCIA	7	2016-12-16 18:46:02.832583	2016-12-16 18:46:02.832583
269	 OTROS TRASTORNOS DE LA VALVULA AORTICA	7	2016-12-16 18:46:02.836534	2016-12-16 18:46:02.836534
270	 TRASTORNOS DE LA VALVULA AORTICA EN ENFERMEDADES CLASIFICADAS EN OTRA PARTE	7	2016-12-16 18:46:02.840694	2016-12-16 18:46:02.840694
271	 MIOCARDITIS AGUDA - NO ESPECIFICADA	7	2016-12-16 18:46:02.844655	2016-12-16 18:46:02.844655
272	 TAQUICARDIA PAROXISTICA - NO ESPECIFICADA	7	2016-12-16 18:46:02.84869	2016-12-16 18:46:02.84869
273	 ATEROSCLEROSIS DE LA ARTERIA RENAL	7	2016-12-16 18:46:02.852827	2016-12-16 18:46:02.852827
274	 ENFERMEDAD VASCULAR PERIFERICA - NO ESPECIFICADA	7	2016-12-16 18:46:02.856867	2016-12-16 18:46:02.856867
275	 EMBOLIA Y TROMBOSIS DE ARTERIAS DE LOS MIEMBROS - NO ESPECIFICADAS	7	2016-12-16 18:46:02.860732	2016-12-16 18:46:02.860732
276	 EMBOLIA Y TROMBOSIS DE OTRAS VENAS ESPECIFICADAS	7	2016-12-16 18:46:02.864863	2016-12-16 18:46:02.864863
277	 EDEMA PULMONAR	7	2016-12-16 18:46:02.868846	2016-12-16 18:46:02.868846
278	 DOLOR EN MIEMBRO	7	2016-12-16 18:46:02.872688	2016-12-16 18:46:02.872688
279	 CONDROMALACIA	7	2016-12-16 18:46:02.87721	2016-12-16 18:46:02.87721
280	 INSUFICIENCIA RENAL AGUDA - NO ESPECIFICADA	7	2016-12-16 18:46:02.881148	2016-12-16 18:46:02.881148
281	 INSUFICIENCIA RENAL TERMINAL	7	2016-12-16 18:46:02.885072	2016-12-16 18:46:02.885072
282	 INSUFICIENCIA RENAL CRONICA - NO ESPECIFICADA	7	2016-12-16 18:46:02.88897	2016-12-16 18:46:02.88897
283	 INFECCION DE VIAS URINARIAS SITIO NO ESPECIFICADO	7	2016-12-16 18:46:02.892692	2016-12-16 18:46:02.892692
284	 MALFORMACION CONGENITA DEL SISTEMA NERVIOSO - NO ESPECIFICADA	7	2016-12-16 18:46:02.896643	2016-12-16 18:46:02.896643
285	 DEFECTO DEL TABIQUE AURICULAR	7	2016-12-16 18:46:02.901391	2016-12-16 18:46:02.901391
286	 TAQUICARDIA NO ESPECIFICADA	7	2016-12-16 18:46:02.905552	2016-12-16 18:46:02.905552
287	 DOLOR ABDOMINAL LOCALIZADO EN PARTE SUPERIOR	7	2016-12-16 18:46:02.909878	2016-12-16 18:46:02.909878
288	 MAREO Y DESVANECIMIENTO	7	2016-12-16 18:46:02.913935	2016-12-16 18:46:02.913935
289	 FIEBRE - NO ESPECIFICADA	7	2016-12-16 18:46:02.919573	2016-12-16 18:46:02.919573
290	 FRACTURA DE ESTERNON	7	2016-12-16 18:46:02.923925	2016-12-16 18:46:02.923925
291	 EFECTOS ADVERSOS DE ANTICOAGULANTES	7	2016-12-16 18:46:02.927879	2016-12-16 18:46:02.927879
292	 RESONANCIA	8	2016-12-16 18:46:02.931933	2016-12-16 18:46:02.931933
293	 ECOGRAFIA	9	2016-12-16 18:46:02.9358	2016-12-16 18:46:02.9358
294	 RAYOS X	9	2016-12-16 18:46:02.93995	2016-12-16 18:46:02.93995
295	 MAMOGRAFIA BILATERAL	9	2016-12-16 18:46:02.944062	2016-12-16 18:46:02.944062
296	OSTEODENSITOMETRIA POR ABSORCION DUAL	9	2016-12-16 18:46:02.950366	2016-12-16 18:46:02.950366
297	 FLUROSCOPIA	9	2016-12-16 18:46:02.954291	2016-12-16 18:46:02.954291
298	 DOPPLER	9	2016-12-16 18:46:02.9585	2016-12-16 18:46:02.9585
299	 PLETISMOGRAFIA	9	2016-12-16 18:46:02.96259	2016-12-16 18:46:02.96259
300	 ESCANOGRAFIA	9	2016-12-16 18:46:02.967296	2016-12-16 18:46:02.967296
301	 BIOPSIA	9	2016-12-16 18:46:02.971137	2016-12-16 18:46:02.971137
302	CONSULTA DE PRIMERA VEZ POR MEDICINA ESPECIALIZADA: CX VASCULAR PERIFERICA	10	2016-12-16 18:46:02.975312	2016-12-16 18:46:02.975312
303	BIOPSIA ENDOMIOCARDICA	11	2016-12-16 18:46:02.979403	2016-12-16 18:46:02.979403
304	CATETERISMO IZQUIERDO + CORONARIOGRAFIA	11	2016-12-16 18:46:02.983495	2016-12-16 18:46:02.983495
305	ARTERIOGRAFIA RENAL	12	2016-12-16 18:46:02.987519	2016-12-16 18:46:02.987519
306	ENDOPROTESIS ABDOMINAL + EMBOLIZACION HIPOGASTRICAS	12	2016-12-16 18:46:02.991867	2016-12-16 18:46:02.991867
307	IMPLANTE DE CATETER HEMODIALISIS (TRANSLUMBAR)	12	2016-12-16 18:46:02.997137	2016-12-16 18:46:02.997137
308	 BIOPSIA PLEURAL POR TORACOSCOPIA	13	2016-12-16 18:46:03.001164	2016-12-16 18:46:03.001164
309	 EXTRACCION DE CUERPO EXTRAÑO EN ESCAPULA. CLAVICULA O TORAX (COSTILLAS Y ESTERNON)	13	2016-12-16 18:46:03.005234	2016-12-16 18:46:03.005234
310	 ANASTOMOSIS AORTOCORONARIA DE DOS ARTERIAS CORONARIAS	14	2016-12-16 18:46:03.010446	2016-12-16 18:46:03.010446
311	 ANASTOMOSIS AORTOCORONARIA DE TRES ARTERIAS CORONARIAS	14	2016-12-16 18:46:03.015569	2016-12-16 18:46:03.015569
312	 ANASTOMOSIS CORONARIA PARA REVASCULARIZACION CARDIACA DE UNO O MAS VASOS CON VENA SAFENA POR ESTERNOTOMIA O TORACOTOMIA	14	2016-12-16 18:46:03.019858	2016-12-16 18:46:03.019858
313	 BIOPSIA PLEURAL POR TORACOSCOPIA	14	2016-12-16 18:46:03.023783	2016-12-16 18:46:03.023783
314	 COMISUROTOMIA. VALVULOTOMEA O VALVULOPLASTIA MITRAL VIA ABIERTA	14	2016-12-16 18:46:03.02813	2016-12-16 18:46:03.02813
315	 DECORTICACION PULMONAR	14	2016-12-16 18:46:03.032025	2016-12-16 18:46:03.032025
316	 DESBRIDAMIENTO ESCISIONAL POR LESION SUPERFICIAL ENTRE EL 10% AL 20% DE SUPERFICIE CORPORAL	14	2016-12-16 18:46:03.03592	2016-12-16 18:46:03.03592
317	 ENDARTERECTOMIA DE VASOS TORACICOS	14	2016-12-16 18:46:03.040704	2016-12-16 18:46:03.040704
318	 ESCISION DE TUMOR DEL CORAZON	14	2016-12-16 18:46:03.044758	2016-12-16 18:46:03.044758
319	 RECONSTRUCION DE AORTA TORACICA ASCENDENTE	14	2016-12-16 18:46:03.048593	2016-12-16 18:46:03.048593
320	 REEMPLAZO DE LA VALVULA AORTICA CON PROTESIS MECANICA O BIOPROTESIS (AUTOLOGA O HETEROLOGA)	14	2016-12-16 18:46:03.053009	2016-12-16 18:46:03.053009
321	 REEMPLAZO DE VALVULA MITRAL CON PROTESIS O BIOPROTESIS (AUTOLOGA O HETEROLOGA)	14	2016-12-16 18:46:03.057065	2016-12-16 18:46:03.057065
322	 REEMPLAZO O RECONSTRUCCION DE DOS O TRES VALVULAS	14	2016-12-16 18:46:03.065414	2016-12-16 18:46:03.065414
323	 REINTERVENCION PARA SUSTITUCION DE PROTESIS VALVULARES	14	2016-12-16 18:46:03.069449	2016-12-16 18:46:03.069449
324	 REPARACION DE DEFECTO DE TABIQUE INTERAURICULAR CON PROTESIS	14	2016-12-16 18:46:03.07371	2016-12-16 18:46:03.07371
325	 TRAQUEOSTOMA	14	2016-12-16 18:46:03.077739	2016-12-16 18:46:03.077739
326	 TRASPLANTE CARDIACO	14	2016-12-16 18:46:03.081735	2016-12-16 18:46:03.081735
327	 COLOCACION DE CATETER VENTRICULAR AL EXTERIOR	15	2016-12-16 18:46:03.086083	2016-12-16 18:46:03.086083
328	 DRENAJE DE COLECCIONES INTRACEREBRALES. POR CRANEOTOMIA	15	2016-12-16 18:46:03.090696	2016-12-16 18:46:03.090696
329	 DRENAJE DE ESPACIO SUBDURAL CON REPARO DE SENOS DURALES ROTOS	15	2016-12-16 18:46:03.094952	2016-12-16 18:46:03.094952
330	 OCLUSION DE VENAS DE MIEMBROS INFERIORES VIA ENDOVASCULAR (UNILATERAL)	16	2016-12-16 18:46:03.099628	2016-12-16 18:46:03.099628
331	 ENDARTERECTOMIA SUPRAPATELAR	16	2016-12-16 18:46:03.103851	2016-12-16 18:46:03.103851
332	 OCLUSION. PINZAMIENTO O LIGADURA DE VENAS INTRAABDOMINALES. UNA O MAS	16	2016-12-16 18:46:03.107841	2016-12-16 18:46:03.107841
333	 RESECCION ARTERIAL SUPRAPATELAR CON INJERTO AUTOLOGO O PROTESIS 	16	2016-12-16 18:46:03.111836	2016-12-16 18:46:03.111836
334	 DECORTICACION PULMONAR	17	2016-12-16 18:46:03.116355	2016-12-16 18:46:03.116355
335	 TRASPLANTE CARDIACO	17	2016-12-16 18:46:03.121354	2016-12-16 18:46:03.121354
336	MAMOGRAFIA UNILATERAL O DE PIEZA QUIRURGICA	9	2016-12-16 18:46:03.125805	2016-12-16 18:46:03.125805
337	CONSULTA DE PRIMERA VEZ POR MEDICINA ESPECIALIZADA: NEUROLOGIA	10	2016-12-16 18:46:03.130496	2016-12-16 18:46:03.130496
338	CONSULTA DE PRIMERA VEZ POR MEDICINA ESPECIALIZADA: RADIOINTERVENCIONISMO	10	2016-12-16 18:46:03.137379	2016-12-16 18:46:03.137379
339	CITA DE CONTROL DE SEGUIMIENTO O POS OPERATORIO	10	2016-12-16 18:46:03.141723	2016-12-16 18:46:03.141723
340	CONSULTA DE CONTROL DE SEGUIMIENTO POR MEDICINA ESPECIALIZADA	10	2016-12-16 18:46:03.145863	2016-12-16 18:46:03.145863
341	CORONARIOGRAFIA RADIAL	11	2016-12-16 18:46:03.149762	2016-12-16 18:46:03.149762
342	CATETERISMO IZQ. +PTCA +STENT CONVENCIONAL CX	11	2016-12-16 18:46:03.153745	2016-12-16 18:46:03.153745
343	CORONARIOGRAFIA + PUENTES CORONARIOS + AORTOGRAMA TORACICO	11	2016-12-16 18:46:03.157727	2016-12-16 18:46:03.157727
344	IMPLANTE DE DISPOSTIVOS CIA-CIV-PFO-DUCTOS	11	2016-12-16 18:46:03.162001	2016-12-16 18:46:03.162001
345	CATETERISMO IZQUIERDO  DERECHO + GASTO CARDIACO	11	2016-12-16 18:46:03.166157	2016-12-16 18:46:03.166157
346	ANGIOPLASTIA + STENT MEDICADO CX	11	2016-12-16 18:46:03.171402	2016-12-16 18:46:03.171402
347	COLOCACION DE STENT DE COARTACION CP STENT	11	2016-12-16 18:46:03.176178	2016-12-16 18:46:03.176178
348	COLOCACION DE BALON DE CONTRAPULSACION	11	2016-12-16 18:46:03.180225	2016-12-16 18:46:03.180225
349	EXPLANTE E IMPLANTE DE CATETER DE NEFROSTOMIA BILATERAL	12	2016-12-16 18:46:03.184813	2016-12-16 18:46:03.184813
350	IMPLANTE DE GASTROSTOMIA	12	2016-12-16 18:46:03.188742	2016-12-16 18:46:03.188742
351	ANGIOPLASTIA PERIFERICA	12	2016-12-16 18:46:03.193175	2016-12-16 18:46:03.193175
352	AORTOGRAMA ABDOMINAL + MIEMBROS INFERIORES	12	2016-12-16 18:46:03.196909	2016-12-16 18:46:03.196909
353	FLEBOGRAFIA GONADAL	12	2016-12-16 18:46:03.200957	2016-12-16 18:46:03.200957
354	ARTERIOGRAFIA MIEMBRO INFERIOR IZQUIERDO	12	2016-12-16 18:46:03.204771	2016-12-16 18:46:03.204771
355	BLOQUEO FACETARIO LUMBAR	12	2016-12-16 18:46:03.208888	2016-12-16 18:46:03.208888
356	BLOQUEO FACIAL BILATERAL NERVIO OCCIPITAL	12	2016-12-16 18:46:03.213044	2016-12-16 18:46:03.213044
357	VENOGRAFIA +CAVOGRAFIA	12	2016-12-16 18:46:03.217094	2016-12-16 18:46:03.217094
358	ENDOPROTESIS TORACICA	12	2016-12-16 18:46:03.220922	2016-12-16 18:46:03.220922
359	REPARO ENDOVASCULAR  DE ANEURISMA DE AORTA TORACICA Y ABDOMINAL + FENESTRADA	12	2016-12-16 18:46:03.225065	2016-12-16 18:46:03.225065
360	EMBOLIZACION DE ANEURISMA CON STENT Y COILS	18	2016-12-16 18:46:03.22985	2016-12-16 18:46:03.22985
361	ANGIO 4 VASOS	18	2016-12-16 18:46:03.234425	2016-12-16 18:46:03.234425
362	PTCA + COLOCACION DE STENT DE CAROTIDA	18	2016-12-16 18:46:03.238717	2016-12-16 18:46:03.238717
363	ANGIO 4 VASOS + EMBOLIZACION CON MICROPARTICULAS	18	2016-12-16 18:46:03.242707	2016-12-16 18:46:03.242707
364	EMBOLIZACION MALFORMACION ARTERIOVENOSA CON ONYX	18	2016-12-16 18:46:03.247004	2016-12-16 18:46:03.247004
365	IMPLANTE DE DIVERSO DE FLUJO	18	2016-12-16 18:46:03.251027	2016-12-16 18:46:03.251027
366	ESCLEROSIS DE LESION EN VASOS SANGUINEOS X VIA PERCUTANEA	18	2016-12-16 18:46:03.255246	2016-12-16 18:46:03.255246
\.


--
-- Name: products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('products_id_seq', 366, true);


--
-- Data for Name: providers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY providers (id, name, nit, sector, created_at, updated_at) FROM stdin;
1	El Mejor Proveedor	11452364-5	Cualquiera	2016-12-16 18:46:00.039441	2016-12-16 18:46:00.039441
\.


--
-- Name: providers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('providers_id_seq', 1, false);


--
-- Data for Name: resources; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY resources (id, name, created_at, updated_at) FROM stdin;
1	Materia Prima E Insmuos	2016-12-16 18:46:09.616663	2016-12-16 18:46:09.616663
2	Mano de Obra	2016-12-16 18:46:09.620726	2016-12-16 18:46:09.620726
3	Activos	2016-12-16 18:46:09.624896	2016-12-16 18:46:09.624896
4	Apoyos	2016-12-16 18:46:09.628736	2016-12-16 18:46:09.628736
\.


--
-- Name: resources_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('resources_id_seq', 1, false);


--
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY roles (id, name, created_at, updated_at) FROM stdin;
\.


--
-- Name: roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('roles_id_seq', 1, false);


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY schema_migrations (version) FROM stdin;
20160817163455
20160817200035
20160818133343
20160818155800
20160818162320
20160818172114
20160819125950
20160819130749
20160822140701
20160822140805
20160823122351
20160823155207
20160823155208
20160825153931
20160901125633
20160906190548
20160908170539
20160909141347
20160909141429
20160909141951
20160909152050
20160909161828
20160909165330
20160912132153
20160914160909
20160916142714
20160920171203
20160922155501
20160922155502
20160922164333
20160930132723
20161004150541
20161101130223
20161101133325
20161102163110
20161102163127
20161102163132
20161110145439
20161110145524
20161115154921
20161115155050
20161122041546
20161124162445
20161130160240
20161212143856
20161212151608
\.


--
-- Data for Name: sessions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY sessions (id, time_init, time_end, user_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: sessions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('sessions_id_seq', 1, false);


--
-- Data for Name: subprocedures; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY subprocedures (id, name, procedure_id, created_at, updated_at) FROM stdin;
1	ALISTAMIENTO CARDIOLOGIA	1	2016-12-16 18:46:00.290032	2016-12-16 18:46:00.290032
2	MATRIZ RIESGOS CARDIOLOGIA	1	2016-12-16 18:46:00.294882	2016-12-16 18:46:00.294882
3	ADMISION CARDIOLOGIA	2	2016-12-16 18:46:00.299167	2016-12-16 18:46:00.299167
4	INGRESO CONSULTA CARDIOLOGIA	2	2016-12-16 18:46:00.303552	2016-12-16 18:46:00.303552
5	TOMA DE EXAMEN CARDIOLOGIA	2	2016-12-16 18:46:00.307729	2016-12-16 18:46:00.307729
6	RIESGOS CARDIOLOGIA	2	2016-12-16 18:46:00.311974	2016-12-16 18:46:00.311974
7	EDUCACION CARDIOLOGIA	2	2016-12-16 18:46:00.316615	2016-12-16 18:46:00.316615
8	ENTREGA DE RESULTADOS CARDIOLOGIA	2	2016-12-16 18:46:00.320855	2016-12-16 18:46:00.320855
9	SEGUIMIENTO CARDIOLOGIA	2	2016-12-16 18:46:00.324959	2016-12-16 18:46:00.324959
10	ALISTAMIENTO REHABILITACION	3	2016-12-16 18:46:00.32892	2016-12-16 18:46:00.32892
11	MATRIZ RIESGOS REHABILITACION	3	2016-12-16 18:46:00.333022	2016-12-16 18:46:00.333022
12	RECEPCION REHABILITACION	4	2016-12-16 18:46:00.33698	2016-12-16 18:46:00.33698
13	PROCEDIMIENTO REHABILITACION	4	2016-12-16 18:46:00.341015	2016-12-16 18:46:00.341015
14	RIESGOS REHABILITACION	4	2016-12-16 18:46:00.344924	2016-12-16 18:46:00.344924
15	PROTOCOLOS REHABILITACION	4	2016-12-16 18:46:00.349967	2016-12-16 18:46:00.349967
16	RESULTADOS REHABILITACION	4	2016-12-16 18:46:00.354877	2016-12-16 18:46:00.354877
17	DERECHOS Y DEBERES REHABILITACION	4	2016-12-16 18:46:00.358959	2016-12-16 18:46:00.358959
18	PLANES DE RIESGO REHABILITACION	4	2016-12-16 18:46:00.362949	2016-12-16 18:46:00.362949
19	RONDAS DE SEGURIDAD REHABILITACION	4	2016-12-16 18:46:00.366921	2016-12-16 18:46:00.366921
20	SEGUIMIENTO REHABILITACION	4	2016-12-16 18:46:00.370943	2016-12-16 18:46:00.370943
21	ESTADISTICAS REHABILITACION	4	2016-12-16 18:46:00.375066	2016-12-16 18:46:00.375066
22	ALISTAMIENTO URGENCIAS	5	2016-12-16 18:46:00.379028	2016-12-16 18:46:00.379028
23	INGRESO URGENCIAS	6	2016-12-16 18:46:00.383387	2016-12-16 18:46:00.383387
24	RECURSOS URGENCIAS	7	2016-12-16 18:46:00.387145	2016-12-16 18:46:00.387145
25	PACIENTE URGENCIAS	7	2016-12-16 18:46:00.391575	2016-12-16 18:46:00.391575
26	GESTION DEL SERVICIO HOSPITALIZACION	8	2016-12-16 18:46:00.395619	2016-12-16 18:46:00.395619
27	GESTION MEDICA HOSPITALIZACION	8	2016-12-16 18:46:00.399748	2016-12-16 18:46:00.399748
28	ACTIVIDADES JEFES DE ENFERMERIA HOSPITALIZACION	8	2016-12-16 18:46:00.404369	2016-12-16 18:46:00.404369
29	ACTIVIDADES AUXILIARES DE ENFERMERIA HOSPITALIZACION	8	2016-12-16 18:46:00.408605	2016-12-16 18:46:00.408605
30	GESTION ADMINISTRATIVA HOSPITALIZACION	9	2016-12-16 18:46:00.412854	2016-12-16 18:46:00.412854
31	ALISTAMIENTO UNIDAD DE CUIDADOS INTENSIVOS	10	2016-12-16 18:46:00.417012	2016-12-16 18:46:00.417012
32	ACTIVIDADES JEFES DE ENFERMERIA UNIDAD DE CUIDADOS INTENSIVOS	10	2016-12-16 18:46:00.420859	2016-12-16 18:46:00.420859
33	ACTIVIDADES DE AUXILIAR DE ENFERMERIA UNIDAD DE CUIDADOS INTENSIVOS	10	2016-12-16 18:46:00.424972	2016-12-16 18:46:00.424972
34	GESTION MEDICA UNIDAD DE CUIDADOS INTENSIVOS	10	2016-12-16 18:46:00.4288	2016-12-16 18:46:00.4288
35	FISIOTERAPIAS UNIDAD DE CUIDADOS INTENSIVOS	10	2016-12-16 18:46:00.432751	2016-12-16 18:46:00.432751
36	GESTION ADMINISTRATIVA UNIDAD DE CUIDADOS INTENSIVOS	10	2016-12-16 18:46:00.436826	2016-12-16 18:46:00.436826
37	PREPARACION ANGIOGRAFIA	11	2016-12-16 18:46:00.440762	2016-12-16 18:46:00.440762
38	PROCEDIMIENTO TECNICO ANGIOGRAFIA	11	2016-12-16 18:46:00.444788	2016-12-16 18:46:00.444788
39	PROCEDIMIENTO CIRCULANTES ANGIOGRAFIA	11	2016-12-16 18:46:00.448875	2016-12-16 18:46:00.448875
40	RECUPERACION MEDICOS ASISTENCIALES ANGIOGRAFIA	11	2016-12-16 18:46:00.4529	2016-12-16 18:46:00.4529
41	PROCEDIMIENTO AUXILIARES DE ENFERMERIA ANGIOGRAFIA	11	2016-12-16 18:46:00.456886	2016-12-16 18:46:00.456886
42	ALISTAMIENTO DIAGNOSTICO	12	2016-12-16 18:46:00.461063	2016-12-16 18:46:00.461063
43	INGRESO ADMINISTRATIVO DIAGNOSTICO	13	2016-12-16 18:46:00.464947	2016-12-16 18:46:00.464947
44	INGRESO A TOMA DE EXAMEN DIAGNOSTICO	13	2016-12-16 18:46:00.469362	2016-12-16 18:46:00.469362
45	SEGUIMIENTO DIAGNOSTICO	14	2016-12-16 18:46:00.473896	2016-12-16 18:46:00.473896
46	TRANSCRIPCION DIAGNOSTICO	15	2016-12-16 18:46:00.478898	2016-12-16 18:46:00.478898
47	CAMILLERO 	16	2016-12-16 18:46:00.483193	2016-12-16 18:46:00.483193
48	ALISTAMIENTO RESONANCIA	17	2016-12-16 18:46:00.48723	2016-12-16 18:46:00.48723
49	INGRESO PACIENTE RESONANCIA	18	2016-12-16 18:46:00.492171	2016-12-16 18:46:00.492171
50	TOMA DE EXAMEN RESONANCIA	18	2016-12-16 18:46:00.497052	2016-12-16 18:46:00.497052
51	SALIDA RESONANCIA	19	2016-12-16 18:46:00.500895	2016-12-16 18:46:00.500895
52	VERIFICAR DOCUMENTOS RESONANCIA	19	2016-12-16 18:46:00.504817	2016-12-16 18:46:00.504817
53	REPORTES RESONANCIA	19	2016-12-16 18:46:00.508914	2016-12-16 18:46:00.508914
54	VERIFICAR IMÁGENES RESONANCIA	19	2016-12-16 18:46:00.512791	2016-12-16 18:46:00.512791
55	EGRESO ADMINISTRATIVO RESONANCIA	19	2016-12-16 18:46:00.516988	2016-12-16 18:46:00.516988
56	PROGRAMACION ESTERILIZACION	20	2016-12-16 18:46:00.521144	2016-12-16 18:46:00.521144
57	INSUMOS ESTERILIZACION	20	2016-12-16 18:46:00.525059	2016-12-16 18:46:00.525059
58	PERSONAL ESTERILIZACION	20	2016-12-16 18:46:00.529706	2016-12-16 18:46:00.529706
59	RECEPCION ROPAS ESTERILIZACION	21	2016-12-16 18:46:00.533886	2016-12-16 18:46:00.533886
60	INSTRUMENTAL ESTERILIZACION	21	2016-12-16 18:46:00.538205	2016-12-16 18:46:00.538205
61	LAVADO ESTERILIZACION	21	2016-12-16 18:46:00.542079	2016-12-16 18:46:00.542079
62	SECADO ESTERILIZACION	21	2016-12-16 18:46:00.545933	2016-12-16 18:46:00.545933
63	ESTERILIZACION	21	2016-12-16 18:46:00.549869	2016-12-16 18:46:00.549869
64	ALMACENAMIENTO ESTERILIZACION	21	2016-12-16 18:46:00.554126	2016-12-16 18:46:00.554126
65	RECEPCION INSTRUMENTAL ESTERIL ESTERILIZACION	21	2016-12-16 18:46:00.558222	2016-12-16 18:46:00.558222
66	ADMINISTRATIVOS ESTERILIZACION	21	2016-12-16 18:46:00.562197	2016-12-16 18:46:00.562197
67	ALISTAMIENTO FARMACIA 4TO PISO	22	2016-12-16 18:46:00.56656	2016-12-16 18:46:00.56656
68	EJECUTAR FARMACIA 4TO PISO	22	2016-12-16 18:46:00.570838	2016-12-16 18:46:00.570838
69	SEGUIMIENTO FARMACIA 4TO PISO	22	2016-12-16 18:46:00.57493	2016-12-16 18:46:00.57493
70	EJECUTAR FARMACIA CIRUGIA	23	2016-12-16 18:46:00.579361	2016-12-16 18:46:00.579361
71	SEGUIMIENTO FARMACIA CIRUGIA	23	2016-12-16 18:46:00.583514	2016-12-16 18:46:00.583514
72	EJECUTAR FARMACIA ANGIOGRAFIA	24	2016-12-16 18:46:00.587497	2016-12-16 18:46:00.587497
73	INFORMES (COMUNICACIÓN)	25	2016-12-16 18:46:00.591532	2016-12-16 18:46:00.591532
74	PREPARACION (COMUNICACIÓN)	25	2016-12-16 18:46:00.595498	2016-12-16 18:46:00.595498
75	BOLETINES (COMUNICACIÓN)	25	2016-12-16 18:46:00.599658	2016-12-16 18:46:00.599658
76	CARTELERAS (COMUNICACIÓN)	25	2016-12-16 18:46:00.603863	2016-12-16 18:46:00.603863
77	COMITES (COMUNICACIÓN)	25	2016-12-16 18:46:00.607959	2016-12-16 18:46:00.607959
78	COMUNICACIÓN PASILLO (COMUNICACIÓN)	25	2016-12-16 18:46:00.612006	2016-12-16 18:46:00.612006
79	MANTENIMIENTO Y ALIMENTACION (COMUNICACIÓN)	25	2016-12-16 18:46:00.615836	2016-12-16 18:46:00.615836
80	APOYO (COMUNICACIÓN)	25	2016-12-16 18:46:00.619857	2016-12-16 18:46:00.619857
81	POLIZAS (CONTRATACION)	26	2016-12-16 18:46:00.623956	2016-12-16 18:46:00.623956
82	CONTRATACIONES ( temas juridicos ) (CONTRATACION)	26	2016-12-16 18:46:00.627992	2016-12-16 18:46:00.627992
83	COTIZACIONES CLINICAS (CONTRATACION)	26	2016-12-16 18:46:00.631991	2016-12-16 18:46:00.631991
84	ESTADISTICAS (CONTRATACION)	26	2016-12-16 18:46:00.636831	2016-12-16 18:46:00.636831
85	INFORMES (CONTRATACION)	26	2016-12-16 18:46:00.641038	2016-12-16 18:46:00.641038
86	REVISION Y VERIFICACION  (CONTRATACION)	26	2016-12-16 18:46:00.645085	2016-12-16 18:46:00.645085
87	SOLICITUDES (CONTRATACION)	26	2016-12-16 18:46:00.649054	2016-12-16 18:46:00.649054
88	PROPUESTAS COMERCIALES (CONTRATACION)	26	2016-12-16 18:46:00.653235	2016-12-16 18:46:00.653235
89	COTIZACIONES (CONTRATACION)	26	2016-12-16 18:46:00.657186	2016-12-16 18:46:00.657186
90	CARTAS A ENTIDADES (CONTRATACION)	26	2016-12-16 18:46:00.661298	2016-12-16 18:46:00.661298
91	COTIZACIONES AMBULATORIAS COMERCIAL	27	2016-12-16 18:46:00.666046	2016-12-16 18:46:00.666046
92	ACTIVIDADES DE APOYO COMERCIAL	27	2016-12-16 18:46:00.670095	2016-12-16 18:46:00.670095
93	MESAS DE AYUDA COMERCIAL	27	2016-12-16 18:46:00.674379	2016-12-16 18:46:00.674379
94	PARAMETRIZACION (CONVENIOS)	28	2016-12-16 18:46:00.678343	2016-12-16 18:46:00.678343
95	MESA DE AYUDA (CONVENIOS)	28	2016-12-16 18:46:00.682118	2016-12-16 18:46:00.682118
96	VISITAS (COMERCIAL)	29	2016-12-16 18:46:00.686374	2016-12-16 18:46:00.686374
97	PREPARACION (COMERCIAL)	30	2016-12-16 18:46:00.690427	2016-12-16 18:46:00.690427
98	SEGUIMIENTO (COMERCIAL)	30	2016-12-16 18:46:00.694716	2016-12-16 18:46:00.694716
99	APOYO A PROCESOS (COMERCIAL)	30	2016-12-16 18:46:00.699114	2016-12-16 18:46:00.699114
100	SEGUIMIENTO A PRESUPUESTO (COMERCIAL)	30	2016-12-16 18:46:00.704903	2016-12-16 18:46:00.704903
101	INDICADORES (COMERCIAL)	30	2016-12-16 18:46:00.710121	2016-12-16 18:46:00.710121
102	LISTAS DE CHEQUEO (COMERCIAL)	30	2016-12-16 18:46:00.714055	2016-12-16 18:46:00.714055
103	REUNIONES (COMERCIAL)	30	2016-12-16 18:46:00.718244	2016-12-16 18:46:00.718244
104	TRANSCRIPCION ANGIOGRAFIA	11	2016-12-16 18:46:00.722114	2016-12-16 18:46:00.722114
\.


--
-- Name: subprocedures_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('subprocedures_id_seq', 104, true);


--
-- Data for Name: subresources; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY subresources (id, name, resource_id, created_at, updated_at, properties, identity_card, salary, hours_worked, value_hour, unit_cost, stock_minimum, stock_maximum, current_stock, identifier, useful_life, market_valuer, provider_id, position_id, category, meter_id) FROM stdin;
1	DOMINGUEZ MISAR FRAY MARTIN	2	2016-12-16 18:46:09.648952	2016-12-16 18:46:09.648952	\N	3913279	1281223.0	192.0	6673.0	\N	\N	\N	\N	\N	\N	\N	\N	57	\N	\N
2	PAREDES GARCIA FRED WILIANSOM	2	2016-12-16 18:46:09.653857	2016-12-16 18:46:09.653857	\N	6097434	1455603.0	192.0	7581.0	\N	\N	\N	\N	\N	\N	\N	\N	59	\N	\N
3	VILLOTA VILLOTA JEHISON	2	2016-12-16 18:46:09.658353	2016-12-16 18:46:09.658353	\N	6105606	7330990.0	192.0	38182.0	\N	\N	\N	\N	\N	\N	\N	\N	111	\N	\N
4	PAPAMIJA SOTELO JOHN JAIRO	2	2016-12-16 18:46:09.662765	2016-12-16 18:46:09.662765	\N	6253283	1455603.0	192.0	7581.0	\N	\N	\N	\N	\N	\N	\N	\N	59	\N	\N
5	OSORIO AGUIRRE GUILLERMO DE JESUS	2	2016-12-16 18:46:09.667231	2016-12-16 18:46:09.667231	\N	6422211	9537600.0	192.0	49675.0	\N	\N	\N	\N	\N	\N	\N	\N	146	\N	\N
6	PRIETO CASTILLO MAURICIO JULIAN	2	2016-12-16 18:46:09.671798	2016-12-16 18:46:09.671798	\N	10497488	7076839.0	192.0	36859.0	\N	\N	\N	\N	\N	\N	\N	\N	92	\N	\N
7	VILLOTA CARVAJAL MARIO ANDRES            	2	2016-12-16 18:46:09.676319	2016-12-16 18:46:09.676319	\N	13069450	1918421.0	192.0	9992.0	\N	\N	\N	\N	\N	\N	\N	\N	97	\N	\N
8	RAMOS TORO ROBERTO ANTONIO	2	2016-12-16 18:46:09.680696	2016-12-16 18:46:09.680696	\N	14466589	4222258.0	192.0	21991.0	\N	\N	\N	\N	\N	\N	\N	\N	94	\N	\N
9	CAMPO HURTADO HARRISON FABIAN	2	2016-12-16 18:46:09.686109	2016-12-16 18:46:09.686109	\N	14624144	2337403.0	192.0	12174.0	\N	\N	\N	\N	\N	\N	\N	\N	63	\N	\N
10	SANCENO MAZO OSCAR IVAN	2	2016-12-16 18:46:09.690511	2016-12-16 18:46:09.690511	\N	14638234	1661779.0	192.0	8655.0	\N	\N	\N	\N	\N	\N	\N	\N	25	\N	\N
11	ROLDAN VIRGEN HELMER ENRIQUE	2	2016-12-16 18:46:09.694843	2016-12-16 18:46:09.694843	\N	14696071	7246848.0	192.0	37744.0	\N	\N	\N	\N	\N	\N	\N	\N	117	\N	\N
12	SAA MUNOZ MARCO FIDEL	2	2016-12-16 18:46:09.699106	2016-12-16 18:46:09.699106	\N	14696626	1661968.0	192.0	8656.0	\N	\N	\N	\N	\N	\N	\N	\N	39	\N	\N
13	TEJEDA AGUIRRE CESAR AUGUSTO	2	2016-12-16 18:46:09.7047	2016-12-16 18:46:09.7047	\N	14703767	10054585.0	192.0	52368.0	\N	\N	\N	\N	\N	\N	\N	\N	114	\N	\N
14	OCHOA LOPEZ ANTONIO JOSE	2	2016-12-16 18:46:09.709011	2016-12-16 18:46:09.709011	\N	14800596	2636297.0	192.0	13731.0	\N	\N	\N	\N	\N	\N	\N	\N	101	\N	\N
15	ROJAS ROJAS NELSON EDUARDO	2	2016-12-16 18:46:09.713461	2016-12-16 18:46:09.713461	\N	14801318	6225840.0	192.0	32426.0	\N	\N	\N	\N	\N	\N	\N	\N	108	\N	\N
16	MONDRAGON SALAS GERMAN	2	2016-12-16 18:46:09.717837	2016-12-16 18:46:09.717837	\N	16266959	6475783.0	192.0	33728.0	\N	\N	\N	\N	\N	\N	\N	\N	147	\N	\N
17	OCAMPO HERRERA WILLIAM	2	2016-12-16 18:46:09.726746	2016-12-16 18:46:09.726746	\N	16285092	2282808.0	192.0	11890.0	\N	\N	\N	\N	\N	\N	\N	\N	77	\N	\N
18	HOLGUIN PARRA IVAN ANDRES	2	2016-12-16 18:46:09.731331	2016-12-16 18:46:09.731331	\N	16288011	3634961.0	192.0	18932.0	\N	\N	\N	\N	\N	\N	\N	\N	103	\N	\N
19	GUZMAN LOZANO RAFAEL	2	2016-12-16 18:46:09.735652	2016-12-16 18:46:09.735652	\N	16463700	4173163.0	192.0	21735.0	\N	\N	\N	\N	\N	\N	\N	\N	94	\N	\N
20	HIDALGO MELENDEZ YILIVER	2	2016-12-16 18:46:09.739735	2016-12-16 18:46:09.739735	\N	16463939	2371680.0	192.0	12353.0	\N	\N	\N	\N	\N	\N	\N	\N	44	\N	\N
21	BORJA GRANADOS ALBERTO	2	2016-12-16 18:46:09.744017	2016-12-16 18:46:09.744017	\N	16637515	1577952.0	192.0	8219.0	\N	\N	\N	\N	\N	\N	\N	\N	111	\N	\N
22	GOMEZ DIAZ ANTONY	2	2016-12-16 18:46:09.748454	2016-12-16 18:46:09.748454	\N	16712834	2354439.0	192.0	12263.0	\N	\N	\N	\N	\N	\N	\N	\N	121	\N	\N
23	MENDEZ CARDONA JAIME ENRIQUE	2	2016-12-16 18:46:09.752777	2016-12-16 18:46:09.752777	\N	16740361	3347347.0	192.0	17434.0	\N	\N	\N	\N	\N	\N	\N	\N	67	\N	\N
24	PERAFAN GUACA EDILBERTO	2	2016-12-16 18:46:09.757396	2016-12-16 18:46:09.757396	\N	16747892	1936635.0	192.0	10087.0	\N	\N	\N	\N	\N	\N	\N	\N	55	\N	\N
25	ROMAN CASTRILLON LUIS ANTONIO	2	2016-12-16 18:46:09.761863	2016-12-16 18:46:09.761863	\N	16755838	8730793.0	192.0	45473.0	\N	\N	\N	\N	\N	\N	\N	\N	150	\N	\N
26	ESTELA SOLANO JOSE GERARDO	2	2016-12-16 18:46:09.766048	2016-12-16 18:46:09.766048	\N	16758719	2565046.0	192.0	13360.0	\N	\N	\N	\N	\N	\N	\N	\N	2	\N	\N
27	SALINAS SILVA CARLOS JAIME	2	2016-12-16 18:46:09.770592	2016-12-16 18:46:09.770592	\N	16774697	1293783.0	192.0	6738.0	\N	\N	\N	\N	\N	\N	\N	\N	57	\N	\N
28	TASCON ZUNIGA HECTOR MIGUEL	2	2016-12-16 18:46:09.775006	2016-12-16 18:46:09.775006	\N	16786522	4071497.0	192.0	21206.0	\N	\N	\N	\N	\N	\N	\N	\N	148	\N	\N
29	ARTEAGA VALDERRAMA MAURICIO	2	2016-12-16 18:46:09.779326	2016-12-16 18:46:09.779326	\N	16838327	2950642.0	192.0	15368.0	\N	\N	\N	\N	\N	\N	\N	\N	148	\N	\N
30	REYES RUIZ TITO ALEXANDER	2	2016-12-16 18:46:09.78385	2016-12-16 18:46:09.78385	\N	16928191	3946705.0	192.0	20556.0	\N	\N	\N	\N	\N	\N	\N	\N	148	\N	\N
31	GONZALEZ MUNOZ ANDRES FELIPE	2	2016-12-16 18:46:09.788131	2016-12-16 18:46:09.788131	\N	16934665	1572735.0	192.0	8191.0	\N	\N	\N	\N	\N	\N	\N	\N	39	\N	\N
32	ARTEAGA LUNA OLGA VIVIANA	2	2016-12-16 18:46:09.792451	2016-12-16 18:46:09.792451	\N	24338027	4978821.0	192.0	25931.0	\N	\N	\N	\N	\N	\N	\N	\N	86	\N	\N
33	SANCHEZ GRANADA LUZ ADRIANA	2	2016-12-16 18:46:09.796705	2016-12-16 18:46:09.796705	\N	24550468	2291497.0	192.0	11935.0	\N	\N	\N	\N	\N	\N	\N	\N	44	\N	\N
34	VALENCIA VALENCIA ADRIANA PATRICIA	2	2016-12-16 18:46:09.800847	2016-12-16 18:46:09.800847	\N	24628425	5473435.0	192.0	28507.0	\N	\N	\N	\N	\N	\N	\N	\N	92	\N	\N
35	MUNOZ MONTILLA CLAUDIA MILENA	2	2016-12-16 18:46:09.805365	2016-12-16 18:46:09.805365	\N	25277026	1794258.0	192.0	9345.0	\N	\N	\N	\N	\N	\N	\N	\N	47	\N	\N
36	VIZCAINO VALENCIA MERY LUZ	2	2016-12-16 18:46:09.809801	2016-12-16 18:46:09.809801	\N	25619685	3185589.0	192.0	16592.0	\N	\N	\N	\N	\N	\N	\N	\N	44	\N	\N
37	LOPEZ MIRAMAG MARTHA CECILIA	2	2016-12-16 18:46:09.814075	2016-12-16 18:46:09.814075	\N	27204817	1361718.0	192.0	7092.0	\N	\N	\N	\N	\N	\N	\N	\N	49	\N	\N
38	MORAN PASTAS MARIA FERNANDA	2	2016-12-16 18:46:09.818759	2016-12-16 18:46:09.818759	\N	27213932	4201975.0	192.0	21885.0	\N	\N	\N	\N	\N	\N	\N	\N	94	\N	\N
39	HERRERA QUIROZ EDDA MARIA	2	2016-12-16 18:46:09.823215	2016-12-16 18:46:09.823215	\N	28060831	1204186.0	192.0	6272.0	\N	\N	\N	\N	\N	\N	\N	\N	44	\N	\N
40	SALAZAR HURTADO MARCELA	2	2016-12-16 18:46:09.827706	2016-12-16 18:46:09.827706	\N	29105222	4498760.0	192.0	23431.0	\N	\N	\N	\N	\N	\N	\N	\N	83	\N	\N
41	MARTINEZ OTERO LUZ VIVIANA	2	2016-12-16 18:46:09.831993	2016-12-16 18:46:09.831993	\N	29105474	1693932.0	192.0	8823.0	\N	\N	\N	\N	\N	\N	\N	\N	39	\N	\N
42	LERMA SANCHEZ NARLY	2	2016-12-16 18:46:09.836393	2016-12-16 18:46:09.836393	\N	29106695	1295845.0	192.0	6749.0	\N	\N	\N	\N	\N	\N	\N	\N	134	\N	\N
43	CASTRO CORDOBA CAROLINA	2	2016-12-16 18:46:09.840888	2016-12-16 18:46:09.840888	\N	29109866	3991811.0	192.0	20791.0	\N	\N	\N	\N	\N	\N	\N	\N	91	\N	\N
44	VIAFARA VIVEROS ISABEL CRISTINA	2	2016-12-16 18:46:09.845064	2016-12-16 18:46:09.845064	\N	29112867	5788324.0	192.0	30148.0	\N	\N	\N	\N	\N	\N	\N	\N	92	\N	\N
45	HERRERA RIASCOS CLARA YAZMIN	2	2016-12-16 18:46:09.849554	2016-12-16 18:46:09.849554	\N	29117345	2484148.0	192.0	12938.0	\N	\N	\N	\N	\N	\N	\N	\N	133	\N	\N
46	VILLA RUIZ ALEXANDRA PATRICIA	2	2016-12-16 18:46:09.853916	2016-12-16 18:46:09.853916	\N	29124652	1297185.0	192.0	6756.0	\N	\N	\N	\N	\N	\N	\N	\N	130	\N	\N
47	GARCIA CARDONA YAZMIN LORENA	2	2016-12-16 18:46:09.857904	2016-12-16 18:46:09.857904	\N	29125359	1265590.0	192.0	6592.0	\N	\N	\N	\N	\N	\N	\N	\N	127	\N	\N
48	MEZU CARABALI ADRIANA	2	2016-12-16 18:46:09.862479	2016-12-16 18:46:09.862479	\N	29125926	6225840.0	192.0	32426.0	\N	\N	\N	\N	\N	\N	\N	\N	105	\N	\N
49	GUZMAN JAIMES PAOLA ANDREA	2	2016-12-16 18:46:09.866757	2016-12-16 18:46:09.866757	\N	29126929	389345.0	192.0	2028.0	\N	\N	\N	\N	\N	\N	\N	\N	54	\N	\N
50	GARCIA MESA JULIANA	2	2016-12-16 18:46:09.871002	2016-12-16 18:46:09.871002	\N	29177639	1296668.0	192.0	6753.0	\N	\N	\N	\N	\N	\N	\N	\N	127	\N	\N
51	TORRES PALACIOS BLANCA LUZ	2	2016-12-16 18:46:09.875002	2016-12-16 18:46:09.875002	\N	29314347	1586328.0	192.0	8262.0	\N	\N	\N	\N	\N	\N	\N	\N	44	\N	\N
52	SANDOVAL BURBANO JEANA CATALINA	2	2016-12-16 18:46:09.879133	2016-12-16 18:46:09.879133	\N	29361516	1538351.0	192.0	8012.0	\N	\N	\N	\N	\N	\N	\N	\N	145	\N	\N
53	BECERRA SANCHEZ ARIADNA	2	2016-12-16 18:46:09.883341	2016-12-16 18:46:09.883341	\N	29435747	1478467.0	192.0	7700.0	\N	\N	\N	\N	\N	\N	\N	\N	46	\N	\N
54	TELLO GARCIA MARLY	2	2016-12-16 18:46:09.887737	2016-12-16 18:46:09.887737	\N	29568485	1645228.0	192.0	8569.0	\N	\N	\N	\N	\N	\N	\N	\N	40	\N	\N
55	HURTADO GIRON YULIANA	2	2016-12-16 18:46:09.89185	2016-12-16 18:46:09.89185	\N	29662564	5810784.0	192.0	30265.0	\N	\N	\N	\N	\N	\N	\N	\N	107	\N	\N
56	HERRERA MUNOZ NIDIA EUGENIA	2	2016-12-16 18:46:09.895819	2016-12-16 18:46:09.895819	\N	29676290	1313567.0	192.0	6841.0	\N	\N	\N	\N	\N	\N	\N	\N	130	\N	\N
57	MEJIA DOMINGUEZ LADY JOHANNA	2	2016-12-16 18:46:09.900027	2016-12-16 18:46:09.900027	\N	29676631	1635174.0	192.0	8517.0	\N	\N	\N	\N	\N	\N	\N	\N	140	\N	\N
58	ROLDAN DIAZ ALEXANDRA	2	2016-12-16 18:46:09.904361	2016-12-16 18:46:09.904361	\N	29951631	1410510.0	192.0	7346.0	\N	\N	\N	\N	\N	\N	\N	\N	52	\N	\N
59	HURTADO RAMOS NURY JOHANNA	2	2016-12-16 18:46:09.909053	2016-12-16 18:46:09.909053	\N	30232379	5021043.0	192.0	26151.0	\N	\N	\N	\N	\N	\N	\N	\N	92	\N	\N
60	ESPITIA CHACON LUZ MARINA	2	2016-12-16 18:46:09.913716	2016-12-16 18:46:09.913716	\N	31157168	5015813.0	192.0	26124.0	\N	\N	\N	\N	\N	\N	\N	\N	92	\N	\N
61	SAA GARCES MILENA	2	2016-12-16 18:46:09.917912	2016-12-16 18:46:09.917912	\N	31174324	2445319.0	192.0	12736.0	\N	\N	\N	\N	\N	\N	\N	\N	44	\N	\N
62	GONZALEZ DUQUE ALBA LUCIA	2	2016-12-16 18:46:09.921939	2016-12-16 18:46:09.921939	\N	31248695	1404291.0	192.0	7314.0	\N	\N	\N	\N	\N	\N	\N	\N	58	\N	\N
63	TEJADA CLAUDIA YOHANA	2	2016-12-16 18:46:09.926	2016-12-16 18:46:09.926	\N	31307888	2491621.0	192.0	12977.0	\N	\N	\N	\N	\N	\N	\N	\N	44	\N	\N
64	MARIN SANCHEZ HEIDY JOHANNA	2	2016-12-16 18:46:09.930182	2016-12-16 18:46:09.930182	\N	31320741	2483956.0	192.0	12937.0	\N	\N	\N	\N	\N	\N	\N	\N	44	\N	\N
65	CARDENAS AGUDELO YENNY 	2	2016-12-16 18:46:09.934479	2016-12-16 18:46:09.934479	\N	31322477	102977.0	192.0	536.0	\N	\N	\N	\N	\N	\N	\N	\N	11	\N	\N
66	ZULUAGA GOMEZ LUZ OMAIRA	2	2016-12-16 18:46:09.93885	2016-12-16 18:46:09.93885	\N	31484229	1410030.0	192.0	7344.0	\N	\N	\N	\N	\N	\N	\N	\N	61	\N	\N
67	BONILLA ECHEVERRY CLAUDIA LUCIA	2	2016-12-16 18:46:09.943323	2016-12-16 18:46:09.943323	\N	31485087	1664558.0	192.0	8670.0	\N	\N	\N	\N	\N	\N	\N	\N	39	\N	\N
68	PORTILLA YEPES YAMILETH	2	2016-12-16 18:46:09.947716	2016-12-16 18:46:09.947716	\N	31568777	1258908.0	192.0	6557.0	\N	\N	\N	\N	\N	\N	\N	\N	138	\N	\N
69	MARTINEZ JARAMILLO MARYURI	2	2016-12-16 18:46:09.952184	2016-12-16 18:46:09.952184	\N	31573534	1360223.0	192.0	7084.0	\N	\N	\N	\N	\N	\N	\N	\N	109	\N	\N
70	MORALES CASTRO IVON JOHANA	2	2016-12-16 18:46:09.958327	2016-12-16 18:46:09.958327	\N	31574231	2053758.0	192.0	10697.0	\N	\N	\N	\N	\N	\N	\N	\N	47	\N	\N
71	ROMERO AGUIRRE CAROLINA	2	2016-12-16 18:46:09.962869	2016-12-16 18:46:09.962869	\N	31579709	2303823.0	192.0	11999.0	\N	\N	\N	\N	\N	\N	\N	\N	133	\N	\N
72	DUQUE RIVERA YESSICA TULIA	2	2016-12-16 18:46:09.967041	2016-12-16 18:46:09.967041	\N	31580466	1381751.0	192.0	7197.0	\N	\N	\N	\N	\N	\N	\N	\N	47	\N	\N
73	RIVERA PENA INGRID TATIANA	2	2016-12-16 18:46:09.971644	2016-12-16 18:46:09.971644	\N	31582079	1266128.0	192.0	6594.0	\N	\N	\N	\N	\N	\N	\N	\N	131	\N	\N
74	MUNOZ BOLANOS MARIA ERLY	2	2016-12-16 18:46:09.976285	2016-12-16 18:46:09.976285	\N	31584889	2084912.0	192.0	10859.0	\N	\N	\N	\N	\N	\N	\N	\N	45	\N	\N
75	MONTOYA OSSA LUZ ADRIANA	2	2016-12-16 18:46:09.980695	2016-12-16 18:46:09.980695	\N	31641938	5084008.0	192.0	26479.0	\N	\N	\N	\N	\N	\N	\N	\N	85	\N	\N
76	CASTRO GOMEZ CAROLINA	2	2016-12-16 18:46:09.984779	2016-12-16 18:46:09.984779	\N	31710423	3745157.0	192.0	19506.0	\N	\N	\N	\N	\N	\N	\N	\N	96	\N	\N
77	QUIGUANAS PAZ YAMILETH	2	2016-12-16 18:46:09.990039	2016-12-16 18:46:09.990039	\N	31710434	2535252.0	192.0	13204.0	\N	\N	\N	\N	\N	\N	\N	\N	44	\N	\N
78	GIRON CHAVEZ ANA BEATRIZ	2	2016-12-16 18:46:09.994519	2016-12-16 18:46:09.994519	\N	31712250	1294587.0	192.0	6743.0	\N	\N	\N	\N	\N	\N	\N	\N	132	\N	\N
79	FLOREZ OROZCO DIANA MARCELA	2	2016-12-16 18:46:09.999566	2016-12-16 18:46:09.999566	\N	31712597	2335052.0	192.0	12162.0	\N	\N	\N	\N	\N	\N	\N	\N	44	\N	\N
80	ORTEGON LADINO ESTHER JULIA	2	2016-12-16 18:46:10.004137	2016-12-16 18:46:10.004137	\N	31714004	4334343.0	192.0	22575.0	\N	\N	\N	\N	\N	\N	\N	\N	71	\N	\N
81	VEGA HURTADO KELLY CECILIA	2	2016-12-16 18:46:10.008718	2016-12-16 18:46:10.008718	\N	31714903	5713078.0	192.0	29756.0	\N	\N	\N	\N	\N	\N	\N	\N	92	\N	\N
82	RIASCOS RODRIGUEZ CLAUDIA MILENA	2	2016-12-16 18:46:10.013927	2016-12-16 18:46:10.013927	\N	31793987	4478821.0	192.0	23327.0	\N	\N	\N	\N	\N	\N	\N	\N	81	\N	\N
83	CARDOZO DIAZ MARIA ELENA	2	2016-12-16 18:46:10.019751	2016-12-16 18:46:10.019751	\N	31833756	1613878.0	192.0	8406.0	\N	\N	\N	\N	\N	\N	\N	\N	142	\N	\N
84	DIAZ BERNAL MARIA VICTORIA	2	2016-12-16 18:46:10.023745	2016-12-16 18:46:10.023745	\N	31850615	1063453.0	192.0	5539.0	\N	\N	\N	\N	\N	\N	\N	\N	58	\N	\N
85	TIERRADENTRO QUINTERO FIDELA	2	2016-12-16 18:46:10.027999	2016-12-16 18:46:10.027999	\N	31859753	2654159.0	192.0	13824.0	\N	\N	\N	\N	\N	\N	\N	\N	44	\N	\N
86	MUNOZ SAMBONI MARIA CRISTINA	2	2016-12-16 18:46:10.032743	2016-12-16 18:46:10.032743	\N	31875940	4729235.0	192.0	24631.0	\N	\N	\N	\N	\N	\N	\N	\N	148	\N	\N
87	COLLAZOS PERAFAN LUISA FERNANDA	2	2016-12-16 18:46:10.038208	2016-12-16 18:46:10.038208	\N	31908467	10672807.0	192.0	55588.0	\N	\N	\N	\N	\N	\N	\N	\N	126	\N	\N
88	PINZON SALAMANCA PATRICIA	2	2016-12-16 18:46:10.042929	2016-12-16 18:46:10.042929	\N	31919572	1591351.0	192.0	8288.0	\N	\N	\N	\N	\N	\N	\N	\N	143	\N	\N
89	PORTILLA ADRADA LUZ MARINA	2	2016-12-16 18:46:10.047605	2016-12-16 18:46:10.047605	\N	31919786	1073812.0	192.0	5593.0	\N	\N	\N	\N	\N	\N	\N	\N	58	\N	\N
90	RINCON PATINO REGINA	2	2016-12-16 18:46:10.052389	2016-12-16 18:46:10.052389	\N	31949358	2059622.0	192.0	10727.0	\N	\N	\N	\N	\N	\N	\N	\N	29	\N	\N
91	SINISTERRA CAMACHO MARTHA CECILIA	2	2016-12-16 18:46:10.05687	2016-12-16 18:46:10.05687	\N	31976702	2048359.0	192.0	10669.0	\N	\N	\N	\N	\N	\N	\N	\N	45	\N	\N
92	CASTRO GUZMAN BEATRIZ MARIA	2	2016-12-16 18:46:10.061638	2016-12-16 18:46:10.061638	\N	31984260	1598105.0	192.0	8323.0	\N	\N	\N	\N	\N	\N	\N	\N	51	\N	\N
93	DIAZ RESTREPO MARIA EUGENIA	2	2016-12-16 18:46:10.065854	2016-12-16 18:46:10.065854	\N	31994165	1565189.0	192.0	8152.0	\N	\N	\N	\N	\N	\N	\N	\N	44	\N	\N
94	LONDONO CHALA MARIA LUCILA	2	2016-12-16 18:46:10.071149	2016-12-16 18:46:10.071149	\N	31998700	2143310.0	192.0	11163.0	\N	\N	\N	\N	\N	\N	\N	\N	29	\N	\N
95	SANCHEZ MOSQUERA DORALICE	2	2016-12-16 18:46:10.076199	2016-12-16 18:46:10.076199	\N	34318710	1602682.0	192.0	8347.0	\N	\N	\N	\N	\N	\N	\N	\N	142	\N	\N
96	CEBALLOS LOURIDO JAKELINE	2	2016-12-16 18:46:10.081732	2016-12-16 18:46:10.081732	\N	34511887	2866624.0	192.0	14930.0	\N	\N	\N	\N	\N	\N	\N	\N	44	\N	\N
97	GONZALEZ DIAZ MARIA EUGENIA	2	2016-12-16 18:46:10.085823	2016-12-16 18:46:10.085823	\N	34514674	2647053.0	192.0	13787.0	\N	\N	\N	\N	\N	\N	\N	\N	67	\N	\N
98	SANCHEZ CARMELINA	2	2016-12-16 18:46:10.08999	2016-12-16 18:46:10.08999	\N	34548773	3237555.0	192.0	16862.0	\N	\N	\N	\N	\N	\N	\N	\N	148	\N	\N
99	MONTOYA SANDOVAL VILMA	2	2016-12-16 18:46:10.09427	2016-12-16 18:46:10.09427	\N	34561923	4334343.0	192.0	22575.0	\N	\N	\N	\N	\N	\N	\N	\N	82	\N	\N
100	ZAPATA BALANTA MARTHA	2	2016-12-16 18:46:10.099364	2016-12-16 18:46:10.099364	\N	34601599	5520249.0	192.0	28751.0	\N	\N	\N	\N	\N	\N	\N	\N	92	\N	\N
101	DE VIVERO GOMEZ ANA CRISTINA	2	2016-12-16 18:46:10.103629	2016-12-16 18:46:10.103629	\N	34975659	15762698.0	192.0	82097.0	\N	\N	\N	\N	\N	\N	\N	\N	126	\N	\N
102	PAZOS ROMERO NANCY PATRICIA	2	2016-12-16 18:46:10.107781	2016-12-16 18:46:10.107781	\N	36753765	1645419.0	192.0	8570.0	\N	\N	\N	\N	\N	\N	\N	\N	39	\N	\N
103	BURBANO CERON ALBA LUCIA	2	2016-12-16 18:46:10.11221	2016-12-16 18:46:10.11221	\N	36953005	4651965.0	192.0	24229.0	\N	\N	\N	\N	\N	\N	\N	\N	80	\N	\N
104	MORA JAIMES MARTHA YHANET	2	2016-12-16 18:46:10.116641	2016-12-16 18:46:10.116641	\N	37752500	6906091.0	192.0	35969.0	\N	\N	\N	\N	\N	\N	\N	\N	111	\N	\N
105	PARRA AVILA LUZ DARY	2	2016-12-16 18:46:10.120763	2016-12-16 18:46:10.120763	\N	38284998	5985108.0	192.0	31172.0	\N	\N	\N	\N	\N	\N	\N	\N	152	\N	\N
106	ARANGO ELIZABETH	2	2016-12-16 18:46:10.126517	2016-12-16 18:46:10.126517	\N	38463638	1471523.0	192.0	7664.0	\N	\N	\N	\N	\N	\N	\N	\N	144	\N	\N
107	DURAN POPO ADRIANA	2	2016-12-16 18:46:10.131065	2016-12-16 18:46:10.131065	\N	38550669	1596324.0	192.0	8314.0	\N	\N	\N	\N	\N	\N	\N	\N	130	\N	\N
108	CASTRILLON CARDONA GLORIA VIVIANA	2	2016-12-16 18:46:10.142814	2016-12-16 18:46:10.142814	\N	38552757	1876276.0	192.0	9772.0	\N	\N	\N	\N	\N	\N	\N	\N	41	\N	\N
109	RAMIREZ OSPINA GIOVANNA AND	2	2016-12-16 18:46:10.147581	2016-12-16 18:46:10.147581	\N	38552804	6311970.0	192.0	32875.0	\N	\N	\N	\N	\N	\N	\N	\N	69	\N	\N
110	VALENCIA PARRA MARYSTELLA	2	2016-12-16 18:46:10.154948	2016-12-16 18:46:10.154948	\N	38556455	2433398.0	192.0	12674.0	\N	\N	\N	\N	\N	\N	\N	\N	44	\N	\N
111	MORALES COLLAZOS CAROLINA	2	2016-12-16 18:46:10.159197	2016-12-16 18:46:10.159197	\N	38569808	1289884.0	192.0	6718.0	\N	\N	\N	\N	\N	\N	\N	\N	131	\N	\N
112	FAJARDO USMA DIANA LORENA	2	2016-12-16 18:46:10.164243	2016-12-16 18:46:10.164243	\N	38601228	4498760.0	192.0	23431.0	\N	\N	\N	\N	\N	\N	\N	\N	73	\N	\N
113	LATORRE HURTADO VIVIANA	2	2016-12-16 18:46:10.168826	2016-12-16 18:46:10.168826	\N	38610694	1378003.0	192.0	7177.0	\N	\N	\N	\N	\N	\N	\N	\N	109	\N	\N
114	BURBANO MAYOR YURLIETH	2	2016-12-16 18:46:10.173806	2016-12-16 18:46:10.173806	\N	38641617	1579545.0	192.0	8227.0	\N	\N	\N	\N	\N	\N	\N	\N	44	\N	\N
115	CASTANO TORRES KATHERINE	2	2016-12-16 18:46:10.178391	2016-12-16 18:46:10.178391	\N	38643835	4932465.0	192.0	25690.0	\N	\N	\N	\N	\N	\N	\N	\N	97	\N	\N
116	LIZCANO BALANTA JENNIFER GISELA	2	2016-12-16 18:46:10.182847	2016-12-16 18:46:10.182847	\N	38670578	2613490.0	192.0	13612.0	\N	\N	\N	\N	\N	\N	\N	\N	44	\N	\N
117	MEDINA ROSAS LUZ KARIME	2	2016-12-16 18:46:10.187489	2016-12-16 18:46:10.187489	\N	38682367	1645228.0	192.0	8569.0	\N	\N	\N	\N	\N	\N	\N	\N	95	\N	\N
118	GARCIA VARGAS CARMEN NATHALIA	2	2016-12-16 18:46:10.19253	2016-12-16 18:46:10.19253	\N	38683589	1822661.0	192.0	9493.0	\N	\N	\N	\N	\N	\N	\N	\N	44	\N	\N
119	VELASCO BENACHI DANEIDA	2	2016-12-16 18:46:10.197147	2016-12-16 18:46:10.197147	\N	38684321	798967.0	192.0	4161.0	\N	\N	\N	\N	\N	\N	\N	\N	43	\N	\N
120	CARDOZO LUDINA	2	2016-12-16 18:46:10.202388	2016-12-16 18:46:10.202388	\N	38861126	1296668.0	192.0	6753.0	\N	\N	\N	\N	\N	\N	\N	\N	129	\N	\N
121	MOSCOSO CAMACHO ALEXANDRA	2	2016-12-16 18:46:10.206992	2016-12-16 18:46:10.206992	\N	38889622	1684415.0	192.0	8773.0	\N	\N	\N	\N	\N	\N	\N	\N	53	\N	\N
122	CEBALLOS LOPEZ CLAUDIA PATRICIA	2	2016-12-16 18:46:10.212124	2016-12-16 18:46:10.212124	\N	39774268	3552081.0	192.0	18500.0	\N	\N	\N	\N	\N	\N	\N	\N	124	\N	\N
123	ZAPATA GIRALDO LUZ ASCENED	2	2016-12-16 18:46:10.216859	2016-12-16 18:46:10.216859	\N	42005002	8476636.0	192.0	44149.0	\N	\N	\N	\N	\N	\N	\N	\N	76	\N	\N
124	OSORIO BARRETO CATALINA	2	2016-12-16 18:46:10.221362	2016-12-16 18:46:10.221362	\N	42160332	4408403.0	192.0	22960.0	\N	\N	\N	\N	\N	\N	\N	\N	92	\N	\N
125	MELO CUELLO BLANCA ROSARIO	2	2016-12-16 18:46:10.226486	2016-12-16 18:46:10.226486	\N	43628088	6525187.0	192.0	33985.0	\N	\N	\N	\N	\N	\N	\N	\N	114	\N	\N
126	TALERO MORENO MARIA GLADYS	2	2016-12-16 18:46:10.231052	2016-12-16 18:46:10.231052	\N	52214928	4479013.0	192.0	23328.0	\N	\N	\N	\N	\N	\N	\N	\N	84	\N	\N
127	RAMIREZ TRUJILLO NINI JOHANA	2	2016-12-16 18:46:10.235909	2016-12-16 18:46:10.235909	\N	55118039	1147406.0	192.0	5976.0	\N	\N	\N	\N	\N	\N	\N	\N	128	\N	\N
128	MURCIA RAMIREZ ELENA PATRICIA	2	2016-12-16 18:46:10.240519	2016-12-16 18:46:10.240519	\N	55118137	1313567.0	192.0	6841.0	\N	\N	\N	\N	\N	\N	\N	\N	130	\N	\N
129	QUINTERO PORTOCARRERO KELY	2	2016-12-16 18:46:10.245226	2016-12-16 18:46:10.245226	\N	59311708	2211374.0	192.0	11518.0	\N	\N	\N	\N	\N	\N	\N	\N	5	\N	\N
130	MARTINEZ GAMBOA BLANCA CECILIA	2	2016-12-16 18:46:10.249704	2016-12-16 18:46:10.249704	\N	60336871	1071222.0	192.0	5579.0	\N	\N	\N	\N	\N	\N	\N	\N	58	\N	\N
131	PEDRAZA RIVERA ANGELA ROCIO	2	2016-12-16 18:46:10.254175	2016-12-16 18:46:10.254175	\N	65774695	3839928.0	192.0	20000.0	\N	\N	\N	\N	\N	\N	\N	\N	74	\N	\N
132	LOSADA COBO LILIAN PATRICIA	2	2016-12-16 18:46:10.258769	2016-12-16 18:46:10.258769	\N	66659301	1376310.0	192.0	7168.0	\N	\N	\N	\N	\N	\N	\N	\N	45	\N	\N
133	ARCE ARCE ANGELICA MARIA	2	2016-12-16 18:46:10.265678	2016-12-16 18:46:10.265678	\N	66660444	2540539.0	192.0	13232.0	\N	\N	\N	\N	\N	\N	\N	\N	44	\N	\N
134	MEDINA OCAMPO LILIANA PATRICIA	2	2016-12-16 18:46:10.270251	2016-12-16 18:46:10.270251	\N	66678171	2263559.0	192.0	11789.0	\N	\N	\N	\N	\N	\N	\N	\N	56	\N	\N
135	HURTADO CHARRIA ALEJANDRA	2	2016-12-16 18:46:10.27464	2016-12-16 18:46:10.27464	\N	66762985	1746055.0	192.0	9094.0	\N	\N	\N	\N	\N	\N	\N	\N	35	\N	\N
136	LOPEZ CASTANO ADRIANA LUCIA	2	2016-12-16 18:46:10.280516	2016-12-16 18:46:10.280516	\N	66766885	7223905.0	192.0	37625.0	\N	\N	\N	\N	\N	\N	\N	\N	88	\N	\N
137	CANIZALES VARGAS CLAUDIA PATRICIA	2	2016-12-16 18:46:10.284836	2016-12-16 18:46:10.284836	\N	66769450	5393794.0	192.0	28093.0	\N	\N	\N	\N	\N	\N	\N	\N	92	\N	\N
138	PORTILLO RODRIGUEZ GRACIELA	2	2016-12-16 18:46:10.289151	2016-12-16 18:46:10.289151	\N	66771615	1603045.0	192.0	8349.0	\N	\N	\N	\N	\N	\N	\N	\N	44	\N	\N
139	GOMEZ BOLANOS EDELMIRA	2	2016-12-16 18:46:10.293703	2016-12-16 18:46:10.293703	\N	66774135	4620762.0	192.0	24066.0	\N	\N	\N	\N	\N	\N	\N	\N	92	\N	\N
140	GARCIA ORTIZ PAOLA ANDREA	2	2016-12-16 18:46:10.297907	2016-12-16 18:46:10.297907	\N	66783692	5326552.0	192.0	27742.0	\N	\N	\N	\N	\N	\N	\N	\N	104	\N	\N
141	LOPEZ ARAQUE MONICA ALEXANDRA	2	2016-12-16 18:46:10.302386	2016-12-16 18:46:10.302386	\N	66783736	2271859.0	192.0	11833.0	\N	\N	\N	\N	\N	\N	\N	\N	98	\N	\N
142	GOMEZ REINA FANNY	2	2016-12-16 18:46:10.306784	2016-12-16 18:46:10.306784	\N	66817653	1635174.0	192.0	8517.0	\N	\N	\N	\N	\N	\N	\N	\N	140	\N	\N
143	BENAVIDEZ TRUJILLO LYDA	2	2016-12-16 18:46:10.310914	2016-12-16 18:46:10.310914	\N	66819934	2465406.0	192.0	12841.0	\N	\N	\N	\N	\N	\N	\N	\N	133	\N	\N
144	MEDINA CLAUDIA PATRICIA	2	2016-12-16 18:46:10.315084	2016-12-16 18:46:10.315084	\N	66826896	2611068.0	192.0	13599.0	\N	\N	\N	\N	\N	\N	\N	\N	44	\N	\N
145	CORTES ANGULO NYDIA ESTHER	2	2016-12-16 18:46:10.31978	2016-12-16 18:46:10.31978	\N	66827676	1613878.0	192.0	8406.0	\N	\N	\N	\N	\N	\N	\N	\N	27	\N	\N
146	ALEGRIA RIVERA MARIA ALEXANDRA	2	2016-12-16 18:46:10.324186	2016-12-16 18:46:10.324186	\N	66827900	4263312.0	192.0	22205.0	\N	\N	\N	\N	\N	\N	\N	\N	66	\N	\N
147	RAMIREZ ARCOS ALEXANDRA	2	2016-12-16 18:46:10.328587	2016-12-16 18:46:10.328587	\N	66831421	1461235.0	192.0	7611.0	\N	\N	\N	\N	\N	\N	\N	\N	130	\N	\N
148	MORALES MENDEZ MONICA ANDREA	2	2016-12-16 18:46:10.332887	2016-12-16 18:46:10.332887	\N	66837370	5238768.0	192.0	27285.0	\N	\N	\N	\N	\N	\N	\N	\N	92	\N	\N
149	CASTRO ESPADAFORA OLGA LUCIA	2	2016-12-16 18:46:10.337467	2016-12-16 18:46:10.337467	\N	66855017	3112920.0	192.0	16213.0	\N	\N	\N	\N	\N	\N	\N	\N	72	\N	\N
150	MENDOZA DOMINGUEZ LILIANA	2	2016-12-16 18:46:10.341988	2016-12-16 18:46:10.341988	\N	66877351	3018044.0	192.0	15719.0	\N	\N	\N	\N	\N	\N	\N	\N	133	\N	\N
151	NEGRET BURBANO YAMILETH	2	2016-12-16 18:46:10.346395	2016-12-16 18:46:10.346395	\N	66879324	792432.0	192.0	4127.0	\N	\N	\N	\N	\N	\N	\N	\N	8	\N	\N
152	SERRANO ROCHA GLADYS	2	2016-12-16 18:46:10.350976	2016-12-16 18:46:10.350976	\N	66902538	2314242.0	192.0	12053.0	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N
153	ALFONSO DE LA TORRE SAMED PATRICIA	2	2016-12-16 18:46:10.355782	2016-12-16 18:46:10.355782	\N	66906108	1608698.0	192.0	8379.0	\N	\N	\N	\N	\N	\N	\N	\N	144	\N	\N
154	MEJIA LEON ERIKA	2	2016-12-16 18:46:10.360149	2016-12-16 18:46:10.360149	\N	66908736	1313566.0	192.0	6841.0	\N	\N	\N	\N	\N	\N	\N	\N	64	\N	\N
155	MEJIA CRUZ CLAUDIA MILENA	2	2016-12-16 18:46:10.364565	2016-12-16 18:46:10.364565	\N	66913099	1704101.0	192.0	8876.0	\N	\N	\N	\N	\N	\N	\N	\N	95	\N	\N
156	VELASCO MARIA CECILIA	2	2016-12-16 18:46:10.369106	2016-12-16 18:46:10.369106	\N	66914143	2826302.0	192.0	14720.0	\N	\N	\N	\N	\N	\N	\N	\N	44	\N	\N
157	BORRERO PEREZ CLAUDIA JIMENA	2	2016-12-16 18:46:10.37335	2016-12-16 18:46:10.37335	\N	66918423	1551819.0	192.0	8082.0	\N	\N	\N	\N	\N	\N	\N	\N	43	\N	\N
158	AGUDELO TOVAR NUBIA PATRICIA	2	2016-12-16 18:46:10.377518	2016-12-16 18:46:10.377518	\N	66920297	2203434.0	192.0	11476.0	\N	\N	\N	\N	\N	\N	\N	\N	44	\N	\N
159	TORRES CHAQUEA FLOR AMANDA	2	2016-12-16 18:46:10.382511	2016-12-16 18:46:10.382511	\N	66920819	1331249.0	192.0	6934.0	\N	\N	\N	\N	\N	\N	\N	\N	127	\N	\N
160	JARAMILLO LOAIZA JESSICA	2	2016-12-16 18:46:10.386732	2016-12-16 18:46:10.386732	\N	66933266	6225840.0	192.0	32426.0	\N	\N	\N	\N	\N	\N	\N	\N	106	\N	\N
161	MULCUE FLORES MARLENY	2	2016-12-16 18:46:10.391132	2016-12-16 18:46:10.391132	\N	66947539	1668481.0	192.0	8690.0	\N	\N	\N	\N	\N	\N	\N	\N	51	\N	\N
162	IBAGOS MUNETON JOHANNA	2	2016-12-16 18:46:10.395448	2016-12-16 18:46:10.395448	\N	66954919	2360095.0	192.0	12292.0	\N	\N	\N	\N	\N	\N	\N	\N	30	\N	\N
163	VELEZ MONTILLA VIVIANA FARLEY	2	2016-12-16 18:46:10.399782	2016-12-16 18:46:10.399782	\N	66970474	2213632.0	192.0	11529.0	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N
164	CASTRILLON CASTANO MARTHA VIVIANA	2	2016-12-16 18:46:10.404348	2016-12-16 18:46:10.404348	\N	66985411	1483718.0	192.0	7728.0	\N	\N	\N	\N	\N	\N	\N	\N	46	\N	\N
165	PIMIENTA CORTES ANGELICA SUMAYA	2	2016-12-16 18:46:10.408603	2016-12-16 18:46:10.408603	\N	66988227	2565046.0	192.0	13360.0	\N	\N	\N	\N	\N	\N	\N	\N	2	\N	\N
166	GOMEZ CASTANEDA BEATRIZ ELENA	2	2016-12-16 18:46:10.414036	2016-12-16 18:46:10.414036	\N	66993011	1613554.0	192.0	8404.0	\N	\N	\N	\N	\N	\N	\N	\N	142	\N	\N
167	MURCIA GOMEZ ADRIANA	2	2016-12-16 18:46:10.418815	2016-12-16 18:46:10.418815	\N	66994913	1798438.0	192.0	9367.0	\N	\N	\N	\N	\N	\N	\N	\N	23	\N	\N
168	ZULUAGA CARABALI ALEJANDRA	2	2016-12-16 18:46:10.423282	2016-12-16 18:46:10.423282	\N	67001964	1292997.0	192.0	6734.0	\N	\N	\N	\N	\N	\N	\N	\N	134	\N	\N
169	VALDES PIZARRO ERIKA MARIA	2	2016-12-16 18:46:10.428048	2016-12-16 18:46:10.428048	\N	67014453	3611953.0	192.0	18812.0	\N	\N	\N	\N	\N	\N	\N	\N	75	\N	\N
170	GUTIERREZ QUINTERO MARTHA LILIANA	2	2016-12-16 18:46:10.432771	2016-12-16 18:46:10.432771	\N	67014528	453425.0	192.0	2362.0	\N	\N	\N	\N	\N	\N	\N	\N	44	\N	\N
171	RODRIGUEZ CORTES MIRIAN PAOLA	2	2016-12-16 18:46:10.437751	2016-12-16 18:46:10.437751	\N	67017990	1392285.0	192.0	7251.0	\N	\N	\N	\N	\N	\N	\N	\N	109	\N	\N
172	VASQUEZ CANO CLAUDIA ISABEL	2	2016-12-16 18:46:10.442545	2016-12-16 18:46:10.442545	\N	67018568	1313567.0	192.0	6841.0	\N	\N	\N	\N	\N	\N	\N	\N	134	\N	\N
173	NARVAEZ SANCHEZ PAULA ANDREA	2	2016-12-16 18:46:10.447323	2016-12-16 18:46:10.447323	\N	67019051	1566784.0	192.0	8160.0	\N	\N	\N	\N	\N	\N	\N	\N	132	\N	\N
174	RODRIGUEZ GUTIERREZ ANA ROSA	2	2016-12-16 18:46:10.452251	2016-12-16 18:46:10.452251	\N	67024487	2496187.0	192.0	13001.0	\N	\N	\N	\N	\N	\N	\N	\N	44	\N	\N
175	HERNANDEZ BENAVIDEZ CAROLINA	2	2016-12-16 18:46:10.457071	2016-12-16 18:46:10.457071	\N	67026114	7760340.0	192.0	40418.0	\N	\N	\N	\N	\N	\N	\N	\N	111	\N	\N
176	BARONA PIEDRAHITA NATHALY	2	2016-12-16 18:46:10.462242	2016-12-16 18:46:10.462242	\N	67028511	1667156.0	192.0	8683.0	\N	\N	\N	\N	\N	\N	\N	\N	39	\N	\N
177	RODRIGUEZ HERRERA VIVIANA ANDREA	2	2016-12-16 18:46:10.466984	2016-12-16 18:46:10.466984	\N	67028855	1395309.0	192.0	7267.0	\N	\N	\N	\N	\N	\N	\N	\N	95	\N	\N
178	TASCON GALLO ANDREA	2	2016-12-16 18:46:10.471501	2016-12-16 18:46:10.471501	\N	67030286	6524850.0	192.0	33984.0	\N	\N	\N	\N	\N	\N	\N	\N	113	\N	\N
179	QUINTERO URIBE LADY YENCY	2	2016-12-16 18:46:10.475863	2016-12-16 18:46:10.475863	\N	67030432	3976410.0	192.0	20710.0	\N	\N	\N	\N	\N	\N	\N	\N	79	\N	\N
180	CORTES ORTIZ LEIDY JOHANNA	2	2016-12-16 18:46:10.480222	2016-12-16 18:46:10.480222	\N	67030967	1313750.0	192.0	6842.0	\N	\N	\N	\N	\N	\N	\N	\N	136	\N	\N
181	MEDINA DIAZ YIRLEIDY	2	2016-12-16 18:46:10.484385	2016-12-16 18:46:10.484385	\N	67037406	1901210.0	192.0	9902.0	\N	\N	\N	\N	\N	\N	\N	\N	30	\N	\N
182	RAMIREZ GOMEZ VIVIANA	2	2016-12-16 18:46:10.488554	2016-12-16 18:46:10.488554	\N	67038191	1275864.0	192.0	6645.0	\N	\N	\N	\N	\N	\N	\N	\N	130	\N	\N
183	BERMUDEZ RODRIGUEZ DIANA MARCELA	2	2016-12-16 18:46:10.492765	2016-12-16 18:46:10.492765	\N	67038298	2120232.0	192.0	11043.0	\N	\N	\N	\N	\N	\N	\N	\N	29	\N	\N
184	LOPEZ IPAZ LEIDY LILIANA	2	2016-12-16 18:46:10.497296	2016-12-16 18:46:10.497296	\N	67040106	1138360.0	192.0	5929.0	\N	\N	\N	\N	\N	\N	\N	\N	141	\N	\N
185	DIAZ ALBARRACIN MARIA DEL PILAR	2	2016-12-16 18:46:10.502018	2016-12-16 18:46:10.502018	\N	67041751	1124395.0	192.0	5856.0	\N	\N	\N	\N	\N	\N	\N	\N	139	\N	\N
186	CAICEDO LENIS DIANA JULIETH	2	2016-12-16 18:46:10.506418	2016-12-16 18:46:10.506418	\N	67045534	2527369.0	192.0	13163.0	\N	\N	\N	\N	\N	\N	\N	\N	44	\N	\N
187	GARCIA CASTELLAR LUIS ALFONSO	2	2016-12-16 18:46:10.511225	2016-12-16 18:46:10.511225	\N	72178954	5496563.0	192.0	28628.0	\N	\N	\N	\N	\N	\N	\N	\N	115	\N	\N
188	OCHOA LOPEZ EDWIN FABIAN	2	2016-12-16 18:46:10.516028	2016-12-16 18:46:10.516028	\N	74859055	2115786.0	192.0	11020.0	\N	\N	\N	\N	\N	\N	\N	\N	29	\N	\N
189	SANCHEZ CERON DIEGO FERNANDO	2	2016-12-16 18:46:10.520388	2016-12-16 18:46:10.520388	\N	75104042	27338400.0	192.0	142388.0	\N	\N	\N	\N	\N	\N	\N	\N	110	\N	\N
190	TANGARIFE DUQUE HOOVER ANTONIO	2	2016-12-16 18:46:10.52526	2016-12-16 18:46:10.52526	\N	75144385	4412139.0	192.0	22980.0	\N	\N	\N	\N	\N	\N	\N	\N	93	\N	\N
191	PARRA MARMOLEJO CARLOS ALBERTO	2	2016-12-16 18:46:10.52989	2016-12-16 18:46:10.52989	\N	76046516	6867882.0	192.0	35770.0	\N	\N	\N	\N	\N	\N	\N	\N	113	\N	\N
192	YELA MUNOZ IVAN EDUARDO	2	2016-12-16 18:46:10.53431	2016-12-16 18:46:10.53431	\N	76325944	16828224.0	192.0	87647.0	\N	\N	\N	\N	\N	\N	\N	\N	119	\N	\N
193	ARTUNDUAGA DIAZ LUIS ADONIS	2	2016-12-16 18:46:10.539003	2016-12-16 18:46:10.539003	\N	79261453	4304632.0	192.0	22420.0	\N	\N	\N	\N	\N	\N	\N	\N	147	\N	\N
194	GONZALEZ OROZCO VICTOR MANUEL	2	2016-12-16 18:46:10.543226	2016-12-16 18:46:10.543226	\N	80037348	1594089.0	192.0	8303.0	\N	\N	\N	\N	\N	\N	\N	\N	122	\N	\N
195	PLATA MOSQUERA CARLOS ANDRES	2	2016-12-16 18:46:10.547331	2016-12-16 18:46:10.547331	\N	86046832	31312847.0	192.0	163088.0	\N	\N	\N	\N	\N	\N	\N	\N	118	\N	\N
196	CRUZ RUSLBELL	2	2016-12-16 18:46:10.551744	2016-12-16 18:46:10.551744	\N	86079654	5404572.0	192.0	28149.0	\N	\N	\N	\N	\N	\N	\N	\N	92	\N	\N
197	MEDINA BOTIA JULIO CESAR	2	2016-12-16 18:46:10.556293	2016-12-16 18:46:10.556293	\N	91492203	2843136.0	192.0	14808.0	\N	\N	\N	\N	\N	\N	\N	\N	147	\N	\N
198	VALENCIA GUZMAN HERMAN	2	2016-12-16 18:46:10.560471	2016-12-16 18:46:10.560471	\N	94041861	3900909.0	192.0	20317.0	\N	\N	\N	\N	\N	\N	\N	\N	151	\N	\N
199	QUINTERO NUNEZ CRISTHIAM DAVID	2	2016-12-16 18:46:10.565284	2016-12-16 18:46:10.565284	\N	94063589	7576272.0	192.0	39460.0	\N	\N	\N	\N	\N	\N	\N	\N	112	\N	\N
200	BRAVO DIAZ ANDRES GONZALO	2	2016-12-16 18:46:10.569534	2016-12-16 18:46:10.569534	\N	94063875	4167559.0	192.0	21706.0	\N	\N	\N	\N	\N	\N	\N	\N	97	\N	\N
201	REYES BRINEZ JHON RICHARD	2	2016-12-16 18:46:10.573795	2016-12-16 18:46:10.573795	\N	94070229	2137538.0	192.0	11133.0	\N	\N	\N	\N	\N	\N	\N	\N	68	\N	\N
202	PORTILLO LOPEZ TULIO CESAR	2	2016-12-16 18:46:10.57816	2016-12-16 18:46:10.57816	\N	94070629	2089040.0	192.0	10880.0	\N	\N	\N	\N	\N	\N	\N	\N	44	\N	\N
203	BOTINA MADRONERO EDUARDO JULIAN	2	2016-12-16 18:46:10.582514	2016-12-16 18:46:10.582514	\N	94073417	1635174.0	192.0	8517.0	\N	\N	\N	\N	\N	\N	\N	\N	135	\N	\N
204	MARQUEZ OCAMPO JHON EDINSON	2	2016-12-16 18:46:10.586756	2016-12-16 18:46:10.586756	\N	94314657	5442077.0	192.0	28344.0	\N	\N	\N	\N	\N	\N	\N	\N	92	\N	\N
205	COLORADO OCORO ERWIN	2	2016-12-16 18:46:10.590935	2016-12-16 18:46:10.590935	\N	94326372	1500838.0	192.0	7817.0	\N	\N	\N	\N	\N	\N	\N	\N	31	\N	\N
206	MONTILLA CORAL DAVID ALEXANDER	2	2016-12-16 18:46:10.595284	2016-12-16 18:46:10.595284	\N	94328845	46151838.0	192.0	240374.0	\N	\N	\N	\N	\N	\N	\N	\N	110	\N	\N
207	AYERBE CERON GUSTAVO ADOLFO	2	2016-12-16 18:46:10.599687	2016-12-16 18:46:10.599687	\N	94371713	8736918.0	192.0	45505.0	\N	\N	\N	\N	\N	\N	\N	\N	111	\N	\N
208	PAZ RODRIGUEZ LUIS EDISON	2	2016-12-16 18:46:10.604147	2016-12-16 18:46:10.604147	\N	94382634	3976411.0	192.0	20710.0	\N	\N	\N	\N	\N	\N	\N	\N	78	\N	\N
209	VARELA VILLEGAS ALEJANDRO	2	2016-12-16 18:46:10.608564	2016-12-16 18:46:10.608564	\N	94385374	22533372.0	192.0	117361.0	\N	\N	\N	\N	\N	\N	\N	\N	99	\N	\N
210	MURILLO PULGARIN WILBER	2	2016-12-16 18:46:10.612872	2016-12-16 18:46:10.612872	\N	94391891	3970244.0	192.0	20678.0	\N	\N	\N	\N	\N	\N	\N	\N	92	\N	\N
211	ESCOBAR GALVIS DIEGO FERNANDO	2	2016-12-16 18:46:10.617302	2016-12-16 18:46:10.617302	\N	94404963	7634761.0	192.0	39764.0	\N	\N	\N	\N	\N	\N	\N	\N	120	\N	\N
212	CALVACHE DORADO ERNESTO	2	2016-12-16 18:46:10.621673	2016-12-16 18:46:10.621673	\N	94405800	5787813.0	192.0	30145.0	\N	\N	\N	\N	\N	\N	\N	\N	149	\N	\N
213	CHEPE ALMENDRA NILSON	2	2016-12-16 18:46:10.626148	2016-12-16 18:46:10.626148	\N	94446132	2132195.0	192.0	11105.0	\N	\N	\N	\N	\N	\N	\N	\N	29	\N	\N
214	RAMIREZ BASTIDAS RICHARD RODRIGO	2	2016-12-16 18:46:10.630326	2016-12-16 18:46:10.630326	\N	94452405	3174593.0	192.0	16534.0	\N	\N	\N	\N	\N	\N	\N	\N	148	\N	\N
215	ROJAS VALDES ALFREDO	2	2016-12-16 18:46:10.634451	2016-12-16 18:46:10.634451	\N	94457740	3333219.0	192.0	17361.0	\N	\N	\N	\N	\N	\N	\N	\N	66	\N	\N
216	BEDOYA BARRERO CARLOS AUGUSTO	2	2016-12-16 18:46:10.638457	2016-12-16 18:46:10.638457	\N	94496361	4208100.0	192.0	21917.0	\N	\N	\N	\N	\N	\N	\N	\N	70	\N	\N
217	LOAIZA GUTIERREZ LUIS GABRIEL	2	2016-12-16 18:46:10.642844	2016-12-16 18:46:10.642844	\N	94522603	6868099.0	192.0	35771.0	\N	\N	\N	\N	\N	\N	\N	\N	150	\N	\N
218	JORDAN TREJOS VICTOR HUGO	2	2016-12-16 18:46:10.647271	2016-12-16 18:46:10.647271	\N	94526402	4617891.0	192.0	24052.0	\N	\N	\N	\N	\N	\N	\N	\N	97	\N	\N
219	GUTIERREZ REALPE CAMILO	2	2016-12-16 18:46:10.651716	2016-12-16 18:46:10.651716	\N	94536211	1596679.0	192.0	8316.0	\N	\N	\N	\N	\N	\N	\N	\N	123	\N	\N
220	BERMUDEZ BRAVO WILLIAM FERN	2	2016-12-16 18:46:10.656148	2016-12-16 18:46:10.656148	\N	94538855	3490380.0	192.0	18179.0	\N	\N	\N	\N	\N	\N	\N	\N	114	\N	\N
221	PAREDES PEREA ALEXANDER	2	2016-12-16 18:46:10.660723	2016-12-16 18:46:10.660723	\N	94543739	2186833.0	192.0	11390.0	\N	\N	\N	\N	\N	\N	\N	\N	45	\N	\N
222	VALENCIA TORRES SIGIFREDO MARTIN	2	2016-12-16 18:46:10.665289	2016-12-16 18:46:10.665289	\N	98571959	2199014.0	192.0	11453.0	\N	\N	\N	\N	\N	\N	\N	\N	33	\N	\N
223	GOMEZ GONZALEZ DAIANA ALEJANDRA	2	2016-12-16 18:46:10.670181	2016-12-16 18:46:10.670181	\N	1007886279	2054652.0	192.0	10701.0	\N	\N	\N	\N	\N	\N	\N	\N	45	\N	\N
224	SALAZAR TRUJILLO JUAN DANIEL	2	2016-12-16 18:46:10.674429	2016-12-16 18:46:10.674429	\N	1082124907	2344570.0	192.0	12211.0	\N	\N	\N	\N	\N	\N	\N	\N	47	\N	\N
225	ESPANA TEPUD YANETH JOSEFINA	2	2016-12-16 18:46:10.678683	2016-12-16 18:46:10.678683	\N	1085253939	2944918.0	192.0	15338.0	\N	\N	\N	\N	\N	\N	\N	\N	90	\N	\N
226	HERRERA JIMENEZ ANDRES FELIPE	2	2016-12-16 18:46:10.683545	2016-12-16 18:46:10.683545	\N	1094902532	3716125.0	192.0	19355.0	\N	\N	\N	\N	\N	\N	\N	\N	114	\N	\N
227	OSORIO CASTANEDA MARIA DEL PILAR	2	2016-12-16 18:46:10.687955	2016-12-16 18:46:10.687955	\N	1107034435	8425763.0	192.0	43884.0	\N	\N	\N	\N	\N	\N	\N	\N	26	\N	\N
228	GOMEZ ARANGO HEIDI VIVIANA	2	2016-12-16 18:46:10.692524	2016-12-16 18:46:10.692524	\N	1107041805	1313567.0	192.0	6841.0	\N	\N	\N	\N	\N	\N	\N	\N	64	\N	\N
229	COBO VIVEROS SARA MARIA	2	2016-12-16 18:46:10.69706	2016-12-16 18:46:10.69706	\N	1107043232	5339465.0	192.0	27810.0	\N	\N	\N	\N	\N	\N	\N	\N	116	\N	\N
230	PEREZ ROBAYO YESICA	2	2016-12-16 18:46:10.701532	2016-12-16 18:46:10.701532	\N	1107074485	1275949.0	192.0	6646.0	\N	\N	\N	\N	\N	\N	\N	\N	127	\N	\N
231	GONZALEZ ZAPATA LEIDY JOHANA	2	2016-12-16 18:46:10.706173	2016-12-16 18:46:10.706173	\N	1107082459	1331134.0	192.0	6933.0	\N	\N	\N	\N	\N	\N	\N	\N	48	\N	\N
232	CAMPO CALDON ANGELA VANESSA	2	2016-12-16 18:46:10.711064	2016-12-16 18:46:10.711064	\N	1107091927	792432.0	192.0	4127.0	\N	\N	\N	\N	\N	\N	\N	\N	9	\N	\N
233	GOMEZ CASTILLO SHIRLEY VIVI	2	2016-12-16 18:46:10.715317	2016-12-16 18:46:10.715317	\N	1107507550	779236.0	192.0	4059.0	\N	\N	\N	\N	\N	\N	\N	\N	13	\N	\N
234	SANCHEZ PIAMBA DILIA MIREYA              	2	2016-12-16 18:46:10.720236	2016-12-16 18:46:10.720236	\N	1112458491	1296123.0	192.0	6751.0	\N	\N	\N	\N	\N	\N	\N	\N	44	\N	\N
235	PRADA MOSQUERA VICTOR ANDRE	2	2016-12-16 18:46:10.725332	2016-12-16 18:46:10.725332	\N	1112459740	2087384.0	192.0	10872.0	\N	\N	\N	\N	\N	\N	\N	\N	55	\N	\N
236	MARTINEZ GUZMAN YASLIHN	2	2016-12-16 18:46:10.729826	2016-12-16 18:46:10.729826	\N	1112461973	2330195.0	192.0	12136.0	\N	\N	\N	\N	\N	\N	\N	\N	133	\N	\N
237	MARTINEZ MUNOZ CAROL BRIGGITE	2	2016-12-16 18:46:10.734286	2016-12-16 18:46:10.734286	\N	1112463408	1484661.0	192.0	7733.0	\N	\N	\N	\N	\N	\N	\N	\N	46	\N	\N
238	TAMAYO CHALARCA JULIAN ANDRES	2	2016-12-16 18:46:10.739707	2016-12-16 18:46:10.739707	\N	1112470429	1733737.0	192.0	9030.0	\N	\N	\N	\N	\N	\N	\N	\N	102	\N	\N
239	GARCIA OSORIO LUISA FERNANDA	2	2016-12-16 18:46:10.744126	2016-12-16 18:46:10.744126	\N	1112880663	1269285.0	192.0	6611.0	\N	\N	\N	\N	\N	\N	\N	\N	34	\N	\N
240	PUERTA MESA ANYI CAROLINA	2	2016-12-16 18:46:10.748749	2016-12-16 18:46:10.748749	\N	1113524336	2032787.0	192.0	10587.0	\N	\N	\N	\N	\N	\N	\N	\N	49	\N	\N
241	BECERRA SILVA CLEIBY	2	2016-12-16 18:46:10.754157	2016-12-16 18:46:10.754157	\N	1113618689	2259785.0	192.0	11770.0	\N	\N	\N	\N	\N	\N	\N	\N	45	\N	\N
242	VIVAS MAYOR HALLEN MARCELA	2	2016-12-16 18:46:10.75866	2016-12-16 18:46:10.75866	\N	1113631474	4979013.0	192.0	25932.0	\N	\N	\N	\N	\N	\N	\N	\N	89	\N	\N
243	GIRALDO BEJARANO NATALIA	2	2016-12-16 18:46:10.763361	2016-12-16 18:46:10.763361	\N	1113636495	1313567.0	192.0	6841.0	\N	\N	\N	\N	\N	\N	\N	\N	137	\N	\N
244	CORREA TRIANA ANGELA PATRIC	2	2016-12-16 18:46:10.77017	2016-12-16 18:46:10.77017	\N	1114059265	4187585.0	192.0	21810.0	\N	\N	\N	\N	\N	\N	\N	\N	93	\N	\N
245	ORTIZ VIVAS PAOLA XIMENA	2	2016-12-16 18:46:10.774711	2016-12-16 18:46:10.774711	\N	1114877272	1443183.0	192.0	7517.0	\N	\N	\N	\N	\N	\N	\N	\N	51	\N	\N
246	TROCHEZ CUASTUMAL YULIANA	2	2016-12-16 18:46:10.780118	2016-12-16 18:46:10.780118	\N	1114880351	2345802.0	192.0	12218.0	\N	\N	\N	\N	\N	\N	\N	\N	44	\N	\N
247	BERNAL RIVERA ANDERSON EFRAIN	2	2016-12-16 18:46:10.786398	2016-12-16 18:46:10.786398	\N	1114881434	1491491.0	192.0	7768.0	\N	\N	\N	\N	\N	\N	\N	\N	37	\N	\N
248	QUINTERO ANDRADE YEISON RIVER	2	2016-12-16 18:46:10.792083	2016-12-16 18:46:10.792083	\N	1115183828	2445081.0	192.0	12735.0	\N	\N	\N	\N	\N	\N	\N	\N	44	\N	\N
249	HERNANDEZ CHALACAN LEIDY JOHANA	2	2016-12-16 18:46:10.7963	2016-12-16 18:46:10.7963	\N	1118282319	2484215.0	192.0	12939.0	\N	\N	\N	\N	\N	\N	\N	\N	45	\N	\N
250	HURTADO CANDELO VIVIANA	2	2016-12-16 18:46:10.800363	2016-12-16 18:46:10.800363	\N	1118283376	1361718.0	192.0	7092.0	\N	\N	\N	\N	\N	\N	\N	\N	43	\N	\N
251	PENA CARRILLO SINDY YULIETH	2	2016-12-16 18:46:10.805178	2016-12-16 18:46:10.805178	\N	1118286321	1308387.0	192.0	6815.0	\N	\N	\N	\N	\N	\N	\N	\N	130	\N	\N
252	SANCHEZ VALENCIA KELLY JOHANNA	2	2016-12-16 18:46:10.809611	2016-12-16 18:46:10.809611	\N	1118288462	3007171.0	192.0	15662.0	\N	\N	\N	\N	\N	\N	\N	\N	44	\N	\N
253	SALAS VIDAL FAISULY   	2	2016-12-16 18:46:10.814846	2016-12-16 18:46:10.814846	\N	1118290545	102977.0	192.0	536.0	\N	\N	\N	\N	\N	\N	\N	\N	14	\N	\N
254	CUERO CUERO YISENIA	2	2016-12-16 18:46:10.820454	2016-12-16 18:46:10.820454	\N	1118299054	1060660.0	192.0	5524.0	\N	\N	\N	\N	\N	\N	\N	\N	128	\N	\N
255	MEZU SOLIS EYMI RAQUEL	2	2016-12-16 18:46:10.825316	2016-12-16 18:46:10.825316	\N	1121834890	2352933.0	192.0	12255.0	\N	\N	\N	\N	\N	\N	\N	\N	44	\N	\N
256	ZAPATA MEDINA NATALIA CAMILA	2	2016-12-16 18:46:10.831241	2016-12-16 18:46:10.831241	\N	1121845603	3822559.0	192.0	19909.0	\N	\N	\N	\N	\N	\N	\N	\N	91	\N	\N
257	LOOR ORTEGA KLEVER ESTALIN	2	2016-12-16 18:46:10.835772	2016-12-16 18:46:10.835772	\N	1127452275	396216.0	192.0	2064.0	\N	\N	\N	\N	\N	\N	\N	\N	9	\N	\N
258	LORA DE ORO EYLLEN MARGARITA             	2	2016-12-16 18:46:10.840797	2016-12-16 18:46:10.840797	\N	1128047633	2581850.0	192.0	13447.0	\N	\N	\N	\N	\N	\N	\N	\N	87	\N	\N
259	HURTATIZ TABARES CECILIA	2	2016-12-16 18:46:10.845665	2016-12-16 18:46:10.845665	\N	1130586271	1645228.0	192.0	8569.0	\N	\N	\N	\N	\N	\N	\N	\N	56	\N	\N
260	FLOREZ LOPEZ MARIA DE LOS ANGELES	2	2016-12-16 18:46:10.850085	2016-12-16 18:46:10.850085	\N	1130601710	748188.0	192.0	3897.0	\N	\N	\N	\N	\N	\N	\N	\N	127	\N	\N
261	ZULUAGA COLONIA YULY ANDREA	2	2016-12-16 18:46:10.854315	2016-12-16 18:46:10.854315	\N	1130605693	1360223.0	192.0	7084.0	\N	\N	\N	\N	\N	\N	\N	\N	36	\N	\N
262	SERNA GARCIA YULY VIVIANA	2	2016-12-16 18:46:10.858745	2016-12-16 18:46:10.858745	\N	1130611903	1483718.0	192.0	7728.0	\N	\N	\N	\N	\N	\N	\N	\N	46	\N	\N
263	CABRERA BLANDON JENNIFER JOHANNA	2	2016-12-16 18:46:10.863564	2016-12-16 18:46:10.863564	\N	1130616183	1627098.0	192.0	8474.0	\N	\N	\N	\N	\N	\N	\N	\N	40	\N	\N
264	GUERRERO MARTINEZ VERONICA CRISTINA	2	2016-12-16 18:46:10.86827	2016-12-16 18:46:10.86827	\N	1130630545	4681640.0	192.0	24384.0	\N	\N	\N	\N	\N	\N	\N	\N	94	\N	\N
265	RUIZ TOVAR ERWIN STEVEN	2	2016-12-16 18:46:10.872883	2016-12-16 18:46:10.872883	\N	1130630769	6872746.0	192.0	35796.0	\N	\N	\N	\N	\N	\N	\N	\N	111	\N	\N
266	GIRALDO HINCAPIE CAMILO ERNESTO	2	2016-12-16 18:46:10.877287	2016-12-16 18:46:10.877287	\N	1130631348	8365375.0	192.0	43570.0	\N	\N	\N	\N	\N	\N	\N	\N	112	\N	\N
267	PALOMINO RUEDA JOHANA ESTHER	2	2016-12-16 18:46:10.88185	2016-12-16 18:46:10.88185	\N	1130646381	1252149.0	192.0	6522.0	\N	\N	\N	\N	\N	\N	\N	\N	132	\N	\N
268	AGUILAR PEREZ CAROLINA	2	2016-12-16 18:46:10.886142	2016-12-16 18:46:10.886142	\N	1130647001	1551044.0	192.0	8078.0	\N	\N	\N	\N	\N	\N	\N	\N	51	\N	\N
269	BARRAGAN PINEDA JOAN HELIODORO	2	2016-12-16 18:46:10.891263	2016-12-16 18:46:10.891263	\N	1130659098	2071452.0	192.0	10789.0	\N	\N	\N	\N	\N	\N	\N	\N	47	\N	\N
270	MENESES LASSO LEIDY JANETH	2	2016-12-16 18:46:10.895376	2016-12-16 18:46:10.895376	\N	1130663537	1166065.0	192.0	6073.0	\N	\N	\N	\N	\N	\N	\N	\N	142	\N	\N
271	ARCOS MARIN DIANA CAROLINA	2	2016-12-16 18:46:10.899731	2016-12-16 18:46:10.899731	\N	1130664622	5165339.0	192.0	26903.0	\N	\N	\N	\N	\N	\N	\N	\N	92	\N	\N
272	TABARES MELENDEZ OSCAR EDUARDO 	2	2016-12-16 18:46:10.904667	2016-12-16 18:46:10.904667	\N	1130664682	1876276.0	192.0	9772.0	\N	\N	\N	\N	\N	\N	\N	\N	41	\N	\N
273	REALPE GARCIA DAYHANA	2	2016-12-16 18:46:10.909019	2016-12-16 18:46:10.909019	\N	1130665983	3991811.0	192.0	20791.0	\N	\N	\N	\N	\N	\N	\N	\N	91	\N	\N
274	QUINONES TORO LEIDY VIVIANA  	2	2016-12-16 18:46:10.91364	2016-12-16 18:46:10.91364	\N	1130669957	474031.0	192.0	2469.0	\N	\N	\N	\N	\N	\N	\N	\N	42	\N	\N
275	LIBREROS SARMIENTO SUSANA MARCELA	2	2016-12-16 18:46:10.91814	2016-12-16 18:46:10.91814	\N	1130670165	1261163.0	192.0	6569.0	\N	\N	\N	\N	\N	\N	\N	\N	125	\N	\N
276	ARNEDO ESTRADA GUSTAVO ADOLFO	2	2016-12-16 18:46:10.922581	2016-12-16 18:46:10.922581	\N	1130674161	1270280.0	192.0	6616.0	\N	\N	\N	\N	\N	\N	\N	\N	65	\N	\N
277	AYALA RODRIGUEZ ALEX DAVID	2	2016-12-16 18:46:10.927137	2016-12-16 18:46:10.927137	\N	1130674890	1296667.0	192.0	6753.0	\N	\N	\N	\N	\N	\N	\N	\N	38	\N	\N
278	CHARRY MARIA FERNANDA	2	2016-12-16 18:46:10.931269	2016-12-16 18:46:10.931269	\N	1130675800	1370233.0	192.0	7137.0	\N	\N	\N	\N	\N	\N	\N	\N	60	\N	\N
279	ESCOBAR LOAIZA SANDRA YANETH	2	2016-12-16 18:46:10.936548	2016-12-16 18:46:10.936548	\N	1130680370	1534876.0	192.0	7994.0	\N	\N	\N	\N	\N	\N	\N	\N	135	\N	\N
280	BURBANO FRAGA CRISTIAN CAMILO	2	2016-12-16 18:46:10.940837	2016-12-16 18:46:10.940837	\N	1130682648	2118225.0	192.0	11032.0	\N	\N	\N	\N	\N	\N	\N	\N	24	\N	\N
281	GRAVENHORST REYES LINA MARIA	2	2016-12-16 18:46:10.946106	2016-12-16 18:46:10.946106	\N	1143824896	5839258.0	192.0	30413.0	\N	\N	\N	\N	\N	\N	\N	\N	113	\N	\N
282	LARGO DUQUE CRISTHIAN ANDRES	2	2016-12-16 18:46:10.951006	2016-12-16 18:46:10.951006	\N	1143825822	779237.0	192.0	4059.0	\N	\N	\N	\N	\N	\N	\N	\N	22	\N	\N
283	LABRADA ISABEL CRISTINA  	2	2016-12-16 18:46:10.955304	2016-12-16 18:46:10.955304	\N	1143826823	453425.0	192.0	2362.0	\N	\N	\N	\N	\N	\N	\N	\N	44	\N	\N
284	BASTIDAS SINISTERRA KAREM	2	2016-12-16 18:46:10.9607	2016-12-16 18:46:10.9607	\N	1143830971	1323537.0	192.0	6893.0	\N	\N	\N	\N	\N	\N	\N	\N	48	\N	\N
285	CORTES BURBANO DORA LILIA	2	2016-12-16 18:46:10.96578	2016-12-16 18:46:10.96578	\N	1143831997	1900476.0	192.0	9898.0	\N	\N	\N	\N	\N	\N	\N	\N	32	\N	\N
286	MUNOZ MENESES DEICY PAOLA	2	2016-12-16 18:46:10.970344	2016-12-16 18:46:10.970344	\N	1143835705	4263537.0	192.0	22206.0	\N	\N	\N	\N	\N	\N	\N	\N	93	\N	\N
287	CONTECHA MARIN ANGELICA	2	2016-12-16 18:46:10.975231	2016-12-16 18:46:10.975231	\N	1143836915	1138360.0	192.0	5929.0	\N	\N	\N	\N	\N	\N	\N	\N	141	\N	\N
288	ESCOBAR DIAZ JENNIFER	2	2016-12-16 18:46:10.979556	2016-12-16 18:46:10.979556	\N	1143845900	779236.0	192.0	4059.0	\N	\N	\N	\N	\N	\N	\N	\N	18	\N	\N
289	ROSERO MEDINA ANGELA	2	2016-12-16 18:46:10.98492	2016-12-16 18:46:10.98492	\N	1143851158	2159467.0	192.0	11247.0	\N	\N	\N	\N	\N	\N	\N	\N	45	\N	\N
290	FORY AGUIRRE CARLOS ANDRES	2	2016-12-16 18:46:10.990285	2016-12-16 18:46:10.990285	\N	1143856389	792432.0	192.0	4127.0	\N	\N	\N	\N	\N	\N	\N	\N	16	\N	\N
291	GONZALEZ FERRY DAVID FERNANDO	2	2016-12-16 18:46:10.994804	2016-12-16 18:46:10.994804	\N	1143857931	2114666.0	192.0	11014.0	\N	\N	\N	\N	\N	\N	\N	\N	45	\N	\N
292	RIVERA MUNOZ ANGY TATIANA	2	2016-12-16 18:46:10.999132	2016-12-16 18:46:10.999132	\N	1143868490	1605060.0	192.0	8360.0	\N	\N	\N	\N	\N	\N	\N	\N	39	\N	\N
293	PUERTA VALLER KATHERIN VIVIANA	2	2016-12-16 18:46:11.003897	2016-12-16 18:46:11.003897	\N	1143928693	792432.0	192.0	4127.0	\N	\N	\N	\N	\N	\N	\N	\N	8	\N	\N
294	HERNANDEZ BUSTAMANTE GERALD	2	2016-12-16 18:46:11.00813	2016-12-16 18:46:11.00813	\N	1143937421	2213632.0	192.0	11529.0	\N	\N	\N	\N	\N	\N	\N	\N	7	\N	\N
295	MURILLAS CAICEDO CAROLINA	2	2016-12-16 18:46:11.012189	2016-12-16 18:46:11.012189	\N	1143938367	798942.0	192.0	4161.0	\N	\N	\N	\N	\N	\N	\N	\N	48	\N	\N
296	GUERRERO COLLAZOS KARINA JULIETH         	2	2016-12-16 18:46:11.017058	2016-12-16 18:46:11.017058	\N	1143943727	654541.0	192.0	3409.0	\N	\N	\N	\N	\N	\N	\N	\N	10	\N	\N
297	PANTOJA GUACHAVEZ JESSICA KATERINE	2	2016-12-16 18:46:11.021181	2016-12-16 18:46:11.021181	\N	1143950548	1473288.0	192.0	7673.0	\N	\N	\N	\N	\N	\N	\N	\N	46	\N	\N
298	BURGOS ARCE MAYERLING	2	2016-12-16 18:46:11.025977	2016-12-16 18:46:11.025977	\N	1143956298	779236.0	192.0	4059.0	\N	\N	\N	\N	\N	\N	\N	\N	19	\N	\N
299	CALVACHE VASQUEZ KAREN YULIANA	2	2016-12-16 18:46:11.030148	2016-12-16 18:46:11.030148	\N	1143957902	1718356.0	192.0	8950.0	\N	\N	\N	\N	\N	\N	\N	\N	62	\N	\N
300	INSUASTI ANACONA ANGELA DANIELA	2	2016-12-16 18:46:11.034416	2016-12-16 18:46:11.034416	\N	1143985359	792432.0	192.0	4127.0	\N	\N	\N	\N	\N	\N	\N	\N	20	\N	\N
301	FORERO MESA CAMILO	2	2016-12-16 18:46:11.038937	2016-12-16 18:46:11.038937	\N	1144025506	4448922.0	192.0	23171.0	\N	\N	\N	\N	\N	\N	\N	\N	93	\N	\N
302	CRUZ BENITEZ DUBERNEY	2	2016-12-16 18:46:11.043647	2016-12-16 18:46:11.043647	\N	1144027737	1321737.0	192.0	6884.0	\N	\N	\N	\N	\N	\N	\N	\N	63	\N	\N
303	MONDRAGON CAMPO ANGELA MARI	2	2016-12-16 18:46:11.048308	2016-12-16 18:46:11.048308	\N	1144029456	2767040.0	192.0	14412.0	\N	\N	\N	\N	\N	\N	\N	\N	6	\N	\N
304	MEDINA LOAIZA LUZ KARIME	2	2016-12-16 18:46:11.052843	2016-12-16 18:46:11.052843	\N	1144034045	1963222.0	192.0	10225.0	\N	\N	\N	\N	\N	\N	\N	\N	45	\N	\N
305	HERNANDEZ GIRALDO LUZ ANGELA	2	2016-12-16 18:46:11.057126	2016-12-16 18:46:11.057126	\N	1144040658	1577795.0	192.0	8218.0	\N	\N	\N	\N	\N	\N	\N	\N	112	\N	\N
306	ARIAS CRUZ LINA MARIA	2	2016-12-16 18:46:11.062068	2016-12-16 18:46:11.062068	\N	1144041318	940656.0	192.0	4899.0	\N	\N	\N	\N	\N	\N	\N	\N	142	\N	\N
307	MURIEL TORRES ATANAEL	2	2016-12-16 18:46:11.067119	2016-12-16 18:46:11.067119	\N	1144045313	1409992.0	192.0	7344.0	\N	\N	\N	\N	\N	\N	\N	\N	56	\N	\N
308	TORRADO VARON CAMILA ANDREA	2	2016-12-16 18:46:11.071457	2016-12-16 18:46:11.071457	\N	1144048759	2524860.0	192.0	13150.0	\N	\N	\N	\N	\N	\N	\N	\N	3	\N	\N
309	TRUJILLO SARMIENTO ANA GISS	2	2016-12-16 18:46:11.076895	2016-12-16 18:46:11.076895	\N	1144064080	2483192.0	192.0	12933.0	\N	\N	\N	\N	\N	\N	\N	\N	4	\N	\N
310	LLANTEN SAMBONI MAURICIO	2	2016-12-16 18:46:11.08111	2016-12-16 18:46:11.08111	\N	1144075389	792432.0	192.0	4127.0	\N	\N	\N	\N	\N	\N	\N	\N	20	\N	\N
311	SAAVEDRA OSSA FATIMA JOHANNA	2	2016-12-16 18:46:11.085956	2016-12-16 18:46:11.085956	\N	1144125809	102977.0	192.0	536.0	\N	\N	\N	\N	\N	\N	\N	\N	12	\N	\N
312	BELTRAN BALCAZAR MONICA XIOMARA	2	2016-12-16 18:46:11.091118	2016-12-16 18:46:11.091118	\N	1144129307	2490935.0	192.0	12974.0	\N	\N	\N	\N	\N	\N	\N	\N	133	\N	\N
313	SANCHEZ ERAZO YENTHYL	2	2016-12-16 18:46:11.09568	2016-12-16 18:46:11.09568	\N	1144129911	792432.0	192.0	4127.0	\N	\N	\N	\N	\N	\N	\N	\N	17	\N	\N
314	CASTRO ESPANA ANGI VANESSA	2	2016-12-16 18:46:11.101236	2016-12-16 18:46:11.101236	\N	1144134221	1684415.0	192.0	8773.0	\N	\N	\N	\N	\N	\N	\N	\N	95	\N	\N
315	CASTANO PULGARIN JULIANA	2	2016-12-16 18:46:11.105537	2016-12-16 18:46:11.105537	\N	1144135673	2276808.0	192.0	11858.0	\N	\N	\N	\N	\N	\N	\N	\N	44	\N	\N
316	ARENAS GARCIA JHEYCOL ANTONIO	2	2016-12-16 18:46:11.110777	2016-12-16 18:46:11.110777	\N	1144140684	1361677.0	192.0	7092.0	\N	\N	\N	\N	\N	\N	\N	\N	48	\N	\N
317	RIOS ALAGUNA JEIMY PAOLA	2	2016-12-16 18:46:11.115223	2016-12-16 18:46:11.115223	\N	1144143634	779236.0	192.0	4059.0	\N	\N	\N	\N	\N	\N	\N	\N	22	\N	\N
318	BOLANOS OCAMPO MATTHEUS BRYAM	2	2016-12-16 18:46:11.119632	2016-12-16 18:46:11.119632	\N	1144146440	2447230.0	192.0	12746.0	\N	\N	\N	\N	\N	\N	\N	\N	44	\N	\N
319	NARVAEZ MUNOZ LEIDY ANDREA	2	2016-12-16 18:46:11.124101	2016-12-16 18:46:11.124101	\N	1144148617	1392285.0	192.0	7251.0	\N	\N	\N	\N	\N	\N	\N	\N	52	\N	\N
320	VELASCO HOLGUIN MARIA FERNANDA	2	2016-12-16 18:46:11.128128	2016-12-16 18:46:11.128128	\N	1144154141	1453013.0	192.0	7568.0	\N	\N	\N	\N	\N	\N	\N	\N	59	\N	\N
321	VALENCIA GIRALDO LUIS ALBERTO	2	2016-12-16 18:46:11.132606	2016-12-16 18:46:11.132606	\N	1144156175	1830556.0	192.0	9534.0	\N	\N	\N	\N	\N	\N	\N	\N	47	\N	\N
322	ROLDAN DAZA ESTEFANIA	2	2016-12-16 18:46:11.137524	2016-12-16 18:46:11.137524	\N	1144157395	2206280.0	192.0	11491.0	\N	\N	\N	\N	\N	\N	\N	\N	47	\N	\N
323	RAMIREZ ALARCON GENNYFHER CAROLINA	2	2016-12-16 18:46:11.141914	2016-12-16 18:46:11.141914	\N	1144159606	913162.0	192.0	4756.0	\N	\N	\N	\N	\N	\N	\N	\N	127	\N	\N
324	SANCHEZ HURTADO LISALIA	2	2016-12-16 18:46:11.146167	2016-12-16 18:46:11.146167	\N	1144160213	792432.0	192.0	4127.0	\N	\N	\N	\N	\N	\N	\N	\N	9	\N	\N
325	REBOLLEDO VALDERRAMA JENNIF	2	2016-12-16 18:46:11.151113	2016-12-16 18:46:11.151113	\N	1144165451	779236.0	192.0	4059.0	\N	\N	\N	\N	\N	\N	\N	\N	15	\N	\N
326	HINCAPIE MARTINEZ CRISTIAN DAVID	2	2016-12-16 18:46:11.155513	2016-12-16 18:46:11.155513	\N	1144168713	1296667.0	192.0	6753.0	\N	\N	\N	\N	\N	\N	\N	\N	38	\N	\N
327	SANCHEZ VICTORIA CAROLINA	2	2016-12-16 18:46:11.159598	2016-12-16 18:46:11.159598	\N	1144169149	1396677.0	192.0	7274.0	\N	\N	\N	\N	\N	\N	\N	\N	43	\N	\N
328	CRUZ VELASCO LINDA YESENIA	2	2016-12-16 18:46:11.16426	2016-12-16 18:46:11.16426	\N	1144170930	1361718.0	192.0	7092.0	\N	\N	\N	\N	\N	\N	\N	\N	50	\N	\N
329	BRAVO CHAVEZ STEPHANIA	2	2016-12-16 18:46:11.169406	2016-12-16 18:46:11.169406	\N	1144173084	1242279.0	192.0	6470.0	\N	\N	\N	\N	\N	\N	\N	\N	37	\N	\N
330	ANGULO AGUIRRE ANDRES ALEXANDER	2	2016-12-16 18:46:11.173664	2016-12-16 18:46:11.173664	\N	1144175227	2524860.0	192.0	13150.0	\N	\N	\N	\N	\N	\N	\N	\N	100	\N	\N
331	MOLANO CUELLAR MIRNA JIMENA	2	2016-12-16 18:46:11.178079	2016-12-16 18:46:11.178079	\N	1144178223	102977.0	192.0	536.0	\N	\N	\N	\N	\N	\N	\N	\N	21	\N	\N
332	VELASQUEZ CORDOBA ELOISA	2	2016-12-16 18:46:11.182174	2016-12-16 18:46:11.182174	\N	1144197100	792432.0	192.0	4127.0	\N	\N	\N	\N	\N	\N	\N	\N	9	\N	\N
333	HURTADO HINESTROZA MARIA SUSANA	2	2016-12-16 18:46:11.187095	2016-12-16 18:46:11.187095	\N	1151937193	1361718.0	192.0	7092.0	\N	\N	\N	\N	\N	\N	\N	\N	28	\N	\N
334	ZAPATA LOPEZ CLARA INES	2	2016-12-16 18:46:11.191217	2016-12-16 18:46:11.191217	\N	1151952930	792432.0	192.0	4127.0	\N	\N	\N	\N	\N	\N	\N	\N	9	\N	\N
335	BROMURO DE IPRATROPIO 0.025% 15ML FRASCO - LAB.	1	2016-12-16 18:46:11.195318	2016-12-16 18:46:11.195318	\N	\N	\N	\N	\N	7640.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	1
336	MEDICADO RESOLUTE INTEGRITY 2.25MMX12MM	1	2016-12-16 18:46:11.19995	2016-12-16 18:46:11.19995	\N	\N	\N	\N	\N	1450000.0	0.0	150.0	2.0	\N	\N	\N	1	\N	\N	1
337	ACCUSEL ADULTO COLECTOR URETRAL 30MM TALLA M	1	2016-12-16 18:46:11.204221	2016-12-16 18:46:11.204221	\N	\N	\N	\N	\N	1556.0	0.0	150.0	3.0	\N	\N	\N	1	\N	\N	1
338	ACERO INOXIDABLE MONOFILAMENTO STEEL REF	1	2016-12-16 18:46:11.208693	2016-12-16 18:46:11.208693	\N	\N	\N	\N	\N	40000.0	0.0	150.0	9.0	\N	\N	\N	1	\N	\N	1
339	ACETAMINOFEN 500MG TABLETA - LAB. :GENFAR SA	1	2016-12-16 18:46:11.213245	2016-12-16 18:46:11.213245	\N	\N	\N	\N	\N	17.0	0.0	150.0	4.0	\N	\N	\N	1	\N	\N	1
340	ACETAMINOFEN 500MG TABLETA - LAB. :LABORATORIO	1	2016-12-16 18:46:11.217653	2016-12-16 18:46:11.217653	\N	\N	\N	\N	\N	16.0	0.0	150.0	169.0	\N	\N	\N	1	\N	\N	1
341	ACETILCISTEINA 600MG SOBRE - LAB. :LASANTE	1	2016-12-16 18:46:11.2218	2016-12-16 18:46:11.2218	\N	\N	\N	\N	\N	607.0	0.0	150.0	16.0	\N	\N	\N	1	\N	\N	1
342	ACICLOVIR 200MG TABLETA - LAB. :SANOFI WINTHROP	1	2016-12-16 18:46:11.226038	2016-12-16 18:46:11.226038	\N	\N	\N	\N	\N	34.0	0.0	150.0	26.0	\N	\N	\N	1	\N	\N	1
343	ACICLOVIR 250MG VIAL - LAB. :VITALIS S.A. C.I.	1	2016-12-16 18:46:11.230267	2016-12-16 18:46:11.230267	\N	\N	\N	\N	\N	5011.0	0.0	150.0	35.0	\N	\N	\N	1	\N	\N	1
344	ACICLOVIR 5% TUBO - LAB. :GENFAR SA	1	2016-12-16 18:46:11.234409	2016-12-16 18:46:11.234409	\N	\N	\N	\N	\N	1055.0	0.0	150.0	2.0	\N	\N	\N	1	\N	\N	1
345	ACIDO ACETIL SALICILICO (ASPIRINA) 500MG TABLETA -	1	2016-12-16 18:46:11.239009	2016-12-16 18:46:11.239009	\N	\N	\N	\N	\N	197.0	0.0	150.0	5.0	\N	\N	\N	1	\N	\N	1
346	ACIDO ACETILSALICILICO 100MG TABLETA EMPAQUE	1	2016-12-16 18:46:11.243312	2016-12-16 18:46:11.243312	\N	\N	\N	\N	\N	15.0	0.0	150.0	35.0	\N	\N	\N	1	\N	\N	1
347	ACIDO ASCORBICO 500MG TABLETA - LAB. :GENFAR SA	1	2016-12-16 18:46:11.247856	2016-12-16 18:46:11.247856	\N	\N	\N	\N	\N	160.0	0.0	150.0	23.0	\N	\N	\N	1	\N	\N	1
348	ACIDO FOLICO 1MG TABLETA - LAB. :LABORATORIOS	1	2016-12-16 18:46:11.25234	2016-12-16 18:46:11.25234	\N	\N	\N	\N	\N	20.0	0.0	150.0	5.0	\N	\N	\N	1	\N	\N	1
349	ACIDO FUSIDICO TUBO TUBO - LAB. :GENFAR SA	1	2016-12-16 18:46:11.256958	2016-12-16 18:46:11.256958	\N	\N	\N	\N	\N	2171.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	1
350	ACIDO POLIACRILICO (VISCOTEARS) 10G TUBO - LAB. :	1	2016-12-16 18:46:11.261281	2016-12-16 18:46:11.261281	\N	\N	\N	\N	\N	34428.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	1
351	ACIDO TRANEXAMICO (TRANEXAM) 500MG	1	2016-12-16 18:46:11.265573	2016-12-16 18:46:11.265573	\N	\N	\N	\N	\N	8625.0	0.0	150.0	40.0	\N	\N	\N	1	\N	\N	1
352	ACIDO VALPROICO (VALCOTE I.V.) 500MG AMPOLLA -	1	2016-12-16 18:46:11.269863	2016-12-16 18:46:11.269863	\N	\N	\N	\N	\N	20464.0	0.0	150.0	15.0	\N	\N	\N	1	\N	\N	1
353	ACIDO VALPROICO (FERBIN) 250MG CAPSULA - LAB. :C.I.	1	2016-12-16 18:46:11.274139	2016-12-16 18:46:11.274139	\N	\N	\N	\N	\N	97.0	0.0	150.0	12.0	\N	\N	\N	1	\N	\N	1
354	ACIDO VALPROICO (VALPROSID) 250MG/5ML FRASCO -	1	2016-12-16 18:46:11.278426	2016-12-16 18:46:11.278426	\N	\N	\N	\N	\N	5208.0	0.0	150.0	3.0	\N	\N	\N	1	\N	\N	1
355	ACIDO VALPROICO 5G/100ML FERBIN JARABE 120ML	1	2016-12-16 18:46:11.283906	2016-12-16 18:46:11.283906	\N	\N	\N	\N	\N	2404.0	0.0	150.0	2.0	\N	\N	\N	1	\N	\N	1
356	ACILIBRE PANTOPRAZOL 20MG TABLETA - LAB. :SANDOZ	1	2016-12-16 18:46:11.288192	2016-12-16 18:46:11.288192	\N	\N	\N	\N	\N	404.0	0.0	150.0	16.0	\N	\N	\N	1	\N	\N	1
357	ADAPTADOR COMBI ROJO (MACHO-HEMBRA) REF	1	2016-12-16 18:46:11.292276	2016-12-16 18:46:11.292276	\N	\N	\N	\N	\N	510.0	0.0	150.0	157.0	\N	\N	\N	1	\N	\N	1
358	ADAPTADOR EN T IDM REF1659 GBARCO EMPAQUE	1	2016-12-16 18:46:11.296762	2016-12-16 18:46:11.296762	\N	\N	\N	\N	\N	7378.0	0.0	150.0	2.0	\N	\N	\N	1	\N	\N	1
359	ADENOSINA (ADENOCOR) 6MG/2ML AMPOLLA - LAB. :	1	2016-12-16 18:46:11.301187	2016-12-16 18:46:11.301187	\N	\N	\N	\N	\N	105333.0	0.0	150.0	2.0	\N	\N	\N	1	\N	\N	1
360	ADHESIVO QUIRURGICO BIOGLUE- X 2 ML-JERINGA CON	1	2016-12-16 18:46:11.305777	2016-12-16 18:46:11.305777	\N	\N	\N	\N	\N	824000.0	0.0	150.0	2.0	\N	\N	\N	1	\N	\N	1
361	ADHESIVO QUIRURGICO BIOGLUE- X 5 ML-JERINGA CON	1	2016-12-16 18:46:11.310297	2016-12-16 18:46:11.310297	\N	\N	\N	\N	\N	1950000.0	0.0	150.0	2.0	\N	\N	\N	1	\N	\N	1
362	ADHESIVO TISULAR (HISTOACRYL) UNIDAD TUBO - LAB. :	1	2016-12-16 18:46:11.314279	2016-12-16 18:46:11.314279	\N	\N	\N	\N	\N	26815.0	0.0	150.0	2.0	\N	\N	\N	1	\N	\N	1
363	ADRENALINA 1MG AMPOLLA - LAB. :LABORATORIOS	1	2016-12-16 18:46:11.318677	2016-12-16 18:46:11.318677	\N	\N	\N	\N	\N	376.0	0.0	150.0	11.0	\N	\N	\N	1	\N	\N	1
364	AGUA ESTERIL PARA INYECCION 10ML AMPOULEPACK -	1	2016-12-16 18:46:11.323276	2016-12-16 18:46:11.323276	\N	\N	\N	\N	\N	342.0	0.0	150.0	7.0	\N	\N	\N	1	\N	\N	1
365	AGUA PARA INYECCION USP PARA IRRIGACION 3000ML	1	2016-12-16 18:46:11.327485	2016-12-16 18:46:11.327485	\N	\N	\N	\N	\N	12176.0	0.0	150.0	12.0	\N	\N	\N	1	\N	\N	1
366	AGUA PARA INYECCION USP 500ML 500ML BOLSA - LAB.	1	2016-12-16 18:46:11.331798	2016-12-16 18:46:11.331798	\N	\N	\N	\N	\N	1801.0	0.0	150.0	10.0	\N	\N	\N	1	\N	\N	1
367	AGUJA ANGIOGRAFICA ADVANCE 18G 7 CM 40451 -	1	2016-12-16 18:46:11.336166	2016-12-16 18:46:11.336166	\N	\N	\N	\N	\N	11655.0	0.0	150.0	18.0	\N	\N	\N	1	\N	\N	1
368	AGUJA ANGIOGRAFICA ADVANCE 21G AD21T41W -	1	2016-12-16 18:46:11.340305	2016-12-16 18:46:11.340305	\N	\N	\N	\N	\N	11279.0	0.0	150.0	4.0	\N	\N	\N	1	\N	\N	1
369	AGUJA BIOPSIA SEMIAUTOM BIOFEATHER 14GX100MM	1	2016-12-16 18:46:11.344346	2016-12-16 18:46:11.344346	\N	\N	\N	\N	\N	67280.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	1
370	AGUJA DE CHIBA DCHN 18 15.0 COOK-TM MEDICAS S.A.	1	2016-12-16 18:46:11.349039	2016-12-16 18:46:11.349039	\N	\N	\N	\N	\N	41178.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	1
371	AGUJA DESECHABLE 21 X 1 1/2 BD 302352 EMPAQUE	1	2016-12-16 18:46:11.353921	2016-12-16 18:46:11.353921	\N	\N	\N	\N	\N	109.0	0.0	150.0	13.0	\N	\N	\N	1	\N	\N	1
372	AGUJA ESPINAL 18G BD 3X1 ½ EMPAQUE INDIVIDUAL	1	2016-12-16 18:46:11.358174	2016-12-16 18:46:11.358174	\N	\N	\N	\N	\N	7524.0	0.0	150.0	2.0	\N	\N	\N	1	\N	\N	1
373	AGUJA ESPINAL 20G BD 3X1 ½REF 405182 EMPAQUE	1	2016-12-16 18:46:11.363099	2016-12-16 18:46:11.363099	\N	\N	\N	\N	\N	11943.0	0.0	150.0	4.0	\N	\N	\N	1	\N	\N	1
374	AGUJA ESPINAL 22G BD 3X1 ½ REF 405181 EMPAQUE	1	2016-12-16 18:46:11.367439	2016-12-16 18:46:11.367439	\N	\N	\N	\N	\N	12201.0	0.0	150.0	2.0	\N	\N	\N	1	\N	\N	1
375	AGUJA ESPINAL 26G BD EMPAQUE INDIVIDUAL UNIDAD -	1	2016-12-16 18:46:11.371607	2016-12-16 18:46:11.371607	\N	\N	\N	\N	\N	8353.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	1
376	AGUJA ESPINAL-SPINOCAN BRAUN-18G EMPAQUE	1	2016-12-16 18:46:11.37586	2016-12-16 18:46:11.37586	\N	\N	\N	\N	\N	6905.0	0.0	150.0	2.0	\N	\N	\N	1	\N	\N	1
377	AGUJA ESPINAL-SPINOCAN BRAUN-20G EMPAQUE	1	2016-12-16 18:46:11.38012	2016-12-16 18:46:11.38012	\N	\N	\N	\N	\N	6921.0	0.0	150.0	8.0	\N	\N	\N	1	\N	\N	1
378	AGUJA ESPINAL-SPINOCAN BRAUN-26G EMPAQUE	1	2016-12-16 18:46:11.384605	2016-12-16 18:46:11.384605	\N	\N	\N	\N	\N	7882.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	1
379	AGUJA ESPINAL-SPINOCAN BRAUN-27G EMPAQUE	1	2016-12-16 18:46:11.388914	2016-12-16 18:46:11.388914	\N	\N	\N	\N	\N	6298.0	0.0	150.0	3.0	\N	\N	\N	1	\N	\N	1
380	AGUJA HIPODERMICA 18 1.5 EMPAQUE INDIVIDUAL	1	2016-12-16 18:46:11.393116	2016-12-16 18:46:11.393116	\N	\N	\N	\N	\N	77.0	0.0	150.0	6.0	\N	\N	\N	1	\N	\N	1
381	AGUJA HIPODERMICA 21 1 1/2 EMPAQUE INDIVIDUAL	1	2016-12-16 18:46:11.397827	2016-12-16 18:46:11.397827	\N	\N	\N	\N	\N	79.0	0.0	150.0	25.0	\N	\N	\N	1	\N	\N	1
382	AGUJA HIPODERMICA 26GX1/2 EMPAQUE INDIVIDUAL	1	2016-12-16 18:46:11.402127	2016-12-16 18:46:11.402127	\N	\N	\N	\N	\N	81.0	0.0	150.0	31.0	\N	\N	\N	1	\N	\N	1
383	AGUJA HIPODERMICA 27 1 1/2 EMPAQUE INDIVIDUAL	1	2016-12-16 18:46:11.406388	2016-12-16 18:46:11.406388	\N	\N	\N	\N	\N	61.0	0.0	150.0	36.0	\N	\N	\N	1	\N	\N	1
384	AGUJA HIPODERMICA NIPRO 21GX1 EMPAQUE	1	2016-12-16 18:46:11.410865	2016-12-16 18:46:11.410865	\N	\N	\N	\N	\N	69.0	0.0	150.0	11.0	\N	\N	\N	1	\N	\N	1
385	AGUJA LAPICERO INSULINA BD 32G X 4MM REF	1	2016-12-16 18:46:11.415197	2016-12-16 18:46:11.415197	\N	\N	\N	\N	\N	299.0	0.0	150.0	3.0	\N	\N	\N	1	\N	\N	1
386	AGUJA PARA BIOPSIA SUPERCORE 18GAX15CM REF:	1	2016-12-16 18:46:11.419528	2016-12-16 18:46:11.419528	\N	\N	\N	\N	\N	101500.0	0.0	150.0	2.0	\N	\N	\N	1	\N	\N	1
387	AGUJA PARA FISTULA ARTERIOVENOSA 15 GA EMPAQUE	1	2016-12-16 18:46:11.42395	2016-12-16 18:46:11.42395	\N	\N	\N	\N	\N	2538.0	0.0	150.0	2.0	\N	\N	\N	1	\N	\N	1
388	AGUJA PARA FISTULA ARTERIOVENOSA 17 GA EMPAQUE	1	2016-12-16 18:46:11.428075	2016-12-16 18:46:11.428075	\N	\N	\N	\N	\N	4569.0	0.0	150.0	4.0	\N	\N	\N	1	\N	\N	1
389	AGUJA PISTOLA PRO-MAG 2.2 ACN-1816 EMPAQUE	1	2016-12-16 18:46:11.432227	2016-12-16 18:46:11.432227	\N	\N	\N	\N	\N	77720.0	0.0	150.0	4.0	\N	\N	\N	1	\N	\N	1
390	AGUJAS HIPODERMICAS 27 BD-302358 EMPAQUE	1	2016-12-16 18:46:11.436322	2016-12-16 18:46:11.436322	\N	\N	\N	\N	\N	122.0	0.0	150.0	12.0	\N	\N	\N	1	\N	\N	1
391	AGUJAS HIPODERMICAS PRECISION GLIDE BD 30 1/2	1	2016-12-16 18:46:11.440629	2016-12-16 18:46:11.440629	\N	\N	\N	\N	\N	139.0	0.0	150.0	4.0	\N	\N	\N	1	\N	\N	1
392	AGUJAS HIPODERMICAS PRECISION GLIDE BD-18.1/2 REF	1	2016-12-16 18:46:11.445202	2016-12-16 18:46:11.445202	\N	\N	\N	\N	\N	160.0	0.0	150.0	29.0	\N	\N	\N	1	\N	\N	1
393	AGUJAS HIPODERMICAS PRECISION GLIDE BD-23 X 1	1	2016-12-16 18:46:11.449248	2016-12-16 18:46:11.449248	\N	\N	\N	\N	\N	69.0	0.0	150.0	6.0	\N	\N	\N	1	\N	\N	1
394	ALBENDAZOL 200MG TABLETA - LAB. :GENFAR SA	1	2016-12-16 18:46:11.45395	2016-12-16 18:46:11.45395	\N	\N	\N	\N	\N	151.0	0.0	150.0	4.0	\N	\N	\N	1	\N	\N	1
395	ALBUMINA HUMANA 20% 50ML SOL 50ML BOLSA - LAB. :	1	2016-12-16 18:46:11.458483	2016-12-16 18:46:11.458483	\N	\N	\N	\N	\N	112224.0	0.0	150.0	18.0	\N	\N	\N	1	\N	\N	1
396	ALBUMINA HUMANA 20% FCO X 50ML AMPOLLA - LAB. :	1	2016-12-16 18:46:11.463035	2016-12-16 18:46:11.463035	\N	\N	\N	\N	\N	84402.0	0.0	150.0	21.0	\N	\N	\N	1	\N	\N	1
397	ALCOHOL POLIVINILICO (OSMOTEARS LAGRIMAS	1	2016-12-16 18:46:11.467206	2016-12-16 18:46:11.467206	\N	\N	\N	\N	\N	4136.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	1
398	ALIMENTO CONVENCIONAL ISOTÓN, COMPL. Y BALANC	1	2016-12-16 18:46:11.471309	2016-12-16 18:46:11.471309	\N	\N	\N	\N	\N	34059.0	0.0	150.0	5.0	\N	\N	\N	1	\N	\N	1
399	ALIMENTO BALANCEADO LIQ. PROTEINA, VITAM, MINER.	1	2016-12-16 18:46:11.483088	2016-12-16 18:46:11.483088	\N	\N	\N	\N	\N	6054.0	0.0	150.0	14.0	\N	\N	\N	1	\N	\N	1
400	ALIMENTO ESPECIAL DIABETES O HIPERGLICEM	1	2016-12-16 18:46:11.487522	2016-12-16 18:46:11.487522	\N	\N	\N	\N	\N	43927.0	0.0	150.0	10.0	\N	\N	\N	1	\N	\N	1
401	ALIMENTO ESPECIAL HIPERPROTEICO (PERATIVE LPC)	1	2016-12-16 18:46:11.492331	2016-12-16 18:46:11.492331	\N	\N	\N	\N	\N	49638.0	0.0	150.0	9.0	\N	\N	\N	1	\N	\N	1
402	ALIMENTO PARA PROPOSITOS MEDICOS ESPECIALES EN	1	2016-12-16 18:46:11.497095	2016-12-16 18:46:11.497095	\N	\N	\N	\N	\N	5409.0	0.0	150.0	20.0	\N	\N	\N	1	\N	\N	1
403	ALLIGATOR RETRIEVAL DEVICE - 2MM 0.40MM 175.0CM-	1	2016-12-16 18:46:11.501721	2016-12-16 18:46:11.501721	\N	\N	\N	\N	\N	3770000.0	0.0	150.0	2.0	\N	\N	\N	1	\N	\N	1
404	ALOPURINOL 100MG TABLETA - LAB. :LABORATORIO	1	2016-12-16 18:46:11.506474	2016-12-16 18:46:11.506474	\N	\N	\N	\N	\N	49.0	0.0	150.0	11.0	\N	\N	\N	1	\N	\N	1
405	ALOPURINOL (UROCUAD) 300MG TABLETA - LAB. :	1	2016-12-16 18:46:11.511139	2016-12-16 18:46:11.511139	\N	\N	\N	\N	\N	725.0	0.0	150.0	3.0	\N	\N	\N	1	\N	\N	1
406	ALPRAZOLAM 0.25MG TABLETA - LAB. :LABORATORIOS	1	2016-12-16 18:46:11.515589	2016-12-16 18:46:11.515589	\N	\N	\N	\N	\N	48.0	0.0	150.0	40.0	\N	\N	\N	1	\N	\N	1
407	ALTEPLASE -ACTIVADOR TISULAR DEL PLASMINOGENO	1	2016-12-16 18:46:11.520203	2016-12-16 18:46:11.520203	\N	\N	\N	\N	\N	1138464.0	0.0	150.0	2.0	\N	\N	\N	1	\N	\N	1
408	AMANTADINA (AMANTIX) 100MG TABLETA - LAB. :MERZ	1	2016-12-16 18:46:11.524717	2016-12-16 18:46:11.524717	\N	\N	\N	\N	\N	361.0	0.0	150.0	2.0	\N	\N	\N	1	\N	\N	1
409	AMINOFILINA 240MG AMPOLLA - LAB. :LABORATORIOS	1	2016-12-16 18:46:11.529846	2016-12-16 18:46:11.529846	\N	\N	\N	\N	\N	473.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	1
410	AMINOFILINA 240MG/10ML AMPOLLA - LAB. :FARMIONNI	1	2016-12-16 18:46:11.534243	2016-12-16 18:46:11.534243	\N	\N	\N	\N	\N	406.0	0.0	150.0	3.0	\N	\N	\N	1	\N	\N	1
411	AMIODARONA 200MG TABLETA - LAB. :LABORATORIOS	1	2016-12-16 18:46:11.5386	2016-12-16 18:46:11.5386	\N	\N	\N	\N	\N	901.0	0.0	150.0	7.0	\N	\N	\N	1	\N	\N	1
412	AMIODARONA 200MG TABLETA - LAB. :MK	1	2016-12-16 18:46:11.543208	2016-12-16 18:46:11.543208	\N	\N	\N	\N	\N	612.0	0.0	150.0	15.0	\N	\N	\N	1	\N	\N	1
413	AMIODARONA (CORDARONE ) 150MG AMPOLLA - LAB. :	1	2016-12-16 18:46:11.547627	2016-12-16 18:46:11.547627	\N	\N	\N	\N	\N	11543.0	0.0	150.0	10.0	\N	\N	\N	1	\N	\N	1
414	AMIODARONA 200MG TAB PENTACOOP TABLETA	1	2016-12-16 18:46:11.552175	2016-12-16 18:46:11.552175	\N	\N	\N	\N	\N	274.0	0.0	150.0	10.0	\N	\N	\N	1	\N	\N	1
415	AMIODARONA( DARONAL) TABLETAS 200 MG UNIDAD	1	2016-12-16 18:46:11.556592	2016-12-16 18:46:11.556592	\N	\N	\N	\N	\N	71.0	0.0	150.0	13.0	\N	\N	\N	1	\N	\N	1
416	AMITRIPTILINA 25MG TABLETA - LAB. :TECNOQUIMICAS	1	2016-12-16 18:46:11.561054	2016-12-16 18:46:11.561054	\N	\N	\N	\N	\N	37.0	0.0	150.0	3.0	\N	\N	\N	1	\N	\N	1
417	AMLODIPINO 5MG TABLETA - LAB. :GENFAR SA	1	2016-12-16 18:46:11.565912	2016-12-16 18:46:11.565912	\N	\N	\N	\N	\N	15.0	0.0	150.0	29.0	\N	\N	\N	1	\N	\N	1
418	AMOXICILINA 500MG CAPSULA - LAB. :GENFAR SA	1	2016-12-16 18:46:11.570601	2016-12-16 18:46:11.570601	\N	\N	\N	\N	\N	124.0	0.0	150.0	15.0	\N	\N	\N	1	\N	\N	1
419	AMPICILINA + SULBACTAM (UNASYN) 1.5G VIAL - LAB. :	1	2016-12-16 18:46:11.575055	2016-12-16 18:46:11.575055	\N	\N	\N	\N	\N	9966.0	0.0	150.0	26.0	\N	\N	\N	1	\N	\N	1
420	AMPICILINA 1G AMPOLLA - LAB. :GENFAR SA	1	2016-12-16 18:46:11.579445	2016-12-16 18:46:11.579445	\N	\N	\N	\N	\N	1075.0	0.0	150.0	50.0	\N	\N	\N	1	\N	\N	1
421	ANIDULAFUNGINA (ECALTA) 100MG VIAL - LAB. :	1	2016-12-16 18:46:11.583856	2016-12-16 18:46:11.583856	\N	\N	\N	\N	\N	544974.0	0.0	150.0	5.0	\N	\N	\N	1	\N	\N	1
422	ANILLO MITRAL ANULOPLASTIA 26MM EMPAQUE	1	2016-12-16 18:46:11.588058	2016-12-16 18:46:11.588058	\N	\N	\N	\N	\N	2000000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	1
423	ANILLO MITRAL ANULOPLASTIA 38MM EMPAQUE	1	2016-12-16 18:46:11.592742	2016-12-16 18:46:11.592742	\N	\N	\N	\N	\N	2000000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	1
424	AORTIC PUNCH MANGO DE 4.4 MM REF: APU444 - MED	1	2016-12-16 18:46:11.597286	2016-12-16 18:46:11.597286	\N	\N	\N	\N	\N	192096.0	0.0	150.0	5.0	\N	\N	\N	1	\N	\N	1
425	APIXABAN (ELIQUIS) 5MG TABLETA - LAB. :	1	2016-12-16 18:46:11.602271	2016-12-16 18:46:11.602271	\N	\N	\N	\N	\N	3084.0	0.0	150.0	4.0	\N	\N	\N	1	\N	\N	1
426	APOSITO ACTISORB PLUS 10.5 X 19.5CM - REF: MAP190	1	2016-12-16 18:46:11.606711	2016-12-16 18:46:11.606711	\N	\N	\N	\N	\N	19560.0	0.0	150.0	2.0	\N	\N	\N	1	\N	\N	1
427	APOSITO ACTISORB PLUS 10.5CMX10.5CM- REF: MAP105	1	2016-12-16 18:46:11.611334	2016-12-16 18:46:11.611334	\N	\N	\N	\N	\N	15523.0	0.0	150.0	2.0	\N	\N	\N	1	\N	\N	1
428	APOSITO ACTISORB PLUS 6 5CMX 9 5 CM - REF: MAP065	1	2016-12-16 18:46:11.615625	2016-12-16 18:46:11.615625	\N	\N	\N	\N	\N	13244.0	0.0	150.0	2.0	\N	\N	\N	1	\N	\N	1
429	APOSITO ADAPTIC 3X3 - REF: REF 2012 EMPAQUE	1	2016-12-16 18:46:11.620482	2016-12-16 18:46:11.620482	\N	\N	\N	\N	\N	3148.0	0.0	150.0	2.0	\N	\N	\N	1	\N	\N	1
430	APOSITO ADAPTIC 3X8 - REF: REF 2015 EMPAQUE	1	2016-12-16 18:46:11.625009	2016-12-16 18:46:11.625009	\N	\N	\N	\N	\N	7018.0	0.0	150.0	2.0	\N	\N	\N	1	\N	\N	1
431	AQUA SEAL SISTEMA DRENAJE TORACICO REF	1	2016-12-16 18:46:11.629452	2016-12-16 18:46:11.629452	\N	\N	\N	\N	\N	117068.0	0.0	150.0	3.0	\N	\N	\N	1	\N	\N	1
432	ASPIRADOR PERICARDIO CONECTOR 1/8 REF: 12011-	1	2016-12-16 18:46:11.633858	2016-12-16 18:46:11.633858	\N	\N	\N	\N	\N	60076.0	0.0	150.0	8.0	\N	\N	\N	1	\N	\N	1
433	ATORVASTATINA 40MG TABLETA - LAB. :SANOFI	1	2016-12-16 18:46:11.638281	2016-12-16 18:46:11.638281	\N	\N	\N	\N	\N	153.0	0.0	150.0	72.0	\N	\N	\N	1	\N	\N	1
434	ATROPINA SULFATO 1ML AMPOLLA - LAB. :	1	2016-12-16 18:46:11.64285	2016-12-16 18:46:11.64285	\N	\N	\N	\N	\N	408.0	0.0	150.0	5.0	\N	\N	\N	1	\N	\N	1
435	AZTREONAM (AZACTAM) 1G VIAL - LAB. :BRISTOL-	1	2016-12-16 18:46:11.647476	2016-12-16 18:46:11.647476	\N	\N	\N	\N	\N	43787.0	0.0	150.0	13.0	\N	\N	\N	1	\N	\N	1
436	BALLON SPRINTER 2.0X20MM RX SPR2020X MED	1	2016-12-16 18:46:11.651617	2016-12-16 18:46:11.651617	\N	\N	\N	\N	\N	450000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	1
437	BALLON SPRINTER 2.0X30MM RX SPR2030 MED	1	2016-12-16 18:46:11.655732	2016-12-16 18:46:11.655732	\N	\N	\N	\N	\N	450000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	1
438	BALON REF:SPL20012X SPRINTERLEGEND 2.0X12MM RX-	1	2016-12-16 18:46:11.660183	2016-12-16 18:46:11.660183	\N	\N	\N	\N	\N	450000.0	0.0	150.0	2.0	\N	\N	\N	1	\N	\N	1
439	BALON REF:SPL25012X SPRINTERLEGEND 2.5X12MM RX-	1	2016-12-16 18:46:11.664906	2016-12-16 18:46:11.664906	\N	\N	\N	\N	\N	450000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	1
440	BALON REF:SPL30012X SPRINTERLEGEND 3.0X12MM RX-	1	2016-12-16 18:46:11.66967	2016-12-16 18:46:11.66967	\N	\N	\N	\N	\N	450000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	1
441	BALON REF:SPL35012X SPRINTERLEGEND 3.5X12MM RX-	1	2016-12-16 18:46:11.674323	2016-12-16 18:46:11.674323	\N	\N	\N	\N	\N	450000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	1
442	BALON REF:SPL40012X SPRINTERLEGEND 4.0X12MM RX-	1	2016-12-16 18:46:11.678495	2016-12-16 18:46:11.678495	\N	\N	\N	\N	\N	450000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	1
443	BALON BIB 16 X 4.5 BB016 WM EMPAQUE INDIVIDUAL	1	2016-12-16 18:46:11.683161	2016-12-16 18:46:11.683161	\N	\N	\N	\N	\N	2450000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	1
444	BALON BIB 20 X 4.5 BB017 -WORLD MEDICAL S.A.S	1	2016-12-16 18:46:11.687581	2016-12-16 18:46:11.687581	\N	\N	\N	\N	\N	2450000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	1
445	BALON BIB 20.0MM X 4.0CM BIB014 WM EMPAQUE	1	2016-12-16 18:46:11.691744	2016-12-16 18:46:11.691744	\N	\N	\N	\N	\N	2450000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	1
446	BALON CONTRAPULSACION AORTICO 7.5FR 34CC	1	2016-12-16 18:46:11.69626	2016-12-16 18:46:11.69626	\N	\N	\N	\N	\N	2376000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	1
447	BALON CONTRAPULSACION AORTICO 7FRX30CM-REF:	1	2016-12-16 18:46:11.700972	2016-12-16 18:46:11.700972	\N	\N	\N	\N	\N	3189415.0	0.0	150.0	3.0	\N	\N	\N	1	\N	\N	1
448	BALON CONTRAPULSACION AORTICO 8FRX40CM-REF:	1	2016-12-16 18:46:11.70548	2016-12-16 18:46:11.70548	\N	\N	\N	\N	\N	2485000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	1
449	BALON CORONARIO SPRINTER LEGEND 1.25 X 20	1	2016-12-16 18:46:11.709553	2016-12-16 18:46:11.709553	\N	\N	\N	\N	\N	450000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	1
450	BALON CORONARIO SPRINTER LEGEND 2.25X15	1	2016-12-16 18:46:11.714841	2016-12-16 18:46:11.714841	\N	\N	\N	\N	\N	450000.0	0.0	150.0	2.0	\N	\N	\N	1	\N	\N	1
451	BALON CORONARIO SPRINTER LEGEND 2.5MMX15MM	1	2016-12-16 18:46:11.719321	2016-12-16 18:46:11.719321	\N	\N	\N	\N	\N	442857.0	0.0	150.0	2.0	\N	\N	\N	1	\N	\N	1
452	BALON EUPHORA 2512X UNIDAD UNIDAD - LAB. :	1	2016-12-16 18:46:11.723942	2016-12-16 18:46:11.723942	\N	\N	\N	\N	\N	400000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	1
453	BALON EUPHORA 4.0 X 20 NCEUP4020X MED UND	1	2016-12-16 18:46:11.72843	2016-12-16 18:46:11.72843	\N	\N	\N	\N	\N	450000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	1
454	BALON EUPHORA 4.5 X 15 NCEUP4515X UNIDAD DE	1	2016-12-16 18:46:11.732439	2016-12-16 18:46:11.732439	\N	\N	\N	\N	\N	212500.0	0.0	150.0	2.0	\N	\N	\N	1	\N	\N	1
455	BALON NC EUPHORA 1515X NCEUPRX OUS MED UND	1	2016-12-16 18:46:11.738307	2016-12-16 18:46:11.738307	\N	\N	\N	\N	\N	425000.0	0.0	150.0	3.0	\N	\N	\N	1	\N	\N	1
456	BALON NC EUPHORA 2.0 X 12 NCEUP2012X MED UNIDAD	1	2016-12-16 18:46:11.742864	2016-12-16 18:46:11.742864	\N	\N	\N	\N	\N	416667.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	1
457	BALON NC EUPHORA 2.0 X 15 NCEUP2015X UNIDAD	1	2016-12-16 18:46:11.747557	2016-12-16 18:46:11.747557	\N	\N	\N	\N	\N	440000.0	0.0	150.0	2.0	\N	\N	\N	1	\N	\N	1
458	BALON NC EUPHORA 2.0 X 20 NCEUP2020X MED UNIDAD	1	2016-12-16 18:46:11.751723	2016-12-16 18:46:11.751723	\N	\N	\N	\N	\N	375000.0	0.0	150.0	4.0	\N	\N	\N	1	\N	\N	1
459	BALON NC EUPHORA 2.5 X 15 NCEUP2515X EMPAQUE	1	2016-12-16 18:46:11.756082	2016-12-16 18:46:11.756082	\N	\N	\N	\N	\N	450000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	1
460	BALON NC EUPHORA 2008X 643169396654 NCEUP2008	1	2016-12-16 18:46:11.760389	2016-12-16 18:46:11.760389	\N	\N	\N	\N	\N	450000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	1
461	BALON NC EUPHORA 22512 X 643169591868	1	2016-12-16 18:46:11.76474	2016-12-16 18:46:11.76474	\N	\N	\N	\N	\N	450000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	1
462	BALON NC EUPHORA 22515X 643169396630	1	2016-12-16 18:46:11.769391	2016-12-16 18:46:11.769391	\N	\N	\N	\N	\N	450000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	1
463	BALON NC EUPHORA 3.0 X 12 NCEUP3012X EMPAQUE	1	2016-12-16 18:46:11.774072	2016-12-16 18:46:11.774072	\N	\N	\N	\N	\N	450000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	1
464	BALON NC EUPHORA 3.0 X 15 NCEUP3015X UNIDAD	1	2016-12-16 18:46:11.77864	2016-12-16 18:46:11.77864	\N	\N	\N	\N	\N	450000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	1
465	BALON NC EUPHORA 3.5 X 15 NCEUP3515X EMPAQUE	1	2016-12-16 18:46:11.783193	2016-12-16 18:46:11.783193	\N	\N	\N	\N	\N	450000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	1
466	BALON NC EUPHORA 4,0 X 15 NCEUP4015X EMPAQUE	1	2016-12-16 18:46:11.787478	2016-12-16 18:46:11.787478	\N	\N	\N	\N	\N	450000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	1
467	BALON NC EUPHORA 4,5 X 20 NCEUP4020X EMPAQUE	1	2016-12-16 18:46:11.79164	2016-12-16 18:46:11.79164	\N	\N	\N	\N	\N	450000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	1
468	BALON NC EUPHORA1520X NCEUP RX OUS MED UND	1	2016-12-16 18:46:11.796273	2016-12-16 18:46:11.796273	\N	\N	\N	\N	\N	425000.0	0.0	150.0	2.0	\N	\N	\N	1	\N	\N	1
469	BALON POWER PRO 5MM X 6CM 4400506X EMPAQUE	1	2016-12-16 18:46:11.800776	2016-12-16 18:46:11.800776	\N	\N	\N	\N	\N	589127.0	0.0	150.0	2.0	\N	\N	\N	1	\N	\N	1
470	BALON PTS-X 25MM X 4.0CM PTSX254 EMPAQUE	1	2016-12-16 18:46:11.80553	2016-12-16 18:46:11.80553	\N	\N	\N	\N	\N	700000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	1
471	BALON REF: SPL12510X SPRINTER LEGEND 1.25X10 -	1	2016-12-16 18:46:11.810098	2016-12-16 18:46:11.810098	\N	\N	\N	\N	\N	450000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	1
472	BALON REF: SPL12512X SPRINTER LEGEND 1.25X12 RX-	1	2016-12-16 18:46:11.81505	2016-12-16 18:46:11.81505	\N	\N	\N	\N	\N	450000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	1
473	BALON REF: SPL15012X SPRINTERLEGEND 1.5X12 RXM-	1	2016-12-16 18:46:11.819821	2016-12-16 18:46:11.819821	\N	\N	\N	\N	\N	450000.0	0.0	150.0	2.0	\N	\N	\N	1	\N	\N	1
474	BALON REF: SPL15015X SPRINTERLEGEND 1.5X15 RXM-	1	2016-12-16 18:46:11.824118	2016-12-16 18:46:11.824118	\N	\N	\N	\N	\N	450000.0	0.0	150.0	2.0	\N	\N	\N	1	\N	\N	1
475	BALON REF: SPL15020X SPRINTERLEGEND 1.5X20 RXM-	1	2016-12-16 18:46:11.828332	2016-12-16 18:46:11.828332	\N	\N	\N	\N	\N	450000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	1
476	BALON REF: SPL20015X SPRINTERLEGEND 2.0X15 RXM-	1	2016-12-16 18:46:11.832475	2016-12-16 18:46:11.832475	\N	\N	\N	\N	\N	450000.0	0.0	150.0	2.0	\N	\N	\N	1	\N	\N	1
477	BALON REF: SPL20020X SPRINTERLEGEND 2.0X20 RXM-	1	2016-12-16 18:46:11.836667	2016-12-16 18:46:11.836667	\N	\N	\N	\N	\N	450000.0	0.0	150.0	2.0	\N	\N	\N	1	\N	\N	1
478	BALON REF: SPL25020X SPRINTERLEGEND 2.5X20 RXM-	1	2016-12-16 18:46:11.841305	2016-12-16 18:46:11.841305	\N	\N	\N	\N	\N	450000.0	0.0	150.0	2.0	\N	\N	\N	1	\N	\N	1
479	BALON REF: SPL30015X SPRINTERLEGEND 3.0X15 RXM-	1	2016-12-16 18:46:11.845956	2016-12-16 18:46:11.845956	\N	\N	\N	\N	\N	450000.0	0.0	150.0	2.0	\N	\N	\N	1	\N	\N	1
480	BALON REF: SPL30020X SPRINTERLEGEND 3.0X20 RXM-	1	2016-12-16 18:46:11.850496	2016-12-16 18:46:11.850496	\N	\N	\N	\N	\N	450000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	1
481	BALON REF: SPL35015X SPRINTERLEGEND 3.5X15 RXM-	1	2016-12-16 18:46:11.854523	2016-12-16 18:46:11.854523	\N	\N	\N	\N	\N	450000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	1
482	BALON REF: SPL40020X SPRINTERLEGEND 4.0X20 RXM-	1	2016-12-16 18:46:11.858962	2016-12-16 18:46:11.858962	\N	\N	\N	\N	\N	200000.0	0.0	150.0	2.0	\N	\N	\N	1	\N	\N	1
483	BALON SPRINTERLEGEND 2.0X25MM SPL20025 MED UND	1	2016-12-16 18:46:11.863668	2016-12-16 18:46:11.863668	\N	\N	\N	\N	\N	450000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	1
484	BECLOMETASONA DIPROPIONATO (ECLOSYNT) 250MCG	1	2016-12-16 18:46:11.868341	2016-12-16 18:46:11.868341	\N	\N	\N	\N	\N	6802.0	0.0	150.0	2.0	\N	\N	\N	1	\N	\N	1
485	BETAHISTINA 8MG TABLETA - LAB. :TECNOQUIMICAS S.	1	2016-12-16 18:46:11.872649	2016-12-16 18:46:11.872649	\N	\N	\N	\N	\N	743.0	0.0	150.0	6.0	\N	\N	\N	1	\N	\N	1
486	BETAMETASONA 0.1% TUBO - LAB. :GENFAR SA	1	2016-12-16 18:46:11.877276	2016-12-16 18:46:11.877276	\N	\N	\N	\N	\N	1759.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	1
487	BETAMETASONA 4mg AMPOLLA - LAB. :GENFAR SA	1	2016-12-16 18:46:11.882012	2016-12-16 18:46:11.882012	\N	\N	\N	\N	\N	1383.0	0.0	150.0	2.0	\N	\N	\N	1	\N	\N	1
488	BETAMETIL DIGOXINA (LANITOP) 0.1MG TABLETA - LAB. :	1	2016-12-16 18:46:11.886395	2016-12-16 18:46:11.886395	\N	\N	\N	\N	\N	701.0	0.0	150.0	3.0	\N	\N	\N	1	\N	\N	1
489	BETAMETIL DIGOXINA (LANITOP) 0.2MG AMPOLLA - LAB.	1	2016-12-16 18:46:11.891249	2016-12-16 18:46:11.891249	\N	\N	\N	\N	\N	6299.0	0.0	150.0	4.0	\N	\N	\N	1	\N	\N	1
490	BETAMETIL DIGOXINA (LANITOP) 0.6MG FRASCO - LAB. :	1	2016-12-16 18:46:11.895571	2016-12-16 18:46:11.895571	\N	\N	\N	\N	\N	36158.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	1
491	BICARBONATO DE SODIO 1 MEQ./ML. AMPOLLA - LAB. :	1	2016-12-16 18:46:11.901788	2016-12-16 18:46:11.901788	\N	\N	\N	\N	\N	687.0	0.0	150.0	13.0	\N	\N	\N	1	\N	\N	1
492	BICARBONATO DE SODIO 1 MEQ./ML. AMPOLLA - LAB. :	1	2016-12-16 18:46:11.906318	2016-12-16 18:46:11.906318	\N	\N	\N	\N	\N	455.0	0.0	150.0	61.0	\N	\N	\N	1	\N	\N	1
493	BIPERIDENO 2MG TABLETA - LAB. :TECNOQUIMICAS S.A.	1	2016-12-16 18:46:11.910537	2016-12-16 18:46:11.910537	\N	\N	\N	\N	\N	234.0	0.0	150.0	2.0	\N	\N	\N	1	\N	\N	1
494	BISACODILO 5MG TABLETA - LAB. :HUMAX	1	2016-12-16 18:46:11.914895	2016-12-16 18:46:11.914895	\N	\N	\N	\N	\N	27.0	0.0	150.0	16.0	\N	\N	\N	1	\N	\N	1
495	BISOPROLOL FUMARATO (CONCOR) 2.5MG TABLETA -	1	2016-12-16 18:46:11.919435	2016-12-16 18:46:11.919435	\N	\N	\N	\N	\N	1306.0	0.0	150.0	8.0	\N	\N	\N	1	\N	\N	1
496	BISOPROLOL FUMARATO (CONCOR) 5MG TABLETA - LAB.	1	2016-12-16 18:46:11.923599	2016-12-16 18:46:11.923599	\N	\N	\N	\N	\N	2040.0	0.0	150.0	13.0	\N	\N	\N	1	\N	\N	1
497	BOLSA DE DRENAJE URINARIO 2000ML REF:390060 -	1	2016-12-16 18:46:11.928204	2016-12-16 18:46:11.928204	\N	\N	\N	\N	\N	4352.0	0.0	150.0	3.0	\N	\N	\N	1	\N	\N	1
498	BOLSA PATROLC/EQUIPO 1000ML REF M224-B14	1	2016-12-16 18:46:11.932422	2016-12-16 18:46:11.932422	\N	\N	\N	\N	\N	32771.0	0.0	150.0	3.0	\N	\N	\N	1	\N	\N	1
499	BROMURO DE IPRATROPIO (ATROVENT AEROSOL HFA)	1	2016-12-16 18:46:11.93748	2016-12-16 18:46:11.93748	\N	\N	\N	\N	\N	26313.0	0.0	150.0	2.0	\N	\N	\N	1	\N	\N	1
500	BROMURO DE IPRATROPIO (IPRASYNT) 20MCG ENVASE DE	1	2016-12-16 18:46:11.942167	2016-12-16 18:46:11.942167	\N	\N	\N	\N	\N	5425.0	0.0	150.0	3.0	\N	\N	\N	1	\N	\N	1
501	BROMURO DE ROCURONIO (ESMERON) 50MG VIAL - LAB.	1	2016-12-16 18:46:11.946567	2016-12-16 18:46:11.946567	\N	\N	\N	\N	\N	30908.0	0.0	150.0	2.0	\N	\N	\N	1	\N	\N	1
502	BROMURO DE VECURONIO 10MG VIAL - LAB. :	1	2016-12-16 18:46:11.950749	2016-12-16 18:46:11.950749	\N	\N	\N	\N	\N	10502.0	0.0	150.0	16.0	\N	\N	\N	1	\N	\N	1
503	BUDESONIDA MICRONIZADA(PULMICORT) 0.5MG/ML	1	2016-12-16 18:46:11.955255	2016-12-16 18:46:11.955255	\N	\N	\N	\N	\N	16484.0	0.0	150.0	5.0	\N	\N	\N	1	\N	\N	1
504	BUPIVACAINA (BUPIROP SIMPLE) 0.5% AMPOULEPACK -	1	2016-12-16 18:46:11.959938	2016-12-16 18:46:11.959938	\N	\N	\N	\N	\N	916.0	0.0	150.0	5.0	\N	\N	\N	1	\N	\N	1
505	BUPIVACAINA(BUPIROP PESADO) 0.5% AMPOULEPACK -	1	2016-12-16 18:46:11.964461	2016-12-16 18:46:11.964461	\N	\N	\N	\N	\N	855.0	0.0	150.0	5.0	\N	\N	\N	1	\N	\N	1
506	CABLES SISTEMA DESPRENDIMIENTO DE STENT SOLITARE	1	2016-12-16 18:46:11.968719	2016-12-16 18:46:11.968719	\N	\N	\N	\N	\N	96048.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	1
507	CALCIO CLORURO 10 % (VIAL X 10 ML) AMPOLLA - LAB. :	1	2016-12-16 18:46:11.973418	2016-12-16 18:46:11.973418	\N	\N	\N	\N	\N	13980.0	0.0	150.0	3.0	\N	\N	\N	1	\N	\N	1
508	CALCITRIOL 0.5MCG CAPSULA - LAB. :COLMED LTDA	1	2016-12-16 18:46:11.977864	2016-12-16 18:46:11.977864	\N	\N	\N	\N	\N	160.0	0.0	150.0	2.0	\N	\N	\N	1	\N	\N	1
509	CALCITRIOL 0.25MCG CAPSULA - LAB. :PROCAPS S.A.	1	2016-12-16 18:46:11.982389	2016-12-16 18:46:11.982389	\N	\N	\N	\N	\N	62.0	0.0	150.0	3.0	\N	\N	\N	1	\N	\N	1
510	CANNULA 91236 MC2 VEN 36/46FR 10PK 17L MED- MED	1	2016-12-16 18:46:11.986892	2016-12-16 18:46:11.986892	\N	\N	\N	\N	\N	109476.0	0.0	150.0	5.0	\N	\N	\N	1	\N	\N	1
511	CANULA ARTERIAL 20F ADUL. 75320- MED EMPAQUE	1	2016-12-16 18:46:11.99151	2016-12-16 18:46:11.99151	\N	\N	\N	\N	\N	94176.0	0.0	150.0	5.0	\N	\N	\N	1	\N	\N	1
512	CANULA DE GUEDEL ALLMED No 3 EMPAQUE INDIVIDUAL	1	2016-12-16 18:46:11.99566	2016-12-16 18:46:11.99566	\N	\N	\N	\N	\N	1400.0	0.0	150.0	2.0	\N	\N	\N	1	\N	\N	1
513	CANULA DE GUEDEL ALLMED No 4 ROJO EMPAQUE	1	2016-12-16 18:46:11.999626	2016-12-16 18:46:11.999626	\N	\N	\N	\N	\N	1318.0	0.0	150.0	2.0	\N	\N	\N	1	\N	\N	1
514	CANULA DE GUEDEL ALLMED No 5 AZUL EMPAQUE	1	2016-12-16 18:46:12.003714	2016-12-16 18:46:12.003714	\N	\N	\N	\N	\N	894.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	1
515	CANULA DE RAIZ AORT CON VENT 14GA 17l 20014 -	1	2016-12-16 18:46:12.008232	2016-12-16 18:46:12.008232	\N	\N	\N	\N	\N	664570.0	0.0	150.0	5.0	\N	\N	\N	1	\N	\N	1
516	CANULA DE TRAQ. FENESTRADA No 6 SHILEY REF: 6FEN	1	2016-12-16 18:46:12.012806	2016-12-16 18:46:12.012806	\N	\N	\N	\N	\N	148480.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	1
517	CANULA DE TRAQ. FENESTRADA No 8 SHILEY REF: 8FEN	1	2016-12-16 18:46:12.017447	2016-12-16 18:46:12.017447	\N	\N	\N	\N	\N	86137.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	1
518	CANULA DE TRAQUEOSTOMIA NO.7.0 PAQ EMPAQUE	1	2016-12-16 18:46:12.021588	2016-12-16 18:46:12.021588	\N	\N	\N	\N	\N	15052.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	1
519	CANULA DE TRAQUEOSTOMIA NO.8.5 INDIVIDUAL	1	2016-12-16 18:46:12.026181	2016-12-16 18:46:12.026181	\N	\N	\N	\N	\N	6742.0	0.0	150.0	2.0	\N	\N	\N	1	\N	\N	1
520	CANULA NASAL DE OXIGENO ADULTO ALL MED EMPAQUE	1	2016-12-16 18:46:12.030579	2016-12-16 18:46:12.030579	\N	\N	\N	\N	\N	1374.0	0.0	150.0	18.0	\N	\N	\N	1	\N	\N	1
521	CANULA OSTIUM CORONARIO 30010 MED EMPAQUE	1	2016-12-16 18:46:12.03523	2016-12-16 18:46:12.03523	\N	\N	\N	\N	\N	73000.0	0.0	150.0	6.0	\N	\N	\N	1	\N	\N	1
522	CANULA TRAQUEOSTOMIA 8.0 EMPAQUE INDIVIDUAL	1	2016-12-16 18:46:12.039458	2016-12-16 18:46:12.039458	\N	\N	\N	\N	\N	23798.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	1
523	CANULA TRAQUEOSTOMIA TRACOE XL T45108 NO 8	1	2016-12-16 18:46:12.043643	2016-12-16 18:46:12.043643	\N	\N	\N	\N	\N	365400.0	0.0	150.0	2.0	\N	\N	\N	1	\N	\N	1
524	CANULA TRAQUEOSTOMIA TRACOE XL T45109 NO 9	1	2016-12-16 18:46:12.047941	2016-12-16 18:46:12.047941	\N	\N	\N	\N	\N	522000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	1
525	CANULA VENOSA 30FR REF 66130 MEDTRONIC EMPAQUE	1	2016-12-16 18:46:12.052493	2016-12-16 18:46:12.052493	\N	\N	\N	\N	\N	84800.0	0.0	150.0	6.0	\N	\N	\N	1	\N	\N	1
526	CANULA VENOSA UNICA 32FR RF66132- MED EMPAQUE	1	2016-12-16 18:46:12.056588	2016-12-16 18:46:12.056588	\N	\N	\N	\N	\N	98933.0	0.0	150.0	5.0	\N	\N	\N	1	\N	\N	1
527	CANULA VENOSA UNICA 34FR REF 66134- MED EMPAQUE	1	2016-12-16 18:46:12.060904	2016-12-16 18:46:12.060904	\N	\N	\N	\N	\N	95675.0	0.0	150.0	6.0	\N	\N	\N	1	\N	\N	1
528	CANULA VESSEL PARA VASOS REF: 30003 EMPAQUE	1	2016-12-16 18:46:12.065851	2016-12-16 18:46:12.065851	\N	\N	\N	\N	\N	68208.0	0.0	150.0	6.0	\N	\N	\N	1	\N	\N	1
529	CAPROFYL 4 0 SH 121 JYJ EMPAQUE INDIVIDUAL UNIDAD	1	2016-12-16 18:46:12.070951	2016-12-16 18:46:12.070951	\N	\N	\N	\N	\N	9543.0	0.0	150.0	19.0	\N	\N	\N	1	\N	\N	1
530	CAPTOPRIL 50MG TABLETA - LAB. :GENFAR SA	1	2016-12-16 18:46:12.07554	2016-12-16 18:46:12.07554	\N	\N	\N	\N	\N	54.0	0.0	150.0	2.0	\N	\N	\N	1	\N	\N	1
531	CARBAMAZEPINA (SIGILEX) 200MG TABLETA - LAB. :	1	2016-12-16 18:46:12.080534	2016-12-16 18:46:12.080534	\N	\N	\N	\N	\N	63.0	0.0	150.0	14.0	\N	\N	\N	1	\N	\N	1
532	CARBIDOPA+LEVODOPA 25/250 MG TABLETA - LAB. :	1	2016-12-16 18:46:12.084529	2016-12-16 18:46:12.084529	\N	\N	\N	\N	\N	101.0	0.0	150.0	4.0	\N	\N	\N	1	\N	\N	1
533	CARBONATO DE CALCIO 600MG TABLETA - LAB. :	1	2016-12-16 18:46:12.088893	2016-12-16 18:46:12.088893	\N	\N	\N	\N	\N	43.0	0.0	150.0	10.0	\N	\N	\N	1	\N	\N	1
534	CARTUCHO ACT MODELO 402 03 MEDTRONIC EMPAQUE	1	2016-12-16 18:46:12.09363	2016-12-16 18:46:12.09363	\N	\N	\N	\N	\N	8400.0	0.0	150.0	17.0	\N	\N	\N	1	\N	\N	1
535	CARTUCHO I-STAT ABBOTT-17UL EG7 EMPAQUE	1	2016-12-16 18:46:12.098927	2016-12-16 18:46:12.098927	\N	\N	\N	\N	\N	26555.0	0.0	150.0	24.0	\N	\N	\N	1	\N	\N	1
536	CARTUCHO LIGACLIP HEMOSTATICO AMARILLO EMPAQUE	1	2016-12-16 18:46:12.103261	2016-12-16 18:46:12.103261	\N	\N	\N	\N	\N	2028.0	0.0	150.0	78.0	\N	\N	\N	1	\N	\N	1
537	CARVEDILOL 6.25MG TABLETA - LAB. :WINTHROP	1	2016-12-16 18:46:12.107418	2016-12-16 18:46:12.107418	\N	\N	\N	\N	\N	83.0	0.0	150.0	29.0	\N	\N	\N	1	\N	\N	2
538	CARVEDILOL 12.5MG TABLETA - LAB. :WINTHROP	1	2016-12-16 18:46:12.111642	2016-12-16 18:46:12.111642	\N	\N	\N	\N	\N	276.0	0.0	150.0	21.0	\N	\N	\N	1	\N	\N	2
539	CARVEDILOL 6.25MG TABLETA - LAB. :SANOFI WINTHROP	1	2016-12-16 18:46:12.115864	2016-12-16 18:46:12.115864	\N	\N	\N	\N	\N	181.0	0.0	150.0	54.0	\N	\N	\N	1	\N	\N	2
540	CASPOFUNGINA (CANCIDAS ) 50MG VIAL - LAB. :MERCK	1	2016-12-16 18:46:12.120344	2016-12-16 18:46:12.120344	\N	\N	\N	\N	\N	367619.0	0.0	150.0	4.0	\N	\N	\N	1	\N	\N	2
541	CASPOFUNGINA (CANCIDAS ) 70MG VIAL - LAB. :MERCK	1	2016-12-16 18:46:12.124551	2016-12-16 18:46:12.124551	\N	\N	\N	\N	\N	716121.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	2
542	CATETER BALON DE CONTRAPULSACION7FRX40CM	1	2016-12-16 18:46:12.129217	2016-12-16 18:46:12.129217	\N	\N	\N	\N	\N	2376000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	2
543	CATETER ANGIOGRAFICO INFINITY PIG-CORDIS - 5FR X .	1	2016-12-16 18:46:12.133601	2016-12-16 18:46:12.133601	\N	\N	\N	\N	\N	65150.0	0.0	150.0	4.0	\N	\N	\N	1	\N	\N	2
544	CATETER ANGIOGRAFICO PIG-CORDIS - 6FR X .038 X	1	2016-12-16 18:46:12.137972	2016-12-16 18:46:12.137972	\N	\N	\N	\N	\N	64505.0	0.0	150.0	2.0	\N	\N	\N	1	\N	\N	2
545	CATETER ANGIOGRAFICO-IM -CORDIS - 6FR X .038 X	1	2016-12-16 18:46:12.142391	2016-12-16 18:46:12.142391	\N	\N	\N	\N	\N	64505.0	0.0	150.0	2.0	\N	\N	\N	1	\N	\N	2
546	CATETER ANGIOGRAFICO-JL 3.5 -CORDIS - 5FR X .038 X	1	2016-12-16 18:46:12.147027	2016-12-16 18:46:12.147027	\N	\N	\N	\N	\N	53969.0	0.0	150.0	16.0	\N	\N	\N	1	\N	\N	2
547	CATETER ANGIOGRAFICO-JL 3.5 -CORDIS - 6FR X .038 X	1	2016-12-16 18:46:12.151314	2016-12-16 18:46:12.151314	\N	\N	\N	\N	\N	64505.0	0.0	150.0	5.0	\N	\N	\N	1	\N	\N	2
548	CATETER ANGIOGRAFICO-JL5-CORDIS - 6FR X .038 X	1	2016-12-16 18:46:12.155376	2016-12-16 18:46:12.155376	\N	\N	\N	\N	\N	64505.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	2
549	CATETER ANGIOGRAFICO-JR 3.5 -CORDIS - 6FR X .038 X	1	2016-12-16 18:46:12.159958	2016-12-16 18:46:12.159958	\N	\N	\N	\N	\N	64505.0	0.0	150.0	5.0	\N	\N	\N	1	\N	\N	2
550	CATETER ANGIOGRAFICO-MPA2-CORDIS - 5FR X .038 X	1	2016-12-16 18:46:12.164911	2016-12-16 18:46:12.164911	\N	\N	\N	\N	\N	64505.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	2
551	CATETER ANGIOGRAFICO-SIM 2-CORDIS - 5FR X .038 X	1	2016-12-16 18:46:12.16956	2016-12-16 18:46:12.16956	\N	\N	\N	\N	\N	64935.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	2
552	CATETER ANGIOGRAFICO-TEMPO 5 C2-CORDIS - 5FR X .	1	2016-12-16 18:46:12.174587	2016-12-16 18:46:12.174587	\N	\N	\N	\N	\N	64505.0	0.0	150.0	3.0	\N	\N	\N	1	\N	\N	2
553	CATETER ANGIOGRAFICO-TEMPO 5 PIG 1-CORDIS - 5FR	1	2016-12-16 18:46:12.17929	2016-12-16 18:46:12.17929	\N	\N	\N	\N	\N	64505.0	0.0	150.0	6.0	\N	\N	\N	1	\N	\N	2
554	CATETER ASPIRACION 6F EXPORTAP MED EMPAQUE	1	2016-12-16 18:46:12.183656	2016-12-16 18:46:12.183656	\N	\N	\N	\N	\N	2000000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	2
555	CATETER BALON DE CONTRAPULSACION INTRA-AORTICO	1	2016-12-16 18:46:12.188172	2016-12-16 18:46:12.188172	\N	\N	\N	\N	\N	2376000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	2
556	CATETER BALON FOX PLUS 5.0/30 135CM REF 10169814	1	2016-12-16 18:46:12.192491	2016-12-16 18:46:12.192491	\N	\N	\N	\N	\N	650000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	2
557	CATETER BALON FOX PLUS 6.0/30 135 5 REF 10164216	1	2016-12-16 18:46:12.196999	2016-12-16 18:46:12.196999	\N	\N	\N	\N	\N	650000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	2
558	CATETER BALON OCLUSION HYPERFORM 2.5FR 4 X 7MM	1	2016-12-16 18:46:12.201446	2016-12-16 18:46:12.201446	\N	\N	\N	\N	\N	2984000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	2
559	CATETER BALON OCLUSION HYPERGLID 2.2FR 4 X15MM	1	2016-12-16 18:46:12.20596	2016-12-16 18:46:12.20596	\N	\N	\N	\N	\N	1748000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	2
560	CATETER BALON PERIFERICO LIBERADOR DE PACLITAXEL	1	2016-12-16 18:46:12.210527	2016-12-16 18:46:12.210527	\N	\N	\N	\N	\N	2200000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	2
561	CATETER BILUMEN REF 6203.242 7FRX20CM EMPAQUE	1	2016-12-16 18:46:12.21526	2016-12-16 18:46:12.21526	\N	\N	\N	\N	\N	63750.0	0.0	150.0	3.0	\N	\N	\N	1	\N	\N	2
562	CATETER CENTRAL 3LUMEN REF LPPCVC3 UNIDAD	1	2016-12-16 18:46:12.21983	2016-12-16 18:46:12.21983	\N	\N	\N	\N	\N	64286.0	0.0	150.0	3.0	\N	\N	\N	1	\N	\N	2
563	CATETER CENTRAL BILUMEN LPPCVCB2 DELTA UNIDAD	1	2016-12-16 18:46:12.224431	2016-12-16 18:46:12.224431	\N	\N	\N	\N	\N	65071.0	0.0	150.0	2.0	\N	\N	\N	1	\N	\N	2
564	CATETER CORONARIO JUDKINS DERECHO 5FRX3.	1	2016-12-16 18:46:12.229462	2016-12-16 18:46:12.229462	\N	\N	\N	\N	\N	51000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	2
565	CATETER DIAG. 5 FR DAVIS HNBR 5.0 35 100 P NS DAV -	1	2016-12-16 18:46:12.233843	2016-12-16 18:46:12.233843	\N	\N	\N	\N	\N	97647.0	0.0	150.0	10.0	\N	\N	\N	1	\N	\N	2
566	CATETER DIAG. 5 FR SIMMONS 3 HNBR 5.0 38 100 M NS	1	2016-12-16 18:46:12.238453	2016-12-16 18:46:12.238453	\N	\N	\N	\N	\N	80000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	2
567	CATETER DIAG. 5 FR. PIGTAIL 534550S JYJ EMPAQUE	1	2016-12-16 18:46:12.243087	2016-12-16 18:46:12.243087	\N	\N	\N	\N	\N	64505.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	2
568	CATETER DIAG. 5 FR. SW3 451532HO JYJ EMPAQUE	1	2016-12-16 18:46:12.247922	2016-12-16 18:46:12.247922	\N	\N	\N	\N	\N	65795.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	2
569	CATETER DIAG. 5FR VITEK HNB 5.0 38 125 P NS VTK -TM	1	2016-12-16 18:46:12.252714	2016-12-16 18:46:12.252714	\N	\N	\N	\N	\N	79000.0	0.0	150.0	2.0	\N	\N	\N	1	\N	\N	2
570	CATETER DRENAJE MULTIPROPOSITO 8FRX25CM REF:BT-	1	2016-12-16 18:46:12.257015	2016-12-16 18:46:12.257015	\N	\N	\N	\N	\N	168188.0	0.0	150.0	2.0	\N	\N	\N	1	\N	\N	2
571	CATETER DX 5F 4-T45 PERFORMA ULTIMATE RADIAL	1	2016-12-16 18:46:12.261543	2016-12-16 18:46:12.261543	\N	\N	\N	\N	\N	44125.0	0.0	150.0	2.0	\N	\N	\N	1	\N	\N	2
572	CATETER DX INFINITI F5 100CM JR3.5 REF: 534-519T -	1	2016-12-16 18:46:12.26595	2016-12-16 18:46:12.26595	\N	\N	\N	\N	\N	59237.0	0.0	150.0	13.0	\N	\N	\N	1	\N	\N	2
573	CATETER DX SIM2 HNBR5.0-35-125CM VJ	1	2016-12-16 18:46:12.270195	2016-12-16 18:46:12.270195	\N	\N	\N	\N	\N	75211.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	2
574	CATETER EMBOLECTOMIA NO 3FR-EMBOLECTOMIA	1	2016-12-16 18:46:12.274507	2016-12-16 18:46:12.274507	\N	\N	\N	\N	\N	175960.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	2
575	CATETER GUIA XB 4SH 67005700 CORDIS EMPAQUE	1	2016-12-16 18:46:12.278872	2016-12-16 18:46:12.278872	\N	\N	\N	\N	\N	270504.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	2
576	CATETER GUIA 6 FR IM 67019100 JYJ EMPAQUE	1	2016-12-16 18:46:12.282994	2016-12-16 18:46:12.282994	\N	\N	\N	\N	\N	270504.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	2
577	CATETER GUIA 6 FR. AL 2 67004000 JYJ EMPAQUE	1	2016-12-16 18:46:12.287227	2016-12-16 18:46:12.287227	\N	\N	\N	\N	\N	270504.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	2
578	CATETER GUIA 6 FR. ENVOY MPC 67025600 JYJ	1	2016-12-16 18:46:12.291828	2016-12-16 18:46:12.291828	\N	\N	\N	\N	\N	377138.0	0.0	150.0	4.0	\N	\N	\N	1	\N	\N	2
579	CATETER GUIA 6 FR. JL 3.5 SH 67000300 JYJ EMPAQUE	1	2016-12-16 18:46:12.296495	2016-12-16 18:46:12.296495	\N	\N	\N	\N	\N	270504.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	2
580	CATETER GUIA 6 FR. JL 4.0 SH 67000500 JYJ EMPAQUE	1	2016-12-16 18:46:12.300813	2016-12-16 18:46:12.300813	\N	\N	\N	\N	\N	270504.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	2
581	CATETER GUIA 6 FR. JR 3.5 SH 67008100 JYJ EMPAQUE	1	2016-12-16 18:46:12.305027	2016-12-16 18:46:12.305027	\N	\N	\N	\N	\N	275914.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	2
582	CATETER GUIA 6 FR. MPA1 67027000 JYJ EMPAQUE	1	2016-12-16 18:46:12.309814	2016-12-16 18:46:12.309814	\N	\N	\N	\N	\N	275914.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	2
583	CATETER GUIA 6 FR. RENAL RDC 67021255 JYJ EMPAQUE	1	2016-12-16 18:46:12.314465	2016-12-16 18:46:12.314465	\N	\N	\N	\N	\N	137957.0	0.0	150.0	2.0	\N	\N	\N	1	\N	\N	2
584	CATETER GUIA 6FR B 3 5 67005400 JYJ EMPAQUE	1	2016-12-16 18:46:12.318984	2016-12-16 18:46:12.318984	\N	\N	\N	\N	\N	270504.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	2
585	CATETER GUIA 6FRXB3 670-052-00 JYJ EMPAQUE	1	2016-12-16 18:46:12.323375	2016-12-16 18:46:12.323375	\N	\N	\N	\N	\N	275914.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	2
586	CATETER GUIA 6FRXBLAD 3 5 67006000 JYJ EMPAQUE	1	2016-12-16 18:46:12.327628	2016-12-16 18:46:12.327628	\N	\N	\N	\N	\N	275914.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	2
587	CATETER GUIA 7 FR. JL 4.0 SH 77800500 JYJ EMPAQUE	1	2016-12-16 18:46:12.331694	2016-12-16 18:46:12.331694	\N	\N	\N	\N	\N	270504.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	2
588	CATETER GUIA CONCIERGE 5F JL - 4.0 100CM -	1	2016-12-16 18:46:12.336002	2016-12-16 18:46:12.336002	\N	\N	\N	\N	\N	213000.0	0.0	150.0	2.0	\N	\N	\N	1	\N	\N	2
589	CATETER GUIA CONCIERGE 5F JL- 3.5 100CM -WORLD	1	2016-12-16 18:46:12.340252	2016-12-16 18:46:12.340252	\N	\N	\N	\N	\N	213000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	2
590	CATETER GUIA CONCIERGE 5F JR 3.5 100CM	1	2016-12-16 18:46:12.344611	2016-12-16 18:46:12.344611	\N	\N	\N	\N	\N	213000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	2
591	CATETER GUIA CONCIERGE 5F JR 4.0 100CM	1	2016-12-16 18:46:12.34881	2016-12-16 18:46:12.34881	\N	\N	\N	\N	\N	213000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	2
592	CATETER GUIA CONCIERGE 5F SBS 40 100CM	1	2016-12-16 18:46:12.353077	2016-12-16 18:46:12.353077	\N	\N	\N	\N	\N	213000.0	0.0	150.0	2.0	\N	\N	\N	1	\N	\N	2
593	CATETER GUIA CONCIERGE SBS CGC5100BS35 WORLD	1	2016-12-16 18:46:12.357537	2016-12-16 18:46:12.357537	\N	\N	\N	\N	\N	213000.0	0.0	150.0	6.0	\N	\N	\N	1	\N	\N	2
594	CATETER GUIA VISTA BRITETIP JL3.5 8F 588851 EMPAQUE	1	2016-12-16 18:46:12.362054	2016-12-16 18:46:12.362054	\N	\N	\N	\N	\N	270504.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	2
595	CATETER GUIA VISTA BRITETIP-IM -CORDIS - 6FR-100	1	2016-12-16 18:46:12.367177	2016-12-16 18:46:12.367177	\N	\N	\N	\N	\N	270504.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	2
596	CATETER GUIA VISTA BRITETIP-RDC-CORDIS - 7FR-55	1	2016-12-16 18:46:12.372447	2016-12-16 18:46:12.372447	\N	\N	\N	\N	\N	275914.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	2
597	CATETER GUIA VISTA BRITETIP-XB 4 SH-CORDIS - 6FR-	1	2016-12-16 18:46:12.376653	2016-12-16 18:46:12.376653	\N	\N	\N	\N	\N	275914.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	2
598	CATETER GUIA XB3 6F 67005200 EMPAQUE INDIVIDUAL	1	2016-12-16 18:46:12.380715	2016-12-16 18:46:12.380715	\N	\N	\N	\N	\N	270504.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	2
599	CATETER GUIDER 40XF 8F/100CM 10144 BSC EMPAQUE	1	2016-12-16 18:46:12.384974	2016-12-16 18:46:12.384974	\N	\N	\N	\N	\N	400000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	2
600	CATETER INTRODUCTOR PERCUTANEO 01SI09700	1	2016-12-16 18:46:12.389559	2016-12-16 18:46:12.389559	\N	\N	\N	\N	\N	80500.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	2
601	CATETER MARKSMAN FA-55150-1030 EMPAQUE	1	2016-12-16 18:46:12.393809	2016-12-16 18:46:12.393809	\N	\N	\N	\N	\N	2220000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	2
602	CATETER PARA INFUSION FOUNTAIN 4F 50CMS	1	2016-12-16 18:46:12.398208	2016-12-16 18:46:12.398208	\N	\N	\N	\N	\N	600000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	2
603	CATETER PARA LAZO MULTI-SNARE 147310 EMPAQUE	1	2016-12-16 18:46:12.402452	2016-12-16 18:46:12.402452	\N	\N	\N	\N	\N	774300.0	0.0	150.0	2.0	\N	\N	\N	1	\N	\N	2
604	CATETER PIGTAIL SKATER DRENAJE 8Fr x 25Cm REF	1	2016-12-16 18:46:12.407222	2016-12-16 18:46:12.407222	\N	\N	\N	\N	\N	240750.0	0.0	150.0	2.0	\N	\N	\N	1	\N	\N	2
605	CATETER RADIAL AD-SAC 00820-ARROW -20GAX8CM	1	2016-12-16 18:46:12.4117	2016-12-16 18:46:12.4117	\N	\N	\N	\N	\N	34300.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	2
606	CATETER RADIAL ULTIMATE 5F 510038-ULT40 UNIDAD	1	2016-12-16 18:46:12.416114	2016-12-16 18:46:12.416114	\N	\N	\N	\N	\N	51000.0	0.0	150.0	2.0	\N	\N	\N	1	\N	\N	2
607	CATETER SWAN GANZ TD 5 VIASVIP- REF: 831HF75P	1	2016-12-16 18:46:12.420651	2016-12-16 18:46:12.420651	\N	\N	\N	\N	\N	182978.0	0.0	150.0	2.0	\N	\N	\N	1	\N	\N	2
608	CATETER TRILUMEN MULTICATH REF 6209 252 7.5FRX	1	2016-12-16 18:46:12.42529	2016-12-16 18:46:12.42529	\N	\N	\N	\N	\N	65072.0	0.0	150.0	4.0	\N	\N	\N	1	\N	\N	2
609	CATETER V CENTRAL MONOLUMEN 16GAX20 REF 04301	1	2016-12-16 18:46:12.429651	2016-12-16 18:46:12.429651	\N	\N	\N	\N	\N	50318.0	0.0	150.0	2.0	\N	\N	\N	1	\N	\N	2
610	CATETER VENOSO CENTRAL BILUMEN ADULTO 7F	1	2016-12-16 18:46:12.434157	2016-12-16 18:46:12.434157	\N	\N	\N	\N	\N	68000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	2
611	CATETERES EXTERNOS MASCULINOS COLECTOR NATURAL	1	2016-12-16 18:46:12.438499	2016-12-16 18:46:12.438499	\N	\N	\N	\N	\N	7606.0	0.0	150.0	2.0	\N	\N	\N	1	\N	\N	2
612	CATGUT CROMADO 5-0 - 70 CMS - RB 1- REFJJU202T	1	2016-12-16 18:46:12.44275	2016-12-16 18:46:12.44275	\N	\N	\N	\N	\N	5813.0	0.0	150.0	9.0	\N	\N	\N	1	\N	\N	2
613	CATHETER AB46 OUS RELIANT BALLON 00643169164185	1	2016-12-16 18:46:12.44708	2016-12-16 18:46:12.44708	\N	\N	\N	\N	\N	650000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	2
614	CAVILON PELICULA PROTECTORA 28ML SPRAY UND	1	2016-12-16 18:46:12.451379	2016-12-16 18:46:12.451379	\N	\N	\N	\N	\N	36750.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	2
615	CEFALEXINA 500MG CAPSULA - LAB. :GENFAR SA	1	2016-12-16 18:46:12.455508	2016-12-16 18:46:12.455508	\N	\N	\N	\N	\N	158.0	0.0	150.0	12.0	\N	\N	\N	1	\N	\N	2
616	CEFAZOLINA SODICA INYE 1G VIAL - LAB. :VITALIS S.A. C.	1	2016-12-16 18:46:12.459602	2016-12-16 18:46:12.459602	\N	\N	\N	\N	\N	1121.0	0.0	150.0	17.0	\N	\N	\N	1	\N	\N	2
617	CEFAZOLINA(KEFZOL) 1G VIAL - LAB. :LABORATORIOS	1	2016-12-16 18:46:12.464137	2016-12-16 18:46:12.464137	\N	\N	\N	\N	\N	3426.0	0.0	150.0	4.0	\N	\N	\N	1	\N	\N	2
618	CEFEPIME(MAXIPIME) 1G AMPOLLA - LAB. :BRISTOL-	1	2016-12-16 18:46:12.468573	2016-12-16 18:46:12.468573	\N	\N	\N	\N	\N	16279.0	0.0	150.0	28.0	\N	\N	\N	1	\N	\N	2
619	CEFTRIAXONA (ROCEFIN) 1G VIAL - LAB. :F. HOFFMANN-	1	2016-12-16 18:46:12.472857	2016-12-16 18:46:12.472857	\N	\N	\N	\N	\N	14824.0	0.0	150.0	11.0	\N	\N	\N	1	\N	\N	2
620	CELULA TMC50 BIOTREND 12/B TMC50 1/2 MED	1	2016-12-16 18:46:12.477128	2016-12-16 18:46:12.477128	\N	\N	\N	\N	\N	25851.0	0.0	150.0	8.0	\N	\N	\N	1	\N	\N	2
621	CERA PARA HUESO- REFCO1000 EMPAQUE INDIVIDUAL	1	2016-12-16 18:46:12.481816	2016-12-16 18:46:12.481816	\N	\N	\N	\N	\N	9277.0	0.0	150.0	9.0	\N	\N	\N	1	\N	\N	2
622	CILOSTAZOL (CILOSTAL) 50MG TABLETA - LAB. :MERCK	1	2016-12-16 18:46:12.486281	2016-12-16 18:46:12.486281	\N	\N	\N	\N	\N	703.0	0.0	150.0	5.0	\N	\N	\N	1	\N	\N	2
623	CINTA UMBILICAL DE ALGODON - REFJJU10T EMPAQUE	1	2016-12-16 18:46:12.490556	2016-12-16 18:46:12.490556	\N	\N	\N	\N	\N	8678.0	0.0	150.0	2.0	\N	\N	\N	1	\N	\N	2
624	CINTA UMBILICAL- REF 8886861903 EMPAQUE	1	2016-12-16 18:46:12.495562	2016-12-16 18:46:12.495562	\N	\N	\N	\N	\N	8700.0	0.0	150.0	3.0	\N	\N	\N	1	\N	\N	2
625	CIPROFLOXACINA 100MG/10ML VIAL - LAB. :VITALIS S.A.	1	2016-12-16 18:46:12.499632	2016-12-16 18:46:12.499632	\N	\N	\N	\N	\N	1096.0	0.0	150.0	31.0	\N	\N	\N	1	\N	\N	2
626	CIPROFLOXACINA 500MG TABLETA - LAB. :GENFAR SA	1	2016-12-16 18:46:12.503859	2016-12-16 18:46:12.503859	\N	\N	\N	\N	\N	318.0	0.0	150.0	6.0	\N	\N	\N	1	\N	\N	2
627	CIPROFLOXACINO (CIPRO) 400MG AMPOLLA - LAB. :	1	2016-12-16 18:46:12.508131	2016-12-16 18:46:12.508131	\N	\N	\N	\N	\N	25307.0	0.0	150.0	2.0	\N	\N	\N	1	\N	\N	2
628	CISATRACURIO BESILATO (NIMBIUM) 10MG AMPOLLA -	1	2016-12-16 18:46:12.512625	2016-12-16 18:46:12.512625	\N	\N	\N	\N	\N	24366.0	0.0	150.0	6.0	\N	\N	\N	1	\N	\N	2
629	CLARITROMICINA 500MG TABLETA - LAB. :GENFAR SA	1	2016-12-16 18:46:12.516956	2016-12-16 18:46:12.516956	\N	\N	\N	\N	\N	581.0	0.0	150.0	6.0	\N	\N	\N	1	\N	\N	2
630	CLARITROMICINA 500 MG (KLARICID) 500MG VIAL - LAB.	1	2016-12-16 18:46:12.521265	2016-12-16 18:46:12.521265	\N	\N	\N	\N	\N	25519.0	0.0	150.0	10.0	\N	\N	\N	1	\N	\N	2
631	CLEMASTINA (TAVEGYL) 2MG/2ML AMPOLLA - LAB. :	1	2016-12-16 18:46:12.525756	2016-12-16 18:46:12.525756	\N	\N	\N	\N	\N	9771.0	0.0	150.0	2.0	\N	\N	\N	1	\N	\N	2
632	CLINDAMICINA 600MG/4ML AMPOLLA - LAB. :	1	2016-12-16 18:46:12.530548	2016-12-16 18:46:12.530548	\N	\N	\N	\N	\N	800.0	0.0	150.0	2.0	\N	\N	\N	1	\N	\N	2
633	CLONAZEPAM 05MG TABLETA - LAB. :SANOFI WINTHROP	1	2016-12-16 18:46:12.534641	2016-12-16 18:46:12.534641	\N	\N	\N	\N	\N	43.0	0.0	150.0	4.0	\N	\N	\N	1	\N	\N	2
634	CLONIDINA 0.150MG TABLETA 0.150MG TABLETA - LAB.	1	2016-12-16 18:46:12.538762	2016-12-16 18:46:12.538762	\N	\N	\N	\N	\N	33.0	0.0	150.0	19.0	\N	\N	\N	1	\N	\N	2
635	CLOPIDOGREL (PLAVIX) 75MG TABLETA - LAB. :SANOFI	1	2016-12-16 18:46:12.543498	2016-12-16 18:46:12.543498	\N	\N	\N	\N	\N	4713.0	0.0	150.0	28.0	\N	\N	\N	1	\N	\N	2
636	CLOPIDOGREL 300MG (PLAVIX) 300MG TABLETA - LAB. :	1	2016-12-16 18:46:12.547847	2016-12-16 18:46:12.547847	\N	\N	\N	\N	\N	20800.0	0.0	150.0	2.0	\N	\N	\N	1	\N	\N	2
637	CLORHEXIDINA DIACETATO ANTISEPTICO BUCAL	1	2016-12-16 18:46:12.552347	2016-12-16 18:46:12.552347	\N	\N	\N	\N	\N	15293.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	2
638	CLORURO DE POTASIO 2MEQ/ML AMPOULEPACK - LAB. :	1	2016-12-16 18:46:12.556587	2016-12-16 18:46:12.556587	\N	\N	\N	\N	\N	216.0	0.0	150.0	35.0	\N	\N	\N	1	\N	\N	2
639	CLORURO DE SODIO 2MEQ/ML AMPOULEPACK - LAB. :	1	2016-12-16 18:46:12.561397	2016-12-16 18:46:12.561397	\N	\N	\N	\N	\N	304.0	0.0	150.0	72.0	\N	\N	\N	1	\N	\N	2
640	CLORURO DE SODIO USP 0.9% 1000ML 1000ML BOLSA -	1	2016-12-16 18:46:12.565695	2016-12-16 18:46:12.565695	\N	\N	\N	\N	\N	3064.0	0.0	150.0	31.0	\N	\N	\N	1	\N	\N	2
641	CLORURO DE SODIO USP 0.9% 100ML 100ML BOLSA -	1	2016-12-16 18:46:12.570391	2016-12-16 18:46:12.570391	\N	\N	\N	\N	\N	1324.0	0.0	150.0	61.0	\N	\N	\N	1	\N	\N	2
642	CLORURO DE SODIO USP 0.9% 100ML BOLSA - LAB. :	1	2016-12-16 18:46:12.574929	2016-12-16 18:46:12.574929	\N	\N	\N	\N	\N	1291.0	0.0	150.0	6.0	\N	\N	\N	1	\N	\N	2
643	CLORURO DE SODIO USP 0.9% 250ML 250ML BOLSA -	1	2016-12-16 18:46:12.578961	2016-12-16 18:46:12.578961	\N	\N	\N	\N	\N	1826.0	0.0	150.0	15.0	\N	\N	\N	1	\N	\N	2
644	CLORURO DE SODIO USP 0.9% 500ML 500ML BOLSA -	1	2016-12-16 18:46:12.583437	2016-12-16 18:46:12.583437	\N	\N	\N	\N	\N	1527.0	0.0	150.0	25.0	\N	\N	\N	1	\N	\N	2
645	CLORURO DE SODIO USP 0.9% 50ML 50ML BOLSA - LAB. :	1	2016-12-16 18:46:12.587773	2016-12-16 18:46:12.587773	\N	\N	\N	\N	\N	1235.0	0.0	150.0	67.0	\N	\N	\N	1	\N	\N	2
646	CLORURO DE SODIO USP 1000ML (ENEMATROL SALINO)	1	2016-12-16 18:46:12.592183	2016-12-16 18:46:12.592183	\N	\N	\N	\N	\N	14311.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	2
647	CLOSURE FAST CATHETER 7FR X 100CM EMPAQUE	1	2016-12-16 18:46:12.596551	2016-12-16 18:46:12.596551	\N	\N	\N	\N	\N	601987.0	0.0	150.0	6.0	\N	\N	\N	1	\N	\N	2
648	CLOSURE FAST CATHETER 7FX60CM EMPAQUE	1	2016-12-16 18:46:12.600723	2016-12-16 18:46:12.600723	\N	\N	\N	\N	\N	600000.0	0.0	150.0	6.0	\N	\N	\N	1	\N	\N	2
649	CLOTRIMAZOL CREMA TOPICA 40G TUBO - LAB. :	1	2016-12-16 18:46:12.605383	2016-12-16 18:46:12.605383	\N	\N	\N	\N	\N	700.0	0.0	150.0	2.0	\N	\N	\N	1	\N	\N	2
650	CLOTRIMAZOL CREMA VAGINAL 40 GR TUBO - LAB. :	1	2016-12-16 18:46:12.610161	2016-12-16 18:46:12.610161	\N	\N	\N	\N	\N	5833.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	2
651	COIL 3D NEUROVASCULAR MODELO AXIUM 0.010 3MM X	1	2016-12-16 18:46:12.614449	2016-12-16 18:46:12.614449	\N	\N	\N	\N	\N	700000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	2
652	COIL 3D NEUROVASCULAR MODELO AXIUM 0.010 4MM X	1	2016-12-16 18:46:12.618748	2016-12-16 18:46:12.618748	\N	\N	\N	\N	\N	700000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	2
653	COIL 3D NEUROVASCULAR MODELO AXIUM 0.010 7MM X	1	2016-12-16 18:46:12.623591	2016-12-16 18:46:12.623591	\N	\N	\N	\N	\N	700000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	2
654	COIL 3D NEUROVASCULAR MODELO AXIUM 0.010 8MM X	1	2016-12-16 18:46:12.628267	2016-12-16 18:46:12.628267	\N	\N	\N	\N	\N	700000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	2
655	COIL 4 X 8 3D QC-4-8-3D NEUROVASCULAR MODELO	1	2016-12-16 18:46:12.632727	2016-12-16 18:46:12.632727	\N	\N	\N	\N	\N	1120000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	2
656	COIL AXIUM 1.5MM X 4CM QC-1.5-4-HELIX COVIDEAN	1	2016-12-16 18:46:12.637411	2016-12-16 18:46:12.637411	\N	\N	\N	\N	\N	700000.0	0.0	150.0	2.0	\N	\N	\N	1	\N	\N	2
657	COIL AXIUM 2MM X 1CM QC-2-1-HELIX EMPAQUE	1	2016-12-16 18:46:12.641775	2016-12-16 18:46:12.641775	\N	\N	\N	\N	\N	700000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	2
658	COIL AXIUM HELIX -3MMX4CM- REF:03QC3-3-4-G.B	1	2016-12-16 18:46:12.646213	2016-12-16 18:46:12.646213	\N	\N	\N	\N	\N	700000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	2
659	COIL AXIUM HELIX 5MMX15CM 03QC-5-15-HELIX	1	2016-12-16 18:46:12.65048	2016-12-16 18:46:12.65048	\N	\N	\N	\N	\N	700000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	2
660	COIL AXIUM HELIX 5MMX20CM 03QC-5-20-HELIX	1	2016-12-16 18:46:12.654711	2016-12-16 18:46:12.654711	\N	\N	\N	\N	\N	700000.0	0.0	150.0	3.0	\N	\N	\N	1	\N	\N	2
661	COIL AXIUM PGLA 3D - 5 MM X 15 CM- REF :PC-5-15-	1	2016-12-16 18:46:12.659244	2016-12-16 18:46:12.659244	\N	\N	\N	\N	\N	700000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	2
662	COIL CASHMERE COMPLEX 14 6MM X 15CM CRC140615-	1	2016-12-16 18:46:12.663582	2016-12-16 18:46:12.663582	\N	\N	\N	\N	\N	910000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	2
663	COIL DELTAPAQ 9MM X 25CM DFS100925-20 EMPAQUE	1	2016-12-16 18:46:12.668308	2016-12-16 18:46:12.668308	\N	\N	\N	\N	\N	916067.0	0.0	150.0	2.0	\N	\N	\N	1	\N	\N	2
664	COIL DELTAPAQ PLATINUM 3MMX10CM DFS10031020 JYJ	1	2016-12-16 18:46:12.672582	2016-12-16 18:46:12.672582	\N	\N	\N	\N	\N	910000.0	0.0	150.0	2.0	\N	\N	\N	1	\N	\N	2
665	COIL EMBOLIZADOR NESTER MWCE 35-20-20 EMPAQUE	1	2016-12-16 18:46:12.676843	2016-12-16 18:46:12.676843	\N	\N	\N	\N	\N	423333.0	0.0	150.0	3.0	\N	\N	\N	1	\N	\N	2
666	COIL EMBOLIZADOR NESTER MWCE 35-20-18 EMPAQUE	1	2016-12-16 18:46:12.681503	2016-12-16 18:46:12.681503	\N	\N	\N	\N	\N	495000.0	0.0	150.0	2.0	\N	\N	\N	1	\N	\N	2
667	COIL EMBOLIZADOR MWCE-18-14-10-NESTER-	1	2016-12-16 18:46:12.685733	2016-12-16 18:46:12.685733	\N	\N	\N	\N	\N	475000.0	0.0	150.0	2.0	\N	\N	\N	1	\N	\N	2
668	COIL EMBOLIZADOR MWCE-18-14-6-NESTER-	1	2016-12-16 18:46:12.69016	2016-12-16 18:46:12.69016	\N	\N	\N	\N	\N	475000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	2
669	COIL EMBOLIZADOR MWCE-35-14-12-NESTER-	1	2016-12-16 18:46:12.694604	2016-12-16 18:46:12.694604	\N	\N	\N	\N	\N	520000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	2
670	COIL EMBOLIZADOR MWCE-35-14-20-NESTER VJ	1	2016-12-16 18:46:12.698715	2016-12-16 18:46:12.698715	\N	\N	\N	\N	\N	497500.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	2
671	COIL EMBOLIZADOR MWCE-35-14-8-NESTER-	1	2016-12-16 18:46:12.703628	2016-12-16 18:46:12.703628	\N	\N	\N	\N	\N	475000.0	0.0	150.0	3.0	\N	\N	\N	1	\N	\N	2
672	COIL HELIX AXIUM NEUROVASCULAR PC-4-12 COVIDEAN	1	2016-12-16 18:46:12.707716	2016-12-16 18:46:12.707716	\N	\N	\N	\N	\N	700000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	2
673	COIL HELIX NEUROVASCULAR AXIUM 0.010 10MM X	1	2016-12-16 18:46:12.711738	2016-12-16 18:46:12.711738	\N	\N	\N	\N	\N	1120000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	2
674	COIL HELIX NEUROVASCULAR AXIUM 0.010 2MM X 2CM	1	2016-12-16 18:46:12.715794	2016-12-16 18:46:12.715794	\N	\N	\N	\N	\N	700000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	2
675	COIL HELIX NEUROVASCULAR AXIUM 0.010 2MM X 3CM	1	2016-12-16 18:46:12.720457	2016-12-16 18:46:12.720457	\N	\N	\N	\N	\N	700000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	2
676	COIL HELIX NEUROVASCULAR AXIUM 0.010 2MM X 4CM	1	2016-12-16 18:46:12.724772	2016-12-16 18:46:12.724772	\N	\N	\N	\N	\N	700000.0	0.0	150.0	2.0	\N	\N	\N	1	\N	\N	2
677	COIL HELIX NEUROVASCULAR AXIUM 0.010 2MM X 8CM	1	2016-12-16 18:46:12.728935	2016-12-16 18:46:12.728935	\N	\N	\N	\N	\N	700000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	2
678	COIL HELIX NEUROVASCULAR AXIUM 0.010 3MM X 6CM	1	2016-12-16 18:46:12.733098	2016-12-16 18:46:12.733098	\N	\N	\N	\N	\N	700000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	2
679	COIL HELIX NEUROVASCULAR AXIUM 0.010 3MM X 8CM	1	2016-12-16 18:46:12.737301	2016-12-16 18:46:12.737301	\N	\N	\N	\N	\N	700000.0	0.0	150.0	2.0	\N	\N	\N	1	\N	\N	2
680	COIL HELIX NEUROVASCULAR AXIUM 0.010 4MM X 10CM	1	2016-12-16 18:46:12.741539	2016-12-16 18:46:12.741539	\N	\N	\N	\N	\N	700000.0	0.0	150.0	2.0	\N	\N	\N	1	\N	\N	2
681	COIL HELIX NEUROVASCULAR AXIUM 0.010 4MM X 12CM	1	2016-12-16 18:46:12.753297	2016-12-16 18:46:12.753297	\N	\N	\N	\N	\N	1120000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	2
682	COIL HELIX NEUROVASCULAR AXIUM 0.010 6MM X 20CM	1	2016-12-16 18:46:12.757574	2016-12-16 18:46:12.757574	\N	\N	\N	\N	\N	700000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	2
683	COIL HELIX NEUROVASCULAR AXIUM 0.010 7MM X 30CM	1	2016-12-16 18:46:12.761852	2016-12-16 18:46:12.761852	\N	\N	\N	\N	\N	700000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	2
684	COIL HELIX NEUROVASCULAR AXIUM 0.010 8MM X 30CM	1	2016-12-16 18:46:12.766333	2016-12-16 18:46:12.766333	\N	\N	\N	\N	\N	700000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	2
685	COIL HELIX NEUROVASCULAR AXIUM 0.010 9MM X 30CM	1	2016-12-16 18:46:12.770867	2016-12-16 18:46:12.770867	\N	\N	\N	\N	\N	1120000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	2
686	COIL MICRUSPHERE 10 PLAT 8MM SPH10080020 UNIDAD	1	2016-12-16 18:46:12.775445	2016-12-16 18:46:12.775445	\N	\N	\N	\N	\N	687050.0	0.0	150.0	2.0	\N	\N	\N	1	\N	\N	2
687	COIL MICRUSPHERE 10 PLAT 9MMX25 SPH10092520	1	2016-12-16 18:46:12.779824	2016-12-16 18:46:12.779824	\N	\N	\N	\N	\N	910000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	2
688	COIL MICRUSPHERE 3.5MMM X 7CM SPH100357-20 JYJ	1	2016-12-16 18:46:12.784478	2016-12-16 18:46:12.784478	\N	\N	\N	\N	\N	910000.0	0.0	150.0	2.0	\N	\N	\N	1	\N	\N	2
689	COIL MICRUSPHERE 3MMX5CM REF: DFS100305-20 - JYJ	1	2016-12-16 18:46:12.789074	2016-12-16 18:46:12.789074	\N	\N	\N	\N	\N	910000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	2
690	COIL MICRUSPHERE 4MMMX8CM SPH100408-20	1	2016-12-16 18:46:12.793754	2016-12-16 18:46:12.793754	\N	\N	\N	\N	\N	910000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	2
691	COIL MICRUSPHERE 6MMX12CM SSR100612-20	1	2016-12-16 18:46:12.798299	2016-12-16 18:46:12.798299	\N	\N	\N	\N	\N	910000.0	0.0	150.0	3.0	\N	\N	\N	1	\N	\N	2
692	COIL MICRUSPHERE ESF. 6 X 20 SPH100620 20 WM	1	2016-12-16 18:46:12.803202	2016-12-16 18:46:12.803202	\N	\N	\N	\N	\N	910000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	2
693	COIL MICRUSPHERE PLATIUM 7MM X 20CM SPH100720-	1	2016-12-16 18:46:12.807638	2016-12-16 18:46:12.807638	\N	\N	\N	\N	\N	910000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	2
694	COIL MICRUSPHERE XL 10 3MM X 5CM SSR10030520 JYJ	1	2016-12-16 18:46:12.811997	2016-12-16 18:46:12.811997	\N	\N	\N	\N	\N	910000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	2
695	COIL MICRUSPHERE XL 10 4MM X 8CM SSR10040820 JYJ	1	2016-12-16 18:46:12.816525	2016-12-16 18:46:12.816525	\N	\N	\N	\N	\N	910000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	2
696	COIL MICRUSPHERE XL 10 6MM X 20CM SSR10062020 JYJ	1	2016-12-16 18:46:12.821142	2016-12-16 18:46:12.821142	\N	\N	\N	\N	\N	910000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	2
697	COIL NESTER MWCE-35-20-10 EMPAQUE INDIVIDUAL	1	2016-12-16 18:46:12.825965	2016-12-16 18:46:12.825965	\N	\N	\N	\N	\N	495000.0	0.0	150.0	2.0	\N	\N	\N	1	\N	\N	2
698	COIL PLATINUM MICRUSPHERE 2.5MM X 3.3CM	1	2016-12-16 18:46:12.830685	2016-12-16 18:46:12.830685	\N	\N	\N	\N	\N	910000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	2
699	COIL PLATINUM MICRUSPHERE 2MM X 2 5 CM SPH100200	1	2016-12-16 18:46:12.835311	2016-12-16 18:46:12.835311	\N	\N	\N	\N	\N	910000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	2
700	COIL PRIME AXIUM 4MM X 12CM HELIX APB-4-12-H	1	2016-12-16 18:46:12.84006	2016-12-16 18:46:12.84006	\N	\N	\N	\N	\N	700000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	2
701	COIL PRIME AXIUM 4MM X 12XM 3D APB-4-12-3D-SS -	1	2016-12-16 18:46:12.844556	2016-12-16 18:46:12.844556	\N	\N	\N	\N	\N	700000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	2
702	COIL PRIME AXIUM 5MM X 15XM 3D APB-5-15-3D-SS -	1	2016-12-16 18:46:12.849234	2016-12-16 18:46:12.849234	\N	\N	\N	\N	\N	700000.0	0.0	150.0	2.0	\N	\N	\N	1	\N	\N	2
703	COIL PRIME AXIUM 6MM X 20CM APB-6-20-3D	1	2016-12-16 18:46:12.854409	2016-12-16 18:46:12.854409	\N	\N	\N	\N	\N	700000.0	0.0	150.0	2.0	\N	\N	\N	1	\N	\N	2
704	COIL TORNADO 18S 10/4 TORNADO EMPAQUE	1	2016-12-16 18:46:12.859477	2016-12-16 18:46:12.859477	\N	\N	\N	\N	\N	780000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	2
705	COILS NESTER MWCE-35-20-16 EMPAQUE INDIVIDUAL	1	2016-12-16 18:46:12.864986	2016-12-16 18:46:12.864986	\N	\N	\N	\N	\N	280000.0	0.0	150.0	3.0	\N	\N	\N	1	\N	\N	2
706	COLAGENASA (IRUXOL SIMPLEX) 20GR TUBO - LAB. :	1	2016-12-16 18:46:12.869295	2016-12-16 18:46:12.869295	\N	\N	\N	\N	\N	49393.0	0.0	150.0	2.0	\N	\N	\N	1	\N	\N	2
707	COLCHICINA 0.5MG TABLETA - LAB. :WINTHROP	1	2016-12-16 18:46:12.873828	2016-12-16 18:46:12.873828	\N	\N	\N	\N	\N	30.0	0.0	150.0	5.0	\N	\N	\N	1	\N	\N	2
708	COMBO OXIGENADOR 95217 MEDTRONIC EMPAQUE	1	2016-12-16 18:46:12.878784	2016-12-16 18:46:12.878784	\N	\N	\N	\N	\N	1276000.0	0.0	150.0	4.0	\N	\N	\N	1	\N	\N	2
709	COMPLEJO B (10.10.20.50)MG TABLETA - LAB. :	1	2016-12-16 18:46:12.883165	2016-12-16 18:46:12.883165	\N	\N	\N	\N	\N	67.0	0.0	150.0	16.0	\N	\N	\N	1	\N	\N	2
710	CONECTOR RECTO 1/2 X 1/2 SIN LUER EMPAQUE	1	2016-12-16 18:46:12.887759	2016-12-16 18:46:12.887759	\N	\N	\N	\N	\N	8667.0	0.0	150.0	6.0	\N	\N	\N	1	\N	\N	2
711	CONECTOR RECTO 1/2 X 3/8 SIN LUER EMPAQUE	1	2016-12-16 18:46:12.892083	2016-12-16 18:46:12.892083	\N	\N	\N	\N	\N	13449.0	0.0	150.0	7.0	\N	\N	\N	1	\N	\N	2
712	CONO ADULTO BPX 80 BIO EMPAQUE INDIVIDUAL	1	2016-12-16 18:46:12.896268	2016-12-16 18:46:12.896268	\N	\N	\N	\N	\N	707600.0	0.0	150.0	2.0	\N	\N	\N	1	\N	\N	2
713	CUSTODIOL SOLUCION HTK DE BRETSCHNEIDER	1	2016-12-16 18:46:12.901012	2016-12-16 18:46:12.901012	\N	\N	\N	\N	\N	709679.0	0.0	150.0	3.0	\N	\N	\N	1	\N	\N	2
714	CUSTOM TUBING PACK INTERSEP REF TL8A14R EMPAQUE	1	2016-12-16 18:46:12.90622	2016-12-16 18:46:12.90622	\N	\N	\N	\N	\N	1276000.0	0.0	150.0	7.0	\N	\N	\N	1	\N	\N	2
715	CYSTOFLO EQUIPO PARA DRENAJE URINARIO 200ML	1	2016-12-16 18:46:12.910979	2016-12-16 18:46:12.910979	\N	\N	\N	\N	\N	7800.0	0.0	150.0	4.0	\N	\N	\N	1	\N	\N	2
716	CYSTOFLO PEDIATRICO EQUIPO DRENAJE URINARIO X	1	2016-12-16 18:46:12.915745	2016-12-16 18:46:12.915745	\N	\N	\N	\N	\N	6918.0	0.0	150.0	2.0	\N	\N	\N	1	\N	\N	2
717	DABIGATRAN ETEXILATO (PRADAXA) 75MG CAPSULA -	1	2016-12-16 18:46:12.921276	2016-12-16 18:46:12.921276	\N	\N	\N	\N	\N	1396.0	0.0	150.0	8.0	\N	\N	\N	1	\N	\N	2
718	DAPTOMICINA(CUBICIN) 350MG VIAL - LAB. :NOVARTIS	1	2016-12-16 18:46:12.926473	2016-12-16 18:46:12.926473	\N	\N	\N	\N	\N	178533.0	0.0	150.0	4.0	\N	\N	\N	1	\N	\N	2
719	DAPTOMICINA(CUBICIN) 500MG VIAL - LAB. :NOVARTIS	1	2016-12-16 18:46:12.93135	2016-12-16 18:46:12.93135	\N	\N	\N	\N	\N	275828.0	0.0	150.0	7.0	\N	\N	\N	1	\N	\N	2
720	DESMOPRESINA (OCTOSTIM) 1ML AMPOLLA - LAB. :	1	2016-12-16 18:46:12.936529	2016-12-16 18:46:12.936529	\N	\N	\N	\N	\N	202697.0	0.0	150.0	4.0	\N	\N	\N	1	\N	\N	2
721	DEXAMETASONA 4MG AMPOLLA - LAB. :GENFAR SA	1	2016-12-16 18:46:12.941346	2016-12-16 18:46:12.941346	\N	\N	\N	\N	\N	298.0	0.0	150.0	9.0	\N	\N	\N	1	\N	\N	2
722	DEXMEDETOMIDINA (DEXDOR) 400MCG VIAL - LAB. :	1	2016-12-16 18:46:12.945926	2016-12-16 18:46:12.945926	\N	\N	\N	\N	\N	131673.0	0.0	150.0	10.0	\N	\N	\N	1	\N	\N	2
723	DEXMEDETOMIDINA (PRECEDEX) 100MCG VIAL - LAB. :	1	2016-12-16 18:46:12.950894	2016-12-16 18:46:12.950894	\N	\N	\N	\N	\N	84250.0	0.0	150.0	6.0	\N	\N	\N	1	\N	\N	2
724	DEXTROSA AL 5% USP 250ML 250ML BOLSA - LAB. :	1	2016-12-16 18:46:12.956291	2016-12-16 18:46:12.956291	\N	\N	\N	\N	\N	1683.0	0.0	150.0	17.0	\N	\N	\N	1	\N	\N	2
725	DEXTROSA AL 5% USP 500ML 500ML BOLSA - LAB. :	1	2016-12-16 18:46:12.961242	2016-12-16 18:46:12.961242	\N	\N	\N	\N	\N	1593.0	0.0	150.0	6.0	\N	\N	\N	1	\N	\N	2
726	DEXTROSA AL 50% USP 500ML 500ML BOLSA - LAB. :	1	2016-12-16 18:46:12.966463	2016-12-16 18:46:12.966463	\N	\N	\N	\N	\N	6400.0	0.0	150.0	2.0	\N	\N	\N	1	\N	\N	2
727	DEXTROSA USP 10% 500ML BOLSA - LAB. :	1	2016-12-16 18:46:12.971109	2016-12-16 18:46:12.971109	\N	\N	\N	\N	\N	1770.0	0.0	150.0	4.0	\N	\N	\N	1	\N	\N	2
728	DIAL A FLO MICRO- REF: HE591 EMPAQUE INDIVIDUAL	1	2016-12-16 18:46:12.975512	2016-12-16 18:46:12.975512	\N	\N	\N	\N	\N	16454.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	2
729	DIALIZADOR 150 POLYFLUX REVACLEAR GAMBRO	1	2016-12-16 18:46:12.980471	2016-12-16 18:46:12.980471	\N	\N	\N	\N	\N	32126.0	0.0	150.0	3.0	\N	\N	\N	1	\N	\N	2
730	DIALIZADOR XENIUM XPH110 EMPAQUE INDIVIDUAL	1	2016-12-16 18:46:12.985074	2016-12-16 18:46:12.985074	\N	\N	\N	\N	\N	74114.0	0.0	150.0	4.0	\N	\N	\N	1	\N	\N	2
731	DIALIZADOR XENIUM XPH150 REF.H25603A EMPAQUE	1	2016-12-16 18:46:12.991626	2016-12-16 18:46:12.991626	\N	\N	\N	\N	\N	55197.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	2
732	DIAZEPAM (VALIUM) 10MG/2ML AMPOLLA - LAB. :	1	2016-12-16 18:46:12.995984	2016-12-16 18:46:12.995984	\N	\N	\N	\N	\N	4216.0	0.0	150.0	2.0	\N	\N	\N	1	\N	\N	2
733	DICLOFENACO 75MG/3ML AMPOLLA - LAB. :	1	2016-12-16 18:46:13.000423	2016-12-16 18:46:13.000423	\N	\N	\N	\N	\N	579.0	0.0	150.0	2.0	\N	\N	\N	1	\N	\N	2
734	DICLOFENACO SODICO (VOLTAREN) 75MG/3ML	1	2016-12-16 18:46:13.005677	2016-12-16 18:46:13.005677	\N	\N	\N	\N	\N	4147.0	0.0	150.0	7.0	\N	\N	\N	1	\N	\N	2
735	DIHIDROCODEINA BITARTRATO 12.1MG/5 ML FRASCO -	1	2016-12-16 18:46:13.010462	2016-12-16 18:46:13.010462	\N	\N	\N	\N	\N	2811.0	0.0	150.0	2.0	\N	\N	\N	1	\N	\N	2
736	DILTIAZEM 60MG TABLETA - LAB. :GENFAR SA	1	2016-12-16 18:46:13.014963	2016-12-16 18:46:13.014963	\N	\N	\N	\N	\N	24.0	0.0	150.0	4.0	\N	\N	\N	1	\N	\N	2
737	DIMENHIDRINATO (DRAMAMINE) 50MG TABLETA - LAB. :	1	2016-12-16 18:46:13.019784	2016-12-16 18:46:13.019784	\N	\N	\N	\N	\N	306.0	0.0	150.0	6.0	\N	\N	\N	1	\N	\N	2
738	DIMENHIDRINATO 50MG TABLETA - LAB. :LABORATORIOS	1	2016-12-16 18:46:13.024218	2016-12-16 18:46:13.024218	\N	\N	\N	\N	\N	227.0	0.0	150.0	13.0	\N	\N	\N	1	\N	\N	2
739	DINITRATO DE ISOSORBIDA 10MG TABLETA - LAB. :	1	2016-12-16 18:46:13.028815	2016-12-16 18:46:13.028815	\N	\N	\N	\N	\N	13.0	0.0	150.0	13.0	\N	\N	\N	1	\N	\N	2
740	DIPIRONA 1GR/2ML AMPOLLA - LAB. :GENFAR SA	1	2016-12-16 18:46:13.033499	2016-12-16 18:46:13.033499	\N	\N	\N	\N	\N	325.0	0.0	150.0	13.0	\N	\N	\N	1	\N	\N	2
741	DIPIRONA MAGNESICA 2G AMPOLLA - LAB. :	1	2016-12-16 18:46:13.038347	2016-12-16 18:46:13.038347	\N	\N	\N	\N	\N	446.0	0.0	150.0	8.0	\N	\N	\N	1	\N	\N	2
742	DISPOSITIVO DE ASEGURAMIENTO CLORHEXIDINA 2%	1	2016-12-16 18:46:13.042804	2016-12-16 18:46:13.042804	\N	\N	\N	\N	\N	15976.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	2
743	DISPOSITIVO DE ASEGURAMIENTO PARA FIJACION DE	1	2016-12-16 18:46:13.047023	2016-12-16 18:46:13.047023	\N	\N	\N	\N	\N	2151.0	0.0	150.0	28.0	\N	\N	\N	1	\N	\N	2
744	DISPOSITIVO DE CIERRE DE CIA AMPLATZER 9ASD018 ST	1	2016-12-16 18:46:13.051647	2016-12-16 18:46:13.051647	\N	\N	\N	\N	\N	10000000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	2
745	DISPOSITIVO DE EMBOLIZACION PIPELINE FLEX 5X35	1	2016-12-16 18:46:13.056466	2016-12-16 18:46:13.056466	\N	\N	\N	\N	\N	27300000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	2
746	DISPOSITIVO DE EMBOLIZACION PIPELINE 4.25MM X	1	2016-12-16 18:46:13.062879	2016-12-16 18:46:13.062879	\N	\N	\N	\N	\N	14000000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	2
747	DISPOSITIVO DE EMBOLIZACION PIPELINE 4.50MM X	1	2016-12-16 18:46:13.068278	2016-12-16 18:46:13.068278	\N	\N	\N	\N	\N	14000000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	2
748	DISPOSITIVO DE EMBOLIZACION PIPELINE FLEX 3.50	1	2016-12-16 18:46:13.072912	2016-12-16 18:46:13.072912	\N	\N	\N	\N	\N	27000000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	2
749	DISPOSITIVO DE EMBOLIZACION PIPELINE FLEX 4.75MM X	1	2016-12-16 18:46:13.078783	2016-12-16 18:46:13.078783	\N	\N	\N	\N	\N	27600000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	2
750	DISPOSITIVO DE EMBOLIZACION PIPELINE FLEX 4.75X20	1	2016-12-16 18:46:13.083948	2016-12-16 18:46:13.083948	\N	\N	\N	\N	\N	27600000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	2
751	DISPOSITIVO GASTROSTOMIA PERCUTANEO	1	2016-12-16 18:46:13.088309	2016-12-16 18:46:13.088309	\N	\N	\N	\N	\N	420759.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	2
752	DISPOSITIVO REMODELACION NEUROVASCULAR	1	2016-12-16 18:46:13.0931	2016-12-16 18:46:13.0931	\N	\N	\N	\N	\N	5244000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	2
753	DIVALPROATO SODICO (VALCOTE) 500MG TABLETA -	1	2016-12-16 18:46:13.097737	2016-12-16 18:46:13.097737	\N	\N	\N	\N	\N	1511.0	0.0	150.0	7.0	\N	\N	\N	1	\N	\N	2
754	DOBUTAMINA 250MG/20ML AMPOLLA - LAB. :	1	2016-12-16 18:46:13.102798	2016-12-16 18:46:13.102798	\N	\N	\N	\N	\N	2951.0	0.0	150.0	10.0	\N	\N	\N	1	\N	\N	2
755	DOPAMINA CLORHIDRATO EN DEXTROSA AL 5% USP	1	2016-12-16 18:46:13.107955	2016-12-16 18:46:13.107955	\N	\N	\N	\N	\N	17683.0	0.0	150.0	2.0	\N	\N	\N	1	\N	\N	2
756	DOPAMINA 200MG/5ML SOL INY UNIDAD AMPOLLA -	1	2016-12-16 18:46:13.112896	2016-12-16 18:46:13.112896	\N	\N	\N	\N	\N	666.0	0.0	150.0	2.0	\N	\N	\N	1	\N	\N	2
757	DUODERM ET 7957 15X15CM- REF: ET 7957 EMPAQUE	1	2016-12-16 18:46:13.117236	2016-12-16 18:46:13.117236	\N	\N	\N	\N	\N	21609.0	0.0	150.0	2.0	\N	\N	\N	1	\N	\N	2
758	ELECTRO MULTIFUNCIONAL PHILIPS M3501A EMPAQUE	1	2016-12-16 18:46:13.121765	2016-12-16 18:46:13.121765	\N	\N	\N	\N	\N	191846.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	2
759	ELECTRODO DE ESTIMULACION AURICULAR DE FIJACION	1	2016-12-16 18:46:13.126065	2016-12-16 18:46:13.126065	\N	\N	\N	\N	\N	746900.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	2
760	ELECTRODO DE ESTIMULACION VENTRICULAR DE	1	2016-12-16 18:46:13.130512	2016-12-16 18:46:13.130512	\N	\N	\N	\N	\N	746900.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	2
761	ELECTRODO MARCAPASOS TEMPORAL 6FRX110CM	1	2016-12-16 18:46:13.134928	2016-12-16 18:46:13.134928	\N	\N	\N	\N	\N	304670.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	2
762	ELECTRODOS DE MONITOREO KENDALL MEDITRACE REF:	1	2016-12-16 18:46:13.139157	2016-12-16 18:46:13.139157	\N	\N	\N	\N	\N	262.0	0.0	150.0	135.0	\N	\N	\N	1	\N	\N	2
763	EMPATE MACHO MACHO VYGON EMPAQUE INDIVIDUAL	1	2016-12-16 18:46:13.144393	2016-12-16 18:46:13.144393	\N	\N	\N	\N	\N	2444.0	0.0	150.0	2.0	\N	\N	\N	1	\N	\N	2
764	ENALAPRIL 20MG TABLETA - LAB. :GENFAR SA	1	2016-12-16 18:46:13.149469	2016-12-16 18:46:13.149469	\N	\N	\N	\N	\N	14.0	0.0	150.0	13.0	\N	\N	\N	1	\N	\N	2
765	ENALAPRIL 5MG TABLETA - LAB. :PENTACOOP	1	2016-12-16 18:46:13.15398	2016-12-16 18:46:13.15398	\N	\N	\N	\N	\N	37.0	0.0	150.0	14.0	\N	\N	\N	1	\N	\N	2
766	ENALAPRIL 5MG TABLETA - LAB. :GENFAR SA	1	2016-12-16 18:46:13.158628	2016-12-16 18:46:13.158628	\N	\N	\N	\N	\N	8.0	0.0	150.0	16.0	\N	\N	\N	1	\N	\N	2
767	ENDOPROTESIS ABDOMINAL ENDURANT	1	2016-12-16 18:46:13.163143	2016-12-16 18:46:13.163143	\N	\N	\N	\N	\N	24000000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	2
768	ENOXAPARINA(CLEXANE) 20MG/0.2ML JERINGA PRELLENA	1	2016-12-16 18:46:13.167993	2016-12-16 18:46:13.167993	\N	\N	\N	\N	\N	15552.0	0.0	150.0	8.0	\N	\N	\N	1	\N	\N	3
769	ENOXAPARINA(CLEXANE) 40MG/0.4ML JERINGA PRELLENA	1	2016-12-16 18:46:13.172219	2016-12-16 18:46:13.172219	\N	\N	\N	\N	\N	15965.0	0.0	150.0	33.0	\N	\N	\N	1	\N	\N	3
770	ENOXAPARINA(CLEXANE) 60MG/0.6ML JERINGA PRELLENA	1	2016-12-16 18:46:13.176576	2016-12-16 18:46:13.176576	\N	\N	\N	\N	\N	30961.0	0.0	150.0	30.0	\N	\N	\N	1	\N	\N	3
771	ENOXAPARINA(CLEXANE) 80MG/0.8ML JERINGA PRELLENA	1	2016-12-16 18:46:13.181143	2016-12-16 18:46:13.181143	\N	\N	\N	\N	\N	34551.0	0.0	150.0	13.0	\N	\N	\N	1	\N	\N	3
772	EPINEFRINA (ADRENALINA) 1MG AMPOLLA - LAB. :	1	2016-12-16 18:46:13.185719	2016-12-16 18:46:13.185719	\N	\N	\N	\N	\N	395.0	0.0	150.0	13.0	\N	\N	\N	1	\N	\N	3
773	EQ. E PUMP KANGAROO X 1000 REF673662 (Doble	1	2016-12-16 18:46:13.189992	2016-12-16 18:46:13.189992	\N	\N	\N	\N	\N	25261.0	0.0	150.0	4.0	\N	\N	\N	1	\N	\N	3
774	EQUIPO ADMON NITROGLICERINA CON BOMBA- REF:	1	2016-12-16 18:46:13.194116	2016-12-16 18:46:13.194116	\N	\N	\N	\N	\N	27589.0	0.0	150.0	3.0	\N	\N	\N	1	\N	\N	3
775	EQUIPO ADMON SANGRE S/AGUJA 4C2160 EMPAQUE	1	2016-12-16 18:46:13.198859	2016-12-16 18:46:13.198859	\N	\N	\N	\N	\N	4490.0	0.0	150.0	7.0	\N	\N	\N	1	\N	\N	3
776	EQUIPO ADMON SOLUC C/MICROGOTEO- REF:	1	2016-12-16 18:46:13.20317	2016-12-16 18:46:13.20317	\N	\N	\N	\N	\N	2294.0	0.0	150.0	6.0	\N	\N	\N	1	\N	\N	3
777	EQUIPO BOMBA P-ADMINISTRACION FOTOSENSIBLE REF:	1	2016-12-16 18:46:13.207394	2016-12-16 18:46:13.207394	\N	\N	\N	\N	\N	36715.0	0.0	150.0	5.0	\N	\N	\N	1	\N	\N	3
778	EQUIPO BURETA (BURETROL) 150 ML- REF: ARC7503	1	2016-12-16 18:46:13.211941	2016-12-16 18:46:13.211941	\N	\N	\N	\N	\N	3268.0	0.0	150.0	9.0	\N	\N	\N	1	\N	\N	3
779	EQUIPO DE EXTENSION PARA ANESTESIA- REF:	1	2016-12-16 18:46:13.216341	2016-12-16 18:46:13.216341	\N	\N	\N	\N	\N	2710.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
780	EQUIPO DE MACROGOTEO CON PUERTO SENCILL EN Y	1	2016-12-16 18:46:13.220968	2016-12-16 18:46:13.220968	\N	\N	\N	\N	\N	1471.0	0.0	150.0	8.0	\N	\N	\N	1	\N	\N	3
781	EQUIPO DE RECUPERACION DE FILTRO GTRS-200-RB VJ	1	2016-12-16 18:46:13.225488	2016-12-16 18:46:13.225488	\N	\N	\N	\N	\N	2050000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
782	EQUIPO EN Y TUR PARA IRRIGACION- REF: ARC4005	1	2016-12-16 18:46:13.229814	2016-12-16 18:46:13.229814	\N	\N	\N	\N	\N	18389.0	0.0	150.0	2.0	\N	\N	\N	1	\N	\N	3
783	EQUIPO ESTANDAR DE ADMON CON BOMBA- REF:	1	2016-12-16 18:46:13.234346	2016-12-16 18:46:13.234346	\N	\N	\N	\N	\N	15696.0	0.0	150.0	25.0	\N	\N	\N	1	\N	\N	3
784	EQUIPO EXTENSION ANESTESIA R33- REF: ARC00473MP	1	2016-12-16 18:46:13.238668	2016-12-16 18:46:13.238668	\N	\N	\N	\N	\N	2305.0	0.0	150.0	48.0	\N	\N	\N	1	\N	\N	3
785	EQUIPO KANGAROO REF 669 ULTRAPAC EMPAQUE	1	2016-12-16 18:46:13.243121	2016-12-16 18:46:13.243121	\N	\N	\N	\N	\N	29335.0	0.0	150.0	6.0	\N	\N	\N	1	\N	\N	3
786	EQUIPO MACROGOTEO CON 2 SITIOS EN Y REF	1	2016-12-16 18:46:13.247653	2016-12-16 18:46:13.247653	\N	\N	\N	\N	\N	3287.0	0.0	150.0	12.0	\N	\N	\N	1	\N	\N	3
787	EQUIPO MACROGOTERO C/SITIO INY. DOS Y- MRC0005P	1	2016-12-16 18:46:13.252113	2016-12-16 18:46:13.252113	\N	\N	\N	\N	\N	3077.0	0.0	150.0	7.0	\N	\N	\N	1	\N	\N	3
788	EQUIPO PATROL TAPA ROSCA-ADAP REF M221-B14 UND	1	2016-12-16 18:46:13.256313	2016-12-16 18:46:13.256313	\N	\N	\N	\N	\N	26643.0	0.0	150.0	10.0	\N	\N	\N	1	\N	\N	3
789	EQUIPOS PERICRANEALES VYGON. 19GX3/4 EMPAQUE	1	2016-12-16 18:46:13.260627	2016-12-16 18:46:13.260627	\N	\N	\N	\N	\N	404.0	0.0	150.0	3.0	\N	\N	\N	1	\N	\N	3
790	EQUIPOS PERICRANEALES VYGON. 21G EMPAQUE	1	2016-12-16 18:46:13.265162	2016-12-16 18:46:13.265162	\N	\N	\N	\N	\N	415.0	0.0	150.0	5.0	\N	\N	\N	1	\N	\N	3
791	EQUIPOS PERICRANEALES VYGON. 23G EMPAQUE	1	2016-12-16 18:46:13.26947	2016-12-16 18:46:13.26947	\N	\N	\N	\N	\N	401.0	0.0	150.0	3.0	\N	\N	\N	1	\N	\N	3
792	ERITROPOYETINA HUMANA RECOMBINANTE (EPOYET)	1	2016-12-16 18:46:13.273993	2016-12-16 18:46:13.273993	\N	\N	\N	\N	\N	4169.0	0.0	150.0	4.0	\N	\N	\N	1	\N	\N	3
793	ERITROPOYETINA HUMANA RECOMBINANTE 2000UI VIAL	1	2016-12-16 18:46:13.278381	2016-12-16 18:46:13.278381	\N	\N	\N	\N	\N	5985.0	0.0	150.0	5.0	\N	\N	\N	1	\N	\N	3
794	ERTAPENEM (INVANZ) 1G VIAL - LAB. :MERCK SHARP Y	1	2016-12-16 18:46:13.282622	2016-12-16 18:46:13.282622	\N	\N	\N	\N	\N	125323.0	0.0	150.0	5.0	\N	\N	\N	1	\N	\N	3
795	ESCITALOPRAM (LEXAPRO) 10MG TABLETA - LAB. :	1	2016-12-16 18:46:13.286877	2016-12-16 18:46:13.286877	\N	\N	\N	\N	\N	1871.0	0.0	150.0	2.0	\N	\N	\N	1	\N	\N	3
796	ESOMEPRAZOL (NEXIUM) 40MG VIAL - LAB. :	1	2016-12-16 18:46:13.292462	2016-12-16 18:46:13.292462	\N	\N	\N	\N	\N	9114.0	0.0	150.0	2.0	\N	\N	\N	1	\N	\N	3
797	ESOMEPRAZOL 20MG TABLETA - LAB. :GENFAR SA	1	2016-12-16 18:46:13.297249	2016-12-16 18:46:13.297249	\N	\N	\N	\N	\N	89.0	0.0	150.0	11.0	\N	\N	\N	1	\N	\N	3
798	ESOMEPRAZOL 20MG TABLETA - LAB. :LABORATORIOS LA	1	2016-12-16 18:46:13.301434	2016-12-16 18:46:13.301434	\N	\N	\N	\N	\N	90.0	0.0	150.0	5.0	\N	\N	\N	1	\N	\N	3
799	ESPIRONOLACTONA 100MG TABLETA - LAB. :WINTHROP	1	2016-12-16 18:46:13.306899	2016-12-16 18:46:13.306899	\N	\N	\N	\N	\N	329.0	0.0	150.0	5.0	\N	\N	\N	1	\N	\N	3
800	ESPIRONOLACTONA 25MG TABLETA - LAB. :GENFAR SA	1	2016-12-16 18:46:13.311183	2016-12-16 18:46:13.311183	\N	\N	\N	\N	\N	56.0	0.0	150.0	24.0	\N	\N	\N	1	\N	\N	3
801	ETIL ESTERES DE ACIDOS GRASOS YODADOS LIPIODOL	1	2016-12-16 18:46:13.315883	2016-12-16 18:46:13.315883	\N	\N	\N	\N	\N	545131.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
802	EXOVAC 1/4 EMPAQUE INDIVIDUAL UNIDAD - LAB. :	1	2016-12-16 18:46:13.320299	2016-12-16 18:46:13.320299	\N	\N	\N	\N	\N	31040.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
803	EXTENSION ENDURANT ETLW1613C156EE EMPAQUE	1	2016-12-16 18:46:13.324568	2016-12-16 18:46:13.324568	\N	\N	\N	\N	\N	5500000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
804	EXTENSION PARA INYECTOR FLEXIBLE-CONECTOR	1	2016-12-16 18:46:13.329218	2016-12-16 18:46:13.329218	\N	\N	\N	\N	\N	44080.0	0.0	150.0	5.0	\N	\N	\N	1	\N	\N	3
805	EXTENSION UNIVERSAL 48-REF: SH1283 EMPAQUE	1	2016-12-16 18:46:13.333643	2016-12-16 18:46:13.333643	\N	\N	\N	\N	\N	3275.0	0.0	150.0	6.0	\N	\N	\N	1	\N	\N	3
806	FACTOR II DE COAGULACION (OCTAPLEX500 UI) 500UI	1	2016-12-16 18:46:13.338322	2016-12-16 18:46:13.338322	\N	\N	\N	\N	\N	1005586.0	0.0	150.0	7.0	\N	\N	\N	1	\N	\N	3
807	FENITOINA 250MG/5ML INYECTABLE BIOSANO	1	2016-12-16 18:46:13.342927	2016-12-16 18:46:13.342927	\N	\N	\N	\N	\N	1169.0	0.0	150.0	13.0	\N	\N	\N	1	\N	\N	3
808	FENITOINA 250MG/5ML INYECTABLE UNIDAD AMPOLLA -	1	2016-12-16 18:46:13.34734	2016-12-16 18:46:13.34734	\N	\N	\N	\N	\N	1636.0	0.0	150.0	12.0	\N	\N	\N	1	\N	\N	3
809	FENITOINA SUSPENSION (EPAMIN) 240 ML FRASCO - LAB.	1	2016-12-16 18:46:13.351538	2016-12-16 18:46:13.351538	\N	\N	\N	\N	\N	13726.0	0.0	150.0	2.0	\N	\N	\N	1	\N	\N	3
810	FENTANILO 0.5MG/10ML AMPOLLA - LAB. :JANSSEN	1	2016-12-16 18:46:13.356295	2016-12-16 18:46:13.356295	\N	\N	\N	\N	\N	2681.0	0.0	150.0	34.0	\N	\N	\N	1	\N	\N	3
811	FIBRACOL PLUS PEQUENO 10 X 11- REF: REF 2982	1	2016-12-16 18:46:13.360976	2016-12-16 18:46:13.360976	\N	\N	\N	\N	\N	50987.0	0.0	150.0	2.0	\N	\N	\N	1	\N	\N	3
812	FILTRO ANTIBACTERIAL SERVO 300 REF MCC 06079979	1	2016-12-16 18:46:13.365407	2016-12-16 18:46:13.365407	\N	\N	\N	\N	\N	16995.0	0.0	150.0	4.0	\N	\N	\N	1	\N	\N	3
813	FILTRO ARTERIAL ADULTO RECUBRIMIENTO AFX125 REF	1	2016-12-16 18:46:13.369962	2016-12-16 18:46:13.369962	\N	\N	\N	\N	\N	239250.0	0.0	150.0	3.0	\N	\N	\N	1	\N	\N	3
814	FILTROS PARA CIRCUITO DE VENTILACION Y/O	1	2016-12-16 18:46:13.374426	2016-12-16 18:46:13.374426	\N	\N	\N	\N	\N	9108.0	0.0	150.0	10.0	\N	\N	\N	1	\N	\N	3
815	FITOMENADIONA (VITAMINA K1) 10MG/1ML AMPOLLA -	1	2016-12-16 18:46:13.378682	2016-12-16 18:46:13.378682	\N	\N	\N	\N	\N	567.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
816	FLAVOXATO (BLADURIL) 200MG TABLETA - LAB. :	1	2016-12-16 18:46:13.383165	2016-12-16 18:46:13.383165	\N	\N	\N	\N	\N	2744.0	0.0	150.0	21.0	\N	\N	\N	1	\N	\N	3
817	FLEXON- REF259763 EMPAQUE INDIVIDUAL UNIDAD -	1	2016-12-16 18:46:13.387587	2016-12-16 18:46:13.387587	\N	\N	\N	\N	\N	19558.0	0.0	150.0	11.0	\N	\N	\N	1	\N	\N	3
818	FLUCONAZOL 200MG CAPSULA - LAB. :GENFAR SA	1	2016-12-16 18:46:13.392352	2016-12-16 18:46:13.392352	\N	\N	\N	\N	\N	488.0	0.0	150.0	8.0	\N	\N	\N	1	\N	\N	3
819	FLUCONAZOL (BATEN) 200MG AMPOLLA - LAB. :	1	2016-12-16 18:46:13.397175	2016-12-16 18:46:13.397175	\N	\N	\N	\N	\N	757.0	0.0	150.0	4.0	\N	\N	\N	1	\N	\N	3
820	FLUCONAZOL 200MG AMPOLLA - LAB. :LABORATORIOS	1	2016-12-16 18:46:13.401953	2016-12-16 18:46:13.401953	\N	\N	\N	\N	\N	16017.0	0.0	150.0	13.0	\N	\N	\N	1	\N	\N	3
821	FLUMAZENIL (LANEXAT ) 0.5MG/5 ML AMPOLLA - LAB. :	1	2016-12-16 18:46:13.406253	2016-12-16 18:46:13.406253	\N	\N	\N	\N	\N	65610.0	0.0	150.0	2.0	\N	\N	\N	1	\N	\N	3
822	FLUOXETINA 20MG CAPSULA - LAB. :GENFAR SA	1	2016-12-16 18:46:13.410359	2016-12-16 18:46:13.410359	\N	\N	\N	\N	\N	64.0	0.0	150.0	5.0	\N	\N	\N	1	\N	\N	3
823	FONDAPARINUX SODICO (ARIXTRA) 2.5MG JERINGA	1	2016-12-16 18:46:13.415087	2016-12-16 18:46:13.415087	\N	\N	\N	\N	\N	16643.0	0.0	150.0	3.0	\N	\N	\N	1	\N	\N	3
824	FONDAPARINUX SODICO (ARIXTRA) 7.5MG JERINGA	1	2016-12-16 18:46:13.419701	2016-12-16 18:46:13.419701	\N	\N	\N	\N	\N	52261.0	0.0	150.0	3.0	\N	\N	\N	1	\N	\N	3
825	FORMULA ENTERAL POLIMERICA ESP- EN INTOLERANCIA	1	2016-12-16 18:46:13.424223	2016-12-16 18:46:13.424223	\N	\N	\N	\N	\N	7423.0	0.0	150.0	12.0	\N	\N	\N	1	\N	\N	3
826	FORMULA ENTERAL POLIMERICA ESP. EN INTOLERANCIA	1	2016-12-16 18:46:13.428509	2016-12-16 18:46:13.428509	\N	\N	\N	\N	\N	50768.0	0.0	150.0	7.0	\N	\N	\N	1	\N	\N	3
827	FORMULA EQUILIBRADA MODERADA ALTA CALORIA	1	2016-12-16 18:46:13.433186	2016-12-16 18:46:13.433186	\N	\N	\N	\N	\N	34906.0	0.0	150.0	6.0	\N	\N	\N	1	\N	\N	3
828	FOSFATO DE POTASIO DIBASICO 10ML VIAL - LAB. :SAN	1	2016-12-16 18:46:13.437955	2016-12-16 18:46:13.437955	\N	\N	\N	\N	\N	4352.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
829	FOSFATO DE SODIO DIBASICO FOSFATO DE SODIO	1	2016-12-16 18:46:13.442265	2016-12-16 18:46:13.442265	\N	\N	\N	\N	\N	7750.0	0.0	150.0	4.0	\N	\N	\N	1	\N	\N	3
830	FOSFOMICINA (FOSTREN) 3G SOBRE - LAB. :NEVOX	1	2016-12-16 18:46:13.446771	2016-12-16 18:46:13.446771	\N	\N	\N	\N	\N	38374.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
831	FOSFOMICINA TROMETAMOL (MONURIL) 8G SOBRE - LAB.	1	2016-12-16 18:46:13.451497	2016-12-16 18:46:13.451497	\N	\N	\N	\N	\N	46164.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
832	FUNDA ANTIEMBOLICA COMPRESION COVIDEAN UN	1	2016-12-16 18:46:13.455596	2016-12-16 18:46:13.455596	\N	\N	\N	\N	\N	104400.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
833	FUROSEMIDA 20MG/2ML AMPOLLA - LAB. :	1	2016-12-16 18:46:13.460013	2016-12-16 18:46:13.460013	\N	\N	\N	\N	\N	237.0	0.0	150.0	20.0	\N	\N	\N	1	\N	\N	3
834	FUROSEMIDA 20MG/2ML AMPOLLA - LAB. :GENFAR SA	1	2016-12-16 18:46:13.464843	2016-12-16 18:46:13.464843	\N	\N	\N	\N	\N	231.0	0.0	150.0	53.0	\N	\N	\N	1	\N	\N	3
835	FUROSEMIDA 20MG/2ML AMPOLLA - LAB. :VITROFARMA	1	2016-12-16 18:46:13.469468	2016-12-16 18:46:13.469468	\N	\N	\N	\N	\N	275.0	0.0	150.0	36.0	\N	\N	\N	1	\N	\N	3
836	FUROSEMIDA 40MG TABLETA - LAB. :GENFAR SA	1	2016-12-16 18:46:13.473792	2016-12-16 18:46:13.473792	\N	\N	\N	\N	\N	14.0	0.0	150.0	18.0	\N	\N	\N	1	\N	\N	3
837	GANCICLOVIR (CYMEVENE) 500MG VIAL - LAB. :	1	2016-12-16 18:46:13.478299	2016-12-16 18:46:13.478299	\N	\N	\N	\N	\N	91962.0	0.0	150.0	3.0	\N	\N	\N	1	\N	\N	3
838	GELOFUSINE ISO 4% SOLUCION PARA INFUSION 500ML	1	2016-12-16 18:46:13.48275	2016-12-16 18:46:13.48275	\N	\N	\N	\N	\N	21960.0	0.0	150.0	6.0	\N	\N	\N	1	\N	\N	3
839	GEMSTAR PAV SPLIT SET- REF: H13261 EMPAQUE	1	2016-12-16 18:46:13.487522	2016-12-16 18:46:13.487522	\N	\N	\N	\N	\N	35677.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
840	GENERADOR ADVISA DR MRI SURESCAN A3DR01 MD	1	2016-12-16 18:46:13.492209	2016-12-16 18:46:13.492209	\N	\N	\N	\N	\N	4588100.0	0.0	150.0	2.0	\N	\N	\N	1	\N	\N	3
841	GENTAMICINA 80MG AMPOLLA - LAB. :GENFAR SA	1	2016-12-16 18:46:13.496464	2016-12-16 18:46:13.496464	\N	\N	\N	\N	\N	171.0	0.0	150.0	8.0	\N	\N	\N	1	\N	\N	3
842	GENTAMICINA SULFATO 0.3% 10 ML GOTAS - LAB. :	1	2016-12-16 18:46:13.500686	2016-12-16 18:46:13.500686	\N	\N	\N	\N	\N	2421.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
843	GLIBENCLAMIDA 5MG TABLETA - LAB. :TECNOQUIMICAS	1	2016-12-16 18:46:13.505313	2016-12-16 18:46:13.505313	\N	\N	\N	\N	\N	32.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
844	GLUBRAN VIAL X 1 ML REF G-NB-2-WORLD MEDICAL S.A.	1	2016-12-16 18:46:13.509866	2016-12-16 18:46:13.509866	\N	\N	\N	\N	\N	375000.0	0.0	150.0	2.0	\N	\N	\N	1	\N	\N	3
845	GLUCONATO DE CALCIO 10ML AMPOULEPACK - LAB. :	1	2016-12-16 18:46:13.51433	2016-12-16 18:46:13.51433	\N	\N	\N	\N	\N	412.0	0.0	150.0	13.0	\N	\N	\N	1	\N	\N	3
846	GLUCONATO DE POTASIO (ION-K) 180ML FRASCO - LAB.	1	2016-12-16 18:46:13.518619	2016-12-16 18:46:13.518619	\N	\N	\N	\N	\N	6563.0	0.0	150.0	3.0	\N	\N	\N	1	\N	\N	3
847	GUANTES ESTERILES 7.5 EMPAQUE INDIVIDUAL UNIDAD -	1	2016-12-16 18:46:13.523161	2016-12-16 18:46:13.523161	\N	\N	\N	\N	\N	957.0	0.0	150.0	47.0	\N	\N	\N	1	\N	\N	3
906	INHALOCAMARA ADULTO AEROPLUS EMPAQUE	1	2016-12-16 18:46:13.781882	2016-12-16 18:46:13.781882	\N	\N	\N	\N	\N	7750.0	0.0	150.0	3.0	\N	\N	\N	1	\N	\N	3
848	GUANTES ESTERILES No 7 EMPAQUE INDIVIDUAL UNIDAD	1	2016-12-16 18:46:13.527587	2016-12-16 18:46:13.527587	\N	\N	\N	\N	\N	941.0	0.0	150.0	34.0	\N	\N	\N	1	\N	\N	3
849	GUANTES PARA CIRUGIA NO. 6.5 EMPAQUE INDIVIDUAL	1	2016-12-16 18:46:13.532346	2016-12-16 18:46:13.532346	\N	\N	\N	\N	\N	957.0	0.0	150.0	6.0	\N	\N	\N	1	\N	\N	3
850	GUANTES PARA CIRUGIA NO. 8.0 EMPAQUE INDIVIDUAL	1	2016-12-16 18:46:13.536926	2016-12-16 18:46:13.536926	\N	\N	\N	\N	\N	1001.0	0.0	150.0	16.0	\N	\N	\N	1	\N	\N	3
851	GUANTES PARA CIRUGIA NO. 8.5 EMPAQUE INDIVIDUAL	1	2016-12-16 18:46:13.541368	2016-12-16 18:46:13.541368	\N	\N	\N	\N	\N	676.0	0.0	150.0	3.0	\N	\N	\N	1	\N	\N	3
852	GUANTES QUIRURGICOS ESTERILES 6.5 EMPAQUE	1	2016-12-16 18:46:13.545694	2016-12-16 18:46:13.545694	\N	\N	\N	\N	\N	877.0	0.0	150.0	35.0	\N	\N	\N	1	\N	\N	3
853	GUANTES QUIRURGICOS ESTERILES 7.0 EMPAQUE	1	2016-12-16 18:46:13.549937	2016-12-16 18:46:13.549937	\N	\N	\N	\N	\N	792.0	0.0	150.0	78.0	\N	\N	\N	1	\N	\N	3
854	GUANTES QUIRURGICOS ESTERILES 7.5 EMPAQUE	1	2016-12-16 18:46:13.554214	2016-12-16 18:46:13.554214	\N	\N	\N	\N	\N	953.0	0.0	150.0	24.0	\N	\N	\N	1	\N	\N	3
855	GUANTES QUIRURGICOS ESTERILES 8.0 EMPAQUE	1	2016-12-16 18:46:13.558539	2016-12-16 18:46:13.558539	\N	\N	\N	\N	\N	770.0	0.0	150.0	12.0	\N	\N	\N	1	\N	\N	3
856	GUIA 0.35 X 260CM 831404 -COLMEDIKS S.A.S.	1	2016-12-16 18:46:13.56318	2016-12-16 18:46:13.56318	\N	\N	\N	\N	\N	145000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
857	GUIA AMPLATZ 035X260 46-509 EMPAQUE	1	2016-12-16 18:46:13.56788	2016-12-16 18:46:13.56788	\N	\N	\N	\N	\N	190240.0	0.0	150.0	2.0	\N	\N	\N	1	\N	\N	3
858	GUIA AMPLATZER 0.35MM X 260CM 9GW002 EMPAQUE	1	2016-12-16 18:46:13.572188	2016-12-16 18:46:13.572188	\N	\N	\N	\N	\N	127000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
859	GUIA AQUA TRACK HIDROPHILIC NITINOL GUIDEWIRE - 3	1	2016-12-16 18:46:13.576417	2016-12-16 18:46:13.576417	\N	\N	\N	\N	\N	161034.0	0.0	150.0	2.0	\N	\N	\N	1	\N	\N	3
860	GUIA ASAHI NEOS RINATO FLOPPY 0,14 X 175CM	1	2016-12-16 18:46:13.580567	2016-12-16 18:46:13.580567	\N	\N	\N	\N	\N	226200.0	0.0	150.0	2.0	\N	\N	\N	1	\N	\N	3
861	GUIA ASAHI SION BLUE J 0,14 X 180CM AHW14R004J WM	1	2016-12-16 18:46:13.584752	2016-12-16 18:46:13.584752	\N	\N	\N	\N	\N	284200.0	0.0	150.0	5.0	\N	\N	\N	1	\N	\N	3
862	GUIA ATW ALL TRACK WIRE - 0.014 3CM 195CM- REF:	1	2016-12-16 18:46:13.589406	2016-12-16 18:46:13.589406	\N	\N	\N	\N	\N	325853.0	0.0	150.0	5.0	\N	\N	\N	1	\N	\N	3
863	GUIA COUGAR XT 0.014 190CM J-TIP MED UN UNIDAD -	1	2016-12-16 18:46:13.593497	2016-12-16 18:46:13.593497	\N	\N	\N	\N	\N	255200.0	0.0	150.0	5.0	\N	\N	\N	1	\N	\N	3
864	GUIA ESMERALD GUIDEWIRES EN J - 3MM - 260CM -	1	2016-12-16 18:46:13.597486	2016-12-16 18:46:13.597486	\N	\N	\N	\N	\N	50341.0	0.0	150.0	3.0	\N	\N	\N	1	\N	\N	3
865	GUIA ESMERALD GUIDEWIRES RECTA - 260CM - 0.35-	1	2016-12-16 18:46:13.601859	2016-12-16 18:46:13.601859	\N	\N	\N	\N	\N	56723.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
866	GUIA GLIDEWIRE GT - 0.016 180CM- REF :	1	2016-12-16 18:46:13.606403	2016-12-16 18:46:13.606403	\N	\N	\N	\N	\N	589203.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
867	GUIA GLIDEWIRE GT - 0.018 180CM- REF :	1	2016-12-16 18:46:13.610449	2016-12-16 18:46:13.610449	\N	\N	\N	\N	\N	589203.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
868	GUIA GOLD- RADIFOCUS - 0.016 180CM- REF :	1	2016-12-16 18:46:13.614486	2016-12-16 18:46:13.614486	\N	\N	\N	\N	\N	227360.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
869	GUIA HIDROFILICA 025X150CM GA25153M-GEMEDCO S.	1	2016-12-16 18:46:13.618928	2016-12-16 18:46:13.618928	\N	\N	\N	\N	\N	162524.0	0.0	150.0	11.0	\N	\N	\N	1	\N	\N	3
870	GUIA HIDROFILICA AQUATRACK 0.35 X180CM stiff ref	1	2016-12-16 18:46:13.624094	2016-12-16 18:46:13.624094	\N	\N	\N	\N	\N	167207.0	0.0	150.0	2.0	\N	\N	\N	1	\N	\N	3
871	GUIA HIDROFILICA AQUATRACK 0 35X180CM C3518 RSA	1	2016-12-16 18:46:13.628326	2016-12-16 18:46:13.628326	\N	\N	\N	\N	\N	165648.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
872	GUIA HIDROFILICA AQUATRACK STIIF 0 35X260CM	1	2016-12-16 18:46:13.632461	2016-12-16 18:46:13.632461	\N	\N	\N	\N	\N	165648.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
873	GUIA HIDROFILICA RADIOFOCUS STIFF 035X260CM	1	2016-12-16 18:46:13.636745	2016-12-16 18:46:13.636745	\N	\N	\N	\N	\N	208800.0	0.0	150.0	2.0	\N	\N	\N	1	\N	\N	3
874	GUIA INTUITION 0,014 180CM STRAIGHT MED UNIDAD	1	2016-12-16 18:46:13.641168	2016-12-16 18:46:13.641168	\N	\N	\N	\N	\N	234080.0	0.0	150.0	2.0	\N	\N	\N	1	\N	\N	3
875	GUIA PTCA CHOICE EXTRA SUPOORT 0.14 X 182 CM	1	2016-12-16 18:46:13.645622	2016-12-16 18:46:13.645622	\N	\N	\N	\N	\N	327584.0	0.0	150.0	2.0	\N	\N	\N	1	\N	\N	3
876	GUIA PTCA CHOICE EXTRA SUPOORT 0.14 X 300 CM	1	2016-12-16 18:46:13.650352	2016-12-16 18:46:13.650352	\N	\N	\N	\N	\N	327584.0	0.0	150.0	2.0	\N	\N	\N	1	\N	\N	3
877	GUIA PTCA CHOICE INTERMEDIA 0.14 X 300 CM 12117	1	2016-12-16 18:46:13.654544	2016-12-16 18:46:13.654544	\N	\N	\N	\N	\N	327584.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
878	GUIA SUPER STIFF035X260CM EN J-REF:	1	2016-12-16 18:46:13.658651	2016-12-16 18:46:13.658651	\N	\N	\N	\N	\N	250560.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
879	GUIA SYNCHRO STANDARD - 0.014 200CM - REF :2641 -	1	2016-12-16 18:46:13.662882	2016-12-16 18:46:13.662882	\N	\N	\N	\N	\N	1160000.0	0.0	150.0	3.0	\N	\N	\N	1	\N	\N	3
880	GUIA TEFLON 0.035 X 150 CM J 502521 JYJ EMPAQUE	1	2016-12-16 18:46:13.667177	2016-12-16 18:46:13.667177	\N	\N	\N	\N	\N	57177.0	0.0	150.0	15.0	\N	\N	\N	1	\N	\N	3
881	GUIA TEFLON 0.035 X 150 CM RECTA 502542 JYJ	1	2016-12-16 18:46:13.67177	2016-12-16 18:46:13.67177	\N	\N	\N	\N	\N	56723.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
882	GUIA TRAXCESS 14 EX - 0.014 200CM- REF :	1	2016-12-16 18:46:13.67644	2016-12-16 18:46:13.67644	\N	\N	\N	\N	\N	812000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
883	HALOPERIDOL 20ML FRASCO - LAB. :HUMAX	1	2016-12-16 18:46:13.680899	2016-12-16 18:46:13.680899	\N	\N	\N	\N	\N	1442.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
884	HALOPERIDOL (HALOPIDOL) 2 MG/ML GOTAS - LAB. :	1	2016-12-16 18:46:13.685172	2016-12-16 18:46:13.685172	\N	\N	\N	\N	\N	1714.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
885	HALOPERIDOL (HALOPIDOL) 5MG AMPOLLA - LAB. :	1	2016-12-16 18:46:13.689466	2016-12-16 18:46:13.689466	\N	\N	\N	\N	\N	12105.0	0.0	150.0	6.0	\N	\N	\N	1	\N	\N	3
886	HEMOCONCENTRADORES ADULTO /PEDIATRICO REF:	1	2016-12-16 18:46:13.693667	2016-12-16 18:46:13.693667	\N	\N	\N	\N	\N	330600.0	0.0	150.0	2.0	\N	\N	\N	1	\N	\N	3
887	HEMOFILTRO ADULTO RF DHF02 D570 5009 DRILLTEX S.	1	2016-12-16 18:46:13.698296	2016-12-16 18:46:13.698296	\N	\N	\N	\N	\N	356569.0	0.0	150.0	5.0	\N	\N	\N	1	\N	\N	3
888	HEMOSOL ACIDO PARA HEMODIALISIS 3.5LT 3.43LT	1	2016-12-16 18:46:13.702424	2016-12-16 18:46:13.702424	\N	\N	\N	\N	\N	22334.0	0.0	150.0	5.0	\N	\N	\N	1	\N	\N	3
889	HEMOSOL ACIDO FORMULA COBE REF BRM6506G 3.78 L	1	2016-12-16 18:46:13.706697	2016-12-16 18:46:13.706697	\N	\N	\N	\N	\N	17899.0	0.0	150.0	5.0	\N	\N	\N	1	\N	\N	3
890	HEMOSOL BICARBONATO FORMULA COBE REF BRM7710B	1	2016-12-16 18:46:13.711007	2016-12-16 18:46:13.711007	\N	\N	\N	\N	\N	16868.0	0.0	150.0	7.0	\N	\N	\N	1	\N	\N	3
891	HEMOSOL CONCENTRADO LIQUIDO DE BICARBONATO	1	2016-12-16 18:46:13.715411	2016-12-16 18:46:13.715411	\N	\N	\N	\N	\N	15269.0	0.0	150.0	10.0	\N	\N	\N	1	\N	\N	3
892	HEMOSTATICO ABDSORBIBLE SURGICEL 4X8 - REF: 1952	1	2016-12-16 18:46:13.719765	2016-12-16 18:46:13.719765	\N	\N	\N	\N	\N	94964.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
893	HEMOSTATICO ABSORBIBLE DE CELULOSA 10X20CM	1	2016-12-16 18:46:13.724174	2016-12-16 18:46:13.724174	\N	\N	\N	\N	\N	71400.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
894	HEPARINA SODICA CENTIMETROS CUBICOS - LAB. :	1	2016-12-16 18:46:13.728591	2016-12-16 18:46:13.728591	\N	\N	\N	\N	\N	1397.0	0.0	150.0	78.0	\N	\N	\N	1	\N	\N	3
895	HIDROCLOROTIAZIDA 25MG TABLETA - LAB. :GENFAR SA	1	2016-12-16 18:46:13.732628	2016-12-16 18:46:13.732628	\N	\N	\N	\N	\N	7.0	0.0	150.0	9.0	\N	\N	\N	1	\N	\N	3
896	HIDROCORTISONA 100MG VIAL - LAB. :VITALIS S.A. C.I.	1	2016-12-16 18:46:13.737382	2016-12-16 18:46:13.737382	\N	\N	\N	\N	\N	1165.0	0.0	150.0	6.0	\N	\N	\N	1	\N	\N	3
897	HIDROMORFONA 2MG/ML AMPOLLA - LAB. :	1	2016-12-16 18:46:13.742109	2016-12-16 18:46:13.742109	\N	\N	\N	\N	\N	1503.0	0.0	150.0	4.0	\N	\N	\N	1	\N	\N	3
898	HIDROXICINA CLORHIDRATO (HIDERAX) 100MG AMPOLLA	1	2016-12-16 18:46:13.74751	2016-12-16 18:46:13.74751	\N	\N	\N	\N	\N	12876.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
899	HIERRO SACARATO (VENOFER) 100MG AMPOLLA - LAB. :	1	2016-12-16 18:46:13.751487	2016-12-16 18:46:13.751487	\N	\N	\N	\N	\N	20150.0	0.0	150.0	3.0	\N	\N	\N	1	\N	\N	3
900	HOJAS DE BISTURI. SURGI-MED- No 10 EMPAQUE	1	2016-12-16 18:46:13.755541	2016-12-16 18:46:13.755541	\N	\N	\N	\N	\N	159.0	0.0	150.0	6.0	\N	\N	\N	1	\N	\N	3
901	HOJAS DE BISTURI. SURGI-MED- No 11 EMPAQUE	1	2016-12-16 18:46:13.759822	2016-12-16 18:46:13.759822	\N	\N	\N	\N	\N	204.0	0.0	150.0	26.0	\N	\N	\N	1	\N	\N	3
902	HOJAS DE BISTURI. SURGI-MED- No 15 EMPAQUE	1	2016-12-16 18:46:13.764212	2016-12-16 18:46:13.764212	\N	\N	\N	\N	\N	162.0	0.0	150.0	12.0	\N	\N	\N	1	\N	\N	3
903	HOJAS DE BISTURI. SURGI-MED- No 20 EMPAQUE	1	2016-12-16 18:46:13.768771	2016-12-16 18:46:13.768771	\N	\N	\N	\N	\N	144.0	0.0	150.0	10.0	\N	\N	\N	1	\N	\N	3
904	HUMIDIFICADORES REF 63-521 EMPAQUE INDIVIDUAL	1	2016-12-16 18:46:13.773129	2016-12-16 18:46:13.773129	\N	\N	\N	\N	\N	5782.0	0.0	150.0	2.0	\N	\N	\N	1	\N	\N	3
905	IMIPRAMINA 25MG TABLETA - LAB. :TECNOQUIMICAS S.	1	2016-12-16 18:46:13.777574	2016-12-16 18:46:13.777574	\N	\N	\N	\N	\N	802.0	0.0	150.0	6.0	\N	\N	\N	1	\N	\N	3
907	INJERTO ANILLADO GORETEX 6 X 60MMX8 REF F606080	1	2016-12-16 18:46:13.786497	2016-12-16 18:46:13.786497	\N	\N	\N	\N	\N	5344800.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
908	INJERTO RECTO 28MM X 30CM DACRON WOVEN SILVER	1	2016-12-16 18:46:13.791004	2016-12-16 18:46:13.791004	\N	\N	\N	\N	\N	1228000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
909	INMUNOGLOBULINA DE CONEJO ANTITIMOCITOS	1	2016-12-16 18:46:13.795736	2016-12-16 18:46:13.795736	\N	\N	\N	\N	\N	434315.0	0.0	150.0	167.0	\N	\N	\N	1	\N	\N	3
910	INMUNOGLOBULINA G HUMANA NORMAL	1	2016-12-16 18:46:13.799948	2016-12-16 18:46:13.799948	\N	\N	\N	\N	\N	860568.0	0.0	150.0	20.0	\N	\N	\N	1	\N	\N	3
911	INSPIROMETRO INCENTIVO EMPAQUE INDIVIDUAL	1	2016-12-16 18:46:13.804053	2016-12-16 18:46:13.804053	\N	\N	\N	\N	\N	14925.0	0.0	150.0	5.0	\N	\N	\N	1	\N	\N	3
912	INSPIROMETRO INCENTIVO RESPIRATORIO REF:1901A	1	2016-12-16 18:46:13.808359	2016-12-16 18:46:13.808359	\N	\N	\N	\N	\N	14661.0	0.0	150.0	3.0	\N	\N	\N	1	\N	\N	3
913	INSUFLADOR ALTA PRESION-REF:04527 01 BSC EMPAQUE	1	2016-12-16 18:46:13.812993	2016-12-16 18:46:13.812993	\N	\N	\N	\N	\N	337792.0	0.0	150.0	10.0	\N	\N	\N	1	\N	\N	3
914	INSUFLADOR BASIX COMPAK IN4330 EMPAQUE	1	2016-12-16 18:46:13.817481	2016-12-16 18:46:13.817481	\N	\N	\N	\N	\N	208800.0	0.0	150.0	2.0	\N	\N	\N	1	\N	\N	3
915	INSULINA DETEMIR (LEVEMIR) 300UI CARTUCHO - LAB. :	1	2016-12-16 18:46:13.821907	2016-12-16 18:46:13.821907	\N	\N	\N	\N	\N	26244.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
916	INSULINA GLARGINA (LANTUS) 100UI/mL (10mL) VIAL -	1	2016-12-16 18:46:13.826448	2016-12-16 18:46:13.826448	\N	\N	\N	\N	\N	80198.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
917	INSULINA GLARGINA (LANTUS) LAPICERO 100UI/mL (3mL)	1	2016-12-16 18:46:13.830888	2016-12-16 18:46:13.830888	\N	\N	\N	\N	\N	25075.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
918	INSULINA GLULISINA (APIDRA) 1000UI VIAL - LAB. :	1	2016-12-16 18:46:13.835312	2016-12-16 18:46:13.835312	\N	\N	\N	\N	\N	47992.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
919	INSULINA HUMANA NOVOLIN- NPH (N) 1000UI VIAL -	1	2016-12-16 18:46:13.839781	2016-12-16 18:46:13.839781	\N	\N	\N	\N	\N	7629.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
920	INSULINA HUMANA NOVOLIN-REGULAR(R) 1000UI VIAL -	1	2016-12-16 18:46:13.844046	2016-12-16 18:46:13.844046	\N	\N	\N	\N	\N	7434.0	0.0	150.0	2.0	\N	\N	\N	1	\N	\N	3
921	INSULINA LISPRO (HUMALOG) 1000UI VIAL - LAB. :ELI	1	2016-12-16 18:46:13.84863	2016-12-16 18:46:13.84863	\N	\N	\N	\N	\N	49573.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
922	INSYTE AUTOGUARD CATETER DE VIALON NO. 20 GA. X	1	2016-12-16 18:46:13.853199	2016-12-16 18:46:13.853199	\N	\N	\N	\N	\N	2324.0	0.0	150.0	25.0	\N	\N	\N	1	\N	\N	3
923	INSYTE AUTOGUARD NO. 18 X 1 1-4-BD381844	1	2016-12-16 18:46:13.857807	2016-12-16 18:46:13.857807	\N	\N	\N	\N	\N	2359.0	0.0	150.0	11.0	\N	\N	\N	1	\N	\N	3
924	INSYTE AUTOGUARD NO. 22 X 1-BD381823 EMPAQUE	1	2016-12-16 18:46:13.862063	2016-12-16 18:46:13.862063	\N	\N	\N	\N	\N	2142.0	0.0	150.0	4.0	\N	\N	\N	1	\N	\N	3
925	INSYTE CATETER DE VIALON NO. 14 GA. X 1.75 (14GA. X	1	2016-12-16 18:46:13.866601	2016-12-16 18:46:13.866601	\N	\N	\N	\N	\N	2938.0	0.0	150.0	3.0	\N	\N	\N	1	\N	\N	3
926	INSYTE CATETER DE VIALON NO. 16 GA. X 1.16 (16GA. X	1	2016-12-16 18:46:13.871329	2016-12-16 18:46:13.871329	\N	\N	\N	\N	\N	2655.0	0.0	150.0	3.0	\N	\N	\N	1	\N	\N	3
927	INSYTE CATETER DE VIALON NO. 18 GA. X 1.16-	1	2016-12-16 18:46:13.87619	2016-12-16 18:46:13.87619	\N	\N	\N	\N	\N	2942.0	0.0	150.0	15.0	\N	\N	\N	1	\N	\N	3
928	INSYTE CATETER DE VIALON NO. 20 GA. X 1.16 (20GA. X	1	2016-12-16 18:46:13.880883	2016-12-16 18:46:13.880883	\N	\N	\N	\N	\N	2375.0	0.0	150.0	11.0	\N	\N	\N	1	\N	\N	3
929	INSYTE CATETER DE VIALON NO. 22 GA. X 1.00 (22GA. X	1	2016-12-16 18:46:13.885967	2016-12-16 18:46:13.885967	\N	\N	\N	\N	\N	1901.0	0.0	150.0	5.0	\N	\N	\N	1	\N	\N	3
930	INTRODUCTOR AVANTI 5 FR. X 11CM 0.38(0.97MM)-	1	2016-12-16 18:46:13.891694	2016-12-16 18:46:13.891694	\N	\N	\N	\N	\N	41616.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
931	INTRODUCTOR 4 FR X 7CM PSI4F7018 WM EMPAQUE	1	2016-12-16 18:46:13.896956	2016-12-16 18:46:13.896956	\N	\N	\N	\N	\N	80000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
932	INTRODUCTOR 5 FR X 7CM PSI5F7018 WM EMPAQUE	1	2016-12-16 18:46:13.902921	2016-12-16 18:46:13.902921	\N	\N	\N	\N	\N	77037.0	0.0	150.0	4.0	\N	\N	\N	1	\N	\N	3
933	INTRODUCTOR 5 FR X 7CM PSI5F7018 -WORLD MEDICAL	1	2016-12-16 18:46:13.906942	2016-12-16 18:46:13.906942	\N	\N	\N	\N	\N	80000.0	0.0	150.0	11.0	\N	\N	\N	1	\N	\N	3
934	INTRODUCTOR 5 FR. X 11CM 504605X JYJ EMPAQUE	1	2016-12-16 18:46:13.911169	2016-12-16 18:46:13.911169	\N	\N	\N	\N	\N	41616.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
935	INTRODUCTOR 6 FR. X 11CM 504606X JYJ EMPAQUE	1	2016-12-16 18:46:13.915971	2016-12-16 18:46:13.915971	\N	\N	\N	\N	\N	39634.0	0.0	150.0	2.0	\N	\N	\N	1	\N	\N	3
936	INTRODUCTOR 6 FR. X 11CM PSI6F11038 WM EMPAQUE	1	2016-12-16 18:46:13.920639	2016-12-16 18:46:13.920639	\N	\N	\N	\N	\N	43000.0	0.0	150.0	2.0	\N	\N	\N	1	\N	\N	3
937	INTRODUCTOR 6 FR. X 45 CM 401645M JYJ EMPAQUE	1	2016-12-16 18:46:13.924852	2016-12-16 18:46:13.924852	\N	\N	\N	\N	\N	48379.0	0.0	150.0	2.0	\N	\N	\N	1	\N	\N	3
938	INTRODUCTOR 6 FR. X 90 CM 401690M JYJ EMPAQUE	1	2016-12-16 18:46:13.928956	2016-12-16 18:46:13.928956	\N	\N	\N	\N	\N	64070.0	0.0	150.0	4.0	\N	\N	\N	1	\N	\N	3
939	INTRODUCTOR 6207-S5 MED EMPAQUE INDIVIDUAL	1	2016-12-16 18:46:13.933723	2016-12-16 18:46:13.933723	\N	\N	\N	\N	\N	106700.0	0.0	150.0	2.0	\N	\N	\N	1	\N	\N	3
940	INTRODUCTOR 7 FR. X 11CM 504607X JYJ EMPAQUE	1	2016-12-16 18:46:13.938696	2016-12-16 18:46:13.938696	\N	\N	\N	\N	\N	38533.0	0.0	150.0	7.0	\N	\N	\N	1	\N	\N	3
941	INTRODUCTOR 7 FR. X 45 CM 401745M JYJ EMPAQUE	1	2016-12-16 18:46:13.943432	2016-12-16 18:46:13.943432	\N	\N	\N	\N	\N	64505.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
942	INTRODUCTOR 8 FR. X 11CM 504 608X JYJ EMPAQUE	1	2016-12-16 18:46:13.948001	2016-12-16 18:46:13.948001	\N	\N	\N	\N	\N	41893.0	0.0	150.0	2.0	\N	\N	\N	1	\N	\N	3
943	INTRODUCTOR 9 FR. X 11CM 504 609X JYJ EMPAQUE	1	2016-12-16 18:46:13.953545	2016-12-16 18:46:13.953545	\N	\N	\N	\N	\N	41616.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
944	INTRODUCTOR ARTERIAL 6FR.X 11CM PS16F 11038 -	1	2016-12-16 18:46:13.957772	2016-12-16 18:46:13.957772	\N	\N	\N	\N	\N	43000.0	0.0	150.0	2.0	\N	\N	\N	1	\N	\N	3
945	INTRODUCTOR ARTERIAL 5F X 11CM PSI-5F-11-038	1	2016-12-16 18:46:13.961941	2016-12-16 18:46:13.961941	\N	\N	\N	\N	\N	43000.0	0.0	150.0	2.0	\N	\N	\N	1	\N	\N	3
946	INTRODUCTOR ARTERIAL 7FR X 11CM PSI7F11038 -	1	2016-12-16 18:46:13.9668	2016-12-16 18:46:13.9668	\N	\N	\N	\N	\N	43000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
947	INTRODUCTOR AVANTI 8F - 11CM 0.38(0.97MM)- REF:	1	2016-12-16 18:46:13.971792	2016-12-16 18:46:13.971792	\N	\N	\N	\N	\N	41616.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
948	INTRODUCTOR KCFW-7.0-35-55-RB-HFANL1-HC REF:	1	2016-12-16 18:46:13.976346	2016-12-16 18:46:13.976346	\N	\N	\N	\N	\N	431111.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
949	INTRODUCTOR MULLINS 12FR C-DS-A-12F COLM	1	2016-12-16 18:46:13.980834	2016-12-16 18:46:13.980834	\N	\N	\N	\N	\N	700000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
950	INTRODUCTOR MULLINS RCFW-12.0-38-75-RB-MTS REF:	1	2016-12-16 18:46:13.985406	2016-12-16 18:46:13.985406	\N	\N	\N	\N	\N	852800.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
951	INTRODUCTOR PERCUTANEO- CON VALVULA	1	2016-12-16 18:46:13.990023	2016-12-16 18:46:13.990023	\N	\N	\N	\N	\N	110800.0	0.0	150.0	4.0	\N	\N	\N	1	\N	\N	3
952	INTRODUCTOR RADIAL 6F PSI-6F-7-018 EMPAQUE	1	2016-12-16 18:46:13.994754	2016-12-16 18:46:13.994754	\N	\N	\N	\N	\N	80000.0	0.0	150.0	3.0	\N	\N	\N	1	\N	\N	3
953	INTRODUCTOR TERMODILUCION 8.5FR 10 5CM REF	1	2016-12-16 18:46:13.9993	2016-12-16 18:46:13.9993	\N	\N	\N	\N	\N	110800.0	0.0	150.0	6.0	\N	\N	\N	1	\N	\N	3
954	IOBAN 2 ANTIMICROBIAL INCISE DRAPES (CAMPOS DE	1	2016-12-16 18:46:14.003704	2016-12-16 18:46:14.003704	\N	\N	\N	\N	\N	102683.0	0.0	150.0	7.0	\N	\N	\N	1	\N	\N	3
955	IOHEXOL (OMNIPAQUE) 100ML VIAL - LAB. :GENERAL	1	2016-12-16 18:46:14.007919	2016-12-16 18:46:14.007919	\N	\N	\N	\N	\N	78845.0	0.0	150.0	39.0	\N	\N	\N	1	\N	\N	3
956	IOVERSOL (OPTIRAY-320) 50ML JERINGA PRELLENA -	1	2016-12-16 18:46:14.012018	2016-12-16 18:46:14.012018	\N	\N	\N	\N	\N	51521.0	0.0	150.0	22.0	\N	\N	\N	1	\N	\N	3
957	IPRATROPIO BROMURO (IPRAMAR) 20MCG ENVASE DE	1	2016-12-16 18:46:14.016588	2016-12-16 18:46:14.016588	\N	\N	\N	\N	\N	5439.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
958	ISOFLURANO USP 99.9% FRASCO - LAB. :LABORATORIOS	1	2016-12-16 18:46:14.020789	2016-12-16 18:46:14.020789	\N	\N	\N	\N	\N	791.0	0.0	150.0	264.0	\N	\N	\N	1	\N	\N	3
959	ISOSORBIDE DINITRATO (ISOCORD) 10MG TABLETA - LAB.	1	2016-12-16 18:46:14.025031	2016-12-16 18:46:14.025031	\N	\N	\N	\N	\N	115.0	0.0	150.0	27.0	\N	\N	\N	1	\N	\N	3
960	ISOSORBIDE DINITRATO (ISOCORD) 5MG TABLETA - LAB. :	1	2016-12-16 18:46:14.030004	2016-12-16 18:46:14.030004	\N	\N	\N	\N	\N	258.0	0.0	150.0	3.0	\N	\N	\N	1	\N	\N	3
961	IVABRADINA (PROCORALAN) 5MG TABLETA - LAB. :	1	2016-12-16 18:46:14.034583	2016-12-16 18:46:14.034583	\N	\N	\N	\N	\N	1057.0	0.0	150.0	3.0	\N	\N	\N	1	\N	\N	3
962	JELCO CATHETER IV 16G 50MM-4032-INT EMPAQUE	1	2016-12-16 18:46:14.039229	2016-12-16 18:46:14.039229	\N	\N	\N	\N	\N	1001.0	0.0	150.0	2.0	\N	\N	\N	1	\N	\N	3
963	JERINGA 1 C.C MEDALLION AZUL MSS011 LB -WORLD	1	2016-12-16 18:46:14.050586	2016-12-16 18:46:14.050586	\N	\N	\N	\N	\N	8400.0	0.0	150.0	12.0	\N	\N	\N	1	\N	\N	3
964	JERINGA 1 C.C MEDALLION BLANCA MSS011 WM	1	2016-12-16 18:46:14.055011	2016-12-16 18:46:14.055011	\N	\N	\N	\N	\N	9744.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
965	JERINGA 1 C.C MEDALLION BLANCA MSS011 -WORLD	1	2016-12-16 18:46:14.059418	2016-12-16 18:46:14.059418	\N	\N	\N	\N	\N	9744.0	0.0	150.0	3.0	\N	\N	\N	1	\N	\N	3
966	JERINGA 3MLAGUJA 23Gx1 PRECISION CARE-ETERNA S.A.	1	2016-12-16 18:46:14.063831	2016-12-16 18:46:14.063831	\N	\N	\N	\N	\N	138.0	0.0	150.0	16.0	\N	\N	\N	1	\N	\N	3
967	JERINGA DESECHABLE 20ML BD SIN AGUJA ROSCA	1	2016-12-16 18:46:14.068301	2016-12-16 18:46:14.068301	\N	\N	\N	\N	\N	1140.0	0.0	150.0	15.0	\N	\N	\N	1	\N	\N	3
968	JERINGA DESECHABLE 60ML PUNTA/CATETER REF	1	2016-12-16 18:46:14.072889	2016-12-16 18:46:14.072889	\N	\N	\N	\N	\N	2140.0	0.0	150.0	2.0	\N	\N	\N	1	\N	\N	3
969	JERINGA ESTERIL X1ML(TUBERCULINA) REF 302579	1	2016-12-16 18:46:14.077308	2016-12-16 18:46:14.077308	\N	\N	\N	\N	\N	275.0	0.0	150.0	38.0	\N	\N	\N	1	\N	\N	3
970	JERINGA INSULINA B.D 1ML 30X1/2 REF 326709	1	2016-12-16 18:46:14.081983	2016-12-16 18:46:14.081983	\N	\N	\N	\N	\N	386.0	0.0	150.0	47.0	\N	\N	\N	1	\N	\N	3
971	JERINGA PLASTICA ESTERIL X10ML CON AGUJA	1	2016-12-16 18:46:14.087815	2016-12-16 18:46:14.087815	\N	\N	\N	\N	\N	403.0	0.0	150.0	124.0	\N	\N	\N	1	\N	\N	3
972	JERINGA PLASTICA ESTERIL X3ML CON AGUJA 21GX38MM	1	2016-12-16 18:46:14.092	2016-12-16 18:46:14.092	\N	\N	\N	\N	\N	279.0	0.0	150.0	40.0	\N	\N	\N	1	\N	\N	3
973	JERINGA PLASTICA ESTERIL X5ML CON AGUJA 21GX38MM	1	2016-12-16 18:46:14.096755	2016-12-16 18:46:14.096755	\N	\N	\N	\N	\N	266.0	0.0	150.0	48.0	\N	\N	\N	1	\N	\N	3
974	JERINGA PRECISION 50ML 21X1.5 (3 PARTES ROSCA)	1	2016-12-16 18:46:14.101832	2016-12-16 18:46:14.101832	\N	\N	\N	\N	\N	647.0	0.0	150.0	6.0	\N	\N	\N	1	\N	\N	3
975	JERINGA VACIA LUMINA X 150 ML REF 900101	1	2016-12-16 18:46:14.106175	2016-12-16 18:46:14.106175	\N	\N	\N	\N	\N	46529.0	0.0	150.0	7.0	\N	\N	\N	1	\N	\N	3
976	KETOROLACO 30MG AMPOLLA - LAB. :GENFAR SA	1	2016-12-16 18:46:14.111666	2016-12-16 18:46:14.111666	\N	\N	\N	\N	\N	1403.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
977	KIT CATETER M HK PRECURVADO13.5FRX13.5CM-REF	1	2016-12-16 18:46:14.117106	2016-12-16 18:46:14.117106	\N	\N	\N	\N	\N	200000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
978	KIT CATETER M HK RECTO 13.5FRX19.5CM-REF	1	2016-12-16 18:46:14.121999	2016-12-16 18:46:14.121999	\N	\N	\N	\N	\N	259582.0	0.0	150.0	2.0	\N	\N	\N	1	\N	\N	3
979	KIT DE NEFROSTOMIA 8FR C/H NK2 BTP50935 UNIDAD	1	2016-12-16 18:46:14.12641	2016-12-16 18:46:14.12641	\N	\N	\N	\N	\N	576000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
980	KIT DIALISIS CRONICA PROGUIDE 14 5FRX 40CM	1	2016-12-16 18:46:14.130926	2016-12-16 18:46:14.130926	\N	\N	\N	\N	\N	680000.0	0.0	150.0	3.0	\N	\N	\N	1	\N	\N	3
981	KIT DIALISIS CRONICA PROGUIDE 14 5FRX23CM	1	2016-12-16 18:46:14.135312	2016-12-16 18:46:14.135312	\N	\N	\N	\N	\N	453333.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
982	KIT DIALISIS CRONICA PROGUIDE 14 5FRX36CM	1	2016-12-16 18:46:14.139959	2016-12-16 18:46:14.139959	\N	\N	\N	\N	\N	680000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
983	KIT INTRODUCTOR MIC G-18 98423 EMAPQUE	1	2016-12-16 18:46:14.144331	2016-12-16 18:46:14.144331	\N	\N	\N	\N	\N	828000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
984	KIT INTRODUCTOR PERCUTANEO 8.5F- REF: I300BF85	1	2016-12-16 18:46:14.148755	2016-12-16 18:46:14.148755	\N	\N	\N	\N	\N	86000.0	0.0	150.0	5.0	\N	\N	\N	1	\N	\N	3
985	KIT MICRONEBULIZADOR (ADULTO) EMPAQUE INDIVIDUAL	1	2016-12-16 18:46:14.153008	2016-12-16 18:46:14.153008	\N	\N	\N	\N	\N	4220.0	0.0	150.0	2.0	\N	\N	\N	1	\N	\N	3
986	KIT TRANSDUCTOR TRUWAVE SENCILLO MAS VAMP- REF:	1	2016-12-16 18:46:14.15755	2016-12-16 18:46:14.15755	\N	\N	\N	\N	\N	85091.0	0.0	150.0	4.0	\N	\N	\N	1	\N	\N	3
987	KIT TRAQUEOSTOMIA CON CANULA PERC CPTIS	1	2016-12-16 18:46:14.162519	2016-12-16 18:46:14.162519	\N	\N	\N	\N	\N	890000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
988	KIT TRAQUEOSTOMIA SIN CANULA PERC CPTIS 100HC	1	2016-12-16 18:46:14.167014	2016-12-16 18:46:14.167014	\N	\N	\N	\N	\N	784286.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
989	LABETALOL (DIBLOREC) 100MG/20ML VIAL - LAB. :	1	2016-12-16 18:46:14.171885	2016-12-16 18:46:14.171885	\N	\N	\N	\N	\N	39837.0	0.0	150.0	6.0	\N	\N	\N	1	\N	\N	3
990	LACTATO DE RINGER USP (HARTMAN) 1000ML 1000ML	1	2016-12-16 18:46:14.176595	2016-12-16 18:46:14.176595	\N	\N	\N	\N	\N	2569.0	0.0	150.0	21.0	\N	\N	\N	1	\N	\N	3
991	LACTATO DE RINGER USP (HARTMAN) 500ML 500ML	1	2016-12-16 18:46:14.18111	2016-12-16 18:46:14.18111	\N	\N	\N	\N	\N	1544.0	0.0	150.0	13.0	\N	\N	\N	1	\N	\N	3
992	LAMOTRIGINA 25MG TABLETA - LAB. : NOVARTIS DE	1	2016-12-16 18:46:14.185576	2016-12-16 18:46:14.185576	\N	\N	\N	\N	\N	325.0	0.0	150.0	7.0	\N	\N	\N	1	\N	\N	3
993	LAMOTRIGINA 25MG TABLETA - LAB. :SANDOZ PRIVATE	1	2016-12-16 18:46:14.190132	2016-12-16 18:46:14.190132	\N	\N	\N	\N	\N	788.0	0.0	150.0	26.0	\N	\N	\N	1	\N	\N	3
994	LEVETIRACETAM (KEPPRA) 1000MG TABLETA - LAB. :	1	2016-12-16 18:46:14.196125	2016-12-16 18:46:14.196125	\N	\N	\N	\N	\N	1490.0	0.0	150.0	5.0	\N	\N	\N	1	\N	\N	3
995	LEVETIRACETAM (KEPPRA) 500MG TABLETA - LAB. :	1	2016-12-16 18:46:14.201006	2016-12-16 18:46:14.201006	\N	\N	\N	\N	\N	1225.0	0.0	150.0	4.0	\N	\N	\N	1	\N	\N	3
996	LEVOBUPIVACAINA (BUPINEST SIMPLE) 0,75%	1	2016-12-16 18:46:14.205374	2016-12-16 18:46:14.205374	\N	\N	\N	\N	\N	3643.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
997	LEVOMEPROMAZINA (SINOGAN) 4% GOTAS - LAB. :	1	2016-12-16 18:46:14.209915	2016-12-16 18:46:14.209915	\N	\N	\N	\N	\N	31911.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
998	LEVOSIMENDAN (DAXIM) 2.5MG/ML VIAL - LAB. :ABBOTT	1	2016-12-16 18:46:14.214856	2016-12-16 18:46:14.214856	\N	\N	\N	\N	\N	1474053.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
999	LEVOTIROXINA SODICA 50MCG TABLETA - LAB. :	1	2016-12-16 18:46:14.219707	2016-12-16 18:46:14.219707	\N	\N	\N	\N	\N	23.0	0.0	150.0	21.0	\N	\N	\N	1	\N	\N	3
1000	LIDOCAINA 10ML (ROXICAINA) 2% AMPOULEPACK - LAB. :	1	2016-12-16 18:46:14.22425	2016-12-16 18:46:14.22425	\N	\N	\N	\N	\N	492.0	0.0	150.0	50.0	\N	\N	\N	1	\N	\N	3
1001	LIDOCAINA ATOMIZADOR (ROXICAINA) 80G FRASCO -	1	2016-12-16 18:46:14.228773	2016-12-16 18:46:14.228773	\N	\N	\N	\N	\N	35307.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
1002	LIDOCAINA JALEA (ROXICAINA) 2G TUBO - LAB. :	1	2016-12-16 18:46:14.233184	2016-12-16 18:46:14.233184	\N	\N	\N	\N	\N	5795.0	0.0	150.0	5.0	\N	\N	\N	1	\N	\N	3
1003	LIGACLIP VERDE REF LT300 VITALITEC EMPAQUE	1	2016-12-16 18:46:14.237901	2016-12-16 18:46:14.237901	\N	\N	\N	\N	\N	26717.0	0.0	150.0	2.0	\N	\N	\N	1	\N	\N	3
1004	LINEAS DE SANGRE ARTERIAL Y VENOSA SET NIKKISO	1	2016-12-16 18:46:14.242567	2016-12-16 18:46:14.242567	\N	\N	\N	\N	\N	38778.0	0.0	150.0	5.0	\N	\N	\N	1	\N	\N	3
1005	LINER 1500 BOLSA DE SUCCION EMPAQUE INDIVIDUAL	1	2016-12-16 18:46:14.247078	2016-12-16 18:46:14.247078	\N	\N	\N	\N	\N	8388.0	0.0	150.0	6.0	\N	\N	\N	1	\N	\N	3
1006	LINER 3000 BOLSA DE SUCCION EMPAQUE INDIVIDUAL	1	2016-12-16 18:46:14.251275	2016-12-16 18:46:14.251275	\N	\N	\N	\N	\N	9280.0	0.0	150.0	9.0	\N	\N	\N	1	\N	\N	3
1007	LINEZOLID (ZYVOXID) 600MG BOLSA - LAB. :	1	2016-12-16 18:46:14.255493	2016-12-16 18:46:14.255493	\N	\N	\N	\N	\N	121467.0	0.0	150.0	12.0	\N	\N	\N	1	\N	\N	3
1008	LIQUIDO EMBOLICO PARA M A V KIT ONIX DENSIDAD 18	1	2016-12-16 18:46:14.260268	2016-12-16 18:46:14.260268	\N	\N	\N	\N	\N	1984000.0	0.0	150.0	2.0	\N	\N	\N	1	\N	\N	3
1009	LLAVE DE TRES VIAS VYCLIC -VYGON EMPAQUE	1	2016-12-16 18:46:14.264728	2016-12-16 18:46:14.264728	\N	\N	\N	\N	\N	967.0	0.0	150.0	25.0	\N	\N	\N	1	\N	\N	3
1010	LLAVES DE 3 VIAS CONNECTA PLUS - OHMEDA-	1	2016-12-16 18:46:14.269324	2016-12-16 18:46:14.269324	\N	\N	\N	\N	\N	1957.0	0.0	150.0	10.0	\N	\N	\N	1	\N	\N	3
1011	LLAVES MANIFOLD DERECHO 200PSI OFF 3 PUERTOSREF :	1	2016-12-16 18:46:14.273567	2016-12-16 18:46:14.273567	\N	\N	\N	\N	\N	25520.0	0.0	150.0	5.0	\N	\N	\N	1	\N	\N	3
1012	LOPERAMIDA 2MG TABLETA - LAB. :LABORATORIOS ECAR	1	2016-12-16 18:46:14.277864	2016-12-16 18:46:14.277864	\N	\N	\N	\N	\N	126.0	0.0	150.0	8.0	\N	\N	\N	1	\N	\N	3
1013	LOPERAMIDA 2MG TABLETA - LAB. :TECNOQUIMICAS S.A.	1	2016-12-16 18:46:14.282224	2016-12-16 18:46:14.282224	\N	\N	\N	\N	\N	67.0	0.0	150.0	5.0	\N	\N	\N	1	\N	\N	3
1014	LORATADINA 10MG TABLETA - LAB. :SANOFI WINTHROP	1	2016-12-16 18:46:14.286592	2016-12-16 18:46:14.286592	\N	\N	\N	\N	\N	144.0	0.0	150.0	7.0	\N	\N	\N	1	\N	\N	3
1015	LORATADINA 10MG TABLETAS UNIDAD UNIDAD - LAB. :	1	2016-12-16 18:46:14.293121	2016-12-16 18:46:14.293121	\N	\N	\N	\N	\N	115.0	0.0	150.0	10.0	\N	\N	\N	1	\N	\N	3
1016	LORAZEPAM (ATIVAN) 1MG TABLETA - LAB. :WYETH	1	2016-12-16 18:46:14.297842	2016-12-16 18:46:14.297842	\N	\N	\N	\N	\N	212.0	0.0	150.0	4.0	\N	\N	\N	1	\N	\N	3
1017	LOSARTAN 50MG TABLETA - LAB. :GENFAR SA	1	2016-12-16 18:46:14.302454	2016-12-16 18:46:14.302454	\N	\N	\N	\N	\N	19.0	0.0	150.0	62.0	\N	\N	\N	1	\N	\N	3
1018	LOVASTATINA 20MG TABLETA - LAB. :LABORATORIO	1	2016-12-16 18:46:14.306794	2016-12-16 18:46:14.306794	\N	\N	\N	\N	\N	81.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
1019	MANIFOLD 3 VIAS DERECHO 203HF R -WORLD MEDICAL	1	2016-12-16 18:46:14.311318	2016-12-16 18:46:14.311318	\N	\N	\N	\N	\N	25520.0	0.0	150.0	3.0	\N	\N	\N	1	\N	\N	3
1020	MANITOL (OSMORIN) 500ML BOLSA - LAB. :	1	2016-12-16 18:46:14.315648	2016-12-16 18:46:14.315648	\N	\N	\N	\N	\N	9667.0	0.0	150.0	7.0	\N	\N	\N	1	\N	\N	3
1021	MANTA DE CALENTAMIENTO ADULTO REF: 5030810	1	2016-12-16 18:46:14.320175	2016-12-16 18:46:14.320175	\N	\N	\N	\N	\N	46089.0	0.0	150.0	3.0	\N	\N	\N	1	\N	\N	3
1022	MANTA POS-OPERATORIO REF 3000 3M AZUL EMPAQUE	1	2016-12-16 18:46:14.324568	2016-12-16 18:46:14.324568	\N	\N	\N	\N	\N	29284.0	0.0	150.0	2.0	\N	\N	\N	1	\N	\N	3
1023	MANTA TERMICA CTP REF 545 ADULTO CX- ARIZANT	1	2016-12-16 18:46:14.329249	2016-12-16 18:46:14.329249	\N	\N	\N	\N	\N	60386.0	0.0	150.0	7.0	\N	\N	\N	1	\N	\N	3
1024	MARCAPASO SENSIA SESR01MED EMPAQUE INDIVIDUAL	1	2016-12-16 18:46:14.333443	2016-12-16 18:46:14.333443	\N	\N	\N	\N	\N	2347400.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
1025	MARCAPASOS BICAMERAL ADAPTA REF: ADDR01- MED	1	2016-12-16 18:46:14.337817	2016-12-16 18:46:14.337817	\N	\N	\N	\N	\N	4588100.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
1026	MASCARA DE OXIGENO ALLMED DEVOLUCION EMPAQUE	1	2016-12-16 18:46:14.34344	2016-12-16 18:46:14.34344	\N	\N	\N	\N	\N	3414.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
1027	MASCARA DE OXIGENO DE NO REINHALACION ALLMED	1	2016-12-16 18:46:14.347638	2016-12-16 18:46:14.347638	\N	\N	\N	\N	\N	3547.0	0.0	150.0	2.0	\N	\N	\N	1	\N	\N	3
1028	MASCARA DE TRAQUEOSTOMIA 01225 CM11J23	1	2016-12-16 18:46:14.351937	2016-12-16 18:46:14.351937	\N	\N	\N	\N	\N	3735.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
1029	MASCARA PARA SUMINISTRO DE OXIGENO TIPO VENTURY	1	2016-12-16 18:46:14.356547	2016-12-16 18:46:14.356547	\N	\N	\N	\N	\N	4799.0	0.0	150.0	3.0	\N	\N	\N	1	\N	\N	3
1030	MASCARAS QUIRURGICAS Y RESPIRADOR DE PARTICULAS	1	2016-12-16 18:46:14.360732	2016-12-16 18:46:14.360732	\N	\N	\N	\N	\N	3162.0	0.0	150.0	18.0	\N	\N	\N	1	\N	\N	3
1031	MEDIA COMPRESION VASCULAR ANTIEMBOLICA	1	2016-12-16 18:46:14.36532	2016-12-16 18:46:14.36532	\N	\N	\N	\N	\N	31320.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
1032	MEPERIDINA CLORHIDRATO 100MG/2ML AMPOLLA - LAB.	1	2016-12-16 18:46:14.369542	2016-12-16 18:46:14.369542	\N	\N	\N	\N	\N	2129.0	0.0	150.0	3.0	\N	\N	\N	1	\N	\N	3
1033	MEROPENEM (MERONEM) 1G AMPOLLA - LAB. :	1	2016-12-16 18:46:14.374243	2016-12-16 18:46:14.374243	\N	\N	\N	\N	\N	41971.0	0.0	150.0	33.0	\N	\N	\N	1	\N	\N	3
1034	MEROPENEM 1GR AMPOLLA 1G VIAL - LAB. :FADA	1	2016-12-16 18:46:14.378409	2016-12-16 18:46:14.378409	\N	\N	\N	\N	\N	10200.0	0.0	150.0	4.0	\N	\N	\N	1	\N	\N	3
1035	METFORMINA 850 MG UNIDAD TABLETA - LAB. :	1	2016-12-16 18:46:14.383095	2016-12-16 18:46:14.383095	\N	\N	\N	\N	\N	62.0	0.0	150.0	2.0	\N	\N	\N	1	\N	\N	3
1036	METILPREDNISOLONA 500MG VIAL - LAB. :VITROFARMA	1	2016-12-16 18:46:14.387518	2016-12-16 18:46:14.387518	\N	\N	\N	\N	\N	10365.0	0.0	150.0	3.0	\N	\N	\N	1	\N	\N	3
1037	METILPREDNISOLONA (DEPO-MEDROL) 40MG VIAL - LAB.	1	2016-12-16 18:46:14.391945	2016-12-16 18:46:14.391945	\N	\N	\N	\N	\N	4302.0	0.0	150.0	5.0	\N	\N	\N	1	\N	\N	3
1038	METIMAZOL (TAPAZOL) 5MG TABLETA - LAB. :ALTEA	1	2016-12-16 18:46:14.396503	2016-12-16 18:46:14.396503	\N	\N	\N	\N	\N	168.0	0.0	150.0	25.0	\N	\N	\N	1	\N	\N	3
1039	METOCLOPRAMIDA 10MG/2ML AMPOLLA - LAB. :	1	2016-12-16 18:46:14.400691	2016-12-16 18:46:14.400691	\N	\N	\N	\N	\N	158.0	0.0	150.0	16.0	\N	\N	\N	1	\N	\N	3
1040	METOPROLOL (BETALOC ZOK) 100MG TABLETA - LAB. :	1	2016-12-16 18:46:14.405333	2016-12-16 18:46:14.405333	\N	\N	\N	\N	\N	3083.0	0.0	150.0	3.0	\N	\N	\N	1	\N	\N	3
1041	METOPROLOL TARTRATO (BETOPROLOL) 50MG TABLETA	1	2016-12-16 18:46:14.409565	2016-12-16 18:46:14.409565	\N	\N	\N	\N	\N	22.0	0.0	150.0	28.0	\N	\N	\N	1	\N	\N	3
1042	METOPROLOL TARTRATO (BETOPROLOL) 5MG/5ML	1	2016-12-16 18:46:14.414132	2016-12-16 18:46:14.414132	\N	\N	\N	\N	\N	6218.0	0.0	150.0	3.0	\N	\N	\N	1	\N	\N	3
1043	METOPROLOL TARTRATO 50MG TABLETA - LAB. :SANOFI	1	2016-12-16 18:46:14.418695	2016-12-16 18:46:14.418695	\N	\N	\N	\N	\N	10.0	0.0	150.0	37.0	\N	\N	\N	1	\N	\N	3
1044	METRONIDAZOL (FLAGYL) 500MG/100ML BOLSA - LAB. :	1	2016-12-16 18:46:14.423208	2016-12-16 18:46:14.423208	\N	\N	\N	\N	\N	12627.0	0.0	150.0	2.0	\N	\N	\N	1	\N	\N	3
1045	METRONIDAZOL (TENAFLOX) 500MG AMPOLLA - LAB. :	1	2016-12-16 18:46:14.427543	2016-12-16 18:46:14.427543	\N	\N	\N	\N	\N	1080.0	0.0	150.0	5.0	\N	\N	\N	1	\N	\N	3
1046	METRONIDAZOL 500MG TABLETA - LAB. :GENFAR SA	1	2016-12-16 18:46:14.432022	2016-12-16 18:46:14.432022	\N	\N	\N	\N	\N	40.0	0.0	150.0	5.0	\N	\N	\N	1	\N	\N	3
1047	MICOFENOLATO (MYFORTIC) 360MG TABLETA - LAB. :	1	2016-12-16 18:46:14.436406	2016-12-16 18:46:14.436406	\N	\N	\N	\N	\N	3567.0	0.0	150.0	90.0	\N	\N	\N	1	\N	\N	3
1048	MICOFENOLATO DE MOFETILO (CELLCEPT) 500MG	1	2016-12-16 18:46:14.44429	2016-12-16 18:46:14.44429	\N	\N	\N	\N	\N	4538.0	0.0	150.0	40.0	\N	\N	\N	1	\N	\N	3
1049	MICRO CATHETER APOLLO - 1.5F/2.7F-165CM - REF :	1	2016-12-16 18:46:14.449299	2016-12-16 18:46:14.449299	\N	\N	\N	\N	\N	2280000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
1050	MICRO CATHETER PROWLER SELECT PLUS STRAIGHT -	1	2016-12-16 18:46:14.453777	2016-12-16 18:46:14.453777	\N	\N	\N	\N	\N	930000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
1051	MICRO GUIA NEUROSCOUT 14 - 0.014 205CM- REF:	1	2016-12-16 18:46:14.458205	2016-12-16 18:46:14.458205	\N	\N	\N	\N	\N	1198384.0	0.0	150.0	2.0	\N	\N	\N	1	\N	\N	3
1052	MICROCATETER ECHELON 10 2.1/1.7FR 155CM GUIA	1	2016-12-16 18:46:14.462781	2016-12-16 18:46:14.462781	\N	\N	\N	\N	\N	980000.0	0.0	150.0	2.0	\N	\N	\N	1	\N	\N	3
1053	MICROCATETER MARATHON 1.5F/2.7F 165CM GUIA	1	2016-12-16 18:46:14.467078	2016-12-16 18:46:14.467078	\N	\N	\N	\N	\N	1145600.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
1054	MICROCATETER MARATHON 2.7/1.3FR 170CM GUIA	1	2016-12-16 18:46:14.471616	2016-12-16 18:46:14.471616	\N	\N	\N	\N	\N	1026667.0	0.0	150.0	2.0	\N	\N	\N	1	\N	\N	3
1055	MICROCATETER PROWLER PLUS .021 MP 5CM 606S255FX	1	2016-12-16 18:46:14.476299	2016-12-16 18:46:14.476299	\N	\N	\N	\N	\N	842580.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
1056	MICROCATETER PROWLER PLUS .021 MP 5CM 606S255MX	1	2016-12-16 18:46:14.481048	2016-12-16 18:46:14.481048	\N	\N	\N	\N	\N	936200.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
1057	MICROCATETER PROWLER PLUS .021 MP 5CM 606S255X	1	2016-12-16 18:46:14.485363	2016-12-16 18:46:14.485363	\N	\N	\N	\N	\N	1656857.0	0.0	150.0	2.0	\N	\N	\N	1	\N	\N	3
1058	MICROCATETER RAPIDTRANSINT 601251X JYJ EMPAQUE	1	2016-12-16 18:46:14.489728	2016-12-16 18:46:14.489728	\N	\N	\N	\N	\N	939300.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
1059	MICROCOIL CASHMERE 14 CERECYTE - 2MM - 2.5CM -	1	2016-12-16 18:46:14.494	2016-12-16 18:46:14.494	\N	\N	\N	\N	\N	910000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
1060	MICROCOIL CASHMERE 14 CERECYTE - 7MM - 17CM -	1	2016-12-16 18:46:14.498234	2016-12-16 18:46:14.498234	\N	\N	\N	\N	\N	910000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
1061	MICROCOIL DELTAPAQ (STRETCH RESISTANT COIL) -	1	2016-12-16 18:46:14.502302	2016-12-16 18:46:14.502302	\N	\N	\N	\N	\N	910000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
1062	MICROCOIL DELTAPAQ (STRETCH RESISTANT COIL) - 1.5	1	2016-12-16 18:46:14.507006	2016-12-16 18:46:14.507006	\N	\N	\N	\N	\N	910000.0	0.0	150.0	2.0	\N	\N	\N	1	\N	\N	3
1063	MICROCOIL DELTAPAQ (STRETCH RESISTANT COIL) - 2.0	1	2016-12-16 18:46:14.511782	2016-12-16 18:46:14.511782	\N	\N	\N	\N	\N	910000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
1064	MICROCOIL DELTAPAQ (STRETCH RESISTANT COIL) - 3.0	1	2016-12-16 18:46:14.516175	2016-12-16 18:46:14.516175	\N	\N	\N	\N	\N	910000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
1065	MICROCOIL DELTAPAQ 1.5MM X 2CM DFS100152-20 J Y	1	2016-12-16 18:46:14.520372	2016-12-16 18:46:14.520372	\N	\N	\N	\N	\N	910000.0	0.0	150.0	2.0	\N	\N	\N	1	\N	\N	3
1066	MICROCOIL DELTAPAQ PLATINUM 1.5MMX6CM REF:	1	2016-12-16 18:46:14.525012	2016-12-16 18:46:14.525012	\N	\N	\N	\N	\N	910000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
1067	MICROCOIL DELTAPAQ PLATINUM 10MMX25CM REF:	1	2016-12-16 18:46:14.52934	2016-12-16 18:46:14.52934	\N	\N	\N	\N	\N	916067.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
1068	MICROCOIL DELTAPAQ PLATINUM 2 5MMX6CM	1	2016-12-16 18:46:14.533637	2016-12-16 18:46:14.533637	\N	\N	\N	\N	\N	910000.0	0.0	150.0	2.0	\N	\N	\N	1	\N	\N	3
1069	MICROCOIL DELTAPAQ PLATINUM 2 5MMX8CM REF:	1	2016-12-16 18:46:14.538235	2016-12-16 18:46:14.538235	\N	\N	\N	\N	\N	910000.0	0.0	150.0	2.0	\N	\N	\N	1	\N	\N	3
1070	MICROCOIL DELTAPAQ PLATINUM 2MMX3CM	1	2016-12-16 18:46:14.542951	2016-12-16 18:46:14.542951	\N	\N	\N	\N	\N	910000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
1071	MICROCOIL DELTAPAQ PLATINUM 2MMX4CM	1	2016-12-16 18:46:14.547222	2016-12-16 18:46:14.547222	\N	\N	\N	\N	\N	910000.0	0.0	150.0	2.0	\N	\N	\N	1	\N	\N	3
1072	MICROCOIL DELTAPAQ PLATINUM 2MMX6CM	1	2016-12-16 18:46:14.552027	2016-12-16 18:46:14.552027	\N	\N	\N	\N	\N	910000.0	0.0	150.0	3.0	\N	\N	\N	1	\N	\N	3
1073	MICROCOIL DELTAPAQ PLATINUM 3MMX6CM	1	2016-12-16 18:46:14.556844	2016-12-16 18:46:14.556844	\N	\N	\N	\N	\N	910000.0	0.0	150.0	3.0	\N	\N	\N	1	\N	\N	3
1074	MICROCOIL DELTAPAQ PLATINUM 3MMX8CM	1	2016-12-16 18:46:14.561566	2016-12-16 18:46:14.561566	\N	\N	\N	\N	\N	910000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
1075	MICROCOIL DELTAPAQ PLATINUM 4MMX10CM	1	2016-12-16 18:46:14.56605	2016-12-16 18:46:14.56605	\N	\N	\N	\N	\N	913640.0	0.0	150.0	2.0	\N	\N	\N	1	\N	\N	3
1076	MICROCOIL DELTAPAQ PLATINUM 4MMX8CM	1	2016-12-16 18:46:14.570337	2016-12-16 18:46:14.570337	\N	\N	\N	\N	\N	910000.0	0.0	150.0	2.0	\N	\N	\N	1	\N	\N	3
1077	MICROCOIL DELTAPAQ PLATINUM 5MMX10CM	1	2016-12-16 18:46:14.574752	2016-12-16 18:46:14.574752	\N	\N	\N	\N	\N	919100.0	0.0	150.0	2.0	\N	\N	\N	1	\N	\N	3
1078	MICROCOIL DELTAPAQ PLATINUM 5MMX15CM	1	2016-12-16 18:46:14.579173	2016-12-16 18:46:14.579173	\N	\N	\N	\N	\N	913640.0	0.0	150.0	2.0	\N	\N	\N	1	\N	\N	3
1079	MICROCOIL DELTAPAQ PLATINUM 5MMX15CM REF:	1	2016-12-16 18:46:14.583905	2016-12-16 18:46:14.583905	\N	\N	\N	\N	\N	910000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
1080	MICROCOIL DELTAPAQ PLATINUM 6MMX12 DFS100612-	1	2016-12-16 18:46:14.588419	2016-12-16 18:46:14.588419	\N	\N	\N	\N	\N	928200.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
1081	MICROCOIL DELTAPAQ PLATINUM 6MMX16CM	1	2016-12-16 18:46:14.592765	2016-12-16 18:46:14.592765	\N	\N	\N	\N	\N	803075.0	0.0	150.0	2.0	\N	\N	\N	1	\N	\N	3
1082	MICROCOIL DELTAPAQ PLATINUM 7MMX16 REF:	1	2016-12-16 18:46:14.597092	2016-12-16 18:46:14.597092	\N	\N	\N	\N	\N	910000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
1083	MICROCOIL DELTAPAQ PLATINUM 7MMX20CM	1	2016-12-16 18:46:14.60137	2016-12-16 18:46:14.60137	\N	\N	\N	\N	\N	928200.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
1084	MICROCOIL DELTAPAQ PLATINUM 8MMX20CM	1	2016-12-16 18:46:14.605852	2016-12-16 18:46:14.605852	\N	\N	\N	\N	\N	910000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
1085	MICROCOIL DELTAPAQ PLATINUM 8MMX20CM REF:	1	2016-12-16 18:46:14.610224	2016-12-16 18:46:14.610224	\N	\N	\N	\N	\N	464100.0	0.0	150.0	2.0	\N	\N	\N	1	\N	\N	3
1086	MICROCOIL DELTAPAQ STRETCH RESISTANT 4-6-190	1	2016-12-16 18:46:14.614889	2016-12-16 18:46:14.614889	\N	\N	\N	\N	\N	928200.0	0.0	150.0	2.0	\N	\N	\N	1	\N	\N	3
1087	MICROCOIL MICRUSPHERE XL 5MM-10CM-SSR10051020	1	2016-12-16 18:46:14.61919	2016-12-16 18:46:14.61919	\N	\N	\N	\N	\N	910000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
1088	MICROGUIA AVIGO 103-0606-200 EMPAQUE INDIVIDUAL	1	2016-12-16 18:46:14.623527	2016-12-16 18:46:14.623527	\N	\N	\N	\N	\N	1299200.0	0.0	150.0	2.0	\N	\N	\N	1	\N	\N	3
1089	MICROGUIA HIDROFILICA MOD MIRAGE DIAM 0.008	1	2016-12-16 18:46:14.627952	2016-12-16 18:46:14.627952	\N	\N	\N	\N	\N	766528.0	0.0	150.0	2.0	\N	\N	\N	1	\N	\N	3
1090	MICROGUIA HIDROFILICA MOD X-CELERATOR 0.010	1	2016-12-16 18:46:14.632502	2016-12-16 18:46:14.632502	\N	\N	\N	\N	\N	575360.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
1091	MICROGUIA HIDROFILICA MOD X-PEDION DI 0.010	1	2016-12-16 18:46:14.636977	2016-12-16 18:46:14.636977	\N	\N	\N	\N	\N	575360.0	0.0	150.0	2.0	\N	\N	\N	1	\N	\N	3
1092	MICROPARTICULAS 250-355 EMPAQUE INDIVIDUAL	1	2016-12-16 18:46:14.641424	2016-12-16 18:46:14.641424	\N	\N	\N	\N	\N	368000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
1093	MICROPARTICULAS 45-150 760015 (BSC) EMPAQUE	1	2016-12-16 18:46:14.646011	2016-12-16 18:46:14.646011	\N	\N	\N	\N	\N	368000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
1094	MICROPARTICULAS EMBOSPHERA 7600451 355-500	1	2016-12-16 18:46:14.650434	2016-12-16 18:46:14.650434	\N	\N	\N	\N	\N	1840000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
1095	MICROPARTICULAS EMBOSPHERA 150-250 EMPAQUE	1	2016-12-16 18:46:14.655545	2016-12-16 18:46:14.655545	\N	\N	\N	\N	\N	368000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
1096	MIDAZOLAM 15MG/3ML AMPOLLA - LAB. :PRODUCTOS	1	2016-12-16 18:46:14.659937	2016-12-16 18:46:14.659937	\N	\N	\N	\N	\N	11459.0	0.0	150.0	8.0	\N	\N	\N	1	\N	\N	3
1097	MIDAZOLAM (DORMICUM) 5MG/5ML AMPOLLA - LAB. :	1	2016-12-16 18:46:14.665155	2016-12-16 18:46:14.665155	\N	\N	\N	\N	\N	4675.0	0.0	150.0	132.0	\N	\N	\N	1	\N	\N	3
1098	MILRINONA(COROTROPE) 10MG VIAL - LAB. :SANOFI-	1	2016-12-16 18:46:14.669737	2016-12-16 18:46:14.669737	\N	\N	\N	\N	\N	75275.0	0.0	150.0	14.0	\N	\N	\N	1	\N	\N	3
1099	MINOXIDIL 10MG TABLETA - LAB. :LABORATORIOS LICOL	1	2016-12-16 18:46:14.674454	2016-12-16 18:46:14.674454	\N	\N	\N	\N	\N	156.0	0.0	150.0	17.0	\N	\N	\N	1	\N	\N	3
1100	MIRTAZAPINA 30MG TABLETA - LAB. :SANDOZ PRIVATE	1	2016-12-16 18:46:14.679106	2016-12-16 18:46:14.679106	\N	\N	\N	\N	\N	563.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
1101	MONOCRYL 3-0 PS-2 X 70 CMS REFJJMCP427H	1	2016-12-16 18:46:14.683829	2016-12-16 18:46:14.683829	\N	\N	\N	\N	\N	13857.0	0.0	150.0	13.0	\N	\N	\N	1	\N	\N	3
1102	MORFINA 10MG AMPOLLA - LAB. :LABORATORIOS RYAN	1	2016-12-16 18:46:14.688156	2016-12-16 18:46:14.688156	\N	\N	\N	\N	\N	1534.0	0.0	150.0	4.0	\N	\N	\N	1	\N	\N	3
1103	MOXIFLOXACINO (AVELOX) 400MG/250 ML AMPOLLA -	1	2016-12-16 18:46:14.692882	2016-12-16 18:46:14.692882	\N	\N	\N	\N	\N	107466.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
1104	MULTI SNARE 15MM REF 147320 EMPAQUE INDIVIDUAL	1	2016-12-16 18:46:14.697418	2016-12-16 18:46:14.697418	\N	\N	\N	\N	\N	1740000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
1105	MULTI SNARE CAZADOR REF:EH0818,02-B COLM UNIDAD	1	2016-12-16 18:46:14.702333	2016-12-16 18:46:14.702333	\N	\N	\N	\N	\N	774300.0	0.0	150.0	2.0	\N	\N	\N	1	\N	\N	3
1106	MULTIELECTROLITOS TIPO I 500ML BOLSA - LAB. :SAN	1	2016-12-16 18:46:14.707046	2016-12-16 18:46:14.707046	\N	\N	\N	\N	\N	2607.0	0.0	150.0	14.0	\N	\N	\N	1	\N	\N	3
1107	MWCE-18-14-8- NESTEER COIL 18-14-8 NESTER COOK	1	2016-12-16 18:46:14.711409	2016-12-16 18:46:14.711409	\N	\N	\N	\N	\N	475000.0	0.0	150.0	2.0	\N	\N	\N	1	\N	\N	3
1108	NALOXONA 0.4MG AMPOLLA - LAB. :FEPARVI LTDA	1	2016-12-16 18:46:14.71599	2016-12-16 18:46:14.71599	\N	\N	\N	\N	\N	20507.0	0.0	150.0	2.0	\N	\N	\N	1	\N	\N	3
1109	N-BUTIL BROMURO DE HIOSCINA 20MG AMPOLLA -	1	2016-12-16 18:46:14.720486	2016-12-16 18:46:14.720486	\N	\N	\N	\N	\N	305.0	0.0	150.0	3.0	\N	\N	\N	1	\N	\N	3
1110	N-BUTIL BROMURO DE HIOSCINA (LABIMPINA) 10MG	1	2016-12-16 18:46:14.725209	2016-12-16 18:46:14.725209	\N	\N	\N	\N	\N	294.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
1111	N-BUTIL BROMURO DE HIOSCINA + DIPIRONA 5ML	1	2016-12-16 18:46:14.733723	2016-12-16 18:46:14.733723	\N	\N	\N	\N	\N	769.0	0.0	150.0	2.0	\N	\N	\N	1	\N	\N	3
1112	NEOSTIGMINA METILSULFATO (PROSTIGMINE) 0.5MG	1	2016-12-16 18:46:14.740275	2016-12-16 18:46:14.740275	\N	\N	\N	\N	\N	1839.0	0.0	150.0	9.0	\N	\N	\N	1	\N	\N	3
1113	NIFEDIPINO 30MG CAPSULA - LAB. :NOVAMED S.A.	1	2016-12-16 18:46:14.74453	2016-12-16 18:46:14.74453	\N	\N	\N	\N	\N	77.0	0.0	150.0	70.0	\N	\N	\N	1	\N	\N	3
1114	NIFEDIPINO 10MG CAPSULA - LAB. :GENFAR SA	1	2016-12-16 18:46:14.749135	2016-12-16 18:46:14.749135	\N	\N	\N	\N	\N	67.0	0.0	150.0	30.0	\N	\N	\N	1	\N	\N	3
1115	NIFEDIPINO 30MG CAPSULA - LAB. :LABORATORIOS	1	2016-12-16 18:46:14.753884	2016-12-16 18:46:14.753884	\N	\N	\N	\N	\N	355.0	0.0	150.0	15.0	\N	\N	\N	1	\N	\N	3
1116	NIMODIPINA (NIMOTOP) 10 MG/50ML AMPOLLA - LAB. :	1	2016-12-16 18:46:14.758358	2016-12-16 18:46:14.758358	\N	\N	\N	\N	\N	1967.0	0.0	150.0	101.0	\N	\N	\N	1	\N	\N	3
1117	NIMODIPINO 30MG TABLETA - LAB. :MK	1	2016-12-16 18:46:14.762926	2016-12-16 18:46:14.762926	\N	\N	\N	\N	\N	212.0	0.0	150.0	115.0	\N	\N	\N	1	\N	\N	3
1118	NISTATINA (MICOSTATIN) 100.000 UI/ML FRASCO - LAB.	1	2016-12-16 18:46:14.767081	2016-12-16 18:46:14.767081	\N	\N	\N	\N	\N	15605.0	0.0	150.0	4.0	\N	\N	\N	1	\N	\N	3
1119	NISTATINA 60ML FRASCO - LAB. :COASPHARMA S.A.S	1	2016-12-16 18:46:14.771853	2016-12-16 18:46:14.771853	\N	\N	\N	\N	\N	3206.0	0.0	150.0	2.0	\N	\N	\N	1	\N	\N	3
1120	NISTATINA SUSPENSION X 60 mL (HONGISTINA) mL	1	2016-12-16 18:46:14.777674	2016-12-16 18:46:14.777674	\N	\N	\N	\N	\N	1979.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
1121	NITROFURANTOINA 100MG CAPSULA - LAB. :	1	2016-12-16 18:46:14.782357	2016-12-16 18:46:14.782357	\N	\N	\N	\N	\N	94.0	0.0	150.0	2.0	\N	\N	\N	1	\N	\N	3
1122	NITROGLICERINA 50MG AMPOLLA - LAB. :VITALIS S.A. C.	1	2016-12-16 18:46:14.786839	2016-12-16 18:46:14.786839	\N	\N	\N	\N	\N	3890.0	0.0	150.0	9.0	\N	\N	\N	1	\N	\N	3
1123	NITROGLICERINA 50MG VIAL - LAB. :LABORATORIOS	1	2016-12-16 18:46:14.791001	2016-12-16 18:46:14.791001	\N	\N	\N	\N	\N	4789.0	0.0	150.0	12.0	\N	\N	\N	1	\N	\N	3
1124	NOREPINEFRINA (PRIDAM) 4MG/4ML VIAL - LAB. :PISA	1	2016-12-16 18:46:14.795347	2016-12-16 18:46:14.795347	\N	\N	\N	\N	\N	2300.0	0.0	150.0	8.0	\N	\N	\N	1	\N	\N	3
1125	NOREPINEFRINA 4MG/4ML INV AMPOLLA UNIDAD	1	2016-12-16 18:46:14.799853	2016-12-16 18:46:14.799853	\N	\N	\N	\N	\N	1979.0	0.0	150.0	31.0	\N	\N	\N	1	\N	\N	3
1126	NOREPINEFRINA 4ML AMPOLLA - LAB. :VITALIS S.A. C.I.	1	2016-12-16 18:46:14.804271	2016-12-16 18:46:14.804271	\N	\N	\N	\N	\N	2085.0	0.0	150.0	19.0	\N	\N	\N	1	\N	\N	3
1127	NU DERM 10X10 HIDROCOLOIDE - REF: HCF204	1	2016-12-16 18:46:14.808952	2016-12-16 18:46:14.808952	\N	\N	\N	\N	\N	20718.0	0.0	150.0	2.0	\N	\N	\N	1	\N	\N	3
1128	NUROLON 4-0 - 8 X 45 CMS - TF- REFJJN104T EMPAQUE	1	2016-12-16 18:46:14.813022	2016-12-16 18:46:14.813022	\N	\N	\N	\N	\N	79495.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
1129	NUTRICION ADULTO HASTA 1500 ML CON LIPIDOS ML	1	2016-12-16 18:46:14.817408	2016-12-16 18:46:14.817408	\N	\N	\N	\N	\N	150400.0	0.0	150.0	6.0	\N	\N	\N	1	\N	\N	3
1130	NUTRICION ENTERAL L GLUTAMINA (ALITRAQ) 76G	1	2016-12-16 18:46:14.822342	2016-12-16 18:46:14.822342	\N	\N	\N	\N	\N	5546.0	0.0	150.0	15.0	\N	\N	\N	1	\N	\N	3
1131	OMEPRAZOL (ORAZOLE) 40MG VIAL - LAB. :	1	2016-12-16 18:46:14.82685	2016-12-16 18:46:14.82685	\N	\N	\N	\N	\N	10038.0	0.0	150.0	20.0	\N	\N	\N	1	\N	\N	3
1132	OMEPRAZOL 20MG CAPSULA - LAB. :GENFAR SA	1	2016-12-16 18:46:14.831128	2016-12-16 18:46:14.831128	\N	\N	\N	\N	\N	37.0	0.0	150.0	42.0	\N	\N	\N	1	\N	\N	3
1133	OMEPRAZOL 20MG CAPSULA - LAB. :LABORATORIOS	1	2016-12-16 18:46:14.83588	2016-12-16 18:46:14.83588	\N	\N	\N	\N	\N	24.0	0.0	150.0	30.0	\N	\N	\N	1	\N	\N	3
1134	ONDANSETRON (BRYTEROL) 4MG AMPOLLA - LAB. :	1	2016-12-16 18:46:14.840169	2016-12-16 18:46:14.840169	\N	\N	\N	\N	\N	944.0	0.0	150.0	6.0	\N	\N	\N	1	\N	\N	3
1135	OXIDO NITRICO (INOFLO) PARA INHALACION litro LITRO	1	2016-12-16 18:46:14.844628	2016-12-16 18:46:14.844628	\N	\N	\N	\N	\N	3545.0	0.0	150.0	168.0	\N	\N	\N	1	\N	\N	3
1136	OXIGENADOR ADULTO 2.5MTS XCOATING REF 09SX25RX	1	2016-12-16 18:46:14.848956	2016-12-16 18:46:14.848956	\N	\N	\N	\N	\N	912533.0	0.0	150.0	4.0	\N	\N	\N	1	\N	\N	3
1137	OXIGENADOR CAPIOX PED R3000 09RX15RE30-ARROW	1	2016-12-16 18:46:14.853845	2016-12-16 18:46:14.853845	\N	\N	\N	\N	\N	1047319.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
1138	PANTOPRAZOL (ACILIBRE) 40MG TABLETA - LAB. :	1	2016-12-16 18:46:14.857971	2016-12-16 18:46:14.857971	\N	\N	\N	\N	\N	510.0	0.0	150.0	9.0	\N	\N	\N	1	\N	\N	3
1139	PANTOPRAZOL (ZURCAL) 40MG AMPOLLA - LAB. :	1	2016-12-16 18:46:14.862853	2016-12-16 18:46:14.862853	\N	\N	\N	\N	\N	6804.0	0.0	150.0	5.0	\N	\N	\N	1	\N	\N	3
1140	PARCHE CARDIO GORETEX PTFE 5CM 7.5CM 06MM G	1	2016-12-16 18:46:14.867712	2016-12-16 18:46:14.867712	\N	\N	\N	\N	\N	1323000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
1141	PARCHE PERICARDIO 15 X 10 REF: A10161234-ST JUDE	1	2016-12-16 18:46:14.872098	2016-12-16 18:46:14.872098	\N	\N	\N	\N	\N	300000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
1142	PEGRA ( LEVETIRACETAM)Â  500MG TABLETAS 500MG	1	2016-12-16 18:46:14.877042	2016-12-16 18:46:14.877042	\N	\N	\N	\N	\N	474.0	0.0	150.0	15.0	\N	\N	\N	1	\N	\N	3
1143	PERICAN G16 3 1/4 TUOHY REF 4512782 BRAUN	1	2016-12-16 18:46:14.881909	2016-12-16 18:46:14.881909	\N	\N	\N	\N	\N	13352.0	0.0	150.0	2.0	\N	\N	\N	1	\N	\N	3
1144	PERIFIX G 18 301 401 402 501 BRAUN EMPAQUE	1	2016-12-16 18:46:14.88666	2016-12-16 18:46:14.88666	\N	\N	\N	\N	\N	26136.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
1145	PINZA DE BIOPSIA 7FX104CM 502 400B JYJ EMPAQUE	1	2016-12-16 18:46:14.891071	2016-12-16 18:46:14.891071	\N	\N	\N	\N	\N	906626.0	0.0	150.0	2.0	\N	\N	\N	1	\N	\N	3
1146	PINZA DE BIOPSIA-BIOPAL 7--CORDIS - 7FR-104 CM X 5	1	2016-12-16 18:46:14.895693	2016-12-16 18:46:14.895693	\N	\N	\N	\N	\N	1200830.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
1147	PINZA PREMIUM SURGICLIP COVIDEAN EMPAQUE	1	2016-12-16 18:46:14.902977	2016-12-16 18:46:14.902977	\N	\N	\N	\N	\N	348000.0	0.0	150.0	6.0	\N	\N	\N	1	\N	\N	3
1148	PIPERACILINA + TAZOBACTAM (TAPECTAM) 4.5 G	1	2016-12-16 18:46:14.907695	2016-12-16 18:46:14.907695	\N	\N	\N	\N	\N	31395.0	0.0	150.0	18.0	\N	\N	\N	1	\N	\N	3
1149	PIRIDOXINA (BIPRIN) 50MG CAPSULA - LAB. :	1	2016-12-16 18:46:14.91197	2016-12-16 18:46:14.91197	\N	\N	\N	\N	\N	896.0	0.0	150.0	6.0	\N	\N	\N	1	\N	\N	3
1150	PLACA REM VALLEYLAB E7507 NARANJA COVIDIEN	1	2016-12-16 18:46:14.916522	2016-12-16 18:46:14.916522	\N	\N	\N	\N	\N	16460.0	0.0	150.0	3.0	\N	\N	\N	1	\N	\N	3
1151	PLUG VASCULAR 9PLUG 010-ST JUDE EMPAQUE	1	2016-12-16 18:46:14.92129	2016-12-16 18:46:14.92129	\N	\N	\N	\N	\N	1633500.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
1152	POLIDOCANOL (ETOXIVEN) 1 % CENTIMETROS CUBICOS -	1	2016-12-16 18:46:14.9257	2016-12-16 18:46:14.9257	\N	\N	\N	\N	\N	2234.0	0.0	150.0	41.0	\N	\N	\N	1	\N	\N	3
1153	POLIDOCANOL (ETOXIVEN) CENTIMETROS CUBICOS 3%	1	2016-12-16 18:46:14.929986	2016-12-16 18:46:14.929986	\N	\N	\N	\N	\N	2700.0	0.0	150.0	11.0	\N	\N	\N	1	\N	\N	3
1154	POLIETILENGLICOL (NULYTELY) 110G SOBRE - LAB. :	1	2016-12-16 18:46:14.933989	2016-12-16 18:46:14.933989	\N	\N	\N	\N	\N	9483.0	0.0	150.0	3.0	\N	\N	\N	1	\N	\N	3
1155	POLYSORB (POLIGLACTINA) VIOLETA2/0 GS-21-	1	2016-12-16 18:46:14.93833	2016-12-16 18:46:14.93833	\N	\N	\N	\N	\N	8082.0	0.0	150.0	5.0	\N	\N	\N	1	\N	\N	3
1156	POLYSORB (POLIGLACTINA)VIOLETA 1 GS-21- REFCL925	1	2016-12-16 18:46:14.942754	2016-12-16 18:46:14.942754	\N	\N	\N	\N	\N	7944.0	0.0	150.0	14.0	\N	\N	\N	1	\N	\N	3
1157	PRATEN PRAZOSINA 1MG TABLETAS UNIDAD TABLETA -	1	2016-12-16 18:46:14.947314	2016-12-16 18:46:14.947314	\N	\N	\N	\N	\N	39.0	0.0	150.0	20.0	\N	\N	\N	1	\N	\N	3
1158	PRAZOSINA 1MG TABLETA - LAB. :LABORATORIOS	1	2016-12-16 18:46:14.95223	2016-12-16 18:46:14.95223	\N	\N	\N	\N	\N	113.0	0.0	150.0	19.0	\N	\N	\N	1	\N	\N	3
1159	PREDNISOLONA 5MG TABLETA - LAB. :TECNOQUIMICAS	1	2016-12-16 18:46:14.956771	2016-12-16 18:46:14.956771	\N	\N	\N	\N	\N	30.0	0.0	150.0	44.0	\N	\N	\N	1	\N	\N	3
1160	PREDNISONA 50MG TABLETA - LAB. :TECNOQUIMICAS S.	1	2016-12-16 18:46:14.961972	2016-12-16 18:46:14.961972	\N	\N	\N	\N	\N	450.0	0.0	150.0	23.0	\N	\N	\N	1	\N	\N	3
1161	PREGABALINA 75 MG CAPSULA - LAB. :MK	1	2016-12-16 18:46:14.967427	2016-12-16 18:46:14.967427	\N	\N	\N	\N	\N	606.0	0.0	150.0	12.0	\N	\N	\N	1	\N	\N	3
1162	PROLENE (POLIPROPILENO) 3-0 AZUL 90 SH (2) CARDIO	1	2016-12-16 18:46:14.972001	2016-12-16 18:46:14.972001	\N	\N	\N	\N	\N	12584.0	0.0	150.0	5.0	\N	\N	\N	1	\N	\N	3
1163	PROLENE (POLIPROPILENO) 4-0 AZUL 75 RB1(2) CARDIO	1	2016-12-16 18:46:14.976422	2016-12-16 18:46:14.976422	\N	\N	\N	\N	\N	13292.0	0.0	150.0	36.0	\N	\N	\N	1	\N	\N	3
1164	PROLENE (POLIPROPILENO) 4-0 AZUL 90 SH(2) CARDIO	1	2016-12-16 18:46:14.98064	2016-12-16 18:46:14.98064	\N	\N	\N	\N	\N	13725.0	0.0	150.0	4.0	\N	\N	\N	1	\N	\N	3
1165	PROLENE (POLIPROPILENO) 6-0 AZUL 60 2C1(2) 8726T	1	2016-12-16 18:46:14.984918	2016-12-16 18:46:14.984918	\N	\N	\N	\N	\N	15086.0	0.0	150.0	18.0	\N	\N	\N	1	\N	\N	3
1166	PROLENE (POLIPROPILENO) 7-0 AZUL 60 BV1 (2) CARDIO	1	2016-12-16 18:46:14.989036	2016-12-16 18:46:14.989036	\N	\N	\N	\N	\N	23698.0	0.0	150.0	18.0	\N	\N	\N	1	\N	\N	3
1167	PROLENE 3 0 8184T EMPAQUE INDIVIDUAL UNIDAD -	1	2016-12-16 18:46:14.993781	2016-12-16 18:46:14.993781	\N	\N	\N	\N	\N	6238.0	0.0	150.0	2.0	\N	\N	\N	1	\N	\N	3
1168	PROPAFENONA 150MG TABLETA - LAB. :SANOFI	1	2016-12-16 18:46:14.999265	2016-12-16 18:46:14.999265	\N	\N	\N	\N	\N	374.0	0.0	150.0	3.0	\N	\N	\N	1	\N	\N	3
1169	PROPOFOL 20ML AMPOLLA - LAB. :CLARIS LIFESCIENCES	1	2016-12-16 18:46:15.003969	2016-12-16 18:46:15.003969	\N	\N	\N	\N	\N	5644.0	0.0	150.0	6.0	\N	\N	\N	1	\N	\N	3
1170	PROPRANOLOL CLORHIDRATO 40MG TABLETA - LAB. :	1	2016-12-16 18:46:15.008065	2016-12-16 18:46:15.008065	\N	\N	\N	\N	\N	112.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
1171	PROTAMINA SULFATO 71.5MG/5ML 71.5MG/5ML	1	2016-12-16 18:46:15.012428	2016-12-16 18:46:15.012428	\N	\N	\N	\N	\N	16598.0	0.0	150.0	23.0	\N	\N	\N	1	\N	\N	3
1172	QUETIAPINA 25MG TABLETA - LAB. :TECNOQUIMICAS S.	1	2016-12-16 18:46:15.017044	2016-12-16 18:46:15.017044	\N	\N	\N	\N	\N	185.0	0.0	150.0	16.0	\N	\N	\N	1	\N	\N	3
1173	RACEPINEFRINA USP 0.5ML VIAL - LAB. :DISTRIBUIDORA	1	2016-12-16 18:46:15.020986	2016-12-16 18:46:15.020986	\N	\N	\N	\N	\N	9742.0	0.0	150.0	4.0	\N	\N	\N	1	\N	\N	3
1174	RANITIDINA 150MG TABLETA - LAB. :BCN MEDICAL S.A.	1	2016-12-16 18:46:15.025387	2016-12-16 18:46:15.025387	\N	\N	\N	\N	\N	34.0	0.0	150.0	50.0	\N	\N	\N	1	\N	\N	3
1175	RANITIDINA 50MG/2ML AMPOLLA - LAB. :GENFAR SA	1	2016-12-16 18:46:15.030296	2016-12-16 18:46:15.030296	\N	\N	\N	\N	\N	248.0	0.0	150.0	19.0	\N	\N	\N	1	\N	\N	3
1176	RANITIDINA 150MG TABLETA - LAB. :GENFAR SA	1	2016-12-16 18:46:15.034652	2016-12-16 18:46:15.034652	\N	\N	\N	\N	\N	124.0	0.0	150.0	74.0	\N	\N	\N	1	\N	\N	3
1177	RECARGA TRH30 30MM EMPAQUE INDIVIDUAL UNIDAD -	1	2016-12-16 18:46:15.039068	2016-12-16 18:46:15.039068	\N	\N	\N	\N	\N	138891.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
1178	RECARGA TRT75 VERDE PARA GRAPADORA TLC75	1	2016-12-16 18:46:15.043369	2016-12-16 18:46:15.043369	\N	\N	\N	\N	\N	269158.0	0.0	150.0	3.0	\N	\N	\N	1	\N	\N	3
1179	REMIFENTANIL (ULTIVA) 2MG VIAL - LAB. :	1	2016-12-16 18:46:15.049073	2016-12-16 18:46:15.049073	\N	\N	\N	\N	\N	33540.0	0.0	150.0	6.0	\N	\N	\N	1	\N	\N	3
1180	RESINA INTERCAMBIO CATIONICO KELASSENS 15G SOBRE	1	2016-12-16 18:46:15.053866	2016-12-16 18:46:15.053866	\N	\N	\N	\N	\N	3325.0	0.0	150.0	7.0	\N	\N	\N	1	\N	\N	3
1181	RIFAMPICINA 300MG CAPSULA - LAB. :TECNOQUIMICAS	1	2016-12-16 18:46:15.058307	2016-12-16 18:46:15.058307	\N	\N	\N	\N	\N	817.0	0.0	150.0	19.0	\N	\N	\N	1	\N	\N	3
1182	RISPERIDONA 2MG TABLETA - LAB. :TECNOQUIMICAS S.A.	1	2016-12-16 18:46:15.063591	2016-12-16 18:46:15.063591	\N	\N	\N	\N	\N	1290.0	0.0	150.0	4.0	\N	\N	\N	1	\N	\N	3
1183	RITUXIMAB (MABTHERA) 100MG/10ML AMPOLLA - LAB. :	1	2016-12-16 18:46:15.068592	2016-12-16 18:46:15.068592	\N	\N	\N	\N	\N	562227.0	0.0	150.0	3.0	\N	\N	\N	1	\N	\N	3
1184	RIVAROXABAN (XARELTO) 15MG TABLETA - LAB. :BAYER	1	2016-12-16 18:46:15.072773	2016-12-16 18:46:15.072773	\N	\N	\N	\N	\N	4557.0	0.0	150.0	7.0	\N	\N	\N	1	\N	\N	3
1185	RIVAROXABAN (XARELTO) 20MG TABLETA - LAB. :BAYER	1	2016-12-16 18:46:15.079835	2016-12-16 18:46:15.079835	\N	\N	\N	\N	\N	5061.0	0.0	150.0	2.0	\N	\N	\N	1	\N	\N	3
1186	ROSUVASTATINA 20MG TABLETA - LAB. :GENFAR SA	1	2016-12-16 18:46:15.08534	2016-12-16 18:46:15.08534	\N	\N	\N	\N	\N	663.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
1187	ROTOR DE GUIA UNIVERSAL TD500-WORLD MEDICAL S.A.	1	2016-12-16 18:46:15.091786	2016-12-16 18:46:15.091786	\N	\N	\N	\N	\N	24592.0	0.0	150.0	9.0	\N	\N	\N	1	\N	\N	3
1188	SACCHAROMYCES BOURLARDII (FLORATIL) 250MG SOBRE	1	2016-12-16 18:46:15.096176	2016-12-16 18:46:15.096176	\N	\N	\N	\N	\N	3949.0	0.0	150.0	5.0	\N	\N	\N	1	\N	\N	3
1189	SALBUTAMOL (ASTHALIN HFA) 100MCG ENVASE DE	1	2016-12-16 18:46:15.100948	2016-12-16 18:46:15.100948	\N	\N	\N	\N	\N	2959.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
1190	SALBUTAMOL (VENTILAN) 5MG FRASCO - LAB. :	1	2016-12-16 18:46:15.105672	2016-12-16 18:46:15.105672	\N	\N	\N	\N	\N	9061.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
1191	SECNIDAZOL 500MG TABLETA - LAB. :GENFAR SA	1	2016-12-16 18:46:15.110038	2016-12-16 18:46:15.110038	\N	\N	\N	\N	\N	900.0	0.0	150.0	2.0	\N	\N	\N	1	\N	\N	3
1192	SECNIDAZOL 500MG TABLETA - LAB. :SANOFI WINTHROP	1	2016-12-16 18:46:15.115423	2016-12-16 18:46:15.115423	\N	\N	\N	\N	\N	800.0	0.0	150.0	2.0	\N	\N	\N	1	\N	\N	3
1193	SEDA 0 SH K834 JYJ EMPAQUE INDIVIDUAL UNIDAD	1	2016-12-16 18:46:15.120378	2016-12-16 18:46:15.120378	\N	\N	\N	\N	\N	4345.0	0.0	150.0	10.0	\N	\N	\N	1	\N	\N	3
1194	SEDA 0 REF 424 CT1 75CM EMPAQUE INDIVIDUAL	1	2016-12-16 18:46:15.126231	2016-12-16 18:46:15.126231	\N	\N	\N	\N	\N	5325.0	0.0	150.0	2.0	\N	\N	\N	1	\N	\N	3
1195	SEDA 1 NEGRA 10X75 SIN AGUJA LIGADURA SA87T	1	2016-12-16 18:46:15.131158	2016-12-16 18:46:15.131158	\N	\N	\N	\N	\N	7061.0	0.0	150.0	11.0	\N	\N	\N	1	\N	\N	3
1196	SEDA 2-0 NEGRA 45 SC26 C. GENERAL 185T EMPAQUE	1	2016-12-16 18:46:15.135785	2016-12-16 18:46:15.135785	\N	\N	\N	\N	\N	3075.0	0.0	150.0	8.0	\N	\N	\N	1	\N	\N	3
1197	SEDA 2-0 NEGRA 75 SH GASTRO K833H EMPAQUE	1	2016-12-16 18:46:15.139956	2016-12-16 18:46:15.139956	\N	\N	\N	\N	\N	4220.0	0.0	150.0	5.0	\N	\N	\N	1	\N	\N	3
1198	SEDA 3-0 NEGRA 75 SH GASTRO K832H EMPAQUE	1	2016-12-16 18:46:15.144154	2016-12-16 18:46:15.144154	\N	\N	\N	\N	\N	4060.0	0.0	150.0	2.0	\N	\N	\N	1	\N	\N	3
1199	SEDA 4-0 NEGRA 75 SH GASTRO K831H EMPAQUE	1	2016-12-16 18:46:15.148693	2016-12-16 18:46:15.148693	\N	\N	\N	\N	\N	4131.0	0.0	150.0	10.0	\N	\N	\N	1	\N	\N	3
1200	SENSOR DE TEMPERATURA BAXTER EMPAQUE INDIVIDUAL	1	2016-12-16 18:46:15.153425	2016-12-16 18:46:15.153425	\N	\N	\N	\N	\N	23585.0	0.0	150.0	2.0	\N	\N	\N	1	\N	\N	3
1201	SENSOR TEMPERATURA BD EMPAQUE INDIVIDUAL	1	2016-12-16 18:46:15.157828	2016-12-16 18:46:15.157828	\N	\N	\N	\N	\N	42874.0	0.0	150.0	2.0	\N	\N	\N	1	\N	\N	3
1202	SERTRALINA 50MG TABLETA - LAB. :GENFAR SA	1	2016-12-16 18:46:15.162409	2016-12-16 18:46:15.162409	\N	\N	\N	\N	\N	155.0	0.0	150.0	7.0	\N	\N	\N	1	\N	\N	3
1203	SET TUBERIA ADULTO SIN FILTRO SET TUBIX32A	1	2016-12-16 18:46:15.166789	2016-12-16 18:46:15.166789	\N	\N	\N	\N	\N	401747.0	0.0	150.0	3.0	\N	\N	\N	1	\N	\N	3
1204	SET TUBIX BULBO AISLADOR DE PRESION EMPAQUE	1	2016-12-16 18:46:15.171001	2016-12-16 18:46:15.171001	\N	\N	\N	\N	\N	89144.0	0.0	150.0	7.0	\N	\N	\N	1	\N	\N	3
1205	SEVOFLURANO (SEVORANE) 250ML FRASCO - LAB. :	1	2016-12-16 18:46:15.175262	2016-12-16 18:46:15.175262	\N	\N	\N	\N	\N	1082.0	0.0	150.0	164.0	\N	\N	\N	1	\N	\N	3
1206	SEVOFLURANO 250ML FRASCO - LAB. :LABORATORIOS	1	2016-12-16 18:46:15.179503	2016-12-16 18:46:15.179503	\N	\N	\N	\N	\N	1371.0	0.0	150.0	50.0	\N	\N	\N	1	\N	\N	3
1207	SILDENAFIL 50MG TABLETA - LAB. :GENFAR SA	1	2016-12-16 18:46:15.183859	2016-12-16 18:46:15.183859	\N	\N	\N	\N	\N	106.0	0.0	150.0	5.0	\N	\N	\N	1	\N	\N	3
1208	SILVERCELL NO ADHERENTE 11X11 HIDROALGINATO -	1	2016-12-16 18:46:15.188616	2016-12-16 18:46:15.188616	\N	\N	\N	\N	\N	32090.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
1209	SISTEMA CERRADO DE SUCCION NO.14 COVIDIEN	1	2016-12-16 18:46:15.193341	2016-12-16 18:46:15.193341	\N	\N	\N	\N	\N	55629.0	0.0	150.0	2.0	\N	\N	\N	1	\N	\N	3
1210	SISTEMA DE DERIVACION VENTRICULOSTOMIA REF 26040	1	2016-12-16 18:46:15.19951	2016-12-16 18:46:15.19951	\N	\N	\N	\N	\N	1224300.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
1211	SISTEMA DE LIBERACION 9ITV09F45/80 EMPAQUE	1	2016-12-16 18:46:15.203886	2016-12-16 18:46:15.203886	\N	\N	\N	\N	\N	1400000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
1212	SISTEMA DRENAJE TORAXICO TELEFLEX MEDICAL	1	2016-12-16 18:46:15.208092	2016-12-16 18:46:15.208092	\N	\N	\N	\N	\N	120150.0	0.0	150.0	7.0	\N	\N	\N	1	\N	\N	3
1213	SISTEMA LIBERACION OCCLUDER 10F HYPERION C-DS-A-	1	2016-12-16 18:46:15.212254	2016-12-16 18:46:15.212254	\N	\N	\N	\N	\N	700000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
1214	SISTEMA LIBERACION OCCLUDER 12F HYPERION C-DS-A-	1	2016-12-16 18:46:15.2164	2016-12-16 18:46:15.2164	\N	\N	\N	\N	\N	700000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
1215	SISTEMA LIBERACION OCCLUDER 9F HYPERION C-DS-A-	1	2016-12-16 18:46:15.220578	2016-12-16 18:46:15.220578	\N	\N	\N	\N	\N	700000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
1216	SISTEMA LIBERADOR AXIUM 03DI 1 5 GB EMPAQUE	1	2016-12-16 18:46:15.22508	2016-12-16 18:46:15.22508	\N	\N	\N	\N	\N	206294.0	0.0	150.0	2.0	\N	\N	\N	1	\N	\N	3
1217	SISTEMA OCLUSOR HYPERION 19MM C-ASD-19 COLM	1	2016-12-16 18:46:15.229379	2016-12-16 18:46:15.229379	\N	\N	\N	\N	\N	10300000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
1218	SISTEMA OCLUSOR HYPERION 24MM C-PFO-24 COLM	1	2016-12-16 18:46:15.233674	2016-12-16 18:46:15.233674	\N	\N	\N	\N	\N	10300000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
1219	SISTEMA OCLUSOR HYPERION 30MM C-PFO-30	1	2016-12-16 18:46:15.237953	2016-12-16 18:46:15.237953	\N	\N	\N	\N	\N	10300000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
1220	SISTEMA OCLUSOR HYPERION 34MM C-PFO-34 COLM	1	2016-12-16 18:46:15.242971	2016-12-16 18:46:15.242971	\N	\N	\N	\N	\N	10300000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
1221	SNARE KIT VASCULAR ATRIEVE 2-4MM 381003004 RP	1	2016-12-16 18:46:15.248002	2016-12-16 18:46:15.248002	\N	\N	\N	\N	\N	2030000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
1222	SODIO FOSFATO TRAVAD ORAL 6G/16G FRASCO - LAB. :	1	2016-12-16 18:46:15.252161	2016-12-16 18:46:15.252161	\N	\N	\N	\N	\N	15100.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
1223	SODIO NITROPRUSIATO 50MG VIAL - LAB. :	1	2016-12-16 18:46:15.256241	2016-12-16 18:46:15.256241	\N	\N	\N	\N	\N	8251.0	0.0	150.0	34.0	\N	\N	\N	1	\N	\N	3
1224	SODIO NITROPRUSIATO 50MG VIAL - LAB. :HOSPIRA	1	2016-12-16 18:46:15.260788	2016-12-16 18:46:15.260788	\N	\N	\N	\N	\N	9746.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
1225	SOFSILK (SEDA NEGRA) 0 S/A- REFS316 EMPAQUE	1	2016-12-16 18:46:15.26526	2016-12-16 18:46:15.26526	\N	\N	\N	\N	\N	7974.0	0.0	150.0	3.0	\N	\N	\N	1	\N	\N	3
1226	SOFSILK (SEDA NEGRA)0 V-20- REFGS834 EMPAQUE	1	2016-12-16 18:46:15.270205	2016-12-16 18:46:15.270205	\N	\N	\N	\N	\N	4707.0	0.0	150.0	35.0	\N	\N	\N	1	\N	\N	3
1227	SOFSILK (SEDA NEGRA)1 S/A- REFS317 EMPAQUE	1	2016-12-16 18:46:15.275138	2016-12-16 18:46:15.275138	\N	\N	\N	\N	\N	8100.0	0.0	150.0	7.0	\N	\N	\N	1	\N	\N	3
1228	SOFSILK (SEDA NEGRA)2/0 C-15- REFSS685 EMPAQUE	1	2016-12-16 18:46:15.279866	2016-12-16 18:46:15.279866	\N	\N	\N	\N	\N	4933.0	0.0	150.0	10.0	\N	\N	\N	1	\N	\N	3
1229	SOFSILK (SEDA NEGRA)2/0 S/A - REFS305 EMPAQUE	1	2016-12-16 18:46:15.284137	2016-12-16 18:46:15.284137	\N	\N	\N	\N	\N	8100.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
1230	SOFSILK (SEDA NEGRA)4/0 S/A- REFS303 EMPAQUE	1	2016-12-16 18:46:15.2882	2016-12-16 18:46:15.2882	\N	\N	\N	\N	\N	5263.0	0.0	150.0	7.0	\N	\N	\N	1	\N	\N	3
1231	SOFSILK (SEDA NEGRA) 4/0 CV-23- REFVS871 EMPAQUE	1	2016-12-16 18:46:15.292918	2016-12-16 18:46:15.292918	\N	\N	\N	\N	\N	6772.0	0.0	150.0	12.0	\N	\N	\N	1	\N	\N	3
1232	SOFSILK 0 V-20 REF SP24410 EMPAQUE INDIVIDUAL	1	2016-12-16 18:46:15.297464	2016-12-16 18:46:15.297464	\N	\N	\N	\N	\N	4750.0	0.0	150.0	29.0	\N	\N	\N	1	\N	\N	3
1233	SOMAZINA-CITICOLINA AMPOLLA 500MG AMPOLLA -	1	2016-12-16 18:46:15.302195	2016-12-16 18:46:15.302195	\N	\N	\N	\N	\N	24278.0	0.0	150.0	16.0	\N	\N	\N	1	\N	\N	3
1234	SONDA DE ALIMENTACION NASOYEYUNAL 12FR COV	1	2016-12-16 18:46:15.309275	2016-12-16 18:46:15.309275	\N	\N	\N	\N	\N	63973.0	0.0	150.0	3.0	\N	\N	\N	1	\N	\N	3
1235	SONDA DE TORAX 32 FR SHERLEG EMPAQUE INDIVIDUAL	1	2016-12-16 18:46:15.313755	2016-12-16 18:46:15.313755	\N	\N	\N	\N	\N	2808.0	0.0	150.0	4.0	\N	\N	\N	1	\N	\N	3
1236	SONDA DE TORAX 36 FR SHERLEG 1113 EMPAQUE	1	2016-12-16 18:46:15.31811	2016-12-16 18:46:15.31811	\N	\N	\N	\N	\N	5622.0	0.0	150.0	7.0	\N	\N	\N	1	\N	\N	3
1237	SONDA FOLEY 14FR DE 2 VIAS ALLMED EMPAQUE	1	2016-12-16 18:46:15.322896	2016-12-16 18:46:15.322896	\N	\N	\N	\N	\N	1659.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
1238	SONDA FOLEY 16FR DE 2 VIAS BALON 5CC ALLMED	1	2016-12-16 18:46:15.327203	2016-12-16 18:46:15.327203	\N	\N	\N	\N	\N	2021.0	0.0	150.0	4.0	\N	\N	\N	1	\N	\N	3
1239	SONDA FOLEY 18FR DE 2 VIAS BALON 5CC ALLMED	1	2016-12-16 18:46:15.331302	2016-12-16 18:46:15.331302	\N	\N	\N	\N	\N	1865.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
1240	SONDA FOLEY 20FR 3 VIAS ALLMED EMPAQUE	1	2016-12-16 18:46:15.335371	2016-12-16 18:46:15.335371	\N	\N	\N	\N	\N	1734.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
1241	SONDA FOLEY 20FR DE 2 VIAS BALON 5CC ALLMED	1	2016-12-16 18:46:15.340129	2016-12-16 18:46:15.340129	\N	\N	\N	\N	\N	1632.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
1242	SONDA FOLEY 22FR 3 VIAS ALLMED EMPAQUE	1	2016-12-16 18:46:15.344304	2016-12-16 18:46:15.344304	\N	\N	\N	\N	\N	2214.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
1243	SONDA FOLEY 22FR 3 VIAS SUNMED EMPAQUE	1	2016-12-16 18:46:15.348392	2016-12-16 18:46:15.348392	\N	\N	\N	\N	\N	1783.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
1244	SONDA LEVIN S.N.G. S. - UN LUMEN FR. 12-REF: SH1148	1	2016-12-16 18:46:15.352861	2016-12-16 18:46:15.352861	\N	\N	\N	\N	\N	692.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
1245	SONDA LEVIN S.N.G. S. - UN LUMEN FR. 14-REF: SH1149	1	2016-12-16 18:46:15.357476	2016-12-16 18:46:15.357476	\N	\N	\N	\N	\N	835.0	0.0	150.0	2.0	\N	\N	\N	1	\N	\N	3
1246	SONDA LEVIN S.N.G. S. - UN LUMEN FR. 16 EMPAQUE	1	2016-12-16 18:46:15.373853	2016-12-16 18:46:15.373853	\N	\N	\N	\N	\N	692.0	0.0	150.0	5.0	\N	\N	\N	1	\N	\N	3
1247	SONDA LEVIN S.N.G. S. - UN LUMEN FR. 18 EMPAQUE	1	2016-12-16 18:46:15.378886	2016-12-16 18:46:15.378886	\N	\N	\N	\N	\N	850.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
1248	SONDA LEVIN S.N.G. S. - UN LUMEN FR. 20 EMPAQUE	1	2016-12-16 18:46:15.38445	2016-12-16 18:46:15.38445	\N	\N	\N	\N	\N	750.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
1249	SONDA NELATON - SILICONIZADA FR. 10-REF: SH1171	1	2016-12-16 18:46:15.389461	2016-12-16 18:46:15.389461	\N	\N	\N	\N	\N	423.0	0.0	150.0	2.0	\N	\N	\N	1	\N	\N	3
1250	SONDA NELATON - SILICONIZADA FR. 12-REF: SH1172	1	2016-12-16 18:46:15.39387	2016-12-16 18:46:15.39387	\N	\N	\N	\N	\N	389.0	0.0	150.0	4.0	\N	\N	\N	1	\N	\N	3
1251	SONDA NELATON - SILICONIZADA FR. 14-REF: SH1173	1	2016-12-16 18:46:15.398291	2016-12-16 18:46:15.398291	\N	\N	\N	\N	\N	425.0	0.0	150.0	4.0	\N	\N	\N	1	\N	\N	3
1252	SONDA NELATON - SILICONIZADA FR. 16-REF: SH1174	1	2016-12-16 18:46:15.403041	2016-12-16 18:46:15.403041	\N	\N	\N	\N	\N	457.0	0.0	150.0	2.0	\N	\N	\N	1	\N	\N	3
1253	SONDA NELATON - SILICONIZADA FR. 6-REF: SH1169	1	2016-12-16 18:46:15.407459	2016-12-16 18:46:15.407459	\N	\N	\N	\N	\N	474.0	0.0	150.0	3.0	\N	\N	\N	1	\N	\N	3
1254	SONDA NELATON MEDEX - SILICONIZADA FR. 14	1	2016-12-16 18:46:15.411908	2016-12-16 18:46:15.411908	\N	\N	\N	\N	\N	493.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
1255	SONDA NELATON MEDEX - SILICONIZADA FR. 16	1	2016-12-16 18:46:15.416232	2016-12-16 18:46:15.416232	\N	\N	\N	\N	\N	486.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
1256	SONDA NELATON MEDEX - SILICONIZADA FR. 18	1	2016-12-16 18:46:15.420714	2016-12-16 18:46:15.420714	\N	\N	\N	\N	\N	637.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
1257	SONDA NELATON MEDEX - SILICONIZADA FR. 8 EMPAQUE	1	2016-12-16 18:46:15.425194	2016-12-16 18:46:15.425194	\N	\N	\N	\N	\N	499.0	0.0	150.0	2.0	\N	\N	\N	1	\N	\N	3
1258	SONDA PARA SUCCIÒN S. FR. 10-REF: SH1131 EMPAQUE	1	2016-12-16 18:46:15.429743	2016-12-16 18:46:15.429743	\N	\N	\N	\N	\N	1118.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
1259	SONDA PARA SUCCIÒN S. FR. 12-REF: SH1132 EMPAQUE	1	2016-12-16 18:46:15.434284	2016-12-16 18:46:15.434284	\N	\N	\N	\N	\N	1254.0	0.0	150.0	5.0	\N	\N	\N	1	\N	\N	3
1260	SONDA PARA SUCCION S. FR. 14-REF: SH1133 EMPAQUE	1	2016-12-16 18:46:15.439	2016-12-16 18:46:15.439	\N	\N	\N	\N	\N	1065.0	0.0	150.0	50.0	\N	\N	\N	1	\N	\N	3
1261	STENT ASSURANT COBALT 6.0MM X 20MM ASC620L MED	1	2016-12-16 18:46:15.443289	2016-12-16 18:46:15.443289	\N	\N	\N	\N	\N	1900000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
1262	STENT ASSURANT COBALT 6.0MM X 30MM ASC630S MED	1	2016-12-16 18:46:15.450114	2016-12-16 18:46:15.450114	\N	\N	\N	\N	\N	1900000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
1263	STENT ASSURANT COBALT 6.0MM X 40MM MED UNIDAD	1	2016-12-16 18:46:15.459272	2016-12-16 18:46:15.459272	\N	\N	\N	\N	\N	1900000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
1264	STENT ASSURANT COBALT 9.0MM X 60MM ASC960S MED	1	2016-12-16 18:46:15.464822	2016-12-16 18:46:15.464822	\N	\N	\N	\N	\N	1900000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
1265	STENT ASSURANT-COBALT 7,0MMX60MM 80CM MED	1	2016-12-16 18:46:15.474111	2016-12-16 18:46:15.474111	\N	\N	\N	\N	\N	1900000.0	0.0	150.0	2.0	\N	\N	\N	1	\N	\N	3
1266	STENT ASSURANT-COBALT 8.0MMX30MM MED UNIDAD	1	2016-12-16 18:46:15.47897	2016-12-16 18:46:15.47897	\N	\N	\N	\N	\N	1900000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
1267	STENT AUTOEXPANDIBLE WALLSTENT 18MMX60 10 FR	1	2016-12-16 18:46:15.483468	2016-12-16 18:46:15.483468	\N	\N	\N	\N	\N	1517025.0	0.0	150.0	2.0	\N	\N	\N	1	\N	\N	3
1268	STENT COARTACION CP STENT CP8Z39 EMPAQUE	1	2016-12-16 18:46:15.488172	2016-12-16 18:46:15.488172	\N	\N	\N	\N	\N	4400000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
1269	STENT DE COARTACION CP8Z45 EMPAQUE INDIVIDUAL	1	2016-12-16 18:46:15.492785	2016-12-16 18:46:15.492785	\N	\N	\N	\N	\N	4400000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
1270	STENT ENTERPRISE 4,5MM X 37MM ENC453712 JYJ	1	2016-12-16 18:46:15.498862	2016-12-16 18:46:15.498862	\N	\N	\N	\N	\N	6500000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
1271	STENT ENTERPRISE 4.5MM X 22MM ENC452212 JYJ	1	2016-12-16 18:46:15.507227	2016-12-16 18:46:15.507227	\N	\N	\N	\N	\N	6408409.0	0.0	150.0	2.0	\N	\N	\N	1	\N	\N	3
1272	STENT ENTERPRISE 4.5MM X 28MM ENC452812 JYJ	1	2016-12-16 18:46:15.512057	2016-12-16 18:46:15.512057	\N	\N	\N	\N	\N	6532500.0	0.0	150.0	3.0	\N	\N	\N	1	\N	\N	3
1273	STENT ENTERPRISE 4.5X14 ENC451412 JYJ EMPAQUE	1	2016-12-16 18:46:15.518289	2016-12-16 18:46:15.518289	\N	\N	\N	\N	\N	6586667.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
1274	STENT ERES25008X RESOLUTE 2.50X8MM RX MED	1	2016-12-16 18:46:15.522866	2016-12-16 18:46:15.522866	\N	\N	\N	\N	\N	700000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
1275	STENT ERES27508X RESOLUTE 2.75X8MM RX UNIDAD	1	2016-12-16 18:46:15.528165	2016-12-16 18:46:15.528165	\N	\N	\N	\N	\N	700000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
1276	STENT ERES30015X RESOLUTE 3.00X15MM RX MED	1	2016-12-16 18:46:15.532857	2016-12-16 18:46:15.532857	\N	\N	\N	\N	\N	700000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
1277	STENT ERES30030X RESOLUTE 3.00X30MM RX MED	1	2016-12-16 18:46:15.543387	2016-12-16 18:46:15.543387	\N	\N	\N	\N	\N	700000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
1278	STENT ERES30038X RESAV100 3.00X38MM RX MED	1	2016-12-16 18:46:15.548252	2016-12-16 18:46:15.548252	\N	\N	\N	\N	\N	700000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
1279	STENT ERES35009X RESOLUTE 3.50X9MM RX MED	1	2016-12-16 18:46:15.553244	2016-12-16 18:46:15.553244	\N	\N	\N	\N	\N	700000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
1280	STENT ERES35012X RESOLUTE 3.50X12MM RX MED	1	2016-12-16 18:46:15.558072	2016-12-16 18:46:15.558072	\N	\N	\N	\N	\N	700000.0	0.0	150.0	2.0	\N	\N	\N	1	\N	\N	3
1281	STENT ERES35015X RESOLUTE 3.50X15MM RX MED	1	2016-12-16 18:46:15.562389	2016-12-16 18:46:15.562389	\N	\N	\N	\N	\N	700000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
1282	STENT ERES35038X RESAV100 3.50X38MM RX MED	1	2016-12-16 18:46:15.56704	2016-12-16 18:46:15.56704	\N	\N	\N	\N	\N	700000.0	0.0	150.0	2.0	\N	\N	\N	1	\N	\N	3
1283	STENT ERES40012X RESOLUTE 4.00X12MM RX MED	1	2016-12-16 18:46:15.571842	2016-12-16 18:46:15.571842	\N	\N	\N	\N	\N	700000.0	0.0	150.0	2.0	\N	\N	\N	1	\N	\N	3
1284	STENT ERES40015X RESOLUTE 4.00X15MM RX MED	1	2016-12-16 18:46:15.579158	2016-12-16 18:46:15.579158	\N	\N	\N	\N	\N	700000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
1285	STENT ERES40018X RESOLUTE 4.00X18MM RX MED	1	2016-12-16 18:46:15.583663	2016-12-16 18:46:15.583663	\N	\N	\N	\N	\N	700000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
1286	STENT ERES40024X RESOLUTE 4.00X24MM RX MED	1	2016-12-16 18:46:15.588203	2016-12-16 18:46:15.588203	\N	\N	\N	\N	\N	700000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
1287	STENT ERES40030X RESOLUTE 4.00X30MM RX MED	1	2016-12-16 18:46:15.594701	2016-12-16 18:46:15.594701	\N	\N	\N	\N	\N	700000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
1288	STENT ERES40038X RESAV100 4.00X38MM RX MED	1	2016-12-16 18:46:15.599329	2016-12-16 18:46:15.599329	\N	\N	\N	\N	\N	700000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
1289	STENT INTEGRITY 2 50X18 INT25018X	1	2016-12-16 18:46:15.603714	2016-12-16 18:46:15.603714	\N	\N	\N	\N	\N	535000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
1290	STENT INTEGRITY 2 50X30 INT25030X	1	2016-12-16 18:46:15.609904	2016-12-16 18:46:15.609904	\N	\N	\N	\N	\N	535000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
1291	STENT INTEGRITY 2 5MMX22MM INT25022X	1	2016-12-16 18:46:15.614408	2016-12-16 18:46:15.614408	\N	\N	\N	\N	\N	535000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
1292	STENT INTEGRITY 2 75X08 INT27508	1	2016-12-16 18:46:15.618992	2016-12-16 18:46:15.618992	\N	\N	\N	\N	\N	535000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
1293	STENT INTEGRITY 2 75X14 INT27514X	1	2016-12-16 18:46:15.623921	2016-12-16 18:46:15.623921	\N	\N	\N	\N	\N	535000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
1294	STENT INTEGRITY 2.25 X 18 INT22518X	1	2016-12-16 18:46:15.628301	2016-12-16 18:46:15.628301	\N	\N	\N	\N	\N	535000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
1295	STENT INTEGRITY 3 50X12 INT35012X	1	2016-12-16 18:46:15.633001	2016-12-16 18:46:15.633001	\N	\N	\N	\N	\N	535000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
1296	STENT INTEGRITY 4 00X18 INT40018X	1	2016-12-16 18:46:15.637324	2016-12-16 18:46:15.637324	\N	\N	\N	\N	\N	535000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
1297	STENT JOSTENT GRAFTMASTER 3.50X19 1012818-19 -	1	2016-12-16 18:46:15.641774	2016-12-16 18:46:15.641774	\N	\N	\N	\N	\N	2400000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
1298	STENT OMEGA 3 50X 32 39138 3235 BSC EMPAQUE	1	2016-12-16 18:46:15.646153	2016-12-16 18:46:15.646153	\N	\N	\N	\N	\N	900000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
1299	STENT PERIF HIPOCAMPUS 5.0MM X 20MM	1	2016-12-16 18:46:15.650447	2016-12-16 18:46:15.650447	\N	\N	\N	\N	\N	1900000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
1300	STENT PERIFE PROTEGE EVER FLEX 6MMX200MM	1	2016-12-16 18:46:15.654844	2016-12-16 18:46:15.654844	\N	\N	\N	\N	\N	1811375.0	0.0	150.0	2.0	\N	\N	\N	1	\N	\N	3
1301	STENT PERIFERICO PROTEGE EVER FLEX 6MMX150MM	1	2016-12-16 18:46:15.66289	2016-12-16 18:46:15.66289	\N	\N	\N	\N	\N	1913000.0	0.0	150.0	2.0	\N	\N	\N	1	\N	\N	3
1302	STENT PERIFERICO PROTEGE EVER FLEX 7MMX150CM	1	2016-12-16 18:46:15.668577	2016-12-16 18:46:15.668577	\N	\N	\N	\N	\N	1913000.0	0.0	150.0	2.0	\N	\N	\N	1	\N	\N	3
1303	STENT PERIFERICO PROTEGE EVERFLEX 6MMX100CM	1	2016-12-16 18:46:15.678187	2016-12-16 18:46:15.678187	\N	\N	\N	\N	\N	1913000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
1304	STENT PROTEGE 6MM X 80MM PRP35-06-080-120 -	1	2016-12-16 18:46:15.682284	2016-12-16 18:46:15.682284	\N	\N	\N	\N	\N	1913000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
1305	STENT PROTEGE 7MM X 80MM PRP35-07-080-120 MED	1	2016-12-16 18:46:15.691777	2016-12-16 18:46:15.691777	\N	\N	\N	\N	\N	1913000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
1306	STENT PROTEGE EVERFLEX 7MM 200MM PRP35DR-07-	1	2016-12-16 18:46:15.696	2016-12-16 18:46:15.696	\N	\N	\N	\N	\N	1913000.0	0.0	150.0	2.0	\N	\N	\N	1	\N	\N	3
1307	STENT REOSLUTE INTEGRITY 4 00X09 RSINT40009X	1	2016-12-16 18:46:15.705325	2016-12-16 18:46:15.705325	\N	\N	\N	\N	\N	2000000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
1308	STENT RESOLUTE INTEGRITY 2 25X14 RSINT22514X	1	2016-12-16 18:46:15.709488	2016-12-16 18:46:15.709488	\N	\N	\N	\N	\N	1800000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
1309	STENT RESOLUTE INTEGRITY 2 25X30 RSINT22530X	1	2016-12-16 18:46:15.714028	2016-12-16 18:46:15.714028	\N	\N	\N	\N	\N	2000000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
1310	STENT RESOLUTE INTEGRITY 2 50X12 RSINT25012X	1	2016-12-16 18:46:15.721834	2016-12-16 18:46:15.721834	\N	\N	\N	\N	\N	2000000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
1311	STENT RESOLUTE INTEGRITY 2 50X14 RSINT25014X	1	2016-12-16 18:46:15.726255	2016-12-16 18:46:15.726255	\N	\N	\N	\N	\N	2000000.0	0.0	150.0	2.0	\N	\N	\N	1	\N	\N	3
1312	STENT RESOLUTE INTEGRITY 2 50X26 RSINT25026X	1	2016-12-16 18:46:15.735056	2016-12-16 18:46:15.735056	\N	\N	\N	\N	\N	1900000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
1313	STENT RESOLUTE INTEGRITY 3 00X09 RSINT30009X	1	2016-12-16 18:46:15.739585	2016-12-16 18:46:15.739585	\N	\N	\N	\N	\N	2000000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
1314	STENT RESOLUTE INTEGRITY 300X22 RSINT30022X	1	2016-12-16 18:46:15.744292	2016-12-16 18:46:15.744292	\N	\N	\N	\N	\N	2000000.0	0.0	150.0	2.0	\N	\N	\N	1	\N	\N	3
1315	STENT RESOLUTE INTEGRITY 4 00X18 RSINT40018X	1	2016-12-16 18:46:15.751092	2016-12-16 18:46:15.751092	\N	\N	\N	\N	\N	2000000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
1316	STENT RESOLUTE INTEGRITY 4 00X22 RSINT40022X	1	2016-12-16 18:46:15.755316	2016-12-16 18:46:15.755316	\N	\N	\N	\N	\N	2000000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
1317	STENT RESOLUTE INTEGRITY 4 00X26 RSINT40026X	1	2016-12-16 18:46:15.762236	2016-12-16 18:46:15.762236	\N	\N	\N	\N	\N	2000000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
1318	STENT RESOLUTE INTEGRITY 4 00X30 RSINT40030X	1	2016-12-16 18:46:15.767117	2016-12-16 18:46:15.767117	\N	\N	\N	\N	\N	2000000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
1319	STENT RESOLUTE INTEGRITY RSINT35015X MICROTRAC	1	2016-12-16 18:46:15.771475	2016-12-16 18:46:15.771475	\N	\N	\N	\N	\N	1866667.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
1320	STENT RESOLUTE ONYX 2,50 X 08 RONYX25008X MED	1	2016-12-16 18:46:15.775964	2016-12-16 18:46:15.775964	\N	\N	\N	\N	\N	2000000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
1321	STENT RESOLUTE ONYX 2,50 X 15 RONYX25015X MED	1	2016-12-16 18:46:15.780347	2016-12-16 18:46:15.780347	\N	\N	\N	\N	\N	1600000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
1322	STENT RESOLUTE ONYX 2,50 X 18 RONYX25018X MED	1	2016-12-16 18:46:15.784629	2016-12-16 18:46:15.784629	\N	\N	\N	\N	\N	1600000.0	0.0	150.0	2.0	\N	\N	\N	1	\N	\N	3
1323	STENT RESOLUTE ONYX 2,50 X 22 RONYX25022X MED	1	2016-12-16 18:46:15.792366	2016-12-16 18:46:15.792366	\N	\N	\N	\N	\N	1750000.0	0.0	150.0	2.0	\N	\N	\N	1	\N	\N	3
1324	STENT RESOLUTE ONYX 2,50 X 26 RONYX25026X MED	1	2016-12-16 18:46:15.797478	2016-12-16 18:46:15.797478	\N	\N	\N	\N	\N	1800000.0	0.0	150.0	2.0	\N	\N	\N	1	\N	\N	3
1325	STENT RESOLUTE ONYX 2,50 X 30 RONYX25030X	1	2016-12-16 18:46:15.806587	2016-12-16 18:46:15.806587	\N	\N	\N	\N	\N	1850000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
1326	STENT RESOLUTE ONYX 2,50 X 38 RONYX25038X	1	2016-12-16 18:46:15.811115	2016-12-16 18:46:15.811115	\N	\N	\N	\N	\N	2000000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
1327	STENT RESOLUTE ONYX 2,75 X 22 RONYX27522X MED	1	2016-12-16 18:46:15.815952	2016-12-16 18:46:15.815952	\N	\N	\N	\N	\N	2000000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
1328	STENT RESOLUTE ONYX 2,75 X 30 RONYX27530X MED	1	2016-12-16 18:46:15.820644	2016-12-16 18:46:15.820644	\N	\N	\N	\N	\N	1666667.0	0.0	150.0	2.0	\N	\N	\N	1	\N	\N	3
1329	STENT RESOLUTE ONYX 2,75 X 34 RONYX27534X	1	2016-12-16 18:46:15.825122	2016-12-16 18:46:15.825122	\N	\N	\N	\N	\N	1600000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
1330	STENT RESOLUTE ONYX 2.25 X 15 RONYX22515X MED	1	2016-12-16 18:46:15.830244	2016-12-16 18:46:15.830244	\N	\N	\N	\N	\N	1350000.0	0.0	150.0	2.0	\N	\N	\N	1	\N	\N	3
1331	STENT RESOLUTE ONYX 2.25 X 26 RONYX 22526X	1	2016-12-16 18:46:15.835501	2016-12-16 18:46:15.835501	\N	\N	\N	\N	\N	2000000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
1332	STENT RESOLUTE ONYX 3,00 X 15 RONYX30015X MED	1	2016-12-16 18:46:15.84009	2016-12-16 18:46:15.84009	\N	\N	\N	\N	\N	1500000.0	0.0	150.0	2.0	\N	\N	\N	1	\N	\N	3
1333	STENT RESOLUTE ONYX 3,00 X 30 RONYX30030X MED	1	2016-12-16 18:46:15.844672	2016-12-16 18:46:15.844672	\N	\N	\N	\N	\N	1900000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
1334	STENT RESOLUTE ONYX 3,50 X 15 RONYX35015X UND	1	2016-12-16 18:46:15.849064	2016-12-16 18:46:15.849064	\N	\N	\N	\N	\N	1500000.0	0.0	150.0	2.0	\N	\N	\N	1	\N	\N	3
1335	STENT RESOLUTE ONYX 3.00 X 26 RONYX30026X	1	2016-12-16 18:46:15.853849	2016-12-16 18:46:15.853849	\N	\N	\N	\N	\N	1640000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
1336	STENT RESOLUTE ONYX 3.50 X 12 RONYX35012X	1	2016-12-16 18:46:15.858131	2016-12-16 18:46:15.858131	\N	\N	\N	\N	\N	1933333.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
1337	STENT RESOLUTE ONYX 3.50 X 18 RONYX35018X MED	1	2016-12-16 18:46:15.862334	2016-12-16 18:46:15.862334	\N	\N	\N	\N	\N	1700000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
1338	STENT RESOLUTE ONYX 3.50 X 22 RONYX35022X MED	1	2016-12-16 18:46:15.867189	2016-12-16 18:46:15.867189	\N	\N	\N	\N	\N	1750000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
1339	STENT RESOLUTE ONYX 3.50 X 30 RONYX35030X MED	1	2016-12-16 18:46:15.871343	2016-12-16 18:46:15.871343	\N	\N	\N	\N	\N	1733333.0	0.0	150.0	2.0	\N	\N	\N	1	\N	\N	3
1340	STENT RESOLUTE ONYX 4,00 X 26 RONYX40026X MED	1	2016-12-16 18:46:15.875443	2016-12-16 18:46:15.875443	\N	\N	\N	\N	\N	1600000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
1341	STENT RESOLUTE ONYX 4.00 X 08 RONYX40008X MED	1	2016-12-16 18:46:15.880201	2016-12-16 18:46:15.880201	\N	\N	\N	\N	\N	2000000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
1342	STENT RONYX 3.50X 26RX RESOLUTE ONYX REF: 35026X	1	2016-12-16 18:46:15.884234	2016-12-16 18:46:15.884234	\N	\N	\N	\N	\N	1200000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
1343	STENT RONYX 4.00 X 18RX RESOLUTE ONYX REF:40018X	1	2016-12-16 18:46:15.88827	2016-12-16 18:46:15.88827	\N	\N	\N	\N	\N	1200000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
1344	STENT RONYX 4.00X22RX RESOLUTE ONYX REF:40022X	1	2016-12-16 18:46:15.892435	2016-12-16 18:46:15.892435	\N	\N	\N	\N	\N	1200000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
1345	STENT RONYX22518X RESOLUTE ONYX 2.25X18 MED	1	2016-12-16 18:46:15.897175	2016-12-16 18:46:15.897175	\N	\N	\N	\N	\N	1450000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
1346	STENT RONYX27515X RESOLUTE ONYX 2.75X15 MED	1	2016-12-16 18:46:15.901607	2016-12-16 18:46:15.901607	\N	\N	\N	\N	\N	1400000.0	0.0	150.0	2.0	\N	\N	\N	1	\N	\N	3
1347	STENT RONYX30018X RESOLUTE ONYX 3.00X18 MED	1	2016-12-16 18:46:15.906201	2016-12-16 18:46:15.906201	\N	\N	\N	\N	\N	2000000.0	0.0	150.0	2.0	\N	\N	\N	1	\N	\N	3
1348	STENT RONYX30022X RESOLUTE ONYX 3.00X22 MED	1	2016-12-16 18:46:15.910763	2016-12-16 18:46:15.910763	\N	\N	\N	\N	\N	1800000.0	0.0	150.0	2.0	\N	\N	\N	1	\N	\N	3
1349	STENT RONYX40015X RESOLUTE ONYX 4.00X15 MED	1	2016-12-16 18:46:15.915185	2016-12-16 18:46:15.915185	\N	\N	\N	\N	\N	1600000.0	0.0	150.0	2.0	\N	\N	\N	1	\N	\N	3
1350	STENT SCUBA 6.0 MMX37MMX130CM MED UNIDAD	1	2016-12-16 18:46:15.919725	2016-12-16 18:46:15.919725	\N	\N	\N	\N	\N	1900000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
1351	STENT SCUBA 6.0 MMX55MMX130CM MED UN UNIDAD -	1	2016-12-16 18:46:15.924249	2016-12-16 18:46:15.924249	\N	\N	\N	\N	\N	1900000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
1352	STENT SCUBA 7.0 MMX55MMX130CM SCA070055130	1	2016-12-16 18:46:15.928849	2016-12-16 18:46:15.928849	\N	\N	\N	\N	\N	1900000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
1353	STENT SCUBA 8.0 MMX55MMX130CM MED UNIDAD	1	2016-12-16 18:46:15.933613	2016-12-16 18:46:15.933613	\N	\N	\N	\N	\N	1900000.0	0.0	150.0	2.0	\N	\N	\N	1	\N	\N	3
1354	STENT ULTIMASTER 2,25MM X 15MM DE-RD2215KSM	1	2016-12-16 18:46:15.938372	2016-12-16 18:46:15.938372	\N	\N	\N	\N	\N	1668000.0	0.0	150.0	2.0	\N	\N	\N	1	\N	\N	3
1355	STENT ULTIMASTER 2,25MM X 18MM DE-RD2218KSM	1	2016-12-16 18:46:15.942794	2016-12-16 18:46:15.942794	\N	\N	\N	\N	\N	1607000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
1356	STENT ULTIMASTER 2,25MM X 24MM DE-RD2224KSM	1	2016-12-16 18:46:15.947273	2016-12-16 18:46:15.947273	\N	\N	\N	\N	\N	1668000.0	0.0	150.0	2.0	\N	\N	\N	1	\N	\N	3
1357	STENT ULTIMASTER 2,50MM X 15MM DE-RD2515KSM	1	2016-12-16 18:46:15.951693	2016-12-16 18:46:15.951693	\N	\N	\N	\N	\N	1607000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
1358	STENT ULTIMASTER 2,50MM X 18MM DE-RD2518KSM	1	2016-12-16 18:46:15.956363	2016-12-16 18:46:15.956363	\N	\N	\N	\N	\N	1607000.0	0.0	150.0	3.0	\N	\N	\N	1	\N	\N	3
1359	STENT ULTIMASTER 2,50MM X 24MM DE-RD2524KSM	1	2016-12-16 18:46:15.961252	2016-12-16 18:46:15.961252	\N	\N	\N	\N	\N	1668000.0	0.0	150.0	2.0	\N	\N	\N	1	\N	\N	3
1360	STENT ULTIMASTER 2,50MM X 28MM DE-RD2528KSM	1	2016-12-16 18:46:15.965865	2016-12-16 18:46:15.965865	\N	\N	\N	\N	\N	1668000.0	0.0	150.0	2.0	\N	\N	\N	1	\N	\N	3
1361	STENT ULTIMASTER 2,50MM X 33MM DE-RD2533KSM	1	2016-12-16 18:46:15.970331	2016-12-16 18:46:15.970331	\N	\N	\N	\N	\N	1668000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
1362	STENT ULTIMASTER 2,50MM X 38MM DE-RD2538KSM	1	2016-12-16 18:46:15.974961	2016-12-16 18:46:15.974961	\N	\N	\N	\N	\N	1668000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
1363	STENT ULTIMASTER 2,75MM X 15MM DE-RD2715KSM	1	2016-12-16 18:46:15.979386	2016-12-16 18:46:15.979386	\N	\N	\N	\N	\N	1668000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
1364	STENT ULTIMASTER 2,75MM X 24MM DE-RD2724KSM	1	2016-12-16 18:46:15.983868	2016-12-16 18:46:15.983868	\N	\N	\N	\N	\N	1668000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
1365	STENT ULTIMASTER 2,75MM X 28MM DE-RD2728KSM	1	2016-12-16 18:46:15.988364	2016-12-16 18:46:15.988364	\N	\N	\N	\N	\N	1668000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
1366	STENT ULTIMASTER 2,75MM X 33MM DE-RD2733KSM	1	2016-12-16 18:46:15.992955	2016-12-16 18:46:15.992955	\N	\N	\N	\N	\N	1668000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
1367	STENT ULTIMASTER 3,00MM X 15MM DE-RD3015KSM	1	2016-12-16 18:46:15.997226	2016-12-16 18:46:15.997226	\N	\N	\N	\N	\N	1576500.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
1368	STENT ULTIMASTER 3,00MM X 18MM DE-RD3018KSM	1	2016-12-16 18:46:16.001474	2016-12-16 18:46:16.001474	\N	\N	\N	\N	\N	1607000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
1369	STENT ULTIMASTER 3,00MM X 24MM DE-RD3024KSM	1	2016-12-16 18:46:16.006064	2016-12-16 18:46:16.006064	\N	\N	\N	\N	\N	1576500.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
1370	STENT ULTIMASTER 3,00MM X 28MM DE-RD3028KSM	1	2016-12-16 18:46:16.010407	2016-12-16 18:46:16.010407	\N	\N	\N	\N	\N	1668000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
1371	STENT ULTIMASTER 3.5 MM X 15 MM REF: 8DE-	1	2016-12-16 18:46:16.0151	2016-12-16 18:46:16.0151	\N	\N	\N	\N	\N	1485000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
1372	STENT ULTIMASTER 3.5 MM X 18MM REF: 8DE-	1	2016-12-16 18:46:16.019342	2016-12-16 18:46:16.019342	\N	\N	\N	\N	\N	1485000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
1373	STENT ULTIMASTER 2.25 MM X 12 8DE-R2212KSM	1	2016-12-16 18:46:16.024057	2016-12-16 18:46:16.024057	\N	\N	\N	\N	\N	1485000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
1374	STENT ULTIMASTER 3.50 X 24 RD3524KSM EMPAQUE	1	2016-12-16 18:46:16.028439	2016-12-16 18:46:16.028439	\N	\N	\N	\N	\N	1485000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
1375	STENT VISI PRO 0,35 -06-57-135CM PXP35-06-57-1	1	2016-12-16 18:46:16.032779	2016-12-16 18:46:16.032779	\N	\N	\N	\N	\N	1913000.0	0.0	150.0	2.0	\N	\N	\N	1	\N	\N	3
1376	STENT VISI PRO 0,35 -08-37-135CM PXP35-08-37-1	1	2016-12-16 18:46:16.037108	2016-12-16 18:46:16.037108	\N	\N	\N	\N	\N	954000.0	0.0	150.0	4.0	\N	\N	\N	1	\N	\N	3
1377	STENT VISI PRO 0,35 -08-57-135CM PXP35-08-57-135	1	2016-12-16 18:46:16.041748	2016-12-16 18:46:16.041748	\N	\N	\N	\N	\N	1913000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
1378	STENT WALLSTENT MONORIAL 7mmx40mm 8.0 29 SCH	1	2016-12-16 18:46:16.046196	2016-12-16 18:46:16.046196	\N	\N	\N	\N	\N	2064800.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
1379	STENT WALLSTENT MONORIAL 8.0 29 SCH 64708 BSC	1	2016-12-16 18:46:16.050415	2016-12-16 18:46:16.050415	\N	\N	\N	\N	\N	2064800.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
1380	STENT WALLSTENT MONORIAL 9mmx40mm 10. 31 SCH	1	2016-12-16 18:46:16.054968	2016-12-16 18:46:16.054968	\N	\N	\N	\N	\N	2022700.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
1381	STENT-INTEGRITY INT22512X INTEGRITY 2.25X12RX-	1	2016-12-16 18:46:16.059335	2016-12-16 18:46:16.059335	\N	\N	\N	\N	\N	535000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
1382	STENT-INTEGRITY INT22514X INTEGRITY 2.25X14RX-	1	2016-12-16 18:46:16.064037	2016-12-16 18:46:16.064037	\N	\N	\N	\N	\N	535000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
1383	STENT-INTEGRITY INT25014X INTEGRITY 2.50X14RX-	1	2016-12-16 18:46:16.068961	2016-12-16 18:46:16.068961	\N	\N	\N	\N	\N	535000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
1384	STENT-INTEGRITY INT27518X INTEGRITY 2.75X18RX-	1	2016-12-16 18:46:16.073518	2016-12-16 18:46:16.073518	\N	\N	\N	\N	\N	535000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
1385	STENT-INTEGRITY INT27522X INTEGRITY 2.75X22RX-	1	2016-12-16 18:46:16.077888	2016-12-16 18:46:16.077888	\N	\N	\N	\N	\N	535000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
1386	STENT-INTEGRITY INT27526X INTEGRITY 2.75X26RX-	1	2016-12-16 18:46:16.082349	2016-12-16 18:46:16.082349	\N	\N	\N	\N	\N	535000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
1387	STENT-INTEGRITY INT27530X INTEGRITY 2.75X30RX-	1	2016-12-16 18:46:16.086931	2016-12-16 18:46:16.086931	\N	\N	\N	\N	\N	535000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
1388	STENT-INTEGRITY INT30009X INTEGRITY 3.00X09RX-	1	2016-12-16 18:46:16.091624	2016-12-16 18:46:16.091624	\N	\N	\N	\N	\N	535000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
1389	STENT-INTEGRITY INT30015X INTEGRITY 3.00X15RX-	1	2016-12-16 18:46:16.096289	2016-12-16 18:46:16.096289	\N	\N	\N	\N	\N	535000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
1390	STENT-INTEGRITY INT30022X INTEGRITY 3.00X22RX-	1	2016-12-16 18:46:16.100631	2016-12-16 18:46:16.100631	\N	\N	\N	\N	\N	535000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
1391	STENT-INTEGRITY INT30026X INTEGRITY 3.00X26RX-	1	2016-12-16 18:46:16.105077	2016-12-16 18:46:16.105077	\N	\N	\N	\N	\N	535000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
1392	STENT-INTEGRITY INT30030X INTEGRITY 3.00X30RX-	1	2016-12-16 18:46:16.109307	2016-12-16 18:46:16.109307	\N	\N	\N	\N	\N	535000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
1393	STENT-INTEGRITY INT35009X INTEGRITY 3.50X09RX-	1	2016-12-16 18:46:16.113686	2016-12-16 18:46:16.113686	\N	\N	\N	\N	\N	535000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
1394	STENT-INTEGRITY INT35015X INTEGRITY 3.50X15RX-	1	2016-12-16 18:46:16.118344	2016-12-16 18:46:16.118344	\N	\N	\N	\N	\N	535000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
1395	STENT-INTEGRITY INT35018X INTEGRITY 3.50X18RX-	1	2016-12-16 18:46:16.122865	2016-12-16 18:46:16.122865	\N	\N	\N	\N	\N	535000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
1396	STENT-INTEGRITY INT35022X INTEGRITY 3.50X22RX-	1	2016-12-16 18:46:16.127494	2016-12-16 18:46:16.127494	\N	\N	\N	\N	\N	535000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
1397	STENT-INTEGRITY INT35026X INTEGRITY 3.50X26RX-	1	2016-12-16 18:46:16.131988	2016-12-16 18:46:16.131988	\N	\N	\N	\N	\N	535000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
1398	STENT-INTEGRITY INT40022X INTEGRITY 4.00X22RX-	1	2016-12-16 18:46:16.136366	2016-12-16 18:46:16.136366	\N	\N	\N	\N	\N	535000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
1399	STENT-INTEGRITY INT40030X INTEGRITY 4.00X30RX-	1	2016-12-16 18:46:16.141012	2016-12-16 18:46:16.141012	\N	\N	\N	\N	\N	535000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
1400	STENT-RESOLUTE INTEGRITY RSINT22514X MICROTRAC	1	2016-12-16 18:46:16.145218	2016-12-16 18:46:16.145218	\N	\N	\N	\N	\N	1866667.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
1401	STENT-RESOLUTE INTEGRITY RSINT22518X MICROTRAC	1	2016-12-16 18:46:16.149917	2016-12-16 18:46:16.149917	\N	\N	\N	\N	\N	2000000.0	0.0	150.0	3.0	\N	\N	\N	1	\N	\N	3
1402	STENT-RESOLUTE INTEGRITY RSINT22522X MICROTRAC	1	2016-12-16 18:46:16.154343	2016-12-16 18:46:16.154343	\N	\N	\N	\N	\N	1800000.0	0.0	150.0	2.0	\N	\N	\N	1	\N	\N	3
1403	STENT-RESOLUTE INTEGRITY RSINT22526X MICROTRAC	1	2016-12-16 18:46:16.158794	2016-12-16 18:46:16.158794	\N	\N	\N	\N	\N	1560000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
1404	STENT-RESOLUTE INTEGRITY RSINT22530X MICROTRAC	1	2016-12-16 18:46:16.163889	2016-12-16 18:46:16.163889	\N	\N	\N	\N	\N	1866667.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
1405	STENT-RESOLUTE INTEGRITY RSINT25012X MICROTRAC	1	2016-12-16 18:46:16.168295	2016-12-16 18:46:16.168295	\N	\N	\N	\N	\N	2000000.0	0.0	150.0	2.0	\N	\N	\N	1	\N	\N	3
1406	STENT-RESOLUTE INTEGRITY RSINT25014X MICROTRAC	1	2016-12-16 18:46:16.172716	2016-12-16 18:46:16.172716	\N	\N	\N	\N	\N	1800000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
1407	STENT-RESOLUTE INTEGRITY RSINT25018X MICROTRAC	1	2016-12-16 18:46:16.177068	2016-12-16 18:46:16.177068	\N	\N	\N	\N	\N	1780000.0	0.0	150.0	3.0	\N	\N	\N	1	\N	\N	3
1408	STENT-RESOLUTE INTEGRITY RSINT25022X MICROTRAC	1	2016-12-16 18:46:16.18162	2016-12-16 18:46:16.18162	\N	\N	\N	\N	\N	1783333.0	0.0	150.0	2.0	\N	\N	\N	1	\N	\N	3
1409	STENT-RESOLUTE INTEGRITY RSINT25026X MICROTRAC	1	2016-12-16 18:46:16.186088	2016-12-16 18:46:16.186088	\N	\N	\N	\N	\N	1720000.0	0.0	150.0	2.0	\N	\N	\N	1	\N	\N	3
1410	STENT-RESOLUTE INTEGRITY RSINT25030X MICROTRAC	1	2016-12-16 18:46:16.190599	2016-12-16 18:46:16.190599	\N	\N	\N	\N	\N	2000000.0	0.0	150.0	2.0	\N	\N	\N	1	\N	\N	3
1411	STENT-RESOLUTE INTEGRITY RSINT27512X MICROTRAC	1	2016-12-16 18:46:16.195631	2016-12-16 18:46:16.195631	\N	\N	\N	\N	\N	2000000.0	0.0	150.0	2.0	\N	\N	\N	1	\N	\N	3
1412	STENT-RESOLUTE INTEGRITY RSINT27514X MICROTRAC	1	2016-12-16 18:46:16.200249	2016-12-16 18:46:16.200249	\N	\N	\N	\N	\N	1866667.0	0.0	150.0	2.0	\N	\N	\N	1	\N	\N	3
1413	STENT-RESOLUTE INTEGRITY RSINT27518X MICROTRAC	1	2016-12-16 18:46:16.205241	2016-12-16 18:46:16.205241	\N	\N	\N	\N	\N	1880000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
1414	STENT-RESOLUTE INTEGRITY RSINT27522X MICROTRAC	1	2016-12-16 18:46:16.210797	2016-12-16 18:46:16.210797	\N	\N	\N	\N	\N	1760000.0	0.0	150.0	2.0	\N	\N	\N	1	\N	\N	3
1415	STENT-RESOLUTE INTEGRITY RSINT27526X MICROTRAC	1	2016-12-16 18:46:16.215761	2016-12-16 18:46:16.215761	\N	\N	\N	\N	\N	1866667.0	0.0	150.0	2.0	\N	\N	\N	1	\N	\N	3
1416	STENT-RESOLUTE INTEGRITY RSINT27530X MICROTRAC	1	2016-12-16 18:46:16.220283	2016-12-16 18:46:16.220283	\N	\N	\N	\N	\N	1933333.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
1417	STENT-RESOLUTE INTEGRITY RSINT30012X MICROTRAC	1	2016-12-16 18:46:16.225504	2016-12-16 18:46:16.225504	\N	\N	\N	\N	\N	1920000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
1418	STENT-RESOLUTE INTEGRITY RSINT30015X MICROTRAC	1	2016-12-16 18:46:16.230322	2016-12-16 18:46:16.230322	\N	\N	\N	\N	\N	1933333.0	0.0	150.0	2.0	\N	\N	\N	1	\N	\N	3
1419	STENT-RESOLUTE INTEGRITY RSINT30018X MICROTRAC	1	2016-12-16 18:46:16.234859	2016-12-16 18:46:16.234859	\N	\N	\N	\N	\N	1800000.0	0.0	150.0	2.0	\N	\N	\N	1	\N	\N	3
1420	STENT-RESOLUTE INTEGRITY RSINT30022X MICROTRAC	1	2016-12-16 18:46:16.239557	2016-12-16 18:46:16.239557	\N	\N	\N	\N	\N	1700000.0	0.0	150.0	2.0	\N	\N	\N	1	\N	\N	3
1421	STENT-RESOLUTE INTEGRITY RSINT30026X MICROTRAC	1	2016-12-16 18:46:16.244268	2016-12-16 18:46:16.244268	\N	\N	\N	\N	\N	2000000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
1422	STENT-RESOLUTE INTEGRITY RSINT30030X MICROTRAC	1	2016-12-16 18:46:16.248632	2016-12-16 18:46:16.248632	\N	\N	\N	\N	\N	1750000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
1423	STENT-RESOLUTE INTEGRITY RSINT30034X MICROTRAC	1	2016-12-16 18:46:16.253244	2016-12-16 18:46:16.253244	\N	\N	\N	\N	\N	2000000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
1424	STENT-RESOLUTE INTEGRITY RSINT30038X MICROTRAC	1	2016-12-16 18:46:16.257874	2016-12-16 18:46:16.257874	\N	\N	\N	\N	\N	1800000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
1425	STENT-RESOLUTE INTEGRITY RSINT35012X MICROTRAC	1	2016-12-16 18:46:16.262418	2016-12-16 18:46:16.262418	\N	\N	\N	\N	\N	1866667.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
1426	STENT-RESOLUTE INTEGRITY RSINT35018X MICROTRAC	1	2016-12-16 18:46:16.267566	2016-12-16 18:46:16.267566	\N	\N	\N	\N	\N	1933333.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
1427	STENT-RESOLUTE INTEGRITY RSINT35022X MICROTRAC	1	2016-12-16 18:46:16.271918	2016-12-16 18:46:16.271918	\N	\N	\N	\N	\N	1866667.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
1428	STENT-RESOLUTE INTEGRITY RSINT35026X MICROTRAC	1	2016-12-16 18:46:16.276202	2016-12-16 18:46:16.276202	\N	\N	\N	\N	\N	1866667.0	0.0	150.0	2.0	\N	\N	\N	1	\N	\N	3
1429	STENT-RESOLUTE INTEGRITY RSINT35030X MICROTRAC	1	2016-12-16 18:46:16.280587	2016-12-16 18:46:16.280587	\N	\N	\N	\N	\N	1950000.0	0.0	150.0	2.0	\N	\N	\N	1	\N	\N	3
1430	STENT-RESOLUTE INTEGRITY RSINT40015X MICROTRAC	1	2016-12-16 18:46:16.285135	2016-12-16 18:46:16.285135	\N	\N	\N	\N	\N	2000000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
1431	STENT-RESOLUTE INTEGRITY RSINT40018X MICROTRAC	1	2016-12-16 18:46:16.289687	2016-12-16 18:46:16.289687	\N	\N	\N	\N	\N	1800000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
1432	STENT-RESOLUTE INTEGRITY RSINT40022X MICROTRAC	1	2016-12-16 18:46:16.294137	2016-12-16 18:46:16.294137	\N	\N	\N	\N	\N	1900000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
1433	STENT-RESOLUTE INTEGRITY RSINT40026X MICROTRAC	1	2016-12-16 18:46:16.29835	2016-12-16 18:46:16.29835	\N	\N	\N	\N	\N	2000000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
1434	STENT-RESOLUTE INTEGRITY RSINT40030X MICROTRAC	1	2016-12-16 18:46:16.303503	2016-12-16 18:46:16.303503	\N	\N	\N	\N	\N	2000000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
1435	SUCRALFATO (ALSUCRAL) 1G TABLETA - LAB. :ROPSOHN	1	2016-12-16 18:46:16.307815	2016-12-16 18:46:16.307815	\N	\N	\N	\N	\N	116.0	0.0	150.0	28.0	\N	\N	\N	1	\N	\N	3
1436	SULFATO DE MAGNESIO 20% AMPOLLA - LAB. :ROPSOHN	1	2016-12-16 18:46:16.312605	2016-12-16 18:46:16.312605	\N	\N	\N	\N	\N	310.0	0.0	150.0	13.0	\N	\N	\N	1	\N	\N	3
1437	SULFATO FERROSO 200MG TABLETA - LAB. :	1	2016-12-16 18:46:16.31705	2016-12-16 18:46:16.31705	\N	\N	\N	\N	\N	44.0	0.0	150.0	2.0	\N	\N	\N	1	\N	\N	3
1438	SURGIPRO (POLIPROPILENO) 3/0 DA V-20- REFVP522X	1	2016-12-16 18:46:16.322092	2016-12-16 18:46:16.322092	\N	\N	\N	\N	\N	17337.0	0.0	150.0	4.0	\N	\N	\N	1	\N	\N	3
1439	SURGIPRO (POLIPROPILENO)4/0 DA CV-23- REFVP557X	1	2016-12-16 18:46:16.32659	2016-12-16 18:46:16.32659	\N	\N	\N	\N	\N	14742.0	0.0	150.0	23.0	\N	\N	\N	1	\N	\N	3
1440	SURGIPRO (POLIPROPILENO)4/0 DA V-20- REFVP521X	1	2016-12-16 18:46:16.331038	2016-12-16 18:46:16.331038	\N	\N	\N	\N	\N	14750.0	0.0	150.0	6.0	\N	\N	\N	1	\N	\N	3
1441	SURGIPRO (POLIPROPILENO)5/0 DA CV-11- REFVP720X	1	2016-12-16 18:46:16.335184	2016-12-16 18:46:16.335184	\N	\N	\N	\N	\N	14700.0	0.0	150.0	4.0	\N	\N	\N	1	\N	\N	3
1442	SURGIPRO (POLIPROPILENO)6/0 DA CV-11- REFVP726X	1	2016-12-16 18:46:16.339772	2016-12-16 18:46:16.339772	\N	\N	\N	\N	\N	14700.0	0.0	150.0	17.0	\N	\N	\N	1	\N	\N	3
1443	SURGIPRO (POLIPROPILENO)7/0 DA CV-1- REFVP702X	1	2016-12-16 18:46:16.345163	2016-12-16 18:46:16.345163	\N	\N	\N	\N	\N	14703.0	0.0	150.0	17.0	\N	\N	\N	1	\N	\N	3
1444	TACROLIMUS (PROGRAF- XL) 1MG CAPSULA - LAB. :	1	2016-12-16 18:46:16.349333	2016-12-16 18:46:16.349333	\N	\N	\N	\N	\N	4536.0	0.0	150.0	46.0	\N	\N	\N	1	\N	\N	3
1445	TACROLIMUS (PROGRAF- XL) 5MG CAPSULA - LAB. :	1	2016-12-16 18:46:16.353711	2016-12-16 18:46:16.353711	\N	\N	\N	\N	\N	24228.0	0.0	150.0	100.0	\N	\N	\N	1	\N	\N	3
1446	TACROLIMUS (PROGRAF) 1MG CAPSULA - LAB. :JANSSEN	1	2016-12-16 18:46:16.358183	2016-12-16 18:46:16.358183	\N	\N	\N	\N	\N	10335.0	0.0	150.0	20.0	\N	\N	\N	1	\N	\N	3
1447	TAMSULOSINA 0.4MG CAPSULA - LAB. :SANOFI	1	2016-12-16 18:46:16.37378	2016-12-16 18:46:16.37378	\N	\N	\N	\N	\N	350.0	0.0	150.0	2.0	\N	\N	\N	1	\N	\N	3
1448	TAPON ADAPTADOR LIBRE DE AGUJA REF:385100 BD	1	2016-12-16 18:46:16.37915	2016-12-16 18:46:16.37915	\N	\N	\N	\N	\N	2293.0	0.0	150.0	23.0	\N	\N	\N	1	\N	\N	3
1449	TAPON ADAPTADOR LIBRE DE AGUJAS BD REF 385100	1	2016-12-16 18:46:16.3836	2016-12-16 18:46:16.3836	\N	\N	\N	\N	\N	2843.0	0.0	150.0	21.0	\N	\N	\N	1	\N	\N	3
1450	TAPON HEPARINIZADO BRAUN REF:4238010 EMPAQUE	1	2016-12-16 18:46:16.387996	2016-12-16 18:46:16.387996	\N	\N	\N	\N	\N	420.0	0.0	150.0	3.0	\N	\N	\N	1	\N	\N	3
1451	TEGADERM 10 X 12 CMS. - REF: 3M1626W EMPAQUE	1	2016-12-16 18:46:16.393678	2016-12-16 18:46:16.393678	\N	\N	\N	\N	\N	3745.0	0.0	150.0	29.0	\N	\N	\N	1	\N	\N	3
1452	TEGADERM DISP. ASEGUR FIJAC CATETER1685 8.5X11.	1	2016-12-16 18:46:16.39849	2016-12-16 18:46:16.39849	\N	\N	\N	\N	\N	4373.0	0.0	150.0	10.0	\N	\N	\N	1	\N	\N	3
1453	TERMOMETRO DIGITAL EMPAQUE INDIVIDUAL UNIDAD -	1	2016-12-16 18:46:16.403391	2016-12-16 18:46:16.403391	\N	\N	\N	\N	\N	5949.0	0.0	150.0	12.0	\N	\N	\N	1	\N	\N	3
1454	TIAMINA (VIT B1) 300MG TABLETA - LAB. :	1	2016-12-16 18:46:16.40765	2016-12-16 18:46:16.40765	\N	\N	\N	\N	\N	92.0	0.0	150.0	6.0	\N	\N	\N	1	\N	\N	3
1455	TICAGRELOR (BRILINTA) 90MG TABLETA - LAB. :	1	2016-12-16 18:46:16.412106	2016-12-16 18:46:16.412106	\N	\N	\N	\N	\N	3481.0	0.0	150.0	9.0	\N	\N	\N	1	\N	\N	3
1456	TICRON (POLIESTER)2/0 DA CV-305 PLEDGET-	1	2016-12-16 18:46:16.416438	2016-12-16 18:46:16.416438	\N	\N	\N	\N	\N	84000.0	0.0	150.0	2.0	\N	\N	\N	1	\N	\N	3
1457	TICRON (POLIESTER)2/0 DA Y-31 PLEDGET- REF321956	1	2016-12-16 18:46:16.420738	2016-12-16 18:46:16.420738	\N	\N	\N	\N	\N	107743.0	0.0	150.0	3.0	\N	\N	\N	1	\N	\N	3
1458	TICRON (POLIESTER)2/0 DA Y-31- REF312551 EMPAQUE	1	2016-12-16 18:46:16.42536	2016-12-16 18:46:16.42536	\N	\N	\N	\N	\N	11743.0	0.0	150.0	26.0	\N	\N	\N	1	\N	\N	3
1459	TICRON (POLIESTER)BICOLOR 2/0 CV-305- REF335656	1	2016-12-16 18:46:16.4297	2016-12-16 18:46:16.4297	\N	\N	\N	\N	\N	68600.0	0.0	150.0	3.0	\N	\N	\N	1	\N	\N	3
1460	TICRON (POLIESTER)2/0 DA CV-305 - REF325651	1	2016-12-16 18:46:16.434092	2016-12-16 18:46:16.434092	\N	\N	\N	\N	\N	8265.0	0.0	150.0	30.0	\N	\N	\N	1	\N	\N	3
1461	TIOPENTAL SODICO 1GR FRASCO - LAB. :ROTEXMEDICA	1	2016-12-16 18:46:16.438508	2016-12-16 18:46:16.438508	\N	\N	\N	\N	\N	4879.0	0.0	150.0	4.0	\N	\N	\N	1	\N	\N	3
1462	TIROFIBAN (AGRASTAT) 0.25 MG/ML VIAL - LAB. :	1	2016-12-16 18:46:16.442711	2016-12-16 18:46:16.442711	\N	\N	\N	\N	\N	462693.0	0.0	150.0	2.0	\N	\N	\N	1	\N	\N	3
1463	TIZANIDINA 4MG TABLETA - LAB. :LABORATORIO	1	2016-12-16 18:46:16.447311	2016-12-16 18:46:16.447311	\N	\N	\N	\N	\N	1090.0	0.0	150.0	7.0	\N	\N	\N	1	\N	\N	3
1464	TOPIRAMATO 25MG TABLETA - LAB. :SANDOZ PRIVATE	1	2016-12-16 18:46:16.451582	2016-12-16 18:46:16.451582	\N	\N	\N	\N	\N	911.0	0.0	150.0	13.0	\N	\N	\N	1	\N	\N	3
1465	TORNIQUETE 79003 5.5 IN REF: 79003- MED EMPAQUE	1	2016-12-16 18:46:16.45598	2016-12-16 18:46:16.45598	\N	\N	\N	\N	\N	22171.0	0.0	150.0	8.0	\N	\N	\N	1	\N	\N	3
1466	TOXINA BOTULINICA (BOTOX) 50UI AMPOLLA - LAB. :	1	2016-12-16 18:46:16.460304	2016-12-16 18:46:16.460304	\N	\N	\N	\N	\N	224104.0	0.0	150.0	8.0	\N	\N	\N	1	\N	\N	3
1467	TOXINA BOTULINICA 100 UI (BOTOX) 100UI UNIDAD -	1	2016-12-16 18:46:16.465394	2016-12-16 18:46:16.465394	\N	\N	\N	\N	\N	448209.0	0.0	150.0	3.0	\N	\N	\N	1	\N	\N	3
1468	TOXOIDE TETANICO 0.5ML UNIDAD - LAB. :NOVARTIS	1	2016-12-16 18:46:16.469826	2016-12-16 18:46:16.469826	\N	\N	\N	\N	\N	10800.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
1469	TRAMADOL 100MG FRASCO - LAB. :GENFAR SA	1	2016-12-16 18:46:16.474216	2016-12-16 18:46:16.474216	\N	\N	\N	\N	\N	3664.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
1470	TRAMADOL 50MG AMPOLLA - LAB. :GENFAR SA	1	2016-12-16 18:46:16.47882	2016-12-16 18:46:16.47882	\N	\N	\N	\N	\N	359.0	0.0	150.0	7.0	\N	\N	\N	1	\N	\N	3
1471	TRAMADOL 50MG AMPOLLA - LAB. :VITALIS S.A. C.I.	1	2016-12-16 18:46:16.48317	2016-12-16 18:46:16.48317	\N	\N	\N	\N	\N	285.0	0.0	150.0	9.0	\N	\N	\N	1	\N	\N	3
1472	TRAMADOL SOLUCION 100MG FRASCO - LAB. :GENFAR	1	2016-12-16 18:46:16.487691	2016-12-16 18:46:16.487691	\N	\N	\N	\N	\N	6900.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
1473	TRANSDUCTOR ADULTO COM VAMP REF 248A6E	1	2016-12-16 18:46:16.492323	2016-12-16 18:46:16.492323	\N	\N	\N	\N	\N	128197.0	0.0	150.0	3.0	\N	\N	\N	1	\N	\N	3
1474	TRANSDUCTOR DE PRESION DOBLE KIT REF 07DP2400A	1	2016-12-16 18:46:16.496911	2016-12-16 18:46:16.496911	\N	\N	\N	\N	\N	148447.0	0.0	150.0	6.0	\N	\N	\N	1	\N	\N	3
1475	TRANSDUCTOR TRUWAVE ADULTO 1X2- REF: PX1X2	1	2016-12-16 18:46:16.501291	2016-12-16 18:46:16.501291	\N	\N	\N	\N	\N	116000.0	0.0	150.0	4.0	\N	\N	\N	1	\N	\N	3
1476	TRAZODONA 50MG TABLETA - LAB. :GENFAR SA	1	2016-12-16 18:46:16.505735	2016-12-16 18:46:16.505735	\N	\N	\N	\N	\N	119.0	0.0	150.0	8.0	\N	\N	\N	1	\N	\N	3
1477	TRIMETAZIDINA (VASTAREL-MR) TAB LIBERACION	1	2016-12-16 18:46:16.510176	2016-12-16 18:46:16.510176	\N	\N	\N	\N	\N	1315.0	0.0	150.0	9.0	\N	\N	\N	1	\N	\N	3
1478	TRIMETOPRIM + SULFAMETOXAZOL 160/800MG TABLETA	1	2016-12-16 18:46:16.514481	2016-12-16 18:46:16.514481	\N	\N	\N	\N	\N	53.0	0.0	150.0	5.0	\N	\N	\N	1	\N	\N	3
1479	TUBO DE MACROSUCCION 10061 20FR 20PK 17L	1	2016-12-16 18:46:16.518789	2016-12-16 18:46:16.518789	\N	\N	\N	\N	\N	77388.0	0.0	150.0	6.0	\N	\N	\N	1	\N	\N	3
1480	TUBO ENDOBRONQUIAL IZQUIERDO 32Fr REF:125035	1	2016-12-16 18:46:16.524049	2016-12-16 18:46:16.524049	\N	\N	\N	\N	\N	189660.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
1481	TUBO ENDOBRONQUIAL No 35FR IZQUIERDO REF:	1	2016-12-16 18:46:16.528255	2016-12-16 18:46:16.528255	\N	\N	\N	\N	\N	157760.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
1482	TUBO ENDOTRAQUEAL C/B No 7.5 WELL LEAD MEDICAL	1	2016-12-16 18:46:16.532856	2016-12-16 18:46:16.532856	\N	\N	\N	\N	\N	2915.0	0.0	150.0	2.0	\N	\N	\N	1	\N	\N	3
1483	TUBO ENDOTRAQUEAL C/B No 8.5 WELL LEAD MEDICAL	1	2016-12-16 18:46:16.537256	2016-12-16 18:46:16.537256	\N	\N	\N	\N	\N	2960.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
1484	TUBO ENDOTRAQUEAL No 6.0 ALLMED EMPAQUE	1	2016-12-16 18:46:16.541742	2016-12-16 18:46:16.541742	\N	\N	\N	\N	\N	3200.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
1485	TUBO ENDOTRAQUEAL No 6.5 ALLMED EMPAQUE	1	2016-12-16 18:46:16.546258	2016-12-16 18:46:16.546258	\N	\N	\N	\N	\N	3484.0	0.0	150.0	3.0	\N	\N	\N	1	\N	\N	3
1486	TUBO ENDOTRAQUEAL No 7.0 ALLMED EMPAQUE	1	2016-12-16 18:46:16.55045	2016-12-16 18:46:16.55045	\N	\N	\N	\N	\N	2831.0	0.0	150.0	2.0	\N	\N	\N	1	\N	\N	3
1487	TUBO ENDOTRAQUEAL No 7.5 ALLMED EMPAQUE	1	2016-12-16 18:46:16.555079	2016-12-16 18:46:16.555079	\N	\N	\N	\N	\N	3126.0	0.0	150.0	2.0	\N	\N	\N	1	\N	\N	3
1488	TUBO ENDOTRAQUEAL No 8.0 ALLMED EMPAQUE	1	2016-12-16 18:46:16.559398	2016-12-16 18:46:16.559398	\N	\N	\N	\N	\N	3472.0	0.0	150.0	2.0	\N	\N	\N	1	\N	\N	3
1489	TUBO ENDOTRAQUEAL No 8.5 ALLMED EMPAQUE	1	2016-12-16 18:46:16.563877	2016-12-16 18:46:16.563877	\N	\N	\N	\N	\N	3078.0	0.0	150.0	4.0	\N	\N	\N	1	\N	\N	3
1490	TUBO ENDOTRAQUEAL No 9.0 CURITY REF:86115 CAJA X	1	2016-12-16 18:46:16.568969	2016-12-16 18:46:16.568969	\N	\N	\N	\N	\N	4684.0	0.0	150.0	2.0	\N	\N	\N	1	\N	\N	3
1491	TUBO GASTROSTOMIA QUIRURGICA 18 FR MIC REF 0100-	1	2016-12-16 18:46:16.573671	2016-12-16 18:46:16.573671	\N	\N	\N	\N	\N	320850.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
1492	TUBO PARA DRENAJE TORACICO S. FR - 34-REF: SH1112	1	2016-12-16 18:46:16.578244	2016-12-16 18:46:16.578244	\N	\N	\N	\N	\N	2523.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
1493	TUBO TORAX 34 SHERLEG 1112 EMPAQUE INDIVIDUAL	1	2016-12-16 18:46:16.582369	2016-12-16 18:46:16.582369	\N	\N	\N	\N	\N	2869.0	0.0	150.0	10.0	\N	\N	\N	1	\N	\N	3
1494	TUBO TRAMPA DE LUKENS EMPAQUE INDIVIDUAL UNIDAD	1	2016-12-16 18:46:16.586861	2016-12-16 18:46:16.586861	\N	\N	\N	\N	\N	7432.0	0.0	150.0	2.0	\N	\N	\N	1	\N	\N	3
1495	VALGANCICLOVIR (VALIXA) 450MG TABLETA - LAB. :	1	2016-12-16 18:46:16.591837	2016-12-16 18:46:16.591837	\N	\N	\N	\N	\N	47628.0	0.0	150.0	59.0	\N	\N	\N	1	\N	\N	3
1496	VALSARTAN 160MG TABLETA - LAB. :GENFAR SA	1	2016-12-16 18:46:16.596397	2016-12-16 18:46:16.596397	\N	\N	\N	\N	\N	203.0	0.0	150.0	15.0	\N	\N	\N	1	\N	\N	3
1497	VALSARTAN 80MG TABLETA - LAB. :GENFAR SA	1	2016-12-16 18:46:16.600548	2016-12-16 18:46:16.600548	\N	\N	\N	\N	\N	369.0	0.0	150.0	19.0	\N	\N	\N	1	\N	\N	3
1498	VALVE T505C221 HKII AOR CII OUS MED EMPAQUE	1	2016-12-16 18:46:16.604994	2016-12-16 18:46:16.604994	\N	\N	\N	\N	\N	2500000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
1499	VALVE T510C33 HKII MIT CINCH OUS- MED EMPAQUE	1	2016-12-16 18:46:16.609226	2016-12-16 18:46:16.609226	\N	\N	\N	\N	\N	2500000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
1500	VALVULA AORTICA 21 HCK T505CF21 - MED EMPAQUE	1	2016-12-16 18:46:16.613362	2016-12-16 18:46:16.613362	\N	\N	\N	\N	\N	2500000.0	0.0	150.0	2.0	\N	\N	\N	1	\N	\N	3
1501	VALVULA BIOLOGICA EPIC SUPRA AORTICA 19MM ST	1	2016-12-16 18:46:16.617911	2016-12-16 18:46:16.617911	\N	\N	\N	\N	\N	3600000.0	0.0	150.0	2.0	\N	\N	\N	1	\N	\N	3
1502	VALVULA BIOLOGICA EPIC SUPRAAORTICA 19MM REF	1	2016-12-16 18:46:16.622252	2016-12-16 18:46:16.622252	\N	\N	\N	\N	\N	3500000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
1503	VALVULA BIOLOGICA MITRAL 31MM UNIDAD UNIDAD -	1	2016-12-16 18:46:16.626649	2016-12-16 18:46:16.626649	\N	\N	\N	\N	\N	2500000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
1504	VALVULA BIOLOGICA PORCINA EPIC AORTICA 21MM REF	1	2016-12-16 18:46:16.630978	2016-12-16 18:46:16.630978	\N	\N	\N	\N	\N	2522222.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
1505	VALVULA BIOLOGICA PORCINA EPIC AORTICA 23MM REF	1	2016-12-16 18:46:16.635802	2016-12-16 18:46:16.635802	\N	\N	\N	\N	\N	2540000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
1506	VALVULA BIOLOGICA PORCINA EPIC AORTICA 25MM REF	1	2016-12-16 18:46:16.640093	2016-12-16 18:46:16.640093	\N	\N	\N	\N	\N	2500000.0	0.0	150.0	2.0	\N	\N	\N	1	\N	\N	3
1507	VALVULA BIOLOGICA PORCINA EPIC AORTICA 27MM REF	1	2016-12-16 18:46:16.644242	2016-12-16 18:46:16.644242	\N	\N	\N	\N	\N	1925000.0	0.0	150.0	2.0	\N	\N	\N	1	\N	\N	3
1508	VALVULA BIOLOGICA PORCINA EPIC MITRAL 25 MM	1	2016-12-16 18:46:16.648324	2016-12-16 18:46:16.648324	\N	\N	\N	\N	\N	2500000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
1509	VALVULA BIOLOGICA PORCINA EPIC MITRAL 27MM E100-	1	2016-12-16 18:46:16.652604	2016-12-16 18:46:16.652604	\N	\N	\N	\N	\N	2500000.0	0.0	150.0	2.0	\N	\N	\N	1	\N	\N	3
1510	VALVULA BIOLOGICA PORCINA EPIC MITRAL 29MM E100-	1	2016-12-16 18:46:16.65694	2016-12-16 18:46:16.65694	\N	\N	\N	\N	\N	2566667.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
1511	VALVULA BIOLOGICA PORCINA EPIC MITRAL31MM REF	1	2016-12-16 18:46:16.661171	2016-12-16 18:46:16.661171	\N	\N	\N	\N	\N	2500000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
1512	VALVULA HEMOSTATICA 7 FR MPA302 WM EMPAQUE	1	2016-12-16 18:46:16.665458	2016-12-16 18:46:16.665458	\N	\N	\N	\N	\N	97440.0	0.0	150.0	2.0	\N	\N	\N	1	\N	\N	3
1513	VALVULA HEMOSTATICA CON EXT. MPA352 WM	1	2016-12-16 18:46:16.670221	2016-12-16 18:46:16.670221	\N	\N	\N	\N	\N	95566.0	0.0	150.0	3.0	\N	\N	\N	1	\N	\N	3
1514	VALVULA HEMOSTATICA DOBLE ROTOR MAP222 WM	1	2016-12-16 18:46:16.674745	2016-12-16 18:46:16.674745	\N	\N	\N	\N	\N	88160.0	0.0	150.0	2.0	\N	\N	\N	1	\N	\N	3
1515	VALVULA MECANICA AORTICA REGENT 19MM REF	1	2016-12-16 18:46:16.679393	2016-12-16 18:46:16.679393	\N	\N	\N	\N	\N	3500000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
1516	VALVULA MECANICA AORTICA REGENT 21MM REF 21AGN	1	2016-12-16 18:46:16.685827	2016-12-16 18:46:16.685827	\N	\N	\N	\N	\N	3500000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
1517	VALVULA MECANICA MITRAL MASTER 27MM REF	1	2016-12-16 18:46:16.689993	2016-12-16 18:46:16.689993	\N	\N	\N	\N	\N	3500000.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
1518	VANCOMICINA 500MG VIAL - LAB. :VITALIS S.A. C.I.	1	2016-12-16 18:46:16.6944	2016-12-16 18:46:16.6944	\N	\N	\N	\N	\N	4183.0	0.0	150.0	18.0	\N	\N	\N	1	\N	\N	3
1519	VASOPRESINA 20UI AMPOLLA - LAB. :J. M. SUMINISTROS	1	2016-12-16 18:46:16.698343	2016-12-16 18:46:16.698343	\N	\N	\N	\N	\N	15522.0	0.0	150.0	7.0	\N	\N	\N	1	\N	\N	3
1520	VENDA DE ALGODON LAMINADO 4X5 YARDAS EMPAQUE	1	2016-12-16 18:46:16.702849	2016-12-16 18:46:16.702849	\N	\N	\N	\N	\N	1267.0	0.0	150.0	2.0	\N	\N	\N	1	\N	\N	3
1521	VENDA DE ALGODON LAMINADO 5X5 YARDAS EMPAQUE	1	2016-12-16 18:46:16.707375	2016-12-16 18:46:16.707375	\N	\N	\N	\N	\N	3425.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
1522	VENDA DE ALGODON LAMINADO 6X5 YARDAS EMPAQUE	1	2016-12-16 18:46:16.71219	2016-12-16 18:46:16.71219	\N	\N	\N	\N	\N	1243.0	0.0	150.0	4.0	\N	\N	\N	1	\N	\N	3
1523	VENDA DE GASA ELASTICA 5 X 5 COLOR PIEL - REF:	1	2016-12-16 18:46:16.716288	2016-12-16 18:46:16.716288	\N	\N	\N	\N	\N	1607.0	0.0	150.0	3.0	\N	\N	\N	1	\N	\N	3
1524	VENDA DE GASA ELASTICA 6 X 5 COLOR PIEL - REF:	1	2016-12-16 18:46:16.720625	2016-12-16 18:46:16.720625	\N	\N	\N	\N	\N	2479.0	0.0	150.0	6.0	\N	\N	\N	1	\N	\N	3
1525	VENDA DE YESO MASTER MEDICAL 3X5 EMPAQUE	1	2016-12-16 18:46:16.724907	2016-12-16 18:46:16.724907	\N	\N	\N	\N	\N	2314.0	0.0	150.0	2.0	\N	\N	\N	1	\N	\N	3
1526	VENDA ELASTICA 4X5 YARDAS EMPAQUE INDIVIDUAL	1	2016-12-16 18:46:16.729307	2016-12-16 18:46:16.729307	\N	\N	\N	\N	\N	2029.0	0.0	150.0	4.0	\N	\N	\N	1	\N	\N	3
1527	VENDAJE ELASTOMUL 6 EMPAQUE INDIVIDUAL UNIDAD	1	2016-12-16 18:46:16.740218	2016-12-16 18:46:16.740218	\N	\N	\N	\N	\N	2740.0	0.0	150.0	2.0	\N	\N	\N	1	\N	\N	3
1528	VENLAFAXINA (EFEXOR) 37.5MG CAPSULA - LAB. :	1	2016-12-16 18:46:16.744967	2016-12-16 18:46:16.744967	\N	\N	\N	\N	\N	1528.0	0.0	150.0	3.0	\N	\N	\N	1	\N	\N	3
1529	VERAPAMILO 120MG TABLETA - LAB. :GENFAR SA	1	2016-12-16 18:46:16.75031	2016-12-16 18:46:16.75031	\N	\N	\N	\N	\N	66.0	0.0	150.0	2.0	\N	\N	\N	1	\N	\N	3
1530	VERAPAMILO 80MG TABLETA - LAB. :GENFAR SA	1	2016-12-16 18:46:16.754729	2016-12-16 18:46:16.754729	\N	\N	\N	\N	\N	71.0	0.0	150.0	6.0	\N	\N	\N	1	\N	\N	3
1531	VICRYL 2-0 PLUS (POLIGLACTINA)VIOLETA 90 CT1	1	2016-12-16 18:46:16.760045	2016-12-16 18:46:16.760045	\N	\N	\N	\N	\N	11569.0	0.0	150.0	6.0	\N	\N	\N	1	\N	\N	3
1532	VICRYL 1 PLUS (POLIGLACTINA)VIOLETA 90 CT1 OB/GIN	1	2016-12-16 18:46:16.764362	2016-12-16 18:46:16.764362	\N	\N	\N	\N	\N	8022.0	0.0	150.0	18.0	\N	\N	\N	1	\N	\N	3
1533	VICRYL 3-0 PLUS (POLIGLACTINA) VIOLETA 70 SH	1	2016-12-16 18:46:16.768897	2016-12-16 18:46:16.768897	\N	\N	\N	\N	\N	7063.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
1534	VITAMINA E 400 UI CAPSULA - LAB. :PROCAPS S.A.	1	2016-12-16 18:46:16.773711	2016-12-16 18:46:16.773711	\N	\N	\N	\N	\N	335.0	0.0	150.0	20.0	\N	\N	\N	1	\N	\N	3
1535	WARFARINA (COUMADIN) 5MG TABLETA - LAB. :	1	2016-12-16 18:46:16.778189	2016-12-16 18:46:16.778189	\N	\N	\N	\N	\N	916.0	0.0	150.0	9.0	\N	\N	\N	1	\N	\N	3
1536	ZOLMITRIPTAN (ZOLNOX) 5 MG FRASCO - LAB. :	1	2016-12-16 18:46:16.783035	2016-12-16 18:46:16.783035	\N	\N	\N	\N	\N	51600.0	0.0	150.0	1.0	\N	\N	\N	1	\N	\N	3
1537	Esparadrapo	1	2016-12-16 19:13:19.487325	2016-12-16 19:13:19.487325	\N	\N	\N	\N	\N	4000.0	1.0	20.0	0.0	\N	\N	\N	1	\N	\N	5
1538	Micropore	1	2016-12-16 19:13:51.847011	2016-12-16 19:13:51.847011	\N	\N	\N	\N	\N	957.0	1.0	20.0	0.0	\N	\N	\N	1	\N	\N	5
1539	Maquina de afeitar	1	2016-12-16 19:14:12.469276	2016-12-16 19:14:12.469276	\N	\N	\N	\N	\N	56.0	1.0	20.0	0.0	\N	\N	\N	\N	\N	\N	5
1540	Panines	1	2016-12-16 19:14:45.087533	2016-12-16 19:14:45.087533	\N	\N	\N	\N	\N	37.5	1.0	20.0	0.0	\N	\N	\N	\N	\N	\N	5
1541	Tiras de glocometria	1	2016-12-16 19:15:09.648012	2016-12-16 19:15:09.648012	\N	\N	\N	\N	\N	458.0	1.0	20.0	0.0	\N	\N	\N	\N	\N	\N	5
1542	Gasas	1	2016-12-16 19:15:23.224608	2016-12-16 19:15:23.224608	\N	\N	\N	\N	\N	350.0	1.0	20.0	0.0	\N	\N	\N	\N	\N	\N	5
1543	Guantes para examen	1	2016-12-16 19:15:48.644179	2016-12-16 19:15:48.644179	\N	\N	\N	\N	\N	796.0	1.0	20.0	0.0	\N	\N	\N	\N	\N	\N	5
1544	Wescohex jabón 30ml	1	2016-12-16 19:16:53.479295	2016-12-16 19:16:53.479295	\N	\N	\N	\N	\N	2682.0	1.0	20.0	0.0	\N	\N	\N	\N	\N	\N	5
1545	Wescohex solución 30ml	1	2016-12-16 19:17:23.077801	2016-12-16 19:17:23.077801	\N	\N	\N	\N	\N	2051.0	1.0	20.0	0.0	\N	\N	\N	\N	\N	\N	5
1546	Clorexidina + alcohol etilico 20% 30 ml	1	2016-12-16 19:18:07.686332	2016-12-16 19:18:07.686332	\N	\N	\N	\N	\N	2280.0	1.0	20.0	0.0	\N	\N	\N	1	\N	\N	5
1547	DIPIRONA SODICA 1G AMPOLLA - LAB. :LABORATORIOS ECAR S.A.	1	2016-12-19 18:47:51.223361	2016-12-19 18:47:51.223361	\N	\N	\N	\N	\N	227.0	0.0	20.0	0.0	\N	\N	\N	1	\N	\N	5
1548	PROTAMINA 1.000 AMPOLLAS 5000UI AMPOLLA - LAB. :FARMA DE COLOMBIA S.A.	1	2016-12-19 18:48:11.96702	2016-12-19 18:48:11.96702	\N	\N	\N	\N	\N	16380.0	0.0	20.0	0.0	\N	\N	\N	1	\N	\N	5
1549	BALON BIB 22.0 X 4.0 CM BIB063 WM EMPAQUE INDIVIDUAL UNIDAD - LAB. :WORLD MEDICAL S.A.S.	1	2016-12-19 18:48:35.213238	2016-12-19 18:48:35.213238	\N	\N	\N	\N	\N	2100000.0	0.0	20.0	0.0	\N	\N	\N	1	\N	\N	5
1550	CARTUCHO CARTRIDGE ACT HR 13 LAN 402-03  EMPAQUE INDIVIDUAL UNIDAD - LAB. :MEDTRONIC INC.	1	2016-12-19 18:48:58.641155	2016-12-19 18:48:58.641155	\N	\N	\N	\N	\N	8400.0	0.0	20.0	0.0	\N	\N	\N	1	\N	\N	5
1551	CATETER GUIA 6FR XB3 5SH 670-0550-0 J&J EMPAQUE INDIVIDUAL UNIDAD - LAB. :CORDIS CORPORATION	1	2016-12-19 18:49:28.221323	2016-12-19 18:49:28.221323	\N	\N	\N	\N	\N	265200.0	0.0	20.0	0.0	\N	\N	\N	1	\N	\N	5
1552	CATETER RADIAL AD-SAC 00820-ARROW -20GAX8CM EMPAQUE INDIVIDUAL UNIDAD - LAB. :ARROW MEDICAL DE OCCIDENTE S.A. ARMOC S.A.	1	2016-12-19 18:49:50.808128	2016-12-19 18:49:50.808128	\N	\N	\N	\N	\N	34300.0	0.0	20.0	0.0	\N	\N	\N	1	\N	\N	5
1553	GUIA AMPLATZ SS JTIP 035 X 260 CM 46  502  -HQSP EMPAQUE INDIVIDUAL UNIDAD - LAB. :BOSTON SCIENTIFIC CORPORATION USA	1	2016-12-19 18:50:10.375937	2016-12-19 18:50:10.375937	\N	\N	\N	\N	\N	190240.0	0.0	20.0	0.0	\N	\N	\N	1	\N	\N	5
1554	GUIA HIDROFILICA 0.35 X 150 CM  GA35153M -GEMEDCO S.A.     EMPAQUE INDIVIDUAL UNIDAD - LAB. :GENERAL MEDICA DE COLOMBIA S.A. GEMEDCO S.A.	1	2016-12-19 18:50:31.744088	2016-12-19 18:50:31.744088	\N	\N	\N	\N	\N	171680.0	0.0	20.0	0.0	\N	\N	\N	1	\N	\N	5
1555	INTRODUCTOR  AVANT 6  FR. X 11CM   0.38(0.97MM)-REF: 504-606X   JYJ   EMPAQUE INDIVIDUAL UNIDAD - LAB. :AVANCE MEDICO S.A.	1	2016-12-19 18:50:57.313126	2016-12-19 18:50:57.313126	\N	\N	\N	\N	\N	40800.0	0.0	20.0	0.0	\N	\N	\N	1	\N	\N	5
1556	KIT TRANSDUCTOR PX1X2 DOBLE EMPAQUE INDIVIDUAL UNIDAD - LAB. :UTAH MEDICAL PRODUCTS INC	1	2016-12-19 18:51:18.209772	2016-12-19 18:51:18.209772	\N	\N	\N	\N	\N	117237.0	0.0	20.0	0.0	\N	\N	\N	1	\N	\N	5
1557	MANIFOLD 2 VIAS DERECHO 202HF R -WORLD MEDICAL S.A.S. EMPAQUE INDIVIDUAL UNIDAD - LAB. :WORLD MEDICAL S.A.S.	1	2016-12-19 18:51:39.839397	2016-12-19 18:51:39.839397	\N	\N	\N	\N	\N	19500.0	0.0	20.0	0.0	\N	\N	\N	1	\N	\N	5
1558	BALON BIB 20 X 4 BB018  -WORLD MEDICAL S.A.S  EMPAQUE INDIVIDUAL UNIDAD - LAB. :WORLD MEDICAL S.A.S.	1	2016-12-19 18:51:58.562278	2016-12-19 18:51:58.562278	\N	\N	\N	\N	\N	2100000.0	0.0	20.0	0.0	\N	\N	\N	1	\N	\N	5
1559	CATETER CENTIMETRADO NR5.0  35  100  P  10S  PIG  CSC  20 -TM MEDICAS S.A.       EMPAQUE INDIVIDUAL UNIDAD - LAB. :TM MEDICAS S.A.	1	2016-12-19 18:52:18.752045	2016-12-19 18:52:18.752045	\N	\N	\N	\N	\N	1046040.0	0.0	20.0	0.0	\N	\N	\N	1	\N	\N	5
1560	CATETER DE ANGIOGRAFIA OPTITORQUE RADIAL TIG - 5F- REF :5T16110M-GEMEDCO S.A. EMPAQUE INDIVIDUAL UNIDAD - LAB. :GENERAL MEDICA DE COLOMBIA S.A. GEMEDCO S.A.	1	2016-12-19 18:52:40.317045	2016-12-19 18:52:40.317045	\N	\N	\N	\N	\N	45000.0	0.0	20.0	0.0	\N	\N	\N	1	\N	\N	5
1561	CATETER GUIA ENVOY-MPC-CORDIS - 6FR X .070 X 100 CM- REF: 670-256-00 - J&J EMPAQUE INDIVIDUAL UNIDAD - LAB. :CORDIS CORPORATION	1	2016-12-19 18:53:03.356637	2016-12-19 18:53:03.356637	\N	\N	\N	\N	\N	380000.0	0.0	20.0	0.0	\N	\N	\N	1	\N	\N	5
1562	COIL HELIX NEUROVASCULAR AXIUM 0.010 5MM X 20CM MARCA EV3 - QC-5-20-HELIX- G.B EMPAQUE INDIVIDUAL UNIDAD - LAB. :G. BARCO S.A.	1	2016-12-19 18:53:36.995711	2016-12-19 18:53:36.995711	\N	\N	\N	\N	\N	1187500.0	0.0	20.0	0.0	\N	\N	\N	1	\N	\N	5
1563	GUIA SYNCHRO 2 14 200CM STANDARD M00326410 -STRYKER EMPAQUE INDIVIDUAL UNIDAD - LAB. :STRYKER COLOMBIA S.A.S	1	2016-12-19 18:53:57.608679	2016-12-19 18:53:57.608679	\N	\N	\N	\N	\N	1624000.0	0.0	20.0	0.0	\N	\N	\N	1	\N	\N	5
1564	INTRODUCTOR RADIFOCUS 8 FR X 10CM .38 REF:R80N10MQ GEMEDCO S.A. EMPAQUE INDIVIDUAL UNIDAD - LAB. :GENERAL MEDICA DE COLOMBIA S.A. GEMEDCO S.A.	1	2016-12-19 18:54:22.876017	2016-12-19 18:54:22.876017	\N	\N	\N	\N	\N	45000.0	0.0	20.0	0.0	\N	\N	\N	1	\N	\N	5
1565	STENT-MICRO CATHETER CODMAN ENTERPRISE - 4.5MM 22MM- REF: ENC452212 - J&J EMPAQUE INDIVIDUAL UNIDAD - LAB. :CODMAN & SHURTLEFF INC	1	2016-12-19 18:54:43.990957	2016-12-19 18:54:43.990957	\N	\N	\N	\N	\N	6500000.0	0.0	20.0	0.0	\N	\N	\N	1	\N	\N	5
1566	STENT-MICRO CATHETER CODMAN ENTERPRISE - 4.5MM 28MM- REF: ENC452812 - J&J EMPAQUE INDIVIDUAL UNIDAD - LAB. :CODMAN & SHURTLEFF INC	1	2016-12-19 18:55:17.874387	2016-12-19 18:55:17.874387	\N	\N	\N	\N	\N	6500000.0	0.0	20.0	0.0	\N	\N	\N	1	\N	\N	5
1567	COIL TARGET 360 SOFT 5MMX15CM 5475150 BSC EMPAQUE INDIVIDUAL UNIDAD - LAB. :STRYKER COLOMBIA S.A.S	1	2016-12-19 18:55:39.907913	2016-12-19 18:55:39.907913	\N	\N	\N	\N	\N	910000.0	0.0	20.0	0.0	\N	\N	\N	1	\N	\N	5
\.


--
-- Name: subresources_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('subresources_id_seq', 1567, true);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY users (id, username, email, encrypted_password, salt, created_at, updated_at, role_id) FROM stdin;
\.


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('users_id_seq', 1, false);


--
-- Name: activities_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY activities
    ADD CONSTRAINT activities_pkey PRIMARY KEY (id);


--
-- Name: activity_by_products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY activity_by_products
    ADD CONSTRAINT activity_by_products_pkey PRIMARY KEY (id);


--
-- Name: ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: business_units_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY business_units
    ADD CONSTRAINT business_units_pkey PRIMARY KEY (id);


--
-- Name: cost_by_resources_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY cost_by_resources
    ADD CONSTRAINT cost_by_resources_pkey PRIMARY KEY (id);


--
-- Name: generators_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY generators
    ADD CONSTRAINT generators_pkey PRIMARY KEY (id);


--
-- Name: human_usages_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY human_usages
    ADD CONSTRAINT human_usages_pkey PRIMARY KEY (id);


--
-- Name: indirect_activities_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY indirect_activities
    ADD CONSTRAINT indirect_activities_pkey PRIMARY KEY (id);


--
-- Name: indirect_activity_by_products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY indirect_activity_by_products
    ADD CONSTRAINT indirect_activity_by_products_pkey PRIMARY KEY (id);


--
-- Name: indirect_activity_by_resources_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY indirect_activity_by_resources
    ADD CONSTRAINT indirect_activity_by_resources_pkey PRIMARY KEY (id);


--
-- Name: kardex_acs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY kardex_acs
    ADD CONSTRAINT kardex_acs_pkey PRIMARY KEY (id);


--
-- Name: kardex_aps_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY kardex_aps
    ADD CONSTRAINT kardex_aps_pkey PRIMARY KEY (id);


--
-- Name: kardex_mos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY kardex_mos
    ADD CONSTRAINT kardex_mos_pkey PRIMARY KEY (id);


--
-- Name: kardex_products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY kardex_products
    ADD CONSTRAINT kardex_products_pkey PRIMARY KEY (id);


--
-- Name: kardexes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY kardexes
    ADD CONSTRAINT kardexes_pkey PRIMARY KEY (id);


--
-- Name: macroprocesses_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY macroprocesses
    ADD CONSTRAINT macroprocesses_pkey PRIMARY KEY (id);


--
-- Name: macroproducts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY macroproducts
    ADD CONSTRAINT macroproducts_pkey PRIMARY KEY (id);


--
-- Name: meters_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY meters
    ADD CONSTRAINT meters_pkey PRIMARY KEY (id);


--
-- Name: op_cost_by_resources_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY op_cost_by_resources
    ADD CONSTRAINT op_cost_by_resources_pkey PRIMARY KEY (id);


--
-- Name: positions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY positions
    ADD CONSTRAINT positions_pkey PRIMARY KEY (id);


--
-- Name: procedures_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY procedures
    ADD CONSTRAINT procedures_pkey PRIMARY KEY (id);


--
-- Name: production_order_identifiers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY production_order_identifiers
    ADD CONSTRAINT production_order_identifiers_pkey PRIMARY KEY (id);


--
-- Name: production_orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY production_orders
    ADD CONSTRAINT production_orders_pkey PRIMARY KEY (id);


--
-- Name: products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


--
-- Name: providers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY providers
    ADD CONSTRAINT providers_pkey PRIMARY KEY (id);


--
-- Name: resources_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY resources
    ADD CONSTRAINT resources_pkey PRIMARY KEY (id);


--
-- Name: roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);


--
-- Name: subprocedures_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY subprocedures
    ADD CONSTRAINT subprocedures_pkey PRIMARY KEY (id);


--
-- Name: subresources_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY subresources
    ADD CONSTRAINT subresources_pkey PRIMARY KEY (id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: index_activities_on_generator_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_activities_on_generator_id ON activities USING btree (generator_id);


--
-- Name: index_activities_on_subprocedure_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_activities_on_subprocedure_id ON activities USING btree (subprocedure_id);


--
-- Name: index_activity_by_products_on_activity_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_activity_by_products_on_activity_id ON activity_by_products USING btree (activity_id);


--
-- Name: index_activity_by_products_on_product_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_activity_by_products_on_product_id ON activity_by_products USING btree (product_id);


--
-- Name: index_cost_by_resources_on_activity_by_product_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_cost_by_resources_on_activity_by_product_id ON cost_by_resources USING btree (activity_by_product_id);


--
-- Name: index_cost_by_resources_on_meter_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_cost_by_resources_on_meter_id ON cost_by_resources USING btree (meter_id);


--
-- Name: index_cost_by_resources_on_resource_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_cost_by_resources_on_resource_id ON cost_by_resources USING btree (resource_id);


--
-- Name: index_cost_by_resources_on_subresource_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_cost_by_resources_on_subresource_id ON cost_by_resources USING btree (subresource_id);


--
-- Name: index_human_usages_on_meter_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_human_usages_on_meter_id ON human_usages USING btree (meter_id);


--
-- Name: index_human_usages_on_subresource_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_human_usages_on_subresource_id ON human_usages USING btree (subresource_id);


--
-- Name: index_indirect_activities_on_generator_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_indirect_activities_on_generator_id ON indirect_activities USING btree (generator_id);


--
-- Name: index_indirect_activities_on_subprocedure_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_indirect_activities_on_subprocedure_id ON indirect_activities USING btree (subprocedure_id);


--
-- Name: index_indirect_activity_by_products_on_indirect_activity_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_indirect_activity_by_products_on_indirect_activity_id ON indirect_activity_by_products USING btree (indirect_activity_id);


--
-- Name: index_indirect_activity_by_products_on_product_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_indirect_activity_by_products_on_product_id ON indirect_activity_by_products USING btree (product_id);


--
-- Name: index_indirect_activity_by_resources_on_indirect_activity_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_indirect_activity_by_resources_on_indirect_activity_id ON indirect_activity_by_resources USING btree (indirect_activity_id);


--
-- Name: index_indirect_activity_by_resources_on_meter_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_indirect_activity_by_resources_on_meter_id ON indirect_activity_by_resources USING btree (meter_id);


--
-- Name: index_indirect_activity_by_resources_on_resource_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_indirect_activity_by_resources_on_resource_id ON indirect_activity_by_resources USING btree (resource_id);


--
-- Name: index_indirect_activity_by_resources_on_subresource_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_indirect_activity_by_resources_on_subresource_id ON indirect_activity_by_resources USING btree (subresource_id);


--
-- Name: index_kardex_products_on_meter_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_kardex_products_on_meter_id ON kardex_products USING btree (meter_id);


--
-- Name: index_kardex_products_on_product_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_kardex_products_on_product_id ON kardex_products USING btree (product_id);


--
-- Name: index_kardex_products_on_production_order_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_kardex_products_on_production_order_id ON kardex_products USING btree (production_order_id);


--
-- Name: index_kardexes_on_meter_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_kardexes_on_meter_id ON kardexes USING btree (meter_id);


--
-- Name: index_kardexes_on_provider_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_kardexes_on_provider_id ON kardexes USING btree (provider_id);


--
-- Name: index_kardexes_on_subresource_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_kardexes_on_subresource_id ON kardexes USING btree (subresource_id);


--
-- Name: index_macroprocesses_on_business_unit_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_macroprocesses_on_business_unit_id ON macroprocesses USING btree (business_unit_id);


--
-- Name: index_op_cost_by_resources_on_activity_by_product_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_op_cost_by_resources_on_activity_by_product_id ON op_cost_by_resources USING btree (activity_by_product_id);


--
-- Name: index_op_cost_by_resources_on_meter_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_op_cost_by_resources_on_meter_id ON op_cost_by_resources USING btree (meter_id);


--
-- Name: index_op_cost_by_resources_on_production_order_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_op_cost_by_resources_on_production_order_id ON op_cost_by_resources USING btree (production_order_id);


--
-- Name: index_op_cost_by_resources_on_resource_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_op_cost_by_resources_on_resource_id ON op_cost_by_resources USING btree (resource_id);


--
-- Name: index_op_cost_by_resources_on_subresource_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_op_cost_by_resources_on_subresource_id ON op_cost_by_resources USING btree (subresource_id);


--
-- Name: index_procedures_on_macroprocess_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_procedures_on_macroprocess_id ON procedures USING btree (macroprocess_id);


--
-- Name: index_production_orders_on_product_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_production_orders_on_product_id ON production_orders USING btree (product_id);


--
-- Name: index_products_on_macroproduct_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_products_on_macroproduct_id ON products USING btree (macroproduct_id);


--
-- Name: index_sessions_on_user_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_sessions_on_user_id ON sessions USING btree (user_id);


--
-- Name: index_subprocedures_on_procedure_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_subprocedures_on_procedure_id ON subprocedures USING btree (procedure_id);


--
-- Name: index_subresources_on_meter_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_subresources_on_meter_id ON subresources USING btree (meter_id);


--
-- Name: index_subresources_on_position_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_subresources_on_position_id ON subresources USING btree (position_id);


--
-- Name: index_subresources_on_provider_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_subresources_on_provider_id ON subresources USING btree (provider_id);


--
-- Name: index_subresources_on_resource_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_subresources_on_resource_id ON subresources USING btree (resource_id);


--
-- Name: index_users_on_role_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_users_on_role_id ON users USING btree (role_id);


--
-- Name: fk_rails_048f6ad6ed; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY subresources
    ADD CONSTRAINT fk_rails_048f6ad6ed FOREIGN KEY (meter_id) REFERENCES meters(id);


--
-- Name: fk_rails_0ab782b657; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY subprocedures
    ADD CONSTRAINT fk_rails_0ab782b657 FOREIGN KEY (procedure_id) REFERENCES procedures(id);


--
-- Name: fk_rails_0d245fe1b8; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY human_usages
    ADD CONSTRAINT fk_rails_0d245fe1b8 FOREIGN KEY (subresource_id) REFERENCES subresources(id);


--
-- Name: fk_rails_1fbc29f9b9; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY indirect_activities
    ADD CONSTRAINT fk_rails_1fbc29f9b9 FOREIGN KEY (generator_id) REFERENCES generators(id);


--
-- Name: fk_rails_204f064956; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY subresources
    ADD CONSTRAINT fk_rails_204f064956 FOREIGN KEY (provider_id) REFERENCES providers(id);


--
-- Name: fk_rails_20e8d56d13; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY kardex_products
    ADD CONSTRAINT fk_rails_20e8d56d13 FOREIGN KEY (production_order_id) REFERENCES production_orders(id);


--
-- Name: fk_rails_21e248ddff; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY subresources
    ADD CONSTRAINT fk_rails_21e248ddff FOREIGN KEY (resource_id) REFERENCES resources(id);


--
-- Name: fk_rails_296442084d; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY activity_by_products
    ADD CONSTRAINT fk_rails_296442084d FOREIGN KEY (activity_id) REFERENCES activities(id);


--
-- Name: fk_rails_4afc404cda; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY kardexes
    ADD CONSTRAINT fk_rails_4afc404cda FOREIGN KEY (meter_id) REFERENCES meters(id);


--
-- Name: fk_rails_50fdc8c63a; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY indirect_activity_by_products
    ADD CONSTRAINT fk_rails_50fdc8c63a FOREIGN KEY (product_id) REFERENCES products(id);


--
-- Name: fk_rails_51e67e1e6c; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY op_cost_by_resources
    ADD CONSTRAINT fk_rails_51e67e1e6c FOREIGN KEY (resource_id) REFERENCES resources(id);


--
-- Name: fk_rails_5326636a36; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY subresources
    ADD CONSTRAINT fk_rails_5326636a36 FOREIGN KEY (position_id) REFERENCES positions(id);


--
-- Name: fk_rails_5cf2975707; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY products
    ADD CONSTRAINT fk_rails_5cf2975707 FOREIGN KEY (macroproduct_id) REFERENCES macroproducts(id);


--
-- Name: fk_rails_5f0e9f1e48; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY op_cost_by_resources
    ADD CONSTRAINT fk_rails_5f0e9f1e48 FOREIGN KEY (meter_id) REFERENCES meters(id);


--
-- Name: fk_rails_621aa954c7; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cost_by_resources
    ADD CONSTRAINT fk_rails_621aa954c7 FOREIGN KEY (meter_id) REFERENCES meters(id);


--
-- Name: fk_rails_642f17018b; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY users
    ADD CONSTRAINT fk_rails_642f17018b FOREIGN KEY (role_id) REFERENCES roles(id);


--
-- Name: fk_rails_6a056f19ae; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY kardex_products
    ADD CONSTRAINT fk_rails_6a056f19ae FOREIGN KEY (meter_id) REFERENCES meters(id);


--
-- Name: fk_rails_6bce7133b8; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cost_by_resources
    ADD CONSTRAINT fk_rails_6bce7133b8 FOREIGN KEY (resource_id) REFERENCES resources(id);


--
-- Name: fk_rails_70882fda8f; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY op_cost_by_resources
    ADD CONSTRAINT fk_rails_70882fda8f FOREIGN KEY (activity_by_product_id) REFERENCES activity_by_products(id);


--
-- Name: fk_rails_70acf54258; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cost_by_resources
    ADD CONSTRAINT fk_rails_70acf54258 FOREIGN KEY (subresource_id) REFERENCES subresources(id);


--
-- Name: fk_rails_74273dd032; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY kardex_products
    ADD CONSTRAINT fk_rails_74273dd032 FOREIGN KEY (product_id) REFERENCES products(id);


--
-- Name: fk_rails_758836b4f0; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY sessions
    ADD CONSTRAINT fk_rails_758836b4f0 FOREIGN KEY (user_id) REFERENCES users(id);


--
-- Name: fk_rails_75a62b46bb; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY activity_by_products
    ADD CONSTRAINT fk_rails_75a62b46bb FOREIGN KEY (product_id) REFERENCES products(id);


--
-- Name: fk_rails_7670b3ef09; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY macroprocesses
    ADD CONSTRAINT fk_rails_7670b3ef09 FOREIGN KEY (business_unit_id) REFERENCES business_units(id);


--
-- Name: fk_rails_78092cbcc5; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY indirect_activities
    ADD CONSTRAINT fk_rails_78092cbcc5 FOREIGN KEY (subprocedure_id) REFERENCES subprocedures(id);


--
-- Name: fk_rails_7b548d513e; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY indirect_activity_by_resources
    ADD CONSTRAINT fk_rails_7b548d513e FOREIGN KEY (meter_id) REFERENCES meters(id);


--
-- Name: fk_rails_92a3e745af; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY indirect_activity_by_resources
    ADD CONSTRAINT fk_rails_92a3e745af FOREIGN KEY (resource_id) REFERENCES resources(id);


--
-- Name: fk_rails_93aa141fbc; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY activities
    ADD CONSTRAINT fk_rails_93aa141fbc FOREIGN KEY (generator_id) REFERENCES generators(id);


--
-- Name: fk_rails_a24a731b85; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY kardexes
    ADD CONSTRAINT fk_rails_a24a731b85 FOREIGN KEY (provider_id) REFERENCES providers(id);


--
-- Name: fk_rails_a5388065fb; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY procedures
    ADD CONSTRAINT fk_rails_a5388065fb FOREIGN KEY (macroprocess_id) REFERENCES macroprocesses(id);


--
-- Name: fk_rails_a71ba6db58; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY activities
    ADD CONSTRAINT fk_rails_a71ba6db58 FOREIGN KEY (subprocedure_id) REFERENCES subprocedures(id);


--
-- Name: fk_rails_a82728f91a; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY indirect_activity_by_resources
    ADD CONSTRAINT fk_rails_a82728f91a FOREIGN KEY (subresource_id) REFERENCES subresources(id);


--
-- Name: fk_rails_b2749b7d78; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY indirect_activity_by_resources
    ADD CONSTRAINT fk_rails_b2749b7d78 FOREIGN KEY (indirect_activity_id) REFERENCES indirect_activities(id);


--
-- Name: fk_rails_b45fb21cdc; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY production_orders
    ADD CONSTRAINT fk_rails_b45fb21cdc FOREIGN KEY (product_id) REFERENCES products(id);


--
-- Name: fk_rails_bb358b7290; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cost_by_resources
    ADD CONSTRAINT fk_rails_bb358b7290 FOREIGN KEY (activity_by_product_id) REFERENCES activity_by_products(id);


--
-- Name: fk_rails_c26c32d975; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY op_cost_by_resources
    ADD CONSTRAINT fk_rails_c26c32d975 FOREIGN KEY (production_order_id) REFERENCES production_orders(id);


--
-- Name: fk_rails_cd3e9d1319; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY kardexes
    ADD CONSTRAINT fk_rails_cd3e9d1319 FOREIGN KEY (subresource_id) REFERENCES subresources(id);


--
-- Name: fk_rails_d7bf65e75a; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY op_cost_by_resources
    ADD CONSTRAINT fk_rails_d7bf65e75a FOREIGN KEY (subresource_id) REFERENCES subresources(id);


--
-- Name: fk_rails_f085cc433e; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY indirect_activity_by_products
    ADD CONSTRAINT fk_rails_f085cc433e FOREIGN KEY (indirect_activity_id) REFERENCES indirect_activities(id);


--
-- Name: fk_rails_f49bb46491; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY human_usages
    ADD CONSTRAINT fk_rails_f49bb46491 FOREIGN KEY (meter_id) REFERENCES meters(id);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

