#import "/src/config.typ":template_dir
#import template_dir + "/PdQ/metricaDescrizione.typ":descrizione-metrica
#import "/src/PB/DocumentazioneInterna/Norme_progetto/content/05-metriche/02-qualità_processo/MPC/config/deps.typ" as deps



#let nome-metrica="Estimate To Complete"

#let dati=(
    codice:deps.get-MPC-code(nome-metrica),
    nome:nome-metrica,
    descrizione-breve:[
      Rappresenta il costo ancora da sostenere per il completamento delle attività
    ],
    formula:[
      $"Estimate To Complete"="Estimate at Completion"- "Actual Cost" $
      ],
    interpretazione:[
      - Valore accettabile:$<= ("Budget at Completion"-" Actual Cost")*1.1 $
      - Valore ottimo:$<= "Budget at Completion"-" Actual Cost"$
    ],
    come-calcolo:none,


  accettabile: $<= ("BAC"-"AC")*1.1$, 
  preferibile: $<= "BAC"-"AC"$


)



#{dati.interpretazione=[
      - Valore accettabile:#dati.accettabile
      - Valore ottimo:#dati.preferibile
    ]
}
#descrizione-metrica(..dati)