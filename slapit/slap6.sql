select s from ( select sum(year),avg(year),sum(year+1),avg(year-1),avg(year+10) as s from (select tail_num, year from flights) sub0 group by tail_num+10 having s > 0 )sub2;
