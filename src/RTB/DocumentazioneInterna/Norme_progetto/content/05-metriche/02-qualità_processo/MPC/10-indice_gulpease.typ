
#import "/src/config.typ":template_dir
#import template_dir + "/PdQ/metricaDescrizione.typ":descrizione-metrica

#descrizione-metrica(
    codice:"MPC-10",
    nome:"Indice di Gulpease",
    descrizione-breve:[
      
L'indice di gulpease misura la leggibilità di un testo.

Valuta il grado di istruzione necessario alla comprensione del contenuto.
    ],
    formula:[
      $
  "IG"= 89 + (300*("numero di frasi") - 10*("numero di lettere"))/ "numero di parole" 
      $ 
      ],
    interpretazione:[
      - Valore accettabile:$>= 60 $
      - Valore ottimo:$70$

        - Inferiore a 80 sono difficili da leggere per chi ha la licenza elementare;
        - Inferiore a 60 sono difficili da leggere per chi ha la licenza media;
        - Inferiore a 40 sono difficili da leggere per chi ha un diploma superiore.
    ],
    come-calcolo:[
      Per il calcolo il gruppo ha sviluppato una propria automazione sfruttando le funzionalità di Typst.
      Questo permette una forte integrazione e analisi di dettaglio più fine.

      ]


)




