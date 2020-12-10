SELECT * FROM netflix;

SELECT * FROM blockbusters;

SELECT * FROM netflix
WHERE type = 'TV Show';

DELETE FROM netflix WHERE type = 'TV Show';

ALTER TABLE netflix
DROP COLUMN type;

ALTER TABLE blockbusters
DROP COLUMN release_year;

CREATE VIEW netflixBB AS
SELECT *
FROM netflix
FULL OUTER JOIN blockbusters
ON netflix.title = blockbusters.film_title;

SELECT * FROM netflixbb;

SELECT *
INTO netflixBlock
FROM netflixbb;

DELETE FROM netflixBlock WHERE rank_in_year IS NULL;

DELETE FROM netflixBlock WHERE title IS NULL;

SELECT * FROM netflixBlock;

DELETE FROM oscars WHERE winner = FALSE;

DELETE FROM oscars WHERE year_film < 1977;

CREATE VIEW Oscar_Wins AS
SELECT film, COUNT(winner) AS "Oscar Wins"
FROM oscars
GROUP BY film;

SELECT * 
INTO oscarWins
FROM Oscar_Wins;

DELETE FROM oscarWins WHERE film IS NULL;

CREATE VIEW final_table AS
SELECT *
FROM oscarWins
FULL OUTER JOIN netflixblock
ON netflixblock.title = oscarWins.film;

SELECT * 
INTO finalTable
FROM final_table;

DELETE FROM finalTable WHERE show_id IS NULL;

DELETE FROM finalTable WHERE "Oscar Wins" IS NULL;

ALTER TABLE finalTable
DROP COLUMN title;

ALTER TABLE finalTable
DROP COLUMN film_title;

ALTER TABLE finalTable
DROP COLUMN length_in_min;

ALTER TABLE finalTable
DROP COLUMN genre_1;

ALTER TABLE finalTable
DROP COLUMN genre_2;

ALTER TABLE finalTable
DROP COLUMN genre_3;

ALTER TABLE finalTable
DROP COLUMN mpaa_rating;

ALTER TABLE finalTable
ADD PRIMARY KEY (show_ID);

SELECT * FROM finalTable;

SELECT * FROM oscars;