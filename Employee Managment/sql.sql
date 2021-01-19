create database amitha;
use amitha;

drop table Emp;
create table Emp(
 name varchar(50) unique,
 password varchar(50),
 gender varchar(10),
 phone varchar(10),
 age varchar(10),
 department varchar(10),
 project varchar(10)
 );
 select * from Emp;
 -- insert into user (name,password,gender,phone,age) values ("Shreesha","1008","male","8105838657","24");
 -- delete from user where name = 'shreesh';
 -- select password from user where name = 'Shreesha';
 -- update User set name = 'Shree', password = '1111', gender = 'female', phone = '8105838657', age = '24' where name = 'Shree';
 drop table Address;
create table Address(
 id varchar(50) unique,
 address varchar(50),
 city varchar(10),
 state varchar(10)
 );
 select * from Address;
 
 drop table Department;
create table Department(
 id varchar(50) unique,
 Dname varchar(50),
 Dloc varchar(100)
);
 select * from Department;
insert into Department (id,Dname,Dloc) values ("10","Comcast","Delhi");



 drop table Project;
create table Project(
 id varchar(50) unique,
 Pname varchar(50),
 Pdetails varchar(100)
);
 select * from Project;
 