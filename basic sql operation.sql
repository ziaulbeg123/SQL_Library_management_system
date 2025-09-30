select * from books
select * from branch
select * from employee
select * from issued_status 
select * from return_status
select * from members


-- Project Task
-- Task 1. Create a New Book Record -- "978-1-60129-456-2', 'To Kill a Mockingbird', 'Classic', 6.00, 'yes', 'Harper Lee', 'J.B. Lippincott & Co.')"
insert into books (isbn,book_title,category,rental_price ,status,author,publisher) values
('978-1-60129-456-2', 'To Kill a Mockingbird', 'Classic', 6.00, 'yes', 'Harper Lee', 'J.B. Lippincott & Co.')



-- Task 2: Update an Existing Member's Address
update members m 
set member_address= '125 MAIN st'
where m.member_id='C101';

-- Task 3: Delete a Record from the Issued Status Table -- Objective: Delete the record with issued_id = 'IS121' from the issued_status table.

delete  from issued_status 
where
issued_id='IS121';

select * from issued_status 
where issued_id='C121';


-- Task 4: Retrieve All Books Issued by a Specific Employee -- Objective: Select all books issued by the employee with emp_id = 'E101'.
select t.issued_book_name  from issued_status t 
where 
issued_emp_id='E101';

-- Task 5: List Members Who Have Issued More Than One Book -- Objective: Use GROUP BY to find members who have issued more than one book.
 select 
 issued_emp_id,
 count(*) as books_quantity
 from issued_status t 
 group by issued_emp_id
 having count(*) >1


-- CTAS (Create Table As Select)
--  Task 6: Create Summary Tables: Used CTAS to generate new tables based on query results - each book and total book_issued_cnt**
CREATE TABLE book_issued_cnt AS
SELECT b.isbn, b.book_title, COUNT(ist.issued_id) AS issue_count
FROM issued_status as ist
JOIN books as b
ON ist.issued_book_isbn = b.isbn
GROUP BY b.isbn, b.book_title;



-- 4. Data Analysis & Findings
-- Task 7. Retrieve All Books in a Specific Category:

select * from books b 
where category='Classic';
 

-- Task 8: Find Total Rental Income by Category:
select 
b.category,
sum(b.rental_price), 
count(*) as issued_times
FROM issued_status as ist
JOIN books as b
ON ist.issued_book_isbn = b.isbn
group by category;

-- List Members Who Registered in the Last 180 Days:
SELECT * 
FROM members
WHERE reg_date >= CURRENT_DATE - INTERVAL 180 DAY;

-- List Employees with Their Branch Manager's Name and their branch details:
SELECT 
    e1.emp_id,
    e1.emp_name,
    e1.position,
    e1.salary,
    b.*,
    e2.emp_name as manager
FROM employee as e1
JOIN 
branch as b
ON e1.branch_id = b.branch_id    
JOIN
employee as e2
ON e2.emp_id = b.manager_id


-- Task 11. Create a Table of Books with Rental Price Above a Certain Threshold:
CREATE TABLE expensive_books AS
SELECT * FROM books
WHERE rental_price > 7.00;

-- Task 12: Retrieve the List of Books Not Yet Returned
SELECT * FROM issued_status as ist
LEFT JOIN
return_status as rs
ON rs.issued_id = ist.issued_id
WHERE rs.return_id IS NULL;