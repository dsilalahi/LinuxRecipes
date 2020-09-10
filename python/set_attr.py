class Person():
    pass

person = Person()
key = 'first'
val = 'Dohar'

setattr(person, key, val)
first = getattr(person, key)
print(person.first)
print(first)