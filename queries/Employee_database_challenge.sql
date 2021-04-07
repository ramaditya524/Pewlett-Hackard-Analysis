--start of deliverable 1

--query1
SELECT e.emp_no, e.first_name, e.last_name,
ti.title,ti.from_date,ti.to_date
INTO retirement_titles
FROM employees AS e
INNER JOIN titles AS ti
ON e.emp_no = ti.emp_no
WHERE e.birth_date BETWEEN '1952-01-01' AND '1955-12-31'
order by e.emp_no;
--table1
select * from retirement_titles;
--query2
-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (c1.emp_no) 
c1.emp_no,
c1.first_name,
c1.last_name,
c1.title
INTO unique_titles
FROM challenge_table1 c1
ORDER BY c1.emp_no ASC,c1.to_date DESC;
--table2
select * from unique_titles;

--query3
SELECT COUNT(u.emp_no), u.title
INTO retiring_titles
FROM unique_titles u
GROUP BY u.title
ORDER BY COUNT DESC;
--table3
select * from retiring_titles;
--end of deliverable 1

SELECT DISTINCT ON(e.emp_no)
e.emp_no, e.first_name, e.last_name,e.birth_date,
d.from_date,d.to_date,
ti.title
INTO mentorship_eligibility
FROM employees AS e
JOIN dept_emp AS d ON e.emp_no = d.emp_no
JOIN titles AS ti ON e.emp_no = ti.emp_no
AND d.to_date = ti.to_date
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31') 
AND d.to_date = '9999-01-01'
ORDER BY e.emp_no ASC;