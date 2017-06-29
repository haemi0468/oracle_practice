--������ � ���̺���� �ֳ�?
select * from tab;

--emp���̺�ȿ� �÷��̶� ���� ����? (describe)
desc emp;

--emp���̺��� ��� �÷� ���������
select * from emp;

--emp���̺��߿��� Ư���÷��� �����ؼ� ���������
select empno, ename, job, deptno from emp;

--���갡��
select empno, ename, sal, sal*1.1 from emp;

--����
select empno as "��� ��ȣ", ename as ����, sal as �޿� from emp; 

--�ΰ��� ������ ������ �ϸ� �� ����� null�� ���´�...�����߻�!! (�����Ͻ� �ƴ� ���)
select empno, ename, sal*12+comm as ���� from emp;

--���� ���� �ذ��Ϸ��� NVL�Լ�! (comm�÷� null�̸� ��ȣ�� �ι�°������ ��ü)
select sal as ����, sal*12 as ����, (NVL(comm,0)+sal)*12 as "�������� ����" from emp;

--nvl�Լ� ����� ���� �÷����� ���´�..
select (NVL(comm,0)+sal)*12 from emp;

select ename|| job as "�̸� ����"from emp
where rownum <11;

--���ͷ� = �� (����, ����, ��¥) = ''�� �����ش�
select ename||'��       ������  ' ||job||'�̴�' as "����� ����" from emp;

--�ߺ�����
select distinct job from emp;



--where��
select ename, empno, deptno, job
from emp
where deptno = 30;

select empno, ename, job, deptno
from emp
where job = 'SALESMAN';

select empno, ename, job, deptno
from emp
where hiredate = '81/11/17';

select empno, ename, sal
from emp
where sal <= 1000;

select ename, hiredate
from emp
where hiredate >= '81/11/17';

select empno, ename, sal
from emp
where sal between 800 and 2000;

select empno, ename, sal
from emp
where hiredate between '80/10/01' and '81/12/31';

select empno, ename, sal
from emp
where hiredate not between '80/10/01' and '81/12/31';

select empno, ename, comm
from emp
where comm is null;

--0�� null �ƴϴϱ� ���͵� ��Ȳx
select empno, ename, comm
from emp
where comm is not null;

select empno, ename, job
from emp
where empno in(7839, 7844, 7876);

select empno, ename, job
from emp
where ename in('SMITH', 'FORD');

select job, empno, ename
from emp
where ename not in('SMITH', 'FORD');

select empno, ename, job
from emp
where ename like '%A%';

select empno, ename, job
from emp
where ename like '%T%';

select empno, ename, job
from emp 
where ename like '_L%';



--and�� or���� �������� �����ڶ� ��� �޶��� �� �ִ�
--�򰥸��� �׳� �������
select ename, job, sal, comm
from emp
where job = 'CLERK' or job = 'ANALYST'
and comm IS NULL
and sal >=1000
and sal <=3000;

select ename, job, sal, comm
from emp
where (job = 'CLERK' or job = 'ANALYST')
and comm IS NULL
and sal >= 1000
and sal <=3000;


--order by (�÷���or �ٸ��or ����Ʈ�� �����ȼ���)
select empno, ename, hiredate
from emp
order by hiredate;

select empno, ename, hiredate
from emp
order by hiredate desc;

select empno, ename, sal*12 as annual
from emp
order by annual;

select empno, ename, sal*12 as annual
from emp
order by 2 desc;

--����2�� sal ��������, �����͵鸸 empno�� �� ��������
select empno, ename, sal
from emp
order by sal desc, empno;

--order byd���� null�� ���� ũ�� ���´�
select empno, ename, comm
from emp
order by COMM;



--2���� �Լ�����
--����~
--initiation capital func
select deptno, initcap(dname), initcap(loc)
from dept;

--ename�� ��� �ҹ��ڷ� �ٲ� ���� scott (��� ���ϰ� �Ҷ��)
select empno, ename, lower(job), deptno
from emp
where lower(ename) = 'scott';

select empno, ename, job, deptno
from emp
where ename = upper('scott');

select empno, ename, job, concat(ename, job)
from emp
where empno = 7369;

--padding
select ename, lpad(ename, 15,'*'), sal, lpad(sal,10,'*')
from emp
where deptno = 10;

select ename, rpad(ename, 15, '*'), sal, rpad(sal, 10, '*')
from emp
where deptno=10;

--sub string ���ڻ̾Ƴ���
select substr('000101-3234232', 8 , 1)
from dual;
--dual�� �ӽ�(dummy) ���̺�

select substr('000101-3234232', 8 )
from dual;

select 123*456
from dual;

select empno, ename, length(ename), sal, length(sal)
from emp
where deptno=20;

select ename, job, replace(job, 'A', '$')
from emp;

--index string Ư������ ��ġ�� ���ϱ� m��°���� n��°
select instr('MILLER', 'L', 2, 1)
from dual;


select ename, instr(ename, 'L') as e_null, instr(ename, 'L', 1, 1) e_11,
instr(ename, 'L', 1, 2) e_12, instr(ename, 'L', 4, 1) e_41,
instr(ename, 'L', 4, 2) e_42
from emp
order by ename;

--��������
select trim('     hello   '), '     hello     '
from dual;

--��/�����ʺ��� ����, m�ƴѰ� ������ ����, �������ϸ� ��������
select ltrim('MMILMLERM', 'M')
from dual;

select rtrim ('RMIRLLERR', 'R')
from dual;

select rtrim ('            RMIR  LL ERR           ')
from dual;

select ename, job, ltrim(job, 'A'), sal, ltrim(sal, 1)
from emp;

--�⺻Ʈ�� ���ʴ�
select trim(0 from 000987238900) "TRIM Example" from dual;

select empno, job, trim(LEADING 'S' from job),
              trim(TRAILING 'N' from job)
              from emp
              where empno=7844;



--���� ����~
select ceil(10.7), floor(10.7)
from dual;

select mod(10, 3)
from dual;

select round(4567.678), round(4567.678,0), round(4567.678,2), round(4567.678,-2)
from dual;

select trunc(4567.678), trunc(4567.678,0), trunc(4567.678,2), trunc(4567.678,-2)
from dual;

select sign(345), sign(-1003), sign(0)
from dual;

--��¥~~~���ڷ� ����, ���� ���갡��
select *
from NLS_SESSION_PARAMETERS;

select sysdate +2
from dual;

select systimestamp 
from dual;


-- -�� 1���� ä �ȵǴ� ��
select ename, hiredate, sysdate, months_between(sysdate, hiredate) m_between,
trunc(months_between(sysdate, hiredate), 0) t_between
from emp
where deptno=10
order by months_between(sysdate, hiredate) desc;

select add_months(sysdate, 5)
from dual;

select next_day(sysdate, '������')
from dual;

select next_day(sysdate, 1)
from dual;

select last_day(sysdate)
from dual;

select round(sysdate, 'year'), trunc(sysdate, 'month')
from dual;

-- desc emp ���� empno num�̴�. ����������ȯ�ؼ� ���� ������ش�
select empno, ename, hiredate
from emp
where hiredate = '82/01/23';

select empno, ename
from emp
where empno= '7900';

select empno, ename, hiredate
from emp
where hiredate= to_date('82/01/23');

select empno, ename
from emp
where empno=to_number('7900');

select sysdate, to_char(sysdate, 'yyyy "��" mm "��" dd "��" dy hh24 mi ss')
from dual;

--locale ����ȭ��
select to_char(234254, 'L999,999')
from dual;

select to_date('19990220181030', 'YYYYMMDDHH24MISS')
from dual;

alter session set nls_date_format =  'YYYY-MM-DD HH:MI:ss';


select empno, ename, sal, job,
decode(job, 'ANALYIS', sal*1.1,
            'CLERK', sal*1.2,
            'MANAGER', sal*1.3,
            'PRESIDENT', sal*1.4,
            'SALESMAN', sal*1.5, sal) as "�� ��"
from emp;




--���� 1.
select empno_vc, STDATE_VC,EDDATE_VC, sma_vc,
decode(sma_vc, '1', '����','����')
               ,ema_vc,
               decode(ema_vc, '1', '����', '����')
from t_holhistory;

--���� 2.

select EMPNO_VC, STATE_VC, 
decode (STATE_VC,'0', '�㰡',
                '10', '���', '���㰡')
from t_holhistory;





select *
from NLS_SESSION_PARAMETERS;
select sysdate from dual;
select systimestamp-2/24 from dual;
select ename, trunc(trunc(sysdate-hiredate)/7)||'��'
from emp;

select empno, ename,
  case when sal>1000 and sal <=2000 then 'D'
      when sal >2000 and sal <= 3000 then 'C'
      when sal>3000 and sal <=4000 then 'B'
      when sal>4000 and sal <=5000 then 'A'
      when sal>=0 and sal <1000 then 'E'
      end "���" from emp;
      
    
select empno, ename, sal, job, 
case job when 'ANALYST' then sal*1.1
         when  'CLERK' then sal*1.2
         when 'MANAGER' then sal*1.3
         when 'PRESIDENT' then sal* 1.4
         when 'SALESMAN' then sal*1.5
         else sal
         end "�޿�"
         from emp;
         
         
         
 ---�ǽ�����
 select EMPNO, ENAME, HIREDATE
 from EMP
 where TO_CHAR(hiredate, 'MM') = '12';
 
 
select empno, ename, lpad(sal, 10, '*') �޿�
from emp;

select empno, ename, to_char(hiredate, 'yyyy-mm-dd') �Ի���
from emp;
 
select empno, ename, comm, 
decode ( job, 'SALESMAN', '�������', '�Ϲݻ��') �������
from emp;

select loc,
case loc when 'NEW YORK' then 'EAST'
         when 'DALLAS' then 'CENTER'
         when 'CHICAGO' then 'CENTER'
         when 'BOSTON' then 'EAST'
         end "area"
from dept;

select ename, sal,
case when sal >=2000 then '1000'
when sal >=1000 then '500'
else '0' end "bonus"
from emp; 

select empno, ename, sal "�޿�", 
case when sal>=0 and sal<1001 then 'E'
    when sal>=1001 and sal<2001 then 'D'
    when sal>=2001 and sal<3001 then 'C'
    when sal>=3001 and sal<4001 then 'B'
    when sal>4001 and sal<5001 then 'A'
    end "���"
from emp;


---7�� decode�ڡڡڡڡڡڡڡڡڡڡڡڡ�
select empno, ename, sal "�޿�", 
decode ( sal, sign(sal-1000)<0, 'E')
from emp;



