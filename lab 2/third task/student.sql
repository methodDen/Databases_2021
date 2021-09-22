create table student (
    student_id varchar(40) primary key,
    full_name varchar(50) not null,
    age int not null check ( age >= 16 and age <= 30 ),
    birth_date date not null check ( birth_date between date '1991-01-01' and date '2005-01-01'),
    gender char(1) not null check (gender = 'm' or gender = 'f'),
    info_about_yourself text
);
