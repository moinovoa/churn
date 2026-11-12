# Columnas calculadas del proyecto 
## Churn texto
* **Descripción** Cambia el tipo de booleano a texto de churn
* **Fórmula DAX**
```
Churn texto = IF(
    Clientes[churn]=FALSE(), 
    "Retenidos", 
    "Abandonaron"
)
```
----
## +4 llamadas a servicio
* **Descripción** Calcula si tiene +4 llamadas a servicio a cliente o no
* **Fórmula DAX**
```
customer_service_calls_>4 = IF(
    Clientes[customer_service_calls]>=4,
    ">4",
    "<4"
)
```
----
## Plan internacional texto
* **Descripción** Cambia tipo booleano a texto de plan internacional
* **Fórmula DAX**
```
International plan texto = IF(
    Clientes[international_plan]=TRUE(), 
    "Con plan", 
    "Sin plan"
)
```
----
## Riesgo de estado
* **Descripción** Calcula si el estado es de riesgo bajo, medio o alto
* **Fórmula DAX**
```
state_risk = SWITCH(
    TRUE(),
    [tasa_churn_state]<=0.09555690809494827, "Low Risk State",
    [tasa_churn_state]>=0.1832185886402754, "High Risk State",
    "Mid Risk State"
)
```
----
## +70 cargos
* **Descripción** Calcula si tiene +70 cargos o no
* **Fórmula DAX**
```
total_charge_>70 = IF(
    'Clientes'[total_charge]>=70,
    ">70",
    "<70"
)
```
----
## Categorización de cantidad de cargos 
* **Descripción** Categoriza los cargos de 10 en 10
* **Fórmula DAX**
```
total_charge_cat = SWITCH(
    TRUE(),
    Clientes[total_charge]<=30, "[20,30]",
    Clientes[total_charge]<=40, "[30,40]",
    Clientes[total_charge]<=50, "[40,50]",
    Clientes[total_charge]<=60, "[50,60]",
    Clientes[total_charge]<=70, "[60,70]",
    Clientes[total_charge]<=80, "[70,80]",
    Clientes[total_charge]<=90, "[80,90]",
    Clientes[total_charge]<=100, "[90,100]"
)
```
----
## Buzón de voz texto
* **Descripción** Cambia tipo booleano a texto de plan de buzón de voz
* **Fórmula DAX**
```
Voice mail plan texto = IF(
    Clientes[voice_mail_plan]=TRUE(),
    "Con plan", 
    "Sin plan"
)
```
----