CREATE DATABASE feb26;

USE feb26;

CREATE TABLE Student(
  s_id INT,
  s_name CHAR(5)
  );

INSERT INTO Student VALUES (1, 'Janhavi');

DROP TABLE Student;

CREATE TABLE Student(
  s_id INT,
  s_name CHAR(10)
  );
INSERT INTO Student VALUES (1, 'Janhavi');
INSERT INTO Student VALUES (2, "ram");
INSERT INTO Student VALUES (3, "Nanda");
INSERT INTO Student VALUES (4, "Niki");
INSERT INTO Student VALUES (5, "1000");
INSERT INTO Student VALUES (6, 45678);


SELECT char_length(s_name) FROM Student; -- count the character
SELECT length(s_name) FROM Student; -- count the bytes
SELECT * 
FROM Student;


############################### VARIABLE CHAR ##################################


CREATE TABLE Student_Varchar1(
s_id INT,
s_name VARCHAR(300)
);

INSERT INTO Student_Varchar1 VALUES (12, 'awsedrftgyhujikolpsxdcfvgbhnjmk');
INSERT INTO Student_Varchar1 VALUES (13, 'Harsh');
INSERT INTO Student_Varchar1 VALUES (14, 'Prasad');

SELECT length(s_name) FROM Student_Varchar1;
SELECT char_length(s_name) FROM Student_Varchar1; 

SELECT * 
FROM Student_Varchar1;

#######################################################################

CREATE TABLE Student_Varchar2(
s_id INT,
s_name VARCHAR(5) -- Obviously ERROR.
);

INSERT INTO Student_Varchar2 VALUES (12, 'awsedrftgyhujikolpsxdcfvgbhnjmk');

#########################################################################

CREATE TABLE Student_Varchar3(
s_id INT,
s_name VARCHAR (35) DEFAULT 'for varchar',   -- Constraint Default
l_name CHAR (20) DEFAULT 'for char',
descp text default 'a'
);

INSERT INTO Student_Varchar3 (s_id, s_name)
VALUES (1, 'abc');

SELECT * FROM Student_Varchar3;