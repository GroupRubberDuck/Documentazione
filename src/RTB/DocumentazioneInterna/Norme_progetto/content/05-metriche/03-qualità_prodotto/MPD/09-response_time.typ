#import "/src/config.typ":template_dir
#import template_dir + "/PdQ/metricaDescrizione.typ":descrizione-metrica

#descrizione-metrica(
    codice:"MPD-09",
    nome:"Response Time",
    descrizione-breve:"Misura il tempo medio impiegato da l prodotto per rispondere a una richiesta",
    formula:none,
    interpretazione:[
      - Valore accettabile:$<=3 "secondi"$
      - Valore ottimo:$<= 1 "secondo"$
    ],
    //Da compilare una volta che si ha qualcosa di concreto da monitorare
    come-calcolo:none


)
