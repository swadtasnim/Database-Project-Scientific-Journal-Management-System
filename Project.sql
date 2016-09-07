drop table Published_Journal;
drop table Proposed_Journal;
drop table Profile_details;
drop table Member;

create table Member
	(user_id number(10) primary key,
		username varchar(6) unique NOT NULL ,
		password varchar(6) unique NOT NULL  
	 );

	create table Profile_details
	(Fullname varchar(20),
		Position varchar(20)  DEFAULT 'Member',
		Profession varchar(20),
		Education varchar(100),
		Research_interest varchar(100),
		Bio varchar(100),
		Publications number(10),
	    user_id number(10) NOT NULL
		);

	create table Proposed_Journal
	(  J_id number(10),
		p_id number(10) primary key,
     user_id number(10) NOT NULL,
	  Title varchar(20) NOT NULL,
      Author varchar(20) NOT NULL,
	  Type varchar(20),
	  Approval_Status varchar(20) DEFAULT 'Not Reviewed'
	  );

    	create table Published_Journal
	(   J_id number(10),
        p_id number(10) ,
     user_id number(10) NOT NULL,
	  Title varchar(200) NOT NULL,
      Author varchar(200) Not null,
	  Type varchar(200),
	  Review varchar(200),
	  Rating number(10)
	  );

 

    alter table Profile_details add constraint Profile_fk
foreign key(user_id) references Member(user_id) on delete cascade; 	

  alter table Proposed_Journal add constraint PrJ_fk1
foreign key(user_id) references Member(user_id) on delete cascade; 

  ALTER TABLE Published_Journal
ADD CONSTRAINT Pb_pk PRIMARY KEY (J_id);

alter table Published_Journal add constraint PbJ_fk1
foreign key(p_id) references Proposed_Journal(p_id) on delete cascade;

alter table Published_Journal add constraint PbJ_fk2
foreign key(user_id) references  Member(user_id) on delete cascade;



    insert into Member values(21,'Akash','11111');
    insert into Member values(22,'Swad','11112');
    insert into Member values(23,'Rashik','11113');
    insert into Member values(24,'Abir','11114');
    insert into Member values(25,'Rafi','11115');
    insert into Member values(26,'Tanmoy','11116');
    insert into Member values(27,'Alvi','111119');
    insert into Member values(28,'Mazid','111122');



    insert into Profile_details values('Swad Tasnim','Admin','Professor','B.Sc in KUET','Mathematics,Computation,Logic','Born in Dhaka',20,22);
    insert into Profile_details values('Al Mamun','Reviewer','Professor','B.Sc in KUET','Mathematics','Born in Khulna',5,21);
    insert into Profile_details values('Rashik Zaman','Reviewer','Engineer','B.Sc in MIT','Physics','Born in Kushtia',10,23);
    insert into Profile_details values('Abir Rahman','Member','Associate Professor','B.Sc in Ruet','Chemistry','Born in Barisal',2,24);
    insert into Profile_details values('Rafi Huq','Member','Doctor','MBBS in DMC ','Medicine','Born in Rajshahi',2,25);
    insert into Profile_details values('Tanmoy Dutta','Member','Programmer','B.Sc in Ruet','Competitive Programming','Born in Khulna',2,26);
    insert into Profile_details values('Alvi Khalil','Member','Senior Scientist','B.Sc in Dhaka University','Biotechnology','Born in Sylhet',2,27);
    insert into Profile_details values('Al Mazid','Member','Associate Professor','B.Sc in Ruet','Chemistry','Born in Barisal',2,28); 	

    insert into Proposed_Journal values(1,10000,22,'the Mathematics','Swad Tasnim','Mathematics','Approved');
    insert into Proposed_Journal values(2,100001,21,'the Code','Al Mamun','Programming','Approved');
    insert into Proposed_Journal values(3,100002,23,'the Computation','Rashik Zaman','Computation','Not Reviewed');
    insert into Proposed_Journal values(4,100003,24,'Fundamental Physics','Abir Rahman','Physics','Not Reviewed');
    insert into Proposed_Journal values(5,100004,25,'String Theory','Rafi Huq','Physics','Not Reviewed');
    insert into Proposed_Journal values(6,100005,26,'Applied Chemistry','Tanmoy Dutta','Chemistry','Rejected');
    insert into Proposed_Journal values(7,100006,27,'Bio Life','Alvi Khalil','Medicine','Approved');
    insert into Proposed_Journal values(8,100007,28,'Society','Al Mazid','Social Science','Rejected');
    insert into Proposed_Journal values(9,10008,22,'Nature','Swad Tasnim','Soil Science','Approved');
    insert into Proposed_Journal values(10,10009,23,'M Theory','Rashik Zaman','Physics','Approved');
    insert into Proposed_Journal values(11,10010,27,'Darwinism','Alvi Khalil','Evolution','Approved');


     	


    insert into Published_Journal values(1,10000,22,'the Mathematics','Swad Tasnim','Mathematics','Execellent Writting',5);
    insert into Published_Journal values(2,100001,21,'the Code','Al Mamun','Competitive Programming','A Good One', 3);
    insert into Published_Journal values(3,10008,22,'Nature','Swad Tasnim','Soil Science','Execellent Writting',5);
    insert into Published_Journal values(4,10009,23,'M Theory','Rashik Zaman','Physics','Execellent Writting',4);
    insert into Published_Journal values(5,10010,27,'Darwinism','Alvi Khalil','Evolution','A Good one',5);

   
  describe Member;
 select * from Member;
 describe Profile_details;
 select * from Profile_details;
 describe Proposed_Journal;
 select * from Proposed_Journal;
 describe Published_Journal;
 select * from Published_Journal;

-------------------------------------------------------------------------------------
==========================================QUERY=======================================
---------------------------------------------------------------------------------------
select count(user_id) from Member;
select count(user_id) from Profile_details where user_id>=24;

select sum(Rating) as Rating_Sum from Published_Journal;

select avg(user_id) from Member;

select max(Publications) from Profile_details;
select min(Publications) from Profile_details;

select p.title,p.Author from Proposed_Journal p union select b.title,b.Author from Published_Journal b;
select p.title,p.Author from Proposed_Journal p intersect select b.title,b.Author from Published_Journal b;


select m.Author,m.title from Published_Journal m union  select t.Author,t.title from Proposed_Journal t where t.p_id in(select p_id from Proposed_Journal where p_id>=24);
select m.Author,m.title from Published_Journal m union all select t.Author,t.title from Proposed_Journal t where t.p_id in(select p_id from Proposed_Journal where p_id>=24);

select m.Author,m.title from Published_Journal m intersect select t.Author,t.title from Proposed_Journal t where t.p_id in(select p_id from Proposed_Journal where p_id>=24);
select m.Author,m.title from Proposed_Journal m minus select t.Author,t.title from Published_Journal t where t.p_id in(select p_id from Proposed_Journal where p_id>=24);

 
 select u.Author,r.Title from Published_Journal u join Proposed_Journal r on u.p_id=r.p_id;
 select u.Author,r.Title from Published_Journal u left outer join Proposed_Journal r on u.p_id = r.p_id;
 select u.Author,r.Title from Published_Journal u right outer join Proposed_Journal r on u.p_id = r.p_id;

 select p.author,p.title,b.Rating from published_journal b join Proposed_Journal p using (p_id);


    select * from Published_Journal  natural join Proposed_Journal ;
    select p.author,r.title from Published_Journal p right outer join Proposed_Journal r on p.p_id=r.p_id;

    select author,title from published_journal where name in(select author from published_journal where Rating=5);
    select author,count(title) from published_journal group by author;



-----------------------------------------------------------------------------------------------
--==========================================PROCEDURE============================================
--------------------------------------------------------------------------------------------------
 create or replace PROCEDURE Register(
 n Member.username%type,
 p Member.password%type
)
is
num number;
begin
select max(user_id)+1 into num from Member;
insert into Member values(num,n,p);
if sql%found then
 dbms_output.put_line('Çongratulations!!! you are registered');
 dbms_output.put_line('user_id: '||num);
 dbms_output.put_line('username: '||n);
 dbms_output.put_line('password: '||p);
 else
  dbms_output.put_line('Try Again!!!');	
  end if;
 end Register;
 /

-----------------------------------


 create or replace PROCEDURE About(
 n2 profile_details.user_id%type,
 F profile_details.Fullname%type,
 Pr profile_details.Profession%type,
 E profile_details.Education%type,
 Re profile_details.Research_interest%type,
 B profile_details.Bio%type		
)
is
p varchar(200):='Member';
pub number:=0;


begin

insert into profile_details values(F,p,Pr,E,Re,B,pub,n2);
if sql%found then
 dbms_output.put_line('your profile_details:');
 dbms_output.put_line('Fullname: '||F);
 dbms_output.put_line('Position: '||p);
 dbms_output.put_line('Profession: '||Pr);
  dbms_output.put_line('Education: '||E);
   dbms_output.put_line('Research_interest: '||Re);
    dbms_output.put_line('Bio: '||B);
     dbms_output.put_line('Publications: '||pub);
      dbms_output.put_line('user_id: '||n2);
 else
  dbms_output.put_line('Try Again!!!');	
  end if;
 end About;
 /
 --------------------------------

----This will check whether a paper is in the database or not, if exists, then it will show the author detail


 CREATE OR REPLACE PROCEDURE getid(id  Published_Journal.p_id%type) IS

b_name  Published_Journal.title%type; 
id2 Published_Journal.p_id%type;
A_name Published_Journal.Author%type;
a profile_details.Fullname%type;
b profile_details.Position%type;
c profile_details.Profession%type;
e published_journal.user_id%type;

begin
select p_id into id2 from Published_Journal where p_id=id ;
if id=id2 then
             select Author,user_id,title into A_name,e,b_name from Published_Journal where p_id=id;
             dbms_output.put_line('The Book  found in the database and the Author is '|| A_name);
             dbms_output.put_line('Title= '||b_name);
              select Fullname,Position,Profession into a,b,c from profile_details where user_id=e;
              
             dbms_output.put_line('Fullname: '|| a);
             dbms_output.put_line('Position: '|| b);
             dbms_output.put_line('Profession: '|| c);
             
           
             
             
else
    dbms_output.put_line('The Book is not found in database');
end if;
end;
/

begin
getid(100002);
end;
/
----------------------------------------------
create or replace PROCEDURE Insert_Paper(
b_id Proposed_Journal.p_id%type,
u proposed_Journal.user_id%type,
t Proposed_Journal.title%type,
ty Published_Journal.type%type
)
is
a profile_details.Fullname%type;
num number(10);
num2 number(10);
begin
 select count(j_id)+1 into num from Proposed_Journal;
 select Fullname into a from profile_details where user_id=u;
 insert into proposed_Journal values(num,b_id,u,t,a,ty,'Not Reviewed');

end;
 /
------------------------------------------------------------------------------------------
=============================================PACKAGE======================================
------------------------------------------------------------------------------------------
------This package is for Reviewing papers

set serveroutput on

CREATE PACKAGE find AS
   PROCEDURE find_author(id profile_details.user_id%type);
END find;
/


CREATE OR REPLACE PACKAGE BODY find AS
   PROCEDURE find_author(id profile_details.user_id%TYPE) IS
   a profile_details.Fullname%TYPE;
   BEGIN
      SELECT Fullname INTO a
      FROM profile_details
      WHERE user_id = id;
      dbms_output.put_line('Fullname: '|| a);
      dbms_output.put_line('Fullname: '|| a);

   END find_author;
END find;
/
-----------------------------------------------------------
set serveroutput on

CREATE PACKAGE Review AS
   PROCEDURE  Review_Paper(
num3 number,
ap varchar,
ap2 varchar,
r number
) ;
END Review;
/


CREATE OR REPLACE PACKAGE BODY Review AS
   
Procedure Review_Paper(num3 number,ap varchar,ap2 varchar,r number) is
b_id proposed_Journal.p_id%type;
u proposed_Journal.user_id%type;
t proposed_Journal.title%type;
a proposed_Journal.author%type;
ty proposed_Journal.type%type;
num number;
num2 number;
begin
select p_id,user_id,title,Author,type into  b_id,u,t,a,ty from Proposed_Journal where p_id=num3;
 if ap='y' then
 update Proposed_Journal set Approval_Status='Approved' where p_id=num3;
select count(j_id)+1 into num from published_journal;
insert into published_journal values(num,b_id,u,t,a,ty,ap2,r);
	if sql%found then
 	select count(p_id) into num2 from published_journal where user_id=u;
 	update profile_details set Publications=num2 where user_id=u;
   end if;	
else
 update Proposed_Journal set Approval_Status='Rejected' where p_id=num3;
 end if;	
end Review_Paper;
end Review; 
/

set serveroutput on

declare
cursor book_cur is select p_id,author,title from proposed_journal where Approval_Status='Not Reviewed';
bc Book_cur%rowtype; 

begin
open book_cur ;
loop
 fetch book_cur into bc;
exit when book_cur%notfound;
 dbms_output.put_line(bc.p_id||'-'||bc.title||'-'||bc.author);
  end loop;
  close book_cur;
  end;
  /

  
DECLARE
    num3 number:=&p_id;
ap varchar(200);
ap2 varchar(200);
r number;
BEGIN
  dbms_output.put_line('Are your approving it? y/n');
   ap:=&Approval_Status;
   ap2:=&Remark;
   r:=&Rating;
   Review.Review_Paper(num3,ap,ap2,r);
END;
/
----------------------------------------------------------------------------------
===========================================FUNCTION===============================
----------------------------------------------------------------------------------

 CREATE OR REPLACE FUNCTION getUser(n varchar, p varchar)
RETURN number
IS
 
  num number;
  
  CURSOR user IS
  SELECT user_id
  FROM Member
  WHERE username=n and password=p;
  
  u_name Member.user_id%TYPE;
  
BEGIN
  
  OPEN user;
  FETCH user INTO u_name;
  if user%found then
     dbms_output.put_line('User found');
      num:=1;
  else
    dbms_output.put_line('User not found');
      num:=2;
   end if;    
  CLOSE user;
  
 
  
END getUser;
/

-------------------------------------------
set serveroutput on

create or replace function maxi return number is
	maxr published_journal.Rating%type;
	begin
	 select max(Rating) into maxr from published_journal;
	 return maxr;
	 end;
	 /
----------------------------------------------------------
	 
    

--------------------------------------------------------------------------------------------

==============================================TRIGGER=======================================
--------------------------------------------------------------------------------------------


create table J_audit
	(   b_id number(10),
		new_title varchar2(30),
		old_title varchar2(30),
		user_name varchar2(30),
		entry_date varchar2(30),
		operation varchar2(30)
		);

----------------------------------------
	set serveroutput on
CREATE OR REPLACE TRIGGER publish_audit
BEFORE INSERT OR DELETE OR UPDATE ON published_journal
FOR EACH ROW  
declare
  cmun number(10);
  cnum2 number(10);
BEGIN 

  IF INSERTING THEN
  INSERT INTO J_audit (b_id,new_title,old_title, user_name, entry_date, operation) VALUES(:NEW.p_id,:NEW.title, Null , user, TO_CHAR(sysdate, 'DD/MON/YYYY HH24:MI:SS'), 'Publish');
  ELSIF DELETING THEN
  INSERT INTO J_audit (b_id,new_title,old_title, user_name, entry_date, operation) VALUES(:OLD.p_id,NULL,:OLD.title, user, TO_CHAR(sysdate, 'DD/MON/YYYY HH24:MI:SS') , 'Delete');
  update proposed_journal set Approval_Status='Rejected' where p_id=:OLD.p_id;
  select user_id into cnum2 from published_journal where p_id=:OLD.p_id;
  select count(p_id) into cmun from published_journal where user_id=cnum2;
  update profile_details set Publications=cmun where user_id=cnum2;
  ELSIF UPDATING THEN
  INSERT INTO J_audit (b_id,new_title,old_title, user_name, entry_date, operation) VALUES(:OLD.p_id,:NEW.title, :OLD.title, user, TO_CHAR(sysdate, 'DD/MON/YYYY HH24:MI:SS'),'Update');
  END IF;
END;
 /
----------------------------------
set serveroutput on
CREATE OR REPLACE TRIGGER proposed_audit
BEFORE INSERT OR DELETE OR UPDATE ON  proposed_journal
FOR EACH ROW  

BEGIN 

  IF INSERTING THEN
  INSERT INTO myaudit (b_id,new_title,old_title, user_name, entry_date, operation) VALUES(:NEW.p_id,:NEW.title, Null , user, TO_CHAR(sysdate, 'DD/MON/YYYY HH24:MI:SS'), 'Propose');
  ELSIF DELETING THEN
  INSERT INTO myaudit (b_id,new_title,old_title, user_name, entry_date, operation) VALUES(:OLD.p_id,NULL,:OLD.title, user, TO_CHAR(sysdate, 'DD/MON/YYYY HH24:MI:SS') , 'Delete');
  ELSIF UPDATING THEN
  INSERT INTO myaudit (b_id,new_title,old_title, user_name, entry_date, operation) VALUES(:OLD.p_id,:NEW.title, :OLD.title, user, TO_CHAR(sysdate, 'DD/MON/YYYY HH24:MI:SS'),'Update');
  END IF;
END;
 /
-----------------------------------------------------------------------------------------

 create table user_audit(
 	       u_id number(10),
 	       new_username varchar(30),
 	       old_username varchar(30),
 	       user_name varchar2(30),
		   entry_date varchar2(30),
		   operation varchar2(30)
		   );


 set serveroutput on
CREATE OR REPLACE TRIGGER Registration_audit
BEFORE INSERT OR DELETE on Member
FOR EACH ROW  

BEGIN 

  IF INSERTING THEN
  INSERT INTO user_audit (u_id,new_username,old_username, user_name, entry_date, operation) VALUES(:NEW.user_id,:NEW.username, Null , user, TO_CHAR(sysdate, 'DD/MON/YYYY HH24:MI:SS'), 'Registered');
  ELSIF DELETING THEN
  INSERT INTO user_audit (u_id,new_username,old_username, user_name, entry_date, operation) VALUES(:OLD.user_id,NULL,:OLD.username, user, TO_CHAR(sysdate, 'DD/MON/YYYY HH24:MI:SS') , 'Unregistered');
 end if;
END;
 /



 set serveroutput on
CREATE OR REPLACE TRIGGER profile_audit
BEFORE INSERT OR DELETE or UPDATE on profile_details
FOR EACH ROW  

BEGIN 

  IF INSERTING THEN
  INSERT INTO user_audit (u_id,new_username,old_username, user_name, entry_date, operation) VALUES(:NEW.user_id,:NEW.Fullname, Null , user, TO_CHAR(sysdate, 'DD/MON/YYYY HH24:MI:SS'), 'Insert');
  ELSIF DELETING THEN
  INSERT INTO user_audit (u_id,new_username,old_username, user_name, entry_date, operation) VALUES(:OLD.user_id,NULL,:OLD.Fullname, user, TO_CHAR(sysdate, 'DD/MON/YYYY HH24:MI:SS') , 'Delete');
  ELSIF UPDATING THEN
  INSERT INTO user_audit (u_id,new_username,old_username, user_name, entry_date, operation) VALUES(:OLD.user_id,:NEW.Fullname,:OLD.Fullname, user, TO_CHAR(sysdate, 'DD/MON/YYYY HH24:MI:SS') , 'Update');
 end if;
END;
 /

--------------------------------------------------------



