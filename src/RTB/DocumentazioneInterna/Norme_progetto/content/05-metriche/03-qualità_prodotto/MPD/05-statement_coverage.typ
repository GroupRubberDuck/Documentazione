#import "/src/config.typ":template_dir
#import template_dir + "/PdQ/metricaDescrizione.typ":descrizione-metrica

#descrizione-metrica(
    codice:"MPD-05",
    nome:"Statement Coverage",
    descrizione-breve:"Percentuale di istruzioni del codice coperte da test automatizzati",
    formula:$ "Statement Coverage"="Istruzioni Testate" / "Istruzioni Totali" $,
    interpretazione:[
      - Valore accettabile:$>=80 percent$
      - Valore ottimo:$>=95 percent$
    ],
    //Da compilare una volta che si ha qualcosa di concreto da monitorare
    come-calcolo:none


)
