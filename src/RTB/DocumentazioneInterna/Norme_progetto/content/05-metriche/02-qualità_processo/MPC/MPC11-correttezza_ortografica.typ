#import "/src/config.typ":template_dir
#import template_dir + "/PdQ/metricaDescrizione.typ":descrizione-metrica
#import "/src/RTB/DocumentazioneInterna/Norme_progetto/content/05-metriche/02-qualità_processo/MPC/config/deps.typ" as deps



#let nome-metrica="Correttezza Ortografica"

#let dati=(
    codice:deps.get-MPC-code(nome-metrica),
    nome:nome-metrica,
    descrizione-breve:[
      Misura la qualità della documentazione
    ],
    formula:[
      $
        "Correttezza Ortografica"= 1000*"numero di errori ortografici"/"Numero di parole"  
      $
      ],
    interpretazione:[
      - Valore accettabile:$<= 1 $
      - Valore ottimo:$0$
    ],
    come-calcolo:none,

    accettabile: $<= 1$,
    preferibile: $=0$


)



#{dati.interpretazione=[
      - Valore accettabile:#dati.accettabile
      - Valore ottimo:#dati.preferibile
    ]
}
#descrizione-metrica(..dati)
