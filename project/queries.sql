select u.first_name, u.last_name
from vehicle
         inner join vehicle_delivery vd on vehicle.vehicle_id = vd.vehicle_id
         inner join shipment s on vd.vd_id = s.vd_id
         inner join accounts a on s.receiver_account_id = a.account_id
         inner join users u on u.user_id = a.customer_id
where vehicle.vehicle_id = '1721'
  and vehicle_status = 'Crashed';


select u.first_name, u.last_name
from vehicle
         inner join vehicle_delivery vd on vehicle.vehicle_id = vd.vehicle_id
         inner join shipment s on vd.vd_id = s.vd_id
         inner join accounts a on s.sender_account_id = a.account_id
         inner join users u on u.user_id = a.customer_id
where vehicle.vehicle_id = '1721'
  and vehicle_status = 'Crashed';



select vehicle.vehicle_id,
       vd.vd_id,
       starting_address,
       destination_address,
       departure_date,
       arrival_date,
       vehicle_status
from vehicle
         inner join vehicle_delivery vd on vehicle.vehicle_id = vd.vehicle_id
where vehicle.vehicle_id = '1721'
  and vehicle_status = 'Success'
  and vd.arrival_date <= '2020-05-14'
limit 1;

select first_name, last_name, account_id, count(shipment_id)
from users
         inner join accounts a on users.user_id = a.customer_id
         inner join shipment s on a.account_id = s.sender_account_id
where date_part('year', estimated_date_of_coming) = '2020'
group by first_name, last_name, account_id
having count(shipment_id) = (select max(shipment_count)
                             from (
                                      select count(shipment_id) as shipment_count
                                      from users
                                               inner join accounts a2 on users.user_id = a2.customer_id
                                               inner join shipment s2 on a2.account_id = s2.sender_account_id
                                      group by first_name, last_name, account_id
                                  ) as t);


select first_name, last_name, account_id, sum(total_cost)
from users
         inner join accounts a on users.user_id = a.customer_id
         inner join shipment s on a.account_id = s.sender_account_id
where date_part('year', estimated_date_of_coming) = '2020'
group by first_name, last_name, account_id
having sum(total_cost) = (select max(shipment_sum)
                          from (
                                   select sum(total_cost) as shipment_sum
                                   from users
                                            inner join accounts a2 on users.user_id = a2.customer_id
                                            inner join shipment s2 on a2.account_id = s2.sender_account_id
                                   group by first_name, last_name, account_id
                               ) as t);


select street_name, count(user_id)
from users
group by street_name
having count(user_id) = (select max(user_count)
                         from (
                                  select count(user_id) as user_count
                                  from users
                                  group by street_name
                              ) as t);

select shipment_id,
       date_of_sending,
       estimated_date_of_coming,
       actual_date_of_coming,
       sender_account_id,
       receiver_account_id
from shipment
where actual_date_of_coming is null
   or actual_date_of_coming > estimated_date_of_coming;


select first_name, last_name, street_name, street_number, sum(total_cost) as amount_owed
from users
         inner join accounts a on users.user_id = a.customer_id
         inner join shipment s on a.account_id = s.sender_account_id
where date_part('month', actual_date_of_coming) = '11'
  and user_id = 1
group by first_name, last_name, street_name, street_number;

select first_name,
       last_name,
       sum(case when type = 'Envelope' then quantity else 0 end)                            as envelope_count,
       sum(case when type = 'Envelope' then cost_per_package * quantity else 0 end)         as cost_for_envelopes,
       sum(case when type = 'Small box' then quantity else 0 end)                           as small_box_count,
       sum(case when type = 'Small box' then cost_per_package * quantity else 0 end)        as cost_for_small_boxes,
       sum(case when type = 'Medium box' then quantity else 0 end)                          as medium_box_count,
       sum(case when type = 'Medium box' then cost_per_package * quantity else 0 end)       as cost_for_medium_boxes,
       sum(case when type = 'Large box' then quantity else 0 end)                           as large_box_count,
       sum(case when type = 'Large box' then cost_per_package * quantity else 0 end)        as cost_for_large_boxes,
       sum(case when type = 'Extralarge box' then quantity else 0 end)                      as extralarge_box_count,
       sum(case
               when type = 'Extralarge box' then cost_per_package * quantity
               else 0 end)                                                                  as cost_for_extralarge_boxes,
       (sum(case when type = 'Envelope' then cost_per_package * quantity else 0 end) +
        sum(case when type = 'Small box' then cost_per_package * quantity else 0 end) +
        sum(case when type = 'Medium box' then cost_per_package * quantity else 0 end) +
        sum(case when type = 'Large box' then cost_per_package * quantity else 0 end) +
        sum(case when type = 'Extralarge box' then cost_per_package * quantity else 0 end)) as total_cost
from users
         inner join accounts a on users.user_id = a.customer_id
         inner join shipment s on a.account_id = s.sender_account_id
         inner join package p on s.shipment_id = p.shipment_id
where date_part('month', actual_date_of_coming) = '11'
  and user_id = 1
group by first_name, last_name;

select first_name,
       last_name,
       street_name,
       street_number,
       city,
       country,
       s.shipment_id,
       date_of_sending,
       actual_date_of_coming,
       total_cost,
       total_weight,
       sum(case when type = 'Envelope' then quantity else 0 end)                      as envelope_count,
       sum(case when type = 'Envelope' then cost_per_package * quantity else 0 end)   as cost_for_envelopes,
       sum(case when type = 'Small box' then quantity else 0 end)                     as small_box_count,
       sum(case when type = 'Small box' then cost_per_package * quantity else 0 end)  as cost_for_small_boxes,
       sum(case when type = 'Medium box' then quantity else 0 end)                    as medium_box_count,
       sum(case when type = 'Medium box' then cost_per_package * quantity else 0 end) as cost_for_medium_boxes,
       sum(case when type = 'Large box' then quantity else 0 end)                     as large_box_count,
       sum(case when type = 'Large box' then cost_per_package * quantity else 0 end)  as cost_for_large_boxes,
       sum(case when type = 'Extralarge box' then quantity else 0 end)                as extralarge_box_count,
       sum(case
               when type = 'Extralarge box' then cost_per_package * quantity
               else 0 end)                                                            as cost_for_extralarge_boxes
from users
         inner join accounts a on users.user_id = a.customer_id
         inner join shipment s on a.account_id = s.sender_account_id
         inner join package p on s.shipment_id = p.shipment_id
where date_part('month', actual_date_of_coming) = '11'
  and user_id = 1
group by first_name, last_name, street_name, street_number, city, country, s.shipment_id, date_of_sending,
         actual_date_of_coming, total_cost, total_weight;


