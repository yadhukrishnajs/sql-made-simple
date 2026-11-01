/* ==============================================================================
   LESSON 01: SELECT Basics
   Database: SQLMadeSimple
   Concepts: SELECT *, Specific Columns, Aliases (AS), DISTINCT, Calculations
============================================================================== */

-- Always tell SQL Server which database to use first
USE SQLMadeSimple;
GO


/* ==============================================================================
   A. RETRIEVE ALL COLUMNS (SELECT *)
   The asterisk (*) returns every column and every row in the table.
============================================================================== */

-- View all 8 movies
SELECT * 
FROM Movies;

-- View all 8 reviews
SELECT * 
FROM Reviews;


/* ==============================================================================
   B. RETRIEVE SPECIFIC COLUMNS
   List only the columns you need, separated by commas.
   They will appear in the exact order you write them.
============================================================================== */

SELECT 
    title, 
    release_year, 
    genre
FROM Movies;


/* ==============================================================================
   C. RENAME COLUMNS WITH ALIASES (AS)
   Temporarily renames column headers in your output to make them easier to read.
   Use square brackets [] if your new column name contains spaces or symbols.
============================================================================== */

SELECT 
    title AS MovieTitle, 
    duration_mins AS [Duration in Minutes],
    box_office_millions AS [Box Office ($M)]
FROM Movies;


/* ==============================================================================
   D. REMOVE DUPLICATES (DISTINCT)
   Removes repeated values so each unique value is shown only once.
============================================================================== */

-- 1. Without DISTINCT (returns all 8 rows with repeated genres):
SELECT genre 
FROM Movies;

-- 2. With DISTINCT (returns only the 4 unique genres):
SELECT DISTINCT genre 
FROM Movies;


/* ==============================================================================
   E. CALCULATED COLUMNS (MATH IN SELECT)
   Perform simple math on a column to create a new calculated column in the output.
   This does NOT change the stored table data.
============================================================================== */

-- Convert movie duration from minutes to hours (dividing by 60.0 for decimals)
SELECT 
    title,
    duration_mins,
    duration_mins / 60.0 AS duration_hours
FROM Movies;

-- Convert a 10-point rating into a 100-point score
SELECT 
    movie_id,
    reviewer_name,
    rating,
    rating * 10 AS rating_out_of_100
FROM Reviews;
