use practice

-- -- -- -- -- -- -- -- -- -- 1 -- -- -- -- -- -- -- -- -- --
-- select *
-- from (select SId ,score from sc where sc.CId='01')as t1 , (select SId ,score from sc where sc.CId='02') as t2
-- where t1.SId=t2.SId
-- and   t1.score>t2.score
-- -- -- -- -- -- -- -- -- -- 1.2 -- -- -- -- -- -- -- -- -- --
-- select *
-- from (select SId ,score from sc where sc.CId='01')as t1 , (select SId ,score from sc where sc.CId='02') as t2
-- where t1.SId=t2.SId
 -- -- -- -- -- -- -- -- -- -- 1.2 -- -- -- -- -- -- -- -- -- --
-- select *
-- from (select SId ,score from sc where sc.CId='01')as t1 left join  (select SId ,score from sc where sc.CId='02') as t2
-- on t1.SId=t2.SId
-- -- -- -- -- -- -- -- -- -- 1.3 -- -- -- -- -- -- -- -- -- --
-- select *
-- from sc
-- where sc.SId not in (select SId from sc where sc.CId='01')
-- and  sc.CId='02'
-- -- -- -- -- -- -- -- -- -- 2 -- -- -- -- -- -- -- -- -- --
-- select student.*,t1.avgscore
-- from student inner JOIN(
-- select sc.SId ,AVG(sc.score)as avgscore
-- from sc 
-- GROUP BY sc.SId
-- HAVING AVG(sc.score)>=60)as t1 on student.SId=t1.SId 
-- -- -- -- -- -- -- -- -- -- 3 -- -- -- -- -- -- -- -- -- --
-- select DISTINCT student.*
-- from student ,sc
-- where student.SId=sc.SId
-- -- -- -- -- -- -- -- -- -- 4 -- -- -- -- -- -- -- -- -- --
-- select student.SId,student.Sname,t1.sumscore,t1.coursecount
-- from student ,(
-- select SC.SId,sum(sc.score)as sumscore ,count(sc.CId) as coursecount
-- from sc 
-- GROUP BY sc.SId) as t1
-- where student.SId =t1.SId
-- -- -- -- -- -- -- -- -- -- 4.1 -- -- -- -- -- -- -- -- -- --
-- select *
-- from student
-- where EXISTS(select * from sc where student.SId=sc.SId)
-- -- -- -- -- -- -- -- -- -- 5 -- -- -- -- -- -- -- -- -- --
-- select count(*)
-- from teacher
-- where teacher.Tname like 'LI%'
-- -- -- -- -- -- -- -- -- -- 6 -- -- -- -- -- -- -- -- -- --
-- select student.*
-- from teacher  ,course  ,student,sc
-- where teacher.Tname='Zhang San'
-- and   teacher.TId=course.TId
-- and   course.CId=sc.CId
-- and   sc.SId=student.SId
-- -- -- -- -- -- -- -- -- -- 7 -- -- -- -- -- -- -- -- -- --
select student.*
from student 
where student.SId not in ( select sc.SId
from sc
group by sc.SId
having count(*)=(select count(CId) from course))
-- -- -- -- -- -- -- -- -- -- 8 -- -- -- -- -- -- -- -- -- --
select DISTINCT student.*
from  sc ,student
where sc.CId in (select CId from sc where sc.SId='01')
and   sc.SId=student.SId
-- -- -- -- -- -- -- -- -- -- 9 -- -- -- -- -- -- -- -- -- --
select *
from student 
where student.SId not in (
select t1.SId
from 
(select student.SId,t.CId
from student ,(select sc.CId from sc where sc.SId='01') as t )as t1 
left join sc on t1.SId=sc.SId and t1.CId=sc.CId
where sc.CId is null )
and student.SId !='01'
-- -- -- -- -- -- -- -- -- -- 10 -- -- -- -- -- -- -- -- -- --
select *
from student 
where student.SId not in 
(
select student.SId
from student left join sc on student.SId=sc.SId 
where EXISTS 
(select *
from teacher ,course
where teacher.Tname='Zhang San'
and   teacher.TId=course.TId
and 	course.CId=sc.CId))
-- -- -- -- -- -- -- -- -- -- 11 -- -- -- -- -- -- -- -- -- --
select student.SId,student.Sname,avg(sc.score)
from student ,sc
where student.SId=sc.SId
and   sc.score<60
GROUP BY sc.SId
HAVING count(*)>=2
-- -- -- -- -- -- -- -- -- -- 12 -- -- -- -- -- -- -- -- -- --
select student.*
from student,sc
where sc.CId ='01'
and   sc.score<60
and   student.SId=sc.SId
