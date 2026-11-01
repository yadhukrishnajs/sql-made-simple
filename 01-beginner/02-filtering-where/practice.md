# 🏋️ Practice Exercises — 02. Filtering Data with `WHERE`

Try solving these problems inside **SQL Server Management Studio (SSMS)** using the `SQLMadeSimple` database before checking `solutions.sql`.

---

## 🟢 Beginner (Learn the Syntax)

### Problem 1: Filter by Genre
**Question:** Retrieve the `title` and `release_year` of all movies in the `'Thriller'` genre.
* **Table needed:** `Movies`
* **Columns needed:** `title`, `release_year`, `genre`

<details>
<summary>💡 Click for Hint</summary>
Use <code>WHERE genre = 'Thriller'</code>. Remember to put single quotes around text values!
</details>

---

### Problem 2: Filter by Release Year
**Question:** Show the `title`, `genre`, and `release_year` of all movies released after the year `2021`.
* **Table needed:** `Movies`
* **Columns needed:** `title`, `genre`, `release_year`

<details>
<summary>💡 Click for Hint</summary>
Use the greater-than operator (<code>&gt;</code>) on the <code>release_year</code> column. Numbers do not need quotes.
</details>

---

### Problem 3: High Ratings
**Question:** Retrieve the `review_id`, `reviewer_name`, and `rating` for all reviews with a rating of `8.0` or higher.
* **Table needed:** `Reviews`
* **Columns needed:** `review_id`, `reviewer_name`, `rating`

<details>
<summary>💡 Click for Hint</summary>
Use the greater-than-or-equal-to operator (<code>&gt;=</code>) with <code>8.0</code>.
</details>

---

## 🟡 Intermediate (Combine Concepts)

### Problem 4: Long Sci-Fi Movies (`AND`)
**Question:** Find the `title` and `duration_mins` of all `'Sci-Fi'` movies that are longer than `120` minutes.
* **Table needed:** `Movies`
* **Columns needed:** `title`, `duration_mins`, `genre`

<details>
<summary>💡 Click for Hint</summary>
Combine two conditions in your <code>WHERE</code> clause using the <code>AND</code> operator.
</details>

---

### Problem 5: Specific Reviewers (`IN`)
**Question:** Retrieve all columns (`*`) from the `Reviews` table where the review was written by either `'Arjun'` or `'Kavya'`.
* **Table needed:** `Reviews`
* **Columns needed:** All columns (`*`)

<details>
<summary>💡 Click for Hint</summary>
Use the <code>IN</code> operator with a comma-separated list inside parentheses: <code>WHERE reviewer_name IN ('Arjun', 'Kavya')</code>.
</details>

---

### Problem 6: Runtime Range (`BETWEEN`)
**Question:** Find the `title` and `duration_mins` of movies with a duration between `100` and `125` minutes (inclusive).
* **Table needed:** `Movies`
* **Columns needed:** `title`, `duration_mins`

<details>
<summary>💡 Click for Hint</summary>
Use <code>WHERE duration_mins BETWEEN 100 AND 125</code>.
</details>

---

## 🔴 Advanced (Reason Through Problems)

### Problem 7: Pattern Matching (`LIKE`)
**Question:** Find the `reviewer_name`, `rating`, and `review_text` for all reviews that mention the word `'visuals'` or `'pacing'` anywhere inside the `review_text`.
* **Table needed:** `Reviews`
* **Columns needed:** `reviewer_name`, `rating`, `review_text`

<details>
<summary>💡 Click for Hint</summary>
Combine two <code>LIKE</code> conditions with <code>OR</code>, and wrap each search word in percent signs (<code>'%visuals%'</code>).
</details>

---

### Problem 8: Combining `AND` + `OR` with Parentheses
**Question:** Retrieve the `title`, `genre`, `release_year`, and `box_office_millions` of movies that are either `'Sci-Fi'` or `'Thriller'`, **AND** earned more than `50.00` million at the box office.
* **Table needed:** `Movies`
* **Columns needed:** `title`, `genre`, `release_year`, `box_office_millions`

<details>
<summary>💡 Click for Hint</summary>
Wrap your <code>OR</code> condition inside parentheses like <code>(genre = 'Sci-Fi' OR genre = 'Thriller')</code> before adding <code>AND box_office_millions &gt; 50.00</code>, or use <code>IN ('Sci-Fi', 'Thriller')</code>.
</details>
