#import "/src/config.typ":template_dir
#import template_dir + "/PdQ/metricaDescrizione.typ":descrizione-metrica
#import "config/deps.typ" as deps



#let nome-metrica="Code Coverage"

#let dati=(
    codice:deps.get-MPD-code(nome-metrica),
    nome:nome-metrica,
    descrizione-breve:[
      Rappresenta la percentuale di codice coperto da test automatizzati
    ],
    formula:[
      $
        "Code Coverage"="Linee di codice testate"/ "Linee di codice totali"  
      $
      ],
    interpretazione:[
      - Valore accettabile:$>= 80 percent $
      - Valore ottimo:$>=90 percent$
    ],
    come-calcolo:none,
    accettabile: $>= 80 percent$,
    preferibile: $>= 90 percent$


)


#{dati.interpretazione=[
      - Valore accettabile:#dati.accettabile
      - Valore ottimo:#dati.preferibile
    ]
}
#descrizione-metrica(..dati)

