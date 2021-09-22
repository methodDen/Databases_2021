create table jobs (
    job_id int primary key,
    company_name varchar(50) not null,
    post varchar(50) not null,
    beginning_date date not null,
    ending_date date not null,
    capabilities_id int not null,
    foreign key (capabilities_id) references capabitilies
);
