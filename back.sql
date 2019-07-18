PGDMP                         w            csr    9.2.24    9.5.5 �    
           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false                       1262    17229    csr    DATABASE     s   CREATE DATABASE csr WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_US.utf8' LC_CTYPE = 'en_US.utf8';
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
                       false    1            �            1259    17230    answer    TABLE       CREATE TABLE answer (
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
       public         postgres    false    7            �            1259    17238    answer_id_seq    SEQUENCE     o   CREATE SEQUENCE answer_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.answer_id_seq;
       public       postgres    false    169    7                       0    0    answer_id_seq    SEQUENCE OWNED BY     1   ALTER SEQUENCE answer_id_seq OWNED BY answer.id;
            public       postgres    false    170            �            1259    17240 
   auth_group    TABLE     ^   CREATE TABLE auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);
    DROP TABLE public.auth_group;
       public         postgres    false    7            �            1259    17243    auth_group_id_seq    SEQUENCE     s   CREATE SEQUENCE auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.auth_group_id_seq;
       public       postgres    false    7    171                       0    0    auth_group_id_seq    SEQUENCE OWNED BY     9   ALTER SEQUENCE auth_group_id_seq OWNED BY auth_group.id;
            public       postgres    false    172            �            1259    17245    auth_group_permissions    TABLE     �   CREATE TABLE auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);
 *   DROP TABLE public.auth_group_permissions;
       public         postgres    false    7            �            1259    17248    auth_group_permissions_id_seq    SEQUENCE        CREATE SEQUENCE auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.auth_group_permissions_id_seq;
       public       postgres    false    173    7                       0    0    auth_group_permissions_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE auth_group_permissions_id_seq OWNED BY auth_group_permissions.id;
            public       postgres    false    174            �            1259    17250    auth_permission    TABLE     �   CREATE TABLE auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);
 #   DROP TABLE public.auth_permission;
       public         postgres    false    7            �            1259    17253    auth_permission_id_seq    SEQUENCE     x   CREATE SEQUENCE auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.auth_permission_id_seq;
       public       postgres    false    7    175                       0    0    auth_permission_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE auth_permission_id_seq OWNED BY auth_permission.id;
            public       postgres    false    176            �            1259    17255 	   auth_user    TABLE     �  CREATE TABLE auth_user (
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
       public         postgres    false    7            �            1259    17261    auth_user_groups    TABLE     x   CREATE TABLE auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);
 $   DROP TABLE public.auth_user_groups;
       public         postgres    false    7            �            1259    17264    auth_user_groups_id_seq    SEQUENCE     y   CREATE SEQUENCE auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.auth_user_groups_id_seq;
       public       postgres    false    7    178                       0    0    auth_user_groups_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE auth_user_groups_id_seq OWNED BY auth_user_groups.id;
            public       postgres    false    179            �            1259    17266    auth_user_id_seq    SEQUENCE     r   CREATE SEQUENCE auth_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.auth_user_id_seq;
       public       postgres    false    7    177                       0    0    auth_user_id_seq    SEQUENCE OWNED BY     7   ALTER SEQUENCE auth_user_id_seq OWNED BY auth_user.id;
            public       postgres    false    180            �            1259    17268    auth_user_user_permissions    TABLE     �   CREATE TABLE auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);
 .   DROP TABLE public.auth_user_user_permissions;
       public         postgres    false    7            �            1259    17271 !   auth_user_user_permissions_id_seq    SEQUENCE     �   CREATE SEQUENCE auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public.auth_user_user_permissions_id_seq;
       public       postgres    false    7    181                       0    0 !   auth_user_user_permissions_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE auth_user_user_permissions_id_seq OWNED BY auth_user_user_permissions.id;
            public       postgres    false    182            �            1259    17273    block    TABLE     �   CREATE TABLE block (
    id integer NOT NULL,
    name character varying(64),
    active integer DEFAULT 1 NOT NULL,
    description text
);
    DROP TABLE public.block;
       public         postgres    false    7            �            1259    17280    block_id_seq    SEQUENCE     n   CREATE SEQUENCE block_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.block_id_seq;
       public       postgres    false    7    183                       0    0    block_id_seq    SEQUENCE OWNED BY     /   ALTER SEQUENCE block_id_seq OWNED BY block.id;
            public       postgres    false    184            �            1259    17282    confirm    TABLE     �   CREATE TABLE confirm (
    id integer NOT NULL,
    openid character varying(128),
    email character varying(128),
    createtime integer,
    active integer DEFAULT 0 NOT NULL
);
    DROP TABLE public.confirm;
       public         postgres    false    7            �            1259    17286    confirm_id_seq    SEQUENCE     p   CREATE SEQUENCE confirm_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.confirm_id_seq;
       public       postgres    false    185    7                       0    0    confirm_id_seq    SEQUENCE OWNED BY     3   ALTER SEQUENCE confirm_id_seq OWNED BY confirm.id;
            public       postgres    false    186            �            1259    17288    django_admin_log    TABLE     �  CREATE TABLE django_admin_log (
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
       public         postgres    false    7            �            1259    17295    django_admin_log_id_seq    SEQUENCE     y   CREATE SEQUENCE django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.django_admin_log_id_seq;
       public       postgres    false    7    187                       0    0    django_admin_log_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE django_admin_log_id_seq OWNED BY django_admin_log.id;
            public       postgres    false    188            �            1259    17297    django_content_type    TABLE     �   CREATE TABLE django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);
 '   DROP TABLE public.django_content_type;
       public         postgres    false    7            �            1259    17300    django_content_type_id_seq    SEQUENCE     |   CREATE SEQUENCE django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.django_content_type_id_seq;
       public       postgres    false    189    7                       0    0    django_content_type_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE django_content_type_id_seq OWNED BY django_content_type.id;
            public       postgres    false    190            �            1259    17302    django_migrations    TABLE     �   CREATE TABLE django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);
 %   DROP TABLE public.django_migrations;
       public         postgres    false    7            �            1259    17308    django_migrations_id_seq    SEQUENCE     z   CREATE SEQUENCE django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.django_migrations_id_seq;
       public       postgres    false    7    191                       0    0    django_migrations_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE django_migrations_id_seq OWNED BY django_migrations.id;
            public       postgres    false    192            �            1259    17310    django_session    TABLE     �   CREATE TABLE django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);
 "   DROP TABLE public.django_session;
       public         postgres    false    7            �            1259    17316    event    TABLE     n   CREATE TABLE event (
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
            public       postgres    false    194            �            1259    17319    event_id_seq    SEQUENCE     n   CREATE SEQUENCE event_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.event_id_seq;
       public       postgres    false    194    7                       0    0    event_id_seq    SEQUENCE OWNED BY     /   ALTER SEQUENCE event_id_seq OWNED BY event.id;
            public       postgres    false    195            �            1259    17321    post    TABLE     �  CREATE TABLE post (
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
            public       postgres    false    196            �            1259    17331    post_id_seq    SEQUENCE     m   CREATE SEQUENCE post_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.post_id_seq;
       public       postgres    false    7    196                       0    0    post_id_seq    SEQUENCE OWNED BY     -   ALTER SEQUENCE post_id_seq OWNED BY post.id;
            public       postgres    false    197            �            1259    17333    token    TABLE     �   CREATE TABLE token (
    id integer NOT NULL,
    token character varying,
    expires integer,
    name character varying(8)
);
    DROP TABLE public.token;
       public         postgres    false    7            �            1259    17339    token_id_seq    SEQUENCE     n   CREATE SEQUENCE token_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.token_id_seq;
       public       postgres    false    198    7                        0    0    token_id_seq    SEQUENCE OWNED BY     /   ALTER SEQUENCE token_id_seq OWNED BY token.id;
            public       postgres    false    199            �            1259    17341    topic    TABLE     �   CREATE TABLE topic (
    id integer NOT NULL,
    name character varying(64),
    blockid integer,
    active integer DEFAULT 1 NOT NULL
);
    DROP TABLE public.topic;
       public         postgres    false    7            �            1259    17345    topic_id_seq    SEQUENCE     n   CREATE SEQUENCE topic_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.topic_id_seq;
       public       postgres    false    7    200            !           0    0    topic_id_seq    SEQUENCE OWNED BY     /   ALTER SEQUENCE topic_id_seq OWNED BY topic.id;
            public       postgres    false    201            �            1259    17347 
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
       public         postgres    false    7            �            1259    17354    wechatuser_id_seq    SEQUENCE     s   CREATE SEQUENCE wechatuser_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.wechatuser_id_seq;
       public       postgres    false    202    7            "           0    0    wechatuser_id_seq    SEQUENCE OWNED BY     9   ALTER SEQUENCE wechatuser_id_seq OWNED BY wechatuser.id;
            public       postgres    false    203                       2604    17356    id    DEFAULT     X   ALTER TABLE ONLY answer ALTER COLUMN id SET DEFAULT nextval('answer_id_seq'::regclass);
 8   ALTER TABLE public.answer ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    170    169                       2604    17357    id    DEFAULT     `   ALTER TABLE ONLY auth_group ALTER COLUMN id SET DEFAULT nextval('auth_group_id_seq'::regclass);
 <   ALTER TABLE public.auth_group ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    172    171                       2604    17358    id    DEFAULT     x   ALTER TABLE ONLY auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('auth_group_permissions_id_seq'::regclass);
 H   ALTER TABLE public.auth_group_permissions ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    174    173                       2604    17359    id    DEFAULT     j   ALTER TABLE ONLY auth_permission ALTER COLUMN id SET DEFAULT nextval('auth_permission_id_seq'::regclass);
 A   ALTER TABLE public.auth_permission ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    176    175                       2604    17360    id    DEFAULT     ^   ALTER TABLE ONLY auth_user ALTER COLUMN id SET DEFAULT nextval('auth_user_id_seq'::regclass);
 ;   ALTER TABLE public.auth_user ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    180    177                       2604    17361    id    DEFAULT     l   ALTER TABLE ONLY auth_user_groups ALTER COLUMN id SET DEFAULT nextval('auth_user_groups_id_seq'::regclass);
 B   ALTER TABLE public.auth_user_groups ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    179    178                       2604    17362    id    DEFAULT     �   ALTER TABLE ONLY auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('auth_user_user_permissions_id_seq'::regclass);
 L   ALTER TABLE public.auth_user_user_permissions ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    182    181            !           2604    17363    id    DEFAULT     V   ALTER TABLE ONLY block ALTER COLUMN id SET DEFAULT nextval('block_id_seq'::regclass);
 7   ALTER TABLE public.block ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    184    183            #           2604    17364    id    DEFAULT     Z   ALTER TABLE ONLY confirm ALTER COLUMN id SET DEFAULT nextval('confirm_id_seq'::regclass);
 9   ALTER TABLE public.confirm ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    186    185            $           2604    17365    id    DEFAULT     l   ALTER TABLE ONLY django_admin_log ALTER COLUMN id SET DEFAULT nextval('django_admin_log_id_seq'::regclass);
 B   ALTER TABLE public.django_admin_log ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    188    187            &           2604    17366    id    DEFAULT     r   ALTER TABLE ONLY django_content_type ALTER COLUMN id SET DEFAULT nextval('django_content_type_id_seq'::regclass);
 E   ALTER TABLE public.django_content_type ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    190    189            '           2604    17367    id    DEFAULT     n   ALTER TABLE ONLY django_migrations ALTER COLUMN id SET DEFAULT nextval('django_migrations_id_seq'::regclass);
 C   ALTER TABLE public.django_migrations ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    192    191            (           2604    17368    id    DEFAULT     V   ALTER TABLE ONLY event ALTER COLUMN id SET DEFAULT nextval('event_id_seq'::regclass);
 7   ALTER TABLE public.event ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    195    194            -           2604    17369    id    DEFAULT     T   ALTER TABLE ONLY post ALTER COLUMN id SET DEFAULT nextval('post_id_seq'::regclass);
 6   ALTER TABLE public.post ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    197    196            .           2604    17370    id    DEFAULT     V   ALTER TABLE ONLY token ALTER COLUMN id SET DEFAULT nextval('token_id_seq'::regclass);
 7   ALTER TABLE public.token ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    199    198            0           2604    17371    id    DEFAULT     V   ALTER TABLE ONLY topic ALTER COLUMN id SET DEFAULT nextval('topic_id_seq'::regclass);
 7   ALTER TABLE public.topic ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    201    200            2           2604    17372    id    DEFAULT     `   ALTER TABLE ONLY wechatuser ALTER COLUMN id SET DEFAULT nextval('wechatuser_id_seq'::regclass);
 <   ALTER TABLE public.wechatuser ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    203    202            �          0    17230    answer 
   TABLE DATA               k   COPY answer (id, postid, answerid, description, imgs, createtime, authorid, active, up, floor) FROM stdin;
    public       postgres    false    169   ��       #           0    0    answer_id_seq    SEQUENCE SET     5   SELECT pg_catalog.setval('answer_id_seq', 1, false);
            public       postgres    false    170            �          0    17240 
   auth_group 
   TABLE DATA               '   COPY auth_group (id, name) FROM stdin;
    public       postgres    false    171   ��       $           0    0    auth_group_id_seq    SEQUENCE SET     9   SELECT pg_catalog.setval('auth_group_id_seq', 1, false);
            public       postgres    false    172            �          0    17245    auth_group_permissions 
   TABLE DATA               F   COPY auth_group_permissions (id, group_id, permission_id) FROM stdin;
    public       postgres    false    173   ѹ       %           0    0    auth_group_permissions_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('auth_group_permissions_id_seq', 1, false);
            public       postgres    false    174            �          0    17250    auth_permission 
   TABLE DATA               G   COPY auth_permission (id, name, content_type_id, codename) FROM stdin;
    public       postgres    false    175   �       &           0    0    auth_permission_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('auth_permission_id_seq', 1, false);
            public       postgres    false    176            �          0    17255 	   auth_user 
   TABLE DATA               �   COPY auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
    public       postgres    false    177   �       �          0    17261    auth_user_groups 
   TABLE DATA               :   COPY auth_user_groups (id, user_id, group_id) FROM stdin;
    public       postgres    false    178   (�       '           0    0    auth_user_groups_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('auth_user_groups_id_seq', 1, false);
            public       postgres    false    179            (           0    0    auth_user_id_seq    SEQUENCE SET     8   SELECT pg_catalog.setval('auth_user_id_seq', 1, false);
            public       postgres    false    180            �          0    17268    auth_user_user_permissions 
   TABLE DATA               I   COPY auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
    public       postgres    false    181   E�       )           0    0 !   auth_user_user_permissions_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('auth_user_user_permissions_id_seq', 1, false);
            public       postgres    false    182            �          0    17273    block 
   TABLE DATA               7   COPY block (id, name, active, description) FROM stdin;
    public       postgres    false    183   b�       *           0    0    block_id_seq    SEQUENCE SET     3   SELECT pg_catalog.setval('block_id_seq', 2, true);
            public       postgres    false    184            �          0    17282    confirm 
   TABLE DATA               A   COPY confirm (id, openid, email, createtime, active) FROM stdin;
    public       postgres    false    185   ��       +           0    0    confirm_id_seq    SEQUENCE SET     5   SELECT pg_catalog.setval('confirm_id_seq', 2, true);
            public       postgres    false    186            �          0    17288    django_admin_log 
   TABLE DATA               �   COPY django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
    public       postgres    false    187   &�       ,           0    0    django_admin_log_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('django_admin_log_id_seq', 1, false);
            public       postgres    false    188            �          0    17297    django_content_type 
   TABLE DATA               <   COPY django_content_type (id, app_label, model) FROM stdin;
    public       postgres    false    189   C�       -           0    0    django_content_type_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('django_content_type_id_seq', 1, false);
            public       postgres    false    190            �          0    17302    django_migrations 
   TABLE DATA               <   COPY django_migrations (id, app, name, applied) FROM stdin;
    public       postgres    false    191   `�       .           0    0    django_migrations_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('django_migrations_id_seq', 1, false);
            public       postgres    false    192            �          0    17310    django_session 
   TABLE DATA               I   COPY django_session (session_key, session_data, expire_date) FROM stdin;
    public       postgres    false    193   }�       �          0    17316    event 
   TABLE DATA               6   COPY event (id, authorid, target, action) FROM stdin;
    public       postgres    false    194   C�       /           0    0    event_id_seq    SEQUENCE SET     4   SELECT pg_catalog.setval('event_id_seq', 12, true);
            public       postgres    false    195                       0    17321    post 
   TABLE DATA               �   COPY post (id, subject, description, authorid, createtime, edittime, blockid, topicid, hot, resnum, top, updatetime, up, hours) FROM stdin;
    public       postgres    false    196   ��       0           0    0    post_id_seq    SEQUENCE SET     3   SELECT pg_catalog.setval('post_id_seq', 28, true);
            public       postgres    false    197                      0    17333    token 
   TABLE DATA               2   COPY token (id, token, expires, name) FROM stdin;
    public       postgres    false    198   $�       1           0    0    token_id_seq    SEQUENCE SET     3   SELECT pg_catalog.setval('token_id_seq', 1, true);
            public       postgres    false    199                      0    17341    topic 
   TABLE DATA               3   COPY topic (id, name, blockid, active) FROM stdin;
    public       postgres    false    200   �       2           0    0    topic_id_seq    SEQUENCE SET     3   SELECT pg_catalog.setval('topic_id_seq', 3, true);
            public       postgres    false    201                      0    17347 
   wechatuser 
   TABLE DATA               �   COPY wechatuser (id, openid, nickname, headimg, email, nsnid, sex, jointime, logintime, active, userid, qrcode, mobile) FROM stdin;
    public       postgres    false    202   Y�       3           0    0    wechatuser_id_seq    SEQUENCE SET     8   SELECT pg_catalog.setval('wechatuser_id_seq', 7, true);
            public       postgres    false    203            4           2606    17374    answer_pkey 
   CONSTRAINT     I   ALTER TABLE ONLY answer
    ADD CONSTRAINT answer_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.answer DROP CONSTRAINT answer_pkey;
       public         postgres    false    169    169            7           2606    17376    auth_group_name_key 
   CONSTRAINT     R   ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);
 H   ALTER TABLE ONLY public.auth_group DROP CONSTRAINT auth_group_name_key;
       public         postgres    false    171    171            <           2606    17378 ;   auth_group_permissions_group_id_permission_id_0cd325b0_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);
 |   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq;
       public         postgres    false    173    173    173            ?           2606    17380    auth_group_permissions_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);
 \   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_pkey;
       public         postgres    false    173    173            9           2606    17382    auth_group_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.auth_group DROP CONSTRAINT auth_group_pkey;
       public         postgres    false    171    171            B           2606    17384 6   auth_permission_content_type_id_codename_01ab375a_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);
 p   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq;
       public         postgres    false    175    175    175            D           2606    17386    auth_permission_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_pkey;
       public         postgres    false    175    175            L           2606    17388    auth_user_groups_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_pkey;
       public         postgres    false    178    178            O           2606    17390 /   auth_user_groups_user_id_group_id_94350c0c_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);
 j   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq;
       public         postgres    false    178    178    178            F           2606    17392    auth_user_pkey 
   CONSTRAINT     O   ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.auth_user DROP CONSTRAINT auth_user_pkey;
       public         postgres    false    177    177            R           2606    17394    auth_user_user_permissions_pkey 
   CONSTRAINT     q   ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);
 d   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_pkey;
       public         postgres    false    181    181            U           2606    17396 >   auth_user_user_permissions_user_id_permission_id_14a6b632_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);
 �   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq;
       public         postgres    false    181    181    181            I           2606    17398    auth_user_username_key 
   CONSTRAINT     X   ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);
 J   ALTER TABLE ONLY public.auth_user DROP CONSTRAINT auth_user_username_key;
       public         postgres    false    177    177            W           2606    17400 
   block_pkey 
   CONSTRAINT     G   ALTER TABLE ONLY block
    ADD CONSTRAINT block_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.block DROP CONSTRAINT block_pkey;
       public         postgres    false    183    183            Y           2606    17402    confirm_pkey 
   CONSTRAINT     K   ALTER TABLE ONLY confirm
    ADD CONSTRAINT confirm_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.confirm DROP CONSTRAINT confirm_pkey;
       public         postgres    false    185    185            \           2606    17404    django_admin_log_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_pkey;
       public         postgres    false    187    187            _           2606    17406 1   django_content_type_app_label_model_76bd3d3b_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);
 o   ALTER TABLE ONLY public.django_content_type DROP CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq;
       public         postgres    false    189    189    189            a           2606    17408    django_content_type_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.django_content_type DROP CONSTRAINT django_content_type_pkey;
       public         postgres    false    189    189            c           2606    17410    django_migrations_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.django_migrations DROP CONSTRAINT django_migrations_pkey;
       public         postgres    false    191    191            f           2606    17412    django_session_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);
 L   ALTER TABLE ONLY public.django_session DROP CONSTRAINT django_session_pkey;
       public         postgres    false    193    193            i           2606    17414 
   event_pkey 
   CONSTRAINT     G   ALTER TABLE ONLY event
    ADD CONSTRAINT event_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.event DROP CONSTRAINT event_pkey;
       public         postgres    false    194    194            k           2606    17416 	   post_pkey 
   CONSTRAINT     E   ALTER TABLE ONLY post
    ADD CONSTRAINT post_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.post DROP CONSTRAINT post_pkey;
       public         postgres    false    196    196            m           2606    17418 
   token_pkey 
   CONSTRAINT     G   ALTER TABLE ONLY token
    ADD CONSTRAINT token_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.token DROP CONSTRAINT token_pkey;
       public         postgres    false    198    198            o           2606    17420 
   topic_pkey 
   CONSTRAINT     G   ALTER TABLE ONLY topic
    ADD CONSTRAINT topic_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.topic DROP CONSTRAINT topic_pkey;
       public         postgres    false    200    200            q           2606    17422    wechatuser_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY wechatuser
    ADD CONSTRAINT wechatuser_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.wechatuser DROP CONSTRAINT wechatuser_pkey;
       public         postgres    false    202    202            5           1259    17423    auth_group_name_a6ea08ec_like    INDEX     a   CREATE INDEX auth_group_name_a6ea08ec_like ON auth_group USING btree (name varchar_pattern_ops);
 1   DROP INDEX public.auth_group_name_a6ea08ec_like;
       public         postgres    false    171            :           1259    17424 (   auth_group_permissions_group_id_b120cbf9    INDEX     h   CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON auth_group_permissions USING btree (group_id);
 <   DROP INDEX public.auth_group_permissions_group_id_b120cbf9;
       public         postgres    false    173            =           1259    17425 -   auth_group_permissions_permission_id_84c5c92e    INDEX     r   CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON auth_group_permissions USING btree (permission_id);
 A   DROP INDEX public.auth_group_permissions_permission_id_84c5c92e;
       public         postgres    false    173            @           1259    17426 (   auth_permission_content_type_id_2f476e4b    INDEX     h   CREATE INDEX auth_permission_content_type_id_2f476e4b ON auth_permission USING btree (content_type_id);
 <   DROP INDEX public.auth_permission_content_type_id_2f476e4b;
       public         postgres    false    175            J           1259    17427 "   auth_user_groups_group_id_97559544    INDEX     \   CREATE INDEX auth_user_groups_group_id_97559544 ON auth_user_groups USING btree (group_id);
 6   DROP INDEX public.auth_user_groups_group_id_97559544;
       public         postgres    false    178            M           1259    17428 !   auth_user_groups_user_id_6a12ed8b    INDEX     Z   CREATE INDEX auth_user_groups_user_id_6a12ed8b ON auth_user_groups USING btree (user_id);
 5   DROP INDEX public.auth_user_groups_user_id_6a12ed8b;
       public         postgres    false    178            P           1259    17429 1   auth_user_user_permissions_permission_id_1fbb5f2c    INDEX     z   CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON auth_user_user_permissions USING btree (permission_id);
 E   DROP INDEX public.auth_user_user_permissions_permission_id_1fbb5f2c;
       public         postgres    false    181            S           1259    17430 +   auth_user_user_permissions_user_id_a95ead1b    INDEX     n   CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON auth_user_user_permissions USING btree (user_id);
 ?   DROP INDEX public.auth_user_user_permissions_user_id_a95ead1b;
       public         postgres    false    181            G           1259    17431     auth_user_username_6821ab7c_like    INDEX     g   CREATE INDEX auth_user_username_6821ab7c_like ON auth_user USING btree (username varchar_pattern_ops);
 4   DROP INDEX public.auth_user_username_6821ab7c_like;
       public         postgres    false    177            Z           1259    17432 )   django_admin_log_content_type_id_c4bce8eb    INDEX     j   CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON django_admin_log USING btree (content_type_id);
 =   DROP INDEX public.django_admin_log_content_type_id_c4bce8eb;
       public         postgres    false    187            ]           1259    17433 !   django_admin_log_user_id_c564eba6    INDEX     Z   CREATE INDEX django_admin_log_user_id_c564eba6 ON django_admin_log USING btree (user_id);
 5   DROP INDEX public.django_admin_log_user_id_c564eba6;
       public         postgres    false    187            d           1259    17434 #   django_session_expire_date_a5c62663    INDEX     ^   CREATE INDEX django_session_expire_date_a5c62663 ON django_session USING btree (expire_date);
 7   DROP INDEX public.django_session_expire_date_a5c62663;
       public         postgres    false    193            g           1259    17435 (   django_session_session_key_c0390e0f_like    INDEX     w   CREATE INDEX django_session_session_key_c0390e0f_like ON django_session USING btree (session_key varchar_pattern_ops);
 <   DROP INDEX public.django_session_session_key_c0390e0f_like;
       public         postgres    false    193            r           2606    17436 8   auth_group_permissio_permission_id_84c5c92e_fk_auth_perm    FK CONSTRAINT     �   ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;
 y   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm;
       public       postgres    false    2884    175    173            s           2606    17441 9   auth_group_permissions_group_id_b120cbf9_fk_auth_group_id    FK CONSTRAINT     �   ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;
 z   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id;
       public       postgres    false    171    2873    173            t           2606    17446 5   auth_permission_content_type_id_2f476e4b_fk_django_co    FK CONSTRAINT     �   ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;
 o   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co;
       public       postgres    false    2913    175    189            u           2606    17451 3   auth_user_groups_group_id_97559544_fk_auth_group_id    FK CONSTRAINT     �   ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;
 n   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id;
       public       postgres    false    171    2873    178            v           2606    17456 1   auth_user_groups_user_id_6a12ed8b_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 l   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id;
       public       postgres    false    2886    178    177            w           2606    17461 8   auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm    FK CONSTRAINT     �   ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;
 }   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm;
       public       postgres    false    181    2884    175            x           2606    17466 ;   auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id;
       public       postgres    false    2886    177    181            y           2606    17471 6   django_admin_log_content_type_id_c4bce8eb_fk_django_co    FK CONSTRAINT     �   ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;
 q   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co;
       public       postgres    false    187    189    2913            z           2606    17476 1   django_admin_log_user_id_c564eba6_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 l   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id;
       public       postgres    false    2886    187    177            �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �   N   x�3�|Ѿ�Y������>�Z�i�闟���&�b݆�{������ɮ�\F�O�4<�������n�&d.W� ��3�      �   V   x�3��Ϭ�2+�ȏ��/�HMI�r�5�,6)
	��H��*�ӫ�H�Kw����L�-NJ���K���445366�06��4����� �       �      x������ � �      �      x������ � �      �      x������ � �      �   �  x��չn�H�X���"j_8��Z��l��!�{�X\��כ݁�9�ܺ����"��aajRO�l�9)�	��|�aP}_.:��>�����Wcޮg�o9x{��8o�~�^��A����_[�Z�9�h||e�ܦ�%���?�Y�)��}���x������?���Td_>|x@ �'��0�bKJ�q���G�j�U^�-
E
X�#e!�=�p����|�������^`��W<����K���ۋ��/��}'�lο{�i9_��!.@.&� ��G�d�,�k�
%LA�	m����h]���\�B����7��47e?¦�m���Ovel�C��0:��\�A������H�z똰a*�OS6%+5Gs1t1r$��ț ��,�Ǳ���|�����.-Vhy���D8P`���]deu�A�xl�
�ض��ugly����;�S��}m�Z�/��sS4m� �ذ�*kH��'�{���K�C��Xܽ�^Ǻh���]]�b�=�f���Ň{�K��އ�oҘ�(�G��8W8�KaX��2i��s�K�/��Ūm�4�ƩO��փf �qY�7��ý�%ءI�o�(Ҭf�FS��d�|L1��bKm$���c��K]$���浤�R��,Ԫ�E5�H�=K�6v����8X
��˺<7Lq����D�76d,Im�_5�.��R��z��<>>��K��      �   C   x��� A������^��:v0���<:�HD�a����D�M܂��.��K�it���n�6�J=          ~  x�]�OKA�ϳ�bY�Ό��!:w�(Ⱥ;ڄ���n�B12A�t�KA���_�ݵS_�qC\c�����2�c���{����Y�V�	���"yݶ�M*� �bMJ�]���?���}����g>��K��DV�HBb��$����Һ3�h�H�x�;�kqru��6�F˝̜���I�
%U��I�KFB
�Lg���|Q7�HV"QYAPNsD��@�!V�X5��:1UMӱb�St�iY�D���r�h�z�oZ�&;?B��lϔ6W���v����B"���7�^߹���pv|��De�a18D��!�B�:4�L���t���������6�Pc-��Kٺ�R߅ؾ����YǛu����A�}���x��R!A~≹�         �   x���n�0  �g����G� ��	f���v�е�e|�΁�Y� x���;�}����)k-2p���/��^~o�6s_Q�'�M��]�X�:�,��w詪V��/��z�S�%��}�81�M���w�9�)Vن��% �h�-s�1E�xTQ�q�q޳���D�R��u��|���:a�3�5=���P,1I�_X����A���ϋ�����?�%M�         ;   x�3�|6��i���6<�;�ӐӐˈ������?�h{�k5XȘ�����Ȋ���� ��j         �   x��On�@���]�q
4iZJR[IkRcb`�8�� �D7�D�M�c�Qq��{/�(�л7�^n�M�򷘹ӑ��h��u�ο_�?�O����-!%�
���	�iBALf�����]zN�� ����2k�i��ј�^�;.Y���6Γg7���!d���4�!sGMċ3�C�9���&��V\]���,����s�q�A���놆���#c~`�X2�LˊuC�-��)��I-��:Q�XQ���\�     