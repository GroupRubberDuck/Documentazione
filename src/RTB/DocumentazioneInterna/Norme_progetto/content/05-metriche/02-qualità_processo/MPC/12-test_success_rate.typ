
#import "/src/config.typ":template_dir
#import template_dir + "/PdQ/metricaDescrizione.typ":descrizione-metrica

#descrizione-metrica(
    codice:"MPC-12",
    nome:"Test Success Rate",
    descrizione-breve:[
      Rappresenta la percentuale di test automatizzati che vengono superati
    ],
    formula:[
      $
        "Test success rate"="Numero di Test superati"/ "Numero totale dei test"  
      $
      ],
    interpretazione:[
      - Valore accettabile:$>= 90 percent $
      - Valore ottimo:$100 percent$
    ],
    come-calcolo:none


)




