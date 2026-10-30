/* ==============================================================================
   SQL MADE SIMPLE - MASTER DATABASE SETUP
   Engine: Microsoft SQL Server (T-SQL)
   Description: Creates the 'SQLMadeSimple' database with two 8-row tables 
                (Movies and Reviews) designed for Beginner to Advanced SQL.
============================================================================== */

USE master;
GO

-- Drop the database if it already exists so you can reset it anytime
IF EXISTS (SELECT name FROM sys.databases WHERE name = N'SQLMadeSimple')
BEGIN
    ALTER DATABASE SQLMadeSimple SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE SQLMadeSimple;
END
GO

-- Create and switch to the database
CREATE DATABASE SQLMadeSimple;
GO

USE SQLMadeSimple;
GO

/* ==============================================================================
   1. CREATE TABLES
============================================================================== */

CREATE TABLE Movies (
    movie_id INT PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    genre VARCHAR(50) NOT NULL,
    release_year INT NOT NULL,
    duration_mins INT,
    box_office_millions DECIMAL(6, 2) -- NULL allowed (e.g., streaming-only or unreleased data)
);

CREATE TABLE Reviews (
    review_id INT PRIMARY KEY,
    movie_id INT NOT NULL,
    reviewer_name VARCHAR(50) NOT NULL,
    rating DECIMAL(3, 1) NOT NULL,
    review_date DATE NOT NULL,
    review_text VARCHAR(255),         -- NULL allowed (rating-only reviews)
    CONSTRAINT FK_Reviews_Movies FOREIGN KEY (movie_id) REFERENCES Movies(movie_id)
);
GO

/* ==============================================================================
   2. INSERT SAMPLE DATA (8 ROWS PER TABLE)
============================================================================== */

INSERT INTO Movies (movie_id, title, genre, release_year, duration_mins, box_office_millions) VALUES
(1, 'Moonrise',          'Sci-Fi',   2020, 118, 45.50),
(2, 'Deep Space',        'Sci-Fi',   2022, 142, 180.00),
(3, 'The Last Signal',   'Sci-Fi',   2023, 129, 95.20),
(4, 'Silent Echo',       'Thriller', 2021, 105, 32.10),
(5, 'Glass Horizon',     'Thriller', 2023, 114, 64.80),
(6, 'Golden Hour',       'Drama',    2019, 136, 28.40),
(7, 'Paper Boats',       'Drama',    2022, 98,  NULL),   -- Streaming release (No box office)
(8, 'Midnight Runaway',  'Action',   2024, 125, NULL);   -- Brand new / No reviews yet

INSERT INTO Reviews (review_id, movie_id, reviewer_name, rating, review_date, review_text) VALUES
(1, 1, 'Arjun',  7.5, '2020-06-15', 'Great atmosphere, slightly slow pacing.'),
(2, 1, 'Meera',  8.0, '2020-07-02', 'Loved the soundtrack and visuals.'),
(3, 2, 'Rohan',  9.0, '2022-11-10', 'A masterpiece of modern sci-fi.'),
(4, 2, 'Kavya',  8.5, '2022-11-18', 'Incredible world-building.'),
(5, 3, 'Arjun',  6.5, '2023-03-05', NULL),               -- Rating without written review
(6, 4, 'Dev',    7.8, '2021-09-22', 'Kept me guessing until the final scene.'),
(7, 5, 'Meera',  8.2, '2023-08-14', 'Sharp writing and tense direction.'),
(8, 6, 'Kavya',  7.0, '2019-12-01', 'Heartfelt performances, a bit long.');
-- Note: Movies 7 ('Paper Boats') and 8 ('Midnight Runaway') have 0 reviews intentionally!
GO

-- Quick verification check:
SELECT * FROM Movies;
SELECT * FROM Reviews;
