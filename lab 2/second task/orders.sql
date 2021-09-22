create table orders (
          order_code int,
          customer_id int,
          total_sum double precision not null,
          is_paid boolean not null,
        primary key (order_code),
        foreign key (customer_id) references customers
      );

alter table orders
add constraint total_sum_check_positive check ( total_sum > 0 );
