# SQL_project
You are going to build a project based on Library Management System. It keeps
track all information about books in the library, their cost, status and total
number of books available in the library.
Create a database named library and create following TABLES in the database:
1. Branch
2. Employee
3. Customer
4. IssueStatus
5. ReturnStatus
6. Books
Attributes for the tables:
1. Branch
 Branch_no - Set as PRIMARY KEY
 Manager_Id
 Branch_address
 Contact_no
2. Employee
 Emp_Id – Set as PRIMARY KEY
 Emp_name
 Position
 Salary
Please Note: Manager_Id from Branch table can be considered as Emp_Id in
Employee table.
3. Customer
 Customer_Id - Set as PRIMARY KEY
 Customer_name
 Customer_address
 Reg_date
4. IssueStatus
 Issue_Id - Set as PRIMARY KEY
 Issued_cust – Set as FOREIGN KEY and it refer customer_id in
CUSTOMER table
 Issued_book_name
 Issue_date
 Isbn_book – Set as FOREIGN KEY and it should refer isbn in
BOOKS table
5. ReturnStatus
 Return_Id - Set as PRIMARY KEY
 Return_cust
 Return_book_name
 Return_date
 Isbn_book2 - Set as FOREIGN KEY and it should refer isbn in
BOOKS table
6. Books
 ISBN - Set as PRIMARY KEY
 Book_title
 Category
 Rental_Price
 Status [Give yes if book available and no if book not available]
 Author
 Publisher
Write the queries for the following:
1. Retrieve the book title, category, and rental price of all available
books.
2. List the employee names and their respective salaries in descending
order of salary.
3. Retrieve the book titles and the corresponding customers who have
issued those books.
4. Display the total count of books in each category.
5. Retrieve the employee names and their positions for the employees
whose salaries are above Rs.50,000.
6. List the customer names who registered before 2022-01-01 and have
not issued any books yet.
7. Display the branch numbers and the total count of employees in each
branch.
8. Display the names of customers who have issued books in the month
of June 2023.
9. Retrieve book_title from book table containing history.
10.Retrieve the branch numbers along with the count of employees for
branches having more than 5 employees.
