
#import "/src/config.typ":template_dir
#import "config/deps.typ" as deps
#import template_dir + "/PdQ/metricaDescrizione.typ":descrizione-metrica
#let nome-metrica="CPU Utilization"

#let dati=(
    codice:deps.get-MPD-code(nome-metrica),
    nome:nome-metrica,

    descrizione-breve:"Misura l'utilizzo di CPU lato client.",
    formula:none,
    interpretazione:[
      - Valore accettabile:$<=35 percent$
      - Valore ottimo:$<= 20 percent$
    ],
    //Da compilare una volta che si ha qualcosa di concreto da monitorare
    come-calcolo:[
      Le percentuali fanno riferimento ai seguenti processori:
      - Intel Core Ultra 5
      - AMD Ryzen 5 5500
    ],

        accettabile: $<= 35%$,
    preferibile: $<= 20%$


)


#{dati.interpretazione=[
      - Valore accettabile:#dati.accettabile
      - Valore ottimo:#dati.preferibile
    ]
}
#descrizione-metrica(..dati)