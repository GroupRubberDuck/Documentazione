#import "/src/config.typ":template_dir
#import template_dir + "/PdQ/metricaDescrizione.typ":descrizione-metrica
#import "/src/PB/DocumentazioneInterna/Norme_progetto/content/05-metriche/02-qualità_processo/MPC/config/deps.typ" as deps



#let nome-metrica="Process Lead Time"

#let dati=(
    codice:deps.get-MPC-code(nome-metrica),
    nome:nome-metrica,
    descrizione-breve:[
      Stima la durata finale del progetto in settimane, basandosi sulla velocità reale del team misurata tramite lo Schedule Performance Index.
    ],
    formula:[
      $
        "TimeEAC" = "Settimane Pianificate" / "SPI"
      $
    ],
    interpretazione:[
      - Valore accettabile: $<= "Settimane Pianificate" * 1.1$
      - Valore ottimo: $<= "Settimane Pianificate"$
    ],
    come-calcolo:none,



     accettabile: $>= 90 percent$,
     preferibile: $=100 percent$
)





#{dati.interpretazione=[
      - Valore accettabile:#dati.accettabile
      - Valore ottimo:#dati.preferibile
    ]
}
#descrizione-metrica(..dati)