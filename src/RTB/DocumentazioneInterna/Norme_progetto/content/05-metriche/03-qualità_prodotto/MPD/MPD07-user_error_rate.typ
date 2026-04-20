
#import "/src/config.typ":template_dir
#import "config/deps.typ" as deps
#import template_dir + "/PdQ/metricaDescrizione.typ":descrizione-metrica
#let nome-metrica="User Error Rate"

#let dati=(

    codice:deps.get-MPD-code(nome-metrica),
    nome:nome-metrica,
    descrizione-breve:"Misura quanto spesso un utente fa errori durante l'uso del prodotto.",
    formula:$ "User error rate"="Errori Totali" / "Azioni Totali" $,
    interpretazione:[
      - Valore accettabile:$<=3 percent$
      - Valore ottimo:$<= 1 percent$
    ],
    //Da compilare una volta che si ha qualcosa di concreto da monitorare
    come-calcolo:none,

        accettabile: $<= 3 percent$,
    preferibile: $<= 1 percent$,


)


#{dati.interpretazione=[
      - Valore accettabile:#dati.accettabile
      - Valore ottimo:#dati.preferibile
    ]
}
#descrizione-metrica(..dati)