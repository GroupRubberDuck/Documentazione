#import "/src/config.typ":template_dir
#import template_dir + "/PdQ/metricaDescrizione.typ":descrizione-metrica

#descrizione-metrica(
    codice:"MPD-08",
    nome:"Time To Complete Task",
    descrizione-breve:"Tempo medio per completare un'attività",
    formula:$ ("Tempo Ottimista" + 4 * "Tempo Probabile" + "Tempo Pessimista") / 6  $,
    interpretazione:[
      - Valore accettabile:TODO
      - Valore ottimo:TODO
    ],
    //Da compilare una volta che si ha qualcosa di concreto da monitorare
    come-calcolo:none


)
