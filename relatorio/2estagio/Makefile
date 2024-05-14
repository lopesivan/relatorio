CKT=ckt

output.csv: $(CKT).sp
	ngspice -b $(CKT).sp

plot: output.csv
	python plotter.py $(CKT).pdf

$(CKT).pdf: output.csv

show: $(CKT).pdf
	zathura $(CKT).pdf

clean:
	rm output.csv $(CKT).out $(CKT).pdf

# eof
