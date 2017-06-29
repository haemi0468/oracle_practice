--계정에 어떤 테이블들이 있나?
select * from tab;

--emp테이블안에 컬럼이랑 유형 뭐니? (describe)
desc emp;

--emp테이블의 모든 컬럼 보고싶을떼
select * from emp;

--emp테이블중에서 특정컬럼만 지정해서 보고싶을때
select empno, ename, job, deptno from emp;

--연산가능
select empno, ename, sal, sal*1.1 from emp;

--별명
select empno as "사원 번호", ename as 성명, sal as 급여 from emp; 

--널값을 가지고 연산을 하면 그 결과가 null로 나온다...문제발생!! (비지니스 아닌 사원)
select empno, ename, sal*12+comm as 연봉 from emp;

--위의 문제 해결하려면 NVL함수! (comm컬럼 null이면 괄호안 두번째값으로 대체)
select sal as 월급, sal*12 as 연봉, (NVL(comm,0)+sal)*12 as "샐러리맨 연봉" from emp;

--nvl함수 결과값 역시 컬럼으로 나온다..
select (NVL(comm,0)+sal)*12 from emp;

select ename|| job as "이름 직업"from emp
where rownum <11;

--리터럴 = 값 (문자, 숫자, 날짜) = ''로 묶어준다
select ename||'의       직급은  ' ||job||'이다' as "사원별 직급" from emp;

--중복제거
select distinct job from emp;



--where절
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

--0은 null 아니니까 나와도 당황x
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



--and가 or보다 순위높은 연산자라 결과 달라질 수 있다
--헷갈리면 그냥 묶고시작
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


--order by (컬럼명or 앨리어스or 셀렉트에 지정된순서)
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

--정렬2번 sal 내림차순, 같은것들만 empno로 또 오름차순
select empno, ename, sal
from emp
order by sal desc, empno;

--order byd에서 null이 제일 크게 나온다
select empno, ename, comm
from emp
order by COMM;



--2일차 함수배우기
--문자~
--initiation capital func
select deptno, initcap(dname), initcap(loc)
from dept;

--ename의 결과 소문자로 바꾼 것이 scott (결과 편하게 할라고)
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

--sub string 문자뽑아내기
select substr('000101-3234232', 8 , 1)
from dual;
--dual은 임시(dummy) 테이블

select substr('000101-3234232', 8 )
from dual;

select 123*456
from dual;

select empno, ename, length(ename), sal, length(sal)
from emp
where deptno=20;

select ename, job, replace(job, 'A', '$')
from emp;

--index string 특정문자 위치값 구하기 m번째부터 n개째
select instr('MILLER', 'L', 2, 1)
from dual;


select ename, instr(ename, 'L') as e_null, instr(ename, 'L', 1, 1) e_11,
instr(ename, 'L', 1, 2) e_12, instr(ename, 'L', 4, 1) e_41,
instr(ename, 'L', 4, 2) e_42
from emp
order by ename;

--공백제거
select trim('     hello   '), '     hello     '
from dual;

--왼/오른쪽부터 시작, m아닌거 나오면 종료, 지정안하면 공백지움
select ltrim('MMILMLERM', 'M')
from dual;

select rtrim ('RMIRLLERR', 'R')
from dual;

select rtrim ('            RMIR  LL ERR           ')
from dual;

select ename, job, ltrim(job, 'A'), sal, ltrim(sal, 1)
from emp;

--기본트림 양쪽다
select trim(0 from 000987238900) "TRIM Example" from dual;

select empno, job, trim(LEADING 'S' from job),
              trim(TRAILING 'N' from job)
              from emp
              where empno=7844;



--정수 숫자~
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

--날짜~~~숫자로 관리, 따라서 연산가능
select *
from NLS_SESSION_PARAMETERS;

select sysdate +2
from dual;

select systimestamp 
from dual;


-- -는 1달이 채 안되는 일
select ename, hiredate, sysdate, months_between(sysdate, hiredate) m_between,
trunc(months_between(sysdate, hiredate), 0) t_between
from emp
where deptno=10
order by months_between(sysdate, hiredate) desc;

select add_months(sysdate, 5)
from dual;

select next_day(sysdate, '수요일')
from dual;

select next_day(sysdate, 1)
from dual;

select last_day(sysdate)
from dual;

select round(sysdate, 'year'), trunc(sysdate, 'month')
from dual;

-- desc emp 보면 empno num이다. 묵시적형변환해서 지가 계산해준다
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

select sysdate, to_char(sysdate, 'yyyy "년" mm "월" dd "일" dy hh24 mi ss')
from dual;

--locale 지역화폐
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
            'SALESMAN', sal*1.5, sal) as "급 여"
from emp;




--퀴즈 1.
select empno_vc, STDATE_VC,EDDATE_VC, sma_vc,
decode(sma_vc, '1', '오전','오후')
               ,ema_vc,
               decode(ema_vc, '1', '오전', '오후')
from t_holhistory;

--퀴즈 2.

select EMPNO_VC, STATE_VC, 
decode (STATE_VC,'0', '허가',
                '10', '대기', '불허가')
from t_holhistory;





select *
from NLS_SESSION_PARAMETERS;
select sysdate from dual;
select systimestamp-2/24 from dual;
select ename, trunc(trunc(sysdate-hiredate)/7)||'주'
from emp;

select empno, ename,
  case when sal>1000 and sal <=2000 then 'D'
      when sal >2000 and sal <= 3000 then 'C'
      when sal>3000 and sal <=4000 then 'B'
      when sal>4000 and sal <=5000 then 'A'
      when sal>=0 and sal <1000 then 'E'
      end "등급" from emp;
      
    
select empno, ename, sal, job, 
case job when 'ANALYST' then sal*1.1
         when  'CLERK' then sal*1.2
         when 'MANAGER' then sal*1.3
         when 'PRESIDENT' then sal* 1.4
         when 'SALESMAN' then sal*1.5
         else sal
         end "급여"
         from emp;
         
         
         
 ---실습예제
 select EMPNO, ENAME, HIREDATE
 from EMP
 where TO_CHAR(hiredate, 'MM') = '12';
 
 
select empno, ename, lpad(sal, 10, '*') 급여
from emp;

select empno, ename, to_char(hiredate, 'yyyy-mm-dd') 입사일
from emp;
 
select empno, ename, comm, 
decode ( job, 'SALESMAN', '영업사원', '일반사원') 사원종류
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

select empno, ename, sal "급여", 
case when sal>=0 and sal<1001 then 'E'
    when sal>=1001 and sal<2001 then 'D'
    when sal>=2001 and sal<3001 then 'C'
    when sal>=3001 and sal<4001 then 'B'
    when sal>4001 and sal<5001 then 'A'
    end "등급"
from emp;


---7번 decode★★★★★★★★★★★★★
select empno, ename, sal "급여", 
decode ( sal, sign(sal-1000)<0, 'E')
from emp;



