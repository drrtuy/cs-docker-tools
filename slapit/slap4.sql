select s from (select count(*) as s from flights group by tail_num)sub;
