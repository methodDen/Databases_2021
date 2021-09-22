create table capabitilies (
    capabilities_id int primary key,
    instructor_id varchar(40) unique not null,
    foreign key (instructor_id) references instructors
);
