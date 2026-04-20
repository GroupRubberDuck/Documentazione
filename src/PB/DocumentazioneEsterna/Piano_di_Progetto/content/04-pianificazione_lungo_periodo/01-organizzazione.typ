#import "/src/config.typ": template_dir
#import template_dir + "/utilityTable.typ": utilityTable



=== Ruoli
#align(center)[
  #{
    show table.cell: set text(size: 11pt)
    table(
      columns: 3,
      align: horizon,
      table.header([*Ruolo*], [*Compiti*], [*Presenza*]),

      [Responsabile],
      "- Coordinamento piani e scadenze\n- Approvazione release\n- Comunicazione col committente\n- Uso efficiente delle risorse\n- Redazione di alcuni documenti",
      [Tutto il progetto],

      [Amministratore],
      "- Garanzia efficienza strumenti\n- Gestione tecnologie di supporto\n- Verifica procedure secondo norme",
      [Tutto il progetto],

      [Verificatore],
      "- Testing e validazione\n- Controllo qualità deliverable\n- Conformità ai requisiti",
      [Tutto il progetto],

      [Analista],
      "- Analisi dei requisiti\n- Definizione bisogni del sistema\n- Redazione specifiche funzionali",
      [Predominante nel periodo di RTB, supporto alla gestione dei cambiamenti nel periodo di PB.],

      [Progettista],
      "- Progetta architettura sistema\n- Design e modellazione\n- Traduzione requisiti in struttura tecnica",
      [Post-consolidamento della Baseline dei Requisiti],

      [Programmatore], "- Codifica software\n- Implementazione design\n- Sviluppo funzionalità", [Post-consolidamento della Progettazione di Dettaglio],
    )
  }]

=== Preventivo <Preventivo>
Il gruppo di lavoro prevede di completare il progetto entro e non oltre il *15 maggio 2026*, nel rispetto di un  *budget complessivo pari a 11610€*.

Il dettaglio della pianificazione e del budget stimato è consultabile nel documento di candidatura disponibile al seguente link:
#link("https://grouprubberduck.github.io/Documentazione/output/Candidatura/Dichiarazione_Impegni-v2.0.0.pdf")[Dichiarazione degli Impegni – versione 2.0.0].

Di seguito viene riportata la *tabella riepilogativa dei costi*, già inclusa nella *Dichiarazione degli Impegni*. La tabella rappresenta la stima economica elaborata durante il periodo di candidatura e costituisce il riferimento principale per la pianificazione, il monitoraggio e il controllo dei costi lungo l'intero ciclo di vita del progetto.
#let ruoli = (
  (nome: "Responsabile", costo: 30, oreIndividuali: 11),
  (nome: "Amministratore", costo: 20, oreIndividuali: 9),
  (nome: "Analista", costo: 25, oreIndividuali: 19),
  (nome: "Progettista", costo: 25, oreIndividuali: 17),
  (nome: "Programmatore", costo: 15, oreIndividuali: 17),
  (nome: "Verificatore", costo: 15, oreIndividuali: 18),
)
#let acc = (nome: "Totali", oreIndividualiTotali: 0, oreTotali: 0, placeholder: "", costoTot: 0)


#let analisiImpegni = ()

#for ruolo in ruoli {
  let oreTot = ruolo.at("oreIndividuali") * 6
  analisiImpegni.push((
    ruolo.at("nome"),
    str(ruolo.at("oreIndividuali")),
    str(oreTot),
    str(ruolo.at("costo")),
    str(ruolo.at("costo") * oreTot),
  ))

  acc.at("oreIndividualiTotali") += ruolo.at("oreIndividuali")
  acc.at("oreTotali") += oreTot
  acc.at("costoTot") += ruolo.at("costo") * oreTot
}

#analisiImpegni.push((
  acc.at("nome"),
  str(acc.at("oreIndividualiTotali")),
  str(acc.at("oreTotali")),
  acc.at("placeholder"),
  str(acc.at("costoTot")),
))
#set table(
  stroke: (_, y) => if y == 7 { (top: 1.5pt) },
  // gutter: 0.2em,
  fill: (x, y) => if x == 0 or y == 0 { white },
)


#figure(
  caption: [Ripartizione oraria e dettaglio dei costi],
  kind: "Tabella",
  supplement: [Tabella],
)[
  #utilityTable(
    header: ("Ruolo", "Ore individuali", "Ore Totali", "Costo (€/h)", "Costo totale (€)"),
    columns: (1fr,) * 5,
    analisiImpegni,
  )
]<tabella-ore>
