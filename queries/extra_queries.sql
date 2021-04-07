SELECT DISTINCT ON(e.emp_no)
e.emp_no, e.first_name, e.last_name,e.birth_date,
d.from_date,d.to_date,
ti.title, s.salary
FROM employees AS e
JOIN dept_emp AS d ON e.emp_no = d.emp_no
JOIN titles AS ti ON e.emp_no = ti.emp_no
AND d.to_date = ti.to_date
JOIN salaries AS s ON e.emp_no = s.emp_no
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31') 
AND d.to_date = '9999-01-01'
ORDER BY e.emp_no ASC;

SELECT u.emp_no, s.salary 
FROM unique_titles u
JOIN salaries s
ON u.emp_no = s.emp_no
ORDER BY u.emp_no ASC;
