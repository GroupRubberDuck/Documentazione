
#import "/src/config.typ":template_dir
#import "config/deps.typ" as deps
#import template_dir + "/PdQ/metricaDescrizione.typ":descrizione-metrica

#let nome-metrica="Requisiti opzionali soddisfatti"

#let dati=(
    codice:deps.get-MPD-code(nome-metrica),
    nome:nome-metrica,
    descrizione-breve:"Rappresenta la percentuale di requisiti opzionali soddisfatti. \n "+upper("è")+" utile a monitorare il grado di soddisfacimento dei requisiti opzionali.",
    formula:$ "ROpzS"="Numero di requisiti opzionali soddisfatti" / "Numero di requisiti opzionali" $,
    accettabile: $>= 0 percent$,
    preferibile: $>= 50 percent$,
    interpretazione:[
      - Valore accettabile:$>=50 percent$
      - Valore ottimo:$>=75 percent$
    ],
    come-calcolo:none


)

#{dati.interpretazione=[
      - Valore accettabile:#dati.accettabile
      - Valore ottimo:#dati.preferibile
    ]
}
#descrizione-metrica(..dati)