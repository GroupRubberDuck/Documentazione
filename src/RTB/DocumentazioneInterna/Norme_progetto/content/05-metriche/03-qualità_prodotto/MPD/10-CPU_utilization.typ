#import "/src/config.typ":template_dir
#import template_dir + "/PdQ/metricaDescrizione.typ":descrizione-metrica

#descrizione-metrica(
    codice:"MPD-10",
    nome:"CPU Utilization",
    descrizione-breve:"Misura l'utilizzo di CPU lato client",
    formula:none,
    interpretazione:[
      - Valore accettabile:$<=35 percent$
      - Valore ottimo:$<= 20 percent$
    ],
    //Da compilare una volta che si ha qualcosa di concreto da monitorare
    come-calcolo:[
      Le percentuali fanno riferimento ai seguenti processori:
      - Intel Core Ultra 5
      - AMD Ryzen 5 5500
    ]


)
