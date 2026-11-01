# 02. Filtering Data with `WHERE`

In Lesson 01, `SELECT` returned every single row in the table. In the real world, you rarely want every row — you usually want records that match specific conditions (e.g., movies released after 2021, or reviews with a rating of 8.0 or higher).

The `WHERE` clause acts like a **filter**. It checks every row in the table and only keeps the rows where your condition is **True**.

---

## 1. How SQL Server Reads a `WHERE` Query

When you add `WHERE` to your query, you write it **after `FROM`**:

```sql
SELECT title, release_year
FROM Movies
WHERE release_year > 2021;
```

Behind the scenes, **SQL Server processes the clauses in this exact order**:
1. **`FROM Movies`** — First, locate the `Movies` table.
2. **`WHERE release_year > 2021`** — Second, check every row and filter out any movie released in 2021 or earlier.
3. **`SELECT title, release_year`** — Finally, display the requested columns for the surviving rows.

> ⚠️ **Important Rule:** Because `WHERE` runs **before** `SELECT`, you **cannot** use a column alias created in `SELECT` inside your `WHERE` clause!

---

## 2. Core Filtering Operators

### A. Comparison Operators (`=`, `<>`, `>`, `<`, `>=`, `<=`)
Used to compare numbers, text, or dates. Note that text and dates must be wrapped in **single quotes `' '`**.

| Operator | Meaning | Example |
| :--- | :--- | :--- |
| `=` | Equal to | `WHERE genre = 'Sci-Fi'` |
| `<>` or `!=` | Not equal to | `WHERE genre <> 'Drama'` |
| `>` | Greater than | `WHERE rating > 8.0` |
| `<` | Less than | `WHERE duration_mins < 120` |
| `>=` | Greater than or equal to | `WHERE release_year >= 2022` |
| `<=` | Less than or equal to | `WHERE box_office_millions <= 50.00` |

---

### B. Logical Operators (`AND`, `OR`, `NOT`)
Used to combine multiple conditions in a single `WHERE` clause:

* **`AND`** — **Both** conditions must be true.
  ```sql
  SELECT title, genre, release_year
  FROM Movies
  WHERE genre = 'Sci-Fi' AND release_year > 2021;
  ```
* **`OR`** — **At least one** condition must be true.
  ```sql
  SELECT title, genre
  FROM Movies
  WHERE genre = 'Drama' OR genre = 'Action';
  ```
* **`NOT`** — Reverses a condition.
  ```sql
  SELECT title, genre
  FROM Movies
  WHERE NOT genre = 'Sci-Fi';
  ```

> 💡 **Tip on Mixing `AND` and `OR`:** SQL Server always evaluates `AND` before `OR` (just like multiplication happens before addition in math). Whenever you mix `AND` and `OR` in the same query, **always use parentheses `( )`** to make your logic crystal clear.

---

### C. Range Filtering (`BETWEEN`)
Checks if a value falls within an inclusive range (including both the start and end values).

```sql
-- Equivalent to: WHERE release_year >= 2020 AND release_year <= 2022
SELECT title, release_year
FROM Movies
WHERE release_year BETWEEN 2020 AND 2022;
```

---

### D. List Filtering (`IN`)
A clean shortcut for multiple `OR` conditions on the same column.

```sql
-- Equivalent to: WHERE genre = 'Sci-Fi' OR genre = 'Thriller'
SELECT title, genre
FROM Movies
WHERE genre IN ('Sci-Fi', 'Thriller');
```

---

### E. Pattern Matching (`LIKE`)
Used to search for partial text patterns using wildcards:
* **`%` (Percent):** Matches zero, one, or many characters.
* **`_` (Underscore):** Matches exactly **one** single character.

| Pattern | What it matches | Example Matches |
| :--- | :--- | :--- |
| `'The%'` | Starts with `"The"` | *The Last Signal* |
| `'%Space'` | Ends with `"Space"` | *Deep Space* |
| `'%o%'` | Contains the letter `"o"` anywhere | *Moonrise, Golden Hour, Paper Boats* |
| `'____'` | Exactly 4 characters long | *Dev* (if 3 underscores `'___'`) |

```sql
SELECT title
FROM Movies
WHERE title LIKE 'The%';
```

---

## 3. Quick Summary Table

| Goal | T-SQL Syntax |
| :--- | :--- |
| Exact match | `WHERE genre = 'Sci-Fi'` |
| Not equal | `WHERE genre <> 'Sci-Fi'` |
| Both conditions true | `WHERE genre = 'Sci-Fi' AND release_year = 2022` |
| Either condition true | `WHERE genre = 'Drama' OR genre = 'Action'` |
| Value inside a range (inclusive) | `WHERE rating BETWEEN 7.5 AND 8.5` |
| Value matches a list | `WHERE reviewer_name IN ('Arjun', 'Meera')` |
| Text starts with... | `WHERE title LIKE 'Glass%'` |
| Text contains... | `WHERE review_text LIKE '%visuals%'` |

---

## 4. Next Steps

1. Open [`examples.sql`](./examples.sql) in SSMS and press **F5** to see each filter in action.
2. Open [`practice.md`](./practice.md) and solve the Beginner, Intermediate, and Advanced exercises.
3. Compare your queries with [`solutions.sql`](./solutions.sql).
