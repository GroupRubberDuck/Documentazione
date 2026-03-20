#import "/src/config.typ":template_dir
#import template_dir + "/PdQ/metricaDescrizione.typ":descrizione-metrica

#descrizione-metrica(
    codice:"MPD-06",
    nome:"Branch Coverage",
    descrizione-breve:"Percentuale di rami di codice coperte da test automatizzati",
    formula:$ "Branch coverage"="Numero di Branch coperti da test" / "Numero di Branch totali" $,
    interpretazione:[
      - Valore accettabile:$>=70 percent$
      - Valore ottimo:$>=90 percent$
    ],
    //Da compilare una volta che si ha qualcosa di concreto da monitorare
    come-calcolo:none


)
