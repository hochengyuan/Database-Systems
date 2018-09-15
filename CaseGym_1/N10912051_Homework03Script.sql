/* STUDENT NAME: CHEN-YUAN HO */
/* N NUMBER: N10912051. */

DROP TABLE ANSWER01;
DROP TABLE ANSWER02;
DROP TABLE ANSWER03;
DROP TABLE ANSWER04;
DROP TABLE ANSWER05;
DROP TABLE ANSWER06;
DROP TABLE ANSWER07;
DROP TABLE ANSWER08;

DROP TABLE TEMP0;
DROP TABLE TEMP1;
DROP TABLE TEMP2;
DROP TABLE TEMP3;
DROP TABLE TEMP4;
DROP TABLE TEMP5;
DROP TABLE TEMP6;
DROP TABLE TEMP7;
DROP TABLE TEMP8;
DROP TABLE TEMP9;
DROP TABLE TEMP10;
DROP TABLE TEMP11;
DROP TABLE TEMP12;
DROP TABLE TEMP13;
DROP TABLE TEMP14;
DROP TABLE TEMP15;
DROP TABLE TEMP16;
DROP TABLE TEMP17;
DROP TABLE TEMP18;
DROP TABLE TEMP19;
DROP TABLE TEMP20;

DROP TABLE TEACHES;
DROP TABLE BORROWS;
DROP TABLE EQUIPMENT;
DROP TABLE PRIZE;
DROP TABLE PROJECT;
DROP TABLE COURSE;
DROP TABLE COACH;
DROP TABLE MANAGER;
DROP TABLE MEMBER;
DROP TABLE PERSON;

CREATE TABLE PERSON (
	IDNUMBER CHAR(30) PRIMARY KEY,
	NAME CHAR(30) NOT NULL,
	PHONE CHAR(30)
);

CREATE TABLE MEMBER (
	IDNUMBER CHAR(30) PRIMARY KEY,
	STARTDATE CHAR(30) NOT NULL,
	ENDDATE CHAR(30) NOT NULL,
	MEMBERSHIP CHAR(30) NOT NULL,
	FOREIGN KEY (IDNUMBER) REFERENCES PERSON (IDNUMBER) ON DELETE CASCADE
);

CREATE TABLE MANAGER (
	IDNUMBER CHAR(30) PRIMARY KEY,
	LOCATION CHAR(30) NOT NULL,
	ROOMNUM CHAR(30) NOT NULL,
	EMAIL CHAR(30),
	FOREIGN KEY (IDNUMBER) REFERENCES PERSON (IDNUMBER) ON DELETE CASCADE
);

CREATE TABLE COACH (
	IDNUMBER CHAR(30) PRIMARY KEY,
	EMAIL CHAR(30) NOT NULL,
	LVL CHAR(30) NOT NULL,
	SUPERVISOR CHAR(30),
	FOREIGN KEY (IDNUMBER) REFERENCES PERSON (IDNUMBER) ON DELETE CASCADE,
	FOREIGN KEY (SUPERVISOR) REFERENCES MANAGER (IDNUMBER) ON DELETE CASCADE
);

CREATE TABLE COURSE (
	NAME CHAR(30) NOT NULL,
	LVL CHAR(30) NOT NULL,
	MAXSTUDENTS CHAR(30) NOT NULL,
	PRIMARY KEY (NAME, LVL)
);

CREATE TABLE PROJECT (
	NAME CHAR(30) NOT NULL,
	IDNUMBER CHAR(30) NOT NULL,
	PRIMARY KEY (NAME, IDNUMBER),
	FOREIGN KEY (IDNUMBER) REFERENCES MEMBER (IDNUMBER) ON DELETE CASCADE
);


CREATE TABLE PRIZE (
	PRIZEID CHAR(30) NOT NULL,
	NAME CHAR(30) NOT NULL,
	IDNUMBER CHAR(30) NOT NULL,
	PRIMARY KEY (PRIZEID, NAME, IDNUMBER),
	FOREIGN KEY (NAME, IDNUMBER) REFERENCES PROJECT (NAME, IDNUMBER) ON DELETE CASCADE
);


CREATE TABLE EQUIPMENT (
	NAME CHAR(30) PRIMARY KEY,
	IDNUMBER CHAR(30) NOT NULL,
	COURSENAME CHAR(30) NOT NULL,
	COURSELVL CHAR(30) NOT NULL,
	AMOUNT CHAR(30),
	USEAMOUNT CHAR(30),
	FOREIGN KEY (COURSENAME, COURSELVL) REFERENCES COURSE (NAME, LVL) ON DELETE CASCADE,
	FOREIGN KEY (IDNUMBER) REFERENCES MEMBER (IDNUMBER) ON DELETE CASCADE
);


CREATE TABLE BORROWS (
	EQUIPNAME CHAR(30) NOT NULL,
	PROJNAME CHAR(30) NOT NULL,
	MEMBERID CHAR(30) NOT NULL,
	DUE CHAR(30) NOT NULL,
	PRIMARY KEY (EQUIPNAME, PROJNAME, MEMBERID),
	FOREIGN KEY (EQUIPNAME) REFERENCES EQUIPMENT (NAME) ON DELETE CASCADE,
	FOREIGN KEY (PROJNAME, MEMBERID) REFERENCES PROJECT (NAME, IDNUMBER) ON DELETE CASCADE
);

CREATE TABLE TEACHES (
	NAME CHAR(30) NOT NULL,
	LVL CHAR(30) NOT NULL,
	IDNUMBER CHAR(30) NOT NULL,
	EVALUATORS CHAR(30),
	TEACHDATE CHAR(30),
	PRIMARY KEY (NAME, LVL, IDNUMBER),
	FOREIGN KEY (NAME, LVL) REFERENCES COURSE (NAME, LVL) ON DELETE CASCADE,
	FOREIGN KEY (EVALUATORS) REFERENCES COACH (IDNUMBER) ON DELETE CASCADE,
	FOREIGN KEY (IDNUMBER) REFERENCES COACH (IDNUMBER) ON DELETE CASCADE
);

INSERT INTO PERSON VALUES('101', 'Abigail Black', '8577633767');
INSERT INTO PERSON VALUES('102', 'Diane Fisher', '4965213467');
INSERT INTO PERSON VALUES('103', 'Penelope Nolan', null);
INSERT INTO PERSON VALUES('104', 'Steven Lewis', '7513675727');
INSERT INTO PERSON VALUES('105', 'Jane Ross', null);
INSERT INTO PERSON VALUES('106', 'Bernadette Morgan', '61118264563');
INSERT INTO PERSON VALUES('107', 'Lily Springer', null);
INSERT INTO PERSON VALUES('108', 'Zoe Smith', '3824469628');
INSERT INTO PERSON VALUES('109', 'Amanda Mackenzie', null);
INSERT INTO PERSON VALUES('110', 'Adrian Butler', '9976391944');
INSERT INTO PERSON VALUES('111', 'Abigail Black', null);
INSERT INTO PERSON VALUES('112', 'Hannah Black', '8948396935');
INSERT INTO PERSON VALUES('113', 'Vanessa Gill', '5257205498');
INSERT INTO PERSON VALUES('114', 'Bella Clark', '3841384625');
INSERT INTO PERSON VALUES('115', 'Jake Underwood', '6128465212');
INSERT INTO PERSON VALUES('116', 'Virgini Wright', null);
INSERT INTO PERSON VALUES('117', 'Joseph Young', '1794543929');
INSERT INTO PERSON VALUES('118', 'Dorothy Miller', '1795962125');
INSERT INTO PERSON VALUES('119', 'Dave Mitty', '8573399979');
INSERT INTO PERSON VALUES('120', 'Hilary Mason', null);

INSERT INTO MEMBER VALUES('101', TO_DATE('1/1/2017','MM/DD/YYYY'), TO_DATE('5/3/2017','MM/DD/YYYY'), 'planA');
INSERT INTO MEMBER VALUES('102', TO_DATE('2/6/2017','MM/DD/YYYY'), TO_DATE('8/12/2017','MM/DD/YYYY'), 'planB');
INSERT INTO MEMBER VALUES('104', TO_DATE('1/5/2016','MM/DD/YYYY'), TO_DATE('1/5/2017','MM/DD/YYYY'), 'planC');
INSERT INTO MEMBER VALUES('105', TO_DATE('4/3/2017','MM/DD/YYYY'), TO_DATE('5/3/2017','MM/DD/YYYY'), 'planC');
INSERT INTO MEMBER VALUES('106', TO_DATE('3/1/2017','MM/DD/YYYY'), TO_DATE('7/5/2017','MM/DD/YYYY'), 'planA');
INSERT INTO MEMBER VALUES('107', TO_DATE('12/1/2016','MM/DD/YYYY'), TO_DATE('1/1/2017','MM/DD/YYYY'), 'planA');
INSERT INTO MEMBER VALUES('110', TO_DATE('1/9/2017','MM/DD/YYYY'), TO_DATE('3/9/2017','MM/DD/YYYY'), 'planB');
INSERT INTO MEMBER VALUES('111', TO_DATE('11/1/2016','MM/DD/YYYY'), TO_DATE('3/1/2017','MM/DD/YYYY'), 'planC');
INSERT INTO MEMBER VALUES('112', TO_DATE('12/8/2016','MM/DD/YYYY'), TO_DATE('12/1/2017','MM/DD/YYYY'), 'planA');
INSERT INTO MEMBER VALUES('114', TO_DATE('4/1/2017','MM/DD/YYYY'), TO_DATE('4/27/2017','MM/DD/YYYY'), 'planB');
INSERT INTO MEMBER VALUES('117', TO_DATE('1/13/2016','MM/DD/YYYY'), TO_DATE('1/13/2017','MM/DD/YYYY'), 'planB');
INSERT INTO MEMBER VALUES('119', TO_DATE('2/5/2017','MM/DD/YYYY'), TO_DATE('4/5/2017','MM/DD/YYYY'), 'planA');

INSERT INTO MANAGER VALUES('101', 'New York City', '305', 'ablack@abc.com');
INSERT INTO MANAGER VALUES('103', 'Phoenix', '207', null);
INSERT INTO MANAGER VALUES('106', 'Seattle', '302', null);
INSERT INTO MANAGER VALUES('107', 'Seattle', '405', null);
INSERT INTO MANAGER VALUES('108', 'New York City', '208', 'zsmith@abc.com');
INSERT INTO MANAGER VALUES('113', 'Phoenix', '305', 'vgrill@abc.com');
INSERT INTO MANAGER VALUES('117', 'New York City', '203', 'jyoung@abc.com');
INSERT INTO MANAGER VALUES('118', 'Seattle', '107', 'dmiller@abc.com');

INSERT INTO COACH VALUES('102', 'dfisher@abc.com', '5', null);
INSERT INTO COACH VALUES('103', 'pnolan@abc.com', '3', null);
INSERT INTO COACH VALUES('105', 'jross@abc.com', '4', null);
INSERT INTO COACH VALUES('109', 'amackenzie@abc.com', '2', '113');
INSERT INTO COACH VALUES('111', 'ablack@abc.com', '4', '117');
INSERT INTO COACH VALUES('112', 'hblack@abc.com', '3', null);
INSERT INTO COACH VALUES('114', 'bclark@abc.com', '1', null);
INSERT INTO COACH VALUES('115', 'junderwood@abc.com', '3', '101');
INSERT INTO COACH VALUES('116', 'vwright@abc.com', '2', '108');
INSERT INTO COACH VALUES('120', 'hmason@abc.com', '2', null);

INSERT INTO COURSE VALUES('Database Systems', '3', '30');
INSERT INTO COURSE VALUES('Machine Learning', '4', '20');
INSERT INTO COURSE VALUES('Algorithms', '2', '50');
INSERT INTO COURSE VALUES('Database Systems', '4', '30');
INSERT INTO COURSE VALUES('Distributed Systems', '3', '40');
INSERT INTO COURSE VALUES('Machine Learning', '1', '60');
INSERT INTO COURSE VALUES('Operating Systems', '2', '30');
INSERT INTO COURSE VALUES('Computer Vision', '3', '40');

INSERT INTO PROJECT VALUES('Data Analytics', '102');
INSERT INTO PROJECT VALUES('System Design', '105');
INSERT INTO PROJECT VALUES('Image Recognition', '106');
INSERT INTO PROJECT VALUES('System Optimization', '107');
INSERT INTO PROJECT VALUES('Data Prediction', '112');
INSERT INTO PROJECT VALUES('Data Search', '114');
INSERT INTO PROJECT VALUES('Software Development', '117');
INSERT INTO PROJECT VALUES('Image Reconstruction', '119');

INSERT INTO PRIZE VALUES('1001', 'Data Analytics', '102');
INSERT INTO PRIZE VALUES('1001', 'System Design', '105');
INSERT INTO PRIZE VALUES('1001', 'Data Search', '114');
INSERT INTO PRIZE VALUES('1002', 'Data Prediction', '112');
INSERT INTO PRIZE VALUES('1002', 'Data Search', '114');
INSERT INTO PRIZE VALUES('1003', 'System Design', '105');
INSERT INTO PRIZE VALUES('1003', 'System Optimization', '107');
INSERT INTO PRIZE VALUES('1003', 'Data Prediction', '112');
INSERT INTO PRIZE VALUES('1004', 'System Design', '105');
INSERT INTO PRIZE VALUES('1004', 'Data Prediction', '112');
INSERT INTO PRIZE VALUES('1004', 'Software Development', '117');
INSERT INTO PRIZE VALUES('1005', 'System Optimization', '107');
INSERT INTO PRIZE VALUES('1006', 'Image Recognition', '106');
INSERT INTO PRIZE VALUES('1006', 'Software Development', '117');

INSERT INTO EQUIPMENT VALUES('Weather Data', '102', 'Database Systems', '3', '20', '5');
INSERT INTO EQUIPMENT VALUES('System Data', '104', 'Distributed Systems', '3', '50', '20');
INSERT INTO EQUIPMENT VALUES('Figure Data', '110', 'Computer Vision', '3', '10', '5');
INSERT INTO EQUIPMENT VALUES('Health Data', '112', 'Machine Learning', '4', '20', '15');
INSERT INTO EQUIPMENT VALUES('Traffic Data', '117', 'Database Systems', '3', '30', '20');
INSERT INTO EQUIPMENT VALUES('Software Data', '104', 'Operating Systems', '2', '40', '10');
INSERT INTO EQUIPMENT VALUES('Image Data', '106', 'Computer Vision', '3', '20', '10');
INSERT INTO EQUIPMENT VALUES('Hardware Data', '110', 'Operating Systems', '2', '30', '20');

INSERT INTO BORROWS VALUES('Weather Data', 'Data Analytics', '102', TO_DATE('1/13/2017','MM/DD/YYYY'));
INSERT INTO BORROWS VALUES('Weather Data', 'Data Prediction', '112', TO_DATE('1/10/2017','MM/DD/YYYY'));
INSERT INTO BORROWS VALUES('Weather Data', 'Data Search', '114', TO_DATE('3/1/2017','MM/DD/YYYY'));
INSERT INTO BORROWS VALUES('Weather Data', 'Software Development', '117', TO_DATE('1/5/2017','MM/DD/YYYY'));
INSERT INTO BORROWS VALUES('System Data', 'Data Analytics', '102', TO_DATE('1/9/2017','MM/DD/YYYY'));
INSERT INTO BORROWS VALUES('System Data', 'System Design', '105', TO_DATE('2/16/2017','MM/DD/YYYY'));
INSERT INTO BORROWS VALUES('System Data', 'System Optimization', '107', TO_DATE('2/20/2017','MM/DD/YYYY'));
INSERT INTO BORROWS VALUES('System Data', 'Data Prediction', '112', TO_DATE('1/1/2017','MM/DD/YYYY'));
INSERT INTO BORROWS VALUES('System Data', 'Software Development', '117', TO_DATE('2/25/2017','MM/DD/YYYY'));
INSERT INTO BORROWS VALUES('Figure Data', 'Image Recognition', '106', TO_DATE('3/15/2017','MM/DD/YYYY'));
INSERT INTO BORROWS VALUES('Health Data', 'Data Search', '114', TO_DATE('1/19/2017','MM/DD/YYYY'));
INSERT INTO BORROWS VALUES('Traffic Data', 'Data Prediction', '112', TO_DATE('1/16/2017','MM/DD/YYYY'));
INSERT INTO BORROWS VALUES('Traffic Data', 'Data Search', '114', TO_DATE('2/28/2017','MM/DD/YYYY'));
INSERT INTO BORROWS VALUES('Software Data', 'Data Analytics', '102', TO_DATE('2/26/2017','MM/DD/YYYY'));
INSERT INTO BORROWS VALUES('Software Data', 'System Optimization', '107', TO_DATE('1/18/2017','MM/DD/YYYY'));
INSERT INTO BORROWS VALUES('Software Data', 'Data Prediction', '112', TO_DATE('2/10/2017','MM/DD/YYYY'));
INSERT INTO BORROWS VALUES('Software Data', 'Software Development', '117', TO_DATE('1/26/2017','MM/DD/YYYY'));
INSERT INTO BORROWS VALUES('Software Data', 'Image Reconstruction', '119', TO_DATE('3/17/2017','MM/DD/YYYY'));
INSERT INTO BORROWS VALUES('Image Data', 'Image Recognition', '106', TO_DATE('3/10/2017','MM/DD/YYYY'));
INSERT INTO BORROWS VALUES('Image Data', 'Image Reconstruction', '119', TO_DATE('4/1/2017','MM/DD/YYYY'));
INSERT INTO BORROWS VALUES('Hardware Data', 'Data Analytics', '102', TO_DATE('4/5/2017','MM/DD/YYYY'));
INSERT INTO BORROWS VALUES('Hardware Data', 'System Design', '105', TO_DATE('4/1/2017','MM/DD/YYYY'));
INSERT INTO BORROWS VALUES('Hardware Data', 'System Optimization', '107', TO_DATE('4/5/2017','MM/DD/YYYY'));

INSERT INTO TEACHES VALUES('Database Systems', '3', '103', '102', TO_DATE('2/6/2017','MM/DD/YYYY'));
INSERT INTO TEACHES VALUES('Database Systems', '3', '115', '103', TO_DATE('3/10/2017','MM/DD/YYYY'));
INSERT INTO TEACHES VALUES('Machine Learning', '4', '102', '105', TO_DATE('3/8/2017','MM/DD/YYYY'));
INSERT INTO TEACHES VALUES('Machine Learning', '4', '105', null, TO_DATE('7/5/2017','MM/DD/YYYY'));
INSERT INTO TEACHES VALUES('Algorithms', '2', '116', '109', TO_DATE('1/9/2017','MM/DD/YYYY'));
INSERT INTO TEACHES VALUES('Database Systems', '4', '102', '111', TO_DATE('2/2/2017','MM/DD/YYYY'));
INSERT INTO TEACHES VALUES('Distributed Systems', '3', '111', '112', TO_DATE('1/20/2017','MM/DD/YYYY'));
INSERT INTO TEACHES VALUES('Distributed Systems', '3', '112', null, TO_DATE('1/1/2017','MM/DD/YYYY'));
INSERT INTO TEACHES VALUES('Machine Learning', '1', '120', null, TO_DATE('2/16/2017','MM/DD/YYYY'));
INSERT INTO TEACHES VALUES('Machine Learning', '1', '109', '114', TO_DATE('1/1/2017','MM/DD/YYYY'));
INSERT INTO TEACHES VALUES('Operating Systems', '2', '111', '120', TO_DATE('3/4/2017','MM/DD/YYYY'));
INSERT INTO TEACHES VALUES('Computer Vision', '3', '105', '115', TO_DATE('1/6/2017','MM/DD/YYYY'));
INSERT INTO TEACHES VALUES('Computer Vision', '3', '111', '116', TO_DATE('1/7/2017','MM/DD/YYYY'));

/*********************************
 INSERT YOUR SOLUTIONS OF PART 03
*********************************/
/* This is a trivial sample SQL query, just to show the right format.*/
/* 0.Produce table Answer00 (Person_Name) which contains all the persons who are a coach.*/
/* CREATE TABLE ANSWER00 AS */
CREATE TABLE ANSWER00 AS
SELECT DISTINCT PERSON.NAME AS Person_Name
FROM PERSON, COACH
WHERE PERSON.IDNUMBER = COACH.IDNUMBER
ORDER BY Person_Name ASC;

/* 1.Produce table Answer01 (Person_IDnumber, Person_Name) which contains all the persons who are both a manager and a member.*/
/* (a) CREATE TABLE ANSWER01 AS */
CREATE TABLE ANSWER01 AS
SELECT DISTINCT PERSON.IDNUMBER AS Person_IDnumber, PERSON.NAME AS Person_Name
FROM PERSON, MANAGER, MEMBER
WHERE PERSON.IDNUMBER = MANAGER.IDNUMBER AND PERSON.IDNUMBER = MEMBER.IDNUMBER
ORDER BY Person_IDnumber ASC , Person_Name ASC;

/* 2.Produce table Answer02 (Person_Name) which contains all the coaches who don't have a supervisor.*/
/* (b) CREATE TABLE ANSWER02 AS */
CREATE TABLE ANSWER02 AS
SELECT DISTINCT PERSON.NAME AS Person_Name
FROM PERSON , COACH
WHERE PERSON.IDNUMBER = COACH.IDNUMBER AND COACH.SUPERVISOR IS NULL
ORDER BY Person_Name ASC;

/* 3.Produce table Answer03 (Person_Name) which contains all the persons who don't teach any courses.*/
/*TEMP0: all (ID_Number , Person_Name)*/
CREATE TABLE TEMP0 AS
SELECT IDNUMBER AS ID_Number , NAME AS Person_Name
FROM PERSON
ORDER BY Person_Name ASC;

/* TEMP1: all people who teach (ID_Number, Person_Name)*/
CREATE TABLE TEMP1 AS
SELECT TEACHES.IDNUMBER AS ID_Number , PERSON.NAME AS Person_Name
FROM TEACHES , PERSON
WHERE TEACHES.IDNUMBER = PERSON.IDNUMBER
ORDER BY Person_Name ASC;

/* TEMP2: Pick up all (ID_Number , Person_Name) who do not teach any courses*/
CREATE TABLE TEMP2 AS
SELECT *
FROM TEMP0
MINUS
SELECT *
FROM TEMP1;

/* TABLE Answer03 (Person_Name) which contains all the persons who don't teach any courses.*/
/* (c) CREATE TABLE ANSWER03 AS */
CREATE TABLE ANSWER03 AS
SELECT Person_Name
FROM TEMP2
ORDER BY Person_Name ASC;

/* 4.Produce table Answer04 (Person_IDnumber, Num_of_Courses) with the number of courses a person teaches.*/
/* (d) CREATE TABLE ANSWER04 AS */
CREATE TABLE ANSWER04 AS
SELECT ID.IDNUMBER AS Person_IDnumber, Course_Counting.Num_Course AS Num_of_Courses
FROM
	(
		SELECT DISTINCT IDNUMBER
        FROM TEACHES
    ) ID
INNER JOIN
	(
		SELECT IDNUMBER , COUNT(IDNUMBER) AS Num_Course
        FROM TEACHES
        GROUP BY IDNUMBER
    ) Course_Counting
	ON ID.IDNUMBER = Course_Counting.IDNUMBER
ORDER BY Person_IDnumber ASC , Num_of_Courses ASC;

/* 5.Produce table Answer05 (Person_Name, Course_Name, Num_of_Students) which contains all the coaches and the
	name and maximum students of each the course that they teach.*/
/* TEMP03: mapping ID, name, course in the same table*/
CREATE TABLE TEMP3 AS
SELECT TEMP1.ID_Number AS ID_Number , TEMP1.Person_Name AS Person_Name , TEACHES.NAME AS Course_Name , TEACHES.LVL AS LVL
FROM TEMP1 , TEACHES
WHERE TEMP1.ID_Number = TEACHES.IDNUMBER
ORDER BY Person_Name ASC;

/* TEMP4: COMBINE MAX_STUDENT to the Temp3 in the same table Temp4 */
CREATE TABLE TEMP4 AS
SELECT TEMP3.ID_Number AS ID_Number , TEMP3.Person_Name AS Person_Name , TEMP3.Course_Name AS Course_Name , COURSE.MAXSTUDENTS AS MAXSTUDENTS
FROM TEMP3 , COURSE
WHERE TEMP3.Course_Name = COURSE.NAME AND TEMP3.LVL = COURSE.LVL
ORDER BY ID_Number ASC;

/* (e) CREATE TABLE ANSWER05 AS */
CREATE TABLE ANSWER05 AS
SELECT Person_Name , Course_Name , MAX(MAXSTUDENTS) AS Num_of_Students
FROM TEMP4
GROUP BY Person_Name, Course_Name
ORDER BY Person_Name ASC , Course_Name ASC , Num_of_Students ASC;


/* 6.Produce table Answer06 (Person_IDnumber, Prize_ID) which contains all the members with 'planA' membership type
	and the prizeID of the projects that they lead.*/
/* TEMP5: mapping ID of member and membership type in the same table*/
CREATE TABLE TEMP5 AS
SELECT IDNUMBER , MEMBERSHIP
FROM MEMBER
WHERE MEMBERSHIP = 'planA'
ORDER BY IDNUMBER ASC;

/* TEMP6: mapping ID, membership of planA, project name in the same table*/
CREATE TABLE TEMP6 AS
SELECT TEMP5.IDNUMBER AS IDNUMBER , TEMP5.MEMBERSHIP AS MEMBERSHIP , PROJECT.NAME AS Project_Name
FROM TEMP5 , PROJECT
WHERE TEMP5.IDNUMBER = PROJECT.IDNUMBER
ORDER BY Project_Name ASC;

/* TEMP7: mapping ID, membership of planA, project name, and Prize_ID in the same table*/
CREATE TABLE TEMP7 AS
SELECT TEMP6.IDNUMBER AS IDNUMBER , TEMP6.MEMBERSHIP AS MEMBERSHIP , TEMP6.Project_Name AS Project_Name , PRIZE.PRIZEID as Prize_ID
FROM TEMP6 , PRIZE
WHERE TEMP6.IDNUMBER = PRIZE.IDNUMBER
ORDER BY IDNUMBER ASC;

/* (f) CREATE TABLE ANSWER06 AS */
CREATE TABLE ANSWER06 AS
SELECT IDNUMBER AS Person_IDnumber , Prize_ID AS Prize_ID
FROM TEMP7
ORDER BY Person_IDnumber ASC , Prize_ID ASC;


/* 7.Assume that in Course, the minimum level of a course represents the required level for this course.
	Produce table Answer07 (Course_Name, Required_Level) which contains the required level for each course.*/
/* (g) CREATE TABLE ANSWER07 AS */
CREATE TABLE ANSWER07 AS
SELECT Name AS Course_Name , MIN(LVL) AS Required_Level
FROM COURSE
GROUP BY Name
ORDER BY Course_Name ASC , Required_Level ASC; 

/* 8.Produce table Answer08 (Person_Name) which contains all the persons who used at least one equipment
	with use amount over 10.*/
/* TEMP8: Mapping Member_ID and Uses_Amount in the same table */
CREATE TABLE TEMP8 AS
SELECT MEMBER.IDNUMBER AS ID_Number , EQUIPMENT.USEAMOUNT AS Use_Amount
FROM MEMBER , EQUIPMENT
WHERE MEMBER.IDNUMBER = EQUIPMENT.IDNUMBER
ORDER BY ID_Number ASC;

/* TEMP9: Mapping Person_Name , ID , Use_Amount in the same table */
CREATE TABLE TEMP9 AS
SELECT TEMP8.ID_Number AS ID_Number , PERSON.NAME AS Person_Name , TEMP8.Use_Amount AS Use_Amount
FROM PERSON , TEMP8
WHERE PERSON.IDNUMBER = TEMP8.ID_Number
ORDER BY ID_Number ASC;


CREATE TABLE TEMP10 AS
SELECT Person_Name , Use_Amount
FROM TEMP9
WHERE Use_Amount >= 1 AND Use_Amount > 10
ORDER BY Person_Name ASC; 

/* (h) CREATE TABLE ANSWER08 AS */
CREATE TABLE ANSWER08 AS
SELECT Person_Name
FROM TEMP10
ORDER BY Person_Name ASC;

spool N10912051_Homework03Spool.txt;

SELECT * FROM ANSWER00;
SELECT * FROM ANSWER01;
SELECT * FROM ANSWER02;
SELECT * FROM ANSWER03;
SELECT * FROM ANSWER04;
SELECT * FROM ANSWER05;
SELECT * FROM ANSWER06;
SELECT * FROM ANSWER07;
SELECT * FROM ANSWER08;

spool off;
