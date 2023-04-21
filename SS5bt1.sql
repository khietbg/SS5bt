-- create database TEST2;
-- use test2;

-- create table student (
-- studentid int(4) primary key auto_increment,
-- studentname nvarchar(50) not null,
-- age int(4) not null,
-- email varchar(100) not null
-- );

-- create table classses (
-- classid int(4) primary key auto_increment,
-- classname nvarchar(50) not null
-- );

-- create table classStudent (
-- studentId int(4),
-- foreign key (studentId) references student(studentid),
-- classid int(4),
-- foreign key (classid) references classses(classid)
-- );

-- create table subjects (
-- subjectid int(4) primary key auto_increment,
-- subjectname nvarchar(50) not null
-- );

-- create table marks (
-- mark int(4) not null,
-- subjectid int(4),
-- foreign key (subjectid) references subjects(subjectid),
-- studentid int(4),
-- foreign key (studentid) references student (studentid)
-- );


-- insert into student(studentname, age, email) values
-- ("Nguyen quang an", 18, "an@gmail.com"),
-- ("Le Công Vinh", 20, "vinh@gmail.com"),
-- ("Nguyen Van Quyen", 19, "quyen@gmail.com"),
-- ("Phan Thanh Binh", 25, "binh@gmail.com"),
-- ("Phan Van Tai Em", 30, "taiem@gmail.com");

-- insert into classses(classname) values
-- ("C0706L"),
-- ("C0708G");

-- insert into classStudent(studentid, classid) values
-- (1,1),
-- (2,1),
-- (3,2),
-- (4,2),
-- (5,2);

-- insert into subjects(subjectname) values
-- ("SQL"),
-- ("JAVA"),
-- ("C"),
-- ("Visual Basic");

-- insert into marks(mark, subjectid, studentid) values
-- (8,1,1),
-- (4,2,1),
-- (9,1,1),
-- (7,1,3),
-- (3,1,4),
-- (5,2,5),
-- (8,3,3),
-- (1,3,5),
-- (3,2,4);

-- 1.	Hien thi danh sach tat ca cac hoc vien 
-- select * from student;

-- 2.	Hien thi danh sach tat ca cac mon hoc
-- select * from subjects;

-- 3.	Tinh diem trung binh 
-- select st.*, avg(mark) as `diem tb` from student st join marks m on st.studentid = m.studentid group by st.studentid order by avg(mark) desc;

-- 4.	Hien thi mon hoc nao co hoc sinh thi duoc diem cao nhat
-- select s.*,  m.mark as `diem` from subjects s join marks m on s.subjectid = m.subjectid where mark = (select max(mark) from marks);

-- 5. danh stt sx theo điểm giảm dần
-- create view mark_desc as 
-- select * from marks order by mark desc;
-- select * from mark_desc;
-- select @stt:=@stt+1 as stt ,m.* from (select @stt:=0) r,mark_desc m;

-- -- 6.	Thay doi kieu du lieu cua cot SubjectName trong bang Subjects thanh nvarchar(max)
-- alter table subjects 
-- modify subjectName nvarchar(255);

-- 7.	Cap nhat them dong chu « Day la mon hoc «  vao truoc cac ban ghi tren cot SubjectName trong bang Subjects
-- update  subjects set subjectName = concat("day la mon hoc: ",subjectName);
-- select * from subjects;

-- 8.	Viet Check Constraint de kiem tra do tuoi nhap vao trong bang Student yeu cau Age >15 va Age < 50
-- alter table student
-- modify age int check (age>15 and age <50);
-- insert into student(studentname, age, email) values
--  ("Nguyen quang an1", 49, "an@gmail.com");
-- 9.	Loai bo tat ca quan he giua cac bang
-- ALTER TABLE marks DROP FOREIGN KEY studentid;
-- ALTER TABLE marks DROP FOREIGN KEY subjectid;
-- ALTER TABLE classStudent DROP FOREIGN KEY studentid;
-- ALTER TABLE classStudent DROP FOREIGN KEY classid;

-- 10.	Xoa hoc vien co StudentID la 1
-- delete from student
-- where studentid = 1;

-- 11.	Trong bang Student them mot column Status co kieu du lieu la Bit va co gia tri Default la 1
-- alter table student
-- add Status bit default 1;

-- 12.	Cap nhap gia tri Status trong bang Student thanh 0
-- update student
-- set status = 0;
