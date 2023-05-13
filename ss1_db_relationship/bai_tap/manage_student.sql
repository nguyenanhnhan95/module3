create database student_management;
use student_management;
create table class(
id int primary key auto_increment ,
`name` varchar(45)
);
create table teacher(
id  int primary key auto_increment,
`name` varchar(45),
`age` int,
`adress` varchar(100)
);
insert into class (`name`)
value("Nhan"),("Sang"),("Quoc");
insert into teacher(`name`,`age`,`adress`)
value ("chanh",35,"Da Nang"),("Quang",26,"Quang Tri");
select * from teacher;

