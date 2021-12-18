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
DROP TABLE unique_titles;

SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
title
INTO unique_titles
FROM retirement_titles;

Select * FROM unique_titles
ORDER BY emp_no ASC;

-- Title Count
SELECT COUNT(emp_no), title
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY count DESC;

SELECT * FROM retiring_titles;

-- Deliverable 2 Mentorship Eligibility
DROP TABLE unique_mentors

SELECT DISTINCT (e.emp_no) emp_no,
    e.first_name,
    e.last_name,
    e.birth_date
INTO unique_mentors
FROM employees AS e
    WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
	ORDER BY e.emp_no ASC;

Select * FROM unique_mentors;

-- Joining titles to mentorship_eligibility

SELECT um.emp_no,
    um.first_name,
    um.last_name,
    titles.title,
    titles.from_date,
    titles.to_date
INTO mentorship_eligibility
FROM unique_mentors AS um
    INNER JOIN titles
    ON (um.emp_no = titles.emp_no);
	
Select * From mentorship_eligibility;