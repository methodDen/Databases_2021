insert into languages (language_name, origin, capabilities_id) values('Mandarin', 'China', 123);
insert into languages (language_name, origin, capabilities_id) values('Portuguese', 'Portugal', 123);
insert into languages (language_name, origin, capabilities_id) values('Brazilian Portuguese', 'Portugal', 123);
insert into languages (language_name, origin, capabilities_id) values('Jin', 'China', 123);
insert into languages (language_name, origin, capabilities_id) values('Kazakh', 'Kazakhstan', 123);
insert into languages (language_name, origin, capabilities_id) values('Spanish', 'Argentina', 123);
insert into languages (language_name, origin, capabilities_id) values('Elves', 'Rivendell', 123);
insert into languages (language_name, origin, capabilities_id) values('Entish', 'Fangorn', 123);

delete from languages where language_name = 'Entish';
update languages
set language_name = 'Russian', origin = 'Russia'
where language_name = 'Elves'