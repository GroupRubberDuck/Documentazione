#import "/src/config.typ":template_dir
#import template_dir + "/PdQ/metricaDescrizione.typ":descrizione-metrica
#import "/src/RTB/DocumentazioneInterna/Norme_progetto/content/05-metriche/02-qualità_processo/MPC/config/deps.typ" as deps



#let nome-metrica="Test Success Rate"

#let dati=(
    codice:deps.get-MPC-code(nome-metrica),
    nome:nome-metrica,
    descrizione-breve:[
      Rappresenta la percentuale di test automatizzati che vengono superati
    ],
    formula:[
      $
        "Test success rate"="Numero di Test superati"/ "Numero totale dei test"  
      $
      ],
    interpretazione:[
      - Valore accettabile:$>= 90 percent $
      - Valore ottimo:$100 percent$
    ],
    come-calcolo:none,

    accettabile: $>= 90 percent$,
    preferibile: $100 percent$


)


#{dati.interpretazione=[
      - Valore accettabile:#dati.accettabile
      - Valore ottimo:#dati.preferibile
    ]
}
#descrizione-metrica(..dati)

