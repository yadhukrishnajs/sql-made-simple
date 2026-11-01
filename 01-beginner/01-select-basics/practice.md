# 🏋️ Practice Exercises — 01. SELECT Basics

Try solving these problems inside **SQL Server Management Studio (SSMS)** using the `SQLMadeSimple` database before checking `solutions.sql`.

---

## 🟢 Beginner (Learn the Syntax)

### Problem 1: View All Reviews
**Question:** Retrieve all columns and all rows from the `Reviews` table.
* **Table needed:** `Reviews`
* **Columns needed:** All columns (`*`)

<details>
<summary>💡 Click for Hint</summary>
Use the asterisk (<code>*</code>) after <code>SELECT</code> to pull every column from <code>Reviews</code>.
</details>

---

### Problem 2: Movie Titles and Genres
**Question:** Retrieve only the `title` and `genre` of every movie in the `Movies` table.
* **Table needed:** `Movies`
* **Columns needed:** `title`, `genre`

<details>
<summary>💡 Click for Hint</summary>
List the column names separated by a comma right after <code>SELECT</code>.
</details>

---

### Problem 3: Reviewer Names and Ratings
**Question:** Display the `reviewer_name`, `rating`, and `review_date` from the `Reviews` table.
* **Table needed:** `Reviews`
* **Columns needed:** `reviewer_name`, `rating`, `review_date`

<details>
<summary>💡 Click for Hint</summary>
Make sure you query <code>FROM Reviews</code> and list the three columns in that exact order.
</details>

---

## 🟡 Intermediate (Combine Concepts)

### Problem 4: Custom Column Headers (Aliases)
**Question:** Retrieve the `title`, `release_year`, and `box_office_millions` from the `Movies` table, but rename the output columns to `Movie Title`, `Year Released`, and `Box Office ($M)`.
* **Table needed:** `Movies`
* **Columns needed:** `title`, `release_year`, `box_office_millions`

<details>
<summary>💡 Click for Hint</summary>
Use the <code>AS</code> keyword and wrap aliases that contain spaces inside square brackets like <code>[Movie Title]</code>.
</details>

---

### Problem 5: Unique Reviewers
**Question:** Some reviewers have written more than one review. Write a query that displays each `reviewer_name` only once (no duplicates).
* **Table needed:** `Reviews`
* **Columns needed:** `reviewer_name`

<details>
<summary>💡 Click for Hint</summary>
Place the <code>DISTINCT</code> keyword immediately after <code>SELECT</code>.
</details>

---

## 🔴 Advanced (Reason Through Problems)

### Problem 6: Unique Genre and Release Year Combinations
**Question:** Retrieve all unique combinations of `genre` and `release_year` from the `Movies` table. (Notice how two Sci-Fi movies released in different years should both appear, vs. how `DISTINCT` behaves across two columns).
* **Table needed:** `Movies`
* **Columns needed:** `genre`, `release_year`

<details>
<summary>💡 Click for Hint</summary>
When you write <code>SELECT DISTINCT col1, col2</code>, SQL Server checks for uniqueness across the <i>pair</i> of columns together.
</details>

---

### Problem 7: Rating Out of 100 (Calculated Column)
**Question:** All ratings in the `Reviews` table are currently on a 10-point scale (e.g., `8.5`). Write a query that shows `movie_id`, `reviewer_name`, the original `rating`, and a new calculated column called `rating_out_of_100` that multiplies the rating by `10`.
* **Table needed:** `Reviews`
* **Columns needed:** `movie_id`, `reviewer_name`, `rating`

<details>
<summary>💡 Click for Hint</summary>
Multiply the column directly inside your <code>SELECT</code> list: <code>rating * 10 AS rating_out_of_100</code>.
</details>
