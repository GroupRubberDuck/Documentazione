#import "/src/config.typ":template_dir
#import template_dir + "/PdQ/metricaDescrizione.typ":descrizione-metrica

#descrizione-metrica(
    codice:"MPD-07",
    nome:"User Error Rate",
    descrizione-breve:"Misura quanto spesso un utente fa errori durante l'uso del prodotto",
    formula:$ "User error rate"="Errori Totali" / "Azioni Totali" $,
    interpretazione:[
      - Valore accettabile:$<=3 percent$
      - Valore ottimo:$<= 1 percent$
    ],
    //Da compilare una volta che si ha qualcosa di concreto da monitorare
    come-calcolo:none


)
