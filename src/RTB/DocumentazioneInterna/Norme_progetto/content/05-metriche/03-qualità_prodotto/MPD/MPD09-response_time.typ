
#import "/src/config.typ":template_dir
#import "config/deps.typ" as deps
#import template_dir + "/PdQ/metricaDescrizione.typ":descrizione-metrica
#let nome-metrica="Response Time"

#let dati=(
    codice:deps.get-MPD-code(nome-metrica),
    nome:nome-metrica,
    descrizione-breve:"Misura il tempo medio impiegato dal prodotto per rispondere a una richiesta.",
    formula:none,
    interpretazione:[
      - Valore accettabile:$<=3 "secondi"$
      - Valore ottimo:$<= 1 "secondo"$
    ],
    //Da compilare una volta che si ha qualcosa di concreto da monitorare
    come-calcolo:none,

        accettabile: $<= 3 sec$,
    preferibile: $<= 1 sec$


)


#{dati.interpretazione=[
      - Valore accettabile:#dati.accettabile
      - Valore ottimo:#dati.preferibile
    ]
}
#descrizione-metrica(..dati)