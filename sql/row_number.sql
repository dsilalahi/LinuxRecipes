-- Row Number
SELECT 
  ROW_NUMBER() OVER(ORDER BY name ASC) AS Row#,
  name, recovery_model_desc
FROM sys.databases 
WHERE database_id < 5;

-- To get the highest salary for each department
SELECT *
FROM Worker w 
WHERE Salary IN (
  SELECT MAX(Salary) FROM Worker w2 GROUP BY Department
  )

SELECT w.*
FROM Worker w            
     LEFT JOIN Worker w2 ON w.Department = w2.Department AND w.Salary < w2.Salary 
WHERE w2.Salary is NULL
ORDER BY w.Department

-- top 3 salary
SELECT * 
FROM 
	(
	SELECT Id, First_Name, Last_Name, Salary, Department, 
	RANK() OVER (ORDER BY Salary DESC) as ranking
	FROM Worker w 
	) as t
WHERE t.ranking <= 3

-- top 3 salary for each dept
SELECT * 
FROM 
	(
	SELECT Id, First_Name, Last_Name, Salary, Department, 
	RANK() OVER (PARTITION BY Department ORDER BY Salary DESC) as ranking
	FROM Worker w 
	) as t
WHERE t.ranking = 1