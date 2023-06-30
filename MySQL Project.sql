CREATE DATABASE library;
USE library;

CREATE TABLE Branch (
    Branch_no INT PRIMARY KEY,
    Manager_Id INT,
    Branch_address VARCHAR(255),
    Contact_no VARCHAR(20),
    FOREIGN KEY (Manager_Id) REFERENCES Employee (Emp_Id)
);

DESC Branch;

INSERT INTO Branch (Branch_no, Manager_Id, Branch_address, Contact_no)
VALUES
    (1, 1, 'Mumbai', '1234567890'),
    (2, 2, 'Delhi', '9876543210'),
    (3, 3, 'Bangalore', '7890123456'),
    (4, 4, 'Kolkata', '9012345678'),
    (5, 5, 'Chennai', '3456789012'),
    (6, 6, 'Hyderabad', '2345678901'),
    (7, 7, 'Ahmedabad', '8901234567'),
    (8, 8, 'Pune', '4567890123');

SET SQL_SAFE_UPDATES = 0;
ALTER TABLE Branch
ADD COLUMN employee_count INT;
UPDATE Branch
SET employee_count = FLOOR(RAND() * 10) + 1;
SET SQL_SAFE_UPDATES = 1;

SELECT * FROM Branch;

CREATE TABLE Employee (
    Emp_Id INT PRIMARY KEY,
    Emp_name VARCHAR(255),
    Position VARCHAR(255),
    Salary DECIMAL(10, 2)
);

INSERT INTO Employee (Emp_Id, Emp_name, Position, Salary)
VALUES
    (1, 'John Doe', 'Manager', 50000.00),
    (2, 'Jane Smith', 'Assistant Manager', 40000.00),
    (3, 'Rahul Gupta', 'Supervisor', 35000.00),
    (4, 'Sneha Patel', 'Sales Executive', 30000.00),
    (5, 'Amit Singh', 'Clerk', 25000.00),
    (6, 'Kavita Sharma', 'Manager', 50000.00),
    (7, 'Amita Patel', 'Assistant Manager', 40000.00),
    (8, 'Rajesh Gupta', 'Supervisor', 35000.00);

SET SQL_SAFE_UPDATES = 0;
UPDATE Employee
SET Salary = 75000
WHERE Position = 'Manager';
SET SQL_SAFE_UPDATES = 1;

SELECT * FROM Employee;

CREATE TABLE Customer (
    Customer_Id INT PRIMARY KEY,
    Customer_name VARCHAR(255),
    Customer_address VARCHAR(255),
    Reg_date DATE
);

INSERT INTO Customer (Customer_Id, Customer_name, Customer_address, Reg_date)
VALUES
    (1, 'Rajesh Kumar', 'Mumbai', '2023-01-01'),
    (2, 'Priya Sharma', 'Delhi', '2023-02-15'),
    (3, 'Amit Patel', 'Bangalore', '2023-03-10'),
    (4, 'Sneha Gupta', 'Kolkata', '2023-04-20'),
    (5, 'Neha Singh', 'Chennai', '2023-05-05'),
    (6, 'Rakesh Verma', 'Hyderabad', '2023-06-12'),
    (7, 'Anita Reddy', 'Ahmedabad', '2023-07-18'),
    (8, 'Manoj Desai', 'Pune', '2023-08-25'),
    (11, 'Aakash Krish', 'Pune', '2022-01-05'),
    (12, 'Neeraj Neens', 'Ahmedabad', '2022-02-10'),
    (13, 'Anu Sithara', 'Pune', '2020-01-05'),
    (14, 'Manu Vinu', 'Ahmedabad', '2019-02-10');

SELECT * FROM Customer;

CREATE TABLE IssueStatus (
    Issue_Id INT PRIMARY KEY,
    Issued_cust INT,
    Issued_book_name VARCHAR(255),
    Issue_date DATE,
    Isbn_book VARCHAR(255),
    FOREIGN KEY (Issued_cust) REFERENCES Customer (Customer_Id),
    FOREIGN KEY (Isbn_book) REFERENCES Books (ISBN)
);

INSERT INTO IssueStatus (Issue_Id, Issued_cust, Issued_book_name, Issue_date, Isbn_book)
VALUES
    (1, 1, 'The Immortals of Meluha', '2023-01-05', '9788183220734'),
    (2, 2, 'The Oath of the Vayuputras', '2023-02-10', '9788129135728'),
    (3, 3, 'Sita: Warrior of Mithila', '2023-03-15', '9780143427533'),
    (4, 4, 'Scion of Ikshvaku', '2023-04-20', '9789352776396'),
    (5, 5, 'The Secret of the Nagas', '2023-05-25', '9789386224390'),
    (6, 6, 'Raavan: Enemy of Aryavarta', '2023-06-30', '9780143424785'),
    (7, 7, 'The Krishna Key', '2023-07-05', '9788129135520'),
    (8, 8, 'Chanakya\'s Chant', '2023-08-10', '9789380658677');

SELECT * FROM IssueStatus;

CREATE TABLE ReturnStatus (
    Return_Id INT PRIMARY KEY,
    Return_cust INT,
    Return_book_name VARCHAR(255),
    Return_date DATE,
    Isbn_book2 VARCHAR(255),
    FOREIGN KEY (Isbn_book2) REFERENCES Books (ISBN)
);

INSERT INTO ReturnStatus (Return_Id, Return_cust, Return_book_name, Return_date, Isbn_book2)
VALUES
    (1, 1, 'The Immortals of Meluha', '2023-01-10', '9788183220734'),
    (2, 2, 'The Oath of the Vayuputras', '2023-02-15', '9788129135728'),
    (3, 3, 'Sita: Warrior of Mithila', '2023-03-20', '9780143427533'),
    (4, 4, 'Scion of Ikshvaku', '2023-04-25', '9789352776396'),
    (5, 5, 'The Secret of the Nagas', '2023-05-30', '9789386224390'),
    (6, 6, 'Raavan: Enemy of Aryavarta', '2023-07-05', '9780143424785'),
    (7, 7, 'The Krishna Key', '2023-08-10', '9788129135520'),
    (8, 8, 'Chanakya\'s Chant', '2023-09-15', '9789380658677');

SELECT * FROM ReturnStatus;

CREATE TABLE Books (
    ISBN VARCHAR(255) PRIMARY KEY,
    Book_title VARCHAR(255),
    Category VARCHAR(255),
    Rental_Price DECIMAL(10, 2),
    Status VARCHAR(30),
    Author VARCHAR(255),
    Publisher VARCHAR(255)
);

INSERT INTO Books (ISBN, Book_title, Category, Rental_Price, Status, Author, Publisher)
VALUES
    ('9788183220734', 'The Immortals of Meluha', 'Fiction', 250.00, 'Available', 'Amish Tripathi', 'Westland'),
    ('9788129135728', 'The Oath of the Vayuputras', 'Fiction', 275.00, 'Available', 'Amish Tripathi', 'Rupa Publications'),
    ('9780143427533', 'Sita: Warrior of Mithila', 'Fiction', 300.00, 'Available', 'Amish Tripathi', 'Westland'),
    ('9789352776396', 'Scion of Ikshvaku', 'Fiction', 225.00, 'Available', 'Amish Tripathi', 'Westland'),
    ('9789386224390', 'The Secret of the Nagas', 'Fiction', 250.00, 'Available', 'Amish Tripathi', 'Westland'),
    ('9780143424785', 'Raavan: Enemy of Aryavarta', 'Fiction', 275.00, 'Available', 'Amish Tripathi', 'Westland'),
    ('9788129135520', 'The Krishna Key', 'Fiction', 300.00, 'Available', 'Ashwin Sanghi', 'Rupa Publications'),
    ('9789380658677', 'Chanakya\'s Chant', 'Fiction', 275.00, 'Available', 'Ashwin Sanghi', 'Westland');
    
SET SQL_SAFE_UPDATES = 0;
UPDATE Books
SET Status = 'Not Available'
WHERE Author = 'Ashwin Sanghi';
SET SQL_SAFE_UPDATES = 1;

SET SQL_SAFE_UPDATES = 0;
UPDATE Books
SET Category = 'History'
WHERE Publisher = 'Rupa Publications';
SET SQL_SAFE_UPDATES = 1;

SET SQL_SAFE_UPDATES = 0;
UPDATE Books
SET Book_title = REPLACE(Book_title, 'The Secret of the Nagas', 'The history of nagas')
WHERE Book_title LIKE '%secret%';
SET SQL_SAFE_UPDATES = 1;

SELECT * FROM Books;

-- 1. Retrieve the book title, category, and rental price of all available books
SELECT * FROM Books;
SELECT Book_title, Category, Rental_Price
FROM Books
WHERE Status = 'Available';

-- 2. List the employee names and their respective salaries in descending order of salary.
SELECT * FROM Employee;
SELECT Emp_name, Salary
FROM Employee
ORDER BY Salary DESC;

-- 3. Retrieve the book titles and the corresponding customers who have issued those books.
SELECT * FROM Books;
SELECT * FROM IssueStatus;
SELECT * FROM Customer;
SELECT B.Book_title, C.Customer_name
FROM Books B
JOIN IssueStatus I ON B.ISBN = I.Isbn_book
JOIN Customer C ON I.Issued_cust = C.Customer_Id;

-- 4. Display the total count of books in each category.
SELECT * FROM Books;
SELECT Category, COUNT(*) AS TotalCount
FROM Books
GROUP BY Category;

-- 5. Retrieve the employee names and their positions for the employees whose salaries are above Rs.50,000.
SELECT * FROM Employee;
SELECT Emp_name, Position
FROM Employee
WHERE Salary > 50000;

-- 6. List the customer names who registered before 2022-01-01 and have not issued any books yet.
SELECT * FROM Customer;
SELECT * FROM IssueStatus;
SELECT Customer_name
FROM Customer
WHERE Reg_date < '2022-01-01'
    AND Customer_Id NOT IN (
        SELECT Issued_cust
        FROM IssueStatus
    );

-- 7. Display the branch numbers and the total count of employees in each branch.
SELECT * FROM Branch;
SELECT Branch_no, employee_count AS Total_Employees
FROM Branch;

-- 8. Display the names of customers who have issued books in the month of June 2023.
SELECT * FROM Customer;
SELECT * FROM IssueStatus;
SELECT C.Customer_name
FROM Customer C
JOIN IssueStatus I ON C.Customer_Id = I.Issued_cust
WHERE EXTRACT(YEAR_MONTH FROM I.Issue_date) = '202306';

-- 9. Retrieve book_title from book table containing history.
SELECT * FROM Books;
SELECT Book_title
FROM Books
WHERE Book_title LIKE '%history%';

-- 10.Retrieve the branch numbers along with the count of employees for branches having more than 5 employees. 
SELECT * FROM Branch;
SELECT Branch_no, employee_count
FROM Branch
WHERE employee_count > 5;