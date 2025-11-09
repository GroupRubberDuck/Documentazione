#import "../TypstTemplate/diarioTemplate.typ": slides
#import "/src/config.typ": *

#show: slides.with(
  numero: 2,
  data: "2025-11-10",
)

= Attività completate
#text(size: 19pt)[
  #set list(marker: image(check_icon, width: 0.8em))
  - Aggiudiczazione dell'appalto
  - Separata area di rilacio e area di lavoro
  - Definita una prima versione del workflow per la stesura dei documenti
  - Deciso di usare google sheets per tracciare le ore di lavoro
  - Stabiliti dei criteri di rotazione
  - messa per iscritto una bozza del documento di way of working
]

= Attività da completare
#set list(marker: image(clessidra_icon, width: 0.7em))
- Aggiornamento del sito web e relativo script per modificare l'ordinamento
- Stabilire le milestone (partendo dalla fine)
- Identificare le attività necessarie a raggiungere le milestone
- Stabilire la struttura dei nuovi documenti
- Aggiornare il way of working


= Difficoltà incontrate
#set list(marker: image(danger_icon, width: 1em))
- Cambio di candidatura
- Gestione dei ruoli e ore produttive

= Dubbi
#set list(marker: image(question_mark_icon, width: 1em))
- Identificare le prossime attività
