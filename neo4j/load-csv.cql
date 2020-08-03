// with headers
LOAD CSV WITH HEADERS FROM 'file:///employees.csv' AS row
MERGE (p:Person {name: coalesce(row.name, ""), birthday: row.birthday, gender: row.gender, type: row.type, state: row.state, city: coalesce(row.city, ""), phone: coalesce(row.phone, "") } )

// without headers
LOAD CSV FROM 'file:///employees.csv' AS row
MERGE(:Employees {name:row[0], birtday:row[1]})