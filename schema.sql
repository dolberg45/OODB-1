/*
 * Copyright (c) 2020. Saidmurodov Sirojiddin
 * siroj.serj15@outlook.com
 * All rights reserved.
 */
-- Schema built according model in MoviePortal package


DROP TABLE IF EXISTS personality;
CREATE TABLE personality
(
    id          SERIAL,
    "name"      char(100),
    dateOfBirth date,
    bio         text,
    PRIMARY KEY (id)
);

DROP TABLE IF EXISTS actor;
CREATE TABLE actor
(
    id        SERIAL,
    role      char(255),
    person_id BIGINT,
    movie_id  BIGINT,
    PRIMARY KEY (id),
    FOREIGN KEY (person_id) REFERENCES personality (id)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    FOREIGN KEY (movie_id) REFERENCES movie (id)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

DROP TABLE IF EXISTS artist;
CREATE TABLE artist
(
    id         SERIAL,
    occupation char(255),
    person_id  BIGINT,
    movie_id   BIGINT,
    PRIMARY KEY (id),
    FOREIGN KEY (person_id) REFERENCES personality (id)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    FOREIGN KEY (movie_id) REFERENCES movie (id)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

DROP TABLE IF EXISTS movie;
CREATE TABLE movie
(
    id          SERIAL,
    name        char(255),
    releaseDate date,
    PRIMARY KEY (id)
);

DROP TABLE IF EXISTS usr;
CREATE TABLE usr
(
    id    SERIAL,
    name  char(255),
    eMail char(25),
    PRIMARY KEY (id)
);

DROP TABLE IF EXISTS rate;
CREATE TABLE rate
(
    id           SERIAL,
    value        integer,
    movie_id     bigint,
    dateOfChange date,
    usr_id       bigint,
    PRIMARY KEY (id),
    FOREIGN KEY (movie_id) REFERENCES movie (id)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    FOREIGN KEY (usr_id) REFERENCES usr (id)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);