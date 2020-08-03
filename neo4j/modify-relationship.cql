MATCH (m)-[old:IS_SON_IN_LAW_OF]->(n)
CREATE (m)-[new:RELATIVE_OF {name:"son in law"}]->(n)
DELETE old
RETURN m, new, n