--
-- PostgreSQL database dump
--

-- Dumped from database version 16.7 (Debian 16.7-1.pgdg120+1)
-- Dumped by pg_dump version 16.4

-- Started on 2025-03-04 23:00:52

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

--
-- TOC entry 5 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: ciudad_limpia_user
--

-- *not* creating schema, since initdb creates it


ALTER SCHEMA public OWNER TO ciudad_limpia_user;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 215 (class 1259 OID 16399)
-- Name: failed_jobs; Type: TABLE; Schema: public; Owner: ciudad_limpia_user
--

CREATE TABLE public.failed_jobs (
    id bigint NOT NULL,
    uuid character varying(255) NOT NULL,
    connection text NOT NULL,
    queue text NOT NULL,
    payload text NOT NULL,
    exception text NOT NULL,
    failed_at timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.failed_jobs OWNER TO ciudad_limpia_user;

--
-- TOC entry 216 (class 1259 OID 16405)
-- Name: failed_jobs_id_seq; Type: SEQUENCE; Schema: public; Owner: ciudad_limpia_user
--

CREATE SEQUENCE public.failed_jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.failed_jobs_id_seq OWNER TO ciudad_limpia_user;

--
-- TOC entry 3653 (class 0 OID 0)
-- Dependencies: 216
-- Name: failed_jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ciudad_limpia_user
--

ALTER SEQUENCE public.failed_jobs_id_seq OWNED BY public.failed_jobs.id;


--
-- TOC entry 246 (class 1259 OID 16636)
-- Name: incidencias; Type: TABLE; Schema: public; Owner: ciudad_limpia_user
--

CREATE TABLE public.incidencias (
    id bigint NOT NULL,
    tipo character varying(191) NOT NULL,
    ubicacion character varying(191) NOT NULL,
    descripcion text NOT NULL,
    fecha timestamp(0) without time zone NOT NULL,
    estado character varying(191) DEFAULT 'pendiente'::character varying NOT NULL,
    prioridad character varying(191) NOT NULL,
    latitud numeric(10,8),
    longitud numeric(11,8),
    infraestructura_id bigint NOT NULL,
    tecnico_id bigint,
    ciudadano_id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    deleted_at timestamp(0) without time zone
);


ALTER TABLE public.incidencias OWNER TO ciudad_limpia_user;

--
-- TOC entry 245 (class 1259 OID 16635)
-- Name: incidencias_id_seq; Type: SEQUENCE; Schema: public; Owner: ciudad_limpia_user
--

CREATE SEQUENCE public.incidencias_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.incidencias_id_seq OWNER TO ciudad_limpia_user;

--
-- TOC entry 3654 (class 0 OID 0)
-- Dependencies: 245
-- Name: incidencias_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ciudad_limpia_user
--

ALTER SEQUENCE public.incidencias_id_seq OWNED BY public.incidencias.id;


--
-- TOC entry 217 (class 1259 OID 16406)
-- Name: incident_history; Type: TABLE; Schema: public; Owner: ciudad_limpia_user
--

CREATE TABLE public.incident_history (
    id bigint NOT NULL,
    incident_id bigint NOT NULL,
    user_id bigint NOT NULL,
    status_id bigint NOT NULL,
    comment text NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.incident_history OWNER TO ciudad_limpia_user;

--
-- TOC entry 218 (class 1259 OID 16411)
-- Name: incident_history_id_seq; Type: SEQUENCE; Schema: public; Owner: ciudad_limpia_user
--

CREATE SEQUENCE public.incident_history_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.incident_history_id_seq OWNER TO ciudad_limpia_user;

--
-- TOC entry 3655 (class 0 OID 0)
-- Dependencies: 218
-- Name: incident_history_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ciudad_limpia_user
--

ALTER SEQUENCE public.incident_history_id_seq OWNED BY public.incident_history.id;


--
-- TOC entry 219 (class 1259 OID 16412)
-- Name: incident_photos; Type: TABLE; Schema: public; Owner: ciudad_limpia_user
--

CREATE TABLE public.incident_photos (
    id bigint NOT NULL,
    incident_id bigint NOT NULL,
    path character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.incident_photos OWNER TO ciudad_limpia_user;

--
-- TOC entry 220 (class 1259 OID 16415)
-- Name: incident_photos_id_seq; Type: SEQUENCE; Schema: public; Owner: ciudad_limpia_user
--

CREATE SEQUENCE public.incident_photos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.incident_photos_id_seq OWNER TO ciudad_limpia_user;

--
-- TOC entry 3656 (class 0 OID 0)
-- Dependencies: 220
-- Name: incident_photos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ciudad_limpia_user
--

ALTER SEQUENCE public.incident_photos_id_seq OWNED BY public.incident_photos.id;


--
-- TOC entry 221 (class 1259 OID 16416)
-- Name: incidents; Type: TABLE; Schema: public; Owner: ciudad_limpia_user
--

CREATE TABLE public.incidents (
    id bigint NOT NULL,
    title character varying(255) NOT NULL,
    description text NOT NULL,
    infrastructure_id bigint NOT NULL,
    status_id bigint NOT NULL,
    priority character varying(255) NOT NULL,
    latitude numeric(10,8) NOT NULL,
    longitude numeric(11,8) NOT NULL,
    user_id bigint NOT NULL,
    assigned_to bigint,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    deleted_at timestamp(0) without time zone
);


ALTER TABLE public.incidents OWNER TO ciudad_limpia_user;

--
-- TOC entry 222 (class 1259 OID 16421)
-- Name: incidents_id_seq; Type: SEQUENCE; Schema: public; Owner: ciudad_limpia_user
--

CREATE SEQUENCE public.incidents_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.incidents_id_seq OWNER TO ciudad_limpia_user;

--
-- TOC entry 3657 (class 0 OID 0)
-- Dependencies: 222
-- Name: incidents_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ciudad_limpia_user
--

ALTER SEQUENCE public.incidents_id_seq OWNED BY public.incidents.id;


--
-- TOC entry 244 (class 1259 OID 16623)
-- Name: infraestructuras; Type: TABLE; Schema: public; Owner: ciudad_limpia_user
--

CREATE TABLE public.infraestructuras (
    id bigint NOT NULL,
    nombre character varying(191) NOT NULL,
    tipo character varying(191) NOT NULL,
    descripcion text,
    ubicacion character varying(191) NOT NULL,
    latitud numeric(10,8) NOT NULL,
    longitud numeric(11,8) NOT NULL,
    estado character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    deleted_at timestamp(0) without time zone,
    CONSTRAINT infraestructuras_estado_check CHECK (((estado)::text = ANY ((ARRAY['Operativo'::character varying, 'En Mantenimiento'::character varying, 'Fuera de Servicio'::character varying])::text[])))
);


ALTER TABLE public.infraestructuras OWNER TO ciudad_limpia_user;

--
-- TOC entry 243 (class 1259 OID 16622)
-- Name: infraestructuras_id_seq; Type: SEQUENCE; Schema: public; Owner: ciudad_limpia_user
--

CREATE SEQUENCE public.infraestructuras_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.infraestructuras_id_seq OWNER TO ciudad_limpia_user;

--
-- TOC entry 3658 (class 0 OID 0)
-- Dependencies: 243
-- Name: infraestructuras_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ciudad_limpia_user
--

ALTER SEQUENCE public.infraestructuras_id_seq OWNED BY public.infraestructuras.id;


--
-- TOC entry 223 (class 1259 OID 16422)
-- Name: infrastructures; Type: TABLE; Schema: public; Owner: ciudad_limpia_user
--

CREATE TABLE public.infrastructures (
    id bigint NOT NULL,
    nombre character varying(255) NOT NULL,
    descripcion text,
    latitude numeric(10,8) NOT NULL,
    longitude numeric(11,8) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    deleted_at timestamp(0) without time zone
);


ALTER TABLE public.infrastructures OWNER TO ciudad_limpia_user;

--
-- TOC entry 224 (class 1259 OID 16427)
-- Name: infrastructures_id_seq; Type: SEQUENCE; Schema: public; Owner: ciudad_limpia_user
--

CREATE SEQUENCE public.infrastructures_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.infrastructures_id_seq OWNER TO ciudad_limpia_user;

--
-- TOC entry 3659 (class 0 OID 0)
-- Dependencies: 224
-- Name: infrastructures_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ciudad_limpia_user
--

ALTER SEQUENCE public.infrastructures_id_seq OWNED BY public.infrastructures.id;


--
-- TOC entry 261 (class 1259 OID 16769)
-- Name: jobs; Type: TABLE; Schema: public; Owner: ciudad_limpia_user
--

CREATE TABLE public.jobs (
    id bigint NOT NULL,
    queue character varying(191) NOT NULL,
    payload text NOT NULL,
    attempts smallint NOT NULL,
    reserved_at integer,
    available_at integer NOT NULL,
    created_at integer NOT NULL
);


ALTER TABLE public.jobs OWNER TO ciudad_limpia_user;

--
-- TOC entry 260 (class 1259 OID 16768)
-- Name: jobs_id_seq; Type: SEQUENCE; Schema: public; Owner: ciudad_limpia_user
--

CREATE SEQUENCE public.jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.jobs_id_seq OWNER TO ciudad_limpia_user;

--
-- TOC entry 3660 (class 0 OID 0)
-- Dependencies: 260
-- Name: jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ciudad_limpia_user
--

ALTER SEQUENCE public.jobs_id_seq OWNED BY public.jobs.id;


--
-- TOC entry 254 (class 1259 OID 16715)
-- Name: mantenimiento_preventivo; Type: TABLE; Schema: public; Owner: ciudad_limpia_user
--

CREATE TABLE public.mantenimiento_preventivo (
    id bigint NOT NULL,
    infraestructura_id bigint NOT NULL,
    nombre character varying(191) NOT NULL,
    descripcion text NOT NULL,
    frecuencia character varying(255) NOT NULL,
    dias_frecuencia integer NOT NULL,
    ultima_ejecucion date,
    proxima_ejecucion date NOT NULL,
    checklist json,
    costo_estimado numeric(10,2),
    duracion_estimada integer NOT NULL,
    materiales_requeridos json,
    personal_requerido json,
    activo boolean DEFAULT true NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    deleted_at timestamp(0) without time zone,
    CONSTRAINT mantenimiento_preventivo_frecuencia_check CHECK (((frecuencia)::text = ANY ((ARRAY['diaria'::character varying, 'semanal'::character varying, 'mensual'::character varying, 'trimestral'::character varying, 'semestral'::character varying, 'anual'::character varying])::text[])))
);


ALTER TABLE public.mantenimiento_preventivo OWNER TO ciudad_limpia_user;

--
-- TOC entry 3661 (class 0 OID 0)
-- Dependencies: 254
-- Name: COLUMN mantenimiento_preventivo.duracion_estimada; Type: COMMENT; Schema: public; Owner: ciudad_limpia_user
--

COMMENT ON COLUMN public.mantenimiento_preventivo.duracion_estimada IS 'en minutos';


--
-- TOC entry 253 (class 1259 OID 16714)
-- Name: mantenimiento_preventivo_id_seq; Type: SEQUENCE; Schema: public; Owner: ciudad_limpia_user
--

CREATE SEQUENCE public.mantenimiento_preventivo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.mantenimiento_preventivo_id_seq OWNER TO ciudad_limpia_user;

--
-- TOC entry 3662 (class 0 OID 0)
-- Dependencies: 253
-- Name: mantenimiento_preventivo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ciudad_limpia_user
--

ALTER SEQUENCE public.mantenimiento_preventivo_id_seq OWNED BY public.mantenimiento_preventivo.id;


--
-- TOC entry 250 (class 1259 OID 16680)
-- Name: materiales; Type: TABLE; Schema: public; Owner: ciudad_limpia_user
--

CREATE TABLE public.materiales (
    id bigint NOT NULL,
    nombre character varying(191) NOT NULL,
    descripcion text NOT NULL,
    cantidad_disponible integer NOT NULL,
    costo_unitario numeric(10,2) NOT NULL,
    unidad_medida character varying(191) NOT NULL,
    stock_minimo integer NOT NULL,
    stock_maximo integer,
    ubicacion_almacen character varying(191),
    codigo_interno character varying(191) NOT NULL,
    proveedores json,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    deleted_at timestamp(0) without time zone
);


ALTER TABLE public.materiales OWNER TO ciudad_limpia_user;

--
-- TOC entry 249 (class 1259 OID 16679)
-- Name: materiales_id_seq; Type: SEQUENCE; Schema: public; Owner: ciudad_limpia_user
--

CREATE SEQUENCE public.materiales_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.materiales_id_seq OWNER TO ciudad_limpia_user;

--
-- TOC entry 3663 (class 0 OID 0)
-- Dependencies: 249
-- Name: materiales_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ciudad_limpia_user
--

ALTER SEQUENCE public.materiales_id_seq OWNED BY public.materiales.id;


--
-- TOC entry 225 (class 1259 OID 16428)
-- Name: migrations; Type: TABLE; Schema: public; Owner: ciudad_limpia_user
--

CREATE TABLE public.migrations (
    id integer NOT NULL,
    migration character varying(255) NOT NULL,
    batch integer NOT NULL
);


ALTER TABLE public.migrations OWNER TO ciudad_limpia_user;

--
-- TOC entry 226 (class 1259 OID 16431)
-- Name: migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: ciudad_limpia_user
--

CREATE SEQUENCE public.migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.migrations_id_seq OWNER TO ciudad_limpia_user;

--
-- TOC entry 3664 (class 0 OID 0)
-- Dependencies: 226
-- Name: migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ciudad_limpia_user
--

ALTER SEQUENCE public.migrations_id_seq OWNED BY public.migrations.id;


--
-- TOC entry 227 (class 1259 OID 16432)
-- Name: model_has_permissions; Type: TABLE; Schema: public; Owner: ciudad_limpia_user
--

CREATE TABLE public.model_has_permissions (
    permission_id bigint NOT NULL,
    model_type character varying(255) NOT NULL,
    model_id bigint NOT NULL
);


ALTER TABLE public.model_has_permissions OWNER TO ciudad_limpia_user;

--
-- TOC entry 228 (class 1259 OID 16435)
-- Name: model_has_roles; Type: TABLE; Schema: public; Owner: ciudad_limpia_user
--

CREATE TABLE public.model_has_roles (
    role_id bigint NOT NULL,
    model_type character varying(255) NOT NULL,
    model_id bigint NOT NULL
);


ALTER TABLE public.model_has_roles OWNER TO ciudad_limpia_user;

--
-- TOC entry 259 (class 1259 OID 16760)
-- Name: notifications; Type: TABLE; Schema: public; Owner: ciudad_limpia_user
--

CREATE TABLE public.notifications (
    id uuid NOT NULL,
    type character varying(191) NOT NULL,
    notifiable_type character varying(191) NOT NULL,
    notifiable_id bigint NOT NULL,
    data text NOT NULL,
    read_at timestamp(0) without time zone,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.notifications OWNER TO ciudad_limpia_user;

--
-- TOC entry 252 (class 1259 OID 16691)
-- Name: ordenes_trabajo; Type: TABLE; Schema: public; Owner: ciudad_limpia_user
--

CREATE TABLE public.ordenes_trabajo (
    id bigint NOT NULL,
    codigo character varying(191) NOT NULL,
    incidencia_id bigint,
    infraestructura_id bigint NOT NULL,
    tipo character varying(255) NOT NULL,
    estado character varying(255) NOT NULL,
    prioridad character varying(255) NOT NULL,
    descripcion text NOT NULL,
    fecha_programada timestamp(0) without time zone NOT NULL,
    fecha_inicio timestamp(0) without time zone,
    fecha_fin timestamp(0) without time zone,
    costo_estimado numeric(10,2),
    costo_real numeric(10,2),
    materiales_requeridos json,
    personal_asignado json,
    observaciones text,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    deleted_at timestamp(0) without time zone,
    CONSTRAINT ordenes_trabajo_estado_check CHECK (((estado)::text = ANY ((ARRAY['pendiente'::character varying, 'en_proceso'::character varying, 'completada'::character varying, 'cancelada'::character varying])::text[]))),
    CONSTRAINT ordenes_trabajo_prioridad_check CHECK (((prioridad)::text = ANY ((ARRAY['baja'::character varying, 'media'::character varying, 'alta'::character varying, 'critica'::character varying])::text[]))),
    CONSTRAINT ordenes_trabajo_tipo_check CHECK (((tipo)::text = ANY ((ARRAY['correctivo'::character varying, 'preventivo'::character varying])::text[])))
);


ALTER TABLE public.ordenes_trabajo OWNER TO ciudad_limpia_user;

--
-- TOC entry 251 (class 1259 OID 16690)
-- Name: ordenes_trabajo_id_seq; Type: SEQUENCE; Schema: public; Owner: ciudad_limpia_user
--

CREATE SEQUENCE public.ordenes_trabajo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.ordenes_trabajo_id_seq OWNER TO ciudad_limpia_user;

--
-- TOC entry 3665 (class 0 OID 0)
-- Dependencies: 251
-- Name: ordenes_trabajo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ciudad_limpia_user
--

ALTER SEQUENCE public.ordenes_trabajo_id_seq OWNED BY public.ordenes_trabajo.id;


--
-- TOC entry 229 (class 1259 OID 16438)
-- Name: password_resets; Type: TABLE; Schema: public; Owner: ciudad_limpia_user
--

CREATE TABLE public.password_resets (
    email character varying(255) NOT NULL,
    token character varying(255) NOT NULL,
    created_at timestamp(0) without time zone
);


ALTER TABLE public.password_resets OWNER TO ciudad_limpia_user;

--
-- TOC entry 230 (class 1259 OID 16443)
-- Name: permissions; Type: TABLE; Schema: public; Owner: ciudad_limpia_user
--

CREATE TABLE public.permissions (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    guard_name character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.permissions OWNER TO ciudad_limpia_user;

--
-- TOC entry 231 (class 1259 OID 16448)
-- Name: permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: ciudad_limpia_user
--

CREATE SEQUENCE public.permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.permissions_id_seq OWNER TO ciudad_limpia_user;

--
-- TOC entry 3666 (class 0 OID 0)
-- Dependencies: 231
-- Name: permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ciudad_limpia_user
--

ALTER SEQUENCE public.permissions_id_seq OWNED BY public.permissions.id;


--
-- TOC entry 248 (class 1259 OID 16665)
-- Name: personal; Type: TABLE; Schema: public; Owner: ciudad_limpia_user
--

CREATE TABLE public.personal (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    especialidad character varying(191) NOT NULL,
    disponibilidad character varying(255) NOT NULL,
    habilidades json,
    telefono character varying(191) NOT NULL,
    direccion character varying(191) NOT NULL,
    notas text,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    deleted_at timestamp(0) without time zone,
    CONSTRAINT personal_disponibilidad_check CHECK (((disponibilidad)::text = ANY ((ARRAY['disponible'::character varying, 'ocupado'::character varying, 'ausente'::character varying])::text[])))
);


ALTER TABLE public.personal OWNER TO ciudad_limpia_user;

--
-- TOC entry 232 (class 1259 OID 16449)
-- Name: personal_access_tokens; Type: TABLE; Schema: public; Owner: ciudad_limpia_user
--

CREATE TABLE public.personal_access_tokens (
    id bigint NOT NULL,
    tokenable_type character varying(255) NOT NULL,
    tokenable_id bigint NOT NULL,
    name character varying(255) NOT NULL,
    token character varying(64) NOT NULL,
    abilities text,
    last_used_at timestamp(0) without time zone,
    expires_at timestamp(0) without time zone,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.personal_access_tokens OWNER TO ciudad_limpia_user;

--
-- TOC entry 233 (class 1259 OID 16454)
-- Name: personal_access_tokens_id_seq; Type: SEQUENCE; Schema: public; Owner: ciudad_limpia_user
--

CREATE SEQUENCE public.personal_access_tokens_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.personal_access_tokens_id_seq OWNER TO ciudad_limpia_user;

--
-- TOC entry 3667 (class 0 OID 0)
-- Dependencies: 233
-- Name: personal_access_tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ciudad_limpia_user
--

ALTER SEQUENCE public.personal_access_tokens_id_seq OWNED BY public.personal_access_tokens.id;


--
-- TOC entry 247 (class 1259 OID 16664)
-- Name: personal_id_seq; Type: SEQUENCE; Schema: public; Owner: ciudad_limpia_user
--

CREATE SEQUENCE public.personal_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.personal_id_seq OWNER TO ciudad_limpia_user;

--
-- TOC entry 3668 (class 0 OID 0)
-- Dependencies: 247
-- Name: personal_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ciudad_limpia_user
--

ALTER SEQUENCE public.personal_id_seq OWNED BY public.personal.id;


--
-- TOC entry 256 (class 1259 OID 16731)
-- Name: presupuestos; Type: TABLE; Schema: public; Owner: ciudad_limpia_user
--

CREATE TABLE public.presupuestos (
    id bigint NOT NULL,
    "año" integer NOT NULL,
    mes integer NOT NULL,
    monto_asignado numeric(12,2) NOT NULL,
    monto_ejecutado numeric(12,2) DEFAULT '0'::numeric NOT NULL,
    monto_comprometido numeric(12,2) DEFAULT '0'::numeric NOT NULL,
    categoria character varying(191) NOT NULL,
    zona character varying(191),
    desglose json,
    notas text,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    deleted_at timestamp(0) without time zone
);


ALTER TABLE public.presupuestos OWNER TO ciudad_limpia_user;

--
-- TOC entry 255 (class 1259 OID 16730)
-- Name: presupuestos_id_seq; Type: SEQUENCE; Schema: public; Owner: ciudad_limpia_user
--

CREATE SEQUENCE public.presupuestos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.presupuestos_id_seq OWNER TO ciudad_limpia_user;

--
-- TOC entry 3669 (class 0 OID 0)
-- Dependencies: 255
-- Name: presupuestos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ciudad_limpia_user
--

ALTER SEQUENCE public.presupuestos_id_seq OWNED BY public.presupuestos.id;


--
-- TOC entry 234 (class 1259 OID 16455)
-- Name: role_has_permissions; Type: TABLE; Schema: public; Owner: ciudad_limpia_user
--

CREATE TABLE public.role_has_permissions (
    permission_id bigint NOT NULL,
    role_id bigint NOT NULL
);


ALTER TABLE public.role_has_permissions OWNER TO ciudad_limpia_user;

--
-- TOC entry 235 (class 1259 OID 16458)
-- Name: roles; Type: TABLE; Schema: public; Owner: ciudad_limpia_user
--

CREATE TABLE public.roles (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    guard_name character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    color character varying(191) DEFAULT '#3b82f6'::character varying NOT NULL
);


ALTER TABLE public.roles OWNER TO ciudad_limpia_user;

--
-- TOC entry 236 (class 1259 OID 16463)
-- Name: roles_id_seq; Type: SEQUENCE; Schema: public; Owner: ciudad_limpia_user
--

CREATE SEQUENCE public.roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.roles_id_seq OWNER TO ciudad_limpia_user;

--
-- TOC entry 3670 (class 0 OID 0)
-- Dependencies: 236
-- Name: roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ciudad_limpia_user
--

ALTER SEQUENCE public.roles_id_seq OWNED BY public.roles.id;


--
-- TOC entry 258 (class 1259 OID 16744)
-- Name: rutas; Type: TABLE; Schema: public; Owner: ciudad_limpia_user
--

CREATE TABLE public.rutas (
    id bigint NOT NULL,
    personal_id bigint NOT NULL,
    fecha date NOT NULL,
    ordenes_trabajo json NOT NULL,
    puntos json NOT NULL,
    distancia_total numeric(8,2) NOT NULL,
    tiempo_estimado integer NOT NULL,
    estado character varying(255) NOT NULL,
    hora_inicio timestamp(0) without time zone,
    hora_fin timestamp(0) without time zone,
    metricas json,
    observaciones text,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    deleted_at timestamp(0) without time zone,
    CONSTRAINT rutas_estado_check CHECK (((estado)::text = ANY ((ARRAY['pendiente'::character varying, 'en_proceso'::character varying, 'completada'::character varying, 'cancelada'::character varying])::text[])))
);


ALTER TABLE public.rutas OWNER TO ciudad_limpia_user;

--
-- TOC entry 3671 (class 0 OID 0)
-- Dependencies: 258
-- Name: COLUMN rutas.ordenes_trabajo; Type: COMMENT; Schema: public; Owner: ciudad_limpia_user
--

COMMENT ON COLUMN public.rutas.ordenes_trabajo IS 'Array de IDs de órdenes de trabajo';


--
-- TOC entry 3672 (class 0 OID 0)
-- Dependencies: 258
-- Name: COLUMN rutas.puntos; Type: COMMENT; Schema: public; Owner: ciudad_limpia_user
--

COMMENT ON COLUMN public.rutas.puntos IS 'Array de coordenadas ordenadas';


--
-- TOC entry 3673 (class 0 OID 0)
-- Dependencies: 258
-- Name: COLUMN rutas.distancia_total; Type: COMMENT; Schema: public; Owner: ciudad_limpia_user
--

COMMENT ON COLUMN public.rutas.distancia_total IS 'en kilómetros';


--
-- TOC entry 3674 (class 0 OID 0)
-- Dependencies: 258
-- Name: COLUMN rutas.tiempo_estimado; Type: COMMENT; Schema: public; Owner: ciudad_limpia_user
--

COMMENT ON COLUMN public.rutas.tiempo_estimado IS 'en minutos';


--
-- TOC entry 3675 (class 0 OID 0)
-- Dependencies: 258
-- Name: COLUMN rutas.metricas; Type: COMMENT; Schema: public; Owner: ciudad_limpia_user
--

COMMENT ON COLUMN public.rutas.metricas IS 'Tiempo real, distancia real, etc.';


--
-- TOC entry 257 (class 1259 OID 16743)
-- Name: rutas_id_seq; Type: SEQUENCE; Schema: public; Owner: ciudad_limpia_user
--

CREATE SEQUENCE public.rutas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.rutas_id_seq OWNER TO ciudad_limpia_user;

--
-- TOC entry 3676 (class 0 OID 0)
-- Dependencies: 257
-- Name: rutas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ciudad_limpia_user
--

ALTER SEQUENCE public.rutas_id_seq OWNED BY public.rutas.id;


--
-- TOC entry 237 (class 1259 OID 16464)
-- Name: status; Type: TABLE; Schema: public; Owner: ciudad_limpia_user
--

CREATE TABLE public.status (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    color character varying(255) DEFAULT 'primary'::character varying NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.status OWNER TO ciudad_limpia_user;

--
-- TOC entry 238 (class 1259 OID 16470)
-- Name: status_id_seq; Type: SEQUENCE; Schema: public; Owner: ciudad_limpia_user
--

CREATE SEQUENCE public.status_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.status_id_seq OWNER TO ciudad_limpia_user;

--
-- TOC entry 3677 (class 0 OID 0)
-- Dependencies: 238
-- Name: status_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ciudad_limpia_user
--

ALTER SEQUENCE public.status_id_seq OWNED BY public.status.id;


--
-- TOC entry 239 (class 1259 OID 16471)
-- Name: statuses; Type: TABLE; Schema: public; Owner: ciudad_limpia_user
--

CREATE TABLE public.statuses (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    color character varying(255) DEFAULT '#6c757d'::character varying NOT NULL,
    description character varying(255),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.statuses OWNER TO ciudad_limpia_user;

--
-- TOC entry 240 (class 1259 OID 16477)
-- Name: statuses_id_seq; Type: SEQUENCE; Schema: public; Owner: ciudad_limpia_user
--

CREATE SEQUENCE public.statuses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.statuses_id_seq OWNER TO ciudad_limpia_user;

--
-- TOC entry 3678 (class 0 OID 0)
-- Dependencies: 240
-- Name: statuses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ciudad_limpia_user
--

ALTER SEQUENCE public.statuses_id_seq OWNED BY public.statuses.id;


--
-- TOC entry 241 (class 1259 OID 16478)
-- Name: users; Type: TABLE; Schema: public; Owner: ciudad_limpia_user
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    email_verified_at timestamp(0) without time zone,
    password character varying(255) NOT NULL,
    remember_token character varying(100),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    role character varying(255) DEFAULT 'ciudadano'::character varying NOT NULL,
    CONSTRAINT users_role_check CHECK (((role)::text = ANY ((ARRAY['admin'::character varying, 'supervisor'::character varying, 'tecnico'::character varying, 'ciudadano'::character varying])::text[])))
);


ALTER TABLE public.users OWNER TO ciudad_limpia_user;

--
-- TOC entry 242 (class 1259 OID 16483)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: ciudad_limpia_user
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_id_seq OWNER TO ciudad_limpia_user;

--
-- TOC entry 3679 (class 0 OID 0)
-- Dependencies: 242
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ciudad_limpia_user
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- TOC entry 3327 (class 2604 OID 16484)
-- Name: failed_jobs id; Type: DEFAULT; Schema: public; Owner: ciudad_limpia_user
--

ALTER TABLE ONLY public.failed_jobs ALTER COLUMN id SET DEFAULT nextval('public.failed_jobs_id_seq'::regclass);


--
-- TOC entry 3345 (class 2604 OID 16639)
-- Name: incidencias id; Type: DEFAULT; Schema: public; Owner: ciudad_limpia_user
--

ALTER TABLE ONLY public.incidencias ALTER COLUMN id SET DEFAULT nextval('public.incidencias_id_seq'::regclass);


--
-- TOC entry 3329 (class 2604 OID 16485)
-- Name: incident_history id; Type: DEFAULT; Schema: public; Owner: ciudad_limpia_user
--

ALTER TABLE ONLY public.incident_history ALTER COLUMN id SET DEFAULT nextval('public.incident_history_id_seq'::regclass);


--
-- TOC entry 3330 (class 2604 OID 16486)
-- Name: incident_photos id; Type: DEFAULT; Schema: public; Owner: ciudad_limpia_user
--

ALTER TABLE ONLY public.incident_photos ALTER COLUMN id SET DEFAULT nextval('public.incident_photos_id_seq'::regclass);


--
-- TOC entry 3331 (class 2604 OID 16487)
-- Name: incidents id; Type: DEFAULT; Schema: public; Owner: ciudad_limpia_user
--

ALTER TABLE ONLY public.incidents ALTER COLUMN id SET DEFAULT nextval('public.incidents_id_seq'::regclass);


--
-- TOC entry 3344 (class 2604 OID 16626)
-- Name: infraestructuras id; Type: DEFAULT; Schema: public; Owner: ciudad_limpia_user
--

ALTER TABLE ONLY public.infraestructuras ALTER COLUMN id SET DEFAULT nextval('public.infraestructuras_id_seq'::regclass);


--
-- TOC entry 3332 (class 2604 OID 16488)
-- Name: infrastructures id; Type: DEFAULT; Schema: public; Owner: ciudad_limpia_user
--

ALTER TABLE ONLY public.infrastructures ALTER COLUMN id SET DEFAULT nextval('public.infrastructures_id_seq'::regclass);


--
-- TOC entry 3356 (class 2604 OID 16772)
-- Name: jobs id; Type: DEFAULT; Schema: public; Owner: ciudad_limpia_user
--

ALTER TABLE ONLY public.jobs ALTER COLUMN id SET DEFAULT nextval('public.jobs_id_seq'::regclass);


--
-- TOC entry 3350 (class 2604 OID 16718)
-- Name: mantenimiento_preventivo id; Type: DEFAULT; Schema: public; Owner: ciudad_limpia_user
--

ALTER TABLE ONLY public.mantenimiento_preventivo ALTER COLUMN id SET DEFAULT nextval('public.mantenimiento_preventivo_id_seq'::regclass);


--
-- TOC entry 3348 (class 2604 OID 16683)
-- Name: materiales id; Type: DEFAULT; Schema: public; Owner: ciudad_limpia_user
--

ALTER TABLE ONLY public.materiales ALTER COLUMN id SET DEFAULT nextval('public.materiales_id_seq'::regclass);


--
-- TOC entry 3333 (class 2604 OID 16489)
-- Name: migrations id; Type: DEFAULT; Schema: public; Owner: ciudad_limpia_user
--

ALTER TABLE ONLY public.migrations ALTER COLUMN id SET DEFAULT nextval('public.migrations_id_seq'::regclass);


--
-- TOC entry 3349 (class 2604 OID 16694)
-- Name: ordenes_trabajo id; Type: DEFAULT; Schema: public; Owner: ciudad_limpia_user
--

ALTER TABLE ONLY public.ordenes_trabajo ALTER COLUMN id SET DEFAULT nextval('public.ordenes_trabajo_id_seq'::regclass);


--
-- TOC entry 3334 (class 2604 OID 16490)
-- Name: permissions id; Type: DEFAULT; Schema: public; Owner: ciudad_limpia_user
--

ALTER TABLE ONLY public.permissions ALTER COLUMN id SET DEFAULT nextval('public.permissions_id_seq'::regclass);


--
-- TOC entry 3347 (class 2604 OID 16668)
-- Name: personal id; Type: DEFAULT; Schema: public; Owner: ciudad_limpia_user
--

ALTER TABLE ONLY public.personal ALTER COLUMN id SET DEFAULT nextval('public.personal_id_seq'::regclass);


--
-- TOC entry 3335 (class 2604 OID 16491)
-- Name: personal_access_tokens id; Type: DEFAULT; Schema: public; Owner: ciudad_limpia_user
--

ALTER TABLE ONLY public.personal_access_tokens ALTER COLUMN id SET DEFAULT nextval('public.personal_access_tokens_id_seq'::regclass);


--
-- TOC entry 3352 (class 2604 OID 16734)
-- Name: presupuestos id; Type: DEFAULT; Schema: public; Owner: ciudad_limpia_user
--

ALTER TABLE ONLY public.presupuestos ALTER COLUMN id SET DEFAULT nextval('public.presupuestos_id_seq'::regclass);


--
-- TOC entry 3336 (class 2604 OID 16492)
-- Name: roles id; Type: DEFAULT; Schema: public; Owner: ciudad_limpia_user
--

ALTER TABLE ONLY public.roles ALTER COLUMN id SET DEFAULT nextval('public.roles_id_seq'::regclass);


--
-- TOC entry 3355 (class 2604 OID 16747)
-- Name: rutas id; Type: DEFAULT; Schema: public; Owner: ciudad_limpia_user
--

ALTER TABLE ONLY public.rutas ALTER COLUMN id SET DEFAULT nextval('public.rutas_id_seq'::regclass);


--
-- TOC entry 3338 (class 2604 OID 16493)
-- Name: status id; Type: DEFAULT; Schema: public; Owner: ciudad_limpia_user
--

ALTER TABLE ONLY public.status ALTER COLUMN id SET DEFAULT nextval('public.status_id_seq'::regclass);


--
-- TOC entry 3340 (class 2604 OID 16494)
-- Name: statuses id; Type: DEFAULT; Schema: public; Owner: ciudad_limpia_user
--

ALTER TABLE ONLY public.statuses ALTER COLUMN id SET DEFAULT nextval('public.statuses_id_seq'::regclass);


--
-- TOC entry 3342 (class 2604 OID 16495)
-- Name: users id; Type: DEFAULT; Schema: public; Owner: ciudad_limpia_user
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- TOC entry 3601 (class 0 OID 16399)
-- Dependencies: 215
-- Data for Name: failed_jobs; Type: TABLE DATA; Schema: public; Owner: ciudad_limpia_user
--

COPY public.failed_jobs (id, uuid, connection, queue, payload, exception, failed_at) FROM stdin;
\.


--
-- TOC entry 3632 (class 0 OID 16636)
-- Dependencies: 246
-- Data for Name: incidencias; Type: TABLE DATA; Schema: public; Owner: ciudad_limpia_user
--

COPY public.incidencias (id, tipo, ubicacion, descripcion, fecha, estado, prioridad, latitud, longitud, infraestructura_id, tecnico_id, ciudadano_id, created_at, updated_at, deleted_at) FROM stdin;
\.


--
-- TOC entry 3603 (class 0 OID 16406)
-- Dependencies: 217
-- Data for Name: incident_history; Type: TABLE DATA; Schema: public; Owner: ciudad_limpia_user
--

COPY public.incident_history (id, incident_id, user_id, status_id, comment, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 3605 (class 0 OID 16412)
-- Dependencies: 219
-- Data for Name: incident_photos; Type: TABLE DATA; Schema: public; Owner: ciudad_limpia_user
--

COPY public.incident_photos (id, incident_id, path, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 3607 (class 0 OID 16416)
-- Dependencies: 221
-- Data for Name: incidents; Type: TABLE DATA; Schema: public; Owner: ciudad_limpia_user
--

COPY public.incidents (id, title, description, infrastructure_id, status_id, priority, latitude, longitude, user_id, assigned_to, created_at, updated_at, deleted_at) FROM stdin;
1	Daño en iluminación	Farolas sin funcionar en la zona norte	1	1	Alta	4.65800000	-74.09350000	3	2	2025-02-21 21:10:08	2025-02-21 21:10:08	\N
2	Acumulación de basura	Basura acumulada en esquina sur	1	2	Media	4.59810000	-74.07580000	3	2	2025-02-21 21:10:08	2025-02-21 21:10:08	\N
3	Bache en la vía	Bache grande en la calle principal	1	3	Baja	4.60970000	-74.08170000	3	2	2025-02-21 21:10:08	2025-02-21 21:10:08	\N
\.


--
-- TOC entry 3630 (class 0 OID 16623)
-- Dependencies: 244
-- Data for Name: infraestructuras; Type: TABLE DATA; Schema: public; Owner: ciudad_limpia_user
--

COPY public.infraestructuras (id, nombre, tipo, descripcion, ubicacion, latitud, longitud, estado, created_at, updated_at, deleted_at) FROM stdin;
1	Parque Central	parque	Parque principal de la ciudad con áreas verdes y juegos infantiles	Centro de la ciudad	4.60970000	-74.08170000	Operativo	2025-03-03 21:02:48	2025-03-03 21:02:48	\N
2	Semáforo Avenida Principal	semaforo	Semáforo en la intersección principal	Av. Principal con Calle 10	4.61000000	-74.08300000	Operativo	2025-03-03 21:02:51	2025-03-03 21:02:51	\N
3	Alumbrado Público Sector Norte	alumbrado	Sistema de iluminación del sector norte	Sector Norte de la ciudad	4.61200000	-74.08000000	En Mantenimiento	2025-03-03 21:02:51	2025-03-03 21:02:51	\N
4	Plaza Central	plaza	Plaza principal para eventos públicos	Centro histórico	4.60900000	-74.08100000	Operativo	2025-03-03 21:02:52	2025-03-03 21:02:52	\N
5	Puente Peatonal	puente	Puente peatonal sobre la avenida principal	Av. Principal km 2	4.61100000	-74.08400000	Fuera de Servicio	2025-03-03 21:02:52	2025-03-03 21:02:52	\N
6	Parque Central	parque	Parque principal de la ciudad con áreas verdes y juegos infantiles	Centro de la ciudad	4.60970000	-74.08170000	Operativo	2025-03-03 21:10:29	2025-03-03 21:10:29	\N
7	Parque Central	parque	Parque principal de la ciudad con áreas verdes y juegos infantiles	Centro de la ciudad	4.60970000	-74.08170000	Operativo	2025-03-03 21:10:29	2025-03-03 21:10:29	\N
8	Semáforo Avenida Principal	semaforo	Semáforo en la intersección principal	Av. Principal con Calle 10	4.61000000	-74.08300000	Operativo	2025-03-03 21:10:31	2025-03-03 21:10:31	\N
9	Semáforo Avenida Principal	semaforo	Semáforo en la intersección principal	Av. Principal con Calle 10	4.61000000	-74.08300000	Operativo	2025-03-03 21:10:31	2025-03-03 21:10:31	\N
10	Alumbrado Público Sector Norte	alumbrado	Sistema de iluminación del sector norte	Sector Norte de la ciudad	4.61200000	-74.08000000	En Mantenimiento	2025-03-03 21:10:32	2025-03-03 21:10:32	\N
11	Alumbrado Público Sector Norte	alumbrado	Sistema de iluminación del sector norte	Sector Norte de la ciudad	4.61200000	-74.08000000	En Mantenimiento	2025-03-03 21:10:32	2025-03-03 21:10:32	\N
12	Plaza Central	plaza	Plaza principal para eventos públicos	Centro histórico	4.60900000	-74.08100000	Operativo	2025-03-03 21:10:32	2025-03-03 21:10:32	\N
13	Plaza Central	plaza	Plaza principal para eventos públicos	Centro histórico	4.60900000	-74.08100000	Operativo	2025-03-03 21:10:33	2025-03-03 21:10:33	\N
14	Puente Peatonal	puente	Puente peatonal sobre la avenida principal	Av. Principal km 2	4.61100000	-74.08400000	Fuera de Servicio	2025-03-03 21:10:33	2025-03-03 21:10:33	\N
15	Puente Peatonal	puente	Puente peatonal sobre la avenida principal	Av. Principal km 2	4.61100000	-74.08400000	Fuera de Servicio	2025-03-03 21:10:33	2025-03-03 21:10:33	\N
\.


--
-- TOC entry 3609 (class 0 OID 16422)
-- Dependencies: 223
-- Data for Name: infrastructures; Type: TABLE DATA; Schema: public; Owner: ciudad_limpia_user
--

COPY public.infrastructures (id, nombre, descripcion, latitude, longitude, created_at, updated_at, deleted_at) FROM stdin;
1	Parque Simón Bolívar	Parque metropolitano	4.65800000	-74.09350000	2025-02-21 21:10:05	2025-02-21 21:10:05	\N
2	Plaza de Bolívar	Plaza principal	4.59810000	-74.07580000	2025-02-21 21:10:05	2025-02-21 21:10:05	\N
\.


--
-- TOC entry 3647 (class 0 OID 16769)
-- Dependencies: 261
-- Data for Name: jobs; Type: TABLE DATA; Schema: public; Owner: ciudad_limpia_user
--

COPY public.jobs (id, queue, payload, attempts, reserved_at, available_at, created_at) FROM stdin;
\.


--
-- TOC entry 3640 (class 0 OID 16715)
-- Dependencies: 254
-- Data for Name: mantenimiento_preventivo; Type: TABLE DATA; Schema: public; Owner: ciudad_limpia_user
--

COPY public.mantenimiento_preventivo (id, infraestructura_id, nombre, descripcion, frecuencia, dias_frecuencia, ultima_ejecucion, proxima_ejecucion, checklist, costo_estimado, duracion_estimada, materiales_requeridos, personal_requerido, activo, created_at, updated_at, deleted_at) FROM stdin;
\.


--
-- TOC entry 3636 (class 0 OID 16680)
-- Dependencies: 250
-- Data for Name: materiales; Type: TABLE DATA; Schema: public; Owner: ciudad_limpia_user
--

COPY public.materiales (id, nombre, descripcion, cantidad_disponible, costo_unitario, unidad_medida, stock_minimo, stock_maximo, ubicacion_almacen, codigo_interno, proveedores, created_at, updated_at, deleted_at) FROM stdin;
\.


--
-- TOC entry 3611 (class 0 OID 16428)
-- Dependencies: 225
-- Data for Name: migrations; Type: TABLE DATA; Schema: public; Owner: ciudad_limpia_user
--

COPY public.migrations (id, migration, batch) FROM stdin;
1	2014_10_12_000000_create_users_table	1
2	2014_10_12_100000_create_password_resets_table	1
3	2019_08_19_000000_create_failed_jobs_table	1
4	2019_12_14_000001_create_personal_access_tokens_table	1
5	2024_01_01_000000_create_infrastructures_table	1
6	2024_01_01_000000_create_status_table	1
7	2024_01_01_000000_create_statuses_table	1
8	2024_01_01_000001_create_incidents_table	1
9	2025_02_21_161521_create_permission_tables	2
10	xxxx_xx_xx_create_infraestructuras_table	3
11	2025_02_17_212541_create_incidencias_table	4
12	2024_02_21_000000_add_priority_to_incidents_table	5
13	2024_02_21_000000_add_priority_to_incidents_table	5
14	2024_02_21_000001_create_infraestructuras_table	6
15	2024_02_21_000002_add_color_to_roles_table	7
16	2025_02_17_212540_create_infraestructuras_table	7
17	2025_02_17_212542_create_personal_table	7
18	2025_02_17_212543_create_materiales_table	7
19	2025_02_17_212544_create_ordenes_trabajo_table	7
20	2025_02_17_212545_create_mantenimiento_preventivo_table	7
21	2025_02_17_212546_create_presupuestos_table	7
22	2025_02_17_212547_create_rutas_table	7
23	2025_02_17_215639_add_role_to_users_table	7
24	2025_02_17_234342_create_notifications_table	7
25	2025_02_18_033247_create_jobs_table	7
26	2025_02_21_065559_add_soft_deletes_to_incidents_table	7
27	2025_02_21_075548_remove_role_column_from_users_table	7
28	2025_02_21_080231_add_color_to_roles_table	7
29	2025_03_04_012256_add_infraestructura_id_to_incidencias_table	8
\.


--
-- TOC entry 3613 (class 0 OID 16432)
-- Dependencies: 227
-- Data for Name: model_has_permissions; Type: TABLE DATA; Schema: public; Owner: ciudad_limpia_user
--

COPY public.model_has_permissions (permission_id, model_type, model_id) FROM stdin;
\.


--
-- TOC entry 3614 (class 0 OID 16435)
-- Dependencies: 228
-- Data for Name: model_has_roles; Type: TABLE DATA; Schema: public; Owner: ciudad_limpia_user
--

COPY public.model_has_roles (role_id, model_type, model_id) FROM stdin;
1	App\\Models\\User	1
2	App\\Models\\User	2
3	App\\Models\\User	3
\.


--
-- TOC entry 3645 (class 0 OID 16760)
-- Dependencies: 259
-- Data for Name: notifications; Type: TABLE DATA; Schema: public; Owner: ciudad_limpia_user
--

COPY public.notifications (id, type, notifiable_type, notifiable_id, data, read_at, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 3638 (class 0 OID 16691)
-- Dependencies: 252
-- Data for Name: ordenes_trabajo; Type: TABLE DATA; Schema: public; Owner: ciudad_limpia_user
--

COPY public.ordenes_trabajo (id, codigo, incidencia_id, infraestructura_id, tipo, estado, prioridad, descripcion, fecha_programada, fecha_inicio, fecha_fin, costo_estimado, costo_real, materiales_requeridos, personal_asignado, observaciones, created_at, updated_at, deleted_at) FROM stdin;
\.


--
-- TOC entry 3615 (class 0 OID 16438)
-- Dependencies: 229
-- Data for Name: password_resets; Type: TABLE DATA; Schema: public; Owner: ciudad_limpia_user
--

COPY public.password_resets (email, token, created_at) FROM stdin;
\.


--
-- TOC entry 3616 (class 0 OID 16443)
-- Dependencies: 230
-- Data for Name: permissions; Type: TABLE DATA; Schema: public; Owner: ciudad_limpia_user
--

COPY public.permissions (id, name, guard_name, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 3634 (class 0 OID 16665)
-- Dependencies: 248
-- Data for Name: personal; Type: TABLE DATA; Schema: public; Owner: ciudad_limpia_user
--

COPY public.personal (id, user_id, especialidad, disponibilidad, habilidades, telefono, direccion, notas, created_at, updated_at, deleted_at) FROM stdin;
\.


--
-- TOC entry 3618 (class 0 OID 16449)
-- Dependencies: 232
-- Data for Name: personal_access_tokens; Type: TABLE DATA; Schema: public; Owner: ciudad_limpia_user
--

COPY public.personal_access_tokens (id, tokenable_type, tokenable_id, name, token, abilities, last_used_at, expires_at, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 3642 (class 0 OID 16731)
-- Dependencies: 256
-- Data for Name: presupuestos; Type: TABLE DATA; Schema: public; Owner: ciudad_limpia_user
--

COPY public.presupuestos (id, "año", mes, monto_asignado, monto_ejecutado, monto_comprometido, categoria, zona, desglose, notas, created_at, updated_at, deleted_at) FROM stdin;
\.


--
-- TOC entry 3620 (class 0 OID 16455)
-- Dependencies: 234
-- Data for Name: role_has_permissions; Type: TABLE DATA; Schema: public; Owner: ciudad_limpia_user
--

COPY public.role_has_permissions (permission_id, role_id) FROM stdin;
\.


--
-- TOC entry 3621 (class 0 OID 16458)
-- Dependencies: 235
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: ciudad_limpia_user
--

COPY public.roles (id, name, guard_name, created_at, updated_at, color) FROM stdin;
1	Administrador	web	2025-02-21 21:09:54	2025-02-21 21:09:54	#3b82f6
2	Técnico	web	2025-02-21 21:09:54	2025-02-21 21:09:54	#3b82f6
3	Ciudadano	web	2025-02-21 21:09:54	2025-02-21 21:09:54	#3b82f6
\.


--
-- TOC entry 3644 (class 0 OID 16744)
-- Dependencies: 258
-- Data for Name: rutas; Type: TABLE DATA; Schema: public; Owner: ciudad_limpia_user
--

COPY public.rutas (id, personal_id, fecha, ordenes_trabajo, puntos, distancia_total, tiempo_estimado, estado, hora_inicio, hora_fin, metricas, observaciones, created_at, updated_at, deleted_at) FROM stdin;
\.


--
-- TOC entry 3623 (class 0 OID 16464)
-- Dependencies: 237
-- Data for Name: status; Type: TABLE DATA; Schema: public; Owner: ciudad_limpia_user
--

COPY public.status (id, name, color, created_at, updated_at) FROM stdin;
1	Pendiente	warning	2025-02-21 21:10:02	2025-02-21 21:10:02
2	En Proceso	info	2025-02-21 21:10:02	2025-02-21 21:10:02
3	Resuelto	success	2025-02-21 21:10:02	2025-02-21 21:10:02
\.


--
-- TOC entry 3625 (class 0 OID 16471)
-- Dependencies: 239
-- Data for Name: statuses; Type: TABLE DATA; Schema: public; Owner: ciudad_limpia_user
--

COPY public.statuses (id, name, color, description, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 3627 (class 0 OID 16478)
-- Dependencies: 241
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: ciudad_limpia_user
--

COPY public.users (id, name, email, email_verified_at, password, remember_token, created_at, updated_at, role) FROM stdin;
2	Técnico	tecnico@ciudadlimpia.com	2025-02-21 21:09:58	$2y$10$sbfBtPjTN8u5183us2yr2OVn0XZUSAz7Tv/2R2yqrpDT08OCNcnzu	\N	2025-02-21 21:09:58	2025-02-21 21:09:58	ciudadano
3	Ciudadano	ciudadano@ciudadlimpia.com	2025-02-21 21:09:58	$2y$10$MSFn.yLYbA7SGYIGK3bfRO3tSL6pgztsIuoDN8Ns9rGX0eq.sylGW	\N	2025-02-21 21:09:58	2025-02-21 21:09:58	ciudadano
1	Administrador	admin@ciudadlimpia.com	2025-02-21 21:09:57	$2y$10$DoHrB82z0EKb9DpXqCcdge9K0QNCMAZzPnbyHH.Lk0DTGIWj7lhSa	UEhmXrF2oXx2ZXLM58JTrc5GcnEoeNlD8DYDqjnINJCHmtvlDIYLvROqUDCB	2025-02-21 21:09:57	2025-02-21 21:09:57	ciudadano
\.


--
-- TOC entry 3680 (class 0 OID 0)
-- Dependencies: 216
-- Name: failed_jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ciudad_limpia_user
--

SELECT pg_catalog.setval('public.failed_jobs_id_seq', 1, false);


--
-- TOC entry 3681 (class 0 OID 0)
-- Dependencies: 245
-- Name: incidencias_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ciudad_limpia_user
--

SELECT pg_catalog.setval('public.incidencias_id_seq', 1, false);


--
-- TOC entry 3682 (class 0 OID 0)
-- Dependencies: 218
-- Name: incident_history_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ciudad_limpia_user
--

SELECT pg_catalog.setval('public.incident_history_id_seq', 1, false);


--
-- TOC entry 3683 (class 0 OID 0)
-- Dependencies: 220
-- Name: incident_photos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ciudad_limpia_user
--

SELECT pg_catalog.setval('public.incident_photos_id_seq', 1, false);


--
-- TOC entry 3684 (class 0 OID 0)
-- Dependencies: 222
-- Name: incidents_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ciudad_limpia_user
--

SELECT pg_catalog.setval('public.incidents_id_seq', 3, true);


--
-- TOC entry 3685 (class 0 OID 0)
-- Dependencies: 243
-- Name: infraestructuras_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ciudad_limpia_user
--

SELECT pg_catalog.setval('public.infraestructuras_id_seq', 18, true);


--
-- TOC entry 3686 (class 0 OID 0)
-- Dependencies: 224
-- Name: infrastructures_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ciudad_limpia_user
--

SELECT pg_catalog.setval('public.infrastructures_id_seq', 2, true);


--
-- TOC entry 3687 (class 0 OID 0)
-- Dependencies: 260
-- Name: jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ciudad_limpia_user
--

SELECT pg_catalog.setval('public.jobs_id_seq', 1, false);


--
-- TOC entry 3688 (class 0 OID 0)
-- Dependencies: 253
-- Name: mantenimiento_preventivo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ciudad_limpia_user
--

SELECT pg_catalog.setval('public.mantenimiento_preventivo_id_seq', 1, false);


--
-- TOC entry 3689 (class 0 OID 0)
-- Dependencies: 249
-- Name: materiales_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ciudad_limpia_user
--

SELECT pg_catalog.setval('public.materiales_id_seq', 1, false);


--
-- TOC entry 3690 (class 0 OID 0)
-- Dependencies: 226
-- Name: migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ciudad_limpia_user
--

SELECT pg_catalog.setval('public.migrations_id_seq', 29, true);


--
-- TOC entry 3691 (class 0 OID 0)
-- Dependencies: 251
-- Name: ordenes_trabajo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ciudad_limpia_user
--

SELECT pg_catalog.setval('public.ordenes_trabajo_id_seq', 1, false);


--
-- TOC entry 3692 (class 0 OID 0)
-- Dependencies: 231
-- Name: permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ciudad_limpia_user
--

SELECT pg_catalog.setval('public.permissions_id_seq', 1, false);


--
-- TOC entry 3693 (class 0 OID 0)
-- Dependencies: 233
-- Name: personal_access_tokens_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ciudad_limpia_user
--

SELECT pg_catalog.setval('public.personal_access_tokens_id_seq', 1, false);


--
-- TOC entry 3694 (class 0 OID 0)
-- Dependencies: 247
-- Name: personal_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ciudad_limpia_user
--

SELECT pg_catalog.setval('public.personal_id_seq', 1, false);


--
-- TOC entry 3695 (class 0 OID 0)
-- Dependencies: 255
-- Name: presupuestos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ciudad_limpia_user
--

SELECT pg_catalog.setval('public.presupuestos_id_seq', 1, false);


--
-- TOC entry 3696 (class 0 OID 0)
-- Dependencies: 236
-- Name: roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ciudad_limpia_user
--

SELECT pg_catalog.setval('public.roles_id_seq', 3, true);


--
-- TOC entry 3697 (class 0 OID 0)
-- Dependencies: 257
-- Name: rutas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ciudad_limpia_user
--

SELECT pg_catalog.setval('public.rutas_id_seq', 1, false);


--
-- TOC entry 3698 (class 0 OID 0)
-- Dependencies: 238
-- Name: status_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ciudad_limpia_user
--

SELECT pg_catalog.setval('public.status_id_seq', 3, true);


--
-- TOC entry 3699 (class 0 OID 0)
-- Dependencies: 240
-- Name: statuses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ciudad_limpia_user
--

SELECT pg_catalog.setval('public.statuses_id_seq', 1, false);


--
-- TOC entry 3700 (class 0 OID 0)
-- Dependencies: 242
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ciudad_limpia_user
--

SELECT pg_catalog.setval('public.users_id_seq', 3, true);


--
-- TOC entry 3366 (class 2606 OID 16498)
-- Name: failed_jobs failed_jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: ciudad_limpia_user
--

ALTER TABLE ONLY public.failed_jobs
    ADD CONSTRAINT failed_jobs_pkey PRIMARY KEY (id);


--
-- TOC entry 3368 (class 2606 OID 16500)
-- Name: failed_jobs failed_jobs_uuid_unique; Type: CONSTRAINT; Schema: public; Owner: ciudad_limpia_user
--

ALTER TABLE ONLY public.failed_jobs
    ADD CONSTRAINT failed_jobs_uuid_unique UNIQUE (uuid);


--
-- TOC entry 3413 (class 2606 OID 16644)
-- Name: incidencias incidencias_pkey; Type: CONSTRAINT; Schema: public; Owner: ciudad_limpia_user
--

ALTER TABLE ONLY public.incidencias
    ADD CONSTRAINT incidencias_pkey PRIMARY KEY (id);


--
-- TOC entry 3370 (class 2606 OID 16502)
-- Name: incident_history incident_history_pkey; Type: CONSTRAINT; Schema: public; Owner: ciudad_limpia_user
--

ALTER TABLE ONLY public.incident_history
    ADD CONSTRAINT incident_history_pkey PRIMARY KEY (id);


--
-- TOC entry 3372 (class 2606 OID 16504)
-- Name: incident_photos incident_photos_pkey; Type: CONSTRAINT; Schema: public; Owner: ciudad_limpia_user
--

ALTER TABLE ONLY public.incident_photos
    ADD CONSTRAINT incident_photos_pkey PRIMARY KEY (id);


--
-- TOC entry 3374 (class 2606 OID 16506)
-- Name: incidents incidents_pkey; Type: CONSTRAINT; Schema: public; Owner: ciudad_limpia_user
--

ALTER TABLE ONLY public.incidents
    ADD CONSTRAINT incidents_pkey PRIMARY KEY (id);


--
-- TOC entry 3411 (class 2606 OID 16631)
-- Name: infraestructuras infraestructuras_pkey; Type: CONSTRAINT; Schema: public; Owner: ciudad_limpia_user
--

ALTER TABLE ONLY public.infraestructuras
    ADD CONSTRAINT infraestructuras_pkey PRIMARY KEY (id);


--
-- TOC entry 3376 (class 2606 OID 16508)
-- Name: infrastructures infrastructures_pkey; Type: CONSTRAINT; Schema: public; Owner: ciudad_limpia_user
--

ALTER TABLE ONLY public.infrastructures
    ADD CONSTRAINT infrastructures_pkey PRIMARY KEY (id);


--
-- TOC entry 3436 (class 2606 OID 16776)
-- Name: jobs jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: ciudad_limpia_user
--

ALTER TABLE ONLY public.jobs
    ADD CONSTRAINT jobs_pkey PRIMARY KEY (id);


--
-- TOC entry 3425 (class 2606 OID 16724)
-- Name: mantenimiento_preventivo mantenimiento_preventivo_pkey; Type: CONSTRAINT; Schema: public; Owner: ciudad_limpia_user
--

ALTER TABLE ONLY public.mantenimiento_preventivo
    ADD CONSTRAINT mantenimiento_preventivo_pkey PRIMARY KEY (id);


--
-- TOC entry 3417 (class 2606 OID 16689)
-- Name: materiales materiales_codigo_interno_unique; Type: CONSTRAINT; Schema: public; Owner: ciudad_limpia_user
--

ALTER TABLE ONLY public.materiales
    ADD CONSTRAINT materiales_codigo_interno_unique UNIQUE (codigo_interno);


--
-- TOC entry 3419 (class 2606 OID 16687)
-- Name: materiales materiales_pkey; Type: CONSTRAINT; Schema: public; Owner: ciudad_limpia_user
--

ALTER TABLE ONLY public.materiales
    ADD CONSTRAINT materiales_pkey PRIMARY KEY (id);


--
-- TOC entry 3378 (class 2606 OID 16510)
-- Name: migrations migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: ciudad_limpia_user
--

ALTER TABLE ONLY public.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);


--
-- TOC entry 3381 (class 2606 OID 16512)
-- Name: model_has_permissions model_has_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: ciudad_limpia_user
--

ALTER TABLE ONLY public.model_has_permissions
    ADD CONSTRAINT model_has_permissions_pkey PRIMARY KEY (permission_id, model_id, model_type);


--
-- TOC entry 3384 (class 2606 OID 16514)
-- Name: model_has_roles model_has_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: ciudad_limpia_user
--

ALTER TABLE ONLY public.model_has_roles
    ADD CONSTRAINT model_has_roles_pkey PRIMARY KEY (role_id, model_id, model_type);


--
-- TOC entry 3434 (class 2606 OID 16767)
-- Name: notifications notifications_pkey; Type: CONSTRAINT; Schema: public; Owner: ciudad_limpia_user
--

ALTER TABLE ONLY public.notifications
    ADD CONSTRAINT notifications_pkey PRIMARY KEY (id);


--
-- TOC entry 3421 (class 2606 OID 16713)
-- Name: ordenes_trabajo ordenes_trabajo_codigo_unique; Type: CONSTRAINT; Schema: public; Owner: ciudad_limpia_user
--

ALTER TABLE ONLY public.ordenes_trabajo
    ADD CONSTRAINT ordenes_trabajo_codigo_unique UNIQUE (codigo);


--
-- TOC entry 3423 (class 2606 OID 16701)
-- Name: ordenes_trabajo ordenes_trabajo_pkey; Type: CONSTRAINT; Schema: public; Owner: ciudad_limpia_user
--

ALTER TABLE ONLY public.ordenes_trabajo
    ADD CONSTRAINT ordenes_trabajo_pkey PRIMARY KEY (id);


--
-- TOC entry 3386 (class 2606 OID 16516)
-- Name: password_resets password_resets_pkey; Type: CONSTRAINT; Schema: public; Owner: ciudad_limpia_user
--

ALTER TABLE ONLY public.password_resets
    ADD CONSTRAINT password_resets_pkey PRIMARY KEY (email);


--
-- TOC entry 3388 (class 2606 OID 16518)
-- Name: permissions permissions_name_guard_name_unique; Type: CONSTRAINT; Schema: public; Owner: ciudad_limpia_user
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_guard_name_unique UNIQUE (name, guard_name);


--
-- TOC entry 3390 (class 2606 OID 16520)
-- Name: permissions permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: ciudad_limpia_user
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_pkey PRIMARY KEY (id);


--
-- TOC entry 3392 (class 2606 OID 16522)
-- Name: personal_access_tokens personal_access_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: ciudad_limpia_user
--

ALTER TABLE ONLY public.personal_access_tokens
    ADD CONSTRAINT personal_access_tokens_pkey PRIMARY KEY (id);


--
-- TOC entry 3394 (class 2606 OID 16524)
-- Name: personal_access_tokens personal_access_tokens_token_unique; Type: CONSTRAINT; Schema: public; Owner: ciudad_limpia_user
--

ALTER TABLE ONLY public.personal_access_tokens
    ADD CONSTRAINT personal_access_tokens_token_unique UNIQUE (token);


--
-- TOC entry 3415 (class 2606 OID 16673)
-- Name: personal personal_pkey; Type: CONSTRAINT; Schema: public; Owner: ciudad_limpia_user
--

ALTER TABLE ONLY public.personal
    ADD CONSTRAINT personal_pkey PRIMARY KEY (id);


--
-- TOC entry 3427 (class 2606 OID 16742)
-- Name: presupuestos presupuestos_año_mes_categoria_zona_unique; Type: CONSTRAINT; Schema: public; Owner: ciudad_limpia_user
--

ALTER TABLE ONLY public.presupuestos
    ADD CONSTRAINT "presupuestos_año_mes_categoria_zona_unique" UNIQUE ("año", mes, categoria, zona);


--
-- TOC entry 3429 (class 2606 OID 16740)
-- Name: presupuestos presupuestos_pkey; Type: CONSTRAINT; Schema: public; Owner: ciudad_limpia_user
--

ALTER TABLE ONLY public.presupuestos
    ADD CONSTRAINT presupuestos_pkey PRIMARY KEY (id);


--
-- TOC entry 3397 (class 2606 OID 16526)
-- Name: role_has_permissions role_has_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: ciudad_limpia_user
--

ALTER TABLE ONLY public.role_has_permissions
    ADD CONSTRAINT role_has_permissions_pkey PRIMARY KEY (permission_id, role_id);


--
-- TOC entry 3399 (class 2606 OID 16528)
-- Name: roles roles_name_guard_name_unique; Type: CONSTRAINT; Schema: public; Owner: ciudad_limpia_user
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_guard_name_unique UNIQUE (name, guard_name);


--
-- TOC entry 3401 (class 2606 OID 16530)
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: public; Owner: ciudad_limpia_user
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- TOC entry 3431 (class 2606 OID 16752)
-- Name: rutas rutas_pkey; Type: CONSTRAINT; Schema: public; Owner: ciudad_limpia_user
--

ALTER TABLE ONLY public.rutas
    ADD CONSTRAINT rutas_pkey PRIMARY KEY (id);


--
-- TOC entry 3403 (class 2606 OID 16532)
-- Name: status status_pkey; Type: CONSTRAINT; Schema: public; Owner: ciudad_limpia_user
--

ALTER TABLE ONLY public.status
    ADD CONSTRAINT status_pkey PRIMARY KEY (id);


--
-- TOC entry 3405 (class 2606 OID 16534)
-- Name: statuses statuses_pkey; Type: CONSTRAINT; Schema: public; Owner: ciudad_limpia_user
--

ALTER TABLE ONLY public.statuses
    ADD CONSTRAINT statuses_pkey PRIMARY KEY (id);


--
-- TOC entry 3407 (class 2606 OID 16536)
-- Name: users users_email_unique; Type: CONSTRAINT; Schema: public; Owner: ciudad_limpia_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_unique UNIQUE (email);


--
-- TOC entry 3409 (class 2606 OID 16538)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: ciudad_limpia_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 3437 (class 1259 OID 16777)
-- Name: jobs_queue_index; Type: INDEX; Schema: public; Owner: ciudad_limpia_user
--

CREATE INDEX jobs_queue_index ON public.jobs USING btree (queue);


--
-- TOC entry 3379 (class 1259 OID 16539)
-- Name: model_has_permissions_model_id_model_type_index; Type: INDEX; Schema: public; Owner: ciudad_limpia_user
--

CREATE INDEX model_has_permissions_model_id_model_type_index ON public.model_has_permissions USING btree (model_id, model_type);


--
-- TOC entry 3382 (class 1259 OID 16540)
-- Name: model_has_roles_model_id_model_type_index; Type: INDEX; Schema: public; Owner: ciudad_limpia_user
--

CREATE INDEX model_has_roles_model_id_model_type_index ON public.model_has_roles USING btree (model_id, model_type);


--
-- TOC entry 3432 (class 1259 OID 16765)
-- Name: notifications_notifiable_type_notifiable_id_index; Type: INDEX; Schema: public; Owner: ciudad_limpia_user
--

CREATE INDEX notifications_notifiable_type_notifiable_id_index ON public.notifications USING btree (notifiable_type, notifiable_id);


--
-- TOC entry 3395 (class 1259 OID 16541)
-- Name: personal_access_tokens_tokenable_type_tokenable_id_index; Type: INDEX; Schema: public; Owner: ciudad_limpia_user
--

CREATE INDEX personal_access_tokens_tokenable_type_tokenable_id_index ON public.personal_access_tokens USING btree (tokenable_type, tokenable_id);


--
-- TOC entry 3450 (class 2606 OID 16655)
-- Name: incidencias incidencias_ciudadano_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: ciudad_limpia_user
--

ALTER TABLE ONLY public.incidencias
    ADD CONSTRAINT incidencias_ciudadano_id_foreign FOREIGN KEY (ciudadano_id) REFERENCES public.users(id);


--
-- TOC entry 3451 (class 2606 OID 16645)
-- Name: incidencias incidencias_infraestructura_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: ciudad_limpia_user
--

ALTER TABLE ONLY public.incidencias
    ADD CONSTRAINT incidencias_infraestructura_id_foreign FOREIGN KEY (infraestructura_id) REFERENCES public.infraestructuras(id);


--
-- TOC entry 3452 (class 2606 OID 16650)
-- Name: incidencias incidencias_tecnico_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: ciudad_limpia_user
--

ALTER TABLE ONLY public.incidencias
    ADD CONSTRAINT incidencias_tecnico_id_foreign FOREIGN KEY (tecnico_id) REFERENCES public.users(id);


--
-- TOC entry 3438 (class 2606 OID 16542)
-- Name: incident_history incident_history_incident_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: ciudad_limpia_user
--

ALTER TABLE ONLY public.incident_history
    ADD CONSTRAINT incident_history_incident_id_foreign FOREIGN KEY (incident_id) REFERENCES public.incidents(id) ON DELETE CASCADE;


--
-- TOC entry 3439 (class 2606 OID 16547)
-- Name: incident_history incident_history_status_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: ciudad_limpia_user
--

ALTER TABLE ONLY public.incident_history
    ADD CONSTRAINT incident_history_status_id_foreign FOREIGN KEY (status_id) REFERENCES public.status(id);


--
-- TOC entry 3440 (class 2606 OID 16552)
-- Name: incident_history incident_history_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: ciudad_limpia_user
--

ALTER TABLE ONLY public.incident_history
    ADD CONSTRAINT incident_history_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 3441 (class 2606 OID 16557)
-- Name: incident_photos incident_photos_incident_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: ciudad_limpia_user
--

ALTER TABLE ONLY public.incident_photos
    ADD CONSTRAINT incident_photos_incident_id_foreign FOREIGN KEY (incident_id) REFERENCES public.incidents(id) ON DELETE CASCADE;


--
-- TOC entry 3442 (class 2606 OID 16562)
-- Name: incidents incidents_assigned_to_foreign; Type: FK CONSTRAINT; Schema: public; Owner: ciudad_limpia_user
--

ALTER TABLE ONLY public.incidents
    ADD CONSTRAINT incidents_assigned_to_foreign FOREIGN KEY (assigned_to) REFERENCES public.users(id);


--
-- TOC entry 3443 (class 2606 OID 16567)
-- Name: incidents incidents_infrastructure_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: ciudad_limpia_user
--

ALTER TABLE ONLY public.incidents
    ADD CONSTRAINT incidents_infrastructure_id_foreign FOREIGN KEY (infrastructure_id) REFERENCES public.infrastructures(id);


--
-- TOC entry 3444 (class 2606 OID 16572)
-- Name: incidents incidents_status_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: ciudad_limpia_user
--

ALTER TABLE ONLY public.incidents
    ADD CONSTRAINT incidents_status_id_foreign FOREIGN KEY (status_id) REFERENCES public.status(id);


--
-- TOC entry 3445 (class 2606 OID 16577)
-- Name: incidents incidents_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: ciudad_limpia_user
--

ALTER TABLE ONLY public.incidents
    ADD CONSTRAINT incidents_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 3456 (class 2606 OID 16725)
-- Name: mantenimiento_preventivo mantenimiento_preventivo_infraestructura_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: ciudad_limpia_user
--

ALTER TABLE ONLY public.mantenimiento_preventivo
    ADD CONSTRAINT mantenimiento_preventivo_infraestructura_id_foreign FOREIGN KEY (infraestructura_id) REFERENCES public.infraestructuras(id);


--
-- TOC entry 3446 (class 2606 OID 16582)
-- Name: model_has_permissions model_has_permissions_permission_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: ciudad_limpia_user
--

ALTER TABLE ONLY public.model_has_permissions
    ADD CONSTRAINT model_has_permissions_permission_id_foreign FOREIGN KEY (permission_id) REFERENCES public.permissions(id) ON DELETE CASCADE;


--
-- TOC entry 3447 (class 2606 OID 16587)
-- Name: model_has_roles model_has_roles_role_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: ciudad_limpia_user
--

ALTER TABLE ONLY public.model_has_roles
    ADD CONSTRAINT model_has_roles_role_id_foreign FOREIGN KEY (role_id) REFERENCES public.roles(id) ON DELETE CASCADE;


--
-- TOC entry 3454 (class 2606 OID 16702)
-- Name: ordenes_trabajo ordenes_trabajo_incidencia_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: ciudad_limpia_user
--

ALTER TABLE ONLY public.ordenes_trabajo
    ADD CONSTRAINT ordenes_trabajo_incidencia_id_foreign FOREIGN KEY (incidencia_id) REFERENCES public.incidencias(id);


--
-- TOC entry 3455 (class 2606 OID 16707)
-- Name: ordenes_trabajo ordenes_trabajo_infraestructura_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: ciudad_limpia_user
--

ALTER TABLE ONLY public.ordenes_trabajo
    ADD CONSTRAINT ordenes_trabajo_infraestructura_id_foreign FOREIGN KEY (infraestructura_id) REFERENCES public.infraestructuras(id);


--
-- TOC entry 3453 (class 2606 OID 16674)
-- Name: personal personal_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: ciudad_limpia_user
--

ALTER TABLE ONLY public.personal
    ADD CONSTRAINT personal_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- TOC entry 3448 (class 2606 OID 16592)
-- Name: role_has_permissions role_has_permissions_permission_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: ciudad_limpia_user
--

ALTER TABLE ONLY public.role_has_permissions
    ADD CONSTRAINT role_has_permissions_permission_id_foreign FOREIGN KEY (permission_id) REFERENCES public.permissions(id) ON DELETE CASCADE;


--
-- TOC entry 3449 (class 2606 OID 16597)
-- Name: role_has_permissions role_has_permissions_role_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: ciudad_limpia_user
--

ALTER TABLE ONLY public.role_has_permissions
    ADD CONSTRAINT role_has_permissions_role_id_foreign FOREIGN KEY (role_id) REFERENCES public.roles(id) ON DELETE CASCADE;


--
-- TOC entry 3457 (class 2606 OID 16753)
-- Name: rutas rutas_personal_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: ciudad_limpia_user
--

ALTER TABLE ONLY public.rutas
    ADD CONSTRAINT rutas_personal_id_foreign FOREIGN KEY (personal_id) REFERENCES public.personal(id);


--
-- TOC entry 2159 (class 826 OID 16391)
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: -; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres GRANT ALL ON SEQUENCES TO ciudad_limpia_user;


--
-- TOC entry 2161 (class 826 OID 16393)
-- Name: DEFAULT PRIVILEGES FOR TYPES; Type: DEFAULT ACL; Schema: -; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres GRANT ALL ON TYPES TO ciudad_limpia_user;


--
-- TOC entry 2160 (class 826 OID 16392)
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: -; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres GRANT ALL ON FUNCTIONS TO ciudad_limpia_user;


--
-- TOC entry 2158 (class 826 OID 16390)
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: -; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres GRANT ALL ON TABLES TO ciudad_limpia_user;


-- Completed on 2025-03-04 23:01:13

--
-- PostgreSQL database dump complete
--

