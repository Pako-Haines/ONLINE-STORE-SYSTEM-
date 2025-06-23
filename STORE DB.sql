-- Written By: PAKO HAINES BALEFI, MAY 2024 --

-- Drop existing tables and types if they exist --

DROP TABLE Orders CASCADE CONSTRAINTS;
DROP TABLE Payments CASCADE CONSTRAINTS;
DROP TABLE Customers CASCADE CONSTRAINTS;
DROP TABLE Staff CASCADE CONSTRAINTS;
DROP TABLE Products CASCADE CONSTRAINTS;
DROP TABLE Categories CASCADE CONSTRAINTS;
DROP TABLE Stores CASCADE CONSTRAINTS;
DROP TYPE ReviewType FORCE;
DROP TYPE SupplierType FORCE;
DROP TYPE OrderItemType FORCE;
DROP TYPE ShipmentType FORCE;
DROP TYPE PaymentType FORCE;
DROP TYPE PersonType FORCE;
DROP TYPE CustomerType FORCE;
DROP TYPE StaffType FORCE;


-- Create types for complex attributes --
CREATE TYPE ReviewType AS OBJECT (
    reviewer VARCHAR2(100),
    rating NUMBER,
    comments VARCHAR2(1000),
    reviewDate DATE
);
/

CREATE TYPE SupplierType AS OBJECT (
    name VARCHAR2(100),
    contactInfo VARCHAR2(100)
);
/

CREATE TYPE OrderItemType AS OBJECT (
    productID VARCHAR2(10),
    quantity NUMBER,
    price NUMBER
);
/

CREATE TYPE ShipmentType AS OBJECT (
    shipmentID VARCHAR2(10),
    address VARCHAR2(255),
    shippedDate DATE,
    expectedDeliveryDate DATE
);
/

CREATE TYPE PaymentType AS OBJECT (
    paymentID VARCHAR2(10),
    amount NUMBER,
    paymentDate DATE,
    paymentMethod VARCHAR2(50)
);
/

CREATE TYPE PersonType AS OBJECT (
    personID VARCHAR2(10),
    name VARCHAR2(100),
    address VARCHAR2(255),
    phoneNumber VARCHAR2(20)
) NOT FINAL;
/

CREATE TYPE CustomerType UNDER PersonType (
    customerID VARCHAR2(10),
    contactInfo VARCHAR2(100)
);
/

CREATE TYPE StaffType UNDER PersonType (
    employeeID VARCHAR2(10),
    positions VARCHAR2(50),
    schedule VARCHAR2(50)
);
/

-- Create tables --
CREATE TABLE Categories (
    categoryID VARCHAR2(10) PRIMARY KEY,
    categoryName VARCHAR2(100) NOT NULL
);

CREATE TABLE Products (
    productID VARCHAR2(10) PRIMARY KEY,
    names VARCHAR2(100) NOT NULL,
    descriptions VARCHAR2(1000),
    price NUMBER NOT NULL,
    stockLevel NUMBER NOT NULL,
    categoryID VARCHAR2(10),
    reviews ReviewType,
    suppliers SupplierType,
    CONSTRAINT fk_categories FOREIGN KEY (categoryID) REFERENCES Categories (categoryID)
);

CREATE TABLE Customers OF CustomerType (
    PRIMARY KEY (customerID)
) OBJECT IDENTIFIER IS PRIMARY KEY;

CREATE TABLE Staff OF StaffType (
    PRIMARY KEY (personID)
) OBJECT IDENTIFIER IS PRIMARY KEY;

CREATE TABLE Orders (
    orderID VARCHAR2(10) PRIMARY KEY,
    orderDate DATE NOT NULL,
    customerID VARCHAR2(10),
    items OrderItemType,
    totalAmount NUMBER NOT NULL,
    shipment ShipmentType,
    payment PaymentType,
    CONSTRAINT fk_customer FOREIGN KEY (customerID) REFERENCES Customers (customerID)
);

CREATE TABLE Payments (
    paymentID VARCHAR2(10) PRIMARY KEY,
    amount NUMBER NOT NULL,
    paymentDate DATE NOT NULL,
    paymentMethod VARCHAR2(50) NOT NULL,
    orderID VARCHAR2(10),
    CONSTRAINT fk_order FOREIGN KEY (orderID) REFERENCES Orders (orderID)
);

CREATE TABLE Stores (
    storeID VARCHAR2(10) PRIMARY KEY,
    names VARCHAR2(100) NOT NULL,
    address VARCHAR2(255) NOT NULL,
    inventory VARCHAR2(50),
    staff VARCHAR2(10)
);

-- Insert sample data --
INSERT INTO Categories (categoryID, categoryName) VALUES ('cat1', 'Books');
INSERT INTO Categories (categoryID, categoryName) VALUES ('cat2', 'Electronics');
INSERT INTO Categories (categoryID, categoryName) VALUES ('cat3', 'Clothing');
INSERT INTO Categories (categoryID, categoryName) VALUES ('cat4', 'Home & Kitchen');
INSERT INTO Categories (categoryID, categoryName) VALUES ('cat5', 'Toys');

INSERT INTO Products (productID, names, descriptions, price, stockLevel, categoryID) 
VALUES ('prod1', 'The Great Gatsby', 'A classic novel', 10.99, 100, 'cat1');
INSERT INTO Products (productID, names, descriptions, price, stockLevel, categoryID) 
VALUES ('prod2', 'Smartphone', 'Latest model', 299.99, 50, 'cat2');
INSERT INTO Products (productID, names, descriptions, price, stockLevel, categoryID) 
VALUES ('prod3', 'T-shirt', 'Cotton T-shirt', 15.99, 200, 'cat3');
INSERT INTO Products (productID, names, descriptions, price, stockLevel, categoryID) 
VALUES ('prod4', 'Blender', 'Kitchen blender', 49.99, 30, 'cat4');
INSERT INTO Products (productID, names, descriptions, price, stockLevel, categoryID) 
VALUES ('prod5', 'Lego Set', 'Building blocks', 39.99, 80, 'cat5');
INSERT INTO Products (productID, names, descriptions, price, stockLevel, categoryID) 
VALUES ('prod6', 'Headphones', 'Noise-cancelling', 89.99, 60, 'cat2');
INSERT INTO Products (productID, names, descriptions, price, stockLevel, categoryID) 
VALUES ('prod7', 'Jeans', 'Denim jeans', 29.99, 150, 'cat3');
INSERT INTO Products (productID, names, descriptions, price, stockLevel, categoryID) 
VALUES ('prod8', 'Microwave', 'Compact microwave', 79.99, 20, 'cat4');
INSERT INTO Products (productID, names, descriptions, price, stockLevel, categoryID) 
VALUES ('prod9', 'Toy Car', 'Remote-controlled car', 24.99, 90, 'cat5');
INSERT INTO Products (productID, names, descriptions, price, stockLevel, categoryID) 
VALUES ('prod10', 'Laptop', 'High-performance laptop', 999.99, 15, 'cat2');

INSERT INTO Customers VALUES (CustomerType('person1', 'John Doe', '123 Main St, Anytown, CA 12345', '123-456-7890', 'cust1', 'john@example.com'));
INSERT INTO Customers VALUES (CustomerType('person2', 'Jane Roe', '4564 DA St, Dallas, DA 76453', '987-455-3410', 'cust2', 'jane@example.com'));
INSERT INTO Customers VALUES (CustomerType('person3', 'Pako BA', '45 OLA St, Oliver, OLA 76543', '987-623-3510', 'cust3', 'pako@example.com'));
INSERT INTO Customers VALUES (CustomerType('person4', 'Lefika TT', '45690 LAM St, Las Vegas, LAM 87654', '987-345-3210', 'cust4', 'lefika@example.com'));
INSERT INTO Customers VALUES (CustomerType('person5', 'Janki MO', '23 PIN St, Pine, PIN 67543', '987-654-3222', 'cust5', 'jani@example.com'));
INSERT INTO Customers VALUES (CustomerType('person6', 'Tonderai BA', '019 FIN St, Finland, FIN 87654', '987-654-3120', 'cust6', 'tonderai@example.com'));
INSERT INTO Customers VALUES (CustomerType('person7', 'Nonofo TH', '2828 KILL St, Gotham, KILL 76555', '987-654-4510', 'cust7', 'nonofo@example.com'));
INSERT INTO Customers VALUES (CustomerType('person8', 'Roy TH', '988 HILL St, Hillbrow, HILL 23676', '987-654-3200', 'cust8', 'roy@example.com'));
INSERT INTO Customers VALUES (CustomerType('person9', 'Kef MA', '4443 ABC St, Alphabet, ABC 23546', '987-654-3345', 'cust9', 'kef@example.com'));
INSERT INTO Customers VALUES (CustomerType('person10', 'Oats GA', '425 UCT St, UCT Town, UCT 67', '987-654-3123', 'cust10', 'oats@example.com'));

INSERT INTO Staff VALUES (StaffType('person11', 'Alice Johnson', '789 Elm St, Bigcity, NY 10101', '111-222-3333', 'emp1', 'Manager', 'Mon-Fri: 9:00-17:00'));
INSERT INTO Staff VALUES (StaffType('person12', 'Bob Brown', '987 Pine St, Midtown, AL 54321', '444-555-6666', 'emp2', 'Sales', 'Mon-Fri: 9:00-17:00'));
INSERT INTO Staff VALUES (StaffType('person13', 'Jen ABC', '932 Psa St, Ytown, DL 54321', '444-455-6566', 'emp3', 'Sales', 'Mon-Fri: 9:00-17:00'));
INSERT INTO Staff VALUES (StaffType('person14', 'Lewa Doski', '023 Pil St, Firetown, QP 57621', '324-545-3266', 'emp4', 'Sales', 'Mon-Fri: 9:00-17:00'));
INSERT INTO Staff VALUES (StaffType('person15', 'Pablo Gavi', '234 Jin St, Smalltown, LP 54741', '444-525-3236', 'emp5', 'Sales', 'Mon-Fri: 9:00-17:00'));

INSERT INTO Orders (orderID, orderDate, customerID, items, totalAmount, shipment, payment)
VALUES ('order1', SYSDATE, 'cust1', OrderItemType('prod1', 2, 10.99), 21.98, ShipmentType('sh1', '123 Main St, Anytown, CA 12345', SYSDATE, SYSDATE + 3), PaymentType('pay1', 21.98, SYSDATE, 'Credit Card'));

INSERT INTO Orders (orderID, orderDate, customerID, items, totalAmount, shipment, payment)
VALUES ('order2', SYSDATE, 'cust2', OrderItemType('prod2', 1, 299.99), 299.99, ShipmentType('sh2','4564 DA St, Dallas, DA 76453', SYSDATE, SYSDATE + 3), PaymentType('pay2', 299.99, SYSDATE, 'Debit Card'));

INSERT INTO Orders (orderID, orderDate, customerID, items, totalAmount, shipment, payment)
VALUES ('order3', SYSDATE, 'cust1', OrderItemType('prod3', 3, 15.99), 47.97, ShipmentType('sh3','123 Main St, Anytown, CA 12345', SYSDATE, SYSDATE + 3), PaymentType('pay3', 47.97, SYSDATE, 'PayPal')
);

INSERT INTO Orders (orderID, orderDate, customerID, items, totalAmount, shipment, payment)
VALUES ('order4', SYSDATE, 'cust2', OrderItemType('prod4', 1, 49.99), 49.99, ShipmentType('sh4','4564 DA St, Dallas, DA 76453', SYSDATE, SYSDATE + 3), PaymentType('pay4', 49.99, SYSDATE, 'Credit Card')
);

INSERT INTO Orders (orderID, orderDate, customerID, items, totalAmount, shipment, payment)
VALUES ('order5', SYSDATE, 'cust3', OrderItemType('prod5', 4, 39.99), 159.96, ShipmentType('sh5','45 OLA St, Oliver, OLA 76543', SYSDATE, SYSDATE + 3), PaymentType('pay5', 159.96, SYSDATE, 'Cash')
);

INSERT INTO Orders (orderID, orderDate, customerID, items, totalAmount, shipment, payment)
VALUES ('order6', SYSDATE, 'cust4', OrderItemType('prod6', 2, 89.99), 179.98, ShipmentType('sh6','45690 LAM St, Las Vegas, LAM 87654', SYSDATE, SYSDATE + 3), PaymentType('pay6', 179.98, SYSDATE, 'Credit Card')
);

INSERT INTO Orders (orderID, orderDate, customerID, items, totalAmount, shipment, payment)
VALUES ('order7', SYSDATE, 'cust5', OrderItemType('prod7', 5, 29.99), 149.95, ShipmentType('sh7','23 PIN St, Pine, PIN 67543', SYSDATE, SYSDATE + 3), PaymentType('pay7', 149.95, SYSDATE, 'Debit Card')
);

INSERT INTO Orders (orderID, orderDate, customerID, items, totalAmount, shipment, payment)
VALUES ('order8', SYSDATE, 'cust6', OrderItemType('prod8', 1, 79.99), 79.99, ShipmentType('sh8','019 FIN St, Finland, FIN 87654', SYSDATE, SYSDATE + 3), PaymentType('pay8', 79.99, SYSDATE, 'Credit Card')
);

INSERT INTO Orders (orderID, orderDate, customerID, items, totalAmount, shipment, payment)
VALUES ('order9', SYSDATE, 'cust7', OrderItemType('prod9', 3, 24.99), 74.97, ShipmentType('sh9','2828 KILL St, Gotham, KILL 76555', SYSDATE, SYSDATE + 3), PaymentType('pay9', 74.97, SYSDATE, 'PayPal')
);

INSERT INTO Orders (orderID, orderDate, customerID, items, totalAmount, shipment, payment)
VALUES ('order10', SYSDATE, 'cust8', OrderItemType('prod10', 1, 999.99), 999.99, ShipmentType('sh10','988 HILL St, Hillbrow, HILL 23676', SYSDATE, SYSDATE + 3), PaymentType('pay10', 999.99, SYSDATE, 'Credit Card')
);


INSERT INTO Payments (paymentID, amount, paymentDate, paymentMethod, orderID) 
VALUES ('pay1', 21.98, SYSDATE, 'Credit Card', 'order1');

INSERT INTO Payments (paymentID, amount, paymentDate, paymentMethod, orderID) 
VALUES ('pay2', 299.99, SYSDATE, 'Debit Card', 'order2');

INSERT INTO Payments (paymentID, amount, paymentDate, paymentMethod, orderID) 
VALUES ('pay3', 47.97, SYSDATE, 'PayPal', 'order3');

INSERT INTO Payments (paymentID, amount, paymentDate, paymentMethod, orderID) 
VALUES ('pay4', 49.99, SYSDATE, 'Credit Card', 'order4');

INSERT INTO Payments (paymentID, amount, paymentDate, paymentMethod, orderID) 
VALUES ('pay5', 159.96, SYSDATE, 'Cash', 'order5');

INSERT INTO Payments (paymentID, amount, paymentDate, paymentMethod, orderID) 
VALUES ('pay6', 179.98, SYSDATE, 'Credit Card', 'order6');

INSERT INTO Payments (paymentID, amount, paymentDate, paymentMethod, orderID) 
VALUES ('pay7', 149.95, SYSDATE, 'Debit Card', 'order7');

INSERT INTO Payments (paymentID, amount, paymentDate, paymentMethod, orderID) 
VALUES ('pay8', 79.99, SYSDATE, 'Credit Card', 'order8');

INSERT INTO Payments (paymentID, amount, paymentDate, paymentMethod, orderID) 
VALUES ('pay9', 74.97, SYSDATE, 'PayPal', 'order9');

INSERT INTO Payments (paymentID, amount, paymentDate, paymentMethod, orderID) 
VALUES ('pay10', 999.99, SYSDATE, 'Credit Card', 'order10');


INSERT INTO Stores (storeID, names, address, inventory, staff) 
VALUES ('store1', 'Main Store', '789 Elm St, Maincity, NY 10101', 'prod1,prod2', 'emp1');
INSERT INTO Stores (storeID, names, address, inventory, staff) 
VALUES ('store2', 'Branch Store1', '789 Br1 St, Br1city, NY 10231', 'prod3,prod4,', 'emp2');
INSERT INTO Stores (storeID, names, address, inventory, staff) 
VALUES ('store3', 'Branch Store2', '987 Br2 St, Br2town, BR 54231', 'prod5,prod6', 'emp3');
INSERT INTO Stores (storeID, names, address, inventory, staff) 
VALUES ('store4', 'Branch Store3', '789 Br3 St, Br4city, BR 10321', 'prod7,prod8', 'emp4');
INSERT INTO Stores (storeID, names, address, inventory, staff) 
VALUES ('store5', 'Branch Store4', '987 Br4 St, Br4town, BR 53541', 'prod9,prod10', 'emp5');


-- Sample triggers and stored procedures --

-- Trigger to check stock level before inserting or updating OrderItem --
CREATE OR REPLACE TRIGGER trg_check_stock
BEFORE INSERT OR UPDATE ON OrderItem
FOR EACH ROW
DECLARE
    v_stockLevel NUMBER;
BEGIN
    SELECT stockLevel INTO v_stockLevel FROM Product WHERE productID = :NEW.productID;
    IF :NEW.quantity > v_stockLevel THEN
        RAISE_APPLICATION_ERROR(-20001, 'Not enough stock available');
    END IF;
END;
/

-- Stored procedure to update stock level --
CREATE OR REPLACE PROCEDURE update_stockLevel(
    p_productID IN VARCHAR2,
    p_quantity IN NUMBER
) AS
BEGIN
    UPDATE Product
    SET stockLevel = stockLevel - p_quantity
    WHERE productID = p_productID;
END;
/

