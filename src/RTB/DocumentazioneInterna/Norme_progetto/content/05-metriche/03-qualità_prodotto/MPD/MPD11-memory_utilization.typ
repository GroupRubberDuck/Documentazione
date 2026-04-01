
#import "/src/config.typ":template_dir
#import "config/deps.typ" as deps
#import template_dir + "/PdQ/metricaDescrizione.typ":descrizione-metrica
#let nome-metrica="Memory Utilization"

#let dati=(
    codice:deps.get-MPD-code(nome-metrica),
    nome:nome-metrica,

    descrizione-breve:"Misura l'utilizzo di memoria RAM lato client.",
    formula:none,
    interpretazione:[
      - Valore accettabile:$<=4 "GB"$
      - Valore ottimo:$<= 1,5 "GB" $
    ],
    //Da compilare una volta che si ha qualcosa di concreto da monitorare
    come-calcolo:none,


    accettabile: $<= 4,0 "GB"$,
    preferibile: $<= 1,5 "GB"$
)


#{dati.interpretazione=[
      - Valore accettabile:#dati.accettabile
      - Valore ottimo:#dati.preferibile
    ]
}
#descrizione-metrica(..dati)