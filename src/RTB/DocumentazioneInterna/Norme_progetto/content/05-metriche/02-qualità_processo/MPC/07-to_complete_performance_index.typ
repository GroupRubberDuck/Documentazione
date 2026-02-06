
#import "/src/config.typ":template_dir
#import template_dir + "/PdQ/metricaDescrizione.typ":descrizione-metrica

#descrizione-metrica(
    codice:"MPC-07",
    nome:"To Complete Performance Index",
    descrizione-breve:[
      Rappresenta l'efficienza richiesta in futuro per completare il lavoro entro il termine previsto
    ],
    formula:[
      $"Estimate at Completion"= ("Budget at Completion" - "Earned Value") / ("Budget at Completion" - "Actual Cost" )$
      ],
    interpretazione:[
      - Valore accettabile:$tilde 1.0 $
      - Valore ottimo:$<= 1.0$
    ],
    come-calcolo:none


)




