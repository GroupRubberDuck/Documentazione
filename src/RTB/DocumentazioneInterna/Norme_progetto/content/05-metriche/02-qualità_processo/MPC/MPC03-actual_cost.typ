#import "/src/config.typ":template_dir
#import template_dir + "/PdQ/metricaDescrizione.typ":descrizione-metrica
#import "/src/RTB/DocumentazioneInterna/Norme_progetto/content/05-metriche/02-qualità_processo/MPC/config/deps.typ" as deps



#let nome-metrica="Actual Cost"

#let dati=(
    codice:deps.get-MPC-code(nome-metrica),
    nome:nome-metrica,
    descrizione-breve:"Rappresenta il costo effettivo sostenuto.
Risulta utile nel verificare che il lavoro svolto sia in linea con le aspettative.",
    formula:[$
  "AC"= "Costo sostenuto nello sprint"
$

],
    interpretazione:[
      - Valore accettabile:$0<= "AC" <= 1.2*"EV"$
      - Valore ottimo:$<= "EV"$
    ],
    come-calcolo:none,

      accettabile: $0<= "AC" <= 1.2*"EV" $, 
  preferibile: "<= EV"


)



#{dati.interpretazione=[
      - Valore accettabile:#dati.accettabile
      - Valore ottimo:#dati.preferibile
    ]
}
#descrizione-metrica(..dati)
