create table customers (
    customer_id int primary key,
    full_name varchar(50) not null,
    timestamp timestamp not null,
    delivery_address text not null
);
