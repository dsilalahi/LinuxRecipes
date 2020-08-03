# word count
SELECT word, count(1) as count
FROM (
	SELECT EXPLODE(split(line, ‘,’)) as word 
	FROM word_count) w
GROUP BY word