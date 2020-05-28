-- Multi-Table Query Practice

-- Display the ProductName and CategoryName for all products in the database. Shows 77 records.

 select productname, categoryname 
 from product
 inner join category on category.id = product.categoryid


-- Display the order Id and shipper CompanyName for all orders placed before August 9 2012. Shows 429 records.

select shipvia, companyname
from [order]
inner join shipper on shipper.id = [order].shipvia
where [order].orderdate < date(`2012-08-09`)

-- Display the name and quantity of the products ordered in order with Id 10251. Sort by ProductName. Shows 3 records.

select productname, quantity 
from product
inner join orderdetail on orderdetail.productid = product.id
where orderdetail.orderid = 10251
order by product.ProductName 

-- Display the OrderID, Customer's Company Name and the employee's LastName for every order. All columns should be labeled clearly. Displays 16,789 records.

SELECT
    id AS [Order ID],
    customer.CompanyName AS [Company Name],
    employee.lastname AS [Employee Last Name]

FROM
    [order]
    INNER JOIN customer ON customer.id = [order].customerid
    INNER JOIN employee ON employee.id = [order].EmployeeId