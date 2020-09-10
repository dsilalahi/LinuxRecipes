# open a txt file
with open('test.txt', 'r') as f:
    file_contents = f.read()

# zip a text file
with ZipFile('spam.zip', 'w') as myzip:
    myzip.write('eggs.txt')


# open a json file
with open('data.json') as f:
    data = json.load(f)


# write to a file
with open(tmp.name, 'w') as f:
    f.write("James|22|M\n")
    f.write("Sarah|31|F\n")
    f.write("Mindy|25|F")

# reading a raw file
with open(tmp.name, "r") as f:
    for line in f:
      print(line)