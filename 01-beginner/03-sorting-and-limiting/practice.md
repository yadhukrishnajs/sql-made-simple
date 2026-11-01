# 🏋️ Practice Exercises — 03. Sorting and Limiting Results

Try solving these problems inside **SQL Server Management Studio (SSMS)** using the `SQLMadeSimple` database before checking `solutions.sql`.

---

## 🟢 Beginner (Learn the Syntax)

### Problem 1: Newest Movies First
**Question:** Retrieve the `title`, `genre`, and `release_year` of all movies, sorted from the newest `release_year` to the oldest.
* **Table needed:** `Movies`
* **Columns needed:** `title`, `genre`, `release_year`

<details>
<summary>💡 Click for Hint</summary>
Use <code>ORDER BY release_year DESC</code> at the end of your query.
</details>

---

### Problem 2: Alphabetical Reviewers
**Question:** Display the `reviewer_name`, `rating`, and `review_date` from the `Reviews` table, sorted alphabetically by `reviewer_name` (`A` to `Z`).
* **Table needed:** `Reviews`
* **Columns needed:** `reviewer_name`, `rating`, `review_date`

<details>
<summary>💡 Click for Hint</summary>
Use <code>ORDER BY reviewer_name ASC</code>.
</details>

---

### Problem 3: Top 3 Longest Movies
**Question:** Find the `title` and `duration_mins` of the **3 longest movies** in the `Movies` table.
* **Table needed:** `Movies`
* **Columns needed:** `title`, `duration_mins`

<details>
<summary>💡 Click for Hint</summary>
Place <code>TOP 3</code> right after <code>SELECT</code>, and sort by <code>duration_mins DESC</code>.
</details>

---

## 🟡 Intermediate (Combine Concepts)

### Problem 4: Multi-Column Sorting (Tie-Breakers)
**Question:** Retrieve all columns (`*`) from the `Reviews` table. Sort the results by `reviewer_name` alphabetically (`A` to `Z`), and if the same reviewer has multiple reviews, sort their reviews from highest `rating` to lowest `rating`.
* **Table needed:** `Reviews`
* **Columns needed:** All columns (`*`)

<details>
<summary>💡 Click for Hint</summary>
List both columns in your <code>ORDER BY</code> clause separated by a comma: <code>ORDER BY reviewer_name ASC, rating DESC</code>.
</details>

---

### Problem 5: Filtering + Sorting + Limiting
**Question:** Find the `title`, `release_year`, and `box_office_millions` of the **top 2 highest-grossing `'Sci-Fi'` movies**.
* **Table needed:** `Movies`
* **Columns needed:** `title`, `release_year`, `box_office_millions`, `genre`

<details>
<summary>💡 Click for Hint</summary>
Filter for <code>WHERE genre = 'Sci-Fi'</code> first, sort by <code>box_office_millions DESC</code>, and use <code>TOP 2</code> in your <code>SELECT</code> clause.
</details>

---

## 🔴 Advanced (Reason Through Problems)

### Problem 6: Handling Ties (`WITH TIES`)
**Question:** Write a query to get the `TOP 2` newest movies (`title` and `release_year`), but make sure that if two movies are tied for the 2nd newest `release_year`, **both** tied movies are included in the output.
* **Table needed:** `Movies`
* **Columns needed:** `title`, `release_year`

<details>
<summary>💡 Click for Hint</summary>
Use <code>SELECT TOP 2 WITH TIES</code> paired with <code>ORDER BY release_year DESC</code>.
</details>

---

### Problem 7: Second and Third Highest-Rated Reviews (`OFFSET-FETCH`)
**Question:** Skip the #1 highest-rated review in the `Reviews` table, and display only the **2nd and 3rd highest-rated** reviews (`review_id`, `reviewer_name`, `rating`).
* **Table needed:** `Reviews`
* **Columns needed:** `review_id`, `reviewer_name`, `rating`

<details>
<summary>💡 Click for Hint</summary>
After <code>ORDER BY rating DESC</code>, add <code>OFFSET 1 ROWS FETCH NEXT 2 ROWS ONLY</code>.
</details>
