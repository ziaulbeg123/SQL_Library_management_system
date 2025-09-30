-- library management syatsem


create table branch(
branch_id	varchar(10) primary key,
manager_id	varchar(15),
branch_address	varchar(55),
contact_no      varchar(15)
); 

create table employee(
emp_id varchar(10) primary key,	
emp_name  varchar(30),	
position	varchar(15),
salary	int,
branch_id varchar(10)  -- fk
);

create table books(
isbn varchar(100) primary key,	
book_title	varchar(380),
category	varchar(100),
rental_price	float,
status	varchar(90),
author	varchar(300),
publisher varchar(430)
);

create table members(
member_id varchar(10) primary key,
member_name varchar(20),
member_address varchar(50),
reg_date date
);

create table issued_status(
issued_id varchar(10) primary key,
issued_member_id varchar(10), -- fk
issued_book_name varchar(75),
issued_date date,
issued_book_isbn varchar(30), -- fk
issued_emp_id varchar(15)   -- fk
);

create table return_status(
return_id varchar(10) primary key,
issued_id varchar(14),
return_book_name varchar(75),
return_date date,
return_book_isbn varchar(30)
);


show tables from Library_Management_System

-- foreign key

alter table issued_status 
add constraint fk_members
foreign key(issued_member_id)
references members(member_id);


alter table issued_status 
add constraint fk_books
foreign key(issued_book_isbn)
references books(isbn);

alter table issued_status 
add constraint fk_employee
foreign key(issued_emp_id)
references employee(emp_id);


alter table employee 
add constraint fk_branch
foreign key(branch_id)
references branch(branch_id);

alter table return_status 
add constraint fk_issued_status
foreign key(issued_id)
references issued_status(issued_id);
