-- Deliverable 1
--- (Steps 1 - 7)
Select e.emp_no, e.first_name, e.last_name, ti.title, ti.from_date, ti.to_date
	into challenge_table_1
From employees as e
	Inner join titles as ti
	on (e.emp_no = ti.emp_no)
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no;

select * from challenge_table_1

Drop table challenge_table_1

--- Step 8-14
-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no, first_name, last_name, title
	INTO unique_titles
FROM challenge_table_1
ORDER BY emp_no, to_date DESC;

Drop table unique_titles

select * from unique_titles

-- Step 16 - 20
Select Count(title), title 
	Into retiring_titles
	from unique_titles
	Group by title
ORDER BY count DESC;

select * from retiring_titles


select sum(count)
from retiring_titles


--Deliverable 2
Select e.emp_no, e.first_name, e.last_name, e.birth_date, de.from_date, de.to_date, ti.title
	into mentorship_eligibility
From employees as e
	Inner join dept_emp as de
	on (e.emp_no = de.emp_no)
	Inner join titles as ti
	on (e.emp_no = ti.emp_no)
WHERE (birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY e.emp_no;

SELECT DISTINCT ON (emp_no) emp_no, first_name, last_name, birth_date, from_date, to_date, title
	INTO mentorship_eligibility_final
FROM mentorship_eligibility
WHERE (to_date = '9999-01-01')
ORDER BY emp_no, to_date DESC;

drop table mentorship_eligibility_final

select * from mentorship_eligibility_final

Select Count(emp_no), title
from mentorship_eligibility_final
	Group by title
ORDER BY count DESC;

-----------Mess Around Script------------------

select count (title)
from mentorship_eligibility_final

SELECT DISTINCT ON (emp_no) emp_no, first_name, last_name, birth_date, gender
from employees


SELECT DISTINCT ON (emp_no) emp_no, first_name, last_name, title, from_date, to_date
	INTO retirement_unique_count
FROM challenge_table_1
WHERE (to_date = '9999-01-01')
ORDER BY emp_no, to_date DESC;

select count(emp_no) from retirement_unique_count