

-- create database lab7;
-- create user lab7user with password 'qwerty';
-- alter role lab7user set client_encoding to 'utf8';
-- grant all privileges on database lab7 to lab7user;



create role accountant;
create role administrator;
create role support;

create user user1 with encrypted password 'qwerty';
create user user2 with encrypted password 'qwerty';
create user user3 with encrypted password 'qwerty';
create user user4 with encrypted password 'qwerty';
create user user5 with encrypted password 'qwerty';
create user user6 with encrypted password 'qwerty';

grant accountant to user3;
grant accountant to user6;
grant accountant to user2;
grant administrator to user1;
grant support to user4;
grant support to user5;

-- alter user user1 with nosuperuser ;
select * from information_schema.table_privileges where grantee = 'user1';
-- drop role support;


grant select, update on transactions to accountant;
grant all privileges on all tables in schema public to administrator;
grant select, update, delete on accounts, customers to support;

grant all privileges on all tables in schema public to user1 with grant option;
grant select, update, delete on accounts, customers to user4 with grant option ;

revoke select, delete on accounts, customers from user5;
revoke update on transactions from user2;


-- select * from information_schema.table_privileges;

-- WITH RECURSIVE cte AS (
--    SELECT oid FROM pg_roles WHERE rolname = 'user6'
--
--    UNION ALL
--    SELECT m.roleid
--    FROM   cte
--    JOIN   pg_auth_members m ON m.member = cte.oid
--    )
-- SELECT oid, oid::regrole::text AS rolename FROM cte;

-- revoke all privileges on all tables in schema public from support;

alter table accounts alter column customer_id set not null;
alter table accounts alter column currency set not null;
alter table accounts alter column balance set not null;
alter table customers alter column name set not null;
alter table customers alter column birth_date set not null;

alter table transactions alter column dst_account set not null;
alter table transactions alter column src_account set not null;
alter table transactions alter column status set not null;
alter table transactions alter column amount set not null;

create unique index indx on accounts (currency, account_id);

explain select distinct * from accounts;

create index index2 on accounts(currency, balance);
create unique index index1 on accounts(account_id, currency, customer_id);

select tablename, indexname, indexdef
from pg_indexes
where schemaname = 'public'
order by tablename, indexname;


do $$
    declare
        src_balance int;
        dest_balance int;
    begin
        insert into transactions values(6, now(), 'NT10204', 'RS88012', 500, 'init');
--         savepoint beg;
        select balance from accounts where account_id = 'NT10204' into src_balance;
        select balance from accounts where account_id = 'RS88012' into dest_balance;
        if src_balance - 500 >= 0 then
        update accounts set balance = dest_balance + 500 where account_id = 'RS88012';
        update accounts set balance = src_balance - 500 where account_id = 'NT10204';
        update transactions set status = 'commited' where id = 6;
        else
--             rollback to beg;
            update transactions set status = 'rollback' where id = 6;
        end if;
        commit;
    end$$;
