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
.param T = 1/f
.param A = 3              $ Aplitude
.param positive_supply = 5   $ alimentação positiva
.param negative_supply = 5   $ alimentação negativa

R1   in   2  10k
* R2    3   0  10k        $ --->-----\   Removendo o resistor R2
RL  out   0  10k                      $
                                      $
Vp    7   0  {positive_supply}        $
Vm    0   4  {negative_supply}        $
V1   in   0  sin(0 A f)               $
                                      $
.include LM741.MOD                    $
XU1 0 2 7 4 out LM741/NS  $ <--------/

.tran {T/10} {2*T}

.control
    run
    wrdata output.csv in out
 *    shell python plotter.py ckt.pdf
    quit
.endc

.end

