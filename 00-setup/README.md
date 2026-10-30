# 00. Database Setup (`SQLMadeSimple`)

This folder contains the setup script that creates the `SQLMadeSimple` database and inserts the sample records used throughout the repository.

---

## 🛠️ How to Run the Setup Script in SSMS

1. Open **SQL Server Management Studio (SSMS)** and connect to your local `SQLEXPRESS` server.
2. Open [`setup_database.sql`](./setup_database.sql) inside SSMS (or copy and paste its contents into a **New Query** window).
3. Click **Execute** (or press **F5**).
4. In the **Object Explorer** panel on the left, right-click **Databases** and select **Refresh** to see `SQLMadeSimple`.

---

## 🗄️ Database Schema & Sample Data

The database consists of two related tables: **`Movies`** (8 rows) and **`Reviews`** (8 rows).

### Table 1: `Movies`
| movie_id (PK) | title | genre | release_year | duration_mins | box_office_millions |
| :--- | :--- | :--- | :--- | :--- | :--- |
| **1** | Moonrise | Sci-Fi | 2020 | 118 | 45.50 |
| **2** | Deep Space | Sci-Fi | 2022 | 142 | 180.00 |
| **3** | The Last Signal | Sci-Fi | 2023 | 129 | 95.20 |
| **4** | Silent Echo | Thriller | 2021 | 105 | 32.10 |
| **5** | Glass Horizon | Thriller | 2023 | 114 | 64.80 |
| **6** | Golden Hour | Drama | 2019 | 136 | 28.40 |
| **7** | Paper Boats | Drama | 2022 | 98 | `NULL` |
| **8** | Midnight Runaway | Action | 2024 | 125 | `NULL` |

### Table 2: `Reviews`
| review_id (PK) | movie_id (FK) | reviewer_name | rating | review_date | review_text |
| :--- | :--- | :--- | :--- | :--- | :--- |
| **1** | 1 | Arjun | 7.5 | 2020-06-15 | Great atmosphere, slightly slow pacing. |
| **2** | 1 | Meera | 8.0 | 2020-07-02 | Loved the soundtrack and visuals. |
| **3** | 2 | Rohan | 9.0 | 2022-11-10 | A masterpiece of modern sci-fi. |
| **4** | 2 | Kavya | 8.5 | 2022-11-18 | Incredible world-building. |
| **5** | 3 | Arjun | 6.5 | 2023-03-05 | `NULL` |
| **6** | 4 | Dev | 7.8 | 2021-09-22 | Kept me guessing until the final scene. |
| **7** | 5 | Meera | 8.2 | 2023-08-14 | Sharp writing and tense direction. |
| **8** | 6 | Kavya | 7.0 | 2019-12-01 | Heartfelt performances, a bit long. |

---

## 🔍 Intentional Design Features for Practice
* **Multiple reviews per movie:** `movie_id` **1** and **2** have two reviews each (great for `GROUP BY` and `COUNT`).
* **Movies with zero reviews:** `movie_id` **7** (*Paper Boats*) and **8** (*Midnight Runaway*) have no matching rows in `Reviews` (essential for comparing `INNER JOIN` vs. `LEFT JOIN`).
* **Intentional `NULL` values:** Missing `box_office_millions` on movies **7** and **8**, and a missing `review_text` on review **5** (for practicing `IS NULL` and `COALESCE`).
