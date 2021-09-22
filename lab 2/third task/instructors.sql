create table instructors (
    instructor_id varchar(40) primary key,
    able_to_have_remote_lessons boolean not null,
    full_name varchar(50) not null
);
