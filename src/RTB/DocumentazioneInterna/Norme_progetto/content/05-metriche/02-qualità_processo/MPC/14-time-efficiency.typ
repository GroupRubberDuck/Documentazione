#import "/src/config.typ":template_dir
#import template_dir + "/PdQ/metricaDescrizione.typ":descrizione-metrica

#descrizione-metrica(
    codice:"MPC-14",
    nome:"Time Efficiency",
    descrizione-breve:[
      Rappresenta il rapporto tra le ore previste e le ore effettivamente impiegate, misurato in modo cumulativo sprint per sprint. Un valore inferiore a 1 indica che il team ha impiegato più ore del pianificato.
    ],
    formula:[
      $
        "Time Efficiency" = "Ore previste cumulative" / "Ore effettive cumulative"
      $
    ],
    interpretazione:[
      - Valore accettabile: $>= 80 percent$
      - Valore ottimo: $>= 100 percent$
    ],
    come-calcolo:none
)