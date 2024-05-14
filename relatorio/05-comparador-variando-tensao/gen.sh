#!/usr/bin/env bash

CKT=ckt
PLOTTER=plotter

for v in 3.5 4.5 5.5 6.5 7.5 8.5; do
	sed "s/__VALUE__/$v/" ${CKT}.sp.original >${CKT}.sp
	sed "s/__VALUE__/$v/" ${PLOTTER}.py.original >${PLOTTER}.py

	ngspice -b ${CKT}.sp
	cp ${CKT}.pdf ${CKT}-${v}.pdf

	rm ${CKT}.sp ${PLOTTER}.py ${CKT}.pdf
done

convert ckt-3.5.pdf ckt-4.5.pdf ckt-5.5.pdf ckt-6.5.pdf ckt-7.5.pdf ckt-8.5.pdf ckt.pdf
