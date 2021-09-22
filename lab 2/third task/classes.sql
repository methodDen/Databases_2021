create table classes (
    class_id int primary key,
    title varchar(50) not null,
    weekday char(3) check ( weekday = 'MON' or weekday = 'TUE' or weekday = 'WED' or weekday = 'THU' or weekday = 'FRI' or weekday = 'SAT'),
    room_number int not null
)