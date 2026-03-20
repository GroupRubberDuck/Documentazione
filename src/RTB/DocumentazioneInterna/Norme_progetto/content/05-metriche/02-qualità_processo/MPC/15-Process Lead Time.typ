#import "/src/config.typ":template_dir
#import template_dir + "/PdQ/metricaDescrizione.typ":descrizione-metrica

#descrizione-metrica(
    codice:"MPC-15",
    nome:"Process Lead Time (TimeEAC)",
    descrizione-breve:[
      Stima la durata finale del progetto in settimane, basandosi sulla velocità reale del team misurata tramite lo Schedule Performance Index.
    ],
    formula:[
      $
        "TimeEAC" = "Settimane Pianificate" / "SPI"
      $
    ],
    interpretazione:[
      - Valore accettabile: $<= "Settimane Pianificate" * 1.1$
      - Valore ottimo: $<= "Settimane Pianificate"$
    ],
    come-calcolo:none
)