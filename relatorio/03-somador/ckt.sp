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


* - Stage 3:
*
*   ```
*   XST1 in out STAGE_TREE
*   ```
*
.subckt STAGE_TREE in out
R1   in     2   12k
R2    2   out   24k
C1    2   out   220n

Vm   GND    4   12V

XU1 GND 2 GND 4 out LM741/NS
.ends STAGE_TREE



* - Stage 4:
*
*   ```
*   XST1 in out STAGE_FOUR
*   ```
*
.subckt STAGE_FOUR in out
R1   in     2   10k
R2    2   out   10k
R3    3   GND   10k

Vp    7   GND   12V
Vm  GND     4   12V

XU1 3 2 7 4 out LM741/NS
.ends STAGE_FOUR



** Circuito
V1     in   GND  sin(0 A f)
RL     out  GND     10k

XST2   in    out3  STAGE_TWO
XST3   out3  out5  STAGE_TREE
XST4   out5   out  STAGE_FOUR

.tran 5 5.06 5

.control
    run
    wrdata output.csv out5 out
    shell python plotter.py ckt.pdf
	shell zathura ckt.pdf

    quit
.endc

.end

