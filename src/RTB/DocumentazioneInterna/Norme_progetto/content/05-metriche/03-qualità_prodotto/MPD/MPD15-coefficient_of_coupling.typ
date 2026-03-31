
#import "/src/config.typ":template_dir
#import "config/deps.typ" as deps
#import template_dir + "/PdQ/metricaDescrizione.typ":descrizione-metrica


#let nome-metrica="Coefficient of coupling"

#let dati=(
    codice:deps.get-MPD-code(nome-metrica),
    nome:nome-metrica,
    descrizione-breve:"Misura il coupling tra le componenti del sistema",
    formula:[$ "Coefficient of coupling" = "Numero di dipendenze" / "Numero di componenti" $],
    interpretazione:[
      - Valore accettabile:$<=0.4$
      - Valore ottimo:$<= 0.2$
    ],
    //Da compilare una volta che si ha qualcosa di concreto da monitorare
    come-calcolo:none,

    accettabile: $<= 0.4$,
    preferibile: $<= 0.2$
)


#{dati.interpretazione=[
      - Valore accettabile:#dati.accettabile
      - Valore ottimo:#dati.preferibile
    ]


}
#descrizione-metrica(..dati)