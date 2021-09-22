create database lab2_second;
create user lab2_second_user with password 'qwerty';
alter role lab2_second_user SET client_encoding TO ‘utf8’;
grant all privileges on database lab2_second to lab2_second_user;
