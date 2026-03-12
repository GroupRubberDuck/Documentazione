
#import "/src/config.typ":template_dir
#import template_dir + "/PdQ/metricaDescrizione.typ":descrizione-metrica

#descrizione-metrica(
    codice:"MPC-14",
    nome:"Time Efficiency",
    descrizione-breve:[
      Rappresenta il rapporto tra le ore produttive e le ore totali utilizzate
    ],
    formula:[
      $
        "Time efficiency"="Ore produttive"/ "Ore totali"
      $
      ],
    interpretazione:[
      - Valore accettabile:$>= 80 percent $
      - Valore ottimo:$>=100 percent$
    ],
    come-calcolo:none


)




