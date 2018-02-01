grant create table to exam;

--�μ��� ������̺� 2�� ����
ctas
---�����ȣ(������) ,�����,�޴���,�޿�,�μ���ȣ
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
values (emp_empno_seq.nextval,'����ö','01011112222','5000000',10);
insert into emp (empno, ename, hp, sal, deptno)
values (emp_empno_seq.nextval,'������','01011112223','6000000',20);
insert into emp (empno, ename, hp, sal, deptno)
values (emp_empno_seq.nextval,'������','01011112224','4000000',30);
insert into emp (empno, ename, hp, sal, deptno)
values (emp_empno_seq.nextval,'����','01011112225','3000000',10);

--- sequence �� ������ �Ұ����ϴ�  drop sequence name;   ���� ������ purge �� �ʿ���� 
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
values (dept_deptno_seq.nextval,'���','����');
insert into dept (deptno, dname, loc)
values (dept_deptno_seq.nextval,'������','�λ�');
insert into dept (deptno, dname, loc)
values (dept_deptno_seq.nextval,'���ߺ�','����');

select e.empno as "���"
         ,e.ename as "�����"
        ,e.hp as "��ȭ"
         ,e.sal as "�޿�"
        ,d.dname as "�μ�"
        ,d.loc as "����"
        
from emp e 
join dept d
on e.deptno=d.deptno;

ocp