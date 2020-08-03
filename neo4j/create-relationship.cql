MATCH(a:Person), (b:Person)
WHERE a.name = "Jerry Seinfeld" and b.name = "Kramer"
CREATE (a)-[:RELATIVE_OF{name:"friend"}]->(b)
RETURN a,b