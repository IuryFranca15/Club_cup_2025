
SET SQL_SAFE_UPDATES = 0;
DROP DATABASE IF EXISTS cup_club2025;
CREATE DATABASE cup_club2025;
USE cup_club2025;

-- Create Confederation table
CREATE TABLE confederation (
    conf_id INT PRIMARY KEY AUTO_INCREMENT,
    conf_name VARCHAR(100),
    conf_abr VARCHAR(10)
);

INSERT INTO confederation (conf_name, conf_abr) VALUES 
    ('South American Football Confederation', 'CONMEBOL'),
    ('Union of European Football Associations', 'UEFA'),
    ('Confederation of African Football', 'CAF'),
    ('Confederation of North, Central America and Caribbean Association Football', 'CONCACAF'),
    ('Asian Football Confederation', 'AFC'),
    ('Oceania Football Confederation', 'OFC');


-- Create Country table (make sure to reference the correct table and column)
CREATE TABLE country (
    id INT PRIMARY KEY AUTO_INCREMENT,
    country_name VARCHAR(100) NOT NULL,
    continent VARCHAR(50) NOT NULL,
    country_fifa_ranking INT,
    confederation_id INT,
    FOREIGN KEY (confederation_id) REFERENCES confederation(conf_id) ON DELETE SET NULL
);

INSERT INTO country (country_name, continent, country_fifa_ranking, confederation_id) VALUES
    ('Brazil', 'South America', 5, 1),       
    ('Portugal', 'Europe', 6, 2),           
    ('Egypt', 'Africa', 36, 3),             
    ('USA', 'North America', 13, 4),        
    ('France', 'Europe', 2, 2),             
    ('Spain', 'Europe', 8, 2),              
    ('Germany', 'Europe', 16, 2),          
    ('New Zealand', 'Oceania', 103, 5),     
    ('Argentina', 'South America', 1, 1),   
    ('Tunisia', 'Africa', 28, 3),           
    ('England', 'Europe', 4, 2),           
    ('Mexico', 'North America', 15, 4),     
    ('Japan', 'Asia', 17, 6),              
    ('Italy', 'Europe', 9, 2),              
    ('South Korea', 'Asia', 22, 6),         
    ('South Africa', 'Africa', 66, 3),     
    ('Morocco', 'Africa', 12, 3),          
    ('UAE', 'Asia', 67, 6),                 
    ('Saudi Arabia', 'Asia', 56, 6),       
    ('Austria', 'Europe', 25, 2);

CREATE TABLE clubs (
    club_id INT PRIMARY KEY AUTO_INCREMENT,
    club_name VARCHAR(50) UNIQUE NOT NULL,
    id_club_country INT NOT NULL, 
    cup_club_titles INT DEFAULT 0,
    club_fifa_rank INT DEFAULT NULL,
    FOREIGN KEY (id_club_country) REFERENCES country(id) ON DELETE CASCADE
);

INSERT INTO clubs (club_name, id_club_country, cup_club_titles, club_fifa_rank)
VALUES
    ('Palmeiras', 1, 0, 21),  
    ('Porto', 2, 0, 34),      
    ('Al-Ahly', 3, 0, 14),    
    ('Inter Miami', 4, 0, 383),  
    ('Paris Saint-Germain', 5, 0, 11),  
    ('Atlético de Madrid', 6, 0, 22),  
    ('Botafogo', 1, 0, 16),  
    ('Seattle Sounders', 4, 0, 460),  
    ('Bayern Munich', 7, 4, 8),  
    ('Auckland City', 8, 0, 392),  
    ('Boca Juniors', 9, 3, 44),  
    ('Benfica', 2, 0, 28),  
    ('Flamengo', 1, 1, 16),  
    ('Espérance de Tunis', 10, 0, 155),  
    ('Chelsea', 11, 1, 98),  
    ('León', 12, 0, 236),  
    ('River Plate', 9, 0, 27),  
    ('Urawa Red Diamonds', 13, 0, 438),  
    ('Monterrey', 12, 0, 106),  
    ('Inter Milan', 14, 3, 9),  
    ('Fluminense', 1, 0, 19),  
    ('Borussia Dortmund', 7, 0, 7),  
    ('Ulsan Hyundai', 15, 0, 79),  
    ('Mamelodi Sundowns', 16, 0, 185),  
    ('Manchester City', 11, 1, 2),  
    ('Wydad Casablanca', 17, 0, 267),  
    ('Al Ain', 18, 0, 127),  
    ('Juventus', 14, 2, 45),  
    ('Real Madrid', 6, 9, 1),  
    ('Al-Hilal', 19, 0, 45),  
    ('Pachuca', 12, 0, 127),  
    ('RB Salzburg', 20, 0, 123);

-- corrigindo a tabela clubes

update clubs
set years_won = 0
where cup_club_titles = 0;

CREATE TABLE group_a (
    group_id INT DEFAULT 1,
    club_id INT,
    FOREIGN KEY (club_id) REFERENCES clubs(club_id)
);

CREATE TABLE group_b (
    group_id INT DEFAULT 2,
    club_id INT,
    FOREIGN KEY (club_id) REFERENCES clubs(club_id)
);

CREATE TABLE group_c (
    group_id INT DEFAULT 3,
    club_id INT,
    FOREIGN KEY (club_id) REFERENCES clubs(club_id)
);

CREATE TABLE group_d (
    group_id INT DEFAULT 4,
    club_id INT,
    FOREIGN KEY (club_id) REFERENCES clubs(club_id)
);

CREATE TABLE group_e (
    group_id INT DEFAULT 5,
    club_id INT,
    FOREIGN KEY (club_id) REFERENCES clubs(club_id)
);

CREATE TABLE group_f (
    group_id INT DEFAULT 6,
    club_id INT,
    FOREIGN KEY (club_id) REFERENCES clubs(club_id)
);


CREATE TABLE group_g (
    group_id INT DEFAULT 7,
    club_id INT,
    FOREIGN KEY (club_id) REFERENCES clubs(club_id)
);


CREATE TABLE group_h (
    group_id INT DEFAULT 8,
    club_id INT,
    FOREIGN KEY (club_id) REFERENCES clubs(club_id)
);

INSERT INTO group_a (club_id)
SELECT club_id
FROM clubs
WHERE club_id IN (1, 2, 3, 4);

INSERT INTO group_b (club_id)
SELECT club_id
FROM clubs
WHERE club_id IN (5, 6, 7, 8);

INSERT INTO group_c (club_id)
SELECT club_id
FROM clubs
WHERE club_id IN (9, 10, 11, 12);

INSERT INTO group_d (club_id)
SELECT club_id
FROM clubs
WHERE club_id IN (13, 14, 15, 16);

INSERT INTO group_e (club_id)
SELECT club_id
FROM clubs
WHERE club_id IN (17, 18, 19, 20);


INSERT INTO group_f (club_id)
SELECT club_id
FROM clubs
WHERE club_id IN (21, 22, 23, 24);


INSERT INTO group_g (club_id)
SELECT club_id
FROM clubs
WHERE club_id IN (25, 26, 27, 28);

INSERT INTO group_h (club_id)
SELECT club_id
FROM clubs
WHERE club_id IN (29, 30, 31, 32);

-- consultando a tabela grupo a por titulos
SELECT club_name, cup_club_titles FROM clubs
INNER JOIN group_a ON clubs.club_id = group_a.club_id
WHERE cup_club_titles > 0
ORDER BY cup_club_titles DESC;

-- consultando a tabela grupo b por ranking
SELECT club_name, club_fifa_rank FROM clubs
INNER JOIN group_b ON clubs.club_id = group_b.club_id
GROUP BY club_fifa_rank
ORDER BY club_fifa_rank ASC;


ALTER TABLE clubs
ADD COLUMN years_won VARCHAR(300) AFTER cup_club_titles;

UPDATE clubs SET years_won = '1960, 1998, 2002, 2014, 2016, 2017, 2018, 2022, 2024' WHERE club_name = 'Real Madrid';
UPDATE clubs SET years_won = '1969, 1989, 1990, 2007' WHERE club_name = 'Milan';
UPDATE clubs SET years_won = '1976, 2001, 2013, 2020' WHERE club_name = 'Bayern Munich';
UPDATE clubs SET years_won = '1961, 1966, 1982' WHERE club_name = 'Peñarol';
UPDATE clubs SET years_won = '1977, 2000, 2003' WHERE club_name = 'Boca Juniors';
UPDATE clubs SET years_won = '2009, 2011, 2015' WHERE club_name = 'Barcelona';
UPDATE clubs SET years_won = '1971, 1980, 1988' WHERE club_name = 'Nacional';
UPDATE clubs SET years_won = '1992, 1993, 2005' WHERE club_name = 'São Paulo';
UPDATE clubs SET years_won = '1964, 1965, 2010' WHERE club_name = 'Internazionale';
UPDATE clubs SET years_won = '1973, 1984' WHERE club_name = 'Independiente';
UPDATE clubs SET years_won = '1985, 1996' WHERE club_name = 'Juventus';
UPDATE clubs SET years_won = '1999, 2008' WHERE club_name = 'Manchester United';
UPDATE clubs SET years_won = '1962, 1963' WHERE club_name = 'Santos';
UPDATE clubs SET years_won = '1972, 1995' WHERE club_name = 'Ajax';
UPDATE clubs SET years_won = '1987, 2004' WHERE club_name = 'Porto';
UPDATE clubs SET years_won = '2000, 2012' WHERE club_name = 'Corinthians';
UPDATE clubs SET years_won = '1968' WHERE club_name = 'Estudiantes';
UPDATE clubs SET years_won = '2019' WHERE club_name = 'Liverpool';
UPDATE clubs SET years_won = '1986' WHERE club_name = 'River Plate';
UPDATE clubs SET years_won = '1979' WHERE club_name = 'Olimpia';
UPDATE clubs SET years_won = '1951' WHERE club_name = 'Palmeiras';
UPDATE clubs SET years_won = '1983' WHERE club_name = 'Grêmio';
UPDATE clubs SET years_won = '1981' WHERE club_name = 'Flamengo';
UPDATE clubs SET years_won = '2021' WHERE club_name = 'Chelsea';
UPDATE clubs SET years_won = '2006' WHERE club_name = 'Internacional';
UPDATE clubs SET years_won = '1967' WHERE club_name = 'Racing';
UPDATE clubs SET years_won = '1970' WHERE club_name = 'Feyenoord';
UPDATE clubs SET years_won = '1974' WHERE club_name = 'Atlético de Madrid';
UPDATE clubs SET years_won = '1991' WHERE club_name = 'Estrela Vermelha';
UPDATE clubs SET years_won = '1994' WHERE club_name = 'Vélez Sársfield';
UPDATE clubs SET years_won = '1997' WHERE club_name = 'Borussia Dortmund';
UPDATE clubs SET years_won = '2023' WHERE club_name = 'Manchester City';

-- colocando 0 no lugar de is null nos anos dos titulos
UPDATE clubs SET years_won = 0 WHERE years_won IS NULL;

-- selecionando os países e rankings da fifa filtrando da uefa
select country_name, country_fifa_ranking from country
inner join confederation on confederation_id = conf_id
where conf_abr = 'UEFA'
order by country_fifa_ranking asc;

-- selecionando a quantidade de titulos por país
select country_name, SUM(cup_club_titles) as sum from country
inner join clubs on country.id = clubs.id_club_country
group by country_name 
order by sum desc;


select * from clubs;
