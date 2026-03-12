
#import "/src/config.typ":template_dir

#import template_dir + "/PdQ/metricaDescrizione.typ":descrizione-metrica

#descrizione-metrica(
    codice:"MPD-01",
    nome:"Requisiti obbligatori soddisfatti",
    descrizione-breve:"Rappresenta la percentuale di requisiti obbligatori soddisfatti. \n "+upper("è")+" utile a monitorare il grado di soddisfacimento dei requisiti essenziali.",
    formula:$ "RObbS"="Numero di requisiti obbligatori soddisfatti" / "Numero di requisiti obbligatori" $,
    interpretazione:[
      - Valore accettabile:100%
      - Valore ottimo:100%
    ],
    come-calcolo:none


)
