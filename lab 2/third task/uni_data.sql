create table uni_data (
    uni_data_id int primary key,
    average_grade numeric(3,2) not null check ( average_grade >= 1.00 and average_grade <= 4.00 ),
    need_for_dorm bool not null,
    additional_info text,
    student_id varchar(40) unique not null,
    foreign key (student_id)  references student
);
