#import "/src/config.typ": template_dir
#import template_dir + "/PdP/tabellaAtt.typ": tabellaAtt

Di seguito vengono riportati i documenti richiesti per questa fase.
Ogni documento è suddiviso nelle sezioni che lo compongono, con l'indicazione degli sprint a cui sono associati. Questo approccio permette di avere una *visione d'insieme delle attività*, stimare il lavoro complessivo e suddividerlo successivamente in singoli sprint, seguendo le *buone pratiche dello sviluppo Agile*.

#let attivitaADR = (
  "Studio della struttura del documento",
  [_Sprint 1_],
  "Completato",
  "Stesura dell'introduzione e descrizione generale del documento",
  [_Sprint 1_],
  "Completato",
  "Definizione dei primi casi d'uso",
  [_Sprint 2_],
  "Completato",
  "Revisione dei casi d’uso dopo in seguito di una più attenta lettura dello standard e riunioni con BlueWind",
  [_Sprint 3_],
  "Completato",
  "Definizione preliminare delle funzionalità e redazione delle matrici di tracciamento tra funzionalità e casi d’uso",
  [_Sprint 3_],
  "Completato",
  "Completamento dei casi d'uso e dei diagrammi UML",
  [_Sprint 4_],
  "Completato",
  "Definizione preliminare dei requisiti funzionali",
  [_Sprint 6_],
  "Completato",
  "Completamento dei requisiti funzionali e non funzionali",
  [_Sprint 7_],
  "Completato",
)
#figure(caption: "RTB-Analisi dei Requisiti")[
  #tabellaAtt(titolo: "Analisi dei Requisiti", attivita: attivitaADR)
]

#let attivitaPdP = (
  "Studio della struttura del documento",
  [_Sprint 1_],
  "Completato",
  "Redazione dell'introduzione",
  [_Sprint 1_],
  "Completato",
  [Studio dei metodi \ di retrospettiva],
  [_Sprint 2_],
  "Completato",
  [Analisi e gestione \ dei rischi],
  [_Sprint 3_],
  "Completato",
  [Studio dei metodi \ di pianificazione],
  [_Sprint 3_],
  "Completato",
  [Pianificazione di \ lungo periodo],
  [_Sprint 3_],
  "Completato",
  [Pianificazione di \ breve periodo],
  [_Tutti gli sprint_],
  "Completato",
)
#figure(caption: "RTB-Piano di Progetto")[
  #tabellaAtt(titolo: "Piano di Progetto", attivita: attivitaPdP)
]

#let attivitaPdQ = (
  "Studio della struttura del documento",
  [_Sprint 1_],
  "Completato",
  "Redazione dell'introduzione",
  [_Sprint 3_],
  "Completato",
  "Stesura delle metriche per la qualità del prodotto e del processo",
  [_Sprint 3_],
  "Completato",
  "Cruscotto di valutazione",
  [_Sprint 5_],
  "Completato",
  "Definizione iniziale delle strategie di testing",
  [_Sprint 6_],
  "Completato",
)
#figure(caption: "RTB-Piano di Qualifica")[
  #tabellaAtt(titolo: "Piano di Qualifica", attivita: attivitaPdQ)
]

#let attivitaNP = (
  "Studio della struttura del documento",
  [_Sprint 1_],
  "Completato",
  "Redazione dell'introduzione",
  [_Sprint 1_],
  "Completato",
  "Studio dei processi di ciclo di vita di supporto",
  [_Sprint 2_],
  "Completato",
  "Studio dei processi di ciclo di vita organizzativi",
  [_Sprint 2_],
  "Completato",
  "Stesura dei processi di ciclo di vita organizzativi",
  [_Sprint 3_],
  "Completato",
  "Studio dei processi di ciclo di vita primari",
  [_Sprint 2, Sprint 3_],
  "Completato",
  "Stesura dei processi di ciclo di vita primari",
  [_Sprint 4_],
  "Completato",
  "Stesura dei processi di ciclo di vita di supporto",
  [_Sprint 4_],
  "Completato",
  "Stesura delle metriche",
  [_Sprint 4_],
  "Completato",
  "Studio delle best practices o altro materiale ritenuto importante",
  [_Tutti sprint_],
  "Completato",
)
#figure(caption: "RTB-Norme di Progetto")[
  #tabellaAtt(titolo: "Norme di Progetto", attivita: attivitaNP)
]

#let attivitaGL = (
  "Aggiornamento del glossario",
  [_Tutti gli sprint_],
  "Completato",
  "Integrazione glossario web",
  [_Sprint 3_],
  "Completato",
)
#figure(caption: "RTB-Glossario")[
  #tabellaAtt(titolo: "Glossario", attivita: attivitaGL)
]

#let attivitaPoC = (
  "Setup dell'ambiente di sviluppo",
  [_Sprint 5_],
  "Completato",
  "Flask",
  [_Sprint 6_],
  "Completato",
  "Docker",
  [_Sprint 6_],
  "Completato",
  "D3JS",
  [_Sprint 6_],
  "Completato",
  "Pydantic",
  [_Sprint 6_],
  "Completato",
  "MongoDB",
  [_Sprint 7_],
  "Completato",
  "Vue.js",
  [_Sprint 8_],
  "Completato",
)
#figure(caption: "RTB-Proof of Concept")[
  #tabellaAtt(titolo: "Proof of Concept", attivita: attivitaPoC)
]

=== Product Baseline
La presente sezione è stata aggiornata e redatta a seguito del superamento della Requirements and Technology Baseline (RTB).

#let attivitaSTpb = (
  "Studio della struttura del documento",
  [_Sprint 8_],
  "Completato",
  "Redazione dell'introduzione e descrizione dell'architettura",
  [_Sprint 9_],
  "Completato",
  "Definizione dei design pattern adottati",
  [_Sprint 10_],
  "Completato",
  "Stesura delle componenti architetturali principali",
  [Tra _Sprint 10_ e _Sprint 13_],
  "Completato",
  "Completamento e revisione finale",
  [_Sprint 14_],
  "Completato",
)
#figure(caption: "PB-Specifica Tecnica")[
  #tabellaAtt(titolo: "Specifica Tecnica", attivita: attivitaSTpb)
]

#let attivitaMUpb = (
  "Studio della struttura del documento",
  [_Sprint 9_],
  "Completato",
  "Redazione delle sezioni di installazione e avvio",
  [_Sprint 9_],
  "Completato",
  "Redazione delle sezioni di utilizzo dell'applicazione",
  [_Sprint 14_],
  "Completato",
  "Revisione e completamento finale",
  [_Sprint 14_],
  "Completato",
)
#figure(caption: "PB-Manuale Utente")[
  #tabellaAtt(titolo: "Manuale Utente", attivita: attivitaMUpb)
]

#let attivitaMVPpb = (
  "Setup dell'ambiente di sviluppo e definizione architettura MVP",
  [_Sprint 9_],
  "Completato",
  "Sviluppo dei componenti core e della logica di backend (Architettura Esagonale, API Flask e persistenza MongoDB)",
  [_Tra Sprint 12-13_],
  "Completato",
  "Sviluppo del frontend e integrazione routing",
  [_Sprint 14_],
  "Completato",
  "Sviluppo della sessione di valutazione e decision tree",
  [_Sprint 14_],
  "Completato",
  "Testing e revisione finale del prodotto",
  [_Sprint 14_],
  "Completato",
)
#figure(caption: "PB-Minimum Viable Product")[
  #tabellaAtt(titolo: "Minimum Viable Product", attivita: attivitaMVPpb)
]

#let attivitaADRpb = (
  "Aggiornamento dei casi d'uso in seguito a revisioni",
  [_Tutti sprint parallelamente alla codifica_],
  "Completato",
  "Aggiornamento dei requisiti funzionali e non funzionali",
  [_Tutti sprint parallelamente alla codifica_],
  "Completato",
  "Aggiornamento delle matrici di tracciamento",
  [_Sprint 14_],
  "Completato",
)
#figure(caption: "PB-Analisi dei Requisiti")[
  #tabellaAtt(titolo: "Analisi dei Requisiti", attivita: attivitaADRpb)
]

#let attivitaPdPpb = (
  "Aggiornamento della pianificazione e consuntivo sprint precedenti",
  [_Tutti gli sprint_],
  "Completato",
  "Aggiornamento della gestione dei rischi",
  [_Tutti gli sprint se necessario_],
  "Completato",
  "Redazione del consuntivo finale di progetto",
  [_Sprint 15_],
  "Completato",
)
#figure(caption: "PB-Piano di Progetto")[
  #tabellaAtt(titolo: "Piano di Progetto", attivita: attivitaPdPpb)
]

#let attivitaPdQpb = (
  "Aggiornamento delle metriche e cruscotto di valutazione",
  [_Tutti gli sprint_],
  "Completato",
  "Aggiornamento delle strategie di testing",
  [_Da Sprint 13 a sprint 14_],
  "Completato",
  "Resoconto delle attività di verifica",
  [_Sprint 15_],
  "Completato",
)
#figure(caption: "PB-Piano di Qualifica")[
  #tabellaAtt(titolo: "Piano di Qualifica", attivita: attivitaPdQpb)
]

#let attivitaNPpb = (
  "Aggiornamento delle norme sui processi primari",
  [_Da Sprint 13 a sprint 14_],
  "Completato",
  "Aggiornamento delle best practices e strumenti adottati",
  [_Tutti gli sprint_],
  "Completato",
)
#figure(caption: "PB-Norme di Progetto")[
  #tabellaAtt(titolo: "Norme di Progetto", attivita: attivitaNPpb)
]

#let attivitaGLpb = (
  "Aggiornamento del glossario",
  [_Tutti gli sprint_],
  "Completato",
)
#figure(caption: "PB-Glossario")[
  #tabellaAtt(titolo: "Glossario", attivita: attivitaGLpb)
]

#let attivitaLPpb = (
  "Redazione della Lettera di Presentazione PB",
  [_Sprint 15_],
  "Completato",
)
#figure(caption: "PB-Lettera di Presentazione")[
  #tabellaAtt(titolo: "Lettera di Presentazione PB", attivita: attivitaLPpb)
]