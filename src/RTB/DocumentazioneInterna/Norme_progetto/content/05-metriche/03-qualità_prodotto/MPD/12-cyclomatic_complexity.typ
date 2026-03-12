#import "/src/config.typ":template_dir
#import template_dir + "/PdQ/metricaDescrizione.typ":descrizione-metrica

#descrizione-metrica(
    codice:"MPD-12",
    nome:"Cyclomatic Complexity",
    descrizione-breve:"Misura la complessità del codice in base al numero di percorsi linearmente dipendenti",
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

)
