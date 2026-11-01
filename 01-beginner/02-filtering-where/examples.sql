/* ==============================================================================
   LESSON 02: Filtering Data with WHERE
   Database: SQLMadeSimple
   Concepts: Comparison Operators, AND/OR/NOT, BETWEEN, IN, LIKE
============================================================================== */

USE SQLMadeSimple;
GO


/* ==============================================================================
   A. COMPARISON OPERATORS (=, <>, >, <, >=, <=)
   Remember: Text and dates must be inside single quotes (' '). 
   Numbers do not use quotes.
============================================================================== */

-- 1. Equal to (=): Find all Sci-Fi movies
SELECT title, genre, release_year
FROM Movies
WHERE genre = 'Sci-Fi';

-- 2. Not equal to (<>): Find all movies that are NOT Sci-Fi
SELECT title, genre
FROM Movies
WHERE genre <> 'Sci-Fi';

-- 3. Greater than (>): Find movies longer than 120 minutes
SELECT title, duration_mins
FROM Movies
WHERE duration_mins > 120;

-- 4. Greater than or equal to (>=): Find reviews with a rating of 8.0 or higher
SELECT movie_id, reviewer_name, rating
FROM Reviews
WHERE rating >= 8.0;


/* ==============================================================================
   B. LOGICAL OPERATORS (AND, OR, NOT)
   Combine multiple conditions in a single WHERE clause.
============================================================================== */

-- 1. AND (Both conditions must be true):
-- Find Sci-Fi movies released after 2021
SELECT title, genre, release_year
FROM Movies
WHERE genre = 'Sci-Fi' 
  AND release_year > 2021;

-- 2. OR (At least one condition must be true):
-- Find movies that are either Drama OR Action
SELECT title, genre
FROM Movies
WHERE genre = 'Drama' 
   OR genre = 'Action';

-- 3. Combining AND + OR with Parentheses ():
-- Find movies released in 2023 that are either Sci-Fi OR Thriller
SELECT title, genre, release_year
FROM Movies
WHERE release_year = 2023 
  AND (genre = 'Sci-Fi' OR genre = 'Thriller');


/* ==============================================================================
   C. RANGE FILTERING (BETWEEN)
   Checks if a value falls within an inclusive range (includes start and end values).
============================================================================== */

-- Find movies released between 2020 and 2022 (includes 2020, 2021, and 2022)
SELECT title, release_year
FROM Movies
WHERE release_year BETWEEN 2020 AND 2022;

-- Find reviews with ratings between 7.5 and 8.5
SELECT reviewer_name, rating, review_date
FROM Reviews
WHERE rating BETWEEN 7.5 AND 8.5;


/* ==============================================================================
   D. LIST FILTERING (IN / NOT IN)
   A clean shortcut for writing multiple OR conditions on the same column.
============================================================================== */

-- Find reviews written by Arjun, Meera, or Dev
SELECT reviewer_name, movie_id, rating
FROM Reviews
WHERE reviewer_name IN ('Arjun', 'Meera', 'Dev');

-- Find movies that are NOT in the Drama or Action genres
SELECT title, genre
FROM Movies
WHERE genre NOT IN ('Drama', 'Action');


/* ==============================================================================
   E. PATTERN MATCHING (LIKE)
   % matches any number of characters (including zero).
   _ matches exactly one single character.
============================================================================== */

-- 1. Starts with 'The':
SELECT title
FROM Movies
WHERE title LIKE 'The%';

-- 2. Ends with 'Space':
SELECT title
FROM Movies
WHERE title LIKE '%Space';

-- 3. Contains the word 'Horizon' anywhere in the title:
SELECT title
FROM Movies
WHERE title LIKE '%Horizon%';

-- 4. Reviewer name has 'a' as the second letter (e.g., Kavya):
SELECT DISTINCT reviewer_name
FROM Reviews
WHERE reviewer_name LIKE '_a%';
