-- Deliverable1: Number of Retiring Employees by Title
DROP TABLE retirement_titles

SELECT e.emp_no,
    e.first_name,
    e.last_name,
    titles.title,
    titles.from_date,
    titles.to_date
INTO retirement_titles
FROM employees AS e
    INNER JOIN titles
    ON (e.emp_no = titles.emp_no)
    WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31');

Select * FROM retirement_titles
	ORDER BY from_date;

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
title
INTO retiring_titles
FROM retirement_titles;

Select * FROM retiring_titles
ORDER BY emp_no ASC;

-- Title Count
SELECT COUNT(emp_no), title
FROM retiring_titles
GROUP BY title
ORDER BY count DESC;