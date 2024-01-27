CREATE DATABASE farming_game;
\c farming_game


CREATE SEQUENCE user_seq
    START WITH 1;
CREATE TABLE "user" (
    id VARCHAR(8) DEFAULT ('USER'||nextval('user_seq')) PRIMARY KEY,
    pseudo VARCHAR(50) NOT NULL,
    password VARCHAR(50) NOT NULL,
    email VARCHAR(50) NOT NULL,
    argent DOUBLE PRECISION,
    role INTEGER NOT NULL -- 0 player, 1 admin
);
INSERT INTO "user" VALUES (DEFAULT, 'test_user', '1234', 'test@gmail.com', 100, 0);
INSERT INTO "user" VALUES (DEFAULT, 'admin', 'admin', 'admin@gmail.com', 0, 1);

CREATE SEQUENCE terrain_seq
    START WITH 1;
CREATE TABLE terrain (
    id VARCHAR(5) DEFAULT ('TER'||nextval('terrain_seq')) PRIMARY KEY,
    id_user VARCHAR(8) REFERENCES "user"(id) NOT NULL,
    ax INTEGER NOT NULL,
    ay INTEGER NOT NULL,
    bx INTEGER NOT NULL,
    by INTEGER NOT NULL,
    date_creation TIMESTAMP NOT NULL
);

CREATE SEQUENCE terrain_vaid_seq
    START WITH 1;
CREATE TABLE terrain_validation (
    id VARCHAR(8) DEFAULT ('TERVAL'||nextval('terrain_vaid_seq')) PRIMARY KEY,
    id_terrain VARCHAR(5) REFERENCES terrain(id) NOT NULL,
    date_validation TIMESTAMP NOT NULL
);

CREATE SEQUENCE cat_culture_seq
    START WITH 1;
CREATE TABLE categorie_culture (
    id VARCHAR(8) DEFAULT ('CATCUL'||nextval('cat_culture_seq')) PRIMARY KEY,
    designation VARCHAR(50) NOT NULL,
    prix DOUBLE PRECISION NOT NULL
);

CREATE SEQUENCE culture_seq
    START WITH 1;
CREATE TABLE culture (
    id VARCHAR(6) DEFAULT ('CUL'||nextval('culture_seq')) PRIMARY KEY,
    id_categorie VARCHAR(8) REFERENCES categorie_culture(id),
    designation VARCHAR(50) NOT NULL,
    prix DOUBLE PRECISION NOT NULL
);

CREATE SEQUENCE parcelle_seq
    START WITH 1;
CREATE TABLE parcelle (
    id VARCHAR(9) DEFAULT ('PARC'||nextval('parcelle_seq')) PRIMARY KEY,
    id_terrain VARCHAR(5) REFERENCES terrain(id) NOT NULL,
    id_categorie VARCHAR(8) REFERENCES categorie_culture(id) NOT NULL,
    ax INTEGER NOT NULL,
    ay INTEGER NOT NULL,
    bx INTEGER NOT NULL,
    by INTEGER NOT NULL
);

-- ANY AM MONGO!!!!!!!!!
-- CREATE SEQUENCE histo_parcelle_seq
--     START WITH 1;
-- CREATE TABLE historique_parcelle (
--     id VARCHAR(16) DEFAULT ('HISTOPARC'||nextval('histo_parcelle_seq')) PRIMARY KEY,
--     id_parcelle VARCHAR(9) REFERENCES parcelle(id) NOT NULL,
--     date_enregistrement TIMESTAMP NOT NULL,
--     etat INTEGER -- -1 supprimé, 0 créé
-- );

CREATE SEQUENCE plantation_seq
    START WITH 1;
CREATE TABLE plantation (
    id VARCHAR(10) DEFAULT ('PLANT'||nextval('plantation_seq')) PRIMARY KEY,
    id_parcelle VARCHAR(9) REFERENCES parcelle(id) NOT NULL,
    id_culture VARCHAR(6) REFERENCES culture(id) NOT NULL,
    x INTEGER NOT NULL,
    y INTEGER NOT NULL
);

-- ANY AM MONGO!!!!!!!!!
-- CREATE SEQUENCE histo_plantation_seq
--     START WITH 1;
-- CREATE TABLE historique_plantation (
--     id VARCHAR(17) DEFAULT ('HISTOPLANT'||nextval('histo_plantation_seq')) PRIMARY KEY,
--     id_plantation VARCHAR(10) REFERENCES plantation(id) NOT NULL,
--     date_enregistrement TIMESTAMP NOT NULL,
--     etat INTEGER -- -1 supprimé, 0 créé, 1 arrosé 1x, 2 arrosé 2x, 3 arrosé 3x, 4 recolté
-- );
