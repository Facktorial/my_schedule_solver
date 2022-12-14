PGDMP         $                z           mydb     13.4 (Ubuntu 13.4-4.pgdg20.04+1)     14.0 (Ubuntu 14.0-1.pgdg20.04+1) ?    ?           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            ?           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            ?           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            ?           1262    16976    mydb    DATABASE     Y   CREATE DATABASE mydb WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'en_US.UTF-8';
    DROP DATABASE mydb;
                postgres    false            ?           0    0    DATABASE mydb    ACL     %   GRANT ALL ON DATABASE mydb TO admin;
                   postgres    false    3220            ?            1259    17115    Solver_demands    TABLE     ?   CREATE TABLE public."Solver_demands" (
    id bigint NOT NULL,
    term_id bigint NOT NULL,
    data jsonb,
    user_id bigint,
    results_id bigint
);
 $   DROP TABLE public."Solver_demands";
       public         heap    admin    false            ?            1259    17113    Solver_demands_id_seq    SEQUENCE     ?   CREATE SEQUENCE public."Solver_demands_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public."Solver_demands_id_seq";
       public          admin    false    217            ?           0    0    Solver_demands_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public."Solver_demands_id_seq" OWNED BY public."Solver_demands".id;
          public          admin    false    216            ?            1259    17185    Solver_fieldofstudy    TABLE     u   CREATE TABLE public."Solver_fieldofstudy" (
    id bigint NOT NULL,
    field_name character varying(64) NOT NULL
);
 )   DROP TABLE public."Solver_fieldofstudy";
       public         heap    admin    false            ?            1259    17183    Solver_fieldofstudy_id_seq    SEQUENCE     ?   CREATE SEQUENCE public."Solver_fieldofstudy_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public."Solver_fieldofstudy_id_seq";
       public          admin    false    223            ?           0    0    Solver_fieldofstudy_id_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public."Solver_fieldofstudy_id_seq" OWNED BY public."Solver_fieldofstudy".id;
          public          admin    false    222            ?            1259    17131    Solver_items    TABLE     ?   CREATE TABLE public."Solver_items" (
    id bigint NOT NULL,
    data jsonb,
    term_id bigint NOT NULL,
    created_by_id bigint
);
 "   DROP TABLE public."Solver_items";
       public         heap    admin    false            ?            1259    17129    Solver_items_id_seq    SEQUENCE     ~   CREATE SEQUENCE public."Solver_items_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public."Solver_items_id_seq";
       public          admin    false    219            ?           0    0    Solver_items_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public."Solver_items_id_seq" OWNED BY public."Solver_items".id;
          public          admin    false    218            ?            1259    17193    Solver_results    TABLE     ?   CREATE TABLE public."Solver_results" (
    id bigint NOT NULL,
    valid boolean NOT NULL,
    best_score integer NOT NULL,
    data jsonb
);
 $   DROP TABLE public."Solver_results";
       public         heap    admin    false            ?            1259    17191    Solver_results_id_seq    SEQUENCE     ?   CREATE SEQUENCE public."Solver_results_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public."Solver_results_id_seq";
       public          admin    false    225            ?           0    0    Solver_results_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public."Solver_results_id_seq" OWNED BY public."Solver_results".id;
          public          admin    false    224            ?            1259    17204    Solver_student    TABLE     t   CREATE TABLE public."Solver_student" (
    id bigint NOT NULL,
    field_id bigint,
    user_id integer NOT NULL
);
 $   DROP TABLE public."Solver_student";
       public         heap    admin    false            ?            1259    17202    Solver_student_id_seq    SEQUENCE     ?   CREATE SEQUENCE public."Solver_student_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public."Solver_student_id_seq";
       public          admin    false    227            ?           0    0    Solver_student_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public."Solver_student_id_seq" OWNED BY public."Solver_student".id;
          public          admin    false    226            ?            1259    17147    Solver_term    TABLE     ?   CREATE TABLE public."Solver_term" (
    id bigint NOT NULL,
    period character varying(20) NOT NULL,
    academic_year_start integer NOT NULL,
    field_id bigint
);
 !   DROP TABLE public."Solver_term";
       public         heap    admin    false            ?            1259    17145    Solver_term_id_seq    SEQUENCE     }   CREATE SEQUENCE public."Solver_term_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public."Solver_term_id_seq";
       public          admin    false    221            ?           0    0    Solver_term_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public."Solver_term_id_seq" OWNED BY public."Solver_term".id;
          public          admin    false    220            ?            1259    17008 
   auth_group    TABLE     f   CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);
    DROP TABLE public.auth_group;
       public         heap    admin    false            ?            1259    17006    auth_group_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.auth_group_id_seq;
       public          admin    false    207            ?           0    0    auth_group_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;
          public          admin    false    206            ?            1259    17018    auth_group_permissions    TABLE     ?   CREATE TABLE public.auth_group_permissions (
    id bigint NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);
 *   DROP TABLE public.auth_group_permissions;
       public         heap    admin    false            ?            1259    17016    auth_group_permissions_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.auth_group_permissions_id_seq;
       public          admin    false    209            ?           0    0    auth_group_permissions_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;
          public          admin    false    208            ?            1259    17000    auth_permission    TABLE     ?   CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);
 #   DROP TABLE public.auth_permission;
       public         heap    admin    false            ?            1259    16998    auth_permission_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.auth_permission_id_seq;
       public          admin    false    205            ?           0    0    auth_permission_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;
          public          admin    false    204            ?            1259    17026 	   auth_user    TABLE     ?  CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);
    DROP TABLE public.auth_user;
       public         heap    admin    false            ?            1259    17036    auth_user_groups    TABLE     ~   CREATE TABLE public.auth_user_groups (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);
 $   DROP TABLE public.auth_user_groups;
       public         heap    admin    false            ?            1259    17034    auth_user_groups_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.auth_user_groups_id_seq;
       public          admin    false    213            ?           0    0    auth_user_groups_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;
          public          admin    false    212            ?            1259    17024    auth_user_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.auth_user_id_seq;
       public          admin    false    211            ?           0    0    auth_user_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;
          public          admin    false    210            ?            1259    17044    auth_user_user_permissions    TABLE     ?   CREATE TABLE public.auth_user_user_permissions (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);
 .   DROP TABLE public.auth_user_user_permissions;
       public         heap    admin    false            ?            1259    17042 !   auth_user_user_permissions_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public.auth_user_user_permissions_id_seq;
       public          admin    false    215            ?           0    0 !   auth_user_user_permissions_id_seq    SEQUENCE OWNED BY     g   ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;
          public          admin    false    214            ?            1259    17274    django_admin_log    TABLE     ?  CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);
 $   DROP TABLE public.django_admin_log;
       public         heap    admin    false            ?            1259    17272    django_admin_log_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.django_admin_log_id_seq;
       public          admin    false    229            ?           0    0    django_admin_log_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;
          public          admin    false    228            ?            1259    16990    django_content_type    TABLE     ?   CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);
 '   DROP TABLE public.django_content_type;
       public         heap    admin    false            ?            1259    16988    django_content_type_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.django_content_type_id_seq;
       public          admin    false    203            ?           0    0    django_content_type_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;
          public          admin    false    202            ?            1259    16979    django_migrations    TABLE     ?   CREATE TABLE public.django_migrations (
    id bigint NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);
 %   DROP TABLE public.django_migrations;
       public         heap    admin    false            ?            1259    16977    django_migrations_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.django_migrations_id_seq;
       public          admin    false    201            ?           0    0    django_migrations_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;
          public          admin    false    200            ?            1259    17305    django_session    TABLE     ?   CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);
 "   DROP TABLE public.django_session;
       public         heap    admin    false            ?           2604    17118    Solver_demands id    DEFAULT     z   ALTER TABLE ONLY public."Solver_demands" ALTER COLUMN id SET DEFAULT nextval('public."Solver_demands_id_seq"'::regclass);
 B   ALTER TABLE public."Solver_demands" ALTER COLUMN id DROP DEFAULT;
       public          admin    false    217    216    217            ?           2604    17188    Solver_fieldofstudy id    DEFAULT     ?   ALTER TABLE ONLY public."Solver_fieldofstudy" ALTER COLUMN id SET DEFAULT nextval('public."Solver_fieldofstudy_id_seq"'::regclass);
 G   ALTER TABLE public."Solver_fieldofstudy" ALTER COLUMN id DROP DEFAULT;
       public          admin    false    223    222    223            ?           2604    17134    Solver_items id    DEFAULT     v   ALTER TABLE ONLY public."Solver_items" ALTER COLUMN id SET DEFAULT nextval('public."Solver_items_id_seq"'::regclass);
 @   ALTER TABLE public."Solver_items" ALTER COLUMN id DROP DEFAULT;
       public          admin    false    219    218    219            ?           2604    17196    Solver_results id    DEFAULT     z   ALTER TABLE ONLY public."Solver_results" ALTER COLUMN id SET DEFAULT nextval('public."Solver_results_id_seq"'::regclass);
 B   ALTER TABLE public."Solver_results" ALTER COLUMN id DROP DEFAULT;
       public          admin    false    224    225    225            ?           2604    17207    Solver_student id    DEFAULT     z   ALTER TABLE ONLY public."Solver_student" ALTER COLUMN id SET DEFAULT nextval('public."Solver_student_id_seq"'::regclass);
 B   ALTER TABLE public."Solver_student" ALTER COLUMN id DROP DEFAULT;
       public          admin    false    226    227    227            ?           2604    17150    Solver_term id    DEFAULT     t   ALTER TABLE ONLY public."Solver_term" ALTER COLUMN id SET DEFAULT nextval('public."Solver_term_id_seq"'::regclass);
 ?   ALTER TABLE public."Solver_term" ALTER COLUMN id DROP DEFAULT;
       public          admin    false    220    221    221            ?           2604    17011    auth_group id    DEFAULT     n   ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);
 <   ALTER TABLE public.auth_group ALTER COLUMN id DROP DEFAULT;
       public          admin    false    206    207    207            ?           2604    17021    auth_group_permissions id    DEFAULT     ?   ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);
 H   ALTER TABLE public.auth_group_permissions ALTER COLUMN id DROP DEFAULT;
       public          admin    false    208    209    209            ?           2604    17003    auth_permission id    DEFAULT     x   ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);
 A   ALTER TABLE public.auth_permission ALTER COLUMN id DROP DEFAULT;
       public          admin    false    204    205    205            ?           2604    17029    auth_user id    DEFAULT     l   ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);
 ;   ALTER TABLE public.auth_user ALTER COLUMN id DROP DEFAULT;
       public          admin    false    210    211    211            ?           2604    17039    auth_user_groups id    DEFAULT     z   ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);
 B   ALTER TABLE public.auth_user_groups ALTER COLUMN id DROP DEFAULT;
       public          admin    false    213    212    213            ?           2604    17047    auth_user_user_permissions id    DEFAULT     ?   ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);
 L   ALTER TABLE public.auth_user_user_permissions ALTER COLUMN id DROP DEFAULT;
       public          admin    false    215    214    215            ?           2604    17277    django_admin_log id    DEFAULT     z   ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);
 B   ALTER TABLE public.django_admin_log ALTER COLUMN id DROP DEFAULT;
       public          admin    false    228    229    229            ?           2604    16993    django_content_type id    DEFAULT     ?   ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);
 E   ALTER TABLE public.django_content_type ALTER COLUMN id DROP DEFAULT;
       public          admin    false    203    202    203            ?           2604    16982    django_migrations id    DEFAULT     |   ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);
 C   ALTER TABLE public.django_migrations ALTER COLUMN id DROP DEFAULT;
       public          admin    false    201    200    201            ?          0    17115    Solver_demands 
   TABLE DATA           R   COPY public."Solver_demands" (id, term_id, data, user_id, results_id) FROM stdin;
    public          admin    false    217   S?       ?          0    17185    Solver_fieldofstudy 
   TABLE DATA           ?   COPY public."Solver_fieldofstudy" (id, field_name) FROM stdin;
    public          admin    false    223   3?       ?          0    17131    Solver_items 
   TABLE DATA           J   COPY public."Solver_items" (id, data, term_id, created_by_id) FROM stdin;
    public          admin    false    219   ??       ?          0    17193    Solver_results 
   TABLE DATA           G   COPY public."Solver_results" (id, valid, best_score, data) FROM stdin;
    public          admin    false    225   ??       ?          0    17204    Solver_student 
   TABLE DATA           A   COPY public."Solver_student" (id, field_id, user_id) FROM stdin;
    public          admin    false    227   ??       ?          0    17147    Solver_term 
   TABLE DATA           R   COPY public."Solver_term" (id, period, academic_year_start, field_id) FROM stdin;
    public          admin    false    221   ??       w          0    17008 
   auth_group 
   TABLE DATA           .   COPY public.auth_group (id, name) FROM stdin;
    public          admin    false    207   ;?       y          0    17018    auth_group_permissions 
   TABLE DATA           M   COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
    public          admin    false    209   X?       u          0    17000    auth_permission 
   TABLE DATA           N   COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
    public          admin    false    205   u?       {          0    17026 	   auth_user 
   TABLE DATA           ?   COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
    public          admin    false    211   h?       }          0    17036    auth_user_groups 
   TABLE DATA           A   COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
    public          admin    false    213   l?                 0    17044    auth_user_user_permissions 
   TABLE DATA           P   COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
    public          admin    false    215   ??       ?          0    17274    django_admin_log 
   TABLE DATA           ?   COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
    public          admin    false    229   ??       s          0    16990    django_content_type 
   TABLE DATA           C   COPY public.django_content_type (id, app_label, model) FROM stdin;
    public          admin    false    203   ??       q          0    16979    django_migrations 
   TABLE DATA           C   COPY public.django_migrations (id, app, name, applied) FROM stdin;
    public          admin    false    201   ??       ?          0    17305    django_session 
   TABLE DATA           P   COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
    public          admin    false    230   ??       ?           0    0    Solver_demands_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public."Solver_demands_id_seq"', 8, true);
          public          admin    false    216            ?           0    0    Solver_fieldofstudy_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public."Solver_fieldofstudy_id_seq"', 3, true);
          public          admin    false    222            ?           0    0    Solver_items_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public."Solver_items_id_seq"', 21, true);
          public          admin    false    218            ?           0    0    Solver_results_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public."Solver_results_id_seq"', 1, false);
          public          admin    false    224            ?           0    0    Solver_student_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public."Solver_student_id_seq"', 31, true);
          public          admin    false    226            ?           0    0    Solver_term_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public."Solver_term_id_seq"', 20, true);
          public          admin    false    220            ?           0    0    auth_group_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);
          public          admin    false    206            ?           0    0    auth_group_permissions_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);
          public          admin    false    208            ?           0    0    auth_permission_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.auth_permission_id_seq', 48, true);
          public          admin    false    204            ?           0    0    auth_user_groups_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);
          public          admin    false    212            ?           0    0    auth_user_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.auth_user_id_seq', 33, true);
          public          admin    false    210            ?           0    0 !   auth_user_user_permissions_id_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);
          public          admin    false    214            ?           0    0    django_admin_log_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.django_admin_log_id_seq', 24, true);
          public          admin    false    228            ?           0    0    django_content_type_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.django_content_type_id_seq', 12, true);
          public          admin    false    202            ?           0    0    django_migrations_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.django_migrations_id_seq', 24, true);
          public          admin    false    200            ?           2606    17120 "   Solver_demands Solver_demands_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public."Solver_demands"
    ADD CONSTRAINT "Solver_demands_pkey" PRIMARY KEY (id);
 P   ALTER TABLE ONLY public."Solver_demands" DROP CONSTRAINT "Solver_demands_pkey";
       public            admin    false    217            ?           2606    17190 ,   Solver_fieldofstudy Solver_fieldofstudy_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public."Solver_fieldofstudy"
    ADD CONSTRAINT "Solver_fieldofstudy_pkey" PRIMARY KEY (id);
 Z   ALTER TABLE ONLY public."Solver_fieldofstudy" DROP CONSTRAINT "Solver_fieldofstudy_pkey";
       public            admin    false    223            ?           2606    17136    Solver_items Solver_items_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public."Solver_items"
    ADD CONSTRAINT "Solver_items_pkey" PRIMARY KEY (id);
 L   ALTER TABLE ONLY public."Solver_items" DROP CONSTRAINT "Solver_items_pkey";
       public            admin    false    219            ?           2606    17201 "   Solver_results Solver_results_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public."Solver_results"
    ADD CONSTRAINT "Solver_results_pkey" PRIMARY KEY (id);
 P   ALTER TABLE ONLY public."Solver_results" DROP CONSTRAINT "Solver_results_pkey";
       public            admin    false    225            ?           2606    17209 "   Solver_student Solver_student_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public."Solver_student"
    ADD CONSTRAINT "Solver_student_pkey" PRIMARY KEY (id);
 P   ALTER TABLE ONLY public."Solver_student" DROP CONSTRAINT "Solver_student_pkey";
       public            admin    false    227            ?           2606    17211 )   Solver_student Solver_student_user_id_key 
   CONSTRAINT     k   ALTER TABLE ONLY public."Solver_student"
    ADD CONSTRAINT "Solver_student_user_id_key" UNIQUE (user_id);
 W   ALTER TABLE ONLY public."Solver_student" DROP CONSTRAINT "Solver_student_user_id_key";
       public            admin    false    227            ?           2606    17152    Solver_term Solver_term_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public."Solver_term"
    ADD CONSTRAINT "Solver_term_pkey" PRIMARY KEY (id);
 J   ALTER TABLE ONLY public."Solver_term" DROP CONSTRAINT "Solver_term_pkey";
       public            admin    false    221            ?           2606    17303    auth_group auth_group_name_key 
   CONSTRAINT     Y   ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);
 H   ALTER TABLE ONLY public.auth_group DROP CONSTRAINT auth_group_name_key;
       public            admin    false    207            ?           2606    17060 R   auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq 
   CONSTRAINT     ?   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);
 |   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq;
       public            admin    false    209    209            ?           2606    17023 2   auth_group_permissions auth_group_permissions_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);
 \   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_pkey;
       public            admin    false    209            ?           2606    17013    auth_group auth_group_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.auth_group DROP CONSTRAINT auth_group_pkey;
       public            admin    false    207            ?           2606    17051 F   auth_permission auth_permission_content_type_id_codename_01ab375a_uniq 
   CONSTRAINT     ?   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);
 p   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq;
       public            admin    false    205    205            ?           2606    17005 $   auth_permission auth_permission_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_pkey;
       public            admin    false    205            ?           2606    17041 &   auth_user_groups auth_user_groups_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_pkey;
       public            admin    false    213            ?           2606    17075 @   auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq 
   CONSTRAINT     ?   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);
 j   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq;
       public            admin    false    213    213            ?           2606    17031    auth_user auth_user_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.auth_user DROP CONSTRAINT auth_user_pkey;
       public            admin    false    211            ?           2606    17049 :   auth_user_user_permissions auth_user_user_permissions_pkey 
   CONSTRAINT     x   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);
 d   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_pkey;
       public            admin    false    215            ?           2606    17089 Y   auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq 
   CONSTRAINT     ?   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);
 ?   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq;
       public            admin    false    215    215            ?           2606    17297     auth_user auth_user_username_key 
   CONSTRAINT     _   ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);
 J   ALTER TABLE ONLY public.auth_user DROP CONSTRAINT auth_user_username_key;
       public            admin    false    211            ?           2606    17283 &   django_admin_log django_admin_log_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_pkey;
       public            admin    false    229            ?           2606    16997 E   django_content_type django_content_type_app_label_model_76bd3d3b_uniq 
   CONSTRAINT     ?   ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);
 o   ALTER TABLE ONLY public.django_content_type DROP CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq;
       public            admin    false    203    203            ?           2606    16995 ,   django_content_type django_content_type_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.django_content_type DROP CONSTRAINT django_content_type_pkey;
       public            admin    false    203            ?           2606    16987 (   django_migrations django_migrations_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.django_migrations DROP CONSTRAINT django_migrations_pkey;
       public            admin    false    201            ?           2606    17312 "   django_session django_session_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);
 L   ALTER TABLE ONLY public.django_session DROP CONSTRAINT django_session_pkey;
       public            admin    false    230            ?           1259    17269 "   Solver_demands_results_id_de33fa73    INDEX     g   CREATE INDEX "Solver_demands_results_id_de33fa73" ON public."Solver_demands" USING btree (results_id);
 8   DROP INDEX public."Solver_demands_results_id_de33fa73";
       public            admin    false    217            ?           1259    17182    Solver_demands_term_id_b5eedcae    INDEX     a   CREATE INDEX "Solver_demands_term_id_b5eedcae" ON public."Solver_demands" USING btree (term_id);
 5   DROP INDEX public."Solver_demands_term_id_b5eedcae";
       public            admin    false    217            ?           1259    17253    Solver_demands_user_id_9d398408    INDEX     a   CREATE INDEX "Solver_demands_user_id_9d398408" ON public."Solver_demands" USING btree (user_id);
 5   DROP INDEX public."Solver_demands_user_id_9d398408";
       public            admin    false    217            ?           1259    17270 #   Solver_items_created_by_id_4de9e212    INDEX     i   CREATE INDEX "Solver_items_created_by_id_4de9e212" ON public."Solver_items" USING btree (created_by_id);
 9   DROP INDEX public."Solver_items_created_by_id_4de9e212";
       public            admin    false    219            ?           1259    17251    Solver_items_term_id_e35d93c1    INDEX     ]   CREATE INDEX "Solver_items_term_id_e35d93c1" ON public."Solver_items" USING btree (term_id);
 3   DROP INDEX public."Solver_items_term_id_e35d93c1";
       public            admin    false    219            ?           1259    17249     Solver_student_field_id_a8f95341    INDEX     c   CREATE INDEX "Solver_student_field_id_a8f95341" ON public."Solver_student" USING btree (field_id);
 6   DROP INDEX public."Solver_student_field_id_a8f95341";
       public            admin    false    227            ?           1259    17271    Solver_term_field_id_9f158ddd    INDEX     ]   CREATE INDEX "Solver_term_field_id_9f158ddd" ON public."Solver_term" USING btree (field_id);
 3   DROP INDEX public."Solver_term_field_id_9f158ddd";
       public            admin    false    221            ?           1259    17304    auth_group_name_a6ea08ec_like    INDEX     h   CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);
 1   DROP INDEX public.auth_group_name_a6ea08ec_like;
       public            admin    false    207            ?           1259    17071 (   auth_group_permissions_group_id_b120cbf9    INDEX     o   CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);
 <   DROP INDEX public.auth_group_permissions_group_id_b120cbf9;
       public            admin    false    209            ?           1259    17072 -   auth_group_permissions_permission_id_84c5c92e    INDEX     y   CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);
 A   DROP INDEX public.auth_group_permissions_permission_id_84c5c92e;
       public            admin    false    209            ?           1259    17057 (   auth_permission_content_type_id_2f476e4b    INDEX     o   CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);
 <   DROP INDEX public.auth_permission_content_type_id_2f476e4b;
       public            admin    false    205            ?           1259    17087 "   auth_user_groups_group_id_97559544    INDEX     c   CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);
 6   DROP INDEX public.auth_user_groups_group_id_97559544;
       public            admin    false    213            ?           1259    17086 !   auth_user_groups_user_id_6a12ed8b    INDEX     a   CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);
 5   DROP INDEX public.auth_user_groups_user_id_6a12ed8b;
       public            admin    false    213            ?           1259    17101 1   auth_user_user_permissions_permission_id_1fbb5f2c    INDEX     ?   CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);
 E   DROP INDEX public.auth_user_user_permissions_permission_id_1fbb5f2c;
       public            admin    false    215            ?           1259    17100 +   auth_user_user_permissions_user_id_a95ead1b    INDEX     u   CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);
 ?   DROP INDEX public.auth_user_user_permissions_user_id_a95ead1b;
       public            admin    false    215            ?           1259    17298     auth_user_username_6821ab7c_like    INDEX     n   CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);
 4   DROP INDEX public.auth_user_username_6821ab7c_like;
       public            admin    false    211            ?           1259    17294 )   django_admin_log_content_type_id_c4bce8eb    INDEX     q   CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);
 =   DROP INDEX public.django_admin_log_content_type_id_c4bce8eb;
       public            admin    false    229            ?           1259    17295 !   django_admin_log_user_id_c564eba6    INDEX     a   CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);
 5   DROP INDEX public.django_admin_log_user_id_c564eba6;
       public            admin    false    229            ?           1259    17314 #   django_session_expire_date_a5c62663    INDEX     e   CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);
 7   DROP INDEX public.django_session_expire_date_a5c62663;
       public            admin    false    230            ?           1259    17313 (   django_session_session_key_c0390e0f_like    INDEX     ~   CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);
 <   DROP INDEX public.django_session_session_key_c0390e0f_like;
       public            admin    false    230            ?           2606    17254 F   Solver_demands Solver_demands_results_id_de33fa73_fk_Solver_results_id    FK CONSTRAINT     ?   ALTER TABLE ONLY public."Solver_demands"
    ADD CONSTRAINT "Solver_demands_results_id_de33fa73_fk_Solver_results_id" FOREIGN KEY (results_id) REFERENCES public."Solver_results"(id) DEFERRABLE INITIALLY DEFERRED;
 t   ALTER TABLE ONLY public."Solver_demands" DROP CONSTRAINT "Solver_demands_results_id_de33fa73_fk_Solver_results_id";
       public          admin    false    217    225    3023            ?           2606    17164 @   Solver_demands Solver_demands_term_id_b5eedcae_fk_Solver_term_id    FK CONSTRAINT     ?   ALTER TABLE ONLY public."Solver_demands"
    ADD CONSTRAINT "Solver_demands_term_id_b5eedcae_fk_Solver_term_id" FOREIGN KEY (term_id) REFERENCES public."Solver_term"(id) DEFERRABLE INITIALLY DEFERRED;
 n   ALTER TABLE ONLY public."Solver_demands" DROP CONSTRAINT "Solver_demands_term_id_b5eedcae_fk_Solver_term_id";
       public          admin    false    221    217    3019            ?           2606    17229 C   Solver_demands Solver_demands_user_id_9d398408_fk_Solver_student_id    FK CONSTRAINT     ?   ALTER TABLE ONLY public."Solver_demands"
    ADD CONSTRAINT "Solver_demands_user_id_9d398408_fk_Solver_student_id" FOREIGN KEY (user_id) REFERENCES public."Solver_student"(id) DEFERRABLE INITIALLY DEFERRED;
 q   ALTER TABLE ONLY public."Solver_demands" DROP CONSTRAINT "Solver_demands_user_id_9d398408_fk_Solver_student_id";
       public          admin    false    3026    217    227            ?           2606    17259 E   Solver_items Solver_items_created_by_id_4de9e212_fk_Solver_student_id    FK CONSTRAINT     ?   ALTER TABLE ONLY public."Solver_items"
    ADD CONSTRAINT "Solver_items_created_by_id_4de9e212_fk_Solver_student_id" FOREIGN KEY (created_by_id) REFERENCES public."Solver_student"(id) DEFERRABLE INITIALLY DEFERRED;
 s   ALTER TABLE ONLY public."Solver_items" DROP CONSTRAINT "Solver_items_created_by_id_4de9e212_fk_Solver_student_id";
       public          admin    false    3026    219    227            ?           2606    17219 <   Solver_items Solver_items_term_id_e35d93c1_fk_Solver_term_id    FK CONSTRAINT     ?   ALTER TABLE ONLY public."Solver_items"
    ADD CONSTRAINT "Solver_items_term_id_e35d93c1_fk_Solver_term_id" FOREIGN KEY (term_id) REFERENCES public."Solver_term"(id) DEFERRABLE INITIALLY DEFERRED;
 j   ALTER TABLE ONLY public."Solver_items" DROP CONSTRAINT "Solver_items_term_id_e35d93c1_fk_Solver_term_id";
       public          admin    false    221    3019    219            ?           2606    17234 I   Solver_student Solver_student_field_id_a8f95341_fk_Solver_fieldofstudy_id    FK CONSTRAINT     ?   ALTER TABLE ONLY public."Solver_student"
    ADD CONSTRAINT "Solver_student_field_id_a8f95341_fk_Solver_fieldofstudy_id" FOREIGN KEY (field_id) REFERENCES public."Solver_fieldofstudy"(id) DEFERRABLE INITIALLY DEFERRED;
 w   ALTER TABLE ONLY public."Solver_student" DROP CONSTRAINT "Solver_student_field_id_a8f95341_fk_Solver_fieldofstudy_id";
       public          admin    false    227    223    3021            ?           2606    17244 >   Solver_student Solver_student_user_id_5cee0a87_fk_auth_user_id    FK CONSTRAINT     ?   ALTER TABLE ONLY public."Solver_student"
    ADD CONSTRAINT "Solver_student_user_id_5cee0a87_fk_auth_user_id" FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 l   ALTER TABLE ONLY public."Solver_student" DROP CONSTRAINT "Solver_student_user_id_5cee0a87_fk_auth_user_id";
       public          admin    false    211    227    2992            ?           2606    17264 C   Solver_term Solver_term_field_id_9f158ddd_fk_Solver_fieldofstudy_id    FK CONSTRAINT     ?   ALTER TABLE ONLY public."Solver_term"
    ADD CONSTRAINT "Solver_term_field_id_9f158ddd_fk_Solver_fieldofstudy_id" FOREIGN KEY (field_id) REFERENCES public."Solver_fieldofstudy"(id) DEFERRABLE INITIALLY DEFERRED;
 q   ALTER TABLE ONLY public."Solver_term" DROP CONSTRAINT "Solver_term_field_id_9f158ddd_fk_Solver_fieldofstudy_id";
       public          admin    false    221    3021    223            ?           2606    17066 O   auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm    FK CONSTRAINT     ?   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;
 y   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm;
       public          admin    false    205    2979    209            ?           2606    17061 P   auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id    FK CONSTRAINT     ?   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;
 z   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id;
       public          admin    false    207    2984    209            ?           2606    17052 E   auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co    FK CONSTRAINT     ?   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;
 o   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co;
       public          admin    false    2974    203    205            ?           2606    17081 D   auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id    FK CONSTRAINT     ?   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;
 n   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id;
       public          admin    false    207    2984    213            ?           2606    17076 B   auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id    FK CONSTRAINT     ?   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 l   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id;
       public          admin    false    213    2992    211            ?           2606    17095 S   auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm    FK CONSTRAINT     ?   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;
 }   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm;
       public          admin    false    205    2979    215            ?           2606    17090 V   auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id    FK CONSTRAINT     ?   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 ?   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id;
       public          admin    false    215    211    2992            ?           2606    17284 G   django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co    FK CONSTRAINT     ?   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;
 q   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co;
       public          admin    false    229    2974    203            ?           2606    17289 B   django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id    FK CONSTRAINT     ?   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 l   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id;
       public          admin    false    229    2992    211            ?   ?  x???KS?H???W??Ǥ(??ao	?B?#??v#???e)%ɤH*?}m?ݮi?Hdƪ??????n??h~???L???ߟͿ???/??a???Y??c?ų?????ē?c?K?Ќn?lu??8?????cs??G????'e??|?K?YT????|(?D_??,?q?"?u~?\y??n??&?????8_ ՔΓP???????v??i?<??p??w???
?e???'??ݪ?WW	ʰȢ??????
??/e??{b^???|3???8??{ӿ_-Cξ'd?"?h?s????W?)?g???7?0??k?C??6*?η%́e??IM,??TWs?@\=??~??o?(No??ܳ{l??tﵚ????ѭ!o??087?Ն?4K?˿??6??[BQlP??????96??in?%???u??af?p?z?#?=???8??a??RG?+B???????f?&?=?ܐ;N??I?Y??`??oR?az????駍2jb!???"O4??K4#?L*??.???hm?E2?c???w&?sXU-?\o?????b?>IۛDƛ8?_?V+??+=k??E>??Q|o??`t?=??$?l?3?jD97?Q,i_?ef?FIn??????"???Y? ????W??\???zڤ?v(??Xb7%E?h?q??if
?F??!?-"????xT?w6????y??]dT܆T?û?j?H???7?Ɛ???s?SqZ??????[??>6???w???mU?????Ɓ^?'1'&??R???Q<+b}?Y?|4???[??4????Tg??????{????ϱT+Sy`pN7;??&E?~4?Y????L!L'&?60Uw-ǻw?0??0?ux"U??YA4??????^??8?]?޶???|	y$ݨ?>????ڏ????)?э?;??S??T?,???/?h??k}2??`???U??n;?F		H? =i????rS	???DH@H@?D$ K???OABBBBB??			?a?!?3$ $ $ $?r???	?=?H@H@H@JP		??:B*'?5?X@X@?IÅ??X@e?'??Z'bY???x
?TX@X@X@k???aaaaՐ,???X@?????R"?????X@X@U?P9???MУ?baaU?????????????????Z?~,??ǐX@u????`?.?rO/????????????Y@, m"????JP%, , 7?j?c?????+fX@X@X@X@5?hu1?{z???????, ,?&P?u?T??otZX@X@?IÅ??X@e?'??Z'bY???x
?TX@X@X@k???aaaaՐ,???X@?????R"?????X@X@U?P9(??????g?      ?   J   x?3?t??-(-I-R(N?L?KN?2????L?/KU(.)M?L?2?I?/J-?L?NT(J?.J???OJ??qqq ?u      ?   ?  x???Mo?V???+
βE`?JϮMf?65?t?)?`lM?Z?
IN????tJhJ_??R$;???|8$^??{x)?:>?~?O?g??jv?????????ӳ?߾(???-ھ??????l?????bqy??????8?[Wg???,??/????0?t?????o???z?ZϷ??9????r???_????????ӷ?6o|?????ćN?w?ؔ??)?AR??????@ȸې??2???1?S?i?'y??U?7?es???5>?6?8??Rζ????Ǧ?Ƀ@???)?????+??̾1/????g	??q????R??p??{?V0??)??~???<??\???????צ?"x廧?y??j???/:?@E?<*?$?z?/?O??o???C?~??????????Z]m????Q??[??i8}?!?D??X??n?֢ε]:??0.1x??*?????W?Y???j?8K?o?????ٺX??Lo?"{o?OW??o?v1??e\J????`?־????˦{??y?j?S,Wכ????oR?%1?\??w?Ȫ1~??L	?h?7^?E?k??~??ûs??^,"n]???bs؇??%???E-????E?}R??)???b???w}x8?h????N׳???}Sʾ??K??yY,/?w??Q3??XKzߘ7????r???~Ϝ???????ؚ%,??????/??????z???)??#???p7??ӳI???X?????|M??8o?x4?y???????y??=???e(?????????D ?????rv?sO????-?1?}~9{?M??~V\???;)w?MS???ݼ??@??'1ϋ?U۔??ƥ?9g??????<??7cߏ??W??M?{j??=??????????~n~??2#??]ݽ?|H?_?1{??Q!?v? \]???????9{_;?b???ӳ?<MD?g?????????????C??q?J?w??6?????u?$Eݏ?/?W?vu???O?AN׷??A{?iq????1?ZK?????????`<?@P(? ?\P??E@??? ??H 5?? *!? ? "???\@?[kP_5#? ? ??'Pu2Ծ?D EF@PF @]?? ?&??? ?R?A˅ ?i{$???B???PC???B? 
?? !@??? ?U3B??z? U'#@?ۋ !@Pd? e??!@???`<?"@P(?\P??G"@?/? ??? 5?	*A? B???\ @?[kP_5C? ??'Pu2Ծ?? EF @P? !@]??B?&??C?
?0@?????6I(?-? ???>1@?!? 1@??b?vk???f? 1@=???Nf?ڷ?b????? ??9b?????#?
?0@?????6I(?-? ???>1@?!? 1@??b?vk???f? 1@=???Nf?ڷ?b????? ??9b?R?xt? !@?h?r!@y?? ??$B??z"??'?<B? B?Bs? !@?n?!@}?B? ??? @??P??"@? !@? u9GPz? !@?h?r!@y?? ??$B??z"??'?<B? B?Bs? !@?n?!@}?B? ??? @??P??"@? !@? u9GP4??G'J!?-??m?P?;"? ?'@}"??C ? "? (4D ???W? ? "?z?	T?L ?o/D @??@P?sD %	??!? ?R?A˅ ?i{$???B???PC???B? 
?? !@??? ?U3B??z? U'#@?ۋ !@Pd? e??!@ih? !@?h?r!@y?? ??$B??z"??'?<B? B?Bs? !@?n?!@}?B? ??? @??P??"@? !@? u9GP? @P(?\P??G"@?/? ??? 5?	*A? B???\ @?[kP_5C? ??'Pu2Ծ?? EF @P? !@]??F?? (?? Z.(O?#?ԗDTOD??? ?? @? !@Ph. ڭ5???!@? ???:j?^B?"# (C??.?J#@S
? @?????H(?%? ???>!@?!? !@?B?vk??f? !@=??NF?ڷB???? ??9B???C
? @?????H(?%? ???>!@?!? !@?B?vk??f? !@=??NF?ڷB???? ??9B??	?QI?!@P(?\P??G"@?/? ??? 5?	*A? B???\ @?[kP_5C? ??'Pu2Ծ?? EF @P? !@]?M??%:F??P
4h??<m?D?R_!@P=j?T? !@? !@??@? h????j? !@?CO??d?}{ ??@??B???#(? ????#@P(?\P??G"@?/? ??? 5?	*A? B???\ @?[kP_5C? ??'Pu2Ծ?? EF @P? !@]??F?N (?? Z.(O?#?ԗDTOD??? ?? @? !@Ph. ڭ5???!@? ???:j?^B?"# (C??.?J"@?C
? @?????H(?%? ???>!@?!? !@?B?vk??f? !@=??NF?ڷB???? ??9B???B?B)Р?B???=J}I? !@?D??OPy? !@? ??B???ZC???? !@P=A??????E? (2B?2?r??xtx0?????迼?Z?      ?      x?????? ? ?      ?   ;   x???? ????N?*R???K;'?????~??F?
?'9;,R?2?=???jr      ?   7   x?3??	?4202?4?2⌂????1~\&P	???%T??? *c?i????? &B@      w      x?????? ? ?      y      x?????? ? ?      u   ?  x?e??j?0E??W?Jd;?uK??v[(?VRCb?n???]if??f??9?+;?|??C???T?nnƙ???k*mI??ϡ;yE??????Q???`M?o???4Zg??.mmߙ?Ըa7RN???V?)??ݱ?"?Qp?ly??j*??u+)?????SB??d???U6??LM?ѺZ???#???`y6?cZ?ۼ?????????͚?Z:????!?????ɗ+ּ?IW?.[?ꆄQ?R??xfL??1?eLd?!??'??_]̖??X?R??eL??1eLD?!2???m??`v??.g[?T?9\??T'@D?@s?????=	,G[?Tc??P????ƘV?!??????????85?jEǥ??ҳ?J??x?;*ݏw????"??7?^???w??????!??V1?3?r.8hfN]P??N??9?I????U??^_?T???_?D????'k??YOZ      {   ?  x???]??H?k?W?wf?>?(H&Yl?DTD2?D?D??K????Y6?!?z8y??I??o'q<??? f??V?n?S?m(yW{K?K?F+'?;˶?d??:#V???j]W7?*f?V?ߩ????0????ٷ????;@???!?"		?9? xBhX??~8?۱6J?v뇭????E??ի?W_??шO½?t???6/??,Z???n߿L,J??ax? ??????????|c"b?w?a??(?г?vz???%??W9?u>???ic?zDg??/???????:?Fr??]8e???g?%?I,? ?%?|8??v?_N"?P???$?Ⱦ;1v
G?2????T?{???g?q k?.Ϝ?BN	?^?m?n?b\/Ύ?n?k?2????dy?%'@A???"?i?
???a? ?aob?J??sk?????ˋM<?M??? ???鹊??򂵨?S???=?bY]???o??^V k-?????N}?????
(?~):??Ƿ???P??>??/??q??;?ja??T/~?x?.7p???|?5W?>X¨???Fte???6?sZ`#??O?%ϐ{?qf1Я~?n????'???0??hn?$???_?J?6B?>??\??*?G??K?05?b?s_r?̍m?3U3{\+
g?AD?]υ.?K?^B?%qYU??쏹?p?tG?uCo??Џ?=?7l??{U?Ap?????[?5z??ӇĿu?? ??V
a?,ۯ??????_??b?      }      x?????? ? ?            x?????? ? ?      ?   <  x???Ko?@??ΧX?
]v??q?Vq????m'H??wg֎?J,?`ٳ????<?B?xe?Z>YNt ??SAu?y?????j??^d?t?<??&7???_^?*?H!AL̚<E?I?Z?U?5????f2`?X#WKU??+u??E??^?=?/W??i??v?????R??}?k~?y????!&t	?6?C?>N?h~?Qm~ʭȾ=u?4Q??E?$?h??
?'(???S?$?d??v?P?홳%??x6(?D?,?r9???????\aq'???,j?????H.?`?5?_???2K??F??aFHi????R??chLڰ%?&@??i?ЕL???????d?R:DrԎ??G??w?&@???vNھ??'@?*??i??7]?ÄV?0?F?*?=?:?? ?????hQX?????ŮU??6??W?????z?u???3rEF???h?Y??<?1?L?0.p؆?T??Zsp?z???uӥ삌	???!	T???4DDs??W??g?V?????ϐ?F?ؓ?Ch?p^?(???g??oW???      s   ?   x?M?K
1D?]?3????M0=c ?!?r{?C?]?GeȺ???p??0?????K?">'6??\W7??'z??}?me??I???p?{o.?8???!?r?j????=?g?????Ԡ3?m?<v >d?H?      q   E  x????r? E????{'X@@~???a??:?pe???
?Dm??/?%y?ݽ?+??Øݘ???RC?Ə>{?7@ ??x????/?)h??wBv??)?ޯ B蹂5?B???5?????J?tn?c???n(?d?????g?]?????S6???^b?Bt?B?Ke?Rb??]߅C?Sw6ѥ?Ϩ?W??ѻ?.]|I???3?]????u?p?>?i???r}??? D?rV?+?m??ծ?S?w?????U??ḧ́?E?J?]???J???-h.?Ѻ?????!h%%?HR?Q?GԊ??$?`lwCW?(??~0???ݗ??=??k?{\?M?????????偙??n?$PB?K??.,v?0?>????????ލG??&?3?/F??b?? &??w1?i]?JE??5f>??0??II??ͥme?5????h??٦~??KE??h*+?E??L>V???f???ɋ)?2??	??w6??J \?!???d?7޽?b}iIW??4??͊
????'?B1?	??(YP???c?)/???Q??L'?șS??U$o??*?0j?)??:???XRqz?7?-?w?J+?й???n??d6??      ?      x?????? ? ?     