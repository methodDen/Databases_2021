select *
from dealer
         inner join client
                    on dealer.id = client.dealer_id;

select *
from dealer
         full join client
                   on dealer.id = client.dealer_id;

-- additional

-- INSERT INTO dealer (id, name, location, charge) VALUES (104, 'Юрий', 'Павлодар', 0.19);
-- INSERT INTO client (id, name, city, priority) VALUES (898, 'Айсултан', 'Алматы', null);

select d.id,
       d.name,
       d.location,
       c.name,
       c.city,
       c.priority,
       s.id,
       s.date,
       s.amount
from dealer d
         inner join sell s
                    on d.id = s.dealer_id
         inner join client c
                    on
                        s.client_id = c.id;

select *
from dealer d
         inner join client c
                    on d.location = c.city;


select sell.id, sell.amount, client.name, client.city
from sell
         inner join client on sell.client_id = client.id
where (sell.amount >= 100 and sell.amount <= 500)
order by amount;

select c.name, c.city, dealer.name, dealer.charge
from dealer
         inner join client c on dealer.id = c.dealer_id;

select c.name, c.city, dealer.name, dealer.charge
from client c
         inner join dealer on dealer.id = c.dealer_id;

select client.name, client.city, dealer.name, dealer.charge
from client
         inner join dealer on dealer.id = client.dealer_id
where dealer.charge > 0.12;

select dealer.id, dealer.name, count(c.id)
from dealer
         left join client c on dealer.id = c.dealer_id
group by dealer.id, dealer.name
having count(c.id) >= 1
    or count(c.id) = 0;

INSERT INTO client (id, name, city, priority, dealer_id)
VALUES (928, 'Артур', 'Актау', 200, 101);
INSERT INTO sell (id, amount, date, client_id)
VALUES (224, 158.5, '2012-10-05 00:00:00.000000', 924);

select client.name as client_name,
       client.city,
       sell.id     as sell_id,
       sell.date,
       sell.amount,
       d.name      as dealer_name,
       d.charge
from client
         full join sell on client.id = sell.client_id
         full join dealer d on sell.dealer_id = d.id;

select client.name     as client_name,
       client.priority as grade,
       dealer.id       as dealer_id,
       sell.id         as sell_id,
       sell.amount     as sell_amount
from client
         inner join dealer on client.dealer_id = dealer.id
        left join sell on client.id = sell.client_id and dealer.id = sell.dealer_id;

select client.name     as client_name,
       client.priority as grade,
       dealer.id       as dealer_id,
       sell.id         as sell_id,
       sell.amount     as sell_amount
from client
         inner join dealer on client.dealer_id = dealer.id
        left join sell on client.id = sell.client_id and dealer.id = sell.dealer_id
        where client.priority is not null and sell.amount > 2000;