use practice;
DROP TABLE IF EXISTS `Student`;
create table Student(SId varchar(10),Sname varchar(10),Sage datetime,Ssex varchar(10)) ENGINE=InnoDB DEFAULT CHARSET=utf8;
insert into Student values('01' , 'Zhao Lei' , '1990-01-01' , 'male');
insert into Student values('02' , 'Qian Dian' , '1990-12-21' , 'male');
insert into Student values('03' , 'Sun Feng' , '1990-05-20' , 'male');
insert into Student values('04' , 'Li Yun' , '1990-08-06' , 'male');
insert into Student values('05' , 'Zhou Mei' , '1991-12-01' , 'female');
insert into Student values('06' , 'Wu Lan' , '1992-03-01' , 'female');
insert into Student values('07' , 'Zheng Zhu' , '1989-07-01' , 'female');
insert into Student values('09' , 'Zhang San' , '2017-12-20' , 'female');
insert into Student values('10' , 'Li Si' , '2017-12-25' , 'female');
insert into Student values('11' , 'Li Si' , '2017-12-30' , 'female');
insert into Student values('12' , 'Zhao Liu' , '2017-01-01' , 'female');
insert into Student values('13' , 'Sun Qi' , '2018-01-01' , 'female');
