
#import "/src/config.typ":template_dir
#import "config/deps.typ" as deps
#import template_dir + "/PdQ/metricaDescrizione.typ":descrizione-metrica

#let nome-metrica="Code Smell"

#let dati=(
    codice:deps.get-MPD-code(nome-metrica),
    nome:nome-metrica,
    descrizione-breve:"Misura il rapporto tra codice smell e KLOC.",
    formula:[
      $"Code smell"="Numero di codice smell" / "KLOC"$
    ],
    interpretazione:[
      - Valore accettabile:$<=10$
      - Valore ottimo:$<= 5$
    ],
    //Da compilare una volta che si ha qualcosa di concreto da monitorare
    come-calcolo:none,

    accettabile: $<= 10$ ,
    preferibile: $<= 5$ 


)


#{dati.interpretazione=[
      - Valore accettabile:#dati.accettabile
      - Valore ottimo:#dati.preferibile
    ]
}
#descrizione-metrica(..dati)