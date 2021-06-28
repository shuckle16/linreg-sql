.POSIX:

coefs := coefs.csv

.PHONY: coefs
coefs: $(coefs)

$(coefs): linreg.sql
	sqlite3 <linreg.sql

.PHONY: clean
clean: 
	rm coefs.csv
