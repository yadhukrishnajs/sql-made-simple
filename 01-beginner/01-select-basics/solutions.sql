/* ==============================================================================
   SOLUTIONS — 01: SELECT Basics
   Database: SQLMadeSimple
============================================================================== */

USE SQLMadeSimple;
GO

/* ==============================================================================
   🟢 BEGINNER SOLUTIONS
============================================================================== */

-- Problem 1: View All Reviews
-- Explanation: '*' tells SQL Server to return every column in the Reviews table.
SELECT *
FROM Reviews;


-- Problem 2: Movie Titles and Genres
-- Explanation: Explicitly listing column names pulls only the requested data.
SELECT 
    title, 
    genre
FROM Movies;


-- Problem 3: Reviewer Names and Ratings
-- Explanation: Columns are returned in the exact order listed after SELECT.
SELECT 
    reviewer_name, 
    rating, 
    review_date
FROM Reviews;


/* ==============================================================================
   🟡 INTERMEDIATE SOLUTIONS
============================================================================== */

-- Problem 4: Custom Column Headers (Aliases)
-- Explanation: 'AS' renames the output column header without altering the table.
-- Square brackets [] allow spaces and special characters in the alias name.
SELECT 
    title AS [Movie Title],
    release_year AS [Year Released],
    box_office_millions AS [Box Office ($M)]
FROM Movies;


-- Problem 5: Unique Reviewers
-- Explanation: Arjun, Meera, and Kavya each wrote 2 reviews. 
-- DISTINCT removes the duplicates so only 5 unique names are returned instead of 8 rows.
SELECT DISTINCT reviewer_name
FROM Reviews;


/* ==============================================================================
   🔴 ADVANCED SOLUTIONS
============================================================================== */

-- Problem 6: Unique Genre and Release Year Combinations
-- Explanation: DISTINCT applies to the entire row of selected columns. 
-- A row is only removed if BOTH genre AND release_year match another row.
SELECT DISTINCT 
    genre, 
    release_year
FROM Movies;


-- Problem 7: Rating Out of 100 (Calculated Column)
-- Explanation: Expressions like 'rating * 10' compute a new value on the fly 
-- for every row and display it under the alias 'rating_out_of_100'.
SELECT 
    movie_id,
    reviewer_name,
    rating,
    rating * 10 AS rating_out_of_100
FROM Reviews;
