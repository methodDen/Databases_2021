create table languages (
    language_id serial primary key,
    language_name varchar(40) not null,
    origin varchar(50),
    capabilities_id int not null,
    foreign key (capabilities_id) references capabitilies
);
