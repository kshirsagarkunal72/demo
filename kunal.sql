/*
drop procedure if exists k1;
delimiter $
create procedure k1()
begin
	declare v_value int;
	if v_value=0 then
		select "The entered value is 0" as "Message box";
	else if v_value=1
		select "The entered value is 1" as "Message box";
	end if;
end $
delimiter ;
-----------------------------------------------------
drop trigger if exists k1;
delimiter $
create trigger k1 before insert on student for each row
begin
	insert into log values(new.ID,new.namefirst, new.namelast, new.DOB , new.emailID);
end $
delimiter ;
-------------------------------------------------------


delimiter $
drop procedure if exists pr1;
create procedure pr1()
BEGIN
	declare x varchar (20) default "Infoway";
	declare y varchar (20) default " March 2022";
	select concat (x, " " ,y) as "PG-DAC Batch";
end $
delimiter ;
-------------------------------------

delimiter $
drop procedure if exists pr2;
create procedure pr2()
BEGIN
	select "HELLO WORLD" as "Message Window";
end $
delimiter ;
------------------------------------------
delimiter $
drop procedure if exists pr3;
create procedure pr3(x int)
begin 
	declare y int;
	declare	z int;
	set y=0;
	set z=1;
	lbl:loop
		select z;
		set z=x*y;
		set y=y+1;
		if y>11 then 
	leave lbl;
		end if;
		end loop lbl;
end $
delimiter ;
-----------------------------------------------------

delimiter $
drop procedure if exists pr4;
create procedure pr4(a int, b int, c int)
BEGIN
	select a, b, c;
	if a>b && a>c THEN
			select a;
			else if b>a && b>c then
			select b; 
		else
		select c;
			end if;
	end if;
end $
delimiter ;
-------------------------------------------------

delimiter $
drop procedure if exists addUser;
create procedure addUser(username varchar(15), password varchar(10), email varchar(30))
begin 
	insert into login values(username, password, email);
end $
delimiter ;
------------------------------------------------

drop procedure if exists checkUser;
delimiter $
create procedure checkUser(email varchar(45),id int,curr_date date, curr_time TIME, message
varchar(100) )
begin
declare flag boolean;
select username,pass from login where emailid=email;
select emailid into flag from login where emailid=email;
if flag is null then
insert into LOG values(id,curr_date , curr_time , message);
end if;
end $
delimiter ;

----------------------------------------------

drop procedure if exists getQualification;
delimiter $
create procedure getQualification(stuID int)
begin
declare flag boolean;
select * from student, student_qualifications where student.id=stuID and
student.id=student_qualifications.studentID;
select id into flag from student where id =stuID;
if flag is null then
select "Student nott found" as "Message Window";
end if;
end $
delimiter ;
-------------------------------------------------

drop procedure if exists addStudent;
delimiter $
create procedure addStudent(id1 int,namefirst varchar(45),namelast varchar(45),dob
date,emailid varchar(45),id2 int,studentid1 int, number int, isActive tinyint(1) , id3 int ,studentid2
int, address varchar(45))
begin
insert into student values (id1,namefirst,namelast,dob,emailid);
insert into student_phone values (id2,studentid1,numberr,isActive);
insert into student_address values (id3,studentID2,address);
end $
delimiter ;

-------------------------------------------------------


drop procedure if exists addQualification;
delimiter $
create procedure addQualification(S_ID int, ID int, studentID int, name varchar(128), college
varchar(128), university varchar(128), marks varchar(45), year int, out msg varchar(100))
begin
declare x int;
select student.id into x from student where student.ID=S_ID;
if x is not null then
insert into student_qualifications values(ID,studentID,name,college,university,marks,year);
set msg="Record inserted";
else
select "Student not found";
end if;
end $
delimiter ;
----------------------------------------------------------


drop function if exists autoNumberto;
delimiter $
create function autoNumberto() returns int
deterministic
begin
	return(select ifnull(max(studentid), 0) + 1 from student_new);
end $
delimiter ;
---------------------------------------------------------------

drop function if exists checkuser;
delimiter $
create function checkuser(e_ID varchar(40)) returns varchar(40)
deterministic
begin
	declare x varchar(128);
	select emailid into x from login where emailid = e_ID;
	
	if x is null then
		return(select "Employee doesnot exist");

	else
		return(select concat("Username : ",(select username from Login where emailid = x), "  ", "Password : ",(select pass from login where emailid = x)));
	end if;
	
end $
delimiter ;
-----------------------------------------------------------
drop function if exists sum_marks;
delimiter $
create function sum_marks(studid int) returns int
deterministic
BEGIN 
	declare sum int;
	select sum(marks) into sum from student_qualifications where name in ('BE', '10', '12')
	and studentid-studid;
	return sum;
end $
delimiter ;
--------------------------------------------------


drop trigger if exists insertStudent;
delimiter $
create trigger insertStudent after insert on student for each row 
begin
	insert into log values(default, curr_date(), curr_time(),"Record Inserted Succesfully");
end $
delimiter ;
---------------------------------------------------


drop trigger if exists insertDuplicate;
delimiter $
create trigger insertDuplicate before insert on student for each ROW
BEGIN
	insert into Student_LOG values(new.ID, new.namefirst, new.namelast, new.DOB, new.emailID);
	
End $
delimiter ;
----------------------------------------------- 

drop trigger if exists updateStudent;
delimiter $
create trigger updateStudent after update on student for each row
begin
	Insert into Student_LOG values(new.ID, new.namefirst, new.namelast, new.DOB, new.emailID);
	
end $
delimiter ;
-----------------------------------------------------

DROP TRIGGER IF EXISTS triggerName;
delimiter $
CREATE TRIGGER triggerName AFTER INSERT ON student FOR EACH ROW
begin
     if DATE_FORMAT (now(), '%W') = 'Sunday' then
         signal sqlstate '42000' set message_text = 'Today you cannot insert data in student table’;
     end if;
end $
delimiter ;
---------------------------------------------------------

DROP PROCEDURE IF EXISTS getAllStudent;
delimiter $$

CREATE PROCEDURE getAllStudent()
BEGIN
    declare v_ID int;
    declare v_namefirst, v_namelast  varchar(45);
    declare v_dob date;
    declare v_emailID varchar(128);
    declare cur1 CURSOR FOR SELECT * FROM student;

    declare EXIT HANDLER FOR NOT FOUND SELECT "No more student found";
    OPEN cur1;
         loopLabel: LOOP
              FETCH cur1 INTO v_ID, v_namefirst, v_namelast, v_dob, v_emailID;
              SELECT v_ID, v_namefirst, v_namelast, v_dob, v_emailID;
         END LOOP loopLabel;
    CLOSE cur1;
END $$
delimiter ;
--------------------------------------------------------

DROP FUNCTION IF EXISTS getRandomStudent;
delimiter $
CREATE FUNCTION getRandomStudent() RETURNS VARCHAR(2000)
deterministic
begin
    declare v_ID INT;
    declare v_namefirst VARCHAR(45) ;
    declare v_namelast VARCHAR(45) ;
    declare v_DOB DATE ;
    declare v_emailID VARCHAR(128);

     SELECT ID, namefirst, namelast, DOB, emailID INTO v_ID, v_namefirst, v_namelast, v_DOB, v_emailID FROM 
     student ORDER BY rand() LIMIT 1;
    return (concat(v_ID," ", v_namefirst," ", v_namelast," ", v_DOB," ", v_emailID));
end $
delimiter ;
---------------------------------------------------------

drop procedure if exists studentDelete;
delimiter $
create procedure studentDelete(_id int, out msg varchar(100))
begin
declare x int;
select student.id into x from student where student.id=_id;
if x is not null then
delete from student where student.id=_id;
set msg="Student Deleted";
else
select "Student not deleted";
end if;
end $
delimiter ;
----------------------------------------------------------
*/

drop PROCEDURE if EXISTS studentDelete;
delimiter $
create procedure studentDelete(_id int,out msg varchar(100))
begin
declare x int;
	select student.id into x from student where student.ID=_id;
	
	if x is not null then
delete from student where student.id=_id;
set msg="Student Deleted";
else
select "Student not Deleted";
end if;

	
end $
delimiter ;
