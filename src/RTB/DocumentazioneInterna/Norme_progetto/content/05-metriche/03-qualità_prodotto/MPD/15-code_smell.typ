#import "/src/config.typ":template_dir
#import template_dir + "/PdQ/metricaDescrizione.typ":descrizione-metrica

#descrizione-metrica(
    codice:"MPD-15",
    nome:"Code Smell",
    descrizione-breve:"Misura il rapporto tra codice smell e KLOC",
    formula:[
      $"Code smell"="Linee di codice smell" / "KLOC"$
    ],
    interpretazione:[
      - Valore accettabile:$<=10$
      - Valore ottimo:$<= 5$
    ],
    //Da compilare una volta che si ha qualcosa di concreto da monitorare
    come-calcolo:none


)
