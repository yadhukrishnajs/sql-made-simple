# 01. SELECT Basics

The `SELECT` statement is the starting point of almost every SQL query. It is how you ask the database to fetch data from a table and display it on your screen.

> 💡 **Good to know:** `SELECT` only **reads** data. It never modifies, overwrites, or deletes anything inside your database, so you can experiment freely.

---

## 1. How SQL Server Reads Your Query

When you write a basic query, you write `SELECT` first and `FROM` second:

```sql
SELECT title, genre
FROM Movies;
```

Behind the scenes, **SQL Server processes them in the opposite order**:
1. **`FROM Movies`** — First, the database locates the `Movies` table.
2. **`SELECT title, genre`** — Second, it extracts only the columns you asked for.

---

## 2. Core Concepts & Examples

### A. Retrieve All Columns (`SELECT *`)
The asterisk (`*`) means *"give me every column in the table."*

```sql
SELECT *
FROM Movies;
```
* **When to use:** Quick checks on small tables to see what the data looks like.
* **When to avoid:** Real-world production tables with thousands or millions of rows, because pulling unneeded columns wastes memory and slows down queries.

---

### B. Retrieve Specific Columns
List the exact column names you want, separated by commas. The columns will appear in the exact order you list them.

```sql
SELECT title, release_year, genre
FROM Movies;
```

---

### C. Rename Columns with Aliases (`AS`)
Use `AS` to give a column a cleaner, temporary name in your query output. This does not permanently rename the column in the table.

```sql
SELECT 
    title AS MovieTitle,
    duration_mins AS [Duration in Minutes]
FROM Movies;
```
* **Tip:** If your new column name contains spaces or special characters, wrap it in square brackets `[]`.

---

### D. Remove Duplicates (`DISTINCT`)
In our `Movies` table, `'Sci-Fi'` appears three times and `'Thriller'` appears twice. Adding `DISTINCT` right after `SELECT` removes duplicates so each unique value appears only once.

```sql
SELECT DISTINCT genre
FROM Movies;
```

**Expected Output:**
| genre |
| :--- |
| Action |
| Drama |
| Sci-Fi |
| Thriller |

---

### E. Calculated Columns (Math in `SELECT`)
You can perform basic math (`+`, `-`, `*`, `/`) directly inside `SELECT` to create a temporary calculated column in your results.

```sql
SELECT 
    movie_id,
    rating,
    rating * 10 AS rating_out_of_100
FROM Reviews;
```

---

## 3. Quick Summary Table

| What you want to do | SQL Syntax |
| :--- | :--- |
| Show all columns | `SELECT * FROM Movies;` |
| Show specific columns | `SELECT title, genre FROM Movies;` |
| Rename a column (no spaces) | `SELECT title AS MovieTitle FROM Movies;` |
| Rename a column (with spaces) | `SELECT title AS [Movie Title] FROM Movies;` |
| Show unique values only | `SELECT DISTINCT genre FROM Movies;` |
| Calculate a new value | `SELECT rating * 10 AS Score FROM Reviews;` |

---

## 4. Next Steps

1. Open [`examples.sql`](./examples.sql) in SSMS and press **F5** to run these queries yourself.
2. Open [`practice.md`](./practice.md) and try solving the Beginner, Intermediate, and Advanced exercises.
3. Check your answers against [`solutions.sql`](./solutions.sql).
