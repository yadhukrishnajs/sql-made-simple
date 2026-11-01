/* ==============================================================================
   LESSON 03: Sorting and Limiting Results
   Database: SQLMadeSimple
   Concepts: ORDER BY (ASC/DESC), Multi-Column Sort, TOP, WITH TIES, OFFSET-FETCH
============================================================================== */

USE SQLMadeSimple;
GO


/* ==============================================================================
   A. BASIC SORTING (ORDER BY ASC & DESC)
   ASC = Ascending (Smallest to Largest, A to Z) -> Default if omitted.
   DESC = Descending (Largest to Smallest, Z to A).
============================================================================== */

-- 1. Sort movies from oldest to newest (ASC is default)
SELECT title, release_year
FROM Movies
ORDER BY release_year ASC;

-- 2. Sort movies from longest duration to shortest duration (DESC)
SELECT title, duration_mins
FROM Movies
ORDER BY duration_mins DESC;

-- 3. Sort movies alphabetically by title (A to Z)
SELECT title, genre
FROM Movies
ORDER BY title ASC;

-- 4. Notice how NULL values behave when sorting:
-- In ASC, NULLs appear at the very TOP (treated as the smallest possible value).
SELECT title, box_office_millions
FROM Movies
ORDER BY box_office_millions ASC;

-- In DESC, NULLs appear at the very BOTTOM.
SELECT title, box_office_millions
FROM Movies
ORDER BY box_office_millions DESC;


/* ==============================================================================
   B. SORTING BY MULTIPLE COLUMNS & ALIASES
   SQL Server sorts by the first column, and uses the second column to break ties.
============================================================================== */

-- 1. Sort by genre (A-Z), then inside each genre sort by newest release_year first
SELECT title, genre, release_year
FROM Movies
ORDER BY genre ASC, release_year DESC;

-- 2. Sorting using a Column Alias:
-- Because ORDER BY runs AFTER SELECT, you can use aliases created in SELECT!
SELECT 
    movie_id,
    reviewer_name,
    rating * 10 AS ScoreOutOf100
FROM Reviews
ORDER BY ScoreOutOf100 DESC;


/* ==============================================================================
   C. LIMITING ROWS (TOP)
   Restricts the output to only the first N rows. Always pair TOP with ORDER BY!
============================================================================== */

-- 1. Find the top 3 highest-grossing movies at the box office
SELECT TOP 3 
    title, 
    box_office_millions
FROM Movies
ORDER BY box_office_millions DESC;

-- 2. Find the 2 shortest movies
SELECT TOP 2 
    title, 
    duration_mins
FROM Movies
ORDER BY duration_mins ASC;


/* ==============================================================================
   D. HANDLING TIES AT THE CUTOFF (TOP ... WITH TIES)
   Includes extra rows if they tie with the value of the last row in your TOP N.
============================================================================== */

-- Without WITH TIES: Returns exactly 2 rows (2024 and one of the 2023 movies)
SELECT TOP 2 
    title, 
    release_year
FROM Movies
ORDER BY release_year DESC;

-- With WITH TIES: Returns 3 rows because two movies tied for the year 2023!
SELECT TOP 2 WITH TIES 
    title, 
    release_year
FROM Movies
ORDER BY release_year DESC;


/* ==============================================================================
   E. SKIPPING & PAGING ROWS (OFFSET ... FETCH)
   Used to skip N rows and grab the next M rows (requires an ORDER BY clause).
============================================================================== */

-- Skip the #1 highest-rated review, and fetch the 2nd and 3rd highest-rated reviews
SELECT 
    reviewer_name, 
    movie_id, 
    rating
FROM Reviews
ORDER BY rating DESC
OFFSET 1 ROWS
FETCH NEXT 2 ROWS ONLY;
