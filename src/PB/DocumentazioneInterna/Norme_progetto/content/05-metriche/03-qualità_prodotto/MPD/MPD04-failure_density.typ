
#import "/src/config.typ":template_dir
#import "config/deps.typ" as deps
#import template_dir + "/PdQ/metricaDescrizione.typ":descrizione-metrica

#let nome-metrica="Failure Density"

#let dati=(
    nome:nome-metrica,
    codice:deps.get-MPD-code(nome-metrica),
    descrizione-breve:"Numero di failure per 1000 linee di codice (KLOC)",
    formula:$ "Failure Density"="Numero di Failure" / "KLOC" $,
    interpretazione:[
      - Valore accettabile:$<=0.5$
      - Valore ottimo:$<=0.2$
    ],
    accettabile: $<= 0.5$,
    preferibile: $<= 0.2$,
    //Da compilare una volta che si ha qualcosa di concreto da monitorare
    come-calcolo:none


)

#{dati.interpretazione=[
      - Valore accettabile:#dati.accettabile
      - Valore ottimo:#dati.preferibile
    ]
}
#descrizione-metrica(..dati)