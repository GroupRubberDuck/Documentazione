
#import "/src/config.typ":template_dir
#import "config/deps.typ" as deps
#import template_dir + "/PdQ/metricaDescrizione.typ":descrizione-metrica

#let nome-metrica="Requisiti obbligatori soddisfatti"

#let dati=(
    codice:deps.get-MPD-code(nome-metrica),
    nome:nome-metrica,
    descrizione-breve:"Rappresenta la percentuale di requisiti obbligatori soddisfatti. \n "+upper("è")+" utile a monitorare il grado di soddisfacimento dei requisiti essenziali.",
    formula:$ "RObbS"="Numero di requisiti obbligatori soddisfatti" / "Numero di requisiti obbligatori" $,

    accettabile:$100 percent$,
    preferibile: $100 percent$,
    
    interpretazione:none,
    come-calcolo:none


)

#{dati.interpretazione=[
      - Valore accettabile:#dati.accettabile
      - Valore ottimo:#dati.preferibile
    ]
}
#descrizione-metrica(..dati)