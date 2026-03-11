#import "../TypstTemplate/diarioTemplate.typ": slides
#import "/src/config.typ": *

#show: slides.with(
  numero: 10,
  data: "2026-03-11",
)


= Attività completate
#set list(marker: image(check_icon, width: 0.8em))
- Avanzamento dello sviluppo del Proof of Concept:
  - Studio e analisi delle tecnologie necessarie per il frontend e il backend.
  - Valutazione comparativa tra database relazionali (SQLite) e non relazionali (MongoDB) per l'ottimizzazione della gestione dei dati
  - Configurazione dell'ambiente di lavoro e implementazione delle prime interfacce di test
- Stesura e completamento generale dell'analisi dei casi d'uso
- Verifica, aggiornamento e raffinamento della documentazione di progetto

= Attività da completare
#set list(marker: image(clessidra_icon, width: 0.7em))
- Integrazione del database e finalizzazione delle funzionalità del PoC
- Aggiornamento dei grafici all'interno del Piano di Qualifica

= Difficoltà incontrate
#set list(marker: image(danger_icon, width: 1em))
- Complessità tecnica nella valutazione e scelta del paradigma di database più adatto per gestire le strutture dati nidificate
- Incongruenze e necessità di ribilanciamento nel conteggio del monte ore per i vari ruoli
