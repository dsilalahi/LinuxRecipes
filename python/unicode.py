with open('output.dat', 'wb') as fout:
    print >>fout, u'\N{LATIN SMALL LETTER E WITH ACUTE}'
    
with open('output.dat', 'wb') as fout:
    print >>fout, u'\N{LATIN SMALL LETTER E WITH ACUTE}'.encode('utf8')
    
fin = codecs.getreader('utf8')(fin)
fout = codecs.getwriter('utf8')(fout)

print >>fout, u'\N{LATIN SMALL LETTER E WITH ACUTE}'

# ##############################

>>> a = '\xc3\xa9'.decode('utf8')
>>> b = 'e\xcc\x81'.decode('utf8')
>>> print a
é
>>> print b
é
>>> a == b
False

# ##############################

>>> a = '\xc3\xa9'.decode('utf8')
>>> b = 'e\xcc\x81'.decode('utf8')
>>> print a
é
>>> print b
é
>>> from unicodedata import normalize
>>> normalize('NFC', a) == normalize('NFC', b)
True

# ##############################

import codecs

def read_tsv(filename):
    with codecs.open(filename, encoding='utf8') as fin:
        for line in fin:
            line = line[:-1]
            yield line.split('\t')
