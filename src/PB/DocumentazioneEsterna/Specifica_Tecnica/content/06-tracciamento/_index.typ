#import "/src/PB/DocumentazioneEsterna/Analisi_dei_Requisiti/content/requisiti/requisiti_obbligatori/_index.typ": table-cells as req_obbligatori
#import "/src/PB/DocumentazioneEsterna/Analisi_dei_Requisiti/content/requisiti/requisiti_desiderabili/_index.typ": table-cells as req_desiderabili
#import "/src/PB/DocumentazioneEsterna/Analisi_dei_Requisiti/content/requisiti/requisiti_opzionali/_index.typ": table-cells as req_opzionali

#let stampa_tabella_requisiti(dati_grezzi, stato_impostato, implementati: ()) = {
  
  let dati_piatti = dati_grezzi.map(it => {
    
    // IL TRUCCO DEFINITIVO:
    // repr() converte forzatamente qualsiasi nodo (anche invisibile) in stringa.
    // Es. un [ROpz-001] diventerà la stringa "[sequence(\"ROpz-001\")]".
    let str_codice = repr(it.codice)

    // Usiamo .any() per controllare se almeno un ID tra quelli da te elencati
    // è contenuto come sottostringa nel codice appena serializzato.
    let stato_finale = if implementati.any(id => id in str_codice) {
      "Implementato"
    } else {
      stato_impostato
    }
    
    (
      it.codice, // Manteniamo la formattazione originale nella tabella
      it.descrizione,
      stato_finale
    )
  }).flatten()

  table(
    columns: (auto, 1fr, auto),
    align: (center + horizon, left + horizon, center + horizon),
    fill: (x, y) => if y == 0 { luma(230) } else { none },
    stroke: 0.5pt + luma(150),
    [*Codice*], [*Descrizione*], [*Stato*],
    
    ..dati_piatti
  )
}

== Tracciamento dei Requisiti

=== Requisiti Obbligatori
#stampa_tabella_requisiti(req_obbligatori, "Implementato")

#v(1em)

=== Requisiti Desiderabili
#stampa_tabella_requisiti(req_desiderabili, "Implementato")

#v(1em)

=== Requisiti Opzionali
#stampa_tabella_requisiti(
  req_opzionali, 
  "Non implementato", 
  implementati: (
    "ROpz-001",
    "ROpz-002",
    "ROpz-003",
    "ROpz-004",
    "ROpz-005",
    "ROpz-006",
    "ROpz-007",
    "ROpz-008",
    "ROpz-009",
    "ROpz-010",
    "ROpz-011",
    "ROpz-012",
    "ROpz-013",
    "ROpz-014",
    "ROpz-015",
    "ROpz-016",
  ) 
)