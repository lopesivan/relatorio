CKT=ckt

output.csv: $(CKT).sp
	ngspice -b $(CKT).sp

show: $(CKT).pdf
	zathura $(CKT).pdf

clean:
	rm output.csv $(CKT).pdf

# eof
