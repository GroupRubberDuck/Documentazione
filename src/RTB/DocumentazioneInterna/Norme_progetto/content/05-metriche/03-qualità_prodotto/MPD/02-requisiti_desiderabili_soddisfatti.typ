
#import "/src/config.typ":template_dir

#import template_dir + "/PdQ/metricaDescrizione.typ":descrizione-metrica

#descrizione-metrica(
    codice:"MPD-02",
    nome:"Requisiti Desiderabili soddisfatti",
    descrizione-breve:"Rappresenta la percentuale di requisiti Desiderabili soddisfatti. \n "+upper("è")+
    " utile a monitorare il grado di soddisfacimento dei requisiti desiderabili.",
    formula:$ "RDesS"="Numero di requisiti desiderabili soddisfatti" / "Numero di requisiti desiderabili" $,
    interpretazione:[
      - Valore accettabile:$>=50 percent $
      - Valore ottimo:$>=75 percent$
    ],
    come-calcolo:none


)
