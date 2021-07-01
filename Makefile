.POSIX:

coefs := coefs.csv
train-coefs := train-coefs.csv

.PHONY: coefs
coefs: $(coefs)

$(coefs): coefs.sql
	sqlite3 <coefs.sql

.PHONY: train-coefs
train-coefs: $(train-coefs)

$(train-coefs): train-coefs.sql
	sqlite3 <train-coefs.sql

.PHONY: clean
clean: 
	rm -f coefs.csv train-coefs.csv
