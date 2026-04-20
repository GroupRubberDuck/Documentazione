#import "/src/config.typ":template_dir
#import template_dir + "/PdQ/metricaDescrizione.typ":descrizione-metrica
#import "/src/PB/DocumentazioneInterna/Norme_progetto/content/05-metriche/02-qualità_processo/MPC/config/deps.typ" as deps



#let nome-metrica="Estimate at Completion"

#let dati=(
    codice:deps.get-MPC-code(nome-metrica),
    nome:nome-metrica,
    descrizione-breve:[
      Rappresenta il costo da sostenere per il completamento delle attività sulla base della performance attuali.
    ],
    formula:[
      $"Estimate at Completion"= "Budget at completion" / " Cost Performance Index"$
      ],
    interpretazione:[
      - Valore accettabile:$<= 1.1 * "BAC" $
      - Valore ottimo:$<= "BAC"$
    ],
    come-calcolo:none,


   accettabile: $<= 1.1*"BAC"$, 
   preferibile: $<= "BAC"$


)

#{dati.interpretazione=[
      - Valore accettabile:#dati.accettabile
      - Valore ottimo:#dati.preferibile
    ]
}
#descrizione-metrica(..dati)
