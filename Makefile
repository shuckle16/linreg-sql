.POSIX:

coefs := coefs.csv
train-coefs := train-coefs.csv

.PHONY: coefs
coefs: $(coefs)

$(coefs): linreg.sql
	sqlite3 <linreg.sql

.PHONY: train-coefs
train-coefs: $(train-coefs)

$(train-coefs): linreg2.sql
	sqlite3 <linreg2.sql

.PHONY: clean
clean: 
	rm coefs.csv train-coefs.csv
