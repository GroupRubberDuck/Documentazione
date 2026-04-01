
#import "config/deps.typ" as deps:descrizione-metrica,

#descrizione-metrica(
    codice:,
    nome:"Requisiti obbligatori soddisfatti",
    descrizione-breve:"Rappresenta la percentuale di requisiti obbligatori soddisfatti. \n "+upper("è")+" utile a monitorare il grado di soddisfacimento dei requisiti essenziali.",
    formula:$ "RObbS"="Numero di requisiti obbligatori soddisfatti" / "Numero di requisiti obbligatori" $,
    interpretazione:[
      - Valore accettabile:100%
      - Valore ottimo:100%
    ],
    come-calcolo:none


)
