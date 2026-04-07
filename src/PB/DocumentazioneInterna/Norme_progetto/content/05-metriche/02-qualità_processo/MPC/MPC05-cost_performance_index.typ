#import "/src/config.typ":template_dir
#import template_dir + "/PdQ/metricaDescrizione.typ":descrizione-metrica
#import "/src/PB/DocumentazioneInterna/Norme_progetto/content/05-metriche/02-qualità_processo/MPC/config/deps.typ" as deps



#let nome-metrica="Cost Performance Index"

#let dati=(
    codice:deps.get-MPC-code(nome-metrica),
    nome:nome-metrica,
    descrizione-breve:[
      Rappresenta il rapporto tra il valore del lavoro completato e il costo effettivamente sostenuto.
    ],
    formula:[
      $"Cost Performance Index"= "Earned Value"/"Actual Cost"$
      ],
    interpretazione:[
      - Valore accettabile:$>= 0.9$
      - Valore ottimo:$>=1.0$
    ],
    come-calcolo:none,

  accettabile: $>= 0.9$, 
  preferibile: $>= 1.0$,
)



#{dati.interpretazione=[
      - Valore accettabile:#dati.accettabile
      - Valore ottimo:#dati.preferibile
    ]
}
#descrizione-metrica(..dati)
