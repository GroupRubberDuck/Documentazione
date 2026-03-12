
#import "/src/config.typ":template_dir
#import template_dir + "/PdQ/metricaDescrizione.typ":descrizione-metrica

#descrizione-metrica(
    codice:"MPC-13",
    nome:"Code Coverage",
    descrizione-breve:[
      Rappresenta la percentuale di codice coperto da test automatizzati
    ],
    formula:[
      $
        "Code Coverage"="Linee di codice testate"/ "Linee di codice totali"  
      $
      ],
    interpretazione:[
      - Valore accettabile:$>= 80 percent $
      - Valore ottimo:$>=90 percent$
    ],
    come-calcolo:none


)




