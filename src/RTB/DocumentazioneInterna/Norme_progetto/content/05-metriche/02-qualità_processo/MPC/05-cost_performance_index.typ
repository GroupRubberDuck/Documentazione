
#import "/src/config.typ":template_dir
#import template_dir + "/PdQ/metricaDescrizione.typ":descrizione-metrica

#descrizione-metrica(
    codice:"MPC-05",
    nome:"Cost Performance Index",
    descrizione-breve:[
      Rappresenta il rapporto tra il valore del lavoro completato e il costo effettivamente sostenuto.
    ],
    formula:[
      $"Cost Performance Index"= "Earned Value"/"Actual Cost"$
      ],
    interpretazione:[
      - Valore accettabile:$>= 0.9$
      - Valore ottimo:$>=1.0$
    ],
    come-calcolo:none


)




