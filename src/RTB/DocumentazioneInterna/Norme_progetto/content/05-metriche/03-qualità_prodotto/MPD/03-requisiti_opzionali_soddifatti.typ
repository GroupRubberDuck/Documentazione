
#import "/src/config.typ":template_dir

#import template_dir + "/PdQ/metricaDescrizione.typ":descrizione-metrica

#descrizione-metrica(
    codice:"MPD-03",
    nome:"Requisiti opzionali soddisfatti",
    descrizione-breve:"Rappresenta la percentuale di requisiti opzionali soddisfatti. \n "+upper("è")+" utile a monitorare il grado di soddisfacimento dei requisiti opzionali.",
    formula:$ "ROpzS"="Numero di requisiti opzionali soddisfatti" / "Numero di requisiti opzionali" $,
    interpretazione:[
      - Valore accettabile:$>=0 percent$
      - Valore ottimo:$>=50 percent$
    ],
    come-calcolo:none


)
