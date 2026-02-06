#import "/src/config.typ":template_dir
#import template_dir + "/PdQ/metricaDescrizione.typ":descrizione-metrica

#descrizione-metrica(
    codice:"MPD-11",
    nome:"Memory Utilization",
    descrizione-breve:"Misura l'utilizzo di memoria RAM lato client",
    formula:none,
    interpretazione:[
      - Valore accettabile:$<=4 "GB"$
      - Valore ottimo:$<= 1,5 "GB" $
    ],
    //Da compilare una volta che si ha qualcosa di concreto da monitorare
    come-calcolo:none,

)
