-- Create Database
CREATE DATABASE OrnamentStoreDB;
USE OrnamentStoreDB;

-- Table: Seller
CREATE TABLE Seller (
    SellerID INT PRIMARY KEY,
    Salary DECIMAL(10, 2),
    Position VARCHAR(50)
);

-- Table: Purchaser
CREATE TABLE Purchaser (
    PurchaserID INT PRIMARY KEY,
    Name VARCHAR(100),
    Contact VARCHAR(50)
);

-- Table: Ornament
CREATE TABLE Ornament (
    OrnamentID INT PRIMARY KEY,
    Type VARCHAR(50),
    Price DECIMAL(10, 2)
);

-- Table: Record
CREATE TABLE Record (
    RecordID INT PRIMARY KEY,
    Month VARCHAR(20),
    Total DECIMAL(10, 2),
    SellerID INT,
    FOREIGN KEY (SellerID) REFERENCES Seller(SellerID)
);

-- Table: Paid
CREATE TABLE Paid (
    PaidID INT PRIMARY KEY,
    Method VARCHAR(50),
    Amount DECIMAL(10, 2),
    RecordID INT UNIQUE,
    FOREIGN KEY (RecordID) REFERENCES Record(RecordID)
);

-- Table: Record_Ornament (Many-to-Many Relationship between Record and Ornament)
CREATE TABLE Record_Ornament (
    RecordID INT,
    OrnamentID INT,
    PRIMARY KEY (RecordID, OrnamentID),
    FOREIGN KEY (RecordID) REFERENCES Record(RecordID),
    FOREIGN KEY (OrnamentID) REFERENCES Ornament(OrnamentID)
);

-- Table: Purchaser_Ornament (Many-to-Many Relationship between Purchaser and Ornament)
CREATE TABLE Purchaser_Ornament (
    PurchaserID INT,
    OrnamentID INT,
    PRIMARY KEY (PurchaserID, OrnamentID),
    FOREIGN KEY (PurchaserID) REFERENCES Purchaser(PurchaserID),
    FOREIGN KEY (OrnamentID) REFERENCES Ornament(OrnamentID)
);

-- Table: Correspondence (1-to-1 Relationship between Record and Paid)
CREATE TABLE Correspondence (
    RecordID INT UNIQUE,
    PaidID INT UNIQUE,
    PRIMARY KEY (RecordID, PaidID),
    FOREIGN KEY (RecordID) REFERENCES Record(RecordID),
    FOREIGN KEY (PaidID) REFERENCES Paid(PaidID)
);
 INSERT INTO Seller (SellerID, Salary, Position) VALUES
(1, 50000.00, 'Manager'),
(2, 45000.00, 'Salesperson'),
(3, 60000.00, 'Sales Manager'),
(4, 40000.00, 'Assistant Manager'),
(5, 35000.00, 'Salesperson'),
(6, 55000.00, 'Supervisor'),
(7, 70000.00, 'Senior Manager'),
(8, 48000.00, 'Salesperson'),
(9, 46000.00, 'Sales Manager'),
(10, 52000.00, 'Coordinator');
INSERT INTO Purchaser (PurchaserID, Name, Contact) VALUES
(1, 'John Doe', '555-1234'),
(2, 'Jane Smith', '555-2345'),
(3, 'Michael Johnson', '555-3456'),
(4, 'Emily Davis', '555-4567'),
(5, 'Sarah Lee', '555-5678'),
(6, 'David Brown', '555-6789'),
(7, 'William Wilson', '555-7890'),
(8, 'Olivia Martinez', '555-8901'),
(9, 'James Taylor', '555-9012'),
(10, 'Sophia Thomas', '555-0123');
INSERT INTO Ornament (OrnamentID, Type, Price) VALUES
(1, 'Necklace', 150.00),
(2, 'Ring', 120.00),
(3, 'Bracelet', 90.00),
(4, 'Earrings', 75.00),
(5, 'Pendant', 110.00),
(6, 'Brooch', 60.00),
(7, 'Cufflinks', 200.00),
(8, 'Anklet', 80.00),
(9, 'Watch', 250.00),
(10, 'Bangle', 100.00);
INSERT INTO Record (RecordID, Month, Total, SellerID) VALUES
(1, 'January', 500.00, 1),
(2, 'February', 450.00, 2),
(3, 'March', 600.00, 3),
(4, 'April', 400.00, 4),
(5, 'May', 350.00, 5),
(6, 'June', 550.00, 6),
(7, 'July', 700.00, 7),
(8, 'August', 480.00, 8),
(9, 'September', 460.00, 9),
(10, 'October', 520.00, 10);
INSERT INTO Paid (PaidID, Method, Amount, RecordID) VALUES
(1, 'Credit Card', 150.00, 1),
(2, 'Cash', 120.00, 2),
(3, 'Debit Card', 90.00, 3),
(4, 'Bank Transfer', 75.00, 4),
(5, 'Credit Card', 110.00, 5),
(6, 'Cash', 60.00, 6),
(7, 'Debit Card', 200.00, 7),
(8, 'Cash', 80.00, 8),
(9, 'Credit Card', 250.00, 9),
(10, 'Bank Transfer', 100.00, 10);
INSERT INTO Record_Ornament (RecordID, OrnamentID) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10);
INSERT INTO Purchaser_Ornament (PurchaserID, OrnamentID) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10);
INSERT INTO Correspondence (RecordID, PaidID) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10);
SELECT * FROM Seller;
SELECT * FROM Purchaser;
SELECT * FROM Ornament;
SELECT * FROM Paid;
SELECT * FROM record;
SELECT * FROM record_ornament;
SELECT * FROM Correspondence;
