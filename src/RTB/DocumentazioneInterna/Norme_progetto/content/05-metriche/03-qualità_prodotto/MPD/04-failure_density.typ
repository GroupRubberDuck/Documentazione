#import "/src/config.typ":template_dir
#import template_dir + "/PdQ/metricaDescrizione.typ":descrizione-metrica

#descrizione-metrica(
    codice:"MPD-04",
    nome:"Failure Density",
    descrizione-breve:"Numero di failure per 1000 linee di codice (KLOC)",
    formula:$ "Failure Density"="Numero di Failure" / "KLOC" $,
    interpretazione:[
      - Valore accettabile:$<=50 percent$
      - Valore ottimo:$<=20 percent$
    ],
    //Da compilare una volta che si ha qualcosa di concreto da monitorare
    come-calcolo:none


)
