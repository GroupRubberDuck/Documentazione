
#import "/src/config.typ":template_dir
#import "config/deps.typ" as deps
#import template_dir + "/PdQ/metricaDescrizione.typ":descrizione-metrica
#let nome-metrica="Branch Coverage"

#let dati=(
    codice:deps.get-MPD-code(nome-metrica),
    nome:nome-metrica,

    descrizione-breve:"Percentuale di rami di codice coperte da test automatizzati.",
    formula:$ "Branch coverage"="Numero di Branch coperti da test" / "Numero di Branch totali" $,
    interpretazione:[
      - Valore accettabile:$>=70 percent$
      - Valore ottimo:$>=90 percent$
    ],
    //Da compilare una volta che si ha qualcosa di concreto da monitorare
    come-calcolo:none,

    accettabile: $>= 70 percent$,
    preferibile: $>= 90 percent$
)


#{dati.interpretazione=[
      - Valore accettabile:#dati.accettabile
      - Valore ottimo:#dati.preferibile
    ]
}
#descrizione-metrica(..dati)