#import "/src/config.typ":template_dir
#import template_dir + "/PdQ/metricaDescrizione.typ":descrizione-metrica
#import "/src/PB/DocumentazioneInterna/Norme_progetto/content/05-metriche/02-qualità_processo/MPC/config/deps.typ" as deps



#let nome-metrica="Time Efficiency"

#let dati=(
    codice:deps.get-MPC-code(nome-metrica),
    nome:nome-metrica,
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
    come-calcolo:none,


    accettabile: $>= 80 percent$,
    preferibile: $>= 100 percent$
)



#{dati.interpretazione=[
      - Valore accettabile:#dati.accettabile
      - Valore ottimo:#dati.preferibile
    ]
}
#descrizione-metrica(..dati)