#import "/src/PB/DocumentazioneEsterna/Analisi_dei_Requisiti/content/requisiti/requisiti_obbligatori/_index.typ": table-cells as req_obbligatori
#import "/src/PB/DocumentazioneEsterna/Analisi_dei_Requisiti/content/requisiti/requisiti_desiderabili/_index.typ": table-cells as req_desiderabili
#import "/src/PB/DocumentazioneEsterna/Analisi_dei_Requisiti/content/requisiti/requisiti_opzionali/_index.typ": table-cells as req_opzionali

#import "@preview/cetz:0.5.2"
#import "@preview/cetz-plot:0.1.3": plot, chart

#let pie-chart(data, radius: 3, inner-radius: 0) = {
  // 1. Estraiamo la palette dai dati (il colore è il terzo elemento, indice 2)
  let palette = data.map(item => item.at(2))
  
  // 2. Calcoliamo il totale per formattare correttamente le percentuali
  let total = data.fold(0.0, (acc, item) => acc + item.at(1))

  align(center)[
    #cetz.canvas({
      import cetz.draw: *

      // 3. DISEGNO DEL GRAFICO
      chart.piechart(
        data,
        outset:none,
        value-key: 1,      // Il valore numerico è all'indice 1
        label-key: 0,      // Il nome è all'indice 0
        radius: radius,
        stroke:black+1pt,
        slice-style: palette,
        // Passiamo l'inner-radius solo se richiesto (per fare la ciambella)
        ..if inner-radius > 0 { (inner-radius: inner-radius) } else { (:) },
        
        // Formattazione del testo sullo spicchio
        inner-label: (content: (value, label) => {
          // Trasforma il valore grezzo in percentuale
          let perc = calc.round((value / total) * 100)
          text(fill: white, weight: "bold")[#perc%]
        }),
        
        // Nascondiamo le etichette esterne predefinite
        outer-label: (content: none) 
      )


    })
  ]
}


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
#figure(caption:"Diagramma dei requisiti obbligatori soddisfatti")[
#pie-chart((
  ("Soddisfatti", 100, rgb("#4facf7")),
))
]
#v(1em)


=== Requisiti Desiderabili
#stampa_tabella_requisiti(req_desiderabili, "Implementato")

#v(1em)
#figure(caption:"Diagramma dei requisiti desiderabili soddisfatti")[
#pie-chart((
  ("Soddisfatti", 100, rgb("#4facf7")),
), )
]
#v(1em)
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

#v(1em)
#figure(caption:"Diagramma dei requisiti opzionali soddisfatti")[
#pie-chart((
  ("Soddisfatti", 16, rgb("#4facf7")),
  ("Non Implementato", 112-16, rgb(color.red)),
), )
]
#v(1em)
