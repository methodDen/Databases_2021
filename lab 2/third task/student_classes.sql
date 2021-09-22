create table student_classes (
    student_id varchar(40) references student (student_id) not null,
    class_id int references classes (class_id) not null,
    constraint student_classes_pkey primary key (student_id, class_id)
);