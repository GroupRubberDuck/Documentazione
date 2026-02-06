
#import "/src/config.typ":template_dir
#import template_dir + "/PdQ/metricaDescrizione.typ":descrizione-metrica

#descrizione-metrica(
    codice:"MPC-14",
    nome:"Task Completion on Time",
    descrizione-breve:[
      Misura quanto spesso vi sono ritardi nel completamento di un task.
    ],
    formula:[
      $
        "Task Completion on Time"="Task completati entro la loro scadenza"/ "Task totali"
      $
      ],
    interpretazione:[
      - Valore accettabile:$>= 90 percent $
      - Valore ottimo:$=100 percent$
    ],
    come-calcolo:none


)




