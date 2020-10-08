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