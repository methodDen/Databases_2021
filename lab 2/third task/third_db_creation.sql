create database lab2_third;
create user lab2_third_user with password 'qwerty';
alter role lab2_third_user SET client_encoding TO ‘utf8’;
grant all privileges on database lab2_third to lab2_third_user;
