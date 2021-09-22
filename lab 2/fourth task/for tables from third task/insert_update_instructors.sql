insert into instructors values('12B345678', true, 'Bobur Mukhsimbayev');
insert into instructors values ('16B123456', true, 'Bermagambet Duisek');
insert into instructors values ('21B123456', true, 'John Doe');

update instructors
set full_name = 'Aibek Kuralbayev'
where instructor_id = '12B345678';