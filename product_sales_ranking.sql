create database customers;

-- Top 3 Selling Products by Category

-- This SQL script identifies the top 3 selling products in each category.
-- It uses a RIGHT JOIN to include all products, even if they have no sales.
-- The results are ranked by the total quantity sold in descending order.

-- Part of the "MSSQL-Project-Portfolio" educational repository, available for free for a limited time.



use customers;

CREATE TABLE customers (
  customer_id INT AUTO_INCREMENT,
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  email VARCHAR(100) UNIQUE NOT NULL,
  phone VARCHAR(20),
  address VARCHAR(255),
  city VARCHAR(50),
  state VARCHAR(50),
  postal_code VARCHAR(10),
  country VARCHAR(50),
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (customer_id)
);

CREATE TABLE orders (
  order_id INT AUTO_INCREMENT,
  customer_id INT NOT NULL,
  order_date DATE NOT NULL,
  total DECIMAL(10, 2) NOT NULL,
  status ENUM('pending', 'shipped', 'delivered', 'cancelled') NOT NULL DEFAULT 'pending',
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (order_id),
  FOREIGN KEY (customer_id) REFERENCES customers (customer_id)
);

CREATE TABLE products (
  product_id INT AUTO_INCREMENT,
  product_name VARCHAR(100) NOT NULL,
  description TEXT,
  price DECIMAL(10, 2) NOT NULL,
  stock_quantity INT NOT NULL DEFAULT 0,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (product_id)
);

CREATE TABLE order_details (
  order_detail_id INT AUTO_INCREMENT,
  order_id INT NOT NULL,
  product_id INT NOT NULL,
  quantity INT NOT NULL,
  unit_price DECIMAL(10, 2) NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (order_detail_id),
  FOREIGN KEY (order_id) REFERENCES orders (order_id),
  FOREIGN KEY (product_id) REFERENCES products (product_id)
);


-- And here are some insert statements-- :


INSERT INTO customers (first_name, last_name, email, phone, address, city, state, postal_code, country)
VALUES
('John', 'Doe', 'john.doe@example.com', '123-456-7890', '123 Main St', 'Anytown', 'CA', '12345', 'USA'),
('Jane', 'Smith', 'jane.smith@example.com', '987-654-3210', '456 Elm St', 'Othertown', 'NY', '67890', 'USA');

INSERT INTO orders (customer_id, order_date, total, status)
VALUES
(1, '2022-01-01', 100.00, 'pending'),
(2, '2022-01-15', 200.00, 'shipped');

INSERT INTO products (product_name, description, price, stock_quantity)
VALUES
('Product A', 'This is product A', 20.00, 10),
('Product B', 'This is product B', 30.00, 20),
('Product C', 'This is product C', 40.00, 30);

INSERT INTO order_details (order_id, product_id, quantity, unit_price)
VALUES
(1, 1, 2, 20.00),
(1, 2, 1, 30.00),
(2, 3, 3, 40.00);

-- here

INSERT INTO Customers (Customer_ID, First_Name, Last_Name, Email, Phone, Address,city,postal_code,country)
VALUES
(101, 'John', 'Doe', 'john.doe@example.com', '123-456-7890', '123 Main St'),
(102, 'Jane', 'Smith', 'jane.smith@example.com', '987-654-3210', '456 Elm St'),
(103, 'Bob', 'Johnson', 'bob.johnson@example.com', '555-123-4567', '789 Oak St'),
(104, 'Alice', 'Williams', 'alice.williams@example.com', '901-234-5678', '321 Maple St'),
(105, 'Mike', 'Davis', 'mike.davis@example.com', '111-222-3333', '901 Broadway'),
(150, 'Emily', 'Chen', 'emily.chen@example.com', '555-901-2345', '456 Pine St');


-- Orders:
select * from Orders;

INSERT INTO Orders (Order_ID, Customer_ID, Order_Date, Total,status)
VALUES
(101, 101, '2022-01-01', 100.00),
(102, 102, '2022-01-15', 200.00),
(103, 103, '2022-02-01', 50.00),
(104, 104, '2022-03-01', 150.00),
(105, 105, '2022-04-01', 250.00),
(150, 150, '2022-12-31', 500.00);


-- Products:

INSERT INTO Products (ProductID, ProductName, Description, Price)
VALUES
(101, 'Smartphone', 'Latest smartphone model', 500.00),
(102, 'Laptop', 'High-performance laptop', 1000.00),
(103, 'Tablet', 'Portable tablet device', 200.00),
(104, 'Headphones', 'Wireless headphones', 50.00),
(105, 'Speakers', 'Portable Bluetooth speakers', 100.00),
(120, 'Gaming Console', 'Latest gaming console', 400.00);


-- OrderDetails:-- 

INSERT INTO OrderDetails (OrderDetailID, OrderID, ProductID, Quantity)
VALUES
(101, 101, 101, 2),
(102, 101, 102, 1),
(103, 102, 103, 3),
(104, 103, 101, 1),
(105, 104, 104, 2),
(250, 150, 120, 1);

select * from customers;


INSERT INTO customers (customer_id, first_name, last_name, email, phone, address, city, state, postal_code, country)
VALUES
(101, 'Phone', 'Doe', 'joh.oe@example.com', '103-456-7890', '13 Main St', 'Anytown', 'CA', '12345', 'USA'),
(102, 'Jaan', 'Smith', 'jaan.smith@example.com', '907-654-3210', '46 Elm St', 'Othertown', 'NY', '67890', 'USA'),
(103, 'Bob', 'Johnson', 'bob.johnson@example.com', '505-123-4567', '789 Oak St', 'Anytown', 'CA', '12345', 'USA'),
(104, 'Alice', 'Williams', 'alice.williams@example.com', '901-234-5678', '321 Maple St', 'Othertown', 'NY', '67890', 'USA'),
(105, 'Mike', 'Davis', 'mike.davis@example.com', '111-222-3333', '901 Broadway', 'Anytown', 'CA', '12345', 'USA'),
(106, 'Emily', 'Chen', 'emily.chen@example.com', '555-901-2345', '456 Pine St', 'Othertown', 'NY', '67890', 'USA'),
(107, 'David', 'Lee', 'david.lee@example.com', '777-888-9999', '789 Cedar St', 'Anytown', 'CA', '12345', 'USA'),
(108, 'Sarah', 'Taylor', 'sarah.taylor@example.com', '999-000-1111', '321 Walnut St', 'Othertown', 'NY', '67890', 'USA'),
(109, 'Kevin', 'White', 'kevin.white@example.com', '111-111-1111', '901 Oak St', 'Anytown', 'CA', '12345', 'USA'),
(110, 'Olivia', 'Martin', 'olivia.martin@example.com', '222-222-2222', '456 Maple St', 'Othertown', 'NY', '67890', 'USA'),
(111, 'William', 'Harris', 'william.harris@example.com', '333-333-3333', '789 Pine St', 'Anytown', 'CA', '12345', 'USA'),
(112, 'Ava', 'Thompson', 'ava.thompson@example.com', '444-444-4444', '321 Spruce St', 'Othertown', 'NY', '67890', 'USA'),
(113, 'Jackson', 'Walker', 'jackson.walker@example.com', '555-555-5555', '901 Cedar St', 'Anytown', 'CA', '12345', 'USA'),
(114, 'Sophia', 'Hall', 'sophia.hall@example.com', '666-666-6666', '456 Elm St', 'Othertown', 'NY', '67890', 'USA'),
(115, 'Mason', 'Allen', 'mason.allen@example.com', '777-777-7777', '789 Oak St', 'Anytown', 'CA', '12345', 'USA'),
(116, 'Isabella', 'Scott', 'isabella.scott@example.com', '888-888-8888', '321 Maple St', 'Othertown', 'NY', '67890', 'USA'),
(117, 'Ethan', 'Coleman', 'ethan.coleman@example.com', '999-999-9999', '901 Broadway', 'Anytown', 'CA', '12345', 'USA'),
(118, 'Charlotte', 'Simmons', 'charlotte.simmons@example.com', '000-000-0000', '456 Pine St', 'Othertown', 'NY', '67890', 'USA'),
(119, 'Logan', 'Baker', 'logan.baker@example.com', '111-111-1112', '789 Cedar St', 'Anytown', 'CA', '12345', 'USA'),
(120, 'Amelia', 'Rivera', 'amelia.rivera@example.com', '222-222-2223', '321 Walnut St', 'Othertown', 'NY', '67890', 'USA'),
(121, 'Alexander', 'Walker', 'alexander.walker@example.com', '333-333-3334', '901 Oak St', 'Anytown', 'CA', '12345', 'USA'),
(122, 'Harper', 'Jackson', 'harper.jackson@example.com', '333-333-3314','901 Oak St','Anytown','CA','12345','USA');


INSERT INTO orders (order_id, customer_id, order_date, total, status)
VALUES
(101, 101, '2022-01-01', 100.00, 'pending');
INSERT INTO orders (order_id, customer_id, order_date, total, status)
VALUES
(102, 102, '2022-01-15', 200.00, 'shipped'),
(103, 103, '2022-02-01', 50.00, 'delivered'),
(104, 104, '2022-03-01', 150.00, 'pending'),
(105, 105, '2022-04-01', 250.00, 'shipped');
INSERT INTO orders (order_id, customer_id, order_date, total, status)
VALUES
(106, 106, '2022-05-01', 300.00, 'delivered'),
(107, 107, '2022-06-01', 400.00, 'pending'),
(108, 108, '2022-07-01', 500.00, 'shipped'),
(109, 109, '2022-08-01', 600.00, 'delivered'),
(110, 110, '2022-09-01', 700.00, 'pending'),
(111, 111, '2022-10-01', 800.00, 'shipped'),
(112, 112, '2022-11-01', 900.00, 'delivered'),
(113, 113, '2022-12-01', 1000.00, 'pending'),
(114, 114, '2023-01-01', 1100.00, 'shipped'),
(115, 115, '2023-02-01', 1200.00, 'delivered'),
(116, 116, '2023-03-01', 1300.00, 'pending'),
(117, 117, '2023-04-01', 1400.00, 'shipped'),
(118, 118, '2023-05-01', 1500.00, 'delivered'),
(119, 119, '2023-06-01', 1600.00, 'pending'),
(120, 120, '2023-07-01', 1700.00, 'shipped'),
(121, 121, '2023-08-01', 1800.00, 'delivered'),
(122, 122, '2023-09-01', 1900.00, 'pending');

INSERT INTO orders (order_id, customer_id, order_date, total, status)
VALUES
(123, 123, '2023-10-01', 2000.00, 'shipped'),
(124, 124, '2023-11-01', 2100.00, 'delivered'),
(125, 125, '2023-12-01', 2200.00, 'pending'),
(126, 126, '2024-01-01', 2300.00, 'shipped'),
(127, 127, '2024-02-01', 2400.00, 'delivered'),
(128, 128, '2024-03-01', 2500.00, 'pending'),
(129, 129, '2024-04-01', 2600.00, 'shipped'),
(130, 130, '2024-05-01', 2700.00, 'delivered'),
(131, 131, '2024-06-01', 2800.00, 'pending'),
(132, 132, '2024-07-01', 2900.00, 'shipped'),
(133, 133, '2024-08-01', 3000.00, 'delivered'),
(134, 134, '2024-09-01', 3100.00, 'pending'),
(135, 135, '2024-10-01', 3200.00, 'shipped'),
(136, 136, '2024-11-01', 3300.00, 'delivered'),
(137, 137, '2024-12-01', 3400.00, 'pending'),
(138, 138, '2025-01-01', 3500.00, 'shipped'),
(139, 139, '2025-02-01', 3600.00, 'delivered'),
(140, 140, '2025-03-01', 3700.00, 'pending'),
(141, 141, '2025-04-01', 3800.00, 'shipped'),
(142, 142, '2025-05-01', 3900.00, 'delivered');


INSERT INTO products (product_id, product_name, description, price, stock_quantity)
VALUES
(101, 'Smartphone', 'Latest smartphone model', 500.00, 100),
(102, 'Laptop', 'High-performance laptop', 1000.00, 50),
(103, 'Tablet', 'Portable tablet device', 200.00, 200),
(104, 'Headphones', 'Wireless headphones', 50.00, 500),
(105, 'Speakers', 'Portable Bluetooth speakers', 100.00, 300),
(106, 'Gaming Console', 'Latest gaming console', 400.00, 150),
(107, 'Smartwatch', 'Fitness tracking smartwatch', 150.00, 250),
(108, 'Power Bank', 'Portable power bank', 20.00, 1000),
(109, 'Wireless Charger', 'Fast wireless charger', 30.00, 500),
(110, 'Phone Case', 'Protective phone case', 10.00, 2000),
(111, 'Screen Protector', 'Tempered glass screen protector', 5.00, 3000),
(112, 'Earbuds', 'Wireless earbuds', 25.00, 1500),
(113, 'Portable Hard Drive', 'External portable hard drive', 80.00, 100),
(114, 'Printer', 'Inkjet printer', 50.00, 200),
(115, 'Scanner', 'Document scanner', 30.00, 150),
(116, 'Webcam', 'HD webcam', 20.00, 500),
(117, 'Microphone', 'USB microphone', 15.00, 1000),
(118, 'Keyboard', 'Wireless keyboard', 25.00, 2000),
(119, 'Mouse', 'Wireless mouse', 10.00, 3000),
(120, 'Monitor', 'LED monitor', 100.00, 50),
(121, 'CPU', 'Gaming CPU', 200.00, 20),
(122, 'GPU', 'Gaming GPU', 300.00, 15);

INSERT INTO products (product_id, product_name, description, price, stock_quantity)
VALUES
(123, 'RAM', '16GB RAM', 50.00, 100),
(124, 'Motherboard', 'Gaming motherboard', 150.00, 20),
(125, 'Storage', '1TB SSD', 100.00, 50),
(126, 'Power Supply', '650W power supply', 80.00, 20),
(127, 'Case', 'Gaming case', 50.00, 50),
(128, 'Cooling', 'Liquid cooling system', 100.00, 10),
(129, 'Optical Drive', 'DVD writer', 20.00, 100),
(130, 'Sound Card', 'External sound card', 30.00, 50),
(131, 'Network Card', 'Wireless network card', 25.00, 100),
(132, 'Graphics Card', 'Gaming graphics card', 200.00, 20),
(133, 'Hard Drive', '2TB hard drive', 80.00, 50),
(134, 'SSD', '512GB SSD', 50.00, 100),
(135, 'Motherboard Stand', 'Motherboard stand', 10.00, 200),
(136, 'Cable Management', 'Cable management kit', 20.00, 100),
(137, 'Thermal Paste', 'Thermal paste', 5.00, 500),
(138, 'CPU Cooler', 'CPU cooler', 30.00, 50),
(139, 'Case Fans', 'Case fans', 20.00, 100),
(140, 'Power Cables', 'Power cables', 10.00, 200),
(141, 'SATA Cables', 'SATA cables', 5.00, 500),
(142, 'HDMI Cables', 'HDMI cables', 10.00, 200),
(143, 'DisplayPort Cables', 'DisplayPort cables', 15.00, 100),
(144, 'USB Cables', 'USB cables', 5.00, 500),
(145, 'Ethernet Cables', 'Ethernet cables', 10.00, 200),
(146, 'Wireless Adapters', 'Wireless adapters', 20.00, 100),
(147, 'Bluetooth Adapters', 'Bluetooth adapters', 15.00, 150);




INSERT INTO order_details (order_detail_id, order_id, product_id, quantity, unit_price)
VALUES
(101, 101, 101, 2, 500.00),
(102, 101, 102, 1, 1000.00),
(103, 102, 103, 3, 200.00),
(104, 103, 101, 1, 500.00),
(105, 104, 104, 2, 50.00),
(106, 105, 105, 1, 100.00),
(107, 106, 106, 2, 400.00),
(108, 107, 107, 1, 150.00),
(109, 108, 108, 3, 20.00),
(110, 109, 109, 2, 30.00),
(111, 110, 110, 1, 10.00),
(112, 111, 111, 2, 5.00),
(113, 112, 112, 3, 25.00),
(114, 113, 113, 1, 80.00),
(115, 114, 114, 2, 50.00),
(116, 115, 115, 1, 30.00),
(117, 116, 116, 3, 20.00),
(118, 117, 117, 2, 15.00),
(119, 118, 118, 1, 25.00),
(120, 119, 119, 2, 10.00),
(121, 120, 120, 3, 100.00),
(122, 121, 121, 1, 200.00);
INSERT INTO order_details (order_detail_id, order_id, product_id, quantity, unit_price)
VALUES
(123, 122, 122, 2, 300.00),
(124, 123, 123, 1, 50.00),
(125, 124, 124, 3, 150.00),
(126, 125, 125, 2, 100.00),
(127, 126, 126, 1, 80.00),
(128, 127, 127, 2, 50.00),
(129, 128, 128, 3, 30.00),
(130, 129, 129, 1, 20.00),
(131, 130, 130, 2, 15.00),
(132, 131, 131, 1, 25.00),
(133, 132, 132, 3, 10.00),
(134, 133, 133, 2, 5.00),
(135, 134, 134, 1, 25.00),
(136, 135, 135, 2, 10.00),
(137, 136, 136, 3, 15.00),
(138, 137, 137, 1, 20.00),
(139, 138, 138, 2, 30.00),
(140, 139, 139, 1, 50.00),
(141, 140, 140, 3, 100.00),
(142, 141, 141, 2, 200.00),
(143, 142, 142, 1, 300.00),
(144, 143, 143, 2, 50.00),
(145, 144, 144, 3, 150.00),
(146, 145, 145, 1, 100.00),
(147, 146, 146, 2, 80.00),
(148, 147, 147, 1, 50.00),
(149, 148, 148, 3, 30.00),
(150, 149, 149, 2, 20.00);

select * from order_details;

-- i want yo identify top 3 selling product in each category
CREATE TABLE customer_purchases (
  customer_id INT,
  product_id INT,
  quantity INT,
  PRIMARY KEY (customer_id, product_id)
);

INSERT INTO customer_purchases (customer_id, product_id, quantity)
VALUES
(101, 101, 2),
(102, 102, 1),
(103, 103, 3),
(104, 104, 2),
(105, 105, 1),
(106, 106, 2),
(107, 107, 1),
(108, 108, 3),
(109, 109, 2),
(110, 110, 1),
(111, 101, 2),
(112, 102, 1),
(113, 103, 3),
(114, 104, 2),
(115, 105, 1),
(116, 106, 2),
(117, 107, 1),
(118, 108, 3),
(119, 109, 2),
(120, 110, 1);

CREATE TABLE customer_returns (
  return_id INT AUTO_INCREMENT,
  customer_id INT,
  product_id INT,
  return_date DATE,
  return_reason VARCHAR(255),
  PRIMARY KEY (return_id)
);

INSERT INTO customer_returns (customer_id, product_id, return_date, return_reason)
VALUES
(101, 101, '2022-01-15', 'Defective product'),
(102, 102, '2022-02-01', 'Wrong item received'),
(103, 103, '2022-03-01', 'Product did not fit'),
(104, 104, '2022-04-01', 'Changed mind'),
(105, 105, '2022-05-01', 'Defective product'),
(106, 106, '2022-06-01', 'Wrong item received'),
(107, 107, '2022-07-01', 'Product did not fit'),
(108, 108, '2022-08-01', 'Changed mind'),
(109, 109, '2022-09-01', 'Defective product'),
(110, 110, '2022-10-01', 'Wrong item received'),
(111, 101, '2022-11-01', 'Product did not fit'),
(112, 102, '2022-12-01', 'Changed mind'),
(113, 103, '2023-01-01', 'Defective product'),
(114, 104, '2023-02-01', 'Wrong item received'),
(115, 105, '2023-03-01', 'Product did not fit'),
(116, 106, '2023-04-01', 'Changed mind'),
(117, 107, '2023-05-01', 'Defective product'),
(118, 108, '2023-06-01', 'Wrong item received'),
(119, 109, '2023-07-01', 'Product did not fit'),
(120, 110, '2023-08-01', 'Changed mind');

use customers;

select * from customer_purchases;



-- I want to identify top 3 selling products in each category(product_name),categary_id(product_id)
-- when every product is sold you use inner join
-- we don't know this right
with cte as(
select p.product_id,p.product_name,
count(p.product_id) as contofproducts,
sum(quantity) as item_sold from customer_purchases c 
right join products p
on c.product_id=p.product_id
group by p.product_id,p.product_name
)

select product_id,item_sold,dense_rank()over(partition by product_id order by item_sold desc) as rnk 
from cte where dense_rank()over(partition by product_id order by item_sold desc)<=3; -- sql


-- select * from cte1 where (dense_rank()over(partition by product_id order by item_sold desc)<=3;





select p.product_id,p.product_name,
count(p.product_id) as contofproducts,
sum(quantity) as item_sold from customer_purchases c 
right join products p
on c.product_id=p.product_id
group by p.product_id,p.product_name
order by item_sold desc limit 3;
