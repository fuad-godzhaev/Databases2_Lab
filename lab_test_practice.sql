set search_path = "BUILDER";
select * from recommends;
select * from "module" m
full join recommends using (mod_code)
full join book using (isbn)
full join authors using (isbn)
full join Author using (author_id);

select title from book where isbn in (
select isbn from recommends group by isbn
having count(*)> 1);

select title from book where ISBN not in(
select ISBN from recommends);
select title from book left join recommends using (ISBN) where mod_code is null;
select title from book b where not exists(
select * from recommends r where r.ISBN = b.ISBN);

select title from book A where not exists(
select * from module B where not exists(
select* from recommends X
where A.isbn = X.isbn and B.mod_code=X.mod_code));

select mod_name from book join recommends using (isbn)
join module using (mod_code)
where title = 'SQL Cookbook'
except
(select mod_name from book join recommends using (isbn)
join module using (mod_code)
where title != 'SQL Cookbook');


create view sampletitle as 
select mod_name, title
from "BUILDER".book join "BUILDER".recommends using (isbn)
join "BUILDER".module using (mod_code);

/*
select mod_name from sampletitle where title = 'Data Science'
union 
select mod_name from sampletitle where title = 'Real world SQL'
except 
(select mod_name from sampletitle where title = 'Data Science')
intersect
select mod_name from sampletitle where title 'Real World IN SQL');
select * From sampletitle;
where title = 'SQL Cookbook'
select title from book where isbn in 
(select isbn from recommends group by isbn
having count(*)>1);*/

select * from sampletitle;

select mod_code, count(*) from recommends group by (mod_code) order by (count(*));

select max(newfield) from (
select count(*) newfield from recommends group by (mod_code)) as newquery;

select title, yearofpublication, author_name,
rank( over (partition by author_id order by yearofpublication)