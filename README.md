# Pewlett-Hackard-Analysis

## Overview

The purpose of this analysis is to work with Bobby to determine the number of retiring employees per title, and identify employees who are eligible to participate in a mentorship program. This will help Bobby’s manager prepare for the “silver tsunami” as a lage number of current employees reach retirement age shortly.

## Results


* A large number of Engineers and Senior Engineers are set to be part of the "Silver Tsunami"
* A large number of Staff and Senior Staff are set to be part of the "Silver Tsunami"
* Senior staff form the highest count of employees eligible for the mentorship program
* Assistant Engineer form the lowest count of emloyees eligible for the mentorship program

![Analysis](/mentorship_titles.PNG)

## Summary

![Analysis](/retiring_titles.PNG)

* A total of 90,398 roles would be vacated and would need to be filled as the "Silver Tsunami" takes effect
* There are not enough mentorship ready employees in several departments to mentor the next generation of Pewlett-Hackard employees

### Additional analysis

* There can be some insights drawn from the salaries table to determine what would be the cost recovered by Pewlett-Hackard post the "Silver Tsunami"
* The same table can help us determine if we can pay a mentorship bonus (for relatively lower earning employees) to employees involved in the planned mentoring program

The additional queries can be as follows:

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
