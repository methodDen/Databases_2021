create view first_view as
select date,
       count(distinct client_id
           ),
       avg(amount
           ),
       sum(amount) as total_amount
from sell
group by date;


create view second_view as
select date, sum(amount)
from sell
group by date
order by sum(amount) desc
limit 5;

create view second_view_correct as
select date, total_amount
from first_view
order by total_amount desc
limit 5;

create view third_view as
select dealer.id,
       dealer.location,
       dealer.name,
       count(client_id) as client_count,
       avg(amount)      as avg_amount,
       sum(amount)      as total_amount
from dealer
         inner join sell on dealer.id = sell.dealer_id
group by dealer.id, dealer.name;

create view fourth_view as
select dealer.id,
       dealer.name,
       dealer.location,
       sum(amount)                 as amount,
       dealer.charge,
       sum(amount) * dealer.charge as charge_amount
from dealer
         inner join sell on dealer.id = sell.dealer_id
group by dealer.id, dealer.name, dealer.location;

create view fourth_view_correct as
select third_view.id,
       third_view.name,
       third_view.location,
       third_view.total_amount,
       dealer.charge,
       third_view.total_amount * dealer.charge as charge_amount
from third_view
         inner join dealer on third_view.id = dealer.id;


-- select third_view.location, third_view.avg_amount, third_view.total_amount, third_view.client_count
-- from third_view
--          inner join sell on third_view.id = sell.dealer_id
-- group by third_view.location, third_view.avg_amount, third_view.total_amount, third_view.client_count;

create view fifth_view as
select dealer.location, count(client_id), avg(amount), sum(amount) as total_amount
from dealer
         inner join sell on dealer.id = sell.dealer_id
group by dealer.location;

create view sixth_view as
select city, count(s.client_id), avg(s.amount), sum(s.amount) as total_amount
from client
         inner join sell s on client.id = s.client_id
group by city;

select sixth_view.city, sixth_view.total_amount, fifth_view.total_amount
from sixth_view
         inner join fifth_view on sixth_view.city = fifth_view.location
where sixth_view.total_amount > fifth_view.total_amount;