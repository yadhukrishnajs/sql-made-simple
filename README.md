# 🎬 SQL Made Simple

A free, practical, hands-on learning resource for mastering SQL using **Microsoft SQL Server (T-SQL)** — from your very first `SELECT` statement to advanced query optimization.

Learn SQL step by step through simple explanations, runnable examples, practical exercises, and real-world projects.

---

## 1. What is SQL Made Simple?

Learning SQL can be confusing when tutorials use large datasets or explain commands without showing how they work together.

**SQL Made Simple** aims to make learning SQL easier by using one small, realistic Movie and Review database throughout the course.

The sample database contains:

- 8 movies
- 8 reviews
- Two related tables
- Multiple reviews for some movies
- Movies without reviews
- Intentional `NULL` values for practising missing-data handling

Because the dataset is small, you can easily inspect the records and understand how each SQL query changes the results.

The goal is not just to learn SQL syntax, but to understand how and why queries work.

## 2. Who Is This Repository For?

This repository is designed for:

- **Complete beginners** learning SQL for the first time.
- **Students** who want to strengthen their database and SQL knowledge.
- **Developers** looking for practical T-SQL examples and exercises.
- **Self-learners** who prefer learning through experimentation and problem-solving.

No advanced SQL knowledge is required to get started.

## 3. Technologies Used

| Technology | Purpose |
|---|---|
| Microsoft SQL Server Express | Database engine |
| SQL Server Management Studio (SSMS) | Writing and executing SQL queries |
| T-SQL | SQL language used throughout this repository |
| Git and GitHub | Version control and project documentation |

## 4. Getting Started

### Requirements

Before starting, install:

1. [Microsoft SQL Server Express](https://www.microsoft.com/en-us/sql-server/sql-server-downloads)
2. [SQL Server Management Studio (SSMS)](https://learn.microsoft.com/en-us/ssms/install/install)

### Create the Sample Database

Follow these steps:

1. Open SQL Server Management Studio (SSMS).
2. Connect to your local SQL Server instance.
3. Open the `00-setup/setup_database.sql` file.
4. Execute the script by pressing `F5`.
5. Check that the `SQLMadeSimple` database has been created.

The script creates the database and inserts the sample records into the `Movies` and `Reviews` tables.

**Important — Resetting the Database**

You can execute `setup_database.sql` again whenever you want to restore the original sample database.

However, running this script will delete the existing `SQLMadeSimple` database and all its data before recreating it. Any changes you made will be lost.

Use it only when you want a fresh starting point.

## 5. How the Course Is Organized

The course is divided into three learning stages.

Each topic folder is designed to contain:

| File | Description |
|---|---|
| `README.md` | Plain-English explanations of the concept, syntax, and how it works. |
| `examples.sql` | Runnable SQL examples with comments. |
| `practice.md` | Exercises to test your understanding, with optional hints. |
| `solutions.sql` | Solutions and explanations for the exercises. |

### Stage 1 — Beginner

Build a strong foundation in SQL.

- [ ] **01. SELECT Basics** — Retrieving data from tables.
- [ ] **02. Filtering with WHERE** — Selecting records based on conditions.
- [ ] **03. Sorting and Limiting** — Ordering and restricting query results.
- [ ] **04. Aggregate Functions** — Using `COUNT`, `SUM`, `AVG`, `MIN`, and `MAX`.
- [ ] **05. GROUP BY and HAVING** — Grouping records and filtering groups.
- [ ] **06. JOINs** — Combining data from related tables.
- [ ] **07. NULL and CASE** — Handling missing values and conditional logic.

### Stage 2 — Intermediate

Learn to write more powerful queries and manage database objects.

- [ ] **01. Subqueries**
- [ ] **02. Common Table Expressions (CTEs)**
- [ ] **03. String and Date Functions**
- [ ] **04. Set Operators**
- [ ] **05. INSERT, UPDATE and DELETE**
- [ ] **06. Constraints and Keys**
- [ ] **07. Views**
- [ ] **08. Transactions**

### Stage 3 — Advanced

Explore advanced SQL techniques and query performance.

- [ ] **01. Window Functions**
- [ ] **02. Recursive CTEs**
- [ ] **03. Complex Queries**
- [ ] **04. Indexes and Performance**
- [ ] **05. Query Optimization**
- [ ] **06. Stored Procedures**

### Additional Learning

- [ ] Mixed SQL Challenges
- [ ] Movie Analysis Project
- [ ] Sales Analysis Project

*The intermediate, advanced, and project sections will be developed as the learning material progresses.*

## 6. How to Practice Effectively

The best way to learn SQL is by writing queries yourself.

For every topic, follow this process:

1. **Understand:** Read the topic's `README.md` and understand the concept.
2. **Experiment:** Open `examples.sql` in SSMS and execute the queries.
3. **Practise:** Attempt the exercises in `practice.md` without looking at the solutions.
4. **Use hints:** If you get stuck, open the optional hints.
5. **Review:** Check `solutions.sql` and understand the reasoning behind each solution.
6. **Experiment again:** Modify the queries and observe how the results change.

Don't just copy and execute queries. Try to predict the output before running them.

## 7. Learning Philosophy

This repository follows a few simple principles:

- **Understand before memorizing:** Learn why a query works instead of memorizing its syntax.
- **Learn by doing:** Write and execute queries rather than only reading explanations.
- **Progress gradually:** Start with simple queries and combine concepts as your understanding improves.
- **Use one consistent database:** Build familiarity with the same data while learning new SQL concepts.
- **Learn from mistakes:** Experiment with queries, examine unexpected results, and correct them.

## 8. Repository Structure

```text
sql-made-simple/
│
├── README.md
├── LICENSE
│
├── 00-setup/
│   ├── README.md
│   └── setup_database.sql
│
├── 01-beginner/
│   ├── 01-select-basics/
│   ├── 02-filtering-where/
│   ├── 03-sorting-and-limiting/
│   ├── 04-aggregate-functions/
│   ├── 05-group-by-having/
│   ├── 06-joins/
│   └── 07-null-and-case/
│
├── 02-intermediate/
│
├── 03-advanced/
│
├── 04-challenges/
│   ├── beginner/
│   ├── intermediate/
│   └── advanced/
│
├── 05-projects/
│   ├── movie-analysis/
│   └── sales-analysis/
│
└── resources/
    └── useful-links.md
```

*Folders and learning materials will be added gradually.*

## 9. Contributions and Feedback

This is a learning-focused project, and suggestions, corrections, and improvements are welcome.

If you find an error or have an idea that could make an explanation clearer, feel free to open an issue or submit a pull request.

## 10. License

This project is licensed under the [MIT License](LICENSE).

You are welcome to use, modify, and share this learning material under the terms of the license.

---

**Happy Learning! 🚀**

Learn SQL one query at a time.
