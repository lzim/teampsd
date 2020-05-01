---
title: "SQL SERVER & SQL"
author: "Ash Nazarizadeh"
date: "An May 1 2020"
output: 
  github_document: default
  html_document: default
  pdf_document: default
  word_document: default
  ioslides_presentation: default
  slidy_presentation: default
  powerpoint_presentation: default
---

<img src = "https://github.com/lzim/teampsd/blob/teampsd_style/teampsd_logo/team_psd_logo_sm.png"
     height = "200" width = "600">  

# Summary: SQL Server and SQL  
1. What Is Microsoft SQL Server
1. SQL Server Structure in a Nutshell
1. SQL Server Management Studio (SSMS) - Logging on  
1. SQL Server Management Studio (SSMS) - After Login   
1. What Is SQL  
1. SQL Commands in a Nutshell  
1. SQL DQL, DDL and DML
1. SQL Server Data Types  
1. SQL DDL   
1. SQL DQL
1. SQL jOIN Types
1. SQL DML - UPDATE 
1. SQL DML - DELETE
1. SQL DML - INSERT
1. SQL SERVER TEMPORARY TABLES

## 1. What is Microsoft SQL Server

MTL team uses the **Microsoft SQL Server DBMS (Database Management System)** as well as the **SQL (Structured Query Language)** to work with data. As such, a fundamental understanding of SQL Server and SQL is helpful.

Microsoft SQL Server is a software product with the primary function of storing and retrieving data as requested by other software applications, which may run either on the same computer or on another computer across a network.


## 2. SQL Server Structure in a Nutshell

A **Schema** in a SQL database is a collection of logical structures of data. The schema is owned by a database user and has the same name as the database user. From SQL Server 2005, a schema is an independent entity (container of objects) different from the user who creates that object.

![SQL_1](https://user-images.githubusercontent.com/39805164/80826303-dc8ffa80-8b96-11ea-8b42-e3f3f25c0bd2.png)

## 3. SQL Server Management Studio (SSMS) - Logging on
**SQL Server Management Studio (SSMS)** is the Microsoft SQL Server utility for configuring, managing and administering database components. It includes a script editor and a graphics program that works with server objects and settings. The main tool of SQL Server Management Studio is Object Explorer, which allows a user to view, retrieve, and manage server objects. **SSMS has to be installed on your machine**. 

![SQL_2](https://user-images.githubusercontent.com/39805164/80826886-d4848a80-8b97-11ea-9df3-3f37ba5737eb.png)

## 4. SQL Server Management Studio (SSMS) - After Login   

**Database Schema** is a collection of database objects including tables, views, triggers, stored procedures, indexes, etc. A schema is associated with a username which is known as the schema owner, who is the owner of the logically related database objects.

A schema always belongs to one database. On the other hand, a database may have one or multiple schemas. An object within a schema is qualified using the schema_name.object_name format like. Two objects (e.g. tables) in two schemas can have the same name so you may have schema_1.table_1 and schema_2.table_1.

![SQL_3](https://user-images.githubusercontent.com/39805164/80827462-db5fcd00-8b98-11ea-8a4c-2457df5569f8.png)

## 5. What Is SQL  

SQL is a domain-specific language used in programming and designed for managing data held in a relational database management system, or for stream processing in a relational data stream management system. 
There are five types of SQL Commands which can be classified as:

- DDL (Data Definition Language) – CREATE 
- DML (Data Manipulation Language) – INSERT, UPDATE, DELETE
- DQL (Data Query Language) - SELECT
- DCL (Data Control Language) – GRANT 
- TCL (Transaction Control Language) - COMMIT, ROLLBACK and SAVEPOINT

Although SQL follows ANSI standards, each SQL database vendor may also add its own features and procedural languages to the standard SQL. **Power Users mostly interact with SQL’s DQL, DDL and DML.**
 
## 6. SQL Commands in a Nutshell  

![SQL_4](https://user-images.githubusercontent.com/39805164/80828250-d4858a00-8b99-11ea-8415-56ead9b48b9e.png)

## 7. SQL DQL, DDL and DML

![SQL_5](https://user-images.githubusercontent.com/39805164/80828663-8329ca80-8b9a-11ea-8f33-e5dd7c3e1073.png)

### SYNTAX
- [SELECT](https://docs.microsoft.com/en-us/sql/t-sql/queries/select-transact-sql?view=sql-server-ver15)
- [UPDATE](https://docs.microsoft.com/en-us/sql/t-sql/queries/update-transact-sql?view=sql-server-ver15) 
- [INSERT](https://docs.microsoft.com/en-us/sql/t-sql/statements/insert-transact-sql?view=sql-server-ver15) 
- [DELETE](https://docs.microsoft.com/en-us/sql/t-sql/statements/delete-transact-sql?view=sql-server-ver15) 
- [CREATE](https://docs.microsoft.com/en-us/sql/t-sql/statements/create-table-transact-sql?view=sql-server-ver15) 


## 8. SQL Server Data Types


