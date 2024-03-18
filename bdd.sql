-- SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
-- START TRANSACTION;
-- SET time_zone = "+00:00";

START TRANSACTION;

CREATE TABLE utilisateur (
    id SERIAL PRIMARY KEY,
    nom varchar(100) NOT NULL,
    prenom varchar(50) NOT NULL,
    email varchar(60) NOT NULL UNIQUE,
    user_password TEXT NOT NULL
);

INSERT INTO utilisateur (nom, prenom, email, user_password) VALUES
    ('Durant', 'Pierre', 'p.durant@gmail.com', '85pass'),
    ('Marquez', 'Gabi', 'g.m@youpi.com', 'moDePass665'),
    ('Ramirez', 'Carla', 'c.ramirez@gmail.com', 'wordPasS7'),
    ('Jackson', 'Mike', 'mj@yoyo.com', 'noIdea1&1')
    RETURNING * ;

    COMMIT;