--�ܺ����� �б�
@c:/script.sql

select * from tab;
desc tb_grade;


--1. �а��̸��� �迭ǥ��. �������� �а���, �迭
select department_name as "�а� ��", category as "�迭"
from tb_department;

--2.
select department_name||'�� ������ ' ||capacity|| '�� �Դϴ�.' as "�а��� ����"
from tb_department;

--3.
select *
from tb_department;

select student_name
from tb_student
where DEPARTMENT_NO = 001
and STUDENT_SSN like '______-2%' 
and ABSENCE_YN = 'Y' ;

--4.
select student_name
from tb_student
where student_no in ('A513079', 'A513090', 'A513091', 'A513110', 'A513119'); 


--5.
select department_name, category
from tb_department
where capacity between 20 and 30;

--6.
select professor_name
from tb_professor
where department_no is null;

--7.
select student_name, department_no
from tb_student
--order by 2;
where department_no is null;

--8.
select class_no
from tb_class
where preattending_class_no is not null;

--9.
select DISTINCT category
from tb_department;


--10. 
select student_no, student_name, student_ssn
from tb_student
where student_no like '_2%'
and absence_yn = 'N' 
and student_address like '����%'
and rownum < 100
order by 3;


select student_ssn, replace(STUDENT_SSN, substr(STUDENT_SSN, 9),'******')
from tb_student;

--**************************
-- select student_ssn, substr(student_ssn,1,8)||'*******'
-- select student_ssn, rpad(substr(student_ssn,1,8),14,'*')
-- select student_ssn, replace(student_ssn,substr(student_ssn,9),'******')
-- from tb_student;



--2���� ����
--1.
select STUDENT_NO "�й�", STUDENT_NAME "�̸�",to_char(ENTRANCE_DATE, 'yyyy-mm-dd') "���г⵵" 
from tb_student
where DEPARTMENT_NO = 002;

--2.
select PROFESSOR_SSN, professor_name
from tb_professor
where length(substr(professor_name, 1, 4)) <> 3; 

--3.��
select professor_name, to_char(sysdate, 'yymm'), substr(professor_ssn,1,4) 
from TB_PROFESSOR;





-----------------��
select professor_name, to_number(to_char(sysdate,'yyyy'))
        - to_number('19'||substr(professor_ssn,1,2))
from tb_professor
where ssubstr(professor_ss,8,1)='1'
order by 2,1;

--4.
select substr(professor_name, 2) 
from TB_PROFESSOR

--5.








--6.









--Ŭ������ mod����
select mod(to_date('2020-12-25') - sysdate),7)
from dual;






--8��
select student_no, student_name
from te_student
where substr(student_no,1,1) <> 'A'


--6��
select to_char(to_date('2020/12/25'),'yyyymmdd day')from dual;

--5��
select student_no, student_name
from tb_student
where to_number(to_char(entrance_date,'yyyy')) - to_number(to_char(to_date(suvstr(student_ssn,1,2),'rr'),'yyyy'))>19
order by 1;