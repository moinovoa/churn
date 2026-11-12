# Medidas DAX del proyecto 
## Clientes totales
* **Descripción** Cuenta los clientes
* **Fórmula DAX**
```
Clientes Totales = COUNTROWS('Clientes')
```
----
## Clientes con cargos <70
* **Descripción** Cuenta los clientes con cargos menores a 70
* **Fórmula DAX**
```
Clientes con cargos <70 = CALCULATE(
    Clientes[Clientes Totales], 
    Clientes[total_charge]<70
) 
```
----
## Clientes con cargos >70
* **Descripción** Cuenta los clientes con cargos mayores a 70
* **Fórmula DAX**
```
Clientes con cargos <70 = CALCULATE(
    Clientes[Clientes Totales], 
    Clientes[total_charge]>=70
) 
```
----
## Clientes con llamadas a servicio <4
* **Descripción** Cuenta los clientes con llamadas a servicio a cliente menores a 4
* **Fórmula DAX**
```
Clientes con llamada a servicio < 4 = CALCULATE(
    Clientes[Clientes Totales], 
    Clientes[customer_service_calls]<4
) 
```
----
## Clientes con llamadas a servicio >3
* **Descripción** Cuenta los clientes con llamadas a servicio a cliente mayores a 4
* **Fórmula DAX**
```
Clientes con llamada a servicio Z 4 = CALCULATE(
    Clientes[Clientes Totales], 
    Clientes[customer_service_calls]>=4
) 
```
----
## Clientes con llamadas
* **Descripción** Cuenta los clientes con llamadas a servicio
* **Fórmula DAX**
```
Clientes con llamadas = CALCULATE(
    Clientes[Clientes Totales], 
    Clientes[customer_service_calls]>=1
) 
```
----
## Clientes con plan de buzón de voz
* **Descripción** Cuenta los clientes con plan de buzón de voz
* **Fórmula DAX**
```
Clientes con plan de mensaje de voz = CALCULATE(
    Clientes[Clientes Totales], 
    Clientes[voice_mail_plan] = TRUE()
)
```
----
## Clientes con plan internacional
* **Descripción** Cuenta los clientes con plan internacional
* **Fórmula DAX**
```
Clientes con plan internacional = CALCULATE(
    [Clientes Totales], 
    Clientes[international_plan]=TRUE()
)
```
----
## Estado con más clientes
* **Descripción** Regresa el estado con más clientes
* **Fórmula DAX**
```
Estado con mayor número de clientes = CONCATENATEX(
    TOPN(
        1, 
        VALUES('Clientes'[State]),
        [Clientes Totales], 
        DESC
    ), 
    'Clientes'[State], 
    ", "
)
```
----
## Estado con mas clientes que cancelaron
* **Descripción** Regresa el estado con mas clientes que cancelaron
* **Fórmula DAX**
```
Estado con mayor número de clientes cancelados = CONCATENATEX(
    TOPN(
        1, 
        VALUES('Clientes'[State]),
        [Clientes que abandonaron], 
        DESC
    ), 
    'Clientes'[State], 
    ", "
)
```
----
## Estado con mayor tasa de churn
* **Descripción** Regresa el estado con la tasa de abandono más alta
* **Fórmula DAX**
```
Estado con mayor tasa de clientes cancelados = CONCATENATEX(
    TOPN(
        1, 
        VALUES('Clientes'[State]),
        [Tasa de churn], 
        DESC
    ), 
    'Clientes'[State], 
    ", "
)
```
----
## Clientes del estado con más clientes
* **Descripción** Cuenta los clientes del estado con más clientes
* **Fórmula DAX**
```
Clientes del estado con mas clientes = 
VAR EstadoTop = [Estado con mayor número de clientes]
RETURN
CALCULATE(
    [Clientes Totales],
    Clientes[state] = EstadoTop
)
```
----
## Clientes que abandonaron
* **Descripción** Cuenta los clientes que abandonaron
* **Fórmula DAX**
```
Clientes que abandonaron = CALCULATE(
    [Clientes Totales], 
    Clientes[churn]=TRUE()
)
```
----
## Clientes que cancelaron del estado con mas clientes cancelados
* **Descripción** Cuenta los clientes que abandonaron del estado donde abandonaron más clientes
* **Fórmula DAX**
```
Clientes que cancelaron del estado con mas clientes cancelados = 
VAR EstadoTop = [Estado con mayor número de clientes cancelados]
RETURN
CALCULATE(
    [Clientes que abandonaron],
    Clientes[state] = EstadoTop)
```
----
## Clientes retenidos
* **Descripción** Cuenta los clientes retenidos
* **Fórmula DAX**
```
Clientes retenidos = CALCULATE(
    [Clientes Totales],
    'Clientes'[Churn] = FALSE()
)
```
----
## Clientes sin plan internacional
* **Descripción** Cuenta los clientes que no tienen plan internacional
* **Fórmula DAX**
```
Clientes sin plan internacional = CALCULATE(
    [Clientes Totales], 
    Clientes[international_plan]=FALSE()
)
```
----
## Churn con cargos <70 
* **Descripción** Cuenta los clientes que abandonaron con cargos <70
* **Fórmula DAX**
```
Churn con cargos <70 = CALCULATE(
    [Clientes que abandonaron], 
    'Clientes'[total_charge]<70
)
```
----
## Churn con cargos >70
* **Descripción** Cuenta los clientes que abandonaron con cargos >70
* **Fórmula DAX**
```
Churn con cargos >70 = CALCULATE(
    [Clientes que abandonaron], 
    'Clientes'[total_charge]>=70
)
```
----
## Churn con llamadas a servicio <4
* **Descripción** Cuenta los clientes que abandonaron con llamadas a servicio a cliente menores a 4
* **Fórmula DAX**
```
Churn con llamada a servicio <4 = CALCULATE(
    Clientes[Clientes que abandonaron], 
    Clientes[customer_service_calls]<4
) 
```
----
## Churn con llamadas a servicio >3 
* **Descripción** Cuenta los clientes que abandonaron con llamadas a servicio a cliente mayores a 3
* **Fórmula DAX**
```
Churn con llamada a servicio >3 = CALCULATE(
    Clientes[Clientes que abandonaron], 
    Clientes[customer_service_calls]>=4
) 
```
----
## Churn con llamadas a servicio
* **Descripción** Cuenta los clientes que abandonaron con llamadas a servicio
* **Fórmula DAX**
```
Churn con llamadas a servicio a cliente = CALCULATE(
    [Clientes que abandonaron],
    Clientes[customer_service_calls]>=1
)
```
----
## Churn con plan de buzon
* **Descripción** Cuenta los clientes que abandonaron con plan de buzón de voz
* **Fórmula DAX**
```
Churn con plan de buzon = CALCULATE(
    Clientes[Clientes que abandonaron], 
    Clientes[voice_mail_plan]=TRUE()
)
```
----
## Churn con plan internacional
* **Descripción** Cuenta los clientes que abandonaron con plan internacional
* **Fórmula DAX**
```
Churn con plan internacional = CALCULATE(
    [Clientes que abandonaron], 
    Clientes[international_plan]=TRUE()
)
```
----
## Churn rate <70
* **Descripción** Saca la tasa de abandono con cargos <70
* **Fórmula DAX**
```
Churn rate cargos <70 = DIVIDE(
    [Churn con cargos <70],
    [Clientes con cargos <70],
    0
)
```
----
## Churn rate >70
* **Descripción** Saca la tasa de abandono con cargos >70
* **Fórmula DAX**
```
Churn rate cargos >70 = DIVIDE(
    [Churn con cargos >70],
    [Clientes con cargos >70],
    0
)
```
----
## Churn rate con llamadas a servicio
* **Descripción** Saca la tasa de abandono con llamadas a servicio a cliente
* **Fórmula DAX**
```
Churn rate clientes con llamadas a servicio = DIVIDE(
    [Churn con llamadas a servicio a cliente],
    [Clientes con llamadas],
    0
)
```
----
## Churn ratecon menos de 4 llamadas a servicio
* **Descripción** Saca la tasa de abandono con menos de 4 llamadas a servicio
* **Fórmula DAX**
```
Churn rate llamadas < 4 = DIVIDE(
    [Churn con llamada a servicio <4], 
    [Clientes con llamada a servicio < 4], 
    0
)
```
----
## Churn rate cargos con mas de 4 llamadas a servicio
* **Descripción** Saca la tasa de abandono con mas de 4 llamadas a servicio
* **Fórmula DAX**
```
Churn rate llamadas >3 = DIVIDE(
    [Churn con llamada a servicio >3], 
    [Clientes con llamada a servicio >3], 
    0
)
```
----
## Churn rate plan buzón de voz
* **Descripción** Saca la tasa de abandono con plan de buzón de voz
* **Fórmula DAX**
```
Churn rate plan de mensaje de voz = DIVIDE(
    [Churn con plan de buzon],
    [Clientes con plan de mensaje de voz], 
    0
)
```
----
## Churn rate plan internacional
* **Descripción** Saca la tasa de abandono con plan internacional
* **Fórmula DAX**
```
Churn rate plan internacional = DIVIDE(
    [Churn con plan internacional], 
    [Clientes con plan internacional], 
    0
)
```
----
## Churn rate sin plan buzón de voz
* **Descripción** Saca la tasa de abandono sin plan de buzón de voz
* **Fórmula DAX**
```
Churn rate sin plan de buzon de voz = DIVIDE(
    CALCULATE(
        [Clientes que abandonaron],
        'Clientes'[voice_mail_plan] = FALSE()
    ),
    [Clientes Totales]-[Clientes con plan de mensaje de voz],
    0
)
```
----
## Churn rate sin pan internacional
* **Descripción** Saca la tasa de abandono sin plan internacional
* **Fórmula DAX**
```
Churn rate sin plan internacional = DIVIDE(
    CALCULATE(
        [Clientes que abandonaron],
        'Clientes'[international_plan] = FALSE()
    ),
    [Clientes Totales]-[Clientes con plan internacional],
    0
)
```
----
## Diferencia de tasas atención a cliente
* **Descripción** Saca la diferencia de tasas de abandono entre clientes con mas o menos 4 llamadas a atención a cliente
* **Fórmula DAX**
```
Diferencia churn rate atencion a cliente = [Churn rate llamadas >3]-[Churn rate llamadas < 4]
```
----
## Diferencia de tasas plan de buzón
* **Descripción** Saca la diferencia de tasas de abandono entre clientes con o sin plan de buzón de voz
* **Fórmula DAX**
```
Diferencia churn rate buzon = [Churn rate sin plan de buzon de voz]-[Churn rate plan de mensaje de voz]
```
----
## Diferencia de tasas cargos
* **Descripción** Saca la diferencia de tasas de abandono entre clientes con mas o menos de 70 cargos
* **Fórmula DAX**
```
Diferencia churn rate cargos = [Churn rate cargos >70]-[Churn rate cargos <70]
```
----
## Diferencia de tasas plan internacional
* **Descripción** Saca la diferencia de tasas de abandono entre clientes con o sin plan internacional
* **Fórmula DAX**
```
Diferencia churn rate internacional = [Churn rate plan internacional]-[Churn rate sin plan internacional]
```
----
## Correlación de Pearson tasa de abandono/antigüedad
* **Descripción** Saca la correlación entre la tasa de abandono y la antigüedad del cliente
* **Fórmula DAX**
```
PEARSON_tasa_antiguedad = 
-- Tabla
VAR TablaEstados =
    ADDCOLUMNS(
        VALUES('Clientes'[state]),
        "@churn",
            CALCULATE(AVERAGEX('Clientes', IF('Clientes'[churn], 1, 0))),
        "@duracion",
            CALCULATE(AVERAGE(Clientes[account_length]))
    )
-- Variables
VAR N      = COUNTROWS(TablaEstados)
VAR SumaX  = SUMX(TablaEstados, [@churn])
VAR SumaY  = SUMX(TablaEstados, [@duracion])
VAR SumaXY = SUMX(TablaEstados, [@churn] * [@duracion])
VAR SumaX2 = SUMX(TablaEstados, [@churn] ^ 2)
VAR SumaY2 = SUMX(TablaEstados, [@duracion] ^ 2)
-- División
VAR Numerador   = N * SumaXY - SumaX * SumaY
VAR MultiploX   = N * SumaX2 - SumaX ^ 2
VAR MultiploY   = N * SumaY2 - SumaY ^ 2
VAR Denominador = SQRT(MultiploX * MultiploY)
RETURN
    DIVIDE(Numerador, Denominador, 0)
```
----
## Correlación de Pearson tasa de abandono/+70 cargos
* **Descripción** Saca la correlación entre la tasa de abandono y la tasa de clientes con >70 cargos
* **Fórmula DAX**
```
PEARSON_tasa_cargos_estatal = 
-- Tabla
VAR TablaEstados =
    ADDCOLUMNS(
        VALUES('Clientes'[state]),
        "@churn",
            CALCULATE(AVERAGEX('Clientes', IF('Clientes'[churn], 1, 0))),
        "@cargos70",
            CALCULATE(AVERAGEX('Clientes', IF('Clientes'[total_charge_>70] = ">70", 1, 0)))
    )
-- Variables
VAR N      = COUNTROWS(TablaEstados)
VAR SumaX  = SUMX(TablaEstados, [@churn])
VAR SumaY  = SUMX(TablaEstados, [@cargos70])
VAR SumaXY = SUMX(TablaEstados, [@churn] * [@cargos70])
VAR SumaX2 = SUMX(TablaEstados, [@churn] ^ 2)
VAR SumaY2 = SUMX(TablaEstados, [@cargos70] ^ 2)
-- División
VAR Numerador   = N * SumaXY - SumaX * SumaY
VAR MultiploX   = N * SumaX2 - SumaX ^ 2
VAR MultiploY   = N * SumaY2 - SumaY ^ 2
VAR Denominador = SQRT(MultiploX * MultiploY)
RETURN
    DIVIDE(Numerador, Denominador, 0)
```
----
## Correlación de Pearson tasa de abandono/+4 llamadas a servicio a cliente
* **Descripción** Saca la correlación entre la tasa de abandono y la tasa de clientes con >4 llmadas a servicio a cliente
* **Fórmula DAX**
```
PEARSON_tasa_llamadas = 
-- Tabla
VAR TablaEstados =
    ADDCOLUMNS(
        VALUES('Clientes'[state]),
        "@churn",
            CALCULATE(AVERAGEX('Clientes', IF('Clientes'[churn], 1, 0))),
        "@llamadas>4",
            CALCULATE(AVERAGEX('Clientes', IF('Clientes'[customer_service_calls_>4]=">4", 1, 0)))
    )
-- Variables
VAR N      = COUNTROWS(TablaEstados)
VAR SumaX  = SUMX(TablaEstados, [@churn])
VAR SumaY  = SUMX(TablaEstados, [@llamadas>4])
VAR SumaXY = SUMX(TablaEstados, [@churn] * [@llamadas>4])
VAR SumaX2 = SUMX(TablaEstados, [@churn] ^ 2)
VAR SumaY2 = SUMX(TablaEstados, [@llamadas>4] ^ 2)
-- División
VAR Numerador   = N * SumaXY - SumaX * SumaY
VAR MultiploX   = N * SumaX2 - SumaX ^ 2
VAR MultiploY   = N * SumaY2 - SumaY ^ 2
VAR Denominador = SQRT(MultiploX * MultiploY)
RETURN
    DIVIDE(Numerador, Denominador, 0)
```
----
## R^2 tasa de abandono/antiguedad
* **Descripción** Saca R^2 entre la tasa de abandono y la antigüedad
* **Fórmula DAX**
```
R^2_tasa_antiguedad = 
VAR cor = [PEARSON_tasa_antiguedad]
RETURN
    cor^2
```
## R^2 tasa de abandono/+70 cargos
* **Descripción** Saca R^2 entre la tasa de abandono y la tasa de clientes con +70 cargos
* **Fórmula DAX**
```
R^2_tasa_cargos = 
VAR cor = [PEARSON_tasa_cargos_estatal]
RETURN
    cor^2
```
----
## R^2 tasa de abandono/+4 llamadas a servicio a cliente
* **Descripción** Saca R^2 entre la tasa de abandono y la tasa de clientes con +4 llamadas a atención a cliente 
* **Fórmula DAX**
```
R^2_tasa_llamadas = 
VAR cor = [PEARSON_tasa_llamadas]
RETURN
    cor^2
```
## Porcentaje +70 cargos
* **Descripción** Saca el porcentaje de clientes con +70 cargos
* **Fórmula DAX**
```
Tasa de cargos >70 = DIVIDE(
    [Clientes con cargos >70],
    [Clientes Totales],
    0
)
```
## Porcentaje churn
* **Descripción** Saca el porcentaje de clientes aue abandonaron
* **Fórmula DAX**
```
Tasa de churn = DIVIDE(
    Clientes[Clientes que abandonaron], 
    [Clientes Totales],
    0
)
```
## Tasa de churn del estado con mayor tasa de churn
* **Descripción** Saca la tasa de abandono del estado con mayor tasa de abandono
* **Fórmula DAX**
```
Tasa de churn del estado con mayor tasa churn = 
VAR EstadoTop = [Estado con mayor tasa de clientes cancelados]
RETURN
CALCULATE(
    [Tasa de churn],
    Clientes[state] = EstadoTop
)
```
## Porcentaje de +4 llamadas a servicio a cliente
* **Descripción** Saca el porcentaje de clientes con +4 llamadas a servicio a cliente
* **Fórmula DAX**
```
Tasa de llamadas >4 = DIVIDE(
    [Clientes con llamada a servicio >3],
    [Clientes Totales],
    0
)
```
## Porcentaje de tasa de plan internacional
* **Descripción** Saca el porcentaje de clientes con plan internacional
* **Fórmula DAX**
```
Tasa de plan internacional = DIVIDE(
    [Clientes con plan internacional],
    [Clientes Totales],
    0
)
```
## Porcentaje de retención
* **Descripción** Saca el porcentaje de clientes retenidos
* **Fórmula DAX**
```
Tasa de retención = DIVIDE(
    [Clientes retenidos], 
    [Clientes Totales],
    0
)
```
## Tasa de retención con buzón de voz
* **Descripción** Saca el porcentaje de clientes retenidos de los cientes con plan de buzón de voz
* **Fórmula DAX**
```
Tasa de retención clientes con buzón de voz = 1-[Churn rate plan de mensaje de voz]
```