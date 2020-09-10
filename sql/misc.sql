-- get top 3 salary from each dept
SELECT * 
FROM 
	(
	SELECT Id, First_Name, Last_Name, Salary, Department, 
	RANK() OVER (PARTITION BY Department ORDER BY Salary DESC) as ranking
	FROM Worker w 
	) as t
WHERE t.ranking = 1


SELECT w.*
FROM Worker w            
     LEFT JOIN Worker w2 ON w.Department = w2.Department AND w.Salary < w2.Salary 
WHERE w2.Salary is NULL
ORDER BY w.Department 


SELECT *
FROM Worker w 
WHERE Salary IN (
	SELECT MAX(Salary) FROM Worker w2 GROUP BY Department
)