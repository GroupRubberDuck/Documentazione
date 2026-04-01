
#import "/src/config.typ":template_dir
#import "config/deps.typ" as deps
#import template_dir + "/PdQ/metricaDescrizione.typ":descrizione-metrica


#let nome-metrica="Cyclomatic Complexity"

#let dati=(
    codice:deps.get-MPD-code(nome-metrica),
    nome:nome-metrica,
    descrizione-breve:"Misura la complessità del codice in base al numero di percorsi linearmente dipendenti.",
    formula:[$
               "Cyclomatic complexity"=E - N + 2P
             $
            #terms(
              ([$E$],[Numero di archi nel grafo di controllo]),
              ([$N$],[Numero di nodi nel grafo di controllo]),
              ([$P$],[Numero di componenti connesse]),
            )
             
             ],
    interpretazione:[
      - Valore accettabile:$<= 10$
      - Valore ottimo:$<= 8 $
    ],
    //Da compilare una volta che si ha qualcosa di concreto da monitorare
    come-calcolo:none,
    accettabile: $<= 10$,
    preferibile: $<= 8$
)



#{dati.interpretazione=[
      - Valore accettabile:#dati.accettabile
      - Valore ottimo:#dati.preferibile
    ]
}
#descrizione-metrica(..dati)