create table order_items (
    order_code  int references orders (order_code) not null,
    product_id  varchar references products (product_id)  not null,
    quantity integer not null,
    constraint order_items_pkey primary key (order_code, product_id)
);

alter table order_items
    add constraint quantity_check_positive check ( quantity > 0 )
