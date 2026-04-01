
#import "/src/config.typ":template_dir
#import "config/deps.typ" as deps
#import template_dir + "/PdQ/metricaDescrizione.typ":descrizione-metrica
#let nome-metrica="Time To Complete Task"

#let dati=(
    codice:deps.get-MPD-code(nome-metrica),
    nome:nome-metrica,
    descrizione-breve:"Tempo medio per completare un'attività.",
    formula:$ ("Tempo Ottimista" + 4 * "Tempo Probabile" + "Tempo Pessimista") / 6  $,
    interpretazione:[
      - Valore accettabile:5 minuti
      - Valore ottimo:TODO
    ],
    //Da compilare una volta che si ha qualcosa di concreto da monitorare
    come-calcolo:none,

        accettabile: "10 minuti",
    preferibile: "5 minuti"


)


#{dati.interpretazione=[
      - Valore accettabile:#dati.accettabile
      - Valore ottimo:#dati.preferibile
    ]
}
#descrizione-metrica(..dati)