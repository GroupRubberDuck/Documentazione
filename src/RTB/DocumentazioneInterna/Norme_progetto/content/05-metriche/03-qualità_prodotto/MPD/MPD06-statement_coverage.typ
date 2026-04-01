
#import "/src/config.typ":template_dir
#import "config/deps.typ" as deps
#import template_dir + "/PdQ/metricaDescrizione.typ":descrizione-metrica

#let nome-metrica="Statement Coverage"

#let dati=(
    codice:deps.get-MPD-code(nome-metrica),
    nome:nome-metrica,
    descrizione-breve:"Percentuale di istruzioni del codice coperte da test automatizzati.",
    formula:$ "Statement Coverage"="Istruzioni Testate" / "Istruzioni Totali" $,
    interpretazione:[
      - Valore accettabile:$>=80 percent$
      - Valore ottimo:$>=95 percent$
    ],
    //Da compilare una volta che si ha qualcosa di concreto da monitorare

  
    come-calcolo:none,
    accettabile: $>= 80 percent$,
    preferibile: $>= 95 percent$,

)

#{dati.interpretazione=[
      - Valore accettabile:#dati.accettabile
      - Valore ottimo:#dati.preferibile
    ]
}
#descrizione-metrica(..dati)