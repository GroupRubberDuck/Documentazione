
#import "/src/config.typ":template_dir
#import template_dir + "/PdQ/metricaDescrizione.typ":descrizione-metrica

#descrizione-metrica(
    codice:"MPC-11",
    nome:"Correttezza Ortografica",
    descrizione-breve:[
      Misura la qualità della documentazione
    ],
    formula:[
      $
        "Correttezza Ortografica"= 1000*"numero di errori ortografici"/"Numero di parole"  
      $
      ],
    interpretazione:[
      - Valore accettabile:$<= 0.01 $
      - Valore ottimo:$0$
    ],
    come-calcolo:none


)




