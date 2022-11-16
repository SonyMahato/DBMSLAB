create database insurance1;
use insurance1;
create table person(
 driver_id char(10),
name varchar(10),
address varchar(20),
primary key(driver_id)
);
create table car(
 reg_num char(10),
 model varchar(15),
 year year,
 primary key(reg_num)
 );
 create table owns(
 driver_id char(10),
 reg_num char(10),
 primary key(driver_id,reg_num),
 foreign key(driver_id) references person(driver_id) on delete cascade,
 foreign key(reg_num) references car(reg_num) on delete cascade
 );
 create table accidents(
 report_num int,
 accident_date char(10),
 location varchar(20),
 primary key(report_num)
 );
 create table participated(
 driver_id char(10),
 reg_num char(10),
 report_num int,
 damage_amount int,
 primary key(driver_id,reg_num,report_num),
 foreign key(driver_id) references person(driver_id),
 foreign key(reg_num) references car(reg_num),
 foreign key(report_num) references accidents(report_num)
 );
 insert into person values('A01', 'Richard', 'Srinivas nagar'),
 ('A02', 'Sinah', 'Kormangala'),
 ('A03', 'Ryan', 'Church Streest'),
 ('A04', 'Shrijan', 'Rajajinagar'),
 ('A05', 'Shyam', 'NR colony');
 
 insert into car values('KA052250', 'Indica', '1990'),
 ('KA031181', 'Lancer', '1957'),
 ('KA095477', 'Toyota', '1998'),
 ('KA053408', 'Honda', '2008'),
 ('KA041702', 'Audi', '2005');
 
 
 select * from person;
insert into owns values('A01', 'KA052250'),
 ('A02', 'KA053408'),
 ('A03', 'KA031181'),
 ('A04', 'KA095477'),
 ('A05', 'KA041702');
 
 insert into accidents values('11', '2003-01-01', 'mysore road'),
 ('12', '2004-02-02', 'south end circle'),
 ('13', '2003-01-21', 'Bull temple road'),
 ('14', '2008-02-17', 'MYSORE ROAD'),
 ('15', '2005-03-04', 'Kanakpura road');

insert into participated values('A01', 'KA052250', '11', '10000'),
('A02', 'KA053408', '12', '50000'),
('A03', 'KA095477', '13', '25000'),
('A04', 'KA031181', '14', '3000'),
('A05', 'KA041702', '15', '5000');
select * from car;
select * from owns;
select * from accidents;
select * from participated;
desc participated;

select *
from participated
order by damage_amount desc;

select avg(damage_amount)
from participated;

select * from participated;
delete from participated where damage_amount<(select t.amt from(select avg(damage_amount)amt from participated)t);


select  name from person
where driver_id in(select driver_id from participated where damage_amount>(select avg(damage_amount)
from participated)); 

select max(damage_amount)
from participated;







