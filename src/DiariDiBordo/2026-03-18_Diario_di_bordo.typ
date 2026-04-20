#import "../TypstTemplate/diarioTemplate.typ": slides
#import "/src/config.typ": *

#show: slides.with(
  numero: 11,
  data: "2026-03-18",
)

= Attività completate
#set list(marker: image(check_icon, width: 0.8em))
- Completato il POC
- Quasi completata l'analisi dei requisiti

= Attività da completare
#set list(marker: image(clessidra_icon, width: 0.7em))
- Rifinitura e aggiornamento del piano di qualifica
- Rifinitura dell'analisi dei requisiti
- Fissare un incontro con il professor Cardin

// = Difficoltà incontrate
// #set list(marker: image(danger_icon, width: 1em))
// - 


// = Dubbi
// #set list(marker: image(question_mark_icon, width: 1em))
// - Selezionare tecnologie mirate per massimizzare il valore didattico, limitandone la quantità per garantire al gruppo piena padronanza tecnica e un carico di lavoro sostenibile.
