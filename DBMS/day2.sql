create table const_ex(
	s_id int primary key,
    s_name varchar(30) not null
);
insert into const_ex values(1,'abd');
insert into const_ex(s_id) values(2);  #Error Code: 1364. Field 's_name' doesn't have a default value


create table const_ex1(
	s_id int auto_increment primary key,
    s_name varchar(30) not null,
    c_name varchar(50) default "PGCP-BDA"
);
insert into const_ex1(s_name) values('abd');
select * from const_ex1;

create table const_ex2(
	s_id int auto_increment primary key,
    s_name varchar(30) not null,
    c_name varchar(50) default "PGCP-BDA",
    c_start_date date default "2026-02-25",
    login_time timestamp default current_timestamp,
    marks int default 0
);

insert into const_ex2(s_name) values('nandini');
select * from const_ex2;

create table const_ex3(
	s_id int auto_increment primary key,
    s_name varchar(30) not null,
    c_name varchar(50) default "PGCP-BDA",
    c_start_date date default "2026-02-25",
    login_time timestamp default current_timestamp,
    marks int default 0,
    m_num int unique
);
insert into const_ex3(s_name,m_num) values('nandini',1234);
insert into const_ex3(s_name,m_num) values('nidhi',1234); #Error Code: 1062. Duplicate entry '1234' for key 'const_ex3.m_num'
insert into const_ex3(s_name) values('nandini');
select * from const_ex3;

create table const_ex4(
	s_id int auto_increment primary key,
    s_name varchar(30) not null,
    c_name varchar(50) default "PGCP-BDA",
    c_start_date date default "2026-02-25",
    login_time timestamp default current_timestamp,
    marks int default 0,
    m_num int,
    email varchar(100),
    unique(m_num,email)
);
insert into const_ex4(s_name,m_num,email) values('nandini',1234,'n@gmail.com');
select * from const_ex4;

create table const_ex5(
	s_id int auto_increment primary key,
    s_name varchar(30) not null,
    c_name varchar(50) default "PGCP-BDA",
    c_start_date date default "2026-02-25",
    login_time timestamp default current_timestamp,
    marks int default 0,
    m_num int unique,
    email varchar(100) unique);

insert into const_ex5(s_name,m_num,email) values('nandini',1234,'n@gmail.com');
insert into const_ex5(s_name,m_num,email) values('nidhi',1234,'n@gmail.com');#Error Code: 1062. Duplicate entry '1234' for key 'const_ex5.m_num'

insert into const_ex5(s_name,m_num,email) values('nandini',123,'n@gmail.com');#Error Code: 1062. Duplicate entry 'n@gmail.com' for key 'const_ex5.email'

select * from const_ex5;


create table const_ex6(
	s_id int auto_increment primary key,
    s_name varchar(30) not null,
    c_name varchar(50) default "PGCP-BDA",
    c_start_date date default "2026-02-25",
    login_time timestamp default current_timestamp,
    marks int default 0,
    m_num int unique not null,
    email varchar(100) unique not null
    
    );

insert into const_ex6(s_name,m_num,email) values('nandini',1234,'n@gmail.com');
insert into const_ex6(s_name,m_num,email) values('nidhi',1234,'n@gmail.com');#Error Code: 1062. Duplicate entry '1234' for key 'const_ex6.m_num'


insert into const_ex6(s_name,email) values('nidhi','n@gmail.com');#Error Code: 1364. Field 'm_num' doesn't have a default value


select * from const_ex6;

desc const_ex6;
show indexes from const_ex6;

create table const_ex7(
	s_id int auto_increment primary key,
    s_name varchar(30) not null,
    age int not null check(age>22)
    );
insert into const_ex7(s_name,age) values('nandini',23);
insert into const_ex7(s_name,age) values('nandini',13); #Error Code: 3819. Check constraint 'const_ex7_chk_1' is violated.


select * from const_ex7;


create table const_ex8(
	s_id int auto_increment primary key,
    s_name varchar(30) not null,
    age int not null check(age>22),
    gender char(10) check(gender in('male','female','other'))
    );
insert into const_ex8(s_name,age,gender) values('nandini',23,'female');
insert into const_ex8(s_name,age,gender) values('nandini',23,'np');#Error Code: 3819. Check constraint 'const_ex8_chk_2' is violated.


select * from const_ex8;

create table const_ex9(
	s_id int auto_increment primary key,
    s_name varchar(30) not null,
    age int not null check(age>22),
    gender char(10) check(gender in('male','female','other')),
    check(char_length(s_name)>1 and age>21)
    );
insert into const_ex9(s_name,age,gender) values('nandini',23,'female');

insert into const_ex9(s_name,age,gender) values('n',23,'female');#Error Code: 3819. Check constraint 'const_ex9_chk_3' is violated.
select * from const_ex9;


create table const_ex10(
	s_id int auto_increment primary key,
    s_name varchar(30) not null,
    age int not null check(age>22),
    gender char(10) check(gender in('male','female','other')),
    check(char_length(s_name)>1 and age>21),
    check(m_num regexp '[0-9]' and m_num<=10)
    );
insert into const_ex10(s_name,age,gender) values('nandini',23,'female',12345);

insert into const_ex10(s_name,age,gender) values('n',23,'female','gdieiwol');#Error Code: 3819. Check constraint 'const_ex9_chk_3' is violated.
select * from const_ex10;


#########  primary key  ###########
create table const_ex11(
	zip_code int,
    s_name varchar(30) not null,
    address varchar(100),
    primary key(zip_code,address)
);
desc const_ex11;
show index from const_ex11;
insert into const_ex11 (zip_code,s_name,address) values(431401,'nandini','parbhani');
select * from const_ex11;


