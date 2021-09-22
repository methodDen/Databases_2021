create table instructor_classes (
    instructor_id varchar(40) references instructors (instructor_id) not null,
    class_id int references classes (class_id) not null,
    constraint instructor_classes_pkey primary key (instructor_id, class_id)
);