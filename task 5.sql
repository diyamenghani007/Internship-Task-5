create database task5;
use task5;
create table Customers (
    CustomerID int primary key auto_increment,
    CustomerName varchar(100) not null,
    ContactNumber varchar(15),
    Email varchar(100),
    City varchar(50),
    JoinDate date
);

create table Products (
    ProductID int primary key auto_increment,
    ProductName varchar(100) not null,
    Category varchar(50),
    Price decimal(10, 2),
    StockQuantity int
);

create table Orders (
    OrderID int primary key auto_increment,
    CustomerID int,
    OrderDate date,
    TotalAmount decimal(10, 2),
    foreign key (CustomerID) references Customers(CustomerID)
);

create table OrderDetails (
    OrderDetailID int primary key auto_increment,
    OrderID int,
    ProductID int,
    Quantity int,
    Subtotal decimal(10, 2),
    foreign key (OrderID) references Orders(OrderID),
    foreign key (ProductID) references Products(ProductID)
);

insert into Customers (CustomerName, ContactNumber, Email, City, JoinDate)
values 
('Diya Menghani', '1234567890', 'diya@mail.com', 'New York', '2023-01-01'),
('Annanya Bajpai', '0987654321', 'annanya@mail.com', 'Los Angeles', '2023-02-15'),
('Anupama Sondhi', '1122334455', 'anupama@mail.com', 'Chicago', '2023-03-10'),
('Rashmi Sharma', '6677889900', 'rashmi@mail.com', 'Houston', '2023-04-20');

insert into Products (ProductName, Category, Price, StockQuantity)
values
('Laptop', 'Electronics', 800.00, 50),
('Smartphone', 'Electronics', 600.00, 100),
('Refrigerator', 'Appliances', 1200.00, 30),
('Microwave', 'Appliances', 200.00, 40),
('T-Shirt', 'Clothing', 20.00, 200),
('Jeans', 'Clothing', 50.00, 150);

insert into Orders (CustomerID, OrderDate, TotalAmount)
values 
(1, '2023-05-01', 1800.00),
(2, '2023-05-03', 600.00),
(1, '2023-05-10', 1200.00),
(3, '2023-05-15', 220.00);

insert into OrderDetails (OrderID, ProductID, Quantity, Subtotal)
values
(1, 1, 2, 1600.00),
(1, 4, 1, 200.00),
(2, 2, 1, 600.00),
(3, 3, 1, 1200.00),
(4, 5, 2, 40.00),
(4, 6, 1, 50.00);

select Customers.CustomerName, Orders.OrderDate, Orders.TotalAmount
from Customers inner join Orders on Customers.CustomerID = Orders.CustomerID;

select Customers.CustomerName, Orders.OrderID, Orders.OrderDate, Orders.TotalAmount 
from Customers left join Orders on Customers.CustomerID = Orders.CustomerID;

select Customers.CustomerName, Orders.OrderID, Orders.OrderDate, Orders.TotalAmount
from Customers right join Orders on  Customers.CustomerID = Orders.CustomerID;

select Customers.CustomerName, Orders.OrderID, Orders.OrderDate, Orders.TotalAmount
from Customers left join Orders on Customers.CustomerID = Orders.CustomerID
union
select Customers.CustomerName, Orders.OrderID, Orders.OrderDate, Orders.TotalAmount
from Customers right join Orders on Customers.CustomerID = Orders.CustomerID;

select Orders.OrderID, Customers.CustomerName, Products.ProductName, OrderDetails.Quantity, OrderDetails.Subtotal
from OrderDetails
inner join Orders on OrderDetails.OrderID = Orders.OrderID
inner join Customers on Orders.CustomerID = Customers.CustomerID
inner join Products on OrderDetails.ProductID = Products.ProductID;

select Products.ProductName, sum(OrderDetails.Quantity) as TotalOrdered
from Products left join OrderDetails on Products.ProductID = OrderDetails.ProductID
group by Products.ProductName;

select Products.ProductName, sum(OrderDetails.Subtotal) as TotalRevenue
from Products join OrderDetails on Products.ProductID = OrderDetails.ProductID
group by Products.ProductName
order by TotalRevenue desc;

select Customers.CustomerName, count(Orders.OrderID) as NumberOfOrders
from Customers join Orders on Customers.CustomerID = Orders.CustomerID
group by Customers.CustomerName
having count(Orders.OrderID) > 1;

select ProductName from Products
left join OrderDetails on Products.ProductID = OrderDetails.ProductID
where OrderDetails.ProductID is null;

select Orders.OrderID, Customers.CustomerName, Customers.City, Orders.OrderDate, Orders.TotalAmount
from Orders join Customers on Orders.CustomerID = Customers.CustomerID;

select Customers.CustomerName, max(Orders.OrderDate) as LatestOrderDate
from Customers join Orders on Customers.CustomerID = Orders.CustomerID
group by Customers.CustomerName;

select Customers.CustomerName from Customers left join Orders 
on Customers.CustomerID = Orders.CustomerID where Orders.OrderID is null;

select Products.ProductName, sum(OrderDetails.Quantity) as TotalQuantity
from Products join OrderDetails on Products.ProductID = OrderDetails.ProductID
group by Products.ProductName order by TotalQuantity desc limit 1;

select OrderDate, count(distinct CustomerID) as TotalCustomers, sum(TotalAmount) as TotalSales
from Orders group by OrderDate order by OrderDate;



