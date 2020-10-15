SELECT e.emp_no, e.first_name, e.last_name,
ti.title,ti.from_date,ti.to_date
INTO challenge_table1
FROM employees AS e
INNER JOIN titles AS ti
ON e.emp_no = ti.emp_no
WHERE e.birth_date BETWEEN '1952-01-01' AND '1955-12-31';

select * from challenge_table1
order by emp_no asc;

SELECT DISTINCT ON (c1.emp_no) 
c1.emp_no,
c1.first_name,
c1.last_name,
c1.title
INTO unique_titles
FROM challenge_table1 c1
ORDER BY c1.emp_no ASC,c1.to_date DESC;

select * from unique_titles order by emp_no ASC;

SELECT COUNT(u.emp_no), u.title
INTO retiring_titles
FROM unique_titles u
GROUP BY u.title
ORDER BY COUNT DESC;

select * from retiring_titles;

SELECT DISTINCT ON(e.emp_no)
e.emp_no, e.first_name, e.last_name,e.birth_date,
d.from_date,d.to_date,
ti.title
INTO challenge_table2
FROM employees AS e
JOIN dept_emp AS d ON e.emp_no = d.emp_no
JOIN titles AS ti ON e.emp_no = ti.emp_no
WHERE e.birth_date BETWEEN '1965-01-01' AND '1965-12-31' AND d.to_date = '9999-01-01'
ORDER BY e.emp_no ASC;

select * from challenge_table2
order by emp_no ASC;
-- Use Dictinct with Orderby to remove duplicate rows
--SELECT DISTINCT ON (c1.emp_no) 
--c1.emp_no,
--c1.first_name,
--c1.last_name,
--c1.title
--INTO unique_titles
--FROM challenge_table1 c1
--ORDER BY _____, _____ DESC;
