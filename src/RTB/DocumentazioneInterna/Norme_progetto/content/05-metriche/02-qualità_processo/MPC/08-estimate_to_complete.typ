
#import "/src/config.typ":template_dir
#import template_dir + "/PdQ/metricaDescrizione.typ":descrizione-metrica

#descrizione-metrica(
    codice:"MPC-08",
    nome:"Estimate To Complete",
    descrizione-breve:[
      Rappresenta il costo ancora da sostenere per il completamento delle attività
    ],
    formula:[
      $"Estimate To Complete"="Estimate at Completion"- "Actual Cost" $
      ],
    interpretazione:[
      - Valore accettabile:$<= ("Budget at Completion"-" Actual Cost")*1.1 $
      - Valore ottimo:$<= "Budget at Completion"-" Actual Cost"$
    ],
    come-calcolo:none


)




