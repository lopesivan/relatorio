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
.param positive_supply = 5   $ alimentação positiva
.param negative_supply = 5   $ alimentação negativa

.param R1val = 10k
.param R2val = 10k
.param RLval = 10k

.include LM741.MOD

* - Stage 3:
*
*   ```
*   XSTU1 in out
*   ```
*
.subckt STAGE_TREE in out
R1   in     2  {R1val}
R2    3   GND  {R2val}
Vp    7   GND  {positive_supply}
Vm  GND     4  {negative_supply}

XU1  3 2 7 4 out LM741/NS
.ends STAGE_TREE

V1     in  GND  sin(0 A f)
RL     out GND     {R2val}

XST1    in out  STAGE_TREE

.tran {T/10} {2*T}

.control
    run
    wrdata output.csv in out
 *    shell python plotter.py ckt.pdf
    quit
.endc

.end

