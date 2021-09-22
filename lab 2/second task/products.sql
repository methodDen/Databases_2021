create table products (
          product_id varchar primary key,
          name varchar unique not null,
          description text,
          price double precision not null
      );

alter table products
add constraint price_check_positive check ( price > 0 );
