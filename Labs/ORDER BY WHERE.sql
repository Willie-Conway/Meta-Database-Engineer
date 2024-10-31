/*coder@069efc65af7a:~/project$ mysql
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 8
Server version: 8.0.28 MySQL Community Server - GPL

Copyright (c) 2000, 2022, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> CREATE DATABASE Chinook;
ERROR 1007 (HY000): Can't create database 'Chinook'; database exists
mysql> USE Chinook;
Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A

Database changed
mysql> CREATE TABLE Customer (
    ->     CustomerId INT NOT NULL,
    ->     FirstName VARCHAR(40) NOT NULL,
    ->     LastName VARCHAR(20) NOT NULL,
    ->     Company VARCHAR(80),
    ->     Address VARCHAR(70),
    ->     City VARCHAR(40),
    ->     State VARCHAR(40),
    ->     Country VARCHAR(40),
    ->     PostalCode VARCHAR(10),
    ->     Phone VARCHAR(24),
    ->     Fax VARCHAR(24),
    ->     Email VARCHAR(60) NOT NULL,
    ->     SupportRepId INT,
    ->     CONSTRAINT PK_Customer PRIMARY KEY (CustomerId)
    -> );
ERROR 1050 (42S01): Table 'Customer' already exists
mysql> INSERT INTO Customer (CustomerId, FirstName, LastName, Company, Address, City, State, Country, PostalCode, Phone, Fax, Email, SupportRepId) VALUES
    -> (1, 'Luís', 'Gonçalves', 'Embraer - Empresa Brasileira de Aeronáutica S.A.', 'Av. Brigadeiro Faria Lima, 2170', 'São José dos Campos', 'SP', 'Brazil', '12227-000', '+55 (12) 3923-5555', '+55 (12) 3923-5566', 'luisg@embraer.com.br', 3),
    -> (2, 'Eduardo', 'Martins', 'Woodstock Discos', 'Rua Dr. Falcão Filho, 155', 'São Paulo', 'SP', 'Brazil', '01007-010', '+55 (11) 3033-5446', '+55 (11) 3033-4564', 'eduardo@woodstock.com.br', 4),
    -> (3, 'Alexandre', 'Rocha', 'Banco do Brasil S.A.', 'Av. Paulista, 2022', 'São Paulo', 'SP', 'Brazil', '01310-200', '+55 (11) 3055-3278', '+55 (11) 3055-8131', 'alero@uol.com.br', 5),
    -> (4, 'Roberto', 'Almeida', 'Riotur', 'Praça Pio X, 119', 'Rio de Janeiro', 'RJ', 'Brazil', '20040-020', '+55 (21) 2271-7000', '+55 (21) 2271-7070', 'roberto.almeida@riotur.gov.br', 3),
    -> (5, 'Mark', 'Philips', 'Telus', '8210 111 ST NW', 'Edmonton', 'AB', 'Canada', 'T6G 2C7', '+1 (780) 434-4554', '+1 (780) 434-5565', 'mphilips12@shaw.ca', 5),
    -> (6, 'Jennifer', 'Peterson', 'Rogers Canada', '700 W Pender Street', 'Vancouver', 'BC', 'Canada', 'V6C 1G8', '+1 (604) 688-2255', '+1 (604) 688-8756', 'jenniferp@rogers.ca', 3);
ERROR 1062 (23000): Duplicate entry '1' for key 'Customer.PRIMARY'
mysql> SELECT CustomerId, FirstName, LastName, City, State, Country FROM Customer;
+------------+-----------+------------+-----------------------+-------+---------+
| CustomerId | FirstName | LastName   | City                  | State | Country |
+------------+-----------+------------+-----------------------+-------+---------+
|          1 | Luís      | Gonçalves  | São José dos Campos   | SP    | Brazil  |
|          2 | Eduardo   | Martins    | São Paulo             | SP    | Brazil  |
|          3 | Alexandre | Rocha      | São Paulo             | SP    | Brazil  |
|          4 | Roberto   | Almeida    | Rio de Janeiro        | RJ    | Brazil  |
|          5 | Mark      | Philips    | Edmonton              | AB    | Canada  |
|          6 | Jennifer  | Peterson   | Vancouver             | BC    | Canada  |
+------------+-----------+------------+-----------------------+-------+---------+
6 rows in set (0.00 sec)

mysql> SELECT CustomerId, FirstName, LastName, City, State, Country FROM Customer ORDER BY FirstName;
+------------+-----------+------------+-----------------------+-------+---------+
| CustomerId | FirstName | LastName   | City                  | State | Country |
+------------+-----------+------------+-----------------------+-------+---------+
|          3 | Alexandre | Rocha      | São Paulo             | SP    | Brazil  |
|          2 | Eduardo   | Martins    | São Paulo             | SP    | Brazil  |
|          6 | Jennifer  | Peterson   | Vancouver             | BC    | Canada  |
|          1 | Luís      | Gonçalves  | São José dos Campos   | SP    | Brazil  |
|          5 | Mark      | Philips    | Edmonton              | AB    | Canada  |
|          4 | Roberto   | Almeida    | Rio de Janeiro        | RJ    | Brazil  |
+------------+-----------+------------+-----------------------+-------+---------+
6 rows in set (0.00 sec)

mysql> SELECT CustomerId, FirstName, LastName, City, State, Country FROM Customer WHERE Country = 'Brazil';
+------------+-----------+------------+-----------------------+-------+---------+
| CustomerId | FirstName | LastName   | City                  | State | Country |
+------------+-----------+------------+-----------------------+-------+---------+
|          1 | Luís      | Gonçalves  | São José dos Campos   | SP    | Brazil  |
|          2 | Eduardo   | Martins    | São Paulo             | SP    | Brazil  |
|          3 | Alexandre | Rocha      | São Paulo             | SP    | Brazil  |
|          4 | Roberto   | Almeida    | Rio de Janeiro        | RJ    | Brazil  |
+------------+-----------+------------+-----------------------+-------+---------+
4 rows in set (0.00 sec)

mysql> SELECT CustomerId, FirstName, LastName, City, State, Country FROM Customer WHERE Country = 'Brazil' ORDER BY FirstName;
+------------+-----------+------------+-----------------------+-------+---------+
| CustomerId | FirstName | LastName   | City                  | State | Country |
+------------+-----------+------------+-----------------------+-------+---------+
|          3 | Alexandre | Rocha      | São Paulo             | SP    | Brazil  |
|          2 | Eduardo   | Martins    | São Paulo             | SP    | Brazil  |
|          1 | Luís      | Gonçalves  | São José dos Campos   | SP    | Brazil  |
|          4 | Roberto   | Almeida    | Rio de Janeiro        | RJ    | Brazil  |
+------------+-----------+------------+-----------------------+-------+---------+
4 rows in set (0.00 sec)

mysql> SELECT FirstName, Country FROM Customer WHERE Country = 'Canada' ORDER BY FirstName;
+-----------+---------+
| FirstName | Country |
+-----------+---------+
| Jennifer  | Canada  |
| Mark      | Canada  |
+-----------+---------+
2 rows in set (0.00 sec)

mysql> */