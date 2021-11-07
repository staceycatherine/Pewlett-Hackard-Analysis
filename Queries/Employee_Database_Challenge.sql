Employee_Database_Challenge.sql
SELECT DISTINCT ON (rt.emp_no)
	rt.emp_no,
	rt.first_name,
	rt.last_name,
	rt.title
INTO unique_titles
FROM retirement_titles AS rt
ORDER BY emp_no ASC, to_date DESC;

--Retrieve the number of titles from Unique Titles Table
--Create a Retiring Titles table to hold the required info
--Groupby title, sort in DESC order
SELECT COUNT(emp_no),
	ut.title
	INTO retiring_titles 
FROM unique_titles AS ut
GROUP BY title
ORDER BY COUNT (title) DESC

--Create a new table for mentorship eligibility for employees born b/w Jan. 1, 1965 and Dec. 31, 1965
SELECT DISTINCT ON (e.emp_no)
	e.emp_no,
	e.first_name,
	e.last_name,
	e.birth_date,
	de.from_date,
	de.to_date,
	t.title
INTO mentorship_eligibility
FROM employees as e
INNER JOIN dept_emp AS de 
	ON e.emp_no = de.emp_no
LEFT JOIN titles AS t
	ON(t.emp_no = e.emp_no)
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
AND (de.to_date = '9999-01-01')
ORDER BY e.emp_no;