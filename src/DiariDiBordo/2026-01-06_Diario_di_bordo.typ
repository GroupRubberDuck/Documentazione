#import "../TypstTemplate/diarioTemplate.typ": slides
#import "/src/config.typ": *

#show: slides.with(
  numero: 7,
  data: "06-01-2026",
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
- Stesura della sezione relativa ai processi primari nel documento *Norme di Progetto*, descrivendo come il gruppo implementa i processi primari selezionati. 
- Inserire nel documento le definizioni delle metriche di qualità già elencate nel PdQ, che conterrà informazioni più dettagliate sui metodi di monitoraggio della qualità.
- Aggiornamento del *Piano di Qualifica*, includendo:
  + Le definizioni delle metriche.
  + Lo scheletro del cruscotto di valutazione.



= Difficoltà incontrate
#set list(marker: [--])
- Nessuna difficoltà significativa riscontrata nel periodo considerato, in quanto il gruppo ha programmato intenzionalmente una fase di pausa dalle attività operative

= Dubbi
#set list(marker: [--])
- Scelta e adeguatezza dei pattern architetturali più idonei per l’implementazione del software, in relazione ai requisiti del prodotto e all’evoluzione verso il PoC.
