#import "/src/config.typ":template_dir
#import template_dir + "/PdQ/metricaDescrizione.typ":descrizione-metrica

#descrizione-metrica(
    codice:"MPD-14",
    nome:"Coefficient of couplings",
    descrizione-breve:"Misura il coupling tra le componenti del sistema",
    formula:[$ "Coefficient of coupling" = "Numero di dipendenze" / "Numero di componenti" $],
    interpretazione:[
      - Valore accettabile:$<=0.4$
      - Valore ottimo:$<= 0.2$
    ],
    //Da compilare una volta che si ha qualcosa di concreto da monitorare
    come-calcolo:none,


)
