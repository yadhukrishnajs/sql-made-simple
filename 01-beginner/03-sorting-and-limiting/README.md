# 03. Sorting and Limiting Results (`ORDER BY` & `TOP`)

By default, SQL Server returns rows in whatever order it finds them on disk — there is no guaranteed order unless you explicitly ask for one.

In this lesson, you will learn how to:
1. **Sort** your query output using `ORDER BY`.
2. **Restrict** how many rows appear using `TOP` and `OFFSET-FETCH`.

---

## 1. How SQL Server Reads an `ORDER BY` Query

`ORDER BY` is always written at the **very end** of your query, and it is also the **very last step** SQL Server executes:

```sql
SELECT TOP 3 title, release_year
FROM Movies
WHERE genre = 'Sci-Fi'
ORDER BY release_year DESC;
```

Behind the scenes, SQL Server runs the query in this order:
1. **`FROM Movies`** — Locate the `Movies` table.
2. **`WHERE genre = 'Sci-Fi'`** — Keep only Sci-Fi movies.
3. **`SELECT title, release_year`** — Grab the requested columns.
4. **`ORDER BY release_year DESC`** — Sort the remaining rows from newest to oldest.
5. **`TOP 3`** — Finally, take only the first 3 rows from that sorted list.

> 💡 **Good to know:** Because `ORDER BY` runs *after* `SELECT`, `ORDER BY` is the one clause where you **can** use column aliases created in `SELECT`!

---

## 2. Core Concepts & Examples

### A. Sorting Data (`ORDER BY` with `ASC` and `DESC`)
* **`ASC` (Ascending):** Sorts from lowest to highest (`A → Z`, `0 → 9`, `Oldest → Newest`). This is the **default** if you don't specify a direction.
* **`DESC` (Descending):** Sorts from highest to lowest (`Z → A`, `9 → 0`, `Newest → Oldest`).

```sql
-- Sort movies from longest duration to shortest duration
SELECT title, duration_mins
FROM Movies
ORDER BY duration_mins DESC;
```

> ⚠️ **How SQL Server Sorts `NULL` Values:** In T-SQL, `NULL` is treated as the **smallest possible value**.
> * In `ORDER BY ... ASC`, `NULL` values appear **first** (at the top).
> * In `ORDER BY ... DESC`, `NULL` values appear **last** (at the bottom).

---

### B. Sorting by Multiple Columns
You can sort by more than one column. SQL Server sorts by the first column, and whenever there is a tie, it uses the second column to break the tie.

```sql
-- Sort by genre alphabetically (A-Z), then by release_year newest first within each genre
SELECT title, genre, release_year
FROM Movies
ORDER BY genre ASC, release_year DESC;
```

---

### C. Limiting Rows (`TOP`)
In Microsoft SQL Server (T-SQL), you use `TOP (N)` right after `SELECT` to return only the first `N` rows. *(Other databases like MySQL or PostgreSQL use `LIMIT` at the bottom instead).*

```sql
-- Get the 3 highest-rated reviews
SELECT TOP 3 reviewer_name, movie_id, rating
FROM Reviews
ORDER BY rating DESC;
```
* **Always pair `TOP` with `ORDER BY`:** Without `ORDER BY`, `TOP 3` simply grabs 3 arbitrary rows rather than the "top 3 highest" or "top 3 newest."

---

### D. Handling Ties (`TOP ... WITH TIES`)
What if you ask for the `TOP 2` movies by release year, and two movies are tied for 2nd place? Adding `WITH TIES` tells SQL Server to include any extra rows that tie with the last row. *(Requires an `ORDER BY` clause).*

```sql
SELECT TOP 2 WITH TIES title, release_year
FROM Movies
ORDER BY release_year DESC;
```

---

### E. Skipping & Paging Rows (`OFFSET ... FETCH`)
Used when building "Page 1, Page 2, Page 3" features in applications. It works as an extension of `ORDER BY`:
* **`OFFSET X ROWS`**: Skip the first `X` rows.
* **`FETCH NEXT Y ROWS ONLY`**: Grab the next `Y` rows after skipping.

```sql
-- Skip the top 2 longest movies, and show the next 3 longest movies (Ranks 3, 4, and 5)
SELECT title, duration_mins
FROM Movies
ORDER BY duration_mins DESC
OFFSET 2 ROWS
FETCH NEXT 3 ROWS ONLY;
```

---

## 3. Quick Summary Table

| Goal | T-SQL Syntax |
| :--- | :--- |
| Sort lowest to highest (A–Z, 1–10) | `ORDER BY release_year ASC` |
| Sort highest to lowest (Z–A, 10–1) | `ORDER BY rating DESC` |
| Sort by two columns (tie-breaker) | `ORDER BY genre ASC, rating DESC` |
| Return only the first 5 rows | `SELECT TOP 5 * FROM Movies ORDER BY release_year DESC;` |
| Include tied rows at the cutoff | `SELECT TOP 3 WITH TIES * FROM Movies ORDER BY release_year DESC;` |
| Skip 2 rows, then take the next 3 | `ORDER BY movie_id ASC OFFSET 2 ROWS FETCH NEXT 3 ROWS ONLY;` |

---

## 4. Next Steps

1. Open [`examples.sql`](./examples.sql) in SSMS and press **F5** to see sorting and limiting in action.
2. Open [`practice.md`](./practice.md) and solve the Beginner, Intermediate, and Advanced exercises.
3. Check your solutions against [`solutions.sql`](./solutions.sql).
