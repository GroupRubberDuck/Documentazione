
#import "/src/config.typ":template_dir
#import "config/deps.typ" as deps
#import template_dir + "/PdQ/metricaDescrizione.typ":descrizione-metrica



#let nome-metrica="Requisiti Desiderabili soddisfatti"

#let dati=(
    codice:deps.get-MPD-code(nome-metrica),
    nome:nome-metrica,
    descrizione-breve:"Rappresenta la percentuale di requisiti desiderabili soddisfatti. \n "+upper("è")+
    " utile a monitorare il grado di soddisfacimento dei requisiti desiderabili.",
    formula:$ "RDesS"="Numero di requisiti desiderabili soddisfatti" / "Numero di requisiti desiderabili" $,
    accettabile: $>= 50 percent$,
    preferibile: $>= 75 percent$,
    interpretazione:[
      - Valore accettabile:$>=50 percent $
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