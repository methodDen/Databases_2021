create table person (
    person_id int primary key,
    first_name varchar(50) not null,
    last_name varchar(50) not null,
    age int not null,
    nationality varchar(40) not null
);

create table car (
    BIN int primary key,
    car_brand varchar(50) not null,
    model varchar(50) not null,
    date_of_manufacturing date not null
);