#import "/src/config.typ":template_dir
#import template_dir + "/PdQ/metricaDescrizione.typ":descrizione-metrica
#import "/src/PB/DocumentazioneInterna/Norme_progetto/content/05-metriche/02-qualità_processo/MPC/config/deps.typ" as deps



#let nome-metrica="To Complete Performance Index"

#let dati=(
    codice:deps.get-MPC-code(nome-metrica),
    nome:nome-metrica,
    descrizione-breve:[
      Rappresenta l'efficienza richiesta in futuro per completare il lavoro entro il termine previsto.
    ],
    formula:[
      $"Estimate at Completion"= ("Budget at Completion" - "Earned Value") / ("Budget at Completion" - "Actual Cost" )$
      ],
    interpretazione:[
      - Valore accettabile:$tilde 1.0 $
      - Valore ottimo:$<= 1.0$
    ],
    come-calcolo:none,

  accettabile: $tilde 1.0$, 
  preferibile: $<= 1.0$,


)

#{dati.interpretazione=[
      - Valore accettabile:#dati.accettabile
      - Valore ottimo:#dati.preferibile
    ]
}
#descrizione-metrica(..dati)
