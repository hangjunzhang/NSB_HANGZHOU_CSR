PGDMP     ;                    w            csr    9.2.24    9.5.5 �    
           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false                       1262    16384    csr    DATABASE     u   CREATE DATABASE csr WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_US.UTF-8' LC_CTYPE = 'en_US.UTF-8';
    DROP DATABASE csr;
             postgres    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
             postgres    false                       0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                  postgres    false    7                       0    0    public    ACL     �   REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;
                  postgres    false    7                        3079    12649    plpgsql 	   EXTENSION     ?   CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;
    DROP EXTENSION plpgsql;
                  false                       0    0    EXTENSION plpgsql    COMMENT     @   COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';
                       false    1            �            1259    16385    answer    TABLE       CREATE TABLE answer (
    id integer NOT NULL,
    postid integer,
    answerid integer,
    description text,
    imgs text,
    createtime integer,
    authorid integer,
    active integer DEFAULT 1 NOT NULL,
    up integer DEFAULT 0 NOT NULL,
    floor integer
);
    DROP TABLE public.answer;
       public         postgres    false    7            �            1259    16393    answer_id_seq    SEQUENCE     o   CREATE SEQUENCE answer_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.answer_id_seq;
       public       postgres    false    169    7                       0    0    answer_id_seq    SEQUENCE OWNED BY     1   ALTER SEQUENCE answer_id_seq OWNED BY answer.id;
            public       postgres    false    170            �            1259    16395 
   auth_group    TABLE     ^   CREATE TABLE auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);
    DROP TABLE public.auth_group;
       public         postgres    false    7            �            1259    16398    auth_group_id_seq    SEQUENCE     s   CREATE SEQUENCE auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.auth_group_id_seq;
       public       postgres    false    7    171                       0    0    auth_group_id_seq    SEQUENCE OWNED BY     9   ALTER SEQUENCE auth_group_id_seq OWNED BY auth_group.id;
            public       postgres    false    172            �            1259    16400    auth_group_permissions    TABLE     �   CREATE TABLE auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);
 *   DROP TABLE public.auth_group_permissions;
       public         postgres    false    7            �            1259    16403    auth_group_permissions_id_seq    SEQUENCE        CREATE SEQUENCE auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.auth_group_permissions_id_seq;
       public       postgres    false    173    7                       0    0    auth_group_permissions_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE auth_group_permissions_id_seq OWNED BY auth_group_permissions.id;
            public       postgres    false    174            �            1259    16405    auth_permission    TABLE     �   CREATE TABLE auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);
 #   DROP TABLE public.auth_permission;
       public         postgres    false    7            �            1259    16408    auth_permission_id_seq    SEQUENCE     x   CREATE SEQUENCE auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.auth_permission_id_seq;
       public       postgres    false    7    175                       0    0    auth_permission_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE auth_permission_id_seq OWNED BY auth_permission.id;
            public       postgres    false    176            �            1259    16410 	   auth_user    TABLE     �  CREATE TABLE auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(30) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);
    DROP TABLE public.auth_user;
       public         postgres    false    7            �            1259    16416    auth_user_groups    TABLE     x   CREATE TABLE auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);
 $   DROP TABLE public.auth_user_groups;
       public         postgres    false    7            �            1259    16419    auth_user_groups_id_seq    SEQUENCE     y   CREATE SEQUENCE auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.auth_user_groups_id_seq;
       public       postgres    false    7    178                       0    0    auth_user_groups_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE auth_user_groups_id_seq OWNED BY auth_user_groups.id;
            public       postgres    false    179            �            1259    16421    auth_user_id_seq    SEQUENCE     r   CREATE SEQUENCE auth_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.auth_user_id_seq;
       public       postgres    false    7    177                       0    0    auth_user_id_seq    SEQUENCE OWNED BY     7   ALTER SEQUENCE auth_user_id_seq OWNED BY auth_user.id;
            public       postgres    false    180            �            1259    16423    auth_user_user_permissions    TABLE     �   CREATE TABLE auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);
 .   DROP TABLE public.auth_user_user_permissions;
       public         postgres    false    7            �            1259    16426 !   auth_user_user_permissions_id_seq    SEQUENCE     �   CREATE SEQUENCE auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public.auth_user_user_permissions_id_seq;
       public       postgres    false    7    181                       0    0 !   auth_user_user_permissions_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE auth_user_user_permissions_id_seq OWNED BY auth_user_user_permissions.id;
            public       postgres    false    182            �            1259    16428    block    TABLE     �   CREATE TABLE block (
    id integer NOT NULL,
    name character varying(64),
    active integer DEFAULT 1 NOT NULL,
    description text
);
    DROP TABLE public.block;
       public         postgres    false    7            �            1259    16435    block_id_seq    SEQUENCE     n   CREATE SEQUENCE block_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.block_id_seq;
       public       postgres    false    7    183                       0    0    block_id_seq    SEQUENCE OWNED BY     /   ALTER SEQUENCE block_id_seq OWNED BY block.id;
            public       postgres    false    184            �            1259    16437    confirm    TABLE     �   CREATE TABLE confirm (
    id integer NOT NULL,
    openid character varying(128),
    email character varying(128),
    createtime integer,
    active integer DEFAULT 0 NOT NULL
);
    DROP TABLE public.confirm;
       public         postgres    false    7            �            1259    16441    confirm_id_seq    SEQUENCE     p   CREATE SEQUENCE confirm_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.confirm_id_seq;
       public       postgres    false    185    7                       0    0    confirm_id_seq    SEQUENCE OWNED BY     3   ALTER SEQUENCE confirm_id_seq OWNED BY confirm.id;
            public       postgres    false    186            �            1259    16443    django_admin_log    TABLE     �  CREATE TABLE django_admin_log (
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
       public         postgres    false    7            �            1259    16450    django_admin_log_id_seq    SEQUENCE     y   CREATE SEQUENCE django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.django_admin_log_id_seq;
       public       postgres    false    7    187                       0    0    django_admin_log_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE django_admin_log_id_seq OWNED BY django_admin_log.id;
            public       postgres    false    188            �            1259    16452    django_content_type    TABLE     �   CREATE TABLE django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);
 '   DROP TABLE public.django_content_type;
       public         postgres    false    7            �            1259    16455    django_content_type_id_seq    SEQUENCE     |   CREATE SEQUENCE django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.django_content_type_id_seq;
       public       postgres    false    189    7                       0    0    django_content_type_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE django_content_type_id_seq OWNED BY django_content_type.id;
            public       postgres    false    190            �            1259    16457    django_migrations    TABLE     �   CREATE TABLE django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);
 %   DROP TABLE public.django_migrations;
       public         postgres    false    7            �            1259    16463    django_migrations_id_seq    SEQUENCE     z   CREATE SEQUENCE django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.django_migrations_id_seq;
       public       postgres    false    7    191                       0    0    django_migrations_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE django_migrations_id_seq OWNED BY django_migrations.id;
            public       postgres    false    192            �            1259    16465    django_session    TABLE     �   CREATE TABLE django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);
 "   DROP TABLE public.django_session;
       public         postgres    false    7            �            1259    16471    event    TABLE     n   CREATE TABLE event (
    id integer NOT NULL,
    authorid integer,
    target integer,
    action integer
);
    DROP TABLE public.event;
       public         postgres    false    7                       0    0    COLUMN event.action    COMMENT     J   COMMENT ON COLUMN event.action IS '1=>viewblock
2=>upblock
3=>upanswer
';
            public       postgres    false    194            �            1259    16474    event_id_seq    SEQUENCE     n   CREATE SEQUENCE event_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.event_id_seq;
       public       postgres    false    194    7                       0    0    event_id_seq    SEQUENCE OWNED BY     /   ALTER SEQUENCE event_id_seq OWNED BY event.id;
            public       postgres    false    195            �            1259    16476    post    TABLE     �  CREATE TABLE post (
    id integer NOT NULL,
    subject character varying(512),
    description text,
    authorid integer,
    createtime integer,
    edittime integer,
    blockid integer,
    topicid integer,
    hot integer DEFAULT 0 NOT NULL,
    resnum integer DEFAULT 0 NOT NULL,
    top integer DEFAULT 0 NOT NULL,
    updatetime integer,
    up integer DEFAULT 0 NOT NULL,
    hours integer
);
    DROP TABLE public.post;
       public         postgres    false    7                       0    0    COLUMN post.top    COMMENT     G   COMMENT ON COLUMN post.top IS '0==>not top
1==>block top
2==>all top';
            public       postgres    false    196            �            1259    16486    post_id_seq    SEQUENCE     m   CREATE SEQUENCE post_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.post_id_seq;
       public       postgres    false    7    196                       0    0    post_id_seq    SEQUENCE OWNED BY     -   ALTER SEQUENCE post_id_seq OWNED BY post.id;
            public       postgres    false    197            �            1259    16488    token    TABLE     �   CREATE TABLE token (
    id integer NOT NULL,
    token character varying,
    expires integer,
    name character varying(8)
);
    DROP TABLE public.token;
       public         postgres    false    7            �            1259    16494    token_id_seq    SEQUENCE     n   CREATE SEQUENCE token_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.token_id_seq;
       public       postgres    false    198    7                        0    0    token_id_seq    SEQUENCE OWNED BY     /   ALTER SEQUENCE token_id_seq OWNED BY token.id;
            public       postgres    false    199            �            1259    16496    topic    TABLE     �   CREATE TABLE topic (
    id integer NOT NULL,
    name character varying(64),
    blockid integer,
    active integer DEFAULT 1 NOT NULL
);
    DROP TABLE public.topic;
       public         postgres    false    7            �            1259    16500    topic_id_seq    SEQUENCE     n   CREATE SEQUENCE topic_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.topic_id_seq;
       public       postgres    false    7    200            !           0    0    topic_id_seq    SEQUENCE OWNED BY     /   ALTER SEQUENCE topic_id_seq OWNED BY topic.id;
            public       postgres    false    201            �            1259    16502 
   wechatuser    TABLE     �  CREATE TABLE wechatuser (
    id integer NOT NULL,
    openid character varying(256),
    nickname character varying(256),
    headimg character varying(256),
    email character varying(128),
    nsnid integer,
    sex integer,
    jointime integer,
    logintime integer,
    active integer DEFAULT 1 NOT NULL,
    userid character varying(256),
    qrcode character varying(256),
    mobile character varying(128)
);
    DROP TABLE public.wechatuser;
       public         postgres    false    7            �            1259    16509    wechatuser_id_seq    SEQUENCE     s   CREATE SEQUENCE wechatuser_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.wechatuser_id_seq;
       public       postgres    false    202    7            "           0    0    wechatuser_id_seq    SEQUENCE OWNED BY     9   ALTER SEQUENCE wechatuser_id_seq OWNED BY wechatuser.id;
            public       postgres    false    203                       2604    16511    id    DEFAULT     X   ALTER TABLE ONLY answer ALTER COLUMN id SET DEFAULT nextval('answer_id_seq'::regclass);
 8   ALTER TABLE public.answer ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    170    169                       2604    16513    id    DEFAULT     `   ALTER TABLE ONLY auth_group ALTER COLUMN id SET DEFAULT nextval('auth_group_id_seq'::regclass);
 <   ALTER TABLE public.auth_group ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    172    171                       2604    16514    id    DEFAULT     x   ALTER TABLE ONLY auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('auth_group_permissions_id_seq'::regclass);
 H   ALTER TABLE public.auth_group_permissions ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    174    173                       2604    16515    id    DEFAULT     j   ALTER TABLE ONLY auth_permission ALTER COLUMN id SET DEFAULT nextval('auth_permission_id_seq'::regclass);
 A   ALTER TABLE public.auth_permission ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    176    175                       2604    16516    id    DEFAULT     ^   ALTER TABLE ONLY auth_user ALTER COLUMN id SET DEFAULT nextval('auth_user_id_seq'::regclass);
 ;   ALTER TABLE public.auth_user ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    180    177                       2604    16517    id    DEFAULT     l   ALTER TABLE ONLY auth_user_groups ALTER COLUMN id SET DEFAULT nextval('auth_user_groups_id_seq'::regclass);
 B   ALTER TABLE public.auth_user_groups ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    179    178                       2604    16518    id    DEFAULT     �   ALTER TABLE ONLY auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('auth_user_user_permissions_id_seq'::regclass);
 L   ALTER TABLE public.auth_user_user_permissions ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    182    181            !           2604    16519    id    DEFAULT     V   ALTER TABLE ONLY block ALTER COLUMN id SET DEFAULT nextval('block_id_seq'::regclass);
 7   ALTER TABLE public.block ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    184    183            #           2604    16520    id    DEFAULT     Z   ALTER TABLE ONLY confirm ALTER COLUMN id SET DEFAULT nextval('confirm_id_seq'::regclass);
 9   ALTER TABLE public.confirm ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    186    185            $           2604    16521    id    DEFAULT     l   ALTER TABLE ONLY django_admin_log ALTER COLUMN id SET DEFAULT nextval('django_admin_log_id_seq'::regclass);
 B   ALTER TABLE public.django_admin_log ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    188    187            &           2604    16522    id    DEFAULT     r   ALTER TABLE ONLY django_content_type ALTER COLUMN id SET DEFAULT nextval('django_content_type_id_seq'::regclass);
 E   ALTER TABLE public.django_content_type ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    190    189            '           2604    16523    id    DEFAULT     n   ALTER TABLE ONLY django_migrations ALTER COLUMN id SET DEFAULT nextval('django_migrations_id_seq'::regclass);
 C   ALTER TABLE public.django_migrations ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    192    191            (           2604    16524    id    DEFAULT     V   ALTER TABLE ONLY event ALTER COLUMN id SET DEFAULT nextval('event_id_seq'::regclass);
 7   ALTER TABLE public.event ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    195    194            -           2604    16525    id    DEFAULT     T   ALTER TABLE ONLY post ALTER COLUMN id SET DEFAULT nextval('post_id_seq'::regclass);
 6   ALTER TABLE public.post ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    197    196            .           2604    16526    id    DEFAULT     V   ALTER TABLE ONLY token ALTER COLUMN id SET DEFAULT nextval('token_id_seq'::regclass);
 7   ALTER TABLE public.token ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    199    198            0           2604    16527    id    DEFAULT     V   ALTER TABLE ONLY topic ALTER COLUMN id SET DEFAULT nextval('topic_id_seq'::regclass);
 7   ALTER TABLE public.topic ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    201    200            2           2604    16528    id    DEFAULT     `   ALTER TABLE ONLY wechatuser ALTER COLUMN id SET DEFAULT nextval('wechatuser_id_seq'::regclass);
 <   ALTER TABLE public.wechatuser ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    203    202            �          0    16385    answer 
   TABLE DATA               k   COPY answer (id, postid, answerid, description, imgs, createtime, authorid, active, up, floor) FROM stdin;
    public       postgres    false    169   ��       #           0    0    answer_id_seq    SEQUENCE SET     4   SELECT pg_catalog.setval('answer_id_seq', 4, true);
            public       postgres    false    170            �          0    16395 
   auth_group 
   TABLE DATA               '   COPY auth_group (id, name) FROM stdin;
    public       postgres    false    171   �       $           0    0    auth_group_id_seq    SEQUENCE SET     9   SELECT pg_catalog.setval('auth_group_id_seq', 1, false);
            public       postgres    false    172            �          0    16400    auth_group_permissions 
   TABLE DATA               F   COPY auth_group_permissions (id, group_id, permission_id) FROM stdin;
    public       postgres    false    173   7�       %           0    0    auth_group_permissions_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('auth_group_permissions_id_seq', 1, false);
            public       postgres    false    174            �          0    16405    auth_permission 
   TABLE DATA               G   COPY auth_permission (id, name, content_type_id, codename) FROM stdin;
    public       postgres    false    175   T�       &           0    0    auth_permission_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('auth_permission_id_seq', 1, false);
            public       postgres    false    176            �          0    16410 	   auth_user 
   TABLE DATA               �   COPY auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
    public       postgres    false    177   q�       �          0    16416    auth_user_groups 
   TABLE DATA               :   COPY auth_user_groups (id, user_id, group_id) FROM stdin;
    public       postgres    false    178   ��       '           0    0    auth_user_groups_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('auth_user_groups_id_seq', 1, false);
            public       postgres    false    179            (           0    0    auth_user_id_seq    SEQUENCE SET     8   SELECT pg_catalog.setval('auth_user_id_seq', 1, false);
            public       postgres    false    180            �          0    16423    auth_user_user_permissions 
   TABLE DATA               I   COPY auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
    public       postgres    false    181   ��       )           0    0 !   auth_user_user_permissions_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('auth_user_user_permissions_id_seq', 1, false);
            public       postgres    false    182            �          0    16428    block 
   TABLE DATA               7   COPY block (id, name, active, description) FROM stdin;
    public       postgres    false    183   Ⱥ       *           0    0    block_id_seq    SEQUENCE SET     3   SELECT pg_catalog.setval('block_id_seq', 2, true);
            public       postgres    false    184            �          0    16437    confirm 
   TABLE DATA               A   COPY confirm (id, openid, email, createtime, active) FROM stdin;
    public       postgres    false    185   &�       +           0    0    confirm_id_seq    SEQUENCE SET     5   SELECT pg_catalog.setval('confirm_id_seq', 3, true);
            public       postgres    false    186            �          0    16443    django_admin_log 
   TABLE DATA               �   COPY django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
    public       postgres    false    187   ��       ,           0    0    django_admin_log_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('django_admin_log_id_seq', 1, false);
            public       postgres    false    188            �          0    16452    django_content_type 
   TABLE DATA               <   COPY django_content_type (id, app_label, model) FROM stdin;
    public       postgres    false    189   ̻       -           0    0    django_content_type_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('django_content_type_id_seq', 1, false);
            public       postgres    false    190            �          0    16457    django_migrations 
   TABLE DATA               <   COPY django_migrations (id, app, name, applied) FROM stdin;
    public       postgres    false    191   �       .           0    0    django_migrations_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('django_migrations_id_seq', 1, false);
            public       postgres    false    192            �          0    16465    django_session 
   TABLE DATA               I   COPY django_session (session_key, session_data, expire_date) FROM stdin;
    public       postgres    false    193   �       �          0    16471    event 
   TABLE DATA               6   COPY event (id, authorid, target, action) FROM stdin;
    public       postgres    false    194   q�       /           0    0    event_id_seq    SEQUENCE SET     4   SELECT pg_catalog.setval('event_id_seq', 20, true);
            public       postgres    false    195                       0    16476    post 
   TABLE DATA               �   COPY post (id, subject, description, authorid, createtime, edittime, blockid, topicid, hot, resnum, top, updatetime, up, hours) FROM stdin;
    public       postgres    false    196   ��       0           0    0    post_id_seq    SEQUENCE SET     3   SELECT pg_catalog.setval('post_id_seq', 33, true);
            public       postgres    false    197                      0    16488    token 
   TABLE DATA               2   COPY token (id, token, expires, name) FROM stdin;
    public       postgres    false    198   ��       1           0    0    token_id_seq    SEQUENCE SET     3   SELECT pg_catalog.setval('token_id_seq', 1, true);
            public       postgres    false    199                      0    16496    topic 
   TABLE DATA               3   COPY topic (id, name, blockid, active) FROM stdin;
    public       postgres    false    200   ��       2           0    0    topic_id_seq    SEQUENCE SET     3   SELECT pg_catalog.setval('topic_id_seq', 3, true);
            public       postgres    false    201                      0    16502 
   wechatuser 
   TABLE DATA               �   COPY wechatuser (id, openid, nickname, headimg, email, nsnid, sex, jointime, logintime, active, userid, qrcode, mobile) FROM stdin;
    public       postgres    false    202   !�       3           0    0    wechatuser_id_seq    SEQUENCE SET     9   SELECT pg_catalog.setval('wechatuser_id_seq', 10, true);
            public       postgres    false    203            4           2606    16530    answer_pkey 
   CONSTRAINT     I   ALTER TABLE ONLY answer
    ADD CONSTRAINT answer_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.answer DROP CONSTRAINT answer_pkey;
       public         postgres    false    169    169            7           2606    16532    auth_group_name_key 
   CONSTRAINT     R   ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);
 H   ALTER TABLE ONLY public.auth_group DROP CONSTRAINT auth_group_name_key;
       public         postgres    false    171    171            <           2606    16534 ;   auth_group_permissions_group_id_permission_id_0cd325b0_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);
 |   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq;
       public         postgres    false    173    173    173            ?           2606    16536    auth_group_permissions_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);
 \   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_pkey;
       public         postgres    false    173    173            9           2606    16538    auth_group_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.auth_group DROP CONSTRAINT auth_group_pkey;
       public         postgres    false    171    171            B           2606    16540 6   auth_permission_content_type_id_codename_01ab375a_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);
 p   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq;
       public         postgres    false    175    175    175            D           2606    16542    auth_permission_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_pkey;
       public         postgres    false    175    175            L           2606    16544    auth_user_groups_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_pkey;
       public         postgres    false    178    178            O           2606    16546 /   auth_user_groups_user_id_group_id_94350c0c_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);
 j   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq;
       public         postgres    false    178    178    178            F           2606    16548    auth_user_pkey 
   CONSTRAINT     O   ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.auth_user DROP CONSTRAINT auth_user_pkey;
       public         postgres    false    177    177            R           2606    16550    auth_user_user_permissions_pkey 
   CONSTRAINT     q   ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);
 d   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_pkey;
       public         postgres    false    181    181            U           2606    16552 >   auth_user_user_permissions_user_id_permission_id_14a6b632_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);
 �   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq;
       public         postgres    false    181    181    181            I           2606    16554    auth_user_username_key 
   CONSTRAINT     X   ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);
 J   ALTER TABLE ONLY public.auth_user DROP CONSTRAINT auth_user_username_key;
       public         postgres    false    177    177            W           2606    16556 
   block_pkey 
   CONSTRAINT     G   ALTER TABLE ONLY block
    ADD CONSTRAINT block_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.block DROP CONSTRAINT block_pkey;
       public         postgres    false    183    183            Y           2606    16558    confirm_pkey 
   CONSTRAINT     K   ALTER TABLE ONLY confirm
    ADD CONSTRAINT confirm_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.confirm DROP CONSTRAINT confirm_pkey;
       public         postgres    false    185    185            \           2606    16560    django_admin_log_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_pkey;
       public         postgres    false    187    187            _           2606    16562 1   django_content_type_app_label_model_76bd3d3b_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);
 o   ALTER TABLE ONLY public.django_content_type DROP CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq;
       public         postgres    false    189    189    189            a           2606    16564    django_content_type_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.django_content_type DROP CONSTRAINT django_content_type_pkey;
       public         postgres    false    189    189            c           2606    16566    django_migrations_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.django_migrations DROP CONSTRAINT django_migrations_pkey;
       public         postgres    false    191    191            f           2606    16568    django_session_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);
 L   ALTER TABLE ONLY public.django_session DROP CONSTRAINT django_session_pkey;
       public         postgres    false    193    193            i           2606    16570 
   event_pkey 
   CONSTRAINT     G   ALTER TABLE ONLY event
    ADD CONSTRAINT event_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.event DROP CONSTRAINT event_pkey;
       public         postgres    false    194    194            k           2606    16572 	   post_pkey 
   CONSTRAINT     E   ALTER TABLE ONLY post
    ADD CONSTRAINT post_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.post DROP CONSTRAINT post_pkey;
       public         postgres    false    196    196            m           2606    16574 
   token_pkey 
   CONSTRAINT     G   ALTER TABLE ONLY token
    ADD CONSTRAINT token_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.token DROP CONSTRAINT token_pkey;
       public         postgres    false    198    198            o           2606    16576 
   topic_pkey 
   CONSTRAINT     G   ALTER TABLE ONLY topic
    ADD CONSTRAINT topic_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.topic DROP CONSTRAINT topic_pkey;
       public         postgres    false    200    200            q           2606    16578    wechatuser_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY wechatuser
    ADD CONSTRAINT wechatuser_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.wechatuser DROP CONSTRAINT wechatuser_pkey;
       public         postgres    false    202    202            5           1259    16579    auth_group_name_a6ea08ec_like    INDEX     a   CREATE INDEX auth_group_name_a6ea08ec_like ON auth_group USING btree (name varchar_pattern_ops);
 1   DROP INDEX public.auth_group_name_a6ea08ec_like;
       public         postgres    false    171            :           1259    16580 (   auth_group_permissions_group_id_b120cbf9    INDEX     h   CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON auth_group_permissions USING btree (group_id);
 <   DROP INDEX public.auth_group_permissions_group_id_b120cbf9;
       public         postgres    false    173            =           1259    16581 -   auth_group_permissions_permission_id_84c5c92e    INDEX     r   CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON auth_group_permissions USING btree (permission_id);
 A   DROP INDEX public.auth_group_permissions_permission_id_84c5c92e;
       public         postgres    false    173            @           1259    16582 (   auth_permission_content_type_id_2f476e4b    INDEX     h   CREATE INDEX auth_permission_content_type_id_2f476e4b ON auth_permission USING btree (content_type_id);
 <   DROP INDEX public.auth_permission_content_type_id_2f476e4b;
       public         postgres    false    175            J           1259    16583 "   auth_user_groups_group_id_97559544    INDEX     \   CREATE INDEX auth_user_groups_group_id_97559544 ON auth_user_groups USING btree (group_id);
 6   DROP INDEX public.auth_user_groups_group_id_97559544;
       public         postgres    false    178            M           1259    16584 !   auth_user_groups_user_id_6a12ed8b    INDEX     Z   CREATE INDEX auth_user_groups_user_id_6a12ed8b ON auth_user_groups USING btree (user_id);
 5   DROP INDEX public.auth_user_groups_user_id_6a12ed8b;
       public         postgres    false    178            P           1259    16585 1   auth_user_user_permissions_permission_id_1fbb5f2c    INDEX     z   CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON auth_user_user_permissions USING btree (permission_id);
 E   DROP INDEX public.auth_user_user_permissions_permission_id_1fbb5f2c;
       public         postgres    false    181            S           1259    16586 +   auth_user_user_permissions_user_id_a95ead1b    INDEX     n   CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON auth_user_user_permissions USING btree (user_id);
 ?   DROP INDEX public.auth_user_user_permissions_user_id_a95ead1b;
       public         postgres    false    181            G           1259    16587     auth_user_username_6821ab7c_like    INDEX     g   CREATE INDEX auth_user_username_6821ab7c_like ON auth_user USING btree (username varchar_pattern_ops);
 4   DROP INDEX public.auth_user_username_6821ab7c_like;
       public         postgres    false    177            Z           1259    16588 )   django_admin_log_content_type_id_c4bce8eb    INDEX     j   CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON django_admin_log USING btree (content_type_id);
 =   DROP INDEX public.django_admin_log_content_type_id_c4bce8eb;
       public         postgres    false    187            ]           1259    16589 !   django_admin_log_user_id_c564eba6    INDEX     Z   CREATE INDEX django_admin_log_user_id_c564eba6 ON django_admin_log USING btree (user_id);
 5   DROP INDEX public.django_admin_log_user_id_c564eba6;
       public         postgres    false    187            d           1259    16590 #   django_session_expire_date_a5c62663    INDEX     ^   CREATE INDEX django_session_expire_date_a5c62663 ON django_session USING btree (expire_date);
 7   DROP INDEX public.django_session_expire_date_a5c62663;
       public         postgres    false    193            g           1259    16591 (   django_session_session_key_c0390e0f_like    INDEX     w   CREATE INDEX django_session_session_key_c0390e0f_like ON django_session USING btree (session_key varchar_pattern_ops);
 <   DROP INDEX public.django_session_session_key_c0390e0f_like;
       public         postgres    false    193            r           2606    16592 8   auth_group_permissio_permission_id_84c5c92e_fk_auth_perm    FK CONSTRAINT     �   ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;
 y   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm;
       public       postgres    false    2884    175    173            s           2606    16597 9   auth_group_permissions_group_id_b120cbf9_fk_auth_group_id    FK CONSTRAINT     �   ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;
 z   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id;
       public       postgres    false    171    2873    173            t           2606    16602 5   auth_permission_content_type_id_2f476e4b_fk_django_co    FK CONSTRAINT     �   ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;
 o   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co;
       public       postgres    false    2913    175    189            u           2606    16607 3   auth_user_groups_group_id_97559544_fk_auth_group_id    FK CONSTRAINT     �   ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;
 n   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id;
       public       postgres    false    171    2873    178            v           2606    16612 1   auth_user_groups_user_id_6a12ed8b_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 l   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id;
       public       postgres    false    2886    178    177            w           2606    16617 8   auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm    FK CONSTRAINT     �   ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;
 }   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm;
       public       postgres    false    181    2884    175            x           2606    16622 ;   auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id;
       public       postgres    false    2886    177    181            y           2606    16627 6   django_admin_log_content_type_id_c4bce8eb_fk_django_co    FK CONSTRAINT     �   ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;
 q   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co;
       public       postgres    false    187    189    2913            z           2606    16632 1   django_admin_log_user_id_c564eba6_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 l   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id;
       public       postgres    false    2886    187    177            �   q   x�3�46���|�u�24536502�4�ANC.#�
CΧ���^�t���Kz���y޴U���'D��1D�s3KSN���\& ƜO'�"�SC#��&\1z\\\ ��+�      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �   N   x�3�|Ѿ�Y������>�Z�i�闟���&�b݆�{������ɮ�\F�O�4<�������n�&d.W� ��3�      �   y   x�3��Ϭ�2+�ȏ��/�HMI�r�5�,6)
	��H��*�ӫ�H�Kw����L�-NJ���K���445366�06��4�2�d�[��cnd��cl���bQ���J� S3#3�A1z\\\ jv-�      �      x������ � �      �      x������ � �      �      x������ � �      �   [  x��ع��F`��)��D�"d�.�[=� czȦ�X@�*^ �]C��������3��̳$�Q���t86SWN*���he������e>���3�Ξ���9�=r�	8��yV���m�]o�~�:��5+�t�����7�>��s�ԯ�����������a�0������s��'���?C�b�B�0.0c� �LK�Ӥ��)
R�uu?P�F�ȧ��-��ޯ7|=���nn���~Hf��c�z�E߮���z!�����ϳw���� ��8H��t"S�1��H��H0"K�	��۷|+�P��D��w�f���`U�A��c�0֗>ױ��e.E���oo[w&]��ҊePl@F�B&��j�fo.�.F�$����E,V�0���§�X�6l��g���{�K�|k�Y]�A�4��(ꢀ$��9-uc�|w/w)w�o� �6��v����}x��u��V���_��..�%�b�yu�eV����2[D�V�_�I����.��k?<�m��~8@<�I�}8g�խ�UE4ߝ�]���R�6/N몉�b[f]�k��A���
��%.��HR���f%�%GS'C�a�g6�Y׻-��y���C�>��*RTa����b�P�,�tC��w�3�`)0$/k��40�!�ʦURu>c*�u{���^��P,%��48�2�$6����H��@�v�ы>C��&��X��M��|��>/e�䅟��'�&Ul����z�Z\�R����<�%��U�Tdмm�o�����]�܅�A��[.��8���T9e&�dVƦ�が{{��a�0���)�Z��r�UM�z��޶� �::�.����a=���z�+�_����ͧsh��<����!�N�|����Q���W��;�o?�K�y���|'��~��z�KV/"m��䙅y�?;T�4�ABaP�����]�sG2&�6o�H�04&m��Yp3FU��d���.\�I��\p8q=�l�8K��2������Ε.eX��}Ie�2q�3�Ӡ�\a6�\����{���%��Q�G<LeU(�e�*˨��e�i�y\�q�q#�v����-�9�q�[E�	�e!!�Y7�c�/TOk�������ܮ/ڳ�(�w����m-�G�����l��{��O��r_�����q�@��].��.�������r�m! �c�p>�0�F�~f �H���
M�����3��4[ہ0D��~ �dZ�y��C}�%v"f�c?�e�L�ͻ��z�
(��;g�s��X�ziD$Rm�$E�1!{{���ȡ�a�m�g
p��5ls00v��e�@����y��[4欧:#[?�������&�9      �   d   x�%���0��a��<v��s�G[�D������m=�Ǻ�Ӻ����k��a@t\���(j9�`@Κ���;+=�akKN
2�2���K��(�          �  x���Mo�@���_YB��G7AN�gN+�4��Q�QlR�E
��,��R�"
��$�Ҧ����gm��X;Fr@p@+�_��3��3���g����M��;����f}t����ӂ��VW��G��'�D%�Y�~��!8;�����^��9���L�ey>��Q�
�%N�\i������ǻ0���
�=8�v�����"IVk�R��iyZSjjI��zD~�uX'Wabumn���J�AA���)1��m���6Mߙ�Sý0p���p0���ȝ���]z���������S�܋a�EYV�o�Te�.HD��j)O3�^���R�*�Lؑ˳��5ES��ʽ�&����e%Oo��~�ǲW��{6���Ի����طuZ���_�1�E�%I� "!F�%�y�`)2`�CPO[ޱ����lRF�ť���6��� ��2��	�_>�#'�F���$�(�L��0~��;;Φ9qI��]
 .j}����e6K�         �   x���rD0  �g�E���Z��d��tƸo�4]j�����I�J��,�t�b�I<{�=��b\�Y��eAκ��3'ӓ!ZH��3��Z��K���n>�8���u�	�@���>-]pA���Ӿ�1<��н~c:�C"e�������C�5�'X,~,^���p�f���z�GP�9pN��@?G_B���¬2I3LC�����Z��E���LP         ;   x�3�|6��i���6<�;�ӐӐˈ������?�h{�k5XȘ�����Ȋ���� ��j         �  x���K��@���]�M��HQ�#C��3� �H�n���~�����Q6���fX�ɦ��R����0R2ю�z��,�=���m�^�Uk+m÷� ,��̶�,�)I]�o ���`�I��.�s�(z
�����'ƢZݮ�B�����}�ejܴcrL'mo�O�ÿ�<N|.����,�ꤞ�\�CVn���VHP�+x8�7��x��Y���٩�ݳ�k��bQD���(�411����#pg?p�6�cG����,6S�AI|�i$8&��_,v�����(�j�&��.�!��&�A.����F��*~��fkw�$�>d�Q�,�n�0���_~������	C��ٕ�/Rh��;˂v�˝AD��	��ݕY:�&����۞�ܖG�?Y���Kb����w���F(�����%��DX7��uj��TU�z��}     