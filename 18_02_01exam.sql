grant create table to exam;

--부서와 사원테이블 2개 생성
ctas
---사원번호(시퀀스) ,사원명,휴대폰,급여,부서번호
--emp_empno_seq   start with 1, increment by 1 

-- empno, ename, hp, sal, deptno

create table emp ( 
    empno number(4),
    ename varchar2(30),
    hp varchar2(11),
    sal number(10),
   deptno number(3),
constraint emp_no_pk primary key(empno),
constraint emp_name_nn check(ename is not null),
constraint emp_hp_uk unique(hp)
);

select *from emp;
insert into emp (empno, ename, hp, sal, deptno)
values (emp_empno_seq.nextval,'신해철','01011112222','5000000',10);
insert into emp (empno, ename, hp, sal, deptno)
values (emp_empno_seq.nextval,'유재하','01011112223','6000000',20);
insert into emp (empno, ename, hp, sal, deptno)
values (emp_empno_seq.nextval,'서태지','01011112224','4000000',30);
insert into emp (empno, ename, hp, sal, deptno)
values (emp_empno_seq.nextval,'유희열','01011112225','3000000',10);

--- sequence 는 수정이 불가능하다  drop sequence name;   으로 삭제함 purge 가 필요없음 
CREATE SEQUENCE emp_empno_seq
INCREMENT BY 1
START WITH 1
;
-------
create table dept (
deptno number(3),  
dname varchar2(30), 
loc varchar2(10), 
constraint dept_no_pk primary key(deptno),  
constraint dept_name_nn check(dname is not null)
);

CREATE SEQUENCE dept_deptno_seq
INCREMENT BY 10
START WITH 10
;

select *from dept;
insert into dept (deptno, dname, loc)
values (dept_deptno_seq.nextval,'운영부','서울');
insert into dept (deptno, dname, loc)
values (dept_deptno_seq.nextval,'영업부','부산');
insert into dept (deptno, dname, loc)
values (dept_deptno_seq.nextval,'개발부','광주');

select e.empno as "사번"
         ,e.ename as "사원명"
        ,e.hp as "전화"
         ,e.sal as "급여"
        ,d.dname as "부서"
        ,d.loc as "도시"
        
from emp e 
join dept d
on e.deptno=d.deptno;

ocp