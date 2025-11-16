#import "../TypstTemplate/diarioTemplate.typ": slides
#import "/src/config.typ": *

#show: slides.with(
  numero: 3,
  data: "2025-11-17",
)

= Attività completate
  #set list(marker: image(check_icon, width: 0.8em))
  - incrementato il documento di way of working
  - studio dei documenti per l'RTB

= Attività da completare
#set list(marker: image(clessidra_icon, width: 0.7em))
- incontrare l'azienda e definire le prime attività

= Difficoltà incontrate
#set list(marker: image(danger_icon, width: 1em))
- gestione delle prossime attività

= Dubbi
#set list(marker: image(question_mark_icon, width: 1em))
- attività da completare

