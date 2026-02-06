
#import "/src/config.typ":template_dir
#import template_dir + "/PdQ/metricaDescrizione.typ":descrizione-metrica

#descrizione-metrica(
    codice:"MPC-03",
    nome:"Actual Cost",
    descrizione-breve:"Rappresenta il costo effettivo sostenuto.
    Risulta utile nel verificare che il lavoro svolto sia in linea con le aspettativa",
    formula:[$
  "AC"= "Costo sostenuto nello sprint"
$

],
    interpretazione:[
      - Valore accettabile:$0<= "AC" <= 1,2*"EV"$
      - Valore ottimo:$<= "EV"$
    ],
    come-calcolo:none


)




