
#import "/src/config.typ":template_dir
#import template_dir + "/PdQ/metricaDescrizione.typ":descrizione-metrica

#descrizione-metrica(
    codice:"MPC-06",
    nome:"Estimate at Completion",
    descrizione-breve:[
      Rappresenta il costo da sostenere per il completamento delle attività sulla base della performance attuali.
    ],
    formula:[
      $"Estimate at Completion"= "Budget at completion" / " Cost Performance Index"$
      ],
    interpretazione:[
      - Valore accettabile:$<= 1.1 * "BAC" $
      - Valore ottimo:$<= "BAC"$
    ],
    come-calcolo:none


)




