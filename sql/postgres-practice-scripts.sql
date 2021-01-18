select * from customers c 
select * from orders o 
select * from employees e 

select * 
from orders o
	inner join customers c on c.id = o.cust_id 
where c."name" like 'Samsonic'

select distinct e.fname, e.lname 
from customers c 
	inner join orders o on c.id = o.cust_id 
	inner join employees e on o.emp_id = e.id 
where c."name" like 'Samsonic'


select * 
from employees e
where e.id IN (select count(emp_id) as emp_id 
			from orders o 
			group by emp_id 
			having emp_id > 1)

with tmp as
	(
	select count(emp_id) as emp_id 
			from orders o 
			group by emp_id 
			having emp_id > 1
	)
	select * 
		from tmp inner join employees e on e.id  = tmp.emp_id
		
		
select min(lname )
from employees e
	inner join orders o on o.emp_id = e.id 
group by emp_id 
		

select e.fname, e.lname, salary 
	, ntile(4) over(order by salary desc) as salary 
from employees e 

select e.fname, e.lname, salary, dept 
	, rank() over (partition by dept order by salary) as ranking
from employees e 
		

select * 
from employees e
where salary > 100000


with recursive cte_mgr(id, fname, lname, manager_id) as 
	(
		select e.id, e.fname, e.lname, e.manager_id 
		from employees e
		where e.manager_id = 9 and e.id <> 9
		union all 
		select e2.id, e2.fname, e2.lname, e2.manager_id 
		from employees e2
			inner join cte_mgr m on e2.manager_id = m.id
	)
select * from cte_mgr



select e.*
from customers c 
	inner join orders o on c.id = o.cust_id 
	inner join employees e on o.emp_id = e.id 
where c."name" like 'Orange'



select fname, 
	lname, 
	dept, 
	rank() over (partition by dept order by salary) as ranking
from employees



select e.fname, e.lname, e.dept, e.salary 
from employees e
	left join employees e2 on e.dept = e2.dept and e.salary < e2.salary 
where e2.salary is null
order by dept, salary DESC