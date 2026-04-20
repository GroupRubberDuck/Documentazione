#import "/src/config.typ":template_dir
#import template_dir + "/PdQ/metricaDescrizione.typ":descrizione-metrica
#import "/src/PB/DocumentazioneInterna/Norme_progetto/content/05-metriche/02-qualità_processo/MPC/config/deps.typ" as deps



#let nome-metrica="Requirements Stability index"

#let dati=(
    codice:deps.get-MPC-code(nome-metrica),
    nome:nome-metrica,
    descrizione-breve:[
      Misura i cambiamenti apportati ai requisiti nel tempo.
    ],
    formula:[
      $"Requirements Stability Index " =  ("NRI"- ("NC"+ "NRC"+ "NRA") ) / "NRI" $ \
      \ Legenda:
      - Numero Requisiti Iniziali = NRI.
      - Numero di Cambiamenti = NC. 
      - Numero di Requisiti Cancellati = NRC. 
      - Numero di Requisiti Aggiunti = NRA.
      ],
    interpretazione:[
      - Valore accettabile:$>= 0.7 $
      - Valore ottimo:$1.0$
    ],
    come-calcolo:none,

    accettabile: $>= 0.7$,
    preferibile: $1.0$


)



#{dati.interpretazione=[
      - Valore accettabile:#dati.accettabile
      - Valore ottimo:#dati.preferibile
    ]
}
#descrizione-metrica(..dati)