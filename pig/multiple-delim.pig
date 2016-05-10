outerbag = LOAD 'data/multi-delimiter.txt' USING PigStorage('\t') AS (f1, f2);

innerbag = FOREACH outerbag GENERATE f1, STRSPLIT(f2, ',');

DUMP innerbag;
