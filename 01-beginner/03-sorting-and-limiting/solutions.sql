/* ==============================================================================
   SOLUTIONS — 03: Sorting and Limiting Results
   Database: SQLMadeSimple
============================================================================== */

USE SQLMadeSimple;
GO


/* ==============================================================================
   🟢 BEGINNER SOLUTIONS
============================================================================== */

-- Problem 1: Newest Movies First
-- Explanation: 'DESC' sorts numbers from largest to smallest (2024 down to 2019).
SELECT 
    title, 
    genre, 
    release_year
FROM Movies
ORDER BY release_year DESC;


-- Problem 2: Alphabetical Reviewers
-- Explanation: 'ASC' sorts text alphabetically from A to Z.
SELECT 
    reviewer_name, 
    rating, 
    review_date
FROM Reviews
ORDER BY reviewer_name ASC;


-- Problem 3: Top 3 Longest Movies
-- Explanation: First sort by duration_mins DESC so the longest movies are at the top,
-- then use TOP 3 to grab only the first 3 rows.
SELECT TOP 3 
    title, 
    duration_mins
FROM Movies
ORDER BY duration_mins DESC;


/* ==============================================================================
   🟡 INTERMEDIATE SOLUTIONS
============================================================================== */

-- Problem 4: Multi-Column Sorting (Tie-Breakers)
-- Explanation: SQL Server sorts by reviewer_name (A-Z) first. Whenever the same 
-- reviewer appears twice (like Arjun, Kavya, or Meera), it sorts their rows 
-- by rating from highest to lowest.
SELECT *
FROM Reviews
ORDER BY reviewer_name ASC, rating DESC;


-- Problem 5: Filtering + Sorting + Limiting
-- Explanation: WHERE filters down to the 3 Sci-Fi movies, ORDER BY sorts them 
-- by box office earnings highest to lowest, and TOP 2 keeps the top 2.
SELECT TOP 2 
    title, 
    release_year, 
    box_office_millions
FROM Movies
WHERE genre = 'Sci-Fi'
ORDER BY box_office_millions DESC;


/* ==============================================================================
   🔴 ADVANCED SOLUTIONS
============================================================================== */

-- Problem 6: Handling Ties (WITH TIES)
-- Explanation: Midnight Runaway (2024) is #1. Both 'The Last Signal' and 
-- 'Glass Horizon' came out in 2023 (tied for #2). WITH TIES ensures both 
-- 2023 movies are returned (3 rows total).
SELECT TOP 2 WITH TIES 
    title, 
    release_year
FROM Movies
ORDER BY release_year DESC;


-- Problem 7: Second and Third Highest-Rated Reviews (OFFSET-FETCH)
-- Explanation: OFFSET 1 ROWS skips the #1 highest rating (9.0 by Rohan), 
-- and FETCH NEXT 2 ROWS ONLY grabs the #2 (8.5) and #3 (8.2) reviews.
SELECT 
    review_id, 
    reviewer_name, 
    rating
FROM Reviews
ORDER BY rating DESC
OFFSET 1 ROWS
FETCH NEXT 2 ROWS ONLY;
