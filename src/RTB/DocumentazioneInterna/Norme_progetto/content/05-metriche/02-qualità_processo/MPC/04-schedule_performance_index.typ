
#import "/src/config.typ":template_dir
#import template_dir + "/PdQ/metricaDescrizione.typ":descrizione-metrica

#descrizione-metrica(
    codice:"MPC-04",
    nome:"Schedule Performance Index",
    descrizione-breve:[
      Rappresenta il rapporto tra il valore del lavoro completato e il lavoro pianificato.
    ],
    formula:[
      $"Schedule Performance Index"= "Earned Value"/"Planned Value"$
      ],
    interpretazione:[
      - Valore accettabile:$>= 0.9$
      - Valore ottimo:$>=1.0$
    ],
    come-calcolo:none


)




