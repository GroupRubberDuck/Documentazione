#import "../TypstTemplate/diarioTemplate.typ": slides
#import "/src/config.typ": *

#show: slides.with(
  numero: 7,
  data: "08-01-2026",
)

= Attività completate
#text(size: 19pt)[
  #set list(marker: image(check_icon, width: 0.8em))
  - Nel periodo successivo al precedente diario di bordo, il gruppo ha deciso di prendersi una breve pausa operativa per prepararsi alla sessione d’esami invernale.
  - Durante la pausa sono state svolte attività di ricerca preliminare sulle tecnologie utili allo sviluppo del prodotto, per supportare le successive attività di *Proof of Concept* (PoC).
]

= Attività da completare
#set list(marker: image(clessidra_icon, width: 0.7em))
- Predisporre lo scheletro della sezione cruscotto di valutazione.
- Ricercare e valutare i tool più adatti per il plotting e la visualizzazione dei dati. 
- Completare il documento *Norme di Progetto*. 
// - Inserire nel documento le definizioni delle metriche di qualità già elencate nel PdQ, che conterrà informazioni più dettagliate sui metodi di monitoraggio della qualità.
- Aggiornamento del *Piano di Qualifica*, includendo:
  + Le definizioni delle metriche.
  + Lo scheletro del cruscotto di valutazione.



= Difficoltà incontrate
#set list(marker: [--])
- Il gruppo ha rivalutato le scadenze delle baseline precedentemente fissate, in quanto esse erano troppo ottimistiche per la situazione attuale. (Conformandole maggiormente alla intensità di impegno dichiarata, media)
- Nessuna altra difficoltà significativa riscontrata nel periodo considerato, in quanto il gruppo ha programmato intenzionalmente una fase di pausa dalle attività operative.

= Decisioni
#set list(marker:sym.bullet.o)
- Sospensione delle attività di progetto nel periodo 2025/12/23-2026/01/05
- Allungamento del periodo di sprint per il primo sprint dopo la pausa, a causa degli esami il gruppo non è in grado di portare una adeguata quantità di incrementi al progetto nell'arco di tempo di un normale sprint. 

= Dubbi
#set list(marker: [--])
- Scelta e adeguatezza dei pattern architetturali più idonei per l’implementazione del software, in relazione ai requisiti del prodotto e all’evoluzione verso il PoC.
