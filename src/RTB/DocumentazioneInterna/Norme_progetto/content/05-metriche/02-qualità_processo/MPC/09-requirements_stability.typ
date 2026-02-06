
#import "/src/config.typ":template_dir
#import template_dir + "/PdQ/metricaDescrizione.typ":descrizione-metrica

#descrizione-metrica(
    codice:"MPC-09",
    nome:"Requirements Stability",
    descrizione-breve:[
      Misura i cambiamenti apportati ai requisiti nel tempo.
    ],
    formula:[
      $"Requirements Stability Index "="Numero Requisiti Iniziali"- ("Numero di cambiamenti"+ "Numero di requisiti cancellati"+ "Numero di requisiti aggiunti") / "Numero Requisiti Iniziali" $
      ],
    interpretazione:[
      - Valore accettabile:$>= 0.7 $
      - Valore ottimo:$1.0$
    ],
    come-calcolo:none


)




