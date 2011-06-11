insert into schedule (who, dday, destination) values ((select who from schedule s join deliverers d on (s.who = d.userid) where d.mon=true group by who order by max(dday) limit 1), (select max(dday) + interval'1 day' from schedule limit 1),'Hutchison');
insert into schedule (who, dday, destination) values ((select who from schedule s join deliverers d on (s.who = d.userid) where d.tue=true group by who order by max(dday) limit 1), (select max(dday) + interval'1 day' from schedule limit 1),'Hutchison');
insert into schedule (who, dday, destination) values ((select who from schedule s join deliverers d on (s.who = d.userid) where d.wed=true group by who order by max(dday) limit 1), (select max(dday) + interval'1 day' from schedule limit 1),'Hutchison');
insert into schedule (who, dday, destination) values ((select who from schedule s join deliverers d on (s.who = d.userid) where d.thu=true group by who order by max(dday) limit 1), (select max(dday) + interval'1 day' from schedule limit 1),'Hutchison');
insert into schedule (who, dday, destination) values ((select who from schedule s join deliverers d on (s.who = d.userid) where d.fri=true group by who order by max(dday) limit 1), (select max(dday) + interval'1 day' from schedule limit 1),'Hutchison');


insert into schedule ( who, dday, destination ) values ('dileonardo','2010-11-20','Embry');
insert into schedule ( who, dday, destination ) values ('larson','2010-11-21','Embry');
insert into schedule ( who, dday, destination ) values ('young','2010-11-27','Embry');
insert into schedule ( who, dday, destination ) values ('murphy','2010-11-28','Embry');

//try
select userid from deliverers where wed=true and userid not in (select distinct who from schedule);

//no?  try
select who, max(dday) from schedule s join deliverers d on (s.who = d.userid) where d.wed=true group by who order by max(dday);

//get next day to do and day of week that is
select max(dday) + interval'1 day', extract(dow from max(dday) + interval'1 day') from schedule;


select count(*) from holiday where hday='2010-10-01'::date;

----------------------------------------------DONE

insert into schedule (dday, who, destination) values ('2010-10-16','murphy','Embry');
insert into schedule (dday, who, destination) values ('2010-10-17','hartin','Embry');
insert into schedule (dday, who, destination) values ('2010-10-23','young','Embry');
insert into schedule (dday, who, destination) values ('2010-10-24','romano','Embry');
insert into schedule (dday, who, destination) values ('2010-10-30','kerrigan','Embry');
insert into schedule (dday, who, destination) values ('2010-10-31','houck','Embry');
insert into schedule ( who, dday, destination ) values ('mccoy','2010-11-06','Embry');
insert into schedule ( who, dday, destination ) values ('latham','2010-11-07','Embry');
insert into schedule ( who, dday, destination ) values ('nagle','2010-11-13','Embry');
insert into schedule ( who, dday, destination ) values ('glauser','2010-11-14','Embry');
