select * from employees


select max(salary), max(fname), dept
from employees e 
group by dept 


select fname,
	rank() over (partition by dept order by salary) as ranking,
	salary, 
	dept
from employees
