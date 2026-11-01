/* ==============================================================================
   SOLUTIONS — 02: Filtering Data with WHERE
   Database: SQLMadeSimple
============================================================================== */

USE SQLMadeSimple;
GO


/* ==============================================================================
   🟢 BEGINNER SOLUTIONS
============================================================================== */

-- Problem 1: Filter by Genre
-- Explanation: Filters rows where genre exactly matches 'Thriller'.
SELECT 
    title, 
    release_year
FROM Movies
WHERE genre = 'Thriller';


-- Problem 2: Filter by Release Year
-- Explanation: '>' keeps only movies released in 2022, 2023, or 2024.
SELECT 
    title, 
    genre, 
    release_year
FROM Movies
WHERE release_year > 2021;


-- Problem 3: High Ratings
-- Explanation: '>=' includes 8.0 as well as anything higher (8.2, 8.5, 9.0).
SELECT 
    review_id, 
    reviewer_name, 
    rating
FROM Reviews
WHERE rating >= 8.0;


/* ==============================================================================
   🟡 INTERMEDIATE SOLUTIONS
============================================================================== */

-- Problem 4: Long Sci-Fi Movies (AND)
-- Explanation: Both conditions must be true for a row to appear.
SELECT 
    title, 
    duration_mins
FROM Movies
WHERE genre = 'Sci-Fi' 
  AND duration_mins > 120;


-- Problem 5: Specific Reviewers (IN)
-- Explanation: 'IN' checks if reviewer_name matches any value in the list.
SELECT *
FROM Reviews
WHERE reviewer_name IN ('Arjun', 'Kavya');


-- Problem 6: Runtime Range (BETWEEN)
-- Explanation: 'BETWEEN' is inclusive, so movies of 100 or 125 mins are included.
SELECT 
    title, 
    duration_mins
FROM Movies
WHERE duration_mins BETWEEN 100 AND 125;


/* ==============================================================================
   🔴 ADVANCED SOLUTIONS
============================================================================== */

-- Problem 7: Pattern Matching (LIKE)
-- Explanation: '%word%' matches the word anywhere inside review_text.
SELECT 
    reviewer_name, 
    rating, 
    review_text
FROM Reviews
WHERE review_text LIKE '%visuals%' 
   OR review_text LIKE '%pacing%';


-- Problem 8: Combining AND + OR with Parentheses
-- Explanation: Parentheses force SQL Server to evaluate the OR condition first 
-- before checking the box office requirement.
SELECT 
    title, 
    genre, 
    release_year, 
    box_office_millions
FROM Movies
WHERE (genre = 'Sci-Fi' OR genre = 'Thriller')
  AND box_office_millions > 50.00;

-- Alternative cleaner solution using IN:
SELECT 
    title, 
    genre, 
    release_year, 
    box_office_millions
FROM Movies
WHERE genre IN ('Sci-Fi', 'Thriller')
  AND box_office_millions > 50.00;
