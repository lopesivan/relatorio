Circuito com aplificador

* - O exemplo usa a seguinte linha de conexão:
*
*   ```
*             V-
*             |
*         in- |   ______________ out
*         |   |  /
*   XU1 3 2 7 4 6 LM741/NS
*       |   |
*       in+ |
*           |
*           V+
*
*   ```
*

.param f = 60             $ frequencia Hz
.param T = 1/f            $ período
.param A = 3              $ Aplitude

.include LM741.MOD

* - Stage 2:
*
*   ```
*   XST1 in out STAGE_TWO
*   ```
*
.subckt STAGE_TWO in out
R1   in     2  10k
Vp    7   GND  5V

XU1  GND 2 7 GND out LM741/NS
.ends STAGE_TWO

** Circuito
V1     in   GND  sin(0 A f)
RL     out  GND     10k

XST1   in   out  STAGE_TWO

.tran 5 5.06 5

.control
    run
    wrdata output.csv in out
    shell python plotter.py ckt.pdf
	shell zathura ckt.pdf

    quit
.endc

.end
